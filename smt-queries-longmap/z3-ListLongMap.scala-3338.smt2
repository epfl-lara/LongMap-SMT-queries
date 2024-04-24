; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46010 () Bool)

(assert start!46010)

(declare-fun b!509507 () Bool)

(declare-fun res!310408 () Bool)

(declare-fun e!297941 () Bool)

(assert (=> b!509507 (=> (not res!310408) (not e!297941))))

(declare-datatypes ((array!32722 0))(
  ( (array!32723 (arr!15739 (Array (_ BitVec 32) (_ BitVec 64))) (size!16103 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32722)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509507 (= res!310408 (validKeyInArray!0 (select (arr!15739 a!3235) j!176)))))

(declare-fun b!509508 () Bool)

(declare-fun res!310414 () Bool)

(declare-fun e!297942 () Bool)

(assert (=> b!509508 (=> (not res!310414) (not e!297942))))

(declare-datatypes ((List!9804 0))(
  ( (Nil!9801) (Cons!9800 (h!10677 (_ BitVec 64)) (t!16024 List!9804)) )
))
(declare-fun arrayNoDuplicates!0 (array!32722 (_ BitVec 32) List!9804) Bool)

(assert (=> b!509508 (= res!310414 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9801))))

(declare-fun b!509509 () Bool)

(assert (=> b!509509 (= e!297941 e!297942)))

(declare-fun res!310409 () Bool)

(assert (=> b!509509 (=> (not res!310409) (not e!297942))))

(declare-datatypes ((SeekEntryResult!4162 0))(
  ( (MissingZero!4162 (index!18836 (_ BitVec 32))) (Found!4162 (index!18837 (_ BitVec 32))) (Intermediate!4162 (undefined!4974 Bool) (index!18838 (_ BitVec 32)) (x!47952 (_ BitVec 32))) (Undefined!4162) (MissingVacant!4162 (index!18839 (_ BitVec 32))) )
))
(declare-fun lt!232815 () SeekEntryResult!4162)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509509 (= res!310409 (or (= lt!232815 (MissingZero!4162 i!1204)) (= lt!232815 (MissingVacant!4162 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32722 (_ BitVec 32)) SeekEntryResult!4162)

(assert (=> b!509509 (= lt!232815 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509510 () Bool)

(declare-fun res!310406 () Bool)

(assert (=> b!509510 (=> (not res!310406) (not e!297942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32722 (_ BitVec 32)) Bool)

(assert (=> b!509510 (= res!310406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!297939 () Bool)

(declare-fun b!509511 () Bool)

(assert (=> b!509511 (= e!297939 (= (seekEntryOrOpen!0 (select (arr!15739 a!3235) j!176) a!3235 mask!3524) (Found!4162 j!176)))))

(declare-fun b!509512 () Bool)

(declare-fun res!310410 () Bool)

(assert (=> b!509512 (=> (not res!310410) (not e!297941))))

(declare-fun arrayContainsKey!0 (array!32722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509512 (= res!310410 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509513 () Bool)

(declare-fun res!310407 () Bool)

(assert (=> b!509513 (=> (not res!310407) (not e!297941))))

(assert (=> b!509513 (= res!310407 (validKeyInArray!0 k0!2280))))

(declare-fun res!310412 () Bool)

(assert (=> start!46010 (=> (not res!310412) (not e!297941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46010 (= res!310412 (validMask!0 mask!3524))))

(assert (=> start!46010 e!297941))

(assert (=> start!46010 true))

(declare-fun array_inv!11598 (array!32722) Bool)

(assert (=> start!46010 (array_inv!11598 a!3235)))

(declare-fun b!509514 () Bool)

(declare-fun res!310411 () Bool)

(assert (=> b!509514 (=> (not res!310411) (not e!297941))))

(assert (=> b!509514 (= res!310411 (and (= (size!16103 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16103 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16103 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509515 () Bool)

(assert (=> b!509515 (= e!297942 (not true))))

(declare-fun lt!232818 () (_ BitVec 32))

(declare-fun lt!232814 () SeekEntryResult!4162)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32722 (_ BitVec 32)) SeekEntryResult!4162)

(assert (=> b!509515 (= lt!232814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232818 (select (store (arr!15739 a!3235) i!1204 k0!2280) j!176) (array!32723 (store (arr!15739 a!3235) i!1204 k0!2280) (size!16103 a!3235)) mask!3524))))

(declare-fun lt!232816 () (_ BitVec 32))

(declare-fun lt!232819 () SeekEntryResult!4162)

(assert (=> b!509515 (= lt!232819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232816 (select (arr!15739 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509515 (= lt!232818 (toIndex!0 (select (store (arr!15739 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509515 (= lt!232816 (toIndex!0 (select (arr!15739 a!3235) j!176) mask!3524))))

(assert (=> b!509515 e!297939))

(declare-fun res!310413 () Bool)

(assert (=> b!509515 (=> (not res!310413) (not e!297939))))

(assert (=> b!509515 (= res!310413 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15643 0))(
  ( (Unit!15644) )
))
(declare-fun lt!232817 () Unit!15643)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15643)

(assert (=> b!509515 (= lt!232817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46010 res!310412) b!509514))

(assert (= (and b!509514 res!310411) b!509507))

(assert (= (and b!509507 res!310408) b!509513))

(assert (= (and b!509513 res!310407) b!509512))

(assert (= (and b!509512 res!310410) b!509509))

(assert (= (and b!509509 res!310409) b!509510))

(assert (= (and b!509510 res!310406) b!509508))

(assert (= (and b!509508 res!310414) b!509515))

(assert (= (and b!509515 res!310413) b!509511))

(declare-fun m!490681 () Bool)

(assert (=> b!509512 m!490681))

(declare-fun m!490683 () Bool)

(assert (=> b!509511 m!490683))

(assert (=> b!509511 m!490683))

(declare-fun m!490685 () Bool)

(assert (=> b!509511 m!490685))

(declare-fun m!490687 () Bool)

(assert (=> b!509509 m!490687))

(declare-fun m!490689 () Bool)

(assert (=> start!46010 m!490689))

(declare-fun m!490691 () Bool)

(assert (=> start!46010 m!490691))

(declare-fun m!490693 () Bool)

(assert (=> b!509515 m!490693))

(declare-fun m!490695 () Bool)

(assert (=> b!509515 m!490695))

(declare-fun m!490697 () Bool)

(assert (=> b!509515 m!490697))

(assert (=> b!509515 m!490683))

(declare-fun m!490699 () Bool)

(assert (=> b!509515 m!490699))

(assert (=> b!509515 m!490683))

(declare-fun m!490701 () Bool)

(assert (=> b!509515 m!490701))

(assert (=> b!509515 m!490683))

(assert (=> b!509515 m!490697))

(declare-fun m!490703 () Bool)

(assert (=> b!509515 m!490703))

(declare-fun m!490705 () Bool)

(assert (=> b!509515 m!490705))

(assert (=> b!509515 m!490697))

(declare-fun m!490707 () Bool)

(assert (=> b!509515 m!490707))

(declare-fun m!490709 () Bool)

(assert (=> b!509513 m!490709))

(declare-fun m!490711 () Bool)

(assert (=> b!509508 m!490711))

(assert (=> b!509507 m!490683))

(assert (=> b!509507 m!490683))

(declare-fun m!490713 () Bool)

(assert (=> b!509507 m!490713))

(declare-fun m!490715 () Bool)

(assert (=> b!509510 m!490715))

(check-sat (not b!509511) (not start!46010) (not b!509508) (not b!509512) (not b!509513) (not b!509510) (not b!509509) (not b!509507) (not b!509515))
(check-sat)
