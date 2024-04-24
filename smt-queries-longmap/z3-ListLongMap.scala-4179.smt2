; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57042 () Bool)

(assert start!57042)

(declare-fun b!630948 () Bool)

(declare-fun e!360790 () Bool)

(declare-fun e!360793 () Bool)

(assert (=> b!630948 (= e!360790 e!360793)))

(declare-fun res!407841 () Bool)

(assert (=> b!630948 (=> (not res!407841) (not e!360793))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6658 0))(
  ( (MissingZero!6658 (index!28922 (_ BitVec 32))) (Found!6658 (index!28923 (_ BitVec 32))) (Intermediate!6658 (undefined!7470 Bool) (index!28924 (_ BitVec 32)) (x!57815 (_ BitVec 32))) (Undefined!6658) (MissingVacant!6658 (index!28925 (_ BitVec 32))) )
))
(declare-fun lt!291436 () SeekEntryResult!6658)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38061 0))(
  ( (array!38062 (arr!18262 (Array (_ BitVec 32) (_ BitVec 64))) (size!18626 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38061)

(assert (=> b!630948 (= res!407841 (and (= lt!291436 (Found!6658 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18262 a!2986) index!984) (select (arr!18262 a!2986) j!136))) (not (= (select (arr!18262 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38061 (_ BitVec 32)) SeekEntryResult!6658)

(assert (=> b!630948 (= lt!291436 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630949 () Bool)

(assert (=> b!630949 (= e!360793 (not true))))

(declare-datatypes ((Unit!21141 0))(
  ( (Unit!21142) )
))
(declare-fun lt!291435 () Unit!21141)

(declare-fun e!360795 () Unit!21141)

(assert (=> b!630949 (= lt!291435 e!360795)))

(declare-fun c!71924 () Bool)

(declare-fun lt!291431 () (_ BitVec 64))

(declare-fun lt!291430 () array!38061)

(assert (=> b!630949 (= c!71924 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291431 lt!291430 mask!3053) Undefined!6658))))

(declare-fun e!360791 () Bool)

(assert (=> b!630949 e!360791))

(declare-fun res!407843 () Bool)

(assert (=> b!630949 (=> (not res!407843) (not e!360791))))

(declare-fun lt!291433 () SeekEntryResult!6658)

(declare-fun lt!291432 () (_ BitVec 32))

(assert (=> b!630949 (= res!407843 (= lt!291433 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291432 vacantSpotIndex!68 lt!291431 lt!291430 mask!3053)))))

(assert (=> b!630949 (= lt!291433 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291432 vacantSpotIndex!68 (select (arr!18262 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!630949 (= lt!291431 (select (store (arr!18262 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291434 () Unit!21141)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38061 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21141)

(assert (=> b!630949 (= lt!291434 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291432 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630949 (= lt!291432 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!407839 () Bool)

(declare-fun e!360792 () Bool)

(assert (=> start!57042 (=> (not res!407839) (not e!360792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57042 (= res!407839 (validMask!0 mask!3053))))

(assert (=> start!57042 e!360792))

(assert (=> start!57042 true))

(declare-fun array_inv!14121 (array!38061) Bool)

(assert (=> start!57042 (array_inv!14121 a!2986)))

(declare-fun b!630950 () Bool)

(declare-fun res!407842 () Bool)

(assert (=> b!630950 (=> (not res!407842) (not e!360792))))

(assert (=> b!630950 (= res!407842 (and (= (size!18626 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18626 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18626 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630951 () Bool)

(assert (=> b!630951 (= e!360791 (= lt!291436 lt!291433))))

(declare-fun b!630952 () Bool)

(declare-fun e!360789 () Bool)

(assert (=> b!630952 (= e!360792 e!360789)))

(declare-fun res!407837 () Bool)

(assert (=> b!630952 (=> (not res!407837) (not e!360789))))

(declare-fun lt!291429 () SeekEntryResult!6658)

(assert (=> b!630952 (= res!407837 (or (= lt!291429 (MissingZero!6658 i!1108)) (= lt!291429 (MissingVacant!6658 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38061 (_ BitVec 32)) SeekEntryResult!6658)

(assert (=> b!630952 (= lt!291429 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630953 () Bool)

(declare-fun Unit!21143 () Unit!21141)

(assert (=> b!630953 (= e!360795 Unit!21143)))

(declare-fun b!630954 () Bool)

(declare-fun res!407845 () Bool)

(assert (=> b!630954 (=> (not res!407845) (not e!360789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38061 (_ BitVec 32)) Bool)

(assert (=> b!630954 (= res!407845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630955 () Bool)

(declare-fun res!407844 () Bool)

(assert (=> b!630955 (=> (not res!407844) (not e!360789))))

(assert (=> b!630955 (= res!407844 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18262 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630956 () Bool)

(declare-fun res!407838 () Bool)

(assert (=> b!630956 (=> (not res!407838) (not e!360792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630956 (= res!407838 (validKeyInArray!0 (select (arr!18262 a!2986) j!136)))))

(declare-fun b!630957 () Bool)

(assert (=> b!630957 (= e!360789 e!360790)))

(declare-fun res!407846 () Bool)

(assert (=> b!630957 (=> (not res!407846) (not e!360790))))

(assert (=> b!630957 (= res!407846 (= (select (store (arr!18262 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630957 (= lt!291430 (array!38062 (store (arr!18262 a!2986) i!1108 k0!1786) (size!18626 a!2986)))))

(declare-fun b!630958 () Bool)

(declare-fun res!407848 () Bool)

(assert (=> b!630958 (=> (not res!407848) (not e!360792))))

(declare-fun arrayContainsKey!0 (array!38061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630958 (= res!407848 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630959 () Bool)

(declare-fun Unit!21144 () Unit!21141)

(assert (=> b!630959 (= e!360795 Unit!21144)))

(assert (=> b!630959 false))

(declare-fun b!630960 () Bool)

(declare-fun res!407840 () Bool)

(assert (=> b!630960 (=> (not res!407840) (not e!360789))))

(declare-datatypes ((List!12210 0))(
  ( (Nil!12207) (Cons!12206 (h!13254 (_ BitVec 64)) (t!18430 List!12210)) )
))
(declare-fun arrayNoDuplicates!0 (array!38061 (_ BitVec 32) List!12210) Bool)

(assert (=> b!630960 (= res!407840 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12207))))

(declare-fun b!630961 () Bool)

(declare-fun res!407847 () Bool)

(assert (=> b!630961 (=> (not res!407847) (not e!360792))))

(assert (=> b!630961 (= res!407847 (validKeyInArray!0 k0!1786))))

(assert (= (and start!57042 res!407839) b!630950))

(assert (= (and b!630950 res!407842) b!630956))

(assert (= (and b!630956 res!407838) b!630961))

(assert (= (and b!630961 res!407847) b!630958))

(assert (= (and b!630958 res!407848) b!630952))

(assert (= (and b!630952 res!407837) b!630954))

(assert (= (and b!630954 res!407845) b!630960))

(assert (= (and b!630960 res!407840) b!630955))

(assert (= (and b!630955 res!407844) b!630957))

(assert (= (and b!630957 res!407846) b!630948))

(assert (= (and b!630948 res!407841) b!630949))

(assert (= (and b!630949 res!407843) b!630951))

(assert (= (and b!630949 c!71924) b!630959))

(assert (= (and b!630949 (not c!71924)) b!630953))

(declare-fun m!606217 () Bool)

(assert (=> b!630949 m!606217))

(declare-fun m!606219 () Bool)

(assert (=> b!630949 m!606219))

(declare-fun m!606221 () Bool)

(assert (=> b!630949 m!606221))

(declare-fun m!606223 () Bool)

(assert (=> b!630949 m!606223))

(declare-fun m!606225 () Bool)

(assert (=> b!630949 m!606225))

(assert (=> b!630949 m!606223))

(declare-fun m!606227 () Bool)

(assert (=> b!630949 m!606227))

(declare-fun m!606229 () Bool)

(assert (=> b!630949 m!606229))

(declare-fun m!606231 () Bool)

(assert (=> b!630949 m!606231))

(declare-fun m!606233 () Bool)

(assert (=> b!630954 m!606233))

(declare-fun m!606235 () Bool)

(assert (=> b!630955 m!606235))

(assert (=> b!630956 m!606223))

(assert (=> b!630956 m!606223))

(declare-fun m!606237 () Bool)

(assert (=> b!630956 m!606237))

(declare-fun m!606239 () Bool)

(assert (=> b!630961 m!606239))

(declare-fun m!606241 () Bool)

(assert (=> start!57042 m!606241))

(declare-fun m!606243 () Bool)

(assert (=> start!57042 m!606243))

(declare-fun m!606245 () Bool)

(assert (=> b!630948 m!606245))

(assert (=> b!630948 m!606223))

(assert (=> b!630948 m!606223))

(declare-fun m!606247 () Bool)

(assert (=> b!630948 m!606247))

(declare-fun m!606249 () Bool)

(assert (=> b!630960 m!606249))

(declare-fun m!606251 () Bool)

(assert (=> b!630952 m!606251))

(declare-fun m!606253 () Bool)

(assert (=> b!630958 m!606253))

(assert (=> b!630957 m!606229))

(declare-fun m!606255 () Bool)

(assert (=> b!630957 m!606255))

(check-sat (not b!630954) (not start!57042) (not b!630952) (not b!630956) (not b!630960) (not b!630949) (not b!630948) (not b!630958) (not b!630961))
(check-sat)
