; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58344 () Bool)

(assert start!58344)

(declare-fun b!644626 () Bool)

(declare-datatypes ((Unit!21870 0))(
  ( (Unit!21871) )
))
(declare-fun e!369350 () Unit!21870)

(declare-fun Unit!21872 () Unit!21870)

(assert (=> b!644626 (= e!369350 Unit!21872)))

(assert (=> b!644626 false))

(declare-fun b!644627 () Bool)

(declare-fun e!369360 () Bool)

(declare-fun e!369359 () Bool)

(assert (=> b!644627 (= e!369360 e!369359)))

(declare-fun res!417672 () Bool)

(assert (=> b!644627 (=> (not res!417672) (not e!369359))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38441 0))(
  ( (array!38442 (arr!18434 (Array (_ BitVec 32) (_ BitVec 64))) (size!18798 (_ BitVec 32))) )
))
(declare-fun lt!298829 () array!38441)

(declare-fun a!2986 () array!38441)

(declare-fun arrayContainsKey!0 (array!38441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644627 (= res!417672 (arrayContainsKey!0 lt!298829 (select (arr!18434 a!2986) j!136) j!136))))

(declare-fun b!644628 () Bool)

(declare-fun res!417679 () Bool)

(declare-fun e!369354 () Bool)

(assert (=> b!644628 (=> (not res!417679) (not e!369354))))

(declare-datatypes ((List!12475 0))(
  ( (Nil!12472) (Cons!12471 (h!13516 (_ BitVec 64)) (t!18703 List!12475)) )
))
(declare-fun arrayNoDuplicates!0 (array!38441 (_ BitVec 32) List!12475) Bool)

(assert (=> b!644628 (= res!417679 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12472))))

(declare-fun b!644629 () Bool)

(declare-fun res!417673 () Bool)

(declare-fun e!369358 () Bool)

(assert (=> b!644629 (=> (not res!417673) (not e!369358))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644629 (= res!417673 (validKeyInArray!0 k!1786))))

(declare-fun b!644630 () Bool)

(declare-fun res!417678 () Bool)

