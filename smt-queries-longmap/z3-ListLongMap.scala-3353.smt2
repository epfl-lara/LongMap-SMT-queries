; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46100 () Bool)

(assert start!46100)

(declare-fun b!510722 () Bool)

(declare-fun res!311623 () Bool)

(declare-fun e!298479 () Bool)

(assert (=> b!510722 (=> (not res!311623) (not e!298479))))

(declare-datatypes ((array!32812 0))(
  ( (array!32813 (arr!15784 (Array (_ BitVec 32) (_ BitVec 64))) (size!16148 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32812)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32812 (_ BitVec 32)) Bool)

(assert (=> b!510722 (= res!311623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510723 () Bool)

(declare-fun res!311625 () Bool)

(assert (=> b!510723 (=> (not res!311625) (not e!298479))))

(declare-datatypes ((List!9849 0))(
  ( (Nil!9846) (Cons!9845 (h!10722 (_ BitVec 64)) (t!16069 List!9849)) )
))
(declare-fun arrayNoDuplicates!0 (array!32812 (_ BitVec 32) List!9849) Bool)

(assert (=> b!510723 (= res!311625 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9846))))

(declare-fun b!510724 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!298480 () Bool)

(declare-datatypes ((SeekEntryResult!4207 0))(
  ( (MissingZero!4207 (index!19016 (_ BitVec 32))) (Found!4207 (index!19017 (_ BitVec 32))) (Intermediate!4207 (undefined!5019 Bool) (index!19018 (_ BitVec 32)) (x!48117 (_ BitVec 32))) (Undefined!4207) (MissingVacant!4207 (index!19019 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32812 (_ BitVec 32)) SeekEntryResult!4207)

(assert (=> b!510724 (= e!298480 (= (seekEntryOrOpen!0 (select (arr!15784 a!3235) j!176) a!3235 mask!3524) (Found!4207 j!176)))))

(declare-fun b!510725 () Bool)

(declare-fun res!311629 () Bool)

(declare-fun e!298482 () Bool)

(assert (=> b!510725 (=> (not res!311629) (not e!298482))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510725 (= res!311629 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510726 () Bool)

(assert (=> b!510726 (= e!298482 e!298479)))

(declare-fun res!311627 () Bool)

(assert (=> b!510726 (=> (not res!311627) (not e!298479))))

(declare-fun lt!233626 () SeekEntryResult!4207)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510726 (= res!311627 (or (= lt!233626 (MissingZero!4207 i!1204)) (= lt!233626 (MissingVacant!4207 i!1204))))))

(assert (=> b!510726 (= lt!233626 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510727 () Bool)

(assert (=> b!510727 (= e!298479 (not true))))

(declare-fun lt!233624 () (_ BitVec 32))

(declare-fun lt!233629 () SeekEntryResult!4207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32812 (_ BitVec 32)) SeekEntryResult!4207)

(assert (=> b!510727 (= lt!233629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233624 (select (store (arr!15784 a!3235) i!1204 k0!2280) j!176) (array!32813 (store (arr!15784 a!3235) i!1204 k0!2280) (size!16148 a!3235)) mask!3524))))

(declare-fun lt!233625 () (_ BitVec 32))

(declare-fun lt!233628 () SeekEntryResult!4207)

(assert (=> b!510727 (= lt!233628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233625 (select (arr!15784 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510727 (= lt!233624 (toIndex!0 (select (store (arr!15784 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510727 (= lt!233625 (toIndex!0 (select (arr!15784 a!3235) j!176) mask!3524))))

(assert (=> b!510727 e!298480))

(declare-fun res!311622 () Bool)

(assert (=> b!510727 (=> (not res!311622) (not e!298480))))

(assert (=> b!510727 (= res!311622 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15733 0))(
  ( (Unit!15734) )
))
(declare-fun lt!233627 () Unit!15733)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15733)

(assert (=> b!510727 (= lt!233627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!311628 () Bool)

(assert (=> start!46100 (=> (not res!311628) (not e!298482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46100 (= res!311628 (validMask!0 mask!3524))))

(assert (=> start!46100 e!298482))

(assert (=> start!46100 true))

(declare-fun array_inv!11643 (array!32812) Bool)

(assert (=> start!46100 (array_inv!11643 a!3235)))

(declare-fun b!510728 () Bool)

(declare-fun res!311624 () Bool)

(assert (=> b!510728 (=> (not res!311624) (not e!298482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510728 (= res!311624 (validKeyInArray!0 (select (arr!15784 a!3235) j!176)))))

(declare-fun b!510729 () Bool)

(declare-fun res!311621 () Bool)

(assert (=> b!510729 (=> (not res!311621) (not e!298482))))

(assert (=> b!510729 (= res!311621 (validKeyInArray!0 k0!2280))))

(declare-fun b!510730 () Bool)

(declare-fun res!311626 () Bool)

(assert (=> b!510730 (=> (not res!311626) (not e!298482))))

(assert (=> b!510730 (= res!311626 (and (= (size!16148 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16148 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16148 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46100 res!311628) b!510730))

(assert (= (and b!510730 res!311626) b!510728))

(assert (= (and b!510728 res!311624) b!510729))

(assert (= (and b!510729 res!311621) b!510725))

(assert (= (and b!510725 res!311629) b!510726))

(assert (= (and b!510726 res!311627) b!510722))

(assert (= (and b!510722 res!311623) b!510723))

(assert (= (and b!510723 res!311625) b!510727))

(assert (= (and b!510727 res!311622) b!510724))

(declare-fun m!492397 () Bool)

(assert (=> b!510725 m!492397))

(declare-fun m!492399 () Bool)

(assert (=> b!510722 m!492399))

(declare-fun m!492401 () Bool)

(assert (=> b!510723 m!492401))

(declare-fun m!492403 () Bool)

(assert (=> b!510727 m!492403))

(declare-fun m!492405 () Bool)

(assert (=> b!510727 m!492405))

(declare-fun m!492407 () Bool)

(assert (=> b!510727 m!492407))

(declare-fun m!492409 () Bool)

(assert (=> b!510727 m!492409))

(assert (=> b!510727 m!492403))

(declare-fun m!492411 () Bool)

(assert (=> b!510727 m!492411))

(declare-fun m!492413 () Bool)

(assert (=> b!510727 m!492413))

(declare-fun m!492415 () Bool)

(assert (=> b!510727 m!492415))

(assert (=> b!510727 m!492403))

(declare-fun m!492417 () Bool)

(assert (=> b!510727 m!492417))

(assert (=> b!510727 m!492411))

(declare-fun m!492419 () Bool)

(assert (=> b!510727 m!492419))

(assert (=> b!510727 m!492411))

(assert (=> b!510724 m!492411))

(assert (=> b!510724 m!492411))

(declare-fun m!492421 () Bool)

(assert (=> b!510724 m!492421))

(assert (=> b!510728 m!492411))

(assert (=> b!510728 m!492411))

(declare-fun m!492423 () Bool)

(assert (=> b!510728 m!492423))

(declare-fun m!492425 () Bool)

(assert (=> b!510726 m!492425))

(declare-fun m!492427 () Bool)

(assert (=> start!46100 m!492427))

(declare-fun m!492429 () Bool)

(assert (=> start!46100 m!492429))

(declare-fun m!492431 () Bool)

(assert (=> b!510729 m!492431))

(check-sat (not b!510723) (not b!510729) (not start!46100) (not b!510722) (not b!510728) (not b!510726) (not b!510724) (not b!510727) (not b!510725))
(check-sat)
