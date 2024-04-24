; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53712 () Bool)

(assert start!53712)

(declare-fun b!585035 () Bool)

(declare-fun res!372757 () Bool)

(declare-fun e!334909 () Bool)

(assert (=> b!585035 (=> (not res!372757) (not e!334909))))

(declare-datatypes ((array!36558 0))(
  ( (array!36559 (arr!17551 (Array (_ BitVec 32) (_ BitVec 64))) (size!17915 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36558)

(declare-datatypes ((List!11499 0))(
  ( (Nil!11496) (Cons!11495 (h!12543 (_ BitVec 64)) (t!17719 List!11499)) )
))
(declare-fun arrayNoDuplicates!0 (array!36558 (_ BitVec 32) List!11499) Bool)

(assert (=> b!585035 (= res!372757 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11496))))

(declare-fun res!372755 () Bool)

(declare-fun e!334910 () Bool)

(assert (=> start!53712 (=> (not res!372755) (not e!334910))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53712 (= res!372755 (validMask!0 mask!3053))))

(assert (=> start!53712 e!334910))

(assert (=> start!53712 true))

(declare-fun array_inv!13410 (array!36558) Bool)

(assert (=> start!53712 (array_inv!13410 a!2986)))

(declare-fun b!585036 () Bool)

(assert (=> b!585036 (= e!334910 e!334909)))

(declare-fun res!372752 () Bool)

(assert (=> b!585036 (=> (not res!372752) (not e!334909))))

(declare-datatypes ((SeekEntryResult!5947 0))(
  ( (MissingZero!5947 (index!26015 (_ BitVec 32))) (Found!5947 (index!26016 (_ BitVec 32))) (Intermediate!5947 (undefined!6759 Bool) (index!26017 (_ BitVec 32)) (x!54995 (_ BitVec 32))) (Undefined!5947) (MissingVacant!5947 (index!26018 (_ BitVec 32))) )
))
(declare-fun lt!265772 () SeekEntryResult!5947)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585036 (= res!372752 (or (= lt!265772 (MissingZero!5947 i!1108)) (= lt!265772 (MissingVacant!5947 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36558 (_ BitVec 32)) SeekEntryResult!5947)

(assert (=> b!585036 (= lt!265772 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585037 () Bool)

(declare-fun res!372756 () Bool)

(assert (=> b!585037 (=> (not res!372756) (not e!334910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585037 (= res!372756 (validKeyInArray!0 k0!1786))))

(declare-fun b!585038 () Bool)

(declare-fun res!372747 () Bool)

(assert (=> b!585038 (=> (not res!372747) (not e!334909))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585038 (= res!372747 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17551 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17551 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585039 () Bool)

(declare-fun res!372746 () Bool)

(assert (=> b!585039 (=> (not res!372746) (not e!334909))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!585039 (= res!372746 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17551 a!2986) index!984) (select (arr!17551 a!2986) j!136))) (not (= (select (arr!17551 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585040 () Bool)

(declare-fun e!334908 () Bool)

(assert (=> b!585040 (= e!334908 false)))

(declare-fun lt!265773 () SeekEntryResult!5947)

(declare-fun lt!265774 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36558 (_ BitVec 32)) SeekEntryResult!5947)

(assert (=> b!585040 (= lt!265773 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265774 vacantSpotIndex!68 (select (arr!17551 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585041 () Bool)

(declare-fun res!372750 () Bool)

(assert (=> b!585041 (=> (not res!372750) (not e!334909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36558 (_ BitVec 32)) Bool)

(assert (=> b!585041 (= res!372750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585042 () Bool)

(declare-fun res!372751 () Bool)

(assert (=> b!585042 (=> (not res!372751) (not e!334910))))

(assert (=> b!585042 (= res!372751 (validKeyInArray!0 (select (arr!17551 a!2986) j!136)))))

(declare-fun b!585043 () Bool)

(declare-fun res!372748 () Bool)

(assert (=> b!585043 (=> (not res!372748) (not e!334910))))

(assert (=> b!585043 (= res!372748 (and (= (size!17915 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17915 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17915 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585044 () Bool)

(declare-fun res!372754 () Bool)

(assert (=> b!585044 (=> (not res!372754) (not e!334909))))

(assert (=> b!585044 (= res!372754 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17551 a!2986) j!136) a!2986 mask!3053) (Found!5947 j!136)))))

(declare-fun b!585045 () Bool)

(assert (=> b!585045 (= e!334909 e!334908)))

(declare-fun res!372753 () Bool)

(assert (=> b!585045 (=> (not res!372753) (not e!334908))))

(assert (=> b!585045 (= res!372753 (and (bvsge lt!265774 #b00000000000000000000000000000000) (bvslt lt!265774 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585045 (= lt!265774 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585046 () Bool)

(declare-fun res!372749 () Bool)

(assert (=> b!585046 (=> (not res!372749) (not e!334910))))

(declare-fun arrayContainsKey!0 (array!36558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585046 (= res!372749 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53712 res!372755) b!585043))

(assert (= (and b!585043 res!372748) b!585042))

(assert (= (and b!585042 res!372751) b!585037))

(assert (= (and b!585037 res!372756) b!585046))

(assert (= (and b!585046 res!372749) b!585036))

(assert (= (and b!585036 res!372752) b!585041))

(assert (= (and b!585041 res!372750) b!585035))

(assert (= (and b!585035 res!372757) b!585038))

(assert (= (and b!585038 res!372747) b!585044))

(assert (= (and b!585044 res!372754) b!585039))

(assert (= (and b!585039 res!372746) b!585045))

(assert (= (and b!585045 res!372753) b!585040))

(declare-fun m!563495 () Bool)

(assert (=> b!585038 m!563495))

(declare-fun m!563497 () Bool)

(assert (=> b!585038 m!563497))

(declare-fun m!563499 () Bool)

(assert (=> b!585038 m!563499))

(declare-fun m!563501 () Bool)

(assert (=> b!585046 m!563501))

(declare-fun m!563503 () Bool)

(assert (=> b!585045 m!563503))

(declare-fun m!563505 () Bool)

(assert (=> start!53712 m!563505))

(declare-fun m!563507 () Bool)

(assert (=> start!53712 m!563507))

(declare-fun m!563509 () Bool)

(assert (=> b!585035 m!563509))

(declare-fun m!563511 () Bool)

(assert (=> b!585037 m!563511))

(declare-fun m!563513 () Bool)

(assert (=> b!585036 m!563513))

(declare-fun m!563515 () Bool)

(assert (=> b!585042 m!563515))

(assert (=> b!585042 m!563515))

(declare-fun m!563517 () Bool)

(assert (=> b!585042 m!563517))

(assert (=> b!585040 m!563515))

(assert (=> b!585040 m!563515))

(declare-fun m!563519 () Bool)

(assert (=> b!585040 m!563519))

(declare-fun m!563521 () Bool)

(assert (=> b!585039 m!563521))

(assert (=> b!585039 m!563515))

(declare-fun m!563523 () Bool)

(assert (=> b!585041 m!563523))

(assert (=> b!585044 m!563515))

(assert (=> b!585044 m!563515))

(declare-fun m!563525 () Bool)

(assert (=> b!585044 m!563525))

(check-sat (not b!585046) (not b!585036) (not b!585044) (not b!585041) (not b!585037) (not b!585040) (not b!585042) (not b!585035) (not start!53712) (not b!585045))
(check-sat)
