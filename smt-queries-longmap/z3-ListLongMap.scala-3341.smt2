; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46028 () Bool)

(assert start!46028)

(declare-fun b!509750 () Bool)

(declare-fun e!298048 () Bool)

(declare-fun e!298047 () Bool)

(assert (=> b!509750 (= e!298048 e!298047)))

(declare-fun res!310650 () Bool)

(assert (=> b!509750 (=> (not res!310650) (not e!298047))))

(declare-datatypes ((SeekEntryResult!4171 0))(
  ( (MissingZero!4171 (index!18872 (_ BitVec 32))) (Found!4171 (index!18873 (_ BitVec 32))) (Intermediate!4171 (undefined!4983 Bool) (index!18874 (_ BitVec 32)) (x!47985 (_ BitVec 32))) (Undefined!4171) (MissingVacant!4171 (index!18875 (_ BitVec 32))) )
))
(declare-fun lt!232978 () SeekEntryResult!4171)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509750 (= res!310650 (or (= lt!232978 (MissingZero!4171 i!1204)) (= lt!232978 (MissingVacant!4171 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32740 0))(
  ( (array!32741 (arr!15748 (Array (_ BitVec 32) (_ BitVec 64))) (size!16112 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32740)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32740 (_ BitVec 32)) SeekEntryResult!4171)

(assert (=> b!509750 (= lt!232978 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509751 () Bool)

(declare-fun res!310653 () Bool)

(assert (=> b!509751 (=> (not res!310653) (not e!298048))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509751 (= res!310653 (validKeyInArray!0 (select (arr!15748 a!3235) j!176)))))

(declare-fun b!509753 () Bool)

(declare-fun res!310649 () Bool)

(assert (=> b!509753 (=> (not res!310649) (not e!298047))))

(declare-datatypes ((List!9813 0))(
  ( (Nil!9810) (Cons!9809 (h!10686 (_ BitVec 64)) (t!16033 List!9813)) )
))
(declare-fun arrayNoDuplicates!0 (array!32740 (_ BitVec 32) List!9813) Bool)

(assert (=> b!509753 (= res!310649 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9810))))

(declare-fun b!509754 () Bool)

(assert (=> b!509754 (= e!298047 (not true))))

(declare-fun lt!232981 () SeekEntryResult!4171)

(declare-fun lt!232976 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32740 (_ BitVec 32)) SeekEntryResult!4171)

(assert (=> b!509754 (= lt!232981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232976 (select (store (arr!15748 a!3235) i!1204 k0!2280) j!176) (array!32741 (store (arr!15748 a!3235) i!1204 k0!2280) (size!16112 a!3235)) mask!3524))))

(declare-fun lt!232977 () (_ BitVec 32))

(declare-fun lt!232980 () SeekEntryResult!4171)

(assert (=> b!509754 (= lt!232980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232977 (select (arr!15748 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509754 (= lt!232976 (toIndex!0 (select (store (arr!15748 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509754 (= lt!232977 (toIndex!0 (select (arr!15748 a!3235) j!176) mask!3524))))

(declare-fun e!298049 () Bool)

(assert (=> b!509754 e!298049))

(declare-fun res!310652 () Bool)

(assert (=> b!509754 (=> (not res!310652) (not e!298049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32740 (_ BitVec 32)) Bool)

(assert (=> b!509754 (= res!310652 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15661 0))(
  ( (Unit!15662) )
))
(declare-fun lt!232979 () Unit!15661)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15661)

(assert (=> b!509754 (= lt!232979 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509755 () Bool)

(assert (=> b!509755 (= e!298049 (= (seekEntryOrOpen!0 (select (arr!15748 a!3235) j!176) a!3235 mask!3524) (Found!4171 j!176)))))

(declare-fun b!509756 () Bool)

(declare-fun res!310651 () Bool)

(assert (=> b!509756 (=> (not res!310651) (not e!298048))))

(assert (=> b!509756 (= res!310651 (validKeyInArray!0 k0!2280))))

(declare-fun b!509757 () Bool)

(declare-fun res!310656 () Bool)

(assert (=> b!509757 (=> (not res!310656) (not e!298048))))

(assert (=> b!509757 (= res!310656 (and (= (size!16112 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16112 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16112 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509758 () Bool)

(declare-fun res!310654 () Bool)

(assert (=> b!509758 (=> (not res!310654) (not e!298048))))

(declare-fun arrayContainsKey!0 (array!32740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509758 (= res!310654 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509752 () Bool)

(declare-fun res!310655 () Bool)

(assert (=> b!509752 (=> (not res!310655) (not e!298047))))

(assert (=> b!509752 (= res!310655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310657 () Bool)

(assert (=> start!46028 (=> (not res!310657) (not e!298048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46028 (= res!310657 (validMask!0 mask!3524))))

(assert (=> start!46028 e!298048))

(assert (=> start!46028 true))

(declare-fun array_inv!11607 (array!32740) Bool)

(assert (=> start!46028 (array_inv!11607 a!3235)))

(assert (= (and start!46028 res!310657) b!509757))

(assert (= (and b!509757 res!310656) b!509751))

(assert (= (and b!509751 res!310653) b!509756))

(assert (= (and b!509756 res!310651) b!509758))

(assert (= (and b!509758 res!310654) b!509750))

(assert (= (and b!509750 res!310650) b!509752))

(assert (= (and b!509752 res!310655) b!509753))

(assert (= (and b!509753 res!310649) b!509754))

(assert (= (and b!509754 res!310652) b!509755))

(declare-fun m!491005 () Bool)

(assert (=> b!509754 m!491005))

(declare-fun m!491007 () Bool)

(assert (=> b!509754 m!491007))

(declare-fun m!491009 () Bool)

(assert (=> b!509754 m!491009))

(declare-fun m!491011 () Bool)

(assert (=> b!509754 m!491011))

(declare-fun m!491013 () Bool)

(assert (=> b!509754 m!491013))

(declare-fun m!491015 () Bool)

(assert (=> b!509754 m!491015))

(assert (=> b!509754 m!491009))

(declare-fun m!491017 () Bool)

(assert (=> b!509754 m!491017))

(assert (=> b!509754 m!491011))

(declare-fun m!491019 () Bool)

(assert (=> b!509754 m!491019))

(assert (=> b!509754 m!491011))

(assert (=> b!509754 m!491009))

(declare-fun m!491021 () Bool)

(assert (=> b!509754 m!491021))

(declare-fun m!491023 () Bool)

(assert (=> b!509758 m!491023))

(declare-fun m!491025 () Bool)

(assert (=> b!509752 m!491025))

(assert (=> b!509751 m!491011))

(assert (=> b!509751 m!491011))

(declare-fun m!491027 () Bool)

(assert (=> b!509751 m!491027))

(declare-fun m!491029 () Bool)

(assert (=> start!46028 m!491029))

(declare-fun m!491031 () Bool)

(assert (=> start!46028 m!491031))

(declare-fun m!491033 () Bool)

(assert (=> b!509750 m!491033))

(declare-fun m!491035 () Bool)

(assert (=> b!509753 m!491035))

(assert (=> b!509755 m!491011))

(assert (=> b!509755 m!491011))

(declare-fun m!491037 () Bool)

(assert (=> b!509755 m!491037))

(declare-fun m!491039 () Bool)

(assert (=> b!509756 m!491039))

(check-sat (not b!509753) (not b!509754) (not b!509752) (not b!509758) (not b!509756) (not b!509755) (not b!509750) (not start!46028) (not b!509751))
(check-sat)
