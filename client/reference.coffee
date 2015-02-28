###
 * Federated Wiki : Reference Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/fedwiki/wiki-plugin-reference/blob/master/LICENSE.txt
###

window.plugins.reference =
window.plugins.federatedWiki =
  emit: ($item, item) ->
    slug = item.slug or 'welcome-visitors'
    site = item.site
    wiki.resolveFrom site, ->
      $item.append """
        <p style='margin-bottom:3px;'>
          <img class='remote'
            src='//#{site}/favicon.png'
            title='#{site}'
            data-site="#{site}"
            data-slug="#{slug}"
          >
          #{wiki.resolveLinks "[[#{item.title or slug}]]"}
        </p>
        <div>
          #{wiki.resolveLinks(item.text)}
        </div>
      """
  bind: ($item, item) ->
    $item.dblclick -> wiki.textEditor $item, item
