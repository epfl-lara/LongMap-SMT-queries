; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56142 () Bool)

(assert start!56142)

(declare-fun b!620625 () Bool)

(declare-fun res!399923 () Bool)

(declare-fun e!355967 () Bool)

(assert (=> b!620625 (=> (not res!399923) (not e!355967))))

(declare-datatypes ((array!37612 0))(
  ( (array!37613 (arr!18052 (Array (_ BitVec 32) (_ BitVec 64))) (size!18416 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37612)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37612 (_ BitVec 32)) Bool)

(assert (=> b!620625 (= res!399923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620626 () Bool)

(declare-fun res!399927 () Bool)

(declare-fun e!355964 () Bool)

(assert (=> b!620626 (=> (not res!399927) (not e!355964))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620626 (= res!399927 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620627 () Bool)

(declare-fun res!399924 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620627 (= res!399924 (bvsge j!136 index!984))))

(declare-fun e!355966 () Bool)

(assert (=> b!620627 (=> res!399924 e!355966)))

(declare-fun e!355958 () Bool)

(assert (=> b!620627 (= e!355958 e!355966)))

(declare-fun b!620628 () Bool)

(declare-fun e!355968 () Bool)

(declare-fun e!355955 () Bool)

(assert (=> b!620628 (= e!355968 e!355955)))

(declare-fun res!399932 () Bool)

(assert (=> b!620628 (=> (not res!399932) (not e!355955))))

(declare-datatypes ((SeekEntryResult!6492 0))(
  ( (MissingZero!6492 (index!28252 (_ BitVec 32))) (Found!6492 (index!28253 (_ BitVec 32))) (Intermediate!6492 (undefined!7304 Bool) (index!28254 (_ BitVec 32)) (x!57028 (_ BitVec 32))) (Undefined!6492) (MissingVacant!6492 (index!28255 (_ BitVec 32))) )
))
(declare-fun lt!286897 () SeekEntryResult!6492)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!620628 (= res!399932 (and (= lt!286897 (Found!6492 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18052 a!2986) index!984) (select (arr!18052 a!2986) j!136))) (not (= (select (arr!18052 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37612 (_ BitVec 32)) SeekEntryResult!6492)

(assert (=> b!620628 (= lt!286897 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18052 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620629 () Bool)

(assert (=> b!620629 (= e!355967 e!355968)))

(declare-fun res!399925 () Bool)

(assert (=> b!620629 (=> (not res!399925) (not e!355968))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!620629 (= res!399925 (= (select (store (arr!18052 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286880 () array!37612)

(assert (=> b!620629 (= lt!286880 (array!37613 (store (arr!18052 a!2986) i!1108 k0!1786) (size!18416 a!2986)))))

(declare-fun b!620630 () Bool)

(assert (=> b!620630 (= e!355955 (not true))))

(declare-datatypes ((Unit!20648 0))(
  ( (Unit!20649) )
))
(declare-fun lt!286894 () Unit!20648)

(declare-fun e!355957 () Unit!20648)

(assert (=> b!620630 (= lt!286894 e!355957)))

(declare-fun c!70718 () Bool)

(declare-fun lt!286884 () SeekEntryResult!6492)

(assert (=> b!620630 (= c!70718 (= lt!286884 (Found!6492 index!984)))))

(declare-fun lt!286879 () Unit!20648)

(declare-fun e!355965 () Unit!20648)

(assert (=> b!620630 (= lt!286879 e!355965)))

(declare-fun c!70719 () Bool)

(assert (=> b!620630 (= c!70719 (= lt!286884 Undefined!6492))))

(declare-fun lt!286890 () (_ BitVec 64))

(assert (=> b!620630 (= lt!286884 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286890 lt!286880 mask!3053))))

(declare-fun e!355959 () Bool)

(assert (=> b!620630 e!355959))

(declare-fun res!399936 () Bool)

(assert (=> b!620630 (=> (not res!399936) (not e!355959))))

(declare-fun lt!286891 () (_ BitVec 32))

(declare-fun lt!286881 () SeekEntryResult!6492)

(assert (=> b!620630 (= res!399936 (= lt!286881 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286891 vacantSpotIndex!68 lt!286890 lt!286880 mask!3053)))))

(assert (=> b!620630 (= lt!286881 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286891 vacantSpotIndex!68 (select (arr!18052 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620630 (= lt!286890 (select (store (arr!18052 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286887 () Unit!20648)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37612 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20648)

(assert (=> b!620630 (= lt!286887 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286891 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620630 (= lt!286891 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620632 () Bool)

(declare-fun Unit!20650 () Unit!20648)

(assert (=> b!620632 (= e!355965 Unit!20650)))

(assert (=> b!620632 false))

(declare-fun b!620633 () Bool)

(assert (=> b!620633 false))

(declare-fun lt!286893 () Unit!20648)

(declare-datatypes ((List!12093 0))(
  ( (Nil!12090) (Cons!12089 (h!13134 (_ BitVec 64)) (t!18321 List!12093)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37612 (_ BitVec 64) (_ BitVec 32) List!12093) Unit!20648)

(assert (=> b!620633 (= lt!286893 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286880 (select (arr!18052 a!2986) j!136) index!984 Nil!12090))))

(declare-fun arrayNoDuplicates!0 (array!37612 (_ BitVec 32) List!12093) Bool)

(assert (=> b!620633 (arrayNoDuplicates!0 lt!286880 index!984 Nil!12090)))

(declare-fun lt!286885 () Unit!20648)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37612 (_ BitVec 32) (_ BitVec 32)) Unit!20648)

(assert (=> b!620633 (= lt!286885 (lemmaNoDuplicateFromThenFromBigger!0 lt!286880 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620633 (arrayNoDuplicates!0 lt!286880 #b00000000000000000000000000000000 Nil!12090)))

(declare-fun lt!286892 () Unit!20648)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37612 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12093) Unit!20648)

(assert (=> b!620633 (= lt!286892 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12090))))

(assert (=> b!620633 (arrayContainsKey!0 lt!286880 (select (arr!18052 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286878 () Unit!20648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37612 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20648)

(assert (=> b!620633 (= lt!286878 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286880 (select (arr!18052 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355963 () Bool)

(assert (=> b!620633 e!355963))

(declare-fun res!399934 () Bool)

(assert (=> b!620633 (=> (not res!399934) (not e!355963))))

(assert (=> b!620633 (= res!399934 (arrayContainsKey!0 lt!286880 (select (arr!18052 a!2986) j!136) j!136))))

(declare-fun e!355956 () Unit!20648)

(declare-fun Unit!20651 () Unit!20648)

(assert (=> b!620633 (= e!355956 Unit!20651)))

(declare-fun b!620634 () Bool)

(declare-fun e!355960 () Unit!20648)

(declare-fun Unit!20652 () Unit!20648)

(assert (=> b!620634 (= e!355960 Unit!20652)))

(declare-fun b!620635 () Bool)

(declare-fun res!399929 () Bool)

(assert (=> b!620635 (=> (not res!399929) (not e!355967))))

(assert (=> b!620635 (= res!399929 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12090))))

(declare-fun b!620636 () Bool)

(declare-fun res!399933 () Bool)

(assert (=> b!620636 (=> (not res!399933) (not e!355964))))

(assert (=> b!620636 (= res!399933 (and (= (size!18416 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18416 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18416 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620637 () Bool)

(declare-fun Unit!20653 () Unit!20648)

(assert (=> b!620637 (= e!355956 Unit!20653)))

(declare-fun b!620638 () Bool)

(declare-fun res!399926 () Bool)

(assert (=> b!620638 (=> (not res!399926) (not e!355964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620638 (= res!399926 (validKeyInArray!0 k0!1786))))

(declare-fun res!399930 () Bool)

(declare-fun b!620639 () Bool)

(assert (=> b!620639 (= res!399930 (arrayContainsKey!0 lt!286880 (select (arr!18052 a!2986) j!136) j!136))))

(declare-fun e!355961 () Bool)

(assert (=> b!620639 (=> (not res!399930) (not e!355961))))

(assert (=> b!620639 (= e!355966 e!355961)))

(declare-fun b!620640 () Bool)

(declare-fun Unit!20654 () Unit!20648)

(assert (=> b!620640 (= e!355957 Unit!20654)))

(declare-fun b!620641 () Bool)

(assert (=> b!620641 (= e!355964 e!355967)))

(declare-fun res!399928 () Bool)

(assert (=> b!620641 (=> (not res!399928) (not e!355967))))

(declare-fun lt!286896 () SeekEntryResult!6492)

(assert (=> b!620641 (= res!399928 (or (= lt!286896 (MissingZero!6492 i!1108)) (= lt!286896 (MissingVacant!6492 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37612 (_ BitVec 32)) SeekEntryResult!6492)

(assert (=> b!620641 (= lt!286896 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620642 () Bool)

(assert (=> b!620642 (= e!355961 (arrayContainsKey!0 lt!286880 (select (arr!18052 a!2986) j!136) index!984))))

(declare-fun b!620643 () Bool)

(declare-fun Unit!20655 () Unit!20648)

(assert (=> b!620643 (= e!355957 Unit!20655)))

(declare-fun res!399931 () Bool)

(assert (=> b!620643 (= res!399931 (= (select (store (arr!18052 a!2986) i!1108 k0!1786) index!984) (select (arr!18052 a!2986) j!136)))))

(assert (=> b!620643 (=> (not res!399931) (not e!355958))))

(assert (=> b!620643 e!355958))

(declare-fun c!70721 () Bool)

(assert (=> b!620643 (= c!70721 (bvslt j!136 index!984))))

(declare-fun lt!286889 () Unit!20648)

(assert (=> b!620643 (= lt!286889 e!355960)))

(declare-fun c!70720 () Bool)

(assert (=> b!620643 (= c!70720 (bvslt index!984 j!136))))

(declare-fun lt!286886 () Unit!20648)

(assert (=> b!620643 (= lt!286886 e!355956)))

(assert (=> b!620643 false))

(declare-fun b!620644 () Bool)

(assert (=> b!620644 false))

(declare-fun lt!286883 () Unit!20648)

(assert (=> b!620644 (= lt!286883 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286880 (select (arr!18052 a!2986) j!136) j!136 Nil!12090))))

(assert (=> b!620644 (arrayNoDuplicates!0 lt!286880 j!136 Nil!12090)))

(declare-fun lt!286888 () Unit!20648)

(assert (=> b!620644 (= lt!286888 (lemmaNoDuplicateFromThenFromBigger!0 lt!286880 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620644 (arrayNoDuplicates!0 lt!286880 #b00000000000000000000000000000000 Nil!12090)))

(declare-fun lt!286895 () Unit!20648)

(assert (=> b!620644 (= lt!286895 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12090))))

(assert (=> b!620644 (arrayContainsKey!0 lt!286880 (select (arr!18052 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286882 () Unit!20648)

(assert (=> b!620644 (= lt!286882 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286880 (select (arr!18052 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20656 () Unit!20648)

(assert (=> b!620644 (= e!355960 Unit!20656)))

(declare-fun b!620631 () Bool)

(declare-fun res!399937 () Bool)

(assert (=> b!620631 (=> (not res!399937) (not e!355964))))

(assert (=> b!620631 (= res!399937 (validKeyInArray!0 (select (arr!18052 a!2986) j!136)))))

(declare-fun res!399935 () Bool)

(assert (=> start!56142 (=> (not res!399935) (not e!355964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56142 (= res!399935 (validMask!0 mask!3053))))

(assert (=> start!56142 e!355964))

(assert (=> start!56142 true))

(declare-fun array_inv!13848 (array!37612) Bool)

(assert (=> start!56142 (array_inv!13848 a!2986)))

(declare-fun b!620645 () Bool)

(declare-fun res!399938 () Bool)

(assert (=> b!620645 (=> (not res!399938) (not e!355967))))

(assert (=> b!620645 (= res!399938 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18052 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620646 () Bool)

(assert (=> b!620646 (= e!355963 (arrayContainsKey!0 lt!286880 (select (arr!18052 a!2986) j!136) index!984))))

(declare-fun b!620647 () Bool)

(declare-fun Unit!20657 () Unit!20648)

(assert (=> b!620647 (= e!355965 Unit!20657)))

(declare-fun b!620648 () Bool)

(assert (=> b!620648 (= e!355959 (= lt!286897 lt!286881))))

(assert (= (and start!56142 res!399935) b!620636))

(assert (= (and b!620636 res!399933) b!620631))

(assert (= (and b!620631 res!399937) b!620638))

(assert (= (and b!620638 res!399926) b!620626))

(assert (= (and b!620626 res!399927) b!620641))

(assert (= (and b!620641 res!399928) b!620625))

(assert (= (and b!620625 res!399923) b!620635))

(assert (= (and b!620635 res!399929) b!620645))

(assert (= (and b!620645 res!399938) b!620629))

(assert (= (and b!620629 res!399925) b!620628))

(assert (= (and b!620628 res!399932) b!620630))

(assert (= (and b!620630 res!399936) b!620648))

(assert (= (and b!620630 c!70719) b!620632))

(assert (= (and b!620630 (not c!70719)) b!620647))

(assert (= (and b!620630 c!70718) b!620643))

(assert (= (and b!620630 (not c!70718)) b!620640))

(assert (= (and b!620643 res!399931) b!620627))

(assert (= (and b!620627 (not res!399924)) b!620639))

(assert (= (and b!620639 res!399930) b!620642))

(assert (= (and b!620643 c!70721) b!620644))

(assert (= (and b!620643 (not c!70721)) b!620634))

(assert (= (and b!620643 c!70720) b!620633))

(assert (= (and b!620643 (not c!70720)) b!620637))

(assert (= (and b!620633 res!399934) b!620646))

(declare-fun m!596541 () Bool)

(assert (=> b!620639 m!596541))

(assert (=> b!620639 m!596541))

(declare-fun m!596543 () Bool)

(assert (=> b!620639 m!596543))

(declare-fun m!596545 () Bool)

(assert (=> b!620626 m!596545))

(declare-fun m!596547 () Bool)

(assert (=> b!620625 m!596547))

(declare-fun m!596549 () Bool)

(assert (=> b!620628 m!596549))

(assert (=> b!620628 m!596541))

(assert (=> b!620628 m!596541))

(declare-fun m!596551 () Bool)

(assert (=> b!620628 m!596551))

(declare-fun m!596553 () Bool)

(assert (=> b!620638 m!596553))

(assert (=> b!620646 m!596541))

(assert (=> b!620646 m!596541))

(declare-fun m!596555 () Bool)

(assert (=> b!620646 m!596555))

(declare-fun m!596557 () Bool)

(assert (=> b!620645 m!596557))

(declare-fun m!596559 () Bool)

(assert (=> b!620629 m!596559))

(declare-fun m!596561 () Bool)

(assert (=> b!620629 m!596561))

(declare-fun m!596563 () Bool)

(assert (=> b!620633 m!596563))

(declare-fun m!596565 () Bool)

(assert (=> b!620633 m!596565))

(assert (=> b!620633 m!596541))

(assert (=> b!620633 m!596541))

(declare-fun m!596567 () Bool)

(assert (=> b!620633 m!596567))

(assert (=> b!620633 m!596541))

(declare-fun m!596569 () Bool)

(assert (=> b!620633 m!596569))

(assert (=> b!620633 m!596541))

(assert (=> b!620633 m!596543))

(assert (=> b!620633 m!596541))

(declare-fun m!596571 () Bool)

(assert (=> b!620633 m!596571))

(declare-fun m!596573 () Bool)

(assert (=> b!620633 m!596573))

(declare-fun m!596575 () Bool)

(assert (=> b!620633 m!596575))

(assert (=> b!620644 m!596541))

(declare-fun m!596577 () Bool)

(assert (=> b!620644 m!596577))

(assert (=> b!620644 m!596541))

(declare-fun m!596579 () Bool)

(assert (=> b!620644 m!596579))

(assert (=> b!620644 m!596541))

(declare-fun m!596581 () Bool)

(assert (=> b!620644 m!596581))

(assert (=> b!620644 m!596541))

(declare-fun m!596583 () Bool)

(assert (=> b!620644 m!596583))

(assert (=> b!620644 m!596573))

(declare-fun m!596585 () Bool)

(assert (=> b!620644 m!596585))

(assert (=> b!620644 m!596575))

(declare-fun m!596587 () Bool)

(assert (=> b!620635 m!596587))

(assert (=> b!620631 m!596541))

(assert (=> b!620631 m!596541))

(declare-fun m!596589 () Bool)

(assert (=> b!620631 m!596589))

(declare-fun m!596591 () Bool)

(assert (=> b!620630 m!596591))

(declare-fun m!596593 () Bool)

(assert (=> b!620630 m!596593))

(assert (=> b!620630 m!596541))

(declare-fun m!596595 () Bool)

(assert (=> b!620630 m!596595))

(assert (=> b!620630 m!596559))

(declare-fun m!596597 () Bool)

(assert (=> b!620630 m!596597))

(declare-fun m!596599 () Bool)

(assert (=> b!620630 m!596599))

(assert (=> b!620630 m!596541))

(declare-fun m!596601 () Bool)

(assert (=> b!620630 m!596601))

(assert (=> b!620642 m!596541))

(assert (=> b!620642 m!596541))

(assert (=> b!620642 m!596555))

(declare-fun m!596603 () Bool)

(assert (=> b!620641 m!596603))

(declare-fun m!596605 () Bool)

(assert (=> start!56142 m!596605))

(declare-fun m!596607 () Bool)

(assert (=> start!56142 m!596607))

(assert (=> b!620643 m!596559))

(declare-fun m!596609 () Bool)

(assert (=> b!620643 m!596609))

(assert (=> b!620643 m!596541))

(check-sat (not b!620642) (not b!620641) (not b!620635) (not b!620625) (not b!620631) (not b!620626) (not b!620630) (not start!56142) (not b!620639) (not b!620628) (not b!620644) (not b!620638) (not b!620633) (not b!620646))
(check-sat)
