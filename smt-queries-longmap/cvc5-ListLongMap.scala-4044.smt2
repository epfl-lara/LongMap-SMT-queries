; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55138 () Bool)

(assert start!55138)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!603961 () Bool)

(declare-fun e!345549 () Bool)

(declare-datatypes ((array!37211 0))(
  ( (array!37212 (arr!17862 (Array (_ BitVec 32) (_ BitVec 64))) (size!18226 (_ BitVec 32))) )
))
(declare-fun lt!275339 () array!37211)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37211)

(declare-fun arrayContainsKey!0 (array!37211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603961 (= e!345549 (arrayContainsKey!0 lt!275339 (select (arr!17862 a!2986) j!136) index!984))))

(declare-fun res!387982 () Bool)

(declare-fun e!345551 () Bool)

(assert (=> start!55138 (=> (not res!387982) (not e!345551))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55138 (= res!387982 (validMask!0 mask!3053))))

(assert (=> start!55138 e!345551))

(assert (=> start!55138 true))

(declare-fun array_inv!13658 (array!37211) Bool)

(assert (=> start!55138 (array_inv!13658 a!2986)))

(declare-fun b!603962 () Bool)

(declare-fun res!387983 () Bool)

(assert (=> b!603962 (=> (not res!387983) (not e!345551))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603962 (= res!387983 (validKeyInArray!0 k!1786))))

(declare-fun e!345546 () Bool)

(declare-fun b!603963 () Bool)

(assert (=> b!603963 (= e!345546 (arrayContainsKey!0 lt!275339 (select (arr!17862 a!2986) j!136) index!984))))

(declare-fun b!603964 () Bool)

(declare-datatypes ((Unit!19192 0))(
  ( (Unit!19193) )
))
(declare-fun e!345542 () Unit!19192)

(declare-fun Unit!19194 () Unit!19192)

(assert (=> b!603964 (= e!345542 Unit!19194)))

(declare-fun b!603965 () Bool)

(declare-fun res!387978 () Bool)

(assert (=> b!603965 (=> (not res!387978) (not e!345551))))

