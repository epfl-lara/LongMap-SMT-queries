; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57686 () Bool)

(assert start!57686)

(declare-fun b!637514 () Bool)

(declare-fun e!364769 () Bool)

(declare-fun e!364768 () Bool)

(assert (=> b!637514 (= e!364769 e!364768)))

(declare-fun res!412556 () Bool)

(assert (=> b!637514 (=> res!412556 e!364768)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!294663 () (_ BitVec 64))

(declare-fun lt!294664 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38268 0))(
  ( (array!38269 (arr!18356 (Array (_ BitVec 32) (_ BitVec 64))) (size!18721 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38268)

(assert (=> b!637514 (= res!412556 (or (not (= (select (arr!18356 a!2986) j!136) lt!294663)) (not (= (select (arr!18356 a!2986) j!136) lt!294664)) (bvsge j!136 index!984)))))

(declare-fun e!364772 () Bool)

(assert (=> b!637514 e!364772))

(declare-fun res!412555 () Bool)

(assert (=> b!637514 (=> (not res!412555) (not e!364772))))

(assert (=> b!637514 (= res!412555 (= lt!294664 (select (arr!18356 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!637514 (= lt!294664 (select (store (arr!18356 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637515 () Bool)

(declare-fun e!364776 () Bool)

(declare-fun e!364767 () Bool)

(assert (=> b!637515 (= e!364776 e!364767)))

(declare-fun res!412562 () Bool)

(assert (=> b!637515 (=> (not res!412562) (not e!364767))))

(declare-datatypes ((SeekEntryResult!6793 0))(
  ( (MissingZero!6793 (index!29486 (_ BitVec 32))) (Found!6793 (index!29487 (_ BitVec 32))) (Intermediate!6793 (undefined!7605 Bool) (index!29488 (_ BitVec 32)) (x!58254 (_ BitVec 32))) (Undefined!6793) (MissingVacant!6793 (index!29489 (_ BitVec 32))) )
))
(declare-fun lt!294667 () SeekEntryResult!6793)

(assert (=> b!637515 (= res!412562 (or (= lt!294667 (MissingZero!6793 i!1108)) (= lt!294667 (MissingVacant!6793 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38268 (_ BitVec 32)) SeekEntryResult!6793)

(assert (=> b!637515 (= lt!294667 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637516 () Bool)

(declare-fun res!412552 () Bool)

(assert (=> b!637516 (=> (not res!412552) (not e!364767))))

(declare-datatypes ((List!12436 0))(
  ( (Nil!12433) (Cons!12432 (h!13477 (_ BitVec 64)) (t!18655 List!12436)) )
))
(declare-fun arrayNoDuplicates!0 (array!38268 (_ BitVec 32) List!12436) Bool)

(assert (=> b!637516 (= res!412552 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12433))))

(declare-fun b!637518 () Bool)

(declare-fun res!412550 () Bool)

(declare-fun e!364777 () Bool)

(assert (=> b!637518 (=> res!412550 e!364777)))

(declare-fun contains!3096 (List!12436 (_ BitVec 64)) Bool)

(assert (=> b!637518 (= res!412550 (contains!3096 Nil!12433 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637519 () Bool)

(declare-fun e!364771 () Bool)

(declare-fun lt!294666 () SeekEntryResult!6793)

(declare-fun lt!294671 () SeekEntryResult!6793)

(assert (=> b!637519 (= e!364771 (= lt!294666 lt!294671))))

(declare-fun b!637520 () Bool)

(declare-fun res!412564 () Bool)

(assert (=> b!637520 (=> (not res!412564) (not e!364776))))

(assert (=> b!637520 (= res!412564 (and (= (size!18721 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18721 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18721 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637521 () Bool)

(declare-fun res!412560 () Bool)

(assert (=> b!637521 (=> res!412560 e!364777)))

(assert (=> b!637521 (= res!412560 (contains!3096 Nil!12433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637522 () Bool)

(declare-fun res!412566 () Bool)

(assert (=> b!637522 (=> (not res!412566) (not e!364776))))

(declare-fun arrayContainsKey!0 (array!38268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637522 (= res!412566 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637523 () Bool)

(declare-fun res!412551 () Bool)

(assert (=> b!637523 (=> (not res!412551) (not e!364767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38268 (_ BitVec 32)) Bool)

(assert (=> b!637523 (= res!412551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637524 () Bool)

(declare-datatypes ((Unit!21500 0))(
  ( (Unit!21501) )
))
(declare-fun e!364773 () Unit!21500)

(declare-fun Unit!21502 () Unit!21500)

(assert (=> b!637524 (= e!364773 Unit!21502)))

(assert (=> b!637524 false))

(declare-fun b!637525 () Bool)

(declare-fun res!412559 () Bool)

(assert (=> b!637525 (=> (not res!412559) (not e!364767))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!637525 (= res!412559 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18356 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637526 () Bool)

(assert (=> b!637526 (= e!364768 e!364777)))

(declare-fun res!412569 () Bool)

(assert (=> b!637526 (=> res!412569 e!364777)))

(assert (=> b!637526 (= res!412569 (or (bvsge (size!18721 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18721 a!2986))))))

(declare-fun lt!294669 () array!38268)

(assert (=> b!637526 (arrayContainsKey!0 lt!294669 (select (arr!18356 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294670 () Unit!21500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38268 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21500)

(assert (=> b!637526 (= lt!294670 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294669 (select (arr!18356 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637527 () Bool)

(declare-fun e!364770 () Bool)

(assert (=> b!637527 (= e!364767 e!364770)))

(declare-fun res!412565 () Bool)

(assert (=> b!637527 (=> (not res!412565) (not e!364770))))

(assert (=> b!637527 (= res!412565 (= (select (store (arr!18356 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637527 (= lt!294669 (array!38269 (store (arr!18356 a!2986) i!1108 k0!1786) (size!18721 a!2986)))))

(declare-fun b!637528 () Bool)

(declare-fun Unit!21503 () Unit!21500)

(assert (=> b!637528 (= e!364773 Unit!21503)))

(declare-fun res!412563 () Bool)

(assert (=> start!57686 (=> (not res!412563) (not e!364776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57686 (= res!412563 (validMask!0 mask!3053))))

(assert (=> start!57686 e!364776))

(assert (=> start!57686 true))

(declare-fun array_inv!14239 (array!38268) Bool)

(assert (=> start!57686 (array_inv!14239 a!2986)))

(declare-fun b!637517 () Bool)

(declare-fun e!364775 () Bool)

(assert (=> b!637517 (= e!364772 e!364775)))

(declare-fun res!412557 () Bool)

(assert (=> b!637517 (=> res!412557 e!364775)))

(assert (=> b!637517 (= res!412557 (or (not (= (select (arr!18356 a!2986) j!136) lt!294663)) (not (= (select (arr!18356 a!2986) j!136) lt!294664)) (bvsge j!136 index!984)))))

(declare-fun b!637529 () Bool)

(declare-fun e!364778 () Bool)

(assert (=> b!637529 (= e!364775 e!364778)))

(declare-fun res!412558 () Bool)

(assert (=> b!637529 (=> (not res!412558) (not e!364778))))

(assert (=> b!637529 (= res!412558 (arrayContainsKey!0 lt!294669 (select (arr!18356 a!2986) j!136) j!136))))

(declare-fun b!637530 () Bool)

(assert (=> b!637530 (= e!364777 true)))

(declare-fun lt!294665 () Bool)

(assert (=> b!637530 (= lt!294665 (contains!3096 Nil!12433 k0!1786))))

(declare-fun b!637531 () Bool)

(declare-fun res!412567 () Bool)

(assert (=> b!637531 (=> res!412567 e!364777)))

(declare-fun noDuplicate!395 (List!12436) Bool)

(assert (=> b!637531 (= res!412567 (not (noDuplicate!395 Nil!12433)))))

(declare-fun b!637532 () Bool)

(declare-fun res!412570 () Bool)

(assert (=> b!637532 (=> (not res!412570) (not e!364776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637532 (= res!412570 (validKeyInArray!0 k0!1786))))

(declare-fun b!637533 () Bool)

(declare-fun e!364774 () Bool)

(assert (=> b!637533 (= e!364774 (not e!364769))))

(declare-fun res!412553 () Bool)

(assert (=> b!637533 (=> res!412553 e!364769)))

(declare-fun lt!294661 () SeekEntryResult!6793)

(assert (=> b!637533 (= res!412553 (not (= lt!294661 (Found!6793 index!984))))))

(declare-fun lt!294668 () Unit!21500)

(assert (=> b!637533 (= lt!294668 e!364773)))

(declare-fun c!72849 () Bool)

(assert (=> b!637533 (= c!72849 (= lt!294661 Undefined!6793))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38268 (_ BitVec 32)) SeekEntryResult!6793)

(assert (=> b!637533 (= lt!294661 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294663 lt!294669 mask!3053))))

(assert (=> b!637533 e!364771))

(declare-fun res!412561 () Bool)

(assert (=> b!637533 (=> (not res!412561) (not e!364771))))

(declare-fun lt!294672 () (_ BitVec 32))

(assert (=> b!637533 (= res!412561 (= lt!294671 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294672 vacantSpotIndex!68 lt!294663 lt!294669 mask!3053)))))

(assert (=> b!637533 (= lt!294671 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294672 vacantSpotIndex!68 (select (arr!18356 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637533 (= lt!294663 (select (store (arr!18356 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294662 () Unit!21500)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38268 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21500)

(assert (=> b!637533 (= lt!294662 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294672 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637533 (= lt!294672 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637534 () Bool)

(assert (=> b!637534 (= e!364770 e!364774)))

(declare-fun res!412554 () Bool)

(assert (=> b!637534 (=> (not res!412554) (not e!364774))))

(assert (=> b!637534 (= res!412554 (and (= lt!294666 (Found!6793 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18356 a!2986) index!984) (select (arr!18356 a!2986) j!136))) (not (= (select (arr!18356 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!637534 (= lt!294666 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18356 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637535 () Bool)

(declare-fun res!412568 () Bool)

(assert (=> b!637535 (=> (not res!412568) (not e!364776))))

(assert (=> b!637535 (= res!412568 (validKeyInArray!0 (select (arr!18356 a!2986) j!136)))))

(declare-fun b!637536 () Bool)

(assert (=> b!637536 (= e!364778 (arrayContainsKey!0 lt!294669 (select (arr!18356 a!2986) j!136) index!984))))

(assert (= (and start!57686 res!412563) b!637520))

(assert (= (and b!637520 res!412564) b!637535))

(assert (= (and b!637535 res!412568) b!637532))

(assert (= (and b!637532 res!412570) b!637522))

(assert (= (and b!637522 res!412566) b!637515))

(assert (= (and b!637515 res!412562) b!637523))

(assert (= (and b!637523 res!412551) b!637516))

(assert (= (and b!637516 res!412552) b!637525))

(assert (= (and b!637525 res!412559) b!637527))

(assert (= (and b!637527 res!412565) b!637534))

(assert (= (and b!637534 res!412554) b!637533))

(assert (= (and b!637533 res!412561) b!637519))

(assert (= (and b!637533 c!72849) b!637524))

(assert (= (and b!637533 (not c!72849)) b!637528))

(assert (= (and b!637533 (not res!412553)) b!637514))

(assert (= (and b!637514 res!412555) b!637517))

(assert (= (and b!637517 (not res!412557)) b!637529))

(assert (= (and b!637529 res!412558) b!637536))

(assert (= (and b!637514 (not res!412556)) b!637526))

(assert (= (and b!637526 (not res!412569)) b!637531))

(assert (= (and b!637531 (not res!412567)) b!637521))

(assert (= (and b!637521 (not res!412560)) b!637518))

(assert (= (and b!637518 (not res!412550)) b!637530))

(declare-fun m!611049 () Bool)

(assert (=> b!637526 m!611049))

(assert (=> b!637526 m!611049))

(declare-fun m!611051 () Bool)

(assert (=> b!637526 m!611051))

(assert (=> b!637526 m!611049))

(declare-fun m!611053 () Bool)

(assert (=> b!637526 m!611053))

(assert (=> b!637517 m!611049))

(assert (=> b!637514 m!611049))

(declare-fun m!611055 () Bool)

(assert (=> b!637514 m!611055))

(declare-fun m!611057 () Bool)

(assert (=> b!637514 m!611057))

(declare-fun m!611059 () Bool)

(assert (=> b!637515 m!611059))

(declare-fun m!611061 () Bool)

(assert (=> b!637534 m!611061))

(assert (=> b!637534 m!611049))

(assert (=> b!637534 m!611049))

(declare-fun m!611063 () Bool)

(assert (=> b!637534 m!611063))

(declare-fun m!611065 () Bool)

(assert (=> b!637530 m!611065))

(declare-fun m!611067 () Bool)

(assert (=> b!637532 m!611067))

(declare-fun m!611069 () Bool)

(assert (=> b!637523 m!611069))

(assert (=> b!637529 m!611049))

(assert (=> b!637529 m!611049))

(declare-fun m!611071 () Bool)

(assert (=> b!637529 m!611071))

(declare-fun m!611073 () Bool)

(assert (=> b!637516 m!611073))

(declare-fun m!611075 () Bool)

(assert (=> b!637518 m!611075))

(declare-fun m!611077 () Bool)

(assert (=> b!637521 m!611077))

(declare-fun m!611079 () Bool)

(assert (=> start!57686 m!611079))

(declare-fun m!611081 () Bool)

(assert (=> start!57686 m!611081))

(assert (=> b!637536 m!611049))

(assert (=> b!637536 m!611049))

(declare-fun m!611083 () Bool)

(assert (=> b!637536 m!611083))

(declare-fun m!611085 () Bool)

(assert (=> b!637525 m!611085))

(declare-fun m!611087 () Bool)

(assert (=> b!637533 m!611087))

(declare-fun m!611089 () Bool)

(assert (=> b!637533 m!611089))

(assert (=> b!637533 m!611049))

(assert (=> b!637533 m!611055))

(declare-fun m!611091 () Bool)

(assert (=> b!637533 m!611091))

(declare-fun m!611093 () Bool)

(assert (=> b!637533 m!611093))

(assert (=> b!637533 m!611049))

(declare-fun m!611095 () Bool)

(assert (=> b!637533 m!611095))

(declare-fun m!611097 () Bool)

(assert (=> b!637533 m!611097))

(assert (=> b!637535 m!611049))

(assert (=> b!637535 m!611049))

(declare-fun m!611099 () Bool)

(assert (=> b!637535 m!611099))

(assert (=> b!637527 m!611055))

(declare-fun m!611101 () Bool)

(assert (=> b!637527 m!611101))

(declare-fun m!611103 () Bool)

(assert (=> b!637531 m!611103))

(declare-fun m!611105 () Bool)

(assert (=> b!637522 m!611105))

(check-sat (not b!637521) (not b!637536) (not start!57686) (not b!637535) (not b!637518) (not b!637515) (not b!637522) (not b!637523) (not b!637533) (not b!637534) (not b!637529) (not b!637531) (not b!637532) (not b!637526) (not b!637530) (not b!637516))
(check-sat)
