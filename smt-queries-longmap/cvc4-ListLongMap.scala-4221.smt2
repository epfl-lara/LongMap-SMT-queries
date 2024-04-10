; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57924 () Bool)

(assert start!57924)

(declare-fun b!640715 () Bool)

(declare-fun res!414953 () Bool)

(declare-fun e!366786 () Bool)

(assert (=> b!640715 (=> (not res!414953) (not e!366786))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640715 (= res!414953 (validKeyInArray!0 k!1786))))

(declare-fun b!640716 () Bool)

(declare-fun e!366791 () Bool)

(declare-datatypes ((SeekEntryResult!6835 0))(
  ( (MissingZero!6835 (index!29660 (_ BitVec 32))) (Found!6835 (index!29661 (_ BitVec 32))) (Intermediate!6835 (undefined!7647 Bool) (index!29662 (_ BitVec 32)) (x!58415 (_ BitVec 32))) (Undefined!6835) (MissingVacant!6835 (index!29663 (_ BitVec 32))) )
))
(declare-fun lt!296588 () SeekEntryResult!6835)

(declare-fun lt!296584 () SeekEntryResult!6835)

(assert (=> b!640716 (= e!366791 (= lt!296588 lt!296584))))

(declare-fun b!640717 () Bool)

(declare-fun e!366784 () Bool)

(declare-fun e!366783 () Bool)

(assert (=> b!640717 (= e!366784 e!366783)))

(declare-fun res!414952 () Bool)

(assert (=> b!640717 (=> (not res!414952) (not e!366783))))

