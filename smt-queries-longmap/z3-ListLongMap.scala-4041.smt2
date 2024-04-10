; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55122 () Bool)

(assert start!55122)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37195 0))(
  ( (array!37196 (arr!17854 (Array (_ BitVec 32) (_ BitVec 64))) (size!18218 (_ BitVec 32))) )
))
(declare-fun lt!274983 () array!37195)

(declare-fun b!603409 () Bool)

(declare-fun e!345187 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37195)

(declare-fun arrayContainsKey!0 (array!37195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603409 (= e!345187 (arrayContainsKey!0 lt!274983 (select (arr!17854 a!2986) j!136) index!984))))

(declare-fun b!603410 () Bool)

(declare-fun res!387515 () Bool)

(declare-fun e!345188 () Bool)

(assert (=> b!603410 (=> (not res!387515) (not e!345188))))

(declare-datatypes ((List!11895 0))(
  ( (Nil!11892) (Cons!11891 (h!12936 (_ BitVec 64)) (t!18123 List!11895)) )
))
(declare-fun arrayNoDuplicates!0 (array!37195 (_ BitVec 32) List!11895) Bool)

(assert (=> b!603410 (= res!387515 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11892))))

(declare-fun res!387512 () Bool)

(declare-fun e!345191 () Bool)

(assert (=> start!55122 (=> (not res!387512) (not e!345191))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55122 (= res!387512 (validMask!0 mask!3053))))

(assert (=> start!55122 e!345191))

(assert (=> start!55122 true))

(declare-fun array_inv!13650 (array!37195) Bool)

(assert (=> start!55122 (array_inv!13650 a!2986)))

(declare-fun b!603411 () Bool)

(declare-fun e!345192 () Bool)

(declare-fun e!345189 () Bool)

(assert (=> b!603411 (= e!345192 e!345189)))

(declare-fun res!387513 () Bool)

(assert (=> b!603411 (=> res!387513 e!345189)))

(declare-fun lt!274981 () (_ BitVec 64))

(declare-fun lt!274982 () (_ BitVec 64))

(assert (=> b!603411 (= res!387513 (or (not (= (select (arr!17854 a!2986) j!136) lt!274981)) (not (= (select (arr!17854 a!2986) j!136) lt!274982)) (bvsge j!136 index!984)))))

(declare-fun b!603412 () Bool)

(declare-datatypes ((Unit!19144 0))(
  ( (Unit!19145) )
))
(declare-fun e!345185 () Unit!19144)

(declare-fun Unit!19146 () Unit!19144)

(assert (=> b!603412 (= e!345185 Unit!19146)))

(declare-fun b!603413 () Bool)

(declare-fun e!345186 () Bool)

(assert (=> b!603413 (= e!345189 e!345186)))

(declare-fun res!387510 () Bool)

(assert (=> b!603413 (=> (not res!387510) (not e!345186))))

(assert (=> b!603413 (= res!387510 (arrayContainsKey!0 lt!274983 (select (arr!17854 a!2986) j!136) j!136))))

(declare-fun b!603414 () Bool)

(declare-fun e!345183 () Bool)

(declare-datatypes ((SeekEntryResult!6294 0))(
  ( (MissingZero!6294 (index!27439 (_ BitVec 32))) (Found!6294 (index!27440 (_ BitVec 32))) (Intermediate!6294 (undefined!7106 Bool) (index!27441 (_ BitVec 32)) (x!56239 (_ BitVec 32))) (Undefined!6294) (MissingVacant!6294 (index!27442 (_ BitVec 32))) )
))
(declare-fun lt!274974 () SeekEntryResult!6294)

(declare-fun lt!274980 () SeekEntryResult!6294)

(assert (=> b!603414 (= e!345183 (= lt!274974 lt!274980))))

(declare-fun b!603415 () Bool)

(declare-fun res!387525 () Bool)

