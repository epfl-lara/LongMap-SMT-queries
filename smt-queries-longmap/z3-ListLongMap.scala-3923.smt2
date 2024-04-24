; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53598 () Bool)

(assert start!53598)

(declare-fun b!583148 () Bool)

(declare-fun e!334285 () Bool)

(declare-fun e!334287 () Bool)

(assert (=> b!583148 (= e!334285 e!334287)))

(declare-fun res!370860 () Bool)

(assert (=> b!583148 (=> (not res!370860) (not e!334287))))

(declare-datatypes ((SeekEntryResult!5890 0))(
  ( (MissingZero!5890 (index!25787 (_ BitVec 32))) (Found!5890 (index!25788 (_ BitVec 32))) (Intermediate!5890 (undefined!6702 Bool) (index!25789 (_ BitVec 32)) (x!54786 (_ BitVec 32))) (Undefined!5890) (MissingVacant!5890 (index!25790 (_ BitVec 32))) )
))
(declare-fun lt!265339 () SeekEntryResult!5890)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583148 (= res!370860 (or (= lt!265339 (MissingZero!5890 i!1108)) (= lt!265339 (MissingVacant!5890 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36444 0))(
  ( (array!36445 (arr!17494 (Array (_ BitVec 32) (_ BitVec 64))) (size!17858 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36444)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36444 (_ BitVec 32)) SeekEntryResult!5890)

(assert (=> b!583148 (= lt!265339 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!370867 () Bool)

(assert (=> start!53598 (=> (not res!370867) (not e!334285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53598 (= res!370867 (validMask!0 mask!3053))))

(assert (=> start!53598 e!334285))

(assert (=> start!53598 true))

(declare-fun array_inv!13353 (array!36444) Bool)

(assert (=> start!53598 (array_inv!13353 a!2986)))

(declare-fun b!583149 () Bool)

(declare-fun res!370862 () Bool)

(assert (=> b!583149 (=> (not res!370862) (not e!334285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583149 (= res!370862 (validKeyInArray!0 k0!1786))))

(declare-fun b!583150 () Bool)

(declare-fun res!370864 () Bool)

(assert (=> b!583150 (=> (not res!370864) (not e!334287))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583150 (= res!370864 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17494 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17494 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583151 () Bool)

(declare-fun res!370861 () Bool)

(assert (=> b!583151 (=> (not res!370861) (not e!334285))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583151 (= res!370861 (validKeyInArray!0 (select (arr!17494 a!2986) j!136)))))

(declare-fun b!583152 () Bool)

(declare-fun res!370859 () Bool)

(assert (=> b!583152 (=> (not res!370859) (not e!334287))))

(declare-datatypes ((List!11442 0))(
  ( (Nil!11439) (Cons!11438 (h!12486 (_ BitVec 64)) (t!17662 List!11442)) )
))
(declare-fun arrayNoDuplicates!0 (array!36444 (_ BitVec 32) List!11442) Bool)

(assert (=> b!583152 (= res!370859 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11439))))

(declare-fun b!583153 () Bool)

(declare-fun res!370863 () Bool)

(assert (=> b!583153 (=> (not res!370863) (not e!334287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36444 (_ BitVec 32)) Bool)

(assert (=> b!583153 (= res!370863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583154 () Bool)

(declare-fun res!370865 () Bool)

(assert (=> b!583154 (=> (not res!370865) (not e!334285))))

(assert (=> b!583154 (= res!370865 (and (= (size!17858 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17858 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17858 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583155 () Bool)

(declare-fun res!370866 () Bool)

(assert (=> b!583155 (=> (not res!370866) (not e!334285))))

(declare-fun arrayContainsKey!0 (array!36444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583155 (= res!370866 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583156 () Bool)

(assert (=> b!583156 (= e!334287 false)))

(declare-fun lt!265338 () SeekEntryResult!5890)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36444 (_ BitVec 32)) SeekEntryResult!5890)

(assert (=> b!583156 (= lt!265338 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17494 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53598 res!370867) b!583154))

(assert (= (and b!583154 res!370865) b!583151))

(assert (= (and b!583151 res!370861) b!583149))

(assert (= (and b!583149 res!370862) b!583155))

(assert (= (and b!583155 res!370866) b!583148))

(assert (= (and b!583148 res!370860) b!583153))

(assert (= (and b!583153 res!370863) b!583152))

(assert (= (and b!583152 res!370859) b!583150))

(assert (= (and b!583150 res!370864) b!583156))

(declare-fun m!561785 () Bool)

(assert (=> b!583150 m!561785))

(declare-fun m!561787 () Bool)

(assert (=> b!583150 m!561787))

(declare-fun m!561789 () Bool)

(assert (=> b!583150 m!561789))

(declare-fun m!561791 () Bool)

(assert (=> b!583149 m!561791))

(declare-fun m!561793 () Bool)

(assert (=> start!53598 m!561793))

(declare-fun m!561795 () Bool)

(assert (=> start!53598 m!561795))

(declare-fun m!561797 () Bool)

(assert (=> b!583151 m!561797))

(assert (=> b!583151 m!561797))

(declare-fun m!561799 () Bool)

(assert (=> b!583151 m!561799))

(declare-fun m!561801 () Bool)

(assert (=> b!583155 m!561801))

(declare-fun m!561803 () Bool)

(assert (=> b!583153 m!561803))

(assert (=> b!583156 m!561797))

(assert (=> b!583156 m!561797))

(declare-fun m!561805 () Bool)

(assert (=> b!583156 m!561805))

(declare-fun m!561807 () Bool)

(assert (=> b!583152 m!561807))

(declare-fun m!561809 () Bool)

(assert (=> b!583148 m!561809))

(check-sat (not b!583151) (not b!583152) (not b!583148) (not b!583153) (not b!583155) (not start!53598) (not b!583156) (not b!583149))
(check-sat)
