; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59598 () Bool)

(assert start!59598)

(declare-fun b!658803 () Bool)

(declare-fun res!427245 () Bool)

(declare-fun e!378472 () Bool)

(assert (=> b!658803 (=> (not res!427245) (not e!378472))))

(declare-datatypes ((array!38756 0))(
  ( (array!38757 (arr!18575 (Array (_ BitVec 32) (_ BitVec 64))) (size!18939 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38756)

(declare-datatypes ((List!12616 0))(
  ( (Nil!12613) (Cons!12612 (h!13657 (_ BitVec 64)) (t!18844 List!12616)) )
))
(declare-fun arrayNoDuplicates!0 (array!38756 (_ BitVec 32) List!12616) Bool)

(assert (=> b!658803 (= res!427245 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12613))))

(declare-fun b!658804 () Bool)

(declare-datatypes ((Unit!22904 0))(
  ( (Unit!22905) )
))
(declare-fun e!378469 () Unit!22904)

(declare-fun Unit!22906 () Unit!22904)

(assert (=> b!658804 (= e!378469 Unit!22906)))

(declare-fun b!658805 () Bool)

(declare-fun e!378475 () Bool)

(assert (=> b!658805 (= e!378475 (not true))))

(declare-fun lt!308173 () Unit!22904)

(declare-fun e!378468 () Unit!22904)

(assert (=> b!658805 (= lt!308173 e!378468)))

(declare-fun c!76152 () Bool)

(declare-datatypes ((SeekEntryResult!7015 0))(
  ( (MissingZero!7015 (index!30425 (_ BitVec 32))) (Found!7015 (index!30426 (_ BitVec 32))) (Intermediate!7015 (undefined!7827 Bool) (index!30427 (_ BitVec 32)) (x!59210 (_ BitVec 32))) (Undefined!7015) (MissingVacant!7015 (index!30428 (_ BitVec 32))) )
))
(declare-fun lt!308188 () SeekEntryResult!7015)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658805 (= c!76152 (= lt!308188 (Found!7015 index!984)))))

(declare-fun lt!308182 () Unit!22904)

(declare-fun e!378477 () Unit!22904)

(assert (=> b!658805 (= lt!308182 e!378477)))

(declare-fun c!76151 () Bool)

(assert (=> b!658805 (= c!76151 (= lt!308188 Undefined!7015))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!308187 () array!38756)

(declare-fun lt!308178 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38756 (_ BitVec 32)) SeekEntryResult!7015)

(assert (=> b!658805 (= lt!308188 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308178 lt!308187 mask!3053))))

(declare-fun e!378473 () Bool)

(assert (=> b!658805 e!378473))

(declare-fun res!427240 () Bool)

(assert (=> b!658805 (=> (not res!427240) (not e!378473))))

(declare-fun lt!308171 () SeekEntryResult!7015)

(declare-fun lt!308172 () (_ BitVec 32))

