; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53082 () Bool)

(assert start!53082)

(declare-fun b!577621 () Bool)

(declare-fun e!332246 () Bool)

(declare-datatypes ((array!36045 0))(
  ( (array!36046 (arr!17299 (Array (_ BitVec 32) (_ BitVec 64))) (size!17663 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36045)

(assert (=> b!577621 (= e!332246 (bvsgt #b00000000000000000000000000000000 (size!17663 a!2986)))))

(declare-fun b!577622 () Bool)

(declare-fun res!365554 () Bool)

(declare-fun e!332245 () Bool)

(assert (=> b!577622 (=> (not res!365554) (not e!332245))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577622 (= res!365554 (validKeyInArray!0 k0!1786))))

(declare-fun b!577623 () Bool)

(declare-fun res!365550 () Bool)

(assert (=> b!577623 (=> (not res!365550) (not e!332246))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36045 (_ BitVec 32)) Bool)

(assert (=> b!577623 (= res!365550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577624 () Bool)

(assert (=> b!577624 (= e!332245 e!332246)))

(declare-fun res!365551 () Bool)

(assert (=> b!577624 (=> (not res!365551) (not e!332246))))

(declare-datatypes ((SeekEntryResult!5695 0))(
  ( (MissingZero!5695 (index!25007 (_ BitVec 32))) (Found!5695 (index!25008 (_ BitVec 32))) (Intermediate!5695 (undefined!6507 Bool) (index!25009 (_ BitVec 32)) (x!54071 (_ BitVec 32))) (Undefined!5695) (MissingVacant!5695 (index!25010 (_ BitVec 32))) )
))
(declare-fun lt!264073 () SeekEntryResult!5695)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577624 (= res!365551 (or (= lt!264073 (MissingZero!5695 i!1108)) (= lt!264073 (MissingVacant!5695 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36045 (_ BitVec 32)) SeekEntryResult!5695)

(assert (=> b!577624 (= lt!264073 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577625 () Bool)

(declare-fun res!365553 () Bool)

(assert (=> b!577625 (=> (not res!365553) (not e!332245))))

(declare-fun arrayContainsKey!0 (array!36045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577625 (= res!365553 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!365548 () Bool)

(assert (=> start!53082 (=> (not res!365548) (not e!332245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53082 (= res!365548 (validMask!0 mask!3053))))

(assert (=> start!53082 e!332245))

(assert (=> start!53082 true))

(declare-fun array_inv!13158 (array!36045) Bool)

(assert (=> start!53082 (array_inv!13158 a!2986)))

(declare-fun b!577626 () Bool)

(declare-fun res!365552 () Bool)

(assert (=> b!577626 (=> (not res!365552) (not e!332245))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577626 (= res!365552 (validKeyInArray!0 (select (arr!17299 a!2986) j!136)))))

(declare-fun b!577627 () Bool)

(declare-fun res!365549 () Bool)

(assert (=> b!577627 (=> (not res!365549) (not e!332245))))

(assert (=> b!577627 (= res!365549 (and (= (size!17663 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17663 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17663 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53082 res!365548) b!577627))

(assert (= (and b!577627 res!365549) b!577626))

(assert (= (and b!577626 res!365552) b!577622))

(assert (= (and b!577622 res!365554) b!577625))

(assert (= (and b!577625 res!365553) b!577624))

(assert (= (and b!577624 res!365551) b!577623))

(assert (= (and b!577623 res!365550) b!577621))

(declare-fun m!556649 () Bool)

(assert (=> b!577622 m!556649))

(declare-fun m!556651 () Bool)

(assert (=> b!577624 m!556651))

(declare-fun m!556653 () Bool)

(assert (=> b!577625 m!556653))

(declare-fun m!556655 () Bool)

(assert (=> b!577623 m!556655))

(declare-fun m!556657 () Bool)

(assert (=> b!577626 m!556657))

(assert (=> b!577626 m!556657))

(declare-fun m!556659 () Bool)

(assert (=> b!577626 m!556659))

(declare-fun m!556661 () Bool)

(assert (=> start!53082 m!556661))

(declare-fun m!556663 () Bool)

(assert (=> start!53082 m!556663))

(check-sat (not b!577623) (not b!577624) (not start!53082) (not b!577625) (not b!577626) (not b!577622))
(check-sat)
