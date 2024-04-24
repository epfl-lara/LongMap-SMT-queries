; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56244 () Bool)

(assert start!56244)

(declare-fun b!622706 () Bool)

(declare-fun res!401287 () Bool)

(declare-fun e!357180 () Bool)

(assert (=> b!622706 (=> (not res!401287) (not e!357180))))

(declare-datatypes ((array!37659 0))(
  ( (array!37660 (arr!18073 (Array (_ BitVec 32) (_ BitVec 64))) (size!18437 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37659)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622706 (= res!401287 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!357185 () Bool)

(declare-fun b!622707 () Bool)

(declare-fun lt!288545 () array!37659)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622707 (= e!357185 (arrayContainsKey!0 lt!288545 (select (arr!18073 a!2986) j!136) index!984))))

(declare-fun b!622708 () Bool)

(declare-fun res!401279 () Bool)

(assert (=> b!622708 (=> (not res!401279) (not e!357180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622708 (= res!401279 (validKeyInArray!0 k0!1786))))

(declare-fun b!622709 () Bool)

(declare-datatypes ((Unit!20887 0))(
  ( (Unit!20888) )
))
(declare-fun e!357177 () Unit!20887)

(declare-fun Unit!20889 () Unit!20887)

(assert (=> b!622709 (= e!357177 Unit!20889)))

(declare-fun b!622710 () Bool)

(declare-fun res!401286 () Bool)

(declare-fun e!357184 () Bool)

(assert (=> b!622710 (=> (not res!401286) (not e!357184))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622710 (= res!401286 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18073 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622712 () Bool)

(declare-fun e!357179 () Unit!20887)

(declare-fun Unit!20890 () Unit!20887)

(assert (=> b!622712 (= e!357179 Unit!20890)))

(declare-fun b!622713 () Bool)

(declare-fun e!357176 () Bool)

(assert (=> b!622713 (= e!357184 e!357176)))

(declare-fun res!401276 () Bool)

(assert (=> b!622713 (=> (not res!401276) (not e!357176))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!622713 (= res!401276 (= (select (store (arr!18073 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622713 (= lt!288545 (array!37660 (store (arr!18073 a!2986) i!1108 k0!1786) (size!18437 a!2986)))))

(declare-fun b!622714 () Bool)

(declare-fun e!357186 () Unit!20887)

(declare-fun Unit!20891 () Unit!20887)

(assert (=> b!622714 (= e!357186 Unit!20891)))

(declare-fun res!401288 () Bool)

(assert (=> b!622714 (= res!401288 (= (select (store (arr!18073 a!2986) i!1108 k0!1786) index!984) (select (arr!18073 a!2986) j!136)))))

(declare-fun e!357183 () Bool)

(assert (=> b!622714 (=> (not res!401288) (not e!357183))))

(assert (=> b!622714 e!357183))

(declare-fun c!71086 () Bool)

(assert (=> b!622714 (= c!71086 (bvslt j!136 index!984))))

(declare-fun lt!288548 () Unit!20887)

(declare-fun e!357181 () Unit!20887)

(assert (=> b!622714 (= lt!288548 e!357181)))

(declare-fun c!71085 () Bool)

(assert (=> b!622714 (= c!71085 (bvslt index!984 j!136))))

(declare-fun lt!288542 () Unit!20887)

(assert (=> b!622714 (= lt!288542 e!357179)))

(assert (=> b!622714 false))

(declare-fun b!622715 () Bool)

(declare-fun e!357182 () Bool)

(declare-datatypes ((SeekEntryResult!6469 0))(
  ( (MissingZero!6469 (index!28160 (_ BitVec 32))) (Found!6469 (index!28161 (_ BitVec 32))) (Intermediate!6469 (undefined!7281 Bool) (index!28162 (_ BitVec 32)) (x!57080 (_ BitVec 32))) (Undefined!6469) (MissingVacant!6469 (index!28163 (_ BitVec 32))) )
))
(declare-fun lt!288549 () SeekEntryResult!6469)

(declare-fun lt!288553 () SeekEntryResult!6469)

(assert (=> b!622715 (= e!357182 (= lt!288549 lt!288553))))

(declare-fun b!622716 () Bool)

(declare-fun res!401281 () Bool)

(assert (=> b!622716 (= res!401281 (bvsge j!136 index!984))))

(declare-fun e!357189 () Bool)

(assert (=> b!622716 (=> res!401281 e!357189)))

(assert (=> b!622716 (= e!357183 e!357189)))

(declare-fun b!622717 () Bool)

(declare-fun e!357187 () Bool)

(assert (=> b!622717 (= e!357187 (arrayContainsKey!0 lt!288545 (select (arr!18073 a!2986) j!136) index!984))))

(declare-fun b!622718 () Bool)

(declare-fun e!357178 () Bool)

(assert (=> b!622718 (= e!357178 (not true))))

(declare-fun lt!288541 () Unit!20887)

(assert (=> b!622718 (= lt!288541 e!357186)))

(declare-fun c!71084 () Bool)

(declare-fun lt!288559 () SeekEntryResult!6469)

(assert (=> b!622718 (= c!71084 (= lt!288559 (Found!6469 index!984)))))

(declare-fun lt!288540 () Unit!20887)

(assert (=> b!622718 (= lt!288540 e!357177)))

(declare-fun c!71087 () Bool)

(assert (=> b!622718 (= c!71087 (= lt!288559 Undefined!6469))))

(declare-fun lt!288558 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37659 (_ BitVec 32)) SeekEntryResult!6469)

(assert (=> b!622718 (= lt!288559 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288558 lt!288545 mask!3053))))

(assert (=> b!622718 e!357182))

(declare-fun res!401289 () Bool)

(assert (=> b!622718 (=> (not res!401289) (not e!357182))))

(declare-fun lt!288547 () (_ BitVec 32))

(assert (=> b!622718 (= res!401289 (= lt!288553 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288547 vacantSpotIndex!68 lt!288558 lt!288545 mask!3053)))))

(assert (=> b!622718 (= lt!288553 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288547 vacantSpotIndex!68 (select (arr!18073 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622718 (= lt!288558 (select (store (arr!18073 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288556 () Unit!20887)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37659 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20887)

(assert (=> b!622718 (= lt!288556 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288547 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622718 (= lt!288547 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!622719 () Bool)

(declare-fun res!401282 () Bool)

(assert (=> b!622719 (= res!401282 (arrayContainsKey!0 lt!288545 (select (arr!18073 a!2986) j!136) j!136))))

(assert (=> b!622719 (=> (not res!401282) (not e!357187))))

(assert (=> b!622719 (= e!357189 e!357187)))

(declare-fun b!622720 () Bool)

(declare-fun res!401277 () Bool)

(assert (=> b!622720 (=> (not res!401277) (not e!357184))))

(declare-datatypes ((List!12021 0))(
  ( (Nil!12018) (Cons!12017 (h!13065 (_ BitVec 64)) (t!18241 List!12021)) )
))
(declare-fun arrayNoDuplicates!0 (array!37659 (_ BitVec 32) List!12021) Bool)

(assert (=> b!622720 (= res!401277 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12018))))

(declare-fun b!622721 () Bool)

(declare-fun res!401280 () Bool)

(assert (=> b!622721 (=> (not res!401280) (not e!357184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37659 (_ BitVec 32)) Bool)

(assert (=> b!622721 (= res!401280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622722 () Bool)

(declare-fun Unit!20892 () Unit!20887)

(assert (=> b!622722 (= e!357177 Unit!20892)))

(assert (=> b!622722 false))

(declare-fun b!622723 () Bool)

(assert (=> b!622723 false))

(declare-fun lt!288554 () Unit!20887)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37659 (_ BitVec 64) (_ BitVec 32) List!12021) Unit!20887)

(assert (=> b!622723 (= lt!288554 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288545 (select (arr!18073 a!2986) j!136) index!984 Nil!12018))))

(assert (=> b!622723 (arrayNoDuplicates!0 lt!288545 index!984 Nil!12018)))

(declare-fun lt!288550 () Unit!20887)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37659 (_ BitVec 32) (_ BitVec 32)) Unit!20887)

(assert (=> b!622723 (= lt!288550 (lemmaNoDuplicateFromThenFromBigger!0 lt!288545 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622723 (arrayNoDuplicates!0 lt!288545 #b00000000000000000000000000000000 Nil!12018)))

(declare-fun lt!288555 () Unit!20887)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37659 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12021) Unit!20887)

(assert (=> b!622723 (= lt!288555 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12018))))

(assert (=> b!622723 (arrayContainsKey!0 lt!288545 (select (arr!18073 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288546 () Unit!20887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37659 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20887)

(assert (=> b!622723 (= lt!288546 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288545 (select (arr!18073 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622723 e!357185))

(declare-fun res!401275 () Bool)

(assert (=> b!622723 (=> (not res!401275) (not e!357185))))

(assert (=> b!622723 (= res!401275 (arrayContainsKey!0 lt!288545 (select (arr!18073 a!2986) j!136) j!136))))

(declare-fun Unit!20893 () Unit!20887)

(assert (=> b!622723 (= e!357179 Unit!20893)))

(declare-fun res!401278 () Bool)

(assert (=> start!56244 (=> (not res!401278) (not e!357180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56244 (= res!401278 (validMask!0 mask!3053))))

(assert (=> start!56244 e!357180))

(assert (=> start!56244 true))

(declare-fun array_inv!13932 (array!37659) Bool)

(assert (=> start!56244 (array_inv!13932 a!2986)))

(declare-fun b!622711 () Bool)

(declare-fun res!401284 () Bool)

(assert (=> b!622711 (=> (not res!401284) (not e!357180))))

(assert (=> b!622711 (= res!401284 (and (= (size!18437 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18437 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18437 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622724 () Bool)

(assert (=> b!622724 (= e!357180 e!357184)))

(declare-fun res!401290 () Bool)

(assert (=> b!622724 (=> (not res!401290) (not e!357184))))

(declare-fun lt!288551 () SeekEntryResult!6469)

(assert (=> b!622724 (= res!401290 (or (= lt!288551 (MissingZero!6469 i!1108)) (= lt!288551 (MissingVacant!6469 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37659 (_ BitVec 32)) SeekEntryResult!6469)

(assert (=> b!622724 (= lt!288551 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622725 () Bool)

(assert (=> b!622725 (= e!357176 e!357178)))

(declare-fun res!401283 () Bool)

(assert (=> b!622725 (=> (not res!401283) (not e!357178))))

(assert (=> b!622725 (= res!401283 (and (= lt!288549 (Found!6469 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18073 a!2986) index!984) (select (arr!18073 a!2986) j!136))) (not (= (select (arr!18073 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622725 (= lt!288549 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18073 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622726 () Bool)

(declare-fun Unit!20894 () Unit!20887)

(assert (=> b!622726 (= e!357186 Unit!20894)))

(declare-fun b!622727 () Bool)

(declare-fun res!401285 () Bool)

(assert (=> b!622727 (=> (not res!401285) (not e!357180))))

(assert (=> b!622727 (= res!401285 (validKeyInArray!0 (select (arr!18073 a!2986) j!136)))))

(declare-fun b!622728 () Bool)

(assert (=> b!622728 false))

(declare-fun lt!288557 () Unit!20887)

(assert (=> b!622728 (= lt!288557 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288545 (select (arr!18073 a!2986) j!136) j!136 Nil!12018))))

(assert (=> b!622728 (arrayNoDuplicates!0 lt!288545 j!136 Nil!12018)))

(declare-fun lt!288543 () Unit!20887)

(assert (=> b!622728 (= lt!288543 (lemmaNoDuplicateFromThenFromBigger!0 lt!288545 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622728 (arrayNoDuplicates!0 lt!288545 #b00000000000000000000000000000000 Nil!12018)))

(declare-fun lt!288544 () Unit!20887)

(assert (=> b!622728 (= lt!288544 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12018))))

(assert (=> b!622728 (arrayContainsKey!0 lt!288545 (select (arr!18073 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288552 () Unit!20887)

(assert (=> b!622728 (= lt!288552 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288545 (select (arr!18073 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20895 () Unit!20887)

(assert (=> b!622728 (= e!357181 Unit!20895)))

(declare-fun b!622729 () Bool)

(declare-fun Unit!20896 () Unit!20887)

(assert (=> b!622729 (= e!357181 Unit!20896)))

(assert (= (and start!56244 res!401278) b!622711))

(assert (= (and b!622711 res!401284) b!622727))

(assert (= (and b!622727 res!401285) b!622708))

(assert (= (and b!622708 res!401279) b!622706))

(assert (= (and b!622706 res!401287) b!622724))

(assert (= (and b!622724 res!401290) b!622721))

(assert (= (and b!622721 res!401280) b!622720))

(assert (= (and b!622720 res!401277) b!622710))

(assert (= (and b!622710 res!401286) b!622713))

(assert (= (and b!622713 res!401276) b!622725))

(assert (= (and b!622725 res!401283) b!622718))

(assert (= (and b!622718 res!401289) b!622715))

(assert (= (and b!622718 c!71087) b!622722))

(assert (= (and b!622718 (not c!71087)) b!622709))

(assert (= (and b!622718 c!71084) b!622714))

(assert (= (and b!622718 (not c!71084)) b!622726))

(assert (= (and b!622714 res!401288) b!622716))

(assert (= (and b!622716 (not res!401281)) b!622719))

(assert (= (and b!622719 res!401282) b!622717))

(assert (= (and b!622714 c!71086) b!622728))

(assert (= (and b!622714 (not c!71086)) b!622729))

(assert (= (and b!622714 c!71085) b!622723))

(assert (= (and b!622714 (not c!71085)) b!622712))

(assert (= (and b!622723 res!401275) b!622707))

(declare-fun m!598847 () Bool)

(assert (=> b!622708 m!598847))

(declare-fun m!598849 () Bool)

(assert (=> start!56244 m!598849))

(declare-fun m!598851 () Bool)

(assert (=> start!56244 m!598851))

(declare-fun m!598853 () Bool)

(assert (=> b!622719 m!598853))

(assert (=> b!622719 m!598853))

(declare-fun m!598855 () Bool)

(assert (=> b!622719 m!598855))

(declare-fun m!598857 () Bool)

(assert (=> b!622706 m!598857))

(declare-fun m!598859 () Bool)

(assert (=> b!622713 m!598859))

(declare-fun m!598861 () Bool)

(assert (=> b!622713 m!598861))

(assert (=> b!622714 m!598859))

(declare-fun m!598863 () Bool)

(assert (=> b!622714 m!598863))

(assert (=> b!622714 m!598853))

(assert (=> b!622728 m!598853))

(declare-fun m!598865 () Bool)

(assert (=> b!622728 m!598865))

(assert (=> b!622728 m!598853))

(assert (=> b!622728 m!598853))

(declare-fun m!598867 () Bool)

(assert (=> b!622728 m!598867))

(declare-fun m!598869 () Bool)

(assert (=> b!622728 m!598869))

(declare-fun m!598871 () Bool)

(assert (=> b!622728 m!598871))

(assert (=> b!622728 m!598853))

(declare-fun m!598873 () Bool)

(assert (=> b!622728 m!598873))

(declare-fun m!598875 () Bool)

(assert (=> b!622728 m!598875))

(declare-fun m!598877 () Bool)

(assert (=> b!622728 m!598877))

(declare-fun m!598879 () Bool)

(assert (=> b!622720 m!598879))

(declare-fun m!598881 () Bool)

(assert (=> b!622718 m!598881))

(declare-fun m!598883 () Bool)

(assert (=> b!622718 m!598883))

(assert (=> b!622718 m!598853))

(assert (=> b!622718 m!598859))

(assert (=> b!622718 m!598853))

(declare-fun m!598885 () Bool)

(assert (=> b!622718 m!598885))

(declare-fun m!598887 () Bool)

(assert (=> b!622718 m!598887))

(declare-fun m!598889 () Bool)

(assert (=> b!622718 m!598889))

(declare-fun m!598891 () Bool)

(assert (=> b!622718 m!598891))

(assert (=> b!622707 m!598853))

(assert (=> b!622707 m!598853))

(declare-fun m!598893 () Bool)

(assert (=> b!622707 m!598893))

(declare-fun m!598895 () Bool)

(assert (=> b!622710 m!598895))

(declare-fun m!598897 () Bool)

(assert (=> b!622724 m!598897))

(declare-fun m!598899 () Bool)

(assert (=> b!622725 m!598899))

(assert (=> b!622725 m!598853))

(assert (=> b!622725 m!598853))

(declare-fun m!598901 () Bool)

(assert (=> b!622725 m!598901))

(declare-fun m!598903 () Bool)

(assert (=> b!622723 m!598903))

(assert (=> b!622723 m!598853))

(assert (=> b!622723 m!598855))

(assert (=> b!622723 m!598853))

(assert (=> b!622723 m!598869))

(assert (=> b!622723 m!598853))

(declare-fun m!598905 () Bool)

(assert (=> b!622723 m!598905))

(assert (=> b!622723 m!598853))

(declare-fun m!598907 () Bool)

(assert (=> b!622723 m!598907))

(assert (=> b!622723 m!598853))

(declare-fun m!598909 () Bool)

(assert (=> b!622723 m!598909))

(declare-fun m!598911 () Bool)

(assert (=> b!622723 m!598911))

(assert (=> b!622723 m!598877))

(declare-fun m!598913 () Bool)

(assert (=> b!622721 m!598913))

(assert (=> b!622727 m!598853))

(assert (=> b!622727 m!598853))

(declare-fun m!598915 () Bool)

(assert (=> b!622727 m!598915))

(assert (=> b!622717 m!598853))

(assert (=> b!622717 m!598853))

(assert (=> b!622717 m!598893))

(check-sat (not start!56244) (not b!622719) (not b!622728) (not b!622720) (not b!622707) (not b!622706) (not b!622708) (not b!622718) (not b!622721) (not b!622723) (not b!622717) (not b!622725) (not b!622724) (not b!622727))
(check-sat)
