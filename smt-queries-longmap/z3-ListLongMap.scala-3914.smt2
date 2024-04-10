; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53496 () Bool)

(assert start!53496)

(declare-fun b!582246 () Bool)

(declare-fun res!370067 () Bool)

(declare-fun e!333922 () Bool)

(assert (=> b!582246 (=> (not res!370067) (not e!333922))))

(declare-datatypes ((array!36397 0))(
  ( (array!36398 (arr!17473 (Array (_ BitVec 32) (_ BitVec 64))) (size!17837 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36397)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36397 (_ BitVec 32)) Bool)

(assert (=> b!582246 (= res!370067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582247 () Bool)

(declare-fun res!370068 () Bool)

(declare-fun e!333924 () Bool)

(assert (=> b!582247 (=> (not res!370068) (not e!333924))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582247 (= res!370068 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582248 () Bool)

(assert (=> b!582248 (= e!333924 e!333922)))

(declare-fun res!370066 () Bool)

(assert (=> b!582248 (=> (not res!370066) (not e!333922))))

(declare-datatypes ((SeekEntryResult!5913 0))(
  ( (MissingZero!5913 (index!25879 (_ BitVec 32))) (Found!5913 (index!25880 (_ BitVec 32))) (Intermediate!5913 (undefined!6725 Bool) (index!25881 (_ BitVec 32)) (x!54734 (_ BitVec 32))) (Undefined!5913) (MissingVacant!5913 (index!25882 (_ BitVec 32))) )
))
(declare-fun lt!265071 () SeekEntryResult!5913)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582248 (= res!370066 (or (= lt!265071 (MissingZero!5913 i!1108)) (= lt!265071 (MissingVacant!5913 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36397 (_ BitVec 32)) SeekEntryResult!5913)

(assert (=> b!582248 (= lt!265071 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582249 () Bool)

(declare-fun res!370070 () Bool)

(assert (=> b!582249 (=> (not res!370070) (not e!333922))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582249 (= res!370070 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17473 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17473 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370063 () Bool)

(assert (=> start!53496 (=> (not res!370063) (not e!333924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53496 (= res!370063 (validMask!0 mask!3053))))

(assert (=> start!53496 e!333924))

(assert (=> start!53496 true))

(declare-fun array_inv!13269 (array!36397) Bool)

(assert (=> start!53496 (array_inv!13269 a!2986)))

(declare-fun b!582250 () Bool)

(declare-fun res!370064 () Bool)

(assert (=> b!582250 (=> (not res!370064) (not e!333922))))

(declare-datatypes ((List!11514 0))(
  ( (Nil!11511) (Cons!11510 (h!12555 (_ BitVec 64)) (t!17742 List!11514)) )
))
(declare-fun arrayNoDuplicates!0 (array!36397 (_ BitVec 32) List!11514) Bool)

(assert (=> b!582250 (= res!370064 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11511))))

(declare-fun b!582251 () Bool)

(declare-fun res!370069 () Bool)

(assert (=> b!582251 (=> (not res!370069) (not e!333924))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582251 (= res!370069 (validKeyInArray!0 (select (arr!17473 a!2986) j!136)))))

(declare-fun b!582252 () Bool)

(assert (=> b!582252 (= e!333922 false)))

(declare-fun lt!265072 () SeekEntryResult!5913)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36397 (_ BitVec 32)) SeekEntryResult!5913)

(assert (=> b!582252 (= lt!265072 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17473 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582253 () Bool)

(declare-fun res!370065 () Bool)

(assert (=> b!582253 (=> (not res!370065) (not e!333924))))

(assert (=> b!582253 (= res!370065 (and (= (size!17837 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17837 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17837 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582254 () Bool)

(declare-fun res!370062 () Bool)

(assert (=> b!582254 (=> (not res!370062) (not e!333924))))

(assert (=> b!582254 (= res!370062 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53496 res!370063) b!582253))

(assert (= (and b!582253 res!370065) b!582251))

(assert (= (and b!582251 res!370069) b!582254))

(assert (= (and b!582254 res!370062) b!582247))

(assert (= (and b!582247 res!370068) b!582248))

(assert (= (and b!582248 res!370066) b!582246))

(assert (= (and b!582246 res!370067) b!582250))

(assert (= (and b!582250 res!370064) b!582249))

(assert (= (and b!582249 res!370070) b!582252))

(declare-fun m!560757 () Bool)

(assert (=> start!53496 m!560757))

(declare-fun m!560759 () Bool)

(assert (=> start!53496 m!560759))

(declare-fun m!560761 () Bool)

(assert (=> b!582248 m!560761))

(declare-fun m!560763 () Bool)

(assert (=> b!582250 m!560763))

(declare-fun m!560765 () Bool)

(assert (=> b!582247 m!560765))

(declare-fun m!560767 () Bool)

(assert (=> b!582246 m!560767))

(declare-fun m!560769 () Bool)

(assert (=> b!582251 m!560769))

(assert (=> b!582251 m!560769))

(declare-fun m!560771 () Bool)

(assert (=> b!582251 m!560771))

(declare-fun m!560773 () Bool)

(assert (=> b!582249 m!560773))

(declare-fun m!560775 () Bool)

(assert (=> b!582249 m!560775))

(declare-fun m!560777 () Bool)

(assert (=> b!582249 m!560777))

(assert (=> b!582252 m!560769))

(assert (=> b!582252 m!560769))

(declare-fun m!560779 () Bool)

(assert (=> b!582252 m!560779))

(declare-fun m!560781 () Bool)

(assert (=> b!582254 m!560781))

(check-sat (not b!582252) (not b!582254) (not b!582250) (not start!53496) (not b!582247) (not b!582248) (not b!582251) (not b!582246))
