<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="/rss/channel/title"/> — feed</title>
        <style>
          :root {
            --paper: #FAF8F3; --ink: #17191D; --muted: #6E6B66;
            --line: #D8D2C6; --accent: #E8500F;
          }
          @media (prefers-color-scheme: dark) {
            :root { --paper: #0F0C0B; --ink: #FAF8F3; --muted: #9C968E;
                    --line: #2A2422; --accent: #FF6A00; }
          }
          * { box-sizing: border-box; }
          body {
            margin: 0; padding: 3rem 1.25rem 5rem;
            background: var(--paper); color: var(--ink);
            font: 400 17px/1.6 ui-sans-serif, system-ui, -apple-system, "Segoe UI", Inter, sans-serif;
          }
          .wrap { max-width: 720px; margin: 0 auto; }
          .eyebrow {
            font-size: .72rem; font-weight: 800; letter-spacing: .16em;
            text-transform: uppercase; color: var(--accent); margin: 0 0 .6rem;
          }
          h1 { font-size: clamp(1.8rem, 4vw, 2.6rem); line-height: 1.05; letter-spacing: -.03em; margin: 0 0 .8rem; }
          .sub { color: var(--muted); margin: 0 0 1.4rem; max-width: 52ch; }
          .note {
            border: 1px solid var(--line); border-radius: 12px; padding: 1rem 1.15rem;
            font-size: .92rem; color: var(--muted); margin: 0 0 2.2rem;
          }
          .note strong { color: var(--ink); }
          .note a { color: var(--accent); }
          .note code {
            background: rgba(128,128,128,.14); padding: .1em .4em; border-radius: 5px;
            font-size: .88em;
          }
          ol { list-style: none; margin: 0; padding: 0; }
          li { padding: 1.1rem 0; border-top: 1px solid var(--line); }
          li:first-child { border-top: 2px solid var(--ink); }
          .meta {
            font-size: .74rem; font-weight: 700; letter-spacing: .1em;
            text-transform: uppercase; color: var(--muted); margin: 0 0 .35rem;
          }
          .meta span + span::before { content: " · "; }
          a.title {
            color: var(--ink); text-decoration: none; font-size: 1.18rem;
            font-weight: 650; letter-spacing: -.015em; line-height: 1.3;
          }
          a.title:hover { color: var(--accent); }
          .desc { color: var(--muted); font-size: .95rem; margin: .4rem 0 0; }
          footer {
            margin-top: 2.5rem; padding-top: 1.2rem; border-top: 1px solid var(--line);
            font-size: .85rem; color: var(--muted);
          }
          footer a { color: var(--accent); }
        </style>
      </head>
      <body>
        <div class="wrap">
          <p class="eyebrow">RSS feed</p>
          <h1><xsl:value-of select="/rss/channel/title"/></h1>
          <p class="sub"><xsl:value-of select="/rss/channel/description"/></p>

          <p class="note">
            <strong>This is a feed, not a page.</strong> Paste
            <code><xsl:value-of select="/rss/channel/link"/>feed.xml</code>
            into any feed reader — Feedly, Inoreader, NetNewsWire, or your mail app — and new
            posts will arrive there. If you are here to read, the
            <a href="{/rss/channel/link}">site itself</a> is the better place.
          </p>

          <ol>
            <xsl:for-each select="/rss/channel/item">
              <li>
                <p class="meta">
                  <span><xsl:value-of select="pubDate"/></span>
                  <xsl:if test="category"><span><xsl:value-of select="category"/></span></xsl:if>
                </p>
                <a class="title" href="{link}"><xsl:value-of select="title"/></a>
                <p class="desc"><xsl:value-of select="description"/></p>
              </li>
            </xsl:for-each>
          </ol>

          <footer>
            <xsl:value-of select="count(/rss/channel/item)"/> posts, newest first ·
            updated <xsl:value-of select="/rss/channel/lastBuildDate"/> ·
            <a href="{/rss/channel/link}">apsideslabs.github.io/grapheme</a>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
