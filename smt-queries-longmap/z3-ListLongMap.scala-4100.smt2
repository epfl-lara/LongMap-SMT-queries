; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56082 () Bool)

(assert start!56082)

(declare-fun b!618727 () Bool)

(declare-datatypes ((Unit!20406 0))(
  ( (Unit!20407) )
))
(declare-fun e!354821 () Unit!20406)

(declare-fun Unit!20408 () Unit!20406)

(assert (=> b!618727 (= e!354821 Unit!20408)))

(declare-fun b!618728 () Bool)

(declare-fun e!354824 () Bool)

(declare-datatypes ((SeekEntryResult!6466 0))(
  ( (MissingZero!6466 (index!28148 (_ BitVec 32))) (Found!6466 (index!28149 (_ BitVec 32))) (Intermediate!6466 (undefined!7278 Bool) (index!28150 (_ BitVec 32)) (x!56941 (_ BitVec 32))) (Undefined!6466) (MissingVacant!6466 (index!28151 (_ BitVec 32))) )
))
(declare-fun lt!285338 () SeekEntryResult!6466)

(declare-fun lt!285326 () SeekEntryResult!6466)

(assert (=> b!618728 (= e!354824 (= lt!285338 lt!285326))))

(declare-fun b!618729 () Bool)

(declare-fun e!354817 () Bool)

(declare-fun e!354816 () Bool)

(assert (=> b!618729 (= e!354817 (not e!354816))))

(declare-fun res!398704 () Bool)

(assert (=> b!618729 (=> res!398704 e!354816)))

(declare-fun lt!285327 () SeekEntryResult!6466)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618729 (= res!398704 (not (= lt!285327 (MissingVacant!6466 vacantSpotIndex!68))))))

(declare-fun lt!285328 () Unit!20406)

(declare-fun e!354828 () Unit!20406)

(assert (=> b!618729 (= lt!285328 e!354828)))

(declare-fun c!70385 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!618729 (= c!70385 (= lt!285327 (Found!6466 index!984)))))

(declare-fun lt!285336 () Unit!20406)

(declare-fun e!354814 () Unit!20406)

(assert (=> b!618729 (= lt!285336 e!354814)))

(declare-fun c!70384 () Bool)

(assert (=> b!618729 (= c!70384 (= lt!285327 Undefined!6466))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37566 0))(
  ( (array!37567 (arr!18029 (Array (_ BitVec 32) (_ BitVec 64))) (size!18394 (_ BitVec 32))) )
))
(declare-fun lt!285325 () array!37566)

(declare-fun lt!285340 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37566 (_ BitVec 32)) SeekEntryResult!6466)

(assert (=> b!618729 (= lt!285327 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285340 lt!285325 mask!3053))))

(assert (=> b!618729 e!354824))

(declare-fun res!398701 () Bool)

(assert (=> b!618729 (=> (not res!398701) (not e!354824))))

(declare-fun lt!285332 () (_ BitVec 32))

