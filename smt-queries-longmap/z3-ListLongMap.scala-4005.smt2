; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54486 () Bool)

(assert start!54486)

(declare-fun b!594417 () Bool)

(declare-fun res!380502 () Bool)

(declare-fun e!339605 () Bool)

(assert (=> b!594417 (=> (not res!380502) (not e!339605))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36960 0))(
  ( (array!36961 (arr!17744 (Array (_ BitVec 32) (_ BitVec 64))) (size!18109 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36960)

(assert (=> b!594417 (= res!380502 (and (= (size!18109 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18109 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18109 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594418 () Bool)

(declare-datatypes ((Unit!18636 0))(
  ( (Unit!18637) )
))
(declare-fun e!339614 () Unit!18636)

(declare-fun Unit!18638 () Unit!18636)

(assert (=> b!594418 (= e!339614 Unit!18638)))

(declare-fun b!594419 () Bool)

(declare-fun e!339608 () Bool)

(declare-fun e!339615 () Bool)

(assert (=> b!594419 (= e!339608 e!339615)))

(declare-fun res!380517 () Bool)

(assert (=> b!594419 (=> (not res!380517) (not e!339615))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6181 0))(
  ( (MissingZero!6181 (index!26972 (_ BitVec 32))) (Found!6181 (index!26973 (_ BitVec 32))) (Intermediate!6181 (undefined!6993 Bool) (index!26974 (_ BitVec 32)) (x!55788 (_ BitVec 32))) (Undefined!6181) (MissingVacant!6181 (index!26975 (_ BitVec 32))) )
))
(declare-fun lt!269751 () SeekEntryResult!6181)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594419 (= res!380517 (and (= lt!269751 (Found!6181 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17744 a!2986) index!984) (select (arr!17744 a!2986) j!136))) (not (= (select (arr!17744 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36960 (_ BitVec 32)) SeekEntryResult!6181)

(assert (=> b!594419 (= lt!269751 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17744 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594420 () Bool)

(declare-fun e!339606 () Bool)

(assert (=> b!594420 (= e!339615 (not e!339606))))

(declare-fun res!380519 () Bool)

(assert (=> b!594420 (=> res!380519 e!339606)))

(declare-fun lt!269755 () SeekEntryResult!6181)

(assert (=> b!594420 (= res!380519 (not (= lt!269755 (Found!6181 index!984))))))

(declare-fun lt!269750 () Unit!18636)

(assert (=> b!594420 (= lt!269750 e!339614)))

(declare-fun c!67326 () Bool)

(assert (=> b!594420 (= c!67326 (= lt!269755 Undefined!6181))))

(declare-fun lt!269754 () (_ BitVec 64))

(declare-fun lt!269752 () array!36960)

(assert (=> b!594420 (= lt!269755 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269754 lt!269752 mask!3053))))

(declare-fun e!339603 () Bool)

(assert (=> b!594420 e!339603))

(declare-fun res!380507 () Bool)

(assert (=> b!594420 (=> (not res!380507) (not e!339603))))

(declare-fun lt!269748 () (_ BitVec 32))

(declare-fun lt!269744 () SeekEntryResult!6181)

(assert (=> b!594420 (= res!380507 (= lt!269744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 lt!269754 lt!269752 mask!3053)))))

(assert (=> b!594420 (= lt!269744 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 (select (arr!17744 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!594420 (= lt!269754 (select (store (arr!17744 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269745 () Unit!18636)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36960 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18636)

(assert (=> b!594420 (= lt!269745 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269748 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594420 (= lt!269748 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594421 () Bool)

(declare-fun res!380513 () Bool)

(declare-fun e!339610 () Bool)

(assert (=> b!594421 (=> (not res!380513) (not e!339610))))

(assert (=> b!594421 (= res!380513 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17744 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594422 () Bool)

(declare-fun res!380501 () Bool)

(assert (=> b!594422 (=> (not res!380501) (not e!339610))))

(declare-datatypes ((List!11824 0))(
  ( (Nil!11821) (Cons!11820 (h!12865 (_ BitVec 64)) (t!18043 List!11824)) )
))
(declare-fun arrayNoDuplicates!0 (array!36960 (_ BitVec 32) List!11824) Bool)

(assert (=> b!594422 (= res!380501 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11821))))

(declare-fun b!594423 () Bool)

(declare-fun res!380503 () Bool)

(assert (=> b!594423 (=> (not res!380503) (not e!339610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36960 (_ BitVec 32)) Bool)

(assert (=> b!594423 (= res!380503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594424 () Bool)

(declare-fun res!380500 () Bool)

(assert (=> b!594424 (=> (not res!380500) (not e!339605))))

(declare-fun arrayContainsKey!0 (array!36960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594424 (= res!380500 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594425 () Bool)

(declare-fun e!339612 () Bool)

(assert (=> b!594425 (= e!339612 true)))

(declare-fun lt!269753 () Bool)

(declare-fun contains!2908 (List!11824 (_ BitVec 64)) Bool)

(assert (=> b!594425 (= lt!269753 (contains!2908 Nil!11821 k0!1786))))

(declare-fun b!594426 () Bool)

(declare-fun res!380499 () Bool)

(assert (=> b!594426 (=> (not res!380499) (not e!339605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594426 (= res!380499 (validKeyInArray!0 k0!1786))))

(declare-fun b!594427 () Bool)

(assert (=> b!594427 (= e!339605 e!339610)))

(declare-fun res!380510 () Bool)

(assert (=> b!594427 (=> (not res!380510) (not e!339610))))

(declare-fun lt!269746 () SeekEntryResult!6181)

(assert (=> b!594427 (= res!380510 (or (= lt!269746 (MissingZero!6181 i!1108)) (= lt!269746 (MissingVacant!6181 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36960 (_ BitVec 32)) SeekEntryResult!6181)

(assert (=> b!594427 (= lt!269746 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594429 () Bool)

(declare-fun e!339611 () Bool)

(assert (=> b!594429 (= e!339611 (arrayContainsKey!0 lt!269752 (select (arr!17744 a!2986) j!136) index!984))))

(declare-fun b!594430 () Bool)

(declare-fun res!380504 () Bool)

(assert (=> b!594430 (=> res!380504 e!339612)))

(declare-fun noDuplicate!245 (List!11824) Bool)

(assert (=> b!594430 (= res!380504 (not (noDuplicate!245 Nil!11821)))))

(declare-fun b!594431 () Bool)

(declare-fun Unit!18639 () Unit!18636)

(assert (=> b!594431 (= e!339614 Unit!18639)))

(assert (=> b!594431 false))

(declare-fun b!594432 () Bool)

(declare-fun e!339607 () Bool)

(assert (=> b!594432 (= e!339607 e!339611)))

(declare-fun res!380515 () Bool)

(assert (=> b!594432 (=> (not res!380515) (not e!339611))))

(assert (=> b!594432 (= res!380515 (arrayContainsKey!0 lt!269752 (select (arr!17744 a!2986) j!136) j!136))))

(declare-fun b!594433 () Bool)

(declare-fun e!339609 () Bool)

(assert (=> b!594433 (= e!339609 e!339607)))

(declare-fun res!380506 () Bool)

(assert (=> b!594433 (=> res!380506 e!339607)))

(declare-fun lt!269747 () (_ BitVec 64))

(assert (=> b!594433 (= res!380506 (or (not (= (select (arr!17744 a!2986) j!136) lt!269754)) (not (= (select (arr!17744 a!2986) j!136) lt!269747)) (bvsge j!136 index!984)))))

(declare-fun b!594434 () Bool)

(declare-fun res!380514 () Bool)

(assert (=> b!594434 (=> res!380514 e!339612)))

(assert (=> b!594434 (= res!380514 (contains!2908 Nil!11821 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594435 () Bool)

(assert (=> b!594435 (= e!339610 e!339608)))

(declare-fun res!380518 () Bool)

(assert (=> b!594435 (=> (not res!380518) (not e!339608))))

(assert (=> b!594435 (= res!380518 (= (select (store (arr!17744 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594435 (= lt!269752 (array!36961 (store (arr!17744 a!2986) i!1108 k0!1786) (size!18109 a!2986)))))

(declare-fun b!594436 () Bool)

(declare-fun res!380516 () Bool)

(assert (=> b!594436 (=> res!380516 e!339612)))

(assert (=> b!594436 (= res!380516 (contains!2908 Nil!11821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594437 () Bool)

(assert (=> b!594437 (= e!339603 (= lt!269751 lt!269744))))

(declare-fun b!594438 () Bool)

(declare-fun e!339613 () Bool)

(assert (=> b!594438 (= e!339613 e!339612)))

(declare-fun res!380511 () Bool)

(assert (=> b!594438 (=> res!380511 e!339612)))

(assert (=> b!594438 (= res!380511 (or (bvsge (size!18109 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18109 a!2986))))))

(assert (=> b!594438 (arrayContainsKey!0 lt!269752 (select (arr!17744 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269749 () Unit!18636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36960 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18636)

(assert (=> b!594438 (= lt!269749 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269752 (select (arr!17744 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594439 () Bool)

(declare-fun res!380505 () Bool)

(assert (=> b!594439 (=> (not res!380505) (not e!339605))))

(assert (=> b!594439 (= res!380505 (validKeyInArray!0 (select (arr!17744 a!2986) j!136)))))

(declare-fun b!594428 () Bool)

(assert (=> b!594428 (= e!339606 e!339613)))

(declare-fun res!380508 () Bool)

(assert (=> b!594428 (=> res!380508 e!339613)))

(assert (=> b!594428 (= res!380508 (or (not (= (select (arr!17744 a!2986) j!136) lt!269754)) (not (= (select (arr!17744 a!2986) j!136) lt!269747)) (bvsge j!136 index!984)))))

(assert (=> b!594428 e!339609))

(declare-fun res!380512 () Bool)

(assert (=> b!594428 (=> (not res!380512) (not e!339609))))

(assert (=> b!594428 (= res!380512 (= lt!269747 (select (arr!17744 a!2986) j!136)))))

(assert (=> b!594428 (= lt!269747 (select (store (arr!17744 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!380509 () Bool)

(assert (=> start!54486 (=> (not res!380509) (not e!339605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54486 (= res!380509 (validMask!0 mask!3053))))

(assert (=> start!54486 e!339605))

(assert (=> start!54486 true))

(declare-fun array_inv!13627 (array!36960) Bool)

(assert (=> start!54486 (array_inv!13627 a!2986)))

(assert (= (and start!54486 res!380509) b!594417))

(assert (= (and b!594417 res!380502) b!594439))

(assert (= (and b!594439 res!380505) b!594426))

(assert (= (and b!594426 res!380499) b!594424))

(assert (= (and b!594424 res!380500) b!594427))

(assert (= (and b!594427 res!380510) b!594423))

(assert (= (and b!594423 res!380503) b!594422))

(assert (= (and b!594422 res!380501) b!594421))

(assert (= (and b!594421 res!380513) b!594435))

(assert (= (and b!594435 res!380518) b!594419))

(assert (= (and b!594419 res!380517) b!594420))

(assert (= (and b!594420 res!380507) b!594437))

(assert (= (and b!594420 c!67326) b!594431))

(assert (= (and b!594420 (not c!67326)) b!594418))

(assert (= (and b!594420 (not res!380519)) b!594428))

(assert (= (and b!594428 res!380512) b!594433))

(assert (= (and b!594433 (not res!380506)) b!594432))

(assert (= (and b!594432 res!380515) b!594429))

(assert (= (and b!594428 (not res!380508)) b!594438))

(assert (= (and b!594438 (not res!380511)) b!594430))

(assert (= (and b!594430 (not res!380504)) b!594436))

(assert (= (and b!594436 (not res!380516)) b!594434))

(assert (= (and b!594434 (not res!380514)) b!594425))

(declare-fun m!571687 () Bool)

(assert (=> b!594430 m!571687))

(declare-fun m!571689 () Bool)

(assert (=> b!594429 m!571689))

(assert (=> b!594429 m!571689))

(declare-fun m!571691 () Bool)

(assert (=> b!594429 m!571691))

(assert (=> b!594438 m!571689))

(assert (=> b!594438 m!571689))

(declare-fun m!571693 () Bool)

(assert (=> b!594438 m!571693))

(assert (=> b!594438 m!571689))

(declare-fun m!571695 () Bool)

(assert (=> b!594438 m!571695))

(assert (=> b!594428 m!571689))

(declare-fun m!571697 () Bool)

(assert (=> b!594428 m!571697))

(declare-fun m!571699 () Bool)

(assert (=> b!594428 m!571699))

(declare-fun m!571701 () Bool)

(assert (=> b!594420 m!571701))

(declare-fun m!571703 () Bool)

(assert (=> b!594420 m!571703))

(assert (=> b!594420 m!571689))

(assert (=> b!594420 m!571697))

(declare-fun m!571705 () Bool)

(assert (=> b!594420 m!571705))

(declare-fun m!571707 () Bool)

(assert (=> b!594420 m!571707))

(assert (=> b!594420 m!571689))

(declare-fun m!571709 () Bool)

(assert (=> b!594420 m!571709))

(declare-fun m!571711 () Bool)

(assert (=> b!594420 m!571711))

(declare-fun m!571713 () Bool)

(assert (=> b!594425 m!571713))

(assert (=> b!594435 m!571697))

(declare-fun m!571715 () Bool)

(assert (=> b!594435 m!571715))

(declare-fun m!571717 () Bool)

(assert (=> b!594423 m!571717))

(declare-fun m!571719 () Bool)

(assert (=> b!594419 m!571719))

(assert (=> b!594419 m!571689))

(assert (=> b!594419 m!571689))

(declare-fun m!571721 () Bool)

(assert (=> b!594419 m!571721))

(declare-fun m!571723 () Bool)

(assert (=> b!594436 m!571723))

(declare-fun m!571725 () Bool)

(assert (=> b!594421 m!571725))

(declare-fun m!571727 () Bool)

(assert (=> b!594434 m!571727))

(assert (=> b!594433 m!571689))

(declare-fun m!571729 () Bool)

(assert (=> start!54486 m!571729))

(declare-fun m!571731 () Bool)

(assert (=> start!54486 m!571731))

(declare-fun m!571733 () Bool)

(assert (=> b!594424 m!571733))

(declare-fun m!571735 () Bool)

(assert (=> b!594422 m!571735))

(assert (=> b!594439 m!571689))

(assert (=> b!594439 m!571689))

(declare-fun m!571737 () Bool)

(assert (=> b!594439 m!571737))

(assert (=> b!594432 m!571689))

(assert (=> b!594432 m!571689))

(declare-fun m!571739 () Bool)

(assert (=> b!594432 m!571739))

(declare-fun m!571741 () Bool)

(assert (=> b!594427 m!571741))

(declare-fun m!571743 () Bool)

(assert (=> b!594426 m!571743))

(check-sat (not b!594427) (not b!594430) (not b!594422) (not b!594424) (not b!594438) (not b!594426) (not b!594436) (not b!594432) (not b!594439) (not b!594434) (not b!594420) (not b!594423) (not b!594425) (not b!594429) (not b!594419) (not start!54486))
(check-sat)
