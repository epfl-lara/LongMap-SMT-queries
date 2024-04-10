; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55438 () Bool)

(assert start!55438)

(declare-fun b!606442 () Bool)

(declare-fun res!389583 () Bool)

(declare-fun e!347202 () Bool)

(assert (=> b!606442 (=> (not res!389583) (not e!347202))))

(declare-datatypes ((array!37262 0))(
  ( (array!37263 (arr!17883 (Array (_ BitVec 32) (_ BitVec 64))) (size!18247 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37262)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37262 (_ BitVec 32)) Bool)

(assert (=> b!606442 (= res!389583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!606443 () Bool)

(declare-fun e!347213 () Bool)

(declare-fun e!347208 () Bool)

(assert (=> b!606443 (= e!347213 e!347208)))

(declare-fun res!389575 () Bool)

(assert (=> b!606443 (=> res!389575 e!347208)))

(assert (=> b!606443 (= res!389575 (or (bvsgt #b00000000000000000000000000000000 (size!18247 a!2986)) (bvsge (size!18247 a!2986) #b01111111111111111111111111111111)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!276783 () array!37262)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!606443 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19318 0))(
  ( (Unit!19319) )
))
(declare-fun lt!276789 () Unit!19318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37262 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19318)

(assert (=> b!606443 (= lt!276789 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276783 (select (arr!17883 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!347201 () Bool)

(assert (=> b!606443 e!347201))

(declare-fun res!389570 () Bool)

(assert (=> b!606443 (=> (not res!389570) (not e!347201))))

(assert (=> b!606443 (= res!389570 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) j!136))))

(declare-fun b!606444 () Bool)

(declare-fun res!389569 () Bool)

(assert (=> b!606444 (=> (not res!389569) (not e!347202))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!606444 (= res!389569 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17883 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606445 () Bool)

(declare-fun e!347204 () Bool)

(assert (=> b!606445 (= e!347208 e!347204)))

(declare-fun res!389566 () Bool)

(assert (=> b!606445 (=> (not res!389566) (not e!347204))))

(declare-datatypes ((List!11924 0))(
  ( (Nil!11921) (Cons!11920 (h!12965 (_ BitVec 64)) (t!18152 List!11924)) )
))
(declare-fun contains!3000 (List!11924 (_ BitVec 64)) Bool)

(assert (=> b!606445 (= res!389566 (not (contains!3000 Nil!11921 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606446 () Bool)

(declare-fun e!347209 () Bool)

(assert (=> b!606446 (= e!347209 e!347213)))

(declare-fun res!389565 () Bool)

(assert (=> b!606446 (=> res!389565 e!347213)))

(assert (=> b!606446 (= res!389565 (bvsge index!984 j!136))))

(declare-fun lt!276776 () Unit!19318)

(declare-fun e!347206 () Unit!19318)

(assert (=> b!606446 (= lt!276776 e!347206)))

(declare-fun c!68806 () Bool)

(assert (=> b!606446 (= c!68806 (bvslt j!136 index!984))))

(declare-fun b!606447 () Bool)

(declare-fun e!347212 () Unit!19318)

(declare-fun Unit!19320 () Unit!19318)

(assert (=> b!606447 (= e!347212 Unit!19320)))

(declare-fun b!606448 () Bool)

(declare-fun e!347210 () Bool)

(assert (=> b!606448 (= e!347202 e!347210)))

(declare-fun res!389579 () Bool)

(assert (=> b!606448 (=> (not res!389579) (not e!347210))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!606448 (= res!389579 (= (select (store (arr!17883 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606448 (= lt!276783 (array!37263 (store (arr!17883 a!2986) i!1108 k!1786) (size!18247 a!2986)))))

(declare-fun b!606450 () Bool)

(declare-fun Unit!19321 () Unit!19318)

(assert (=> b!606450 (= e!347206 Unit!19321)))

(declare-fun lt!276788 () Unit!19318)

(assert (=> b!606450 (= lt!276788 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276783 (select (arr!17883 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!606450 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276787 () Unit!19318)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37262 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11924) Unit!19318)

(assert (=> b!606450 (= lt!276787 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11921))))

(declare-fun arrayNoDuplicates!0 (array!37262 (_ BitVec 32) List!11924) Bool)

(assert (=> b!606450 (arrayNoDuplicates!0 lt!276783 #b00000000000000000000000000000000 Nil!11921)))

(declare-fun lt!276775 () Unit!19318)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37262 (_ BitVec 32) (_ BitVec 32)) Unit!19318)

(assert (=> b!606450 (= lt!276775 (lemmaNoDuplicateFromThenFromBigger!0 lt!276783 #b00000000000000000000000000000000 j!136))))

(assert (=> b!606450 (arrayNoDuplicates!0 lt!276783 j!136 Nil!11921)))

(declare-fun lt!276782 () Unit!19318)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37262 (_ BitVec 64) (_ BitVec 32) List!11924) Unit!19318)

(assert (=> b!606450 (= lt!276782 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276783 (select (arr!17883 a!2986) j!136) j!136 Nil!11921))))

(assert (=> b!606450 false))

(declare-fun b!606451 () Bool)

(declare-fun Unit!19322 () Unit!19318)

(assert (=> b!606451 (= e!347212 Unit!19322)))

(assert (=> b!606451 false))

(declare-fun b!606452 () Bool)

(declare-fun e!347217 () Bool)

(assert (=> b!606452 (= e!347217 e!347202)))

(declare-fun res!389568 () Bool)

(assert (=> b!606452 (=> (not res!389568) (not e!347202))))

(declare-datatypes ((SeekEntryResult!6323 0))(
  ( (MissingZero!6323 (index!27564 (_ BitVec 32))) (Found!6323 (index!27565 (_ BitVec 32))) (Intermediate!6323 (undefined!7135 Bool) (index!27566 (_ BitVec 32)) (x!56375 (_ BitVec 32))) (Undefined!6323) (MissingVacant!6323 (index!27567 (_ BitVec 32))) )
))
(declare-fun lt!276779 () SeekEntryResult!6323)

(assert (=> b!606452 (= res!389568 (or (= lt!276779 (MissingZero!6323 i!1108)) (= lt!276779 (MissingVacant!6323 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37262 (_ BitVec 32)) SeekEntryResult!6323)

(assert (=> b!606452 (= lt!276779 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!606453 () Bool)

(declare-fun res!389578 () Bool)

(assert (=> b!606453 (=> (not res!389578) (not e!347217))))

(assert (=> b!606453 (= res!389578 (and (= (size!18247 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18247 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18247 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!606454 () Bool)

(assert (=> b!606454 (= e!347201 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) index!984))))

(declare-fun b!606455 () Bool)

(declare-fun e!347205 () Bool)

(assert (=> b!606455 (= e!347205 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) index!984))))

(declare-fun b!606456 () Bool)

(assert (=> b!606456 (= e!347204 (not (contains!3000 Nil!11921 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606457 () Bool)

(declare-fun e!347211 () Bool)

(declare-fun e!347216 () Bool)

(assert (=> b!606457 (= e!347211 (not e!347216))))

(declare-fun res!389580 () Bool)

(assert (=> b!606457 (=> res!389580 e!347216)))

(declare-fun lt!276790 () SeekEntryResult!6323)

(assert (=> b!606457 (= res!389580 (not (= lt!276790 (Found!6323 index!984))))))

(declare-fun lt!276777 () Unit!19318)

(assert (=> b!606457 (= lt!276777 e!347212)))

(declare-fun c!68807 () Bool)

(assert (=> b!606457 (= c!68807 (= lt!276790 Undefined!6323))))

(declare-fun lt!276786 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37262 (_ BitVec 32)) SeekEntryResult!6323)

(assert (=> b!606457 (= lt!276790 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276786 lt!276783 mask!3053))))

(declare-fun e!347207 () Bool)

(assert (=> b!606457 e!347207))

(declare-fun res!389571 () Bool)

(assert (=> b!606457 (=> (not res!389571) (not e!347207))))

(declare-fun lt!276778 () (_ BitVec 32))

(declare-fun lt!276781 () SeekEntryResult!6323)

(assert (=> b!606457 (= res!389571 (= lt!276781 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276778 vacantSpotIndex!68 lt!276786 lt!276783 mask!3053)))))

(assert (=> b!606457 (= lt!276781 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276778 vacantSpotIndex!68 (select (arr!17883 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!606457 (= lt!276786 (select (store (arr!17883 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!276780 () Unit!19318)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37262 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19318)

(assert (=> b!606457 (= lt!276780 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276778 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!606457 (= lt!276778 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!606458 () Bool)

(declare-fun res!389576 () Bool)

(assert (=> b!606458 (=> (not res!389576) (not e!347217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!606458 (= res!389576 (validKeyInArray!0 k!1786))))

(declare-fun b!606449 () Bool)

(declare-fun Unit!19323 () Unit!19318)

(assert (=> b!606449 (= e!347206 Unit!19323)))

(declare-fun res!389573 () Bool)

(assert (=> start!55438 (=> (not res!389573) (not e!347217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55438 (= res!389573 (validMask!0 mask!3053))))

(assert (=> start!55438 e!347217))

(assert (=> start!55438 true))

(declare-fun array_inv!13679 (array!37262) Bool)

(assert (=> start!55438 (array_inv!13679 a!2986)))

(declare-fun b!606459 () Bool)

(declare-fun e!347215 () Bool)

(declare-fun e!347203 () Bool)

(assert (=> b!606459 (= e!347215 e!347203)))

(declare-fun res!389585 () Bool)

(assert (=> b!606459 (=> res!389585 e!347203)))

(declare-fun lt!276784 () (_ BitVec 64))

(assert (=> b!606459 (= res!389585 (or (not (= (select (arr!17883 a!2986) j!136) lt!276786)) (not (= (select (arr!17883 a!2986) j!136) lt!276784)) (bvsge j!136 index!984)))))

(declare-fun b!606460 () Bool)

(assert (=> b!606460 (= e!347203 e!347205)))

(declare-fun res!389577 () Bool)

(assert (=> b!606460 (=> (not res!389577) (not e!347205))))

(assert (=> b!606460 (= res!389577 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) j!136))))

(declare-fun b!606461 () Bool)

(declare-fun res!389572 () Bool)

(assert (=> b!606461 (=> (not res!389572) (not e!347202))))

(assert (=> b!606461 (= res!389572 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11921))))

(declare-fun b!606462 () Bool)

(declare-fun res!389567 () Bool)

(assert (=> b!606462 (=> (not res!389567) (not e!347217))))

(assert (=> b!606462 (= res!389567 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!606463 () Bool)

(assert (=> b!606463 (= e!347210 e!347211)))

(declare-fun res!389581 () Bool)

(assert (=> b!606463 (=> (not res!389581) (not e!347211))))

(declare-fun lt!276785 () SeekEntryResult!6323)

(assert (=> b!606463 (= res!389581 (and (= lt!276785 (Found!6323 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17883 a!2986) index!984) (select (arr!17883 a!2986) j!136))) (not (= (select (arr!17883 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!606463 (= lt!276785 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17883 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606464 () Bool)

(assert (=> b!606464 (= e!347207 (= lt!276785 lt!276781))))

(declare-fun b!606465 () Bool)

(declare-fun res!389574 () Bool)

(assert (=> b!606465 (=> (not res!389574) (not e!347217))))

(assert (=> b!606465 (= res!389574 (validKeyInArray!0 (select (arr!17883 a!2986) j!136)))))

(declare-fun b!606466 () Bool)

(declare-fun res!389584 () Bool)

(assert (=> b!606466 (=> res!389584 e!347208)))

(declare-fun noDuplicate!306 (List!11924) Bool)

(assert (=> b!606466 (= res!389584 (not (noDuplicate!306 Nil!11921)))))

(declare-fun b!606467 () Bool)

(assert (=> b!606467 (= e!347216 e!347209)))

(declare-fun res!389582 () Bool)

(assert (=> b!606467 (=> res!389582 e!347209)))

(assert (=> b!606467 (= res!389582 (or (not (= (select (arr!17883 a!2986) j!136) lt!276786)) (not (= (select (arr!17883 a!2986) j!136) lt!276784))))))

(assert (=> b!606467 e!347215))

(declare-fun res!389564 () Bool)

(assert (=> b!606467 (=> (not res!389564) (not e!347215))))

(assert (=> b!606467 (= res!389564 (= lt!276784 (select (arr!17883 a!2986) j!136)))))

(assert (=> b!606467 (= lt!276784 (select (store (arr!17883 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!55438 res!389573) b!606453))

(assert (= (and b!606453 res!389578) b!606465))

(assert (= (and b!606465 res!389574) b!606458))

(assert (= (and b!606458 res!389576) b!606462))

(assert (= (and b!606462 res!389567) b!606452))

(assert (= (and b!606452 res!389568) b!606442))

(assert (= (and b!606442 res!389583) b!606461))

(assert (= (and b!606461 res!389572) b!606444))

(assert (= (and b!606444 res!389569) b!606448))

(assert (= (and b!606448 res!389579) b!606463))

(assert (= (and b!606463 res!389581) b!606457))

(assert (= (and b!606457 res!389571) b!606464))

(assert (= (and b!606457 c!68807) b!606451))

(assert (= (and b!606457 (not c!68807)) b!606447))

(assert (= (and b!606457 (not res!389580)) b!606467))

(assert (= (and b!606467 res!389564) b!606459))

(assert (= (and b!606459 (not res!389585)) b!606460))

(assert (= (and b!606460 res!389577) b!606455))

(assert (= (and b!606467 (not res!389582)) b!606446))

(assert (= (and b!606446 c!68806) b!606450))

(assert (= (and b!606446 (not c!68806)) b!606449))

(assert (= (and b!606446 (not res!389565)) b!606443))

(assert (= (and b!606443 res!389570) b!606454))

(assert (= (and b!606443 (not res!389575)) b!606466))

(assert (= (and b!606466 (not res!389584)) b!606445))

(assert (= (and b!606445 res!389566) b!606456))

(declare-fun m!583253 () Bool)

(assert (=> b!606456 m!583253))

(declare-fun m!583255 () Bool)

(assert (=> b!606462 m!583255))

(declare-fun m!583257 () Bool)

(assert (=> b!606443 m!583257))

(assert (=> b!606443 m!583257))

(declare-fun m!583259 () Bool)

(assert (=> b!606443 m!583259))

(assert (=> b!606443 m!583257))

(declare-fun m!583261 () Bool)

(assert (=> b!606443 m!583261))

(assert (=> b!606443 m!583257))

(declare-fun m!583263 () Bool)

(assert (=> b!606443 m!583263))

(declare-fun m!583265 () Bool)

(assert (=> b!606448 m!583265))

(declare-fun m!583267 () Bool)

(assert (=> b!606448 m!583267))

(assert (=> b!606465 m!583257))

(assert (=> b!606465 m!583257))

(declare-fun m!583269 () Bool)

(assert (=> b!606465 m!583269))

(declare-fun m!583271 () Bool)

(assert (=> b!606458 m!583271))

(assert (=> b!606455 m!583257))

(assert (=> b!606455 m!583257))

(declare-fun m!583273 () Bool)

(assert (=> b!606455 m!583273))

(assert (=> b!606459 m!583257))

(declare-fun m!583275 () Bool)

(assert (=> b!606452 m!583275))

(declare-fun m!583277 () Bool)

(assert (=> b!606461 m!583277))

(assert (=> b!606450 m!583257))

(assert (=> b!606450 m!583257))

(declare-fun m!583279 () Bool)

(assert (=> b!606450 m!583279))

(assert (=> b!606450 m!583257))

(declare-fun m!583281 () Bool)

(assert (=> b!606450 m!583281))

(declare-fun m!583283 () Bool)

(assert (=> b!606450 m!583283))

(declare-fun m!583285 () Bool)

(assert (=> b!606450 m!583285))

(assert (=> b!606450 m!583257))

(declare-fun m!583287 () Bool)

(assert (=> b!606450 m!583287))

(declare-fun m!583289 () Bool)

(assert (=> b!606450 m!583289))

(declare-fun m!583291 () Bool)

(assert (=> b!606450 m!583291))

(declare-fun m!583293 () Bool)

(assert (=> start!55438 m!583293))

(declare-fun m!583295 () Bool)

(assert (=> start!55438 m!583295))

(assert (=> b!606467 m!583257))

(assert (=> b!606467 m!583265))

(declare-fun m!583297 () Bool)

(assert (=> b!606467 m!583297))

(declare-fun m!583299 () Bool)

(assert (=> b!606442 m!583299))

(declare-fun m!583301 () Bool)

(assert (=> b!606445 m!583301))

(declare-fun m!583303 () Bool)

(assert (=> b!606463 m!583303))

(assert (=> b!606463 m!583257))

(assert (=> b!606463 m!583257))

(declare-fun m!583305 () Bool)

(assert (=> b!606463 m!583305))

(assert (=> b!606454 m!583257))

(assert (=> b!606454 m!583257))

(assert (=> b!606454 m!583273))

(declare-fun m!583307 () Bool)

(assert (=> b!606444 m!583307))

(assert (=> b!606460 m!583257))

(assert (=> b!606460 m!583257))

(assert (=> b!606460 m!583263))

(declare-fun m!583309 () Bool)

(assert (=> b!606466 m!583309))

(declare-fun m!583311 () Bool)

(assert (=> b!606457 m!583311))

(assert (=> b!606457 m!583257))

(assert (=> b!606457 m!583257))

(declare-fun m!583313 () Bool)

(assert (=> b!606457 m!583313))

(assert (=> b!606457 m!583265))

(declare-fun m!583315 () Bool)

(assert (=> b!606457 m!583315))

(declare-fun m!583317 () Bool)

(assert (=> b!606457 m!583317))

(declare-fun m!583319 () Bool)

(assert (=> b!606457 m!583319))

(declare-fun m!583321 () Bool)

(assert (=> b!606457 m!583321))

(push 1)

(assert (not start!55438))

(assert (not b!606463))

(assert (not b!606455))

(assert (not b!606466))

(assert (not b!606445))

(assert (not b!606456))

(assert (not b!606461))

(assert (not b!606457))

(assert (not b!606462))

(assert (not b!606458))

(assert (not b!606465))

(assert (not b!606452))

(assert (not b!606450))

(assert (not b!606460))

(assert (not b!606454))

(assert (not b!606443))

(assert (not b!606442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87929 () Bool)

(assert (=> d!87929 (arrayNoDuplicates!0 lt!276783 j!136 Nil!11921)))

(declare-fun lt!276904 () Unit!19318)

(declare-fun choose!39 (array!37262 (_ BitVec 32) (_ BitVec 32)) Unit!19318)

(assert (=> d!87929 (= lt!276904 (choose!39 lt!276783 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87929 (bvslt (size!18247 lt!276783) #b01111111111111111111111111111111)))

(assert (=> d!87929 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276783 #b00000000000000000000000000000000 j!136) lt!276904)))

(declare-fun bs!18559 () Bool)

(assert (= bs!18559 d!87929))

(assert (=> bs!18559 m!583289))

(declare-fun m!583507 () Bool)

(assert (=> bs!18559 m!583507))

(assert (=> b!606450 d!87929))

(declare-fun d!87933 () Bool)

(declare-fun res!389753 () Bool)

(declare-fun e!347359 () Bool)

(assert (=> d!87933 (=> res!389753 e!347359)))

(assert (=> d!87933 (= res!389753 (= (select (arr!17883 lt!276783) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17883 a!2986) j!136)))))

(assert (=> d!87933 (= (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347359)))

(declare-fun b!606667 () Bool)

(declare-fun e!347360 () Bool)

(assert (=> b!606667 (= e!347359 e!347360)))

(declare-fun res!389754 () Bool)

(assert (=> b!606667 (=> (not res!389754) (not e!347360))))

(assert (=> b!606667 (= res!389754 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18247 lt!276783)))))

(declare-fun b!606668 () Bool)

(assert (=> b!606668 (= e!347360 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87933 (not res!389753)) b!606667))

(assert (= (and b!606667 res!389754) b!606668))

(declare-fun m!583509 () Bool)

(assert (=> d!87933 m!583509))

(assert (=> b!606668 m!583257))

(declare-fun m!583511 () Bool)

(assert (=> b!606668 m!583511))

(assert (=> b!606450 d!87933))

(declare-fun b!606699 () Bool)

(declare-fun e!347384 () Bool)

(declare-fun e!347386 () Bool)

(assert (=> b!606699 (= e!347384 e!347386)))

(declare-fun c!68832 () Bool)

(assert (=> b!606699 (= c!68832 (validKeyInArray!0 (select (arr!17883 lt!276783) j!136)))))

(declare-fun b!606700 () Bool)

(declare-fun e!347385 () Bool)

(assert (=> b!606700 (= e!347385 e!347384)))

(declare-fun res!389770 () Bool)

(assert (=> b!606700 (=> (not res!389770) (not e!347384))))

(declare-fun e!347383 () Bool)

(assert (=> b!606700 (= res!389770 (not e!347383))))

(declare-fun res!389771 () Bool)

(assert (=> b!606700 (=> (not res!389771) (not e!347383))))

(assert (=> b!606700 (= res!389771 (validKeyInArray!0 (select (arr!17883 lt!276783) j!136)))))

(declare-fun b!606701 () Bool)

(declare-fun call!33093 () Bool)

(assert (=> b!606701 (= e!347386 call!33093)))

(declare-fun d!87935 () Bool)

(declare-fun res!389769 () Bool)

(assert (=> d!87935 (=> res!389769 e!347385)))

(assert (=> d!87935 (= res!389769 (bvsge j!136 (size!18247 lt!276783)))))

(assert (=> d!87935 (= (arrayNoDuplicates!0 lt!276783 j!136 Nil!11921) e!347385)))

(declare-fun b!606702 () Bool)

(assert (=> b!606702 (= e!347383 (contains!3000 Nil!11921 (select (arr!17883 lt!276783) j!136)))))

(declare-fun bm!33090 () Bool)

(assert (=> bm!33090 (= call!33093 (arrayNoDuplicates!0 lt!276783 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68832 (Cons!11920 (select (arr!17883 lt!276783) j!136) Nil!11921) Nil!11921)))))

(declare-fun b!606703 () Bool)

(assert (=> b!606703 (= e!347386 call!33093)))

(assert (= (and d!87935 (not res!389769)) b!606700))

(assert (= (and b!606700 res!389771) b!606702))

(assert (= (and b!606700 res!389770) b!606699))

(assert (= (and b!606699 c!68832) b!606703))

(assert (= (and b!606699 (not c!68832)) b!606701))

(assert (= (or b!606703 b!606701) bm!33090))

(declare-fun m!583521 () Bool)

(assert (=> b!606699 m!583521))

(assert (=> b!606699 m!583521))

(declare-fun m!583523 () Bool)

(assert (=> b!606699 m!583523))

(assert (=> b!606700 m!583521))

(assert (=> b!606700 m!583521))

(assert (=> b!606700 m!583523))

(assert (=> b!606702 m!583521))

(assert (=> b!606702 m!583521))

(declare-fun m!583525 () Bool)

(assert (=> b!606702 m!583525))

(assert (=> bm!33090 m!583521))

(declare-fun m!583527 () Bool)

(assert (=> bm!33090 m!583527))

(assert (=> b!606450 d!87935))

(declare-fun d!87945 () Bool)

(assert (=> d!87945 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276911 () Unit!19318)

(declare-fun choose!114 (array!37262 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19318)

(assert (=> d!87945 (= lt!276911 (choose!114 lt!276783 (select (arr!17883 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87945 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87945 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276783 (select (arr!17883 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276911)))

(declare-fun bs!18560 () Bool)

(assert (= bs!18560 d!87945))

(assert (=> bs!18560 m!583257))

(assert (=> bs!18560 m!583281))

(assert (=> bs!18560 m!583257))

(declare-fun m!583529 () Bool)

(assert (=> bs!18560 m!583529))

(assert (=> b!606450 d!87945))

(declare-fun d!87947 () Bool)

(assert (=> d!87947 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18247 lt!276783)) (not (= (select (arr!17883 lt!276783) j!136) (select (arr!17883 a!2986) j!136))))))

(declare-fun lt!276916 () Unit!19318)

(declare-fun choose!21 (array!37262 (_ BitVec 64) (_ BitVec 32) List!11924) Unit!19318)

(assert (=> d!87947 (= lt!276916 (choose!21 lt!276783 (select (arr!17883 a!2986) j!136) j!136 Nil!11921))))

(assert (=> d!87947 (bvslt (size!18247 lt!276783) #b01111111111111111111111111111111)))

(assert (=> d!87947 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276783 (select (arr!17883 a!2986) j!136) j!136 Nil!11921) lt!276916)))

(declare-fun bs!18561 () Bool)

(assert (= bs!18561 d!87947))

(assert (=> bs!18561 m!583521))

(assert (=> bs!18561 m!583257))

(declare-fun m!583537 () Bool)

(assert (=> bs!18561 m!583537))

(assert (=> b!606450 d!87947))

(declare-fun d!87951 () Bool)

(declare-fun e!347412 () Bool)

(assert (=> d!87951 e!347412))

(declare-fun res!389782 () Bool)

(assert (=> d!87951 (=> (not res!389782) (not e!347412))))

(assert (=> d!87951 (= res!389782 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18247 a!2986))))))

(declare-fun lt!276929 () Unit!19318)

(declare-fun choose!41 (array!37262 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11924) Unit!19318)

(assert (=> d!87951 (= lt!276929 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11921))))

(assert (=> d!87951 (bvslt (size!18247 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87951 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11921) lt!276929)))

(declare-fun b!606744 () Bool)

(assert (=> b!606744 (= e!347412 (arrayNoDuplicates!0 (array!37263 (store (arr!17883 a!2986) i!1108 k!1786) (size!18247 a!2986)) #b00000000000000000000000000000000 Nil!11921))))

(assert (= (and d!87951 res!389782) b!606744))

(declare-fun m!583561 () Bool)

(assert (=> d!87951 m!583561))

(assert (=> b!606744 m!583265))

(declare-fun m!583563 () Bool)

(assert (=> b!606744 m!583563))

(assert (=> b!606450 d!87951))

(declare-fun b!606745 () Bool)

(declare-fun e!347414 () Bool)

(declare-fun e!347416 () Bool)

(assert (=> b!606745 (= e!347414 e!347416)))

(declare-fun c!68848 () Bool)

(assert (=> b!606745 (= c!68848 (validKeyInArray!0 (select (arr!17883 lt!276783) #b00000000000000000000000000000000)))))

(declare-fun b!606746 () Bool)

(declare-fun e!347415 () Bool)

(assert (=> b!606746 (= e!347415 e!347414)))

(declare-fun res!389784 () Bool)

(assert (=> b!606746 (=> (not res!389784) (not e!347414))))

(declare-fun e!347413 () Bool)

(assert (=> b!606746 (= res!389784 (not e!347413))))

(declare-fun res!389785 () Bool)

(assert (=> b!606746 (=> (not res!389785) (not e!347413))))

(assert (=> b!606746 (= res!389785 (validKeyInArray!0 (select (arr!17883 lt!276783) #b00000000000000000000000000000000)))))

(declare-fun b!606747 () Bool)

(declare-fun call!33094 () Bool)

(assert (=> b!606747 (= e!347416 call!33094)))

(declare-fun d!87963 () Bool)

(declare-fun res!389783 () Bool)

(assert (=> d!87963 (=> res!389783 e!347415)))

(assert (=> d!87963 (= res!389783 (bvsge #b00000000000000000000000000000000 (size!18247 lt!276783)))))

(assert (=> d!87963 (= (arrayNoDuplicates!0 lt!276783 #b00000000000000000000000000000000 Nil!11921) e!347415)))

(declare-fun b!606748 () Bool)

(assert (=> b!606748 (= e!347413 (contains!3000 Nil!11921 (select (arr!17883 lt!276783) #b00000000000000000000000000000000)))))

(declare-fun bm!33091 () Bool)

(assert (=> bm!33091 (= call!33094 (arrayNoDuplicates!0 lt!276783 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68848 (Cons!11920 (select (arr!17883 lt!276783) #b00000000000000000000000000000000) Nil!11921) Nil!11921)))))

(declare-fun b!606749 () Bool)

(assert (=> b!606749 (= e!347416 call!33094)))

(assert (= (and d!87963 (not res!389783)) b!606746))

(assert (= (and b!606746 res!389785) b!606748))

(assert (= (and b!606746 res!389784) b!606745))

(assert (= (and b!606745 c!68848) b!606749))

(assert (= (and b!606745 (not c!68848)) b!606747))

(assert (= (or b!606749 b!606747) bm!33091))

(declare-fun m!583567 () Bool)

(assert (=> b!606745 m!583567))

(assert (=> b!606745 m!583567))

(declare-fun m!583569 () Bool)

(assert (=> b!606745 m!583569))

(assert (=> b!606746 m!583567))

(assert (=> b!606746 m!583567))

(assert (=> b!606746 m!583569))

(assert (=> b!606748 m!583567))

(assert (=> b!606748 m!583567))

(declare-fun m!583571 () Bool)

(assert (=> b!606748 m!583571))

(assert (=> bm!33091 m!583567))

(declare-fun m!583573 () Bool)

(assert (=> bm!33091 m!583573))

(assert (=> b!606450 d!87963))

(declare-fun b!606756 () Bool)

(declare-fun e!347421 () Bool)

(declare-fun e!347423 () Bool)

(assert (=> b!606756 (= e!347421 e!347423)))

(declare-fun c!68852 () Bool)

(assert (=> b!606756 (= c!68852 (validKeyInArray!0 (select (arr!17883 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606757 () Bool)

(declare-fun e!347422 () Bool)

(assert (=> b!606757 (= e!347422 e!347421)))

(declare-fun res!389787 () Bool)

(assert (=> b!606757 (=> (not res!389787) (not e!347421))))

(declare-fun e!347420 () Bool)

(assert (=> b!606757 (= res!389787 (not e!347420))))

(declare-fun res!389788 () Bool)

(assert (=> b!606757 (=> (not res!389788) (not e!347420))))

(assert (=> b!606757 (= res!389788 (validKeyInArray!0 (select (arr!17883 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606758 () Bool)

(declare-fun call!33095 () Bool)

(assert (=> b!606758 (= e!347423 call!33095)))

(declare-fun d!87967 () Bool)

(declare-fun res!389786 () Bool)

(assert (=> d!87967 (=> res!389786 e!347422)))

(assert (=> d!87967 (= res!389786 (bvsge #b00000000000000000000000000000000 (size!18247 a!2986)))))

(assert (=> d!87967 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11921) e!347422)))

(declare-fun b!606759 () Bool)

(assert (=> b!606759 (= e!347420 (contains!3000 Nil!11921 (select (arr!17883 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33092 () Bool)

(assert (=> bm!33092 (= call!33095 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68852 (Cons!11920 (select (arr!17883 a!2986) #b00000000000000000000000000000000) Nil!11921) Nil!11921)))))

(declare-fun b!606760 () Bool)

(assert (=> b!606760 (= e!347423 call!33095)))

(assert (= (and d!87967 (not res!389786)) b!606757))

(assert (= (and b!606757 res!389788) b!606759))

(assert (= (and b!606757 res!389787) b!606756))

(assert (= (and b!606756 c!68852) b!606760))

(assert (= (and b!606756 (not c!68852)) b!606758))

(assert (= (or b!606760 b!606758) bm!33092))

(declare-fun m!583583 () Bool)

(assert (=> b!606756 m!583583))

(assert (=> b!606756 m!583583))

(declare-fun m!583585 () Bool)

(assert (=> b!606756 m!583585))

(assert (=> b!606757 m!583583))

(assert (=> b!606757 m!583583))

(assert (=> b!606757 m!583585))

(assert (=> b!606759 m!583583))

(assert (=> b!606759 m!583583))

(declare-fun m!583587 () Bool)

(assert (=> b!606759 m!583587))

(assert (=> bm!33092 m!583583))

(declare-fun m!583589 () Bool)

(assert (=> bm!33092 m!583589))

(assert (=> b!606461 d!87967))

(declare-fun d!87971 () Bool)

(declare-fun res!389789 () Bool)

(declare-fun e!347427 () Bool)

(assert (=> d!87971 (=> res!389789 e!347427)))

(assert (=> d!87971 (= res!389789 (= (select (arr!17883 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!87971 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!347427)))

(declare-fun b!606767 () Bool)

(declare-fun e!347428 () Bool)

(assert (=> b!606767 (= e!347427 e!347428)))

(declare-fun res!389790 () Bool)

(assert (=> b!606767 (=> (not res!389790) (not e!347428))))

(assert (=> b!606767 (= res!389790 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18247 a!2986)))))

(declare-fun b!606768 () Bool)

(assert (=> b!606768 (= e!347428 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87971 (not res!389789)) b!606767))

(assert (= (and b!606767 res!389790) b!606768))

(assert (=> d!87971 m!583583))

(declare-fun m!583593 () Bool)

(assert (=> b!606768 m!583593))

(assert (=> b!606462 d!87971))

(declare-fun d!87973 () Bool)

(declare-fun lt!276956 () SeekEntryResult!6323)

(assert (=> d!87973 (and (or (is-Undefined!6323 lt!276956) (not (is-Found!6323 lt!276956)) (and (bvsge (index!27565 lt!276956) #b00000000000000000000000000000000) (bvslt (index!27565 lt!276956) (size!18247 a!2986)))) (or (is-Undefined!6323 lt!276956) (is-Found!6323 lt!276956) (not (is-MissingZero!6323 lt!276956)) (and (bvsge (index!27564 lt!276956) #b00000000000000000000000000000000) (bvslt (index!27564 lt!276956) (size!18247 a!2986)))) (or (is-Undefined!6323 lt!276956) (is-Found!6323 lt!276956) (is-MissingZero!6323 lt!276956) (not (is-MissingVacant!6323 lt!276956)) (and (bvsge (index!27567 lt!276956) #b00000000000000000000000000000000) (bvslt (index!27567 lt!276956) (size!18247 a!2986)))) (or (is-Undefined!6323 lt!276956) (ite (is-Found!6323 lt!276956) (= (select (arr!17883 a!2986) (index!27565 lt!276956)) k!1786) (ite (is-MissingZero!6323 lt!276956) (= (select (arr!17883 a!2986) (index!27564 lt!276956)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6323 lt!276956) (= (select (arr!17883 a!2986) (index!27567 lt!276956)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!347454 () SeekEntryResult!6323)

(assert (=> d!87973 (= lt!276956 e!347454)))

(declare-fun c!68871 () Bool)

(declare-fun lt!276957 () SeekEntryResult!6323)

(assert (=> d!87973 (= c!68871 (and (is-Intermediate!6323 lt!276957) (undefined!7135 lt!276957)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37262 (_ BitVec 32)) SeekEntryResult!6323)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87973 (= lt!276957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!87973 (validMask!0 mask!3053)))

(assert (=> d!87973 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!276956)))

(declare-fun b!606806 () Bool)

(declare-fun e!347455 () SeekEntryResult!6323)

(assert (=> b!606806 (= e!347455 (seekKeyOrZeroReturnVacant!0 (x!56375 lt!276957) (index!27566 lt!276957) (index!27566 lt!276957) k!1786 a!2986 mask!3053))))

(declare-fun b!606807 () Bool)

(declare-fun c!68870 () Bool)

(declare-fun lt!276955 () (_ BitVec 64))

(assert (=> b!606807 (= c!68870 (= lt!276955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347453 () SeekEntryResult!6323)

(assert (=> b!606807 (= e!347453 e!347455)))

(declare-fun b!606808 () Bool)

(assert (=> b!606808 (= e!347454 Undefined!6323)))

(declare-fun b!606809 () Bool)

(assert (=> b!606809 (= e!347454 e!347453)))

(assert (=> b!606809 (= lt!276955 (select (arr!17883 a!2986) (index!27566 lt!276957)))))

(declare-fun c!68869 () Bool)

(assert (=> b!606809 (= c!68869 (= lt!276955 k!1786))))

(declare-fun b!606810 () Bool)

(assert (=> b!606810 (= e!347455 (MissingZero!6323 (index!27566 lt!276957)))))

(declare-fun b!606811 () Bool)

(assert (=> b!606811 (= e!347453 (Found!6323 (index!27566 lt!276957)))))

(assert (= (and d!87973 c!68871) b!606808))

(assert (= (and d!87973 (not c!68871)) b!606809))

(assert (= (and b!606809 c!68869) b!606811))

(assert (= (and b!606809 (not c!68869)) b!606807))

(assert (= (and b!606807 c!68870) b!606810))

(assert (= (and b!606807 (not c!68870)) b!606806))

(declare-fun m!583637 () Bool)

(assert (=> d!87973 m!583637))

(declare-fun m!583639 () Bool)

(assert (=> d!87973 m!583639))

(assert (=> d!87973 m!583293))

(declare-fun m!583641 () Bool)

(assert (=> d!87973 m!583641))

(declare-fun m!583643 () Bool)

(assert (=> d!87973 m!583643))

(assert (=> d!87973 m!583637))

(declare-fun m!583645 () Bool)

(assert (=> d!87973 m!583645))

(declare-fun m!583647 () Bool)

(assert (=> b!606806 m!583647))

(declare-fun m!583649 () Bool)

(assert (=> b!606809 m!583649))

(assert (=> b!606452 d!87973))

(declare-fun b!606838 () Bool)

(declare-fun e!347477 () Bool)

(declare-fun call!33102 () Bool)

(assert (=> b!606838 (= e!347477 call!33102)))

(declare-fun d!87991 () Bool)

(declare-fun res!389815 () Bool)

(declare-fun e!347476 () Bool)

(assert (=> d!87991 (=> res!389815 e!347476)))

(assert (=> d!87991 (= res!389815 (bvsge #b00000000000000000000000000000000 (size!18247 a!2986)))))

(assert (=> d!87991 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!347476)))

(declare-fun bm!33099 () Bool)

(assert (=> bm!33099 (= call!33102 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!606839 () Bool)

(declare-fun e!347475 () Bool)

(assert (=> b!606839 (= e!347475 e!347477)))

(declare-fun lt!276981 () (_ BitVec 64))

(assert (=> b!606839 (= lt!276981 (select (arr!17883 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276979 () Unit!19318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37262 (_ BitVec 64) (_ BitVec 32)) Unit!19318)

(assert (=> b!606839 (= lt!276979 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276981 #b00000000000000000000000000000000))))

(assert (=> b!606839 (arrayContainsKey!0 a!2986 lt!276981 #b00000000000000000000000000000000)))

(declare-fun lt!276980 () Unit!19318)

(assert (=> b!606839 (= lt!276980 lt!276979)))

(declare-fun res!389814 () Bool)

(assert (=> b!606839 (= res!389814 (= (seekEntryOrOpen!0 (select (arr!17883 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6323 #b00000000000000000000000000000000)))))

(assert (=> b!606839 (=> (not res!389814) (not e!347477))))

(declare-fun b!606840 () Bool)

(assert (=> b!606840 (= e!347476 e!347475)))

(declare-fun c!68879 () Bool)

(assert (=> b!606840 (= c!68879 (validKeyInArray!0 (select (arr!17883 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606841 () Bool)

(assert (=> b!606841 (= e!347475 call!33102)))

(assert (= (and d!87991 (not res!389815)) b!606840))

(assert (= (and b!606840 c!68879) b!606839))

(assert (= (and b!606840 (not c!68879)) b!606841))

(assert (= (and b!606839 res!389814) b!606838))

(assert (= (or b!606838 b!606841) bm!33099))

(declare-fun m!583665 () Bool)

(assert (=> bm!33099 m!583665))

(assert (=> b!606839 m!583583))

(declare-fun m!583667 () Bool)

(assert (=> b!606839 m!583667))

(declare-fun m!583669 () Bool)

(assert (=> b!606839 m!583669))

(assert (=> b!606839 m!583583))

(declare-fun m!583671 () Bool)

(assert (=> b!606839 m!583671))

(assert (=> b!606840 m!583583))

(assert (=> b!606840 m!583583))

(assert (=> b!606840 m!583585))

(assert (=> b!606442 d!87991))

(declare-fun d!87997 () Bool)

(assert (=> d!87997 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55438 d!87997))

(declare-fun d!88011 () Bool)

(assert (=> d!88011 (= (array_inv!13679 a!2986) (bvsge (size!18247 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55438 d!88011))

(declare-fun b!606917 () Bool)

(declare-fun e!347534 () SeekEntryResult!6323)

(declare-fun e!347533 () SeekEntryResult!6323)

(assert (=> b!606917 (= e!347534 e!347533)))

(declare-fun c!68901 () Bool)

(declare-fun lt!277014 () (_ BitVec 64))

(assert (=> b!606917 (= c!68901 (= lt!277014 (select (arr!17883 a!2986) j!136)))))

(declare-fun b!606918 () Bool)

(assert (=> b!606918 (= e!347534 Undefined!6323)))

(declare-fun d!88013 () Bool)

(declare-fun lt!277015 () SeekEntryResult!6323)

(assert (=> d!88013 (and (or (is-Undefined!6323 lt!277015) (not (is-Found!6323 lt!277015)) (and (bvsge (index!27565 lt!277015) #b00000000000000000000000000000000) (bvslt (index!27565 lt!277015) (size!18247 a!2986)))) (or (is-Undefined!6323 lt!277015) (is-Found!6323 lt!277015) (not (is-MissingVacant!6323 lt!277015)) (not (= (index!27567 lt!277015) vacantSpotIndex!68)) (and (bvsge (index!27567 lt!277015) #b00000000000000000000000000000000) (bvslt (index!27567 lt!277015) (size!18247 a!2986)))) (or (is-Undefined!6323 lt!277015) (ite (is-Found!6323 lt!277015) (= (select (arr!17883 a!2986) (index!27565 lt!277015)) (select (arr!17883 a!2986) j!136)) (and (is-MissingVacant!6323 lt!277015) (= (index!27567 lt!277015) vacantSpotIndex!68) (= (select (arr!17883 a!2986) (index!27567 lt!277015)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88013 (= lt!277015 e!347534)))

(declare-fun c!68902 () Bool)

(assert (=> d!88013 (= c!68902 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88013 (= lt!277014 (select (arr!17883 a!2986) index!984))))

(assert (=> d!88013 (validMask!0 mask!3053)))

(assert (=> d!88013 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17883 a!2986) j!136) a!2986 mask!3053) lt!277015)))

(declare-fun b!606919 () Bool)

(assert (=> b!606919 (= e!347533 (Found!6323 index!984))))

(declare-fun b!606920 () Bool)

(declare-fun e!347535 () SeekEntryResult!6323)

(assert (=> b!606920 (= e!347535 (MissingVacant!6323 vacantSpotIndex!68))))

(declare-fun b!606921 () Bool)

(declare-fun c!68900 () Bool)

(assert (=> b!606921 (= c!68900 (= lt!277014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606921 (= e!347533 e!347535)))

(declare-fun b!606922 () Bool)

(assert (=> b!606922 (= e!347535 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17883 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!88013 c!68902) b!606918))

(assert (= (and d!88013 (not c!68902)) b!606917))

(assert (= (and b!606917 c!68901) b!606919))

(assert (= (and b!606917 (not c!68901)) b!606921))

(assert (= (and b!606921 c!68900) b!606920))

(assert (= (and b!606921 (not c!68900)) b!606922))

(declare-fun m!583737 () Bool)

(assert (=> d!88013 m!583737))

(declare-fun m!583739 () Bool)

(assert (=> d!88013 m!583739))

(assert (=> d!88013 m!583303))

(assert (=> d!88013 m!583293))

(assert (=> b!606922 m!583311))

(assert (=> b!606922 m!583311))

(assert (=> b!606922 m!583257))

(declare-fun m!583741 () Bool)

(assert (=> b!606922 m!583741))

(assert (=> b!606463 d!88013))

(declare-fun d!88025 () Bool)

(declare-fun res!389851 () Bool)

(declare-fun e!347536 () Bool)

(assert (=> d!88025 (=> res!389851 e!347536)))

(assert (=> d!88025 (= res!389851 (= (select (arr!17883 lt!276783) index!984) (select (arr!17883 a!2986) j!136)))))

(assert (=> d!88025 (= (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) index!984) e!347536)))

(declare-fun b!606923 () Bool)

(declare-fun e!347537 () Bool)

(assert (=> b!606923 (= e!347536 e!347537)))

(declare-fun res!389852 () Bool)

(assert (=> b!606923 (=> (not res!389852) (not e!347537))))

(assert (=> b!606923 (= res!389852 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18247 lt!276783)))))

(declare-fun b!606924 () Bool)

(assert (=> b!606924 (= e!347537 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88025 (not res!389851)) b!606923))

(assert (= (and b!606923 res!389852) b!606924))

(declare-fun m!583743 () Bool)

(assert (=> d!88025 m!583743))

(assert (=> b!606924 m!583257))

(declare-fun m!583745 () Bool)

(assert (=> b!606924 m!583745))

(assert (=> b!606454 d!88025))

(declare-fun d!88027 () Bool)

(declare-fun res!389853 () Bool)

(declare-fun e!347538 () Bool)

(assert (=> d!88027 (=> res!389853 e!347538)))

(assert (=> d!88027 (= res!389853 (= (select (arr!17883 lt!276783) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17883 a!2986) j!136)))))

(assert (=> d!88027 (= (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!347538)))

(declare-fun b!606925 () Bool)

(declare-fun e!347539 () Bool)

(assert (=> b!606925 (= e!347538 e!347539)))

(declare-fun res!389854 () Bool)

(assert (=> b!606925 (=> (not res!389854) (not e!347539))))

(assert (=> b!606925 (= res!389854 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18247 lt!276783)))))

(declare-fun b!606926 () Bool)

(assert (=> b!606926 (= e!347539 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88027 (not res!389853)) b!606925))

(assert (= (and b!606925 res!389854) b!606926))

(declare-fun m!583747 () Bool)

(assert (=> d!88027 m!583747))

(assert (=> b!606926 m!583257))

(declare-fun m!583749 () Bool)

(assert (=> b!606926 m!583749))

(assert (=> b!606443 d!88027))

(declare-fun d!88029 () Bool)

(assert (=> d!88029 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277016 () Unit!19318)

(assert (=> d!88029 (= lt!277016 (choose!114 lt!276783 (select (arr!17883 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88029 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88029 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276783 (select (arr!17883 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!277016)))

(declare-fun bs!18568 () Bool)

(assert (= bs!18568 d!88029))

(assert (=> bs!18568 m!583257))

(assert (=> bs!18568 m!583259))

(assert (=> bs!18568 m!583257))

(declare-fun m!583751 () Bool)

(assert (=> bs!18568 m!583751))

(assert (=> b!606443 d!88029))

(declare-fun d!88031 () Bool)

(declare-fun res!389855 () Bool)

(declare-fun e!347540 () Bool)

(assert (=> d!88031 (=> res!389855 e!347540)))

(assert (=> d!88031 (= res!389855 (= (select (arr!17883 lt!276783) j!136) (select (arr!17883 a!2986) j!136)))))

(assert (=> d!88031 (= (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) j!136) e!347540)))

(declare-fun b!606927 () Bool)

(declare-fun e!347541 () Bool)

(assert (=> b!606927 (= e!347540 e!347541)))

(declare-fun res!389856 () Bool)

(assert (=> b!606927 (=> (not res!389856) (not e!347541))))

(assert (=> b!606927 (= res!389856 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18247 lt!276783)))))

(declare-fun b!606928 () Bool)

(assert (=> b!606928 (= e!347541 (arrayContainsKey!0 lt!276783 (select (arr!17883 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88031 (not res!389855)) b!606927))

(assert (= (and b!606927 res!389856) b!606928))

(assert (=> d!88031 m!583521))

(assert (=> b!606928 m!583257))

(declare-fun m!583753 () Bool)

(assert (=> b!606928 m!583753))

(assert (=> b!606443 d!88031))

(declare-fun d!88033 () Bool)

(assert (=> d!88033 (= (validKeyInArray!0 (select (arr!17883 a!2986) j!136)) (and (not (= (select (arr!17883 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17883 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606465 d!88033))

(declare-fun d!88035 () Bool)

(declare-fun res!389861 () Bool)

(declare-fun e!347546 () Bool)

(assert (=> d!88035 (=> res!389861 e!347546)))

(assert (=> d!88035 (= res!389861 (is-Nil!11921 Nil!11921))))

(assert (=> d!88035 (= (noDuplicate!306 Nil!11921) e!347546)))

(declare-fun b!606933 () Bool)

(declare-fun e!347547 () Bool)

(assert (=> b!606933 (= e!347546 e!347547)))

(declare-fun res!389862 () Bool)

(assert (=> b!606933 (=> (not res!389862) (not e!347547))))

(assert (=> b!606933 (= res!389862 (not (contains!3000 (t!18152 Nil!11921) (h!12965 Nil!11921))))))

(declare-fun b!606934 () Bool)

(assert (=> b!606934 (= e!347547 (noDuplicate!306 (t!18152 Nil!11921)))))