(assert (=> b!603415 (=> (not res!387525) (not e!345188))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603415 (= res!387525 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17854 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603416 () Bool)

(declare-fun Unit!19147 () Unit!19144)

(assert (=> b!603416 (= e!345185 Unit!19147)))

(assert (=> b!603416 false))

(declare-fun b!603417 () Bool)

(assert (=> b!603417 (= e!345191 e!345188)))

(declare-fun res!387517 () Bool)

(assert (=> b!603417 (=> (not res!387517) (not e!345188))))

(declare-fun lt!274977 () SeekEntryResult!6294)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603417 (= res!387517 (or (= lt!274977 (MissingZero!6294 i!1108)) (= lt!274977 (MissingVacant!6294 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37195 (_ BitVec 32)) SeekEntryResult!6294)

(assert (=> b!603417 (= lt!274977 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603418 () Bool)

(declare-fun e!345182 () Unit!19144)

(declare-fun Unit!19148 () Unit!19144)

(assert (=> b!603418 (= e!345182 Unit!19148)))

(declare-fun lt!274986 () Unit!19144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37195 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19144)

(assert (=> b!603418 (= lt!274986 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274983 (select (arr!17854 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603418 (arrayContainsKey!0 lt!274983 (select (arr!17854 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274987 () Unit!19144)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37195 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11895) Unit!19144)

(assert (=> b!603418 (= lt!274987 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11892))))

(assert (=> b!603418 (arrayNoDuplicates!0 lt!274983 #b00000000000000000000000000000000 Nil!11892)))

(declare-fun lt!274975 () Unit!19144)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37195 (_ BitVec 32) (_ BitVec 32)) Unit!19144)

(assert (=> b!603418 (= lt!274975 (lemmaNoDuplicateFromThenFromBigger!0 lt!274983 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603418 (arrayNoDuplicates!0 lt!274983 j!136 Nil!11892)))

(declare-fun lt!274973 () Unit!19144)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37195 (_ BitVec 64) (_ BitVec 32) List!11895) Unit!19144)

(assert (=> b!603418 (= lt!274973 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274983 (select (arr!17854 a!2986) j!136) j!136 Nil!11892))))

(assert (=> b!603418 false))

(declare-fun b!603419 () Bool)

(declare-fun e!345194 () Bool)

(declare-fun e!345184 () Bool)

(assert (=> b!603419 (= e!345194 e!345184)))

(declare-fun res!387511 () Bool)

(assert (=> b!603419 (=> res!387511 e!345184)))

(assert (=> b!603419 (= res!387511 (or (not (= (select (arr!17854 a!2986) j!136) lt!274981)) (not (= (select (arr!17854 a!2986) j!136) lt!274982))))))

(assert (=> b!603419 e!345192))

(declare-fun res!387509 () Bool)

(assert (=> b!603419 (=> (not res!387509) (not e!345192))))

(assert (=> b!603419 (= res!387509 (= lt!274982 (select (arr!17854 a!2986) j!136)))))

(assert (=> b!603419 (= lt!274982 (select (store (arr!17854 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603420 () Bool)

(declare-fun Unit!19149 () Unit!19144)

(assert (=> b!603420 (= e!345182 Unit!19149)))

(declare-fun b!603421 () Bool)

(declare-fun e!345181 () Bool)

(declare-fun e!345195 () Bool)

(assert (=> b!603421 (= e!345181 e!345195)))

(declare-fun res!387522 () Bool)

(assert (=> b!603421 (=> (not res!387522) (not e!345195))))

(assert (=> b!603421 (= res!387522 (and (= lt!274974 (Found!6294 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17854 a!2986) index!984) (select (arr!17854 a!2986) j!136))) (not (= (select (arr!17854 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37195 (_ BitVec 32)) SeekEntryResult!6294)

(assert (=> b!603421 (= lt!274974 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17854 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603422 () Bool)

(assert (=> b!603422 (= e!345188 e!345181)))

(declare-fun res!387514 () Bool)

(assert (=> b!603422 (=> (not res!387514) (not e!345181))))

(assert (=> b!603422 (= res!387514 (= (select (store (arr!17854 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603422 (= lt!274983 (array!37196 (store (arr!17854 a!2986) i!1108 k0!1786) (size!18218 a!2986)))))

(declare-fun b!603423 () Bool)

(declare-fun e!345193 () Bool)

(assert (=> b!603423 (= e!345193 true)))

(assert (=> b!603423 e!345187))

(declare-fun res!387520 () Bool)

(assert (=> b!603423 (=> (not res!387520) (not e!345187))))

(assert (=> b!603423 (= res!387520 (arrayContainsKey!0 lt!274983 (select (arr!17854 a!2986) j!136) j!136))))

(declare-fun b!603424 () Bool)

(declare-fun res!387524 () Bool)

(assert (=> b!603424 (=> (not res!387524) (not e!345191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603424 (= res!387524 (validKeyInArray!0 k0!1786))))

(declare-fun b!603425 () Bool)

(assert (=> b!603425 (= e!345195 (not e!345194))))

(declare-fun res!387527 () Bool)

(assert (=> b!603425 (=> res!387527 e!345194)))

(declare-fun lt!274985 () SeekEntryResult!6294)

(assert (=> b!603425 (= res!387527 (not (= lt!274985 (Found!6294 index!984))))))

(declare-fun lt!274976 () Unit!19144)

(assert (=> b!603425 (= lt!274976 e!345185)))

(declare-fun c!68318 () Bool)

(assert (=> b!603425 (= c!68318 (= lt!274985 Undefined!6294))))

(assert (=> b!603425 (= lt!274985 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274981 lt!274983 mask!3053))))

(assert (=> b!603425 e!345183))

(declare-fun res!387523 () Bool)

(assert (=> b!603425 (=> (not res!387523) (not e!345183))))

(declare-fun lt!274984 () (_ BitVec 32))

(assert (=> b!603425 (= res!387523 (= lt!274980 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274984 vacantSpotIndex!68 lt!274981 lt!274983 mask!3053)))))

(assert (=> b!603425 (= lt!274980 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274984 vacantSpotIndex!68 (select (arr!17854 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603425 (= lt!274981 (select (store (arr!17854 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274978 () Unit!19144)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37195 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19144)

(assert (=> b!603425 (= lt!274978 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274984 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603425 (= lt!274984 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603426 () Bool)

(declare-fun res!387519 () Bool)

(assert (=> b!603426 (=> (not res!387519) (not e!345191))))

(assert (=> b!603426 (= res!387519 (and (= (size!18218 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18218 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18218 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603427 () Bool)

(declare-fun res!387516 () Bool)

(assert (=> b!603427 (=> (not res!387516) (not e!345191))))

(assert (=> b!603427 (= res!387516 (validKeyInArray!0 (select (arr!17854 a!2986) j!136)))))

(declare-fun b!603428 () Bool)

(assert (=> b!603428 (= e!345184 e!345193)))

(declare-fun res!387518 () Bool)

(assert (=> b!603428 (=> res!387518 e!345193)))

(assert (=> b!603428 (= res!387518 (bvsge index!984 j!136))))

(declare-fun lt!274979 () Unit!19144)

(assert (=> b!603428 (= lt!274979 e!345182)))

(declare-fun c!68317 () Bool)

(assert (=> b!603428 (= c!68317 (bvslt j!136 index!984))))

(declare-fun b!603429 () Bool)

(assert (=> b!603429 (= e!345186 (arrayContainsKey!0 lt!274983 (select (arr!17854 a!2986) j!136) index!984))))

(declare-fun b!603430 () Bool)

(declare-fun res!387521 () Bool)

(assert (=> b!603430 (=> (not res!387521) (not e!345191))))

(assert (=> b!603430 (= res!387521 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603431 () Bool)

(declare-fun res!387526 () Bool)

(assert (=> b!603431 (=> (not res!387526) (not e!345188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37195 (_ BitVec 32)) Bool)

(assert (=> b!603431 (= res!387526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55122 res!387512) b!603426))

(assert (= (and b!603426 res!387519) b!603427))

(assert (= (and b!603427 res!387516) b!603424))

(assert (= (and b!603424 res!387524) b!603430))

(assert (= (and b!603430 res!387521) b!603417))

(assert (= (and b!603417 res!387517) b!603431))

(assert (= (and b!603431 res!387526) b!603410))

(assert (= (and b!603410 res!387515) b!603415))

(assert (= (and b!603415 res!387525) b!603422))

(assert (= (and b!603422 res!387514) b!603421))

(assert (= (and b!603421 res!387522) b!603425))

(assert (= (and b!603425 res!387523) b!603414))

(assert (= (and b!603425 c!68318) b!603416))

(assert (= (and b!603425 (not c!68318)) b!603412))

(assert (= (and b!603425 (not res!387527)) b!603419))

(assert (= (and b!603419 res!387509) b!603411))

(assert (= (and b!603411 (not res!387513)) b!603413))

(assert (= (and b!603413 res!387510) b!603429))

(assert (= (and b!603419 (not res!387511)) b!603428))

(assert (= (and b!603428 c!68317) b!603418))

(assert (= (and b!603428 (not c!68317)) b!603420))

(assert (= (and b!603428 (not res!387518)) b!603423))

(assert (= (and b!603423 res!387520) b!603409))

(declare-fun m!580433 () Bool)

(assert (=> start!55122 m!580433))

(declare-fun m!580435 () Bool)

(assert (=> start!55122 m!580435))

(declare-fun m!580437 () Bool)

(assert (=> b!603427 m!580437))

(assert (=> b!603427 m!580437))

(declare-fun m!580439 () Bool)

(assert (=> b!603427 m!580439))

(declare-fun m!580441 () Bool)

(assert (=> b!603431 m!580441))

(declare-fun m!580443 () Bool)

(assert (=> b!603421 m!580443))

(assert (=> b!603421 m!580437))

(assert (=> b!603421 m!580437))

(declare-fun m!580445 () Bool)

(assert (=> b!603421 m!580445))

(assert (=> b!603418 m!580437))

(declare-fun m!580447 () Bool)

(assert (=> b!603418 m!580447))

(assert (=> b!603418 m!580437))

(assert (=> b!603418 m!580437))

(declare-fun m!580449 () Bool)

(assert (=> b!603418 m!580449))

(assert (=> b!603418 m!580437))

(declare-fun m!580451 () Bool)

(assert (=> b!603418 m!580451))

(declare-fun m!580453 () Bool)

(assert (=> b!603418 m!580453))

(declare-fun m!580455 () Bool)

(assert (=> b!603418 m!580455))

(declare-fun m!580457 () Bool)

(assert (=> b!603418 m!580457))

(declare-fun m!580459 () Bool)

(assert (=> b!603418 m!580459))

(assert (=> b!603419 m!580437))

(declare-fun m!580461 () Bool)

(assert (=> b!603419 m!580461))

(declare-fun m!580463 () Bool)

(assert (=> b!603419 m!580463))

(assert (=> b!603413 m!580437))

(assert (=> b!603413 m!580437))

(declare-fun m!580465 () Bool)

(assert (=> b!603413 m!580465))

(assert (=> b!603409 m!580437))

(assert (=> b!603409 m!580437))

(declare-fun m!580467 () Bool)

(assert (=> b!603409 m!580467))

(declare-fun m!580469 () Bool)

(assert (=> b!603430 m!580469))

(declare-fun m!580471 () Bool)

(assert (=> b!603425 m!580471))

(declare-fun m!580473 () Bool)

(assert (=> b!603425 m!580473))

(assert (=> b!603425 m!580437))

(assert (=> b!603425 m!580461))

(assert (=> b!603425 m!580437))

(declare-fun m!580475 () Bool)

(assert (=> b!603425 m!580475))

(declare-fun m!580477 () Bool)

(assert (=> b!603425 m!580477))

(declare-fun m!580479 () Bool)

(assert (=> b!603425 m!580479))

(declare-fun m!580481 () Bool)

(assert (=> b!603425 m!580481))

(declare-fun m!580483 () Bool)

(assert (=> b!603417 m!580483))

(assert (=> b!603423 m!580437))

(assert (=> b!603423 m!580437))

(assert (=> b!603423 m!580465))

(assert (=> b!603411 m!580437))

(declare-fun m!580485 () Bool)

(assert (=> b!603410 m!580485))

(assert (=> b!603422 m!580461))

(declare-fun m!580487 () Bool)

(assert (=> b!603422 m!580487))

(assert (=> b!603429 m!580437))

(assert (=> b!603429 m!580437))

(assert (=> b!603429 m!580467))

(declare-fun m!580489 () Bool)

(assert (=> b!603415 m!580489))

(declare-fun m!580491 () Bool)

(assert (=> b!603424 m!580491))

(check-sat (not b!603418) (not b!603425) (not b!603431) (not b!603427) (not b!603430) (not b!603410) (not b!603429) (not start!55122) (not b!603417) (not b!603409) (not b!603421) (not b!603424) (not b!603413) (not b!603423))
(check-sat)
