; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57692 () Bool)

(assert start!57692)

(declare-fun b!637603 () Bool)

(declare-fun e!364849 () Bool)

(declare-fun e!364846 () Bool)

(assert (=> b!637603 (= e!364849 e!364846)))

(declare-fun res!412507 () Bool)

(assert (=> b!637603 (=> (not res!412507) (not e!364846))))

(declare-datatypes ((SeekEntryResult!6794 0))(
  ( (MissingZero!6794 (index!29490 (_ BitVec 32))) (Found!6794 (index!29491 (_ BitVec 32))) (Intermediate!6794 (undefined!7606 Bool) (index!29492 (_ BitVec 32)) (x!58252 (_ BitVec 32))) (Undefined!6794) (MissingVacant!6794 (index!29493 (_ BitVec 32))) )
))
(declare-fun lt!294818 () SeekEntryResult!6794)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637603 (= res!412507 (or (= lt!294818 (MissingZero!6794 i!1108)) (= lt!294818 (MissingVacant!6794 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38263 0))(
  ( (array!38264 (arr!18354 (Array (_ BitVec 32) (_ BitVec 64))) (size!18718 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38263)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38263 (_ BitVec 32)) SeekEntryResult!6794)

(assert (=> b!637603 (= lt!294818 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!637604 () Bool)

(declare-fun res!412513 () Bool)

(assert (=> b!637604 (=> (not res!412513) (not e!364846))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!637604 (= res!412513 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18354 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637605 () Bool)

(declare-fun e!364843 () Bool)

(declare-fun e!364842 () Bool)

(assert (=> b!637605 (= e!364843 (not e!364842))))

(declare-fun res!412498 () Bool)

(assert (=> b!637605 (=> res!412498 e!364842)))

(declare-fun lt!294815 () SeekEntryResult!6794)

(assert (=> b!637605 (= res!412498 (not (= lt!294815 (Found!6794 index!984))))))

(declare-datatypes ((Unit!21510 0))(
  ( (Unit!21511) )
))
(declare-fun lt!294820 () Unit!21510)

(declare-fun e!364841 () Unit!21510)

(assert (=> b!637605 (= lt!294820 e!364841)))

(declare-fun c!72920 () Bool)

(assert (=> b!637605 (= c!72920 (= lt!294815 Undefined!6794))))

(declare-fun lt!294810 () array!38263)

(declare-fun lt!294811 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38263 (_ BitVec 32)) SeekEntryResult!6794)

(assert (=> b!637605 (= lt!294815 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294811 lt!294810 mask!3053))))

(declare-fun e!364847 () Bool)

(assert (=> b!637605 e!364847))

(declare-fun res!412500 () Bool)

(assert (=> b!637605 (=> (not res!412500) (not e!364847))))

(declare-fun lt!294813 () (_ BitVec 32))

(declare-fun lt!294812 () SeekEntryResult!6794)

(assert (=> b!637605 (= res!412500 (= lt!294812 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294813 vacantSpotIndex!68 lt!294811 lt!294810 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!637605 (= lt!294812 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294813 vacantSpotIndex!68 (select (arr!18354 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637605 (= lt!294811 (select (store (arr!18354 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294814 () Unit!21510)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38263 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21510)

(assert (=> b!637605 (= lt!294814 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294813 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637605 (= lt!294813 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637606 () Bool)

(declare-fun res!412501 () Bool)

(assert (=> b!637606 (=> (not res!412501) (not e!364846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38263 (_ BitVec 32)) Bool)

(assert (=> b!637606 (= res!412501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637608 () Bool)

(declare-fun res!412505 () Bool)

(assert (=> b!637608 (=> (not res!412505) (not e!364849))))

(declare-fun arrayContainsKey!0 (array!38263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637608 (= res!412505 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637609 () Bool)

(declare-fun e!364851 () Bool)

(assert (=> b!637609 (= e!364851 e!364843)))

(declare-fun res!412499 () Bool)

(assert (=> b!637609 (=> (not res!412499) (not e!364843))))

(declare-fun lt!294809 () SeekEntryResult!6794)

(assert (=> b!637609 (= res!412499 (and (= lt!294809 (Found!6794 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18354 a!2986) index!984) (select (arr!18354 a!2986) j!136))) (not (= (select (arr!18354 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!637609 (= lt!294809 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18354 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637610 () Bool)

(declare-fun res!412512 () Bool)

(declare-fun e!364844 () Bool)

(assert (=> b!637610 (=> res!412512 e!364844)))

(declare-datatypes ((List!12395 0))(
  ( (Nil!12392) (Cons!12391 (h!13436 (_ BitVec 64)) (t!18623 List!12395)) )
))
(declare-fun noDuplicate!387 (List!12395) Bool)

(assert (=> b!637610 (= res!412512 (not (noDuplicate!387 Nil!12392)))))

(declare-fun b!637611 () Bool)

(declare-fun res!412514 () Bool)

(assert (=> b!637611 (=> res!412514 e!364844)))

(declare-fun contains!3109 (List!12395 (_ BitVec 64)) Bool)

(assert (=> b!637611 (= res!412514 (contains!3109 Nil!12392 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637612 () Bool)

(declare-fun Unit!21512 () Unit!21510)

(assert (=> b!637612 (= e!364841 Unit!21512)))

(declare-fun b!637613 () Bool)

(declare-fun res!412497 () Bool)

(assert (=> b!637613 (=> (not res!412497) (not e!364849))))

(assert (=> b!637613 (= res!412497 (and (= (size!18718 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18718 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18718 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637614 () Bool)

(declare-fun e!364840 () Bool)

(declare-fun e!364850 () Bool)

(assert (=> b!637614 (= e!364840 e!364850)))

(declare-fun res!412517 () Bool)

(assert (=> b!637614 (=> (not res!412517) (not e!364850))))

(assert (=> b!637614 (= res!412517 (arrayContainsKey!0 lt!294810 (select (arr!18354 a!2986) j!136) j!136))))

(declare-fun b!637615 () Bool)

(assert (=> b!637615 (= e!364847 (= lt!294809 lt!294812))))

(declare-fun b!637616 () Bool)

(declare-fun e!364845 () Bool)

(assert (=> b!637616 (= e!364845 e!364840)))

(declare-fun res!412509 () Bool)

(assert (=> b!637616 (=> res!412509 e!364840)))

(declare-fun lt!294817 () (_ BitVec 64))

(assert (=> b!637616 (= res!412509 (or (not (= (select (arr!18354 a!2986) j!136) lt!294811)) (not (= (select (arr!18354 a!2986) j!136) lt!294817)) (bvsge j!136 index!984)))))

(declare-fun b!637617 () Bool)

(declare-fun e!364839 () Bool)

(assert (=> b!637617 (= e!364842 e!364839)))

(declare-fun res!412510 () Bool)

(assert (=> b!637617 (=> res!412510 e!364839)))

(assert (=> b!637617 (= res!412510 (or (not (= (select (arr!18354 a!2986) j!136) lt!294811)) (not (= (select (arr!18354 a!2986) j!136) lt!294817)) (bvsge j!136 index!984)))))

(assert (=> b!637617 e!364845))

(declare-fun res!412508 () Bool)

(assert (=> b!637617 (=> (not res!412508) (not e!364845))))

(assert (=> b!637617 (= res!412508 (= lt!294817 (select (arr!18354 a!2986) j!136)))))

(assert (=> b!637617 (= lt!294817 (select (store (arr!18354 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!637607 () Bool)

(declare-fun res!412504 () Bool)

(assert (=> b!637607 (=> (not res!412504) (not e!364849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637607 (= res!412504 (validKeyInArray!0 k!1786))))

(declare-fun res!412515 () Bool)

(assert (=> start!57692 (=> (not res!412515) (not e!364849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57692 (= res!412515 (validMask!0 mask!3053))))

(assert (=> start!57692 e!364849))

(assert (=> start!57692 true))

(declare-fun array_inv!14150 (array!38263) Bool)

(assert (=> start!57692 (array_inv!14150 a!2986)))

(declare-fun b!637618 () Bool)

(assert (=> b!637618 (= e!364844 true)))

(declare-fun lt!294819 () Bool)

(assert (=> b!637618 (= lt!294819 (contains!3109 Nil!12392 k!1786))))

(declare-fun b!637619 () Bool)

(assert (=> b!637619 (= e!364846 e!364851)))

(declare-fun res!412503 () Bool)

(assert (=> b!637619 (=> (not res!412503) (not e!364851))))

(assert (=> b!637619 (= res!412503 (= (select (store (arr!18354 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637619 (= lt!294810 (array!38264 (store (arr!18354 a!2986) i!1108 k!1786) (size!18718 a!2986)))))

(declare-fun b!637620 () Bool)

(declare-fun res!412516 () Bool)

(assert (=> b!637620 (=> (not res!412516) (not e!364849))))

(assert (=> b!637620 (= res!412516 (validKeyInArray!0 (select (arr!18354 a!2986) j!136)))))

(declare-fun b!637621 () Bool)

(declare-fun Unit!21513 () Unit!21510)

(assert (=> b!637621 (= e!364841 Unit!21513)))

(assert (=> b!637621 false))

(declare-fun b!637622 () Bool)

(declare-fun res!412502 () Bool)

(assert (=> b!637622 (=> res!412502 e!364844)))

(assert (=> b!637622 (= res!412502 (contains!3109 Nil!12392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637623 () Bool)

(assert (=> b!637623 (= e!364839 e!364844)))

(declare-fun res!412511 () Bool)

(assert (=> b!637623 (=> res!412511 e!364844)))

(assert (=> b!637623 (= res!412511 (or (bvsge (size!18718 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18718 a!2986))))))

(assert (=> b!637623 (arrayContainsKey!0 lt!294810 (select (arr!18354 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294816 () Unit!21510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38263 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21510)

(assert (=> b!637623 (= lt!294816 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294810 (select (arr!18354 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637624 () Bool)

(assert (=> b!637624 (= e!364850 (arrayContainsKey!0 lt!294810 (select (arr!18354 a!2986) j!136) index!984))))

(declare-fun b!637625 () Bool)

(declare-fun res!412506 () Bool)

(assert (=> b!637625 (=> (not res!412506) (not e!364846))))

(declare-fun arrayNoDuplicates!0 (array!38263 (_ BitVec 32) List!12395) Bool)

(assert (=> b!637625 (= res!412506 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12392))))

(assert (= (and start!57692 res!412515) b!637613))

(assert (= (and b!637613 res!412497) b!637620))

(assert (= (and b!637620 res!412516) b!637607))

(assert (= (and b!637607 res!412504) b!637608))

(assert (= (and b!637608 res!412505) b!637603))

(assert (= (and b!637603 res!412507) b!637606))

(assert (= (and b!637606 res!412501) b!637625))

(assert (= (and b!637625 res!412506) b!637604))

(assert (= (and b!637604 res!412513) b!637619))

(assert (= (and b!637619 res!412503) b!637609))

(assert (= (and b!637609 res!412499) b!637605))

(assert (= (and b!637605 res!412500) b!637615))

(assert (= (and b!637605 c!72920) b!637621))

(assert (= (and b!637605 (not c!72920)) b!637612))

(assert (= (and b!637605 (not res!412498)) b!637617))

(assert (= (and b!637617 res!412508) b!637616))

(assert (= (and b!637616 (not res!412509)) b!637614))

(assert (= (and b!637614 res!412517) b!637624))

(assert (= (and b!637617 (not res!412510)) b!637623))

(assert (= (and b!637623 (not res!412511)) b!637610))

(assert (= (and b!637610 (not res!412512)) b!637622))

(assert (= (and b!637622 (not res!412502)) b!637611))

(assert (= (and b!637611 (not res!412514)) b!637618))

(declare-fun m!611657 () Bool)

(assert (=> b!637604 m!611657))

(declare-fun m!611659 () Bool)

(assert (=> b!637617 m!611659))

(declare-fun m!611661 () Bool)

(assert (=> b!637617 m!611661))

(declare-fun m!611663 () Bool)

(assert (=> b!637617 m!611663))

(assert (=> b!637620 m!611659))

(assert (=> b!637620 m!611659))

(declare-fun m!611665 () Bool)

(assert (=> b!637620 m!611665))

(declare-fun m!611667 () Bool)

(assert (=> b!637622 m!611667))

(declare-fun m!611669 () Bool)

(assert (=> b!637618 m!611669))

(declare-fun m!611671 () Bool)

(assert (=> b!637608 m!611671))

(assert (=> b!637619 m!611661))

(declare-fun m!611673 () Bool)

(assert (=> b!637619 m!611673))

(declare-fun m!611675 () Bool)

(assert (=> b!637603 m!611675))

(assert (=> b!637614 m!611659))

(assert (=> b!637614 m!611659))

(declare-fun m!611677 () Bool)

(assert (=> b!637614 m!611677))

(assert (=> b!637616 m!611659))

(declare-fun m!611679 () Bool)

(assert (=> start!57692 m!611679))

(declare-fun m!611681 () Bool)

(assert (=> start!57692 m!611681))

(declare-fun m!611683 () Bool)

(assert (=> b!637605 m!611683))

(declare-fun m!611685 () Bool)

(assert (=> b!637605 m!611685))

(assert (=> b!637605 m!611659))

(assert (=> b!637605 m!611661))

(declare-fun m!611687 () Bool)

(assert (=> b!637605 m!611687))

(declare-fun m!611689 () Bool)

(assert (=> b!637605 m!611689))

(assert (=> b!637605 m!611659))

(declare-fun m!611691 () Bool)

(assert (=> b!637605 m!611691))

(declare-fun m!611693 () Bool)

(assert (=> b!637605 m!611693))

(declare-fun m!611695 () Bool)

(assert (=> b!637609 m!611695))

(assert (=> b!637609 m!611659))

(assert (=> b!637609 m!611659))

(declare-fun m!611697 () Bool)

(assert (=> b!637609 m!611697))

(declare-fun m!611699 () Bool)

(assert (=> b!637606 m!611699))

(declare-fun m!611701 () Bool)

(assert (=> b!637625 m!611701))

(assert (=> b!637624 m!611659))

(assert (=> b!637624 m!611659))

(declare-fun m!611703 () Bool)

(assert (=> b!637624 m!611703))

(declare-fun m!611705 () Bool)

(assert (=> b!637610 m!611705))

(assert (=> b!637623 m!611659))

(assert (=> b!637623 m!611659))

(declare-fun m!611707 () Bool)

(assert (=> b!637623 m!611707))

(assert (=> b!637623 m!611659))

(declare-fun m!611709 () Bool)

(assert (=> b!637623 m!611709))

(declare-fun m!611711 () Bool)

(assert (=> b!637611 m!611711))

(declare-fun m!611713 () Bool)

(assert (=> b!637607 m!611713))

(push 1)

