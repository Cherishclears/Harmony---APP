export interface News {
  id: number
  cover: string
  title: string
  labels: string[]
  views: number
}

export interface Shortcut {
  icon: Resource
  text: string
}

export interface LoginUser {
  username: string
  password: string
}

export class HWUser {
  auth: Auth

  constructor(username: string, password: string, domain: string) {
    this.auth = {
      identity: {
        methods: ['password'],
        password: {
          user: {
            name: username,
            password: password,
            domain: {
              name: domain
            }
          }
        }
      },
      scope: {
        domain: {
          name: domain
        }
      }
    }
  }
}

interface Auth {
  identity: Identity
  scope: Scope
}

interface Identity {
  methods: string[]
  password: Password
}

interface Password {
  user: IAMUser
}

interface IAMUser {
  name: string
  password: string
  domain: Domain
}


interface Domain {
  name: string
}

interface Scope {
  domain: Domain
}


export interface Properties {
  temperature: string
  humidity: string
  lamp: boolean
}

