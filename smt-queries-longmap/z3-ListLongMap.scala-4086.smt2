; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56064 () Bool)

(assert start!56064)

(declare-fun b!616073 () Bool)

(declare-fun res!396807 () Bool)

(declare-fun e!353249 () Bool)

(assert (=> b!616073 (=> (not res!396807) (not e!353249))))

(declare-datatypes ((array!37479 0))(
  ( (array!37480 (arr!17983 (Array (_ BitVec 32) (_ BitVec 64))) (size!18347 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37479)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37479 (_ BitVec 32)) Bool)

(assert (=> b!616073 (= res!396807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616074 () Bool)

(declare-datatypes ((Unit!19987 0))(
  ( (Unit!19988) )
))
(declare-fun e!353256 () Unit!19987)

(declare-fun Unit!19989 () Unit!19987)

(assert (=> b!616074 (= e!353256 Unit!19989)))

(declare-fun b!616075 () Bool)

(declare-fun e!353245 () Unit!19987)

(declare-fun Unit!19990 () Unit!19987)

(assert (=> b!616075 (= e!353245 Unit!19990)))

(declare-fun b!616076 () Bool)

(declare-fun res!396809 () Bool)

(declare-fun e!353250 () Bool)

(assert (=> b!616076 (=> (not res!396809) (not e!353250))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616076 (= res!396809 (validKeyInArray!0 (select (arr!17983 a!2986) j!136)))))

(declare-fun b!616077 () Bool)

(declare-fun e!353243 () Bool)

(assert (=> b!616077 (= e!353243 (not true))))

(declare-fun lt!283155 () Unit!19987)

(declare-fun e!353247 () Unit!19987)

(assert (=> b!616077 (= lt!283155 e!353247)))

(declare-fun c!70006 () Bool)

(declare-datatypes ((SeekEntryResult!6379 0))(
  ( (MissingZero!6379 (index!27800 (_ BitVec 32))) (Found!6379 (index!27801 (_ BitVec 32))) (Intermediate!6379 (undefined!7191 Bool) (index!27802 (_ BitVec 32)) (x!56750 (_ BitVec 32))) (Undefined!6379) (MissingVacant!6379 (index!27803 (_ BitVec 32))) )
))
(declare-fun lt!283143 () SeekEntryResult!6379)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616077 (= c!70006 (= lt!283143 (Found!6379 index!984)))))

(declare-fun lt!283152 () Unit!19987)

(assert (=> b!616077 (= lt!283152 e!353245)))

(declare-fun c!70005 () Bool)

(assert (=> b!616077 (= c!70005 (= lt!283143 Undefined!6379))))

(declare-fun lt!283154 () array!37479)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!283145 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37479 (_ BitVec 32)) SeekEntryResult!6379)

(assert (=> b!616077 (= lt!283143 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283145 lt!283154 mask!3053))))

(declare-fun e!353248 () Bool)

(assert (=> b!616077 e!353248))

(declare-fun res!396814 () Bool)

(assert (=> b!616077 (=> (not res!396814) (not e!353248))))

(declare-fun lt!283146 () SeekEntryResult!6379)

(declare-fun lt!283157 () (_ BitVec 32))

(assert (=> b!616077 (= res!396814 (= lt!283146 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283157 vacantSpotIndex!68 lt!283145 lt!283154 mask!3053)))))

