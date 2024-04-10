; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59592 () Bool)

(assert start!59592)

(declare-fun b!658587 () Bool)

(declare-datatypes ((Unit!22874 0))(
  ( (Unit!22875) )
))
(declare-fun e!378343 () Unit!22874)

(declare-fun Unit!22876 () Unit!22874)

(assert (=> b!658587 (= e!378343 Unit!22876)))

(declare-fun b!658588 () Bool)

(declare-fun res!427094 () Bool)

(declare-fun e!378342 () Bool)

(assert (=> b!658588 (=> (not res!427094) (not e!378342))))

(declare-datatypes ((array!38750 0))(
  ( (array!38751 (arr!18572 (Array (_ BitVec 32) (_ BitVec 64))) (size!18936 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38750)

(declare-datatypes ((List!12613 0))(
  ( (Nil!12610) (Cons!12609 (h!13654 (_ BitVec 64)) (t!18841 List!12613)) )
))
(declare-fun arrayNoDuplicates!0 (array!38750 (_ BitVec 32) List!12613) Bool)

(assert (=> b!658588 (= res!427094 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12610))))

(declare-fun b!658589 () Bool)

(declare-fun res!427103 () Bool)

(assert (=> b!658589 (=> (not res!427103) (not e!378342))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658589 (= res!427103 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18572 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658590 () Bool)

(declare-fun e!378350 () Bool)

(assert (=> b!658590 (= e!378350 (not true))))

(declare-fun lt!308006 () Unit!22874)

(declare-fun e!378344 () Unit!22874)

(assert (=> b!658590 (= lt!308006 e!378344)))

(declare-fun c!76115 () Bool)

(declare-datatypes ((SeekEntryResult!7012 0))(
  ( (MissingZero!7012 (index!30413 (_ BitVec 32))) (Found!7012 (index!30414 (_ BitVec 32))) (Intermediate!7012 (undefined!7824 Bool) (index!30415 (_ BitVec 32)) (x!59199 (_ BitVec 32))) (Undefined!7012) (MissingVacant!7012 (index!30416 (_ BitVec 32))) )
))
(declare-fun lt!307992 () SeekEntryResult!7012)

(assert (=> b!658590 (= c!76115 (= lt!307992 (Found!7012 index!984)))))

(declare-fun lt!307995 () Unit!22874)

(declare-fun e!378352 () Unit!22874)

(assert (=> b!658590 (= lt!307995 e!378352)))

(declare-fun c!76118 () Bool)

(assert (=> b!658590 (= c!76118 (= lt!307992 Undefined!7012))))

(declare-fun lt!307996 () (_ BitVec 64))

(declare-fun lt!307990 () array!38750)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38750 (_ BitVec 32)) SeekEntryResult!7012)

(assert (=> b!658590 (= lt!307992 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307996 lt!307990 mask!3053))))

(declare-fun e!378349 () Bool)

(assert (=> b!658590 e!378349))

(declare-fun res!427100 () Bool)

(assert (=> b!658590 (=> (not res!427100) (not e!378349))))

(declare-fun lt!308008 () (_ BitVec 32))

(declare-fun lt!307998 () SeekEntryResult!7012)

(assert (=> b!658590 (= res!427100 (= lt!307998 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308008 vacantSpotIndex!68 lt!307996 lt!307990 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!658590 (= lt!307998 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308008 vacantSpotIndex!68 (select (arr!18572 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!658590 (= lt!307996 (select (store (arr!18572 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307993 () Unit!22874)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38750 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22874)

(assert (=> b!658590 (= lt!307993 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308008 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658590 (= lt!308008 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658591 () Bool)

(declare-fun Unit!22877 () Unit!22874)

(assert (=> b!658591 (= e!378352 Unit!22877)))

(declare-fun b!658592 () Bool)

(declare-fun e!378348 () Bool)

(assert (=> b!658592 (= e!378348 e!378350)))

(declare-fun res!427101 () Bool)

(assert (=> b!658592 (=> (not res!427101) (not e!378350))))

(declare-fun lt!308001 () SeekEntryResult!7012)

(assert (=> b!658592 (= res!427101 (and (= lt!308001 (Found!7012 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18572 a!2986) index!984) (select (arr!18572 a!2986) j!136))) (not (= (select (arr!18572 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658592 (= lt!308001 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18572 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658593 () Bool)

(declare-fun res!427106 () Bool)

(declare-fun e!378346 () Bool)

(assert (=> b!658593 (=> (not res!427106) (not e!378346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658593 (= res!427106 (validKeyInArray!0 k!1786))))

(declare-fun b!658594 () Bool)

(declare-fun Unit!22878 () Unit!22874)

(assert (=> b!658594 (= e!378344 Unit!22878)))

(declare-fun res!427102 () Bool)

(assert (=> b!658594 (= res!427102 (= (select (store (arr!18572 a!2986) i!1108 k!1786) index!984) (select (arr!18572 a!2986) j!136)))))

(declare-fun e!378354 () Bool)

(assert (=> b!658594 (=> (not res!427102) (not e!378354))))

(assert (=> b!658594 e!378354))

(declare-fun c!76116 () Bool)

(assert (=> b!658594 (= c!76116 (bvslt j!136 index!984))))

(declare-fun lt!307994 () Unit!22874)

(assert (=> b!658594 (= lt!307994 e!378343)))

(declare-fun c!76117 () Bool)

(assert (=> b!658594 (= c!76117 (bvslt index!984 j!136))))

(declare-fun lt!308003 () Unit!22874)

(declare-fun e!378353 () Unit!22874)

(assert (=> b!658594 (= lt!308003 e!378353)))

(assert (=> b!658594 false))

(declare-fun b!658595 () Bool)

(declare-fun Unit!22879 () Unit!22874)

(assert (=> b!658595 (= e!378344 Unit!22879)))

(declare-fun b!658596 () Bool)

(declare-fun e!378345 () Bool)

(declare-fun arrayContainsKey!0 (array!38750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658596 (= e!378345 (arrayContainsKey!0 lt!307990 (select (arr!18572 a!2986) j!136) index!984))))

(declare-fun res!427091 () Bool)

(declare-fun b!658597 () Bool)

(assert (=> b!658597 (= res!427091 (arrayContainsKey!0 lt!307990 (select (arr!18572 a!2986) j!136) j!136))))

(declare-fun e!378347 () Bool)

(assert (=> b!658597 (=> (not res!427091) (not e!378347))))

(declare-fun e!378341 () Bool)

(assert (=> b!658597 (= e!378341 e!378347)))

(declare-fun b!658598 () Bool)

(assert (=> b!658598 false))

(declare-fun lt!308004 () Unit!22874)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38750 (_ BitVec 64) (_ BitVec 32) List!12613) Unit!22874)

(assert (=> b!658598 (= lt!308004 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307990 (select (arr!18572 a!2986) j!136) index!984 Nil!12610))))

(assert (=> b!658598 (arrayNoDuplicates!0 lt!307990 index!984 Nil!12610)))

(declare-fun lt!307997 () Unit!22874)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38750 (_ BitVec 32) (_ BitVec 32)) Unit!22874)

(assert (=> b!658598 (= lt!307997 (lemmaNoDuplicateFromThenFromBigger!0 lt!307990 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658598 (arrayNoDuplicates!0 lt!307990 #b00000000000000000000000000000000 Nil!12610)))

(declare-fun lt!308002 () Unit!22874)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38750 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12613) Unit!22874)

(assert (=> b!658598 (= lt!308002 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12610))))

(assert (=> b!658598 (arrayContainsKey!0 lt!307990 (select (arr!18572 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307991 () Unit!22874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38750 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22874)

(assert (=> b!658598 (= lt!307991 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307990 (select (arr!18572 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658598 e!378345))

(declare-fun res!427098 () Bool)

(assert (=> b!658598 (=> (not res!427098) (not e!378345))))

(assert (=> b!658598 (= res!427098 (arrayContainsKey!0 lt!307990 (select (arr!18572 a!2986) j!136) j!136))))

(declare-fun Unit!22880 () Unit!22874)

(assert (=> b!658598 (= e!378353 Unit!22880)))

(declare-fun b!658599 () Bool)

(declare-fun Unit!22881 () Unit!22874)

(assert (=> b!658599 (= e!378352 Unit!22881)))

(assert (=> b!658599 false))

(declare-fun b!658600 () Bool)

(declare-fun res!427092 () Bool)

(assert (=> b!658600 (= res!427092 (bvsge j!136 index!984))))

(assert (=> b!658600 (=> res!427092 e!378341)))

(assert (=> b!658600 (= e!378354 e!378341)))

(declare-fun b!658601 () Bool)

(declare-fun res!427104 () Bool)

(assert (=> b!658601 (=> (not res!427104) (not e!378346))))

(assert (=> b!658601 (= res!427104 (and (= (size!18936 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18936 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18936 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658602 () Bool)

(declare-fun res!427105 () Bool)

(assert (=> b!658602 (=> (not res!427105) (not e!378346))))

(assert (=> b!658602 (= res!427105 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658603 () Bool)

(declare-fun Unit!22882 () Unit!22874)

(assert (=> b!658603 (= e!378353 Unit!22882)))

(declare-fun b!658604 () Bool)

(assert (=> b!658604 false))

(declare-fun lt!308007 () Unit!22874)

(assert (=> b!658604 (= lt!308007 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307990 (select (arr!18572 a!2986) j!136) j!136 Nil!12610))))

(assert (=> b!658604 (arrayNoDuplicates!0 lt!307990 j!136 Nil!12610)))

(declare-fun lt!308000 () Unit!22874)

(assert (=> b!658604 (= lt!308000 (lemmaNoDuplicateFromThenFromBigger!0 lt!307990 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658604 (arrayNoDuplicates!0 lt!307990 #b00000000000000000000000000000000 Nil!12610)))

(declare-fun lt!308005 () Unit!22874)

(assert (=> b!658604 (= lt!308005 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12610))))

(assert (=> b!658604 (arrayContainsKey!0 lt!307990 (select (arr!18572 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307989 () Unit!22874)

(assert (=> b!658604 (= lt!307989 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307990 (select (arr!18572 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22883 () Unit!22874)

(assert (=> b!658604 (= e!378343 Unit!22883)))

(declare-fun b!658605 () Bool)

(assert (=> b!658605 (= e!378349 (= lt!308001 lt!307998))))

(declare-fun b!658606 () Bool)

(assert (=> b!658606 (= e!378347 (arrayContainsKey!0 lt!307990 (select (arr!18572 a!2986) j!136) index!984))))

(declare-fun b!658607 () Bool)

(declare-fun res!427093 () Bool)

(assert (=> b!658607 (=> (not res!427093) (not e!378346))))

(assert (=> b!658607 (= res!427093 (validKeyInArray!0 (select (arr!18572 a!2986) j!136)))))

(declare-fun b!658608 () Bool)

(assert (=> b!658608 (= e!378342 e!378348)))

(declare-fun res!427095 () Bool)

(assert (=> b!658608 (=> (not res!427095) (not e!378348))))

(assert (=> b!658608 (= res!427095 (= (select (store (arr!18572 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658608 (= lt!307990 (array!38751 (store (arr!18572 a!2986) i!1108 k!1786) (size!18936 a!2986)))))

(declare-fun b!658609 () Bool)

(assert (=> b!658609 (= e!378346 e!378342)))

(declare-fun res!427097 () Bool)

(assert (=> b!658609 (=> (not res!427097) (not e!378342))))

(declare-fun lt!307999 () SeekEntryResult!7012)

(assert (=> b!658609 (= res!427097 (or (= lt!307999 (MissingZero!7012 i!1108)) (= lt!307999 (MissingVacant!7012 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38750 (_ BitVec 32)) SeekEntryResult!7012)

(assert (=> b!658609 (= lt!307999 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!427096 () Bool)

(assert (=> start!59592 (=> (not res!427096) (not e!378346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59592 (= res!427096 (validMask!0 mask!3053))))

(assert (=> start!59592 e!378346))

(assert (=> start!59592 true))

(declare-fun array_inv!14368 (array!38750) Bool)

(assert (=> start!59592 (array_inv!14368 a!2986)))

(declare-fun b!658610 () Bool)

(declare-fun res!427099 () Bool)

(assert (=> b!658610 (=> (not res!427099) (not e!378342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38750 (_ BitVec 32)) Bool)

(assert (=> b!658610 (= res!427099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59592 res!427096) b!658601))

(assert (= (and b!658601 res!427104) b!658607))

(assert (= (and b!658607 res!427093) b!658593))

(assert (= (and b!658593 res!427106) b!658602))

(assert (= (and b!658602 res!427105) b!658609))

(assert (= (and b!658609 res!427097) b!658610))

(assert (= (and b!658610 res!427099) b!658588))

(assert (= (and b!658588 res!427094) b!658589))

(assert (= (and b!658589 res!427103) b!658608))

(assert (= (and b!658608 res!427095) b!658592))

(assert (= (and b!658592 res!427101) b!658590))

(assert (= (and b!658590 res!427100) b!658605))

(assert (= (and b!658590 c!76118) b!658599))

(assert (= (and b!658590 (not c!76118)) b!658591))

(assert (= (and b!658590 c!76115) b!658594))

(assert (= (and b!658590 (not c!76115)) b!658595))

(assert (= (and b!658594 res!427102) b!658600))

(assert (= (and b!658600 (not res!427092)) b!658597))

(assert (= (and b!658597 res!427091) b!658606))

(assert (= (and b!658594 c!76116) b!658604))

(assert (= (and b!658594 (not c!76116)) b!658587))

(assert (= (and b!658594 c!76117) b!658598))

(assert (= (and b!658594 (not c!76117)) b!658603))

(assert (= (and b!658598 res!427098) b!658596))

(declare-fun m!631567 () Bool)

(assert (=> b!658609 m!631567))

(declare-fun m!631569 () Bool)

(assert (=> b!658598 m!631569))

(declare-fun m!631571 () Bool)

(assert (=> b!658598 m!631571))

(assert (=> b!658598 m!631569))

(declare-fun m!631573 () Bool)

(assert (=> b!658598 m!631573))

(assert (=> b!658598 m!631569))

(declare-fun m!631575 () Bool)

(assert (=> b!658598 m!631575))

(assert (=> b!658598 m!631569))

(declare-fun m!631577 () Bool)

(assert (=> b!658598 m!631577))

(declare-fun m!631579 () Bool)

(assert (=> b!658598 m!631579))

(assert (=> b!658598 m!631569))

(declare-fun m!631581 () Bool)

(assert (=> b!658598 m!631581))

(declare-fun m!631583 () Bool)

(assert (=> b!658598 m!631583))

(declare-fun m!631585 () Bool)

(assert (=> b!658598 m!631585))

(assert (=> b!658596 m!631569))

(assert (=> b!658596 m!631569))

(declare-fun m!631587 () Bool)

(assert (=> b!658596 m!631587))

(assert (=> b!658604 m!631569))

(assert (=> b!658604 m!631569))

(declare-fun m!631589 () Bool)

(assert (=> b!658604 m!631589))

(declare-fun m!631591 () Bool)

(assert (=> b!658604 m!631591))

(assert (=> b!658604 m!631583))

(assert (=> b!658604 m!631569))

(declare-fun m!631593 () Bool)

(assert (=> b!658604 m!631593))

(declare-fun m!631595 () Bool)

(assert (=> b!658604 m!631595))

(assert (=> b!658604 m!631585))

(assert (=> b!658604 m!631569))

(declare-fun m!631597 () Bool)

(assert (=> b!658604 m!631597))

(declare-fun m!631599 () Bool)

(assert (=> start!59592 m!631599))

(declare-fun m!631601 () Bool)

(assert (=> start!59592 m!631601))

(declare-fun m!631603 () Bool)

(assert (=> b!658589 m!631603))

(assert (=> b!658606 m!631569))

(assert (=> b!658606 m!631569))

(assert (=> b!658606 m!631587))

(declare-fun m!631605 () Bool)

(assert (=> b!658602 m!631605))

(assert (=> b!658597 m!631569))

(assert (=> b!658597 m!631569))

(assert (=> b!658597 m!631571))

(assert (=> b!658607 m!631569))

(assert (=> b!658607 m!631569))

(declare-fun m!631607 () Bool)

(assert (=> b!658607 m!631607))

(declare-fun m!631609 () Bool)

(assert (=> b!658610 m!631609))

(declare-fun m!631611 () Bool)

(assert (=> b!658594 m!631611))

(declare-fun m!631613 () Bool)

(assert (=> b!658594 m!631613))

(assert (=> b!658594 m!631569))

(declare-fun m!631615 () Bool)

(assert (=> b!658590 m!631615))

(declare-fun m!631617 () Bool)

(assert (=> b!658590 m!631617))

(assert (=> b!658590 m!631569))

(declare-fun m!631619 () Bool)

(assert (=> b!658590 m!631619))

(assert (=> b!658590 m!631611))

(declare-fun m!631621 () Bool)

(assert (=> b!658590 m!631621))

(declare-fun m!631623 () Bool)

(assert (=> b!658590 m!631623))

(declare-fun m!631625 () Bool)

(assert (=> b!658590 m!631625))

(assert (=> b!658590 m!631569))

(declare-fun m!631627 () Bool)

(assert (=> b!658588 m!631627))

(assert (=> b!658608 m!631611))

(declare-fun m!631629 () Bool)

(assert (=> b!658608 m!631629))

(declare-fun m!631631 () Bool)

(assert (=> b!658593 m!631631))

(declare-fun m!631633 () Bool)

(assert (=> b!658592 m!631633))

(assert (=> b!658592 m!631569))

(assert (=> b!658592 m!631569))

(declare-fun m!631635 () Bool)

(assert (=> b!658592 m!631635))

(push 1)

(assert (not b!658604))

(assert (not b!658598))

(assert (not b!658607))

(assert (not b!658602))

(assert (not start!59592))

(assert (not b!658597))

(assert (not b!658590))

(assert (not b!658592))

(assert (not b!658610))

(assert (not b!658606))

(assert (not b!658593))

(assert (not b!658588))

(assert (not b!658609))

(assert (not b!658596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

