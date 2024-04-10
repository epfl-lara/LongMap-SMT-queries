; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53658 () Bool)

(assert start!53658)

(declare-fun b!584754 () Bool)

(declare-fun e!334756 () Bool)

(declare-fun e!334758 () Bool)

(assert (=> b!584754 (= e!334756 e!334758)))

(declare-fun res!372572 () Bool)

(assert (=> b!584754 (=> (not res!372572) (not e!334758))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!265654 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!584754 (= res!372572 (and (bvsge lt!265654 #b00000000000000000000000000000000) (bvslt lt!265654 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584754 (= lt!265654 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584755 () Bool)

(declare-fun res!372573 () Bool)

(declare-fun e!334755 () Bool)

(assert (=> b!584755 (=> (not res!372573) (not e!334755))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36559 0))(
  ( (array!36560 (arr!17554 (Array (_ BitVec 32) (_ BitVec 64))) (size!17918 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36559)

(assert (=> b!584755 (= res!372573 (and (= (size!17918 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17918 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17918 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584756 () Bool)

(assert (=> b!584756 (= e!334755 e!334756)))

(declare-fun res!372580 () Bool)

(assert (=> b!584756 (=> (not res!372580) (not e!334756))))

(declare-datatypes ((SeekEntryResult!5994 0))(
  ( (MissingZero!5994 (index!26203 (_ BitVec 32))) (Found!5994 (index!26204 (_ BitVec 32))) (Intermediate!5994 (undefined!6806 Bool) (index!26205 (_ BitVec 32)) (x!55031 (_ BitVec 32))) (Undefined!5994) (MissingVacant!5994 (index!26206 (_ BitVec 32))) )
))
(declare-fun lt!265652 () SeekEntryResult!5994)

(assert (=> b!584756 (= res!372580 (or (= lt!265652 (MissingZero!5994 i!1108)) (= lt!265652 (MissingVacant!5994 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36559 (_ BitVec 32)) SeekEntryResult!5994)

(assert (=> b!584756 (= lt!265652 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!372579 () Bool)

(assert (=> start!53658 (=> (not res!372579) (not e!334755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53658 (= res!372579 (validMask!0 mask!3053))))

(assert (=> start!53658 e!334755))

(assert (=> start!53658 true))

(declare-fun array_inv!13350 (array!36559) Bool)

(assert (=> start!53658 (array_inv!13350 a!2986)))

(declare-fun b!584757 () Bool)

(declare-fun res!372571 () Bool)

(assert (=> b!584757 (=> (not res!372571) (not e!334755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584757 (= res!372571 (validKeyInArray!0 (select (arr!17554 a!2986) j!136)))))

(declare-fun b!584758 () Bool)

(assert (=> b!584758 (= e!334758 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265653 () SeekEntryResult!5994)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36559 (_ BitVec 32)) SeekEntryResult!5994)

(assert (=> b!584758 (= lt!265653 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265654 vacantSpotIndex!68 (select (arr!17554 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584759 () Bool)

(declare-fun res!372575 () Bool)

(assert (=> b!584759 (=> (not res!372575) (not e!334755))))

(assert (=> b!584759 (= res!372575 (validKeyInArray!0 k0!1786))))

(declare-fun b!584760 () Bool)

(declare-fun res!372570 () Bool)

(assert (=> b!584760 (=> (not res!372570) (not e!334756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36559 (_ BitVec 32)) Bool)

(assert (=> b!584760 (= res!372570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584761 () Bool)

(declare-fun res!372576 () Bool)

(assert (=> b!584761 (=> (not res!372576) (not e!334756))))

(assert (=> b!584761 (= res!372576 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17554 a!2986) index!984) (select (arr!17554 a!2986) j!136))) (not (= (select (arr!17554 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584762 () Bool)

(declare-fun res!372574 () Bool)

(assert (=> b!584762 (=> (not res!372574) (not e!334755))))

(declare-fun arrayContainsKey!0 (array!36559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584762 (= res!372574 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584763 () Bool)

(declare-fun res!372581 () Bool)

(assert (=> b!584763 (=> (not res!372581) (not e!334756))))

(declare-datatypes ((List!11595 0))(
  ( (Nil!11592) (Cons!11591 (h!12636 (_ BitVec 64)) (t!17823 List!11595)) )
))
(declare-fun arrayNoDuplicates!0 (array!36559 (_ BitVec 32) List!11595) Bool)

(assert (=> b!584763 (= res!372581 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11592))))

(declare-fun b!584764 () Bool)

(declare-fun res!372578 () Bool)

(assert (=> b!584764 (=> (not res!372578) (not e!334756))))

(assert (=> b!584764 (= res!372578 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17554 a!2986) j!136) a!2986 mask!3053) (Found!5994 j!136)))))

(declare-fun b!584765 () Bool)

(declare-fun res!372577 () Bool)

(assert (=> b!584765 (=> (not res!372577) (not e!334756))))

(assert (=> b!584765 (= res!372577 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17554 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17554 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53658 res!372579) b!584755))

(assert (= (and b!584755 res!372573) b!584757))

(assert (= (and b!584757 res!372571) b!584759))

(assert (= (and b!584759 res!372575) b!584762))

(assert (= (and b!584762 res!372574) b!584756))

(assert (= (and b!584756 res!372580) b!584760))

(assert (= (and b!584760 res!372570) b!584763))

(assert (= (and b!584763 res!372581) b!584765))

(assert (= (and b!584765 res!372577) b!584764))

(assert (= (and b!584764 res!372578) b!584761))

(assert (= (and b!584761 res!372576) b!584754))

(assert (= (and b!584754 res!372572) b!584758))

(declare-fun m!563073 () Bool)

(assert (=> b!584760 m!563073))

(declare-fun m!563075 () Bool)

(assert (=> b!584765 m!563075))

(declare-fun m!563077 () Bool)

(assert (=> b!584765 m!563077))

(declare-fun m!563079 () Bool)

(assert (=> b!584765 m!563079))

(declare-fun m!563081 () Bool)

(assert (=> b!584763 m!563081))

(declare-fun m!563083 () Bool)

(assert (=> b!584758 m!563083))

(assert (=> b!584758 m!563083))

(declare-fun m!563085 () Bool)

(assert (=> b!584758 m!563085))

(assert (=> b!584757 m!563083))

(assert (=> b!584757 m!563083))

(declare-fun m!563087 () Bool)

(assert (=> b!584757 m!563087))

(assert (=> b!584764 m!563083))

(assert (=> b!584764 m!563083))

(declare-fun m!563089 () Bool)

(assert (=> b!584764 m!563089))

(declare-fun m!563091 () Bool)

(assert (=> b!584761 m!563091))

(assert (=> b!584761 m!563083))

(declare-fun m!563093 () Bool)

(assert (=> b!584754 m!563093))

(declare-fun m!563095 () Bool)

(assert (=> b!584756 m!563095))

(declare-fun m!563097 () Bool)

(assert (=> start!53658 m!563097))

(declare-fun m!563099 () Bool)

(assert (=> start!53658 m!563099))

(declare-fun m!563101 () Bool)

(assert (=> b!584759 m!563101))

(declare-fun m!563103 () Bool)

(assert (=> b!584762 m!563103))

(check-sat (not b!584759) (not b!584764) (not b!584758) (not b!584754) (not b!584760) (not b!584763) (not b!584757) (not start!53658) (not b!584756) (not b!584762))
(check-sat)
