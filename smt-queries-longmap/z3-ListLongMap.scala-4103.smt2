; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56118 () Bool)

(assert start!56118)

(declare-fun b!619748 () Bool)

(declare-datatypes ((Unit!20528 0))(
  ( (Unit!20529) )
))
(declare-fun e!355447 () Unit!20528)

(declare-fun Unit!20530 () Unit!20528)

(assert (=> b!619748 (= e!355447 Unit!20530)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!399343 () Bool)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37588 0))(
  ( (array!37589 (arr!18040 (Array (_ BitVec 32) (_ BitVec 64))) (size!18404 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37588)

(assert (=> b!619748 (= res!399343 (= (select (store (arr!18040 a!2986) i!1108 k0!1786) index!984) (select (arr!18040 a!2986) j!136)))))

(declare-fun e!355448 () Bool)

(assert (=> b!619748 (=> (not res!399343) (not e!355448))))

(assert (=> b!619748 e!355448))

(declare-fun c!70576 () Bool)

(assert (=> b!619748 (= c!70576 (bvslt j!136 index!984))))

(declare-fun lt!286175 () Unit!20528)

(declare-fun e!355441 () Unit!20528)

(assert (=> b!619748 (= lt!286175 e!355441)))

(declare-fun c!70575 () Bool)

(assert (=> b!619748 (= c!70575 (bvslt index!984 j!136))))

(declare-fun lt!286163 () Unit!20528)

(declare-fun e!355449 () Unit!20528)

(assert (=> b!619748 (= lt!286163 e!355449)))

(assert (=> b!619748 false))

(declare-fun b!619749 () Bool)

(declare-fun e!355446 () Unit!20528)

(declare-fun Unit!20531 () Unit!20528)

(assert (=> b!619749 (= e!355446 Unit!20531)))

(declare-fun b!619750 () Bool)

(declare-fun e!355442 () Bool)

(declare-fun lt!286166 () array!37588)

(declare-fun arrayContainsKey!0 (array!37588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619750 (= e!355442 (arrayContainsKey!0 lt!286166 (select (arr!18040 a!2986) j!136) index!984))))

(declare-fun b!619751 () Bool)

(declare-fun res!399349 () Bool)

(declare-fun e!355439 () Bool)

(assert (=> b!619751 (=> (not res!399349) (not e!355439))))

(assert (=> b!619751 (= res!399349 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!355451 () Bool)

(declare-fun b!619752 () Bool)

(assert (=> b!619752 (= e!355451 (arrayContainsKey!0 lt!286166 (select (arr!18040 a!2986) j!136) index!984))))

(declare-fun b!619753 () Bool)

(declare-fun Unit!20532 () Unit!20528)

(assert (=> b!619753 (= e!355446 Unit!20532)))

(assert (=> b!619753 false))

(declare-fun b!619754 () Bool)

(assert (=> b!619754 false))

(declare-fun lt!286165 () Unit!20528)

(declare-datatypes ((List!12081 0))(
  ( (Nil!12078) (Cons!12077 (h!13122 (_ BitVec 64)) (t!18309 List!12081)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37588 (_ BitVec 64) (_ BitVec 32) List!12081) Unit!20528)

(assert (=> b!619754 (= lt!286165 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286166 (select (arr!18040 a!2986) j!136) index!984 Nil!12078))))

(declare-fun arrayNoDuplicates!0 (array!37588 (_ BitVec 32) List!12081) Bool)

(assert (=> b!619754 (arrayNoDuplicates!0 lt!286166 index!984 Nil!12078)))

(declare-fun lt!286177 () Unit!20528)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37588 (_ BitVec 32) (_ BitVec 32)) Unit!20528)

(assert (=> b!619754 (= lt!286177 (lemmaNoDuplicateFromThenFromBigger!0 lt!286166 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619754 (arrayNoDuplicates!0 lt!286166 #b00000000000000000000000000000000 Nil!12078)))

(declare-fun lt!286173 () Unit!20528)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37588 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12081) Unit!20528)

(assert (=> b!619754 (= lt!286173 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12078))))

(assert (=> b!619754 (arrayContainsKey!0 lt!286166 (select (arr!18040 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286168 () Unit!20528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37588 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20528)

(assert (=> b!619754 (= lt!286168 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286166 (select (arr!18040 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619754 e!355451))

(declare-fun res!399340 () Bool)

(assert (=> b!619754 (=> (not res!399340) (not e!355451))))

(assert (=> b!619754 (= res!399340 (arrayContainsKey!0 lt!286166 (select (arr!18040 a!2986) j!136) j!136))))

(declare-fun Unit!20533 () Unit!20528)

(assert (=> b!619754 (= e!355449 Unit!20533)))

(declare-fun b!619755 () Bool)

(declare-fun e!355445 () Bool)

(assert (=> b!619755 (= e!355445 true)))

(assert (=> b!619755 (= (select (store (arr!18040 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619756 () Bool)

(declare-fun e!355450 () Bool)

(assert (=> b!619756 (= e!355450 (not e!355445))))

(declare-fun res!399347 () Bool)

(assert (=> b!619756 (=> res!399347 e!355445)))

(declare-datatypes ((SeekEntryResult!6480 0))(
  ( (MissingZero!6480 (index!28204 (_ BitVec 32))) (Found!6480 (index!28205 (_ BitVec 32))) (Intermediate!6480 (undefined!7292 Bool) (index!28206 (_ BitVec 32)) (x!56984 (_ BitVec 32))) (Undefined!6480) (MissingVacant!6480 (index!28207 (_ BitVec 32))) )
))
(declare-fun lt!286162 () SeekEntryResult!6480)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619756 (= res!399347 (not (= lt!286162 (MissingVacant!6480 vacantSpotIndex!68))))))

(declare-fun lt!286172 () Unit!20528)

(assert (=> b!619756 (= lt!286172 e!355447)))

(declare-fun c!70577 () Bool)

(assert (=> b!619756 (= c!70577 (= lt!286162 (Found!6480 index!984)))))

(declare-fun lt!286167 () Unit!20528)

(assert (=> b!619756 (= lt!286167 e!355446)))

(declare-fun c!70574 () Bool)

(assert (=> b!619756 (= c!70574 (= lt!286162 Undefined!6480))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!286169 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37588 (_ BitVec 32)) SeekEntryResult!6480)

(assert (=> b!619756 (= lt!286162 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286169 lt!286166 mask!3053))))

(declare-fun e!355438 () Bool)

(assert (=> b!619756 e!355438))

(declare-fun res!399339 () Bool)

(assert (=> b!619756 (=> (not res!399339) (not e!355438))))

(declare-fun lt!286159 () SeekEntryResult!6480)

(declare-fun lt!286171 () (_ BitVec 32))

(assert (=> b!619756 (= res!399339 (= lt!286159 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286171 vacantSpotIndex!68 lt!286169 lt!286166 mask!3053)))))

(assert (=> b!619756 (= lt!286159 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286171 vacantSpotIndex!68 (select (arr!18040 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619756 (= lt!286169 (select (store (arr!18040 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286176 () Unit!20528)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37588 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20528)

(assert (=> b!619756 (= lt!286176 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286171 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619756 (= lt!286171 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619757 () Bool)

(declare-fun e!355444 () Bool)

(assert (=> b!619757 (= e!355444 e!355450)))

(declare-fun res!399341 () Bool)

(assert (=> b!619757 (=> (not res!399341) (not e!355450))))

(declare-fun lt!286161 () SeekEntryResult!6480)

(assert (=> b!619757 (= res!399341 (and (= lt!286161 (Found!6480 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18040 a!2986) index!984) (select (arr!18040 a!2986) j!136))) (not (= (select (arr!18040 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619757 (= lt!286161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18040 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619758 () Bool)

(declare-fun Unit!20534 () Unit!20528)

(assert (=> b!619758 (= e!355449 Unit!20534)))

(declare-fun b!619759 () Bool)

(declare-fun res!399350 () Bool)

(assert (=> b!619759 (=> (not res!399350) (not e!355439))))

(assert (=> b!619759 (= res!399350 (and (= (size!18404 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18404 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18404 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619761 () Bool)

(declare-fun res!399346 () Bool)

(assert (=> b!619761 (=> (not res!399346) (not e!355439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619761 (= res!399346 (validKeyInArray!0 k0!1786))))

(declare-fun b!619762 () Bool)

(declare-fun res!399334 () Bool)

(assert (=> b!619762 (= res!399334 (bvsge j!136 index!984))))

(declare-fun e!355440 () Bool)

(assert (=> b!619762 (=> res!399334 e!355440)))

(assert (=> b!619762 (= e!355448 e!355440)))

(declare-fun b!619763 () Bool)

(assert (=> b!619763 false))

(declare-fun lt!286174 () Unit!20528)

(assert (=> b!619763 (= lt!286174 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286166 (select (arr!18040 a!2986) j!136) j!136 Nil!12078))))

(assert (=> b!619763 (arrayNoDuplicates!0 lt!286166 j!136 Nil!12078)))

(declare-fun lt!286160 () Unit!20528)

(assert (=> b!619763 (= lt!286160 (lemmaNoDuplicateFromThenFromBigger!0 lt!286166 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619763 (arrayNoDuplicates!0 lt!286166 #b00000000000000000000000000000000 Nil!12078)))

(declare-fun lt!286158 () Unit!20528)

(assert (=> b!619763 (= lt!286158 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12078))))

(assert (=> b!619763 (arrayContainsKey!0 lt!286166 (select (arr!18040 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286164 () Unit!20528)

(assert (=> b!619763 (= lt!286164 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286166 (select (arr!18040 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20535 () Unit!20528)

(assert (=> b!619763 (= e!355441 Unit!20535)))

(declare-fun b!619764 () Bool)

(declare-fun res!399337 () Bool)

(assert (=> b!619764 (=> (not res!399337) (not e!355439))))

(assert (=> b!619764 (= res!399337 (validKeyInArray!0 (select (arr!18040 a!2986) j!136)))))

(declare-fun b!619765 () Bool)

(declare-fun res!399335 () Bool)

(declare-fun e!355452 () Bool)

(assert (=> b!619765 (=> (not res!399335) (not e!355452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37588 (_ BitVec 32)) Bool)

(assert (=> b!619765 (= res!399335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619766 () Bool)

(assert (=> b!619766 (= e!355452 e!355444)))

(declare-fun res!399348 () Bool)

(assert (=> b!619766 (=> (not res!399348) (not e!355444))))

(assert (=> b!619766 (= res!399348 (= (select (store (arr!18040 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619766 (= lt!286166 (array!37589 (store (arr!18040 a!2986) i!1108 k0!1786) (size!18404 a!2986)))))

(declare-fun b!619767 () Bool)

(declare-fun res!399338 () Bool)

(assert (=> b!619767 (=> (not res!399338) (not e!355452))))

(assert (=> b!619767 (= res!399338 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18040 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619768 () Bool)

(declare-fun Unit!20536 () Unit!20528)

(assert (=> b!619768 (= e!355447 Unit!20536)))

(declare-fun res!399336 () Bool)

(declare-fun b!619769 () Bool)

(assert (=> b!619769 (= res!399336 (arrayContainsKey!0 lt!286166 (select (arr!18040 a!2986) j!136) j!136))))

(assert (=> b!619769 (=> (not res!399336) (not e!355442))))

(assert (=> b!619769 (= e!355440 e!355442)))

(declare-fun b!619770 () Bool)

(declare-fun res!399344 () Bool)

(assert (=> b!619770 (=> (not res!399344) (not e!355452))))

(assert (=> b!619770 (= res!399344 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12078))))

(declare-fun b!619771 () Bool)

(assert (=> b!619771 (= e!355438 (= lt!286161 lt!286159))))

(declare-fun b!619772 () Bool)

(declare-fun Unit!20537 () Unit!20528)

(assert (=> b!619772 (= e!355441 Unit!20537)))

(declare-fun b!619760 () Bool)

(assert (=> b!619760 (= e!355439 e!355452)))

(declare-fun res!399342 () Bool)

(assert (=> b!619760 (=> (not res!399342) (not e!355452))))

(declare-fun lt!286170 () SeekEntryResult!6480)

(assert (=> b!619760 (= res!399342 (or (= lt!286170 (MissingZero!6480 i!1108)) (= lt!286170 (MissingVacant!6480 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37588 (_ BitVec 32)) SeekEntryResult!6480)

(assert (=> b!619760 (= lt!286170 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!399345 () Bool)

(assert (=> start!56118 (=> (not res!399345) (not e!355439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56118 (= res!399345 (validMask!0 mask!3053))))

(assert (=> start!56118 e!355439))

(assert (=> start!56118 true))

(declare-fun array_inv!13836 (array!37588) Bool)

(assert (=> start!56118 (array_inv!13836 a!2986)))

(assert (= (and start!56118 res!399345) b!619759))

(assert (= (and b!619759 res!399350) b!619764))

(assert (= (and b!619764 res!399337) b!619761))

(assert (= (and b!619761 res!399346) b!619751))

(assert (= (and b!619751 res!399349) b!619760))

(assert (= (and b!619760 res!399342) b!619765))

(assert (= (and b!619765 res!399335) b!619770))

(assert (= (and b!619770 res!399344) b!619767))

(assert (= (and b!619767 res!399338) b!619766))

(assert (= (and b!619766 res!399348) b!619757))

(assert (= (and b!619757 res!399341) b!619756))

(assert (= (and b!619756 res!399339) b!619771))

(assert (= (and b!619756 c!70574) b!619753))

(assert (= (and b!619756 (not c!70574)) b!619749))

(assert (= (and b!619756 c!70577) b!619748))

(assert (= (and b!619756 (not c!70577)) b!619768))

(assert (= (and b!619748 res!399343) b!619762))

(assert (= (and b!619762 (not res!399334)) b!619769))

(assert (= (and b!619769 res!399336) b!619750))

(assert (= (and b!619748 c!70576) b!619763))

(assert (= (and b!619748 (not c!70576)) b!619772))

(assert (= (and b!619748 c!70575) b!619754))

(assert (= (and b!619748 (not c!70575)) b!619758))

(assert (= (and b!619754 res!399340) b!619752))

(assert (= (and b!619756 (not res!399347)) b!619755))

(declare-fun m!595701 () Bool)

(assert (=> b!619765 m!595701))

(declare-fun m!595703 () Bool)

(assert (=> b!619750 m!595703))

(assert (=> b!619750 m!595703))

(declare-fun m!595705 () Bool)

(assert (=> b!619750 m!595705))

(declare-fun m!595707 () Bool)

(assert (=> b!619761 m!595707))

(declare-fun m!595709 () Bool)

(assert (=> b!619755 m!595709))

(declare-fun m!595711 () Bool)

(assert (=> b!619755 m!595711))

(declare-fun m!595713 () Bool)

(assert (=> b!619770 m!595713))

(assert (=> b!619752 m!595703))

(assert (=> b!619752 m!595703))

(assert (=> b!619752 m!595705))

(assert (=> b!619764 m!595703))

(assert (=> b!619764 m!595703))

(declare-fun m!595715 () Bool)

(assert (=> b!619764 m!595715))

(assert (=> b!619763 m!595703))

(declare-fun m!595717 () Bool)

(assert (=> b!619763 m!595717))

(assert (=> b!619763 m!595703))

(declare-fun m!595719 () Bool)

(assert (=> b!619763 m!595719))

(declare-fun m!595721 () Bool)

(assert (=> b!619763 m!595721))

(assert (=> b!619763 m!595703))

(declare-fun m!595723 () Bool)

(assert (=> b!619763 m!595723))

(declare-fun m!595725 () Bool)

(assert (=> b!619763 m!595725))

(assert (=> b!619763 m!595703))

(declare-fun m!595727 () Bool)

(assert (=> b!619763 m!595727))

(declare-fun m!595729 () Bool)

(assert (=> b!619763 m!595729))

(declare-fun m!595731 () Bool)

(assert (=> b!619760 m!595731))

(assert (=> b!619766 m!595709))

(declare-fun m!595733 () Bool)

(assert (=> b!619766 m!595733))

(assert (=> b!619769 m!595703))

(assert (=> b!619769 m!595703))

(declare-fun m!595735 () Bool)

(assert (=> b!619769 m!595735))

(declare-fun m!595737 () Bool)

(assert (=> start!56118 m!595737))

(declare-fun m!595739 () Bool)

(assert (=> start!56118 m!595739))

(declare-fun m!595741 () Bool)

(assert (=> b!619756 m!595741))

(declare-fun m!595743 () Bool)

(assert (=> b!619756 m!595743))

(assert (=> b!619756 m!595703))

(assert (=> b!619756 m!595709))

(declare-fun m!595745 () Bool)

(assert (=> b!619756 m!595745))

(declare-fun m!595747 () Bool)

(assert (=> b!619756 m!595747))

(assert (=> b!619756 m!595703))

(declare-fun m!595749 () Bool)

(assert (=> b!619756 m!595749))

(declare-fun m!595751 () Bool)

(assert (=> b!619756 m!595751))

(declare-fun m!595753 () Bool)

(assert (=> b!619751 m!595753))

(declare-fun m!595755 () Bool)

(assert (=> b!619757 m!595755))

(assert (=> b!619757 m!595703))

(assert (=> b!619757 m!595703))

(declare-fun m!595757 () Bool)

(assert (=> b!619757 m!595757))

(assert (=> b!619754 m!595703))

(declare-fun m!595759 () Bool)

(assert (=> b!619754 m!595759))

(assert (=> b!619754 m!595703))

(assert (=> b!619754 m!595735))

(assert (=> b!619754 m!595719))

(assert (=> b!619754 m!595703))

(declare-fun m!595761 () Bool)

(assert (=> b!619754 m!595761))

(declare-fun m!595763 () Bool)

(assert (=> b!619754 m!595763))

(assert (=> b!619754 m!595729))

(assert (=> b!619754 m!595703))

(declare-fun m!595765 () Bool)

(assert (=> b!619754 m!595765))

(assert (=> b!619754 m!595703))

(declare-fun m!595767 () Bool)

(assert (=> b!619754 m!595767))

(assert (=> b!619748 m!595709))

(assert (=> b!619748 m!595711))

(assert (=> b!619748 m!595703))

(declare-fun m!595769 () Bool)

(assert (=> b!619767 m!595769))

(check-sat (not b!619763) (not b!619761) (not b!619764) (not b!619752) (not b!619765) (not b!619760) (not b!619750) (not b!619754) (not start!56118) (not b!619756) (not b!619770) (not b!619751) (not b!619757) (not b!619769))
(check-sat)
