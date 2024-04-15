; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56820 () Bool)

(assert start!56820)

(declare-fun b!629317 () Bool)

(declare-fun res!406854 () Bool)

(declare-fun e!359862 () Bool)

(assert (=> b!629317 (=> (not res!406854) (not e!359862))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629317 (= res!406854 (validKeyInArray!0 k0!1786))))

(declare-fun b!629318 () Bool)

(declare-fun res!406856 () Bool)

(declare-fun e!359860 () Bool)

(assert (=> b!629318 (=> (not res!406856) (not e!359860))))

(declare-datatypes ((array!38022 0))(
  ( (array!38023 (arr!18248 (Array (_ BitVec 32) (_ BitVec 64))) (size!18613 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38022)

(declare-datatypes ((List!12328 0))(
  ( (Nil!12325) (Cons!12324 (h!13369 (_ BitVec 64)) (t!18547 List!12328)) )
))
(declare-fun arrayNoDuplicates!0 (array!38022 (_ BitVec 32) List!12328) Bool)

(assert (=> b!629318 (= res!406856 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12325))))

(declare-fun b!629319 () Bool)

(declare-fun e!359859 () Bool)

(assert (=> b!629319 (= e!359860 e!359859)))

(declare-fun res!406861 () Bool)

(assert (=> b!629319 (=> (not res!406861) (not e!359859))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6685 0))(
  ( (MissingZero!6685 (index!29024 (_ BitVec 32))) (Found!6685 (index!29025 (_ BitVec 32))) (Intermediate!6685 (undefined!7497 Bool) (index!29026 (_ BitVec 32)) (x!57768 (_ BitVec 32))) (Undefined!6685) (MissingVacant!6685 (index!29027 (_ BitVec 32))) )
))
(declare-fun lt!290565 () SeekEntryResult!6685)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!629319 (= res!406861 (and (= lt!290565 (Found!6685 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18248 a!2986) index!984) (select (arr!18248 a!2986) j!136))) (not (= (select (arr!18248 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38022 (_ BitVec 32)) SeekEntryResult!6685)

(assert (=> b!629319 (= lt!290565 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629320 () Bool)

(declare-fun res!406857 () Bool)

(assert (=> b!629320 (=> (not res!406857) (not e!359862))))

(declare-fun arrayContainsKey!0 (array!38022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629320 (= res!406857 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629321 () Bool)

(declare-fun lt!290564 () SeekEntryResult!6685)

(assert (=> b!629321 (= e!359859 (not (= lt!290565 lt!290564)))))

(declare-fun lt!290566 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629321 (= lt!290564 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 (select (store (arr!18248 a!2986) i!1108 k0!1786) j!136) (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986)) mask!3053))))

(assert (=> b!629321 (= lt!290564 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21098 0))(
  ( (Unit!21099) )
))
(declare-fun lt!290563 () Unit!21098)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38022 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21098)

(assert (=> b!629321 (= lt!290563 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629321 (= lt!290566 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!406855 () Bool)

(assert (=> start!56820 (=> (not res!406855) (not e!359862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56820 (= res!406855 (validMask!0 mask!3053))))

(assert (=> start!56820 e!359862))

(assert (=> start!56820 true))

(declare-fun array_inv!14131 (array!38022) Bool)

(assert (=> start!56820 (array_inv!14131 a!2986)))

(declare-fun b!629322 () Bool)

(declare-fun res!406858 () Bool)

(assert (=> b!629322 (=> (not res!406858) (not e!359860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38022 (_ BitVec 32)) Bool)

(assert (=> b!629322 (= res!406858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629323 () Bool)

(declare-fun res!406859 () Bool)

(assert (=> b!629323 (=> (not res!406859) (not e!359862))))

(assert (=> b!629323 (= res!406859 (and (= (size!18613 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18613 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18613 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629324 () Bool)

(assert (=> b!629324 (= e!359862 e!359860)))

(declare-fun res!406862 () Bool)

(assert (=> b!629324 (=> (not res!406862) (not e!359860))))

(declare-fun lt!290562 () SeekEntryResult!6685)

(assert (=> b!629324 (= res!406862 (or (= lt!290562 (MissingZero!6685 i!1108)) (= lt!290562 (MissingVacant!6685 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38022 (_ BitVec 32)) SeekEntryResult!6685)

(assert (=> b!629324 (= lt!290562 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629325 () Bool)

(declare-fun res!406860 () Bool)

(assert (=> b!629325 (=> (not res!406860) (not e!359862))))

(assert (=> b!629325 (= res!406860 (validKeyInArray!0 (select (arr!18248 a!2986) j!136)))))

(declare-fun b!629326 () Bool)

(declare-fun res!406853 () Bool)

(assert (=> b!629326 (=> (not res!406853) (not e!359860))))

(assert (=> b!629326 (= res!406853 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18248 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18248 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56820 res!406855) b!629323))

(assert (= (and b!629323 res!406859) b!629325))

(assert (= (and b!629325 res!406860) b!629317))

(assert (= (and b!629317 res!406854) b!629320))

(assert (= (and b!629320 res!406857) b!629324))

(assert (= (and b!629324 res!406862) b!629322))

(assert (= (and b!629322 res!406858) b!629318))

(assert (= (and b!629318 res!406856) b!629326))

(assert (= (and b!629326 res!406853) b!629319))

(assert (= (and b!629319 res!406861) b!629321))

(declare-fun m!603853 () Bool)

(assert (=> start!56820 m!603853))

(declare-fun m!603855 () Bool)

(assert (=> start!56820 m!603855))

(declare-fun m!603857 () Bool)

(assert (=> b!629321 m!603857))

(declare-fun m!603859 () Bool)

(assert (=> b!629321 m!603859))

(declare-fun m!603861 () Bool)

(assert (=> b!629321 m!603861))

(assert (=> b!629321 m!603861))

(declare-fun m!603863 () Bool)

(assert (=> b!629321 m!603863))

(declare-fun m!603865 () Bool)

(assert (=> b!629321 m!603865))

(declare-fun m!603867 () Bool)

(assert (=> b!629321 m!603867))

(assert (=> b!629321 m!603859))

(declare-fun m!603869 () Bool)

(assert (=> b!629321 m!603869))

(declare-fun m!603871 () Bool)

(assert (=> b!629317 m!603871))

(declare-fun m!603873 () Bool)

(assert (=> b!629320 m!603873))

(declare-fun m!603875 () Bool)

(assert (=> b!629319 m!603875))

(assert (=> b!629319 m!603861))

(assert (=> b!629319 m!603861))

(declare-fun m!603877 () Bool)

(assert (=> b!629319 m!603877))

(declare-fun m!603879 () Bool)

(assert (=> b!629318 m!603879))

(declare-fun m!603881 () Bool)

(assert (=> b!629324 m!603881))

(declare-fun m!603883 () Bool)

(assert (=> b!629322 m!603883))

(assert (=> b!629325 m!603861))

(assert (=> b!629325 m!603861))

(declare-fun m!603885 () Bool)

(assert (=> b!629325 m!603885))

(declare-fun m!603887 () Bool)

(assert (=> b!629326 m!603887))

(assert (=> b!629326 m!603865))

(declare-fun m!603889 () Bool)

(assert (=> b!629326 m!603889))

(check-sat (not b!629325) (not b!629324) (not b!629321) (not start!56820) (not b!629317) (not b!629322) (not b!629318) (not b!629319) (not b!629320))
(check-sat)
(get-model)

(declare-fun d!88921 () Bool)

(assert (=> d!88921 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629317 d!88921))

(declare-fun b!629395 () Bool)

(declare-fun e!359893 () Bool)

(declare-fun call!33268 () Bool)

(assert (=> b!629395 (= e!359893 call!33268)))

(declare-fun b!629396 () Bool)

(declare-fun e!359894 () Bool)

(assert (=> b!629396 (= e!359894 e!359893)))

(declare-fun lt!290604 () (_ BitVec 64))

(assert (=> b!629396 (= lt!290604 (select (arr!18248 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!290603 () Unit!21098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38022 (_ BitVec 64) (_ BitVec 32)) Unit!21098)

(assert (=> b!629396 (= lt!290603 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290604 #b00000000000000000000000000000000))))

(assert (=> b!629396 (arrayContainsKey!0 a!2986 lt!290604 #b00000000000000000000000000000000)))

(declare-fun lt!290605 () Unit!21098)

(assert (=> b!629396 (= lt!290605 lt!290603)))

(declare-fun res!406928 () Bool)

(assert (=> b!629396 (= res!406928 (= (seekEntryOrOpen!0 (select (arr!18248 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6685 #b00000000000000000000000000000000)))))

(assert (=> b!629396 (=> (not res!406928) (not e!359893))))

(declare-fun b!629397 () Bool)

(assert (=> b!629397 (= e!359894 call!33268)))

(declare-fun bm!33265 () Bool)

(assert (=> bm!33265 (= call!33268 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!629398 () Bool)

(declare-fun e!359895 () Bool)

(assert (=> b!629398 (= e!359895 e!359894)))

(declare-fun c!71601 () Bool)

(assert (=> b!629398 (= c!71601 (validKeyInArray!0 (select (arr!18248 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88923 () Bool)

(declare-fun res!406927 () Bool)

(assert (=> d!88923 (=> res!406927 e!359895)))

(assert (=> d!88923 (= res!406927 (bvsge #b00000000000000000000000000000000 (size!18613 a!2986)))))

(assert (=> d!88923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359895)))

(assert (= (and d!88923 (not res!406927)) b!629398))

(assert (= (and b!629398 c!71601) b!629396))

(assert (= (and b!629398 (not c!71601)) b!629397))

(assert (= (and b!629396 res!406928) b!629395))

(assert (= (or b!629395 b!629397) bm!33265))

(declare-fun m!603967 () Bool)

(assert (=> b!629396 m!603967))

(declare-fun m!603969 () Bool)

(assert (=> b!629396 m!603969))

(declare-fun m!603971 () Bool)

(assert (=> b!629396 m!603971))

(assert (=> b!629396 m!603967))

(declare-fun m!603973 () Bool)

(assert (=> b!629396 m!603973))

(declare-fun m!603975 () Bool)

(assert (=> bm!33265 m!603975))

(assert (=> b!629398 m!603967))

(assert (=> b!629398 m!603967))

(declare-fun m!603977 () Bool)

(assert (=> b!629398 m!603977))

(assert (=> b!629322 d!88923))

(declare-fun b!629426 () Bool)

(declare-fun c!71613 () Bool)

(declare-fun lt!290610 () (_ BitVec 64))

(assert (=> b!629426 (= c!71613 (= lt!290610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359915 () SeekEntryResult!6685)

(declare-fun e!359914 () SeekEntryResult!6685)

(assert (=> b!629426 (= e!359915 e!359914)))

(declare-fun b!629427 () Bool)

(assert (=> b!629427 (= e!359914 (MissingVacant!6685 vacantSpotIndex!68))))

(declare-fun b!629428 () Bool)

(assert (=> b!629428 (= e!359914 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290566 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (store (arr!18248 a!2986) i!1108 k0!1786) j!136) (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986)) mask!3053))))

(declare-fun b!629429 () Bool)

(declare-fun e!359916 () SeekEntryResult!6685)

(assert (=> b!629429 (= e!359916 Undefined!6685)))

(declare-fun b!629431 () Bool)

(assert (=> b!629431 (= e!359915 (Found!6685 lt!290566))))

(declare-fun b!629430 () Bool)

(assert (=> b!629430 (= e!359916 e!359915)))

(declare-fun c!71611 () Bool)

(assert (=> b!629430 (= c!71611 (= lt!290610 (select (store (arr!18248 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun d!88925 () Bool)

(declare-fun lt!290611 () SeekEntryResult!6685)

(get-info :version)

(assert (=> d!88925 (and (or ((_ is Undefined!6685) lt!290611) (not ((_ is Found!6685) lt!290611)) (and (bvsge (index!29025 lt!290611) #b00000000000000000000000000000000) (bvslt (index!29025 lt!290611) (size!18613 (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986)))))) (or ((_ is Undefined!6685) lt!290611) ((_ is Found!6685) lt!290611) (not ((_ is MissingVacant!6685) lt!290611)) (not (= (index!29027 lt!290611) vacantSpotIndex!68)) (and (bvsge (index!29027 lt!290611) #b00000000000000000000000000000000) (bvslt (index!29027 lt!290611) (size!18613 (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986)))))) (or ((_ is Undefined!6685) lt!290611) (ite ((_ is Found!6685) lt!290611) (= (select (arr!18248 (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986))) (index!29025 lt!290611)) (select (store (arr!18248 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6685) lt!290611) (= (index!29027 lt!290611) vacantSpotIndex!68) (= (select (arr!18248 (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986))) (index!29027 lt!290611)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88925 (= lt!290611 e!359916)))

(declare-fun c!71612 () Bool)

(assert (=> d!88925 (= c!71612 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88925 (= lt!290610 (select (arr!18248 (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986))) lt!290566))))

(assert (=> d!88925 (validMask!0 mask!3053)))

(assert (=> d!88925 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 (select (store (arr!18248 a!2986) i!1108 k0!1786) j!136) (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986)) mask!3053) lt!290611)))

(assert (= (and d!88925 c!71612) b!629429))

(assert (= (and d!88925 (not c!71612)) b!629430))

(assert (= (and b!629430 c!71611) b!629431))

(assert (= (and b!629430 (not c!71611)) b!629426))

(assert (= (and b!629426 c!71613) b!629427))

(assert (= (and b!629426 (not c!71613)) b!629428))

(declare-fun m!603987 () Bool)

(assert (=> b!629428 m!603987))

(assert (=> b!629428 m!603987))

(assert (=> b!629428 m!603859))

(declare-fun m!603989 () Bool)

(assert (=> b!629428 m!603989))

(declare-fun m!603991 () Bool)

(assert (=> d!88925 m!603991))

(declare-fun m!603993 () Bool)

(assert (=> d!88925 m!603993))

(declare-fun m!603995 () Bool)

(assert (=> d!88925 m!603995))

(assert (=> d!88925 m!603853))

(assert (=> b!629321 d!88925))

(declare-fun b!629432 () Bool)

(declare-fun c!71616 () Bool)

(declare-fun lt!290612 () (_ BitVec 64))

(assert (=> b!629432 (= c!71616 (= lt!290612 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359918 () SeekEntryResult!6685)

(declare-fun e!359917 () SeekEntryResult!6685)

(assert (=> b!629432 (= e!359918 e!359917)))

(declare-fun b!629433 () Bool)

(assert (=> b!629433 (= e!359917 (MissingVacant!6685 vacantSpotIndex!68))))

(declare-fun b!629434 () Bool)

(assert (=> b!629434 (= e!359917 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290566 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629435 () Bool)

(declare-fun e!359919 () SeekEntryResult!6685)

(assert (=> b!629435 (= e!359919 Undefined!6685)))

(declare-fun b!629437 () Bool)

(assert (=> b!629437 (= e!359918 (Found!6685 lt!290566))))

(declare-fun b!629436 () Bool)

(assert (=> b!629436 (= e!359919 e!359918)))

(declare-fun c!71614 () Bool)

(assert (=> b!629436 (= c!71614 (= lt!290612 (select (arr!18248 a!2986) j!136)))))

(declare-fun d!88935 () Bool)

(declare-fun lt!290613 () SeekEntryResult!6685)

(assert (=> d!88935 (and (or ((_ is Undefined!6685) lt!290613) (not ((_ is Found!6685) lt!290613)) (and (bvsge (index!29025 lt!290613) #b00000000000000000000000000000000) (bvslt (index!29025 lt!290613) (size!18613 a!2986)))) (or ((_ is Undefined!6685) lt!290613) ((_ is Found!6685) lt!290613) (not ((_ is MissingVacant!6685) lt!290613)) (not (= (index!29027 lt!290613) vacantSpotIndex!68)) (and (bvsge (index!29027 lt!290613) #b00000000000000000000000000000000) (bvslt (index!29027 lt!290613) (size!18613 a!2986)))) (or ((_ is Undefined!6685) lt!290613) (ite ((_ is Found!6685) lt!290613) (= (select (arr!18248 a!2986) (index!29025 lt!290613)) (select (arr!18248 a!2986) j!136)) (and ((_ is MissingVacant!6685) lt!290613) (= (index!29027 lt!290613) vacantSpotIndex!68) (= (select (arr!18248 a!2986) (index!29027 lt!290613)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88935 (= lt!290613 e!359919)))

(declare-fun c!71615 () Bool)

(assert (=> d!88935 (= c!71615 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88935 (= lt!290612 (select (arr!18248 a!2986) lt!290566))))

(assert (=> d!88935 (validMask!0 mask!3053)))

(assert (=> d!88935 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053) lt!290613)))

(assert (= (and d!88935 c!71615) b!629435))

(assert (= (and d!88935 (not c!71615)) b!629436))

(assert (= (and b!629436 c!71614) b!629437))

(assert (= (and b!629436 (not c!71614)) b!629432))

(assert (= (and b!629432 c!71616) b!629433))

(assert (= (and b!629432 (not c!71616)) b!629434))

(assert (=> b!629434 m!603987))

(assert (=> b!629434 m!603987))

(assert (=> b!629434 m!603861))

(declare-fun m!603997 () Bool)

(assert (=> b!629434 m!603997))

(declare-fun m!603999 () Bool)

(assert (=> d!88935 m!603999))

(declare-fun m!604001 () Bool)

(assert (=> d!88935 m!604001))

(declare-fun m!604003 () Bool)

(assert (=> d!88935 m!604003))

(assert (=> d!88935 m!603853))

(assert (=> b!629321 d!88935))

(declare-fun d!88937 () Bool)

(declare-fun e!359943 () Bool)

(assert (=> d!88937 e!359943))

(declare-fun res!406946 () Bool)

(assert (=> d!88937 (=> (not res!406946) (not e!359943))))

(assert (=> d!88937 (= res!406946 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18613 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18613 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18613 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18613 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18613 a!2986))))))

(declare-fun lt!290633 () Unit!21098)

(declare-fun choose!9 (array!38022 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21098)

(assert (=> d!88937 (= lt!290633 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88937 (validMask!0 mask!3053)))

(assert (=> d!88937 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 mask!3053) lt!290633)))

(declare-fun b!629476 () Bool)

(assert (=> b!629476 (= e!359943 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290566 vacantSpotIndex!68 (select (store (arr!18248 a!2986) i!1108 k0!1786) j!136) (array!38023 (store (arr!18248 a!2986) i!1108 k0!1786) (size!18613 a!2986)) mask!3053)))))

(assert (= (and d!88937 res!406946) b!629476))

(declare-fun m!604031 () Bool)

(assert (=> d!88937 m!604031))

(assert (=> d!88937 m!603853))

(assert (=> b!629476 m!603859))

(assert (=> b!629476 m!603869))

(assert (=> b!629476 m!603861))

(assert (=> b!629476 m!603863))

(assert (=> b!629476 m!603861))

(assert (=> b!629476 m!603865))

(assert (=> b!629476 m!603859))

(assert (=> b!629321 d!88937))

(declare-fun d!88949 () Bool)

(declare-fun lt!290636 () (_ BitVec 32))

(assert (=> d!88949 (and (bvsge lt!290636 #b00000000000000000000000000000000) (bvslt lt!290636 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88949 (= lt!290636 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88949 (validMask!0 mask!3053)))

(assert (=> d!88949 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290636)))

(declare-fun bs!18958 () Bool)

(assert (= bs!18958 d!88949))

(declare-fun m!604033 () Bool)

(assert (=> bs!18958 m!604033))

(assert (=> bs!18958 m!603853))

(assert (=> b!629321 d!88949))

(declare-fun d!88951 () Bool)

(declare-fun res!406951 () Bool)

(declare-fun e!359948 () Bool)

(assert (=> d!88951 (=> res!406951 e!359948)))

(assert (=> d!88951 (= res!406951 (= (select (arr!18248 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88951 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!359948)))

(declare-fun b!629481 () Bool)

(declare-fun e!359949 () Bool)

(assert (=> b!629481 (= e!359948 e!359949)))

(declare-fun res!406952 () Bool)

(assert (=> b!629481 (=> (not res!406952) (not e!359949))))

(assert (=> b!629481 (= res!406952 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18613 a!2986)))))

(declare-fun b!629482 () Bool)

(assert (=> b!629482 (= e!359949 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88951 (not res!406951)) b!629481))

(assert (= (and b!629481 res!406952) b!629482))

(assert (=> d!88951 m!603967))

(declare-fun m!604035 () Bool)

(assert (=> b!629482 m!604035))

(assert (=> b!629320 d!88951))

(declare-fun d!88953 () Bool)

(assert (=> d!88953 (= (validKeyInArray!0 (select (arr!18248 a!2986) j!136)) (and (not (= (select (arr!18248 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18248 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629325 d!88953))

(declare-fun b!629495 () Bool)

(declare-fun c!71640 () Bool)

(declare-fun lt!290643 () (_ BitVec 64))

(assert (=> b!629495 (= c!71640 (= lt!290643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359959 () SeekEntryResult!6685)

(declare-fun e!359958 () SeekEntryResult!6685)

(assert (=> b!629495 (= e!359959 e!359958)))

(declare-fun b!629496 () Bool)

(assert (=> b!629496 (= e!359958 (MissingVacant!6685 vacantSpotIndex!68))))

(declare-fun b!629497 () Bool)

(assert (=> b!629497 (= e!359958 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629498 () Bool)

(declare-fun e!359960 () SeekEntryResult!6685)

(assert (=> b!629498 (= e!359960 Undefined!6685)))

(declare-fun b!629500 () Bool)

(assert (=> b!629500 (= e!359959 (Found!6685 index!984))))

(declare-fun b!629499 () Bool)

(assert (=> b!629499 (= e!359960 e!359959)))

(declare-fun c!71638 () Bool)

(assert (=> b!629499 (= c!71638 (= lt!290643 (select (arr!18248 a!2986) j!136)))))

(declare-fun d!88955 () Bool)

(declare-fun lt!290644 () SeekEntryResult!6685)

(assert (=> d!88955 (and (or ((_ is Undefined!6685) lt!290644) (not ((_ is Found!6685) lt!290644)) (and (bvsge (index!29025 lt!290644) #b00000000000000000000000000000000) (bvslt (index!29025 lt!290644) (size!18613 a!2986)))) (or ((_ is Undefined!6685) lt!290644) ((_ is Found!6685) lt!290644) (not ((_ is MissingVacant!6685) lt!290644)) (not (= (index!29027 lt!290644) vacantSpotIndex!68)) (and (bvsge (index!29027 lt!290644) #b00000000000000000000000000000000) (bvslt (index!29027 lt!290644) (size!18613 a!2986)))) (or ((_ is Undefined!6685) lt!290644) (ite ((_ is Found!6685) lt!290644) (= (select (arr!18248 a!2986) (index!29025 lt!290644)) (select (arr!18248 a!2986) j!136)) (and ((_ is MissingVacant!6685) lt!290644) (= (index!29027 lt!290644) vacantSpotIndex!68) (= (select (arr!18248 a!2986) (index!29027 lt!290644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88955 (= lt!290644 e!359960)))

(declare-fun c!71639 () Bool)

(assert (=> d!88955 (= c!71639 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88955 (= lt!290643 (select (arr!18248 a!2986) index!984))))

(assert (=> d!88955 (validMask!0 mask!3053)))

(assert (=> d!88955 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053) lt!290644)))

(assert (= (and d!88955 c!71639) b!629498))

(assert (= (and d!88955 (not c!71639)) b!629499))

(assert (= (and b!629499 c!71638) b!629500))

(assert (= (and b!629499 (not c!71638)) b!629495))

(assert (= (and b!629495 c!71640) b!629496))

(assert (= (and b!629495 (not c!71640)) b!629497))

(assert (=> b!629497 m!603857))

(assert (=> b!629497 m!603857))

(assert (=> b!629497 m!603861))

(declare-fun m!604037 () Bool)

(assert (=> b!629497 m!604037))

(declare-fun m!604039 () Bool)

(assert (=> d!88955 m!604039))

(declare-fun m!604041 () Bool)

(assert (=> d!88955 m!604041))

(assert (=> d!88955 m!603875))

(assert (=> d!88955 m!603853))

(assert (=> b!629319 d!88955))

(declare-fun d!88957 () Bool)

(assert (=> d!88957 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56820 d!88957))

(declare-fun d!88973 () Bool)

(assert (=> d!88973 (= (array_inv!14131 a!2986) (bvsge (size!18613 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56820 d!88973))

(declare-fun b!629561 () Bool)

(declare-fun c!71667 () Bool)

(declare-fun lt!290678 () (_ BitVec 64))

(assert (=> b!629561 (= c!71667 (= lt!290678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!359995 () SeekEntryResult!6685)

(declare-fun e!359997 () SeekEntryResult!6685)

(assert (=> b!629561 (= e!359995 e!359997)))

(declare-fun b!629562 () Bool)

(declare-fun lt!290676 () SeekEntryResult!6685)

(assert (=> b!629562 (= e!359995 (Found!6685 (index!29026 lt!290676)))))

(declare-fun b!629563 () Bool)

(declare-fun e!359996 () SeekEntryResult!6685)

(assert (=> b!629563 (= e!359996 e!359995)))

(assert (=> b!629563 (= lt!290678 (select (arr!18248 a!2986) (index!29026 lt!290676)))))

(declare-fun c!71666 () Bool)

(assert (=> b!629563 (= c!71666 (= lt!290678 k0!1786))))

(declare-fun b!629564 () Bool)

(assert (=> b!629564 (= e!359997 (seekKeyOrZeroReturnVacant!0 (x!57768 lt!290676) (index!29026 lt!290676) (index!29026 lt!290676) k0!1786 a!2986 mask!3053))))

(declare-fun b!629565 () Bool)

(assert (=> b!629565 (= e!359997 (MissingZero!6685 (index!29026 lt!290676)))))

(declare-fun d!88975 () Bool)

(declare-fun lt!290677 () SeekEntryResult!6685)

(assert (=> d!88975 (and (or ((_ is Undefined!6685) lt!290677) (not ((_ is Found!6685) lt!290677)) (and (bvsge (index!29025 lt!290677) #b00000000000000000000000000000000) (bvslt (index!29025 lt!290677) (size!18613 a!2986)))) (or ((_ is Undefined!6685) lt!290677) ((_ is Found!6685) lt!290677) (not ((_ is MissingZero!6685) lt!290677)) (and (bvsge (index!29024 lt!290677) #b00000000000000000000000000000000) (bvslt (index!29024 lt!290677) (size!18613 a!2986)))) (or ((_ is Undefined!6685) lt!290677) ((_ is Found!6685) lt!290677) ((_ is MissingZero!6685) lt!290677) (not ((_ is MissingVacant!6685) lt!290677)) (and (bvsge (index!29027 lt!290677) #b00000000000000000000000000000000) (bvslt (index!29027 lt!290677) (size!18613 a!2986)))) (or ((_ is Undefined!6685) lt!290677) (ite ((_ is Found!6685) lt!290677) (= (select (arr!18248 a!2986) (index!29025 lt!290677)) k0!1786) (ite ((_ is MissingZero!6685) lt!290677) (= (select (arr!18248 a!2986) (index!29024 lt!290677)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6685) lt!290677) (= (select (arr!18248 a!2986) (index!29027 lt!290677)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88975 (= lt!290677 e!359996)))

(declare-fun c!71665 () Bool)

(assert (=> d!88975 (= c!71665 (and ((_ is Intermediate!6685) lt!290676) (undefined!7497 lt!290676)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38022 (_ BitVec 32)) SeekEntryResult!6685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88975 (= lt!290676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88975 (validMask!0 mask!3053)))

(assert (=> d!88975 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290677)))

(declare-fun b!629566 () Bool)

(assert (=> b!629566 (= e!359996 Undefined!6685)))

(assert (= (and d!88975 c!71665) b!629566))

(assert (= (and d!88975 (not c!71665)) b!629563))

(assert (= (and b!629563 c!71666) b!629562))

(assert (= (and b!629563 (not c!71666)) b!629561))

(assert (= (and b!629561 c!71667) b!629565))

(assert (= (and b!629561 (not c!71667)) b!629564))

(declare-fun m!604091 () Bool)

(assert (=> b!629563 m!604091))

(declare-fun m!604093 () Bool)

(assert (=> b!629564 m!604093))

(declare-fun m!604095 () Bool)

(assert (=> d!88975 m!604095))

(declare-fun m!604097 () Bool)

(assert (=> d!88975 m!604097))

(declare-fun m!604099 () Bool)

(assert (=> d!88975 m!604099))

(assert (=> d!88975 m!603853))

(declare-fun m!604101 () Bool)

(assert (=> d!88975 m!604101))

(assert (=> d!88975 m!604097))

(declare-fun m!604103 () Bool)

(assert (=> d!88975 m!604103))

(assert (=> b!629324 d!88975))

(declare-fun b!629613 () Bool)

(declare-fun e!360027 () Bool)

(declare-fun call!33280 () Bool)

(assert (=> b!629613 (= e!360027 call!33280)))

(declare-fun bm!33277 () Bool)

(declare-fun c!71685 () Bool)

(assert (=> bm!33277 (= call!33280 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71685 (Cons!12324 (select (arr!18248 a!2986) #b00000000000000000000000000000000) Nil!12325) Nil!12325)))))

(declare-fun b!629614 () Bool)

(assert (=> b!629614 (= e!360027 call!33280)))

(declare-fun b!629615 () Bool)

(declare-fun e!360029 () Bool)

(declare-fun contains!3071 (List!12328 (_ BitVec 64)) Bool)

(assert (=> b!629615 (= e!360029 (contains!3071 Nil!12325 (select (arr!18248 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629616 () Bool)

(declare-fun e!360028 () Bool)

(assert (=> b!629616 (= e!360028 e!360027)))

(assert (=> b!629616 (= c!71685 (validKeyInArray!0 (select (arr!18248 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629617 () Bool)

(declare-fun e!360030 () Bool)

(assert (=> b!629617 (= e!360030 e!360028)))

(declare-fun res!406978 () Bool)

(assert (=> b!629617 (=> (not res!406978) (not e!360028))))

(assert (=> b!629617 (= res!406978 (not e!360029))))

(declare-fun res!406979 () Bool)

(assert (=> b!629617 (=> (not res!406979) (not e!360029))))

(assert (=> b!629617 (= res!406979 (validKeyInArray!0 (select (arr!18248 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88991 () Bool)

(declare-fun res!406977 () Bool)

(assert (=> d!88991 (=> res!406977 e!360030)))

(assert (=> d!88991 (= res!406977 (bvsge #b00000000000000000000000000000000 (size!18613 a!2986)))))

(assert (=> d!88991 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12325) e!360030)))

(assert (= (and d!88991 (not res!406977)) b!629617))

(assert (= (and b!629617 res!406979) b!629615))

(assert (= (and b!629617 res!406978) b!629616))

(assert (= (and b!629616 c!71685) b!629613))

(assert (= (and b!629616 (not c!71685)) b!629614))

(assert (= (or b!629613 b!629614) bm!33277))

(assert (=> bm!33277 m!603967))

(declare-fun m!604137 () Bool)

(assert (=> bm!33277 m!604137))

(assert (=> b!629615 m!603967))

(assert (=> b!629615 m!603967))

(declare-fun m!604139 () Bool)

(assert (=> b!629615 m!604139))

(assert (=> b!629616 m!603967))

(assert (=> b!629616 m!603967))

(assert (=> b!629616 m!603977))

(assert (=> b!629617 m!603967))

(assert (=> b!629617 m!603967))

(assert (=> b!629617 m!603977))

(assert (=> b!629318 d!88991))

(check-sat (not d!88925) (not bm!33277) (not bm!33265) (not b!629564) (not b!629615) (not b!629617) (not d!88935) (not d!88937) (not d!88975) (not b!629616) (not b!629434) (not d!88955) (not b!629398) (not b!629396) (not b!629428) (not b!629482) (not b!629476) (not d!88949) (not b!629497))
(check-sat)
