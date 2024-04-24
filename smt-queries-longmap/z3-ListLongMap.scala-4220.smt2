; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57972 () Bool)

(assert start!57972)

(declare-fun b!640654 () Bool)

(declare-datatypes ((Unit!21633 0))(
  ( (Unit!21634) )
))
(declare-fun e!366753 () Unit!21633)

(declare-fun Unit!21635 () Unit!21633)

(assert (=> b!640654 (= e!366753 Unit!21635)))

(assert (=> b!640654 false))

(declare-fun b!640655 () Bool)

(declare-fun e!366742 () Bool)

(declare-fun e!366752 () Bool)

(assert (=> b!640655 (= e!366742 e!366752)))

(declare-fun res!414809 () Bool)

(assert (=> b!640655 (=> res!414809 e!366752)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296489 () (_ BitVec 64))

(declare-fun lt!296499 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38337 0))(
  ( (array!38338 (arr!18385 (Array (_ BitVec 32) (_ BitVec 64))) (size!18749 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38337)

(assert (=> b!640655 (= res!414809 (or (not (= (select (arr!18385 a!2986) j!136) lt!296499)) (not (= (select (arr!18385 a!2986) j!136) lt!296489)) (bvsge j!136 index!984)))))

(declare-fun e!366743 () Bool)

(assert (=> b!640655 e!366743))

(declare-fun res!414822 () Bool)

(assert (=> b!640655 (=> (not res!414822) (not e!366743))))

(assert (=> b!640655 (= res!414822 (= lt!296489 (select (arr!18385 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!640655 (= lt!296489 (select (store (arr!18385 a!2986) i!1108 k0!1786) index!984))))

(declare-fun lt!296493 () array!38337)

(declare-fun b!640656 () Bool)

(declare-fun e!366748 () Bool)

(declare-fun arrayContainsKey!0 (array!38337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640656 (= e!366748 (arrayContainsKey!0 lt!296493 (select (arr!18385 a!2986) j!136) index!984))))

(declare-fun b!640657 () Bool)

(declare-fun res!414808 () Bool)

(declare-fun e!366747 () Bool)

(assert (=> b!640657 (=> (not res!414808) (not e!366747))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!640657 (= res!414808 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18385 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640658 () Bool)

(declare-fun e!366750 () Bool)

(assert (=> b!640658 (= e!366750 (not e!366742))))

(declare-fun res!414817 () Bool)

(assert (=> b!640658 (=> res!414817 e!366742)))

(declare-datatypes ((SeekEntryResult!6781 0))(
  ( (MissingZero!6781 (index!29444 (_ BitVec 32))) (Found!6781 (index!29445 (_ BitVec 32))) (Intermediate!6781 (undefined!7593 Bool) (index!29446 (_ BitVec 32)) (x!58356 (_ BitVec 32))) (Undefined!6781) (MissingVacant!6781 (index!29447 (_ BitVec 32))) )
))
(declare-fun lt!296497 () SeekEntryResult!6781)

(assert (=> b!640658 (= res!414817 (not (= lt!296497 (Found!6781 index!984))))))

(declare-fun lt!296495 () Unit!21633)

(assert (=> b!640658 (= lt!296495 e!366753)))

(declare-fun c!73292 () Bool)

(assert (=> b!640658 (= c!73292 (= lt!296497 Undefined!6781))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38337 (_ BitVec 32)) SeekEntryResult!6781)

(assert (=> b!640658 (= lt!296497 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296499 lt!296493 mask!3053))))

(declare-fun e!366751 () Bool)

(assert (=> b!640658 e!366751))

(declare-fun res!414807 () Bool)

(assert (=> b!640658 (=> (not res!414807) (not e!366751))))

(declare-fun lt!296500 () SeekEntryResult!6781)

(declare-fun lt!296491 () (_ BitVec 32))

(assert (=> b!640658 (= res!414807 (= lt!296500 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296491 vacantSpotIndex!68 lt!296499 lt!296493 mask!3053)))))

(assert (=> b!640658 (= lt!296500 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296491 vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640658 (= lt!296499 (select (store (arr!18385 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296488 () Unit!21633)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21633)

(assert (=> b!640658 (= lt!296488 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296491 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640658 (= lt!296491 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!640659 () Bool)

(declare-fun res!414819 () Bool)

(declare-fun e!366745 () Bool)

(assert (=> b!640659 (=> (not res!414819) (not e!366745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640659 (= res!414819 (validKeyInArray!0 k0!1786))))

(declare-fun b!640660 () Bool)

(declare-fun Unit!21636 () Unit!21633)

(assert (=> b!640660 (= e!366753 Unit!21636)))

(declare-fun b!640661 () Bool)

(declare-fun e!366746 () Bool)

(assert (=> b!640661 (= e!366747 e!366746)))

(declare-fun res!414821 () Bool)

(assert (=> b!640661 (=> (not res!414821) (not e!366746))))

(assert (=> b!640661 (= res!414821 (= (select (store (arr!18385 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640661 (= lt!296493 (array!38338 (store (arr!18385 a!2986) i!1108 k0!1786) (size!18749 a!2986)))))

(declare-fun res!414820 () Bool)

(assert (=> start!57972 (=> (not res!414820) (not e!366745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57972 (= res!414820 (validMask!0 mask!3053))))

(assert (=> start!57972 e!366745))

(assert (=> start!57972 true))

(declare-fun array_inv!14244 (array!38337) Bool)

(assert (=> start!57972 (array_inv!14244 a!2986)))

(declare-fun b!640662 () Bool)

(declare-fun lt!296496 () SeekEntryResult!6781)

(assert (=> b!640662 (= e!366751 (= lt!296496 lt!296500))))

(declare-fun b!640663 () Bool)

(declare-fun res!414818 () Bool)

(assert (=> b!640663 (=> (not res!414818) (not e!366747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38337 (_ BitVec 32)) Bool)

(assert (=> b!640663 (= res!414818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640664 () Bool)

(declare-fun res!414814 () Bool)

(assert (=> b!640664 (=> (not res!414814) (not e!366745))))

(assert (=> b!640664 (= res!414814 (validKeyInArray!0 (select (arr!18385 a!2986) j!136)))))

(declare-fun b!640665 () Bool)

(declare-fun res!414811 () Bool)

(assert (=> b!640665 (=> (not res!414811) (not e!366747))))

(declare-datatypes ((List!12333 0))(
  ( (Nil!12330) (Cons!12329 (h!13377 (_ BitVec 64)) (t!18553 List!12333)) )
))
(declare-fun arrayNoDuplicates!0 (array!38337 (_ BitVec 32) List!12333) Bool)

(assert (=> b!640665 (= res!414811 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12330))))

(declare-fun b!640666 () Bool)

(declare-fun e!366749 () Bool)

(assert (=> b!640666 (= e!366743 e!366749)))

(declare-fun res!414810 () Bool)

(assert (=> b!640666 (=> res!414810 e!366749)))

(assert (=> b!640666 (= res!414810 (or (not (= (select (arr!18385 a!2986) j!136) lt!296499)) (not (= (select (arr!18385 a!2986) j!136) lt!296489)) (bvsge j!136 index!984)))))

(declare-fun b!640667 () Bool)

(declare-fun res!414813 () Bool)

(assert (=> b!640667 (=> (not res!414813) (not e!366745))))

(assert (=> b!640667 (= res!414813 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640668 () Bool)

(assert (=> b!640668 (= e!366749 e!366748)))

(declare-fun res!414815 () Bool)

(assert (=> b!640668 (=> (not res!414815) (not e!366748))))

(assert (=> b!640668 (= res!414815 (arrayContainsKey!0 lt!296493 (select (arr!18385 a!2986) j!136) j!136))))

(declare-fun b!640669 () Bool)

(assert (=> b!640669 (= e!366745 e!366747)))

(declare-fun res!414812 () Bool)

(assert (=> b!640669 (=> (not res!414812) (not e!366747))))

(declare-fun lt!296490 () SeekEntryResult!6781)

(assert (=> b!640669 (= res!414812 (or (= lt!296490 (MissingZero!6781 i!1108)) (= lt!296490 (MissingVacant!6781 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38337 (_ BitVec 32)) SeekEntryResult!6781)

(assert (=> b!640669 (= lt!296490 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640670 () Bool)

(assert (=> b!640670 (= e!366752 true)))

(assert (=> b!640670 (arrayNoDuplicates!0 lt!296493 j!136 Nil!12330)))

(declare-fun lt!296498 () Unit!21633)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38337 (_ BitVec 32) (_ BitVec 32)) Unit!21633)

(assert (=> b!640670 (= lt!296498 (lemmaNoDuplicateFromThenFromBigger!0 lt!296493 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640670 (arrayNoDuplicates!0 lt!296493 #b00000000000000000000000000000000 Nil!12330)))

(declare-fun lt!296492 () Unit!21633)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12333) Unit!21633)

(assert (=> b!640670 (= lt!296492 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12330))))

(assert (=> b!640670 (arrayContainsKey!0 lt!296493 (select (arr!18385 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296494 () Unit!21633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21633)

(assert (=> b!640670 (= lt!296494 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296493 (select (arr!18385 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640671 () Bool)

(declare-fun res!414823 () Bool)

(assert (=> b!640671 (=> (not res!414823) (not e!366745))))

(assert (=> b!640671 (= res!414823 (and (= (size!18749 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18749 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18749 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640672 () Bool)

(assert (=> b!640672 (= e!366746 e!366750)))

(declare-fun res!414816 () Bool)

(assert (=> b!640672 (=> (not res!414816) (not e!366750))))

(assert (=> b!640672 (= res!414816 (and (= lt!296496 (Found!6781 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18385 a!2986) index!984) (select (arr!18385 a!2986) j!136))) (not (= (select (arr!18385 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640672 (= lt!296496 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57972 res!414820) b!640671))

(assert (= (and b!640671 res!414823) b!640664))

(assert (= (and b!640664 res!414814) b!640659))

(assert (= (and b!640659 res!414819) b!640667))

(assert (= (and b!640667 res!414813) b!640669))

(assert (= (and b!640669 res!414812) b!640663))

(assert (= (and b!640663 res!414818) b!640665))

(assert (= (and b!640665 res!414811) b!640657))

(assert (= (and b!640657 res!414808) b!640661))

(assert (= (and b!640661 res!414821) b!640672))

(assert (= (and b!640672 res!414816) b!640658))

(assert (= (and b!640658 res!414807) b!640662))

(assert (= (and b!640658 c!73292) b!640654))

(assert (= (and b!640658 (not c!73292)) b!640660))

(assert (= (and b!640658 (not res!414817)) b!640655))

(assert (= (and b!640655 res!414822) b!640666))

(assert (= (and b!640666 (not res!414810)) b!640668))

(assert (= (and b!640668 res!414815) b!640656))

(assert (= (and b!640655 (not res!414809)) b!640670))

(declare-fun m!614863 () Bool)

(assert (=> b!640668 m!614863))

(assert (=> b!640668 m!614863))

(declare-fun m!614865 () Bool)

(assert (=> b!640668 m!614865))

(declare-fun m!614867 () Bool)

(assert (=> b!640657 m!614867))

(assert (=> b!640664 m!614863))

(assert (=> b!640664 m!614863))

(declare-fun m!614869 () Bool)

(assert (=> b!640664 m!614869))

(assert (=> b!640666 m!614863))

(declare-fun m!614871 () Bool)

(assert (=> start!57972 m!614871))

(declare-fun m!614873 () Bool)

(assert (=> start!57972 m!614873))

(declare-fun m!614875 () Bool)

(assert (=> b!640663 m!614875))

(assert (=> b!640655 m!614863))

(declare-fun m!614877 () Bool)

(assert (=> b!640655 m!614877))

(declare-fun m!614879 () Bool)

(assert (=> b!640655 m!614879))

(declare-fun m!614881 () Bool)

(assert (=> b!640665 m!614881))

(assert (=> b!640656 m!614863))

(assert (=> b!640656 m!614863))

(declare-fun m!614883 () Bool)

(assert (=> b!640656 m!614883))

(declare-fun m!614885 () Bool)

(assert (=> b!640669 m!614885))

(assert (=> b!640661 m!614877))

(declare-fun m!614887 () Bool)

(assert (=> b!640661 m!614887))

(declare-fun m!614889 () Bool)

(assert (=> b!640659 m!614889))

(assert (=> b!640670 m!614863))

(declare-fun m!614891 () Bool)

(assert (=> b!640670 m!614891))

(declare-fun m!614893 () Bool)

(assert (=> b!640670 m!614893))

(assert (=> b!640670 m!614863))

(declare-fun m!614895 () Bool)

(assert (=> b!640670 m!614895))

(declare-fun m!614897 () Bool)

(assert (=> b!640670 m!614897))

(assert (=> b!640670 m!614863))

(declare-fun m!614899 () Bool)

(assert (=> b!640670 m!614899))

(declare-fun m!614901 () Bool)

(assert (=> b!640670 m!614901))

(declare-fun m!614903 () Bool)

(assert (=> b!640658 m!614903))

(declare-fun m!614905 () Bool)

(assert (=> b!640658 m!614905))

(assert (=> b!640658 m!614863))

(declare-fun m!614907 () Bool)

(assert (=> b!640658 m!614907))

(declare-fun m!614909 () Bool)

(assert (=> b!640658 m!614909))

(declare-fun m!614911 () Bool)

(assert (=> b!640658 m!614911))

(assert (=> b!640658 m!614877))

(assert (=> b!640658 m!614863))

(declare-fun m!614913 () Bool)

(assert (=> b!640658 m!614913))

(declare-fun m!614915 () Bool)

(assert (=> b!640667 m!614915))

(declare-fun m!614917 () Bool)

(assert (=> b!640672 m!614917))

(assert (=> b!640672 m!614863))

(assert (=> b!640672 m!614863))

(declare-fun m!614919 () Bool)

(assert (=> b!640672 m!614919))

(check-sat (not b!640665) (not start!57972) (not b!640664) (not b!640670) (not b!640658) (not b!640672) (not b!640668) (not b!640656) (not b!640663) (not b!640669) (not b!640667) (not b!640659))
(check-sat)
