; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59582 () Bool)

(assert start!59582)

(declare-fun b!658363 () Bool)

(declare-fun e!378198 () Bool)

(declare-fun e!378205 () Bool)

(assert (=> b!658363 (= e!378198 e!378205)))

(declare-fun res!427015 () Bool)

(assert (=> b!658363 (=> (not res!427015) (not e!378205))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7009 0))(
  ( (MissingZero!7009 (index!30401 (_ BitVec 32))) (Found!7009 (index!30402 (_ BitVec 32))) (Intermediate!7009 (undefined!7821 Bool) (index!30403 (_ BitVec 32)) (x!59199 (_ BitVec 32))) (Undefined!7009) (MissingVacant!7009 (index!30404 (_ BitVec 32))) )
))
(declare-fun lt!307809 () SeekEntryResult!7009)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38751 0))(
  ( (array!38752 (arr!18572 (Array (_ BitVec 32) (_ BitVec 64))) (size!18937 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38751)

(assert (=> b!658363 (= res!427015 (and (= lt!307809 (Found!7009 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18572 a!2986) index!984) (select (arr!18572 a!2986) j!136))) (not (= (select (arr!18572 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38751 (_ BitVec 32)) SeekEntryResult!7009)

(assert (=> b!658363 (= lt!307809 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18572 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658364 () Bool)

(declare-fun e!378204 () Bool)

(assert (=> b!658364 (= e!378204 e!378198)))

(declare-fun res!427013 () Bool)

(assert (=> b!658364 (=> (not res!427013) (not e!378198))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!658364 (= res!427013 (= (select (store (arr!18572 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!307808 () array!38751)

(assert (=> b!658364 (= lt!307808 (array!38752 (store (arr!18572 a!2986) i!1108 k0!1786) (size!18937 a!2986)))))

(declare-fun b!658365 () Bool)

(declare-fun res!427010 () Bool)

(assert (=> b!658365 (=> (not res!427010) (not e!378204))))

(declare-datatypes ((List!12652 0))(
  ( (Nil!12649) (Cons!12648 (h!13693 (_ BitVec 64)) (t!18871 List!12652)) )
))
(declare-fun arrayNoDuplicates!0 (array!38751 (_ BitVec 32) List!12652) Bool)

(assert (=> b!658365 (= res!427010 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12649))))

(declare-fun res!427011 () Bool)

(declare-fun b!658366 () Bool)

(declare-fun arrayContainsKey!0 (array!38751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658366 (= res!427011 (arrayContainsKey!0 lt!307808 (select (arr!18572 a!2986) j!136) j!136))))

(declare-fun e!378202 () Bool)

(assert (=> b!658366 (=> (not res!427011) (not e!378202))))

(declare-fun e!378194 () Bool)

(assert (=> b!658366 (= e!378194 e!378202)))

(declare-fun b!658367 () Bool)

(assert (=> b!658367 (= e!378205 (not true))))

(declare-datatypes ((Unit!22862 0))(
  ( (Unit!22863) )
))
(declare-fun lt!307812 () Unit!22862)

(declare-fun e!378195 () Unit!22862)

(assert (=> b!658367 (= lt!307812 e!378195)))

(declare-fun c!76048 () Bool)

(declare-fun lt!307810 () SeekEntryResult!7009)

(assert (=> b!658367 (= c!76048 (= lt!307810 (Found!7009 index!984)))))

(declare-fun lt!307806 () Unit!22862)

(declare-fun e!378201 () Unit!22862)

(assert (=> b!658367 (= lt!307806 e!378201)))

(declare-fun c!76047 () Bool)

(assert (=> b!658367 (= c!76047 (= lt!307810 Undefined!7009))))

(declare-fun lt!307796 () (_ BitVec 64))

(assert (=> b!658367 (= lt!307810 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307796 lt!307808 mask!3053))))

(declare-fun e!378193 () Bool)

(assert (=> b!658367 e!378193))

(declare-fun res!427016 () Bool)

(assert (=> b!658367 (=> (not res!427016) (not e!378193))))

(declare-fun lt!307797 () (_ BitVec 32))

(declare-fun lt!307811 () SeekEntryResult!7009)

(assert (=> b!658367 (= res!427016 (= lt!307811 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307797 vacantSpotIndex!68 lt!307796 lt!307808 mask!3053)))))

(assert (=> b!658367 (= lt!307811 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307797 vacantSpotIndex!68 (select (arr!18572 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658367 (= lt!307796 (select (store (arr!18572 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307803 () Unit!22862)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38751 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22862)

(assert (=> b!658367 (= lt!307803 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307797 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658367 (= lt!307797 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658368 () Bool)

(declare-fun res!427014 () Bool)

(declare-fun e!378200 () Bool)

(assert (=> b!658368 (=> (not res!427014) (not e!378200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658368 (= res!427014 (validKeyInArray!0 (select (arr!18572 a!2986) j!136)))))

(declare-fun b!658369 () Bool)

(assert (=> b!658369 (= e!378202 (arrayContainsKey!0 lt!307808 (select (arr!18572 a!2986) j!136) index!984))))

(declare-fun b!658370 () Bool)

(declare-fun e!378206 () Unit!22862)

(declare-fun Unit!22864 () Unit!22862)

(assert (=> b!658370 (= e!378206 Unit!22864)))

(declare-fun b!658371 () Bool)

(declare-fun e!378203 () Bool)

(assert (=> b!658371 (= e!378203 (arrayContainsKey!0 lt!307808 (select (arr!18572 a!2986) j!136) index!984))))

(declare-fun b!658372 () Bool)

(assert (=> b!658372 (= e!378200 e!378204)))

(declare-fun res!427005 () Bool)

(assert (=> b!658372 (=> (not res!427005) (not e!378204))))

(declare-fun lt!307794 () SeekEntryResult!7009)

(assert (=> b!658372 (= res!427005 (or (= lt!307794 (MissingZero!7009 i!1108)) (= lt!307794 (MissingVacant!7009 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38751 (_ BitVec 32)) SeekEntryResult!7009)

(assert (=> b!658372 (= lt!307794 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658373 () Bool)

(assert (=> b!658373 false))

(declare-fun lt!307804 () Unit!22862)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38751 (_ BitVec 64) (_ BitVec 32) List!12652) Unit!22862)

(assert (=> b!658373 (= lt!307804 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307808 (select (arr!18572 a!2986) j!136) j!136 Nil!12649))))

(assert (=> b!658373 (arrayNoDuplicates!0 lt!307808 j!136 Nil!12649)))

(declare-fun lt!307805 () Unit!22862)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38751 (_ BitVec 32) (_ BitVec 32)) Unit!22862)

(assert (=> b!658373 (= lt!307805 (lemmaNoDuplicateFromThenFromBigger!0 lt!307808 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658373 (arrayNoDuplicates!0 lt!307808 #b00000000000000000000000000000000 Nil!12649)))

(declare-fun lt!307793 () Unit!22862)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38751 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12652) Unit!22862)

(assert (=> b!658373 (= lt!307793 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12649))))

(assert (=> b!658373 (arrayContainsKey!0 lt!307808 (select (arr!18572 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307802 () Unit!22862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38751 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22862)

(assert (=> b!658373 (= lt!307802 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307808 (select (arr!18572 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22865 () Unit!22862)

(assert (=> b!658373 (= e!378206 Unit!22865)))

(declare-fun b!658374 () Bool)

(declare-fun res!427018 () Bool)

(assert (=> b!658374 (=> (not res!427018) (not e!378200))))

(assert (=> b!658374 (= res!427018 (and (= (size!18937 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18937 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18937 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658375 () Bool)

(declare-fun Unit!22866 () Unit!22862)

(assert (=> b!658375 (= e!378201 Unit!22866)))

(assert (=> b!658375 false))

(declare-fun b!658376 () Bool)

(assert (=> b!658376 (= e!378193 (= lt!307809 lt!307811))))

(declare-fun b!658378 () Bool)

(declare-fun Unit!22867 () Unit!22862)

(assert (=> b!658378 (= e!378195 Unit!22867)))

(declare-fun res!427008 () Bool)

(assert (=> b!658378 (= res!427008 (= (select (store (arr!18572 a!2986) i!1108 k0!1786) index!984) (select (arr!18572 a!2986) j!136)))))

(declare-fun e!378196 () Bool)

(assert (=> b!658378 (=> (not res!427008) (not e!378196))))

(assert (=> b!658378 e!378196))

(declare-fun c!76050 () Bool)

(assert (=> b!658378 (= c!76050 (bvslt j!136 index!984))))

(declare-fun lt!307801 () Unit!22862)

(assert (=> b!658378 (= lt!307801 e!378206)))

(declare-fun c!76049 () Bool)

(assert (=> b!658378 (= c!76049 (bvslt index!984 j!136))))

(declare-fun lt!307800 () Unit!22862)

(declare-fun e!378197 () Unit!22862)

(assert (=> b!658378 (= lt!307800 e!378197)))

(assert (=> b!658378 false))

(declare-fun b!658379 () Bool)

(declare-fun res!427003 () Bool)

(assert (=> b!658379 (=> (not res!427003) (not e!378204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38751 (_ BitVec 32)) Bool)

(assert (=> b!658379 (= res!427003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658380 () Bool)

(declare-fun Unit!22868 () Unit!22862)

(assert (=> b!658380 (= e!378197 Unit!22868)))

(declare-fun b!658381 () Bool)

(declare-fun res!427004 () Bool)

(assert (=> b!658381 (=> (not res!427004) (not e!378200))))

(assert (=> b!658381 (= res!427004 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658382 () Bool)

(assert (=> b!658382 false))

(declare-fun lt!307799 () Unit!22862)

(assert (=> b!658382 (= lt!307799 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307808 (select (arr!18572 a!2986) j!136) index!984 Nil!12649))))

(assert (=> b!658382 (arrayNoDuplicates!0 lt!307808 index!984 Nil!12649)))

(declare-fun lt!307798 () Unit!22862)

(assert (=> b!658382 (= lt!307798 (lemmaNoDuplicateFromThenFromBigger!0 lt!307808 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658382 (arrayNoDuplicates!0 lt!307808 #b00000000000000000000000000000000 Nil!12649)))

(declare-fun lt!307807 () Unit!22862)

(assert (=> b!658382 (= lt!307807 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12649))))

(assert (=> b!658382 (arrayContainsKey!0 lt!307808 (select (arr!18572 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307795 () Unit!22862)

(assert (=> b!658382 (= lt!307795 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307808 (select (arr!18572 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658382 e!378203))

(declare-fun res!427006 () Bool)

(assert (=> b!658382 (=> (not res!427006) (not e!378203))))

(assert (=> b!658382 (= res!427006 (arrayContainsKey!0 lt!307808 (select (arr!18572 a!2986) j!136) j!136))))

(declare-fun Unit!22869 () Unit!22862)

(assert (=> b!658382 (= e!378197 Unit!22869)))

(declare-fun b!658383 () Bool)

(declare-fun res!427017 () Bool)

(assert (=> b!658383 (= res!427017 (bvsge j!136 index!984))))

(assert (=> b!658383 (=> res!427017 e!378194)))

(assert (=> b!658383 (= e!378196 e!378194)))

(declare-fun b!658384 () Bool)

(declare-fun res!427012 () Bool)

(assert (=> b!658384 (=> (not res!427012) (not e!378200))))

(assert (=> b!658384 (= res!427012 (validKeyInArray!0 k0!1786))))

(declare-fun b!658385 () Bool)

(declare-fun Unit!22870 () Unit!22862)

(assert (=> b!658385 (= e!378195 Unit!22870)))

(declare-fun b!658386 () Bool)

(declare-fun res!427007 () Bool)

(assert (=> b!658386 (=> (not res!427007) (not e!378204))))

(assert (=> b!658386 (= res!427007 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18572 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!427009 () Bool)

(assert (=> start!59582 (=> (not res!427009) (not e!378200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59582 (= res!427009 (validMask!0 mask!3053))))

(assert (=> start!59582 e!378200))

(assert (=> start!59582 true))

(declare-fun array_inv!14455 (array!38751) Bool)

(assert (=> start!59582 (array_inv!14455 a!2986)))

(declare-fun b!658377 () Bool)

(declare-fun Unit!22871 () Unit!22862)

(assert (=> b!658377 (= e!378201 Unit!22871)))

(assert (= (and start!59582 res!427009) b!658374))

(assert (= (and b!658374 res!427018) b!658368))

(assert (= (and b!658368 res!427014) b!658384))

(assert (= (and b!658384 res!427012) b!658381))

(assert (= (and b!658381 res!427004) b!658372))

(assert (= (and b!658372 res!427005) b!658379))

(assert (= (and b!658379 res!427003) b!658365))

(assert (= (and b!658365 res!427010) b!658386))

(assert (= (and b!658386 res!427007) b!658364))

(assert (= (and b!658364 res!427013) b!658363))

(assert (= (and b!658363 res!427015) b!658367))

(assert (= (and b!658367 res!427016) b!658376))

(assert (= (and b!658367 c!76047) b!658375))

(assert (= (and b!658367 (not c!76047)) b!658377))

(assert (= (and b!658367 c!76048) b!658378))

(assert (= (and b!658367 (not c!76048)) b!658385))

(assert (= (and b!658378 res!427008) b!658383))

(assert (= (and b!658383 (not res!427017)) b!658366))

(assert (= (and b!658366 res!427011) b!658369))

(assert (= (and b!658378 c!76050) b!658373))

(assert (= (and b!658378 (not c!76050)) b!658370))

(assert (= (and b!658378 c!76049) b!658382))

(assert (= (and b!658378 (not c!76049)) b!658380))

(assert (= (and b!658382 res!427006) b!658371))

(declare-fun m!630855 () Bool)

(assert (=> b!658371 m!630855))

(assert (=> b!658371 m!630855))

(declare-fun m!630857 () Bool)

(assert (=> b!658371 m!630857))

(declare-fun m!630859 () Bool)

(assert (=> b!658379 m!630859))

(declare-fun m!630861 () Bool)

(assert (=> b!658373 m!630861))

(assert (=> b!658373 m!630855))

(declare-fun m!630863 () Bool)

(assert (=> b!658373 m!630863))

(assert (=> b!658373 m!630855))

(declare-fun m!630865 () Bool)

(assert (=> b!658373 m!630865))

(assert (=> b!658373 m!630855))

(declare-fun m!630867 () Bool)

(assert (=> b!658373 m!630867))

(assert (=> b!658373 m!630855))

(declare-fun m!630869 () Bool)

(assert (=> b!658373 m!630869))

(declare-fun m!630871 () Bool)

(assert (=> b!658373 m!630871))

(declare-fun m!630873 () Bool)

(assert (=> b!658373 m!630873))

(assert (=> b!658382 m!630855))

(assert (=> b!658382 m!630863))

(assert (=> b!658382 m!630855))

(declare-fun m!630875 () Bool)

(assert (=> b!658382 m!630875))

(assert (=> b!658382 m!630855))

(declare-fun m!630877 () Bool)

(assert (=> b!658382 m!630877))

(declare-fun m!630879 () Bool)

(assert (=> b!658382 m!630879))

(declare-fun m!630881 () Bool)

(assert (=> b!658382 m!630881))

(assert (=> b!658382 m!630855))

(declare-fun m!630883 () Bool)

(assert (=> b!658382 m!630883))

(assert (=> b!658382 m!630855))

(declare-fun m!630885 () Bool)

(assert (=> b!658382 m!630885))

(assert (=> b!658382 m!630873))

(declare-fun m!630887 () Bool)

(assert (=> b!658372 m!630887))

(assert (=> b!658368 m!630855))

(assert (=> b!658368 m!630855))

(declare-fun m!630889 () Bool)

(assert (=> b!658368 m!630889))

(assert (=> b!658366 m!630855))

(assert (=> b!658366 m!630855))

(assert (=> b!658366 m!630883))

(declare-fun m!630891 () Bool)

(assert (=> start!59582 m!630891))

(declare-fun m!630893 () Bool)

(assert (=> start!59582 m!630893))

(declare-fun m!630895 () Bool)

(assert (=> b!658364 m!630895))

(declare-fun m!630897 () Bool)

(assert (=> b!658364 m!630897))

(declare-fun m!630899 () Bool)

(assert (=> b!658365 m!630899))

(declare-fun m!630901 () Bool)

(assert (=> b!658363 m!630901))

(assert (=> b!658363 m!630855))

(assert (=> b!658363 m!630855))

(declare-fun m!630903 () Bool)

(assert (=> b!658363 m!630903))

(declare-fun m!630905 () Bool)

(assert (=> b!658386 m!630905))

(declare-fun m!630907 () Bool)

(assert (=> b!658384 m!630907))

(assert (=> b!658369 m!630855))

(assert (=> b!658369 m!630855))

(assert (=> b!658369 m!630857))

(assert (=> b!658378 m!630895))

(declare-fun m!630909 () Bool)

(assert (=> b!658378 m!630909))

(assert (=> b!658378 m!630855))

(declare-fun m!630911 () Bool)

(assert (=> b!658367 m!630911))

(declare-fun m!630913 () Bool)

(assert (=> b!658367 m!630913))

(declare-fun m!630915 () Bool)

(assert (=> b!658367 m!630915))

(assert (=> b!658367 m!630855))

(declare-fun m!630917 () Bool)

(assert (=> b!658367 m!630917))

(assert (=> b!658367 m!630895))

(declare-fun m!630919 () Bool)

(assert (=> b!658367 m!630919))

(assert (=> b!658367 m!630855))

(declare-fun m!630921 () Bool)

(assert (=> b!658367 m!630921))

(declare-fun m!630923 () Bool)

(assert (=> b!658381 m!630923))

(check-sat (not b!658366) (not b!658373) (not b!658367) (not b!658365) (not b!658379) (not b!658363) (not b!658371) (not b!658382) (not b!658368) (not b!658369) (not b!658384) (not start!59582) (not b!658381) (not b!658372))
(check-sat)
