; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55644 () Bool)

(assert start!55644)

(declare-fun b!609449 () Bool)

(declare-fun res!391903 () Bool)

(declare-fun e!349055 () Bool)

(assert (=> b!609449 (=> (not res!391903) (not e!349055))))

(declare-datatypes ((array!37320 0))(
  ( (array!37321 (arr!17908 (Array (_ BitVec 32) (_ BitVec 64))) (size!18272 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37320)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609449 (= res!391903 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!349052 () Bool)

(declare-fun b!609450 () Bool)

(declare-fun lt!278567 () array!37320)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609450 (= e!349052 (arrayContainsKey!0 lt!278567 (select (arr!17908 a!2986) j!136) index!984))))

(declare-fun b!609451 () Bool)

(declare-fun res!391902 () Bool)

(declare-fun e!349060 () Bool)

(assert (=> b!609451 (=> res!391902 e!349060)))

(declare-datatypes ((List!11856 0))(
  ( (Nil!11853) (Cons!11852 (h!12900 (_ BitVec 64)) (t!18076 List!11856)) )
))
(declare-fun contains!3006 (List!11856 (_ BitVec 64)) Bool)

(assert (=> b!609451 (= res!391902 (contains!3006 Nil!11853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609453 () Bool)

(declare-fun e!349056 () Bool)

(declare-datatypes ((SeekEntryResult!6304 0))(
  ( (MissingZero!6304 (index!27491 (_ BitVec 32))) (Found!6304 (index!27492 (_ BitVec 32))) (Intermediate!6304 (undefined!7116 Bool) (index!27493 (_ BitVec 32)) (x!56448 (_ BitVec 32))) (Undefined!6304) (MissingVacant!6304 (index!27494 (_ BitVec 32))) )
))
(declare-fun lt!278575 () SeekEntryResult!6304)

(declare-fun lt!278560 () SeekEntryResult!6304)

(assert (=> b!609453 (= e!349056 (= lt!278575 lt!278560))))

(declare-fun b!609454 () Bool)

(declare-fun e!349057 () Bool)

(declare-fun e!349054 () Bool)

(assert (=> b!609454 (= e!349057 e!349054)))

(declare-fun res!391915 () Bool)

(assert (=> b!609454 (=> res!391915 e!349054)))

(declare-fun lt!278568 () (_ BitVec 64))

(declare-fun lt!278572 () (_ BitVec 64))

(assert (=> b!609454 (= res!391915 (or (not (= (select (arr!17908 a!2986) j!136) lt!278568)) (not (= (select (arr!17908 a!2986) j!136) lt!278572)) (bvsge j!136 index!984)))))

(declare-fun b!609455 () Bool)

(assert (=> b!609455 (= e!349060 true)))

(declare-fun lt!278569 () Bool)

(assert (=> b!609455 (= lt!278569 (contains!3006 Nil!11853 k0!1786))))

(declare-fun b!609456 () Bool)

(declare-fun res!391916 () Bool)

(assert (=> b!609456 (=> (not res!391916) (not e!349055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609456 (= res!391916 (validKeyInArray!0 k0!1786))))

(declare-fun b!609457 () Bool)

(declare-fun res!391899 () Bool)

(assert (=> b!609457 (=> res!391899 e!349060)))

(assert (=> b!609457 (= res!391899 (contains!3006 Nil!11853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609458 () Bool)

(declare-datatypes ((Unit!19477 0))(
  ( (Unit!19478) )
))
(declare-fun e!349058 () Unit!19477)

(declare-fun Unit!19479 () Unit!19477)

(assert (=> b!609458 (= e!349058 Unit!19479)))

(declare-fun b!609459 () Bool)

(declare-fun res!391905 () Bool)

(assert (=> b!609459 (=> res!391905 e!349060)))

(declare-fun noDuplicate!340 (List!11856) Bool)

(assert (=> b!609459 (= res!391905 (not (noDuplicate!340 Nil!11853)))))

(declare-fun b!609460 () Bool)

(declare-fun e!349062 () Bool)

(declare-fun e!349061 () Bool)

(assert (=> b!609460 (= e!349062 (not e!349061))))

(declare-fun res!391897 () Bool)

(assert (=> b!609460 (=> res!391897 e!349061)))

(declare-fun lt!278573 () SeekEntryResult!6304)

(assert (=> b!609460 (= res!391897 (not (= lt!278573 (Found!6304 index!984))))))

(declare-fun lt!278574 () Unit!19477)

(declare-fun e!349048 () Unit!19477)

(assert (=> b!609460 (= lt!278574 e!349048)))

(declare-fun c!69146 () Bool)

(assert (=> b!609460 (= c!69146 (= lt!278573 Undefined!6304))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37320 (_ BitVec 32)) SeekEntryResult!6304)

(assert (=> b!609460 (= lt!278573 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278568 lt!278567 mask!3053))))

(assert (=> b!609460 e!349056))

(declare-fun res!391904 () Bool)

(assert (=> b!609460 (=> (not res!391904) (not e!349056))))

(declare-fun lt!278570 () (_ BitVec 32))

(assert (=> b!609460 (= res!391904 (= lt!278560 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278570 vacantSpotIndex!68 lt!278568 lt!278567 mask!3053)))))

(assert (=> b!609460 (= lt!278560 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278570 vacantSpotIndex!68 (select (arr!17908 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!609460 (= lt!278568 (select (store (arr!17908 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278566 () Unit!19477)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37320 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19477)

(assert (=> b!609460 (= lt!278566 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278570 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609460 (= lt!278570 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!609461 () Bool)

(declare-fun e!349053 () Bool)

(assert (=> b!609461 (= e!349053 (arrayContainsKey!0 lt!278567 (select (arr!17908 a!2986) j!136) index!984))))

(declare-fun b!609462 () Bool)

(declare-fun e!349059 () Bool)

(declare-fun e!349047 () Bool)

(assert (=> b!609462 (= e!349059 e!349047)))

(declare-fun res!391912 () Bool)

(assert (=> b!609462 (=> (not res!391912) (not e!349047))))

(assert (=> b!609462 (= res!391912 (= (select (store (arr!17908 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609462 (= lt!278567 (array!37321 (store (arr!17908 a!2986) i!1108 k0!1786) (size!18272 a!2986)))))

(declare-fun b!609463 () Bool)

(declare-fun e!349051 () Bool)

(assert (=> b!609463 (= e!349061 e!349051)))

(declare-fun res!391913 () Bool)

(assert (=> b!609463 (=> res!391913 e!349051)))

(assert (=> b!609463 (= res!391913 (or (not (= (select (arr!17908 a!2986) j!136) lt!278568)) (not (= (select (arr!17908 a!2986) j!136) lt!278572))))))

(assert (=> b!609463 e!349057))

(declare-fun res!391908 () Bool)

(assert (=> b!609463 (=> (not res!391908) (not e!349057))))

(assert (=> b!609463 (= res!391908 (= lt!278572 (select (arr!17908 a!2986) j!136)))))

(assert (=> b!609463 (= lt!278572 (select (store (arr!17908 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609464 () Bool)

(declare-fun Unit!19480 () Unit!19477)

(assert (=> b!609464 (= e!349048 Unit!19480)))

(assert (=> b!609464 false))

(declare-fun b!609465 () Bool)

(declare-fun res!391901 () Bool)

(assert (=> b!609465 (=> (not res!391901) (not e!349059))))

(assert (=> b!609465 (= res!391901 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17908 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609466 () Bool)

(declare-fun e!349050 () Bool)

(assert (=> b!609466 (= e!349050 e!349060)))

(declare-fun res!391918 () Bool)

(assert (=> b!609466 (=> res!391918 e!349060)))

(assert (=> b!609466 (= res!391918 (or (bvsge (size!18272 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18272 a!2986))))))

(assert (=> b!609466 (arrayContainsKey!0 lt!278567 (select (arr!17908 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278563 () Unit!19477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37320 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19477)

(assert (=> b!609466 (= lt!278563 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278567 (select (arr!17908 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609466 e!349053))

(declare-fun res!391910 () Bool)

(assert (=> b!609466 (=> (not res!391910) (not e!349053))))

(assert (=> b!609466 (= res!391910 (arrayContainsKey!0 lt!278567 (select (arr!17908 a!2986) j!136) j!136))))

(declare-fun b!609467 () Bool)

(declare-fun res!391896 () Bool)

(assert (=> b!609467 (=> (not res!391896) (not e!349055))))

(assert (=> b!609467 (= res!391896 (and (= (size!18272 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18272 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18272 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609468 () Bool)

(declare-fun Unit!19481 () Unit!19477)

(assert (=> b!609468 (= e!349058 Unit!19481)))

(declare-fun lt!278571 () Unit!19477)

(assert (=> b!609468 (= lt!278571 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278567 (select (arr!17908 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609468 (arrayContainsKey!0 lt!278567 (select (arr!17908 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278559 () Unit!19477)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37320 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11856) Unit!19477)

(assert (=> b!609468 (= lt!278559 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11853))))

(declare-fun arrayNoDuplicates!0 (array!37320 (_ BitVec 32) List!11856) Bool)

(assert (=> b!609468 (arrayNoDuplicates!0 lt!278567 #b00000000000000000000000000000000 Nil!11853)))

(declare-fun lt!278561 () Unit!19477)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37320 (_ BitVec 32) (_ BitVec 32)) Unit!19477)

(assert (=> b!609468 (= lt!278561 (lemmaNoDuplicateFromThenFromBigger!0 lt!278567 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609468 (arrayNoDuplicates!0 lt!278567 j!136 Nil!11853)))

(declare-fun lt!278565 () Unit!19477)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37320 (_ BitVec 64) (_ BitVec 32) List!11856) Unit!19477)

(assert (=> b!609468 (= lt!278565 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278567 (select (arr!17908 a!2986) j!136) j!136 Nil!11853))))

(assert (=> b!609468 false))

(declare-fun b!609469 () Bool)

(assert (=> b!609469 (= e!349055 e!349059)))

(declare-fun res!391914 () Bool)

(assert (=> b!609469 (=> (not res!391914) (not e!349059))))

(declare-fun lt!278562 () SeekEntryResult!6304)

(assert (=> b!609469 (= res!391914 (or (= lt!278562 (MissingZero!6304 i!1108)) (= lt!278562 (MissingVacant!6304 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37320 (_ BitVec 32)) SeekEntryResult!6304)

(assert (=> b!609469 (= lt!278562 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609470 () Bool)

(assert (=> b!609470 (= e!349047 e!349062)))

(declare-fun res!391911 () Bool)

(assert (=> b!609470 (=> (not res!391911) (not e!349062))))

(assert (=> b!609470 (= res!391911 (and (= lt!278575 (Found!6304 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17908 a!2986) index!984) (select (arr!17908 a!2986) j!136))) (not (= (select (arr!17908 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!609470 (= lt!278575 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17908 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609471 () Bool)

(declare-fun res!391909 () Bool)

(assert (=> b!609471 (=> (not res!391909) (not e!349059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37320 (_ BitVec 32)) Bool)

(assert (=> b!609471 (= res!391909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609452 () Bool)

(declare-fun res!391898 () Bool)

(assert (=> b!609452 (=> (not res!391898) (not e!349059))))

(assert (=> b!609452 (= res!391898 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11853))))

(declare-fun res!391900 () Bool)

(assert (=> start!55644 (=> (not res!391900) (not e!349055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55644 (= res!391900 (validMask!0 mask!3053))))

(assert (=> start!55644 e!349055))

(assert (=> start!55644 true))

(declare-fun array_inv!13767 (array!37320) Bool)

(assert (=> start!55644 (array_inv!13767 a!2986)))

(declare-fun b!609472 () Bool)

(assert (=> b!609472 (= e!349051 e!349050)))

(declare-fun res!391917 () Bool)

(assert (=> b!609472 (=> res!391917 e!349050)))

(assert (=> b!609472 (= res!391917 (bvsge index!984 j!136))))

(declare-fun lt!278564 () Unit!19477)

(assert (=> b!609472 (= lt!278564 e!349058)))

(declare-fun c!69145 () Bool)

(assert (=> b!609472 (= c!69145 (bvslt j!136 index!984))))

(declare-fun b!609473 () Bool)

(declare-fun Unit!19482 () Unit!19477)

(assert (=> b!609473 (= e!349048 Unit!19482)))

(declare-fun b!609474 () Bool)

(declare-fun res!391907 () Bool)

(assert (=> b!609474 (=> (not res!391907) (not e!349055))))

(assert (=> b!609474 (= res!391907 (validKeyInArray!0 (select (arr!17908 a!2986) j!136)))))

(declare-fun b!609475 () Bool)

(assert (=> b!609475 (= e!349054 e!349052)))

(declare-fun res!391906 () Bool)

(assert (=> b!609475 (=> (not res!391906) (not e!349052))))

(assert (=> b!609475 (= res!391906 (arrayContainsKey!0 lt!278567 (select (arr!17908 a!2986) j!136) j!136))))

(assert (= (and start!55644 res!391900) b!609467))

(assert (= (and b!609467 res!391896) b!609474))

(assert (= (and b!609474 res!391907) b!609456))

(assert (= (and b!609456 res!391916) b!609449))

(assert (= (and b!609449 res!391903) b!609469))

(assert (= (and b!609469 res!391914) b!609471))

(assert (= (and b!609471 res!391909) b!609452))

(assert (= (and b!609452 res!391898) b!609465))

(assert (= (and b!609465 res!391901) b!609462))

(assert (= (and b!609462 res!391912) b!609470))

(assert (= (and b!609470 res!391911) b!609460))

(assert (= (and b!609460 res!391904) b!609453))

(assert (= (and b!609460 c!69146) b!609464))

(assert (= (and b!609460 (not c!69146)) b!609473))

(assert (= (and b!609460 (not res!391897)) b!609463))

(assert (= (and b!609463 res!391908) b!609454))

(assert (= (and b!609454 (not res!391915)) b!609475))

(assert (= (and b!609475 res!391906) b!609450))

(assert (= (and b!609463 (not res!391913)) b!609472))

(assert (= (and b!609472 c!69145) b!609468))

(assert (= (and b!609472 (not c!69145)) b!609458))

(assert (= (and b!609472 (not res!391917)) b!609466))

(assert (= (and b!609466 res!391910) b!609461))

(assert (= (and b!609466 (not res!391918)) b!609459))

(assert (= (and b!609459 (not res!391905)) b!609451))

(assert (= (and b!609451 (not res!391902)) b!609457))

(assert (= (and b!609457 (not res!391899)) b!609455))

(declare-fun m!586247 () Bool)

(assert (=> b!609474 m!586247))

(assert (=> b!609474 m!586247))

(declare-fun m!586249 () Bool)

(assert (=> b!609474 m!586249))

(assert (=> b!609450 m!586247))

(assert (=> b!609450 m!586247))

(declare-fun m!586251 () Bool)

(assert (=> b!609450 m!586251))

(assert (=> b!609475 m!586247))

(assert (=> b!609475 m!586247))

(declare-fun m!586253 () Bool)

(assert (=> b!609475 m!586253))

(assert (=> b!609454 m!586247))

(declare-fun m!586255 () Bool)

(assert (=> b!609469 m!586255))

(declare-fun m!586257 () Bool)

(assert (=> b!609460 m!586257))

(assert (=> b!609460 m!586247))

(declare-fun m!586259 () Bool)

(assert (=> b!609460 m!586259))

(declare-fun m!586261 () Bool)

(assert (=> b!609460 m!586261))

(declare-fun m!586263 () Bool)

(assert (=> b!609460 m!586263))

(declare-fun m!586265 () Bool)

(assert (=> b!609460 m!586265))

(assert (=> b!609460 m!586247))

(declare-fun m!586267 () Bool)

(assert (=> b!609460 m!586267))

(declare-fun m!586269 () Bool)

(assert (=> b!609460 m!586269))

(assert (=> b!609462 m!586261))

(declare-fun m!586271 () Bool)

(assert (=> b!609462 m!586271))

(declare-fun m!586273 () Bool)

(assert (=> b!609457 m!586273))

(assert (=> b!609463 m!586247))

(assert (=> b!609463 m!586261))

(declare-fun m!586275 () Bool)

(assert (=> b!609463 m!586275))

(assert (=> b!609466 m!586247))

(assert (=> b!609466 m!586247))

(declare-fun m!586277 () Bool)

(assert (=> b!609466 m!586277))

(assert (=> b!609466 m!586247))

(declare-fun m!586279 () Bool)

(assert (=> b!609466 m!586279))

(assert (=> b!609466 m!586247))

(assert (=> b!609466 m!586253))

(declare-fun m!586281 () Bool)

(assert (=> b!609456 m!586281))

(assert (=> b!609461 m!586247))

(assert (=> b!609461 m!586247))

(assert (=> b!609461 m!586251))

(declare-fun m!586283 () Bool)

(assert (=> b!609471 m!586283))

(declare-fun m!586285 () Bool)

(assert (=> b!609459 m!586285))

(declare-fun m!586287 () Bool)

(assert (=> start!55644 m!586287))

(declare-fun m!586289 () Bool)

(assert (=> start!55644 m!586289))

(declare-fun m!586291 () Bool)

(assert (=> b!609452 m!586291))

(declare-fun m!586293 () Bool)

(assert (=> b!609465 m!586293))

(declare-fun m!586295 () Bool)

(assert (=> b!609449 m!586295))

(declare-fun m!586297 () Bool)

(assert (=> b!609451 m!586297))

(declare-fun m!586299 () Bool)

(assert (=> b!609455 m!586299))

(declare-fun m!586301 () Bool)

(assert (=> b!609470 m!586301))

(assert (=> b!609470 m!586247))

(assert (=> b!609470 m!586247))

(declare-fun m!586303 () Bool)

(assert (=> b!609470 m!586303))

(assert (=> b!609468 m!586247))

(declare-fun m!586305 () Bool)

(assert (=> b!609468 m!586305))

(declare-fun m!586307 () Bool)

(assert (=> b!609468 m!586307))

(assert (=> b!609468 m!586247))

(declare-fun m!586309 () Bool)

(assert (=> b!609468 m!586309))

(declare-fun m!586311 () Bool)

(assert (=> b!609468 m!586311))

(assert (=> b!609468 m!586247))

(declare-fun m!586313 () Bool)

(assert (=> b!609468 m!586313))

(assert (=> b!609468 m!586247))

(declare-fun m!586315 () Bool)

(assert (=> b!609468 m!586315))

(declare-fun m!586317 () Bool)

(assert (=> b!609468 m!586317))

(check-sat (not b!609457) (not b!609456) (not b!609468) (not b!609452) (not start!55644) (not b!609451) (not b!609450) (not b!609466) (not b!609449) (not b!609455) (not b!609474) (not b!609461) (not b!609471) (not b!609470) (not b!609459) (not b!609460) (not b!609475) (not b!609469))
(check-sat)
