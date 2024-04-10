; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55590 () Bool)

(assert start!55590)

(declare-fun b!609078 () Bool)

(declare-datatypes ((Unit!19486 0))(
  ( (Unit!19487) )
))
(declare-fun e!348823 () Unit!19486)

(declare-fun Unit!19488 () Unit!19486)

(assert (=> b!609078 (= e!348823 Unit!19488)))

(assert (=> b!609078 false))

(declare-fun b!609079 () Bool)

(declare-fun Unit!19489 () Unit!19486)

(assert (=> b!609079 (= e!348823 Unit!19489)))

(declare-fun b!609080 () Bool)

(declare-fun e!348825 () Unit!19486)

(declare-fun Unit!19490 () Unit!19486)

(assert (=> b!609080 (= e!348825 Unit!19490)))

(declare-fun b!609081 () Bool)

(declare-fun e!348829 () Bool)

(declare-fun e!348833 () Bool)

(assert (=> b!609081 (= e!348829 (not e!348833))))

(declare-fun res!391659 () Bool)

(assert (=> b!609081 (=> res!391659 e!348833)))

(declare-datatypes ((SeekEntryResult!6351 0))(
  ( (MissingZero!6351 (index!27679 (_ BitVec 32))) (Found!6351 (index!27680 (_ BitVec 32))) (Intermediate!6351 (undefined!7163 Bool) (index!27681 (_ BitVec 32)) (x!56484 (_ BitVec 32))) (Undefined!6351) (MissingVacant!6351 (index!27682 (_ BitVec 32))) )
))
(declare-fun lt!278357 () SeekEntryResult!6351)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609081 (= res!391659 (not (= lt!278357 (Found!6351 index!984))))))

(declare-fun lt!278356 () Unit!19486)

(assert (=> b!609081 (= lt!278356 e!348823)))

(declare-fun c!69079 () Bool)

(assert (=> b!609081 (= c!69079 (= lt!278357 Undefined!6351))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37321 0))(
  ( (array!37322 (arr!17911 (Array (_ BitVec 32) (_ BitVec 64))) (size!18275 (_ BitVec 32))) )
))
(declare-fun lt!278360 () array!37321)

(declare-fun lt!278363 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37321 (_ BitVec 32)) SeekEntryResult!6351)

(assert (=> b!609081 (= lt!278357 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278363 lt!278360 mask!3053))))

(declare-fun e!348828 () Bool)

(assert (=> b!609081 e!348828))

(declare-fun res!391673 () Bool)

(assert (=> b!609081 (=> (not res!391673) (not e!348828))))

(declare-fun lt!278368 () (_ BitVec 32))

(declare-fun lt!278369 () SeekEntryResult!6351)

