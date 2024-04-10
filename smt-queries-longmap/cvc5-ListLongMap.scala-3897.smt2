; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53392 () Bool)

(assert start!53392)

(declare-fun b!580815 () Bool)

(declare-fun res!368632 () Bool)

(declare-fun e!333455 () Bool)

(assert (=> b!580815 (=> (not res!368632) (not e!333455))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36293 0))(
  ( (array!36294 (arr!17421 (Array (_ BitVec 32) (_ BitVec 64))) (size!17785 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36293)

(assert (=> b!580815 (= res!368632 (and (= (size!17785 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17785 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17785 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368633 () Bool)

(assert (=> start!53392 (=> (not res!368633) (not e!333455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53392 (= res!368633 (validMask!0 mask!3053))))

(assert (=> start!53392 e!333455))

(assert (=> start!53392 true))

(declare-fun array_inv!13217 (array!36293) Bool)

(assert (=> start!53392 (array_inv!13217 a!2986)))

(declare-fun b!580816 () Bool)

(declare-fun res!368637 () Bool)

(assert (=> b!580816 (=> (not res!368637) (not e!333455))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580816 (= res!368637 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580817 () Bool)

(declare-fun e!333456 () Bool)

(assert (=> b!580817 (= e!333455 e!333456)))

(declare-fun res!368636 () Bool)

(assert (=> b!580817 (=> (not res!368636) (not e!333456))))

(declare-datatypes ((SeekEntryResult!5861 0))(
  ( (MissingZero!5861 (index!25671 (_ BitVec 32))) (Found!5861 (index!25672 (_ BitVec 32))) (Intermediate!5861 (undefined!6673 Bool) (index!25673 (_ BitVec 32)) (x!54546 (_ BitVec 32))) (Undefined!5861) (MissingVacant!5861 (index!25674 (_ BitVec 32))) )
))
(declare-fun lt!264777 () SeekEntryResult!5861)

(assert (=> b!580817 (= res!368636 (or (= lt!264777 (MissingZero!5861 i!1108)) (= lt!264777 (MissingVacant!5861 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36293 (_ BitVec 32)) SeekEntryResult!5861)

(assert (=> b!580817 (= lt!264777 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580818 () Bool)

(declare-fun res!368634 () Bool)

(assert (=> b!580818 (=> (not res!368634) (not e!333456))))

(declare-datatypes ((List!11462 0))(
  ( (Nil!11459) (Cons!11458 (h!12503 (_ BitVec 64)) (t!17690 List!11462)) )
))
(declare-fun arrayNoDuplicates!0 (array!36293 (_ BitVec 32) List!11462) Bool)

(assert (=> b!580818 (= res!368634 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11459))))

(declare-fun b!580819 () Bool)

(declare-fun res!368638 () Bool)

(assert (=> b!580819 (=> (not res!368638) (not e!333455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580819 (= res!368638 (validKeyInArray!0 (select (arr!17421 a!2986) j!136)))))

(declare-fun b!580820 () Bool)

(declare-fun res!368639 () Bool)

(assert (=> b!580820 (=> (not res!368639) (not e!333456))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580820 (= res!368639 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17421 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17421 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580821 () Bool)

(assert (=> b!580821 (= e!333456 false)))

(declare-fun lt!264778 () SeekEntryResult!5861)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36293 (_ BitVec 32)) SeekEntryResult!5861)

(assert (=> b!580821 (= lt!264778 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17421 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580822 () Bool)

(declare-fun res!368631 () Bool)

(assert (=> b!580822 (=> (not res!368631) (not e!333456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36293 (_ BitVec 32)) Bool)

(assert (=> b!580822 (= res!368631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580823 () Bool)

(declare-fun res!368635 () Bool)

(assert (=> b!580823 (=> (not res!368635) (not e!333455))))

(assert (=> b!580823 (= res!368635 (validKeyInArray!0 k!1786))))

(assert (= (and start!53392 res!368633) b!580815))

(assert (= (and b!580815 res!368632) b!580819))

(assert (= (and b!580819 res!368638) b!580823))

(assert (= (and b!580823 res!368635) b!580816))

(assert (= (and b!580816 res!368637) b!580817))

(assert (= (and b!580817 res!368636) b!580822))

(assert (= (and b!580822 res!368631) b!580818))

(assert (= (and b!580818 res!368634) b!580820))

(assert (= (and b!580820 res!368639) b!580821))

(declare-fun m!559381 () Bool)

(assert (=> b!580816 m!559381))

(declare-fun m!559383 () Bool)

(assert (=> b!580820 m!559383))

(declare-fun m!559385 () Bool)

(assert (=> b!580820 m!559385))

(declare-fun m!559387 () Bool)

(assert (=> b!580820 m!559387))

(declare-fun m!559389 () Bool)

(assert (=> b!580818 m!559389))

(declare-fun m!559391 () Bool)

(assert (=> start!53392 m!559391))

(declare-fun m!559393 () Bool)

(assert (=> start!53392 m!559393))

(declare-fun m!559395 () Bool)

(assert (=> b!580823 m!559395))

(declare-fun m!559397 () Bool)

(assert (=> b!580822 m!559397))

(declare-fun m!559399 () Bool)

(assert (=> b!580821 m!559399))

(assert (=> b!580821 m!559399))

(declare-fun m!559401 () Bool)

(assert (=> b!580821 m!559401))

(declare-fun m!559403 () Bool)

(assert (=> b!580817 m!559403))

(assert (=> b!580819 m!559399))

(assert (=> b!580819 m!559399))

(declare-fun m!559405 () Bool)

(assert (=> b!580819 m!559405))

(push 1)

