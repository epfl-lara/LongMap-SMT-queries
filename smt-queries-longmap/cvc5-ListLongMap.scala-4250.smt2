; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58878 () Bool)

(assert start!58878)

(declare-fun b!649661 () Bool)

(declare-fun e!372649 () Bool)

(declare-fun e!372648 () Bool)

(assert (=> b!649661 (= e!372649 e!372648)))

(declare-fun res!421238 () Bool)

(assert (=> b!649661 (=> (not res!421238) (not e!372648))))

(declare-datatypes ((array!38551 0))(
  ( (array!38552 (arr!18481 (Array (_ BitVec 32) (_ BitVec 64))) (size!18846 (_ BitVec 32))) )
))
(declare-fun lt!301694 () array!38551)

(declare-fun a!2986 () array!38551)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649661 (= res!421238 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) j!136))))

(declare-fun b!649662 () Bool)

(declare-fun e!372646 () Bool)

(declare-fun e!372644 () Bool)

(assert (=> b!649662 (= e!372646 e!372644)))

(declare-fun res!421246 () Bool)

(assert (=> b!649662 (=> res!421246 e!372644)))

(declare-fun lt!301687 () (_ BitVec 64))

(declare-fun lt!301695 () (_ BitVec 64))

(assert (=> b!649662 (= res!421246 (or (not (= (select (arr!18481 a!2986) j!136) lt!301687)) (not (= (select (arr!18481 a!2986) j!136) lt!301695))))))

(declare-fun e!372653 () Bool)

(assert (=> b!649662 e!372653))

(declare-fun res!421231 () Bool)

(assert (=> b!649662 (=> (not res!421231) (not e!372653))))

