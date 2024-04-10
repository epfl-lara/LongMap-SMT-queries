; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53540 () Bool)

(assert start!53540)

(declare-fun res!370663 () Bool)

(declare-fun e!334121 () Bool)

(assert (=> start!53540 (=> (not res!370663) (not e!334121))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53540 (= res!370663 (validMask!0 mask!3053))))

(assert (=> start!53540 e!334121))

(assert (=> start!53540 true))

(declare-datatypes ((array!36441 0))(
  ( (array!36442 (arr!17495 (Array (_ BitVec 32) (_ BitVec 64))) (size!17859 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36441)

(declare-fun array_inv!13291 (array!36441) Bool)

(assert (=> start!53540 (array_inv!13291 a!2986)))

(declare-fun b!582840 () Bool)

(declare-fun res!370664 () Bool)

(assert (=> b!582840 (=> (not res!370664) (not e!334121))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582840 (= res!370664 (and (= (size!17859 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17859 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17859 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582841 () Bool)

(declare-fun res!370657 () Bool)

(declare-fun e!334122 () Bool)

(assert (=> b!582841 (=> (not res!370657) (not e!334122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36441 (_ BitVec 32)) Bool)

(assert (=> b!582841 (= res!370657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582842 () Bool)

(declare-fun res!370662 () Bool)

(assert (=> b!582842 (=> (not res!370662) (not e!334122))))

(declare-datatypes ((List!11536 0))(
  ( (Nil!11533) (Cons!11532 (h!12577 (_ BitVec 64)) (t!17764 List!11536)) )
))
(declare-fun arrayNoDuplicates!0 (array!36441 (_ BitVec 32) List!11536) Bool)

(assert (=> b!582842 (= res!370662 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11533))))

(declare-fun b!582843 () Bool)

(declare-fun res!370660 () Bool)

(assert (=> b!582843 (=> (not res!370660) (not e!334121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582843 (= res!370660 (validKeyInArray!0 (select (arr!17495 a!2986) j!136)))))

(declare-fun b!582844 () Bool)

(declare-fun res!370656 () Bool)

(assert (=> b!582844 (=> (not res!370656) (not e!334121))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582844 (= res!370656 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582845 () Bool)

(declare-fun res!370661 () Bool)

(assert (=> b!582845 (=> (not res!370661) (not e!334122))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582845 (= res!370661 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17495 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17495 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582846 () Bool)

(declare-fun res!370659 () Bool)

(assert (=> b!582846 (=> (not res!370659) (not e!334121))))

(assert (=> b!582846 (= res!370659 (validKeyInArray!0 k!1786))))

(declare-fun b!582847 () Bool)

(assert (=> b!582847 (= e!334122 false)))

(declare-datatypes ((SeekEntryResult!5935 0))(
  ( (MissingZero!5935 (index!25967 (_ BitVec 32))) (Found!5935 (index!25968 (_ BitVec 32))) (Intermediate!5935 (undefined!6747 Bool) (index!25969 (_ BitVec 32)) (x!54812 (_ BitVec 32))) (Undefined!5935) (MissingVacant!5935 (index!25970 (_ BitVec 32))) )
))
(declare-fun lt!265204 () SeekEntryResult!5935)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36441 (_ BitVec 32)) SeekEntryResult!5935)

(assert (=> b!582847 (= lt!265204 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17495 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582848 () Bool)

(assert (=> b!582848 (= e!334121 e!334122)))

(declare-fun res!370658 () Bool)

(assert (=> b!582848 (=> (not res!370658) (not e!334122))))

(declare-fun lt!265203 () SeekEntryResult!5935)

(assert (=> b!582848 (= res!370658 (or (= lt!265203 (MissingZero!5935 i!1108)) (= lt!265203 (MissingVacant!5935 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36441 (_ BitVec 32)) SeekEntryResult!5935)

(assert (=> b!582848 (= lt!265203 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53540 res!370663) b!582840))

(assert (= (and b!582840 res!370664) b!582843))

(assert (= (and b!582843 res!370660) b!582846))

(assert (= (and b!582846 res!370659) b!582844))

(assert (= (and b!582844 res!370656) b!582848))

(assert (= (and b!582848 res!370658) b!582841))

(assert (= (and b!582841 res!370657) b!582842))

(assert (= (and b!582842 res!370662) b!582845))

(assert (= (and b!582845 res!370661) b!582847))

(declare-fun m!561329 () Bool)

(assert (=> b!582847 m!561329))

(assert (=> b!582847 m!561329))

(declare-fun m!561331 () Bool)

(assert (=> b!582847 m!561331))

(assert (=> b!582843 m!561329))

(assert (=> b!582843 m!561329))

(declare-fun m!561333 () Bool)

(assert (=> b!582843 m!561333))

(declare-fun m!561335 () Bool)

(assert (=> b!582841 m!561335))

(declare-fun m!561337 () Bool)

(assert (=> b!582848 m!561337))

(declare-fun m!561339 () Bool)

(assert (=> b!582844 m!561339))

(declare-fun m!561341 () Bool)

(assert (=> b!582846 m!561341))

(declare-fun m!561343 () Bool)

(assert (=> start!53540 m!561343))

(declare-fun m!561345 () Bool)

(assert (=> start!53540 m!561345))

(declare-fun m!561347 () Bool)

(assert (=> b!582845 m!561347))

(declare-fun m!561349 () Bool)

(assert (=> b!582845 m!561349))

(declare-fun m!561351 () Bool)

(assert (=> b!582845 m!561351))

(declare-fun m!561353 () Bool)

(assert (=> b!582842 m!561353))

(push 1)

(assert (not b!582843))

(assert (not b!582847))

(assert (not b!582848))

(assert (not b!582846))

(assert (not start!53540))

(assert (not b!582841))

(assert (not b!582844))

(assert (not b!582842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

