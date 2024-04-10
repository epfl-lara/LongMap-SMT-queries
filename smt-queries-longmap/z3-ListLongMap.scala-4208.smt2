; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57694 () Bool)

(assert start!57694)

(declare-fun b!637672 () Bool)

(declare-fun e!364885 () Bool)

(assert (=> b!637672 (= e!364885 true)))

(declare-fun lt!294851 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12396 0))(
  ( (Nil!12393) (Cons!12392 (h!13437 (_ BitVec 64)) (t!18624 List!12396)) )
))
(declare-fun contains!3110 (List!12396 (_ BitVec 64)) Bool)

(assert (=> b!637672 (= lt!294851 (contains!3110 Nil!12393 k0!1786))))

(declare-fun b!637673 () Bool)

(declare-fun res!412575 () Bool)

(declare-fun e!364880 () Bool)

(assert (=> b!637673 (=> (not res!412575) (not e!364880))))

(declare-datatypes ((array!38265 0))(
  ( (array!38266 (arr!18355 (Array (_ BitVec 32) (_ BitVec 64))) (size!18719 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38265)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38265 (_ BitVec 32)) Bool)

(assert (=> b!637673 (= res!412575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637674 () Bool)

(declare-fun res!412567 () Bool)

(assert (=> b!637674 (=> res!412567 e!364885)))

(declare-fun noDuplicate!388 (List!12396) Bool)

(assert (=> b!637674 (= res!412567 (not (noDuplicate!388 Nil!12393)))))

(declare-fun b!637675 () Bool)

(declare-fun res!412561 () Bool)

(assert (=> b!637675 (=> (not res!412561) (not e!364880))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!637675 (= res!412561 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18355 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637676 () Bool)

(declare-fun e!364881 () Bool)

(declare-fun e!364886 () Bool)

(assert (=> b!637676 (= e!364881 e!364886)))

(declare-fun res!412570 () Bool)

(assert (=> b!637676 (=> (not res!412570) (not e!364886))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6795 0))(
  ( (MissingZero!6795 (index!29494 (_ BitVec 32))) (Found!6795 (index!29495 (_ BitVec 32))) (Intermediate!6795 (undefined!7607 Bool) (index!29496 (_ BitVec 32)) (x!58253 (_ BitVec 32))) (Undefined!6795) (MissingVacant!6795 (index!29497 (_ BitVec 32))) )
))
(declare-fun lt!294848 () SeekEntryResult!6795)

(assert (=> b!637676 (= res!412570 (and (= lt!294848 (Found!6795 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18355 a!2986) index!984) (select (arr!18355 a!2986) j!136))) (not (= (select (arr!18355 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38265 (_ BitVec 32)) SeekEntryResult!6795)

(assert (=> b!637676 (= lt!294848 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18355 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637677 () Bool)

(declare-fun res!412580 () Bool)

(assert (=> b!637677 (=> (not res!412580) (not e!364880))))

(declare-fun arrayNoDuplicates!0 (array!38265 (_ BitVec 32) List!12396) Bool)

(assert (=> b!637677 (= res!412580 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12393))))

(declare-fun res!412564 () Bool)

(declare-fun e!364889 () Bool)

(assert (=> start!57694 (=> (not res!412564) (not e!364889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57694 (= res!412564 (validMask!0 mask!3053))))

(assert (=> start!57694 e!364889))

(assert (=> start!57694 true))

(declare-fun array_inv!14151 (array!38265) Bool)

(assert (=> start!57694 (array_inv!14151 a!2986)))

(declare-fun e!364887 () Bool)

(declare-fun lt!294853 () array!38265)

(declare-fun b!637678 () Bool)

(declare-fun arrayContainsKey!0 (array!38265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637678 (= e!364887 (arrayContainsKey!0 lt!294853 (select (arr!18355 a!2986) j!136) index!984))))

(declare-fun b!637679 () Bool)

(declare-fun e!364879 () Bool)

(declare-fun e!364884 () Bool)

(assert (=> b!637679 (= e!364879 e!364884)))

(declare-fun res!412562 () Bool)

(assert (=> b!637679 (=> res!412562 e!364884)))

(declare-fun lt!294852 () (_ BitVec 64))

(declare-fun lt!294856 () (_ BitVec 64))

(assert (=> b!637679 (= res!412562 (or (not (= (select (arr!18355 a!2986) j!136) lt!294852)) (not (= (select (arr!18355 a!2986) j!136) lt!294856)) (bvsge j!136 index!984)))))

(declare-fun e!364878 () Bool)

(assert (=> b!637679 e!364878))

(declare-fun res!412560 () Bool)

(assert (=> b!637679 (=> (not res!412560) (not e!364878))))

(assert (=> b!637679 (= res!412560 (= lt!294856 (select (arr!18355 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637679 (= lt!294856 (select (store (arr!18355 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637680 () Bool)

(declare-fun res!412579 () Bool)

(assert (=> b!637680 (=> (not res!412579) (not e!364889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637680 (= res!412579 (validKeyInArray!0 k0!1786))))

(declare-fun b!637681 () Bool)

(declare-fun e!364888 () Bool)

(assert (=> b!637681 (= e!364888 e!364887)))

(declare-fun res!412577 () Bool)

(assert (=> b!637681 (=> (not res!412577) (not e!364887))))

(assert (=> b!637681 (= res!412577 (arrayContainsKey!0 lt!294853 (select (arr!18355 a!2986) j!136) j!136))))

(declare-fun b!637682 () Bool)

(declare-fun res!412568 () Bool)

(assert (=> b!637682 (=> (not res!412568) (not e!364889))))

(assert (=> b!637682 (= res!412568 (validKeyInArray!0 (select (arr!18355 a!2986) j!136)))))

(declare-fun b!637683 () Bool)

(declare-datatypes ((Unit!21514 0))(
  ( (Unit!21515) )
))
(declare-fun e!364890 () Unit!21514)

(declare-fun Unit!21516 () Unit!21514)

(assert (=> b!637683 (= e!364890 Unit!21516)))

(declare-fun b!637684 () Bool)

(assert (=> b!637684 (= e!364884 e!364885)))

(declare-fun res!412574 () Bool)

(assert (=> b!637684 (=> res!412574 e!364885)))

(assert (=> b!637684 (= res!412574 (or (bvsge (size!18719 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18719 a!2986))))))

(assert (=> b!637684 (arrayContainsKey!0 lt!294853 (select (arr!18355 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294845 () Unit!21514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38265 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21514)

(assert (=> b!637684 (= lt!294845 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294853 (select (arr!18355 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637685 () Bool)

(declare-fun res!412569 () Bool)

(assert (=> b!637685 (=> res!412569 e!364885)))

(assert (=> b!637685 (= res!412569 (contains!3110 Nil!12393 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637686 () Bool)

(declare-fun res!412573 () Bool)

(assert (=> b!637686 (=> (not res!412573) (not e!364889))))

(assert (=> b!637686 (= res!412573 (and (= (size!18719 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18719 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18719 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637687 () Bool)

(assert (=> b!637687 (= e!364889 e!364880)))

(declare-fun res!412565 () Bool)

(assert (=> b!637687 (=> (not res!412565) (not e!364880))))

(declare-fun lt!294847 () SeekEntryResult!6795)

(assert (=> b!637687 (= res!412565 (or (= lt!294847 (MissingZero!6795 i!1108)) (= lt!294847 (MissingVacant!6795 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38265 (_ BitVec 32)) SeekEntryResult!6795)

(assert (=> b!637687 (= lt!294847 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637688 () Bool)

(declare-fun res!412572 () Bool)

(assert (=> b!637688 (=> res!412572 e!364885)))

(assert (=> b!637688 (= res!412572 (contains!3110 Nil!12393 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637689 () Bool)

(declare-fun e!364882 () Bool)

(declare-fun lt!294849 () SeekEntryResult!6795)

(assert (=> b!637689 (= e!364882 (= lt!294848 lt!294849))))

(declare-fun b!637690 () Bool)

(declare-fun Unit!21517 () Unit!21514)

(assert (=> b!637690 (= e!364890 Unit!21517)))

(assert (=> b!637690 false))

(declare-fun b!637691 () Bool)

(assert (=> b!637691 (= e!364880 e!364881)))

(declare-fun res!412563 () Bool)

(assert (=> b!637691 (=> (not res!412563) (not e!364881))))

(assert (=> b!637691 (= res!412563 (= (select (store (arr!18355 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637691 (= lt!294853 (array!38266 (store (arr!18355 a!2986) i!1108 k0!1786) (size!18719 a!2986)))))

(declare-fun b!637692 () Bool)

(assert (=> b!637692 (= e!364878 e!364888)))

(declare-fun res!412576 () Bool)

(assert (=> b!637692 (=> res!412576 e!364888)))

(assert (=> b!637692 (= res!412576 (or (not (= (select (arr!18355 a!2986) j!136) lt!294852)) (not (= (select (arr!18355 a!2986) j!136) lt!294856)) (bvsge j!136 index!984)))))

(declare-fun b!637693 () Bool)

(assert (=> b!637693 (= e!364886 (not e!364879))))

(declare-fun res!412578 () Bool)

(assert (=> b!637693 (=> res!412578 e!364879)))

(declare-fun lt!294850 () SeekEntryResult!6795)

(assert (=> b!637693 (= res!412578 (not (= lt!294850 (Found!6795 index!984))))))

(declare-fun lt!294855 () Unit!21514)

(assert (=> b!637693 (= lt!294855 e!364890)))

(declare-fun c!72923 () Bool)

(assert (=> b!637693 (= c!72923 (= lt!294850 Undefined!6795))))

(assert (=> b!637693 (= lt!294850 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294852 lt!294853 mask!3053))))

(assert (=> b!637693 e!364882))

(declare-fun res!412566 () Bool)

(assert (=> b!637693 (=> (not res!412566) (not e!364882))))

(declare-fun lt!294854 () (_ BitVec 32))

(assert (=> b!637693 (= res!412566 (= lt!294849 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294854 vacantSpotIndex!68 lt!294852 lt!294853 mask!3053)))))

(assert (=> b!637693 (= lt!294849 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294854 vacantSpotIndex!68 (select (arr!18355 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637693 (= lt!294852 (select (store (arr!18355 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294846 () Unit!21514)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21514)

(assert (=> b!637693 (= lt!294846 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294854 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637693 (= lt!294854 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637694 () Bool)

(declare-fun res!412571 () Bool)

(assert (=> b!637694 (=> (not res!412571) (not e!364889))))

(assert (=> b!637694 (= res!412571 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!57694 res!412564) b!637686))

(assert (= (and b!637686 res!412573) b!637682))

(assert (= (and b!637682 res!412568) b!637680))

(assert (= (and b!637680 res!412579) b!637694))

(assert (= (and b!637694 res!412571) b!637687))

(assert (= (and b!637687 res!412565) b!637673))

(assert (= (and b!637673 res!412575) b!637677))

(assert (= (and b!637677 res!412580) b!637675))

(assert (= (and b!637675 res!412561) b!637691))

(assert (= (and b!637691 res!412563) b!637676))

(assert (= (and b!637676 res!412570) b!637693))

(assert (= (and b!637693 res!412566) b!637689))

(assert (= (and b!637693 c!72923) b!637690))

(assert (= (and b!637693 (not c!72923)) b!637683))

(assert (= (and b!637693 (not res!412578)) b!637679))

(assert (= (and b!637679 res!412560) b!637692))

(assert (= (and b!637692 (not res!412576)) b!637681))

(assert (= (and b!637681 res!412577) b!637678))

(assert (= (and b!637679 (not res!412562)) b!637684))

(assert (= (and b!637684 (not res!412574)) b!637674))

(assert (= (and b!637674 (not res!412567)) b!637685))

(assert (= (and b!637685 (not res!412569)) b!637688))

(assert (= (and b!637688 (not res!412572)) b!637672))

(declare-fun m!611715 () Bool)

(assert (=> b!637684 m!611715))

(assert (=> b!637684 m!611715))

(declare-fun m!611717 () Bool)

(assert (=> b!637684 m!611717))

(assert (=> b!637684 m!611715))

(declare-fun m!611719 () Bool)

(assert (=> b!637684 m!611719))

(declare-fun m!611721 () Bool)

(assert (=> b!637674 m!611721))

(declare-fun m!611723 () Bool)

(assert (=> b!637693 m!611723))

(declare-fun m!611725 () Bool)

(assert (=> b!637693 m!611725))

(declare-fun m!611727 () Bool)

(assert (=> b!637693 m!611727))

(assert (=> b!637693 m!611715))

(declare-fun m!611729 () Bool)

(assert (=> b!637693 m!611729))

(assert (=> b!637693 m!611715))

(declare-fun m!611731 () Bool)

(assert (=> b!637693 m!611731))

(declare-fun m!611733 () Bool)

(assert (=> b!637693 m!611733))

(declare-fun m!611735 () Bool)

(assert (=> b!637693 m!611735))

(declare-fun m!611737 () Bool)

(assert (=> b!637673 m!611737))

(assert (=> b!637682 m!611715))

(assert (=> b!637682 m!611715))

(declare-fun m!611739 () Bool)

(assert (=> b!637682 m!611739))

(assert (=> b!637679 m!611715))

(assert (=> b!637679 m!611733))

(declare-fun m!611741 () Bool)

(assert (=> b!637679 m!611741))

(declare-fun m!611743 () Bool)

(assert (=> b!637677 m!611743))

(declare-fun m!611745 () Bool)

(assert (=> b!637687 m!611745))

(declare-fun m!611747 () Bool)

(assert (=> b!637676 m!611747))

(assert (=> b!637676 m!611715))

(assert (=> b!637676 m!611715))

(declare-fun m!611749 () Bool)

(assert (=> b!637676 m!611749))

(declare-fun m!611751 () Bool)

(assert (=> b!637675 m!611751))

(assert (=> b!637691 m!611733))

(declare-fun m!611753 () Bool)

(assert (=> b!637691 m!611753))

(declare-fun m!611755 () Bool)

(assert (=> b!637680 m!611755))

(assert (=> b!637692 m!611715))

(declare-fun m!611757 () Bool)

(assert (=> start!57694 m!611757))

(declare-fun m!611759 () Bool)

(assert (=> start!57694 m!611759))

(declare-fun m!611761 () Bool)

(assert (=> b!637694 m!611761))

(declare-fun m!611763 () Bool)

(assert (=> b!637688 m!611763))

(declare-fun m!611765 () Bool)

(assert (=> b!637672 m!611765))

(declare-fun m!611767 () Bool)

(assert (=> b!637685 m!611767))

(assert (=> b!637678 m!611715))

(assert (=> b!637678 m!611715))

(declare-fun m!611769 () Bool)

(assert (=> b!637678 m!611769))

(assert (=> b!637681 m!611715))

(assert (=> b!637681 m!611715))

(declare-fun m!611771 () Bool)

(assert (=> b!637681 m!611771))

(check-sat (not b!637681) (not b!637678) (not b!637687) (not start!57694) (not b!637693) (not b!637685) (not b!637680) (not b!637694) (not b!637673) (not b!637684) (not b!637676) (not b!637682) (not b!637674) (not b!637688) (not b!637677) (not b!637672))
(check-sat)
