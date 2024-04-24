; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53664 () Bool)

(assert start!53664)

(declare-fun b!584171 () Bool)

(declare-fun res!371888 () Bool)

(declare-fun e!334621 () Bool)

(assert (=> b!584171 (=> (not res!371888) (not e!334621))))

(declare-datatypes ((array!36510 0))(
  ( (array!36511 (arr!17527 (Array (_ BitVec 32) (_ BitVec 64))) (size!17891 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36510)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584171 (= res!371888 (validKeyInArray!0 (select (arr!17527 a!2986) j!136)))))

(declare-fun b!584172 () Bool)

(declare-fun res!371889 () Bool)

(declare-fun e!334622 () Bool)

(assert (=> b!584172 (=> (not res!371889) (not e!334622))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5923 0))(
  ( (MissingZero!5923 (index!25919 (_ BitVec 32))) (Found!5923 (index!25920 (_ BitVec 32))) (Intermediate!5923 (undefined!6735 Bool) (index!25921 (_ BitVec 32)) (x!54907 (_ BitVec 32))) (Undefined!5923) (MissingVacant!5923 (index!25922 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36510 (_ BitVec 32)) SeekEntryResult!5923)

(assert (=> b!584172 (= res!371889 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17527 a!2986) j!136) a!2986 mask!3053) (Found!5923 j!136)))))

(declare-fun b!584173 () Bool)

(declare-fun res!371885 () Bool)

(assert (=> b!584173 (=> (not res!371885) (not e!334622))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!584173 (= res!371885 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17527 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17527 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584174 () Bool)

(declare-fun e!334620 () Bool)

(assert (=> b!584174 (= e!334622 e!334620)))

(declare-fun res!371882 () Bool)

(assert (=> b!584174 (=> (not res!371882) (not e!334620))))

(declare-fun lt!265557 () (_ BitVec 32))

(assert (=> b!584174 (= res!371882 (and (bvsge lt!265557 #b00000000000000000000000000000000) (bvslt lt!265557 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584174 (= lt!265557 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584175 () Bool)

(assert (=> b!584175 (= e!334621 e!334622)))

(declare-fun res!371884 () Bool)

(assert (=> b!584175 (=> (not res!371884) (not e!334622))))

(declare-fun lt!265558 () SeekEntryResult!5923)

(assert (=> b!584175 (= res!371884 (or (= lt!265558 (MissingZero!5923 i!1108)) (= lt!265558 (MissingVacant!5923 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36510 (_ BitVec 32)) SeekEntryResult!5923)

(assert (=> b!584175 (= lt!265558 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584176 () Bool)

(assert (=> b!584176 (= e!334620 false)))

(declare-fun lt!265556 () SeekEntryResult!5923)

(assert (=> b!584176 (= lt!265556 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265557 vacantSpotIndex!68 (select (arr!17527 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584177 () Bool)

(declare-fun res!371893 () Bool)

(assert (=> b!584177 (=> (not res!371893) (not e!334621))))

(assert (=> b!584177 (= res!371893 (validKeyInArray!0 k0!1786))))

(declare-fun b!584178 () Bool)

(declare-fun res!371890 () Bool)

(assert (=> b!584178 (=> (not res!371890) (not e!334622))))

(assert (=> b!584178 (= res!371890 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17527 a!2986) index!984) (select (arr!17527 a!2986) j!136))) (not (= (select (arr!17527 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584179 () Bool)

(declare-fun res!371891 () Bool)

(assert (=> b!584179 (=> (not res!371891) (not e!334622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36510 (_ BitVec 32)) Bool)

(assert (=> b!584179 (= res!371891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!371892 () Bool)

(assert (=> start!53664 (=> (not res!371892) (not e!334621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53664 (= res!371892 (validMask!0 mask!3053))))

(assert (=> start!53664 e!334621))

(assert (=> start!53664 true))

(declare-fun array_inv!13386 (array!36510) Bool)

(assert (=> start!53664 (array_inv!13386 a!2986)))

(declare-fun b!584180 () Bool)

(declare-fun res!371883 () Bool)

(assert (=> b!584180 (=> (not res!371883) (not e!334621))))

(declare-fun arrayContainsKey!0 (array!36510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584180 (= res!371883 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584181 () Bool)

(declare-fun res!371886 () Bool)

(assert (=> b!584181 (=> (not res!371886) (not e!334622))))

(declare-datatypes ((List!11475 0))(
  ( (Nil!11472) (Cons!11471 (h!12519 (_ BitVec 64)) (t!17695 List!11475)) )
))
(declare-fun arrayNoDuplicates!0 (array!36510 (_ BitVec 32) List!11475) Bool)

(assert (=> b!584181 (= res!371886 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11472))))

(declare-fun b!584182 () Bool)

(declare-fun res!371887 () Bool)

(assert (=> b!584182 (=> (not res!371887) (not e!334621))))

(assert (=> b!584182 (= res!371887 (and (= (size!17891 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17891 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17891 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53664 res!371892) b!584182))

(assert (= (and b!584182 res!371887) b!584171))

(assert (= (and b!584171 res!371888) b!584177))

(assert (= (and b!584177 res!371893) b!584180))

(assert (= (and b!584180 res!371883) b!584175))

(assert (= (and b!584175 res!371884) b!584179))

(assert (= (and b!584179 res!371891) b!584181))

(assert (= (and b!584181 res!371886) b!584173))

(assert (= (and b!584173 res!371885) b!584172))

(assert (= (and b!584172 res!371889) b!584178))

(assert (= (and b!584178 res!371890) b!584174))

(assert (= (and b!584174 res!371882) b!584176))

(declare-fun m!562727 () Bool)

(assert (=> b!584181 m!562727))

(declare-fun m!562729 () Bool)

(assert (=> b!584171 m!562729))

(assert (=> b!584171 m!562729))

(declare-fun m!562731 () Bool)

(assert (=> b!584171 m!562731))

(declare-fun m!562733 () Bool)

(assert (=> start!53664 m!562733))

(declare-fun m!562735 () Bool)

(assert (=> start!53664 m!562735))

(assert (=> b!584176 m!562729))

(assert (=> b!584176 m!562729))

(declare-fun m!562737 () Bool)

(assert (=> b!584176 m!562737))

(declare-fun m!562739 () Bool)

(assert (=> b!584179 m!562739))

(declare-fun m!562741 () Bool)

(assert (=> b!584178 m!562741))

(assert (=> b!584178 m!562729))

(assert (=> b!584172 m!562729))

(assert (=> b!584172 m!562729))

(declare-fun m!562743 () Bool)

(assert (=> b!584172 m!562743))

(declare-fun m!562745 () Bool)

(assert (=> b!584180 m!562745))

(declare-fun m!562747 () Bool)

(assert (=> b!584173 m!562747))

(declare-fun m!562749 () Bool)

(assert (=> b!584173 m!562749))

(declare-fun m!562751 () Bool)

(assert (=> b!584173 m!562751))

(declare-fun m!562753 () Bool)

(assert (=> b!584177 m!562753))

(declare-fun m!562755 () Bool)

(assert (=> b!584174 m!562755))

(declare-fun m!562757 () Bool)

(assert (=> b!584175 m!562757))

(check-sat (not b!584174) (not b!584171) (not b!584179) (not start!53664) (not b!584177) (not b!584181) (not b!584175) (not b!584172) (not b!584176) (not b!584180))
(check-sat)
