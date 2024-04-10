; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55584 () Bool)

(assert start!55584)

(declare-fun b!608835 () Bool)

(declare-fun res!391448 () Bool)

(declare-fun e!348690 () Bool)

(assert (=> b!608835 (=> (not res!391448) (not e!348690))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608835 (= res!391448 (validKeyInArray!0 k0!1786))))

(declare-fun b!608836 () Bool)

(declare-fun e!348691 () Bool)

(assert (=> b!608836 (= e!348691 true)))

(declare-fun lt!278212 () Bool)

(declare-datatypes ((List!11949 0))(
  ( (Nil!11946) (Cons!11945 (h!12990 (_ BitVec 64)) (t!18177 List!11949)) )
))
(declare-fun contains!3025 (List!11949 (_ BitVec 64)) Bool)

(assert (=> b!608836 (= lt!278212 (contains!3025 Nil!11946 k0!1786))))

(declare-fun b!608837 () Bool)

(declare-fun e!348684 () Bool)

(declare-fun e!348692 () Bool)

(assert (=> b!608837 (= e!348684 e!348692)))

(declare-fun res!391463 () Bool)

(assert (=> b!608837 (=> (not res!391463) (not e!348692))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37315 0))(
  ( (array!37316 (arr!17908 (Array (_ BitVec 32) (_ BitVec 64))) (size!18272 (_ BitVec 32))) )
))
(declare-fun lt!278202 () array!37315)

(declare-fun a!2986 () array!37315)

(declare-fun arrayContainsKey!0 (array!37315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608837 (= res!391463 (arrayContainsKey!0 lt!278202 (select (arr!17908 a!2986) j!136) j!136))))

(declare-fun b!608838 () Bool)

(declare-fun e!348681 () Bool)

(declare-fun e!348689 () Bool)

(assert (=> b!608838 (= e!348681 e!348689)))

(declare-fun res!391455 () Bool)

(assert (=> b!608838 (=> (not res!391455) (not e!348689))))