(assert (=> b!649662 (= res!421231 (= lt!301695 (select (arr!18481 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!649662 (= lt!301695 (select (store (arr!18481 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649663 () Bool)

(declare-fun e!372652 () Bool)

(assert (=> b!649663 (= e!372652 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) index!984))))

(declare-fun b!649665 () Bool)

(declare-fun e!372645 () Bool)

(assert (=> b!649665 (= e!372645 (not e!372646))))

(declare-fun res!421242 () Bool)

(assert (=> b!649665 (=> res!421242 e!372646)))

(declare-datatypes ((SeekEntryResult!6918 0))(
  ( (MissingZero!6918 (index!30019 (_ BitVec 32))) (Found!6918 (index!30020 (_ BitVec 32))) (Intermediate!6918 (undefined!7730 Bool) (index!30021 (_ BitVec 32)) (x!58806 (_ BitVec 32))) (Undefined!6918) (MissingVacant!6918 (index!30022 (_ BitVec 32))) )
))
(declare-fun lt!301685 () SeekEntryResult!6918)

(assert (=> b!649665 (= res!421242 (not (= lt!301685 (Found!6918 index!984))))))

(declare-datatypes ((Unit!22136 0))(
  ( (Unit!22137) )
))
(declare-fun lt!301686 () Unit!22136)

(declare-fun e!372651 () Unit!22136)

(assert (=> b!649665 (= lt!301686 e!372651)))

(declare-fun c!74582 () Bool)

(assert (=> b!649665 (= c!74582 (= lt!301685 Undefined!6918))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38551 (_ BitVec 32)) SeekEntryResult!6918)

(assert (=> b!649665 (= lt!301685 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301687 lt!301694 mask!3053))))

(declare-fun e!372650 () Bool)

(assert (=> b!649665 e!372650))

(declare-fun res!421243 () Bool)

(assert (=> b!649665 (=> (not res!421243) (not e!372650))))

(declare-fun lt!301690 () SeekEntryResult!6918)

(declare-fun lt!301697 () (_ BitVec 32))

(assert (=> b!649665 (= res!421243 (= lt!301690 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 lt!301687 lt!301694 mask!3053)))))

(assert (=> b!649665 (= lt!301690 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649665 (= lt!301687 (select (store (arr!18481 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301683 () Unit!22136)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38551 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22136)

(assert (=> b!649665 (= lt!301683 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649665 (= lt!301697 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649666 () Bool)

(declare-fun e!372643 () Bool)

(assert (=> b!649666 (= e!372644 e!372643)))

(declare-fun res!421248 () Bool)

(assert (=> b!649666 (=> res!421248 e!372643)))

(assert (=> b!649666 (= res!421248 (bvsge index!984 j!136))))

(declare-fun lt!301688 () Unit!22136)

(declare-fun e!372647 () Unit!22136)

(assert (=> b!649666 (= lt!301688 e!372647)))

(declare-fun c!74583 () Bool)

(assert (=> b!649666 (= c!74583 (bvslt j!136 index!984))))

(declare-fun b!649667 () Bool)

(assert (=> b!649667 (= e!372648 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) index!984))))

(declare-fun b!649668 () Bool)

(declare-fun res!421247 () Bool)

(declare-fun e!372642 () Bool)

(assert (=> b!649668 (=> (not res!421247) (not e!372642))))

(assert (=> b!649668 (= res!421247 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18481 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649669 () Bool)

(declare-fun Unit!22138 () Unit!22136)

(assert (=> b!649669 (= e!372647 Unit!22138)))

(declare-fun b!649670 () Bool)

(declare-fun res!421244 () Bool)

(assert (=> b!649670 (=> (not res!421244) (not e!372642))))

(declare-datatypes ((List!12561 0))(
  ( (Nil!12558) (Cons!12557 (h!13602 (_ BitVec 64)) (t!18780 List!12561)) )
))
(declare-fun arrayNoDuplicates!0 (array!38551 (_ BitVec 32) List!12561) Bool)

(assert (=> b!649670 (= res!421244 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12558))))

(declare-fun b!649671 () Bool)

(declare-fun res!421235 () Bool)

(assert (=> b!649671 (=> (not res!421235) (not e!372642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38551 (_ BitVec 32)) Bool)

(assert (=> b!649671 (= res!421235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649672 () Bool)

(declare-fun Unit!22139 () Unit!22136)

(assert (=> b!649672 (= e!372651 Unit!22139)))

(assert (=> b!649672 false))

(declare-fun b!649673 () Bool)

(declare-fun e!372641 () Bool)

(assert (=> b!649673 (= e!372642 e!372641)))

(declare-fun res!421241 () Bool)

(assert (=> b!649673 (=> (not res!421241) (not e!372641))))

(assert (=> b!649673 (= res!421241 (= (select (store (arr!18481 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649673 (= lt!301694 (array!38552 (store (arr!18481 a!2986) i!1108 k!1786) (size!18846 a!2986)))))

(declare-fun b!649674 () Bool)

(declare-fun Unit!22140 () Unit!22136)

(assert (=> b!649674 (= e!372651 Unit!22140)))

(declare-fun b!649675 () Bool)

(declare-fun res!421240 () Bool)

(declare-fun e!372639 () Bool)

(assert (=> b!649675 (=> (not res!421240) (not e!372639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649675 (= res!421240 (validKeyInArray!0 (select (arr!18481 a!2986) j!136)))))

(declare-fun b!649676 () Bool)

(assert (=> b!649676 (= e!372653 e!372649)))

(declare-fun res!421239 () Bool)

(assert (=> b!649676 (=> res!421239 e!372649)))

(assert (=> b!649676 (= res!421239 (or (not (= (select (arr!18481 a!2986) j!136) lt!301687)) (not (= (select (arr!18481 a!2986) j!136) lt!301695)) (bvsge j!136 index!984)))))

(declare-fun res!421234 () Bool)

(assert (=> start!58878 (=> (not res!421234) (not e!372639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58878 (= res!421234 (validMask!0 mask!3053))))

(assert (=> start!58878 e!372639))

(assert (=> start!58878 true))

(declare-fun array_inv!14364 (array!38551) Bool)

(assert (=> start!58878 (array_inv!14364 a!2986)))

(declare-fun b!649664 () Bool)

(declare-fun Unit!22141 () Unit!22136)

(assert (=> b!649664 (= e!372647 Unit!22141)))

(declare-fun lt!301691 () Unit!22136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22136)

(assert (=> b!649664 (= lt!301691 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301694 (select (arr!18481 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649664 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301698 () Unit!22136)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12561) Unit!22136)

(assert (=> b!649664 (= lt!301698 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12558))))

(assert (=> b!649664 (arrayNoDuplicates!0 lt!301694 #b00000000000000000000000000000000 Nil!12558)))

(declare-fun lt!301692 () Unit!22136)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38551 (_ BitVec 32) (_ BitVec 32)) Unit!22136)

(assert (=> b!649664 (= lt!301692 (lemmaNoDuplicateFromThenFromBigger!0 lt!301694 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649664 (arrayNoDuplicates!0 lt!301694 j!136 Nil!12558)))

(declare-fun lt!301684 () Unit!22136)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38551 (_ BitVec 64) (_ BitVec 32) List!12561) Unit!22136)

(assert (=> b!649664 (= lt!301684 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301694 (select (arr!18481 a!2986) j!136) j!136 Nil!12558))))

(assert (=> b!649664 false))

(declare-fun b!649677 () Bool)

(assert (=> b!649677 (= e!372641 e!372645)))

(declare-fun res!421245 () Bool)

(assert (=> b!649677 (=> (not res!421245) (not e!372645))))

(declare-fun lt!301693 () SeekEntryResult!6918)

(assert (=> b!649677 (= res!421245 (and (= lt!301693 (Found!6918 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18481 a!2986) index!984) (select (arr!18481 a!2986) j!136))) (not (= (select (arr!18481 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!649677 (= lt!301693 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649678 () Bool)

(assert (=> b!649678 (= e!372639 e!372642)))

(declare-fun res!421237 () Bool)

(assert (=> b!649678 (=> (not res!421237) (not e!372642))))

(declare-fun lt!301689 () SeekEntryResult!6918)

(assert (=> b!649678 (= res!421237 (or (= lt!301689 (MissingZero!6918 i!1108)) (= lt!301689 (MissingVacant!6918 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38551 (_ BitVec 32)) SeekEntryResult!6918)

(assert (=> b!649678 (= lt!301689 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649679 () Bool)

(assert (=> b!649679 (= e!372643 (bvslt (size!18846 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!649679 (arrayNoDuplicates!0 lt!301694 #b00000000000000000000000000000000 Nil!12558)))

(declare-fun lt!301696 () Unit!22136)

(assert (=> b!649679 (= lt!301696 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12558))))

(assert (=> b!649679 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301682 () Unit!22136)

(assert (=> b!649679 (= lt!301682 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301694 (select (arr!18481 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649679 e!372652))

(declare-fun res!421233 () Bool)

(assert (=> b!649679 (=> (not res!421233) (not e!372652))))

(assert (=> b!649679 (= res!421233 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) j!136))))

(declare-fun b!649680 () Bool)

(assert (=> b!649680 (= e!372650 (= lt!301693 lt!301690))))

(declare-fun b!649681 () Bool)

(declare-fun res!421232 () Bool)

(assert (=> b!649681 (=> (not res!421232) (not e!372639))))

(assert (=> b!649681 (= res!421232 (validKeyInArray!0 k!1786))))

(declare-fun b!649682 () Bool)

(declare-fun res!421236 () Bool)

(assert (=> b!649682 (=> (not res!421236) (not e!372639))))

(assert (=> b!649682 (= res!421236 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649683 () Bool)

(declare-fun res!421249 () Bool)

(assert (=> b!649683 (=> (not res!421249) (not e!372639))))

(assert (=> b!649683 (= res!421249 (and (= (size!18846 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18846 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18846 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!58878 res!421234) b!649683))

(assert (= (and b!649683 res!421249) b!649675))

(assert (= (and b!649675 res!421240) b!649681))

(assert (= (and b!649681 res!421232) b!649682))

(assert (= (and b!649682 res!421236) b!649678))

(assert (= (and b!649678 res!421237) b!649671))

(assert (= (and b!649671 res!421235) b!649670))

(assert (= (and b!649670 res!421244) b!649668))

(assert (= (and b!649668 res!421247) b!649673))

(assert (= (and b!649673 res!421241) b!649677))

(assert (= (and b!649677 res!421245) b!649665))

(assert (= (and b!649665 res!421243) b!649680))

(assert (= (and b!649665 c!74582) b!649672))

(assert (= (and b!649665 (not c!74582)) b!649674))

(assert (= (and b!649665 (not res!421242)) b!649662))

(assert (= (and b!649662 res!421231) b!649676))

(assert (= (and b!649676 (not res!421239)) b!649661))

(assert (= (and b!649661 res!421238) b!649667))

(assert (= (and b!649662 (not res!421246)) b!649666))

(assert (= (and b!649666 c!74583) b!649664))

(assert (= (and b!649666 (not c!74583)) b!649669))

(assert (= (and b!649666 (not res!421248)) b!649679))

(assert (= (and b!649679 res!421233) b!649663))

(declare-fun m!622391 () Bool)

(assert (=> b!649676 m!622391))

(declare-fun m!622393 () Bool)

(assert (=> b!649670 m!622393))

(declare-fun m!622395 () Bool)

(assert (=> b!649678 m!622395))

(declare-fun m!622397 () Bool)

(assert (=> b!649665 m!622397))

(declare-fun m!622399 () Bool)

(assert (=> b!649665 m!622399))

(assert (=> b!649665 m!622391))

(declare-fun m!622401 () Bool)

(assert (=> b!649665 m!622401))

(declare-fun m!622403 () Bool)

(assert (=> b!649665 m!622403))

(assert (=> b!649665 m!622391))

(declare-fun m!622405 () Bool)

(assert (=> b!649665 m!622405))

(declare-fun m!622407 () Bool)

(assert (=> b!649665 m!622407))

(declare-fun m!622409 () Bool)

(assert (=> b!649665 m!622409))

(declare-fun m!622411 () Bool)

(assert (=> b!649677 m!622411))

(assert (=> b!649677 m!622391))

(assert (=> b!649677 m!622391))

(declare-fun m!622413 () Bool)

(assert (=> b!649677 m!622413))

(assert (=> b!649679 m!622391))

(assert (=> b!649679 m!622391))

(declare-fun m!622415 () Bool)

(assert (=> b!649679 m!622415))

(assert (=> b!649679 m!622391))

(declare-fun m!622417 () Bool)

(assert (=> b!649679 m!622417))

(declare-fun m!622419 () Bool)

(assert (=> b!649679 m!622419))

(assert (=> b!649679 m!622391))

(declare-fun m!622421 () Bool)

(assert (=> b!649679 m!622421))

(declare-fun m!622423 () Bool)

(assert (=> b!649679 m!622423))

(declare-fun m!622425 () Bool)

(assert (=> b!649668 m!622425))

(declare-fun m!622427 () Bool)

(assert (=> b!649681 m!622427))

(assert (=> b!649675 m!622391))

(assert (=> b!649675 m!622391))

(declare-fun m!622429 () Bool)

(assert (=> b!649675 m!622429))

(declare-fun m!622431 () Bool)

(assert (=> start!58878 m!622431))

(declare-fun m!622433 () Bool)

(assert (=> start!58878 m!622433))

(assert (=> b!649664 m!622391))

(declare-fun m!622435 () Bool)

(assert (=> b!649664 m!622435))

(assert (=> b!649664 m!622391))

(declare-fun m!622437 () Bool)

(assert (=> b!649664 m!622437))

(assert (=> b!649664 m!622419))

(assert (=> b!649664 m!622391))

(declare-fun m!622439 () Bool)

(assert (=> b!649664 m!622439))

(assert (=> b!649664 m!622391))

(declare-fun m!622441 () Bool)

(assert (=> b!649664 m!622441))

(declare-fun m!622443 () Bool)

(assert (=> b!649664 m!622443))

(assert (=> b!649664 m!622423))

(assert (=> b!649667 m!622391))

(assert (=> b!649667 m!622391))

(declare-fun m!622445 () Bool)

(assert (=> b!649667 m!622445))

(assert (=> b!649663 m!622391))

(assert (=> b!649663 m!622391))

(assert (=> b!649663 m!622445))

(declare-fun m!622447 () Bool)

(assert (=> b!649671 m!622447))

(assert (=> b!649662 m!622391))

(assert (=> b!649662 m!622409))

(declare-fun m!622449 () Bool)

(assert (=> b!649662 m!622449))

(assert (=> b!649661 m!622391))

(assert (=> b!649661 m!622391))

(assert (=> b!649661 m!622417))

(assert (=> b!649673 m!622409))

(declare-fun m!622451 () Bool)

(assert (=> b!649673 m!622451))

(declare-fun m!622453 () Bool)

(assert (=> b!649682 m!622453))

(push 1)

(assert (not b!649682))

(assert (not b!649675))

(assert (not b!649679))

(assert (not b!649664))

(assert (not b!649661))

(assert (not start!58878))

(assert (not b!649665))

(assert (not b!649670))

(assert (not b!649667))

(assert (not b!649678))

(assert (not b!649681))

(assert (not b!649671))

(assert (not b!649663))

(assert (not b!649677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91675 () Bool)

(assert (=> d!91675 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301701 () Unit!22136)

(declare-fun choose!114 (array!38551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22136)

(assert (=> d!91675 (= lt!301701 (choose!114 lt!301694 (select (arr!18481 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91675 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91675 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301694 (select (arr!18481 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!301701)))

(declare-fun bs!19359 () Bool)

(assert (= bs!19359 d!91675))

(assert (=> bs!19359 m!622391))

(assert (=> bs!19359 m!622415))

(assert (=> bs!19359 m!622391))

(declare-fun m!622455 () Bool)

(assert (=> bs!19359 m!622455))

(assert (=> b!649679 d!91675))

(declare-fun b!649694 () Bool)

(declare-fun e!372663 () Bool)

(declare-fun contains!3157 (List!12561 (_ BitVec 64)) Bool)

(assert (=> b!649694 (= e!372663 (contains!3157 Nil!12558 (select (arr!18481 lt!301694) #b00000000000000000000000000000000)))))

(declare-fun b!649695 () Bool)

(declare-fun e!372662 () Bool)

(declare-fun call!33703 () Bool)

(assert (=> b!649695 (= e!372662 call!33703)))

(declare-fun b!649696 () Bool)

(declare-fun e!372664 () Bool)

(assert (=> b!649696 (= e!372664 e!372662)))

(declare-fun c!74586 () Bool)

(assert (=> b!649696 (= c!74586 (validKeyInArray!0 (select (arr!18481 lt!301694) #b00000000000000000000000000000000)))))

(declare-fun b!649697 () Bool)

(declare-fun e!372665 () Bool)

(assert (=> b!649697 (= e!372665 e!372664)))

(declare-fun res!421256 () Bool)

(assert (=> b!649697 (=> (not res!421256) (not e!372664))))

(assert (=> b!649697 (= res!421256 (not e!372663))))

(declare-fun res!421258 () Bool)

(assert (=> b!649697 (=> (not res!421258) (not e!372663))))

(assert (=> b!649697 (= res!421258 (validKeyInArray!0 (select (arr!18481 lt!301694) #b00000000000000000000000000000000)))))

(declare-fun b!649698 () Bool)

(assert (=> b!649698 (= e!372662 call!33703)))

(declare-fun d!91677 () Bool)

(declare-fun res!421257 () Bool)

(assert (=> d!91677 (=> res!421257 e!372665)))

(assert (=> d!91677 (= res!421257 (bvsge #b00000000000000000000000000000000 (size!18846 lt!301694)))))

(assert (=> d!91677 (= (arrayNoDuplicates!0 lt!301694 #b00000000000000000000000000000000 Nil!12558) e!372665)))

(declare-fun bm!33700 () Bool)

(assert (=> bm!33700 (= call!33703 (arrayNoDuplicates!0 lt!301694 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74586 (Cons!12557 (select (arr!18481 lt!301694) #b00000000000000000000000000000000) Nil!12558) Nil!12558)))))

(assert (= (and d!91677 (not res!421257)) b!649697))

(assert (= (and b!649697 res!421258) b!649694))

(assert (= (and b!649697 res!421256) b!649696))

(assert (= (and b!649696 c!74586) b!649695))

(assert (= (and b!649696 (not c!74586)) b!649698))

(assert (= (or b!649695 b!649698) bm!33700))

(declare-fun m!622457 () Bool)

(assert (=> b!649694 m!622457))

(assert (=> b!649694 m!622457))

(declare-fun m!622459 () Bool)

(assert (=> b!649694 m!622459))

(assert (=> b!649696 m!622457))

(assert (=> b!649696 m!622457))

(declare-fun m!622461 () Bool)

(assert (=> b!649696 m!622461))

(assert (=> b!649697 m!622457))

(assert (=> b!649697 m!622457))

(assert (=> b!649697 m!622461))

(assert (=> bm!33700 m!622457))

(declare-fun m!622463 () Bool)

(assert (=> bm!33700 m!622463))

(assert (=> b!649679 d!91677))

(declare-fun d!91679 () Bool)

(declare-fun res!421263 () Bool)

(declare-fun e!372670 () Bool)

(assert (=> d!91679 (=> res!421263 e!372670)))

(assert (=> d!91679 (= res!421263 (= (select (arr!18481 lt!301694) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18481 a!2986) j!136)))))

(assert (=> d!91679 (= (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!372670)))

(declare-fun b!649703 () Bool)

(declare-fun e!372671 () Bool)

(assert (=> b!649703 (= e!372670 e!372671)))

(declare-fun res!421264 () Bool)

(assert (=> b!649703 (=> (not res!421264) (not e!372671))))

(assert (=> b!649703 (= res!421264 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18846 lt!301694)))))

(declare-fun b!649704 () Bool)

(assert (=> b!649704 (= e!372671 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91679 (not res!421263)) b!649703))

(assert (= (and b!649703 res!421264) b!649704))

(declare-fun m!622465 () Bool)

(assert (=> d!91679 m!622465))

(assert (=> b!649704 m!622391))

(declare-fun m!622467 () Bool)

(assert (=> b!649704 m!622467))

(assert (=> b!649679 d!91679))

(declare-fun d!91681 () Bool)

(declare-fun res!421265 () Bool)

(declare-fun e!372672 () Bool)

(assert (=> d!91681 (=> res!421265 e!372672)))

(assert (=> d!91681 (= res!421265 (= (select (arr!18481 lt!301694) j!136) (select (arr!18481 a!2986) j!136)))))

(assert (=> d!91681 (= (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) j!136) e!372672)))

(declare-fun b!649705 () Bool)

(declare-fun e!372673 () Bool)

(assert (=> b!649705 (= e!372672 e!372673)))

(declare-fun res!421266 () Bool)

(assert (=> b!649705 (=> (not res!421266) (not e!372673))))

(assert (=> b!649705 (= res!421266 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18846 lt!301694)))))

(declare-fun b!649706 () Bool)

(assert (=> b!649706 (= e!372673 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91681 (not res!421265)) b!649705))

(assert (= (and b!649705 res!421266) b!649706))

(declare-fun m!622469 () Bool)

(assert (=> d!91681 m!622469))

(assert (=> b!649706 m!622391))

(declare-fun m!622471 () Bool)

(assert (=> b!649706 m!622471))

(assert (=> b!649679 d!91681))

(declare-fun d!91683 () Bool)

(declare-fun e!372676 () Bool)

(assert (=> d!91683 e!372676))

(declare-fun res!421269 () Bool)

(assert (=> d!91683 (=> (not res!421269) (not e!372676))))

(assert (=> d!91683 (= res!421269 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18846 a!2986))))))

(declare-fun lt!301704 () Unit!22136)

(declare-fun choose!41 (array!38551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12561) Unit!22136)

(assert (=> d!91683 (= lt!301704 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12558))))

(assert (=> d!91683 (bvslt (size!18846 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91683 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12558) lt!301704)))

(declare-fun b!649709 () Bool)

(assert (=> b!649709 (= e!372676 (arrayNoDuplicates!0 (array!38552 (store (arr!18481 a!2986) i!1108 k!1786) (size!18846 a!2986)) #b00000000000000000000000000000000 Nil!12558))))

(assert (= (and d!91683 res!421269) b!649709))

(declare-fun m!622473 () Bool)

(assert (=> d!91683 m!622473))

(assert (=> b!649709 m!622409))

(declare-fun m!622475 () Bool)

(assert (=> b!649709 m!622475))

(assert (=> b!649679 d!91683))

(declare-fun d!91685 () Bool)

(assert (=> d!91685 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58878 d!91685))

(declare-fun d!91691 () Bool)

(assert (=> d!91691 (= (array_inv!14364 a!2986) (bvsge (size!18846 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58878 d!91691))

(declare-fun b!649784 () Bool)

(declare-fun e!372733 () SeekEntryResult!6918)

(assert (=> b!649784 (= e!372733 (MissingVacant!6918 vacantSpotIndex!68))))

(declare-fun b!649785 () Bool)

(declare-fun c!74605 () Bool)

(declare-fun lt!301727 () (_ BitVec 64))

(assert (=> b!649785 (= c!74605 (= lt!301727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!372731 () SeekEntryResult!6918)

(assert (=> b!649785 (= e!372731 e!372733)))

(declare-fun b!649786 () Bool)

(declare-fun e!372732 () SeekEntryResult!6918)

(assert (=> b!649786 (= e!372732 Undefined!6918)))

(declare-fun b!649787 () Bool)

(assert (=> b!649787 (= e!372731 (Found!6918 index!984))))

(declare-fun b!649788 () Bool)

(assert (=> b!649788 (= e!372733 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649789 () Bool)

(assert (=> b!649789 (= e!372732 e!372731)))

(declare-fun c!74606 () Bool)

(assert (=> b!649789 (= c!74606 (= lt!301727 (select (arr!18481 a!2986) j!136)))))

(declare-fun lt!301728 () SeekEntryResult!6918)

(declare-fun d!91693 () Bool)

(assert (=> d!91693 (and (or (is-Undefined!6918 lt!301728) (not (is-Found!6918 lt!301728)) (and (bvsge (index!30020 lt!301728) #b00000000000000000000000000000000) (bvslt (index!30020 lt!301728) (size!18846 a!2986)))) (or (is-Undefined!6918 lt!301728) (is-Found!6918 lt!301728) (not (is-MissingVacant!6918 lt!301728)) (not (= (index!30022 lt!301728) vacantSpotIndex!68)) (and (bvsge (index!30022 lt!301728) #b00000000000000000000000000000000) (bvslt (index!30022 lt!301728) (size!18846 a!2986)))) (or (is-Undefined!6918 lt!301728) (ite (is-Found!6918 lt!301728) (= (select (arr!18481 a!2986) (index!30020 lt!301728)) (select (arr!18481 a!2986) j!136)) (and (is-MissingVacant!6918 lt!301728) (= (index!30022 lt!301728) vacantSpotIndex!68) (= (select (arr!18481 a!2986) (index!30022 lt!301728)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91693 (= lt!301728 e!372732)))

(declare-fun c!74607 () Bool)

(assert (=> d!91693 (= c!74607 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91693 (= lt!301727 (select (arr!18481 a!2986) index!984))))

(assert (=> d!91693 (validMask!0 mask!3053)))

(assert (=> d!91693 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053) lt!301728)))

(assert (= (and d!91693 c!74607) b!649786))

(assert (= (and d!91693 (not c!74607)) b!649789))

(assert (= (and b!649789 c!74606) b!649787))

(assert (= (and b!649789 (not c!74606)) b!649785))

(assert (= (and b!649785 c!74605) b!649784))

(assert (= (and b!649785 (not c!74605)) b!649788))

(assert (=> b!649788 m!622397))

(assert (=> b!649788 m!622397))

(assert (=> b!649788 m!622391))

(declare-fun m!622527 () Bool)

(assert (=> b!649788 m!622527))

(declare-fun m!622529 () Bool)

(assert (=> d!91693 m!622529))

(declare-fun m!622531 () Bool)

(assert (=> d!91693 m!622531))

(assert (=> d!91693 m!622411))

(assert (=> d!91693 m!622431))

(assert (=> b!649677 d!91693))

(declare-fun d!91715 () Bool)

(declare-fun res!421306 () Bool)

(declare-fun e!372736 () Bool)

(assert (=> d!91715 (=> res!421306 e!372736)))

(assert (=> d!91715 (= res!421306 (= (select (arr!18481 lt!301694) index!984) (select (arr!18481 a!2986) j!136)))))

(assert (=> d!91715 (= (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) index!984) e!372736)))

(declare-fun b!649792 () Bool)

(declare-fun e!372737 () Bool)

(assert (=> b!649792 (= e!372736 e!372737)))

(declare-fun res!421307 () Bool)

(assert (=> b!649792 (=> (not res!421307) (not e!372737))))

(assert (=> b!649792 (= res!421307 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18846 lt!301694)))))

(declare-fun b!649793 () Bool)

(assert (=> b!649793 (= e!372737 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91715 (not res!421306)) b!649792))

(assert (= (and b!649792 res!421307) b!649793))

(declare-fun m!622533 () Bool)

(assert (=> d!91715 m!622533))

(assert (=> b!649793 m!622391))

(declare-fun m!622535 () Bool)

(assert (=> b!649793 m!622535))

(assert (=> b!649667 d!91715))

(declare-fun b!649842 () Bool)

(declare-fun c!74621 () Bool)

(declare-fun lt!301754 () (_ BitVec 64))

(assert (=> b!649842 (= c!74621 (= lt!301754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!372777 () SeekEntryResult!6918)

(declare-fun e!372775 () SeekEntryResult!6918)

(assert (=> b!649842 (= e!372777 e!372775)))

(declare-fun b!649843 () Bool)

(declare-fun lt!301753 () SeekEntryResult!6918)

(assert (=> b!649843 (= e!372775 (MissingZero!6918 (index!30021 lt!301753)))))

(declare-fun b!649844 () Bool)

(assert (=> b!649844 (= e!372777 (Found!6918 (index!30021 lt!301753)))))

(declare-fun b!649845 () Bool)

(declare-fun e!372776 () SeekEntryResult!6918)

(assert (=> b!649845 (= e!372776 e!372777)))

(assert (=> b!649845 (= lt!301754 (select (arr!18481 a!2986) (index!30021 lt!301753)))))

(declare-fun c!74622 () Bool)

(assert (=> b!649845 (= c!74622 (= lt!301754 k!1786))))

(declare-fun b!649846 () Bool)

(assert (=> b!649846 (= e!372776 Undefined!6918)))

(declare-fun d!91717 () Bool)

(declare-fun lt!301752 () SeekEntryResult!6918)

(assert (=> d!91717 (and (or (is-Undefined!6918 lt!301752) (not (is-Found!6918 lt!301752)) (and (bvsge (index!30020 lt!301752) #b00000000000000000000000000000000) (bvslt (index!30020 lt!301752) (size!18846 a!2986)))) (or (is-Undefined!6918 lt!301752) (is-Found!6918 lt!301752) (not (is-MissingZero!6918 lt!301752)) (and (bvsge (index!30019 lt!301752) #b00000000000000000000000000000000) (bvslt (index!30019 lt!301752) (size!18846 a!2986)))) (or (is-Undefined!6918 lt!301752) (is-Found!6918 lt!301752) (is-MissingZero!6918 lt!301752) (not (is-MissingVacant!6918 lt!301752)) (and (bvsge (index!30022 lt!301752) #b00000000000000000000000000000000) (bvslt (index!30022 lt!301752) (size!18846 a!2986)))) (or (is-Undefined!6918 lt!301752) (ite (is-Found!6918 lt!301752) (= (select (arr!18481 a!2986) (index!30020 lt!301752)) k!1786) (ite (is-MissingZero!6918 lt!301752) (= (select (arr!18481 a!2986) (index!30019 lt!301752)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6918 lt!301752) (= (select (arr!18481 a!2986) (index!30022 lt!301752)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91717 (= lt!301752 e!372776)))

(declare-fun c!74623 () Bool)

(assert (=> d!91717 (= c!74623 (and (is-Intermediate!6918 lt!301753) (undefined!7730 lt!301753)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38551 (_ BitVec 32)) SeekEntryResult!6918)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91717 (= lt!301753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!91717 (validMask!0 mask!3053)))

(assert (=> d!91717 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!301752)))

(declare-fun b!649847 () Bool)

(assert (=> b!649847 (= e!372775 (seekKeyOrZeroReturnVacant!0 (x!58806 lt!301753) (index!30021 lt!301753) (index!30021 lt!301753) k!1786 a!2986 mask!3053))))

(assert (= (and d!91717 c!74623) b!649846))

(assert (= (and d!91717 (not c!74623)) b!649845))

(assert (= (and b!649845 c!74622) b!649844))

(assert (= (and b!649845 (not c!74622)) b!649842))

(assert (= (and b!649842 c!74621) b!649843))

(assert (= (and b!649842 (not c!74621)) b!649847))

(declare-fun m!622603 () Bool)

(assert (=> b!649845 m!622603))

(declare-fun m!622605 () Bool)

(assert (=> d!91717 m!622605))

(declare-fun m!622607 () Bool)

(assert (=> d!91717 m!622607))

(declare-fun m!622609 () Bool)

(assert (=> d!91717 m!622609))

(assert (=> d!91717 m!622431))

(declare-fun m!622611 () Bool)

(assert (=> d!91717 m!622611))

(declare-fun m!622613 () Bool)

(assert (=> d!91717 m!622613))

(assert (=> d!91717 m!622605))

(declare-fun m!622615 () Bool)

(assert (=> b!649847 m!622615))

(assert (=> b!649678 d!91717))

(declare-fun b!649848 () Bool)

(declare-fun e!372780 () SeekEntryResult!6918)

(assert (=> b!649848 (= e!372780 (MissingVacant!6918 vacantSpotIndex!68))))

(declare-fun b!649849 () Bool)

(declare-fun c!74624 () Bool)

(declare-fun lt!301755 () (_ BitVec 64))

(assert (=> b!649849 (= c!74624 (= lt!301755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!372778 () SeekEntryResult!6918)

(assert (=> b!649849 (= e!372778 e!372780)))

(declare-fun b!649850 () Bool)

(declare-fun e!372779 () SeekEntryResult!6918)

(assert (=> b!649850 (= e!372779 Undefined!6918)))

(declare-fun b!649851 () Bool)

(assert (=> b!649851 (= e!372778 (Found!6918 lt!301697))))

(declare-fun b!649852 () Bool)

(assert (=> b!649852 (= e!372780 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301697 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!301687 lt!301694 mask!3053))))

(declare-fun b!649853 () Bool)

(assert (=> b!649853 (= e!372779 e!372778)))

(declare-fun c!74625 () Bool)

(assert (=> b!649853 (= c!74625 (= lt!301755 lt!301687))))

(declare-fun d!91759 () Bool)

(declare-fun lt!301756 () SeekEntryResult!6918)

(assert (=> d!91759 (and (or (is-Undefined!6918 lt!301756) (not (is-Found!6918 lt!301756)) (and (bvsge (index!30020 lt!301756) #b00000000000000000000000000000000) (bvslt (index!30020 lt!301756) (size!18846 lt!301694)))) (or (is-Undefined!6918 lt!301756) (is-Found!6918 lt!301756) (not (is-MissingVacant!6918 lt!301756)) (not (= (index!30022 lt!301756) vacantSpotIndex!68)) (and (bvsge (index!30022 lt!301756) #b00000000000000000000000000000000) (bvslt (index!30022 lt!301756) (size!18846 lt!301694)))) (or (is-Undefined!6918 lt!301756) (ite (is-Found!6918 lt!301756) (= (select (arr!18481 lt!301694) (index!30020 lt!301756)) lt!301687) (and (is-MissingVacant!6918 lt!301756) (= (index!30022 lt!301756) vacantSpotIndex!68) (= (select (arr!18481 lt!301694) (index!30022 lt!301756)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91759 (= lt!301756 e!372779)))

(declare-fun c!74626 () Bool)

(assert (=> d!91759 (= c!74626 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91759 (= lt!301755 (select (arr!18481 lt!301694) lt!301697))))

(assert (=> d!91759 (validMask!0 mask!3053)))

(assert (=> d!91759 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 lt!301687 lt!301694 mask!3053) lt!301756)))

(assert (= (and d!91759 c!74626) b!649850))

(assert (= (and d!91759 (not c!74626)) b!649853))

(assert (= (and b!649853 c!74625) b!649851))

(assert (= (and b!649853 (not c!74625)) b!649849))

(assert (= (and b!649849 c!74624) b!649848))

(assert (= (and b!649849 (not c!74624)) b!649852))

(declare-fun m!622617 () Bool)

(assert (=> b!649852 m!622617))

(assert (=> b!649852 m!622617))

(declare-fun m!622619 () Bool)

(assert (=> b!649852 m!622619))

(declare-fun m!622621 () Bool)

(assert (=> d!91759 m!622621))

(declare-fun m!622623 () Bool)

(assert (=> d!91759 m!622623))

(declare-fun m!622625 () Bool)

(assert (=> d!91759 m!622625))

(assert (=> d!91759 m!622431))

(assert (=> b!649665 d!91759))

(declare-fun b!649854 () Bool)

(declare-fun e!372783 () SeekEntryResult!6918)

(assert (=> b!649854 (= e!372783 (MissingVacant!6918 vacantSpotIndex!68))))

(declare-fun b!649855 () Bool)

(declare-fun c!74627 () Bool)

(declare-fun lt!301757 () (_ BitVec 64))

(assert (=> b!649855 (= c!74627 (= lt!301757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!372781 () SeekEntryResult!6918)

(assert (=> b!649855 (= e!372781 e!372783)))

(declare-fun b!649856 () Bool)

(declare-fun e!372782 () SeekEntryResult!6918)

(assert (=> b!649856 (= e!372782 Undefined!6918)))

(declare-fun b!649857 () Bool)

(assert (=> b!649857 (= e!372781 (Found!6918 lt!301697))))

(declare-fun b!649858 () Bool)

(assert (=> b!649858 (= e!372783 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301697 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649859 () Bool)

(assert (=> b!649859 (= e!372782 e!372781)))

(declare-fun c!74628 () Bool)

(assert (=> b!649859 (= c!74628 (= lt!301757 (select (arr!18481 a!2986) j!136)))))

(declare-fun lt!301758 () SeekEntryResult!6918)

(declare-fun d!91761 () Bool)

(assert (=> d!91761 (and (or (is-Undefined!6918 lt!301758) (not (is-Found!6918 lt!301758)) (and (bvsge (index!30020 lt!301758) #b00000000000000000000000000000000) (bvslt (index!30020 lt!301758) (size!18846 a!2986)))) (or (is-Undefined!6918 lt!301758) (is-Found!6918 lt!301758) (not (is-MissingVacant!6918 lt!301758)) (not (= (index!30022 lt!301758) vacantSpotIndex!68)) (and (bvsge (index!30022 lt!301758) #b00000000000000000000000000000000) (bvslt (index!30022 lt!301758) (size!18846 a!2986)))) (or (is-Undefined!6918 lt!301758) (ite (is-Found!6918 lt!301758) (= (select (arr!18481 a!2986) (index!30020 lt!301758)) (select (arr!18481 a!2986) j!136)) (and (is-MissingVacant!6918 lt!301758) (= (index!30022 lt!301758) vacantSpotIndex!68) (= (select (arr!18481 a!2986) (index!30022 lt!301758)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91761 (= lt!301758 e!372782)))

(declare-fun c!74629 () Bool)

(assert (=> d!91761 (= c!74629 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91761 (= lt!301757 (select (arr!18481 a!2986) lt!301697))))

(assert (=> d!91761 (validMask!0 mask!3053)))

(assert (=> d!91761 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053) lt!301758)))

(assert (= (and d!91761 c!74629) b!649856))

(assert (= (and d!91761 (not c!74629)) b!649859))

(assert (= (and b!649859 c!74628) b!649857))

(assert (= (and b!649859 (not c!74628)) b!649855))

(assert (= (and b!649855 c!74627) b!649854))

(assert (= (and b!649855 (not c!74627)) b!649858))

(assert (=> b!649858 m!622617))

(assert (=> b!649858 m!622617))

(assert (=> b!649858 m!622391))

(declare-fun m!622627 () Bool)

(assert (=> b!649858 m!622627))

(declare-fun m!622629 () Bool)

(assert (=> d!91761 m!622629))

(declare-fun m!622631 () Bool)

(assert (=> d!91761 m!622631))

(declare-fun m!622633 () Bool)

(assert (=> d!91761 m!622633))

(assert (=> d!91761 m!622431))

(assert (=> b!649665 d!91761))

(declare-fun b!649860 () Bool)

(declare-fun e!372786 () SeekEntryResult!6918)

(assert (=> b!649860 (= e!372786 (MissingVacant!6918 vacantSpotIndex!68))))

(declare-fun b!649861 () Bool)

(declare-fun c!74630 () Bool)

(declare-fun lt!301759 () (_ BitVec 64))

(assert (=> b!649861 (= c!74630 (= lt!301759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!372784 () SeekEntryResult!6918)

(assert (=> b!649861 (= e!372784 e!372786)))

(declare-fun b!649862 () Bool)

(declare-fun e!372785 () SeekEntryResult!6918)

(assert (=> b!649862 (= e!372785 Undefined!6918)))

(declare-fun b!649863 () Bool)

(assert (=> b!649863 (= e!372784 (Found!6918 index!984))))

(declare-fun b!649864 () Bool)

(assert (=> b!649864 (= e!372786 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!301687 lt!301694 mask!3053))))

(declare-fun b!649865 () Bool)

(assert (=> b!649865 (= e!372785 e!372784)))

(declare-fun c!74631 () Bool)

(assert (=> b!649865 (= c!74631 (= lt!301759 lt!301687))))

(declare-fun lt!301760 () SeekEntryResult!6918)

(declare-fun d!91763 () Bool)

(assert (=> d!91763 (and (or (is-Undefined!6918 lt!301760) (not (is-Found!6918 lt!301760)) (and (bvsge (index!30020 lt!301760) #b00000000000000000000000000000000) (bvslt (index!30020 lt!301760) (size!18846 lt!301694)))) (or (is-Undefined!6918 lt!301760) (is-Found!6918 lt!301760) (not (is-MissingVacant!6918 lt!301760)) (not (= (index!30022 lt!301760) vacantSpotIndex!68)) (and (bvsge (index!30022 lt!301760) #b00000000000000000000000000000000) (bvslt (index!30022 lt!301760) (size!18846 lt!301694)))) (or (is-Undefined!6918 lt!301760) (ite (is-Found!6918 lt!301760) (= (select (arr!18481 lt!301694) (index!30020 lt!301760)) lt!301687) (and (is-MissingVacant!6918 lt!301760) (= (index!30022 lt!301760) vacantSpotIndex!68) (= (select (arr!18481 lt!301694) (index!30022 lt!301760)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91763 (= lt!301760 e!372785)))

(declare-fun c!74632 () Bool)

(assert (=> d!91763 (= c!74632 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91763 (= lt!301759 (select (arr!18481 lt!301694) index!984))))

(assert (=> d!91763 (validMask!0 mask!3053)))

(assert (=> d!91763 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301687 lt!301694 mask!3053) lt!301760)))

(assert (= (and d!91763 c!74632) b!649862))

(assert (= (and d!91763 (not c!74632)) b!649865))

(assert (= (and b!649865 c!74631) b!649863))

(assert (= (and b!649865 (not c!74631)) b!649861))

(assert (= (and b!649861 c!74630) b!649860))

(assert (= (and b!649861 (not c!74630)) b!649864))

(assert (=> b!649864 m!622397))

(assert (=> b!649864 m!622397))

(declare-fun m!622635 () Bool)

(assert (=> b!649864 m!622635))

(declare-fun m!622637 () Bool)

(assert (=> d!91763 m!622637))

(declare-fun m!622639 () Bool)

(assert (=> d!91763 m!622639))

(assert (=> d!91763 m!622533))

(assert (=> d!91763 m!622431))

(assert (=> b!649665 d!91763))

(declare-fun d!91765 () Bool)

(declare-fun e!372813 () Bool)

(assert (=> d!91765 e!372813))

(declare-fun res!421342 () Bool)

(assert (=> d!91765 (=> (not res!421342) (not e!372813))))

(assert (=> d!91765 (= res!421342 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18846 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18846 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18846 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18846 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18846 a!2986))))))

(declare-fun lt!301782 () Unit!22136)

(declare-fun choose!9 (array!38551 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22136)

(assert (=> d!91765 (= lt!301782 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91765 (validMask!0 mask!3053)))

(assert (=> d!91765 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 mask!3053) lt!301782)))

(declare-fun b!649910 () Bool)

(assert (=> b!649910 (= e!372813 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301697 vacantSpotIndex!68 (select (store (arr!18481 a!2986) i!1108 k!1786) j!136) (array!38552 (store (arr!18481 a!2986) i!1108 k!1786) (size!18846 a!2986)) mask!3053)))))

(assert (= (and d!91765 res!421342) b!649910))

(declare-fun m!622673 () Bool)

(assert (=> d!91765 m!622673))

(assert (=> d!91765 m!622431))

(assert (=> b!649910 m!622399))

(assert (=> b!649910 m!622391))

(assert (=> b!649910 m!622405))

(assert (=> b!649910 m!622409))

(assert (=> b!649910 m!622399))

(declare-fun m!622675 () Bool)

(assert (=> b!649910 m!622675))

(assert (=> b!649910 m!622391))

(assert (=> b!649665 d!91765))

(declare-fun d!91775 () Bool)

(declare-fun lt!301785 () (_ BitVec 32))

(assert (=> d!91775 (and (bvsge lt!301785 #b00000000000000000000000000000000) (bvslt lt!301785 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91775 (= lt!301785 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91775 (validMask!0 mask!3053)))

(assert (=> d!91775 (= (nextIndex!0 index!984 x!910 mask!3053) lt!301785)))

(declare-fun bs!19368 () Bool)

(assert (= bs!19368 d!91775))

(declare-fun m!622677 () Bool)

(assert (=> bs!19368 m!622677))

(assert (=> bs!19368 m!622431))

(assert (=> b!649665 d!91775))

(declare-fun b!649911 () Bool)

(declare-fun e!372815 () Bool)

(assert (=> b!649911 (= e!372815 (contains!3157 Nil!12558 (select (arr!18481 lt!301694) j!136)))))

(declare-fun b!649912 () Bool)

(declare-fun e!372814 () Bool)

(declare-fun call!33717 () Bool)

(assert (=> b!649912 (= e!372814 call!33717)))

(declare-fun b!649913 () Bool)

(declare-fun e!372816 () Bool)

(assert (=> b!649913 (= e!372816 e!372814)))

(declare-fun c!74651 () Bool)

(assert (=> b!649913 (= c!74651 (validKeyInArray!0 (select (arr!18481 lt!301694) j!136)))))

(declare-fun b!649914 () Bool)

(declare-fun e!372817 () Bool)

(assert (=> b!649914 (= e!372817 e!372816)))

(declare-fun res!421343 () Bool)

(assert (=> b!649914 (=> (not res!421343) (not e!372816))))

(assert (=> b!649914 (= res!421343 (not e!372815))))

(declare-fun res!421345 () Bool)

(assert (=> b!649914 (=> (not res!421345) (not e!372815))))

(assert (=> b!649914 (= res!421345 (validKeyInArray!0 (select (arr!18481 lt!301694) j!136)))))

(declare-fun b!649915 () Bool)

(assert (=> b!649915 (= e!372814 call!33717)))

(declare-fun d!91777 () Bool)

(declare-fun res!421344 () Bool)

(assert (=> d!91777 (=> res!421344 e!372817)))

(assert (=> d!91777 (= res!421344 (bvsge j!136 (size!18846 lt!301694)))))

(assert (=> d!91777 (= (arrayNoDuplicates!0 lt!301694 j!136 Nil!12558) e!372817)))

(declare-fun bm!33714 () Bool)

(assert (=> bm!33714 (= call!33717 (arrayNoDuplicates!0 lt!301694 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74651 (Cons!12557 (select (arr!18481 lt!301694) j!136) Nil!12558) Nil!12558)))))

(assert (= (and d!91777 (not res!421344)) b!649914))

(assert (= (and b!649914 res!421345) b!649911))

(assert (= (and b!649914 res!421343) b!649913))

(assert (= (and b!649913 c!74651) b!649912))

(assert (= (and b!649913 (not c!74651)) b!649915))

(assert (= (or b!649912 b!649915) bm!33714))

(assert (=> b!649911 m!622469))

(assert (=> b!649911 m!622469))

(declare-fun m!622679 () Bool)

(assert (=> b!649911 m!622679))

(assert (=> b!649913 m!622469))

(assert (=> b!649913 m!622469))

(declare-fun m!622681 () Bool)

(assert (=> b!649913 m!622681))

(assert (=> b!649914 m!622469))

(assert (=> b!649914 m!622469))

(assert (=> b!649914 m!622681))

(assert (=> bm!33714 m!622469))

(declare-fun m!622683 () Bool)

(assert (=> bm!33714 m!622683))

(assert (=> b!649664 d!91777))

(assert (=> b!649664 d!91677))

(declare-fun d!91779 () Bool)

(assert (=> d!91779 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18846 lt!301694)) (not (= (select (arr!18481 lt!301694) j!136) (select (arr!18481 a!2986) j!136))))))

(declare-fun lt!301791 () Unit!22136)

(declare-fun choose!21 (array!38551 (_ BitVec 64) (_ BitVec 32) List!12561) Unit!22136)

(assert (=> d!91779 (= lt!301791 (choose!21 lt!301694 (select (arr!18481 a!2986) j!136) j!136 Nil!12558))))

(assert (=> d!91779 (bvslt (size!18846 lt!301694) #b01111111111111111111111111111111)))

(assert (=> d!91779 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301694 (select (arr!18481 a!2986) j!136) j!136 Nil!12558) lt!301791)))

(declare-fun bs!19369 () Bool)

(assert (= bs!19369 d!91779))

(assert (=> bs!19369 m!622469))

(assert (=> bs!19369 m!622391))

(declare-fun m!622687 () Bool)

(assert (=> bs!19369 m!622687))

(assert (=> b!649664 d!91779))

(declare-fun d!91781 () Bool)

(declare-fun res!421349 () Bool)

(declare-fun e!372821 () Bool)

(assert (=> d!91781 (=> res!421349 e!372821)))

(assert (=> d!91781 (= res!421349 (= (select (arr!18481 lt!301694) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18481 a!2986) j!136)))))

(assert (=> d!91781 (= (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!372821)))

(declare-fun b!649919 () Bool)

(declare-fun e!372822 () Bool)

(assert (=> b!649919 (= e!372821 e!372822)))

(declare-fun res!421350 () Bool)

(assert (=> b!649919 (=> (not res!421350) (not e!372822))))

(assert (=> b!649919 (= res!421350 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18846 lt!301694)))))

(declare-fun b!649920 () Bool)

(assert (=> b!649920 (= e!372822 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91781 (not res!421349)) b!649919))

(assert (= (and b!649919 res!421350) b!649920))

(declare-fun m!622691 () Bool)

(assert (=> d!91781 m!622691))

(assert (=> b!649920 m!622391))

(declare-fun m!622693 () Bool)

(assert (=> b!649920 m!622693))

(assert (=> b!649664 d!91781))

(declare-fun d!91787 () Bool)

(assert (=> d!91787 (arrayContainsKey!0 lt!301694 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301792 () Unit!22136)

(assert (=> d!91787 (= lt!301792 (choose!114 lt!301694 (select (arr!18481 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91787 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91787 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301694 (select (arr!18481 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!301792)))

(declare-fun bs!19370 () Bool)

(assert (= bs!19370 d!91787))

(assert (=> bs!19370 m!622391))

(assert (=> bs!19370 m!622439))

(assert (=> bs!19370 m!622391))

(declare-fun m!622695 () Bool)

(assert (=> bs!19370 m!622695))

(assert (=> b!649664 d!91787))

(declare-fun d!91789 () Bool)

(assert (=> d!91789 (arrayNoDuplicates!0 lt!301694 j!136 Nil!12558)))

(declare-fun lt!301800 () Unit!22136)

(declare-fun choose!39 (array!38551 (_ BitVec 32) (_ BitVec 32)) Unit!22136)

(assert (=> d!91789 (= lt!301800 (choose!39 lt!301694 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91789 (bvslt (size!18846 lt!301694) #b01111111111111111111111111111111)))

(assert (=> d!91789 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!301694 #b00000000000000000000000000000000 j!136) lt!301800)))

(declare-fun bs!19372 () Bool)

(assert (= bs!19372 d!91789))

(assert (=> bs!19372 m!622437))

(declare-fun m!622699 () Bool)

(assert (=> bs!19372 m!622699))

(assert (=> b!649664 d!91789))

(assert (=> b!649664 d!91683))

(declare-fun d!91795 () Bool)

(assert (=> d!91795 (= (validKeyInArray!0 (select (arr!18481 a!2986) j!136)) (and (not (= (select (arr!18481 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18481 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!649675 d!91795))

(assert (=> b!649663 d!91715))

(assert (=> b!649661 d!91681))

(declare-fun d!91801 () Bool)

(assert (=> d!91801 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!649681 d!91801))

(declare-fun b!649935 () Bool)

(declare-fun e!372832 () Bool)

(declare-fun call!33720 () Bool)

(assert (=> b!649935 (= e!372832 call!33720)))

(declare-fun b!649936 () Bool)

(declare-fun e!372834 () Bool)

(assert (=> b!649936 (= e!372834 call!33720)))

(declare-fun b!649937 () Bool)

(declare-fun e!372833 () Bool)

(assert (=> b!649937 (= e!372833 e!372834)))

(declare-fun c!74657 () Bool)

(assert (=> b!649937 (= c!74657 (validKeyInArray!0 (select (arr!18481 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!649938 () Bool)

(assert (=> b!649938 (= e!372834 e!372832)))

(declare-fun lt!301807 () (_ BitVec 64))

(assert (=> b!649938 (= lt!301807 (select (arr!18481 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!301808 () Unit!22136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38551 (_ BitVec 64) (_ BitVec 32)) Unit!22136)

(assert (=> b!649938 (= lt!301808 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!301807 #b00000000000000000000000000000000))))

(assert (=> b!649938 (arrayContainsKey!0 a!2986 lt!301807 #b00000000000000000000000000000000)))

(declare-fun lt!301809 () Unit!22136)

(assert (=> b!649938 (= lt!301809 lt!301808)))

(declare-fun res!421356 () Bool)

(assert (=> b!649938 (= res!421356 (= (seekEntryOrOpen!0 (select (arr!18481 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6918 #b00000000000000000000000000000000)))))

(assert (=> b!649938 (=> (not res!421356) (not e!372832))))

(declare-fun bm!33717 () Bool)

(assert (=> bm!33717 (= call!33720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!91803 () Bool)

(declare-fun res!421355 () Bool)

(assert (=> d!91803 (=> res!421355 e!372833)))

(assert (=> d!91803 (= res!421355 (bvsge #b00000000000000000000000000000000 (size!18846 a!2986)))))

(assert (=> d!91803 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!372833)))

(assert (= (and d!91803 (not res!421355)) b!649937))

(assert (= (and b!649937 c!74657) b!649938))

(assert (= (and b!649937 (not c!74657)) b!649936))

(assert (= (and b!649938 res!421356) b!649935))

(assert (= (or b!649935 b!649936) bm!33717))

(declare-fun m!622707 () Bool)

(assert (=> b!649937 m!622707))

(assert (=> b!649937 m!622707))

(declare-fun m!622709 () Bool)

(assert (=> b!649937 m!622709))

(assert (=> b!649938 m!622707))

(declare-fun m!622711 () Bool)

(assert (=> b!649938 m!622711))

(declare-fun m!622713 () Bool)

(assert (=> b!649938 m!622713))

(assert (=> b!649938 m!622707))

(declare-fun m!622715 () Bool)

(assert (=> b!649938 m!622715))

(declare-fun m!622717 () Bool)

(assert (=> bm!33717 m!622717))

(assert (=> b!649671 d!91803))

(declare-fun d!91805 () Bool)

(declare-fun res!421357 () Bool)

(declare-fun e!372835 () Bool)

(assert (=> d!91805 (=> res!421357 e!372835)))

(assert (=> d!91805 (= res!421357 (= (select (arr!18481 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91805 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!372835)))

(declare-fun b!649939 () Bool)

(declare-fun e!372836 () Bool)

(assert (=> b!649939 (= e!372835 e!372836)))

(declare-fun res!421358 () Bool)

(assert (=> b!649939 (=> (not res!421358) (not e!372836))))

(assert (=> b!649939 (= res!421358 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18846 a!2986)))))

(declare-fun b!649940 () Bool)

(assert (=> b!649940 (= e!372836 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91805 (not res!421357)) b!649939))

(assert (= (and b!649939 res!421358) b!649940))

(assert (=> d!91805 m!622707))

(declare-fun m!622719 () Bool)

(assert (=> b!649940 m!622719))

(assert (=> b!649682 d!91805))

(declare-fun b!649941 () Bool)

(declare-fun e!372838 () Bool)

(assert (=> b!649941 (= e!372838 (contains!3157 Nil!12558 (select (arr!18481 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!649942 () Bool)

(declare-fun e!372837 () Bool)

(declare-fun call!33721 () Bool)

(assert (=> b!649942 (= e!372837 call!33721)))

(declare-fun b!649943 () Bool)

(declare-fun e!372839 () Bool)

(assert (=> b!649943 (= e!372839 e!372837)))

(declare-fun c!74658 () Bool)

(assert (=> b!649943 (= c!74658 (validKeyInArray!0 (select (arr!18481 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!649944 () Bool)

(declare-fun e!372840 () Bool)

(assert (=> b!649944 (= e!372840 e!372839)))

(declare-fun res!421359 () Bool)

(assert (=> b!649944 (=> (not res!421359) (not e!372839))))

(assert (=> b!649944 (= res!421359 (not e!372838))))

(declare-fun res!421361 () Bool)

(assert (=> b!649944 (=> (not res!421361) (not e!372838))))

(assert (=> b!649944 (= res!421361 (validKeyInArray!0 (select (arr!18481 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!649945 () Bool)

(assert (=> b!649945 (= e!372837 call!33721)))

(declare-fun d!91807 () Bool)

(declare-fun res!421360 () Bool)

(assert (=> d!91807 (=> res!421360 e!372840)))

(assert (=> d!91807 (= res!421360 (bvsge #b00000000000000000000000000000000 (size!18846 a!2986)))))

(assert (=> d!91807 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12558) e!372840)))

(declare-fun bm!33718 () Bool)

(assert (=> bm!33718 (= call!33721 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74658 (Cons!12557 (select (arr!18481 a!2986) #b00000000000000000000000000000000) Nil!12558) Nil!12558)))))

(assert (= (and d!91807 (not res!421360)) b!649944))

(assert (= (and b!649944 res!421361) b!649941))

(assert (= (and b!649944 res!421359) b!649943))

(assert (= (and b!649943 c!74658) b!649942))

(assert (= (and b!649943 (not c!74658)) b!649945))

(assert (= (or b!649942 b!649945) bm!33718))

(assert (=> b!649941 m!622707))

(assert (=> b!649941 m!622707))

(declare-fun m!622721 () Bool)

(assert (=> b!649941 m!622721))

(assert (=> b!649943 m!622707))

(assert (=> b!649943 m!622707))

(assert (=> b!649943 m!622709))

(assert (=> b!649944 m!622707))

(assert (=> b!649944 m!622707))

(assert (=> b!649944 m!622709))

(assert (=> bm!33718 m!622707))

(declare-fun m!622723 () Bool)

(assert (=> bm!33718 m!622723))

(assert (=> b!649670 d!91807))

(push 1)

(assert (not d!91763))

(assert (not b!649913))

(assert (not b!649914))

(assert (not bm!33714))

(assert (not b!649694))

(assert (not b!649943))

(assert (not bm!33700))

(assert (not b!649858))

(assert (not b!649941))

(assert (not d!91675))

(assert (not d!91761))

(assert (not b!649937))

(assert (not bm!33718))

(assert (not b!649709))

(assert (not b!649938))

(assert (not d!91789))

(assert (not b!649864))

(assert (not b!649910))

(assert (not d!91765))

(assert (not b!649847))

(assert (not b!649920))

(assert (not b!649696))

(assert (not b!649944))

(assert (not d!91683))

(assert (not b!649940))

(assert (not b!649706))

(assert (not d!91775))

(assert (not d!91759))

(assert (not d!91717))

(assert (not b!649788))

(assert (not bm!33717))

(assert (not b!649852))

(assert (not b!649697))

(assert (not b!649911))

(assert (not b!649793))

(assert (not b!649704))

(assert (not d!91779))

(assert (not d!91693))

(assert (not d!91787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

