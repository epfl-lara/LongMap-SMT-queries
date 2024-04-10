; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55594 () Bool)

(assert start!55594)

(declare-fun b!609240 () Bool)

(declare-fun e!348919 () Bool)

(declare-fun e!348928 () Bool)

(assert (=> b!609240 (= e!348919 e!348928)))

(declare-fun res!391795 () Bool)

(assert (=> b!609240 (=> (not res!391795) (not e!348928))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6353 0))(
  ( (MissingZero!6353 (index!27687 (_ BitVec 32))) (Found!6353 (index!27688 (_ BitVec 32))) (Intermediate!6353 (undefined!7165 Bool) (index!27689 (_ BitVec 32)) (x!56494 (_ BitVec 32))) (Undefined!6353) (MissingVacant!6353 (index!27690 (_ BitVec 32))) )
))
(declare-fun lt!278463 () SeekEntryResult!6353)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37325 0))(
  ( (array!37326 (arr!17913 (Array (_ BitVec 32) (_ BitVec 64))) (size!18277 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37325)

(assert (=> b!609240 (= res!391795 (and (= lt!278463 (Found!6353 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17913 a!2986) index!984) (select (arr!17913 a!2986) j!136))) (not (= (select (arr!17913 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37325 (_ BitVec 32)) SeekEntryResult!6353)

(assert (=> b!609240 (= lt!278463 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17913 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609241 () Bool)

(declare-fun e!348918 () Bool)

(assert (=> b!609241 (= e!348918 true)))

(declare-fun lt!278459 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11954 0))(
  ( (Nil!11951) (Cons!11950 (h!12995 (_ BitVec 64)) (t!18182 List!11954)) )
))
(declare-fun contains!3030 (List!11954 (_ BitVec 64)) Bool)

(assert (=> b!609241 (= lt!278459 (contains!3030 Nil!11951 k!1786))))

(declare-fun b!609242 () Bool)

(declare-fun res!391802 () Bool)

(declare-fun e!348931 () Bool)

(assert (=> b!609242 (=> (not res!391802) (not e!348931))))

(declare-fun arrayNoDuplicates!0 (array!37325 (_ BitVec 32) List!11954) Bool)

(assert (=> b!609242 (= res!391802 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11951))))

(declare-fun b!609244 () Bool)

(declare-fun res!391804 () Bool)

(assert (=> b!609244 (=> res!391804 e!348918)))

(declare-fun noDuplicate!336 (List!11954) Bool)

(assert (=> b!609244 (= res!391804 (not (noDuplicate!336 Nil!11951)))))

(declare-fun b!609245 () Bool)

(declare-fun e!348929 () Bool)

(declare-fun e!348923 () Bool)

(assert (=> b!609245 (= e!348929 e!348923)))

(declare-fun res!391800 () Bool)

(assert (=> b!609245 (=> (not res!391800) (not e!348923))))

(declare-fun lt!278468 () array!37325)

(declare-fun arrayContainsKey!0 (array!37325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609245 (= res!391800 (arrayContainsKey!0 lt!278468 (select (arr!17913 a!2986) j!136) j!136))))

(declare-fun b!609246 () Bool)

(declare-datatypes ((Unit!19498 0))(
  ( (Unit!19499) )
))
(declare-fun e!348926 () Unit!19498)

(declare-fun Unit!19500 () Unit!19498)

(assert (=> b!609246 (= e!348926 Unit!19500)))

(assert (=> b!609246 false))

(declare-fun b!609247 () Bool)

(declare-fun res!391796 () Bool)

(declare-fun e!348933 () Bool)

(assert (=> b!609247 (=> (not res!391796) (not e!348933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609247 (= res!391796 (validKeyInArray!0 (select (arr!17913 a!2986) j!136)))))

(declare-fun b!609248 () Bool)

(declare-fun res!391811 () Bool)

(assert (=> b!609248 (=> res!391811 e!348918)))

(assert (=> b!609248 (= res!391811 (contains!3030 Nil!11951 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609249 () Bool)

(declare-fun res!391793 () Bool)

(assert (=> b!609249 (=> (not res!391793) (not e!348931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37325 (_ BitVec 32)) Bool)

(assert (=> b!609249 (= res!391793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609250 () Bool)

(declare-fun res!391798 () Bool)

(assert (=> b!609250 (=> (not res!391798) (not e!348933))))

(assert (=> b!609250 (= res!391798 (validKeyInArray!0 k!1786))))

(declare-fun b!609251 () Bool)

(declare-fun e!348932 () Bool)

(declare-fun lt!278461 () SeekEntryResult!6353)

(assert (=> b!609251 (= e!348932 (= lt!278463 lt!278461))))

(declare-fun b!609252 () Bool)

(declare-fun e!348921 () Bool)

(assert (=> b!609252 (= e!348921 e!348918)))

(declare-fun res!391806 () Bool)

(assert (=> b!609252 (=> res!391806 e!348918)))

(assert (=> b!609252 (= res!391806 (or (bvsge (size!18277 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18277 a!2986))))))

(assert (=> b!609252 (arrayContainsKey!0 lt!278468 (select (arr!17913 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278466 () Unit!19498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19498)

(assert (=> b!609252 (= lt!278466 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278468 (select (arr!17913 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348922 () Bool)

(assert (=> b!609252 e!348922))

(declare-fun res!391794 () Bool)

(assert (=> b!609252 (=> (not res!391794) (not e!348922))))

(assert (=> b!609252 (= res!391794 (arrayContainsKey!0 lt!278468 (select (arr!17913 a!2986) j!136) j!136))))

(declare-fun b!609253 () Bool)

(declare-fun e!348927 () Bool)

(assert (=> b!609253 (= e!348928 (not e!348927))))

(declare-fun res!391801 () Bool)

(assert (=> b!609253 (=> res!391801 e!348927)))

(declare-fun lt!278462 () SeekEntryResult!6353)

(assert (=> b!609253 (= res!391801 (not (= lt!278462 (Found!6353 index!984))))))

(declare-fun lt!278465 () Unit!19498)

(assert (=> b!609253 (= lt!278465 e!348926)))

(declare-fun c!69091 () Bool)

(assert (=> b!609253 (= c!69091 (= lt!278462 Undefined!6353))))

(declare-fun lt!278460 () (_ BitVec 64))

(assert (=> b!609253 (= lt!278462 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278460 lt!278468 mask!3053))))

(assert (=> b!609253 e!348932))

(declare-fun res!391805 () Bool)

(assert (=> b!609253 (=> (not res!391805) (not e!348932))))

(declare-fun lt!278464 () (_ BitVec 32))

(assert (=> b!609253 (= res!391805 (= lt!278461 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278464 vacantSpotIndex!68 lt!278460 lt!278468 mask!3053)))))

(assert (=> b!609253 (= lt!278461 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278464 vacantSpotIndex!68 (select (arr!17913 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!609253 (= lt!278460 (select (store (arr!17913 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278467 () Unit!19498)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19498)

(assert (=> b!609253 (= lt!278467 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278464 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609253 (= lt!278464 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609254 () Bool)

(assert (=> b!609254 (= e!348923 (arrayContainsKey!0 lt!278468 (select (arr!17913 a!2986) j!136) index!984))))

(declare-fun b!609255 () Bool)

(declare-fun res!391808 () Bool)

(assert (=> b!609255 (=> (not res!391808) (not e!348933))))

(assert (=> b!609255 (= res!391808 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609243 () Bool)

(declare-fun e!348930 () Bool)

(assert (=> b!609243 (= e!348927 e!348930)))

(declare-fun res!391799 () Bool)

(assert (=> b!609243 (=> res!391799 e!348930)))

(declare-fun lt!278457 () (_ BitVec 64))

(assert (=> b!609243 (= res!391799 (or (not (= (select (arr!17913 a!2986) j!136) lt!278460)) (not (= (select (arr!17913 a!2986) j!136) lt!278457))))))

(declare-fun e!348924 () Bool)

(assert (=> b!609243 e!348924))

(declare-fun res!391814 () Bool)

(assert (=> b!609243 (=> (not res!391814) (not e!348924))))

(assert (=> b!609243 (= res!391814 (= lt!278457 (select (arr!17913 a!2986) j!136)))))

(assert (=> b!609243 (= lt!278457 (select (store (arr!17913 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!391803 () Bool)

(assert (=> start!55594 (=> (not res!391803) (not e!348933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55594 (= res!391803 (validMask!0 mask!3053))))

(assert (=> start!55594 e!348933))

(assert (=> start!55594 true))

(declare-fun array_inv!13709 (array!37325) Bool)

(assert (=> start!55594 (array_inv!13709 a!2986)))

(declare-fun b!609256 () Bool)

(assert (=> b!609256 (= e!348924 e!348929)))

(declare-fun res!391797 () Bool)

(assert (=> b!609256 (=> res!391797 e!348929)))

(assert (=> b!609256 (= res!391797 (or (not (= (select (arr!17913 a!2986) j!136) lt!278460)) (not (= (select (arr!17913 a!2986) j!136) lt!278457)) (bvsge j!136 index!984)))))

(declare-fun b!609257 () Bool)

(declare-fun e!348920 () Unit!19498)

(declare-fun Unit!19501 () Unit!19498)

(assert (=> b!609257 (= e!348920 Unit!19501)))

(declare-fun lt!278470 () Unit!19498)

(assert (=> b!609257 (= lt!278470 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278468 (select (arr!17913 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609257 (arrayContainsKey!0 lt!278468 (select (arr!17913 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278469 () Unit!19498)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11954) Unit!19498)

(assert (=> b!609257 (= lt!278469 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11951))))

(assert (=> b!609257 (arrayNoDuplicates!0 lt!278468 #b00000000000000000000000000000000 Nil!11951)))

(declare-fun lt!278473 () Unit!19498)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37325 (_ BitVec 32) (_ BitVec 32)) Unit!19498)

(assert (=> b!609257 (= lt!278473 (lemmaNoDuplicateFromThenFromBigger!0 lt!278468 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609257 (arrayNoDuplicates!0 lt!278468 j!136 Nil!11951)))

(declare-fun lt!278458 () Unit!19498)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37325 (_ BitVec 64) (_ BitVec 32) List!11954) Unit!19498)

(assert (=> b!609257 (= lt!278458 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278468 (select (arr!17913 a!2986) j!136) j!136 Nil!11951))))

(assert (=> b!609257 false))

(declare-fun b!609258 () Bool)

(declare-fun Unit!19502 () Unit!19498)

(assert (=> b!609258 (= e!348926 Unit!19502)))

(declare-fun b!609259 () Bool)

(assert (=> b!609259 (= e!348931 e!348919)))

(declare-fun res!391792 () Bool)

(assert (=> b!609259 (=> (not res!391792) (not e!348919))))

(assert (=> b!609259 (= res!391792 (= (select (store (arr!17913 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609259 (= lt!278468 (array!37326 (store (arr!17913 a!2986) i!1108 k!1786) (size!18277 a!2986)))))

(declare-fun b!609260 () Bool)

(declare-fun res!391813 () Bool)

(assert (=> b!609260 (=> (not res!391813) (not e!348933))))

(assert (=> b!609260 (= res!391813 (and (= (size!18277 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18277 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18277 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609261 () Bool)

(declare-fun res!391812 () Bool)

(assert (=> b!609261 (=> (not res!391812) (not e!348931))))

(assert (=> b!609261 (= res!391812 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17913 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609262 () Bool)

(declare-fun Unit!19503 () Unit!19498)

(assert (=> b!609262 (= e!348920 Unit!19503)))

(declare-fun b!609263 () Bool)

(assert (=> b!609263 (= e!348922 (arrayContainsKey!0 lt!278468 (select (arr!17913 a!2986) j!136) index!984))))

(declare-fun b!609264 () Bool)

(assert (=> b!609264 (= e!348930 e!348921)))

(declare-fun res!391807 () Bool)

(assert (=> b!609264 (=> res!391807 e!348921)))

(assert (=> b!609264 (= res!391807 (bvsge index!984 j!136))))

(declare-fun lt!278471 () Unit!19498)

(assert (=> b!609264 (= lt!278471 e!348920)))

(declare-fun c!69092 () Bool)

(assert (=> b!609264 (= c!69092 (bvslt j!136 index!984))))

(declare-fun b!609265 () Bool)

(declare-fun res!391809 () Bool)

(assert (=> b!609265 (=> res!391809 e!348918)))

(assert (=> b!609265 (= res!391809 (contains!3030 Nil!11951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609266 () Bool)

(assert (=> b!609266 (= e!348933 e!348931)))

(declare-fun res!391810 () Bool)

(assert (=> b!609266 (=> (not res!391810) (not e!348931))))

(declare-fun lt!278472 () SeekEntryResult!6353)

(assert (=> b!609266 (= res!391810 (or (= lt!278472 (MissingZero!6353 i!1108)) (= lt!278472 (MissingVacant!6353 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37325 (_ BitVec 32)) SeekEntryResult!6353)

(assert (=> b!609266 (= lt!278472 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!55594 res!391803) b!609260))

(assert (= (and b!609260 res!391813) b!609247))

(assert (= (and b!609247 res!391796) b!609250))

(assert (= (and b!609250 res!391798) b!609255))

(assert (= (and b!609255 res!391808) b!609266))

(assert (= (and b!609266 res!391810) b!609249))

(assert (= (and b!609249 res!391793) b!609242))

(assert (= (and b!609242 res!391802) b!609261))

(assert (= (and b!609261 res!391812) b!609259))

(assert (= (and b!609259 res!391792) b!609240))

(assert (= (and b!609240 res!391795) b!609253))

(assert (= (and b!609253 res!391805) b!609251))

(assert (= (and b!609253 c!69091) b!609246))

(assert (= (and b!609253 (not c!69091)) b!609258))

(assert (= (and b!609253 (not res!391801)) b!609243))

(assert (= (and b!609243 res!391814) b!609256))

(assert (= (and b!609256 (not res!391797)) b!609245))

(assert (= (and b!609245 res!391800) b!609254))

(assert (= (and b!609243 (not res!391799)) b!609264))

(assert (= (and b!609264 c!69092) b!609257))

(assert (= (and b!609264 (not c!69092)) b!609262))

(assert (= (and b!609264 (not res!391807)) b!609252))

(assert (= (and b!609252 res!391794) b!609263))

(assert (= (and b!609252 (not res!391806)) b!609244))

(assert (= (and b!609244 (not res!391804)) b!609265))

(assert (= (and b!609265 (not res!391809)) b!609248))

(assert (= (and b!609248 (not res!391811)) b!609241))

(declare-fun m!585779 () Bool)

(assert (=> b!609255 m!585779))

(declare-fun m!585781 () Bool)

(assert (=> start!55594 m!585781))

(declare-fun m!585783 () Bool)

(assert (=> start!55594 m!585783))

(declare-fun m!585785 () Bool)

(assert (=> b!609259 m!585785))

(declare-fun m!585787 () Bool)

(assert (=> b!609259 m!585787))

(declare-fun m!585789 () Bool)

(assert (=> b!609252 m!585789))

(assert (=> b!609252 m!585789))

(declare-fun m!585791 () Bool)

(assert (=> b!609252 m!585791))

(assert (=> b!609252 m!585789))

(declare-fun m!585793 () Bool)

(assert (=> b!609252 m!585793))

(assert (=> b!609252 m!585789))

(declare-fun m!585795 () Bool)

(assert (=> b!609252 m!585795))

(declare-fun m!585797 () Bool)

(assert (=> b!609241 m!585797))

(assert (=> b!609245 m!585789))

(assert (=> b!609245 m!585789))

(assert (=> b!609245 m!585795))

(assert (=> b!609243 m!585789))

(assert (=> b!609243 m!585785))

(declare-fun m!585799 () Bool)

(assert (=> b!609243 m!585799))

(assert (=> b!609256 m!585789))

(declare-fun m!585801 () Bool)

(assert (=> b!609253 m!585801))

(declare-fun m!585803 () Bool)

(assert (=> b!609253 m!585803))

(declare-fun m!585805 () Bool)

(assert (=> b!609253 m!585805))

(assert (=> b!609253 m!585789))

(declare-fun m!585807 () Bool)

(assert (=> b!609253 m!585807))

(assert (=> b!609253 m!585785))

(declare-fun m!585809 () Bool)

(assert (=> b!609253 m!585809))

(assert (=> b!609253 m!585789))

(declare-fun m!585811 () Bool)

(assert (=> b!609253 m!585811))

(declare-fun m!585813 () Bool)

(assert (=> b!609240 m!585813))

(assert (=> b!609240 m!585789))

(assert (=> b!609240 m!585789))

(declare-fun m!585815 () Bool)

(assert (=> b!609240 m!585815))

(declare-fun m!585817 () Bool)

(assert (=> b!609257 m!585817))

(assert (=> b!609257 m!585789))

(declare-fun m!585819 () Bool)

(assert (=> b!609257 m!585819))

(assert (=> b!609257 m!585789))

(declare-fun m!585821 () Bool)

(assert (=> b!609257 m!585821))

(declare-fun m!585823 () Bool)

(assert (=> b!609257 m!585823))

(declare-fun m!585825 () Bool)

(assert (=> b!609257 m!585825))

(assert (=> b!609257 m!585789))

(declare-fun m!585827 () Bool)

(assert (=> b!609257 m!585827))

(assert (=> b!609257 m!585789))

(declare-fun m!585829 () Bool)

(assert (=> b!609257 m!585829))

(declare-fun m!585831 () Bool)

(assert (=> b!609249 m!585831))

(declare-fun m!585833 () Bool)

(assert (=> b!609261 m!585833))

(declare-fun m!585835 () Bool)

(assert (=> b!609244 m!585835))

(declare-fun m!585837 () Bool)

(assert (=> b!609265 m!585837))

(declare-fun m!585839 () Bool)

(assert (=> b!609242 m!585839))

(assert (=> b!609247 m!585789))

(assert (=> b!609247 m!585789))

(declare-fun m!585841 () Bool)

(assert (=> b!609247 m!585841))

(declare-fun m!585843 () Bool)

(assert (=> b!609266 m!585843))

(declare-fun m!585845 () Bool)

(assert (=> b!609248 m!585845))

(declare-fun m!585847 () Bool)

(assert (=> b!609250 m!585847))

(assert (=> b!609254 m!585789))

(assert (=> b!609254 m!585789))

(declare-fun m!585849 () Bool)

(assert (=> b!609254 m!585849))

(assert (=> b!609263 m!585789))

(assert (=> b!609263 m!585789))

(assert (=> b!609263 m!585849))

(push 1)