(assert (=> b!658805 (= res!427240 (= lt!308171 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308172 vacantSpotIndex!68 lt!308178 lt!308187 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!658805 (= lt!308171 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308172 vacantSpotIndex!68 (select (arr!18575 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!658805 (= lt!308178 (select (store (arr!18575 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!308184 () Unit!22904)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38756 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22904)

(assert (=> b!658805 (= lt!308184 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308172 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658805 (= lt!308172 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658807 () Bool)

(declare-fun Unit!22907 () Unit!22904)

(assert (=> b!658807 (= e!378477 Unit!22907)))

(assert (=> b!658807 false))

(declare-fun b!658808 () Bool)

(declare-fun e!378476 () Bool)

(declare-fun arrayContainsKey!0 (array!38756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658808 (= e!378476 (arrayContainsKey!0 lt!308187 (select (arr!18575 a!2986) j!136) index!984))))

(declare-fun b!658809 () Bool)

(declare-fun res!427243 () Bool)

(assert (=> b!658809 (= res!427243 (bvsge j!136 index!984))))

(declare-fun e!378480 () Bool)

(assert (=> b!658809 (=> res!427243 e!378480)))

(declare-fun e!378474 () Bool)

(assert (=> b!658809 (= e!378474 e!378480)))

(declare-fun b!658810 () Bool)

(declare-fun res!427250 () Bool)

(assert (=> b!658810 (= res!427250 (arrayContainsKey!0 lt!308187 (select (arr!18575 a!2986) j!136) j!136))))

(assert (=> b!658810 (=> (not res!427250) (not e!378476))))

(assert (=> b!658810 (= e!378480 e!378476)))

(declare-fun b!658811 () Bool)

(declare-fun res!427249 () Bool)

(declare-fun e!378471 () Bool)

(assert (=> b!658811 (=> (not res!427249) (not e!378471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658811 (= res!427249 (validKeyInArray!0 (select (arr!18575 a!2986) j!136)))))

(declare-fun b!658812 () Bool)

(declare-fun res!427246 () Bool)

(assert (=> b!658812 (=> (not res!427246) (not e!378471))))

(assert (=> b!658812 (= res!427246 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658813 () Bool)

(declare-fun res!427236 () Bool)

(assert (=> b!658813 (=> (not res!427236) (not e!378471))))

(assert (=> b!658813 (= res!427236 (validKeyInArray!0 k!1786))))

(declare-fun b!658814 () Bool)

(declare-fun res!427235 () Bool)

(assert (=> b!658814 (=> (not res!427235) (not e!378472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38756 (_ BitVec 32)) Bool)

(assert (=> b!658814 (= res!427235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658815 () Bool)

(declare-fun lt!308169 () SeekEntryResult!7015)

(assert (=> b!658815 (= e!378473 (= lt!308169 lt!308171))))

(declare-fun b!658816 () Bool)

(declare-fun Unit!22908 () Unit!22904)

(assert (=> b!658816 (= e!378468 Unit!22908)))

(declare-fun res!427238 () Bool)

(assert (=> b!658816 (= res!427238 (= (select (store (arr!18575 a!2986) i!1108 k!1786) index!984) (select (arr!18575 a!2986) j!136)))))

(assert (=> b!658816 (=> (not res!427238) (not e!378474))))

(assert (=> b!658816 e!378474))

(declare-fun c!76154 () Bool)

(assert (=> b!658816 (= c!76154 (bvslt j!136 index!984))))

(declare-fun lt!308180 () Unit!22904)

(declare-fun e!378470 () Unit!22904)

(assert (=> b!658816 (= lt!308180 e!378470)))

(declare-fun c!76153 () Bool)

(assert (=> b!658816 (= c!76153 (bvslt index!984 j!136))))

(declare-fun lt!308175 () Unit!22904)

(assert (=> b!658816 (= lt!308175 e!378469)))

(assert (=> b!658816 false))

(declare-fun b!658817 () Bool)

(assert (=> b!658817 false))

(declare-fun lt!308181 () Unit!22904)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38756 (_ BitVec 64) (_ BitVec 32) List!12616) Unit!22904)

(assert (=> b!658817 (= lt!308181 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308187 (select (arr!18575 a!2986) j!136) index!984 Nil!12613))))

(assert (=> b!658817 (arrayNoDuplicates!0 lt!308187 index!984 Nil!12613)))

(declare-fun lt!308185 () Unit!22904)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38756 (_ BitVec 32) (_ BitVec 32)) Unit!22904)

(assert (=> b!658817 (= lt!308185 (lemmaNoDuplicateFromThenFromBigger!0 lt!308187 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658817 (arrayNoDuplicates!0 lt!308187 #b00000000000000000000000000000000 Nil!12613)))

(declare-fun lt!308174 () Unit!22904)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38756 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12616) Unit!22904)

(assert (=> b!658817 (= lt!308174 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12613))))

(assert (=> b!658817 (arrayContainsKey!0 lt!308187 (select (arr!18575 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308179 () Unit!22904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38756 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22904)

(assert (=> b!658817 (= lt!308179 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308187 (select (arr!18575 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378478 () Bool)

(assert (=> b!658817 e!378478))

(declare-fun res!427239 () Bool)

(assert (=> b!658817 (=> (not res!427239) (not e!378478))))

(assert (=> b!658817 (= res!427239 (arrayContainsKey!0 lt!308187 (select (arr!18575 a!2986) j!136) j!136))))

(declare-fun Unit!22909 () Unit!22904)

(assert (=> b!658817 (= e!378469 Unit!22909)))

(declare-fun res!427237 () Bool)

(assert (=> start!59598 (=> (not res!427237) (not e!378471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59598 (= res!427237 (validMask!0 mask!3053))))

(assert (=> start!59598 e!378471))

(assert (=> start!59598 true))

(declare-fun array_inv!14371 (array!38756) Bool)

(assert (=> start!59598 (array_inv!14371 a!2986)))

(declare-fun b!658806 () Bool)

(declare-fun e!378479 () Bool)

(assert (=> b!658806 (= e!378479 e!378475)))

(declare-fun res!427247 () Bool)

(assert (=> b!658806 (=> (not res!427247) (not e!378475))))

(assert (=> b!658806 (= res!427247 (and (= lt!308169 (Found!7015 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18575 a!2986) index!984) (select (arr!18575 a!2986) j!136))) (not (= (select (arr!18575 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658806 (= lt!308169 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18575 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658818 () Bool)

(declare-fun res!427242 () Bool)

(assert (=> b!658818 (=> (not res!427242) (not e!378472))))

(assert (=> b!658818 (= res!427242 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18575 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658819 () Bool)

(assert (=> b!658819 false))

(declare-fun lt!308186 () Unit!22904)

(assert (=> b!658819 (= lt!308186 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308187 (select (arr!18575 a!2986) j!136) j!136 Nil!12613))))

(assert (=> b!658819 (arrayNoDuplicates!0 lt!308187 j!136 Nil!12613)))

(declare-fun lt!308176 () Unit!22904)

(assert (=> b!658819 (= lt!308176 (lemmaNoDuplicateFromThenFromBigger!0 lt!308187 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658819 (arrayNoDuplicates!0 lt!308187 #b00000000000000000000000000000000 Nil!12613)))

(declare-fun lt!308183 () Unit!22904)

(assert (=> b!658819 (= lt!308183 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12613))))

(assert (=> b!658819 (arrayContainsKey!0 lt!308187 (select (arr!18575 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308177 () Unit!22904)

(assert (=> b!658819 (= lt!308177 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308187 (select (arr!18575 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22910 () Unit!22904)

(assert (=> b!658819 (= e!378470 Unit!22910)))

(declare-fun b!658820 () Bool)

(assert (=> b!658820 (= e!378471 e!378472)))

(declare-fun res!427241 () Bool)

(assert (=> b!658820 (=> (not res!427241) (not e!378472))))

(declare-fun lt!308170 () SeekEntryResult!7015)

(assert (=> b!658820 (= res!427241 (or (= lt!308170 (MissingZero!7015 i!1108)) (= lt!308170 (MissingVacant!7015 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38756 (_ BitVec 32)) SeekEntryResult!7015)

(assert (=> b!658820 (= lt!308170 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!658821 () Bool)

(declare-fun Unit!22911 () Unit!22904)

(assert (=> b!658821 (= e!378477 Unit!22911)))

(declare-fun b!658822 () Bool)

(declare-fun Unit!22912 () Unit!22904)

(assert (=> b!658822 (= e!378468 Unit!22912)))

(declare-fun b!658823 () Bool)

(assert (=> b!658823 (= e!378472 e!378479)))

(declare-fun res!427248 () Bool)

(assert (=> b!658823 (=> (not res!427248) (not e!378479))))

(assert (=> b!658823 (= res!427248 (= (select (store (arr!18575 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658823 (= lt!308187 (array!38757 (store (arr!18575 a!2986) i!1108 k!1786) (size!18939 a!2986)))))

(declare-fun b!658824 () Bool)

(declare-fun res!427244 () Bool)

(assert (=> b!658824 (=> (not res!427244) (not e!378471))))

(assert (=> b!658824 (= res!427244 (and (= (size!18939 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18939 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18939 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658825 () Bool)

(assert (=> b!658825 (= e!378478 (arrayContainsKey!0 lt!308187 (select (arr!18575 a!2986) j!136) index!984))))

(declare-fun b!658826 () Bool)

(declare-fun Unit!22913 () Unit!22904)

(assert (=> b!658826 (= e!378470 Unit!22913)))

(assert (= (and start!59598 res!427237) b!658824))

(assert (= (and b!658824 res!427244) b!658811))

(assert (= (and b!658811 res!427249) b!658813))

(assert (= (and b!658813 res!427236) b!658812))

(assert (= (and b!658812 res!427246) b!658820))

(assert (= (and b!658820 res!427241) b!658814))

(assert (= (and b!658814 res!427235) b!658803))

(assert (= (and b!658803 res!427245) b!658818))

(assert (= (and b!658818 res!427242) b!658823))

(assert (= (and b!658823 res!427248) b!658806))

(assert (= (and b!658806 res!427247) b!658805))

(assert (= (and b!658805 res!427240) b!658815))

(assert (= (and b!658805 c!76151) b!658807))

(assert (= (and b!658805 (not c!76151)) b!658821))

(assert (= (and b!658805 c!76152) b!658816))

(assert (= (and b!658805 (not c!76152)) b!658822))

(assert (= (and b!658816 res!427238) b!658809))

(assert (= (and b!658809 (not res!427243)) b!658810))

(assert (= (and b!658810 res!427250) b!658808))

(assert (= (and b!658816 c!76154) b!658819))

(assert (= (and b!658816 (not c!76154)) b!658826))

(assert (= (and b!658816 c!76153) b!658817))

(assert (= (and b!658816 (not c!76153)) b!658804))

(assert (= (and b!658817 res!427239) b!658825))

(declare-fun m!631777 () Bool)

(assert (=> b!658813 m!631777))

(declare-fun m!631779 () Bool)

(assert (=> b!658806 m!631779))

(declare-fun m!631781 () Bool)

(assert (=> b!658806 m!631781))

(assert (=> b!658806 m!631781))

(declare-fun m!631783 () Bool)

(assert (=> b!658806 m!631783))

(assert (=> b!658810 m!631781))

(assert (=> b!658810 m!631781))

(declare-fun m!631785 () Bool)

(assert (=> b!658810 m!631785))

(assert (=> b!658819 m!631781))

(declare-fun m!631787 () Bool)

(assert (=> b!658819 m!631787))

(assert (=> b!658819 m!631781))

(declare-fun m!631789 () Bool)

(assert (=> b!658819 m!631789))

(assert (=> b!658819 m!631781))

(declare-fun m!631791 () Bool)

(assert (=> b!658819 m!631791))

(declare-fun m!631793 () Bool)

(assert (=> b!658819 m!631793))

(assert (=> b!658819 m!631781))

(declare-fun m!631795 () Bool)

(assert (=> b!658819 m!631795))

(declare-fun m!631797 () Bool)

(assert (=> b!658819 m!631797))

(declare-fun m!631799 () Bool)

(assert (=> b!658819 m!631799))

(declare-fun m!631801 () Bool)

(assert (=> b!658820 m!631801))

(declare-fun m!631803 () Bool)

(assert (=> start!59598 m!631803))

(declare-fun m!631805 () Bool)

(assert (=> start!59598 m!631805))

(declare-fun m!631807 () Bool)

(assert (=> b!658814 m!631807))

(assert (=> b!658811 m!631781))

(assert (=> b!658811 m!631781))

(declare-fun m!631809 () Bool)

(assert (=> b!658811 m!631809))

(declare-fun m!631811 () Bool)

(assert (=> b!658812 m!631811))

(declare-fun m!631813 () Bool)

(assert (=> b!658805 m!631813))

(declare-fun m!631815 () Bool)

(assert (=> b!658805 m!631815))

(assert (=> b!658805 m!631781))

(declare-fun m!631817 () Bool)

(assert (=> b!658805 m!631817))

(assert (=> b!658805 m!631781))

(declare-fun m!631819 () Bool)

(assert (=> b!658805 m!631819))

(declare-fun m!631821 () Bool)

(assert (=> b!658805 m!631821))

(declare-fun m!631823 () Bool)

(assert (=> b!658805 m!631823))

(declare-fun m!631825 () Bool)

(assert (=> b!658805 m!631825))

(assert (=> b!658817 m!631781))

(assert (=> b!658817 m!631785))

(assert (=> b!658817 m!631781))

(assert (=> b!658817 m!631781))

(declare-fun m!631827 () Bool)

(assert (=> b!658817 m!631827))

(assert (=> b!658817 m!631781))

(declare-fun m!631829 () Bool)

(assert (=> b!658817 m!631829))

(declare-fun m!631831 () Bool)

(assert (=> b!658817 m!631831))

(declare-fun m!631833 () Bool)

(assert (=> b!658817 m!631833))

(assert (=> b!658817 m!631799))

(assert (=> b!658817 m!631797))

(assert (=> b!658817 m!631781))

(declare-fun m!631835 () Bool)

(assert (=> b!658817 m!631835))

(assert (=> b!658825 m!631781))

(assert (=> b!658825 m!631781))

(declare-fun m!631837 () Bool)

(assert (=> b!658825 m!631837))

(declare-fun m!631839 () Bool)

(assert (=> b!658818 m!631839))

(assert (=> b!658823 m!631817))

(declare-fun m!631841 () Bool)

(assert (=> b!658823 m!631841))

(assert (=> b!658808 m!631781))

(assert (=> b!658808 m!631781))

(assert (=> b!658808 m!631837))

(declare-fun m!631843 () Bool)

(assert (=> b!658803 m!631843))

(assert (=> b!658816 m!631817))

(declare-fun m!631845 () Bool)

(assert (=> b!658816 m!631845))

(assert (=> b!658816 m!631781))

(push 1)

