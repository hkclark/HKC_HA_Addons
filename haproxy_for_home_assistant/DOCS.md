# Home Assistant Add-on: HAProxy for Home Assistant

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Click the vertical ... menu in the upper righer -> Repositories.
3. Paste the following into the "Add" text field: https://github.com/hkclark/HKC_HA_Addons
4. Click the "Add" button and then the "Close" button once the repository has been added to the list.
2. Find the "HAProxy for Home Assistant" add-on and click it.
3. Click on the "INSTALL" button.

## How to use


1. Install (if you haven't already) the "Let's Encrypt" HA Addon and use that to
    generate a certificate and private key in `ssl/fullchain.pem` and `ssl/privkey.pem`.
    Note that this could involve temporarily doing a port forward to port 80 on your
    Home Assistant box (just be sure to remove this after the cert challege has been
    confirmed and the cert has been created unless you are SURE you want to leave
    port 80 open to the world!).
2. Use the "Terminal & SSH" HA Addon to create an HAProxy configuration file.
    Recommend using `share/haproxy_addon/haproxy.cfg`.
    Note: Don't forget to include references to `ssl/fullchain.pem` and
    `ssl/privkey.pem` if you want to use SSL.
3. Go to the Configuration tab in this Addon and enter the name and path of the
    configured file you created in Step #2 above.
4. And you need to add the `trusted_proxies` section (requests from reverse proxies will be blocked if these options are not set).
  ```yaml
  http:
    use_x_forwarded_for: true
    trusted_proxies:
      - 172.30.33.0/24
  ```
6. Save configuration.
7. Start the add-on.
8. Check the add-on log output to see the result.

## Configuration

Add-on configuration:

```yaml
configfile: share/haproxy_addon/haproxy.cfg
```

### Option: `configfile` (required)

A file containing the full HAProxy configuration to use.


### Example Configuration File

Coming soon.


## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[forum]: https://community.home-assistant.io
[hsts]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security
[issue]: https://github.com/home-assistant/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository
