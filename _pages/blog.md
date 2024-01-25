---
layout: page
title: Blog
include_in_header: false
include_in_footer: false
---

<h1>Latest Posts</h1>

<ul>
  {% for post in site.posts %}
      {% if post.featured-image %}
        {% include post-featured-image.html image=post.featured-image alt=post.featured-image-alt %}
      {% endif %}
    <li>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>