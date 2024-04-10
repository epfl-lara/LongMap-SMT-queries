; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54154 () Bool)

(assert start!54154)

(declare-fun b!591540 () Bool)

(declare-fun res!378475 () Bool)

(declare-fun e!337764 () Bool)

(assert (=> b!591540 (=> (not res!378475) (not e!337764))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36884 0))(
  ( (array!36885 (arr!17712 (Array (_ BitVec 32) (_ BitVec 64))) (size!18076 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36884)

(assert (=> b!591540 (= res!378475 (and (= (size!18076 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18076 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18076 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591541 () Bool)

(declare-datatypes ((Unit!18526 0))(
  ( (Unit!18527) )
))
(declare-fun e!337767 () Unit!18526)

(declare-fun Unit!18528 () Unit!18526)

(assert (=> b!591541 (= e!337767 Unit!18528)))

(declare-fun b!591542 () Bool)

(declare-fun res!378470 () Bool)

(declare-fun e!337761 () Bool)

(assert (=> b!591542 (=> (not res!378470) (not e!337761))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591542 (= res!378470 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17712 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591543 () Bool)

(declare-fun res!378471 () Bool)

(assert (=> b!591543 (=> (not res!378471) (not e!337761))))

(declare-datatypes ((List!11753 0))(
  ( (Nil!11750) (Cons!11749 (h!12794 (_ BitVec 64)) (t!17981 List!11753)) )
))
(declare-fun arrayNoDuplicates!0 (array!36884 (_ BitVec 32) List!11753) Bool)

(assert (=> b!591543 (= res!378471 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11750))))

(declare-fun b!591544 () Bool)

(declare-fun e!337770 () Bool)

(declare-fun e!337765 () Bool)

(assert (=> b!591544 (= e!337770 (not e!337765))))

(declare-fun res!378476 () Bool)

(assert (=> b!591544 (=> res!378476 e!337765)))

(declare-datatypes ((SeekEntryResult!6152 0))(
  ( (MissingZero!6152 (index!26844 (_ BitVec 32))) (Found!6152 (index!26845 (_ BitVec 32))) (Intermediate!6152 (undefined!6964 Bool) (index!26846 (_ BitVec 32)) (x!55640 (_ BitVec 32))) (Undefined!6152) (MissingVacant!6152 (index!26847 (_ BitVec 32))) )
))
(declare-fun lt!268432 () SeekEntryResult!6152)

(assert (=> b!591544 (= res!378476 (not (= lt!268432 (Found!6152 index!984))))))

(declare-fun lt!268430 () Unit!18526)

(assert (=> b!591544 (= lt!268430 e!337767)))

(declare-fun c!66902 () Bool)

(assert (=> b!591544 (= c!66902 (= lt!268432 Undefined!6152))))

(declare-fun lt!268425 () (_ BitVec 64))

(declare-fun lt!268431 () array!36884)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36884 (_ BitVec 32)) SeekEntryResult!6152)

(assert (=> b!591544 (= lt!268432 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268425 lt!268431 mask!3053))))

(declare-fun e!337769 () Bool)

(assert (=> b!591544 e!337769))

(declare-fun res!378482 () Bool)

(assert (=> b!591544 (=> (not res!378482) (not e!337769))))

(declare-fun lt!268428 () SeekEntryResult!6152)

(declare-fun lt!268426 () (_ BitVec 32))

(assert (=> b!591544 (= res!378482 (= lt!268428 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268426 vacantSpotIndex!68 lt!268425 lt!268431 mask!3053)))))

(assert (=> b!591544 (= lt!268428 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268426 vacantSpotIndex!68 (select (arr!17712 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!591544 (= lt!268425 (select (store (arr!17712 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268424 () Unit!18526)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36884 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18526)

(assert (=> b!591544 (= lt!268424 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268426 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591544 (= lt!268426 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!378478 () Bool)

(assert (=> start!54154 (=> (not res!378478) (not e!337764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54154 (= res!378478 (validMask!0 mask!3053))))

(assert (=> start!54154 e!337764))

(assert (=> start!54154 true))

(declare-fun array_inv!13508 (array!36884) Bool)

(assert (=> start!54154 (array_inv!13508 a!2986)))

(declare-fun b!591545 () Bool)

(declare-fun res!378474 () Bool)

(assert (=> b!591545 (=> (not res!378474) (not e!337761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36884 (_ BitVec 32)) Bool)

(assert (=> b!591545 (= res!378474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591546 () Bool)

(assert (=> b!591546 (= e!337765 true)))

(declare-fun e!337763 () Bool)

(assert (=> b!591546 e!337763))

(declare-fun res!378483 () Bool)

(assert (=> b!591546 (=> (not res!378483) (not e!337763))))

(declare-fun lt!268423 () (_ BitVec 64))

(assert (=> b!591546 (= res!378483 (= lt!268423 (select (arr!17712 a!2986) j!136)))))

(assert (=> b!591546 (= lt!268423 (select (store (arr!17712 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591547 () Bool)

(declare-fun res!378481 () Bool)

(assert (=> b!591547 (=> (not res!378481) (not e!337764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591547 (= res!378481 (validKeyInArray!0 (select (arr!17712 a!2986) j!136)))))

(declare-fun b!591548 () Bool)

(declare-fun lt!268429 () SeekEntryResult!6152)

(assert (=> b!591548 (= e!337769 (= lt!268429 lt!268428))))

(declare-fun b!591549 () Bool)

(declare-fun e!337762 () Bool)

(assert (=> b!591549 (= e!337763 e!337762)))

(declare-fun res!378477 () Bool)

(assert (=> b!591549 (=> res!378477 e!337762)))

(assert (=> b!591549 (= res!378477 (or (not (= (select (arr!17712 a!2986) j!136) lt!268425)) (not (= (select (arr!17712 a!2986) j!136) lt!268423)) (bvsge j!136 index!984)))))

(declare-fun b!591550 () Bool)

(declare-fun res!378479 () Bool)

(assert (=> b!591550 (=> (not res!378479) (not e!337764))))

(assert (=> b!591550 (= res!378479 (validKeyInArray!0 k!1786))))

(declare-fun b!591551 () Bool)

(declare-fun e!337766 () Bool)

(assert (=> b!591551 (= e!337766 e!337770)))

(declare-fun res!378480 () Bool)

(assert (=> b!591551 (=> (not res!378480) (not e!337770))))

(assert (=> b!591551 (= res!378480 (and (= lt!268429 (Found!6152 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17712 a!2986) index!984) (select (arr!17712 a!2986) j!136))) (not (= (select (arr!17712 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591551 (= lt!268429 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17712 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591552 () Bool)

(declare-fun res!378473 () Bool)

(assert (=> b!591552 (=> (not res!378473) (not e!337764))))

(declare-fun arrayContainsKey!0 (array!36884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591552 (= res!378473 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591553 () Bool)

(assert (=> b!591553 (= e!337764 e!337761)))

(declare-fun res!378484 () Bool)

(assert (=> b!591553 (=> (not res!378484) (not e!337761))))

(declare-fun lt!268427 () SeekEntryResult!6152)

(assert (=> b!591553 (= res!378484 (or (= lt!268427 (MissingZero!6152 i!1108)) (= lt!268427 (MissingVacant!6152 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36884 (_ BitVec 32)) SeekEntryResult!6152)

(assert (=> b!591553 (= lt!268427 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591554 () Bool)

(declare-fun Unit!18529 () Unit!18526)

(assert (=> b!591554 (= e!337767 Unit!18529)))

(assert (=> b!591554 false))

(declare-fun b!591555 () Bool)

(declare-fun e!337768 () Bool)

(assert (=> b!591555 (= e!337762 e!337768)))

(declare-fun res!378472 () Bool)

(assert (=> b!591555 (=> (not res!378472) (not e!337768))))

(assert (=> b!591555 (= res!378472 (arrayContainsKey!0 lt!268431 (select (arr!17712 a!2986) j!136) j!136))))

(declare-fun b!591556 () Bool)

(assert (=> b!591556 (= e!337768 (arrayContainsKey!0 lt!268431 (select (arr!17712 a!2986) j!136) index!984))))

(declare-fun b!591557 () Bool)

(assert (=> b!591557 (= e!337761 e!337766)))

(declare-fun res!378485 () Bool)

(assert (=> b!591557 (=> (not res!378485) (not e!337766))))

(assert (=> b!591557 (= res!378485 (= (select (store (arr!17712 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591557 (= lt!268431 (array!36885 (store (arr!17712 a!2986) i!1108 k!1786) (size!18076 a!2986)))))

(assert (= (and start!54154 res!378478) b!591540))

(assert (= (and b!591540 res!378475) b!591547))

(assert (= (and b!591547 res!378481) b!591550))

(assert (= (and b!591550 res!378479) b!591552))

(assert (= (and b!591552 res!378473) b!591553))

(assert (= (and b!591553 res!378484) b!591545))

(assert (= (and b!591545 res!378474) b!591543))

(assert (= (and b!591543 res!378471) b!591542))

(assert (= (and b!591542 res!378470) b!591557))

(assert (= (and b!591557 res!378485) b!591551))

(assert (= (and b!591551 res!378480) b!591544))

(assert (= (and b!591544 res!378482) b!591548))

(assert (= (and b!591544 c!66902) b!591554))

(assert (= (and b!591544 (not c!66902)) b!591541))

(assert (= (and b!591544 (not res!378476)) b!591546))

(assert (= (and b!591546 res!378483) b!591549))

(assert (= (and b!591549 (not res!378477)) b!591555))

(assert (= (and b!591555 res!378472) b!591556))

(declare-fun m!569773 () Bool)

(assert (=> b!591550 m!569773))

(declare-fun m!569775 () Bool)

(assert (=> b!591556 m!569775))

(assert (=> b!591556 m!569775))

(declare-fun m!569777 () Bool)

(assert (=> b!591556 m!569777))

(declare-fun m!569779 () Bool)

(assert (=> b!591551 m!569779))

(assert (=> b!591551 m!569775))

(assert (=> b!591551 m!569775))

(declare-fun m!569781 () Bool)

(assert (=> b!591551 m!569781))

(assert (=> b!591546 m!569775))

(declare-fun m!569783 () Bool)

(assert (=> b!591546 m!569783))

(declare-fun m!569785 () Bool)

(assert (=> b!591546 m!569785))

(declare-fun m!569787 () Bool)

(assert (=> b!591552 m!569787))

(declare-fun m!569789 () Bool)

(assert (=> b!591542 m!569789))

(declare-fun m!569791 () Bool)

(assert (=> b!591544 m!569791))

(declare-fun m!569793 () Bool)

(assert (=> b!591544 m!569793))

(assert (=> b!591544 m!569775))

(assert (=> b!591544 m!569775))

(declare-fun m!569795 () Bool)

(assert (=> b!591544 m!569795))

(assert (=> b!591544 m!569783))

(declare-fun m!569797 () Bool)

(assert (=> b!591544 m!569797))

(declare-fun m!569799 () Bool)

(assert (=> b!591544 m!569799))

(declare-fun m!569801 () Bool)

(assert (=> b!591544 m!569801))

(declare-fun m!569803 () Bool)

(assert (=> b!591553 m!569803))

(assert (=> b!591557 m!569783))

(declare-fun m!569805 () Bool)

(assert (=> b!591557 m!569805))

(declare-fun m!569807 () Bool)

(assert (=> b!591543 m!569807))

(declare-fun m!569809 () Bool)

(assert (=> start!54154 m!569809))

(declare-fun m!569811 () Bool)

(assert (=> start!54154 m!569811))

(assert (=> b!591549 m!569775))

(assert (=> b!591555 m!569775))

(assert (=> b!591555 m!569775))

(declare-fun m!569813 () Bool)

(assert (=> b!591555 m!569813))

(assert (=> b!591547 m!569775))

(assert (=> b!591547 m!569775))

(declare-fun m!569815 () Bool)

(assert (=> b!591547 m!569815))

(declare-fun m!569817 () Bool)

(assert (=> b!591545 m!569817))

(push 1)

