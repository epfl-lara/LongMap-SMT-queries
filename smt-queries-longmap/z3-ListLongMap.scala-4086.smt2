; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55998 () Bool)

(assert start!55998)

(declare-fun b!615593 () Bool)

(declare-fun res!396577 () Bool)

(declare-fun e!352951 () Bool)

(assert (=> b!615593 (=> (not res!396577) (not e!352951))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37482 0))(
  ( (array!37483 (arr!17987 (Array (_ BitVec 32) (_ BitVec 64))) (size!18352 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37482)

(assert (=> b!615593 (= res!396577 (and (= (size!18352 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18352 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18352 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615594 () Bool)

(declare-fun res!396580 () Bool)

(assert (=> b!615594 (=> (not res!396580) (not e!352951))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615594 (= res!396580 (validKeyInArray!0 k0!1786))))

(declare-fun b!615595 () Bool)

(assert (=> b!615595 false))

(declare-fun lt!282806 () array!37482)

(declare-datatypes ((Unit!19986 0))(
  ( (Unit!19987) )
))
(declare-fun lt!282817 () Unit!19986)

(declare-datatypes ((List!12067 0))(
  ( (Nil!12064) (Cons!12063 (h!13108 (_ BitVec 64)) (t!18286 List!12067)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37482 (_ BitVec 64) (_ BitVec 32) List!12067) Unit!19986)

(assert (=> b!615595 (= lt!282817 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282806 (select (arr!17987 a!2986) j!136) j!136 Nil!12064))))

(declare-fun arrayNoDuplicates!0 (array!37482 (_ BitVec 32) List!12067) Bool)

(assert (=> b!615595 (arrayNoDuplicates!0 lt!282806 j!136 Nil!12064)))

(declare-fun lt!282807 () Unit!19986)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37482 (_ BitVec 32) (_ BitVec 32)) Unit!19986)

(assert (=> b!615595 (= lt!282807 (lemmaNoDuplicateFromThenFromBigger!0 lt!282806 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615595 (arrayNoDuplicates!0 lt!282806 #b00000000000000000000000000000000 Nil!12064)))

(declare-fun lt!282808 () Unit!19986)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12067) Unit!19986)

(assert (=> b!615595 (= lt!282808 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12064))))

(declare-fun arrayContainsKey!0 (array!37482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615595 (arrayContainsKey!0 lt!282806 (select (arr!17987 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282820 () Unit!19986)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19986)

(assert (=> b!615595 (= lt!282820 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282806 (select (arr!17987 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352944 () Unit!19986)

(declare-fun Unit!19988 () Unit!19986)

(assert (=> b!615595 (= e!352944 Unit!19988)))

(declare-fun b!615596 () Bool)

(declare-fun res!396574 () Bool)

(assert (=> b!615596 (=> (not res!396574) (not e!352951))))

(assert (=> b!615596 (= res!396574 (validKeyInArray!0 (select (arr!17987 a!2986) j!136)))))

(declare-fun b!615597 () Bool)

(declare-fun e!352947 () Unit!19986)

(declare-fun Unit!19989 () Unit!19986)

(assert (=> b!615597 (= e!352947 Unit!19989)))

(assert (=> b!615597 false))

(declare-fun b!615598 () Bool)

(declare-fun Unit!19990 () Unit!19986)

(assert (=> b!615598 (= e!352947 Unit!19990)))

(declare-fun b!615599 () Bool)

(declare-fun Unit!19991 () Unit!19986)

(assert (=> b!615599 (= e!352944 Unit!19991)))

(declare-fun b!615600 () Bool)

(declare-fun e!352943 () Bool)

(assert (=> b!615600 (= e!352943 (arrayContainsKey!0 lt!282806 (select (arr!17987 a!2986) j!136) index!984))))

(declare-fun b!615601 () Bool)

(declare-fun res!396581 () Bool)

(assert (=> b!615601 (=> (not res!396581) (not e!352951))))

(assert (=> b!615601 (= res!396581 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!396584 () Bool)

(assert (=> start!55998 (=> (not res!396584) (not e!352951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55998 (= res!396584 (validMask!0 mask!3053))))

(assert (=> start!55998 e!352951))

(assert (=> start!55998 true))

(declare-fun array_inv!13870 (array!37482) Bool)

(assert (=> start!55998 (array_inv!13870 a!2986)))

(declare-fun b!615602 () Bool)

(declare-fun e!352940 () Unit!19986)

(declare-fun Unit!19992 () Unit!19986)

(assert (=> b!615602 (= e!352940 Unit!19992)))

(declare-fun b!615603 () Bool)

(declare-fun e!352953 () Bool)

(declare-datatypes ((SeekEntryResult!6424 0))(
  ( (MissingZero!6424 (index!27980 (_ BitVec 32))) (Found!6424 (index!27981 (_ BitVec 32))) (Intermediate!6424 (undefined!7236 Bool) (index!27982 (_ BitVec 32)) (x!56787 (_ BitVec 32))) (Undefined!6424) (MissingVacant!6424 (index!27983 (_ BitVec 32))) )
))
(declare-fun lt!282821 () SeekEntryResult!6424)

(declare-fun lt!282816 () SeekEntryResult!6424)

(assert (=> b!615603 (= e!352953 (= lt!282821 lt!282816))))

(declare-fun b!615604 () Bool)

(declare-fun e!352945 () Bool)

(declare-fun e!352942 () Bool)

(assert (=> b!615604 (= e!352945 e!352942)))

(declare-fun res!396569 () Bool)

(assert (=> b!615604 (=> (not res!396569) (not e!352942))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!615604 (= res!396569 (= (select (store (arr!17987 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615604 (= lt!282806 (array!37483 (store (arr!17987 a!2986) i!1108 k0!1786) (size!18352 a!2986)))))

(declare-fun b!615605 () Bool)

(assert (=> b!615605 false))

(declare-fun lt!282818 () Unit!19986)

(assert (=> b!615605 (= lt!282818 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282806 (select (arr!17987 a!2986) j!136) index!984 Nil!12064))))

(assert (=> b!615605 (arrayNoDuplicates!0 lt!282806 index!984 Nil!12064)))

(declare-fun lt!282814 () Unit!19986)

(assert (=> b!615605 (= lt!282814 (lemmaNoDuplicateFromThenFromBigger!0 lt!282806 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615605 (arrayNoDuplicates!0 lt!282806 #b00000000000000000000000000000000 Nil!12064)))

(declare-fun lt!282813 () Unit!19986)

(assert (=> b!615605 (= lt!282813 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12064))))

(assert (=> b!615605 (arrayContainsKey!0 lt!282806 (select (arr!17987 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282810 () Unit!19986)

(assert (=> b!615605 (= lt!282810 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282806 (select (arr!17987 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615605 e!352943))

(declare-fun res!396576 () Bool)

(assert (=> b!615605 (=> (not res!396576) (not e!352943))))

(assert (=> b!615605 (= res!396576 (arrayContainsKey!0 lt!282806 (select (arr!17987 a!2986) j!136) j!136))))

(declare-fun Unit!19993 () Unit!19986)

(assert (=> b!615605 (= e!352940 Unit!19993)))

(declare-fun b!615606 () Bool)

(declare-fun res!396582 () Bool)

(assert (=> b!615606 (=> (not res!396582) (not e!352945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37482 (_ BitVec 32)) Bool)

(assert (=> b!615606 (= res!396582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615607 () Bool)

(declare-fun res!396583 () Bool)

(assert (=> b!615607 (= res!396583 (arrayContainsKey!0 lt!282806 (select (arr!17987 a!2986) j!136) j!136))))

(declare-fun e!352941 () Bool)

(assert (=> b!615607 (=> (not res!396583) (not e!352941))))

(declare-fun e!352952 () Bool)

(assert (=> b!615607 (= e!352952 e!352941)))

(declare-fun b!615608 () Bool)

(assert (=> b!615608 (= e!352941 (arrayContainsKey!0 lt!282806 (select (arr!17987 a!2986) j!136) index!984))))

(declare-fun b!615609 () Bool)

(declare-fun res!396570 () Bool)

(assert (=> b!615609 (=> (not res!396570) (not e!352945))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!615609 (= res!396570 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17987 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615610 () Bool)

(declare-fun e!352946 () Unit!19986)

(declare-fun Unit!19994 () Unit!19986)

(assert (=> b!615610 (= e!352946 Unit!19994)))

(declare-fun b!615611 () Bool)

(declare-fun e!352948 () Bool)

(assert (=> b!615611 (= e!352942 e!352948)))

(declare-fun res!396578 () Bool)

(assert (=> b!615611 (=> (not res!396578) (not e!352948))))

(assert (=> b!615611 (= res!396578 (and (= lt!282821 (Found!6424 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17987 a!2986) index!984) (select (arr!17987 a!2986) j!136))) (not (= (select (arr!17987 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37482 (_ BitVec 32)) SeekEntryResult!6424)

(assert (=> b!615611 (= lt!282821 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17987 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615612 () Bool)

(declare-fun Unit!19995 () Unit!19986)

(assert (=> b!615612 (= e!352946 Unit!19995)))

(declare-fun res!396571 () Bool)

(assert (=> b!615612 (= res!396571 (= (select (store (arr!17987 a!2986) i!1108 k0!1786) index!984) (select (arr!17987 a!2986) j!136)))))

(declare-fun e!352949 () Bool)

(assert (=> b!615612 (=> (not res!396571) (not e!352949))))

(assert (=> b!615612 e!352949))

(declare-fun c!69880 () Bool)

(assert (=> b!615612 (= c!69880 (bvslt j!136 index!984))))

(declare-fun lt!282809 () Unit!19986)

(assert (=> b!615612 (= lt!282809 e!352944)))

(declare-fun c!69881 () Bool)

(assert (=> b!615612 (= c!69881 (bvslt index!984 j!136))))

(declare-fun lt!282811 () Unit!19986)

(assert (=> b!615612 (= lt!282811 e!352940)))

(assert (=> b!615612 false))

(declare-fun b!615613 () Bool)

(assert (=> b!615613 (= e!352948 (not true))))

(declare-fun lt!282804 () Unit!19986)

(assert (=> b!615613 (= lt!282804 e!352946)))

(declare-fun c!69879 () Bool)

(declare-fun lt!282805 () SeekEntryResult!6424)

(assert (=> b!615613 (= c!69879 (= lt!282805 (Found!6424 index!984)))))

(declare-fun lt!282819 () Unit!19986)

(assert (=> b!615613 (= lt!282819 e!352947)))

(declare-fun c!69882 () Bool)

(assert (=> b!615613 (= c!69882 (= lt!282805 Undefined!6424))))

(declare-fun lt!282815 () (_ BitVec 64))

(assert (=> b!615613 (= lt!282805 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282815 lt!282806 mask!3053))))

(assert (=> b!615613 e!352953))

(declare-fun res!396575 () Bool)

(assert (=> b!615613 (=> (not res!396575) (not e!352953))))

(declare-fun lt!282812 () (_ BitVec 32))

(assert (=> b!615613 (= res!396575 (= lt!282816 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282812 vacantSpotIndex!68 lt!282815 lt!282806 mask!3053)))))

(assert (=> b!615613 (= lt!282816 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282812 vacantSpotIndex!68 (select (arr!17987 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615613 (= lt!282815 (select (store (arr!17987 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282822 () Unit!19986)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19986)

(assert (=> b!615613 (= lt!282822 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282812 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615613 (= lt!282812 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615614 () Bool)

(declare-fun res!396579 () Bool)

(assert (=> b!615614 (=> (not res!396579) (not e!352945))))

(assert (=> b!615614 (= res!396579 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12064))))

(declare-fun b!615615 () Bool)

(assert (=> b!615615 (= e!352951 e!352945)))

(declare-fun res!396572 () Bool)

(assert (=> b!615615 (=> (not res!396572) (not e!352945))))

(declare-fun lt!282823 () SeekEntryResult!6424)

(assert (=> b!615615 (= res!396572 (or (= lt!282823 (MissingZero!6424 i!1108)) (= lt!282823 (MissingVacant!6424 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37482 (_ BitVec 32)) SeekEntryResult!6424)

(assert (=> b!615615 (= lt!282823 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615616 () Bool)

(declare-fun res!396573 () Bool)

(assert (=> b!615616 (= res!396573 (bvsge j!136 index!984))))

(assert (=> b!615616 (=> res!396573 e!352952)))

(assert (=> b!615616 (= e!352949 e!352952)))

(assert (= (and start!55998 res!396584) b!615593))

(assert (= (and b!615593 res!396577) b!615596))

(assert (= (and b!615596 res!396574) b!615594))

(assert (= (and b!615594 res!396580) b!615601))

(assert (= (and b!615601 res!396581) b!615615))

(assert (= (and b!615615 res!396572) b!615606))

(assert (= (and b!615606 res!396582) b!615614))

(assert (= (and b!615614 res!396579) b!615609))

(assert (= (and b!615609 res!396570) b!615604))

(assert (= (and b!615604 res!396569) b!615611))

(assert (= (and b!615611 res!396578) b!615613))

(assert (= (and b!615613 res!396575) b!615603))

(assert (= (and b!615613 c!69882) b!615597))

(assert (= (and b!615613 (not c!69882)) b!615598))

(assert (= (and b!615613 c!69879) b!615612))

(assert (= (and b!615613 (not c!69879)) b!615610))

(assert (= (and b!615612 res!396571) b!615616))

(assert (= (and b!615616 (not res!396573)) b!615607))

(assert (= (and b!615607 res!396583) b!615608))

(assert (= (and b!615612 c!69880) b!615595))

(assert (= (and b!615612 (not c!69880)) b!615599))

(assert (= (and b!615612 c!69881) b!615605))

(assert (= (and b!615612 (not c!69881)) b!615602))

(assert (= (and b!615605 res!396576) b!615600))

(declare-fun m!591283 () Bool)

(assert (=> b!615601 m!591283))

(declare-fun m!591285 () Bool)

(assert (=> b!615594 m!591285))

(declare-fun m!591287 () Bool)

(assert (=> b!615607 m!591287))

(assert (=> b!615607 m!591287))

(declare-fun m!591289 () Bool)

(assert (=> b!615607 m!591289))

(assert (=> b!615595 m!591287))

(assert (=> b!615595 m!591287))

(declare-fun m!591291 () Bool)

(assert (=> b!615595 m!591291))

(assert (=> b!615595 m!591287))

(declare-fun m!591293 () Bool)

(assert (=> b!615595 m!591293))

(declare-fun m!591295 () Bool)

(assert (=> b!615595 m!591295))

(declare-fun m!591297 () Bool)

(assert (=> b!615595 m!591297))

(assert (=> b!615595 m!591287))

(declare-fun m!591299 () Bool)

(assert (=> b!615595 m!591299))

(declare-fun m!591301 () Bool)

(assert (=> b!615595 m!591301))

(declare-fun m!591303 () Bool)

(assert (=> b!615595 m!591303))

(declare-fun m!591305 () Bool)

(assert (=> b!615613 m!591305))

(assert (=> b!615613 m!591287))

(declare-fun m!591307 () Bool)

(assert (=> b!615613 m!591307))

(declare-fun m!591309 () Bool)

(assert (=> b!615613 m!591309))

(declare-fun m!591311 () Bool)

(assert (=> b!615613 m!591311))

(declare-fun m!591313 () Bool)

(assert (=> b!615613 m!591313))

(declare-fun m!591315 () Bool)

(assert (=> b!615613 m!591315))

(assert (=> b!615613 m!591287))

(declare-fun m!591317 () Bool)

(assert (=> b!615613 m!591317))

(assert (=> b!615612 m!591307))

(declare-fun m!591319 () Bool)

(assert (=> b!615612 m!591319))

(assert (=> b!615612 m!591287))

(declare-fun m!591321 () Bool)

(assert (=> b!615614 m!591321))

(assert (=> b!615604 m!591307))

(declare-fun m!591323 () Bool)

(assert (=> b!615604 m!591323))

(assert (=> b!615605 m!591287))

(assert (=> b!615605 m!591289))

(declare-fun m!591325 () Bool)

(assert (=> b!615605 m!591325))

(assert (=> b!615605 m!591287))

(assert (=> b!615605 m!591287))

(declare-fun m!591327 () Bool)

(assert (=> b!615605 m!591327))

(assert (=> b!615605 m!591287))

(declare-fun m!591329 () Bool)

(assert (=> b!615605 m!591329))

(assert (=> b!615605 m!591295))

(declare-fun m!591331 () Bool)

(assert (=> b!615605 m!591331))

(assert (=> b!615605 m!591287))

(declare-fun m!591333 () Bool)

(assert (=> b!615605 m!591333))

(assert (=> b!615605 m!591303))

(declare-fun m!591335 () Bool)

(assert (=> b!615615 m!591335))

(assert (=> b!615600 m!591287))

(assert (=> b!615600 m!591287))

(declare-fun m!591337 () Bool)

(assert (=> b!615600 m!591337))

(declare-fun m!591339 () Bool)

(assert (=> start!55998 m!591339))

(declare-fun m!591341 () Bool)

(assert (=> start!55998 m!591341))

(declare-fun m!591343 () Bool)

(assert (=> b!615611 m!591343))

(assert (=> b!615611 m!591287))

(assert (=> b!615611 m!591287))

(declare-fun m!591345 () Bool)

(assert (=> b!615611 m!591345))

(declare-fun m!591347 () Bool)

(assert (=> b!615609 m!591347))

(declare-fun m!591349 () Bool)

(assert (=> b!615606 m!591349))

(assert (=> b!615608 m!591287))

(assert (=> b!615608 m!591287))

(assert (=> b!615608 m!591337))

(assert (=> b!615596 m!591287))

(assert (=> b!615596 m!591287))

(declare-fun m!591351 () Bool)

(assert (=> b!615596 m!591351))

(check-sat (not b!615608) (not b!615607) (not b!615596) (not b!615611) (not b!615600) (not b!615595) (not start!55998) (not b!615606) (not b!615615) (not b!615614) (not b!615613) (not b!615605) (not b!615601) (not b!615594))
(check-sat)