(assert (=> b!618729 (= res!398701 (= lt!285326 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285332 vacantSpotIndex!68 lt!285340 lt!285325 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37566)

(assert (=> b!618729 (= lt!285326 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285332 vacantSpotIndex!68 (select (arr!18029 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!618729 (= lt!285340 (select (store (arr!18029 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285331 () Unit!20406)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37566 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20406)

(assert (=> b!618729 (= lt!285331 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285332 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618729 (= lt!285332 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618730 () Bool)

(declare-fun res!398696 () Bool)

(declare-fun e!354826 () Bool)

(assert (=> b!618730 (=> (not res!398696) (not e!354826))))

(declare-fun arrayContainsKey!0 (array!37566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618730 (= res!398696 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618731 () Bool)

(declare-fun res!398700 () Bool)

(assert (=> b!618731 (=> (not res!398700) (not e!354826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618731 (= res!398700 (validKeyInArray!0 k0!1786))))

(declare-fun b!618732 () Bool)

(declare-fun res!398711 () Bool)

(assert (=> b!618732 (= res!398711 (bvsge j!136 index!984))))

(declare-fun e!354825 () Bool)

(assert (=> b!618732 (=> res!398711 e!354825)))

(declare-fun e!354820 () Bool)

(assert (=> b!618732 (= e!354820 e!354825)))

(declare-fun b!618733 () Bool)

(declare-fun res!398708 () Bool)

(declare-fun e!354818 () Bool)

(assert (=> b!618733 (=> (not res!398708) (not e!354818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37566 (_ BitVec 32)) Bool)

(assert (=> b!618733 (= res!398708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618734 () Bool)

(declare-fun res!398710 () Bool)

(assert (=> b!618734 (=> (not res!398710) (not e!354826))))

(assert (=> b!618734 (= res!398710 (and (= (size!18394 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18394 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18394 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618735 () Bool)

(assert (=> b!618735 false))

(declare-fun lt!285342 () Unit!20406)

(declare-datatypes ((List!12109 0))(
  ( (Nil!12106) (Cons!12105 (h!13150 (_ BitVec 64)) (t!18328 List!12109)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37566 (_ BitVec 64) (_ BitVec 32) List!12109) Unit!20406)

(assert (=> b!618735 (= lt!285342 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285325 (select (arr!18029 a!2986) j!136) index!984 Nil!12106))))

(declare-fun arrayNoDuplicates!0 (array!37566 (_ BitVec 32) List!12109) Bool)

(assert (=> b!618735 (arrayNoDuplicates!0 lt!285325 index!984 Nil!12106)))

(declare-fun lt!285343 () Unit!20406)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37566 (_ BitVec 32) (_ BitVec 32)) Unit!20406)

(assert (=> b!618735 (= lt!285343 (lemmaNoDuplicateFromThenFromBigger!0 lt!285325 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618735 (arrayNoDuplicates!0 lt!285325 #b00000000000000000000000000000000 Nil!12106)))

(declare-fun lt!285333 () Unit!20406)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37566 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12109) Unit!20406)

(assert (=> b!618735 (= lt!285333 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12106))))

(assert (=> b!618735 (arrayContainsKey!0 lt!285325 (select (arr!18029 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285335 () Unit!20406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37566 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20406)

(assert (=> b!618735 (= lt!285335 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285325 (select (arr!18029 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354815 () Bool)

(assert (=> b!618735 e!354815))

(declare-fun res!398703 () Bool)

(assert (=> b!618735 (=> (not res!398703) (not e!354815))))

(assert (=> b!618735 (= res!398703 (arrayContainsKey!0 lt!285325 (select (arr!18029 a!2986) j!136) j!136))))

(declare-fun Unit!20409 () Unit!20406)

(assert (=> b!618735 (= e!354821 Unit!20409)))

(declare-fun b!618736 () Bool)

(assert (=> b!618736 (= e!354816 true)))

(assert (=> b!618736 (= (select (store (arr!18029 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618737 () Bool)

(declare-fun Unit!20410 () Unit!20406)

(assert (=> b!618737 (= e!354814 Unit!20410)))

(assert (=> b!618737 false))

(declare-fun b!618738 () Bool)

(declare-fun e!354823 () Bool)

(assert (=> b!618738 (= e!354823 e!354817)))

(declare-fun res!398702 () Bool)

(assert (=> b!618738 (=> (not res!398702) (not e!354817))))

(assert (=> b!618738 (= res!398702 (and (= lt!285338 (Found!6466 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18029 a!2986) index!984) (select (arr!18029 a!2986) j!136))) (not (= (select (arr!18029 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618738 (= lt!285338 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18029 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618739 () Bool)

(declare-fun Unit!20411 () Unit!20406)

(assert (=> b!618739 (= e!354828 Unit!20411)))

(declare-fun res!398699 () Bool)

(assert (=> b!618739 (= res!398699 (= (select (store (arr!18029 a!2986) i!1108 k0!1786) index!984) (select (arr!18029 a!2986) j!136)))))

(assert (=> b!618739 (=> (not res!398699) (not e!354820))))

(assert (=> b!618739 e!354820))

(declare-fun c!70386 () Bool)

(assert (=> b!618739 (= c!70386 (bvslt j!136 index!984))))

(declare-fun lt!285339 () Unit!20406)

(declare-fun e!354819 () Unit!20406)

(assert (=> b!618739 (= lt!285339 e!354819)))

(declare-fun c!70383 () Bool)

(assert (=> b!618739 (= c!70383 (bvslt index!984 j!136))))

(declare-fun lt!285330 () Unit!20406)

(assert (=> b!618739 (= lt!285330 e!354821)))

(assert (=> b!618739 false))

(declare-fun b!618740 () Bool)

(declare-fun Unit!20412 () Unit!20406)

(assert (=> b!618740 (= e!354819 Unit!20412)))

(declare-fun b!618741 () Bool)

(assert (=> b!618741 (= e!354815 (arrayContainsKey!0 lt!285325 (select (arr!18029 a!2986) j!136) index!984))))

(declare-fun b!618742 () Bool)

(assert (=> b!618742 false))

(declare-fun lt!285334 () Unit!20406)

(assert (=> b!618742 (= lt!285334 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285325 (select (arr!18029 a!2986) j!136) j!136 Nil!12106))))

(assert (=> b!618742 (arrayNoDuplicates!0 lt!285325 j!136 Nil!12106)))

(declare-fun lt!285341 () Unit!20406)

(assert (=> b!618742 (= lt!285341 (lemmaNoDuplicateFromThenFromBigger!0 lt!285325 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618742 (arrayNoDuplicates!0 lt!285325 #b00000000000000000000000000000000 Nil!12106)))

(declare-fun lt!285329 () Unit!20406)

(assert (=> b!618742 (= lt!285329 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12106))))

(assert (=> b!618742 (arrayContainsKey!0 lt!285325 (select (arr!18029 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285324 () Unit!20406)

(assert (=> b!618742 (= lt!285324 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285325 (select (arr!18029 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20413 () Unit!20406)

(assert (=> b!618742 (= e!354819 Unit!20413)))

(declare-fun b!618743 () Bool)

(declare-fun Unit!20414 () Unit!20406)

(assert (=> b!618743 (= e!354814 Unit!20414)))

(declare-fun res!398707 () Bool)

(declare-fun b!618744 () Bool)

(assert (=> b!618744 (= res!398707 (arrayContainsKey!0 lt!285325 (select (arr!18029 a!2986) j!136) j!136))))

(declare-fun e!354827 () Bool)

(assert (=> b!618744 (=> (not res!398707) (not e!354827))))

(assert (=> b!618744 (= e!354825 e!354827)))

(declare-fun b!618745 () Bool)

(declare-fun res!398695 () Bool)

(assert (=> b!618745 (=> (not res!398695) (not e!354826))))

(assert (=> b!618745 (= res!398695 (validKeyInArray!0 (select (arr!18029 a!2986) j!136)))))

(declare-fun b!618746 () Bool)

(assert (=> b!618746 (= e!354827 (arrayContainsKey!0 lt!285325 (select (arr!18029 a!2986) j!136) index!984))))

(declare-fun b!618747 () Bool)

(declare-fun Unit!20415 () Unit!20406)

(assert (=> b!618747 (= e!354828 Unit!20415)))

(declare-fun b!618748 () Bool)

(declare-fun res!398698 () Bool)

(assert (=> b!618748 (=> (not res!398698) (not e!354818))))

(assert (=> b!618748 (= res!398698 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18029 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!398706 () Bool)

(assert (=> start!56082 (=> (not res!398706) (not e!354826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56082 (= res!398706 (validMask!0 mask!3053))))

(assert (=> start!56082 e!354826))

(assert (=> start!56082 true))

(declare-fun array_inv!13912 (array!37566) Bool)

(assert (=> start!56082 (array_inv!13912 a!2986)))

(declare-fun b!618749 () Bool)

(assert (=> b!618749 (= e!354826 e!354818)))

(declare-fun res!398697 () Bool)

(assert (=> b!618749 (=> (not res!398697) (not e!354818))))

(declare-fun lt!285337 () SeekEntryResult!6466)

(assert (=> b!618749 (= res!398697 (or (= lt!285337 (MissingZero!6466 i!1108)) (= lt!285337 (MissingVacant!6466 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37566 (_ BitVec 32)) SeekEntryResult!6466)

(assert (=> b!618749 (= lt!285337 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618750 () Bool)

(assert (=> b!618750 (= e!354818 e!354823)))

(declare-fun res!398709 () Bool)

(assert (=> b!618750 (=> (not res!398709) (not e!354823))))

(assert (=> b!618750 (= res!398709 (= (select (store (arr!18029 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618750 (= lt!285325 (array!37567 (store (arr!18029 a!2986) i!1108 k0!1786) (size!18394 a!2986)))))

(declare-fun b!618751 () Bool)

(declare-fun res!398705 () Bool)

(assert (=> b!618751 (=> (not res!398705) (not e!354818))))

(assert (=> b!618751 (= res!398705 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12106))))

(assert (= (and start!56082 res!398706) b!618734))

(assert (= (and b!618734 res!398710) b!618745))

(assert (= (and b!618745 res!398695) b!618731))

(assert (= (and b!618731 res!398700) b!618730))

(assert (= (and b!618730 res!398696) b!618749))

(assert (= (and b!618749 res!398697) b!618733))

(assert (= (and b!618733 res!398708) b!618751))

(assert (= (and b!618751 res!398705) b!618748))

(assert (= (and b!618748 res!398698) b!618750))

(assert (= (and b!618750 res!398709) b!618738))

(assert (= (and b!618738 res!398702) b!618729))

(assert (= (and b!618729 res!398701) b!618728))

(assert (= (and b!618729 c!70384) b!618737))

(assert (= (and b!618729 (not c!70384)) b!618743))

(assert (= (and b!618729 c!70385) b!618739))

(assert (= (and b!618729 (not c!70385)) b!618747))

(assert (= (and b!618739 res!398699) b!618732))

(assert (= (and b!618732 (not res!398711)) b!618744))

(assert (= (and b!618744 res!398707) b!618746))

(assert (= (and b!618739 c!70386) b!618742))

(assert (= (and b!618739 (not c!70386)) b!618740))

(assert (= (and b!618739 c!70383) b!618735))

(assert (= (and b!618739 (not c!70383)) b!618727))

(assert (= (and b!618735 res!398703) b!618741))

(assert (= (and b!618729 (not res!398704)) b!618736))

(declare-fun m!594229 () Bool)

(assert (=> b!618738 m!594229))

(declare-fun m!594231 () Bool)

(assert (=> b!618738 m!594231))

(assert (=> b!618738 m!594231))

(declare-fun m!594233 () Bool)

(assert (=> b!618738 m!594233))

(assert (=> b!618742 m!594231))

(declare-fun m!594235 () Bool)

(assert (=> b!618742 m!594235))

(assert (=> b!618742 m!594231))

(declare-fun m!594237 () Bool)

(assert (=> b!618742 m!594237))

(assert (=> b!618742 m!594231))

(declare-fun m!594239 () Bool)

(assert (=> b!618742 m!594239))

(declare-fun m!594241 () Bool)

(assert (=> b!618742 m!594241))

(declare-fun m!594243 () Bool)

(assert (=> b!618742 m!594243))

(assert (=> b!618742 m!594231))

(declare-fun m!594245 () Bool)

(assert (=> b!618742 m!594245))

(declare-fun m!594247 () Bool)

(assert (=> b!618742 m!594247))

(declare-fun m!594249 () Bool)

(assert (=> b!618750 m!594249))

(declare-fun m!594251 () Bool)

(assert (=> b!618750 m!594251))

(declare-fun m!594253 () Bool)

(assert (=> b!618733 m!594253))

(assert (=> b!618735 m!594231))

(declare-fun m!594255 () Bool)

(assert (=> b!618735 m!594255))

(assert (=> b!618735 m!594231))

(declare-fun m!594257 () Bool)

(assert (=> b!618735 m!594257))

(assert (=> b!618735 m!594231))

(declare-fun m!594259 () Bool)

(assert (=> b!618735 m!594259))

(declare-fun m!594261 () Bool)

(assert (=> b!618735 m!594261))

(assert (=> b!618735 m!594231))

(declare-fun m!594263 () Bool)

(assert (=> b!618735 m!594263))

(assert (=> b!618735 m!594243))

(assert (=> b!618735 m!594241))

(assert (=> b!618735 m!594231))

(declare-fun m!594265 () Bool)

(assert (=> b!618735 m!594265))

(assert (=> b!618745 m!594231))

(assert (=> b!618745 m!594231))

(declare-fun m!594267 () Bool)

(assert (=> b!618745 m!594267))

(declare-fun m!594269 () Bool)

(assert (=> b!618730 m!594269))

(assert (=> b!618746 m!594231))

(assert (=> b!618746 m!594231))

(declare-fun m!594271 () Bool)

(assert (=> b!618746 m!594271))

(declare-fun m!594273 () Bool)

(assert (=> b!618748 m!594273))

(assert (=> b!618741 m!594231))

(assert (=> b!618741 m!594231))

(assert (=> b!618741 m!594271))

(declare-fun m!594275 () Bool)

(assert (=> b!618729 m!594275))

(declare-fun m!594277 () Bool)

(assert (=> b!618729 m!594277))

(declare-fun m!594279 () Bool)

(assert (=> b!618729 m!594279))

(assert (=> b!618729 m!594231))

(assert (=> b!618729 m!594249))

(declare-fun m!594281 () Bool)

(assert (=> b!618729 m!594281))

(assert (=> b!618729 m!594231))

(declare-fun m!594283 () Bool)

(assert (=> b!618729 m!594283))

(declare-fun m!594285 () Bool)

(assert (=> b!618729 m!594285))

(declare-fun m!594287 () Bool)

(assert (=> b!618749 m!594287))

(assert (=> b!618739 m!594249))

(declare-fun m!594289 () Bool)

(assert (=> b!618739 m!594289))

(assert (=> b!618739 m!594231))

(declare-fun m!594291 () Bool)

(assert (=> start!56082 m!594291))

(declare-fun m!594293 () Bool)

(assert (=> start!56082 m!594293))

(assert (=> b!618744 m!594231))

(assert (=> b!618744 m!594231))

(assert (=> b!618744 m!594265))

(assert (=> b!618736 m!594249))

(assert (=> b!618736 m!594289))

(declare-fun m!594295 () Bool)

(assert (=> b!618751 m!594295))

(declare-fun m!594297 () Bool)

(assert (=> b!618731 m!594297))

(check-sat (not b!618735) (not b!618742) (not b!618738) (not b!618733) (not b!618745) (not start!56082) (not b!618746) (not b!618749) (not b!618741) (not b!618730) (not b!618731) (not b!618729) (not b!618751) (not b!618744))
(check-sat)
