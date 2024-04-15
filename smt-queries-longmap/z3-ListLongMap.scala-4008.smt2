; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54504 () Bool)

(assert start!54504)

(declare-fun b!595038 () Bool)

(declare-fun res!381082 () Bool)

(declare-fun e!339954 () Bool)

(assert (=> b!595038 (=> (not res!381082) (not e!339954))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36978 0))(
  ( (array!36979 (arr!17753 (Array (_ BitVec 32) (_ BitVec 64))) (size!18118 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36978)

(assert (=> b!595038 (= res!381082 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17753 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595039 () Bool)

(declare-fun res!381067 () Bool)

(declare-fun e!339962 () Bool)

(assert (=> b!595039 (=> res!381067 e!339962)))

(declare-datatypes ((List!11833 0))(
  ( (Nil!11830) (Cons!11829 (h!12874 (_ BitVec 64)) (t!18052 List!11833)) )
))
(declare-fun contains!2917 (List!11833 (_ BitVec 64)) Bool)

(assert (=> b!595039 (= res!381067 (contains!2917 Nil!11830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595040 () Bool)

(declare-fun e!339964 () Bool)

(assert (=> b!595040 (= e!339964 e!339962)))

(declare-fun res!381070 () Bool)

(assert (=> b!595040 (=> res!381070 e!339962)))

(assert (=> b!595040 (= res!381070 (or (bvsge (size!18118 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18118 a!2986))))))

(declare-fun lt!270071 () array!36978)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595040 (arrayContainsKey!0 lt!270071 (select (arr!17753 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18672 0))(
  ( (Unit!18673) )
))
(declare-fun lt!270079 () Unit!18672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36978 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18672)

(assert (=> b!595040 (= lt!270079 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270071 (select (arr!17753 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595041 () Bool)

(declare-fun res!381086 () Bool)

(declare-fun e!339961 () Bool)

(assert (=> b!595041 (=> (not res!381086) (not e!339961))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!595041 (= res!381086 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595042 () Bool)

(declare-fun e!339958 () Bool)

(declare-fun e!339966 () Bool)

(assert (=> b!595042 (= e!339958 e!339966)))

(declare-fun res!381074 () Bool)

(assert (=> b!595042 (=> res!381074 e!339966)))

(declare-fun lt!270068 () (_ BitVec 64))

(declare-fun lt!270072 () (_ BitVec 64))

(assert (=> b!595042 (= res!381074 (or (not (= (select (arr!17753 a!2986) j!136) lt!270072)) (not (= (select (arr!17753 a!2986) j!136) lt!270068)) (bvsge j!136 index!984)))))

(declare-fun res!381083 () Bool)

(assert (=> start!54504 (=> (not res!381083) (not e!339961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54504 (= res!381083 (validMask!0 mask!3053))))

(assert (=> start!54504 e!339961))

(assert (=> start!54504 true))

(declare-fun array_inv!13636 (array!36978) Bool)

(assert (=> start!54504 (array_inv!13636 a!2986)))

(declare-fun b!595043 () Bool)

(declare-fun res!381084 () Bool)

(assert (=> b!595043 (=> (not res!381084) (not e!339961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595043 (= res!381084 (validKeyInArray!0 k0!1786))))

(declare-fun b!595044 () Bool)

(declare-fun res!381079 () Bool)

(assert (=> b!595044 (=> res!381079 e!339962)))

(declare-fun noDuplicate!254 (List!11833) Bool)

(assert (=> b!595044 (= res!381079 (not (noDuplicate!254 Nil!11830)))))

(declare-fun b!595045 () Bool)

(declare-fun res!381069 () Bool)

(assert (=> b!595045 (=> (not res!381069) (not e!339961))))

(assert (=> b!595045 (= res!381069 (validKeyInArray!0 (select (arr!17753 a!2986) j!136)))))

(declare-fun b!595046 () Bool)

(declare-fun res!381075 () Bool)

(assert (=> b!595046 (=> (not res!381075) (not e!339954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36978 (_ BitVec 32)) Bool)

(assert (=> b!595046 (= res!381075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595047 () Bool)

(declare-fun e!339965 () Bool)

(declare-fun e!339963 () Bool)

(assert (=> b!595047 (= e!339965 (not e!339963))))

(declare-fun res!381077 () Bool)

(assert (=> b!595047 (=> res!381077 e!339963)))

(declare-datatypes ((SeekEntryResult!6190 0))(
  ( (MissingZero!6190 (index!27008 (_ BitVec 32))) (Found!6190 (index!27009 (_ BitVec 32))) (Intermediate!6190 (undefined!7002 Bool) (index!27010 (_ BitVec 32)) (x!55821 (_ BitVec 32))) (Undefined!6190) (MissingVacant!6190 (index!27011 (_ BitVec 32))) )
))
(declare-fun lt!270074 () SeekEntryResult!6190)

(assert (=> b!595047 (= res!381077 (not (= lt!270074 (Found!6190 index!984))))))

(declare-fun lt!270073 () Unit!18672)

(declare-fun e!339955 () Unit!18672)

(assert (=> b!595047 (= lt!270073 e!339955)))

(declare-fun c!67353 () Bool)

(assert (=> b!595047 (= c!67353 (= lt!270074 Undefined!6190))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36978 (_ BitVec 32)) SeekEntryResult!6190)

(assert (=> b!595047 (= lt!270074 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270072 lt!270071 mask!3053))))

(declare-fun e!339959 () Bool)

(assert (=> b!595047 e!339959))

(declare-fun res!381085 () Bool)

(assert (=> b!595047 (=> (not res!381085) (not e!339959))))

(declare-fun lt!270075 () SeekEntryResult!6190)

(declare-fun lt!270076 () (_ BitVec 32))

(assert (=> b!595047 (= res!381085 (= lt!270075 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270076 vacantSpotIndex!68 lt!270072 lt!270071 mask!3053)))))

(assert (=> b!595047 (= lt!270075 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270076 vacantSpotIndex!68 (select (arr!17753 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595047 (= lt!270072 (select (store (arr!17753 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270069 () Unit!18672)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36978 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18672)

(assert (=> b!595047 (= lt!270069 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270076 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595047 (= lt!270076 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595048 () Bool)

(assert (=> b!595048 (= e!339961 e!339954)))

(declare-fun res!381066 () Bool)

(assert (=> b!595048 (=> (not res!381066) (not e!339954))))

(declare-fun lt!270078 () SeekEntryResult!6190)

(assert (=> b!595048 (= res!381066 (or (= lt!270078 (MissingZero!6190 i!1108)) (= lt!270078 (MissingVacant!6190 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36978 (_ BitVec 32)) SeekEntryResult!6190)

(assert (=> b!595048 (= lt!270078 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595049 () Bool)

(assert (=> b!595049 (= e!339963 e!339964)))

(declare-fun res!381071 () Bool)

(assert (=> b!595049 (=> res!381071 e!339964)))

(assert (=> b!595049 (= res!381071 (or (not (= (select (arr!17753 a!2986) j!136) lt!270072)) (not (= (select (arr!17753 a!2986) j!136) lt!270068)) (bvsge j!136 index!984)))))

(assert (=> b!595049 e!339958))

(declare-fun res!381080 () Bool)

(assert (=> b!595049 (=> (not res!381080) (not e!339958))))

(assert (=> b!595049 (= res!381080 (= lt!270068 (select (arr!17753 a!2986) j!136)))))

(assert (=> b!595049 (= lt!270068 (select (store (arr!17753 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595050 () Bool)

(declare-fun res!381081 () Bool)

(assert (=> b!595050 (=> (not res!381081) (not e!339961))))

(assert (=> b!595050 (= res!381081 (and (= (size!18118 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18118 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18118 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595051 () Bool)

(declare-fun res!381073 () Bool)

(assert (=> b!595051 (=> (not res!381073) (not e!339954))))

(declare-fun arrayNoDuplicates!0 (array!36978 (_ BitVec 32) List!11833) Bool)

(assert (=> b!595051 (= res!381073 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11830))))

(declare-fun b!595052 () Bool)

(declare-fun e!339960 () Bool)

(assert (=> b!595052 (= e!339960 e!339965)))

(declare-fun res!381068 () Bool)

(assert (=> b!595052 (=> (not res!381068) (not e!339965))))

(declare-fun lt!270070 () SeekEntryResult!6190)

(assert (=> b!595052 (= res!381068 (and (= lt!270070 (Found!6190 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17753 a!2986) index!984) (select (arr!17753 a!2986) j!136))) (not (= (select (arr!17753 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595052 (= lt!270070 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17753 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595053 () Bool)

(assert (=> b!595053 (= e!339959 (= lt!270070 lt!270075))))

(declare-fun b!595054 () Bool)

(declare-fun res!381076 () Bool)

(assert (=> b!595054 (=> res!381076 e!339962)))

(assert (=> b!595054 (= res!381076 (contains!2917 Nil!11830 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595055 () Bool)

(declare-fun Unit!18674 () Unit!18672)

(assert (=> b!595055 (= e!339955 Unit!18674)))

(assert (=> b!595055 false))

(declare-fun b!595056 () Bool)

(declare-fun Unit!18675 () Unit!18672)

(assert (=> b!595056 (= e!339955 Unit!18675)))

(declare-fun b!595057 () Bool)

(declare-fun e!339956 () Bool)

(assert (=> b!595057 (= e!339966 e!339956)))

(declare-fun res!381078 () Bool)

(assert (=> b!595057 (=> (not res!381078) (not e!339956))))

(assert (=> b!595057 (= res!381078 (arrayContainsKey!0 lt!270071 (select (arr!17753 a!2986) j!136) j!136))))

(declare-fun b!595058 () Bool)

(assert (=> b!595058 (= e!339956 (arrayContainsKey!0 lt!270071 (select (arr!17753 a!2986) j!136) index!984))))

(declare-fun b!595059 () Bool)

(assert (=> b!595059 (= e!339962 true)))

(declare-fun lt!270077 () Bool)

(assert (=> b!595059 (= lt!270077 (contains!2917 Nil!11830 k0!1786))))

(declare-fun b!595060 () Bool)

(assert (=> b!595060 (= e!339954 e!339960)))

(declare-fun res!381072 () Bool)

(assert (=> b!595060 (=> (not res!381072) (not e!339960))))

(assert (=> b!595060 (= res!381072 (= (select (store (arr!17753 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595060 (= lt!270071 (array!36979 (store (arr!17753 a!2986) i!1108 k0!1786) (size!18118 a!2986)))))

(assert (= (and start!54504 res!381083) b!595050))

(assert (= (and b!595050 res!381081) b!595045))

(assert (= (and b!595045 res!381069) b!595043))

(assert (= (and b!595043 res!381084) b!595041))

(assert (= (and b!595041 res!381086) b!595048))

(assert (= (and b!595048 res!381066) b!595046))

(assert (= (and b!595046 res!381075) b!595051))

(assert (= (and b!595051 res!381073) b!595038))

(assert (= (and b!595038 res!381082) b!595060))

(assert (= (and b!595060 res!381072) b!595052))

(assert (= (and b!595052 res!381068) b!595047))

(assert (= (and b!595047 res!381085) b!595053))

(assert (= (and b!595047 c!67353) b!595055))

(assert (= (and b!595047 (not c!67353)) b!595056))

(assert (= (and b!595047 (not res!381077)) b!595049))

(assert (= (and b!595049 res!381080) b!595042))

(assert (= (and b!595042 (not res!381074)) b!595057))

(assert (= (and b!595057 res!381078) b!595058))

(assert (= (and b!595049 (not res!381071)) b!595040))

(assert (= (and b!595040 (not res!381070)) b!595044))

(assert (= (and b!595044 (not res!381079)) b!595039))

(assert (= (and b!595039 (not res!381067)) b!595054))

(assert (= (and b!595054 (not res!381076)) b!595059))

(declare-fun m!572209 () Bool)

(assert (=> b!595059 m!572209))

(declare-fun m!572211 () Bool)

(assert (=> b!595042 m!572211))

(declare-fun m!572213 () Bool)

(assert (=> b!595039 m!572213))

(declare-fun m!572215 () Bool)

(assert (=> start!54504 m!572215))

(declare-fun m!572217 () Bool)

(assert (=> start!54504 m!572217))

(declare-fun m!572219 () Bool)

(assert (=> b!595041 m!572219))

(declare-fun m!572221 () Bool)

(assert (=> b!595038 m!572221))

(declare-fun m!572223 () Bool)

(assert (=> b!595052 m!572223))

(assert (=> b!595052 m!572211))

(assert (=> b!595052 m!572211))

(declare-fun m!572225 () Bool)

(assert (=> b!595052 m!572225))

(assert (=> b!595040 m!572211))

(assert (=> b!595040 m!572211))

(declare-fun m!572227 () Bool)

(assert (=> b!595040 m!572227))

(assert (=> b!595040 m!572211))

(declare-fun m!572229 () Bool)

(assert (=> b!595040 m!572229))

(declare-fun m!572231 () Bool)

(assert (=> b!595047 m!572231))

(declare-fun m!572233 () Bool)

(assert (=> b!595047 m!572233))

(assert (=> b!595047 m!572211))

(declare-fun m!572235 () Bool)

(assert (=> b!595047 m!572235))

(assert (=> b!595047 m!572211))

(declare-fun m!572237 () Bool)

(assert (=> b!595047 m!572237))

(declare-fun m!572239 () Bool)

(assert (=> b!595047 m!572239))

(declare-fun m!572241 () Bool)

(assert (=> b!595047 m!572241))

(declare-fun m!572243 () Bool)

(assert (=> b!595047 m!572243))

(declare-fun m!572245 () Bool)

(assert (=> b!595054 m!572245))

(declare-fun m!572247 () Bool)

(assert (=> b!595044 m!572247))

(assert (=> b!595057 m!572211))

(assert (=> b!595057 m!572211))

(declare-fun m!572249 () Bool)

(assert (=> b!595057 m!572249))

(declare-fun m!572251 () Bool)

(assert (=> b!595043 m!572251))

(assert (=> b!595049 m!572211))

(assert (=> b!595049 m!572237))

(declare-fun m!572253 () Bool)

(assert (=> b!595049 m!572253))

(assert (=> b!595060 m!572237))

(declare-fun m!572255 () Bool)

(assert (=> b!595060 m!572255))

(declare-fun m!572257 () Bool)

(assert (=> b!595046 m!572257))

(assert (=> b!595058 m!572211))

(assert (=> b!595058 m!572211))

(declare-fun m!572259 () Bool)

(assert (=> b!595058 m!572259))

(assert (=> b!595045 m!572211))

(assert (=> b!595045 m!572211))

(declare-fun m!572261 () Bool)

(assert (=> b!595045 m!572261))

(declare-fun m!572263 () Bool)

(assert (=> b!595048 m!572263))

(declare-fun m!572265 () Bool)

(assert (=> b!595051 m!572265))

(check-sat (not b!595047) (not b!595057) (not b!595058) (not start!54504) (not b!595044) (not b!595039) (not b!595045) (not b!595051) (not b!595046) (not b!595048) (not b!595043) (not b!595040) (not b!595054) (not b!595059) (not b!595041) (not b!595052))
(check-sat)