(assert (=> b!616077 (= lt!283146 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283157 vacantSpotIndex!68 (select (arr!17983 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!616077 (= lt!283145 (select (store (arr!17983 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283158 () Unit!19987)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37479 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19987)

(assert (=> b!616077 (= lt!283158 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283157 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616077 (= lt!283157 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!616079 () Bool)

(declare-fun res!396817 () Bool)

(assert (=> b!616079 (=> (not res!396817) (not e!353250))))

(assert (=> b!616079 (= res!396817 (and (= (size!18347 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18347 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18347 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616080 () Bool)

(declare-fun e!353254 () Bool)

(assert (=> b!616080 (= e!353254 e!353243)))

(declare-fun res!396803 () Bool)

(assert (=> b!616080 (=> (not res!396803) (not e!353243))))

(declare-fun lt!283151 () SeekEntryResult!6379)

(assert (=> b!616080 (= res!396803 (and (= lt!283151 (Found!6379 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17983 a!2986) index!984) (select (arr!17983 a!2986) j!136))) (not (= (select (arr!17983 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616080 (= lt!283151 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17983 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616081 () Bool)

(declare-fun Unit!19991 () Unit!19987)

(assert (=> b!616081 (= e!353247 Unit!19991)))

(declare-fun b!616082 () Bool)

(declare-fun Unit!19992 () Unit!19987)

(assert (=> b!616082 (= e!353245 Unit!19992)))

(assert (=> b!616082 false))

(declare-fun b!616083 () Bool)

(assert (=> b!616083 (= e!353248 (= lt!283151 lt!283146))))

(declare-fun b!616084 () Bool)

(declare-fun res!396810 () Bool)

(assert (=> b!616084 (=> (not res!396810) (not e!353250))))

(assert (=> b!616084 (= res!396810 (validKeyInArray!0 k0!1786))))

(declare-fun b!616085 () Bool)

(declare-fun res!396804 () Bool)

(declare-fun arrayContainsKey!0 (array!37479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616085 (= res!396804 (arrayContainsKey!0 lt!283154 (select (arr!17983 a!2986) j!136) j!136))))

(declare-fun e!353252 () Bool)

(assert (=> b!616085 (=> (not res!396804) (not e!353252))))

(declare-fun e!353244 () Bool)

(assert (=> b!616085 (= e!353244 e!353252)))

(declare-fun b!616086 () Bool)

(assert (=> b!616086 false))

(declare-fun lt!283153 () Unit!19987)

(declare-datatypes ((List!11931 0))(
  ( (Nil!11928) (Cons!11927 (h!12975 (_ BitVec 64)) (t!18151 List!11931)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37479 (_ BitVec 64) (_ BitVec 32) List!11931) Unit!19987)

(assert (=> b!616086 (= lt!283153 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283154 (select (arr!17983 a!2986) j!136) index!984 Nil!11928))))

(declare-fun arrayNoDuplicates!0 (array!37479 (_ BitVec 32) List!11931) Bool)

(assert (=> b!616086 (arrayNoDuplicates!0 lt!283154 index!984 Nil!11928)))

(declare-fun lt!283159 () Unit!19987)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37479 (_ BitVec 32) (_ BitVec 32)) Unit!19987)

(assert (=> b!616086 (= lt!283159 (lemmaNoDuplicateFromThenFromBigger!0 lt!283154 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616086 (arrayNoDuplicates!0 lt!283154 #b00000000000000000000000000000000 Nil!11928)))

(declare-fun lt!283156 () Unit!19987)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11931) Unit!19987)

(assert (=> b!616086 (= lt!283156 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11928))))

(assert (=> b!616086 (arrayContainsKey!0 lt!283154 (select (arr!17983 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283147 () Unit!19987)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19987)

(assert (=> b!616086 (= lt!283147 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283154 (select (arr!17983 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353251 () Bool)

(assert (=> b!616086 e!353251))

(declare-fun res!396802 () Bool)

(assert (=> b!616086 (=> (not res!396802) (not e!353251))))

(assert (=> b!616086 (= res!396802 (arrayContainsKey!0 lt!283154 (select (arr!17983 a!2986) j!136) j!136))))

(declare-fun Unit!19993 () Unit!19987)

(assert (=> b!616086 (= e!353256 Unit!19993)))

(declare-fun b!616087 () Bool)

(declare-fun res!396805 () Bool)

(assert (=> b!616087 (=> (not res!396805) (not e!353249))))

(assert (=> b!616087 (= res!396805 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11928))))

(declare-fun b!616088 () Bool)

(declare-fun res!396808 () Bool)

(assert (=> b!616088 (= res!396808 (bvsge j!136 index!984))))

(assert (=> b!616088 (=> res!396808 e!353244)))

(declare-fun e!353246 () Bool)

(assert (=> b!616088 (= e!353246 e!353244)))

(declare-fun b!616089 () Bool)

(declare-fun Unit!19994 () Unit!19987)

(assert (=> b!616089 (= e!353247 Unit!19994)))

(declare-fun res!396813 () Bool)

(assert (=> b!616089 (= res!396813 (= (select (store (arr!17983 a!2986) i!1108 k0!1786) index!984) (select (arr!17983 a!2986) j!136)))))

(assert (=> b!616089 (=> (not res!396813) (not e!353246))))

(assert (=> b!616089 e!353246))

(declare-fun c!70004 () Bool)

(assert (=> b!616089 (= c!70004 (bvslt j!136 index!984))))

(declare-fun lt!283149 () Unit!19987)

(declare-fun e!353253 () Unit!19987)

(assert (=> b!616089 (= lt!283149 e!353253)))

(declare-fun c!70007 () Bool)

(assert (=> b!616089 (= c!70007 (bvslt index!984 j!136))))

(declare-fun lt!283144 () Unit!19987)

(assert (=> b!616089 (= lt!283144 e!353256)))

(assert (=> b!616089 false))

(declare-fun b!616090 () Bool)

(declare-fun res!396812 () Bool)

(assert (=> b!616090 (=> (not res!396812) (not e!353250))))

(assert (=> b!616090 (= res!396812 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616091 () Bool)

(assert (=> b!616091 (= e!353252 (arrayContainsKey!0 lt!283154 (select (arr!17983 a!2986) j!136) index!984))))

(declare-fun b!616092 () Bool)

(declare-fun Unit!19995 () Unit!19987)

(assert (=> b!616092 (= e!353253 Unit!19995)))

(declare-fun res!396806 () Bool)

(assert (=> start!56064 (=> (not res!396806) (not e!353250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56064 (= res!396806 (validMask!0 mask!3053))))

(assert (=> start!56064 e!353250))

(assert (=> start!56064 true))

(declare-fun array_inv!13842 (array!37479) Bool)

(assert (=> start!56064 (array_inv!13842 a!2986)))

(declare-fun b!616078 () Bool)

(assert (=> b!616078 (= e!353249 e!353254)))

(declare-fun res!396816 () Bool)

(assert (=> b!616078 (=> (not res!396816) (not e!353254))))

(assert (=> b!616078 (= res!396816 (= (select (store (arr!17983 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616078 (= lt!283154 (array!37480 (store (arr!17983 a!2986) i!1108 k0!1786) (size!18347 a!2986)))))

(declare-fun b!616093 () Bool)

(assert (=> b!616093 (= e!353251 (arrayContainsKey!0 lt!283154 (select (arr!17983 a!2986) j!136) index!984))))

(declare-fun b!616094 () Bool)

(declare-fun res!396811 () Bool)

(assert (=> b!616094 (=> (not res!396811) (not e!353249))))

(assert (=> b!616094 (= res!396811 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17983 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616095 () Bool)

(assert (=> b!616095 false))

(declare-fun lt!283141 () Unit!19987)

(assert (=> b!616095 (= lt!283141 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283154 (select (arr!17983 a!2986) j!136) j!136 Nil!11928))))

(assert (=> b!616095 (arrayNoDuplicates!0 lt!283154 j!136 Nil!11928)))

(declare-fun lt!283140 () Unit!19987)

(assert (=> b!616095 (= lt!283140 (lemmaNoDuplicateFromThenFromBigger!0 lt!283154 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616095 (arrayNoDuplicates!0 lt!283154 #b00000000000000000000000000000000 Nil!11928)))

(declare-fun lt!283142 () Unit!19987)

(assert (=> b!616095 (= lt!283142 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11928))))

(assert (=> b!616095 (arrayContainsKey!0 lt!283154 (select (arr!17983 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283150 () Unit!19987)

(assert (=> b!616095 (= lt!283150 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283154 (select (arr!17983 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19996 () Unit!19987)

(assert (=> b!616095 (= e!353253 Unit!19996)))

(declare-fun b!616096 () Bool)

(assert (=> b!616096 (= e!353250 e!353249)))

(declare-fun res!396815 () Bool)

(assert (=> b!616096 (=> (not res!396815) (not e!353249))))

(declare-fun lt!283148 () SeekEntryResult!6379)

(assert (=> b!616096 (= res!396815 (or (= lt!283148 (MissingZero!6379 i!1108)) (= lt!283148 (MissingVacant!6379 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37479 (_ BitVec 32)) SeekEntryResult!6379)

(assert (=> b!616096 (= lt!283148 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56064 res!396806) b!616079))

(assert (= (and b!616079 res!396817) b!616076))

(assert (= (and b!616076 res!396809) b!616084))

(assert (= (and b!616084 res!396810) b!616090))

(assert (= (and b!616090 res!396812) b!616096))

(assert (= (and b!616096 res!396815) b!616073))

(assert (= (and b!616073 res!396807) b!616087))

(assert (= (and b!616087 res!396805) b!616094))

(assert (= (and b!616094 res!396811) b!616078))

(assert (= (and b!616078 res!396816) b!616080))

(assert (= (and b!616080 res!396803) b!616077))

(assert (= (and b!616077 res!396814) b!616083))

(assert (= (and b!616077 c!70005) b!616082))

(assert (= (and b!616077 (not c!70005)) b!616075))

(assert (= (and b!616077 c!70006) b!616089))

(assert (= (and b!616077 (not c!70006)) b!616081))

(assert (= (and b!616089 res!396813) b!616088))

(assert (= (and b!616088 (not res!396808)) b!616085))

(assert (= (and b!616085 res!396804) b!616091))

(assert (= (and b!616089 c!70004) b!616095))

(assert (= (and b!616089 (not c!70004)) b!616092))

(assert (= (and b!616089 c!70007) b!616086))

(assert (= (and b!616089 (not c!70007)) b!616074))

(assert (= (and b!616086 res!396802) b!616093))

(declare-fun m!592541 () Bool)

(assert (=> b!616094 m!592541))

(declare-fun m!592543 () Bool)

(assert (=> b!616086 m!592543))

(declare-fun m!592545 () Bool)

(assert (=> b!616086 m!592545))

(declare-fun m!592547 () Bool)

(assert (=> b!616086 m!592547))

(declare-fun m!592549 () Bool)

(assert (=> b!616086 m!592549))

(assert (=> b!616086 m!592543))

(declare-fun m!592551 () Bool)

(assert (=> b!616086 m!592551))

(assert (=> b!616086 m!592543))

(declare-fun m!592553 () Bool)

(assert (=> b!616086 m!592553))

(assert (=> b!616086 m!592543))

(assert (=> b!616086 m!592543))

(declare-fun m!592555 () Bool)

(assert (=> b!616086 m!592555))

(declare-fun m!592557 () Bool)

(assert (=> b!616086 m!592557))

(declare-fun m!592559 () Bool)

(assert (=> b!616086 m!592559))

(declare-fun m!592561 () Bool)

(assert (=> b!616087 m!592561))

(declare-fun m!592563 () Bool)

(assert (=> b!616073 m!592563))

(declare-fun m!592565 () Bool)

(assert (=> b!616096 m!592565))

(declare-fun m!592567 () Bool)

(assert (=> start!56064 m!592567))

(declare-fun m!592569 () Bool)

(assert (=> start!56064 m!592569))

(declare-fun m!592571 () Bool)

(assert (=> b!616090 m!592571))

(assert (=> b!616093 m!592543))

(assert (=> b!616093 m!592543))

(declare-fun m!592573 () Bool)

(assert (=> b!616093 m!592573))

(assert (=> b!616085 m!592543))

(assert (=> b!616085 m!592543))

(assert (=> b!616085 m!592545))

(declare-fun m!592575 () Bool)

(assert (=> b!616084 m!592575))

(declare-fun m!592577 () Bool)

(assert (=> b!616078 m!592577))

(declare-fun m!592579 () Bool)

(assert (=> b!616078 m!592579))

(assert (=> b!616076 m!592543))

(assert (=> b!616076 m!592543))

(declare-fun m!592581 () Bool)

(assert (=> b!616076 m!592581))

(assert (=> b!616095 m!592543))

(declare-fun m!592583 () Bool)

(assert (=> b!616095 m!592583))

(declare-fun m!592585 () Bool)

(assert (=> b!616095 m!592585))

(assert (=> b!616095 m!592543))

(declare-fun m!592587 () Bool)

(assert (=> b!616095 m!592587))

(assert (=> b!616095 m!592543))

(declare-fun m!592589 () Bool)

(assert (=> b!616095 m!592589))

(assert (=> b!616095 m!592543))

(declare-fun m!592591 () Bool)

(assert (=> b!616095 m!592591))

(assert (=> b!616095 m!592557))

(assert (=> b!616095 m!592559))

(declare-fun m!592593 () Bool)

(assert (=> b!616080 m!592593))

(assert (=> b!616080 m!592543))

(assert (=> b!616080 m!592543))

(declare-fun m!592595 () Bool)

(assert (=> b!616080 m!592595))

(assert (=> b!616091 m!592543))

(assert (=> b!616091 m!592543))

(assert (=> b!616091 m!592573))

(declare-fun m!592597 () Bool)

(assert (=> b!616077 m!592597))

(declare-fun m!592599 () Bool)

(assert (=> b!616077 m!592599))

(assert (=> b!616077 m!592543))

(declare-fun m!592601 () Bool)

(assert (=> b!616077 m!592601))

(assert (=> b!616077 m!592543))

(assert (=> b!616077 m!592577))

(declare-fun m!592603 () Bool)

(assert (=> b!616077 m!592603))

(declare-fun m!592605 () Bool)

(assert (=> b!616077 m!592605))

(declare-fun m!592607 () Bool)

(assert (=> b!616077 m!592607))

(assert (=> b!616089 m!592577))

(declare-fun m!592609 () Bool)

(assert (=> b!616089 m!592609))

(assert (=> b!616089 m!592543))

(check-sat (not b!616087) (not b!616086) (not b!616095) (not b!616085) (not start!56064) (not b!616090) (not b!616091) (not b!616076) (not b!616096) (not b!616080) (not b!616077) (not b!616073) (not b!616093) (not b!616084))
(check-sat)
