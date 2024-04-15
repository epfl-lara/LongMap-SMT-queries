; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46044 () Bool)

(assert start!46044)

(declare-fun b!509784 () Bool)

(declare-fun res!310774 () Bool)

(declare-fun e!298021 () Bool)

(assert (=> b!509784 (=> (not res!310774) (not e!298021))))

(declare-datatypes ((array!32765 0))(
  ( (array!32766 (arr!15761 (Array (_ BitVec 32) (_ BitVec 64))) (size!16126 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32765)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32765 (_ BitVec 32)) Bool)

(assert (=> b!509784 (= res!310774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509785 () Bool)

(assert (=> b!509785 (= e!298021 (not true))))

(declare-fun lt!232893 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4225 0))(
  ( (MissingZero!4225 (index!19088 (_ BitVec 32))) (Found!4225 (index!19089 (_ BitVec 32))) (Intermediate!4225 (undefined!5037 Bool) (index!19090 (_ BitVec 32)) (x!48061 (_ BitVec 32))) (Undefined!4225) (MissingVacant!4225 (index!19091 (_ BitVec 32))) )
))
(declare-fun lt!232896 () SeekEntryResult!4225)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32765 (_ BitVec 32)) SeekEntryResult!4225)

(assert (=> b!509785 (= lt!232896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232893 (select (store (arr!15761 a!3235) i!1204 k0!2280) j!176) (array!32766 (store (arr!15761 a!3235) i!1204 k0!2280) (size!16126 a!3235)) mask!3524))))

(declare-fun lt!232894 () SeekEntryResult!4225)

(declare-fun lt!232897 () (_ BitVec 32))

(assert (=> b!509785 (= lt!232894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232897 (select (arr!15761 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509785 (= lt!232893 (toIndex!0 (select (store (arr!15761 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509785 (= lt!232897 (toIndex!0 (select (arr!15761 a!3235) j!176) mask!3524))))

(declare-fun e!298020 () Bool)

(assert (=> b!509785 e!298020))

(declare-fun res!310777 () Bool)

(assert (=> b!509785 (=> (not res!310777) (not e!298020))))

(assert (=> b!509785 (= res!310777 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15694 0))(
  ( (Unit!15695) )
))
(declare-fun lt!232895 () Unit!15694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15694)

(assert (=> b!509785 (= lt!232895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509786 () Bool)

(declare-fun res!310775 () Bool)

(assert (=> b!509786 (=> (not res!310775) (not e!298021))))

(declare-datatypes ((List!9958 0))(
  ( (Nil!9955) (Cons!9954 (h!10831 (_ BitVec 64)) (t!16177 List!9958)) )
))
(declare-fun arrayNoDuplicates!0 (array!32765 (_ BitVec 32) List!9958) Bool)

(assert (=> b!509786 (= res!310775 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9955))))

(declare-fun b!509787 () Bool)

(declare-fun e!298023 () Bool)

(assert (=> b!509787 (= e!298023 e!298021)))

(declare-fun res!310773 () Bool)

(assert (=> b!509787 (=> (not res!310773) (not e!298021))))

(declare-fun lt!232892 () SeekEntryResult!4225)

(assert (=> b!509787 (= res!310773 (or (= lt!232892 (MissingZero!4225 i!1204)) (= lt!232892 (MissingVacant!4225 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32765 (_ BitVec 32)) SeekEntryResult!4225)

(assert (=> b!509787 (= lt!232892 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509788 () Bool)

(declare-fun res!310770 () Bool)

(assert (=> b!509788 (=> (not res!310770) (not e!298023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509788 (= res!310770 (validKeyInArray!0 (select (arr!15761 a!3235) j!176)))))

(declare-fun b!509789 () Bool)

(declare-fun res!310776 () Bool)

(assert (=> b!509789 (=> (not res!310776) (not e!298023))))

(declare-fun arrayContainsKey!0 (array!32765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509789 (= res!310776 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310771 () Bool)

(assert (=> start!46044 (=> (not res!310771) (not e!298023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46044 (= res!310771 (validMask!0 mask!3524))))

(assert (=> start!46044 e!298023))

(assert (=> start!46044 true))

(declare-fun array_inv!11644 (array!32765) Bool)

(assert (=> start!46044 (array_inv!11644 a!3235)))

(declare-fun b!509783 () Bool)

(declare-fun res!310778 () Bool)

(assert (=> b!509783 (=> (not res!310778) (not e!298023))))

(assert (=> b!509783 (= res!310778 (validKeyInArray!0 k0!2280))))

(declare-fun b!509790 () Bool)

(declare-fun res!310772 () Bool)

(assert (=> b!509790 (=> (not res!310772) (not e!298023))))

(assert (=> b!509790 (= res!310772 (and (= (size!16126 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16126 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16126 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509791 () Bool)

(assert (=> b!509791 (= e!298020 (= (seekEntryOrOpen!0 (select (arr!15761 a!3235) j!176) a!3235 mask!3524) (Found!4225 j!176)))))

(assert (= (and start!46044 res!310771) b!509790))

(assert (= (and b!509790 res!310772) b!509788))

(assert (= (and b!509788 res!310770) b!509783))

(assert (= (and b!509783 res!310778) b!509789))

(assert (= (and b!509789 res!310776) b!509787))

(assert (= (and b!509787 res!310773) b!509784))

(assert (= (and b!509784 res!310774) b!509786))

(assert (= (and b!509786 res!310775) b!509785))

(assert (= (and b!509785 res!310777) b!509791))

(declare-fun m!490393 () Bool)

(assert (=> start!46044 m!490393))

(declare-fun m!490395 () Bool)

(assert (=> start!46044 m!490395))

(declare-fun m!490397 () Bool)

(assert (=> b!509791 m!490397))

(assert (=> b!509791 m!490397))

(declare-fun m!490399 () Bool)

(assert (=> b!509791 m!490399))

(declare-fun m!490401 () Bool)

(assert (=> b!509784 m!490401))

(declare-fun m!490403 () Bool)

(assert (=> b!509787 m!490403))

(declare-fun m!490405 () Bool)

(assert (=> b!509789 m!490405))

(declare-fun m!490407 () Bool)

(assert (=> b!509786 m!490407))

(declare-fun m!490409 () Bool)

(assert (=> b!509783 m!490409))

(assert (=> b!509785 m!490397))

(declare-fun m!490411 () Bool)

(assert (=> b!509785 m!490411))

(declare-fun m!490413 () Bool)

(assert (=> b!509785 m!490413))

(declare-fun m!490415 () Bool)

(assert (=> b!509785 m!490415))

(declare-fun m!490417 () Bool)

(assert (=> b!509785 m!490417))

(assert (=> b!509785 m!490397))

(declare-fun m!490419 () Bool)

(assert (=> b!509785 m!490419))

(assert (=> b!509785 m!490397))

(declare-fun m!490421 () Bool)

(assert (=> b!509785 m!490421))

(assert (=> b!509785 m!490417))

(declare-fun m!490423 () Bool)

(assert (=> b!509785 m!490423))

(assert (=> b!509785 m!490417))

(declare-fun m!490425 () Bool)

(assert (=> b!509785 m!490425))

(assert (=> b!509788 m!490397))

(assert (=> b!509788 m!490397))

(declare-fun m!490427 () Bool)

(assert (=> b!509788 m!490427))

(check-sat (not b!509784) (not start!46044) (not b!509787) (not b!509785) (not b!509786) (not b!509783) (not b!509788) (not b!509789) (not b!509791))
(check-sat)
