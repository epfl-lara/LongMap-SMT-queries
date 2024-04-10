; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58432 () Bool)

(assert start!58432)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38448 0))(
  ( (array!38449 (arr!18436 (Array (_ BitVec 32) (_ BitVec 64))) (size!18800 (_ BitVec 32))) )
))
(declare-fun lt!299057 () array!38448)

(declare-fun e!369668 () Bool)

(declare-fun b!645091 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38448)

(declare-fun arrayContainsKey!0 (array!38448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645091 (= e!369668 (arrayContainsKey!0 lt!299057 (select (arr!18436 a!2986) j!136) index!984))))

(declare-fun b!645092 () Bool)

(declare-fun e!369671 () Bool)

(declare-fun e!369661 () Bool)

(assert (=> b!645092 (= e!369671 e!369661)))

(declare-fun res!417895 () Bool)

(assert (=> b!645092 (=> res!417895 e!369661)))

(assert (=> b!645092 (= res!417895 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21882 0))(
  ( (Unit!21883) )
))
(declare-fun lt!299067 () Unit!21882)

(declare-fun e!369660 () Unit!21882)

(assert (=> b!645092 (= lt!299067 e!369660)))

(declare-fun c!73967 () Bool)

(assert (=> b!645092 (= c!73967 (bvslt j!136 index!984))))

(declare-fun b!645093 () Bool)

(declare-fun res!417908 () Bool)

(declare-fun e!369669 () Bool)

(assert (=> b!645093 (=> (not res!417908) (not e!369669))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645093 (= res!417908 (validKeyInArray!0 k0!1786))))

(declare-fun b!645094 () Bool)

(declare-fun Unit!21884 () Unit!21882)

(assert (=> b!645094 (= e!369660 Unit!21884)))

(declare-fun lt!299060 () Unit!21882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38448 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21882)

