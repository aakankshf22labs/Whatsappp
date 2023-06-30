import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:whatsapp_clone/features/chat/models/message.dart';
import 'package:whatsapp_clone/shared/utils/abc.dart';
import 'package:whatsapp_clone/theme/theme.dart';

import 'attachment_viewer.dart';

enum MessageCardType { sentMessageCard, receivedMessageCard }

class MessageCard extends StatefulWidget {
  const MessageCard({
    super.key,
    required this.message,
    required this.type,
    this.special = false,
  });

  final Message message;
  final bool special;
  final MessageCardType type;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool containsSingleEmoji(String text) {
    return EmojiParser().parseEmojis(text).length == 1 &&
        text.runes.length == 1;
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).custom.colorTheme;
    final size = MediaQuery.of(context).size;
    final hasAttachment = widget.message.attachment != null;
    final isSentMessageCard = widget.type == MessageCardType.sentMessageCard;
    final messageHasText = widget.message.content.isNotEmpty;
    final hasSingleEmoji = containsSingleEmoji(widget.message.content);
    final textPadding =
        '\u00A0' * (hasSingleEmoji ? 2 : (isSentMessageCard ? 16 : 12));

    return Align(
      alignment:
          isSentMessageCard ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 36,
          minWidth: 80,
          maxWidth: size.width * 0.75,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(hasAttachment ? 10.0 : 10.0),
          color: isSentMessageCard
              ? colorTheme.outgoingMessageBubbleColor
              : colorTheme.incomingMessageBubbleColor,
        ),
        margin: EdgeInsets.only(bottom: 2.0, top: widget.special ? 6.0 : 0),
        padding: EdgeInsets.symmetric(
          horizontal: hasAttachment ? 4.0 : 8.0,
          vertical: hasAttachment ? 4.0 : 4.0,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasAttachment) ...[
                  SizedBox(
                    height: size.width * 0.75,
                    child: AttachmentViewer(
                      message: widget.message,
                    ),
                  )
                ],
                if (messageHasText) ...[
                  Padding(
                    padding: isSentMessageCard
                        ? hasAttachment
                            ? const EdgeInsets.only(left: 4.0, top: 4.0)
                            : EdgeInsets.only(
                                top: 4.0,
                                bottom: hasSingleEmoji ? 10.0 : 0,
                              )
                        : hasAttachment
                            ? const EdgeInsets.only(left: 4.0, top: 4.0)
                            : EdgeInsets.only(
                                top: 4.0,
                                bottom: hasSingleEmoji ? 10.0 : 0,
                              ),
                    child: Text(
                      '${widget.message.content} $textPadding',
                      style: Theme.of(context)
                          .custom
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: hasSingleEmoji ? 40 : 16),
                      softWrap: true,
                    ),
                  )
                ],
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    if (!messageHasText) ...[
                      const BoxShadow(
                        offset: Offset(-2, -2),
                        color: Color.fromARGB(225, 0, 0, 0),
                        blurRadius: 12,
                      )
                    ]
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formattedTimestamp(
                        widget.message.timestamp,
                        true,
                      ),
                      style: Theme.of(context)
                          .custom
                          .textTheme
                          .caption
                          .copyWith(
                              fontSize: 11,
                              color: messageHasText
                                  ? colorTheme.textColor2
                                  : colorTheme.textColor1),
                    ),
                    if (isSentMessageCard) ...[
                      const SizedBox(
                        width: 2.0,
                      ),
                      Image.asset(
                        'assets/images/${widget.message.status.value}.png',
                        color: widget.message.status.value != 'SEEN'
                            ? messageHasText
                                ? colorTheme.textColor2
                                : colorTheme.textColor1
                            : null,
                        width: 15.0,
                      )
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
