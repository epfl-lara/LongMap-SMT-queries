; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56208 () Bool)

(assert start!56208)

(declare-fun b!623001 () Bool)

(declare-datatypes ((Unit!20978 0))(
  ( (Unit!20979) )
))
(declare-fun e!357346 () Unit!20978)

(declare-fun Unit!20980 () Unit!20978)

(assert (=> b!623001 (= e!357346 Unit!20980)))

(assert (=> b!623001 false))

(declare-fun b!623002 () Bool)

(declare-fun e!357349 () Bool)

(declare-fun e!357345 () Bool)

(assert (=> b!623002 (= e!357349 e!357345)))

(declare-fun res!401522 () Bool)

(assert (=> b!623002 (=> (not res!401522) (not e!357345))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6525 0))(
  ( (MissingZero!6525 (index!28384 (_ BitVec 32))) (Found!6525 (index!28385 (_ BitVec 32))) (Intermediate!6525 (undefined!7337 Bool) (index!28386 (_ BitVec 32)) (x!57149 (_ BitVec 32))) (Undefined!6525) (MissingVacant!6525 (index!28387 (_ BitVec 32))) )
))
(declare-fun lt!288859 () SeekEntryResult!6525)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37678 0))(
  ( (array!37679 (arr!18085 (Array (_ BitVec 32) (_ BitVec 64))) (size!18449 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37678)

(assert (=> b!623002 (= res!401522 (and (= lt!288859 (Found!6525 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18085 a!2986) index!984) (select (arr!18085 a!2986) j!136))) (not (= (select (arr!18085 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37678 (_ BitVec 32)) SeekEntryResult!6525)

(assert (=> b!623002 (= lt!288859 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18085 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623003 () Bool)

(declare-fun e!357342 () Bool)

(assert (=> b!623003 (= e!357342 e!357349)))

(declare-fun res!401516 () Bool)

(assert (=> b!623003 (=> (not res!401516) (not e!357349))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!623003 (= res!401516 (= (select (store (arr!18085 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!288865 () array!37678)

(assert (=> b!623003 (= lt!288865 (array!37679 (store (arr!18085 a!2986) i!1108 k0!1786) (size!18449 a!2986)))))

(declare-fun b!623004 () Bool)

(declare-fun res!401520 () Bool)

(assert (=> b!623004 (=> (not res!401520) (not e!357342))))

(assert (=> b!623004 (= res!401520 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18085 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623005 () Bool)

(declare-fun e!357350 () Unit!20978)

(declare-fun Unit!20981 () Unit!20978)

(assert (=> b!623005 (= e!357350 Unit!20981)))

(declare-fun res!401521 () Bool)

(assert (=> b!623005 (= res!401521 (= (select (store (arr!18085 a!2986) i!1108 k0!1786) index!984) (select (arr!18085 a!2986) j!136)))))

(declare-fun e!357353 () Bool)

(assert (=> b!623005 (=> (not res!401521) (not e!357353))))

(assert (=> b!623005 e!357353))

(declare-fun c!71114 () Bool)

(assert (=> b!623005 (= c!71114 (bvslt j!136 index!984))))

(declare-fun lt!288869 () Unit!20978)

(declare-fun e!357354 () Unit!20978)

(assert (=> b!623005 (= lt!288869 e!357354)))

(declare-fun c!71116 () Bool)

(assert (=> b!623005 (= c!71116 (bvslt index!984 j!136))))

(declare-fun lt!288877 () Unit!20978)

(declare-fun e!357344 () Unit!20978)

(assert (=> b!623005 (= lt!288877 e!357344)))

(assert (=> b!623005 false))

(declare-fun b!623006 () Bool)

(declare-fun res!401518 () Bool)

(assert (=> b!623006 (=> (not res!401518) (not e!357342))))

(declare-datatypes ((List!12126 0))(
  ( (Nil!12123) (Cons!12122 (h!13167 (_ BitVec 64)) (t!18354 List!12126)) )
))
(declare-fun arrayNoDuplicates!0 (array!37678 (_ BitVec 32) List!12126) Bool)

(assert (=> b!623006 (= res!401518 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12123))))

(declare-fun res!401512 () Bool)

(declare-fun e!357348 () Bool)

(assert (=> start!56208 (=> (not res!401512) (not e!357348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56208 (= res!401512 (validMask!0 mask!3053))))

(assert (=> start!56208 e!357348))

(assert (=> start!56208 true))

(declare-fun array_inv!13881 (array!37678) Bool)

(assert (=> start!56208 (array_inv!13881 a!2986)))

(declare-fun b!623007 () Bool)

(declare-fun res!401511 () Bool)

(assert (=> b!623007 (=> (not res!401511) (not e!357348))))

(assert (=> b!623007 (= res!401511 (and (= (size!18449 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18449 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18449 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623008 () Bool)

(assert (=> b!623008 false))

(declare-fun lt!288858 () Unit!20978)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37678 (_ BitVec 64) (_ BitVec 32) List!12126) Unit!20978)

(assert (=> b!623008 (= lt!288858 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288865 (select (arr!18085 a!2986) j!136) index!984 Nil!12123))))

(assert (=> b!623008 (arrayNoDuplicates!0 lt!288865 index!984 Nil!12123)))

(declare-fun lt!288875 () Unit!20978)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37678 (_ BitVec 32) (_ BitVec 32)) Unit!20978)

(assert (=> b!623008 (= lt!288875 (lemmaNoDuplicateFromThenFromBigger!0 lt!288865 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623008 (arrayNoDuplicates!0 lt!288865 #b00000000000000000000000000000000 Nil!12123)))

(declare-fun lt!288860 () Unit!20978)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12126) Unit!20978)

(assert (=> b!623008 (= lt!288860 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12123))))

(declare-fun arrayContainsKey!0 (array!37678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623008 (arrayContainsKey!0 lt!288865 (select (arr!18085 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288862 () Unit!20978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20978)

(assert (=> b!623008 (= lt!288862 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288865 (select (arr!18085 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357341 () Bool)

(assert (=> b!623008 e!357341))

(declare-fun res!401519 () Bool)

(assert (=> b!623008 (=> (not res!401519) (not e!357341))))

(assert (=> b!623008 (= res!401519 (arrayContainsKey!0 lt!288865 (select (arr!18085 a!2986) j!136) j!136))))

(declare-fun Unit!20982 () Unit!20978)

(assert (=> b!623008 (= e!357344 Unit!20982)))

(declare-fun b!623009 () Bool)

(declare-fun res!401514 () Bool)

(assert (=> b!623009 (= res!401514 (arrayContainsKey!0 lt!288865 (select (arr!18085 a!2986) j!136) j!136))))

(declare-fun e!357352 () Bool)

(assert (=> b!623009 (=> (not res!401514) (not e!357352))))

(declare-fun e!357351 () Bool)

(assert (=> b!623009 (= e!357351 e!357352)))

(declare-fun b!623010 () Bool)

(declare-fun e!357347 () Bool)

(declare-fun lt!288872 () SeekEntryResult!6525)

(assert (=> b!623010 (= e!357347 (= lt!288859 lt!288872))))

(declare-fun b!623011 () Bool)

(assert (=> b!623011 (= e!357345 (not true))))

(declare-fun lt!288861 () Unit!20978)

(assert (=> b!623011 (= lt!288861 e!357350)))

(declare-fun c!71117 () Bool)

(declare-fun lt!288874 () SeekEntryResult!6525)

(assert (=> b!623011 (= c!71117 (= lt!288874 (Found!6525 index!984)))))

(declare-fun lt!288871 () Unit!20978)

(assert (=> b!623011 (= lt!288871 e!357346)))

(declare-fun c!71115 () Bool)

(assert (=> b!623011 (= c!71115 (= lt!288874 Undefined!6525))))

(declare-fun lt!288870 () (_ BitVec 64))

(assert (=> b!623011 (= lt!288874 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288870 lt!288865 mask!3053))))

(assert (=> b!623011 e!357347))

(declare-fun res!401517 () Bool)

(assert (=> b!623011 (=> (not res!401517) (not e!357347))))

(declare-fun lt!288864 () (_ BitVec 32))

(assert (=> b!623011 (= res!401517 (= lt!288872 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288864 vacantSpotIndex!68 lt!288870 lt!288865 mask!3053)))))

(assert (=> b!623011 (= lt!288872 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288864 vacantSpotIndex!68 (select (arr!18085 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623011 (= lt!288870 (select (store (arr!18085 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288866 () Unit!20978)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37678 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20978)

(assert (=> b!623011 (= lt!288866 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288864 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623011 (= lt!288864 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623012 () Bool)

(assert (=> b!623012 false))

(declare-fun lt!288867 () Unit!20978)

(assert (=> b!623012 (= lt!288867 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288865 (select (arr!18085 a!2986) j!136) j!136 Nil!12123))))

(assert (=> b!623012 (arrayNoDuplicates!0 lt!288865 j!136 Nil!12123)))

(declare-fun lt!288868 () Unit!20978)

(assert (=> b!623012 (= lt!288868 (lemmaNoDuplicateFromThenFromBigger!0 lt!288865 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623012 (arrayNoDuplicates!0 lt!288865 #b00000000000000000000000000000000 Nil!12123)))

(declare-fun lt!288873 () Unit!20978)

(assert (=> b!623012 (= lt!288873 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12123))))

(assert (=> b!623012 (arrayContainsKey!0 lt!288865 (select (arr!18085 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288863 () Unit!20978)

(assert (=> b!623012 (= lt!288863 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288865 (select (arr!18085 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20983 () Unit!20978)

(assert (=> b!623012 (= e!357354 Unit!20983)))

(declare-fun b!623013 () Bool)

(declare-fun res!401515 () Bool)

(assert (=> b!623013 (=> (not res!401515) (not e!357348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623013 (= res!401515 (validKeyInArray!0 (select (arr!18085 a!2986) j!136)))))

(declare-fun b!623014 () Bool)

(assert (=> b!623014 (= e!357352 (arrayContainsKey!0 lt!288865 (select (arr!18085 a!2986) j!136) index!984))))

(declare-fun b!623015 () Bool)

(declare-fun Unit!20984 () Unit!20978)

(assert (=> b!623015 (= e!357354 Unit!20984)))

(declare-fun b!623016 () Bool)

(declare-fun Unit!20985 () Unit!20978)

(assert (=> b!623016 (= e!357344 Unit!20985)))

(declare-fun b!623017 () Bool)

(declare-fun Unit!20986 () Unit!20978)

(assert (=> b!623017 (= e!357346 Unit!20986)))

(declare-fun b!623018 () Bool)

(declare-fun res!401513 () Bool)

(assert (=> b!623018 (=> (not res!401513) (not e!357348))))

(assert (=> b!623018 (= res!401513 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623019 () Bool)

(declare-fun Unit!20987 () Unit!20978)

(assert (=> b!623019 (= e!357350 Unit!20987)))

(declare-fun b!623020 () Bool)

(declare-fun res!401508 () Bool)

(assert (=> b!623020 (=> (not res!401508) (not e!357348))))

(assert (=> b!623020 (= res!401508 (validKeyInArray!0 k0!1786))))

(declare-fun b!623021 () Bool)

(declare-fun res!401510 () Bool)

(assert (=> b!623021 (=> (not res!401510) (not e!357342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37678 (_ BitVec 32)) Bool)

(assert (=> b!623021 (= res!401510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623022 () Bool)

(declare-fun res!401509 () Bool)

(assert (=> b!623022 (= res!401509 (bvsge j!136 index!984))))

(assert (=> b!623022 (=> res!401509 e!357351)))

(assert (=> b!623022 (= e!357353 e!357351)))

(declare-fun b!623023 () Bool)

(assert (=> b!623023 (= e!357348 e!357342)))

(declare-fun res!401507 () Bool)

(assert (=> b!623023 (=> (not res!401507) (not e!357342))))

(declare-fun lt!288876 () SeekEntryResult!6525)

(assert (=> b!623023 (= res!401507 (or (= lt!288876 (MissingZero!6525 i!1108)) (= lt!288876 (MissingVacant!6525 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37678 (_ BitVec 32)) SeekEntryResult!6525)

(assert (=> b!623023 (= lt!288876 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623024 () Bool)

(assert (=> b!623024 (= e!357341 (arrayContainsKey!0 lt!288865 (select (arr!18085 a!2986) j!136) index!984))))

(assert (= (and start!56208 res!401512) b!623007))

(assert (= (and b!623007 res!401511) b!623013))

(assert (= (and b!623013 res!401515) b!623020))

(assert (= (and b!623020 res!401508) b!623018))

(assert (= (and b!623018 res!401513) b!623023))

(assert (= (and b!623023 res!401507) b!623021))

(assert (= (and b!623021 res!401510) b!623006))

(assert (= (and b!623006 res!401518) b!623004))

(assert (= (and b!623004 res!401520) b!623003))

(assert (= (and b!623003 res!401516) b!623002))

(assert (= (and b!623002 res!401522) b!623011))

(assert (= (and b!623011 res!401517) b!623010))

(assert (= (and b!623011 c!71115) b!623001))

(assert (= (and b!623011 (not c!71115)) b!623017))

(assert (= (and b!623011 c!71117) b!623005))

(assert (= (and b!623011 (not c!71117)) b!623019))

(assert (= (and b!623005 res!401521) b!623022))

(assert (= (and b!623022 (not res!401509)) b!623009))

(assert (= (and b!623009 res!401514) b!623014))

(assert (= (and b!623005 c!71114) b!623012))

(assert (= (and b!623005 (not c!71114)) b!623015))

(assert (= (and b!623005 c!71116) b!623008))

(assert (= (and b!623005 (not c!71116)) b!623016))

(assert (= (and b!623008 res!401519) b!623024))

(declare-fun m!598851 () Bool)

(assert (=> start!56208 m!598851))

(declare-fun m!598853 () Bool)

(assert (=> start!56208 m!598853))

(declare-fun m!598855 () Bool)

(assert (=> b!623014 m!598855))

(assert (=> b!623014 m!598855))

(declare-fun m!598857 () Bool)

(assert (=> b!623014 m!598857))

(declare-fun m!598859 () Bool)

(assert (=> b!623003 m!598859))

(declare-fun m!598861 () Bool)

(assert (=> b!623003 m!598861))

(declare-fun m!598863 () Bool)

(assert (=> b!623002 m!598863))

(assert (=> b!623002 m!598855))

(assert (=> b!623002 m!598855))

(declare-fun m!598865 () Bool)

(assert (=> b!623002 m!598865))

(assert (=> b!623009 m!598855))

(assert (=> b!623009 m!598855))

(declare-fun m!598867 () Bool)

(assert (=> b!623009 m!598867))

(assert (=> b!623008 m!598855))

(declare-fun m!598869 () Bool)

(assert (=> b!623008 m!598869))

(declare-fun m!598871 () Bool)

(assert (=> b!623008 m!598871))

(assert (=> b!623008 m!598855))

(declare-fun m!598873 () Bool)

(assert (=> b!623008 m!598873))

(assert (=> b!623008 m!598855))

(assert (=> b!623008 m!598867))

(assert (=> b!623008 m!598855))

(declare-fun m!598875 () Bool)

(assert (=> b!623008 m!598875))

(assert (=> b!623008 m!598855))

(declare-fun m!598877 () Bool)

(assert (=> b!623008 m!598877))

(declare-fun m!598879 () Bool)

(assert (=> b!623008 m!598879))

(declare-fun m!598881 () Bool)

(assert (=> b!623008 m!598881))

(assert (=> b!623024 m!598855))

(assert (=> b!623024 m!598855))

(assert (=> b!623024 m!598857))

(declare-fun m!598883 () Bool)

(assert (=> b!623006 m!598883))

(declare-fun m!598885 () Bool)

(assert (=> b!623004 m!598885))

(assert (=> b!623005 m!598859))

(declare-fun m!598887 () Bool)

(assert (=> b!623005 m!598887))

(assert (=> b!623005 m!598855))

(declare-fun m!598889 () Bool)

(assert (=> b!623021 m!598889))

(declare-fun m!598891 () Bool)

(assert (=> b!623018 m!598891))

(declare-fun m!598893 () Bool)

(assert (=> b!623020 m!598893))

(declare-fun m!598895 () Bool)

(assert (=> b!623023 m!598895))

(declare-fun m!598897 () Bool)

(assert (=> b!623011 m!598897))

(declare-fun m!598899 () Bool)

(assert (=> b!623011 m!598899))

(declare-fun m!598901 () Bool)

(assert (=> b!623011 m!598901))

(declare-fun m!598903 () Bool)

(assert (=> b!623011 m!598903))

(assert (=> b!623011 m!598855))

(assert (=> b!623011 m!598855))

(declare-fun m!598905 () Bool)

(assert (=> b!623011 m!598905))

(declare-fun m!598907 () Bool)

(assert (=> b!623011 m!598907))

(assert (=> b!623011 m!598859))

(assert (=> b!623013 m!598855))

(assert (=> b!623013 m!598855))

(declare-fun m!598909 () Bool)

(assert (=> b!623013 m!598909))

(assert (=> b!623012 m!598855))

(declare-fun m!598911 () Bool)

(assert (=> b!623012 m!598911))

(assert (=> b!623012 m!598855))

(assert (=> b!623012 m!598855))

(declare-fun m!598913 () Bool)

(assert (=> b!623012 m!598913))

(assert (=> b!623012 m!598871))

(assert (=> b!623012 m!598855))

(declare-fun m!598915 () Bool)

(assert (=> b!623012 m!598915))

(declare-fun m!598917 () Bool)

(assert (=> b!623012 m!598917))

(declare-fun m!598919 () Bool)

(assert (=> b!623012 m!598919))

(assert (=> b!623012 m!598881))

(check-sat (not b!623009) (not b!623002) (not start!56208) (not b!623013) (not b!623018) (not b!623020) (not b!623008) (not b!623011) (not b!623023) (not b!623006) (not b!623014) (not b!623012) (not b!623021) (not b!623024))
(check-sat)
