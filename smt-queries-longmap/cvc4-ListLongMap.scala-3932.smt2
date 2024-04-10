; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53606 () Bool)

(assert start!53606)

(declare-fun b!583818 () Bool)

(declare-fun e!334444 () Bool)

(assert (=> b!583818 (= e!334444 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5968 0))(
  ( (MissingZero!5968 (index!26099 (_ BitVec 32))) (Found!5968 (index!26100 (_ BitVec 32))) (Intermediate!5968 (undefined!6780 Bool) (index!26101 (_ BitVec 32)) (x!54933 (_ BitVec 32))) (Undefined!5968) (MissingVacant!5968 (index!26102 (_ BitVec 32))) )
))
(declare-fun lt!265419 () SeekEntryResult!5968)

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36507 0))(
  ( (array!36508 (arr!17528 (Array (_ BitVec 32) (_ BitVec 64))) (size!17892 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36507)

(declare-fun lt!265420 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36507 (_ BitVec 32)) SeekEntryResult!5968)

(assert (=> b!583818 (= lt!265419 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265420 vacantSpotIndex!68 (select (arr!17528 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583819 () Bool)

(declare-fun res!371637 () Bool)

(declare-fun e!334445 () Bool)

(assert (=> b!583819 (=> (not res!371637) (not e!334445))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583819 (= res!371637 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17528 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17528 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583820 () Bool)

(declare-fun e!334443 () Bool)

(assert (=> b!583820 (= e!334443 e!334445)))

(declare-fun res!371644 () Bool)

(assert (=> b!583820 (=> (not res!371644) (not e!334445))))

(declare-fun lt!265418 () SeekEntryResult!5968)

(assert (=> b!583820 (= res!371644 (or (= lt!265418 (MissingZero!5968 i!1108)) (= lt!265418 (MissingVacant!5968 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36507 (_ BitVec 32)) SeekEntryResult!5968)

(assert (=> b!583820 (= lt!265418 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583821 () Bool)

(declare-fun res!371643 () Bool)

(assert (=> b!583821 (=> (not res!371643) (not e!334445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36507 (_ BitVec 32)) Bool)

(assert (=> b!583821 (= res!371643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583822 () Bool)

(declare-fun res!371635 () Bool)

(assert (=> b!583822 (=> (not res!371635) (not e!334443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583822 (= res!371635 (validKeyInArray!0 k!1786))))

(declare-fun res!371639 () Bool)

(assert (=> start!53606 (=> (not res!371639) (not e!334443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53606 (= res!371639 (validMask!0 mask!3053))))

(assert (=> start!53606 e!334443))

(assert (=> start!53606 true))

(declare-fun array_inv!13324 (array!36507) Bool)

(assert (=> start!53606 (array_inv!13324 a!2986)))

(declare-fun b!583823 () Bool)

(declare-fun res!371645 () Bool)

(assert (=> b!583823 (=> (not res!371645) (not e!334445))))

(assert (=> b!583823 (= res!371645 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17528 a!2986) j!136) a!2986 mask!3053) (Found!5968 j!136)))))

(declare-fun b!583824 () Bool)

(declare-fun res!371642 () Bool)

(assert (=> b!583824 (=> (not res!371642) (not e!334443))))

(declare-fun arrayContainsKey!0 (array!36507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583824 (= res!371642 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583825 () Bool)

(declare-fun res!371641 () Bool)

(assert (=> b!583825 (=> (not res!371641) (not e!334443))))

(assert (=> b!583825 (= res!371641 (and (= (size!17892 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17892 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17892 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583826 () Bool)

(declare-fun res!371638 () Bool)

(assert (=> b!583826 (=> (not res!371638) (not e!334443))))

(assert (=> b!583826 (= res!371638 (validKeyInArray!0 (select (arr!17528 a!2986) j!136)))))

(declare-fun b!583827 () Bool)

(declare-fun res!371636 () Bool)

(assert (=> b!583827 (=> (not res!371636) (not e!334445))))

(assert (=> b!583827 (= res!371636 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17528 a!2986) index!984) (select (arr!17528 a!2986) j!136))) (not (= (select (arr!17528 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583828 () Bool)

(assert (=> b!583828 (= e!334445 e!334444)))

(declare-fun res!371640 () Bool)

(assert (=> b!583828 (=> (not res!371640) (not e!334444))))

(assert (=> b!583828 (= res!371640 (and (bvsge lt!265420 #b00000000000000000000000000000000) (bvslt lt!265420 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583828 (= lt!265420 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583829 () Bool)

(declare-fun res!371634 () Bool)

(assert (=> b!583829 (=> (not res!371634) (not e!334445))))

(declare-datatypes ((List!11569 0))(
  ( (Nil!11566) (Cons!11565 (h!12610 (_ BitVec 64)) (t!17797 List!11569)) )
))
(declare-fun arrayNoDuplicates!0 (array!36507 (_ BitVec 32) List!11569) Bool)

(assert (=> b!583829 (= res!371634 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11566))))

(assert (= (and start!53606 res!371639) b!583825))

(assert (= (and b!583825 res!371641) b!583826))

(assert (= (and b!583826 res!371638) b!583822))

(assert (= (and b!583822 res!371635) b!583824))

(assert (= (and b!583824 res!371642) b!583820))

(assert (= (and b!583820 res!371644) b!583821))

(assert (= (and b!583821 res!371643) b!583829))

(assert (= (and b!583829 res!371634) b!583819))

(assert (= (and b!583819 res!371637) b!583823))

(assert (= (and b!583823 res!371645) b!583827))

(assert (= (and b!583827 res!371636) b!583828))

(assert (= (and b!583828 res!371640) b!583818))

(declare-fun m!562241 () Bool)

(assert (=> b!583820 m!562241))

(declare-fun m!562243 () Bool)

(assert (=> b!583818 m!562243))

(assert (=> b!583818 m!562243))

(declare-fun m!562245 () Bool)

(assert (=> b!583818 m!562245))

(declare-fun m!562247 () Bool)

(assert (=> b!583819 m!562247))

(declare-fun m!562249 () Bool)

(assert (=> b!583819 m!562249))

(declare-fun m!562251 () Bool)

(assert (=> b!583819 m!562251))

(declare-fun m!562253 () Bool)

(assert (=> b!583827 m!562253))

(assert (=> b!583827 m!562243))

(declare-fun m!562255 () Bool)

(assert (=> start!53606 m!562255))

(declare-fun m!562257 () Bool)

(assert (=> start!53606 m!562257))

(declare-fun m!562259 () Bool)

(assert (=> b!583829 m!562259))

(declare-fun m!562261 () Bool)

(assert (=> b!583824 m!562261))

(declare-fun m!562263 () Bool)

(assert (=> b!583821 m!562263))

(assert (=> b!583823 m!562243))

(assert (=> b!583823 m!562243))

(declare-fun m!562265 () Bool)

(assert (=> b!583823 m!562265))

(declare-fun m!562267 () Bool)

(assert (=> b!583828 m!562267))

(assert (=> b!583826 m!562243))

(assert (=> b!583826 m!562243))

(declare-fun m!562269 () Bool)

(assert (=> b!583826 m!562269))

(declare-fun m!562271 () Bool)

(assert (=> b!583822 m!562271))

(push 1)

(assert (not b!583829))

(assert (not b!583820))

(assert (not b!583822))

(assert (not b!583821))

(assert (not b!583826))

(assert (not b!583824))

(assert (not b!583823))

(assert (not b!583828))

(assert (not b!583818))

