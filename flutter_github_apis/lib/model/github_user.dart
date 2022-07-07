// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       github_user.dart
 * Created on: Thu Jul 07 2022
 * Author:     Nguyen Huu Nghi
 *
 * Copyright (c) 2022 Nguyen Huu Nghi
 *
 * Description : This model compatible with github api user response.
 */

import 'dart:convert';

class GitHubUser {
  String? login;
  int? id;
  String? node_id;
  String? avatar_url;
  String? gravatar_id;
  String? url;
  String? html_url;
  String? followers_url;
  String? following_url;
  String? gists_url;
  String? starred_url;
  String? subscriptions_url;
  String? organizations_url;
  String? repos_url;
  String? events_url;
  String? received_events_url;
  String? type;
  bool? site_admin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  String? hireable;
  String? bio;
  String? twitter_username;
  int? public_repos;
  int? public_gists;
  int? followers;
  int? following;
  String? created_at;
  String? updated_at;
  GitHubUser({
    this.login,
    this.id,
    this.node_id,
    this.avatar_url,
    this.gravatar_id,
    this.url,
    this.html_url,
    this.followers_url,
    this.following_url,
    this.gists_url,
    this.starred_url,
    this.subscriptions_url,
    this.organizations_url,
    this.repos_url,
    this.events_url,
    this.received_events_url,
    this.type,
    this.site_admin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitter_username,
    this.public_repos,
    this.public_gists,
    this.followers,
    this.following,
    this.created_at,
    this.updated_at,
  });