(declare-datatypes ((array!38351 0))(
  ( (array!38352 (arr!18395 (Array (_ BitVec 32) (_ BitVec 64))) (size!18759 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38351)

(declare-fun lt!296581 () array!38351)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640717 (= res!414952 (arrayContainsKey!0 lt!296581 (select (arr!18395 a!2986) j!136) j!136))))

(declare-fun b!640718 () Bool)

(declare-fun res!414958 () Bool)

(assert (=> b!640718 (=> (not res!414958) (not e!366786))))

(assert (=> b!640718 (= res!414958 (validKeyInArray!0 (select (arr!18395 a!2986) j!136)))))

(declare-fun b!640719 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640719 (= e!366783 (arrayContainsKey!0 lt!296581 (select (arr!18395 a!2986) j!136) index!984))))

(declare-fun b!640720 () Bool)

(declare-fun e!366787 () Bool)

(declare-fun e!366782 () Bool)

(assert (=> b!640720 (= e!366787 e!366782)))

(declare-fun res!414960 () Bool)

(assert (=> b!640720 (=> (not res!414960) (not e!366782))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!640720 (= res!414960 (and (= lt!296588 (Found!6835 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18395 a!2986) index!984) (select (arr!18395 a!2986) j!136))) (not (= (select (arr!18395 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38351 (_ BitVec 32)) SeekEntryResult!6835)

(assert (=> b!640720 (= lt!296588 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18395 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640721 () Bool)

(declare-fun e!366785 () Bool)

(assert (=> b!640721 (= e!366785 e!366784)))

(declare-fun res!414963 () Bool)

(assert (=> b!640721 (=> res!414963 e!366784)))

(declare-fun lt!296592 () (_ BitVec 64))

(declare-fun lt!296591 () (_ BitVec 64))

(assert (=> b!640721 (= res!414963 (or (not (= (select (arr!18395 a!2986) j!136) lt!296591)) (not (= (select (arr!18395 a!2986) j!136) lt!296592)) (bvsge j!136 index!984)))))

(declare-fun b!640722 () Bool)

(declare-fun res!414951 () Bool)

(declare-fun e!366789 () Bool)

(assert (=> b!640722 (=> (not res!414951) (not e!366789))))

(assert (=> b!640722 (= res!414951 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18395 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640723 () Bool)

(declare-fun res!414950 () Bool)

(assert (=> b!640723 (=> (not res!414950) (not e!366789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38351 (_ BitVec 32)) Bool)

(assert (=> b!640723 (= res!414950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640724 () Bool)

(declare-fun e!366781 () Bool)

(assert (=> b!640724 (= e!366782 (not e!366781))))

(declare-fun res!414956 () Bool)

(assert (=> b!640724 (=> res!414956 e!366781)))

(declare-fun lt!296593 () SeekEntryResult!6835)

(assert (=> b!640724 (= res!414956 (not (= lt!296593 (Found!6835 index!984))))))

(declare-datatypes ((Unit!21674 0))(
  ( (Unit!21675) )
))
(declare-fun lt!296587 () Unit!21674)

(declare-fun e!366792 () Unit!21674)

(assert (=> b!640724 (= lt!296587 e!366792)))

(declare-fun c!73250 () Bool)

(assert (=> b!640724 (= c!73250 (= lt!296593 Undefined!6835))))

(assert (=> b!640724 (= lt!296593 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296591 lt!296581 mask!3053))))

(assert (=> b!640724 e!366791))

(declare-fun res!414959 () Bool)

(assert (=> b!640724 (=> (not res!414959) (not e!366791))))

(declare-fun lt!296589 () (_ BitVec 32))

(assert (=> b!640724 (= res!414959 (= lt!296584 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296589 vacantSpotIndex!68 lt!296591 lt!296581 mask!3053)))))

(assert (=> b!640724 (= lt!296584 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296589 vacantSpotIndex!68 (select (arr!18395 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!640724 (= lt!296591 (select (store (arr!18395 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296582 () Unit!21674)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38351 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21674)

(assert (=> b!640724 (= lt!296582 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296589 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640724 (= lt!296589 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!414962 () Bool)

(assert (=> start!57924 (=> (not res!414962) (not e!366786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57924 (= res!414962 (validMask!0 mask!3053))))

(assert (=> start!57924 e!366786))

(assert (=> start!57924 true))

(declare-fun array_inv!14191 (array!38351) Bool)

(assert (=> start!57924 (array_inv!14191 a!2986)))

(declare-fun b!640725 () Bool)

(declare-fun res!414955 () Bool)

(assert (=> b!640725 (=> (not res!414955) (not e!366786))))

(assert (=> b!640725 (= res!414955 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640726 () Bool)

(declare-fun e!366788 () Bool)

(assert (=> b!640726 (= e!366788 (or (bvsge (size!18759 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18759 a!2986))))))

(declare-datatypes ((List!12436 0))(
  ( (Nil!12433) (Cons!12432 (h!13477 (_ BitVec 64)) (t!18664 List!12436)) )
))
(declare-fun arrayNoDuplicates!0 (array!38351 (_ BitVec 32) List!12436) Bool)

(assert (=> b!640726 (arrayNoDuplicates!0 lt!296581 j!136 Nil!12433)))

(declare-fun lt!296583 () Unit!21674)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38351 (_ BitVec 32) (_ BitVec 32)) Unit!21674)

(assert (=> b!640726 (= lt!296583 (lemmaNoDuplicateFromThenFromBigger!0 lt!296581 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640726 (arrayNoDuplicates!0 lt!296581 #b00000000000000000000000000000000 Nil!12433)))

(declare-fun lt!296586 () Unit!21674)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38351 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12436) Unit!21674)

(assert (=> b!640726 (= lt!296586 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12433))))

(assert (=> b!640726 (arrayContainsKey!0 lt!296581 (select (arr!18395 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296585 () Unit!21674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38351 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21674)

(assert (=> b!640726 (= lt!296585 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296581 (select (arr!18395 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640727 () Bool)

(assert (=> b!640727 (= e!366789 e!366787)))

(declare-fun res!414954 () Bool)

(assert (=> b!640727 (=> (not res!414954) (not e!366787))))

(assert (=> b!640727 (= res!414954 (= (select (store (arr!18395 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640727 (= lt!296581 (array!38352 (store (arr!18395 a!2986) i!1108 k!1786) (size!18759 a!2986)))))

(declare-fun b!640728 () Bool)

(declare-fun Unit!21676 () Unit!21674)

(assert (=> b!640728 (= e!366792 Unit!21676)))

(declare-fun b!640729 () Bool)

(declare-fun Unit!21677 () Unit!21674)

(assert (=> b!640729 (= e!366792 Unit!21677)))

(assert (=> b!640729 false))

(declare-fun b!640730 () Bool)

(declare-fun res!414961 () Bool)

(assert (=> b!640730 (=> (not res!414961) (not e!366789))))

(assert (=> b!640730 (= res!414961 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12433))))

(declare-fun b!640731 () Bool)

(declare-fun res!414965 () Bool)

(assert (=> b!640731 (=> (not res!414965) (not e!366786))))

(assert (=> b!640731 (= res!414965 (and (= (size!18759 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18759 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18759 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640732 () Bool)

(assert (=> b!640732 (= e!366786 e!366789)))

(declare-fun res!414949 () Bool)

(assert (=> b!640732 (=> (not res!414949) (not e!366789))))

(declare-fun lt!296590 () SeekEntryResult!6835)

(assert (=> b!640732 (= res!414949 (or (= lt!296590 (MissingZero!6835 i!1108)) (= lt!296590 (MissingVacant!6835 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38351 (_ BitVec 32)) SeekEntryResult!6835)

(assert (=> b!640732 (= lt!296590 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640733 () Bool)

(assert (=> b!640733 (= e!366781 e!366788)))

(declare-fun res!414957 () Bool)

(assert (=> b!640733 (=> res!414957 e!366788)))

(assert (=> b!640733 (= res!414957 (or (not (= (select (arr!18395 a!2986) j!136) lt!296591)) (not (= (select (arr!18395 a!2986) j!136) lt!296592)) (bvsge j!136 index!984)))))

(assert (=> b!640733 e!366785))

(declare-fun res!414964 () Bool)

(assert (=> b!640733 (=> (not res!414964) (not e!366785))))

(assert (=> b!640733 (= res!414964 (= lt!296592 (select (arr!18395 a!2986) j!136)))))

(assert (=> b!640733 (= lt!296592 (select (store (arr!18395 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!57924 res!414962) b!640731))

(assert (= (and b!640731 res!414965) b!640718))

(assert (= (and b!640718 res!414958) b!640715))

(assert (= (and b!640715 res!414953) b!640725))

(assert (= (and b!640725 res!414955) b!640732))

(assert (= (and b!640732 res!414949) b!640723))

(assert (= (and b!640723 res!414950) b!640730))

(assert (= (and b!640730 res!414961) b!640722))

(assert (= (and b!640722 res!414951) b!640727))

(assert (= (and b!640727 res!414954) b!640720))

(assert (= (and b!640720 res!414960) b!640724))

(assert (= (and b!640724 res!414959) b!640716))

(assert (= (and b!640724 c!73250) b!640729))

(assert (= (and b!640724 (not c!73250)) b!640728))

(assert (= (and b!640724 (not res!414956)) b!640733))

(assert (= (and b!640733 res!414964) b!640721))

(assert (= (and b!640721 (not res!414963)) b!640717))

(assert (= (and b!640717 res!414952) b!640719))

(assert (= (and b!640733 (not res!414957)) b!640726))

(declare-fun m!614551 () Bool)

(assert (=> b!640722 m!614551))

(declare-fun m!614553 () Bool)

(assert (=> b!640721 m!614553))

(declare-fun m!614555 () Bool)

(assert (=> b!640730 m!614555))

(assert (=> b!640717 m!614553))

(assert (=> b!640717 m!614553))

(declare-fun m!614557 () Bool)

(assert (=> b!640717 m!614557))

(declare-fun m!614559 () Bool)

(assert (=> b!640726 m!614559))

(declare-fun m!614561 () Bool)

(assert (=> b!640726 m!614561))

(assert (=> b!640726 m!614553))

(assert (=> b!640726 m!614553))

(declare-fun m!614563 () Bool)

(assert (=> b!640726 m!614563))

(assert (=> b!640726 m!614553))

(declare-fun m!614565 () Bool)

(assert (=> b!640726 m!614565))

(declare-fun m!614567 () Bool)

(assert (=> b!640726 m!614567))

(declare-fun m!614569 () Bool)

(assert (=> b!640726 m!614569))

(declare-fun m!614571 () Bool)

(assert (=> start!57924 m!614571))

(declare-fun m!614573 () Bool)

(assert (=> start!57924 m!614573))

(declare-fun m!614575 () Bool)

(assert (=> b!640723 m!614575))

(declare-fun m!614577 () Bool)

(assert (=> b!640720 m!614577))

(assert (=> b!640720 m!614553))

(assert (=> b!640720 m!614553))

(declare-fun m!614579 () Bool)

(assert (=> b!640720 m!614579))

(declare-fun m!614581 () Bool)

(assert (=> b!640727 m!614581))

(declare-fun m!614583 () Bool)

(assert (=> b!640727 m!614583))

(assert (=> b!640733 m!614553))

(assert (=> b!640733 m!614581))

(declare-fun m!614585 () Bool)

(assert (=> b!640733 m!614585))

(assert (=> b!640719 m!614553))

(assert (=> b!640719 m!614553))

(declare-fun m!614587 () Bool)

(assert (=> b!640719 m!614587))

(declare-fun m!614589 () Bool)

(assert (=> b!640715 m!614589))

(assert (=> b!640718 m!614553))

(assert (=> b!640718 m!614553))

(declare-fun m!614591 () Bool)

(assert (=> b!640718 m!614591))

(declare-fun m!614593 () Bool)

(assert (=> b!640732 m!614593))

(declare-fun m!614595 () Bool)

(assert (=> b!640725 m!614595))

(declare-fun m!614597 () Bool)

(assert (=> b!640724 m!614597))

(declare-fun m!614599 () Bool)

(assert (=> b!640724 m!614599))

(assert (=> b!640724 m!614581))

(declare-fun m!614601 () Bool)

(assert (=> b!640724 m!614601))

(declare-fun m!614603 () Bool)

(assert (=> b!640724 m!614603))

(assert (=> b!640724 m!614553))

(declare-fun m!614605 () Bool)

(assert (=> b!640724 m!614605))

(assert (=> b!640724 m!614553))

(declare-fun m!614607 () Bool)

(assert (=> b!640724 m!614607))

(push 1)

(assert (not b!640723))

(assert (not b!640732))

(assert (not b!640718))

(assert (not b!640715))

(assert (not b!640730))

(assert (not b!640720))

(assert (not b!640719))

(assert (not b!640724))

(assert (not b!640725))

(assert (not start!57924))

(assert (not b!640726))

(assert (not b!640717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

