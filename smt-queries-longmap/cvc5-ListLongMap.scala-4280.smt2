; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59588 () Bool)

(assert start!59588)

(declare-fun b!658443 () Bool)

(assert (=> b!658443 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!22854 0))(
  ( (Unit!22855) )
))
(declare-fun lt!307886 () Unit!22854)

(declare-datatypes ((array!38746 0))(
  ( (array!38747 (arr!18570 (Array (_ BitVec 32) (_ BitVec 64))) (size!18934 (_ BitVec 32))) )
))
(declare-fun lt!307884 () array!38746)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38746)

(declare-datatypes ((List!12611 0))(
  ( (Nil!12608) (Cons!12607 (h!13652 (_ BitVec 64)) (t!18839 List!12611)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38746 (_ BitVec 64) (_ BitVec 32) List!12611) Unit!22854)

(assert (=> b!658443 (= lt!307886 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307884 (select (arr!18570 a!2986) j!136) index!984 Nil!12608))))

(declare-fun arrayNoDuplicates!0 (array!38746 (_ BitVec 32) List!12611) Bool)

(assert (=> b!658443 (arrayNoDuplicates!0 lt!307884 index!984 Nil!12608)))

(declare-fun lt!307870 () Unit!22854)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38746 (_ BitVec 32) (_ BitVec 32)) Unit!22854)