(assert (=> b!603965 (= res!387978 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603966 () Bool)

(declare-fun e!345547 () Bool)

(declare-fun e!345554 () Bool)

(assert (=> b!603966 (= e!345547 e!345554)))

(declare-fun res!387981 () Bool)

(assert (=> b!603966 (=> res!387981 e!345554)))

(assert (=> b!603966 (= res!387981 (bvsge index!984 j!136))))

(declare-fun lt!275346 () Unit!19192)

(assert (=> b!603966 (= lt!275346 e!345542)))

(declare-fun c!68365 () Bool)

(assert (=> b!603966 (= c!68365 (bvslt j!136 index!984))))

(declare-fun b!603967 () Bool)

(declare-fun Unit!19195 () Unit!19192)

(assert (=> b!603967 (= e!345542 Unit!19195)))

(declare-fun lt!275337 () Unit!19192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37211 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19192)

(assert (=> b!603967 (= lt!275337 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275339 (select (arr!17862 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603967 (arrayContainsKey!0 lt!275339 (select (arr!17862 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!275334 () Unit!19192)

(declare-datatypes ((List!11903 0))(
  ( (Nil!11900) (Cons!11899 (h!12944 (_ BitVec 64)) (t!18131 List!11903)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37211 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11903) Unit!19192)

(assert (=> b!603967 (= lt!275334 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11900))))

(declare-fun arrayNoDuplicates!0 (array!37211 (_ BitVec 32) List!11903) Bool)

(assert (=> b!603967 (arrayNoDuplicates!0 lt!275339 #b00000000000000000000000000000000 Nil!11900)))

(declare-fun lt!275343 () Unit!19192)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37211 (_ BitVec 32) (_ BitVec 32)) Unit!19192)

(assert (=> b!603967 (= lt!275343 (lemmaNoDuplicateFromThenFromBigger!0 lt!275339 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603967 (arrayNoDuplicates!0 lt!275339 j!136 Nil!11900)))

(declare-fun lt!275335 () Unit!19192)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37211 (_ BitVec 64) (_ BitVec 32) List!11903) Unit!19192)

(assert (=> b!603967 (= lt!275335 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275339 (select (arr!17862 a!2986) j!136) j!136 Nil!11900))))

(assert (=> b!603967 false))

(declare-fun b!603968 () Bool)

(declare-fun e!345541 () Bool)

(assert (=> b!603968 (= e!345551 e!345541)))

(declare-fun res!387969 () Bool)

(assert (=> b!603968 (=> (not res!387969) (not e!345541))))

(declare-datatypes ((SeekEntryResult!6302 0))(
  ( (MissingZero!6302 (index!27471 (_ BitVec 32))) (Found!6302 (index!27472 (_ BitVec 32))) (Intermediate!6302 (undefined!7114 Bool) (index!27473 (_ BitVec 32)) (x!56271 (_ BitVec 32))) (Undefined!6302) (MissingVacant!6302 (index!27474 (_ BitVec 32))) )
))
(declare-fun lt!275333 () SeekEntryResult!6302)

(assert (=> b!603968 (= res!387969 (or (= lt!275333 (MissingZero!6302 i!1108)) (= lt!275333 (MissingVacant!6302 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37211 (_ BitVec 32)) SeekEntryResult!6302)

(assert (=> b!603968 (= lt!275333 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603969 () Bool)

(declare-fun e!345543 () Unit!19192)

(declare-fun Unit!19196 () Unit!19192)

(assert (=> b!603969 (= e!345543 Unit!19196)))

(assert (=> b!603969 false))

(declare-fun b!603970 () Bool)

(declare-fun res!387976 () Bool)

(assert (=> b!603970 (=> (not res!387976) (not e!345541))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603970 (= res!387976 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17862 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603971 () Bool)

(assert (=> b!603971 (= e!345554 true)))

(assert (=> b!603971 e!345546))

(declare-fun res!387977 () Bool)

(assert (=> b!603971 (=> (not res!387977) (not e!345546))))

(assert (=> b!603971 (= res!387977 (arrayContainsKey!0 lt!275339 (select (arr!17862 a!2986) j!136) j!136))))

(declare-fun b!603972 () Bool)

(declare-fun res!387965 () Bool)

(assert (=> b!603972 (=> (not res!387965) (not e!345541))))

(assert (=> b!603972 (= res!387965 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11900))))

(declare-fun b!603973 () Bool)

(declare-fun e!345553 () Bool)

(assert (=> b!603973 (= e!345553 e!345549)))

(declare-fun res!387971 () Bool)

(assert (=> b!603973 (=> (not res!387971) (not e!345549))))

(assert (=> b!603973 (= res!387971 (arrayContainsKey!0 lt!275339 (select (arr!17862 a!2986) j!136) j!136))))

(declare-fun b!603974 () Bool)

(declare-fun Unit!19197 () Unit!19192)

(assert (=> b!603974 (= e!345543 Unit!19197)))

(declare-fun b!603975 () Bool)

(declare-fun e!345552 () Bool)

(declare-fun lt!275342 () SeekEntryResult!6302)

(declare-fun lt!275338 () SeekEntryResult!6302)

(assert (=> b!603975 (= e!345552 (= lt!275342 lt!275338))))

(declare-fun b!603976 () Bool)

(declare-fun e!345544 () Bool)

(declare-fun e!345555 () Bool)

(assert (=> b!603976 (= e!345544 e!345555)))

(declare-fun res!387967 () Bool)

(assert (=> b!603976 (=> (not res!387967) (not e!345555))))

(assert (=> b!603976 (= res!387967 (and (= lt!275342 (Found!6302 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17862 a!2986) index!984) (select (arr!17862 a!2986) j!136))) (not (= (select (arr!17862 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37211 (_ BitVec 32)) SeekEntryResult!6302)

(assert (=> b!603976 (= lt!275342 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17862 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603977 () Bool)

(declare-fun e!345548 () Bool)

(assert (=> b!603977 (= e!345548 e!345547)))

(declare-fun res!387975 () Bool)

(assert (=> b!603977 (=> res!387975 e!345547)))

(declare-fun lt!275344 () (_ BitVec 64))

(declare-fun lt!275341 () (_ BitVec 64))

(assert (=> b!603977 (= res!387975 (or (not (= (select (arr!17862 a!2986) j!136) lt!275341)) (not (= (select (arr!17862 a!2986) j!136) lt!275344))))))

(declare-fun e!345550 () Bool)

(assert (=> b!603977 e!345550))

(declare-fun res!387966 () Bool)

(assert (=> b!603977 (=> (not res!387966) (not e!345550))))

(assert (=> b!603977 (= res!387966 (= lt!275344 (select (arr!17862 a!2986) j!136)))))

(assert (=> b!603977 (= lt!275344 (select (store (arr!17862 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!603978 () Bool)

(declare-fun res!387974 () Bool)

(assert (=> b!603978 (=> (not res!387974) (not e!345551))))

(assert (=> b!603978 (= res!387974 (and (= (size!18226 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18226 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18226 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603979 () Bool)

(assert (=> b!603979 (= e!345555 (not e!345548))))

(declare-fun res!387972 () Bool)

(assert (=> b!603979 (=> res!387972 e!345548)))

(declare-fun lt!275336 () SeekEntryResult!6302)

(assert (=> b!603979 (= res!387972 (not (= lt!275336 (Found!6302 index!984))))))

(declare-fun lt!275347 () Unit!19192)

(assert (=> b!603979 (= lt!275347 e!345543)))

(declare-fun c!68366 () Bool)

(assert (=> b!603979 (= c!68366 (= lt!275336 Undefined!6302))))

(assert (=> b!603979 (= lt!275336 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275341 lt!275339 mask!3053))))

(assert (=> b!603979 e!345552))

(declare-fun res!387980 () Bool)

(assert (=> b!603979 (=> (not res!387980) (not e!345552))))

(declare-fun lt!275345 () (_ BitVec 32))

(assert (=> b!603979 (= res!387980 (= lt!275338 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275345 vacantSpotIndex!68 lt!275341 lt!275339 mask!3053)))))

(assert (=> b!603979 (= lt!275338 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275345 vacantSpotIndex!68 (select (arr!17862 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603979 (= lt!275341 (select (store (arr!17862 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275340 () Unit!19192)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19192)

(assert (=> b!603979 (= lt!275340 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275345 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603979 (= lt!275345 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603980 () Bool)

(assert (=> b!603980 (= e!345541 e!345544)))

(declare-fun res!387979 () Bool)

(assert (=> b!603980 (=> (not res!387979) (not e!345544))))

(assert (=> b!603980 (= res!387979 (= (select (store (arr!17862 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603980 (= lt!275339 (array!37212 (store (arr!17862 a!2986) i!1108 k!1786) (size!18226 a!2986)))))

(declare-fun b!603981 () Bool)

(declare-fun res!387973 () Bool)

(assert (=> b!603981 (=> (not res!387973) (not e!345551))))

(assert (=> b!603981 (= res!387973 (validKeyInArray!0 (select (arr!17862 a!2986) j!136)))))

(declare-fun b!603982 () Bool)

(declare-fun res!387970 () Bool)

(assert (=> b!603982 (=> (not res!387970) (not e!345541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37211 (_ BitVec 32)) Bool)

(assert (=> b!603982 (= res!387970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603983 () Bool)

(assert (=> b!603983 (= e!345550 e!345553)))

(declare-fun res!387968 () Bool)

(assert (=> b!603983 (=> res!387968 e!345553)))

(assert (=> b!603983 (= res!387968 (or (not (= (select (arr!17862 a!2986) j!136) lt!275341)) (not (= (select (arr!17862 a!2986) j!136) lt!275344)) (bvsge j!136 index!984)))))

(assert (= (and start!55138 res!387982) b!603978))

(assert (= (and b!603978 res!387974) b!603981))

(assert (= (and b!603981 res!387973) b!603962))

(assert (= (and b!603962 res!387983) b!603965))

(assert (= (and b!603965 res!387978) b!603968))

(assert (= (and b!603968 res!387969) b!603982))

(assert (= (and b!603982 res!387970) b!603972))

(assert (= (and b!603972 res!387965) b!603970))

(assert (= (and b!603970 res!387976) b!603980))

(assert (= (and b!603980 res!387979) b!603976))

(assert (= (and b!603976 res!387967) b!603979))

(assert (= (and b!603979 res!387980) b!603975))

(assert (= (and b!603979 c!68366) b!603969))

(assert (= (and b!603979 (not c!68366)) b!603974))

(assert (= (and b!603979 (not res!387972)) b!603977))

(assert (= (and b!603977 res!387966) b!603983))

(assert (= (and b!603983 (not res!387968)) b!603973))

(assert (= (and b!603973 res!387971) b!603961))

(assert (= (and b!603977 (not res!387975)) b!603966))

(assert (= (and b!603966 c!68365) b!603967))

(assert (= (and b!603966 (not c!68365)) b!603964))

(assert (= (and b!603966 (not res!387981)) b!603971))

(assert (= (and b!603971 res!387977) b!603963))

(declare-fun m!580913 () Bool)

(assert (=> b!603961 m!580913))

(assert (=> b!603961 m!580913))

(declare-fun m!580915 () Bool)

(assert (=> b!603961 m!580915))

(assert (=> b!603967 m!580913))

(declare-fun m!580917 () Bool)

(assert (=> b!603967 m!580917))

(assert (=> b!603967 m!580913))

(declare-fun m!580919 () Bool)

(assert (=> b!603967 m!580919))

(assert (=> b!603967 m!580913))

(declare-fun m!580921 () Bool)

(assert (=> b!603967 m!580921))

(declare-fun m!580923 () Bool)

(assert (=> b!603967 m!580923))

(declare-fun m!580925 () Bool)

(assert (=> b!603967 m!580925))

(declare-fun m!580927 () Bool)

(assert (=> b!603967 m!580927))

(assert (=> b!603967 m!580913))

(declare-fun m!580929 () Bool)

(assert (=> b!603967 m!580929))

(declare-fun m!580931 () Bool)

(assert (=> b!603970 m!580931))

(declare-fun m!580933 () Bool)

(assert (=> start!55138 m!580933))

(declare-fun m!580935 () Bool)

(assert (=> start!55138 m!580935))

(assert (=> b!603983 m!580913))

(declare-fun m!580937 () Bool)

(assert (=> b!603982 m!580937))

(declare-fun m!580939 () Bool)

(assert (=> b!603962 m!580939))

(assert (=> b!603971 m!580913))

(assert (=> b!603971 m!580913))

(declare-fun m!580941 () Bool)

(assert (=> b!603971 m!580941))

(declare-fun m!580943 () Bool)

(assert (=> b!603972 m!580943))

(declare-fun m!580945 () Bool)

(assert (=> b!603980 m!580945))

(declare-fun m!580947 () Bool)

(assert (=> b!603980 m!580947))

(assert (=> b!603973 m!580913))

(assert (=> b!603973 m!580913))

(assert (=> b!603973 m!580941))

(declare-fun m!580949 () Bool)

(assert (=> b!603976 m!580949))

(assert (=> b!603976 m!580913))

(assert (=> b!603976 m!580913))

(declare-fun m!580951 () Bool)

(assert (=> b!603976 m!580951))

(declare-fun m!580953 () Bool)

(assert (=> b!603979 m!580953))

(assert (=> b!603979 m!580945))

(assert (=> b!603979 m!580913))

(declare-fun m!580955 () Bool)

(assert (=> b!603979 m!580955))

(declare-fun m!580957 () Bool)

(assert (=> b!603979 m!580957))

(declare-fun m!580959 () Bool)

(assert (=> b!603979 m!580959))

(declare-fun m!580961 () Bool)

(assert (=> b!603979 m!580961))

(assert (=> b!603979 m!580913))

(declare-fun m!580963 () Bool)

(assert (=> b!603979 m!580963))

(declare-fun m!580965 () Bool)

(assert (=> b!603965 m!580965))

(assert (=> b!603981 m!580913))

(assert (=> b!603981 m!580913))

(declare-fun m!580967 () Bool)

(assert (=> b!603981 m!580967))

(declare-fun m!580969 () Bool)

(assert (=> b!603968 m!580969))

(assert (=> b!603977 m!580913))

(assert (=> b!603977 m!580945))

(declare-fun m!580971 () Bool)

(assert (=> b!603977 m!580971))

(assert (=> b!603963 m!580913))

(assert (=> b!603963 m!580913))

(assert (=> b!603963 m!580915))

(push 1)

