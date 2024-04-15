; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54990 () Bool)

(assert start!54990)

(declare-fun b!601732 () Bool)

(declare-fun res!386378 () Bool)

(declare-fun e!344097 () Bool)

(assert (=> b!601732 (=> (not res!386378) (not e!344097))))

(declare-datatypes ((array!37158 0))(
  ( (array!37159 (arr!17837 (Array (_ BitVec 32) (_ BitVec 64))) (size!18202 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37158)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37158 (_ BitVec 32)) Bool)

(assert (=> b!601732 (= res!386378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601733 () Bool)

(declare-datatypes ((Unit!19026 0))(
  ( (Unit!19027) )
))
(declare-fun e!344093 () Unit!19026)

(declare-fun Unit!19028 () Unit!19026)

(assert (=> b!601733 (= e!344093 Unit!19028)))

(declare-fun b!601734 () Bool)

(declare-fun res!386377 () Bool)

(declare-fun e!344102 () Bool)

(assert (=> b!601734 (=> (not res!386377) (not e!344102))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601734 (= res!386377 (validKeyInArray!0 (select (arr!17837 a!2986) j!136)))))

(declare-fun b!601735 () Bool)

(declare-fun e!344092 () Bool)

(assert (=> b!601735 (= e!344097 e!344092)))

(declare-fun res!386379 () Bool)

(assert (=> b!601735 (=> (not res!386379) (not e!344092))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!601735 (= res!386379 (= (select (store (arr!17837 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!273889 () array!37158)

(assert (=> b!601735 (= lt!273889 (array!37159 (store (arr!17837 a!2986) i!1108 k0!1786) (size!18202 a!2986)))))

(declare-fun b!601736 () Bool)

(declare-fun e!344103 () Bool)

(declare-fun e!344098 () Bool)

(assert (=> b!601736 (= e!344103 e!344098)))

(declare-fun res!386380 () Bool)

(assert (=> b!601736 (=> res!386380 e!344098)))

(declare-fun lt!273881 () (_ BitVec 64))

(declare-fun lt!273880 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601736 (= res!386380 (or (not (= (select (arr!17837 a!2986) j!136) lt!273881)) (not (= (select (arr!17837 a!2986) j!136) lt!273880)) (bvsge j!136 index!984)))))

(declare-fun b!601737 () Bool)

(declare-fun e!344091 () Bool)

(declare-fun arrayContainsKey!0 (array!37158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601737 (= e!344091 (arrayContainsKey!0 lt!273889 (select (arr!17837 a!2986) j!136) index!984))))

(declare-fun b!601738 () Bool)

(declare-fun res!386389 () Bool)

(assert (=> b!601738 (=> (not res!386389) (not e!344097))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!601738 (= res!386389 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17837 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601739 () Bool)

(declare-fun e!344100 () Bool)

(declare-datatypes ((SeekEntryResult!6274 0))(
  ( (MissingZero!6274 (index!27356 (_ BitVec 32))) (Found!6274 (index!27357 (_ BitVec 32))) (Intermediate!6274 (undefined!7086 Bool) (index!27358 (_ BitVec 32)) (x!56165 (_ BitVec 32))) (Undefined!6274) (MissingVacant!6274 (index!27359 (_ BitVec 32))) )
))
(declare-fun lt!273888 () SeekEntryResult!6274)

(declare-fun lt!273875 () SeekEntryResult!6274)

(assert (=> b!601739 (= e!344100 (= lt!273888 lt!273875))))

(declare-fun b!601740 () Bool)

(assert (=> b!601740 (= e!344098 e!344091)))

(declare-fun res!386393 () Bool)

(assert (=> b!601740 (=> (not res!386393) (not e!344091))))

(assert (=> b!601740 (= res!386393 (arrayContainsKey!0 lt!273889 (select (arr!17837 a!2986) j!136) j!136))))

(declare-fun b!601741 () Bool)

(declare-fun res!386383 () Bool)

(assert (=> b!601741 (=> (not res!386383) (not e!344102))))

(assert (=> b!601741 (= res!386383 (validKeyInArray!0 k0!1786))))

(declare-fun b!601742 () Bool)

(declare-fun e!344096 () Bool)

(declare-fun e!344094 () Bool)

(assert (=> b!601742 (= e!344096 e!344094)))

(declare-fun res!386388 () Bool)

(assert (=> b!601742 (=> res!386388 e!344094)))

(assert (=> b!601742 (= res!386388 (or (not (= (select (arr!17837 a!2986) j!136) lt!273881)) (not (= (select (arr!17837 a!2986) j!136) lt!273880))))))

(assert (=> b!601742 e!344103))

(declare-fun res!386387 () Bool)

(assert (=> b!601742 (=> (not res!386387) (not e!344103))))

(assert (=> b!601742 (= res!386387 (= lt!273880 (select (arr!17837 a!2986) j!136)))))

(assert (=> b!601742 (= lt!273880 (select (store (arr!17837 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!601743 () Bool)

(declare-fun e!344095 () Bool)

(assert (=> b!601743 (= e!344095 (not e!344096))))

(declare-fun res!386390 () Bool)

(assert (=> b!601743 (=> res!386390 e!344096)))

(declare-fun lt!273887 () SeekEntryResult!6274)

(assert (=> b!601743 (= res!386390 (not (= lt!273887 (Found!6274 index!984))))))

(declare-fun lt!273884 () Unit!19026)

(assert (=> b!601743 (= lt!273884 e!344093)))

(declare-fun c!68046 () Bool)

(assert (=> b!601743 (= c!68046 (= lt!273887 Undefined!6274))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37158 (_ BitVec 32)) SeekEntryResult!6274)

(assert (=> b!601743 (= lt!273887 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273881 lt!273889 mask!3053))))

(assert (=> b!601743 e!344100))

(declare-fun res!386385 () Bool)

(assert (=> b!601743 (=> (not res!386385) (not e!344100))))

(declare-fun lt!273882 () (_ BitVec 32))

(assert (=> b!601743 (= res!386385 (= lt!273875 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273882 vacantSpotIndex!68 lt!273881 lt!273889 mask!3053)))))

(assert (=> b!601743 (= lt!273875 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273882 vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601743 (= lt!273881 (select (store (arr!17837 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273885 () Unit!19026)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37158 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19026)

(assert (=> b!601743 (= lt!273885 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273882 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601743 (= lt!273882 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!386376 () Bool)

(assert (=> start!54990 (=> (not res!386376) (not e!344102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54990 (= res!386376 (validMask!0 mask!3053))))

(assert (=> start!54990 e!344102))

(assert (=> start!54990 true))

(declare-fun array_inv!13720 (array!37158) Bool)

(assert (=> start!54990 (array_inv!13720 a!2986)))

(declare-fun b!601744 () Bool)

(assert (=> b!601744 (= e!344092 e!344095)))

(declare-fun res!386392 () Bool)

(assert (=> b!601744 (=> (not res!386392) (not e!344095))))

(assert (=> b!601744 (= res!386392 (and (= lt!273888 (Found!6274 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17837 a!2986) index!984) (select (arr!17837 a!2986) j!136))) (not (= (select (arr!17837 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601744 (= lt!273888 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601745 () Bool)

(declare-fun e!344101 () Bool)

(assert (=> b!601745 (= e!344094 e!344101)))

(declare-fun res!386384 () Bool)

(assert (=> b!601745 (=> res!386384 e!344101)))

(assert (=> b!601745 (= res!386384 (bvsge index!984 j!136))))

(declare-fun lt!273878 () Unit!19026)

(declare-fun e!344090 () Unit!19026)

(assert (=> b!601745 (= lt!273878 e!344090)))

(declare-fun c!68045 () Bool)

(assert (=> b!601745 (= c!68045 (bvslt j!136 index!984))))

(declare-fun b!601746 () Bool)

(assert (=> b!601746 (= e!344101 true)))

(assert (=> b!601746 (arrayContainsKey!0 lt!273889 (select (arr!17837 a!2986) j!136) j!136)))

(declare-fun b!601747 () Bool)

(declare-fun res!386382 () Bool)

(assert (=> b!601747 (=> (not res!386382) (not e!344102))))

(assert (=> b!601747 (= res!386382 (and (= (size!18202 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18202 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18202 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601748 () Bool)

(declare-fun res!386381 () Bool)

(assert (=> b!601748 (=> (not res!386381) (not e!344097))))

(declare-datatypes ((List!11917 0))(
  ( (Nil!11914) (Cons!11913 (h!12958 (_ BitVec 64)) (t!18136 List!11917)) )
))
(declare-fun arrayNoDuplicates!0 (array!37158 (_ BitVec 32) List!11917) Bool)

(assert (=> b!601748 (= res!386381 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11914))))

(declare-fun b!601749 () Bool)

(declare-fun Unit!19029 () Unit!19026)

(assert (=> b!601749 (= e!344090 Unit!19029)))

(declare-fun b!601750 () Bool)

(declare-fun Unit!19030 () Unit!19026)

(assert (=> b!601750 (= e!344093 Unit!19030)))

(assert (=> b!601750 false))

(declare-fun b!601751 () Bool)

(declare-fun res!386391 () Bool)

(assert (=> b!601751 (=> (not res!386391) (not e!344102))))

(assert (=> b!601751 (= res!386391 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601752 () Bool)

(assert (=> b!601752 (= e!344102 e!344097)))

(declare-fun res!386386 () Bool)

(assert (=> b!601752 (=> (not res!386386) (not e!344097))))

(declare-fun lt!273886 () SeekEntryResult!6274)

(assert (=> b!601752 (= res!386386 (or (= lt!273886 (MissingZero!6274 i!1108)) (= lt!273886 (MissingVacant!6274 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37158 (_ BitVec 32)) SeekEntryResult!6274)

(assert (=> b!601752 (= lt!273886 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!601753 () Bool)

(declare-fun Unit!19031 () Unit!19026)

(assert (=> b!601753 (= e!344090 Unit!19031)))

(declare-fun lt!273879 () Unit!19026)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37158 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19026)

(assert (=> b!601753 (= lt!273879 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273889 (select (arr!17837 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601753 (arrayContainsKey!0 lt!273889 (select (arr!17837 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273883 () Unit!19026)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37158 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11917) Unit!19026)

(assert (=> b!601753 (= lt!273883 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11914))))

(assert (=> b!601753 (arrayNoDuplicates!0 lt!273889 #b00000000000000000000000000000000 Nil!11914)))

(declare-fun lt!273877 () Unit!19026)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37158 (_ BitVec 32) (_ BitVec 32)) Unit!19026)

(assert (=> b!601753 (= lt!273877 (lemmaNoDuplicateFromThenFromBigger!0 lt!273889 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601753 (arrayNoDuplicates!0 lt!273889 j!136 Nil!11914)))

(declare-fun lt!273876 () Unit!19026)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37158 (_ BitVec 64) (_ BitVec 32) List!11917) Unit!19026)

(assert (=> b!601753 (= lt!273876 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273889 (select (arr!17837 a!2986) j!136) j!136 Nil!11914))))

(assert (=> b!601753 false))

(assert (= (and start!54990 res!386376) b!601747))

(assert (= (and b!601747 res!386382) b!601734))

(assert (= (and b!601734 res!386377) b!601741))

(assert (= (and b!601741 res!386383) b!601751))

(assert (= (and b!601751 res!386391) b!601752))

(assert (= (and b!601752 res!386386) b!601732))

(assert (= (and b!601732 res!386378) b!601748))

(assert (= (and b!601748 res!386381) b!601738))

(assert (= (and b!601738 res!386389) b!601735))

(assert (= (and b!601735 res!386379) b!601744))

(assert (= (and b!601744 res!386392) b!601743))

(assert (= (and b!601743 res!386385) b!601739))

(assert (= (and b!601743 c!68046) b!601750))

(assert (= (and b!601743 (not c!68046)) b!601733))

(assert (= (and b!601743 (not res!386390)) b!601742))

(assert (= (and b!601742 res!386387) b!601736))

(assert (= (and b!601736 (not res!386380)) b!601740))

(assert (= (and b!601740 res!386393) b!601737))

(assert (= (and b!601742 (not res!386388)) b!601745))

(assert (= (and b!601745 c!68045) b!601753))

(assert (= (and b!601745 (not c!68045)) b!601749))

(assert (= (and b!601745 (not res!386384)) b!601746))

(declare-fun m!578389 () Bool)

(assert (=> b!601746 m!578389))

(assert (=> b!601746 m!578389))

(declare-fun m!578391 () Bool)

(assert (=> b!601746 m!578391))

(assert (=> b!601737 m!578389))

(assert (=> b!601737 m!578389))

(declare-fun m!578393 () Bool)

(assert (=> b!601737 m!578393))

(declare-fun m!578395 () Bool)

(assert (=> start!54990 m!578395))

(declare-fun m!578397 () Bool)

(assert (=> start!54990 m!578397))

(declare-fun m!578399 () Bool)

(assert (=> b!601751 m!578399))

(assert (=> b!601734 m!578389))

(assert (=> b!601734 m!578389))

(declare-fun m!578401 () Bool)

(assert (=> b!601734 m!578401))

(declare-fun m!578403 () Bool)

(assert (=> b!601748 m!578403))

(declare-fun m!578405 () Bool)

(assert (=> b!601735 m!578405))

(declare-fun m!578407 () Bool)

(assert (=> b!601735 m!578407))

(assert (=> b!601742 m!578389))

(assert (=> b!601742 m!578405))

(declare-fun m!578409 () Bool)

(assert (=> b!601742 m!578409))

(declare-fun m!578411 () Bool)

(assert (=> b!601752 m!578411))

(declare-fun m!578413 () Bool)

(assert (=> b!601744 m!578413))

(assert (=> b!601744 m!578389))

(assert (=> b!601744 m!578389))

(declare-fun m!578415 () Bool)

(assert (=> b!601744 m!578415))

(declare-fun m!578417 () Bool)

(assert (=> b!601743 m!578417))

(declare-fun m!578419 () Bool)

(assert (=> b!601743 m!578419))

(assert (=> b!601743 m!578389))

(assert (=> b!601743 m!578389))

(declare-fun m!578421 () Bool)

(assert (=> b!601743 m!578421))

(declare-fun m!578423 () Bool)

(assert (=> b!601743 m!578423))

(declare-fun m!578425 () Bool)

(assert (=> b!601743 m!578425))

(declare-fun m!578427 () Bool)

(assert (=> b!601743 m!578427))

(assert (=> b!601743 m!578405))

(declare-fun m!578429 () Bool)

(assert (=> b!601732 m!578429))

(assert (=> b!601753 m!578389))

(declare-fun m!578431 () Bool)

(assert (=> b!601753 m!578431))

(assert (=> b!601753 m!578389))

(declare-fun m!578433 () Bool)

(assert (=> b!601753 m!578433))

(declare-fun m!578435 () Bool)

(assert (=> b!601753 m!578435))

(declare-fun m!578437 () Bool)

(assert (=> b!601753 m!578437))

(declare-fun m!578439 () Bool)

(assert (=> b!601753 m!578439))

(declare-fun m!578441 () Bool)

(assert (=> b!601753 m!578441))

(assert (=> b!601753 m!578389))

(assert (=> b!601753 m!578389))

(declare-fun m!578443 () Bool)

(assert (=> b!601753 m!578443))

(declare-fun m!578445 () Bool)

(assert (=> b!601738 m!578445))

(declare-fun m!578447 () Bool)

(assert (=> b!601741 m!578447))

(assert (=> b!601736 m!578389))

(assert (=> b!601740 m!578389))

(assert (=> b!601740 m!578389))

(assert (=> b!601740 m!578391))

(check-sat (not b!601752) (not b!601741) (not b!601751) (not b!601732) (not b!601744) (not b!601734) (not b!601743) (not b!601740) (not b!601737) (not b!601746) (not start!54990) (not b!601753) (not b!601748))
(check-sat)
