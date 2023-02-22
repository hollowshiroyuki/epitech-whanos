# Yobwhamos
The ultimate crossover with Yoda, Obama, Thanos and a Whale.

## How to deploy ?
<details>
<summary>With Terraform and Digital Ocean</summary>

- You'll need to get an API token and at least one SSH key in your DO account (links are in the example file)
- The domain must be managed by Digital Ocean (https://cloud.digitalocean.com/networking/domains)
- Copy the `terrform.example.tfvars` to `terraform.tfvars` in the `terraform` directory and fill in your configuration.
- Copy the `variables.example.yml` to `variables.yml` in the `ansible` directory and fill in your configuration
- Run `./deploy.sh`
</details>

<details>
<summary>With existing infrastructure</summary>

- You'll need
  - For Jenkins
    - Ubuntu 22.10 with SSH access enabled and SSH key uploaded
    - DNS A record for the configured Jenkins subdomain
- Copy the `variables.example.yml` to `variables.yml` in the `ansible` directory and fill in your configuration
- Set up your `hosts.txt` such as :
```
[jenkins]
<Jenkins IP>
```
- Run `./deploy.sh`
</details>

## How to undeploy ?
<details>
<summary>With Terraform and Digital Ocean</summary>

(Temp stuff here)
- Just run `cd terraform && terraform destroy`
- Press enter 2 times to skip the variables input
- Answer 'yes'
</details>

<details>
<summary>With existing infrastructure</summary>

- You're on your own fam 🤯
</details>

## Authors
- Jessica EBELY ([Jessika63](https://github.com/Jessika63))
- Tino TEMPESTA ([Foxort](https://github.com/Foxort))
- Corentin VIDAL ([hollowshiroyuki](https://github.com/hollowshiroyuki))

<details>
<summary>You probably don't want to open this dropdown</summary>

<details>
<summary>You sure ?</summary>

<details>
<summary>You've been warned</summary>

![Yobwhamos](https://cdn.discordapp.com/channel-icons/1069591102828580935/32571a27534d8fe6acfa7fecc5cbd8fd.webp "Yobwhamos")
</details>
</details>
</details>