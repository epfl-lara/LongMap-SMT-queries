; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59640 () Bool)

(assert start!59640)

(declare-fun b!658451 () Bool)

(assert (=> b!658451 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!22803 0))(
  ( (Unit!22804) )
))
(declare-fun lt!307806 () Unit!22803)

(declare-datatypes ((array!38736 0))(
  ( (array!38737 (arr!18562 (Array (_ BitVec 32) (_ BitVec 64))) (size!18926 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38736)

(declare-fun lt!307810 () array!38736)

(declare-datatypes ((List!12510 0))(
  ( (Nil!12507) (Cons!12506 (h!13554 (_ BitVec 64)) (t!18730 List!12510)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38736 (_ BitVec 64) (_ BitVec 32) List!12510) Unit!22803)

(assert (=> b!658451 (= lt!307806 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307810 (select (arr!18562 a!2986) j!136) j!136 Nil!12507))))

(declare-fun arrayNoDuplicates!0 (array!38736 (_ BitVec 32) List!12510) Bool)

(assert (=> b!658451 (arrayNoDuplicates!0 lt!307810 j!136 Nil!12507)))

(declare-fun lt!307799 () Unit!22803)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38736 (_ BitVec 32) (_ BitVec 32)) Unit!22803)

(assert (=> b!658451 (= lt!307799 (lemmaNoDuplicateFromThenFromBigger!0 lt!307810 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658451 (arrayNoDuplicates!0 lt!307810 #b00000000000000000000000000000000 Nil!12507)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!307793 () Unit!22803)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38736 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12510) Unit!22803)

(assert (=> b!658451 (= lt!307793 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12507))))

(declare-fun arrayContainsKey!0 (array!38736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658451 (arrayContainsKey!0 lt!307810 (select (arr!18562 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307805 () Unit!22803)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38736 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22803)

(assert (=> b!658451 (= lt!307805 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307810 (select (arr!18562 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378280 () Unit!22803)

(declare-fun Unit!22805 () Unit!22803)

(assert (=> b!658451 (= e!378280 Unit!22805)))

(declare-fun b!658452 () Bool)

(declare-fun res!426969 () Bool)

(declare-fun e!378282 () Bool)

(assert (=> b!658452 (=> (not res!426969) (not e!378282))))

(assert (=> b!658452 (= res!426969 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!426977 () Bool)

(declare-fun b!658453 () Bool)

(assert (=> b!658453 (= res!426977 (arrayContainsKey!0 lt!307810 (select (arr!18562 a!2986) j!136) j!136))))

(declare-fun e!378277 () Bool)

(assert (=> b!658453 (=> (not res!426977) (not e!378277))))

(declare-fun e!378281 () Bool)

(assert (=> b!658453 (= e!378281 e!378277)))

(declare-fun b!658454 () Bool)

(declare-fun e!378278 () Bool)

(declare-datatypes ((SeekEntryResult!6958 0))(
  ( (MissingZero!6958 (index!30197 (_ BitVec 32))) (Found!6958 (index!30198 (_ BitVec 32))) (Intermediate!6958 (undefined!7770 Bool) (index!30199 (_ BitVec 32)) (x!59140 (_ BitVec 32))) (Undefined!6958) (MissingVacant!6958 (index!30200 (_ BitVec 32))) )
))
(declare-fun lt!307802 () SeekEntryResult!6958)

(declare-fun lt!307798 () SeekEntryResult!6958)

(assert (=> b!658454 (= e!378278 (= lt!307802 lt!307798))))

(declare-fun b!658455 () Bool)

(declare-fun e!378276 () Unit!22803)

(declare-fun Unit!22806 () Unit!22803)

(assert (=> b!658455 (= e!378276 Unit!22806)))

(assert (=> b!658455 false))

(declare-fun b!658456 () Bool)

(declare-fun e!378273 () Unit!22803)

(declare-fun Unit!22807 () Unit!22803)

(assert (=> b!658456 (= e!378273 Unit!22807)))

(declare-fun b!658457 () Bool)

(declare-fun res!426964 () Bool)

(declare-fun e!378274 () Bool)

(assert (=> b!658457 (=> (not res!426964) (not e!378274))))

(assert (=> b!658457 (= res!426964 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12507))))

(declare-fun b!658458 () Bool)

(declare-fun e!378275 () Bool)

(declare-fun e!378283 () Bool)

(assert (=> b!658458 (= e!378275 e!378283)))

(declare-fun res!426973 () Bool)

(assert (=> b!658458 (=> (not res!426973) (not e!378283))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!658458 (= res!426973 (and (= lt!307802 (Found!6958 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18562 a!2986) index!984) (select (arr!18562 a!2986) j!136))) (not (= (select (arr!18562 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38736 (_ BitVec 32)) SeekEntryResult!6958)

(assert (=> b!658458 (= lt!307802 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18562 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658459 () Bool)

(declare-fun res!426972 () Bool)

(assert (=> b!658459 (=> (not res!426972) (not e!378282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658459 (= res!426972 (validKeyInArray!0 k0!1786))))

(declare-fun b!658460 () Bool)

(declare-fun e!378272 () Bool)

(assert (=> b!658460 (= e!378272 (arrayContainsKey!0 lt!307810 (select (arr!18562 a!2986) j!136) index!984))))

(declare-fun b!658461 () Bool)

(assert (=> b!658461 (= e!378274 e!378275)))

(declare-fun res!426976 () Bool)

(assert (=> b!658461 (=> (not res!426976) (not e!378275))))

(assert (=> b!658461 (= res!426976 (= (select (store (arr!18562 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658461 (= lt!307810 (array!38737 (store (arr!18562 a!2986) i!1108 k0!1786) (size!18926 a!2986)))))

(declare-fun b!658462 () Bool)

(declare-fun res!426971 () Bool)

(assert (=> b!658462 (=> (not res!426971) (not e!378282))))

(assert (=> b!658462 (= res!426971 (and (= (size!18926 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18926 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18926 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658463 () Bool)

(declare-fun Unit!22808 () Unit!22803)

(assert (=> b!658463 (= e!378276 Unit!22808)))

(declare-fun b!658464 () Bool)

(declare-fun res!426970 () Bool)

(assert (=> b!658464 (= res!426970 (bvsge j!136 index!984))))

(assert (=> b!658464 (=> res!426970 e!378281)))

(declare-fun e!378284 () Bool)

(assert (=> b!658464 (= e!378284 e!378281)))

(declare-fun b!658465 () Bool)

(assert (=> b!658465 (= e!378277 (arrayContainsKey!0 lt!307810 (select (arr!18562 a!2986) j!136) index!984))))

(declare-fun b!658466 () Bool)

(assert (=> b!658466 (= e!378283 (not true))))

(declare-fun lt!307795 () Unit!22803)

(assert (=> b!658466 (= lt!307795 e!378273)))

(declare-fun c!76114 () Bool)

(declare-fun lt!307809 () SeekEntryResult!6958)

(assert (=> b!658466 (= c!76114 (= lt!307809 (Found!6958 index!984)))))

(declare-fun lt!307808 () Unit!22803)

(assert (=> b!658466 (= lt!307808 e!378276)))

(declare-fun c!76112 () Bool)

(assert (=> b!658466 (= c!76112 (= lt!307809 Undefined!6958))))

(declare-fun lt!307792 () (_ BitVec 64))

(assert (=> b!658466 (= lt!307809 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307792 lt!307810 mask!3053))))

(assert (=> b!658466 e!378278))

(declare-fun res!426979 () Bool)

(assert (=> b!658466 (=> (not res!426979) (not e!378278))))

(declare-fun lt!307800 () (_ BitVec 32))

(assert (=> b!658466 (= res!426979 (= lt!307798 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307800 vacantSpotIndex!68 lt!307792 lt!307810 mask!3053)))))

(assert (=> b!658466 (= lt!307798 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307800 vacantSpotIndex!68 (select (arr!18562 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658466 (= lt!307792 (select (store (arr!18562 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307796 () Unit!22803)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38736 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22803)

(assert (=> b!658466 (= lt!307796 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307800 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658466 (= lt!307800 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!658467 () Bool)

(assert (=> b!658467 (= e!378282 e!378274)))

(declare-fun res!426974 () Bool)

(assert (=> b!658467 (=> (not res!426974) (not e!378274))))

(declare-fun lt!307804 () SeekEntryResult!6958)

(assert (=> b!658467 (= res!426974 (or (= lt!307804 (MissingZero!6958 i!1108)) (= lt!307804 (MissingVacant!6958 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38736 (_ BitVec 32)) SeekEntryResult!6958)

(assert (=> b!658467 (= lt!307804 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658468 () Bool)

(declare-fun res!426968 () Bool)

(assert (=> b!658468 (=> (not res!426968) (not e!378274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38736 (_ BitVec 32)) Bool)

(assert (=> b!658468 (= res!426968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658469 () Bool)

(declare-fun Unit!22809 () Unit!22803)

(assert (=> b!658469 (= e!378280 Unit!22809)))

(declare-fun b!658470 () Bool)

(declare-fun res!426975 () Bool)

(assert (=> b!658470 (=> (not res!426975) (not e!378274))))

(assert (=> b!658470 (= res!426975 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18562 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658471 () Bool)

(declare-fun Unit!22810 () Unit!22803)

(assert (=> b!658471 (= e!378273 Unit!22810)))

(declare-fun res!426965 () Bool)

(assert (=> b!658471 (= res!426965 (= (select (store (arr!18562 a!2986) i!1108 k0!1786) index!984) (select (arr!18562 a!2986) j!136)))))

(assert (=> b!658471 (=> (not res!426965) (not e!378284))))

(assert (=> b!658471 e!378284))

(declare-fun c!76113 () Bool)

(assert (=> b!658471 (= c!76113 (bvslt j!136 index!984))))

(declare-fun lt!307794 () Unit!22803)

(assert (=> b!658471 (= lt!307794 e!378280)))

(declare-fun c!76115 () Bool)

(assert (=> b!658471 (= c!76115 (bvslt index!984 j!136))))

(declare-fun lt!307797 () Unit!22803)

(declare-fun e!378279 () Unit!22803)

(assert (=> b!658471 (= lt!307797 e!378279)))

(assert (=> b!658471 false))

(declare-fun b!658472 () Bool)

(declare-fun res!426978 () Bool)

(assert (=> b!658472 (=> (not res!426978) (not e!378282))))

(assert (=> b!658472 (= res!426978 (validKeyInArray!0 (select (arr!18562 a!2986) j!136)))))

(declare-fun b!658474 () Bool)

(assert (=> b!658474 false))

(declare-fun lt!307801 () Unit!22803)

(assert (=> b!658474 (= lt!307801 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307810 (select (arr!18562 a!2986) j!136) index!984 Nil!12507))))

(assert (=> b!658474 (arrayNoDuplicates!0 lt!307810 index!984 Nil!12507)))

(declare-fun lt!307791 () Unit!22803)

(assert (=> b!658474 (= lt!307791 (lemmaNoDuplicateFromThenFromBigger!0 lt!307810 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658474 (arrayNoDuplicates!0 lt!307810 #b00000000000000000000000000000000 Nil!12507)))

(declare-fun lt!307803 () Unit!22803)

(assert (=> b!658474 (= lt!307803 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12507))))

(assert (=> b!658474 (arrayContainsKey!0 lt!307810 (select (arr!18562 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307807 () Unit!22803)

(assert (=> b!658474 (= lt!307807 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307810 (select (arr!18562 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658474 e!378272))

(declare-fun res!426966 () Bool)

(assert (=> b!658474 (=> (not res!426966) (not e!378272))))

(assert (=> b!658474 (= res!426966 (arrayContainsKey!0 lt!307810 (select (arr!18562 a!2986) j!136) j!136))))

(declare-fun Unit!22811 () Unit!22803)

(assert (=> b!658474 (= e!378279 Unit!22811)))

(declare-fun res!426967 () Bool)

(assert (=> start!59640 (=> (not res!426967) (not e!378282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59640 (= res!426967 (validMask!0 mask!3053))))

(assert (=> start!59640 e!378282))

(assert (=> start!59640 true))

(declare-fun array_inv!14421 (array!38736) Bool)

(assert (=> start!59640 (array_inv!14421 a!2986)))

(declare-fun b!658473 () Bool)

(declare-fun Unit!22812 () Unit!22803)

(assert (=> b!658473 (= e!378279 Unit!22812)))

(assert (= (and start!59640 res!426967) b!658462))

(assert (= (and b!658462 res!426971) b!658472))

(assert (= (and b!658472 res!426978) b!658459))

(assert (= (and b!658459 res!426972) b!658452))

(assert (= (and b!658452 res!426969) b!658467))

(assert (= (and b!658467 res!426974) b!658468))

(assert (= (and b!658468 res!426968) b!658457))

(assert (= (and b!658457 res!426964) b!658470))

(assert (= (and b!658470 res!426975) b!658461))

(assert (= (and b!658461 res!426976) b!658458))

(assert (= (and b!658458 res!426973) b!658466))

(assert (= (and b!658466 res!426979) b!658454))

(assert (= (and b!658466 c!76112) b!658455))

(assert (= (and b!658466 (not c!76112)) b!658463))

(assert (= (and b!658466 c!76114) b!658471))

(assert (= (and b!658466 (not c!76114)) b!658456))

(assert (= (and b!658471 res!426965) b!658464))

(assert (= (and b!658464 (not res!426970)) b!658453))

(assert (= (and b!658453 res!426977) b!658465))

(assert (= (and b!658471 c!76113) b!658451))

(assert (= (and b!658471 (not c!76113)) b!658469))

(assert (= (and b!658471 c!76115) b!658474))

(assert (= (and b!658471 (not c!76115)) b!658473))

(assert (= (and b!658474 res!426966) b!658460))

(declare-fun m!631909 () Bool)

(assert (=> b!658458 m!631909))

(declare-fun m!631911 () Bool)

(assert (=> b!658458 m!631911))

(assert (=> b!658458 m!631911))

(declare-fun m!631913 () Bool)

(assert (=> b!658458 m!631913))

(declare-fun m!631915 () Bool)

(assert (=> b!658457 m!631915))

(declare-fun m!631917 () Bool)

(assert (=> b!658466 m!631917))

(assert (=> b!658466 m!631911))

(declare-fun m!631919 () Bool)

(assert (=> b!658466 m!631919))

(declare-fun m!631921 () Bool)

(assert (=> b!658466 m!631921))

(declare-fun m!631923 () Bool)

(assert (=> b!658466 m!631923))

(declare-fun m!631925 () Bool)

(assert (=> b!658466 m!631925))

(declare-fun m!631927 () Bool)

(assert (=> b!658466 m!631927))

(assert (=> b!658466 m!631911))

(declare-fun m!631929 () Bool)

(assert (=> b!658466 m!631929))

(declare-fun m!631931 () Bool)

(assert (=> b!658470 m!631931))

(declare-fun m!631933 () Bool)

(assert (=> start!59640 m!631933))

(declare-fun m!631935 () Bool)

(assert (=> start!59640 m!631935))

(declare-fun m!631937 () Bool)

(assert (=> b!658452 m!631937))

(declare-fun m!631939 () Bool)

(assert (=> b!658468 m!631939))

(assert (=> b!658461 m!631919))

(declare-fun m!631941 () Bool)

(assert (=> b!658461 m!631941))

(assert (=> b!658453 m!631911))

(assert (=> b!658453 m!631911))

(declare-fun m!631943 () Bool)

(assert (=> b!658453 m!631943))

(assert (=> b!658460 m!631911))

(assert (=> b!658460 m!631911))

(declare-fun m!631945 () Bool)

(assert (=> b!658460 m!631945))

(assert (=> b!658474 m!631911))

(declare-fun m!631947 () Bool)

(assert (=> b!658474 m!631947))

(assert (=> b!658474 m!631911))

(declare-fun m!631949 () Bool)

(assert (=> b!658474 m!631949))

(assert (=> b!658474 m!631911))

(assert (=> b!658474 m!631943))

(assert (=> b!658474 m!631911))

(declare-fun m!631951 () Bool)

(assert (=> b!658474 m!631951))

(declare-fun m!631953 () Bool)

(assert (=> b!658474 m!631953))

(assert (=> b!658474 m!631911))

(declare-fun m!631955 () Bool)

(assert (=> b!658474 m!631955))

(declare-fun m!631957 () Bool)

(assert (=> b!658474 m!631957))

(declare-fun m!631959 () Bool)

(assert (=> b!658474 m!631959))

(assert (=> b!658451 m!631911))

(declare-fun m!631961 () Bool)

(assert (=> b!658451 m!631961))

(assert (=> b!658451 m!631953))

(assert (=> b!658451 m!631911))

(declare-fun m!631963 () Bool)

(assert (=> b!658451 m!631963))

(assert (=> b!658451 m!631911))

(declare-fun m!631965 () Bool)

(assert (=> b!658451 m!631965))

(assert (=> b!658451 m!631911))

(declare-fun m!631967 () Bool)

(assert (=> b!658451 m!631967))

(declare-fun m!631969 () Bool)

(assert (=> b!658451 m!631969))

(assert (=> b!658451 m!631959))

(assert (=> b!658465 m!631911))

(assert (=> b!658465 m!631911))

(assert (=> b!658465 m!631945))

(declare-fun m!631971 () Bool)

(assert (=> b!658467 m!631971))

(declare-fun m!631973 () Bool)

(assert (=> b!658459 m!631973))

(assert (=> b!658472 m!631911))

(assert (=> b!658472 m!631911))

(declare-fun m!631975 () Bool)

(assert (=> b!658472 m!631975))

(assert (=> b!658471 m!631919))

(declare-fun m!631977 () Bool)

(assert (=> b!658471 m!631977))

(assert (=> b!658471 m!631911))

(check-sat (not b!658452) (not b!658458) (not b!658467) (not b!658459) (not b!658472) (not b!658468) (not b!658466) (not b!658460) (not start!59640) (not b!658457) (not b!658474) (not b!658451) (not b!658465) (not b!658453))
(check-sat)
