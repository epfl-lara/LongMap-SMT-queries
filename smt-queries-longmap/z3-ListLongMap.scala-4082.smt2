; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55974 () Bool)

(assert start!55974)

(declare-fun b!614729 () Bool)

(assert (=> b!614729 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37458 0))(
  ( (array!37459 (arr!17975 (Array (_ BitVec 32) (_ BitVec 64))) (size!18340 (_ BitVec 32))) )
))
(declare-fun lt!282084 () array!37458)

(declare-datatypes ((Unit!19866 0))(
  ( (Unit!19867) )
))
(declare-fun lt!282086 () Unit!19866)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37458)

(declare-datatypes ((List!12055 0))(
  ( (Nil!12052) (Cons!12051 (h!13096 (_ BitVec 64)) (t!18274 List!12055)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37458 (_ BitVec 64) (_ BitVec 32) List!12055) Unit!19866)

(assert (=> b!614729 (= lt!282086 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282084 (select (arr!17975 a!2986) j!136) index!984 Nil!12052))))

(declare-fun arrayNoDuplicates!0 (array!37458 (_ BitVec 32) List!12055) Bool)

(assert (=> b!614729 (arrayNoDuplicates!0 lt!282084 index!984 Nil!12052)))

(declare-fun lt!282099 () Unit!19866)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37458 (_ BitVec 32) (_ BitVec 32)) Unit!19866)

