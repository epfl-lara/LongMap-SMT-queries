; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55160 () Bool)

(assert start!55160)

(declare-fun b!604720 () Bool)

(declare-fun e!346046 () Bool)

(declare-fun e!346042 () Bool)

(assert (=> b!604720 (= e!346046 e!346042)))

(declare-fun res!388607 () Bool)

(assert (=> b!604720 (=> (not res!388607) (not e!346042))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37233 0))(
  ( (array!37234 (arr!17873 (Array (_ BitVec 32) (_ BitVec 64))) (size!18237 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37233)

(assert (=> b!604720 (= res!388607 (= (select (store (arr!17873 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!275862 () array!37233)

(assert (=> b!604720 (= lt!275862 (array!37234 (store (arr!17873 a!2986) i!1108 k!1786) (size!18237 a!2986)))))

(declare-fun b!604721 () Bool)

(declare-fun res!388595 () Bool)

(declare-fun e!346047 () Bool)

(assert (=> b!604721 (=> (not res!388595) (not e!346047))))

(declare-fun arrayContainsKey!0 (array!37233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604721 (= res!388595 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604722 () Bool)

(declare-fun e!346039 () Bool)

(declare-fun e!346048 () Bool)

(assert (=> b!604722 (= e!346039 e!346048)))

(declare-fun res!388608 () Bool)

(assert (=> b!604722 (=> res!388608 e!346048)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!604722 (= res!388608 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19258 0))(
  ( (Unit!19259) )
))
(declare-fun lt!275869 () Unit!19258)

(declare-fun e!346036 () Unit!19258)

(assert (=> b!604722 (= lt!275869 e!346036)))

(declare-fun c!68431 () Bool)

(assert (=> b!604722 (= c!68431 (bvslt j!136 index!984))))

(declare-fun b!604723 () Bool)

(declare-fun e!346038 () Bool)

(assert (=> b!604723 (= e!346038 e!346039)))

(declare-fun res!388594 () Bool)

(assert (=> b!604723 (=> res!388594 e!346039)))

(declare-fun lt!275866 () (_ BitVec 64))

(declare-fun lt!275859 () (_ BitVec 64))

(assert (=> b!604723 (= res!388594 (or (not (= (select (arr!17873 a!2986) j!136) lt!275859)) (not (= (select (arr!17873 a!2986) j!136) lt!275866))))))

(declare-fun e!346049 () Bool)

(assert (=> b!604723 e!346049))

(declare-fun res!388598 () Bool)

(assert (=> b!604723 (=> (not res!388598) (not e!346049))))

(assert (=> b!604723 (= res!388598 (= lt!275866 (select (arr!17873 a!2986) j!136)))))

(assert (=> b!604723 (= lt!275866 (select (store (arr!17873 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!604725 () Bool)

(declare-fun e!346045 () Bool)

(assert (=> b!604725 (= e!346049 e!346045)))

(declare-fun res!388602 () Bool)

(assert (=> b!604725 (=> res!388602 e!346045)))

(assert (=> b!604725 (= res!388602 (or (not (= (select (arr!17873 a!2986) j!136) lt!275859)) (not (= (select (arr!17873 a!2986) j!136) lt!275866)) (bvsge j!136 index!984)))))

(declare-fun b!604726 () Bool)

(declare-fun e!346037 () Unit!19258)

(declare-fun Unit!19260 () Unit!19258)

(assert (=> b!604726 (= e!346037 Unit!19260)))

(declare-fun b!604727 () Bool)

(declare-fun e!346044 () Bool)

(assert (=> b!604727 (= e!346044 (not e!346038))))

(declare-fun res!388603 () Bool)

(assert (=> b!604727 (=> res!388603 e!346038)))

(declare-datatypes ((SeekEntryResult!6313 0))(
  ( (MissingZero!6313 (index!27515 (_ BitVec 32))) (Found!6313 (index!27516 (_ BitVec 32))) (Intermediate!6313 (undefined!7125 Bool) (index!27517 (_ BitVec 32)) (x!56306 (_ BitVec 32))) (Undefined!6313) (MissingVacant!6313 (index!27518 (_ BitVec 32))) )
))
(declare-fun lt!275864 () SeekEntryResult!6313)

(assert (=> b!604727 (= res!388603 (not (= lt!275864 (Found!6313 index!984))))))

(declare-fun lt!275858 () Unit!19258)

(assert (=> b!604727 (= lt!275858 e!346037)))

(declare-fun c!68432 () Bool)

(assert (=> b!604727 (= c!68432 (= lt!275864 Undefined!6313))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37233 (_ BitVec 32)) SeekEntryResult!6313)

(assert (=> b!604727 (= lt!275864 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275859 lt!275862 mask!3053))))

(declare-fun e!346040 () Bool)

(assert (=> b!604727 e!346040))

(declare-fun res!388606 () Bool)

(assert (=> b!604727 (=> (not res!388606) (not e!346040))))

(declare-fun lt!275855 () SeekEntryResult!6313)

(declare-fun lt!275865 () (_ BitVec 32))

(assert (=> b!604727 (= res!388606 (= lt!275855 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275865 vacantSpotIndex!68 lt!275859 lt!275862 mask!3053)))))

(assert (=> b!604727 (= lt!275855 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275865 vacantSpotIndex!68 (select (arr!17873 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604727 (= lt!275859 (select (store (arr!17873 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275860 () Unit!19258)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19258)

(assert (=> b!604727 (= lt!275860 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275865 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604727 (= lt!275865 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604728 () Bool)

(declare-fun e!346043 () Bool)

(assert (=> b!604728 (= e!346045 e!346043)))

(declare-fun res!388597 () Bool)

(assert (=> b!604728 (=> (not res!388597) (not e!346043))))

(assert (=> b!604728 (= res!388597 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) j!136))))

(declare-fun b!604729 () Bool)

(declare-fun res!388610 () Bool)

(assert (=> b!604729 (=> (not res!388610) (not e!346046))))

(declare-datatypes ((List!11914 0))(
  ( (Nil!11911) (Cons!11910 (h!12955 (_ BitVec 64)) (t!18142 List!11914)) )
))
(declare-fun arrayNoDuplicates!0 (array!37233 (_ BitVec 32) List!11914) Bool)

(assert (=> b!604729 (= res!388610 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11911))))

(declare-fun b!604730 () Bool)

(declare-fun Unit!19261 () Unit!19258)

(assert (=> b!604730 (= e!346037 Unit!19261)))

(assert (=> b!604730 false))

(declare-fun b!604731 () Bool)

(declare-fun res!388605 () Bool)

(assert (=> b!604731 (=> (not res!388605) (not e!346047))))

(assert (=> b!604731 (= res!388605 (and (= (size!18237 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18237 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18237 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604732 () Bool)

(assert (=> b!604732 (= e!346047 e!346046)))

(declare-fun res!388600 () Bool)

(assert (=> b!604732 (=> (not res!388600) (not e!346046))))

(declare-fun lt!275861 () SeekEntryResult!6313)

(assert (=> b!604732 (= res!388600 (or (= lt!275861 (MissingZero!6313 i!1108)) (= lt!275861 (MissingVacant!6313 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37233 (_ BitVec 32)) SeekEntryResult!6313)

(assert (=> b!604732 (= lt!275861 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!604733 () Bool)

(declare-fun lt!275854 () SeekEntryResult!6313)

(assert (=> b!604733 (= e!346040 (= lt!275854 lt!275855))))

(declare-fun b!604734 () Bool)

(assert (=> b!604734 (= e!346048 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18237 a!2986)) (bvslt (size!18237 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!604734 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275867 () Unit!19258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37233 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19258)

(assert (=> b!604734 (= lt!275867 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275862 (select (arr!17873 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!346041 () Bool)

(assert (=> b!604734 e!346041))

(declare-fun res!388593 () Bool)

(assert (=> b!604734 (=> (not res!388593) (not e!346041))))

(assert (=> b!604734 (= res!388593 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) j!136))))

(declare-fun b!604735 () Bool)

(declare-fun Unit!19262 () Unit!19258)

(assert (=> b!604735 (= e!346036 Unit!19262)))

(declare-fun b!604736 () Bool)

(declare-fun res!388592 () Bool)

(assert (=> b!604736 (=> (not res!388592) (not e!346046))))

(assert (=> b!604736 (= res!388592 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17873 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604737 () Bool)

(assert (=> b!604737 (= e!346043 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) index!984))))

(declare-fun b!604738 () Bool)

(declare-fun res!388599 () Bool)

(assert (=> b!604738 (=> (not res!388599) (not e!346046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37233 (_ BitVec 32)) Bool)

(assert (=> b!604738 (= res!388599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604724 () Bool)

(declare-fun Unit!19263 () Unit!19258)

(assert (=> b!604724 (= e!346036 Unit!19263)))

(declare-fun lt!275857 () Unit!19258)

(assert (=> b!604724 (= lt!275857 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275862 (select (arr!17873 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604724 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275868 () Unit!19258)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37233 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11914) Unit!19258)

(assert (=> b!604724 (= lt!275868 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11911))))

(assert (=> b!604724 (arrayNoDuplicates!0 lt!275862 #b00000000000000000000000000000000 Nil!11911)))

(declare-fun lt!275856 () Unit!19258)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37233 (_ BitVec 32) (_ BitVec 32)) Unit!19258)

(assert (=> b!604724 (= lt!275856 (lemmaNoDuplicateFromThenFromBigger!0 lt!275862 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604724 (arrayNoDuplicates!0 lt!275862 j!136 Nil!11911)))

(declare-fun lt!275863 () Unit!19258)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37233 (_ BitVec 64) (_ BitVec 32) List!11914) Unit!19258)

(assert (=> b!604724 (= lt!275863 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275862 (select (arr!17873 a!2986) j!136) j!136 Nil!11911))))

(assert (=> b!604724 false))

(declare-fun res!388609 () Bool)

(assert (=> start!55160 (=> (not res!388609) (not e!346047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55160 (= res!388609 (validMask!0 mask!3053))))

(assert (=> start!55160 e!346047))

(assert (=> start!55160 true))

(declare-fun array_inv!13669 (array!37233) Bool)

(assert (=> start!55160 (array_inv!13669 a!2986)))

(declare-fun b!604739 () Bool)

(assert (=> b!604739 (= e!346042 e!346044)))

(declare-fun res!388604 () Bool)

(assert (=> b!604739 (=> (not res!388604) (not e!346044))))

(assert (=> b!604739 (= res!388604 (and (= lt!275854 (Found!6313 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17873 a!2986) index!984) (select (arr!17873 a!2986) j!136))) (not (= (select (arr!17873 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604739 (= lt!275854 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17873 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604740 () Bool)

(assert (=> b!604740 (= e!346041 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) index!984))))

(declare-fun b!604741 () Bool)

(declare-fun res!388596 () Bool)

(assert (=> b!604741 (=> (not res!388596) (not e!346047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604741 (= res!388596 (validKeyInArray!0 k!1786))))

(declare-fun b!604742 () Bool)

(declare-fun res!388601 () Bool)

(assert (=> b!604742 (=> (not res!388601) (not e!346047))))

(assert (=> b!604742 (= res!388601 (validKeyInArray!0 (select (arr!17873 a!2986) j!136)))))

(assert (= (and start!55160 res!388609) b!604731))

(assert (= (and b!604731 res!388605) b!604742))

(assert (= (and b!604742 res!388601) b!604741))

(assert (= (and b!604741 res!388596) b!604721))

(assert (= (and b!604721 res!388595) b!604732))

(assert (= (and b!604732 res!388600) b!604738))

(assert (= (and b!604738 res!388599) b!604729))

(assert (= (and b!604729 res!388610) b!604736))

(assert (= (and b!604736 res!388592) b!604720))

(assert (= (and b!604720 res!388607) b!604739))

(assert (= (and b!604739 res!388604) b!604727))

(assert (= (and b!604727 res!388606) b!604733))

(assert (= (and b!604727 c!68432) b!604730))

(assert (= (and b!604727 (not c!68432)) b!604726))

(assert (= (and b!604727 (not res!388603)) b!604723))

(assert (= (and b!604723 res!388598) b!604725))

(assert (= (and b!604725 (not res!388602)) b!604728))

(assert (= (and b!604728 res!388597) b!604737))

(assert (= (and b!604723 (not res!388594)) b!604722))

(assert (= (and b!604722 c!68431) b!604724))

(assert (= (and b!604722 (not c!68431)) b!604735))

(assert (= (and b!604722 (not res!388608)) b!604734))

(assert (= (and b!604734 res!388593) b!604740))

(declare-fun m!581605 () Bool)

(assert (=> b!604721 m!581605))

(declare-fun m!581607 () Bool)

(assert (=> b!604737 m!581607))

(assert (=> b!604737 m!581607))

(declare-fun m!581609 () Bool)

(assert (=> b!604737 m!581609))

(declare-fun m!581611 () Bool)

(assert (=> b!604729 m!581611))

(declare-fun m!581613 () Bool)

(assert (=> b!604727 m!581613))

(declare-fun m!581615 () Bool)

(assert (=> b!604727 m!581615))

(assert (=> b!604727 m!581607))

(declare-fun m!581617 () Bool)

(assert (=> b!604727 m!581617))

(assert (=> b!604727 m!581607))

(declare-fun m!581619 () Bool)

(assert (=> b!604727 m!581619))

(declare-fun m!581621 () Bool)

(assert (=> b!604727 m!581621))

(declare-fun m!581623 () Bool)

(assert (=> b!604727 m!581623))

(declare-fun m!581625 () Bool)

(assert (=> b!604727 m!581625))

(assert (=> b!604734 m!581607))

(assert (=> b!604734 m!581607))

(declare-fun m!581627 () Bool)

(assert (=> b!604734 m!581627))

(assert (=> b!604734 m!581607))

(declare-fun m!581629 () Bool)

(assert (=> b!604734 m!581629))

(assert (=> b!604734 m!581607))

(declare-fun m!581631 () Bool)

(assert (=> b!604734 m!581631))

(declare-fun m!581633 () Bool)

(assert (=> b!604732 m!581633))

(assert (=> b!604724 m!581607))

(declare-fun m!581635 () Bool)

(assert (=> b!604724 m!581635))

(assert (=> b!604724 m!581607))

(declare-fun m!581637 () Bool)

(assert (=> b!604724 m!581637))

(assert (=> b!604724 m!581607))

(declare-fun m!581639 () Bool)

(assert (=> b!604724 m!581639))

(declare-fun m!581641 () Bool)

(assert (=> b!604724 m!581641))

(declare-fun m!581643 () Bool)

(assert (=> b!604724 m!581643))

(assert (=> b!604724 m!581607))

(declare-fun m!581645 () Bool)

(assert (=> b!604724 m!581645))

(declare-fun m!581647 () Bool)

(assert (=> b!604724 m!581647))

(declare-fun m!581649 () Bool)

(assert (=> b!604736 m!581649))

(assert (=> b!604728 m!581607))

(assert (=> b!604728 m!581607))

(assert (=> b!604728 m!581631))

(assert (=> b!604740 m!581607))

(assert (=> b!604740 m!581607))

(assert (=> b!604740 m!581609))

(declare-fun m!581651 () Bool)

(assert (=> start!55160 m!581651))

(declare-fun m!581653 () Bool)

(assert (=> start!55160 m!581653))

(assert (=> b!604725 m!581607))

(declare-fun m!581655 () Bool)

(assert (=> b!604741 m!581655))

(declare-fun m!581657 () Bool)

(assert (=> b!604738 m!581657))

(assert (=> b!604742 m!581607))

(assert (=> b!604742 m!581607))

(declare-fun m!581659 () Bool)

(assert (=> b!604742 m!581659))

(declare-fun m!581661 () Bool)

(assert (=> b!604739 m!581661))

(assert (=> b!604739 m!581607))

(assert (=> b!604739 m!581607))

(declare-fun m!581663 () Bool)

(assert (=> b!604739 m!581663))

(assert (=> b!604720 m!581617))

(declare-fun m!581665 () Bool)

(assert (=> b!604720 m!581665))

(assert (=> b!604723 m!581607))

(assert (=> b!604723 m!581617))

(declare-fun m!581667 () Bool)

(assert (=> b!604723 m!581667))

(push 1)

(assert (not b!604732))

(assert (not start!55160))

(assert (not b!604738))

(assert (not b!604742))

(assert (not b!604734))

(assert (not b!604724))

(assert (not b!604741))

(assert (not b!604729))

(assert (not b!604727))

(assert (not b!604728))

(assert (not b!604737))

(assert (not b!604740))

(assert (not b!604721))

(assert (not b!604739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87447 () Bool)

(declare-fun res!388627 () Bool)

(declare-fun e!346076 () Bool)

(assert (=> d!87447 (=> res!388627 e!346076)))

(assert (=> d!87447 (= res!388627 (= (select (arr!17873 lt!275862) index!984) (select (arr!17873 a!2986) j!136)))))

(assert (=> d!87447 (= (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) index!984) e!346076)))

(declare-fun b!604777 () Bool)

(declare-fun e!346077 () Bool)

(assert (=> b!604777 (= e!346076 e!346077)))

(declare-fun res!388628 () Bool)

(assert (=> b!604777 (=> (not res!388628) (not e!346077))))

(assert (=> b!604777 (= res!388628 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18237 lt!275862)))))

(declare-fun b!604778 () Bool)

(assert (=> b!604778 (= e!346077 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87447 (not res!388627)) b!604777))

(assert (= (and b!604777 res!388628) b!604778))

(declare-fun m!581683 () Bool)

(assert (=> d!87447 m!581683))

(assert (=> b!604778 m!581607))

(declare-fun m!581685 () Bool)

(assert (=> b!604778 m!581685))

(assert (=> b!604737 d!87447))

(declare-fun d!87449 () Bool)

(declare-fun res!388629 () Bool)

(declare-fun e!346078 () Bool)

(assert (=> d!87449 (=> res!388629 e!346078)))

(assert (=> d!87449 (= res!388629 (= (select (arr!17873 lt!275862) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17873 a!2986) j!136)))))

(assert (=> d!87449 (= (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!346078)))

(declare-fun b!604779 () Bool)

(declare-fun e!346079 () Bool)

(assert (=> b!604779 (= e!346078 e!346079)))

(declare-fun res!388630 () Bool)

(assert (=> b!604779 (=> (not res!388630) (not e!346079))))

(assert (=> b!604779 (= res!388630 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18237 lt!275862)))))

(declare-fun b!604780 () Bool)

(assert (=> b!604780 (= e!346079 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87449 (not res!388629)) b!604779))

(assert (= (and b!604779 res!388630) b!604780))

(declare-fun m!581687 () Bool)

(assert (=> d!87449 m!581687))

(assert (=> b!604780 m!581607))

(declare-fun m!581689 () Bool)

(assert (=> b!604780 m!581689))

(assert (=> b!604724 d!87449))

(declare-fun d!87451 () Bool)

(assert (=> d!87451 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275886 () Unit!19258)

(declare-fun choose!114 (array!37233 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19258)

(assert (=> d!87451 (= lt!275886 (choose!114 lt!275862 (select (arr!17873 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87451 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87451 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275862 (select (arr!17873 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!275886)))

(declare-fun bs!18500 () Bool)

(assert (= bs!18500 d!87451))

(assert (=> bs!18500 m!581607))

(assert (=> bs!18500 m!581639))

(assert (=> bs!18500 m!581607))

(declare-fun m!581709 () Bool)

(assert (=> bs!18500 m!581709))

(assert (=> b!604724 d!87451))

(declare-fun d!87457 () Bool)

(assert (=> d!87457 (arrayNoDuplicates!0 lt!275862 j!136 Nil!11911)))

(declare-fun lt!275891 () Unit!19258)

(declare-fun choose!39 (array!37233 (_ BitVec 32) (_ BitVec 32)) Unit!19258)

(assert (=> d!87457 (= lt!275891 (choose!39 lt!275862 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87457 (bvslt (size!18237 lt!275862) #b01111111111111111111111111111111)))

(assert (=> d!87457 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!275862 #b00000000000000000000000000000000 j!136) lt!275891)))

(declare-fun bs!18501 () Bool)

(assert (= bs!18501 d!87457))

(assert (=> bs!18501 m!581647))

(declare-fun m!581719 () Bool)

(assert (=> bs!18501 m!581719))

(assert (=> b!604724 d!87457))

(declare-fun d!87463 () Bool)

(declare-fun res!388637 () Bool)

(declare-fun e!346099 () Bool)

(assert (=> d!87463 (=> res!388637 e!346099)))

(assert (=> d!87463 (= res!388637 (bvsge j!136 (size!18237 lt!275862)))))

(assert (=> d!87463 (= (arrayNoDuplicates!0 lt!275862 j!136 Nil!11911) e!346099)))

(declare-fun b!604809 () Bool)

(declare-fun e!346098 () Bool)

(declare-fun e!346100 () Bool)

(assert (=> b!604809 (= e!346098 e!346100)))

(declare-fun c!68453 () Bool)

(assert (=> b!604809 (= c!68453 (validKeyInArray!0 (select (arr!17873 lt!275862) j!136)))))

(declare-fun b!604810 () Bool)

(assert (=> b!604810 (= e!346099 e!346098)))

(declare-fun res!388638 () Bool)

(assert (=> b!604810 (=> (not res!388638) (not e!346098))))

(declare-fun e!346097 () Bool)

(assert (=> b!604810 (= res!388638 (not e!346097))))

(declare-fun res!388639 () Bool)

(assert (=> b!604810 (=> (not res!388639) (not e!346097))))

(assert (=> b!604810 (= res!388639 (validKeyInArray!0 (select (arr!17873 lt!275862) j!136)))))

(declare-fun b!604811 () Bool)

(declare-fun call!33020 () Bool)

(assert (=> b!604811 (= e!346100 call!33020)))

(declare-fun bm!33017 () Bool)

(assert (=> bm!33017 (= call!33020 (arrayNoDuplicates!0 lt!275862 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68453 (Cons!11910 (select (arr!17873 lt!275862) j!136) Nil!11911) Nil!11911)))))

(declare-fun b!604812 () Bool)

(assert (=> b!604812 (= e!346100 call!33020)))

(declare-fun b!604813 () Bool)

(declare-fun contains!2992 (List!11914 (_ BitVec 64)) Bool)

(assert (=> b!604813 (= e!346097 (contains!2992 Nil!11911 (select (arr!17873 lt!275862) j!136)))))

(assert (= (and d!87463 (not res!388637)) b!604810))

(assert (= (and b!604810 res!388639) b!604813))

(assert (= (and b!604810 res!388638) b!604809))

(assert (= (and b!604809 c!68453) b!604812))

(assert (= (and b!604809 (not c!68453)) b!604811))

(assert (= (or b!604812 b!604811) bm!33017))

(declare-fun m!581721 () Bool)

(assert (=> b!604809 m!581721))

(assert (=> b!604809 m!581721))

(declare-fun m!581723 () Bool)

(assert (=> b!604809 m!581723))

(assert (=> b!604810 m!581721))

(assert (=> b!604810 m!581721))

(assert (=> b!604810 m!581723))

(assert (=> bm!33017 m!581721))

(declare-fun m!581725 () Bool)

(assert (=> bm!33017 m!581725))

(assert (=> b!604813 m!581721))

(assert (=> b!604813 m!581721))

(declare-fun m!581727 () Bool)

(assert (=> b!604813 m!581727))

(assert (=> b!604724 d!87463))

(declare-fun d!87465 () Bool)

(declare-fun e!346103 () Bool)

(assert (=> d!87465 e!346103))

(declare-fun res!388642 () Bool)

(assert (=> d!87465 (=> (not res!388642) (not e!346103))))

(assert (=> d!87465 (= res!388642 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18237 a!2986))))))

(declare-fun lt!275894 () Unit!19258)

(declare-fun choose!41 (array!37233 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11914) Unit!19258)

(assert (=> d!87465 (= lt!275894 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11911))))

(assert (=> d!87465 (bvslt (size!18237 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87465 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11911) lt!275894)))

(declare-fun b!604816 () Bool)

(assert (=> b!604816 (= e!346103 (arrayNoDuplicates!0 (array!37234 (store (arr!17873 a!2986) i!1108 k!1786) (size!18237 a!2986)) #b00000000000000000000000000000000 Nil!11911))))

(assert (= (and d!87465 res!388642) b!604816))

(declare-fun m!581729 () Bool)

(assert (=> d!87465 m!581729))

(assert (=> b!604816 m!581617))

(declare-fun m!581731 () Bool)

(assert (=> b!604816 m!581731))

(assert (=> b!604724 d!87465))

(declare-fun d!87471 () Bool)

(assert (=> d!87471 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18237 lt!275862)) (not (= (select (arr!17873 lt!275862) j!136) (select (arr!17873 a!2986) j!136))))))

(declare-fun lt!275903 () Unit!19258)

(declare-fun choose!21 (array!37233 (_ BitVec 64) (_ BitVec 32) List!11914) Unit!19258)

(assert (=> d!87471 (= lt!275903 (choose!21 lt!275862 (select (arr!17873 a!2986) j!136) j!136 Nil!11911))))

(assert (=> d!87471 (bvslt (size!18237 lt!275862) #b01111111111111111111111111111111)))

(assert (=> d!87471 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275862 (select (arr!17873 a!2986) j!136) j!136 Nil!11911) lt!275903)))

(declare-fun bs!18502 () Bool)

(assert (= bs!18502 d!87471))

(assert (=> bs!18502 m!581721))

(assert (=> bs!18502 m!581607))

(declare-fun m!581733 () Bool)

(assert (=> bs!18502 m!581733))

(assert (=> b!604724 d!87471))

(declare-fun d!87473 () Bool)

(declare-fun res!388643 () Bool)

(declare-fun e!346112 () Bool)

(assert (=> d!87473 (=> res!388643 e!346112)))

(assert (=> d!87473 (= res!388643 (bvsge #b00000000000000000000000000000000 (size!18237 lt!275862)))))

(assert (=> d!87473 (= (arrayNoDuplicates!0 lt!275862 #b00000000000000000000000000000000 Nil!11911) e!346112)))

(declare-fun b!604829 () Bool)

(declare-fun e!346111 () Bool)

(declare-fun e!346113 () Bool)

(assert (=> b!604829 (= e!346111 e!346113)))

(declare-fun c!68460 () Bool)

(assert (=> b!604829 (= c!68460 (validKeyInArray!0 (select (arr!17873 lt!275862) #b00000000000000000000000000000000)))))

(declare-fun b!604830 () Bool)

(assert (=> b!604830 (= e!346112 e!346111)))

(declare-fun res!388644 () Bool)

(assert (=> b!604830 (=> (not res!388644) (not e!346111))))

(declare-fun e!346110 () Bool)

(assert (=> b!604830 (= res!388644 (not e!346110))))

(declare-fun res!388645 () Bool)

(assert (=> b!604830 (=> (not res!388645) (not e!346110))))

(assert (=> b!604830 (= res!388645 (validKeyInArray!0 (select (arr!17873 lt!275862) #b00000000000000000000000000000000)))))

(declare-fun b!604831 () Bool)

(declare-fun call!33021 () Bool)

(assert (=> b!604831 (= e!346113 call!33021)))

(declare-fun bm!33018 () Bool)

(assert (=> bm!33018 (= call!33021 (arrayNoDuplicates!0 lt!275862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68460 (Cons!11910 (select (arr!17873 lt!275862) #b00000000000000000000000000000000) Nil!11911) Nil!11911)))))

(declare-fun b!604832 () Bool)

(assert (=> b!604832 (= e!346113 call!33021)))

(declare-fun b!604833 () Bool)

(assert (=> b!604833 (= e!346110 (contains!2992 Nil!11911 (select (arr!17873 lt!275862) #b00000000000000000000000000000000)))))

(assert (= (and d!87473 (not res!388643)) b!604830))

(assert (= (and b!604830 res!388645) b!604833))

(assert (= (and b!604830 res!388644) b!604829))

(assert (= (and b!604829 c!68460) b!604832))

(assert (= (and b!604829 (not c!68460)) b!604831))

(assert (= (or b!604832 b!604831) bm!33018))

(declare-fun m!581735 () Bool)

(assert (=> b!604829 m!581735))

(assert (=> b!604829 m!581735))

(declare-fun m!581737 () Bool)

(assert (=> b!604829 m!581737))

(assert (=> b!604830 m!581735))

(assert (=> b!604830 m!581735))

(assert (=> b!604830 m!581737))

(assert (=> bm!33018 m!581735))

(declare-fun m!581739 () Bool)

(assert (=> bm!33018 m!581739))

(assert (=> b!604833 m!581735))

(assert (=> b!604833 m!581735))

(declare-fun m!581741 () Bool)

(assert (=> b!604833 m!581741))

(assert (=> b!604724 d!87473))

(declare-fun d!87475 () Bool)

(declare-fun res!388646 () Bool)

(declare-fun e!346114 () Bool)

(assert (=> d!87475 (=> res!388646 e!346114)))

(assert (=> d!87475 (= res!388646 (= (select (arr!17873 lt!275862) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17873 a!2986) j!136)))))

(assert (=> d!87475 (= (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346114)))

(declare-fun b!604834 () Bool)

(declare-fun e!346115 () Bool)

(assert (=> b!604834 (= e!346114 e!346115)))

(declare-fun res!388647 () Bool)

(assert (=> b!604834 (=> (not res!388647) (not e!346115))))

(assert (=> b!604834 (= res!388647 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18237 lt!275862)))))

(declare-fun b!604835 () Bool)

(assert (=> b!604835 (= e!346115 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87475 (not res!388646)) b!604834))

(assert (= (and b!604834 res!388647) b!604835))

(declare-fun m!581743 () Bool)

(assert (=> d!87475 m!581743))

(assert (=> b!604835 m!581607))

(declare-fun m!581745 () Bool)

(assert (=> b!604835 m!581745))

(assert (=> b!604734 d!87475))

(declare-fun d!87477 () Bool)

(assert (=> d!87477 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275904 () Unit!19258)

(assert (=> d!87477 (= lt!275904 (choose!114 lt!275862 (select (arr!17873 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87477 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87477 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275862 (select (arr!17873 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!275904)))

(declare-fun bs!18503 () Bool)

(assert (= bs!18503 d!87477))

(assert (=> bs!18503 m!581607))

(assert (=> bs!18503 m!581627))

(assert (=> bs!18503 m!581607))

(declare-fun m!581747 () Bool)

(assert (=> bs!18503 m!581747))

(assert (=> b!604734 d!87477))

(declare-fun d!87479 () Bool)

(declare-fun res!388648 () Bool)

(declare-fun e!346119 () Bool)

(assert (=> d!87479 (=> res!388648 e!346119)))

(assert (=> d!87479 (= res!388648 (= (select (arr!17873 lt!275862) j!136) (select (arr!17873 a!2986) j!136)))))

(assert (=> d!87479 (= (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) j!136) e!346119)))

(declare-fun b!604842 () Bool)

(declare-fun e!346120 () Bool)

(assert (=> b!604842 (= e!346119 e!346120)))

(declare-fun res!388649 () Bool)

(assert (=> b!604842 (=> (not res!388649) (not e!346120))))

(assert (=> b!604842 (= res!388649 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18237 lt!275862)))))

(declare-fun b!604843 () Bool)

(assert (=> b!604843 (= e!346120 (arrayContainsKey!0 lt!275862 (select (arr!17873 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87479 (not res!388648)) b!604842))

(assert (= (and b!604842 res!388649) b!604843))

(assert (=> d!87479 m!581721))

(assert (=> b!604843 m!581607))

(declare-fun m!581749 () Bool)

(assert (=> b!604843 m!581749))

(assert (=> b!604734 d!87479))

(declare-fun d!87481 () Bool)

(assert (=> d!87481 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604741 d!87481))

(declare-fun d!87485 () Bool)

(assert (=> d!87485 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55160 d!87485))

(declare-fun d!87495 () Bool)

(assert (=> d!87495 (= (array_inv!13669 a!2986) (bvsge (size!18237 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55160 d!87495))

(declare-fun d!87497 () Bool)

(declare-fun res!388664 () Bool)

(declare-fun e!346150 () Bool)

(assert (=> d!87497 (=> res!388664 e!346150)))

(assert (=> d!87497 (= res!388664 (= (select (arr!17873 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!87497 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!346150)))

(declare-fun b!604888 () Bool)

(declare-fun e!346151 () Bool)

(assert (=> b!604888 (= e!346150 e!346151)))

(declare-fun res!388665 () Bool)

(assert (=> b!604888 (=> (not res!388665) (not e!346151))))

(assert (=> b!604888 (= res!388665 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18237 a!2986)))))

(declare-fun b!604889 () Bool)

(assert (=> b!604889 (= e!346151 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87497 (not res!388664)) b!604888))

(assert (= (and b!604888 res!388665) b!604889))

(declare-fun m!581793 () Bool)

(assert (=> d!87497 m!581793))

(declare-fun m!581795 () Bool)

(assert (=> b!604889 m!581795))

(assert (=> b!604721 d!87497))

(declare-fun b!604947 () Bool)

(declare-fun e!346194 () SeekEntryResult!6313)

(declare-fun lt!275954 () SeekEntryResult!6313)

(assert (=> b!604947 (= e!346194 (MissingZero!6313 (index!27517 lt!275954)))))

(declare-fun b!604949 () Bool)

(declare-fun e!346192 () SeekEntryResult!6313)

(declare-fun e!346193 () SeekEntryResult!6313)

(assert (=> b!604949 (= e!346192 e!346193)))

(declare-fun lt!275955 () (_ BitVec 64))

(assert (=> b!604949 (= lt!275955 (select (arr!17873 a!2986) (index!27517 lt!275954)))))

(declare-fun c!68496 () Bool)

(assert (=> b!604949 (= c!68496 (= lt!275955 k!1786))))

(declare-fun b!604950 () Bool)

(assert (=> b!604950 (= e!346193 (Found!6313 (index!27517 lt!275954)))))

(declare-fun d!87501 () Bool)

(declare-fun lt!275953 () SeekEntryResult!6313)

(assert (=> d!87501 (and (or (is-Undefined!6313 lt!275953) (not (is-Found!6313 lt!275953)) (and (bvsge (index!27516 lt!275953) #b00000000000000000000000000000000) (bvslt (index!27516 lt!275953) (size!18237 a!2986)))) (or (is-Undefined!6313 lt!275953) (is-Found!6313 lt!275953) (not (is-MissingZero!6313 lt!275953)) (and (bvsge (index!27515 lt!275953) #b00000000000000000000000000000000) (bvslt (index!27515 lt!275953) (size!18237 a!2986)))) (or (is-Undefined!6313 lt!275953) (is-Found!6313 lt!275953) (is-MissingZero!6313 lt!275953) (not (is-MissingVacant!6313 lt!275953)) (and (bvsge (index!27518 lt!275953) #b00000000000000000000000000000000) (bvslt (index!27518 lt!275953) (size!18237 a!2986)))) (or (is-Undefined!6313 lt!275953) (ite (is-Found!6313 lt!275953) (= (select (arr!17873 a!2986) (index!27516 lt!275953)) k!1786) (ite (is-MissingZero!6313 lt!275953) (= (select (arr!17873 a!2986) (index!27515 lt!275953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6313 lt!275953) (= (select (arr!17873 a!2986) (index!27518 lt!275953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87501 (= lt!275953 e!346192)))

(declare-fun c!68497 () Bool)

(assert (=> d!87501 (= c!68497 (and (is-Intermediate!6313 lt!275954) (undefined!7125 lt!275954)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37233 (_ BitVec 32)) SeekEntryResult!6313)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87501 (= lt!275954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!87501 (validMask!0 mask!3053)))

(assert (=> d!87501 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!275953)))

(declare-fun b!604948 () Bool)

(declare-fun c!68498 () Bool)

(assert (=> b!604948 (= c!68498 (= lt!275955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604948 (= e!346193 e!346194)))

(declare-fun b!604951 () Bool)

(assert (=> b!604951 (= e!346192 Undefined!6313)))

(declare-fun b!604952 () Bool)

(assert (=> b!604952 (= e!346194 (seekKeyOrZeroReturnVacant!0 (x!56306 lt!275954) (index!27517 lt!275954) (index!27517 lt!275954) k!1786 a!2986 mask!3053))))

(assert (= (and d!87501 c!68497) b!604951))

(assert (= (and d!87501 (not c!68497)) b!604949))

(assert (= (and b!604949 c!68496) b!604950))

(assert (= (and b!604949 (not c!68496)) b!604948))

(assert (= (and b!604948 c!68498) b!604947))

(assert (= (and b!604948 (not c!68498)) b!604952))

(declare-fun m!581857 () Bool)

(assert (=> b!604949 m!581857))

(declare-fun m!581859 () Bool)

(assert (=> d!87501 m!581859))

(declare-fun m!581861 () Bool)

(assert (=> d!87501 m!581861))

(assert (=> d!87501 m!581861))

(declare-fun m!581863 () Bool)

(assert (=> d!87501 m!581863))

(assert (=> d!87501 m!581651))

(declare-fun m!581865 () Bool)

(assert (=> d!87501 m!581865))

(declare-fun m!581867 () Bool)

(assert (=> d!87501 m!581867))

(declare-fun m!581869 () Bool)

(assert (=> b!604952 m!581869))

(assert (=> b!604732 d!87501))

(declare-fun d!87527 () Bool)

(assert (=> d!87527 (= (validKeyInArray!0 (select (arr!17873 a!2986) j!136)) (and (not (= (select (arr!17873 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17873 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604742 d!87527))

(assert (=> b!604728 d!87479))

(declare-fun d!87529 () Bool)

(declare-fun lt!275958 () (_ BitVec 32))

(assert (=> d!87529 (and (bvsge lt!275958 #b00000000000000000000000000000000) (bvslt lt!275958 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87529 (= lt!275958 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87529 (validMask!0 mask!3053)))

(assert (=> d!87529 (= (nextIndex!0 index!984 x!910 mask!3053) lt!275958)))

(declare-fun bs!18508 () Bool)

(assert (= bs!18508 d!87529))

(declare-fun m!581873 () Bool)

(assert (=> bs!18508 m!581873))

(assert (=> bs!18508 m!581651))

(assert (=> b!604727 d!87529))

(declare-fun b!604979 () Bool)

(declare-fun e!346217 () SeekEntryResult!6313)

(declare-fun e!346216 () SeekEntryResult!6313)

(assert (=> b!604979 (= e!346217 e!346216)))

(declare-fun c!68507 () Bool)

(declare-fun lt!275968 () (_ BitVec 64))

(assert (=> b!604979 (= c!68507 (= lt!275968 lt!275859))))

(declare-fun b!604980 () Bool)

(declare-fun c!68505 () Bool)

(assert (=> b!604980 (= c!68505 (= lt!275968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346215 () SeekEntryResult!6313)

(assert (=> b!604980 (= e!346216 e!346215)))

(declare-fun b!604981 () Bool)

(assert (=> b!604981 (= e!346215 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!275859 lt!275862 mask!3053))))

(declare-fun b!604982 () Bool)

(assert (=> b!604982 (= e!346217 Undefined!6313)))

(declare-fun b!604983 () Bool)

(assert (=> b!604983 (= e!346216 (Found!6313 index!984))))

(declare-fun b!604984 () Bool)

(assert (=> b!604984 (= e!346215 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun d!87533 () Bool)

(declare-fun lt!275967 () SeekEntryResult!6313)

(assert (=> d!87533 (and (or (is-Undefined!6313 lt!275967) (not (is-Found!6313 lt!275967)) (and (bvsge (index!27516 lt!275967) #b00000000000000000000000000000000) (bvslt (index!27516 lt!275967) (size!18237 lt!275862)))) (or (is-Undefined!6313 lt!275967) (is-Found!6313 lt!275967) (not (is-MissingVacant!6313 lt!275967)) (not (= (index!27518 lt!275967) vacantSpotIndex!68)) (and (bvsge (index!27518 lt!275967) #b00000000000000000000000000000000) (bvslt (index!27518 lt!275967) (size!18237 lt!275862)))) (or (is-Undefined!6313 lt!275967) (ite (is-Found!6313 lt!275967) (= (select (arr!17873 lt!275862) (index!27516 lt!275967)) lt!275859) (and (is-MissingVacant!6313 lt!275967) (= (index!27518 lt!275967) vacantSpotIndex!68) (= (select (arr!17873 lt!275862) (index!27518 lt!275967)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87533 (= lt!275967 e!346217)))

(declare-fun c!68506 () Bool)

(assert (=> d!87533 (= c!68506 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87533 (= lt!275968 (select (arr!17873 lt!275862) index!984))))

(assert (=> d!87533 (validMask!0 mask!3053)))

(assert (=> d!87533 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275859 lt!275862 mask!3053) lt!275967)))

(assert (= (and d!87533 c!68506) b!604982))

(assert (= (and d!87533 (not c!68506)) b!604979))

(assert (= (and b!604979 c!68507) b!604983))

(assert (= (and b!604979 (not c!68507)) b!604980))

(assert (= (and b!604980 c!68505) b!604984))

(assert (= (and b!604980 (not c!68505)) b!604981))

(assert (=> b!604981 m!581613))

(assert (=> b!604981 m!581613))

(declare-fun m!581893 () Bool)

(assert (=> b!604981 m!581893))

(declare-fun m!581895 () Bool)

(assert (=> d!87533 m!581895))

(declare-fun m!581897 () Bool)

(assert (=> d!87533 m!581897))

(assert (=> d!87533 m!581683))

(assert (=> d!87533 m!581651))

(assert (=> b!604727 d!87533))

(declare-fun b!604985 () Bool)

(declare-fun e!346220 () SeekEntryResult!6313)

(declare-fun e!346219 () SeekEntryResult!6313)

(assert (=> b!604985 (= e!346220 e!346219)))

(declare-fun lt!275970 () (_ BitVec 64))

(declare-fun c!68510 () Bool)

(assert (=> b!604985 (= c!68510 (= lt!275970 (select (arr!17873 a!2986) j!136)))))

(declare-fun b!604986 () Bool)

(declare-fun c!68508 () Bool)

(assert (=> b!604986 (= c!68508 (= lt!275970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346218 () SeekEntryResult!6313)

(assert (=> b!604986 (= e!346219 e!346218)))

(declare-fun b!604987 () Bool)

(assert (=> b!604987 (= e!346218 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275865 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17873 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604988 () Bool)

(assert (=> b!604988 (= e!346220 Undefined!6313)))

(declare-fun b!604989 () Bool)

(assert (=> b!604989 (= e!346219 (Found!6313 lt!275865))))

(declare-fun b!604990 () Bool)

(assert (=> b!604990 (= e!346218 (MissingVacant!6313 vacantSpotIndex!68))))

(declare-fun d!87553 () Bool)

(declare-fun lt!275969 () SeekEntryResult!6313)

(assert (=> d!87553 (and (or (is-Undefined!6313 lt!275969) (not (is-Found!6313 lt!275969)) (and (bvsge (index!27516 lt!275969) #b00000000000000000000000000000000) (bvslt (index!27516 lt!275969) (size!18237 a!2986)))) (or (is-Undefined!6313 lt!275969) (is-Found!6313 lt!275969) (not (is-MissingVacant!6313 lt!275969)) (not (= (index!27518 lt!275969) vacantSpotIndex!68)) (and (bvsge (index!27518 lt!275969) #b00000000000000000000000000000000) (bvslt (index!27518 lt!275969) (size!18237 a!2986)))) (or (is-Undefined!6313 lt!275969) (ite (is-Found!6313 lt!275969) (= (select (arr!17873 a!2986) (index!27516 lt!275969)) (select (arr!17873 a!2986) j!136)) (and (is-MissingVacant!6313 lt!275969) (= (index!27518 lt!275969) vacantSpotIndex!68) (= (select (arr!17873 a!2986) (index!27518 lt!275969)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87553 (= lt!275969 e!346220)))

(declare-fun c!68509 () Bool)

(assert (=> d!87553 (= c!68509 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87553 (= lt!275970 (select (arr!17873 a!2986) lt!275865))))

(assert (=> d!87553 (validMask!0 mask!3053)))

(assert (=> d!87553 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275865 vacantSpotIndex!68 (select (arr!17873 a!2986) j!136) a!2986 mask!3053) lt!275969)))

(assert (= (and d!87553 c!68509) b!604988))

(assert (= (and d!87553 (not c!68509)) b!604985))

(assert (= (and b!604985 c!68510) b!604989))

(assert (= (and b!604985 (not c!68510)) b!604986))

(assert (= (and b!604986 c!68508) b!604990))

(assert (= (and b!604986 (not c!68508)) b!604987))

(declare-fun m!581899 () Bool)

(assert (=> b!604987 m!581899))

(assert (=> b!604987 m!581899))

(assert (=> b!604987 m!581607))

(declare-fun m!581901 () Bool)

(assert (=> b!604987 m!581901))

(declare-fun m!581903 () Bool)

(assert (=> d!87553 m!581903))

(declare-fun m!581905 () Bool)

(assert (=> d!87553 m!581905))

(declare-fun m!581907 () Bool)

(assert (=> d!87553 m!581907))

(assert (=> d!87553 m!581651))

(assert (=> b!604727 d!87553))

(declare-fun b!604991 () Bool)

(declare-fun e!346223 () SeekEntryResult!6313)

(declare-fun e!346222 () SeekEntryResult!6313)

(assert (=> b!604991 (= e!346223 e!346222)))

(declare-fun c!68513 () Bool)

(declare-fun lt!275972 () (_ BitVec 64))

(assert (=> b!604991 (= c!68513 (= lt!275972 lt!275859))))

(declare-fun b!604992 () Bool)

(declare-fun c!68511 () Bool)

(assert (=> b!604992 (= c!68511 (= lt!275972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346221 () SeekEntryResult!6313)

(assert (=> b!604992 (= e!346222 e!346221)))

(declare-fun b!604993 () Bool)

(assert (=> b!604993 (= e!346221 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275865 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!275859 lt!275862 mask!3053))))

