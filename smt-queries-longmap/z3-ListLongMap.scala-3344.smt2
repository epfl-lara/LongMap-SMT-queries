; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46046 () Bool)

(assert start!46046)

(declare-fun b!509993 () Bool)

(declare-fun res!310896 () Bool)

(declare-fun e!298156 () Bool)

(assert (=> b!509993 (=> (not res!310896) (not e!298156))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509993 (= res!310896 (validKeyInArray!0 k0!2280))))

(declare-fun b!509994 () Bool)

(declare-fun res!310892 () Bool)

(declare-fun e!298155 () Bool)

(assert (=> b!509994 (=> (not res!310892) (not e!298155))))

(declare-datatypes ((array!32758 0))(
  ( (array!32759 (arr!15757 (Array (_ BitVec 32) (_ BitVec 64))) (size!16121 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32758)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32758 (_ BitVec 32)) Bool)

(assert (=> b!509994 (= res!310892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509995 () Bool)

(assert (=> b!509995 (= e!298156 e!298155)))

(declare-fun res!310897 () Bool)

(assert (=> b!509995 (=> (not res!310897) (not e!298155))))

(declare-datatypes ((SeekEntryResult!4180 0))(
  ( (MissingZero!4180 (index!18908 (_ BitVec 32))) (Found!4180 (index!18909 (_ BitVec 32))) (Intermediate!4180 (undefined!4992 Bool) (index!18910 (_ BitVec 32)) (x!48018 (_ BitVec 32))) (Undefined!4180) (MissingVacant!4180 (index!18911 (_ BitVec 32))) )
))
(declare-fun lt!233140 () SeekEntryResult!4180)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509995 (= res!310897 (or (= lt!233140 (MissingZero!4180 i!1204)) (= lt!233140 (MissingVacant!4180 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32758 (_ BitVec 32)) SeekEntryResult!4180)

(assert (=> b!509995 (= lt!233140 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509996 () Bool)

(declare-fun res!310899 () Bool)

(assert (=> b!509996 (=> (not res!310899) (not e!298156))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509996 (= res!310899 (and (= (size!16121 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16121 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16121 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509997 () Bool)

(declare-fun res!310893 () Bool)

(assert (=> b!509997 (=> (not res!310893) (not e!298155))))

(declare-datatypes ((List!9822 0))(
  ( (Nil!9819) (Cons!9818 (h!10695 (_ BitVec 64)) (t!16042 List!9822)) )
))
(declare-fun arrayNoDuplicates!0 (array!32758 (_ BitVec 32) List!9822) Bool)

(assert (=> b!509997 (= res!310893 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9819))))

(declare-fun res!310898 () Bool)

(assert (=> start!46046 (=> (not res!310898) (not e!298156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46046 (= res!310898 (validMask!0 mask!3524))))

(assert (=> start!46046 e!298156))

(assert (=> start!46046 true))

(declare-fun array_inv!11616 (array!32758) Bool)

(assert (=> start!46046 (array_inv!11616 a!3235)))

(declare-fun b!509998 () Bool)

(declare-fun res!310895 () Bool)

(assert (=> b!509998 (=> (not res!310895) (not e!298156))))

(declare-fun arrayContainsKey!0 (array!32758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509998 (= res!310895 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509999 () Bool)

(declare-fun e!298157 () Bool)

(assert (=> b!509999 (= e!298157 (= (seekEntryOrOpen!0 (select (arr!15757 a!3235) j!176) a!3235 mask!3524) (Found!4180 j!176)))))

(declare-fun b!510000 () Bool)

(assert (=> b!510000 (= e!298155 (not true))))

(declare-fun lt!233143 () SeekEntryResult!4180)

(declare-fun lt!233139 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32758 (_ BitVec 32)) SeekEntryResult!4180)

(assert (=> b!510000 (= lt!233143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233139 (select (store (arr!15757 a!3235) i!1204 k0!2280) j!176) (array!32759 (store (arr!15757 a!3235) i!1204 k0!2280) (size!16121 a!3235)) mask!3524))))

(declare-fun lt!233138 () (_ BitVec 32))

(declare-fun lt!233141 () SeekEntryResult!4180)

(assert (=> b!510000 (= lt!233141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233138 (select (arr!15757 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510000 (= lt!233139 (toIndex!0 (select (store (arr!15757 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510000 (= lt!233138 (toIndex!0 (select (arr!15757 a!3235) j!176) mask!3524))))

(assert (=> b!510000 e!298157))

(declare-fun res!310900 () Bool)

(assert (=> b!510000 (=> (not res!310900) (not e!298157))))

(assert (=> b!510000 (= res!310900 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15679 0))(
  ( (Unit!15680) )
))
(declare-fun lt!233142 () Unit!15679)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15679)

(assert (=> b!510000 (= lt!233142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510001 () Bool)

(declare-fun res!310894 () Bool)

(assert (=> b!510001 (=> (not res!310894) (not e!298156))))

(assert (=> b!510001 (= res!310894 (validKeyInArray!0 (select (arr!15757 a!3235) j!176)))))

(assert (= (and start!46046 res!310898) b!509996))

(assert (= (and b!509996 res!310899) b!510001))

(assert (= (and b!510001 res!310894) b!509993))

(assert (= (and b!509993 res!310896) b!509998))

(assert (= (and b!509998 res!310895) b!509995))

(assert (= (and b!509995 res!310897) b!509994))

(assert (= (and b!509994 res!310892) b!509997))

(assert (= (and b!509997 res!310893) b!510000))

(assert (= (and b!510000 res!310900) b!509999))

(declare-fun m!491329 () Bool)

(assert (=> b!510000 m!491329))

(declare-fun m!491331 () Bool)

(assert (=> b!510000 m!491331))

(declare-fun m!491333 () Bool)

(assert (=> b!510000 m!491333))

(declare-fun m!491335 () Bool)

(assert (=> b!510000 m!491335))

(declare-fun m!491337 () Bool)

(assert (=> b!510000 m!491337))

(assert (=> b!510000 m!491337))

(declare-fun m!491339 () Bool)

(assert (=> b!510000 m!491339))

(assert (=> b!510000 m!491329))

(declare-fun m!491341 () Bool)

(assert (=> b!510000 m!491341))

(assert (=> b!510000 m!491329))

(declare-fun m!491343 () Bool)

(assert (=> b!510000 m!491343))

(assert (=> b!510000 m!491337))

(declare-fun m!491345 () Bool)

(assert (=> b!510000 m!491345))

(declare-fun m!491347 () Bool)

(assert (=> start!46046 m!491347))

(declare-fun m!491349 () Bool)

(assert (=> start!46046 m!491349))

(declare-fun m!491351 () Bool)

(assert (=> b!509994 m!491351))

(assert (=> b!509999 m!491329))

(assert (=> b!509999 m!491329))

(declare-fun m!491353 () Bool)

(assert (=> b!509999 m!491353))

(assert (=> b!510001 m!491329))

(assert (=> b!510001 m!491329))

(declare-fun m!491355 () Bool)

(assert (=> b!510001 m!491355))

(declare-fun m!491357 () Bool)

(assert (=> b!509998 m!491357))

(declare-fun m!491359 () Bool)

(assert (=> b!509995 m!491359))

(declare-fun m!491361 () Bool)

(assert (=> b!509993 m!491361))

(declare-fun m!491363 () Bool)

(assert (=> b!509997 m!491363))

(check-sat (not b!509994) (not b!509998) (not b!510000) (not b!509997) (not b!509999) (not b!509995) (not start!46046) (not b!509993) (not b!510001))
(check-sat)
