; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55950 () Bool)

(assert start!55950)

(declare-fun b!613815 () Bool)

(declare-datatypes ((Unit!19782 0))(
  ( (Unit!19783) )
))
(declare-fun e!351882 () Unit!19782)

(declare-fun Unit!19784 () Unit!19782)

(assert (=> b!613815 (= e!351882 Unit!19784)))

(declare-fun b!613816 () Bool)

(declare-fun e!351889 () Bool)

(declare-fun e!351894 () Bool)

(assert (=> b!613816 (= e!351889 e!351894)))

(declare-fun res!395288 () Bool)

(assert (=> b!613816 (=> res!395288 e!351894)))

(declare-datatypes ((array!37434 0))(
  ( (array!37435 (arr!17963 (Array (_ BitVec 32) (_ BitVec 64))) (size!18328 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37434)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!613816 (= res!395288 (or (bvsge (size!18328 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18328 a!2986)) (bvsge index!984 (size!18328 a!2986))))))

(declare-fun lt!281400 () array!37434)

(declare-datatypes ((List!12043 0))(
  ( (Nil!12040) (Cons!12039 (h!13084 (_ BitVec 64)) (t!18262 List!12043)) )
))
(declare-fun arrayNoDuplicates!0 (array!37434 (_ BitVec 32) List!12043) Bool)

(assert (=> b!613816 (arrayNoDuplicates!0 lt!281400 index!984 Nil!12040)))

(declare-fun lt!281406 () Unit!19782)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37434 (_ BitVec 32) (_ BitVec 32)) Unit!19782)

