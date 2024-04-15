; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56004 () Bool)

(assert start!56004)

(declare-fun b!615809 () Bool)

(declare-fun res!396716 () Bool)

(declare-fun e!353077 () Bool)

(assert (=> b!615809 (=> (not res!396716) (not e!353077))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37488 0))(
  ( (array!37489 (arr!17990 (Array (_ BitVec 32) (_ BitVec 64))) (size!18355 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37488)

(assert (=> b!615809 (= res!396716 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17990 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615810 () Bool)

(assert (=> b!615810 false))

(declare-datatypes ((Unit!20016 0))(
  ( (Unit!20017) )
))
(declare-fun lt!283002 () Unit!20016)

(declare-fun lt!282984 () array!37488)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((List!12070 0))(
  ( (Nil!12067) (Cons!12066 (h!13111 (_ BitVec 64)) (t!18289 List!12070)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37488 (_ BitVec 64) (_ BitVec 32) List!12070) Unit!20016)

(assert (=> b!615810 (= lt!283002 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282984 (select (arr!17990 a!2986) j!136) j!136 Nil!12067))))

(declare-fun arrayNoDuplicates!0 (array!37488 (_ BitVec 32) List!12070) Bool)

(assert (=> b!615810 (arrayNoDuplicates!0 lt!282984 j!136 Nil!12067)))

(declare-fun lt!282985 () Unit!20016)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37488 (_ BitVec 32) (_ BitVec 32)) Unit!20016)

(assert (=> b!615810 (= lt!282985 (lemmaNoDuplicateFromThenFromBigger!0 lt!282984 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615810 (arrayNoDuplicates!0 lt!282984 #b00000000000000000000000000000000 Nil!12067)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!282987 () Unit!20016)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12070) Unit!20016)

(assert (=> b!615810 (= lt!282987 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12067))))

(declare-fun arrayContainsKey!0 (array!37488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615810 (arrayContainsKey!0 lt!282984 (select (arr!17990 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282986 () Unit!20016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20016)

(assert (=> b!615810 (= lt!282986 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282984 (select (arr!17990 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353072 () Unit!20016)

(declare-fun Unit!20018 () Unit!20016)

(assert (=> b!615810 (= e!353072 Unit!20018)))

(declare-fun b!615811 () Bool)

(declare-fun e!353069 () Bool)

(declare-datatypes ((SeekEntryResult!6427 0))(
  ( (MissingZero!6427 (index!27992 (_ BitVec 32))) (Found!6427 (index!27993 (_ BitVec 32))) (Intermediate!6427 (undefined!7239 Bool) (index!27994 (_ BitVec 32)) (x!56798 (_ BitVec 32))) (Undefined!6427) (MissingVacant!6427 (index!27995 (_ BitVec 32))) )
))
(declare-fun lt!283003 () SeekEntryResult!6427)

(declare-fun lt!282988 () SeekEntryResult!6427)

(assert (=> b!615811 (= e!353069 (= lt!283003 lt!282988))))

(declare-fun b!615813 () Bool)

(declare-fun res!396725 () Bool)

(declare-fun e!353067 () Bool)

(assert (=> b!615813 (=> (not res!396725) (not e!353067))))

(assert (=> b!615813 (= res!396725 (and (= (size!18355 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18355 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18355 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!353074 () Bool)

(declare-fun b!615814 () Bool)

(assert (=> b!615814 (= e!353074 (arrayContainsKey!0 lt!282984 (select (arr!17990 a!2986) j!136) index!984))))

(declare-fun res!396727 () Bool)

(declare-fun b!615815 () Bool)

(assert (=> b!615815 (= res!396727 (arrayContainsKey!0 lt!282984 (select (arr!17990 a!2986) j!136) j!136))))

(declare-fun e!353075 () Bool)

(assert (=> b!615815 (=> (not res!396727) (not e!353075))))

(declare-fun e!353078 () Bool)

(assert (=> b!615815 (= e!353078 e!353075)))

(declare-fun b!615816 () Bool)

(declare-fun e!353070 () Bool)

(declare-fun e!353071 () Bool)

(assert (=> b!615816 (= e!353070 e!353071)))

(declare-fun res!396724 () Bool)

(assert (=> b!615816 (=> (not res!396724) (not e!353071))))

(assert (=> b!615816 (= res!396724 (and (= lt!283003 (Found!6427 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17990 a!2986) index!984) (select (arr!17990 a!2986) j!136))) (not (= (select (arr!17990 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37488 (_ BitVec 32)) SeekEntryResult!6427)

(assert (=> b!615816 (= lt!283003 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17990 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615817 () Bool)

(declare-fun res!396726 () Bool)

(assert (=> b!615817 (=> (not res!396726) (not e!353067))))

(assert (=> b!615817 (= res!396726 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615818 () Bool)

(declare-fun e!353076 () Unit!20016)

(declare-fun Unit!20019 () Unit!20016)

(assert (=> b!615818 (= e!353076 Unit!20019)))

(assert (=> b!615818 false))

(declare-fun b!615819 () Bool)

(assert (=> b!615819 false))

(declare-fun lt!282995 () Unit!20016)

(assert (=> b!615819 (= lt!282995 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282984 (select (arr!17990 a!2986) j!136) index!984 Nil!12067))))

(assert (=> b!615819 (arrayNoDuplicates!0 lt!282984 index!984 Nil!12067)))

(declare-fun lt!282998 () Unit!20016)

(assert (=> b!615819 (= lt!282998 (lemmaNoDuplicateFromThenFromBigger!0 lt!282984 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615819 (arrayNoDuplicates!0 lt!282984 #b00000000000000000000000000000000 Nil!12067)))

(declare-fun lt!282989 () Unit!20016)

(assert (=> b!615819 (= lt!282989 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12067))))

(assert (=> b!615819 (arrayContainsKey!0 lt!282984 (select (arr!17990 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283000 () Unit!20016)

(assert (=> b!615819 (= lt!283000 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282984 (select (arr!17990 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615819 e!353074))

(declare-fun res!396713 () Bool)

(assert (=> b!615819 (=> (not res!396713) (not e!353074))))

(assert (=> b!615819 (= res!396713 (arrayContainsKey!0 lt!282984 (select (arr!17990 a!2986) j!136) j!136))))

(declare-fun e!353079 () Unit!20016)

(declare-fun Unit!20020 () Unit!20016)

(assert (=> b!615819 (= e!353079 Unit!20020)))

(declare-fun b!615820 () Bool)

(assert (=> b!615820 (= e!353067 e!353077)))

(declare-fun res!396717 () Bool)

(assert (=> b!615820 (=> (not res!396717) (not e!353077))))

(declare-fun lt!282990 () SeekEntryResult!6427)

(assert (=> b!615820 (= res!396717 (or (= lt!282990 (MissingZero!6427 i!1108)) (= lt!282990 (MissingVacant!6427 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37488 (_ BitVec 32)) SeekEntryResult!6427)

(assert (=> b!615820 (= lt!282990 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615821 () Bool)

(assert (=> b!615821 (= e!353071 (not true))))

(declare-fun lt!282996 () Unit!20016)

(declare-fun e!353068 () Unit!20016)

(assert (=> b!615821 (= lt!282996 e!353068)))

(declare-fun c!69916 () Bool)

(declare-fun lt!282991 () SeekEntryResult!6427)

(assert (=> b!615821 (= c!69916 (= lt!282991 (Found!6427 index!984)))))

(declare-fun lt!282992 () Unit!20016)

(assert (=> b!615821 (= lt!282992 e!353076)))

(declare-fun c!69917 () Bool)

(assert (=> b!615821 (= c!69917 (= lt!282991 Undefined!6427))))

(declare-fun lt!282993 () (_ BitVec 64))

(assert (=> b!615821 (= lt!282991 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282993 lt!282984 mask!3053))))

(assert (=> b!615821 e!353069))

(declare-fun res!396723 () Bool)

(assert (=> b!615821 (=> (not res!396723) (not e!353069))))

(declare-fun lt!282999 () (_ BitVec 32))

(assert (=> b!615821 (= res!396723 (= lt!282988 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282999 vacantSpotIndex!68 lt!282993 lt!282984 mask!3053)))))

(assert (=> b!615821 (= lt!282988 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282999 vacantSpotIndex!68 (select (arr!17990 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615821 (= lt!282993 (select (store (arr!17990 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282994 () Unit!20016)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20016)

(assert (=> b!615821 (= lt!282994 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282999 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615821 (= lt!282999 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615822 () Bool)

(declare-fun Unit!20021 () Unit!20016)

(assert (=> b!615822 (= e!353079 Unit!20021)))

(declare-fun b!615823 () Bool)

(assert (=> b!615823 (= e!353077 e!353070)))

(declare-fun res!396718 () Bool)

(assert (=> b!615823 (=> (not res!396718) (not e!353070))))

(assert (=> b!615823 (= res!396718 (= (select (store (arr!17990 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615823 (= lt!282984 (array!37489 (store (arr!17990 a!2986) i!1108 k0!1786) (size!18355 a!2986)))))

(declare-fun b!615824 () Bool)

(declare-fun res!396715 () Bool)

(assert (=> b!615824 (=> (not res!396715) (not e!353067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615824 (= res!396715 (validKeyInArray!0 k0!1786))))

(declare-fun b!615825 () Bool)

(declare-fun res!396714 () Bool)

(assert (=> b!615825 (=> (not res!396714) (not e!353067))))

(assert (=> b!615825 (= res!396714 (validKeyInArray!0 (select (arr!17990 a!2986) j!136)))))

(declare-fun b!615826 () Bool)

(assert (=> b!615826 (= e!353075 (arrayContainsKey!0 lt!282984 (select (arr!17990 a!2986) j!136) index!984))))

(declare-fun res!396721 () Bool)

(assert (=> start!56004 (=> (not res!396721) (not e!353067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56004 (= res!396721 (validMask!0 mask!3053))))

(assert (=> start!56004 e!353067))

(assert (=> start!56004 true))

(declare-fun array_inv!13873 (array!37488) Bool)

(assert (=> start!56004 (array_inv!13873 a!2986)))

(declare-fun b!615812 () Bool)

(declare-fun res!396719 () Bool)

(assert (=> b!615812 (= res!396719 (bvsge j!136 index!984))))

(assert (=> b!615812 (=> res!396719 e!353078)))

(declare-fun e!353073 () Bool)

(assert (=> b!615812 (= e!353073 e!353078)))

(declare-fun b!615827 () Bool)

(declare-fun Unit!20022 () Unit!20016)

(assert (=> b!615827 (= e!353068 Unit!20022)))

(declare-fun b!615828 () Bool)

(declare-fun res!396722 () Bool)

(assert (=> b!615828 (=> (not res!396722) (not e!353077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37488 (_ BitVec 32)) Bool)

(assert (=> b!615828 (= res!396722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615829 () Bool)

(declare-fun res!396720 () Bool)

(assert (=> b!615829 (=> (not res!396720) (not e!353077))))

(assert (=> b!615829 (= res!396720 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12067))))

(declare-fun b!615830 () Bool)

(declare-fun Unit!20023 () Unit!20016)

(assert (=> b!615830 (= e!353072 Unit!20023)))

(declare-fun b!615831 () Bool)

(declare-fun Unit!20024 () Unit!20016)

(assert (=> b!615831 (= e!353076 Unit!20024)))

(declare-fun b!615832 () Bool)

(declare-fun Unit!20025 () Unit!20016)

(assert (=> b!615832 (= e!353068 Unit!20025)))

(declare-fun res!396728 () Bool)

(assert (=> b!615832 (= res!396728 (= (select (store (arr!17990 a!2986) i!1108 k0!1786) index!984) (select (arr!17990 a!2986) j!136)))))

(assert (=> b!615832 (=> (not res!396728) (not e!353073))))

(assert (=> b!615832 e!353073))

(declare-fun c!69918 () Bool)

(assert (=> b!615832 (= c!69918 (bvslt j!136 index!984))))

(declare-fun lt!282997 () Unit!20016)

(assert (=> b!615832 (= lt!282997 e!353072)))

(declare-fun c!69915 () Bool)

(assert (=> b!615832 (= c!69915 (bvslt index!984 j!136))))

(declare-fun lt!283001 () Unit!20016)

(assert (=> b!615832 (= lt!283001 e!353079)))

(assert (=> b!615832 false))

(assert (= (and start!56004 res!396721) b!615813))

(assert (= (and b!615813 res!396725) b!615825))

(assert (= (and b!615825 res!396714) b!615824))

(assert (= (and b!615824 res!396715) b!615817))

(assert (= (and b!615817 res!396726) b!615820))

(assert (= (and b!615820 res!396717) b!615828))

(assert (= (and b!615828 res!396722) b!615829))

(assert (= (and b!615829 res!396720) b!615809))

(assert (= (and b!615809 res!396716) b!615823))

(assert (= (and b!615823 res!396718) b!615816))

(assert (= (and b!615816 res!396724) b!615821))

(assert (= (and b!615821 res!396723) b!615811))

(assert (= (and b!615821 c!69917) b!615818))

(assert (= (and b!615821 (not c!69917)) b!615831))

(assert (= (and b!615821 c!69916) b!615832))

(assert (= (and b!615821 (not c!69916)) b!615827))

(assert (= (and b!615832 res!396728) b!615812))

(assert (= (and b!615812 (not res!396719)) b!615815))

(assert (= (and b!615815 res!396727) b!615826))

(assert (= (and b!615832 c!69918) b!615810))

(assert (= (and b!615832 (not c!69918)) b!615830))

(assert (= (and b!615832 c!69915) b!615819))

(assert (= (and b!615832 (not c!69915)) b!615822))

(assert (= (and b!615819 res!396713) b!615814))

(declare-fun m!591493 () Bool)

(assert (=> b!615826 m!591493))

(assert (=> b!615826 m!591493))

(declare-fun m!591495 () Bool)

(assert (=> b!615826 m!591495))

(declare-fun m!591497 () Bool)

(assert (=> b!615816 m!591497))

(assert (=> b!615816 m!591493))

(assert (=> b!615816 m!591493))

(declare-fun m!591499 () Bool)

(assert (=> b!615816 m!591499))

(assert (=> b!615819 m!591493))

(declare-fun m!591501 () Bool)

(assert (=> b!615819 m!591501))

(declare-fun m!591503 () Bool)

(assert (=> b!615819 m!591503))

(assert (=> b!615819 m!591493))

(declare-fun m!591505 () Bool)

(assert (=> b!615819 m!591505))

(assert (=> b!615819 m!591493))

(declare-fun m!591507 () Bool)

(assert (=> b!615819 m!591507))

(declare-fun m!591509 () Bool)

(assert (=> b!615819 m!591509))

(assert (=> b!615819 m!591493))

(declare-fun m!591511 () Bool)

(assert (=> b!615819 m!591511))

(assert (=> b!615819 m!591493))

(declare-fun m!591513 () Bool)

(assert (=> b!615819 m!591513))

(declare-fun m!591515 () Bool)

(assert (=> b!615819 m!591515))

(declare-fun m!591517 () Bool)

(assert (=> b!615828 m!591517))

(declare-fun m!591519 () Bool)

(assert (=> b!615809 m!591519))

(assert (=> b!615810 m!591493))

(assert (=> b!615810 m!591493))

(declare-fun m!591521 () Bool)

(assert (=> b!615810 m!591521))

(declare-fun m!591523 () Bool)

(assert (=> b!615810 m!591523))

(assert (=> b!615810 m!591493))

(declare-fun m!591525 () Bool)

(assert (=> b!615810 m!591525))

(assert (=> b!615810 m!591493))

(declare-fun m!591527 () Bool)

(assert (=> b!615810 m!591527))

(assert (=> b!615810 m!591515))

(assert (=> b!615810 m!591501))

(declare-fun m!591529 () Bool)

(assert (=> b!615810 m!591529))

(declare-fun m!591531 () Bool)

(assert (=> b!615823 m!591531))

(declare-fun m!591533 () Bool)

(assert (=> b!615823 m!591533))

(declare-fun m!591535 () Bool)

(assert (=> b!615820 m!591535))

(declare-fun m!591537 () Bool)

(assert (=> b!615817 m!591537))

(declare-fun m!591539 () Bool)

(assert (=> start!56004 m!591539))

(declare-fun m!591541 () Bool)

(assert (=> start!56004 m!591541))

(declare-fun m!591543 () Bool)

(assert (=> b!615829 m!591543))

(assert (=> b!615825 m!591493))

(assert (=> b!615825 m!591493))

(declare-fun m!591545 () Bool)

(assert (=> b!615825 m!591545))

(declare-fun m!591547 () Bool)

(assert (=> b!615821 m!591547))

(assert (=> b!615821 m!591493))

(assert (=> b!615821 m!591531))

(declare-fun m!591549 () Bool)

(assert (=> b!615821 m!591549))

(assert (=> b!615821 m!591493))

(declare-fun m!591551 () Bool)

(assert (=> b!615821 m!591551))

(declare-fun m!591553 () Bool)

(assert (=> b!615821 m!591553))

(declare-fun m!591555 () Bool)

(assert (=> b!615821 m!591555))

(declare-fun m!591557 () Bool)

(assert (=> b!615821 m!591557))

(declare-fun m!591559 () Bool)

(assert (=> b!615824 m!591559))

(assert (=> b!615814 m!591493))

(assert (=> b!615814 m!591493))

(assert (=> b!615814 m!591495))

(assert (=> b!615832 m!591531))

(declare-fun m!591561 () Bool)

(assert (=> b!615832 m!591561))

(assert (=> b!615832 m!591493))

(assert (=> b!615815 m!591493))

(assert (=> b!615815 m!591493))

(assert (=> b!615815 m!591511))

(check-sat (not b!615821) (not b!615814) (not b!615817) (not start!56004) (not b!615810) (not b!615829) (not b!615826) (not b!615815) (not b!615824) (not b!615820) (not b!615816) (not b!615825) (not b!615828) (not b!615819))
(check-sat)
