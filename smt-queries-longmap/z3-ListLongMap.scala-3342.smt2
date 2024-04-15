; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46032 () Bool)

(assert start!46032)

(declare-fun b!509621 () Bool)

(declare-fun res!310609 () Bool)

(declare-fun e!297949 () Bool)

(assert (=> b!509621 (=> (not res!310609) (not e!297949))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509621 (= res!310609 (validKeyInArray!0 k0!2280))))

(declare-fun b!509622 () Bool)

(declare-fun res!310615 () Bool)

(assert (=> b!509622 (=> (not res!310615) (not e!297949))))

(declare-datatypes ((array!32753 0))(
  ( (array!32754 (arr!15755 (Array (_ BitVec 32) (_ BitVec 64))) (size!16120 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32753)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509622 (= res!310615 (validKeyInArray!0 (select (arr!15755 a!3235) j!176)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!509623 () Bool)

(declare-fun e!297950 () Bool)

(declare-datatypes ((SeekEntryResult!4219 0))(
  ( (MissingZero!4219 (index!19064 (_ BitVec 32))) (Found!4219 (index!19065 (_ BitVec 32))) (Intermediate!4219 (undefined!5031 Bool) (index!19066 (_ BitVec 32)) (x!48039 (_ BitVec 32))) (Undefined!4219) (MissingVacant!4219 (index!19067 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32753 (_ BitVec 32)) SeekEntryResult!4219)

(assert (=> b!509623 (= e!297950 (= (seekEntryOrOpen!0 (select (arr!15755 a!3235) j!176) a!3235 mask!3524) (Found!4219 j!176)))))

(declare-fun b!509624 () Bool)

(declare-fun res!310608 () Bool)

(assert (=> b!509624 (=> (not res!310608) (not e!297949))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509624 (= res!310608 (and (= (size!16120 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16120 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16120 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!310616 () Bool)

(assert (=> start!46032 (=> (not res!310616) (not e!297949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46032 (= res!310616 (validMask!0 mask!3524))))

(assert (=> start!46032 e!297949))

(assert (=> start!46032 true))

(declare-fun array_inv!11638 (array!32753) Bool)

(assert (=> start!46032 (array_inv!11638 a!3235)))

(declare-fun b!509625 () Bool)

(declare-fun res!310613 () Bool)

(declare-fun e!297948 () Bool)

(assert (=> b!509625 (=> (not res!310613) (not e!297948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32753 (_ BitVec 32)) Bool)

(assert (=> b!509625 (= res!310613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509626 () Bool)

(declare-fun res!310610 () Bool)

(assert (=> b!509626 (=> (not res!310610) (not e!297948))))

(declare-datatypes ((List!9952 0))(
  ( (Nil!9949) (Cons!9948 (h!10825 (_ BitVec 64)) (t!16171 List!9952)) )
))
(declare-fun arrayNoDuplicates!0 (array!32753 (_ BitVec 32) List!9952) Bool)

(assert (=> b!509626 (= res!310610 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9949))))

(declare-fun b!509627 () Bool)

(assert (=> b!509627 (= e!297949 e!297948)))

(declare-fun res!310612 () Bool)

(assert (=> b!509627 (=> (not res!310612) (not e!297948))))

(declare-fun lt!232787 () SeekEntryResult!4219)

(assert (=> b!509627 (= res!310612 (or (= lt!232787 (MissingZero!4219 i!1204)) (= lt!232787 (MissingVacant!4219 i!1204))))))

(assert (=> b!509627 (= lt!232787 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509628 () Bool)

(assert (=> b!509628 (= e!297948 (not true))))

(declare-fun lt!232788 () SeekEntryResult!4219)

(declare-fun lt!232789 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32753 (_ BitVec 32)) SeekEntryResult!4219)

(assert (=> b!509628 (= lt!232788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232789 (select (store (arr!15755 a!3235) i!1204 k0!2280) j!176) (array!32754 (store (arr!15755 a!3235) i!1204 k0!2280) (size!16120 a!3235)) mask!3524))))

(declare-fun lt!232786 () SeekEntryResult!4219)

(declare-fun lt!232785 () (_ BitVec 32))

(assert (=> b!509628 (= lt!232786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232785 (select (arr!15755 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509628 (= lt!232789 (toIndex!0 (select (store (arr!15755 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509628 (= lt!232785 (toIndex!0 (select (arr!15755 a!3235) j!176) mask!3524))))

(assert (=> b!509628 e!297950))

(declare-fun res!310614 () Bool)

(assert (=> b!509628 (=> (not res!310614) (not e!297950))))

(assert (=> b!509628 (= res!310614 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15682 0))(
  ( (Unit!15683) )
))
(declare-fun lt!232784 () Unit!15682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15682)

(assert (=> b!509628 (= lt!232784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509629 () Bool)

(declare-fun res!310611 () Bool)

(assert (=> b!509629 (=> (not res!310611) (not e!297949))))

(declare-fun arrayContainsKey!0 (array!32753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509629 (= res!310611 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46032 res!310616) b!509624))

(assert (= (and b!509624 res!310608) b!509622))

(assert (= (and b!509622 res!310615) b!509621))

(assert (= (and b!509621 res!310609) b!509629))

(assert (= (and b!509629 res!310611) b!509627))

(assert (= (and b!509627 res!310612) b!509625))

(assert (= (and b!509625 res!310613) b!509626))

(assert (= (and b!509626 res!310610) b!509628))

(assert (= (and b!509628 res!310614) b!509623))

(declare-fun m!490177 () Bool)

(assert (=> b!509628 m!490177))

(declare-fun m!490179 () Bool)

(assert (=> b!509628 m!490179))

(declare-fun m!490181 () Bool)

(assert (=> b!509628 m!490181))

(declare-fun m!490183 () Bool)

(assert (=> b!509628 m!490183))

(declare-fun m!490185 () Bool)

(assert (=> b!509628 m!490185))

(assert (=> b!509628 m!490183))

(declare-fun m!490187 () Bool)

(assert (=> b!509628 m!490187))

(assert (=> b!509628 m!490183))

(declare-fun m!490189 () Bool)

(assert (=> b!509628 m!490189))

(assert (=> b!509628 m!490181))

(declare-fun m!490191 () Bool)

(assert (=> b!509628 m!490191))

(assert (=> b!509628 m!490181))

(declare-fun m!490193 () Bool)

(assert (=> b!509628 m!490193))

(declare-fun m!490195 () Bool)

(assert (=> b!509629 m!490195))

(assert (=> b!509623 m!490183))

(assert (=> b!509623 m!490183))

(declare-fun m!490197 () Bool)

(assert (=> b!509623 m!490197))

(declare-fun m!490199 () Bool)

(assert (=> start!46032 m!490199))

(declare-fun m!490201 () Bool)

(assert (=> start!46032 m!490201))

(declare-fun m!490203 () Bool)

(assert (=> b!509627 m!490203))

(assert (=> b!509622 m!490183))

(assert (=> b!509622 m!490183))

(declare-fun m!490205 () Bool)

(assert (=> b!509622 m!490205))

(declare-fun m!490207 () Bool)

(assert (=> b!509626 m!490207))

(declare-fun m!490209 () Bool)

(assert (=> b!509621 m!490209))

(declare-fun m!490211 () Bool)

(assert (=> b!509625 m!490211))

(check-sat (not b!509629) (not start!46032) (not b!509626) (not b!509628) (not b!509622) (not b!509621) (not b!509625) (not b!509623) (not b!509627))
(check-sat)