(assert (=> b!658443 (= lt!307870 (lemmaNoDuplicateFromThenFromBigger!0 lt!307884 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658443 (arrayNoDuplicates!0 lt!307884 #b00000000000000000000000000000000 Nil!12608)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!307871 () Unit!22854)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38746 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12611) Unit!22854)

(assert (=> b!658443 (= lt!307871 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12608))))

(declare-fun arrayContainsKey!0 (array!38746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658443 (arrayContainsKey!0 lt!307884 (select (arr!18570 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307881 () Unit!22854)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38746 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22854)

(assert (=> b!658443 (= lt!307881 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307884 (select (arr!18570 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378263 () Bool)

(assert (=> b!658443 e!378263))

(declare-fun res!426997 () Bool)

(assert (=> b!658443 (=> (not res!426997) (not e!378263))))

(assert (=> b!658443 (= res!426997 (arrayContainsKey!0 lt!307884 (select (arr!18570 a!2986) j!136) j!136))))

(declare-fun e!378266 () Unit!22854)

(declare-fun Unit!22856 () Unit!22854)

(assert (=> b!658443 (= e!378266 Unit!22856)))

(declare-fun res!427006 () Bool)

(declare-fun e!378260 () Bool)

(assert (=> start!59588 (=> (not res!427006) (not e!378260))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59588 (= res!427006 (validMask!0 mask!3053))))

(assert (=> start!59588 e!378260))

(assert (=> start!59588 true))

(declare-fun array_inv!14366 (array!38746) Bool)

(assert (=> start!59588 (array_inv!14366 a!2986)))

(declare-fun b!658444 () Bool)

(declare-fun e!378258 () Bool)

(assert (=> b!658444 (= e!378258 (arrayContainsKey!0 lt!307884 (select (arr!18570 a!2986) j!136) index!984))))

(declare-fun b!658445 () Bool)

(declare-fun e!378261 () Bool)

(declare-datatypes ((SeekEntryResult!7010 0))(
  ( (MissingZero!7010 (index!30405 (_ BitVec 32))) (Found!7010 (index!30406 (_ BitVec 32))) (Intermediate!7010 (undefined!7822 Bool) (index!30407 (_ BitVec 32)) (x!59197 (_ BitVec 32))) (Undefined!7010) (MissingVacant!7010 (index!30408 (_ BitVec 32))) )
))
(declare-fun lt!307878 () SeekEntryResult!7010)

(declare-fun lt!307885 () SeekEntryResult!7010)

(assert (=> b!658445 (= e!378261 (= lt!307878 lt!307885))))

(declare-fun b!658446 () Bool)

(declare-fun Unit!22857 () Unit!22854)

(assert (=> b!658446 (= e!378266 Unit!22857)))

(declare-fun res!427002 () Bool)

(declare-fun b!658447 () Bool)

(assert (=> b!658447 (= res!427002 (arrayContainsKey!0 lt!307884 (select (arr!18570 a!2986) j!136) j!136))))

(assert (=> b!658447 (=> (not res!427002) (not e!378258))))

(declare-fun e!378267 () Bool)

(assert (=> b!658447 (= e!378267 e!378258)))

(declare-fun b!658448 () Bool)

(declare-fun res!427009 () Bool)

(assert (=> b!658448 (=> (not res!427009) (not e!378260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658448 (= res!427009 (validKeyInArray!0 k!1786))))

(declare-fun b!658449 () Bool)

(declare-fun e!378264 () Unit!22854)

(declare-fun Unit!22858 () Unit!22854)

(assert (=> b!658449 (= e!378264 Unit!22858)))

(declare-fun b!658450 () Bool)

(declare-fun res!426996 () Bool)

(declare-fun e!378257 () Bool)

(assert (=> b!658450 (=> (not res!426996) (not e!378257))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!658450 (= res!426996 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18570 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658451 () Bool)

(declare-fun e!378265 () Unit!22854)

(declare-fun Unit!22859 () Unit!22854)

(assert (=> b!658451 (= e!378265 Unit!22859)))

(assert (=> b!658451 false))

(declare-fun b!658452 () Bool)

(declare-fun Unit!22860 () Unit!22854)

(assert (=> b!658452 (= e!378265 Unit!22860)))

(declare-fun b!658453 () Bool)

(declare-fun e!378268 () Bool)

(declare-fun e!378259 () Bool)

(assert (=> b!658453 (= e!378268 e!378259)))

(declare-fun res!426999 () Bool)

(assert (=> b!658453 (=> (not res!426999) (not e!378259))))

(assert (=> b!658453 (= res!426999 (and (= lt!307878 (Found!7010 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18570 a!2986) index!984) (select (arr!18570 a!2986) j!136))) (not (= (select (arr!18570 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38746 (_ BitVec 32)) SeekEntryResult!7010)

(assert (=> b!658453 (= lt!307878 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18570 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658454 () Bool)

(assert (=> b!658454 false))

(declare-fun lt!307874 () Unit!22854)

(assert (=> b!658454 (= lt!307874 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307884 (select (arr!18570 a!2986) j!136) j!136 Nil!12608))))

(assert (=> b!658454 (arrayNoDuplicates!0 lt!307884 j!136 Nil!12608)))

(declare-fun lt!307869 () Unit!22854)

(assert (=> b!658454 (= lt!307869 (lemmaNoDuplicateFromThenFromBigger!0 lt!307884 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658454 (arrayNoDuplicates!0 lt!307884 #b00000000000000000000000000000000 Nil!12608)))

(declare-fun lt!307880 () Unit!22854)

(assert (=> b!658454 (= lt!307880 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12608))))

(assert (=> b!658454 (arrayContainsKey!0 lt!307884 (select (arr!18570 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307875 () Unit!22854)

(assert (=> b!658454 (= lt!307875 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307884 (select (arr!18570 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378262 () Unit!22854)

(declare-fun Unit!22861 () Unit!22854)

(assert (=> b!658454 (= e!378262 Unit!22861)))

(declare-fun b!658455 () Bool)

(declare-fun res!427005 () Bool)

(assert (=> b!658455 (=> (not res!427005) (not e!378260))))

(assert (=> b!658455 (= res!427005 (validKeyInArray!0 (select (arr!18570 a!2986) j!136)))))

(declare-fun b!658456 () Bool)

(declare-fun res!427000 () Bool)

(assert (=> b!658456 (=> (not res!427000) (not e!378260))))

(assert (=> b!658456 (= res!427000 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658457 () Bool)

(assert (=> b!658457 (= e!378257 e!378268)))

(declare-fun res!427008 () Bool)

(assert (=> b!658457 (=> (not res!427008) (not e!378268))))

(assert (=> b!658457 (= res!427008 (= (select (store (arr!18570 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658457 (= lt!307884 (array!38747 (store (arr!18570 a!2986) i!1108 k!1786) (size!18934 a!2986)))))

(declare-fun b!658458 () Bool)

(declare-fun Unit!22862 () Unit!22854)

(assert (=> b!658458 (= e!378264 Unit!22862)))

(declare-fun res!427004 () Bool)

(assert (=> b!658458 (= res!427004 (= (select (store (arr!18570 a!2986) i!1108 k!1786) index!984) (select (arr!18570 a!2986) j!136)))))

(declare-fun e!378270 () Bool)

(assert (=> b!658458 (=> (not res!427004) (not e!378270))))

(assert (=> b!658458 e!378270))

(declare-fun c!76091 () Bool)

(assert (=> b!658458 (= c!76091 (bvslt j!136 index!984))))

(declare-fun lt!307877 () Unit!22854)

(assert (=> b!658458 (= lt!307877 e!378262)))

(declare-fun c!76094 () Bool)

(assert (=> b!658458 (= c!76094 (bvslt index!984 j!136))))

(declare-fun lt!307873 () Unit!22854)

(assert (=> b!658458 (= lt!307873 e!378266)))

(assert (=> b!658458 false))

(declare-fun b!658459 () Bool)

(declare-fun res!426995 () Bool)

(assert (=> b!658459 (= res!426995 (bvsge j!136 index!984))))

(assert (=> b!658459 (=> res!426995 e!378267)))

(assert (=> b!658459 (= e!378270 e!378267)))

(declare-fun b!658460 () Bool)

(declare-fun res!427003 () Bool)

(assert (=> b!658460 (=> (not res!427003) (not e!378260))))

(assert (=> b!658460 (= res!427003 (and (= (size!18934 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18934 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18934 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658461 () Bool)

(declare-fun Unit!22863 () Unit!22854)

(assert (=> b!658461 (= e!378262 Unit!22863)))

(declare-fun b!658462 () Bool)

(declare-fun res!427007 () Bool)

(assert (=> b!658462 (=> (not res!427007) (not e!378257))))

(assert (=> b!658462 (= res!427007 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12608))))

(declare-fun b!658463 () Bool)

(assert (=> b!658463 (= e!378263 (arrayContainsKey!0 lt!307884 (select (arr!18570 a!2986) j!136) index!984))))

(declare-fun b!658464 () Bool)

(declare-fun res!426998 () Bool)

(assert (=> b!658464 (=> (not res!426998) (not e!378257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38746 (_ BitVec 32)) Bool)

(assert (=> b!658464 (= res!426998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658465 () Bool)

(assert (=> b!658465 (= e!378259 (not true))))

(declare-fun lt!307883 () Unit!22854)

(assert (=> b!658465 (= lt!307883 e!378264)))

(declare-fun c!76093 () Bool)

(declare-fun lt!307879 () SeekEntryResult!7010)

(assert (=> b!658465 (= c!76093 (= lt!307879 (Found!7010 index!984)))))

(declare-fun lt!307888 () Unit!22854)

(assert (=> b!658465 (= lt!307888 e!378265)))

(declare-fun c!76092 () Bool)

(assert (=> b!658465 (= c!76092 (= lt!307879 Undefined!7010))))

(declare-fun lt!307876 () (_ BitVec 64))

(assert (=> b!658465 (= lt!307879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307876 lt!307884 mask!3053))))

(assert (=> b!658465 e!378261))

(declare-fun res!427010 () Bool)

(assert (=> b!658465 (=> (not res!427010) (not e!378261))))

(declare-fun lt!307882 () (_ BitVec 32))

(assert (=> b!658465 (= res!427010 (= lt!307885 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307882 vacantSpotIndex!68 lt!307876 lt!307884 mask!3053)))))

(assert (=> b!658465 (= lt!307885 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307882 vacantSpotIndex!68 (select (arr!18570 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658465 (= lt!307876 (select (store (arr!18570 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307872 () Unit!22854)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38746 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22854)

(assert (=> b!658465 (= lt!307872 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307882 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658465 (= lt!307882 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658466 () Bool)

(assert (=> b!658466 (= e!378260 e!378257)))

(declare-fun res!427001 () Bool)

(assert (=> b!658466 (=> (not res!427001) (not e!378257))))

(declare-fun lt!307887 () SeekEntryResult!7010)

(assert (=> b!658466 (= res!427001 (or (= lt!307887 (MissingZero!7010 i!1108)) (= lt!307887 (MissingVacant!7010 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38746 (_ BitVec 32)) SeekEntryResult!7010)

(assert (=> b!658466 (= lt!307887 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!59588 res!427006) b!658460))

(assert (= (and b!658460 res!427003) b!658455))

(assert (= (and b!658455 res!427005) b!658448))

(assert (= (and b!658448 res!427009) b!658456))

(assert (= (and b!658456 res!427000) b!658466))

(assert (= (and b!658466 res!427001) b!658464))

(assert (= (and b!658464 res!426998) b!658462))

(assert (= (and b!658462 res!427007) b!658450))

(assert (= (and b!658450 res!426996) b!658457))

(assert (= (and b!658457 res!427008) b!658453))

(assert (= (and b!658453 res!426999) b!658465))

(assert (= (and b!658465 res!427010) b!658445))

(assert (= (and b!658465 c!76092) b!658451))

(assert (= (and b!658465 (not c!76092)) b!658452))

(assert (= (and b!658465 c!76093) b!658458))

(assert (= (and b!658465 (not c!76093)) b!658449))

(assert (= (and b!658458 res!427004) b!658459))

(assert (= (and b!658459 (not res!426995)) b!658447))

(assert (= (and b!658447 res!427002) b!658444))

(assert (= (and b!658458 c!76091) b!658454))

(assert (= (and b!658458 (not c!76091)) b!658461))

(assert (= (and b!658458 c!76094) b!658443))

(assert (= (and b!658458 (not c!76094)) b!658446))

(assert (= (and b!658443 res!426997) b!658463))

(declare-fun m!631427 () Bool)

(assert (=> b!658448 m!631427))

(declare-fun m!631429 () Bool)

(assert (=> b!658444 m!631429))

(assert (=> b!658444 m!631429))

(declare-fun m!631431 () Bool)

(assert (=> b!658444 m!631431))

(declare-fun m!631433 () Bool)

(assert (=> b!658462 m!631433))

(declare-fun m!631435 () Bool)

(assert (=> b!658457 m!631435))

(declare-fun m!631437 () Bool)

(assert (=> b!658457 m!631437))

(declare-fun m!631439 () Bool)

(assert (=> b!658454 m!631439))

(declare-fun m!631441 () Bool)

(assert (=> b!658454 m!631441))

(assert (=> b!658454 m!631429))

(declare-fun m!631443 () Bool)

(assert (=> b!658454 m!631443))

(assert (=> b!658454 m!631429))

(declare-fun m!631445 () Bool)

(assert (=> b!658454 m!631445))

(declare-fun m!631447 () Bool)

(assert (=> b!658454 m!631447))

(assert (=> b!658454 m!631429))

(declare-fun m!631449 () Bool)

(assert (=> b!658454 m!631449))

(assert (=> b!658454 m!631429))

(declare-fun m!631451 () Bool)

(assert (=> b!658454 m!631451))

(assert (=> b!658455 m!631429))

(assert (=> b!658455 m!631429))

(declare-fun m!631453 () Bool)

(assert (=> b!658455 m!631453))

(assert (=> b!658447 m!631429))

(assert (=> b!658447 m!631429))

(declare-fun m!631455 () Bool)

(assert (=> b!658447 m!631455))

(declare-fun m!631457 () Bool)

(assert (=> b!658450 m!631457))

(assert (=> b!658458 m!631435))

(declare-fun m!631459 () Bool)

(assert (=> b!658458 m!631459))

(assert (=> b!658458 m!631429))

(declare-fun m!631461 () Bool)

(assert (=> b!658453 m!631461))

(assert (=> b!658453 m!631429))

(assert (=> b!658453 m!631429))

(declare-fun m!631463 () Bool)

(assert (=> b!658453 m!631463))

(declare-fun m!631465 () Bool)

(assert (=> b!658456 m!631465))

(assert (=> b!658463 m!631429))

(assert (=> b!658463 m!631429))

(assert (=> b!658463 m!631431))

(declare-fun m!631467 () Bool)

(assert (=> start!59588 m!631467))

(declare-fun m!631469 () Bool)

(assert (=> start!59588 m!631469))

(declare-fun m!631471 () Bool)

(assert (=> b!658443 m!631471))

(assert (=> b!658443 m!631429))

(assert (=> b!658443 m!631455))

(assert (=> b!658443 m!631429))

(assert (=> b!658443 m!631429))

(declare-fun m!631473 () Bool)

(assert (=> b!658443 m!631473))

(assert (=> b!658443 m!631439))

(assert (=> b!658443 m!631429))

(declare-fun m!631475 () Bool)

(assert (=> b!658443 m!631475))

(assert (=> b!658443 m!631447))

(declare-fun m!631477 () Bool)

(assert (=> b!658443 m!631477))

(assert (=> b!658443 m!631429))

(declare-fun m!631479 () Bool)

(assert (=> b!658443 m!631479))

(declare-fun m!631481 () Bool)

(assert (=> b!658464 m!631481))

(declare-fun m!631483 () Bool)

(assert (=> b!658465 m!631483))

(assert (=> b!658465 m!631429))

(assert (=> b!658465 m!631435))

(declare-fun m!631485 () Bool)

(assert (=> b!658465 m!631485))

(assert (=> b!658465 m!631429))

(declare-fun m!631487 () Bool)

(assert (=> b!658465 m!631487))

(declare-fun m!631489 () Bool)

(assert (=> b!658465 m!631489))

(declare-fun m!631491 () Bool)

(assert (=> b!658465 m!631491))

(declare-fun m!631493 () Bool)

(assert (=> b!658465 m!631493))

(declare-fun m!631495 () Bool)

(assert (=> b!658466 m!631495))

(push 1)

