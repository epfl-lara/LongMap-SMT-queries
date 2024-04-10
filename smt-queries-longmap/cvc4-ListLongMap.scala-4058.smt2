; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55580 () Bool)

(assert start!55580)

(declare-fun b!608673 () Bool)

(declare-fun e!348595 () Bool)

(declare-fun e!348594 () Bool)

(assert (=> b!608673 (= e!348595 e!348594)))

(declare-fun res!391331 () Bool)

(assert (=> b!608673 (=> (not res!391331) (not e!348594))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6346 0))(
  ( (MissingZero!6346 (index!27659 (_ BitVec 32))) (Found!6346 (index!27660 (_ BitVec 32))) (Intermediate!6346 (undefined!7158 Bool) (index!27661 (_ BitVec 32)) (x!56463 (_ BitVec 32))) (Undefined!6346) (MissingVacant!6346 (index!27662 (_ BitVec 32))) )
))
(declare-fun lt!278100 () SeekEntryResult!6346)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37311 0))(
  ( (array!37312 (arr!17906 (Array (_ BitVec 32) (_ BitVec 64))) (size!18270 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37311)

(assert (=> b!608673 (= res!391331 (and (= lt!278100 (Found!6346 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17906 a!2986) index!984) (select (arr!17906 a!2986) j!136))) (not (= (select (arr!17906 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37311 (_ BitVec 32)) SeekEntryResult!6346)

(assert (=> b!608673 (= lt!278100 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17906 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608674 () Bool)

(declare-fun res!391322 () Bool)

(declare-fun e!348589 () Bool)

(assert (=> b!608674 (=> res!391322 e!348589)))

(declare-datatypes ((List!11947 0))(
  ( (Nil!11944) (Cons!11943 (h!12988 (_ BitVec 64)) (t!18175 List!11947)) )
))
(declare-fun contains!3023 (List!11947 (_ BitVec 64)) Bool)

(assert (=> b!608674 (= res!391322 (contains!3023 Nil!11944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608675 () Bool)

(assert (=> b!608675 (= e!348589 true)))

(declare-fun lt!278116 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!608675 (= lt!278116 (contains!3023 Nil!11944 k!1786))))

(declare-fun b!608676 () Bool)

(declare-fun e!348582 () Bool)

(declare-fun lt!278103 () SeekEntryResult!6346)

(assert (=> b!608676 (= e!348582 (= lt!278100 lt!278103))))

(declare-fun b!608677 () Bool)

(declare-fun e!348585 () Bool)

(declare-fun e!348597 () Bool)

(assert (=> b!608677 (= e!348585 e!348597)))

(declare-fun res!391330 () Bool)

(assert (=> b!608677 (=> res!391330 e!348597)))

(declare-fun lt!278101 () (_ BitVec 64))

(declare-fun lt!278113 () (_ BitVec 64))

(assert (=> b!608677 (= res!391330 (or (not (= (select (arr!17906 a!2986) j!136) lt!278101)) (not (= (select (arr!17906 a!2986) j!136) lt!278113))))))

(declare-fun e!348588 () Bool)

(assert (=> b!608677 e!348588))

(declare-fun res!391316 () Bool)

(assert (=> b!608677 (=> (not res!391316) (not e!348588))))

(assert (=> b!608677 (= res!391316 (= lt!278113 (select (arr!17906 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608677 (= lt!278113 (select (store (arr!17906 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!608678 () Bool)

(declare-datatypes ((Unit!19456 0))(
  ( (Unit!19457) )
))
(declare-fun e!348596 () Unit!19456)

(declare-fun Unit!19458 () Unit!19456)

(assert (=> b!608678 (= e!348596 Unit!19458)))

(declare-fun lt!278115 () array!37311)

(declare-fun lt!278104 () Unit!19456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19456)

(assert (=> b!608678 (= lt!278104 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278115 (select (arr!17906 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608678 (arrayContainsKey!0 lt!278115 (select (arr!17906 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278105 () Unit!19456)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11947) Unit!19456)

(assert (=> b!608678 (= lt!278105 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11944))))

(declare-fun arrayNoDuplicates!0 (array!37311 (_ BitVec 32) List!11947) Bool)

(assert (=> b!608678 (arrayNoDuplicates!0 lt!278115 #b00000000000000000000000000000000 Nil!11944)))

(declare-fun lt!278109 () Unit!19456)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37311 (_ BitVec 32) (_ BitVec 32)) Unit!19456)

(assert (=> b!608678 (= lt!278109 (lemmaNoDuplicateFromThenFromBigger!0 lt!278115 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608678 (arrayNoDuplicates!0 lt!278115 j!136 Nil!11944)))

(declare-fun lt!278107 () Unit!19456)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37311 (_ BitVec 64) (_ BitVec 32) List!11947) Unit!19456)

(assert (=> b!608678 (= lt!278107 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278115 (select (arr!17906 a!2986) j!136) j!136 Nil!11944))))

(assert (=> b!608678 false))

(declare-fun b!608679 () Bool)

(declare-fun e!348586 () Bool)

(assert (=> b!608679 (= e!348588 e!348586)))

(declare-fun res!391326 () Bool)

(assert (=> b!608679 (=> res!391326 e!348586)))

(assert (=> b!608679 (= res!391326 (or (not (= (select (arr!17906 a!2986) j!136) lt!278101)) (not (= (select (arr!17906 a!2986) j!136) lt!278113)) (bvsge j!136 index!984)))))

(declare-fun b!608680 () Bool)

(declare-fun res!391320 () Bool)

(assert (=> b!608680 (=> res!391320 e!348589)))

(assert (=> b!608680 (= res!391320 (contains!3023 Nil!11944 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608681 () Bool)

(declare-fun Unit!19459 () Unit!19456)

(assert (=> b!608681 (= e!348596 Unit!19459)))

(declare-fun b!608682 () Bool)

(declare-fun e!348593 () Bool)

(assert (=> b!608682 (= e!348593 e!348595)))

(declare-fun res!391325 () Bool)

(assert (=> b!608682 (=> (not res!391325) (not e!348595))))

(assert (=> b!608682 (= res!391325 (= (select (store (arr!17906 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608682 (= lt!278115 (array!37312 (store (arr!17906 a!2986) i!1108 k!1786) (size!18270 a!2986)))))

(declare-fun b!608683 () Bool)

(declare-fun e!348592 () Bool)

(assert (=> b!608683 (= e!348592 e!348593)))

(declare-fun res!391312 () Bool)

(assert (=> b!608683 (=> (not res!391312) (not e!348593))))

(declare-fun lt!278112 () SeekEntryResult!6346)

(assert (=> b!608683 (= res!391312 (or (= lt!278112 (MissingZero!6346 i!1108)) (= lt!278112 (MissingVacant!6346 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37311 (_ BitVec 32)) SeekEntryResult!6346)

(assert (=> b!608683 (= lt!278112 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!608684 () Bool)

(declare-fun res!391319 () Bool)

(assert (=> b!608684 (=> (not res!391319) (not e!348592))))

(assert (=> b!608684 (= res!391319 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!391323 () Bool)

(assert (=> start!55580 (=> (not res!391323) (not e!348592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55580 (= res!391323 (validMask!0 mask!3053))))

(assert (=> start!55580 e!348592))

(assert (=> start!55580 true))

(declare-fun array_inv!13702 (array!37311) Bool)

(assert (=> start!55580 (array_inv!13702 a!2986)))

(declare-fun b!608685 () Bool)

(declare-fun res!391313 () Bool)

(assert (=> b!608685 (=> (not res!391313) (not e!348593))))

(assert (=> b!608685 (= res!391313 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17906 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608686 () Bool)

(declare-fun e!348587 () Unit!19456)

(declare-fun Unit!19460 () Unit!19456)

(assert (=> b!608686 (= e!348587 Unit!19460)))

(assert (=> b!608686 false))

(declare-fun b!608687 () Bool)

(declare-fun e!348583 () Bool)

(assert (=> b!608687 (= e!348597 e!348583)))

(declare-fun res!391310 () Bool)

(assert (=> b!608687 (=> res!391310 e!348583)))

(assert (=> b!608687 (= res!391310 (bvsge index!984 j!136))))

(declare-fun lt!278108 () Unit!19456)

(assert (=> b!608687 (= lt!278108 e!348596)))

(declare-fun c!69050 () Bool)

(assert (=> b!608687 (= c!69050 (bvslt j!136 index!984))))

(declare-fun b!608688 () Bool)

(declare-fun res!391311 () Bool)

(assert (=> b!608688 (=> (not res!391311) (not e!348592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608688 (= res!391311 (validKeyInArray!0 k!1786))))

(declare-fun b!608689 () Bool)

(assert (=> b!608689 (= e!348594 (not e!348585))))

(declare-fun res!391309 () Bool)

(assert (=> b!608689 (=> res!391309 e!348585)))

(declare-fun lt!278106 () SeekEntryResult!6346)

(assert (=> b!608689 (= res!391309 (not (= lt!278106 (Found!6346 index!984))))))

(declare-fun lt!278114 () Unit!19456)

(assert (=> b!608689 (= lt!278114 e!348587)))

(declare-fun c!69049 () Bool)

(assert (=> b!608689 (= c!69049 (= lt!278106 Undefined!6346))))

(assert (=> b!608689 (= lt!278106 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278101 lt!278115 mask!3053))))

(assert (=> b!608689 e!348582))

(declare-fun res!391329 () Bool)

(assert (=> b!608689 (=> (not res!391329) (not e!348582))))

(declare-fun lt!278111 () (_ BitVec 32))

(assert (=> b!608689 (= res!391329 (= lt!278103 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278111 vacantSpotIndex!68 lt!278101 lt!278115 mask!3053)))))

(assert (=> b!608689 (= lt!278103 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278111 vacantSpotIndex!68 (select (arr!17906 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608689 (= lt!278101 (select (store (arr!17906 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278102 () Unit!19456)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19456)

(assert (=> b!608689 (= lt!278102 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278111 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608689 (= lt!278111 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608690 () Bool)

(declare-fun Unit!19461 () Unit!19456)

(assert (=> b!608690 (= e!348587 Unit!19461)))

(declare-fun b!608691 () Bool)

(assert (=> b!608691 (= e!348583 e!348589)))

(declare-fun res!391318 () Bool)

(assert (=> b!608691 (=> res!391318 e!348589)))

(assert (=> b!608691 (= res!391318 (or (bvsge (size!18270 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18270 a!2986))))))

(assert (=> b!608691 (arrayContainsKey!0 lt!278115 (select (arr!17906 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278110 () Unit!19456)

(assert (=> b!608691 (= lt!278110 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278115 (select (arr!17906 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348591 () Bool)

(assert (=> b!608691 e!348591))

(declare-fun res!391315 () Bool)

(assert (=> b!608691 (=> (not res!391315) (not e!348591))))

(assert (=> b!608691 (= res!391315 (arrayContainsKey!0 lt!278115 (select (arr!17906 a!2986) j!136) j!136))))

(declare-fun b!608692 () Bool)

(declare-fun res!391327 () Bool)

(assert (=> b!608692 (=> (not res!391327) (not e!348592))))

(assert (=> b!608692 (= res!391327 (and (= (size!18270 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18270 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18270 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608693 () Bool)

(declare-fun e!348590 () Bool)

(assert (=> b!608693 (= e!348586 e!348590)))

(declare-fun res!391321 () Bool)

(assert (=> b!608693 (=> (not res!391321) (not e!348590))))

(assert (=> b!608693 (= res!391321 (arrayContainsKey!0 lt!278115 (select (arr!17906 a!2986) j!136) j!136))))

(declare-fun b!608694 () Bool)

(declare-fun res!391317 () Bool)

(assert (=> b!608694 (=> (not res!391317) (not e!348592))))

(assert (=> b!608694 (= res!391317 (validKeyInArray!0 (select (arr!17906 a!2986) j!136)))))

(declare-fun b!608695 () Bool)

(assert (=> b!608695 (= e!348591 (arrayContainsKey!0 lt!278115 (select (arr!17906 a!2986) j!136) index!984))))

(declare-fun b!608696 () Bool)

(declare-fun res!391328 () Bool)

(assert (=> b!608696 (=> (not res!391328) (not e!348593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37311 (_ BitVec 32)) Bool)

(assert (=> b!608696 (= res!391328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608697 () Bool)

(declare-fun res!391314 () Bool)

(assert (=> b!608697 (=> (not res!391314) (not e!348593))))

(assert (=> b!608697 (= res!391314 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11944))))

(declare-fun b!608698 () Bool)

(assert (=> b!608698 (= e!348590 (arrayContainsKey!0 lt!278115 (select (arr!17906 a!2986) j!136) index!984))))

(declare-fun b!608699 () Bool)

(declare-fun res!391324 () Bool)

(assert (=> b!608699 (=> res!391324 e!348589)))

(declare-fun noDuplicate!329 (List!11947) Bool)

(assert (=> b!608699 (= res!391324 (not (noDuplicate!329 Nil!11944)))))

(assert (= (and start!55580 res!391323) b!608692))

(assert (= (and b!608692 res!391327) b!608694))

(assert (= (and b!608694 res!391317) b!608688))

(assert (= (and b!608688 res!391311) b!608684))

(assert (= (and b!608684 res!391319) b!608683))

(assert (= (and b!608683 res!391312) b!608696))

(assert (= (and b!608696 res!391328) b!608697))

(assert (= (and b!608697 res!391314) b!608685))

(assert (= (and b!608685 res!391313) b!608682))

(assert (= (and b!608682 res!391325) b!608673))

(assert (= (and b!608673 res!391331) b!608689))

(assert (= (and b!608689 res!391329) b!608676))

(assert (= (and b!608689 c!69049) b!608686))

(assert (= (and b!608689 (not c!69049)) b!608690))

(assert (= (and b!608689 (not res!391309)) b!608677))

(assert (= (and b!608677 res!391316) b!608679))

(assert (= (and b!608679 (not res!391326)) b!608693))

(assert (= (and b!608693 res!391321) b!608698))

(assert (= (and b!608677 (not res!391330)) b!608687))

(assert (= (and b!608687 c!69050) b!608678))

(assert (= (and b!608687 (not c!69050)) b!608681))

(assert (= (and b!608687 (not res!391310)) b!608691))

(assert (= (and b!608691 res!391315) b!608695))

(assert (= (and b!608691 (not res!391318)) b!608699))

(assert (= (and b!608699 (not res!391324)) b!608674))

(assert (= (and b!608674 (not res!391322)) b!608680))

(assert (= (and b!608680 (not res!391320)) b!608675))

(declare-fun m!585275 () Bool)

(assert (=> b!608696 m!585275))

(declare-fun m!585277 () Bool)

(assert (=> b!608697 m!585277))

(declare-fun m!585279 () Bool)

(assert (=> b!608695 m!585279))

(assert (=> b!608695 m!585279))

(declare-fun m!585281 () Bool)

(assert (=> b!608695 m!585281))

(declare-fun m!585283 () Bool)

(assert (=> b!608674 m!585283))

(assert (=> b!608698 m!585279))

(assert (=> b!608698 m!585279))

(assert (=> b!608698 m!585281))

(declare-fun m!585285 () Bool)

(assert (=> b!608689 m!585285))

(declare-fun m!585287 () Bool)

(assert (=> b!608689 m!585287))

(assert (=> b!608689 m!585279))

(declare-fun m!585289 () Bool)

(assert (=> b!608689 m!585289))

(declare-fun m!585291 () Bool)

(assert (=> b!608689 m!585291))

(assert (=> b!608689 m!585279))

(declare-fun m!585293 () Bool)

(assert (=> b!608689 m!585293))

(declare-fun m!585295 () Bool)

(assert (=> b!608689 m!585295))

(declare-fun m!585297 () Bool)

(assert (=> b!608689 m!585297))

(declare-fun m!585299 () Bool)

(assert (=> b!608683 m!585299))

(assert (=> b!608693 m!585279))

(assert (=> b!608693 m!585279))

(declare-fun m!585301 () Bool)

(assert (=> b!608693 m!585301))

(declare-fun m!585303 () Bool)

(assert (=> b!608673 m!585303))

(assert (=> b!608673 m!585279))

(assert (=> b!608673 m!585279))

(declare-fun m!585305 () Bool)

(assert (=> b!608673 m!585305))

(declare-fun m!585307 () Bool)

(assert (=> b!608675 m!585307))

(declare-fun m!585309 () Bool)

(assert (=> b!608685 m!585309))

(declare-fun m!585311 () Bool)

(assert (=> b!608680 m!585311))

(declare-fun m!585313 () Bool)

(assert (=> b!608699 m!585313))

(assert (=> b!608678 m!585279))

(declare-fun m!585315 () Bool)

(assert (=> b!608678 m!585315))

(assert (=> b!608678 m!585279))

(declare-fun m!585317 () Bool)

(assert (=> b!608678 m!585317))

(declare-fun m!585319 () Bool)

(assert (=> b!608678 m!585319))

(assert (=> b!608678 m!585279))

(declare-fun m!585321 () Bool)

(assert (=> b!608678 m!585321))

(assert (=> b!608678 m!585279))

(declare-fun m!585323 () Bool)

(assert (=> b!608678 m!585323))

(declare-fun m!585325 () Bool)

(assert (=> b!608678 m!585325))

(declare-fun m!585327 () Bool)

(assert (=> b!608678 m!585327))

(assert (=> b!608682 m!585297))

(declare-fun m!585329 () Bool)

(assert (=> b!608682 m!585329))

(assert (=> b!608691 m!585279))

(assert (=> b!608691 m!585279))

(declare-fun m!585331 () Bool)

(assert (=> b!608691 m!585331))

(assert (=> b!608691 m!585279))

(declare-fun m!585333 () Bool)

(assert (=> b!608691 m!585333))

(assert (=> b!608691 m!585279))

(assert (=> b!608691 m!585301))

(assert (=> b!608677 m!585279))

(assert (=> b!608677 m!585297))

(declare-fun m!585335 () Bool)

(assert (=> b!608677 m!585335))

(assert (=> b!608694 m!585279))

(assert (=> b!608694 m!585279))

(declare-fun m!585337 () Bool)

(assert (=> b!608694 m!585337))

(declare-fun m!585339 () Bool)

(assert (=> b!608688 m!585339))

(declare-fun m!585341 () Bool)

(assert (=> b!608684 m!585341))

(assert (=> b!608679 m!585279))

(declare-fun m!585343 () Bool)

(assert (=> start!55580 m!585343))

(declare-fun m!585345 () Bool)

(assert (=> start!55580 m!585345))

(push 1)

