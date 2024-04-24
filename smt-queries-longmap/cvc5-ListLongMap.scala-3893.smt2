; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53422 () Bool)

(assert start!53422)

(declare-fun b!580736 () Bool)

(declare-fun res!368451 () Bool)

(declare-fun e!333495 () Bool)

(assert (=> b!580736 (=> (not res!368451) (not e!333495))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36268 0))(
  ( (array!36269 (arr!17406 (Array (_ BitVec 32) (_ BitVec 64))) (size!17770 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36268)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580736 (= res!368451 (and (= (size!17770 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17770 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17770 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580737 () Bool)

(declare-fun res!368453 () Bool)

(assert (=> b!580737 (=> (not res!368453) (not e!333495))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580737 (= res!368453 (validKeyInArray!0 k!1786))))

(declare-fun b!580738 () Bool)

(declare-fun e!333493 () Bool)

(assert (=> b!580738 (= e!333493 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5802 0))(
  ( (MissingZero!5802 (index!25435 (_ BitVec 32))) (Found!5802 (index!25436 (_ BitVec 32))) (Intermediate!5802 (undefined!6614 Bool) (index!25437 (_ BitVec 32)) (x!54458 (_ BitVec 32))) (Undefined!5802) (MissingVacant!5802 (index!25438 (_ BitVec 32))) )
))
(declare-fun lt!264838 () SeekEntryResult!5802)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36268 (_ BitVec 32)) SeekEntryResult!5802)

(assert (=> b!580738 (= lt!264838 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17406 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580739 () Bool)

(declare-fun res!368454 () Bool)

(assert (=> b!580739 (=> (not res!368454) (not e!333493))))

(assert (=> b!580739 (= res!368454 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17406 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17406 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580740 () Bool)

(declare-fun res!368455 () Bool)

(assert (=> b!580740 (=> (not res!368455) (not e!333493))))

(declare-datatypes ((List!11354 0))(
  ( (Nil!11351) (Cons!11350 (h!12398 (_ BitVec 64)) (t!17574 List!11354)) )
))
(declare-fun arrayNoDuplicates!0 (array!36268 (_ BitVec 32) List!11354) Bool)

(assert (=> b!580740 (= res!368455 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11351))))

(declare-fun res!368450 () Bool)

(assert (=> start!53422 (=> (not res!368450) (not e!333495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53422 (= res!368450 (validMask!0 mask!3053))))

(assert (=> start!53422 e!333495))

(assert (=> start!53422 true))

(declare-fun array_inv!13265 (array!36268) Bool)

(assert (=> start!53422 (array_inv!13265 a!2986)))

(declare-fun b!580741 () Bool)

(assert (=> b!580741 (= e!333495 e!333493)))

(declare-fun res!368447 () Bool)

(assert (=> b!580741 (=> (not res!368447) (not e!333493))))

(declare-fun lt!264837 () SeekEntryResult!5802)

(assert (=> b!580741 (= res!368447 (or (= lt!264837 (MissingZero!5802 i!1108)) (= lt!264837 (MissingVacant!5802 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36268 (_ BitVec 32)) SeekEntryResult!5802)

(assert (=> b!580741 (= lt!264837 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580742 () Bool)

(declare-fun res!368452 () Bool)

(assert (=> b!580742 (=> (not res!368452) (not e!333495))))

(declare-fun arrayContainsKey!0 (array!36268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580742 (= res!368452 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580743 () Bool)

(declare-fun res!368449 () Bool)

(assert (=> b!580743 (=> (not res!368449) (not e!333493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36268 (_ BitVec 32)) Bool)

(assert (=> b!580743 (= res!368449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580744 () Bool)

(declare-fun res!368448 () Bool)

(assert (=> b!580744 (=> (not res!368448) (not e!333495))))

(assert (=> b!580744 (= res!368448 (validKeyInArray!0 (select (arr!17406 a!2986) j!136)))))

(assert (= (and start!53422 res!368450) b!580736))

(assert (= (and b!580736 res!368451) b!580744))

(assert (= (and b!580744 res!368448) b!580737))

(assert (= (and b!580737 res!368453) b!580742))

(assert (= (and b!580742 res!368452) b!580741))

(assert (= (and b!580741 res!368447) b!580743))

(assert (= (and b!580743 res!368449) b!580740))

(assert (= (and b!580740 res!368455) b!580739))

(assert (= (and b!580739 res!368454) b!580738))

(declare-fun m!559467 () Bool)

(assert (=> b!580743 m!559467))

(declare-fun m!559469 () Bool)

(assert (=> b!580738 m!559469))

(assert (=> b!580738 m!559469))

(declare-fun m!559471 () Bool)

(assert (=> b!580738 m!559471))

(declare-fun m!559473 () Bool)

(assert (=> b!580739 m!559473))

(declare-fun m!559475 () Bool)

(assert (=> b!580739 m!559475))

(declare-fun m!559477 () Bool)

(assert (=> b!580739 m!559477))

(declare-fun m!559479 () Bool)

(assert (=> b!580742 m!559479))

(assert (=> b!580744 m!559469))

(assert (=> b!580744 m!559469))

(declare-fun m!559481 () Bool)

(assert (=> b!580744 m!559481))

(declare-fun m!559483 () Bool)

(assert (=> b!580741 m!559483))

(declare-fun m!559485 () Bool)

(assert (=> start!53422 m!559485))

(declare-fun m!559487 () Bool)

(assert (=> start!53422 m!559487))

(declare-fun m!559489 () Bool)

(assert (=> b!580740 m!559489))

(declare-fun m!559491 () Bool)

(assert (=> b!580737 m!559491))

(push 1)

(assert (not b!580741))

(assert (not start!53422))

(assert (not b!580740))

(assert (not b!580737))

(assert (not b!580738))

(assert (not b!580743))

(assert (not b!580742))

(assert (not b!580744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

