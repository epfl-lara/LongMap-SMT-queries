; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45992 () Bool)

(assert start!45992)

(declare-fun res!310039 () Bool)

(declare-fun e!297813 () Bool)

(assert (=> start!45992 (=> (not res!310039) (not e!297813))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45992 (= res!310039 (validMask!0 mask!3524))))

(assert (=> start!45992 e!297813))

(assert (=> start!45992 true))

(declare-datatypes ((array!32703 0))(
  ( (array!32704 (arr!15730 (Array (_ BitVec 32) (_ BitVec 64))) (size!16094 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32703)

(declare-fun array_inv!11526 (array!32703) Bool)

(assert (=> start!45992 (array_inv!11526 a!3235)))

(declare-fun e!297812 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!509190 () Bool)

(declare-datatypes ((SeekEntryResult!4197 0))(
  ( (MissingZero!4197 (index!18976 (_ BitVec 32))) (Found!4197 (index!18977 (_ BitVec 32))) (Intermediate!4197 (undefined!5009 Bool) (index!18978 (_ BitVec 32)) (x!47950 (_ BitVec 32))) (Undefined!4197) (MissingVacant!4197 (index!18979 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32703 (_ BitVec 32)) SeekEntryResult!4197)

(assert (=> b!509190 (= e!297812 (= (seekEntryOrOpen!0 (select (arr!15730 a!3235) j!176) a!3235 mask!3524) (Found!4197 j!176)))))

(declare-fun b!509191 () Bool)

(declare-fun res!310042 () Bool)

(declare-fun e!297810 () Bool)

(assert (=> b!509191 (=> (not res!310042) (not e!297810))))

(declare-datatypes ((List!9888 0))(
  ( (Nil!9885) (Cons!9884 (h!10761 (_ BitVec 64)) (t!16116 List!9888)) )
))
(declare-fun arrayNoDuplicates!0 (array!32703 (_ BitVec 32) List!9888) Bool)

(assert (=> b!509191 (= res!310042 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9885))))

(declare-fun b!509192 () Bool)

(declare-fun res!310040 () Bool)

(assert (=> b!509192 (=> (not res!310040) (not e!297813))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509192 (= res!310040 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509193 () Bool)

(assert (=> b!509193 (= e!297813 e!297810)))

(declare-fun res!310036 () Bool)

(assert (=> b!509193 (=> (not res!310036) (not e!297810))))

(declare-fun lt!232550 () SeekEntryResult!4197)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509193 (= res!310036 (or (= lt!232550 (MissingZero!4197 i!1204)) (= lt!232550 (MissingVacant!4197 i!1204))))))

(assert (=> b!509193 (= lt!232550 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509194 () Bool)

(declare-fun res!310035 () Bool)

(assert (=> b!509194 (=> (not res!310035) (not e!297813))))

(assert (=> b!509194 (= res!310035 (and (= (size!16094 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16094 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16094 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509195 () Bool)

(declare-fun res!310043 () Bool)

(assert (=> b!509195 (=> (not res!310043) (not e!297813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509195 (= res!310043 (validKeyInArray!0 (select (arr!15730 a!3235) j!176)))))

(declare-fun b!509196 () Bool)

(declare-fun res!310038 () Bool)

(assert (=> b!509196 (=> (not res!310038) (not e!297813))))

(assert (=> b!509196 (= res!310038 (validKeyInArray!0 k0!2280))))

(declare-fun b!509197 () Bool)

(assert (=> b!509197 (= e!297810 (not true))))

(declare-fun lt!232554 () (_ BitVec 32))

(declare-fun lt!232553 () SeekEntryResult!4197)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32703 (_ BitVec 32)) SeekEntryResult!4197)

(assert (=> b!509197 (= lt!232553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232554 (select (store (arr!15730 a!3235) i!1204 k0!2280) j!176) (array!32704 (store (arr!15730 a!3235) i!1204 k0!2280) (size!16094 a!3235)) mask!3524))))

(declare-fun lt!232551 () SeekEntryResult!4197)

(declare-fun lt!232552 () (_ BitVec 32))

(assert (=> b!509197 (= lt!232551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232552 (select (arr!15730 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509197 (= lt!232554 (toIndex!0 (select (store (arr!15730 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509197 (= lt!232552 (toIndex!0 (select (arr!15730 a!3235) j!176) mask!3524))))

(assert (=> b!509197 e!297812))

(declare-fun res!310041 () Bool)

(assert (=> b!509197 (=> (not res!310041) (not e!297812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32703 (_ BitVec 32)) Bool)

(assert (=> b!509197 (= res!310041 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15652 0))(
  ( (Unit!15653) )
))
(declare-fun lt!232555 () Unit!15652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15652)

(assert (=> b!509197 (= lt!232555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509198 () Bool)

(declare-fun res!310037 () Bool)

(assert (=> b!509198 (=> (not res!310037) (not e!297810))))

(assert (=> b!509198 (= res!310037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45992 res!310039) b!509194))

(assert (= (and b!509194 res!310035) b!509195))

(assert (= (and b!509195 res!310043) b!509196))

(assert (= (and b!509196 res!310038) b!509192))

(assert (= (and b!509192 res!310040) b!509193))

(assert (= (and b!509193 res!310036) b!509198))

(assert (= (and b!509198 res!310037) b!509191))

(assert (= (and b!509191 res!310042) b!509197))

(assert (= (and b!509197 res!310041) b!509190))

(declare-fun m!489993 () Bool)

(assert (=> start!45992 m!489993))

(declare-fun m!489995 () Bool)

(assert (=> start!45992 m!489995))

(declare-fun m!489997 () Bool)

(assert (=> b!509192 m!489997))

(declare-fun m!489999 () Bool)

(assert (=> b!509197 m!489999))

(declare-fun m!490001 () Bool)

(assert (=> b!509197 m!490001))

(declare-fun m!490003 () Bool)

(assert (=> b!509197 m!490003))

(declare-fun m!490005 () Bool)

(assert (=> b!509197 m!490005))

(declare-fun m!490007 () Bool)

(assert (=> b!509197 m!490007))

(assert (=> b!509197 m!490007))

(declare-fun m!490009 () Bool)

(assert (=> b!509197 m!490009))

(assert (=> b!509197 m!490001))

(declare-fun m!490011 () Bool)

(assert (=> b!509197 m!490011))

(assert (=> b!509197 m!490001))

(declare-fun m!490013 () Bool)

(assert (=> b!509197 m!490013))

(assert (=> b!509197 m!490007))

(declare-fun m!490015 () Bool)

(assert (=> b!509197 m!490015))

(assert (=> b!509190 m!490001))

(assert (=> b!509190 m!490001))

(declare-fun m!490017 () Bool)

(assert (=> b!509190 m!490017))

(declare-fun m!490019 () Bool)

(assert (=> b!509196 m!490019))

(declare-fun m!490021 () Bool)

(assert (=> b!509193 m!490021))

(declare-fun m!490023 () Bool)

(assert (=> b!509191 m!490023))

(assert (=> b!509195 m!490001))

(assert (=> b!509195 m!490001))

(declare-fun m!490025 () Bool)

(assert (=> b!509195 m!490025))

(declare-fun m!490027 () Bool)

(assert (=> b!509198 m!490027))

(check-sat (not b!509191) (not b!509193) (not b!509196) (not b!509197) (not b!509198) (not b!509190) (not start!45992) (not b!509195) (not b!509192))
(check-sat)