(assert (=> b!614729 (= lt!282099 (lemmaNoDuplicateFromThenFromBigger!0 lt!282084 #b00000000000000000000000000000000 index!984))))

(assert (=> b!614729 (arrayNoDuplicates!0 lt!282084 #b00000000000000000000000000000000 Nil!12052)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!282103 () Unit!19866)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12055) Unit!19866)

(assert (=> b!614729 (= lt!282103 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12052))))

(declare-fun arrayContainsKey!0 (array!37458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!614729 (arrayContainsKey!0 lt!282084 (select (arr!17975 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282095 () Unit!19866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19866)

(assert (=> b!614729 (= lt!282095 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282084 (select (arr!17975 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352437 () Bool)

(assert (=> b!614729 e!352437))

(declare-fun res!396007 () Bool)

(assert (=> b!614729 (=> (not res!396007) (not e!352437))))

(assert (=> b!614729 (= res!396007 (arrayContainsKey!0 lt!282084 (select (arr!17975 a!2986) j!136) j!136))))

(declare-fun e!352444 () Unit!19866)

(declare-fun Unit!19868 () Unit!19866)

(assert (=> b!614729 (= e!352444 Unit!19868)))

(declare-fun b!614730 () Bool)

(declare-fun e!352448 () Unit!19866)

(declare-fun Unit!19869 () Unit!19866)

(assert (=> b!614730 (= e!352448 Unit!19869)))

(declare-fun b!614731 () Bool)

(declare-fun e!352446 () Unit!19866)

(declare-fun Unit!19870 () Unit!19866)

(assert (=> b!614731 (= e!352446 Unit!19870)))

(declare-fun b!614732 () Bool)

(declare-fun e!352436 () Bool)

(declare-datatypes ((SeekEntryResult!6412 0))(
  ( (MissingZero!6412 (index!27932 (_ BitVec 32))) (Found!6412 (index!27933 (_ BitVec 32))) (Intermediate!6412 (undefined!7224 Bool) (index!27934 (_ BitVec 32)) (x!56743 (_ BitVec 32))) (Undefined!6412) (MissingVacant!6412 (index!27935 (_ BitVec 32))) )
))
(declare-fun lt!282090 () SeekEntryResult!6412)

(declare-fun lt!282097 () SeekEntryResult!6412)

(assert (=> b!614732 (= e!352436 (= lt!282090 lt!282097))))

(declare-fun b!614733 () Bool)

(declare-fun Unit!19871 () Unit!19866)

(assert (=> b!614733 (= e!352444 Unit!19871)))

(declare-fun b!614734 () Bool)

(declare-fun e!352440 () Unit!19866)

(declare-fun Unit!19872 () Unit!19866)

(assert (=> b!614734 (= e!352440 Unit!19872)))

(declare-fun res!395999 () Bool)

(assert (=> b!614734 (= res!395999 (= (select (store (arr!17975 a!2986) i!1108 k0!1786) index!984) (select (arr!17975 a!2986) j!136)))))

(declare-fun e!352438 () Bool)

(assert (=> b!614734 (=> (not res!395999) (not e!352438))))

(assert (=> b!614734 e!352438))

(declare-fun c!69736 () Bool)

(assert (=> b!614734 (= c!69736 (bvslt j!136 index!984))))

(declare-fun lt!282093 () Unit!19866)

(assert (=> b!614734 (= lt!282093 e!352448)))

(declare-fun c!69735 () Bool)

(assert (=> b!614734 (= c!69735 (bvslt index!984 j!136))))

(declare-fun lt!282098 () Unit!19866)

(assert (=> b!614734 (= lt!282098 e!352444)))

(assert (=> b!614734 false))

(declare-fun b!614736 () Bool)

(declare-fun Unit!19873 () Unit!19866)

(assert (=> b!614736 (= e!352446 Unit!19873)))

(assert (=> b!614736 false))

(declare-fun b!614737 () Bool)

(declare-fun e!352443 () Bool)

(declare-fun e!352441 () Bool)

(assert (=> b!614737 (= e!352443 e!352441)))

(declare-fun res!396004 () Bool)

(assert (=> b!614737 (=> (not res!396004) (not e!352441))))

(declare-fun lt!282096 () SeekEntryResult!6412)

(assert (=> b!614737 (= res!396004 (or (= lt!282096 (MissingZero!6412 i!1108)) (= lt!282096 (MissingVacant!6412 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37458 (_ BitVec 32)) SeekEntryResult!6412)

(assert (=> b!614737 (= lt!282096 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!614738 () Bool)

(declare-fun e!352447 () Bool)

(assert (=> b!614738 (= e!352441 e!352447)))

(declare-fun res!395997 () Bool)

(assert (=> b!614738 (=> (not res!395997) (not e!352447))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!614738 (= res!395997 (= (select (store (arr!17975 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!614738 (= lt!282084 (array!37459 (store (arr!17975 a!2986) i!1108 k0!1786) (size!18340 a!2986)))))

(declare-fun b!614739 () Bool)

(declare-fun e!352442 () Bool)

(assert (=> b!614739 (= e!352447 e!352442)))

(declare-fun res!395993 () Bool)

(assert (=> b!614739 (=> (not res!395993) (not e!352442))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!614739 (= res!395993 (and (= lt!282090 (Found!6412 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17975 a!2986) index!984) (select (arr!17975 a!2986) j!136))) (not (= (select (arr!17975 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37458 (_ BitVec 32)) SeekEntryResult!6412)

(assert (=> b!614739 (= lt!282090 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17975 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!614740 () Bool)

(assert (=> b!614740 (= e!352442 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!282092 () Unit!19866)

(assert (=> b!614740 (= lt!282092 e!352440)))

(declare-fun c!69738 () Bool)

(declare-fun lt!282101 () SeekEntryResult!6412)

(assert (=> b!614740 (= c!69738 (= lt!282101 (Found!6412 index!984)))))

(declare-fun lt!282087 () Unit!19866)

(assert (=> b!614740 (= lt!282087 e!352446)))

(declare-fun c!69737 () Bool)

(assert (=> b!614740 (= c!69737 (= lt!282101 Undefined!6412))))

(declare-fun lt!282088 () (_ BitVec 64))

(assert (=> b!614740 (= lt!282101 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282088 lt!282084 mask!3053))))

(assert (=> b!614740 e!352436))

(declare-fun res!396008 () Bool)

(assert (=> b!614740 (=> (not res!396008) (not e!352436))))

(declare-fun lt!282085 () (_ BitVec 32))

(assert (=> b!614740 (= res!396008 (= lt!282097 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282085 vacantSpotIndex!68 lt!282088 lt!282084 mask!3053)))))

(assert (=> b!614740 (= lt!282097 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282085 vacantSpotIndex!68 (select (arr!17975 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!614740 (= lt!282088 (select (store (arr!17975 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282102 () Unit!19866)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37458 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19866)

(assert (=> b!614740 (= lt!282102 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282085 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!614740 (= lt!282085 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!614741 () Bool)

(declare-fun e!352445 () Bool)

(assert (=> b!614741 (= e!352445 (arrayContainsKey!0 lt!282084 (select (arr!17975 a!2986) j!136) index!984))))

(declare-fun res!396006 () Bool)

(declare-fun b!614742 () Bool)

(assert (=> b!614742 (= res!396006 (arrayContainsKey!0 lt!282084 (select (arr!17975 a!2986) j!136) j!136))))

(assert (=> b!614742 (=> (not res!396006) (not e!352445))))

(declare-fun e!352439 () Bool)

(assert (=> b!614742 (= e!352439 e!352445)))

(declare-fun b!614743 () Bool)

(declare-fun res!396001 () Bool)

(assert (=> b!614743 (=> (not res!396001) (not e!352441))))

(assert (=> b!614743 (= res!396001 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17975 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!614744 () Bool)

(declare-fun res!395996 () Bool)

(assert (=> b!614744 (=> (not res!395996) (not e!352443))))

(assert (=> b!614744 (= res!395996 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!614745 () Bool)

(declare-fun res!396000 () Bool)

(assert (=> b!614745 (=> (not res!396000) (not e!352443))))

(assert (=> b!614745 (= res!396000 (and (= (size!18340 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18340 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18340 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!395998 () Bool)

(assert (=> start!55974 (=> (not res!395998) (not e!352443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55974 (= res!395998 (validMask!0 mask!3053))))

(assert (=> start!55974 e!352443))

(assert (=> start!55974 true))

(declare-fun array_inv!13858 (array!37458) Bool)

(assert (=> start!55974 (array_inv!13858 a!2986)))

(declare-fun b!614735 () Bool)

(declare-fun res!396003 () Bool)

(assert (=> b!614735 (=> (not res!396003) (not e!352441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37458 (_ BitVec 32)) Bool)

(assert (=> b!614735 (= res!396003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!614746 () Bool)

(declare-fun res!396005 () Bool)

(assert (=> b!614746 (=> (not res!396005) (not e!352441))))

(assert (=> b!614746 (= res!396005 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12052))))

(declare-fun b!614747 () Bool)

(declare-fun Unit!19874 () Unit!19866)

(assert (=> b!614747 (= e!352440 Unit!19874)))

(declare-fun b!614748 () Bool)

(declare-fun res!395995 () Bool)

(assert (=> b!614748 (=> (not res!395995) (not e!352443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!614748 (= res!395995 (validKeyInArray!0 k0!1786))))

(declare-fun b!614749 () Bool)

(declare-fun res!395994 () Bool)

(assert (=> b!614749 (=> (not res!395994) (not e!352443))))

(assert (=> b!614749 (= res!395994 (validKeyInArray!0 (select (arr!17975 a!2986) j!136)))))

(declare-fun b!614750 () Bool)

(assert (=> b!614750 (= e!352437 (arrayContainsKey!0 lt!282084 (select (arr!17975 a!2986) j!136) index!984))))

(declare-fun b!614751 () Bool)

(declare-fun res!396002 () Bool)

(assert (=> b!614751 (= res!396002 (bvsge j!136 index!984))))

(assert (=> b!614751 (=> res!396002 e!352439)))

(assert (=> b!614751 (= e!352438 e!352439)))

(declare-fun b!614752 () Bool)

(assert (=> b!614752 false))

(declare-fun lt!282100 () Unit!19866)

(assert (=> b!614752 (= lt!282100 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282084 (select (arr!17975 a!2986) j!136) j!136 Nil!12052))))

(assert (=> b!614752 (arrayNoDuplicates!0 lt!282084 j!136 Nil!12052)))

(declare-fun lt!282091 () Unit!19866)

(assert (=> b!614752 (= lt!282091 (lemmaNoDuplicateFromThenFromBigger!0 lt!282084 #b00000000000000000000000000000000 j!136))))

(assert (=> b!614752 (arrayNoDuplicates!0 lt!282084 #b00000000000000000000000000000000 Nil!12052)))

(declare-fun lt!282094 () Unit!19866)

(assert (=> b!614752 (= lt!282094 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12052))))

(assert (=> b!614752 (arrayContainsKey!0 lt!282084 (select (arr!17975 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282089 () Unit!19866)

(assert (=> b!614752 (= lt!282089 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282084 (select (arr!17975 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19875 () Unit!19866)

(assert (=> b!614752 (= e!352448 Unit!19875)))

(assert (= (and start!55974 res!395998) b!614745))

(assert (= (and b!614745 res!396000) b!614749))

(assert (= (and b!614749 res!395994) b!614748))

(assert (= (and b!614748 res!395995) b!614744))

(assert (= (and b!614744 res!395996) b!614737))

(assert (= (and b!614737 res!396004) b!614735))

(assert (= (and b!614735 res!396003) b!614746))

(assert (= (and b!614746 res!396005) b!614743))

(assert (= (and b!614743 res!396001) b!614738))

(assert (= (and b!614738 res!395997) b!614739))

(assert (= (and b!614739 res!395993) b!614740))

(assert (= (and b!614740 res!396008) b!614732))

(assert (= (and b!614740 c!69737) b!614736))

(assert (= (and b!614740 (not c!69737)) b!614731))

(assert (= (and b!614740 c!69738) b!614734))

(assert (= (and b!614740 (not c!69738)) b!614747))

(assert (= (and b!614734 res!395999) b!614751))

(assert (= (and b!614751 (not res!396002)) b!614742))

(assert (= (and b!614742 res!396006) b!614741))

(assert (= (and b!614734 c!69736) b!614752))

(assert (= (and b!614734 (not c!69736)) b!614730))

(assert (= (and b!614734 c!69735) b!614729))

(assert (= (and b!614734 (not c!69735)) b!614733))

(assert (= (and b!614729 res!396007) b!614750))

(declare-fun m!590443 () Bool)

(assert (=> b!614738 m!590443))

(declare-fun m!590445 () Bool)

(assert (=> b!614738 m!590445))

(assert (=> b!614734 m!590443))

(declare-fun m!590447 () Bool)

(assert (=> b!614734 m!590447))

(declare-fun m!590449 () Bool)

(assert (=> b!614734 m!590449))

(assert (=> b!614749 m!590449))

(assert (=> b!614749 m!590449))

(declare-fun m!590451 () Bool)

(assert (=> b!614749 m!590451))

(declare-fun m!590453 () Bool)

(assert (=> b!614746 m!590453))

(declare-fun m!590455 () Bool)

(assert (=> b!614735 m!590455))

(assert (=> b!614750 m!590449))

(assert (=> b!614750 m!590449))

(declare-fun m!590457 () Bool)

(assert (=> b!614750 m!590457))

(declare-fun m!590459 () Bool)

(assert (=> b!614739 m!590459))

(assert (=> b!614739 m!590449))

(assert (=> b!614739 m!590449))

(declare-fun m!590461 () Bool)

(assert (=> b!614739 m!590461))

(declare-fun m!590463 () Bool)

(assert (=> start!55974 m!590463))

(declare-fun m!590465 () Bool)

(assert (=> start!55974 m!590465))

(declare-fun m!590467 () Bool)

(assert (=> b!614752 m!590467))

(assert (=> b!614752 m!590449))

(assert (=> b!614752 m!590449))

(declare-fun m!590469 () Bool)

(assert (=> b!614752 m!590469))

(assert (=> b!614752 m!590449))

(declare-fun m!590471 () Bool)

(assert (=> b!614752 m!590471))

(declare-fun m!590473 () Bool)

(assert (=> b!614752 m!590473))

(declare-fun m!590475 () Bool)

(assert (=> b!614752 m!590475))

(assert (=> b!614752 m!590449))

(declare-fun m!590477 () Bool)

(assert (=> b!614752 m!590477))

(declare-fun m!590479 () Bool)

(assert (=> b!614752 m!590479))

(declare-fun m!590481 () Bool)

(assert (=> b!614740 m!590481))

(assert (=> b!614740 m!590449))

(declare-fun m!590483 () Bool)

(assert (=> b!614740 m!590483))

(assert (=> b!614740 m!590449))

(assert (=> b!614740 m!590443))

(declare-fun m!590485 () Bool)

(assert (=> b!614740 m!590485))

(declare-fun m!590487 () Bool)

(assert (=> b!614740 m!590487))

(declare-fun m!590489 () Bool)

(assert (=> b!614740 m!590489))

(declare-fun m!590491 () Bool)

(assert (=> b!614740 m!590491))

(declare-fun m!590493 () Bool)

(assert (=> b!614737 m!590493))

(assert (=> b!614741 m!590449))

(assert (=> b!614741 m!590449))

(assert (=> b!614741 m!590457))

(assert (=> b!614742 m!590449))

(assert (=> b!614742 m!590449))

(declare-fun m!590495 () Bool)

(assert (=> b!614742 m!590495))

(declare-fun m!590497 () Bool)

(assert (=> b!614743 m!590497))

(declare-fun m!590499 () Bool)

(assert (=> b!614744 m!590499))

(declare-fun m!590501 () Bool)

(assert (=> b!614748 m!590501))

(assert (=> b!614729 m!590467))

(assert (=> b!614729 m!590449))

(assert (=> b!614729 m!590449))

(declare-fun m!590503 () Bool)

(assert (=> b!614729 m!590503))

(assert (=> b!614729 m!590449))

(assert (=> b!614729 m!590495))

(declare-fun m!590505 () Bool)

(assert (=> b!614729 m!590505))

(declare-fun m!590507 () Bool)

(assert (=> b!614729 m!590507))

(assert (=> b!614729 m!590449))

(declare-fun m!590509 () Bool)

(assert (=> b!614729 m!590509))

(assert (=> b!614729 m!590449))

(declare-fun m!590511 () Bool)

(assert (=> b!614729 m!590511))

(assert (=> b!614729 m!590479))

(check-sat (not b!614737) (not b!614752) (not b!614735) (not b!614739) (not b!614750) (not b!614749) (not b!614729) (not b!614742) (not start!55974) (not b!614741) (not b!614748) (not b!614740) (not b!614744) (not b!614746))
(check-sat)
