; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53436 () Bool)

(assert start!53436)

(declare-fun b!580934 () Bool)

(declare-fun res!368649 () Bool)

(declare-fun e!333556 () Bool)

(assert (=> b!580934 (=> (not res!368649) (not e!333556))))

(declare-datatypes ((array!36282 0))(
  ( (array!36283 (arr!17413 (Array (_ BitVec 32) (_ BitVec 64))) (size!17777 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36282)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36282 (_ BitVec 32)) Bool)

(assert (=> b!580934 (= res!368649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580935 () Bool)

(declare-fun res!368651 () Bool)

(declare-fun e!333557 () Bool)

(assert (=> b!580935 (=> (not res!368651) (not e!333557))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580935 (= res!368651 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580936 () Bool)

(declare-fun res!368648 () Bool)

(assert (=> b!580936 (=> (not res!368648) (not e!333556))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580936 (= res!368648 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17413 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17413 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580937 () Bool)

(assert (=> b!580937 (= e!333557 e!333556)))

(declare-fun res!368652 () Bool)

(assert (=> b!580937 (=> (not res!368652) (not e!333556))))

(declare-datatypes ((SeekEntryResult!5809 0))(
  ( (MissingZero!5809 (index!25463 (_ BitVec 32))) (Found!5809 (index!25464 (_ BitVec 32))) (Intermediate!5809 (undefined!6621 Bool) (index!25465 (_ BitVec 32)) (x!54489 (_ BitVec 32))) (Undefined!5809) (MissingVacant!5809 (index!25466 (_ BitVec 32))) )
))
(declare-fun lt!264870 () SeekEntryResult!5809)

(assert (=> b!580937 (= res!368652 (or (= lt!264870 (MissingZero!5809 i!1108)) (= lt!264870 (MissingVacant!5809 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36282 (_ BitVec 32)) SeekEntryResult!5809)

(assert (=> b!580937 (= lt!264870 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580938 () Bool)

(assert (=> b!580938 (= e!333556 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264871 () SeekEntryResult!5809)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36282 (_ BitVec 32)) SeekEntryResult!5809)

(assert (=> b!580938 (= lt!264871 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17413 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!368646 () Bool)

(assert (=> start!53436 (=> (not res!368646) (not e!333557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53436 (= res!368646 (validMask!0 mask!3053))))

(assert (=> start!53436 e!333557))

(assert (=> start!53436 true))

(declare-fun array_inv!13272 (array!36282) Bool)

(assert (=> start!53436 (array_inv!13272 a!2986)))

(declare-fun b!580939 () Bool)

(declare-fun res!368645 () Bool)

(assert (=> b!580939 (=> (not res!368645) (not e!333557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580939 (= res!368645 (validKeyInArray!0 (select (arr!17413 a!2986) j!136)))))

(declare-fun b!580940 () Bool)

(declare-fun res!368647 () Bool)

(assert (=> b!580940 (=> (not res!368647) (not e!333557))))

(assert (=> b!580940 (= res!368647 (validKeyInArray!0 k0!1786))))

(declare-fun b!580941 () Bool)

(declare-fun res!368650 () Bool)

(assert (=> b!580941 (=> (not res!368650) (not e!333557))))

(assert (=> b!580941 (= res!368650 (and (= (size!17777 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17777 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17777 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580942 () Bool)

(declare-fun res!368653 () Bool)

(assert (=> b!580942 (=> (not res!368653) (not e!333556))))

(declare-datatypes ((List!11361 0))(
  ( (Nil!11358) (Cons!11357 (h!12405 (_ BitVec 64)) (t!17581 List!11361)) )
))
(declare-fun arrayNoDuplicates!0 (array!36282 (_ BitVec 32) List!11361) Bool)

(assert (=> b!580942 (= res!368653 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11358))))

(assert (= (and start!53436 res!368646) b!580941))

(assert (= (and b!580941 res!368650) b!580939))

(assert (= (and b!580939 res!368645) b!580940))

(assert (= (and b!580940 res!368647) b!580935))

(assert (= (and b!580935 res!368651) b!580937))

(assert (= (and b!580937 res!368652) b!580934))

(assert (= (and b!580934 res!368649) b!580942))

(assert (= (and b!580942 res!368653) b!580936))

(assert (= (and b!580936 res!368648) b!580938))

(declare-fun m!559655 () Bool)

(assert (=> b!580939 m!559655))

(assert (=> b!580939 m!559655))

(declare-fun m!559657 () Bool)

(assert (=> b!580939 m!559657))

(declare-fun m!559659 () Bool)

(assert (=> b!580940 m!559659))

(declare-fun m!559661 () Bool)

(assert (=> b!580936 m!559661))

(declare-fun m!559663 () Bool)

(assert (=> b!580936 m!559663))

(declare-fun m!559665 () Bool)

(assert (=> b!580936 m!559665))

(declare-fun m!559667 () Bool)

(assert (=> b!580935 m!559667))

(declare-fun m!559669 () Bool)

(assert (=> b!580942 m!559669))

(declare-fun m!559671 () Bool)

(assert (=> start!53436 m!559671))

(declare-fun m!559673 () Bool)

(assert (=> start!53436 m!559673))

(declare-fun m!559675 () Bool)

(assert (=> b!580934 m!559675))

(assert (=> b!580938 m!559655))

(assert (=> b!580938 m!559655))

(declare-fun m!559677 () Bool)

(assert (=> b!580938 m!559677))

(declare-fun m!559679 () Bool)

(assert (=> b!580937 m!559679))

(check-sat (not b!580939) (not start!53436) (not b!580938) (not b!580942) (not b!580940) (not b!580934) (not b!580937) (not b!580935))
(check-sat)
