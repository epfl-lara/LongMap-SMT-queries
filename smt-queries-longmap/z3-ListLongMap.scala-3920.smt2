; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53532 () Bool)

(assert start!53532)

(declare-fun b!582732 () Bool)

(declare-fun res!370554 () Bool)

(declare-fun e!334085 () Bool)

(assert (=> b!582732 (=> (not res!370554) (not e!334085))))

(declare-datatypes ((array!36433 0))(
  ( (array!36434 (arr!17491 (Array (_ BitVec 32) (_ BitVec 64))) (size!17855 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36433)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36433 (_ BitVec 32)) Bool)

(assert (=> b!582732 (= res!370554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582733 () Bool)

(declare-fun e!334084 () Bool)

(assert (=> b!582733 (= e!334084 e!334085)))

(declare-fun res!370550 () Bool)

(assert (=> b!582733 (=> (not res!370550) (not e!334085))))

(declare-datatypes ((SeekEntryResult!5931 0))(
  ( (MissingZero!5931 (index!25951 (_ BitVec 32))) (Found!5931 (index!25952 (_ BitVec 32))) (Intermediate!5931 (undefined!6743 Bool) (index!25953 (_ BitVec 32)) (x!54800 (_ BitVec 32))) (Undefined!5931) (MissingVacant!5931 (index!25954 (_ BitVec 32))) )
))
(declare-fun lt!265179 () SeekEntryResult!5931)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582733 (= res!370550 (or (= lt!265179 (MissingZero!5931 i!1108)) (= lt!265179 (MissingVacant!5931 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36433 (_ BitVec 32)) SeekEntryResult!5931)

(assert (=> b!582733 (= lt!265179 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!370552 () Bool)

(assert (=> start!53532 (=> (not res!370552) (not e!334084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53532 (= res!370552 (validMask!0 mask!3053))))

(assert (=> start!53532 e!334084))

(assert (=> start!53532 true))

(declare-fun array_inv!13287 (array!36433) Bool)

(assert (=> start!53532 (array_inv!13287 a!2986)))

(declare-fun b!582734 () Bool)

(declare-fun res!370556 () Bool)

(assert (=> b!582734 (=> (not res!370556) (not e!334085))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582734 (= res!370556 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17491 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17491 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582735 () Bool)

(declare-fun res!370549 () Bool)

(assert (=> b!582735 (=> (not res!370549) (not e!334084))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582735 (= res!370549 (and (= (size!17855 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17855 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17855 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582736 () Bool)

(declare-fun res!370555 () Bool)

(assert (=> b!582736 (=> (not res!370555) (not e!334084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582736 (= res!370555 (validKeyInArray!0 k0!1786))))

(declare-fun b!582737 () Bool)

(declare-fun res!370551 () Bool)

(assert (=> b!582737 (=> (not res!370551) (not e!334085))))

(declare-datatypes ((List!11532 0))(
  ( (Nil!11529) (Cons!11528 (h!12573 (_ BitVec 64)) (t!17760 List!11532)) )
))
(declare-fun arrayNoDuplicates!0 (array!36433 (_ BitVec 32) List!11532) Bool)

(assert (=> b!582737 (= res!370551 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11529))))

(declare-fun b!582738 () Bool)

(declare-fun res!370553 () Bool)

(assert (=> b!582738 (=> (not res!370553) (not e!334084))))

(declare-fun arrayContainsKey!0 (array!36433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582738 (= res!370553 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582739 () Bool)

(declare-fun res!370548 () Bool)

(assert (=> b!582739 (=> (not res!370548) (not e!334084))))

(assert (=> b!582739 (= res!370548 (validKeyInArray!0 (select (arr!17491 a!2986) j!136)))))

(declare-fun b!582740 () Bool)

(assert (=> b!582740 (= e!334085 false)))

(declare-fun lt!265180 () SeekEntryResult!5931)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36433 (_ BitVec 32)) SeekEntryResult!5931)

(assert (=> b!582740 (= lt!265180 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17491 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53532 res!370552) b!582735))

(assert (= (and b!582735 res!370549) b!582739))

(assert (= (and b!582739 res!370548) b!582736))

(assert (= (and b!582736 res!370555) b!582738))

(assert (= (and b!582738 res!370553) b!582733))

(assert (= (and b!582733 res!370550) b!582732))

(assert (= (and b!582732 res!370554) b!582737))

(assert (= (and b!582737 res!370551) b!582734))

(assert (= (and b!582734 res!370556) b!582740))

(declare-fun m!561225 () Bool)

(assert (=> b!582737 m!561225))

(declare-fun m!561227 () Bool)

(assert (=> b!582739 m!561227))

(assert (=> b!582739 m!561227))

(declare-fun m!561229 () Bool)

(assert (=> b!582739 m!561229))

(declare-fun m!561231 () Bool)

(assert (=> b!582734 m!561231))

(declare-fun m!561233 () Bool)

(assert (=> b!582734 m!561233))

(declare-fun m!561235 () Bool)

(assert (=> b!582734 m!561235))

(declare-fun m!561237 () Bool)

(assert (=> b!582733 m!561237))

(declare-fun m!561239 () Bool)

(assert (=> b!582736 m!561239))

(declare-fun m!561241 () Bool)

(assert (=> b!582738 m!561241))

(assert (=> b!582740 m!561227))

(assert (=> b!582740 m!561227))

(declare-fun m!561243 () Bool)

(assert (=> b!582740 m!561243))

(declare-fun m!561245 () Bool)

(assert (=> b!582732 m!561245))

(declare-fun m!561247 () Bool)

(assert (=> start!53532 m!561247))

(declare-fun m!561249 () Bool)

(assert (=> start!53532 m!561249))

(check-sat (not b!582737) (not b!582739) (not b!582738) (not start!53532) (not b!582736) (not b!582732) (not b!582733) (not b!582740))
