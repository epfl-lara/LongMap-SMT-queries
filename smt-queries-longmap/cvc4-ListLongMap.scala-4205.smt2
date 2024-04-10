; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57522 () Bool)

(assert start!57522)

(declare-fun b!636455 () Bool)

(declare-fun res!411805 () Bool)

(declare-fun e!364106 () Bool)

(assert (=> b!636455 (=> (not res!411805) (not e!364106))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636455 (= res!411805 (validKeyInArray!0 k!1786))))

(declare-fun b!636456 () Bool)

(declare-fun e!364104 () Bool)

(declare-fun e!364103 () Bool)

(assert (=> b!636456 (= e!364104 e!364103)))

(declare-fun res!411792 () Bool)

(assert (=> b!636456 (=> (not res!411792) (not e!364103))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6787 0))(
  ( (MissingZero!6787 (index!29456 (_ BitVec 32))) (Found!6787 (index!29457 (_ BitVec 32))) (Intermediate!6787 (undefined!7599 Bool) (index!29458 (_ BitVec 32)) (x!58203 (_ BitVec 32))) (Undefined!6787) (MissingVacant!6787 (index!29459 (_ BitVec 32))) )
))
(declare-fun lt!294313 () SeekEntryResult!6787)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38243 0))(
  ( (array!38244 (arr!18347 (Array (_ BitVec 32) (_ BitVec 64))) (size!18711 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38243)

(assert (=> b!636456 (= res!411792 (and (= lt!294313 (Found!6787 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18347 a!2986) index!984) (select (arr!18347 a!2986) j!136))) (not (= (select (arr!18347 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38243 (_ BitVec 32)) SeekEntryResult!6787)

(assert (=> b!636456 (= lt!294313 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636457 () Bool)

(declare-fun e!364107 () Bool)

(declare-datatypes ((List!12388 0))(
  ( (Nil!12385) (Cons!12384 (h!13429 (_ BitVec 64)) (t!18616 List!12388)) )
))
(declare-fun contains!3102 (List!12388 (_ BitVec 64)) Bool)

(assert (=> b!636457 (= e!364107 (not (contains!3102 Nil!12385 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636458 () Bool)

(declare-fun res!411804 () Bool)

(declare-fun e!364110 () Bool)

(assert (=> b!636458 (=> (not res!411804) (not e!364110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38243 (_ BitVec 32)) Bool)

(assert (=> b!636458 (= res!411804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!411799 () Bool)

(assert (=> start!57522 (=> (not res!411799) (not e!364106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57522 (= res!411799 (validMask!0 mask!3053))))

(assert (=> start!57522 e!364106))

(assert (=> start!57522 true))

(declare-fun array_inv!14143 (array!38243) Bool)

(assert (=> start!57522 (array_inv!14143 a!2986)))

(declare-fun b!636459 () Bool)

(declare-datatypes ((Unit!21482 0))(
  ( (Unit!21483) )
))
(declare-fun e!364109 () Unit!21482)

(declare-fun Unit!21484 () Unit!21482)

(assert (=> b!636459 (= e!364109 Unit!21484)))

(assert (=> b!636459 false))

(declare-fun b!636460 () Bool)

(declare-fun res!411803 () Bool)

(assert (=> b!636460 (=> (not res!411803) (not e!364110))))

(declare-fun arrayNoDuplicates!0 (array!38243 (_ BitVec 32) List!12388) Bool)

(assert (=> b!636460 (= res!411803 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12385))))

(declare-fun b!636461 () Bool)

(declare-fun e!364099 () Bool)

(declare-fun e!364101 () Bool)

(assert (=> b!636461 (= e!364099 e!364101)))

(declare-fun res!411800 () Bool)

(assert (=> b!636461 (=> res!411800 e!364101)))

(declare-fun lt!294316 () (_ BitVec 64))

(declare-fun lt!294308 () (_ BitVec 64))

(assert (=> b!636461 (= res!411800 (or (not (= (select (arr!18347 a!2986) j!136) lt!294308)) (not (= (select (arr!18347 a!2986) j!136) lt!294316)) (bvsge j!136 index!984)))))

(declare-fun e!364105 () Bool)

(assert (=> b!636461 e!364105))

(declare-fun res!411802 () Bool)

(assert (=> b!636461 (=> (not res!411802) (not e!364105))))

(assert (=> b!636461 (= res!411802 (= lt!294316 (select (arr!18347 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!636461 (= lt!294316 (select (store (arr!18347 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!636462 () Bool)

(assert (=> b!636462 (= e!364103 (not e!364099))))

(declare-fun res!411797 () Bool)

(assert (=> b!636462 (=> res!411797 e!364099)))

(declare-fun lt!294314 () SeekEntryResult!6787)

(assert (=> b!636462 (= res!411797 (not (= lt!294314 (Found!6787 index!984))))))

(declare-fun lt!294311 () Unit!21482)

(assert (=> b!636462 (= lt!294311 e!364109)))

(declare-fun c!72701 () Bool)

(assert (=> b!636462 (= c!72701 (= lt!294314 Undefined!6787))))

(declare-fun lt!294306 () array!38243)

(assert (=> b!636462 (= lt!294314 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294308 lt!294306 mask!3053))))

(declare-fun e!364108 () Bool)

(assert (=> b!636462 e!364108))

(declare-fun res!411801 () Bool)

(assert (=> b!636462 (=> (not res!411801) (not e!364108))))

(declare-fun lt!294309 () (_ BitVec 32))

(declare-fun lt!294312 () SeekEntryResult!6787)

(assert (=> b!636462 (= res!411801 (= lt!294312 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294309 vacantSpotIndex!68 lt!294308 lt!294306 mask!3053)))))

(assert (=> b!636462 (= lt!294312 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294309 vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636462 (= lt!294308 (select (store (arr!18347 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294315 () Unit!21482)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38243 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21482)

(assert (=> b!636462 (= lt!294315 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294309 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636462 (= lt!294309 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!636463 () Bool)

(declare-fun e!364098 () Bool)

(assert (=> b!636463 (= e!364101 e!364098)))

(declare-fun res!411788 () Bool)

(assert (=> b!636463 (=> res!411788 e!364098)))

(assert (=> b!636463 (= res!411788 (or (bvsge (size!18711 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18711 a!2986))))))

(declare-fun arrayContainsKey!0 (array!38243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636463 (arrayContainsKey!0 lt!294306 (select (arr!18347 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294307 () Unit!21482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38243 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21482)

(assert (=> b!636463 (= lt!294307 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294306 (select (arr!18347 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!636464 () Bool)

(declare-fun res!411790 () Bool)

(assert (=> b!636464 (=> (not res!411790) (not e!364106))))

(assert (=> b!636464 (= res!411790 (validKeyInArray!0 (select (arr!18347 a!2986) j!136)))))

(declare-fun b!636465 () Bool)

(declare-fun Unit!21485 () Unit!21482)

(assert (=> b!636465 (= e!364109 Unit!21485)))

(declare-fun b!636466 () Bool)

(declare-fun res!411793 () Bool)

(assert (=> b!636466 (=> (not res!411793) (not e!364106))))

(assert (=> b!636466 (= res!411793 (and (= (size!18711 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18711 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18711 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636467 () Bool)

(assert (=> b!636467 (= e!364106 e!364110)))

(declare-fun res!411791 () Bool)

(assert (=> b!636467 (=> (not res!411791) (not e!364110))))

(declare-fun lt!294310 () SeekEntryResult!6787)

(assert (=> b!636467 (= res!411791 (or (= lt!294310 (MissingZero!6787 i!1108)) (= lt!294310 (MissingVacant!6787 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38243 (_ BitVec 32)) SeekEntryResult!6787)

(assert (=> b!636467 (= lt!294310 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!636468 () Bool)

(declare-fun e!364100 () Bool)

(assert (=> b!636468 (= e!364100 (arrayContainsKey!0 lt!294306 (select (arr!18347 a!2986) j!136) index!984))))

(declare-fun b!636469 () Bool)

(declare-fun res!411796 () Bool)

(assert (=> b!636469 (=> (not res!411796) (not e!364110))))

(assert (=> b!636469 (= res!411796 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18347 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636470 () Bool)

(assert (=> b!636470 (= e!364110 e!364104)))

(declare-fun res!411795 () Bool)

(assert (=> b!636470 (=> (not res!411795) (not e!364104))))

(assert (=> b!636470 (= res!411795 (= (select (store (arr!18347 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636470 (= lt!294306 (array!38244 (store (arr!18347 a!2986) i!1108 k!1786) (size!18711 a!2986)))))

(declare-fun b!636471 () Bool)

(declare-fun res!411789 () Bool)

(assert (=> b!636471 (=> (not res!411789) (not e!364106))))

(assert (=> b!636471 (= res!411789 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!636472 () Bool)

(declare-fun e!364102 () Bool)

(assert (=> b!636472 (= e!364102 e!364100)))

(declare-fun res!411787 () Bool)

(assert (=> b!636472 (=> (not res!411787) (not e!364100))))

(assert (=> b!636472 (= res!411787 (arrayContainsKey!0 lt!294306 (select (arr!18347 a!2986) j!136) j!136))))

(declare-fun b!636473 () Bool)

(assert (=> b!636473 (= e!364108 (= lt!294313 lt!294312))))

(declare-fun b!636474 () Bool)

(declare-fun res!411806 () Bool)

(assert (=> b!636474 (=> res!411806 e!364098)))

(declare-fun noDuplicate!380 (List!12388) Bool)

(assert (=> b!636474 (= res!411806 (not (noDuplicate!380 Nil!12385)))))

(declare-fun b!636475 () Bool)

(assert (=> b!636475 (= e!364098 e!364107)))

(declare-fun res!411794 () Bool)

(assert (=> b!636475 (=> (not res!411794) (not e!364107))))

(assert (=> b!636475 (= res!411794 (not (contains!3102 Nil!12385 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636476 () Bool)

(assert (=> b!636476 (= e!364105 e!364102)))

(declare-fun res!411798 () Bool)

(assert (=> b!636476 (=> res!411798 e!364102)))

(assert (=> b!636476 (= res!411798 (or (not (= (select (arr!18347 a!2986) j!136) lt!294308)) (not (= (select (arr!18347 a!2986) j!136) lt!294316)) (bvsge j!136 index!984)))))

(assert (= (and start!57522 res!411799) b!636466))

(assert (= (and b!636466 res!411793) b!636464))

(assert (= (and b!636464 res!411790) b!636455))

(assert (= (and b!636455 res!411805) b!636471))

(assert (= (and b!636471 res!411789) b!636467))

(assert (= (and b!636467 res!411791) b!636458))

(assert (= (and b!636458 res!411804) b!636460))

(assert (= (and b!636460 res!411803) b!636469))

(assert (= (and b!636469 res!411796) b!636470))

(assert (= (and b!636470 res!411795) b!636456))

(assert (= (and b!636456 res!411792) b!636462))

(assert (= (and b!636462 res!411801) b!636473))

(assert (= (and b!636462 c!72701) b!636459))

(assert (= (and b!636462 (not c!72701)) b!636465))

(assert (= (and b!636462 (not res!411797)) b!636461))

(assert (= (and b!636461 res!411802) b!636476))

(assert (= (and b!636476 (not res!411798)) b!636472))

(assert (= (and b!636472 res!411787) b!636468))

(assert (= (and b!636461 (not res!411800)) b!636463))

(assert (= (and b!636463 (not res!411788)) b!636474))

(assert (= (and b!636474 (not res!411806)) b!636475))

(assert (= (and b!636475 res!411794) b!636457))

(declare-fun m!610665 () Bool)

(assert (=> b!636470 m!610665))

(declare-fun m!610667 () Bool)

(assert (=> b!636470 m!610667))

(declare-fun m!610669 () Bool)

(assert (=> b!636458 m!610669))

(declare-fun m!610671 () Bool)

(assert (=> b!636457 m!610671))

(declare-fun m!610673 () Bool)

(assert (=> b!636476 m!610673))

(declare-fun m!610675 () Bool)

(assert (=> b!636456 m!610675))

(assert (=> b!636456 m!610673))

(assert (=> b!636456 m!610673))

(declare-fun m!610677 () Bool)

(assert (=> b!636456 m!610677))

(declare-fun m!610679 () Bool)

(assert (=> b!636460 m!610679))

(declare-fun m!610681 () Bool)

(assert (=> b!636474 m!610681))

(declare-fun m!610683 () Bool)

(assert (=> b!636462 m!610683))

(declare-fun m!610685 () Bool)

(assert (=> b!636462 m!610685))

(assert (=> b!636462 m!610673))

(declare-fun m!610687 () Bool)

(assert (=> b!636462 m!610687))

(assert (=> b!636462 m!610665))

(declare-fun m!610689 () Bool)

(assert (=> b!636462 m!610689))

(declare-fun m!610691 () Bool)

(assert (=> b!636462 m!610691))

(assert (=> b!636462 m!610673))

(declare-fun m!610693 () Bool)

(assert (=> b!636462 m!610693))

(declare-fun m!610695 () Bool)

(assert (=> start!57522 m!610695))

(declare-fun m!610697 () Bool)

(assert (=> start!57522 m!610697))

(assert (=> b!636463 m!610673))

(assert (=> b!636463 m!610673))

(declare-fun m!610699 () Bool)

(assert (=> b!636463 m!610699))

(assert (=> b!636463 m!610673))

(declare-fun m!610701 () Bool)

(assert (=> b!636463 m!610701))

(assert (=> b!636472 m!610673))

(assert (=> b!636472 m!610673))

(declare-fun m!610703 () Bool)

(assert (=> b!636472 m!610703))

(declare-fun m!610705 () Bool)

(assert (=> b!636467 m!610705))

(assert (=> b!636464 m!610673))

(assert (=> b!636464 m!610673))

(declare-fun m!610707 () Bool)

(assert (=> b!636464 m!610707))

(declare-fun m!610709 () Bool)

(assert (=> b!636475 m!610709))

(declare-fun m!610711 () Bool)

(assert (=> b!636455 m!610711))

(assert (=> b!636468 m!610673))

(assert (=> b!636468 m!610673))

(declare-fun m!610713 () Bool)

(assert (=> b!636468 m!610713))

(assert (=> b!636461 m!610673))

(assert (=> b!636461 m!610665))

(declare-fun m!610715 () Bool)

(assert (=> b!636461 m!610715))

(declare-fun m!610717 () Bool)

(assert (=> b!636471 m!610717))

(declare-fun m!610719 () Bool)

(assert (=> b!636469 m!610719))

(push 1)

(assert (not b!636455))

(assert (not b!636463))

(assert (not b!636458))

(assert (not b!636464))

(assert (not b!636474))

(assert (not b!636475))

(assert (not b!636456))

(assert (not b!636468))

(assert (not b!636467))

(assert (not b!636457))

(assert (not b!636462))

(assert (not b!636472))

(assert (not b!636460))

(assert (not b!636471))

(assert (not start!57522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89945 () Bool)

(assert (=> d!89945 (= (validKeyInArray!0 (select (arr!18347 a!2986) j!136)) (and (not (= (select (arr!18347 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18347 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636464 d!89945))

(declare-fun d!89947 () Bool)

(assert (=> d!89947 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57522 d!89947))

(declare-fun d!89949 () Bool)

(assert (=> d!89949 (= (array_inv!14143 a!2986) (bvsge (size!18711 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57522 d!89949))

(declare-fun d!89951 () Bool)

(declare-fun lt!294336 () Bool)

(declare-fun content!242 (List!12388) (Set (_ BitVec 64)))

(assert (=> d!89951 (= lt!294336 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!242 Nil!12385)))))

(declare-fun e!364137 () Bool)

(assert (=> d!89951 (= lt!294336 e!364137)))

(declare-fun res!411816 () Bool)

(assert (=> d!89951 (=> (not res!411816) (not e!364137))))

(assert (=> d!89951 (= res!411816 (is-Cons!12384 Nil!12385))))

(assert (=> d!89951 (= (contains!3102 Nil!12385 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294336)))

(declare-fun b!636521 () Bool)

(declare-fun e!364138 () Bool)

(assert (=> b!636521 (= e!364137 e!364138)))

(declare-fun res!411815 () Bool)

(assert (=> b!636521 (=> res!411815 e!364138)))

(assert (=> b!636521 (= res!411815 (= (h!13429 Nil!12385) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636522 () Bool)

(assert (=> b!636522 (= e!364138 (contains!3102 (t!18616 Nil!12385) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!89951 res!411816) b!636521))

(assert (= (and b!636521 (not res!411815)) b!636522))

(declare-fun m!610741 () Bool)

(assert (=> d!89951 m!610741))

(declare-fun m!610743 () Bool)

(assert (=> d!89951 m!610743))

(declare-fun m!610745 () Bool)

(assert (=> b!636522 m!610745))

(assert (=> b!636475 d!89951))

(declare-fun d!89955 () Bool)

(declare-fun res!411825 () Bool)

(declare-fun e!364147 () Bool)

(assert (=> d!89955 (=> res!411825 e!364147)))

(assert (=> d!89955 (= res!411825 (= (select (arr!18347 lt!294306) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18347 a!2986) j!136)))))

(assert (=> d!89955 (= (arrayContainsKey!0 lt!294306 (select (arr!18347 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364147)))

(declare-fun b!636529 () Bool)

(declare-fun e!364148 () Bool)

(assert (=> b!636529 (= e!364147 e!364148)))

(declare-fun res!411826 () Bool)

(assert (=> b!636529 (=> (not res!411826) (not e!364148))))

(assert (=> b!636529 (= res!411826 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18711 lt!294306)))))

(declare-fun b!636530 () Bool)

(assert (=> b!636530 (= e!364148 (arrayContainsKey!0 lt!294306 (select (arr!18347 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89955 (not res!411825)) b!636529))

(assert (= (and b!636529 res!411826) b!636530))

(declare-fun m!610753 () Bool)

(assert (=> d!89955 m!610753))

(assert (=> b!636530 m!610673))

(declare-fun m!610755 () Bool)

(assert (=> b!636530 m!610755))

(assert (=> b!636463 d!89955))

(declare-fun d!89959 () Bool)

(assert (=> d!89959 (arrayContainsKey!0 lt!294306 (select (arr!18347 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294340 () Unit!21482)

(declare-fun choose!114 (array!38243 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21482)

(assert (=> d!89959 (= lt!294340 (choose!114 lt!294306 (select (arr!18347 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89959 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89959 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294306 (select (arr!18347 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294340)))

(declare-fun bs!19114 () Bool)

(assert (= bs!19114 d!89959))

(assert (=> bs!19114 m!610673))

(assert (=> bs!19114 m!610699))

(assert (=> bs!19114 m!610673))

(declare-fun m!610759 () Bool)

(assert (=> bs!19114 m!610759))

(assert (=> b!636463 d!89959))

(declare-fun d!89961 () Bool)

(declare-fun res!411842 () Bool)

(declare-fun e!364167 () Bool)

(assert (=> d!89961 (=> res!411842 e!364167)))

(assert (=> d!89961 (= res!411842 (is-Nil!12385 Nil!12385))))

(assert (=> d!89961 (= (noDuplicate!380 Nil!12385) e!364167)))

(declare-fun b!636554 () Bool)

(declare-fun e!364168 () Bool)

(assert (=> b!636554 (= e!364167 e!364168)))

(declare-fun res!411843 () Bool)

(assert (=> b!636554 (=> (not res!411843) (not e!364168))))

(assert (=> b!636554 (= res!411843 (not (contains!3102 (t!18616 Nil!12385) (h!13429 Nil!12385))))))

(declare-fun b!636555 () Bool)

(assert (=> b!636555 (= e!364168 (noDuplicate!380 (t!18616 Nil!12385)))))

(assert (= (and d!89961 (not res!411842)) b!636554))

(assert (= (and b!636554 res!411843) b!636555))

(declare-fun m!610767 () Bool)

(assert (=> b!636554 m!610767))

(declare-fun m!610769 () Bool)

(assert (=> b!636555 m!610769))

(assert (=> b!636474 d!89961))

(declare-fun d!89967 () Bool)

(declare-fun res!411846 () Bool)

(declare-fun e!364171 () Bool)

(assert (=> d!89967 (=> res!411846 e!364171)))

(assert (=> d!89967 (= res!411846 (= (select (arr!18347 lt!294306) j!136) (select (arr!18347 a!2986) j!136)))))

(assert (=> d!89967 (= (arrayContainsKey!0 lt!294306 (select (arr!18347 a!2986) j!136) j!136) e!364171)))

(declare-fun b!636558 () Bool)

(declare-fun e!364172 () Bool)

(assert (=> b!636558 (= e!364171 e!364172)))

(declare-fun res!411847 () Bool)

(assert (=> b!636558 (=> (not res!411847) (not e!364172))))

(assert (=> b!636558 (= res!411847 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18711 lt!294306)))))

(declare-fun b!636559 () Bool)

(assert (=> b!636559 (= e!364172 (arrayContainsKey!0 lt!294306 (select (arr!18347 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89967 (not res!411846)) b!636558))

(assert (= (and b!636558 res!411847) b!636559))

(declare-fun m!610775 () Bool)

(assert (=> d!89967 m!610775))

(assert (=> b!636559 m!610673))

(declare-fun m!610777 () Bool)

(assert (=> b!636559 m!610777))

(assert (=> b!636472 d!89967))

(declare-fun b!636620 () Bool)

(declare-fun e!364224 () SeekEntryResult!6787)

(assert (=> b!636620 (= e!364224 Undefined!6787)))

(declare-fun b!636621 () Bool)

(declare-fun e!364225 () SeekEntryResult!6787)

(assert (=> b!636621 (= e!364225 (MissingVacant!6787 vacantSpotIndex!68))))

(declare-fun b!636622 () Bool)

(declare-fun e!364226 () SeekEntryResult!6787)

(assert (=> b!636622 (= e!364224 e!364226)))

(declare-fun c!72734 () Bool)

(declare-fun lt!294366 () (_ BitVec 64))

(assert (=> b!636622 (= c!72734 (= lt!294366 lt!294308))))

(declare-fun b!636623 () Bool)

(declare-fun c!72732 () Bool)

(assert (=> b!636623 (= c!72732 (= lt!294366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636623 (= e!364226 e!364225)))

(declare-fun b!636625 () Bool)

(assert (=> b!636625 (= e!364226 (Found!6787 index!984))))

(declare-fun b!636624 () Bool)

(assert (=> b!636624 (= e!364225 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!294308 lt!294306 mask!3053))))

(declare-fun d!89971 () Bool)

(declare-fun lt!294365 () SeekEntryResult!6787)

(assert (=> d!89971 (and (or (is-Undefined!6787 lt!294365) (not (is-Found!6787 lt!294365)) (and (bvsge (index!29457 lt!294365) #b00000000000000000000000000000000) (bvslt (index!29457 lt!294365) (size!18711 lt!294306)))) (or (is-Undefined!6787 lt!294365) (is-Found!6787 lt!294365) (not (is-MissingVacant!6787 lt!294365)) (not (= (index!29459 lt!294365) vacantSpotIndex!68)) (and (bvsge (index!29459 lt!294365) #b00000000000000000000000000000000) (bvslt (index!29459 lt!294365) (size!18711 lt!294306)))) (or (is-Undefined!6787 lt!294365) (ite (is-Found!6787 lt!294365) (= (select (arr!18347 lt!294306) (index!29457 lt!294365)) lt!294308) (and (is-MissingVacant!6787 lt!294365) (= (index!29459 lt!294365) vacantSpotIndex!68) (= (select (arr!18347 lt!294306) (index!29459 lt!294365)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89971 (= lt!294365 e!364224)))

(declare-fun c!72733 () Bool)

(assert (=> d!89971 (= c!72733 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89971 (= lt!294366 (select (arr!18347 lt!294306) index!984))))

(assert (=> d!89971 (validMask!0 mask!3053)))

(assert (=> d!89971 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294308 lt!294306 mask!3053) lt!294365)))

(assert (= (and d!89971 c!72733) b!636620))

(assert (= (and d!89971 (not c!72733)) b!636622))

(assert (= (and b!636622 c!72734) b!636625))

(assert (= (and b!636622 (not c!72734)) b!636623))

(assert (= (and b!636623 c!72732) b!636621))

(assert (= (and b!636623 (not c!72732)) b!636624))

(assert (=> b!636624 m!610683))

(assert (=> b!636624 m!610683))

(declare-fun m!610831 () Bool)

(assert (=> b!636624 m!610831))

(declare-fun m!610835 () Bool)

(assert (=> d!89971 m!610835))

(declare-fun m!610839 () Bool)

(assert (=> d!89971 m!610839))

(declare-fun m!610843 () Bool)

(assert (=> d!89971 m!610843))

(assert (=> d!89971 m!610695))

(assert (=> b!636462 d!89971))

(declare-fun b!636632 () Bool)

(declare-fun e!364230 () SeekEntryResult!6787)

(assert (=> b!636632 (= e!364230 Undefined!6787)))

(declare-fun b!636633 () Bool)

(declare-fun e!364231 () SeekEntryResult!6787)

(assert (=> b!636633 (= e!364231 (MissingVacant!6787 vacantSpotIndex!68))))

(declare-fun b!636634 () Bool)

(declare-fun e!364232 () SeekEntryResult!6787)

(assert (=> b!636634 (= e!364230 e!364232)))

(declare-fun lt!294370 () (_ BitVec 64))

(declare-fun c!72740 () Bool)

(assert (=> b!636634 (= c!72740 (= lt!294370 (select (arr!18347 a!2986) j!136)))))

(declare-fun b!636635 () Bool)

(declare-fun c!72738 () Bool)

(assert (=> b!636635 (= c!72738 (= lt!294370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636635 (= e!364232 e!364231)))

(declare-fun b!636637 () Bool)

(assert (=> b!636637 (= e!364232 (Found!6787 lt!294309))))

(declare-fun b!636636 () Bool)

(assert (=> b!636636 (= e!364231 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294309 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!90005 () Bool)

(declare-fun lt!294369 () SeekEntryResult!6787)

(assert (=> d!90005 (and (or (is-Undefined!6787 lt!294369) (not (is-Found!6787 lt!294369)) (and (bvsge (index!29457 lt!294369) #b00000000000000000000000000000000) (bvslt (index!29457 lt!294369) (size!18711 a!2986)))) (or (is-Undefined!6787 lt!294369) (is-Found!6787 lt!294369) (not (is-MissingVacant!6787 lt!294369)) (not (= (index!29459 lt!294369) vacantSpotIndex!68)) (and (bvsge (index!29459 lt!294369) #b00000000000000000000000000000000) (bvslt (index!29459 lt!294369) (size!18711 a!2986)))) (or (is-Undefined!6787 lt!294369) (ite (is-Found!6787 lt!294369) (= (select (arr!18347 a!2986) (index!29457 lt!294369)) (select (arr!18347 a!2986) j!136)) (and (is-MissingVacant!6787 lt!294369) (= (index!29459 lt!294369) vacantSpotIndex!68) (= (select (arr!18347 a!2986) (index!29459 lt!294369)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90005 (= lt!294369 e!364230)))

(declare-fun c!72739 () Bool)

(assert (=> d!90005 (= c!72739 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90005 (= lt!294370 (select (arr!18347 a!2986) lt!294309))))

(assert (=> d!90005 (validMask!0 mask!3053)))

(assert (=> d!90005 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294309 vacantSpotIndex!68 (select (arr!18347 a!2986) j!136) a!2986 mask!3053) lt!294369)))

(assert (= (and d!90005 c!72739) b!636632))

(assert (= (and d!90005 (not c!72739)) b!636634))

(assert (= (and b!636634 c!72740) b!636637))

(assert (= (and b!636634 (not c!72740)) b!636635))

(assert (= (and b!636635 c!72738) b!636633))

(assert (= (and b!636635 (not c!72738)) b!636636))

(declare-fun m!610849 () Bool)

(assert (=> b!636636 m!610849))

