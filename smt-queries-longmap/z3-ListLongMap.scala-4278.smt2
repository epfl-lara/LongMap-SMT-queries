; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59564 () Bool)

(assert start!59564)

(declare-fun b!657708 () Bool)

(declare-datatypes ((Unit!22772 0))(
  ( (Unit!22773) )
))
(declare-fun e!377812 () Unit!22772)

(declare-fun Unit!22774 () Unit!22772)

(assert (=> b!657708 (= e!377812 Unit!22774)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!426576 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38733 0))(
  ( (array!38734 (arr!18563 (Array (_ BitVec 32) (_ BitVec 64))) (size!18928 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38733)

(assert (=> b!657708 (= res!426576 (= (select (store (arr!18563 a!2986) i!1108 k0!1786) index!984) (select (arr!18563 a!2986) j!136)))))

(declare-fun e!377817 () Bool)

(assert (=> b!657708 (=> (not res!426576) (not e!377817))))

(assert (=> b!657708 e!377817))

(declare-fun c!75939 () Bool)

(assert (=> b!657708 (= c!75939 (bvslt j!136 index!984))))

(declare-fun lt!307254 () Unit!22772)

(declare-fun e!377810 () Unit!22772)

(assert (=> b!657708 (= lt!307254 e!377810)))

(declare-fun c!75941 () Bool)

(assert (=> b!657708 (= c!75941 (bvslt index!984 j!136))))

(declare-fun lt!307272 () Unit!22772)

(declare-fun e!377816 () Unit!22772)

(assert (=> b!657708 (= lt!307272 e!377816)))

(assert (=> b!657708 false))

(declare-fun b!657709 () Bool)

(assert (=> b!657709 false))

(declare-fun lt!307263 () Unit!22772)

(declare-fun lt!307270 () array!38733)

(declare-datatypes ((List!12643 0))(
  ( (Nil!12640) (Cons!12639 (h!13684 (_ BitVec 64)) (t!18862 List!12643)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38733 (_ BitVec 64) (_ BitVec 32) List!12643) Unit!22772)

(assert (=> b!657709 (= lt!307263 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307270 (select (arr!18563 a!2986) j!136) index!984 Nil!12640))))

(declare-fun arrayNoDuplicates!0 (array!38733 (_ BitVec 32) List!12643) Bool)

(assert (=> b!657709 (arrayNoDuplicates!0 lt!307270 index!984 Nil!12640)))

(declare-fun lt!307262 () Unit!22772)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38733 (_ BitVec 32) (_ BitVec 32)) Unit!22772)

(assert (=> b!657709 (= lt!307262 (lemmaNoDuplicateFromThenFromBigger!0 lt!307270 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657709 (arrayNoDuplicates!0 lt!307270 #b00000000000000000000000000000000 Nil!12640)))

(declare-fun lt!307261 () Unit!22772)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12643) Unit!22772)

(assert (=> b!657709 (= lt!307261 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12640))))

(declare-fun arrayContainsKey!0 (array!38733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657709 (arrayContainsKey!0 lt!307270 (select (arr!18563 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307259 () Unit!22772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22772)

(assert (=> b!657709 (= lt!307259 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307270 (select (arr!18563 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377821 () Bool)

(assert (=> b!657709 e!377821))

(declare-fun res!426580 () Bool)

(assert (=> b!657709 (=> (not res!426580) (not e!377821))))

(assert (=> b!657709 (= res!426580 (arrayContainsKey!0 lt!307270 (select (arr!18563 a!2986) j!136) j!136))))

(declare-fun Unit!22775 () Unit!22772)

(assert (=> b!657709 (= e!377816 Unit!22775)))

(declare-fun b!657710 () Bool)

(declare-fun res!426575 () Bool)

(declare-fun e!377808 () Bool)

(assert (=> b!657710 (=> (not res!426575) (not e!377808))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!657710 (= res!426575 (and (= (size!18928 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18928 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18928 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657712 () Bool)

(declare-fun e!377820 () Bool)

(assert (=> b!657712 (= e!377820 true)))

(assert (=> b!657712 (= (select (store (arr!18563 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657713 () Bool)

(declare-fun e!377818 () Unit!22772)

(declare-fun Unit!22776 () Unit!22772)

(assert (=> b!657713 (= e!377818 Unit!22776)))

(declare-fun b!657714 () Bool)

(declare-fun res!426570 () Bool)

(declare-fun e!377813 () Bool)

(assert (=> b!657714 (=> (not res!426570) (not e!377813))))

(assert (=> b!657714 (= res!426570 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12640))))

(declare-fun b!657715 () Bool)

(assert (=> b!657715 (= e!377808 e!377813)))

(declare-fun res!426574 () Bool)

(assert (=> b!657715 (=> (not res!426574) (not e!377813))))

(declare-datatypes ((SeekEntryResult!7000 0))(
  ( (MissingZero!7000 (index!30365 (_ BitVec 32))) (Found!7000 (index!30366 (_ BitVec 32))) (Intermediate!7000 (undefined!7812 Bool) (index!30367 (_ BitVec 32)) (x!59166 (_ BitVec 32))) (Undefined!7000) (MissingVacant!7000 (index!30368 (_ BitVec 32))) )
))
(declare-fun lt!307265 () SeekEntryResult!7000)

(assert (=> b!657715 (= res!426574 (or (= lt!307265 (MissingZero!7000 i!1108)) (= lt!307265 (MissingVacant!7000 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38733 (_ BitVec 32)) SeekEntryResult!7000)

(assert (=> b!657715 (= lt!307265 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657716 () Bool)

(declare-fun e!377811 () Bool)

(assert (=> b!657716 (= e!377811 (not e!377820))))

(declare-fun res!426567 () Bool)

(assert (=> b!657716 (=> res!426567 e!377820)))

(declare-fun lt!307256 () SeekEntryResult!7000)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!657716 (= res!426567 (not (= lt!307256 (MissingVacant!7000 vacantSpotIndex!68))))))

(declare-fun lt!307257 () Unit!22772)

(assert (=> b!657716 (= lt!307257 e!377812)))

(declare-fun c!75940 () Bool)

(assert (=> b!657716 (= c!75940 (= lt!307256 (Found!7000 index!984)))))

(declare-fun lt!307264 () Unit!22772)

(assert (=> b!657716 (= lt!307264 e!377818)))

(declare-fun c!75942 () Bool)

(assert (=> b!657716 (= c!75942 (= lt!307256 Undefined!7000))))

(declare-fun lt!307267 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38733 (_ BitVec 32)) SeekEntryResult!7000)

(assert (=> b!657716 (= lt!307256 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307267 lt!307270 mask!3053))))

(declare-fun e!377809 () Bool)

(assert (=> b!657716 e!377809))

(declare-fun res!426572 () Bool)

(assert (=> b!657716 (=> (not res!426572) (not e!377809))))

(declare-fun lt!307266 () (_ BitVec 32))

(declare-fun lt!307268 () SeekEntryResult!7000)

(assert (=> b!657716 (= res!426572 (= lt!307268 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307266 vacantSpotIndex!68 lt!307267 lt!307270 mask!3053)))))

(assert (=> b!657716 (= lt!307268 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307266 vacantSpotIndex!68 (select (arr!18563 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657716 (= lt!307267 (select (store (arr!18563 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307260 () Unit!22772)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38733 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22772)

(assert (=> b!657716 (= lt!307260 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307266 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657716 (= lt!307266 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657717 () Bool)

(declare-fun res!426577 () Bool)

(assert (=> b!657717 (= res!426577 (bvsge j!136 index!984))))

(declare-fun e!377815 () Bool)

(assert (=> b!657717 (=> res!426577 e!377815)))

(assert (=> b!657717 (= e!377817 e!377815)))

(declare-fun b!657718 () Bool)

(declare-fun res!426579 () Bool)

(assert (=> b!657718 (=> (not res!426579) (not e!377808))))

(assert (=> b!657718 (= res!426579 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657719 () Bool)

(declare-fun lt!307253 () SeekEntryResult!7000)

(assert (=> b!657719 (= e!377809 (= lt!307253 lt!307268))))

(declare-fun b!657720 () Bool)

(assert (=> b!657720 (= e!377821 (arrayContainsKey!0 lt!307270 (select (arr!18563 a!2986) j!136) index!984))))

(declare-fun b!657721 () Bool)

(declare-fun res!426571 () Bool)

(assert (=> b!657721 (= res!426571 (arrayContainsKey!0 lt!307270 (select (arr!18563 a!2986) j!136) j!136))))

(declare-fun e!377822 () Bool)

(assert (=> b!657721 (=> (not res!426571) (not e!377822))))

(assert (=> b!657721 (= e!377815 e!377822)))

(declare-fun b!657722 () Bool)

(declare-fun Unit!22777 () Unit!22772)

(assert (=> b!657722 (= e!377816 Unit!22777)))

(declare-fun b!657723 () Bool)

(declare-fun Unit!22778 () Unit!22772)

(assert (=> b!657723 (= e!377812 Unit!22778)))

(declare-fun b!657724 () Bool)

(declare-fun Unit!22779 () Unit!22772)

(assert (=> b!657724 (= e!377818 Unit!22779)))

(assert (=> b!657724 false))

(declare-fun b!657725 () Bool)

(assert (=> b!657725 false))

(declare-fun lt!307271 () Unit!22772)

(assert (=> b!657725 (= lt!307271 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307270 (select (arr!18563 a!2986) j!136) j!136 Nil!12640))))

(assert (=> b!657725 (arrayNoDuplicates!0 lt!307270 j!136 Nil!12640)))

(declare-fun lt!307255 () Unit!22772)

(assert (=> b!657725 (= lt!307255 (lemmaNoDuplicateFromThenFromBigger!0 lt!307270 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657725 (arrayNoDuplicates!0 lt!307270 #b00000000000000000000000000000000 Nil!12640)))

(declare-fun lt!307258 () Unit!22772)

(assert (=> b!657725 (= lt!307258 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12640))))

(assert (=> b!657725 (arrayContainsKey!0 lt!307270 (select (arr!18563 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307269 () Unit!22772)

(assert (=> b!657725 (= lt!307269 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307270 (select (arr!18563 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22780 () Unit!22772)

(assert (=> b!657725 (= e!377810 Unit!22780)))

(declare-fun b!657726 () Bool)

(assert (=> b!657726 (= e!377822 (arrayContainsKey!0 lt!307270 (select (arr!18563 a!2986) j!136) index!984))))

(declare-fun b!657711 () Bool)

(declare-fun Unit!22781 () Unit!22772)

(assert (=> b!657711 (= e!377810 Unit!22781)))

(declare-fun res!426564 () Bool)

(assert (=> start!59564 (=> (not res!426564) (not e!377808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59564 (= res!426564 (validMask!0 mask!3053))))

(assert (=> start!59564 e!377808))

(assert (=> start!59564 true))

(declare-fun array_inv!14446 (array!38733) Bool)

(assert (=> start!59564 (array_inv!14446 a!2986)))

(declare-fun b!657727 () Bool)

(declare-fun res!426568 () Bool)

(assert (=> b!657727 (=> (not res!426568) (not e!377808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657727 (= res!426568 (validKeyInArray!0 k0!1786))))

(declare-fun b!657728 () Bool)

(declare-fun res!426569 () Bool)

(assert (=> b!657728 (=> (not res!426569) (not e!377813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38733 (_ BitVec 32)) Bool)

(assert (=> b!657728 (= res!426569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657729 () Bool)

(declare-fun e!377814 () Bool)

(assert (=> b!657729 (= e!377813 e!377814)))

(declare-fun res!426565 () Bool)

(assert (=> b!657729 (=> (not res!426565) (not e!377814))))

(assert (=> b!657729 (= res!426565 (= (select (store (arr!18563 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657729 (= lt!307270 (array!38734 (store (arr!18563 a!2986) i!1108 k0!1786) (size!18928 a!2986)))))

(declare-fun b!657730 () Bool)

(declare-fun res!426566 () Bool)

(assert (=> b!657730 (=> (not res!426566) (not e!377813))))

(assert (=> b!657730 (= res!426566 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18563 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657731 () Bool)

(declare-fun res!426573 () Bool)

(assert (=> b!657731 (=> (not res!426573) (not e!377808))))

(assert (=> b!657731 (= res!426573 (validKeyInArray!0 (select (arr!18563 a!2986) j!136)))))

(declare-fun b!657732 () Bool)

(assert (=> b!657732 (= e!377814 e!377811)))

(declare-fun res!426578 () Bool)

(assert (=> b!657732 (=> (not res!426578) (not e!377811))))

(assert (=> b!657732 (= res!426578 (and (= lt!307253 (Found!7000 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18563 a!2986) index!984) (select (arr!18563 a!2986) j!136))) (not (= (select (arr!18563 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657732 (= lt!307253 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18563 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!59564 res!426564) b!657710))

(assert (= (and b!657710 res!426575) b!657731))

(assert (= (and b!657731 res!426573) b!657727))

(assert (= (and b!657727 res!426568) b!657718))

(assert (= (and b!657718 res!426579) b!657715))

(assert (= (and b!657715 res!426574) b!657728))

(assert (= (and b!657728 res!426569) b!657714))

(assert (= (and b!657714 res!426570) b!657730))

(assert (= (and b!657730 res!426566) b!657729))

(assert (= (and b!657729 res!426565) b!657732))

(assert (= (and b!657732 res!426578) b!657716))

(assert (= (and b!657716 res!426572) b!657719))

(assert (= (and b!657716 c!75942) b!657724))

(assert (= (and b!657716 (not c!75942)) b!657713))

(assert (= (and b!657716 c!75940) b!657708))

(assert (= (and b!657716 (not c!75940)) b!657723))

(assert (= (and b!657708 res!426576) b!657717))

(assert (= (and b!657717 (not res!426577)) b!657721))

(assert (= (and b!657721 res!426571) b!657726))

(assert (= (and b!657708 c!75939) b!657725))

(assert (= (and b!657708 (not c!75939)) b!657711))

(assert (= (and b!657708 c!75941) b!657709))

(assert (= (and b!657708 (not c!75941)) b!657722))

(assert (= (and b!657709 res!426580) b!657720))

(assert (= (and b!657716 (not res!426567)) b!657712))

(declare-fun m!630225 () Bool)

(assert (=> b!657729 m!630225))

(declare-fun m!630227 () Bool)

(assert (=> b!657729 m!630227))

(assert (=> b!657712 m!630225))

(declare-fun m!630229 () Bool)

(assert (=> b!657712 m!630229))

(declare-fun m!630231 () Bool)

(assert (=> b!657732 m!630231))

(declare-fun m!630233 () Bool)

(assert (=> b!657732 m!630233))

(assert (=> b!657732 m!630233))

(declare-fun m!630235 () Bool)

(assert (=> b!657732 m!630235))

(assert (=> b!657731 m!630233))

(assert (=> b!657731 m!630233))

(declare-fun m!630237 () Bool)

(assert (=> b!657731 m!630237))

(declare-fun m!630239 () Bool)

(assert (=> b!657715 m!630239))

(assert (=> b!657721 m!630233))

(assert (=> b!657721 m!630233))

(declare-fun m!630241 () Bool)

(assert (=> b!657721 m!630241))

(declare-fun m!630243 () Bool)

(assert (=> start!59564 m!630243))

(declare-fun m!630245 () Bool)

(assert (=> start!59564 m!630245))

(assert (=> b!657726 m!630233))

(assert (=> b!657726 m!630233))

(declare-fun m!630247 () Bool)

(assert (=> b!657726 m!630247))

(declare-fun m!630249 () Bool)

(assert (=> b!657714 m!630249))

(declare-fun m!630251 () Bool)

(assert (=> b!657728 m!630251))

(assert (=> b!657720 m!630233))

(assert (=> b!657720 m!630233))

(assert (=> b!657720 m!630247))

(assert (=> b!657709 m!630233))

(declare-fun m!630253 () Bool)

(assert (=> b!657709 m!630253))

(assert (=> b!657709 m!630233))

(declare-fun m!630255 () Bool)

(assert (=> b!657709 m!630255))

(assert (=> b!657709 m!630233))

(declare-fun m!630257 () Bool)

(assert (=> b!657709 m!630257))

(assert (=> b!657709 m!630233))

(assert (=> b!657709 m!630241))

(assert (=> b!657709 m!630233))

(declare-fun m!630259 () Bool)

(assert (=> b!657709 m!630259))

(declare-fun m!630261 () Bool)

(assert (=> b!657709 m!630261))

(declare-fun m!630263 () Bool)

(assert (=> b!657709 m!630263))

(declare-fun m!630265 () Bool)

(assert (=> b!657709 m!630265))

(declare-fun m!630267 () Bool)

(assert (=> b!657716 m!630267))

(declare-fun m!630269 () Bool)

(assert (=> b!657716 m!630269))

(assert (=> b!657716 m!630233))

(assert (=> b!657716 m!630225))

(declare-fun m!630271 () Bool)

(assert (=> b!657716 m!630271))

(assert (=> b!657716 m!630233))

(declare-fun m!630273 () Bool)

(assert (=> b!657716 m!630273))

(declare-fun m!630275 () Bool)

(assert (=> b!657716 m!630275))

(declare-fun m!630277 () Bool)

(assert (=> b!657716 m!630277))

(assert (=> b!657708 m!630225))

(assert (=> b!657708 m!630229))

(assert (=> b!657708 m!630233))

(declare-fun m!630279 () Bool)

(assert (=> b!657727 m!630279))

(declare-fun m!630281 () Bool)

(assert (=> b!657718 m!630281))

(declare-fun m!630283 () Bool)

(assert (=> b!657730 m!630283))

(declare-fun m!630285 () Bool)

(assert (=> b!657725 m!630285))

(assert (=> b!657725 m!630233))

(declare-fun m!630287 () Bool)

(assert (=> b!657725 m!630287))

(assert (=> b!657725 m!630233))

(assert (=> b!657725 m!630257))

(assert (=> b!657725 m!630233))

(declare-fun m!630289 () Bool)

(assert (=> b!657725 m!630289))

(assert (=> b!657725 m!630233))

(declare-fun m!630291 () Bool)

(assert (=> b!657725 m!630291))

(declare-fun m!630293 () Bool)

(assert (=> b!657725 m!630293))

(assert (=> b!657725 m!630261))

(check-sat (not b!657714) (not b!657726) (not b!657728) (not b!657727) (not b!657715) (not b!657732) (not start!59564) (not b!657718) (not b!657720) (not b!657709) (not b!657721) (not b!657731) (not b!657725) (not b!657716))
(check-sat)