(assert (=> b!613816 (= lt!281406 (lemmaNoDuplicateFromThenFromBigger!0 lt!281400 #b00000000000000000000000000000000 index!984))))

(assert (=> b!613816 (arrayNoDuplicates!0 lt!281400 #b00000000000000000000000000000000 Nil!12040)))

(declare-fun lt!281396 () Unit!19782)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37434 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12043) Unit!19782)

(assert (=> b!613816 (= lt!281396 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12040))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!613816 (arrayContainsKey!0 lt!281400 (select (arr!17963 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281403 () Unit!19782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37434 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19782)

(assert (=> b!613816 (= lt!281403 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281400 (select (arr!17963 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351887 () Bool)

(assert (=> b!613816 e!351887))

(declare-fun res!395274 () Bool)

(assert (=> b!613816 (=> (not res!395274) (not e!351887))))

(assert (=> b!613816 (= res!395274 (arrayContainsKey!0 lt!281400 (select (arr!17963 a!2986) j!136) j!136))))

(declare-fun b!613817 () Bool)

(declare-fun e!351884 () Bool)

(assert (=> b!613817 (= e!351884 (arrayContainsKey!0 lt!281400 (select (arr!17963 a!2986) j!136) index!984))))

(declare-fun res!395285 () Bool)

(declare-fun e!351888 () Bool)

(assert (=> start!55950 (=> (not res!395285) (not e!351888))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55950 (= res!395285 (validMask!0 mask!3053))))

(assert (=> start!55950 e!351888))

(assert (=> start!55950 true))

(declare-fun array_inv!13846 (array!37434) Bool)

(assert (=> start!55950 (array_inv!13846 a!2986)))

(declare-fun b!613818 () Bool)

(declare-fun res!395282 () Bool)

(assert (=> b!613818 (=> res!395282 e!351894)))

(declare-fun noDuplicate!371 (List!12043) Bool)

(assert (=> b!613818 (= res!395282 (not (noDuplicate!371 Nil!12040)))))

(declare-fun b!613819 () Bool)

(declare-fun Unit!19785 () Unit!19782)

(assert (=> b!613819 (= e!351882 Unit!19785)))

(assert (=> b!613819 false))

(declare-fun b!613820 () Bool)

(declare-fun e!351892 () Bool)

(assert (=> b!613820 (= e!351892 e!351884)))

(declare-fun res!395268 () Bool)

(assert (=> b!613820 (=> (not res!395268) (not e!351884))))

(assert (=> b!613820 (= res!395268 (arrayContainsKey!0 lt!281400 (select (arr!17963 a!2986) j!136) j!136))))

(declare-fun b!613821 () Bool)

(declare-fun e!351896 () Bool)

(declare-fun e!351883 () Bool)

(assert (=> b!613821 (= e!351896 e!351883)))

(declare-fun res!395287 () Bool)

(assert (=> b!613821 (=> res!395287 e!351883)))

(declare-fun lt!281398 () (_ BitVec 64))

(declare-fun lt!281399 () (_ BitVec 64))

(assert (=> b!613821 (= res!395287 (or (not (= (select (arr!17963 a!2986) j!136) lt!281399)) (not (= (select (arr!17963 a!2986) j!136) lt!281398))))))

(declare-fun e!351886 () Bool)

(assert (=> b!613821 e!351886))

(declare-fun res!395281 () Bool)

(assert (=> b!613821 (=> (not res!395281) (not e!351886))))

(assert (=> b!613821 (= res!395281 (= lt!281398 (select (arr!17963 a!2986) j!136)))))

(assert (=> b!613821 (= lt!281398 (select (store (arr!17963 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!613822 () Bool)

(declare-fun res!395278 () Bool)

(assert (=> b!613822 (=> res!395278 e!351894)))

(declare-fun contains!3047 (List!12043 (_ BitVec 64)) Bool)

(assert (=> b!613822 (= res!395278 (contains!3047 Nil!12040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613823 () Bool)

(assert (=> b!613823 (= e!351883 e!351889)))

(declare-fun res!395283 () Bool)

(assert (=> b!613823 (=> res!395283 e!351889)))

(assert (=> b!613823 (= res!395283 (bvsge index!984 j!136))))

(declare-fun lt!281397 () Unit!19782)

(declare-fun e!351895 () Unit!19782)

(assert (=> b!613823 (= lt!281397 e!351895)))

(declare-fun c!69641 () Bool)

(assert (=> b!613823 (= c!69641 (bvslt j!136 index!984))))

(declare-fun b!613824 () Bool)

(declare-fun Unit!19786 () Unit!19782)

(assert (=> b!613824 (= e!351895 Unit!19786)))

(declare-fun b!613825 () Bool)

(declare-fun e!351891 () Bool)

(declare-datatypes ((SeekEntryResult!6400 0))(
  ( (MissingZero!6400 (index!27884 (_ BitVec 32))) (Found!6400 (index!27885 (_ BitVec 32))) (Intermediate!6400 (undefined!7212 Bool) (index!27886 (_ BitVec 32)) (x!56699 (_ BitVec 32))) (Undefined!6400) (MissingVacant!6400 (index!27887 (_ BitVec 32))) )
))
(declare-fun lt!281391 () SeekEntryResult!6400)

(declare-fun lt!281401 () SeekEntryResult!6400)

(assert (=> b!613825 (= e!351891 (= lt!281391 lt!281401))))

(declare-fun b!613826 () Bool)

(declare-fun res!395272 () Bool)

(assert (=> b!613826 (=> (not res!395272) (not e!351888))))

(assert (=> b!613826 (= res!395272 (and (= (size!18328 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18328 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18328 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!613827 () Bool)

(assert (=> b!613827 (= e!351886 e!351892)))

(declare-fun res!395269 () Bool)

(assert (=> b!613827 (=> res!395269 e!351892)))

(assert (=> b!613827 (= res!395269 (or (not (= (select (arr!17963 a!2986) j!136) lt!281399)) (not (= (select (arr!17963 a!2986) j!136) lt!281398)) (bvsge j!136 index!984)))))

(declare-fun b!613828 () Bool)

(declare-fun res!395271 () Bool)

(assert (=> b!613828 (=> (not res!395271) (not e!351888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613828 (= res!395271 (validKeyInArray!0 (select (arr!17963 a!2986) j!136)))))

(declare-fun b!613829 () Bool)

(declare-fun e!351893 () Bool)

(declare-fun e!351897 () Bool)

(assert (=> b!613829 (= e!351893 e!351897)))

(declare-fun res!395270 () Bool)

(assert (=> b!613829 (=> (not res!395270) (not e!351897))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!613829 (= res!395270 (= (select (store (arr!17963 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!613829 (= lt!281400 (array!37435 (store (arr!17963 a!2986) i!1108 k0!1786) (size!18328 a!2986)))))

(declare-fun b!613830 () Bool)

(declare-fun Unit!19787 () Unit!19782)

(assert (=> b!613830 (= e!351895 Unit!19787)))

(declare-fun lt!281392 () Unit!19782)

(assert (=> b!613830 (= lt!281392 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281400 (select (arr!17963 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613830 (arrayContainsKey!0 lt!281400 (select (arr!17963 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281390 () Unit!19782)

(assert (=> b!613830 (= lt!281390 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12040))))

(assert (=> b!613830 (arrayNoDuplicates!0 lt!281400 #b00000000000000000000000000000000 Nil!12040)))

(declare-fun lt!281395 () Unit!19782)

(assert (=> b!613830 (= lt!281395 (lemmaNoDuplicateFromThenFromBigger!0 lt!281400 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613830 (arrayNoDuplicates!0 lt!281400 j!136 Nil!12040)))

(declare-fun lt!281402 () Unit!19782)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37434 (_ BitVec 64) (_ BitVec 32) List!12043) Unit!19782)

(assert (=> b!613830 (= lt!281402 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281400 (select (arr!17963 a!2986) j!136) j!136 Nil!12040))))

(assert (=> b!613830 false))

(declare-fun b!613831 () Bool)

(assert (=> b!613831 (= e!351888 e!351893)))

(declare-fun res!395279 () Bool)

(assert (=> b!613831 (=> (not res!395279) (not e!351893))))

(declare-fun lt!281389 () SeekEntryResult!6400)

(assert (=> b!613831 (= res!395279 (or (= lt!281389 (MissingZero!6400 i!1108)) (= lt!281389 (MissingVacant!6400 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37434 (_ BitVec 32)) SeekEntryResult!6400)

(assert (=> b!613831 (= lt!281389 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613832 () Bool)

(declare-fun res!395280 () Bool)

(assert (=> b!613832 (=> (not res!395280) (not e!351888))))

(assert (=> b!613832 (= res!395280 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!613833 () Bool)

(declare-fun e!351885 () Bool)

(assert (=> b!613833 (= e!351885 (not e!351896))))

(declare-fun res!395284 () Bool)

(assert (=> b!613833 (=> res!395284 e!351896)))

(declare-fun lt!281404 () SeekEntryResult!6400)

(assert (=> b!613833 (= res!395284 (not (= lt!281404 (Found!6400 index!984))))))

(declare-fun lt!281394 () Unit!19782)

(assert (=> b!613833 (= lt!281394 e!351882)))

(declare-fun c!69642 () Bool)

(assert (=> b!613833 (= c!69642 (= lt!281404 Undefined!6400))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37434 (_ BitVec 32)) SeekEntryResult!6400)

(assert (=> b!613833 (= lt!281404 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281399 lt!281400 mask!3053))))

(assert (=> b!613833 e!351891))

(declare-fun res!395273 () Bool)

(assert (=> b!613833 (=> (not res!395273) (not e!351891))))

(declare-fun lt!281407 () (_ BitVec 32))

(assert (=> b!613833 (= res!395273 (= lt!281401 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281407 vacantSpotIndex!68 lt!281399 lt!281400 mask!3053)))))

(assert (=> b!613833 (= lt!281401 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281407 vacantSpotIndex!68 (select (arr!17963 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!613833 (= lt!281399 (select (store (arr!17963 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281405 () Unit!19782)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37434 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19782)

(assert (=> b!613833 (= lt!281405 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281407 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!613833 (= lt!281407 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!613834 () Bool)

(declare-fun res!395286 () Bool)

(assert (=> b!613834 (=> (not res!395286) (not e!351893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37434 (_ BitVec 32)) Bool)

(assert (=> b!613834 (= res!395286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613835 () Bool)

(assert (=> b!613835 (= e!351897 e!351885)))

(declare-fun res!395277 () Bool)

(assert (=> b!613835 (=> (not res!395277) (not e!351885))))

(assert (=> b!613835 (= res!395277 (and (= lt!281391 (Found!6400 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17963 a!2986) index!984) (select (arr!17963 a!2986) j!136))) (not (= (select (arr!17963 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!613835 (= lt!281391 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17963 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613836 () Bool)

(assert (=> b!613836 (= e!351894 true)))

(declare-fun lt!281393 () Bool)

(assert (=> b!613836 (= lt!281393 (contains!3047 Nil!12040 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613837 () Bool)

(declare-fun res!395275 () Bool)

(assert (=> b!613837 (=> (not res!395275) (not e!351893))))

(assert (=> b!613837 (= res!395275 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17963 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613838 () Bool)

(declare-fun res!395276 () Bool)

(assert (=> b!613838 (=> (not res!395276) (not e!351893))))

(assert (=> b!613838 (= res!395276 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12040))))

(declare-fun b!613839 () Bool)

(declare-fun res!395267 () Bool)

(assert (=> b!613839 (=> (not res!395267) (not e!351888))))

(assert (=> b!613839 (= res!395267 (validKeyInArray!0 k0!1786))))

(declare-fun b!613840 () Bool)

(assert (=> b!613840 (= e!351887 (arrayContainsKey!0 lt!281400 (select (arr!17963 a!2986) j!136) index!984))))

(assert (= (and start!55950 res!395285) b!613826))

(assert (= (and b!613826 res!395272) b!613828))

(assert (= (and b!613828 res!395271) b!613839))

(assert (= (and b!613839 res!395267) b!613832))

(assert (= (and b!613832 res!395280) b!613831))

(assert (= (and b!613831 res!395279) b!613834))

(assert (= (and b!613834 res!395286) b!613838))

(assert (= (and b!613838 res!395276) b!613837))

(assert (= (and b!613837 res!395275) b!613829))

(assert (= (and b!613829 res!395270) b!613835))

(assert (= (and b!613835 res!395277) b!613833))

(assert (= (and b!613833 res!395273) b!613825))

(assert (= (and b!613833 c!69642) b!613819))

(assert (= (and b!613833 (not c!69642)) b!613815))

(assert (= (and b!613833 (not res!395284)) b!613821))

(assert (= (and b!613821 res!395281) b!613827))

(assert (= (and b!613827 (not res!395269)) b!613820))

(assert (= (and b!613820 res!395268) b!613817))

(assert (= (and b!613821 (not res!395287)) b!613823))

(assert (= (and b!613823 c!69641) b!613830))

(assert (= (and b!613823 (not c!69641)) b!613824))

(assert (= (and b!613823 (not res!395283)) b!613816))

(assert (= (and b!613816 res!395274) b!613840))

(assert (= (and b!613816 (not res!395288)) b!613818))

(assert (= (and b!613818 (not res!395282)) b!613822))

(assert (= (and b!613822 (not res!395278)) b!613836))

(declare-fun m!589567 () Bool)

(assert (=> b!613828 m!589567))

(assert (=> b!613828 m!589567))

(declare-fun m!589569 () Bool)

(assert (=> b!613828 m!589569))

(declare-fun m!589571 () Bool)

(assert (=> b!613822 m!589571))

(declare-fun m!589573 () Bool)

(assert (=> b!613834 m!589573))

(declare-fun m!589575 () Bool)

(assert (=> b!613839 m!589575))

(declare-fun m!589577 () Bool)

(assert (=> b!613816 m!589577))

(declare-fun m!589579 () Bool)

(assert (=> b!613816 m!589579))

(assert (=> b!613816 m!589567))

(assert (=> b!613816 m!589567))

(declare-fun m!589581 () Bool)

(assert (=> b!613816 m!589581))

(assert (=> b!613816 m!589567))

(declare-fun m!589583 () Bool)

(assert (=> b!613816 m!589583))

(declare-fun m!589585 () Bool)

(assert (=> b!613816 m!589585))

(assert (=> b!613816 m!589567))

(declare-fun m!589587 () Bool)

(assert (=> b!613816 m!589587))

(declare-fun m!589589 () Bool)

(assert (=> b!613816 m!589589))

(assert (=> b!613827 m!589567))

(declare-fun m!589591 () Bool)

(assert (=> b!613831 m!589591))

(declare-fun m!589593 () Bool)

(assert (=> b!613835 m!589593))

(assert (=> b!613835 m!589567))

(assert (=> b!613835 m!589567))

(declare-fun m!589595 () Bool)

(assert (=> b!613835 m!589595))

(assert (=> b!613821 m!589567))

(declare-fun m!589597 () Bool)

(assert (=> b!613821 m!589597))

(declare-fun m!589599 () Bool)

(assert (=> b!613821 m!589599))

(assert (=> b!613820 m!589567))

(assert (=> b!613820 m!589567))

(assert (=> b!613820 m!589581))

(assert (=> b!613829 m!589597))

(declare-fun m!589601 () Bool)

(assert (=> b!613829 m!589601))

(assert (=> b!613830 m!589567))

(declare-fun m!589603 () Bool)

(assert (=> b!613830 m!589603))

(assert (=> b!613830 m!589579))

(assert (=> b!613830 m!589567))

(declare-fun m!589605 () Bool)

(assert (=> b!613830 m!589605))

(assert (=> b!613830 m!589567))

(declare-fun m!589607 () Bool)

(assert (=> b!613830 m!589607))

(declare-fun m!589609 () Bool)

(assert (=> b!613830 m!589609))

(assert (=> b!613830 m!589567))

(declare-fun m!589611 () Bool)

(assert (=> b!613830 m!589611))

(assert (=> b!613830 m!589589))

(declare-fun m!589613 () Bool)

(assert (=> b!613833 m!589613))

(assert (=> b!613833 m!589567))

(assert (=> b!613833 m!589597))

(assert (=> b!613833 m!589567))

(declare-fun m!589615 () Bool)

(assert (=> b!613833 m!589615))

(declare-fun m!589617 () Bool)

(assert (=> b!613833 m!589617))

(declare-fun m!589619 () Bool)

(assert (=> b!613833 m!589619))

(declare-fun m!589621 () Bool)

(assert (=> b!613833 m!589621))

(declare-fun m!589623 () Bool)

(assert (=> b!613833 m!589623))

(declare-fun m!589625 () Bool)

(assert (=> b!613818 m!589625))

(declare-fun m!589627 () Bool)

(assert (=> b!613837 m!589627))

(assert (=> b!613817 m!589567))

(assert (=> b!613817 m!589567))

(declare-fun m!589629 () Bool)

(assert (=> b!613817 m!589629))

(declare-fun m!589631 () Bool)

(assert (=> start!55950 m!589631))

(declare-fun m!589633 () Bool)

(assert (=> start!55950 m!589633))

(assert (=> b!613840 m!589567))

(assert (=> b!613840 m!589567))

(assert (=> b!613840 m!589629))

(declare-fun m!589635 () Bool)

(assert (=> b!613836 m!589635))

(declare-fun m!589637 () Bool)

(assert (=> b!613838 m!589637))

(declare-fun m!589639 () Bool)

(assert (=> b!613832 m!589639))

(check-sat (not b!613831) (not b!613816) (not b!613820) (not b!613835) (not b!613817) (not b!613839) (not b!613840) (not b!613830) (not b!613833) (not b!613834) (not b!613822) (not b!613836) (not start!55950) (not b!613832) (not b!613818) (not b!613838) (not b!613828))
(check-sat)
