; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46020 () Bool)

(assert start!46020)

(declare-fun b!509459 () Bool)

(declare-fun res!310454 () Bool)

(declare-fun e!297879 () Bool)

(assert (=> b!509459 (=> (not res!310454) (not e!297879))))

(declare-datatypes ((array!32741 0))(
  ( (array!32742 (arr!15749 (Array (_ BitVec 32) (_ BitVec 64))) (size!16114 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32741)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32741 (_ BitVec 32)) Bool)

(assert (=> b!509459 (= res!310454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509460 () Bool)

(declare-fun res!310447 () Bool)

(declare-fun e!297877 () Bool)

(assert (=> b!509460 (=> (not res!310447) (not e!297877))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509460 (= res!310447 (and (= (size!16114 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16114 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16114 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509461 () Bool)

(assert (=> b!509461 (= e!297879 (not true))))

(declare-fun lt!232676 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4213 0))(
  ( (MissingZero!4213 (index!19040 (_ BitVec 32))) (Found!4213 (index!19041 (_ BitVec 32))) (Intermediate!4213 (undefined!5025 Bool) (index!19042 (_ BitVec 32)) (x!48017 (_ BitVec 32))) (Undefined!4213) (MissingVacant!4213 (index!19043 (_ BitVec 32))) )
))
(declare-fun lt!232677 () SeekEntryResult!4213)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32741 (_ BitVec 32)) SeekEntryResult!4213)

(assert (=> b!509461 (= lt!232677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232676 (select (store (arr!15749 a!3235) i!1204 k0!2280) j!176) (array!32742 (store (arr!15749 a!3235) i!1204 k0!2280) (size!16114 a!3235)) mask!3524))))

(declare-fun lt!232680 () (_ BitVec 32))

(declare-fun lt!232681 () SeekEntryResult!4213)

(assert (=> b!509461 (= lt!232681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232680 (select (arr!15749 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509461 (= lt!232676 (toIndex!0 (select (store (arr!15749 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509461 (= lt!232680 (toIndex!0 (select (arr!15749 a!3235) j!176) mask!3524))))

(declare-fun e!297878 () Bool)

(assert (=> b!509461 e!297878))

(declare-fun res!310448 () Bool)

(assert (=> b!509461 (=> (not res!310448) (not e!297878))))

(assert (=> b!509461 (= res!310448 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15670 0))(
  ( (Unit!15671) )
))
(declare-fun lt!232678 () Unit!15670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15670)

(assert (=> b!509461 (= lt!232678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509462 () Bool)

(declare-fun res!310450 () Bool)

(assert (=> b!509462 (=> (not res!310450) (not e!297877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509462 (= res!310450 (validKeyInArray!0 (select (arr!15749 a!3235) j!176)))))

(declare-fun b!509463 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32741 (_ BitVec 32)) SeekEntryResult!4213)

(assert (=> b!509463 (= e!297878 (= (seekEntryOrOpen!0 (select (arr!15749 a!3235) j!176) a!3235 mask!3524) (Found!4213 j!176)))))

(declare-fun b!509464 () Bool)

(declare-fun res!310451 () Bool)

(assert (=> b!509464 (=> (not res!310451) (not e!297877))))

(declare-fun arrayContainsKey!0 (array!32741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509464 (= res!310451 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509465 () Bool)

(declare-fun res!310453 () Bool)

(assert (=> b!509465 (=> (not res!310453) (not e!297879))))

(declare-datatypes ((List!9946 0))(
  ( (Nil!9943) (Cons!9942 (h!10819 (_ BitVec 64)) (t!16165 List!9946)) )
))
(declare-fun arrayNoDuplicates!0 (array!32741 (_ BitVec 32) List!9946) Bool)

(assert (=> b!509465 (= res!310453 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9943))))

(declare-fun b!509466 () Bool)

(declare-fun res!310446 () Bool)

(assert (=> b!509466 (=> (not res!310446) (not e!297877))))

(assert (=> b!509466 (= res!310446 (validKeyInArray!0 k0!2280))))

(declare-fun res!310449 () Bool)

(assert (=> start!46020 (=> (not res!310449) (not e!297877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46020 (= res!310449 (validMask!0 mask!3524))))

(assert (=> start!46020 e!297877))

(assert (=> start!46020 true))

(declare-fun array_inv!11632 (array!32741) Bool)

(assert (=> start!46020 (array_inv!11632 a!3235)))

(declare-fun b!509467 () Bool)

(assert (=> b!509467 (= e!297877 e!297879)))

(declare-fun res!310452 () Bool)

(assert (=> b!509467 (=> (not res!310452) (not e!297879))))

(declare-fun lt!232679 () SeekEntryResult!4213)

(assert (=> b!509467 (= res!310452 (or (= lt!232679 (MissingZero!4213 i!1204)) (= lt!232679 (MissingVacant!4213 i!1204))))))

(assert (=> b!509467 (= lt!232679 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46020 res!310449) b!509460))

(assert (= (and b!509460 res!310447) b!509462))

(assert (= (and b!509462 res!310450) b!509466))

(assert (= (and b!509466 res!310446) b!509464))

(assert (= (and b!509464 res!310451) b!509467))

(assert (= (and b!509467 res!310452) b!509459))

(assert (= (and b!509459 res!310454) b!509465))

(assert (= (and b!509465 res!310453) b!509461))

(assert (= (and b!509461 res!310448) b!509463))

(declare-fun m!489961 () Bool)

(assert (=> start!46020 m!489961))

(declare-fun m!489963 () Bool)

(assert (=> start!46020 m!489963))

(declare-fun m!489965 () Bool)

(assert (=> b!509459 m!489965))

(declare-fun m!489967 () Bool)

(assert (=> b!509467 m!489967))

(declare-fun m!489969 () Bool)

(assert (=> b!509465 m!489969))

(declare-fun m!489971 () Bool)

(assert (=> b!509461 m!489971))

(declare-fun m!489973 () Bool)

(assert (=> b!509461 m!489973))

(declare-fun m!489975 () Bool)

(assert (=> b!509461 m!489975))

(declare-fun m!489977 () Bool)

(assert (=> b!509461 m!489977))

(declare-fun m!489979 () Bool)

(assert (=> b!509461 m!489979))

(assert (=> b!509461 m!489975))

(declare-fun m!489981 () Bool)

(assert (=> b!509461 m!489981))

(assert (=> b!509461 m!489977))

(declare-fun m!489983 () Bool)

(assert (=> b!509461 m!489983))

(assert (=> b!509461 m!489977))

(declare-fun m!489985 () Bool)

(assert (=> b!509461 m!489985))

(assert (=> b!509461 m!489975))

(declare-fun m!489987 () Bool)

(assert (=> b!509461 m!489987))

(assert (=> b!509462 m!489977))

(assert (=> b!509462 m!489977))

(declare-fun m!489989 () Bool)

(assert (=> b!509462 m!489989))

(declare-fun m!489991 () Bool)

(assert (=> b!509464 m!489991))

(assert (=> b!509463 m!489977))

(assert (=> b!509463 m!489977))

(declare-fun m!489993 () Bool)

(assert (=> b!509463 m!489993))

(declare-fun m!489995 () Bool)

(assert (=> b!509466 m!489995))

(check-sat (not b!509462) (not b!509465) (not b!509461) (not b!509459) (not b!509463) (not start!46020) (not b!509464) (not b!509467) (not b!509466))
(check-sat)
