; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58880 () Bool)

(assert start!58880)

(declare-fun b!649612 () Bool)

(declare-fun e!372617 () Bool)

(declare-fun e!372613 () Bool)

(assert (=> b!649612 (= e!372617 e!372613)))

(declare-fun res!421090 () Bool)

(assert (=> b!649612 (=> (not res!421090) (not e!372613))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38542 0))(
  ( (array!38543 (arr!18477 (Array (_ BitVec 32) (_ BitVec 64))) (size!18841 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38542)

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!649612 (= res!421090 (= (select (store (arr!18477 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301690 () array!38542)

(assert (=> b!649612 (= lt!301690 (array!38543 (store (arr!18477 a!2986) i!1108 k!1786) (size!18841 a!2986)))))

(declare-fun b!649613 () Bool)

(declare-datatypes ((Unit!22128 0))(
  ( (Unit!22129) )
))
(declare-fun e!372614 () Unit!22128)

(declare-fun Unit!22130 () Unit!22128)

(assert (=> b!649613 (= e!372614 Unit!22130)))

(assert (=> b!649613 false))

(declare-fun b!649614 () Bool)

(declare-fun res!421096 () Bool)

(assert (=> b!649614 (=> (not res!421096) (not e!372617))))

(declare-datatypes ((List!12518 0))(
  ( (Nil!12515) (Cons!12514 (h!13559 (_ BitVec 64)) (t!18746 List!12518)) )
))
(declare-fun arrayNoDuplicates!0 (array!38542 (_ BitVec 32) List!12518) Bool)

(assert (=> b!649614 (= res!421096 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12515))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!372607 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun b!649615 () Bool)

(declare-fun arrayContainsKey!0 (array!38542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649615 (= e!372607 (arrayContainsKey!0 lt!301690 (select (arr!18477 a!2986) j!136) index!984))))

(declare-fun b!649616 () Bool)

(declare-fun e!372615 () Bool)

(assert (=> b!649616 (= e!372613 e!372615)))

(declare-fun res!421082 () Bool)

(assert (=> b!649616 (=> (not res!421082) (not e!372615))))

(declare-datatypes ((SeekEntryResult!6917 0))(
  ( (MissingZero!6917 (index!30015 (_ BitVec 32))) (Found!6917 (index!30016 (_ BitVec 32))) (Intermediate!6917 (undefined!7729 Bool) (index!30017 (_ BitVec 32)) (x!58802 (_ BitVec 32))) (Undefined!6917) (MissingVacant!6917 (index!30018 (_ BitVec 32))) )
))
(declare-fun lt!301692 () SeekEntryResult!6917)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!649616 (= res!421082 (and (= lt!301692 (Found!6917 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18477 a!2986) index!984) (select (arr!18477 a!2986) j!136))) (not (= (select (arr!18477 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38542 (_ BitVec 32)) SeekEntryResult!6917)

(assert (=> b!649616 (= lt!301692 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18477 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649617 () Bool)

(declare-fun e!372605 () Unit!22128)

(declare-fun Unit!22131 () Unit!22128)

(assert (=> b!649617 (= e!372605 Unit!22131)))

(declare-fun lt!301685 () Unit!22128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38542 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22128)

(assert (=> b!649617 (= lt!301685 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301690 (select (arr!18477 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649617 (arrayContainsKey!0 lt!301690 (select (arr!18477 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301696 () Unit!22128)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38542 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12518) Unit!22128)

(assert (=> b!649617 (= lt!301696 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12515))))

(assert (=> b!649617 (arrayNoDuplicates!0 lt!301690 #b00000000000000000000000000000000 Nil!12515)))

(declare-fun lt!301687 () Unit!22128)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38542 (_ BitVec 32) (_ BitVec 32)) Unit!22128)

(assert (=> b!649617 (= lt!301687 (lemmaNoDuplicateFromThenFromBigger!0 lt!301690 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649617 (arrayNoDuplicates!0 lt!301690 j!136 Nil!12515)))

(declare-fun lt!301689 () Unit!22128)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38542 (_ BitVec 64) (_ BitVec 32) List!12518) Unit!22128)

(assert (=> b!649617 (= lt!301689 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301690 (select (arr!18477 a!2986) j!136) j!136 Nil!12515))))

(assert (=> b!649617 false))

(declare-fun b!649618 () Bool)

(declare-fun res!421094 () Bool)

(declare-fun e!372609 () Bool)

(assert (=> b!649618 (=> (not res!421094) (not e!372609))))

(assert (=> b!649618 (= res!421094 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649619 () Bool)

(declare-fun res!421093 () Bool)

(assert (=> b!649619 (=> (not res!421093) (not e!372609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649619 (= res!421093 (validKeyInArray!0 (select (arr!18477 a!2986) j!136)))))

(declare-fun b!649620 () Bool)

(declare-fun e!372616 () Bool)

(assert (=> b!649620 (= e!372615 (not e!372616))))

(declare-fun res!421097 () Bool)

(assert (=> b!649620 (=> res!421097 e!372616)))

(declare-fun lt!301697 () SeekEntryResult!6917)

(assert (=> b!649620 (= res!421097 (not (= lt!301697 (Found!6917 index!984))))))

(declare-fun lt!301691 () Unit!22128)

(assert (=> b!649620 (= lt!301691 e!372614)))

(declare-fun c!74632 () Bool)

(assert (=> b!649620 (= c!74632 (= lt!301697 Undefined!6917))))

(declare-fun lt!301688 () (_ BitVec 64))

(assert (=> b!649620 (= lt!301697 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301688 lt!301690 mask!3053))))

(declare-fun e!372610 () Bool)

(assert (=> b!649620 e!372610))

(declare-fun res!421086 () Bool)

(assert (=> b!649620 (=> (not res!421086) (not e!372610))))

(declare-fun lt!301698 () SeekEntryResult!6917)

(declare-fun lt!301694 () (_ BitVec 32))

(assert (=> b!649620 (= res!421086 (= lt!301698 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301694 vacantSpotIndex!68 lt!301688 lt!301690 mask!3053)))))

(assert (=> b!649620 (= lt!301698 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301694 vacantSpotIndex!68 (select (arr!18477 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649620 (= lt!301688 (select (store (arr!18477 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301684 () Unit!22128)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38542 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22128)

(assert (=> b!649620 (= lt!301684 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301694 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649620 (= lt!301694 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649621 () Bool)

(declare-fun res!421088 () Bool)

(assert (=> b!649621 (=> (not res!421088) (not e!372609))))

(assert (=> b!649621 (= res!421088 (and (= (size!18841 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18841 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18841 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649622 () Bool)

(declare-fun e!372606 () Bool)

(assert (=> b!649622 (= e!372606 true)))

(assert (=> b!649622 (arrayNoDuplicates!0 lt!301690 #b00000000000000000000000000000000 Nil!12515)))

(declare-fun lt!301686 () Unit!22128)

(assert (=> b!649622 (= lt!301686 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12515))))

(assert (=> b!649622 (arrayContainsKey!0 lt!301690 (select (arr!18477 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301699 () Unit!22128)

(assert (=> b!649622 (= lt!301699 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301690 (select (arr!18477 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649622 e!372607))

(declare-fun res!421100 () Bool)

(assert (=> b!649622 (=> (not res!421100) (not e!372607))))

(assert (=> b!649622 (= res!421100 (arrayContainsKey!0 lt!301690 (select (arr!18477 a!2986) j!136) j!136))))

(declare-fun b!649623 () Bool)

(declare-fun Unit!22132 () Unit!22128)

(assert (=> b!649623 (= e!372605 Unit!22132)))

(declare-fun b!649624 () Bool)

(declare-fun res!421089 () Bool)

(assert (=> b!649624 (=> (not res!421089) (not e!372617))))

(assert (=> b!649624 (= res!421089 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18477 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649625 () Bool)

(assert (=> b!649625 (= e!372610 (= lt!301692 lt!301698))))

(declare-fun b!649626 () Bool)

(declare-fun e!372618 () Bool)

(declare-fun e!372611 () Bool)

(assert (=> b!649626 (= e!372618 e!372611)))

(declare-fun res!421083 () Bool)

(assert (=> b!649626 (=> (not res!421083) (not e!372611))))

(assert (=> b!649626 (= res!421083 (arrayContainsKey!0 lt!301690 (select (arr!18477 a!2986) j!136) j!136))))

(declare-fun b!649627 () Bool)

(declare-fun Unit!22133 () Unit!22128)

(assert (=> b!649627 (= e!372614 Unit!22133)))

(declare-fun b!649628 () Bool)

(declare-fun e!372608 () Bool)

(assert (=> b!649628 (= e!372608 e!372618)))

(declare-fun res!421085 () Bool)

(assert (=> b!649628 (=> res!421085 e!372618)))

(declare-fun lt!301683 () (_ BitVec 64))

(assert (=> b!649628 (= res!421085 (or (not (= (select (arr!18477 a!2986) j!136) lt!301688)) (not (= (select (arr!18477 a!2986) j!136) lt!301683)) (bvsge j!136 index!984)))))

(declare-fun b!649629 () Bool)

(assert (=> b!649629 (= e!372609 e!372617)))

(declare-fun res!421099 () Bool)

(assert (=> b!649629 (=> (not res!421099) (not e!372617))))

(declare-fun lt!301693 () SeekEntryResult!6917)

(assert (=> b!649629 (= res!421099 (or (= lt!301693 (MissingZero!6917 i!1108)) (= lt!301693 (MissingVacant!6917 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38542 (_ BitVec 32)) SeekEntryResult!6917)

(assert (=> b!649629 (= lt!301693 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649630 () Bool)

(assert (=> b!649630 (= e!372611 (arrayContainsKey!0 lt!301690 (select (arr!18477 a!2986) j!136) index!984))))

(declare-fun b!649631 () Bool)

(declare-fun res!421092 () Bool)

(assert (=> b!649631 (=> (not res!421092) (not e!372609))))

(assert (=> b!649631 (= res!421092 (validKeyInArray!0 k!1786))))

(declare-fun b!649632 () Bool)

(declare-fun e!372604 () Bool)

(assert (=> b!649632 (= e!372616 e!372604)))

(declare-fun res!421095 () Bool)

(assert (=> b!649632 (=> res!421095 e!372604)))

(assert (=> b!649632 (= res!421095 (or (not (= (select (arr!18477 a!2986) j!136) lt!301688)) (not (= (select (arr!18477 a!2986) j!136) lt!301683))))))

(assert (=> b!649632 e!372608))

(declare-fun res!421084 () Bool)

(assert (=> b!649632 (=> (not res!421084) (not e!372608))))

(assert (=> b!649632 (= res!421084 (= lt!301683 (select (arr!18477 a!2986) j!136)))))

(assert (=> b!649632 (= lt!301683 (select (store (arr!18477 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649633 () Bool)

(assert (=> b!649633 (= e!372604 e!372606)))

(declare-fun res!421098 () Bool)

(assert (=> b!649633 (=> res!421098 e!372606)))

(assert (=> b!649633 (= res!421098 (bvsge index!984 j!136))))

(declare-fun lt!301695 () Unit!22128)

(assert (=> b!649633 (= lt!301695 e!372605)))

(declare-fun c!74633 () Bool)

(assert (=> b!649633 (= c!74633 (bvslt j!136 index!984))))

(declare-fun res!421091 () Bool)

(assert (=> start!58880 (=> (not res!421091) (not e!372609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58880 (= res!421091 (validMask!0 mask!3053))))

(assert (=> start!58880 e!372609))

(assert (=> start!58880 true))

(declare-fun array_inv!14273 (array!38542) Bool)

(assert (=> start!58880 (array_inv!14273 a!2986)))

(declare-fun b!649634 () Bool)

(declare-fun res!421087 () Bool)

(assert (=> b!649634 (=> (not res!421087) (not e!372617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38542 (_ BitVec 32)) Bool)

(assert (=> b!649634 (= res!421087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58880 res!421091) b!649621))

(assert (= (and b!649621 res!421088) b!649619))

(assert (= (and b!649619 res!421093) b!649631))

(assert (= (and b!649631 res!421092) b!649618))

(assert (= (and b!649618 res!421094) b!649629))

(assert (= (and b!649629 res!421099) b!649634))

(assert (= (and b!649634 res!421087) b!649614))

(assert (= (and b!649614 res!421096) b!649624))

(assert (= (and b!649624 res!421089) b!649612))

(assert (= (and b!649612 res!421090) b!649616))

(assert (= (and b!649616 res!421082) b!649620))

(assert (= (and b!649620 res!421086) b!649625))

(assert (= (and b!649620 c!74632) b!649613))

(assert (= (and b!649620 (not c!74632)) b!649627))

(assert (= (and b!649620 (not res!421097)) b!649632))

(assert (= (and b!649632 res!421084) b!649628))

(assert (= (and b!649628 (not res!421085)) b!649626))

(assert (= (and b!649626 res!421083) b!649630))

(assert (= (and b!649632 (not res!421095)) b!649633))

(assert (= (and b!649633 c!74633) b!649617))

(assert (= (and b!649633 (not c!74633)) b!649623))

(assert (= (and b!649633 (not res!421098)) b!649622))

(assert (= (and b!649622 res!421100) b!649615))

(declare-fun m!622853 () Bool)

(assert (=> b!649615 m!622853))

(assert (=> b!649615 m!622853))

(declare-fun m!622855 () Bool)

(assert (=> b!649615 m!622855))

(declare-fun m!622857 () Bool)

(assert (=> b!649620 m!622857))

(declare-fun m!622859 () Bool)

(assert (=> b!649620 m!622859))

(assert (=> b!649620 m!622853))

(declare-fun m!622861 () Bool)

(assert (=> b!649620 m!622861))

(declare-fun m!622863 () Bool)

(assert (=> b!649620 m!622863))

(declare-fun m!622865 () Bool)

(assert (=> b!649620 m!622865))

(assert (=> b!649620 m!622853))

(declare-fun m!622867 () Bool)

(assert (=> b!649620 m!622867))

(declare-fun m!622869 () Bool)

(assert (=> b!649620 m!622869))

(declare-fun m!622871 () Bool)

(assert (=> b!649614 m!622871))

(assert (=> b!649630 m!622853))

(assert (=> b!649630 m!622853))

(assert (=> b!649630 m!622855))

(declare-fun m!622873 () Bool)

(assert (=> b!649618 m!622873))

(declare-fun m!622875 () Bool)

(assert (=> b!649616 m!622875))

(assert (=> b!649616 m!622853))

(assert (=> b!649616 m!622853))

(declare-fun m!622877 () Bool)

(assert (=> b!649616 m!622877))

(declare-fun m!622879 () Bool)

(assert (=> start!58880 m!622879))

(declare-fun m!622881 () Bool)

(assert (=> start!58880 m!622881))

(assert (=> b!649617 m!622853))

(declare-fun m!622883 () Bool)

(assert (=> b!649617 m!622883))

(declare-fun m!622885 () Bool)

(assert (=> b!649617 m!622885))

(assert (=> b!649617 m!622853))

(declare-fun m!622887 () Bool)

(assert (=> b!649617 m!622887))

(declare-fun m!622889 () Bool)

(assert (=> b!649617 m!622889))

(assert (=> b!649617 m!622853))

(declare-fun m!622891 () Bool)

(assert (=> b!649617 m!622891))

(assert (=> b!649617 m!622853))

(declare-fun m!622893 () Bool)

(assert (=> b!649617 m!622893))

(declare-fun m!622895 () Bool)

(assert (=> b!649617 m!622895))

(declare-fun m!622897 () Bool)

(assert (=> b!649624 m!622897))

(declare-fun m!622899 () Bool)

(assert (=> b!649631 m!622899))

(assert (=> b!649612 m!622861))

(declare-fun m!622901 () Bool)

(assert (=> b!649612 m!622901))

(declare-fun m!622903 () Bool)

(assert (=> b!649629 m!622903))

(assert (=> b!649619 m!622853))

(assert (=> b!649619 m!622853))

(declare-fun m!622905 () Bool)

(assert (=> b!649619 m!622905))

(assert (=> b!649622 m!622853))

(declare-fun m!622907 () Bool)

(assert (=> b!649622 m!622907))

(assert (=> b!649622 m!622853))

(assert (=> b!649622 m!622853))

(declare-fun m!622909 () Bool)

(assert (=> b!649622 m!622909))

(assert (=> b!649622 m!622889))

(assert (=> b!649622 m!622853))

(declare-fun m!622911 () Bool)

(assert (=> b!649622 m!622911))

(assert (=> b!649622 m!622895))

(assert (=> b!649632 m!622853))

(assert (=> b!649632 m!622861))

(declare-fun m!622913 () Bool)

(assert (=> b!649632 m!622913))

(declare-fun m!622915 () Bool)

(assert (=> b!649634 m!622915))

(assert (=> b!649628 m!622853))

(assert (=> b!649626 m!622853))

(assert (=> b!649626 m!622853))

(assert (=> b!649626 m!622911))

(push 1)