(assert (=> b!644630 (=> (not res!417678) (not e!369358))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!644630 (= res!417678 (and (= (size!18798 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18798 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18798 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644631 () Bool)

(declare-fun Unit!21873 () Unit!21870)

(assert (=> b!644631 (= e!369350 Unit!21873)))

(declare-fun b!644632 () Bool)

(declare-fun e!369347 () Bool)

(declare-fun e!369346 () Bool)

(assert (=> b!644632 (= e!369347 e!369346)))

(declare-fun res!417667 () Bool)

(assert (=> b!644632 (=> (not res!417667) (not e!369346))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6874 0))(
  ( (MissingZero!6874 (index!29828 (_ BitVec 32))) (Found!6874 (index!29829 (_ BitVec 32))) (Intermediate!6874 (undefined!7686 Bool) (index!29830 (_ BitVec 32)) (x!58594 (_ BitVec 32))) (Undefined!6874) (MissingVacant!6874 (index!29831 (_ BitVec 32))) )
))
(declare-fun lt!298836 () SeekEntryResult!6874)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!644632 (= res!417667 (and (= lt!298836 (Found!6874 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18434 a!2986) index!984) (select (arr!18434 a!2986) j!136))) (not (= (select (arr!18434 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38441 (_ BitVec 32)) SeekEntryResult!6874)

(assert (=> b!644632 (= lt!298836 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18434 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644633 () Bool)

(declare-fun e!369348 () Bool)

(assert (=> b!644633 (= e!369348 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (size!18798 a!2986) #b01111111111111111111111111111111)))))

(declare-fun e!369355 () Bool)

(assert (=> b!644633 e!369355))

(declare-fun res!417663 () Bool)

(assert (=> b!644633 (=> (not res!417663) (not e!369355))))

(assert (=> b!644633 (= res!417663 (arrayContainsKey!0 lt!298829 (select (arr!18434 a!2986) j!136) j!136))))

(declare-fun b!644634 () Bool)

(declare-fun res!417664 () Bool)

(assert (=> b!644634 (=> (not res!417664) (not e!369354))))

(assert (=> b!644634 (= res!417664 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18434 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644635 () Bool)

(declare-fun e!369352 () Bool)

(declare-fun lt!298834 () SeekEntryResult!6874)

(assert (=> b!644635 (= e!369352 (= lt!298836 lt!298834))))

(declare-fun b!644636 () Bool)

(declare-fun res!417666 () Bool)

(assert (=> b!644636 (=> (not res!417666) (not e!369358))))

(assert (=> b!644636 (= res!417666 (validKeyInArray!0 (select (arr!18434 a!2986) j!136)))))

(declare-fun b!644637 () Bool)

(assert (=> b!644637 (= e!369358 e!369354)))

(declare-fun res!417669 () Bool)

(assert (=> b!644637 (=> (not res!417669) (not e!369354))))

(declare-fun lt!298825 () SeekEntryResult!6874)

(assert (=> b!644637 (= res!417669 (or (= lt!298825 (MissingZero!6874 i!1108)) (= lt!298825 (MissingVacant!6874 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38441 (_ BitVec 32)) SeekEntryResult!6874)

(assert (=> b!644637 (= lt!298825 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!644638 () Bool)

(declare-fun e!369349 () Bool)

(assert (=> b!644638 (= e!369349 e!369360)))

(declare-fun res!417665 () Bool)

(assert (=> b!644638 (=> res!417665 e!369360)))

(declare-fun lt!298833 () (_ BitVec 64))

(declare-fun lt!298826 () (_ BitVec 64))

(assert (=> b!644638 (= res!417665 (or (not (= (select (arr!18434 a!2986) j!136) lt!298833)) (not (= (select (arr!18434 a!2986) j!136) lt!298826)) (bvsge j!136 index!984)))))

(declare-fun b!644639 () Bool)

(declare-fun e!369351 () Bool)

(assert (=> b!644639 (= e!369346 (not e!369351))))

(declare-fun res!417674 () Bool)

(assert (=> b!644639 (=> res!417674 e!369351)))

(declare-fun lt!298832 () SeekEntryResult!6874)

(assert (=> b!644639 (= res!417674 (not (= lt!298832 (Found!6874 index!984))))))

(declare-fun lt!298831 () Unit!21870)

(assert (=> b!644639 (= lt!298831 e!369350)))

(declare-fun c!73849 () Bool)

(assert (=> b!644639 (= c!73849 (= lt!298832 Undefined!6874))))

(assert (=> b!644639 (= lt!298832 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298833 lt!298829 mask!3053))))

(assert (=> b!644639 e!369352))

(declare-fun res!417676 () Bool)

(assert (=> b!644639 (=> (not res!417676) (not e!369352))))

(declare-fun lt!298828 () (_ BitVec 32))

(assert (=> b!644639 (= res!417676 (= lt!298834 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298828 vacantSpotIndex!68 lt!298833 lt!298829 mask!3053)))))

(assert (=> b!644639 (= lt!298834 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298828 vacantSpotIndex!68 (select (arr!18434 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644639 (= lt!298833 (select (store (arr!18434 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298827 () Unit!21870)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21870)

(assert (=> b!644639 (= lt!298827 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298828 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644639 (= lt!298828 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644640 () Bool)

(assert (=> b!644640 (= e!369354 e!369347)))

(declare-fun res!417677 () Bool)

(assert (=> b!644640 (=> (not res!417677) (not e!369347))))

(assert (=> b!644640 (= res!417677 (= (select (store (arr!18434 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644640 (= lt!298829 (array!38442 (store (arr!18434 a!2986) i!1108 k!1786) (size!18798 a!2986)))))

(declare-fun b!644641 () Bool)

(declare-fun res!417671 () Bool)

(assert (=> b!644641 (=> (not res!417671) (not e!369354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38441 (_ BitVec 32)) Bool)

(assert (=> b!644641 (= res!417671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644642 () Bool)

(declare-fun e!369356 () Bool)

(assert (=> b!644642 (= e!369356 e!369348)))

(declare-fun res!417675 () Bool)

(assert (=> b!644642 (=> res!417675 e!369348)))

(assert (=> b!644642 (= res!417675 (bvsge index!984 j!136))))

(declare-fun lt!298835 () Unit!21870)

(declare-fun e!369357 () Unit!21870)

(assert (=> b!644642 (= lt!298835 e!369357)))

(declare-fun c!73850 () Bool)

(assert (=> b!644642 (= c!73850 (bvslt j!136 index!984))))

(declare-fun b!644643 () Bool)

(declare-fun res!417670 () Bool)

(assert (=> b!644643 (=> (not res!417670) (not e!369358))))

(assert (=> b!644643 (= res!417670 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644644 () Bool)

(assert (=> b!644644 (= e!369351 e!369356)))

(declare-fun res!417668 () Bool)

(assert (=> b!644644 (=> res!417668 e!369356)))

(assert (=> b!644644 (= res!417668 (or (not (= (select (arr!18434 a!2986) j!136) lt!298833)) (not (= (select (arr!18434 a!2986) j!136) lt!298826))))))

(assert (=> b!644644 e!369349))

(declare-fun res!417680 () Bool)

(assert (=> b!644644 (=> (not res!417680) (not e!369349))))

(assert (=> b!644644 (= res!417680 (= lt!298826 (select (arr!18434 a!2986) j!136)))))

(assert (=> b!644644 (= lt!298826 (select (store (arr!18434 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!644645 () Bool)

(declare-fun Unit!21874 () Unit!21870)

(assert (=> b!644645 (= e!369357 Unit!21874)))

(declare-fun lt!298837 () Unit!21870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38441 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21870)

(assert (=> b!644645 (= lt!298837 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298829 (select (arr!18434 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644645 (arrayContainsKey!0 lt!298829 (select (arr!18434 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298830 () Unit!21870)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38441 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12475) Unit!21870)

(assert (=> b!644645 (= lt!298830 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12472))))

(assert (=> b!644645 (arrayNoDuplicates!0 lt!298829 #b00000000000000000000000000000000 Nil!12472)))

(declare-fun lt!298823 () Unit!21870)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38441 (_ BitVec 32) (_ BitVec 32)) Unit!21870)

(assert (=> b!644645 (= lt!298823 (lemmaNoDuplicateFromThenFromBigger!0 lt!298829 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644645 (arrayNoDuplicates!0 lt!298829 j!136 Nil!12472)))

(declare-fun lt!298824 () Unit!21870)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38441 (_ BitVec 64) (_ BitVec 32) List!12475) Unit!21870)

(assert (=> b!644645 (= lt!298824 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298829 (select (arr!18434 a!2986) j!136) j!136 Nil!12472))))

(assert (=> b!644645 false))

(declare-fun b!644646 () Bool)

(assert (=> b!644646 (= e!369355 (arrayContainsKey!0 lt!298829 (select (arr!18434 a!2986) j!136) index!984))))

(declare-fun b!644647 () Bool)

(declare-fun Unit!21875 () Unit!21870)

(assert (=> b!644647 (= e!369357 Unit!21875)))

(declare-fun res!417662 () Bool)

(assert (=> start!58344 (=> (not res!417662) (not e!369358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58344 (= res!417662 (validMask!0 mask!3053))))

(assert (=> start!58344 e!369358))

(assert (=> start!58344 true))

(declare-fun array_inv!14230 (array!38441) Bool)

(assert (=> start!58344 (array_inv!14230 a!2986)))

(declare-fun b!644648 () Bool)

(assert (=> b!644648 (= e!369359 (arrayContainsKey!0 lt!298829 (select (arr!18434 a!2986) j!136) index!984))))

(assert (= (and start!58344 res!417662) b!644630))

(assert (= (and b!644630 res!417678) b!644636))

(assert (= (and b!644636 res!417666) b!644629))

(assert (= (and b!644629 res!417673) b!644643))

(assert (= (and b!644643 res!417670) b!644637))

(assert (= (and b!644637 res!417669) b!644641))

(assert (= (and b!644641 res!417671) b!644628))

(assert (= (and b!644628 res!417679) b!644634))

(assert (= (and b!644634 res!417664) b!644640))

(assert (= (and b!644640 res!417677) b!644632))

(assert (= (and b!644632 res!417667) b!644639))

(assert (= (and b!644639 res!417676) b!644635))

(assert (= (and b!644639 c!73849) b!644626))

(assert (= (and b!644639 (not c!73849)) b!644631))

(assert (= (and b!644639 (not res!417674)) b!644644))

(assert (= (and b!644644 res!417680) b!644638))

(assert (= (and b!644638 (not res!417665)) b!644627))

(assert (= (and b!644627 res!417672) b!644648))

(assert (= (and b!644644 (not res!417668)) b!644642))

(assert (= (and b!644642 c!73850) b!644645))

(assert (= (and b!644642 (not c!73850)) b!644647))

(assert (= (and b!644642 (not res!417675)) b!644633))

(assert (= (and b!644633 res!417663) b!644646))

(declare-fun m!618209 () Bool)

(assert (=> b!644640 m!618209))

(declare-fun m!618211 () Bool)

(assert (=> b!644640 m!618211))

(declare-fun m!618213 () Bool)

(assert (=> b!644627 m!618213))

(assert (=> b!644627 m!618213))

(declare-fun m!618215 () Bool)

(assert (=> b!644627 m!618215))

(assert (=> b!644638 m!618213))

(declare-fun m!618217 () Bool)

(assert (=> b!644639 m!618217))

(declare-fun m!618219 () Bool)

(assert (=> b!644639 m!618219))

(assert (=> b!644639 m!618213))

(assert (=> b!644639 m!618209))

(assert (=> b!644639 m!618213))

(declare-fun m!618221 () Bool)

(assert (=> b!644639 m!618221))

(declare-fun m!618223 () Bool)

(assert (=> b!644639 m!618223))

(declare-fun m!618225 () Bool)

(assert (=> b!644639 m!618225))

(declare-fun m!618227 () Bool)

(assert (=> b!644639 m!618227))

(assert (=> b!644646 m!618213))

(assert (=> b!644646 m!618213))

(declare-fun m!618229 () Bool)

(assert (=> b!644646 m!618229))

(assert (=> b!644648 m!618213))

(assert (=> b!644648 m!618213))

(assert (=> b!644648 m!618229))

(declare-fun m!618231 () Bool)

(assert (=> b!644629 m!618231))

(declare-fun m!618233 () Bool)

(assert (=> b!644641 m!618233))

(declare-fun m!618235 () Bool)

(assert (=> b!644634 m!618235))

(assert (=> b!644633 m!618213))

(assert (=> b!644633 m!618213))

(assert (=> b!644633 m!618215))

(assert (=> b!644644 m!618213))

(assert (=> b!644644 m!618209))

(declare-fun m!618237 () Bool)

(assert (=> b!644644 m!618237))

(assert (=> b!644636 m!618213))

(assert (=> b!644636 m!618213))

(declare-fun m!618239 () Bool)

(assert (=> b!644636 m!618239))

(declare-fun m!618241 () Bool)

(assert (=> b!644643 m!618241))

(declare-fun m!618243 () Bool)

(assert (=> b!644628 m!618243))

(declare-fun m!618245 () Bool)

(assert (=> b!644637 m!618245))

(declare-fun m!618247 () Bool)

(assert (=> b!644645 m!618247))

(assert (=> b!644645 m!618213))

(assert (=> b!644645 m!618213))

(declare-fun m!618249 () Bool)

(assert (=> b!644645 m!618249))

(assert (=> b!644645 m!618213))

(declare-fun m!618251 () Bool)

(assert (=> b!644645 m!618251))

(declare-fun m!618253 () Bool)

(assert (=> b!644645 m!618253))

(assert (=> b!644645 m!618213))

(declare-fun m!618255 () Bool)

(assert (=> b!644645 m!618255))

(declare-fun m!618257 () Bool)

(assert (=> b!644645 m!618257))

(declare-fun m!618259 () Bool)

(assert (=> b!644645 m!618259))

(declare-fun m!618261 () Bool)

(assert (=> start!58344 m!618261))

(declare-fun m!618263 () Bool)

(assert (=> start!58344 m!618263))

(declare-fun m!618265 () Bool)

(assert (=> b!644632 m!618265))

(assert (=> b!644632 m!618213))

(assert (=> b!644632 m!618213))

(declare-fun m!618267 () Bool)

(assert (=> b!644632 m!618267))

(push 1)

(assert (not b!644641))

(assert (not b!644633))

(assert (not b!644629))

(assert (not b!644639))

(assert (not b!644637))

(assert (not b!644627))

(assert (not b!644648))

(assert (not b!644643))

(assert (not b!644632))

(assert (not b!644628))

(assert (not b!644646))

(assert (not b!644636))

(assert (not b!644645))

(assert (not start!58344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91091 () Bool)

(declare-fun lt!298879 () SeekEntryResult!6874)

(assert (=> d!91091 (and (or (is-Undefined!6874 lt!298879) (not (is-Found!6874 lt!298879)) (and (bvsge (index!29829 lt!298879) #b00000000000000000000000000000000) (bvslt (index!29829 lt!298879) (size!18798 a!2986)))) (or (is-Undefined!6874 lt!298879) (is-Found!6874 lt!298879) (not (is-MissingVacant!6874 lt!298879)) (not (= (index!29831 lt!298879) vacantSpotIndex!68)) (and (bvsge (index!29831 lt!298879) #b00000000000000000000000000000000) (bvslt (index!29831 lt!298879) (size!18798 a!2986)))) (or (is-Undefined!6874 lt!298879) (ite (is-Found!6874 lt!298879) (= (select (arr!18434 a!2986) (index!29829 lt!298879)) (select (arr!18434 a!2986) j!136)) (and (is-MissingVacant!6874 lt!298879) (= (index!29831 lt!298879) vacantSpotIndex!68) (= (select (arr!18434 a!2986) (index!29831 lt!298879)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369433 () SeekEntryResult!6874)

(assert (=> d!91091 (= lt!298879 e!369433)))

(declare-fun c!73881 () Bool)

(assert (=> d!91091 (= c!73881 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!298880 () (_ BitVec 64))

(assert (=> d!91091 (= lt!298880 (select (arr!18434 a!2986) index!984))))

(assert (=> d!91091 (validMask!0 mask!3053)))

(assert (=> d!91091 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18434 a!2986) j!136) a!2986 mask!3053) lt!298879)))

(declare-fun e!369432 () SeekEntryResult!6874)

(declare-fun b!644747 () Bool)

(assert (=> b!644747 (= e!369432 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18434 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644748 () Bool)

(declare-fun c!73880 () Bool)

(assert (=> b!644748 (= c!73880 (= lt!298880 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369431 () SeekEntryResult!6874)

(assert (=> b!644748 (= e!369431 e!369432)))

(declare-fun b!644749 () Bool)

(assert (=> b!644749 (= e!369431 (Found!6874 index!984))))

(declare-fun b!644750 () Bool)

(assert (=> b!644750 (= e!369433 Undefined!6874)))

(declare-fun b!644751 () Bool)

(assert (=> b!644751 (= e!369433 e!369431)))

(declare-fun c!73879 () Bool)

(assert (=> b!644751 (= c!73879 (= lt!298880 (select (arr!18434 a!2986) j!136)))))

(declare-fun b!644752 () Bool)

(assert (=> b!644752 (= e!369432 (MissingVacant!6874 vacantSpotIndex!68))))

(assert (= (and d!91091 c!73881) b!644750))

(assert (= (and d!91091 (not c!73881)) b!644751))

(assert (= (and b!644751 c!73879) b!644749))

(assert (= (and b!644751 (not c!73879)) b!644748))

(assert (= (and b!644748 c!73880) b!644752))

(assert (= (and b!644748 (not c!73880)) b!644747))

(declare-fun m!618355 () Bool)

(assert (=> d!91091 m!618355))

(declare-fun m!618357 () Bool)

(assert (=> d!91091 m!618357))

(assert (=> d!91091 m!618265))

(assert (=> d!91091 m!618261))

(assert (=> b!644747 m!618217))

(assert (=> b!644747 m!618217))

(assert (=> b!644747 m!618213))

(declare-fun m!618359 () Bool)

(assert (=> b!644747 m!618359))

(assert (=> b!644632 d!91091))

(declare-fun d!91113 () Bool)

(declare-fun res!417730 () Bool)

(declare-fun e!369445 () Bool)

(assert (=> d!91113 (=> res!417730 e!369445)))

(assert (=> d!91113 (= res!417730 (= (select (arr!18434 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91113 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!369445)))

(declare-fun b!644768 () Bool)

(declare-fun e!369446 () Bool)

(assert (=> b!644768 (= e!369445 e!369446)))

(declare-fun res!417731 () Bool)

(assert (=> b!644768 (=> (not res!417731) (not e!369446))))

(assert (=> b!644768 (= res!417731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18798 a!2986)))))

(declare-fun b!644769 () Bool)

(assert (=> b!644769 (= e!369446 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91113 (not res!417730)) b!644768))

(assert (= (and b!644768 res!417731) b!644769))

(declare-fun m!618371 () Bool)

(assert (=> d!91113 m!618371))

(declare-fun m!618373 () Bool)

(assert (=> b!644769 m!618373))

(assert (=> b!644643 d!91113))

(declare-fun b!644790 () Bool)

(declare-fun e!369460 () Bool)

(declare-fun e!369459 () Bool)

(assert (=> b!644790 (= e!369460 e!369459)))

(declare-fun lt!298895 () (_ BitVec 64))

(assert (=> b!644790 (= lt!298895 (select (arr!18434 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!298894 () Unit!21870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38441 (_ BitVec 64) (_ BitVec 32)) Unit!21870)

(assert (=> b!644790 (= lt!298894 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!298895 #b00000000000000000000000000000000))))

(assert (=> b!644790 (arrayContainsKey!0 a!2986 lt!298895 #b00000000000000000000000000000000)))

(declare-fun lt!298893 () Unit!21870)

(assert (=> b!644790 (= lt!298893 lt!298894)))

(declare-fun res!417736 () Bool)

(assert (=> b!644790 (= res!417736 (= (seekEntryOrOpen!0 (select (arr!18434 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6874 #b00000000000000000000000000000000)))))

(assert (=> b!644790 (=> (not res!417736) (not e!369459))))

(declare-fun b!644791 () Bool)

(declare-fun call!33619 () Bool)

(assert (=> b!644791 (= e!369459 call!33619)))

(declare-fun bm!33616 () Bool)

(assert (=> bm!33616 (= call!33619 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!644792 () Bool)

(declare-fun e!369461 () Bool)

(assert (=> b!644792 (= e!369461 e!369460)))

(declare-fun c!73894 () Bool)

(assert (=> b!644792 (= c!73894 (validKeyInArray!0 (select (arr!18434 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91121 () Bool)

(declare-fun res!417737 () Bool)

(assert (=> d!91121 (=> res!417737 e!369461)))

(assert (=> d!91121 (= res!417737 (bvsge #b00000000000000000000000000000000 (size!18798 a!2986)))))

(assert (=> d!91121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!369461)))

(declare-fun b!644793 () Bool)

(assert (=> b!644793 (= e!369460 call!33619)))

(assert (= (and d!91121 (not res!417737)) b!644792))

(assert (= (and b!644792 c!73894) b!644790))

(assert (= (and b!644792 (not c!73894)) b!644793))

(assert (= (and b!644790 res!417736) b!644791))

(assert (= (or b!644791 b!644793) bm!33616))

(assert (=> b!644790 m!618371))

(declare-fun m!618375 () Bool)

(assert (=> b!644790 m!618375))

(declare-fun m!618377 () Bool)

(assert (=> b!644790 m!618377))

(assert (=> b!644790 m!618371))

(declare-fun m!618379 () Bool)

(assert (=> b!644790 m!618379))

(declare-fun m!618381 () Bool)

(assert (=> bm!33616 m!618381))

(assert (=> b!644792 m!618371))

(assert (=> b!644792 m!618371))

(declare-fun m!618383 () Bool)

(assert (=> b!644792 m!618383))

(assert (=> b!644641 d!91121))

(declare-fun d!91123 () Bool)

(assert (=> d!91123 (arrayContainsKey!0 lt!298829 (select (arr!18434 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298898 () Unit!21870)

(declare-fun choose!114 (array!38441 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21870)

(assert (=> d!91123 (= lt!298898 (choose!114 lt!298829 (select (arr!18434 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91123 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91123 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298829 (select (arr!18434 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!298898)))

(declare-fun bs!19274 () Bool)

(assert (= bs!19274 d!91123))

(assert (=> bs!19274 m!618213))

(assert (=> bs!19274 m!618255))

(assert (=> bs!19274 m!618213))

(declare-fun m!618387 () Bool)

(assert (=> bs!19274 m!618387))

(assert (=> b!644645 d!91123))

(declare-fun bm!33619 () Bool)

(declare-fun call!33622 () Bool)

(declare-fun c!73900 () Bool)

(assert (=> bm!33619 (= call!33622 (arrayNoDuplicates!0 lt!298829 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73900 (Cons!12471 (select (arr!18434 lt!298829) #b00000000000000000000000000000000) Nil!12472) Nil!12472)))))

(declare-fun b!644813 () Bool)

(declare-fun e!369475 () Bool)

(assert (=> b!644813 (= e!369475 call!33622)))

(declare-fun b!644814 () Bool)

(assert (=> b!644814 (= e!369475 call!33622)))

(declare-fun b!644812 () Bool)

(declare-fun e!369477 () Bool)

(declare-fun contains!3145 (List!12475 (_ BitVec 64)) Bool)

(assert (=> b!644812 (= e!369477 (contains!3145 Nil!12472 (select (arr!18434 lt!298829) #b00000000000000000000000000000000)))))

(declare-fun d!91133 () Bool)

(declare-fun res!417747 () Bool)

(declare-fun e!369476 () Bool)

(assert (=> d!91133 (=> res!417747 e!369476)))

(assert (=> d!91133 (= res!417747 (bvsge #b00000000000000000000000000000000 (size!18798 lt!298829)))))

(assert (=> d!91133 (= (arrayNoDuplicates!0 lt!298829 #b00000000000000000000000000000000 Nil!12472) e!369476)))

(declare-fun b!644815 () Bool)

(declare-fun e!369478 () Bool)

(assert (=> b!644815 (= e!369476 e!369478)))

(declare-fun res!417748 () Bool)

(assert (=> b!644815 (=> (not res!417748) (not e!369478))))

(assert (=> b!644815 (= res!417748 (not e!369477))))

(declare-fun res!417746 () Bool)

(assert (=> b!644815 (=> (not res!417746) (not e!369477))))

(assert (=> b!644815 (= res!417746 (validKeyInArray!0 (select (arr!18434 lt!298829) #b00000000000000000000000000000000)))))

(declare-fun b!644816 () Bool)

(assert (=> b!644816 (= e!369478 e!369475)))

(assert (=> b!644816 (= c!73900 (validKeyInArray!0 (select (arr!18434 lt!298829) #b00000000000000000000000000000000)))))

(assert (= (and d!91133 (not res!417747)) b!644815))

(assert (= (and b!644815 res!417746) b!644812))

(assert (= (and b!644815 res!417748) b!644816))

(assert (= (and b!644816 c!73900) b!644813))

(assert (= (and b!644816 (not c!73900)) b!644814))

(assert (= (or b!644813 b!644814) bm!33619))

(declare-fun m!618395 () Bool)

(assert (=> bm!33619 m!618395))

(declare-fun m!618397 () Bool)

(assert (=> bm!33619 m!618397))

(assert (=> b!644812 m!618395))

(assert (=> b!644812 m!618395))

(declare-fun m!618399 () Bool)

(assert (=> b!644812 m!618399))

(assert (=> b!644815 m!618395))

(assert (=> b!644815 m!618395))

(declare-fun m!618401 () Bool)

(assert (=> b!644815 m!618401))

(assert (=> b!644816 m!618395))

(assert (=> b!644816 m!618395))

(assert (=> b!644816 m!618401))

(assert (=> b!644645 d!91133))

(declare-fun d!91137 () Bool)

(assert (=> d!91137 (arrayNoDuplicates!0 lt!298829 j!136 Nil!12472)))

(declare-fun lt!298903 () Unit!21870)

(declare-fun choose!39 (array!38441 (_ BitVec 32) (_ BitVec 32)) Unit!21870)

(assert (=> d!91137 (= lt!298903 (choose!39 lt!298829 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91137 (bvslt (size!18798 lt!298829) #b01111111111111111111111111111111)))

(assert (=> d!91137 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!298829 #b00000000000000000000000000000000 j!136) lt!298903)))

(declare-fun bs!19275 () Bool)

(assert (= bs!19275 d!91137))

(assert (=> bs!19275 m!618247))

(declare-fun m!618403 () Bool)

(assert (=> bs!19275 m!618403))

(assert (=> b!644645 d!91137))

(declare-fun d!91139 () Bool)

(assert (=> d!91139 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18798 lt!298829)) (not (= (select (arr!18434 lt!298829) j!136) (select (arr!18434 a!2986) j!136))))))

(declare-fun lt!298906 () Unit!21870)

(declare-fun choose!21 (array!38441 (_ BitVec 64) (_ BitVec 32) List!12475) Unit!21870)

(assert (=> d!91139 (= lt!298906 (choose!21 lt!298829 (select (arr!18434 a!2986) j!136) j!136 Nil!12472))))

(assert (=> d!91139 (bvslt (size!18798 lt!298829) #b01111111111111111111111111111111)))

(assert (=> d!91139 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298829 (select (arr!18434 a!2986) j!136) j!136 Nil!12472) lt!298906)))

(declare-fun bs!19276 () Bool)

(assert (= bs!19276 d!91139))

(declare-fun m!618415 () Bool)

(assert (=> bs!19276 m!618415))

(assert (=> bs!19276 m!618213))

(declare-fun m!618417 () Bool)

(assert (=> bs!19276 m!618417))

(assert (=> b!644645 d!91139))

(declare-fun bm!33623 () Bool)

(declare-fun c!73904 () Bool)

(declare-fun call!33626 () Bool)

(assert (=> bm!33623 (= call!33626 (arrayNoDuplicates!0 lt!298829 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73904 (Cons!12471 (select (arr!18434 lt!298829) j!136) Nil!12472) Nil!12472)))))

(declare-fun b!644835 () Bool)

(declare-fun e!369493 () Bool)

(assert (=> b!644835 (= e!369493 call!33626)))

(declare-fun b!644836 () Bool)

(assert (=> b!644836 (= e!369493 call!33626)))

(declare-fun b!644834 () Bool)

(declare-fun e!369495 () Bool)

(assert (=> b!644834 (= e!369495 (contains!3145 Nil!12472 (select (arr!18434 lt!298829) j!136)))))

(declare-fun d!91145 () Bool)

(declare-fun res!417761 () Bool)

(declare-fun e!369494 () Bool)

(assert (=> d!91145 (=> res!417761 e!369494)))

(assert (=> d!91145 (= res!417761 (bvsge j!136 (size!18798 lt!298829)))))

(assert (=> d!91145 (= (arrayNoDuplicates!0 lt!298829 j!136 Nil!12472) e!369494)))

(declare-fun b!644837 () Bool)

(declare-fun e!369496 () Bool)

(assert (=> b!644837 (= e!369494 e!369496)))

(declare-fun res!417762 () Bool)

(assert (=> b!644837 (=> (not res!417762) (not e!369496))))

(assert (=> b!644837 (= res!417762 (not e!369495))))

(declare-fun res!417760 () Bool)

(assert (=> b!644837 (=> (not res!417760) (not e!369495))))

(assert (=> b!644837 (= res!417760 (validKeyInArray!0 (select (arr!18434 lt!298829) j!136)))))

(declare-fun b!644838 () Bool)

(assert (=> b!644838 (= e!369496 e!369493)))

(assert (=> b!644838 (= c!73904 (validKeyInArray!0 (select (arr!18434 lt!298829) j!136)))))

(assert (= (and d!91145 (not res!417761)) b!644837))

(assert (= (and b!644837 res!417760) b!644834))

(assert (= (and b!644837 res!417762) b!644838))

(assert (= (and b!644838 c!73904) b!644835))

(assert (= (and b!644838 (not c!73904)) b!644836))

(assert (= (or b!644835 b!644836) bm!33623))

(assert (=> bm!33623 m!618415))

(declare-fun m!618419 () Bool)

(assert (=> bm!33623 m!618419))

(assert (=> b!644834 m!618415))

(assert (=> b!644834 m!618415))

(declare-fun m!618421 () Bool)

(assert (=> b!644834 m!618421))

(assert (=> b!644837 m!618415))

(assert (=> b!644837 m!618415))

(declare-fun m!618423 () Bool)

(assert (=> b!644837 m!618423))

(assert (=> b!644838 m!618415))

(assert (=> b!644838 m!618415))

(assert (=> b!644838 m!618423))

(assert (=> b!644645 d!91145))

(declare-fun d!91147 () Bool)

(declare-fun e!369505 () Bool)

(assert (=> d!91147 e!369505))

(declare-fun res!417765 () Bool)

(assert (=> d!91147 (=> (not res!417765) (not e!369505))))

(assert (=> d!91147 (= res!417765 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18798 a!2986))))))

(declare-fun lt!298915 () Unit!21870)

(declare-fun choose!41 (array!38441 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12475) Unit!21870)

(assert (=> d!91147 (= lt!298915 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12472))))

(assert (=> d!91147 (bvslt (size!18798 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91147 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12472) lt!298915)))

(declare-fun b!644853 () Bool)

(assert (=> b!644853 (= e!369505 (arrayNoDuplicates!0 (array!38442 (store (arr!18434 a!2986) i!1108 k!1786) (size!18798 a!2986)) #b00000000000000000000000000000000 Nil!12472))))

(assert (= (and d!91147 res!417765) b!644853))

(declare-fun m!618425 () Bool)

(assert (=> d!91147 m!618425))

(assert (=> b!644853 m!618209))

(declare-fun m!618427 () Bool)

(assert (=> b!644853 m!618427))

(assert (=> b!644645 d!91147))

(declare-fun d!91149 () Bool)

(declare-fun res!417766 () Bool)

(declare-fun e!369506 () Bool)

(assert (=> d!91149 (=> res!417766 e!369506)))

(assert (=> d!91149 (= res!417766 (= (select (arr!18434 lt!298829) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18434 a!2986) j!136)))))

(assert (=> d!91149 (= (arrayContainsKey!0 lt!298829 (select (arr!18434 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!369506)))

(declare-fun b!644854 () Bool)