(assert (=> b!645094 (= lt!299060 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299057 (select (arr!18436 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645094 (arrayContainsKey!0 lt!299057 (select (arr!18436 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299059 () Unit!21882)

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((List!12477 0))(
  ( (Nil!12474) (Cons!12473 (h!13518 (_ BitVec 64)) (t!18705 List!12477)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38448 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12477) Unit!21882)

(assert (=> b!645094 (= lt!299059 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12474))))

(declare-fun arrayNoDuplicates!0 (array!38448 (_ BitVec 32) List!12477) Bool)

(assert (=> b!645094 (arrayNoDuplicates!0 lt!299057 #b00000000000000000000000000000000 Nil!12474)))

(declare-fun lt!299062 () Unit!21882)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38448 (_ BitVec 32) (_ BitVec 32)) Unit!21882)

(assert (=> b!645094 (= lt!299062 (lemmaNoDuplicateFromThenFromBigger!0 lt!299057 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645094 (arrayNoDuplicates!0 lt!299057 j!136 Nil!12474)))

(declare-fun lt!299064 () Unit!21882)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38448 (_ BitVec 64) (_ BitVec 32) List!12477) Unit!21882)

(assert (=> b!645094 (= lt!299064 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299057 (select (arr!18436 a!2986) j!136) j!136 Nil!12474))))

(assert (=> b!645094 false))

(declare-fun b!645095 () Bool)

(declare-fun res!417896 () Bool)

(assert (=> b!645095 (=> (not res!417896) (not e!369669))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!645095 (= res!417896 (and (= (size!18800 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18800 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18800 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645096 () Bool)

(declare-fun e!369672 () Bool)

(assert (=> b!645096 (= e!369672 e!369668)))

(declare-fun res!417900 () Bool)

(assert (=> b!645096 (=> (not res!417900) (not e!369668))))

(assert (=> b!645096 (= res!417900 (arrayContainsKey!0 lt!299057 (select (arr!18436 a!2986) j!136) j!136))))

(declare-fun b!645098 () Bool)

(declare-fun e!369666 () Bool)

(declare-datatypes ((SeekEntryResult!6876 0))(
  ( (MissingZero!6876 (index!29839 (_ BitVec 32))) (Found!6876 (index!29840 (_ BitVec 32))) (Intermediate!6876 (undefined!7688 Bool) (index!29841 (_ BitVec 32)) (x!58613 (_ BitVec 32))) (Undefined!6876) (MissingVacant!6876 (index!29842 (_ BitVec 32))) )
))
(declare-fun lt!299061 () SeekEntryResult!6876)

(declare-fun lt!299066 () SeekEntryResult!6876)

(assert (=> b!645098 (= e!369666 (= lt!299061 lt!299066))))

(declare-fun b!645099 () Bool)

(declare-fun res!417898 () Bool)

(declare-fun e!369664 () Bool)

(assert (=> b!645099 (=> (not res!417898) (not e!369664))))

(assert (=> b!645099 (= res!417898 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12474))))

(declare-fun b!645100 () Bool)

(declare-fun e!369663 () Bool)

(assert (=> b!645100 (= e!369664 e!369663)))

(declare-fun res!417905 () Bool)

(assert (=> b!645100 (=> (not res!417905) (not e!369663))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!645100 (= res!417905 (= (select (store (arr!18436 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645100 (= lt!299057 (array!38449 (store (arr!18436 a!2986) i!1108 k0!1786) (size!18800 a!2986)))))

(declare-fun b!645101 () Bool)

(declare-fun e!369665 () Bool)

(assert (=> b!645101 (= e!369665 (arrayContainsKey!0 lt!299057 (select (arr!18436 a!2986) j!136) index!984))))

(declare-fun b!645102 () Bool)

(declare-fun e!369670 () Bool)

(declare-fun e!369659 () Bool)

(assert (=> b!645102 (= e!369670 (not e!369659))))

(declare-fun res!417894 () Bool)

(assert (=> b!645102 (=> res!417894 e!369659)))

(declare-fun lt!299069 () SeekEntryResult!6876)

(assert (=> b!645102 (= res!417894 (not (= lt!299069 (Found!6876 index!984))))))

(declare-fun lt!299058 () Unit!21882)

(declare-fun e!369662 () Unit!21882)

(assert (=> b!645102 (= lt!299058 e!369662)))

(declare-fun c!73966 () Bool)

(assert (=> b!645102 (= c!73966 (= lt!299069 Undefined!6876))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!299065 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38448 (_ BitVec 32)) SeekEntryResult!6876)

(assert (=> b!645102 (= lt!299069 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299065 lt!299057 mask!3053))))

(assert (=> b!645102 e!369666))

(declare-fun res!417907 () Bool)

(assert (=> b!645102 (=> (not res!417907) (not e!369666))))

(declare-fun lt!299070 () (_ BitVec 32))

(assert (=> b!645102 (= res!417907 (= lt!299066 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299070 vacantSpotIndex!68 lt!299065 lt!299057 mask!3053)))))

(assert (=> b!645102 (= lt!299066 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299070 vacantSpotIndex!68 (select (arr!18436 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645102 (= lt!299065 (select (store (arr!18436 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299071 () Unit!21882)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38448 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21882)

(assert (=> b!645102 (= lt!299071 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299070 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645102 (= lt!299070 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645103 () Bool)

(declare-fun res!417902 () Bool)

(assert (=> b!645103 (=> (not res!417902) (not e!369664))))

(assert (=> b!645103 (= res!417902 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18436 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645104 () Bool)

(assert (=> b!645104 (= e!369661 true)))

(assert (=> b!645104 e!369665))

(declare-fun res!417911 () Bool)

(assert (=> b!645104 (=> (not res!417911) (not e!369665))))

(assert (=> b!645104 (= res!417911 (arrayContainsKey!0 lt!299057 (select (arr!18436 a!2986) j!136) j!136))))

(declare-fun b!645105 () Bool)

(assert (=> b!645105 (= e!369663 e!369670)))

(declare-fun res!417897 () Bool)

(assert (=> b!645105 (=> (not res!417897) (not e!369670))))

(assert (=> b!645105 (= res!417897 (and (= lt!299061 (Found!6876 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18436 a!2986) index!984) (select (arr!18436 a!2986) j!136))) (not (= (select (arr!18436 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645105 (= lt!299061 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18436 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645106 () Bool)

(declare-fun Unit!21885 () Unit!21882)

(assert (=> b!645106 (= e!369662 Unit!21885)))

(declare-fun b!645107 () Bool)

(assert (=> b!645107 (= e!369669 e!369664)))

(declare-fun res!417893 () Bool)

(assert (=> b!645107 (=> (not res!417893) (not e!369664))))

(declare-fun lt!299068 () SeekEntryResult!6876)

(assert (=> b!645107 (= res!417893 (or (= lt!299068 (MissingZero!6876 i!1108)) (= lt!299068 (MissingVacant!6876 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38448 (_ BitVec 32)) SeekEntryResult!6876)

(assert (=> b!645107 (= lt!299068 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645108 () Bool)

(declare-fun Unit!21886 () Unit!21882)

(assert (=> b!645108 (= e!369662 Unit!21886)))

(assert (=> b!645108 false))

(declare-fun b!645109 () Bool)

(declare-fun res!417904 () Bool)

(assert (=> b!645109 (=> (not res!417904) (not e!369669))))

(assert (=> b!645109 (= res!417904 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645097 () Bool)

(declare-fun e!369667 () Bool)

(assert (=> b!645097 (= e!369667 e!369672)))

(declare-fun res!417910 () Bool)

(assert (=> b!645097 (=> res!417910 e!369672)))

(declare-fun lt!299063 () (_ BitVec 64))

(assert (=> b!645097 (= res!417910 (or (not (= (select (arr!18436 a!2986) j!136) lt!299065)) (not (= (select (arr!18436 a!2986) j!136) lt!299063)) (bvsge j!136 index!984)))))

(declare-fun res!417899 () Bool)

(assert (=> start!58432 (=> (not res!417899) (not e!369669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58432 (= res!417899 (validMask!0 mask!3053))))

(assert (=> start!58432 e!369669))

(assert (=> start!58432 true))

(declare-fun array_inv!14232 (array!38448) Bool)

(assert (=> start!58432 (array_inv!14232 a!2986)))

(declare-fun b!645110 () Bool)

(assert (=> b!645110 (= e!369659 e!369671)))

(declare-fun res!417903 () Bool)

(assert (=> b!645110 (=> res!417903 e!369671)))

(assert (=> b!645110 (= res!417903 (or (not (= (select (arr!18436 a!2986) j!136) lt!299065)) (not (= (select (arr!18436 a!2986) j!136) lt!299063))))))

(assert (=> b!645110 e!369667))

(declare-fun res!417901 () Bool)

(assert (=> b!645110 (=> (not res!417901) (not e!369667))))

(assert (=> b!645110 (= res!417901 (= lt!299063 (select (arr!18436 a!2986) j!136)))))

(assert (=> b!645110 (= lt!299063 (select (store (arr!18436 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645111 () Bool)

(declare-fun res!417909 () Bool)

(assert (=> b!645111 (=> (not res!417909) (not e!369664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38448 (_ BitVec 32)) Bool)

(assert (=> b!645111 (= res!417909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645112 () Bool)

(declare-fun res!417906 () Bool)

(assert (=> b!645112 (=> (not res!417906) (not e!369669))))

(assert (=> b!645112 (= res!417906 (validKeyInArray!0 (select (arr!18436 a!2986) j!136)))))

(declare-fun b!645113 () Bool)

(declare-fun Unit!21887 () Unit!21882)

(assert (=> b!645113 (= e!369660 Unit!21887)))

(assert (= (and start!58432 res!417899) b!645095))

(assert (= (and b!645095 res!417896) b!645112))

(assert (= (and b!645112 res!417906) b!645093))

(assert (= (and b!645093 res!417908) b!645109))

(assert (= (and b!645109 res!417904) b!645107))

(assert (= (and b!645107 res!417893) b!645111))

(assert (= (and b!645111 res!417909) b!645099))

(assert (= (and b!645099 res!417898) b!645103))

(assert (= (and b!645103 res!417902) b!645100))

(assert (= (and b!645100 res!417905) b!645105))

(assert (= (and b!645105 res!417897) b!645102))

(assert (= (and b!645102 res!417907) b!645098))

(assert (= (and b!645102 c!73966) b!645108))

(assert (= (and b!645102 (not c!73966)) b!645106))

(assert (= (and b!645102 (not res!417894)) b!645110))

(assert (= (and b!645110 res!417901) b!645097))

(assert (= (and b!645097 (not res!417910)) b!645096))

(assert (= (and b!645096 res!417900) b!645091))

(assert (= (and b!645110 (not res!417903)) b!645092))

(assert (= (and b!645092 c!73967) b!645094))

(assert (= (and b!645092 (not c!73967)) b!645113))

(assert (= (and b!645092 (not res!417895)) b!645104))

(assert (= (and b!645104 res!417911) b!645101))

(declare-fun m!618641 () Bool)

(assert (=> b!645110 m!618641))

(declare-fun m!618643 () Bool)

(assert (=> b!645110 m!618643))

(declare-fun m!618645 () Bool)

(assert (=> b!645110 m!618645))

(assert (=> b!645101 m!618641))

(assert (=> b!645101 m!618641))

(declare-fun m!618647 () Bool)

(assert (=> b!645101 m!618647))

(declare-fun m!618649 () Bool)

(assert (=> b!645102 m!618649))

(declare-fun m!618651 () Bool)

(assert (=> b!645102 m!618651))

(declare-fun m!618653 () Bool)

(assert (=> b!645102 m!618653))

(assert (=> b!645102 m!618641))

(assert (=> b!645102 m!618643))

(declare-fun m!618655 () Bool)

(assert (=> b!645102 m!618655))

(assert (=> b!645102 m!618641))

(declare-fun m!618657 () Bool)

(assert (=> b!645102 m!618657))

(declare-fun m!618659 () Bool)

(assert (=> b!645102 m!618659))

(declare-fun m!618661 () Bool)

(assert (=> b!645105 m!618661))

(assert (=> b!645105 m!618641))

(assert (=> b!645105 m!618641))

(declare-fun m!618663 () Bool)

(assert (=> b!645105 m!618663))

(declare-fun m!618665 () Bool)

(assert (=> b!645111 m!618665))

(declare-fun m!618667 () Bool)

(assert (=> start!58432 m!618667))

(declare-fun m!618669 () Bool)

(assert (=> start!58432 m!618669))

(assert (=> b!645097 m!618641))

(declare-fun m!618671 () Bool)

(assert (=> b!645109 m!618671))

(declare-fun m!618673 () Bool)

(assert (=> b!645107 m!618673))

(declare-fun m!618675 () Bool)

(assert (=> b!645094 m!618675))

(assert (=> b!645094 m!618641))

(declare-fun m!618677 () Bool)

(assert (=> b!645094 m!618677))

(assert (=> b!645094 m!618641))

(declare-fun m!618679 () Bool)

(assert (=> b!645094 m!618679))

(assert (=> b!645094 m!618641))

(declare-fun m!618681 () Bool)

(assert (=> b!645094 m!618681))

(assert (=> b!645094 m!618641))

(declare-fun m!618683 () Bool)

(assert (=> b!645094 m!618683))

(declare-fun m!618685 () Bool)

(assert (=> b!645094 m!618685))

(declare-fun m!618687 () Bool)

(assert (=> b!645094 m!618687))

(declare-fun m!618689 () Bool)

(assert (=> b!645093 m!618689))

(assert (=> b!645104 m!618641))

(assert (=> b!645104 m!618641))

(declare-fun m!618691 () Bool)

(assert (=> b!645104 m!618691))

(declare-fun m!618693 () Bool)

(assert (=> b!645099 m!618693))

(assert (=> b!645100 m!618643))

(declare-fun m!618695 () Bool)

(assert (=> b!645100 m!618695))

(assert (=> b!645096 m!618641))

(assert (=> b!645096 m!618641))

(assert (=> b!645096 m!618691))

(assert (=> b!645112 m!618641))

(assert (=> b!645112 m!618641))

(declare-fun m!618697 () Bool)

(assert (=> b!645112 m!618697))

(assert (=> b!645091 m!618641))

(assert (=> b!645091 m!618641))

(assert (=> b!645091 m!618647))

(declare-fun m!618699 () Bool)

(assert (=> b!645103 m!618699))

(check-sat (not b!645107) (not b!645094) (not b!645111) (not b!645093) (not b!645112) (not b!645096) (not b!645109) (not b!645102) (not b!645101) (not start!58432) (not b!645104) (not b!645091) (not b!645099) (not b!645105))
(check-sat)
