; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59628 () Bool)

(assert start!59628)

(declare-fun b!658003 () Bool)

(declare-fun res!426664 () Bool)

(declare-fun e!378013 () Bool)

(assert (=> b!658003 (=> (not res!426664) (not e!378013))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658003 (= res!426664 (validKeyInArray!0 k0!1786))))

(declare-fun b!658005 () Bool)

(declare-fun res!426672 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658005 (= res!426672 (bvsge j!136 index!984))))

(declare-fun e!378017 () Bool)

(assert (=> b!658005 (=> res!426672 e!378017)))

(declare-fun e!378011 () Bool)

(assert (=> b!658005 (= e!378011 e!378017)))

(declare-fun b!658006 () Bool)

(declare-fun res!426671 () Bool)

(assert (=> b!658006 (=> (not res!426671) (not e!378013))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38724 0))(
  ( (array!38725 (arr!18556 (Array (_ BitVec 32) (_ BitVec 64))) (size!18920 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38724)

(assert (=> b!658006 (= res!426671 (and (= (size!18920 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18920 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18920 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658007 () Bool)

(assert (=> b!658007 false))

(declare-fun lt!307449 () array!38724)

(declare-datatypes ((Unit!22743 0))(
  ( (Unit!22744) )
))
(declare-fun lt!307433 () Unit!22743)

(declare-datatypes ((List!12504 0))(
  ( (Nil!12501) (Cons!12500 (h!13548 (_ BitVec 64)) (t!18724 List!12504)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38724 (_ BitVec 64) (_ BitVec 32) List!12504) Unit!22743)

(assert (=> b!658007 (= lt!307433 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307449 (select (arr!18556 a!2986) j!136) j!136 Nil!12501))))

(declare-fun arrayNoDuplicates!0 (array!38724 (_ BitVec 32) List!12504) Bool)

(assert (=> b!658007 (arrayNoDuplicates!0 lt!307449 j!136 Nil!12501)))

(declare-fun lt!307446 () Unit!22743)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38724 (_ BitVec 32) (_ BitVec 32)) Unit!22743)

(assert (=> b!658007 (= lt!307446 (lemmaNoDuplicateFromThenFromBigger!0 lt!307449 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658007 (arrayNoDuplicates!0 lt!307449 #b00000000000000000000000000000000 Nil!12501)))

(declare-fun lt!307444 () Unit!22743)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38724 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12504) Unit!22743)

(assert (=> b!658007 (= lt!307444 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12501))))

(declare-fun arrayContainsKey!0 (array!38724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658007 (arrayContainsKey!0 lt!307449 (select (arr!18556 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307443 () Unit!22743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38724 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22743)

(assert (=> b!658007 (= lt!307443 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307449 (select (arr!18556 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378008 () Unit!22743)

(declare-fun Unit!22745 () Unit!22743)

(assert (=> b!658007 (= e!378008 Unit!22745)))

(declare-fun b!658008 () Bool)

(declare-fun res!426669 () Bool)

(declare-fun e!378015 () Bool)

(assert (=> b!658008 (=> (not res!426669) (not e!378015))))

(assert (=> b!658008 (= res!426669 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12501))))

(declare-fun b!658009 () Bool)

(declare-fun e!378014 () Unit!22743)

(declare-fun Unit!22746 () Unit!22743)

(assert (=> b!658009 (= e!378014 Unit!22746)))

(assert (=> b!658009 false))

(declare-fun b!658010 () Bool)

(declare-fun e!378006 () Bool)

(assert (=> b!658010 (= e!378006 true)))

(assert (=> b!658010 (= (select (store (arr!18556 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!658011 () Bool)

(declare-fun e!378004 () Unit!22743)

(declare-fun Unit!22747 () Unit!22743)

(assert (=> b!658011 (= e!378004 Unit!22747)))

(declare-fun res!426670 () Bool)

(assert (=> b!658011 (= res!426670 (= (select (store (arr!18556 a!2986) i!1108 k0!1786) index!984) (select (arr!18556 a!2986) j!136)))))

(assert (=> b!658011 (=> (not res!426670) (not e!378011))))

(assert (=> b!658011 e!378011))

(declare-fun c!76043 () Bool)

(assert (=> b!658011 (= c!76043 (bvslt j!136 index!984))))

(declare-fun lt!307435 () Unit!22743)

(assert (=> b!658011 (= lt!307435 e!378008)))

(declare-fun c!76040 () Bool)

(assert (=> b!658011 (= c!76040 (bvslt index!984 j!136))))

(declare-fun lt!307448 () Unit!22743)

(declare-fun e!378010 () Unit!22743)

(assert (=> b!658011 (= lt!307448 e!378010)))

(assert (=> b!658011 false))

(declare-fun b!658012 () Bool)

(declare-fun res!426661 () Bool)

(assert (=> b!658012 (=> (not res!426661) (not e!378013))))

(assert (=> b!658012 (= res!426661 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658013 () Bool)

(declare-fun e!378007 () Bool)

(declare-fun e!378009 () Bool)

(assert (=> b!658013 (= e!378007 e!378009)))

(declare-fun res!426663 () Bool)

(assert (=> b!658013 (=> (not res!426663) (not e!378009))))

(declare-datatypes ((SeekEntryResult!6952 0))(
  ( (MissingZero!6952 (index!30173 (_ BitVec 32))) (Found!6952 (index!30174 (_ BitVec 32))) (Intermediate!6952 (undefined!7764 Bool) (index!30175 (_ BitVec 32)) (x!59118 (_ BitVec 32))) (Undefined!6952) (MissingVacant!6952 (index!30176 (_ BitVec 32))) )
))
(declare-fun lt!307450 () SeekEntryResult!6952)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!658013 (= res!426663 (and (= lt!307450 (Found!6952 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18556 a!2986) index!984) (select (arr!18556 a!2986) j!136))) (not (= (select (arr!18556 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38724 (_ BitVec 32)) SeekEntryResult!6952)

(assert (=> b!658013 (= lt!307450 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18556 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658014 () Bool)

(declare-fun res!426676 () Bool)

(assert (=> b!658014 (=> (not res!426676) (not e!378015))))

(assert (=> b!658014 (= res!426676 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18556 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658015 () Bool)

(declare-fun e!378016 () Bool)

(assert (=> b!658015 (= e!378016 (arrayContainsKey!0 lt!307449 (select (arr!18556 a!2986) j!136) index!984))))

(declare-fun b!658016 () Bool)

(assert (=> b!658016 (= e!378009 (not e!378006))))

(declare-fun res!426674 () Bool)

(assert (=> b!658016 (=> res!426674 e!378006)))

(declare-fun lt!307437 () SeekEntryResult!6952)

(assert (=> b!658016 (= res!426674 (not (= lt!307437 (MissingVacant!6952 vacantSpotIndex!68))))))

(declare-fun lt!307431 () Unit!22743)

(assert (=> b!658016 (= lt!307431 e!378004)))

(declare-fun c!76041 () Bool)

(assert (=> b!658016 (= c!76041 (= lt!307437 (Found!6952 index!984)))))

(declare-fun lt!307442 () Unit!22743)

(assert (=> b!658016 (= lt!307442 e!378014)))

(declare-fun c!76042 () Bool)

(assert (=> b!658016 (= c!76042 (= lt!307437 Undefined!6952))))

(declare-fun lt!307440 () (_ BitVec 64))

(assert (=> b!658016 (= lt!307437 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307440 lt!307449 mask!3053))))

(declare-fun e!378012 () Bool)

(assert (=> b!658016 e!378012))

(declare-fun res!426666 () Bool)

(assert (=> b!658016 (=> (not res!426666) (not e!378012))))

(declare-fun lt!307447 () (_ BitVec 32))

(declare-fun lt!307432 () SeekEntryResult!6952)

(assert (=> b!658016 (= res!426666 (= lt!307432 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307447 vacantSpotIndex!68 lt!307440 lt!307449 mask!3053)))))

(assert (=> b!658016 (= lt!307432 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307447 vacantSpotIndex!68 (select (arr!18556 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658016 (= lt!307440 (select (store (arr!18556 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307445 () Unit!22743)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38724 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22743)

(assert (=> b!658016 (= lt!307445 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307447 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658016 (= lt!307447 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!426673 () Bool)

(declare-fun b!658017 () Bool)

(assert (=> b!658017 (= res!426673 (arrayContainsKey!0 lt!307449 (select (arr!18556 a!2986) j!136) j!136))))

(declare-fun e!378005 () Bool)

(assert (=> b!658017 (=> (not res!426673) (not e!378005))))

(assert (=> b!658017 (= e!378017 e!378005)))

(declare-fun b!658004 () Bool)

(assert (=> b!658004 false))

(declare-fun lt!307439 () Unit!22743)

(assert (=> b!658004 (= lt!307439 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307449 (select (arr!18556 a!2986) j!136) index!984 Nil!12501))))

(assert (=> b!658004 (arrayNoDuplicates!0 lt!307449 index!984 Nil!12501)))

(declare-fun lt!307436 () Unit!22743)

(assert (=> b!658004 (= lt!307436 (lemmaNoDuplicateFromThenFromBigger!0 lt!307449 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658004 (arrayNoDuplicates!0 lt!307449 #b00000000000000000000000000000000 Nil!12501)))

(declare-fun lt!307438 () Unit!22743)

(assert (=> b!658004 (= lt!307438 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12501))))

(assert (=> b!658004 (arrayContainsKey!0 lt!307449 (select (arr!18556 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307434 () Unit!22743)

(assert (=> b!658004 (= lt!307434 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307449 (select (arr!18556 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658004 e!378016))

(declare-fun res!426662 () Bool)

(assert (=> b!658004 (=> (not res!426662) (not e!378016))))

(assert (=> b!658004 (= res!426662 (arrayContainsKey!0 lt!307449 (select (arr!18556 a!2986) j!136) j!136))))

(declare-fun Unit!22748 () Unit!22743)

(assert (=> b!658004 (= e!378010 Unit!22748)))

(declare-fun res!426668 () Bool)

(assert (=> start!59628 (=> (not res!426668) (not e!378013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59628 (= res!426668 (validMask!0 mask!3053))))

(assert (=> start!59628 e!378013))

(assert (=> start!59628 true))

(declare-fun array_inv!14415 (array!38724) Bool)

(assert (=> start!59628 (array_inv!14415 a!2986)))

(declare-fun b!658018 () Bool)

(declare-fun res!426660 () Bool)

(assert (=> b!658018 (=> (not res!426660) (not e!378015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38724 (_ BitVec 32)) Bool)

(assert (=> b!658018 (= res!426660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658019 () Bool)

(assert (=> b!658019 (= e!378013 e!378015)))

(declare-fun res!426667 () Bool)

(assert (=> b!658019 (=> (not res!426667) (not e!378015))))

(declare-fun lt!307441 () SeekEntryResult!6952)

(assert (=> b!658019 (= res!426667 (or (= lt!307441 (MissingZero!6952 i!1108)) (= lt!307441 (MissingVacant!6952 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38724 (_ BitVec 32)) SeekEntryResult!6952)

(assert (=> b!658019 (= lt!307441 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658020 () Bool)

(assert (=> b!658020 (= e!378015 e!378007)))

(declare-fun res!426665 () Bool)

(assert (=> b!658020 (=> (not res!426665) (not e!378007))))

(assert (=> b!658020 (= res!426665 (= (select (store (arr!18556 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658020 (= lt!307449 (array!38725 (store (arr!18556 a!2986) i!1108 k0!1786) (size!18920 a!2986)))))

(declare-fun b!658021 () Bool)

(declare-fun Unit!22749 () Unit!22743)

(assert (=> b!658021 (= e!378010 Unit!22749)))

(declare-fun b!658022 () Bool)

(declare-fun Unit!22750 () Unit!22743)

(assert (=> b!658022 (= e!378014 Unit!22750)))

(declare-fun b!658023 () Bool)

(declare-fun res!426675 () Bool)

(assert (=> b!658023 (=> (not res!426675) (not e!378013))))

(assert (=> b!658023 (= res!426675 (validKeyInArray!0 (select (arr!18556 a!2986) j!136)))))

(declare-fun b!658024 () Bool)

(assert (=> b!658024 (= e!378012 (= lt!307450 lt!307432))))

(declare-fun b!658025 () Bool)

(declare-fun Unit!22751 () Unit!22743)

(assert (=> b!658025 (= e!378008 Unit!22751)))

(declare-fun b!658026 () Bool)

(declare-fun Unit!22752 () Unit!22743)

(assert (=> b!658026 (= e!378004 Unit!22752)))

(declare-fun b!658027 () Bool)

(assert (=> b!658027 (= e!378005 (arrayContainsKey!0 lt!307449 (select (arr!18556 a!2986) j!136) index!984))))

(assert (= (and start!59628 res!426668) b!658006))

(assert (= (and b!658006 res!426671) b!658023))

(assert (= (and b!658023 res!426675) b!658003))

(assert (= (and b!658003 res!426664) b!658012))

(assert (= (and b!658012 res!426661) b!658019))

(assert (= (and b!658019 res!426667) b!658018))

(assert (= (and b!658018 res!426660) b!658008))

(assert (= (and b!658008 res!426669) b!658014))

(assert (= (and b!658014 res!426676) b!658020))

(assert (= (and b!658020 res!426665) b!658013))

(assert (= (and b!658013 res!426663) b!658016))

(assert (= (and b!658016 res!426666) b!658024))

(assert (= (and b!658016 c!76042) b!658009))

(assert (= (and b!658016 (not c!76042)) b!658022))

(assert (= (and b!658016 c!76041) b!658011))

(assert (= (and b!658016 (not c!76041)) b!658026))

(assert (= (and b!658011 res!426670) b!658005))

(assert (= (and b!658005 (not res!426672)) b!658017))

(assert (= (and b!658017 res!426673) b!658027))

(assert (= (and b!658011 c!76043) b!658007))

(assert (= (and b!658011 (not c!76043)) b!658025))

(assert (= (and b!658011 c!76040) b!658004))

(assert (= (and b!658011 (not c!76040)) b!658021))

(assert (= (and b!658004 res!426662) b!658015))

(assert (= (and b!658016 (not res!426674)) b!658010))

(declare-fun m!631489 () Bool)

(assert (=> b!658019 m!631489))

(declare-fun m!631491 () Bool)

(assert (=> b!658017 m!631491))

(assert (=> b!658017 m!631491))

(declare-fun m!631493 () Bool)

(assert (=> b!658017 m!631493))

(declare-fun m!631495 () Bool)

(assert (=> start!59628 m!631495))

(declare-fun m!631497 () Bool)

(assert (=> start!59628 m!631497))

(assert (=> b!658015 m!631491))

(assert (=> b!658015 m!631491))

(declare-fun m!631499 () Bool)

(assert (=> b!658015 m!631499))

(declare-fun m!631501 () Bool)

(assert (=> b!658003 m!631501))

(declare-fun m!631503 () Bool)

(assert (=> b!658014 m!631503))

(declare-fun m!631505 () Bool)

(assert (=> b!658011 m!631505))

(declare-fun m!631507 () Bool)

(assert (=> b!658011 m!631507))

(assert (=> b!658011 m!631491))

(assert (=> b!658020 m!631505))

(declare-fun m!631509 () Bool)

(assert (=> b!658020 m!631509))

(declare-fun m!631511 () Bool)

(assert (=> b!658018 m!631511))

(declare-fun m!631513 () Bool)

(assert (=> b!658012 m!631513))

(assert (=> b!658023 m!631491))

(assert (=> b!658023 m!631491))

(declare-fun m!631515 () Bool)

(assert (=> b!658023 m!631515))

(assert (=> b!658004 m!631491))

(declare-fun m!631517 () Bool)

(assert (=> b!658004 m!631517))

(assert (=> b!658004 m!631491))

(declare-fun m!631519 () Bool)

(assert (=> b!658004 m!631519))

(assert (=> b!658004 m!631491))

(declare-fun m!631521 () Bool)

(assert (=> b!658004 m!631521))

(declare-fun m!631523 () Bool)

(assert (=> b!658004 m!631523))

(assert (=> b!658004 m!631491))

(assert (=> b!658004 m!631493))

(assert (=> b!658004 m!631491))

(declare-fun m!631525 () Bool)

(assert (=> b!658004 m!631525))

(declare-fun m!631527 () Bool)

(assert (=> b!658004 m!631527))

(declare-fun m!631529 () Bool)

(assert (=> b!658004 m!631529))

(declare-fun m!631531 () Bool)

(assert (=> b!658008 m!631531))

(declare-fun m!631533 () Bool)

(assert (=> b!658016 m!631533))

(declare-fun m!631535 () Bool)

(assert (=> b!658016 m!631535))

(declare-fun m!631537 () Bool)

(assert (=> b!658016 m!631537))

(assert (=> b!658016 m!631491))

(declare-fun m!631539 () Bool)

(assert (=> b!658016 m!631539))

(assert (=> b!658016 m!631505))

(declare-fun m!631541 () Bool)

(assert (=> b!658016 m!631541))

(declare-fun m!631543 () Bool)

(assert (=> b!658016 m!631543))

(assert (=> b!658016 m!631491))

(assert (=> b!658027 m!631491))

(assert (=> b!658027 m!631491))

(assert (=> b!658027 m!631499))

(declare-fun m!631545 () Bool)

(assert (=> b!658013 m!631545))

(assert (=> b!658013 m!631491))

(assert (=> b!658013 m!631491))

(declare-fun m!631547 () Bool)

(assert (=> b!658013 m!631547))

(declare-fun m!631549 () Bool)

(assert (=> b!658007 m!631549))

(declare-fun m!631551 () Bool)

(assert (=> b!658007 m!631551))

(assert (=> b!658007 m!631491))

(declare-fun m!631553 () Bool)

(assert (=> b!658007 m!631553))

(assert (=> b!658007 m!631491))

(assert (=> b!658007 m!631523))

(assert (=> b!658007 m!631529))

(assert (=> b!658007 m!631491))

(declare-fun m!631555 () Bool)

(assert (=> b!658007 m!631555))

(assert (=> b!658007 m!631491))

(declare-fun m!631557 () Bool)

(assert (=> b!658007 m!631557))

(assert (=> b!658010 m!631505))

(assert (=> b!658010 m!631507))

(check-sat (not b!658008) (not b!658018) (not b!658016) (not b!658003) (not b!658007) (not b!658023) (not b!658015) (not b!658012) (not start!59628) (not b!658019) (not b!658017) (not b!658004) (not b!658013) (not b!658027))
(check-sat)