(assert (=> b!609081 (= res!391673 (= lt!278369 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278368 vacantSpotIndex!68 lt!278363 lt!278360 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37321)

(assert (=> b!609081 (= lt!278369 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278368 vacantSpotIndex!68 (select (arr!17911 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!609081 (= lt!278363 (select (store (arr!17911 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278366 () Unit!19486)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19486)

(assert (=> b!609081 (= lt!278366 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278368 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609081 (= lt!278368 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609082 () Bool)

(declare-fun e!348835 () Bool)

(declare-fun e!348827 () Bool)

(assert (=> b!609082 (= e!348835 e!348827)))

(declare-fun res!391657 () Bool)

(assert (=> b!609082 (=> res!391657 e!348827)))

(assert (=> b!609082 (= res!391657 (bvsge index!984 j!136))))

(declare-fun lt!278359 () Unit!19486)

(assert (=> b!609082 (= lt!278359 e!348825)))

(declare-fun c!69080 () Bool)

(assert (=> b!609082 (= c!69080 (bvslt j!136 index!984))))

(declare-fun b!609083 () Bool)

(declare-fun e!348824 () Bool)

(assert (=> b!609083 (= e!348824 true)))

(declare-fun lt!278367 () Bool)

(declare-datatypes ((List!11952 0))(
  ( (Nil!11949) (Cons!11948 (h!12993 (_ BitVec 64)) (t!18180 List!11952)) )
))
(declare-fun contains!3028 (List!11952 (_ BitVec 64)) Bool)

(assert (=> b!609083 (= lt!278367 (contains!3028 Nil!11949 k0!1786))))

(declare-fun b!609084 () Bool)

(declare-fun res!391664 () Bool)

(assert (=> b!609084 (=> res!391664 e!348824)))

(declare-fun noDuplicate!334 (List!11952) Bool)

(assert (=> b!609084 (= res!391664 (not (noDuplicate!334 Nil!11949)))))

(declare-fun b!609085 () Bool)

(assert (=> b!609085 (= e!348827 e!348824)))

(declare-fun res!391675 () Bool)

(assert (=> b!609085 (=> res!391675 e!348824)))

(assert (=> b!609085 (= res!391675 (or (bvsge (size!18275 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18275 a!2986))))))

(declare-fun arrayContainsKey!0 (array!37321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609085 (arrayContainsKey!0 lt!278360 (select (arr!17911 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278364 () Unit!19486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37321 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19486)

(assert (=> b!609085 (= lt!278364 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278360 (select (arr!17911 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348830 () Bool)

(assert (=> b!609085 e!348830))

(declare-fun res!391662 () Bool)

(assert (=> b!609085 (=> (not res!391662) (not e!348830))))

(assert (=> b!609085 (= res!391662 (arrayContainsKey!0 lt!278360 (select (arr!17911 a!2986) j!136) j!136))))

(declare-fun b!609086 () Bool)

(declare-fun res!391666 () Bool)

(assert (=> b!609086 (=> res!391666 e!348824)))

(assert (=> b!609086 (= res!391666 (contains!3028 Nil!11949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609087 () Bool)

(declare-fun e!348832 () Bool)

(declare-fun e!348826 () Bool)

(assert (=> b!609087 (= e!348832 e!348826)))

(declare-fun res!391676 () Bool)

(assert (=> b!609087 (=> res!391676 e!348826)))

(declare-fun lt!278355 () (_ BitVec 64))

(assert (=> b!609087 (= res!391676 (or (not (= (select (arr!17911 a!2986) j!136) lt!278363)) (not (= (select (arr!17911 a!2986) j!136) lt!278355)) (bvsge j!136 index!984)))))

(declare-fun b!609089 () Bool)

(assert (=> b!609089 (= e!348833 e!348835)))

(declare-fun res!391665 () Bool)

(assert (=> b!609089 (=> res!391665 e!348835)))

(assert (=> b!609089 (= res!391665 (or (not (= (select (arr!17911 a!2986) j!136) lt!278363)) (not (= (select (arr!17911 a!2986) j!136) lt!278355))))))

(assert (=> b!609089 e!348832))

(declare-fun res!391668 () Bool)

(assert (=> b!609089 (=> (not res!391668) (not e!348832))))

(assert (=> b!609089 (= res!391668 (= lt!278355 (select (arr!17911 a!2986) j!136)))))

(assert (=> b!609089 (= lt!278355 (select (store (arr!17911 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609090 () Bool)

(declare-fun e!348834 () Bool)

(declare-fun e!348836 () Bool)

(assert (=> b!609090 (= e!348834 e!348836)))

(declare-fun res!391660 () Bool)

(assert (=> b!609090 (=> (not res!391660) (not e!348836))))

(declare-fun lt!278365 () SeekEntryResult!6351)

(assert (=> b!609090 (= res!391660 (or (= lt!278365 (MissingZero!6351 i!1108)) (= lt!278365 (MissingVacant!6351 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37321 (_ BitVec 32)) SeekEntryResult!6351)

(assert (=> b!609090 (= lt!278365 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609091 () Bool)

(declare-fun e!348822 () Bool)

(assert (=> b!609091 (= e!348822 (arrayContainsKey!0 lt!278360 (select (arr!17911 a!2986) j!136) index!984))))

(declare-fun b!609092 () Bool)

(assert (=> b!609092 (= e!348830 (arrayContainsKey!0 lt!278360 (select (arr!17911 a!2986) j!136) index!984))))

(declare-fun b!609093 () Bool)

(declare-fun res!391658 () Bool)

(assert (=> b!609093 (=> (not res!391658) (not e!348834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609093 (= res!391658 (validKeyInArray!0 k0!1786))))

(declare-fun b!609094 () Bool)

(declare-fun res!391669 () Bool)

(assert (=> b!609094 (=> (not res!391669) (not e!348834))))

(assert (=> b!609094 (= res!391669 (validKeyInArray!0 (select (arr!17911 a!2986) j!136)))))

(declare-fun b!609095 () Bool)

(declare-fun e!348837 () Bool)

(assert (=> b!609095 (= e!348836 e!348837)))

(declare-fun res!391667 () Bool)

(assert (=> b!609095 (=> (not res!391667) (not e!348837))))

(assert (=> b!609095 (= res!391667 (= (select (store (arr!17911 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609095 (= lt!278360 (array!37322 (store (arr!17911 a!2986) i!1108 k0!1786) (size!18275 a!2986)))))

(declare-fun b!609096 () Bool)

(declare-fun res!391661 () Bool)

(assert (=> b!609096 (=> (not res!391661) (not e!348834))))

(assert (=> b!609096 (= res!391661 (and (= (size!18275 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18275 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18275 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609097 () Bool)

(assert (=> b!609097 (= e!348837 e!348829)))

(declare-fun res!391670 () Bool)

(assert (=> b!609097 (=> (not res!391670) (not e!348829))))

(declare-fun lt!278362 () SeekEntryResult!6351)

(assert (=> b!609097 (= res!391670 (and (= lt!278362 (Found!6351 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17911 a!2986) index!984) (select (arr!17911 a!2986) j!136))) (not (= (select (arr!17911 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!609097 (= lt!278362 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17911 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609088 () Bool)

(declare-fun res!391672 () Bool)

(assert (=> b!609088 (=> (not res!391672) (not e!348836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37321 (_ BitVec 32)) Bool)

(assert (=> b!609088 (= res!391672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!391674 () Bool)

(assert (=> start!55590 (=> (not res!391674) (not e!348834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55590 (= res!391674 (validMask!0 mask!3053))))

(assert (=> start!55590 e!348834))

(assert (=> start!55590 true))

(declare-fun array_inv!13707 (array!37321) Bool)

(assert (=> start!55590 (array_inv!13707 a!2986)))

(declare-fun b!609098 () Bool)

(declare-fun res!391663 () Bool)

(assert (=> b!609098 (=> (not res!391663) (not e!348836))))

(declare-fun arrayNoDuplicates!0 (array!37321 (_ BitVec 32) List!11952) Bool)

(assert (=> b!609098 (= res!391663 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11949))))

(declare-fun b!609099 () Bool)

(declare-fun res!391655 () Bool)

(assert (=> b!609099 (=> (not res!391655) (not e!348836))))

(assert (=> b!609099 (= res!391655 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17911 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609100 () Bool)

(declare-fun res!391656 () Bool)

(assert (=> b!609100 (=> (not res!391656) (not e!348834))))

(assert (=> b!609100 (= res!391656 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609101 () Bool)

(assert (=> b!609101 (= e!348826 e!348822)))

(declare-fun res!391654 () Bool)

(assert (=> b!609101 (=> (not res!391654) (not e!348822))))

(assert (=> b!609101 (= res!391654 (arrayContainsKey!0 lt!278360 (select (arr!17911 a!2986) j!136) j!136))))

(declare-fun b!609102 () Bool)

(declare-fun Unit!19491 () Unit!19486)

(assert (=> b!609102 (= e!348825 Unit!19491)))

(declare-fun lt!278358 () Unit!19486)

(assert (=> b!609102 (= lt!278358 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278360 (select (arr!17911 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609102 (arrayContainsKey!0 lt!278360 (select (arr!17911 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278371 () Unit!19486)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37321 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11952) Unit!19486)

(assert (=> b!609102 (= lt!278371 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11949))))

(assert (=> b!609102 (arrayNoDuplicates!0 lt!278360 #b00000000000000000000000000000000 Nil!11949)))

(declare-fun lt!278370 () Unit!19486)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37321 (_ BitVec 32) (_ BitVec 32)) Unit!19486)

(assert (=> b!609102 (= lt!278370 (lemmaNoDuplicateFromThenFromBigger!0 lt!278360 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609102 (arrayNoDuplicates!0 lt!278360 j!136 Nil!11949)))

(declare-fun lt!278361 () Unit!19486)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37321 (_ BitVec 64) (_ BitVec 32) List!11952) Unit!19486)

(assert (=> b!609102 (= lt!278361 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278360 (select (arr!17911 a!2986) j!136) j!136 Nil!11949))))

(assert (=> b!609102 false))

(declare-fun b!609103 () Bool)

(assert (=> b!609103 (= e!348828 (= lt!278362 lt!278369))))

(declare-fun b!609104 () Bool)

(declare-fun res!391671 () Bool)

(assert (=> b!609104 (=> res!391671 e!348824)))

(assert (=> b!609104 (= res!391671 (contains!3028 Nil!11949 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!55590 res!391674) b!609096))

(assert (= (and b!609096 res!391661) b!609094))

(assert (= (and b!609094 res!391669) b!609093))

(assert (= (and b!609093 res!391658) b!609100))

(assert (= (and b!609100 res!391656) b!609090))

(assert (= (and b!609090 res!391660) b!609088))

(assert (= (and b!609088 res!391672) b!609098))

(assert (= (and b!609098 res!391663) b!609099))

(assert (= (and b!609099 res!391655) b!609095))

(assert (= (and b!609095 res!391667) b!609097))

(assert (= (and b!609097 res!391670) b!609081))

(assert (= (and b!609081 res!391673) b!609103))

(assert (= (and b!609081 c!69079) b!609078))

(assert (= (and b!609081 (not c!69079)) b!609079))

(assert (= (and b!609081 (not res!391659)) b!609089))

(assert (= (and b!609089 res!391668) b!609087))

(assert (= (and b!609087 (not res!391676)) b!609101))

(assert (= (and b!609101 res!391654) b!609091))

(assert (= (and b!609089 (not res!391665)) b!609082))

(assert (= (and b!609082 c!69080) b!609102))

(assert (= (and b!609082 (not c!69080)) b!609080))

(assert (= (and b!609082 (not res!391657)) b!609085))

(assert (= (and b!609085 res!391662) b!609092))

(assert (= (and b!609085 (not res!391675)) b!609084))

(assert (= (and b!609084 (not res!391664)) b!609086))

(assert (= (and b!609086 (not res!391666)) b!609104))

(assert (= (and b!609104 (not res!391671)) b!609083))

(declare-fun m!585635 () Bool)

(assert (=> b!609084 m!585635))

(declare-fun m!585637 () Bool)

(assert (=> b!609091 m!585637))

(assert (=> b!609091 m!585637))

(declare-fun m!585639 () Bool)

(assert (=> b!609091 m!585639))

(declare-fun m!585641 () Bool)

(assert (=> start!55590 m!585641))

(declare-fun m!585643 () Bool)

(assert (=> start!55590 m!585643))

(declare-fun m!585645 () Bool)

(assert (=> b!609081 m!585645))

(declare-fun m!585647 () Bool)

(assert (=> b!609081 m!585647))

(assert (=> b!609081 m!585637))

(assert (=> b!609081 m!585637))

(declare-fun m!585649 () Bool)

(assert (=> b!609081 m!585649))

(declare-fun m!585651 () Bool)

(assert (=> b!609081 m!585651))

(declare-fun m!585653 () Bool)

(assert (=> b!609081 m!585653))

(declare-fun m!585655 () Bool)

(assert (=> b!609081 m!585655))

(declare-fun m!585657 () Bool)

(assert (=> b!609081 m!585657))

(declare-fun m!585659 () Bool)

(assert (=> b!609099 m!585659))

(declare-fun m!585661 () Bool)

(assert (=> b!609098 m!585661))

(declare-fun m!585663 () Bool)

(assert (=> b!609093 m!585663))

(assert (=> b!609102 m!585637))

(declare-fun m!585665 () Bool)

(assert (=> b!609102 m!585665))

(assert (=> b!609102 m!585637))

(assert (=> b!609102 m!585637))

(declare-fun m!585667 () Bool)

(assert (=> b!609102 m!585667))

(declare-fun m!585669 () Bool)

(assert (=> b!609102 m!585669))

(assert (=> b!609102 m!585637))

(declare-fun m!585671 () Bool)

(assert (=> b!609102 m!585671))

(declare-fun m!585673 () Bool)

(assert (=> b!609102 m!585673))

(declare-fun m!585675 () Bool)

(assert (=> b!609102 m!585675))

(declare-fun m!585677 () Bool)

(assert (=> b!609102 m!585677))

(declare-fun m!585679 () Bool)

(assert (=> b!609083 m!585679))

(declare-fun m!585681 () Bool)

(assert (=> b!609097 m!585681))

(assert (=> b!609097 m!585637))

(assert (=> b!609097 m!585637))

(declare-fun m!585683 () Bool)

(assert (=> b!609097 m!585683))

(declare-fun m!585685 () Bool)

(assert (=> b!609086 m!585685))

(declare-fun m!585687 () Bool)

(assert (=> b!609088 m!585687))

(assert (=> b!609092 m!585637))

(assert (=> b!609092 m!585637))

(assert (=> b!609092 m!585639))

(assert (=> b!609095 m!585651))

(declare-fun m!585689 () Bool)

(assert (=> b!609095 m!585689))

(declare-fun m!585691 () Bool)

(assert (=> b!609100 m!585691))

(assert (=> b!609094 m!585637))

(assert (=> b!609094 m!585637))

(declare-fun m!585693 () Bool)

(assert (=> b!609094 m!585693))

(declare-fun m!585695 () Bool)

(assert (=> b!609104 m!585695))

(declare-fun m!585697 () Bool)

(assert (=> b!609090 m!585697))

(assert (=> b!609089 m!585637))

(assert (=> b!609089 m!585651))

(declare-fun m!585699 () Bool)

(assert (=> b!609089 m!585699))

(assert (=> b!609087 m!585637))

(assert (=> b!609085 m!585637))

(assert (=> b!609085 m!585637))

(declare-fun m!585701 () Bool)

(assert (=> b!609085 m!585701))

(assert (=> b!609085 m!585637))

(declare-fun m!585703 () Bool)

(assert (=> b!609085 m!585703))

(assert (=> b!609085 m!585637))

(declare-fun m!585705 () Bool)

(assert (=> b!609085 m!585705))

(assert (=> b!609101 m!585637))

(assert (=> b!609101 m!585637))

(assert (=> b!609101 m!585705))

(check-sat (not b!609085) (not b!609086) (not b!609094) (not b!609104) (not b!609100) (not b!609083) (not b!609081) (not b!609090) (not b!609101) (not start!55590) (not b!609084) (not b!609088) (not b!609098) (not b!609097) (not b!609091) (not b!609092) (not b!609093) (not b!609102))
(check-sat)
