; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53390 () Bool)

(assert start!53390)

(declare-fun b!580788 () Bool)

(declare-fun res!368604 () Bool)

(declare-fun e!333446 () Bool)

(assert (=> b!580788 (=> (not res!368604) (not e!333446))))

(declare-datatypes ((array!36291 0))(
  ( (array!36292 (arr!17420 (Array (_ BitVec 32) (_ BitVec 64))) (size!17784 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36291)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580788 (= res!368604 (validKeyInArray!0 (select (arr!17420 a!2986) j!136)))))

(declare-fun b!580789 () Bool)

(declare-fun e!333447 () Bool)

(assert (=> b!580789 (= e!333446 e!333447)))

(declare-fun res!368611 () Bool)

(assert (=> b!580789 (=> (not res!368611) (not e!333447))))

(declare-datatypes ((SeekEntryResult!5860 0))(
  ( (MissingZero!5860 (index!25667 (_ BitVec 32))) (Found!5860 (index!25668 (_ BitVec 32))) (Intermediate!5860 (undefined!6672 Bool) (index!25669 (_ BitVec 32)) (x!54537 (_ BitVec 32))) (Undefined!5860) (MissingVacant!5860 (index!25670 (_ BitVec 32))) )
))
(declare-fun lt!264771 () SeekEntryResult!5860)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580789 (= res!368611 (or (= lt!264771 (MissingZero!5860 i!1108)) (= lt!264771 (MissingVacant!5860 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36291 (_ BitVec 32)) SeekEntryResult!5860)

(assert (=> b!580789 (= lt!264771 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580790 () Bool)

(declare-fun res!368606 () Bool)

(assert (=> b!580790 (=> (not res!368606) (not e!333446))))

(assert (=> b!580790 (= res!368606 (validKeyInArray!0 k!1786))))

(declare-fun b!580791 () Bool)

(assert (=> b!580791 (= e!333447 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264772 () SeekEntryResult!5860)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36291 (_ BitVec 32)) SeekEntryResult!5860)

(assert (=> b!580791 (= lt!264772 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17420 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580792 () Bool)

(declare-fun res!368612 () Bool)

(assert (=> b!580792 (=> (not res!368612) (not e!333447))))

(declare-datatypes ((List!11461 0))(
  ( (Nil!11458) (Cons!11457 (h!12502 (_ BitVec 64)) (t!17689 List!11461)) )
))
(declare-fun arrayNoDuplicates!0 (array!36291 (_ BitVec 32) List!11461) Bool)

(assert (=> b!580792 (= res!368612 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11458))))

(declare-fun b!580793 () Bool)

(declare-fun res!368608 () Bool)

(assert (=> b!580793 (=> (not res!368608) (not e!333447))))

(assert (=> b!580793 (= res!368608 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17420 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17420 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580794 () Bool)

(declare-fun res!368607 () Bool)

(assert (=> b!580794 (=> (not res!368607) (not e!333446))))

(declare-fun arrayContainsKey!0 (array!36291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580794 (= res!368607 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580795 () Bool)

(declare-fun res!368609 () Bool)

(assert (=> b!580795 (=> (not res!368609) (not e!333447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36291 (_ BitVec 32)) Bool)

(assert (=> b!580795 (= res!368609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580796 () Bool)

(declare-fun res!368605 () Bool)

(assert (=> b!580796 (=> (not res!368605) (not e!333446))))

(assert (=> b!580796 (= res!368605 (and (= (size!17784 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17784 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17784 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368610 () Bool)

(assert (=> start!53390 (=> (not res!368610) (not e!333446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53390 (= res!368610 (validMask!0 mask!3053))))

(assert (=> start!53390 e!333446))

(assert (=> start!53390 true))

(declare-fun array_inv!13216 (array!36291) Bool)

(assert (=> start!53390 (array_inv!13216 a!2986)))

(assert (= (and start!53390 res!368610) b!580796))

(assert (= (and b!580796 res!368605) b!580788))

(assert (= (and b!580788 res!368604) b!580790))

(assert (= (and b!580790 res!368606) b!580794))

(assert (= (and b!580794 res!368607) b!580789))

(assert (= (and b!580789 res!368611) b!580795))

(assert (= (and b!580795 res!368609) b!580792))

(assert (= (and b!580792 res!368612) b!580793))

(assert (= (and b!580793 res!368608) b!580791))

(declare-fun m!559355 () Bool)

(assert (=> b!580793 m!559355))

(declare-fun m!559357 () Bool)

(assert (=> b!580793 m!559357))

(declare-fun m!559359 () Bool)

(assert (=> b!580793 m!559359))

(declare-fun m!559361 () Bool)

(assert (=> b!580790 m!559361))

(declare-fun m!559363 () Bool)

(assert (=> b!580792 m!559363))

(declare-fun m!559365 () Bool)

(assert (=> b!580794 m!559365))

(declare-fun m!559367 () Bool)

(assert (=> b!580789 m!559367))

(declare-fun m!559369 () Bool)

(assert (=> b!580795 m!559369))

(declare-fun m!559371 () Bool)

(assert (=> start!53390 m!559371))

(declare-fun m!559373 () Bool)

(assert (=> start!53390 m!559373))

(declare-fun m!559375 () Bool)

(assert (=> b!580788 m!559375))

(assert (=> b!580788 m!559375))

(declare-fun m!559377 () Bool)

(assert (=> b!580788 m!559377))

(assert (=> b!580791 m!559375))

(assert (=> b!580791 m!559375))

(declare-fun m!559379 () Bool)

(assert (=> b!580791 m!559379))

(push 1)

(assert (not b!580792))

(assert (not b!580788))

(assert (not b!580789))

(assert (not b!580791))

(assert (not start!53390))

(assert (not b!580795))

(assert (not b!580790))

(assert (not b!580794))

(check-sat)

(pop 1)