(declare-datatypes ((SeekEntryResult!6348 0))(
  ( (MissingZero!6348 (index!27667 (_ BitVec 32))) (Found!6348 (index!27668 (_ BitVec 32))) (Intermediate!6348 (undefined!7160 Bool) (index!27669 (_ BitVec 32)) (x!56473 (_ BitVec 32))) (Undefined!6348) (MissingVacant!6348 (index!27670 (_ BitVec 32))) )
))
(declare-fun lt!278209 () SeekEntryResult!6348)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!608838 (= res!391455 (and (= lt!278209 (Found!6348 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17908 a!2986) index!984) (select (arr!17908 a!2986) j!136))) (not (= (select (arr!17908 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37315 (_ BitVec 32)) SeekEntryResult!6348)

(assert (=> b!608838 (= lt!278209 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17908 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608839 () Bool)

(declare-fun res!391451 () Bool)

(declare-fun e!348679 () Bool)

(assert (=> b!608839 (=> (not res!391451) (not e!348679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37315 (_ BitVec 32)) Bool)

(assert (=> b!608839 (= res!391451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608840 () Bool)

(declare-datatypes ((Unit!19468 0))(
  ( (Unit!19469) )
))
(declare-fun e!348680 () Unit!19468)

(declare-fun Unit!19470 () Unit!19468)

(assert (=> b!608840 (= e!348680 Unit!19470)))

(assert (=> b!608840 false))

(declare-fun b!608841 () Bool)

(declare-fun e!348683 () Unit!19468)

(declare-fun Unit!19471 () Unit!19468)

(assert (=> b!608841 (= e!348683 Unit!19471)))

(declare-fun lt!278214 () Unit!19468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37315 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19468)

(assert (=> b!608841 (= lt!278214 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278202 (select (arr!17908 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608841 (arrayContainsKey!0 lt!278202 (select (arr!17908 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278211 () Unit!19468)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37315 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11949) Unit!19468)

(assert (=> b!608841 (= lt!278211 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11946))))

(declare-fun arrayNoDuplicates!0 (array!37315 (_ BitVec 32) List!11949) Bool)

(assert (=> b!608841 (arrayNoDuplicates!0 lt!278202 #b00000000000000000000000000000000 Nil!11946)))

(declare-fun lt!278207 () Unit!19468)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37315 (_ BitVec 32) (_ BitVec 32)) Unit!19468)

(assert (=> b!608841 (= lt!278207 (lemmaNoDuplicateFromThenFromBigger!0 lt!278202 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608841 (arrayNoDuplicates!0 lt!278202 j!136 Nil!11946)))

(declare-fun lt!278216 () Unit!19468)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37315 (_ BitVec 64) (_ BitVec 32) List!11949) Unit!19468)

(assert (=> b!608841 (= lt!278216 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278202 (select (arr!17908 a!2986) j!136) j!136 Nil!11946))))

(assert (=> b!608841 false))

(declare-fun e!348688 () Bool)

(declare-fun b!608842 () Bool)

(assert (=> b!608842 (= e!348688 (arrayContainsKey!0 lt!278202 (select (arr!17908 a!2986) j!136) index!984))))

(declare-fun b!608843 () Bool)

(declare-fun res!391457 () Bool)

(assert (=> b!608843 (=> (not res!391457) (not e!348690))))

(assert (=> b!608843 (= res!391457 (and (= (size!18272 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18272 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18272 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608844 () Bool)

(declare-fun res!391461 () Bool)

(assert (=> b!608844 (=> (not res!391461) (not e!348679))))

(assert (=> b!608844 (= res!391461 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11946))))

(declare-fun b!608845 () Bool)

(declare-fun res!391459 () Bool)

(assert (=> b!608845 (=> (not res!391459) (not e!348690))))

(assert (=> b!608845 (= res!391459 (validKeyInArray!0 (select (arr!17908 a!2986) j!136)))))

(declare-fun b!608846 () Bool)

(declare-fun res!391449 () Bool)

(assert (=> b!608846 (=> res!391449 e!348691)))

(assert (=> b!608846 (= res!391449 (contains!3025 Nil!11946 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608847 () Bool)

(declare-fun e!348693 () Bool)

(declare-fun lt!278206 () SeekEntryResult!6348)

(assert (=> b!608847 (= e!348693 (= lt!278209 lt!278206))))

(declare-fun b!608849 () Bool)

(declare-fun e!348682 () Bool)

(assert (=> b!608849 (= e!348682 e!348684)))

(declare-fun res!391460 () Bool)

(assert (=> b!608849 (=> res!391460 e!348684)))

(declare-fun lt!278204 () (_ BitVec 64))

(declare-fun lt!278203 () (_ BitVec 64))

(assert (=> b!608849 (= res!391460 (or (not (= (select (arr!17908 a!2986) j!136) lt!278203)) (not (= (select (arr!17908 a!2986) j!136) lt!278204)) (bvsge j!136 index!984)))))

(declare-fun b!608850 () Bool)

(assert (=> b!608850 (= e!348692 (arrayContainsKey!0 lt!278202 (select (arr!17908 a!2986) j!136) index!984))))

(declare-fun b!608851 () Bool)

(assert (=> b!608851 (= e!348690 e!348679)))

(declare-fun res!391469 () Bool)

(assert (=> b!608851 (=> (not res!391469) (not e!348679))))

(declare-fun lt!278218 () SeekEntryResult!6348)

(assert (=> b!608851 (= res!391469 (or (= lt!278218 (MissingZero!6348 i!1108)) (= lt!278218 (MissingVacant!6348 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37315 (_ BitVec 32)) SeekEntryResult!6348)

(assert (=> b!608851 (= lt!278218 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608852 () Bool)

(declare-fun e!348686 () Bool)

(assert (=> b!608852 (= e!348686 e!348691)))

(declare-fun res!391462 () Bool)

(assert (=> b!608852 (=> res!391462 e!348691)))

(assert (=> b!608852 (= res!391462 (or (bvsge (size!18272 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18272 a!2986))))))

(assert (=> b!608852 (arrayContainsKey!0 lt!278202 (select (arr!17908 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278213 () Unit!19468)

(assert (=> b!608852 (= lt!278213 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278202 (select (arr!17908 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608852 e!348688))

(declare-fun res!391458 () Bool)

(assert (=> b!608852 (=> (not res!391458) (not e!348688))))

(assert (=> b!608852 (= res!391458 (arrayContainsKey!0 lt!278202 (select (arr!17908 a!2986) j!136) j!136))))

(declare-fun b!608853 () Bool)

(declare-fun res!391452 () Bool)

(assert (=> b!608853 (=> (not res!391452) (not e!348690))))

(assert (=> b!608853 (= res!391452 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608854 () Bool)

(declare-fun e!348687 () Bool)

(declare-fun e!348678 () Bool)

(assert (=> b!608854 (= e!348687 e!348678)))

(declare-fun res!391465 () Bool)

(assert (=> b!608854 (=> res!391465 e!348678)))

(assert (=> b!608854 (= res!391465 (or (not (= (select (arr!17908 a!2986) j!136) lt!278203)) (not (= (select (arr!17908 a!2986) j!136) lt!278204))))))

(assert (=> b!608854 e!348682))

(declare-fun res!391456 () Bool)

(assert (=> b!608854 (=> (not res!391456) (not e!348682))))

(assert (=> b!608854 (= res!391456 (= lt!278204 (select (arr!17908 a!2986) j!136)))))

(assert (=> b!608854 (= lt!278204 (select (store (arr!17908 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608855 () Bool)

(declare-fun res!391467 () Bool)

(assert (=> b!608855 (=> res!391467 e!348691)))

(declare-fun noDuplicate!331 (List!11949) Bool)

(assert (=> b!608855 (= res!391467 (not (noDuplicate!331 Nil!11946)))))

(declare-fun b!608856 () Bool)

(assert (=> b!608856 (= e!348689 (not e!348687))))

(declare-fun res!391466 () Bool)

(assert (=> b!608856 (=> res!391466 e!348687)))

(declare-fun lt!278217 () SeekEntryResult!6348)

(assert (=> b!608856 (= res!391466 (not (= lt!278217 (Found!6348 index!984))))))

(declare-fun lt!278205 () Unit!19468)

(assert (=> b!608856 (= lt!278205 e!348680)))

(declare-fun c!69062 () Bool)

(assert (=> b!608856 (= c!69062 (= lt!278217 Undefined!6348))))

(assert (=> b!608856 (= lt!278217 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278203 lt!278202 mask!3053))))

(assert (=> b!608856 e!348693))

(declare-fun res!391453 () Bool)

(assert (=> b!608856 (=> (not res!391453) (not e!348693))))

(declare-fun lt!278215 () (_ BitVec 32))

(assert (=> b!608856 (= res!391453 (= lt!278206 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278215 vacantSpotIndex!68 lt!278203 lt!278202 mask!3053)))))

(assert (=> b!608856 (= lt!278206 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278215 vacantSpotIndex!68 (select (arr!17908 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608856 (= lt!278203 (select (store (arr!17908 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278208 () Unit!19468)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19468)

(assert (=> b!608856 (= lt!278208 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278215 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608856 (= lt!278215 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608857 () Bool)

(declare-fun res!391464 () Bool)

(assert (=> b!608857 (=> (not res!391464) (not e!348679))))

(assert (=> b!608857 (= res!391464 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17908 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608858 () Bool)

(declare-fun Unit!19472 () Unit!19468)

(assert (=> b!608858 (= e!348683 Unit!19472)))

(declare-fun b!608859 () Bool)

(assert (=> b!608859 (= e!348678 e!348686)))

(declare-fun res!391447 () Bool)

(assert (=> b!608859 (=> res!391447 e!348686)))

(assert (=> b!608859 (= res!391447 (bvsge index!984 j!136))))

(declare-fun lt!278210 () Unit!19468)

(assert (=> b!608859 (= lt!278210 e!348683)))

(declare-fun c!69061 () Bool)

(assert (=> b!608859 (= c!69061 (bvslt j!136 index!984))))

(declare-fun b!608860 () Bool)

(declare-fun Unit!19473 () Unit!19468)

(assert (=> b!608860 (= e!348680 Unit!19473)))

(declare-fun b!608861 () Bool)

(assert (=> b!608861 (= e!348679 e!348681)))

(declare-fun res!391454 () Bool)

(assert (=> b!608861 (=> (not res!391454) (not e!348681))))

(assert (=> b!608861 (= res!391454 (= (select (store (arr!17908 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608861 (= lt!278202 (array!37316 (store (arr!17908 a!2986) i!1108 k0!1786) (size!18272 a!2986)))))

(declare-fun b!608848 () Bool)

(declare-fun res!391450 () Bool)

(assert (=> b!608848 (=> res!391450 e!348691)))

(assert (=> b!608848 (= res!391450 (contains!3025 Nil!11946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!391468 () Bool)

(assert (=> start!55584 (=> (not res!391468) (not e!348690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55584 (= res!391468 (validMask!0 mask!3053))))

(assert (=> start!55584 e!348690))

(assert (=> start!55584 true))

(declare-fun array_inv!13704 (array!37315) Bool)

(assert (=> start!55584 (array_inv!13704 a!2986)))

(assert (= (and start!55584 res!391468) b!608843))

(assert (= (and b!608843 res!391457) b!608845))

(assert (= (and b!608845 res!391459) b!608835))

(assert (= (and b!608835 res!391448) b!608853))

(assert (= (and b!608853 res!391452) b!608851))

(assert (= (and b!608851 res!391469) b!608839))

(assert (= (and b!608839 res!391451) b!608844))

(assert (= (and b!608844 res!391461) b!608857))

(assert (= (and b!608857 res!391464) b!608861))

(assert (= (and b!608861 res!391454) b!608838))

(assert (= (and b!608838 res!391455) b!608856))

(assert (= (and b!608856 res!391453) b!608847))

(assert (= (and b!608856 c!69062) b!608840))

(assert (= (and b!608856 (not c!69062)) b!608860))

(assert (= (and b!608856 (not res!391466)) b!608854))

(assert (= (and b!608854 res!391456) b!608849))

(assert (= (and b!608849 (not res!391460)) b!608837))

(assert (= (and b!608837 res!391463) b!608850))

(assert (= (and b!608854 (not res!391465)) b!608859))

(assert (= (and b!608859 c!69061) b!608841))

(assert (= (and b!608859 (not c!69061)) b!608858))

(assert (= (and b!608859 (not res!391447)) b!608852))

(assert (= (and b!608852 res!391458) b!608842))

(assert (= (and b!608852 (not res!391462)) b!608855))

(assert (= (and b!608855 (not res!391467)) b!608848))

(assert (= (and b!608848 (not res!391450)) b!608846))

(assert (= (and b!608846 (not res!391449)) b!608836))

(declare-fun m!585419 () Bool)

(assert (=> b!608849 m!585419))

(declare-fun m!585421 () Bool)

(assert (=> b!608856 m!585421))

(declare-fun m!585423 () Bool)

(assert (=> b!608856 m!585423))

(assert (=> b!608856 m!585419))

(declare-fun m!585425 () Bool)

(assert (=> b!608856 m!585425))

(declare-fun m!585427 () Bool)

(assert (=> b!608856 m!585427))

(declare-fun m!585429 () Bool)

(assert (=> b!608856 m!585429))

(assert (=> b!608856 m!585419))

(declare-fun m!585431 () Bool)

(assert (=> b!608856 m!585431))

(declare-fun m!585433 () Bool)

(assert (=> b!608856 m!585433))

(assert (=> b!608850 m!585419))

(assert (=> b!608850 m!585419))

(declare-fun m!585435 () Bool)

(assert (=> b!608850 m!585435))

(declare-fun m!585437 () Bool)

(assert (=> b!608855 m!585437))

(assert (=> b!608861 m!585425))

(declare-fun m!585439 () Bool)

(assert (=> b!608861 m!585439))

(declare-fun m!585441 () Bool)

(assert (=> b!608846 m!585441))

(declare-fun m!585443 () Bool)

(assert (=> b!608838 m!585443))

(assert (=> b!608838 m!585419))

(assert (=> b!608838 m!585419))

(declare-fun m!585445 () Bool)

(assert (=> b!608838 m!585445))

(declare-fun m!585447 () Bool)

(assert (=> b!608853 m!585447))

(declare-fun m!585449 () Bool)

(assert (=> b!608851 m!585449))

(declare-fun m!585451 () Bool)

(assert (=> b!608857 m!585451))

(declare-fun m!585453 () Bool)

(assert (=> b!608841 m!585453))

(declare-fun m!585455 () Bool)

(assert (=> b!608841 m!585455))

(assert (=> b!608841 m!585419))

(assert (=> b!608841 m!585419))

(declare-fun m!585457 () Bool)

(assert (=> b!608841 m!585457))

(assert (=> b!608841 m!585419))

(declare-fun m!585459 () Bool)

(assert (=> b!608841 m!585459))

(declare-fun m!585461 () Bool)

(assert (=> b!608841 m!585461))

(declare-fun m!585463 () Bool)

(assert (=> b!608841 m!585463))

(assert (=> b!608841 m!585419))

(declare-fun m!585465 () Bool)

(assert (=> b!608841 m!585465))

(declare-fun m!585467 () Bool)

(assert (=> start!55584 m!585467))

(declare-fun m!585469 () Bool)

(assert (=> start!55584 m!585469))

(assert (=> b!608854 m!585419))

(assert (=> b!608854 m!585425))

(declare-fun m!585471 () Bool)

(assert (=> b!608854 m!585471))

(assert (=> b!608845 m!585419))

(assert (=> b!608845 m!585419))

(declare-fun m!585473 () Bool)

(assert (=> b!608845 m!585473))

(declare-fun m!585475 () Bool)

(assert (=> b!608848 m!585475))

(assert (=> b!608842 m!585419))

(assert (=> b!608842 m!585419))

(assert (=> b!608842 m!585435))

(declare-fun m!585477 () Bool)

(assert (=> b!608835 m!585477))

(declare-fun m!585479 () Bool)

(assert (=> b!608839 m!585479))

(assert (=> b!608837 m!585419))

(assert (=> b!608837 m!585419))

(declare-fun m!585481 () Bool)

(assert (=> b!608837 m!585481))

(declare-fun m!585483 () Bool)

(assert (=> b!608844 m!585483))

(declare-fun m!585485 () Bool)

(assert (=> b!608836 m!585485))

(assert (=> b!608852 m!585419))

(assert (=> b!608852 m!585419))

(declare-fun m!585487 () Bool)

(assert (=> b!608852 m!585487))

(assert (=> b!608852 m!585419))

(declare-fun m!585489 () Bool)

(assert (=> b!608852 m!585489))

(assert (=> b!608852 m!585419))

(assert (=> b!608852 m!585481))

(check-sat (not b!608851) (not b!608848) (not b!608842) (not b!608836) (not b!608844) (not b!608841) (not b!608838) (not b!608845) (not b!608853) (not b!608837) (not b!608850) (not b!608856) (not start!55584) (not b!608835) (not b!608855) (not b!608846) (not b!608839) (not b!608852))
(check-sat)