  GitHubUser copyWith({
    String? login,
    int? id,
    String? node_id,
    String? avatar_url,
    String? gravatar_id,
    String? url,
    String? html_url,
    String? followers_url,
    String? following_url,
    String? gists_url,
    String? starred_url,
    String? subscriptions_url,
    String? organizations_url,
    String? repos_url,
    String? events_url,
    String? received_events_url,
    String? type,
    bool? site_admin,
    String? name,
    String? company,
    String? blog,
    String? location,
    String? email,
    String? hireable,
    String? bio,
    String? twitter_username,
    int? public_repos,
    int? public_gists,
    int? followers,
    int? following,
    String? created_at,
    String? updated_at,
  }) {
    return GitHubUser(
      login: login ?? this.login,
      id: id ?? this.id,
      node_id: node_id ?? this.node_id,
      avatar_url: avatar_url ?? this.avatar_url,
      gravatar_id: gravatar_id ?? this.gravatar_id,
      url: url ?? this.url,
      html_url: html_url ?? this.html_url,
      followers_url: followers_url ?? this.followers_url,
      following_url: following_url ?? this.following_url,
      gists_url: gists_url ?? this.gists_url,
      starred_url: starred_url ?? this.starred_url,
      subscriptions_url: subscriptions_url ?? this.subscriptions_url,
      organizations_url: organizations_url ?? this.organizations_url,
      repos_url: repos_url ?? this.repos_url,
      events_url: events_url ?? this.events_url,
      received_events_url: received_events_url ?? this.received_events_url,
      type: type ?? this.type,
      site_admin: site_admin ?? this.site_admin,
      name: name ?? this.name,
      company: company ?? this.company,
      blog: blog ?? this.blog,
      location: location ?? this.location,
      email: email ?? this.email,
      hireable: hireable ?? this.hireable,
      bio: bio ?? this.bio,
      twitter_username: twitter_username ?? this.twitter_username,
      public_repos: public_repos ?? this.public_repos,
      public_gists: public_gists ?? this.public_gists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'id': id,
      'node_id': node_id,
      'avatar_url': avatar_url,
      'gravatar_id': gravatar_id,
      'url': url,
      'html_url': html_url,
      'followers_url': followers_url,
      'following_url': following_url,
      'gists_url': gists_url,
      'starred_url': starred_url,
      'subscriptions_url': subscriptions_url,
      'organizations_url': organizations_url,
      'repos_url': repos_url,
      'events_url': events_url,
      'received_events_url': received_events_url,
      'type': type,
      'site_admin': site_admin,
      'name': name,
      'company': company,
      'blog': blog,
      'location': location,
      'email': email,
      'hireable': hireable,
      'bio': bio,
      'twitter_username': twitter_username,
      'public_repos': public_repos,
      'public_gists': public_gists,
      'followers': followers,
      'following': following,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory GitHubUser.fromMap(Map<String, dynamic> map) {
    return GitHubUser(
      login: map['login'] != null ? map['login'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      node_id: map['node_id'] != null ? map['node_id'] as String : null,
      avatar_url:
          map['avatar_url'] != null ? map['avatar_url'] as String : null,
      gravatar_id:
          map['gravatar_id'] != null ? map['gravatar_id'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      html_url: map['html_url'] != null ? map['html_url'] as String : null,
      followers_url:
          map['followers_url'] != null ? map['followers_url'] as String : null,
      following_url:
          map['following_url'] != null ? map['following_url'] as String : null,
      gists_url: map['gists_url'] != null ? map['gists_url'] as String : null,
      starred_url:
          map['starred_url'] != null ? map['starred_url'] as String : null,
      subscriptions_url: map['subscriptions_url'] != null
          ? map['subscriptions_url'] as String
          : null,
      organizations_url: map['organizations_url'] != null
          ? map['organizations_url'] as String
          : null,
      repos_url: map['repos_url'] != null ? map['repos_url'] as String : null,
      events_url:
          map['events_url'] != null ? map['events_url'] as String : null,
      received_events_url: map['received_events_url'] != null
          ? map['received_events_url'] as String
          : null,
      type: map['type'] != null ? map['type'] as String : null,
      site_admin: map['site_admin'] != null ? map['site_admin'] as bool : null,
      name: map['name'] != null ? map['name'] as String : null,
      company: map['company'] != null ? map['company'] as String : null,
      blog: map['blog'] != null ? map['blog'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      hireable: map['hireable'] != null ? map['hireable'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      twitter_username: map['twitter_username'] != null
          ? map['twitter_username'] as String
          : null,
      public_repos:
          map['public_repos'] != null ? map['public_repos'] as int : null,
      public_gists:
          map['public_gists'] != null ? map['public_gists'] as int : null,
      followers: map['followers'] != null ? map['followers'] as int : null,
      following: map['following'] != null ? map['following'] as int : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GitHubUser.fromJson(String source) =>
      GitHubUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GitHubUser(login: $login, id: $id, node_id: $node_id, avatar_url: $avatar_url, gravatar_id: $gravatar_id, url: $url, html_url: $html_url, followers_url: $followers_url, following_url: $following_url, gists_url: $gists_url, starred_url: $starred_url, subscriptions_url: $subscriptions_url, organizations_url: $organizations_url, repos_url: $repos_url, events_url: $events_url, received_events_url: $received_events_url, type: $type, site_admin: $site_admin, name: $name, company: $company, blog: $blog, location: $location, email: $email, hireable: $hireable, bio: $bio, twitter_username: $twitter_username, public_repos: $public_repos, public_gists: $public_gists, followers: $followers, following: $following, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GitHubUser &&
        other.login == login &&
        other.id == id &&
        other.node_id == node_id &&
        other.avatar_url == avatar_url &&
        other.gravatar_id == gravatar_id &&
        other.url == url &&
        other.html_url == html_url &&
        other.followers_url == followers_url &&
        other.following_url == following_url &&
        other.gists_url == gists_url &&
        other.starred_url == starred_url &&
        other.subscriptions_url == subscriptions_url &&
        other.organizations_url == organizations_url &&
        other.repos_url == repos_url &&
        other.events_url == events_url &&
        other.received_events_url == received_events_url &&
        other.type == type &&
        other.site_admin == site_admin &&
        other.name == name &&
        other.company == company &&
        other.blog == blog &&
        other.location == location &&
        other.email == email &&
        other.hireable == hireable &&
        other.bio == bio &&
        other.twitter_username == twitter_username &&
        other.public_repos == public_repos &&
        other.public_gists == public_gists &&
        other.followers == followers &&
        other.following == following &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return login.hashCode ^
        id.hashCode ^
        node_id.hashCode ^
        avatar_url.hashCode ^
        gravatar_id.hashCode ^
        url.hashCode ^
        html_url.hashCode ^
        followers_url.hashCode ^
        following_url.hashCode ^
        gists_url.hashCode ^
        starred_url.hashCode ^
        subscriptions_url.hashCode ^
        organizations_url.hashCode ^
        repos_url.hashCode ^
        events_url.hashCode ^
        received_events_url.hashCode ^
        type.hashCode ^
        site_admin.hashCode ^
        name.hashCode ^
        company.hashCode ^
        blog.hashCode ^
        location.hashCode ^
        email.hashCode ^
        hireable.hashCode ^
        bio.hashCode ^
        twitter_username.hashCode ^
        public_repos.hashCode ^
        public_gists.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
