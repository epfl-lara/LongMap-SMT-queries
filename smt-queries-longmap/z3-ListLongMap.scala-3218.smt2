; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45056 () Bool)

(assert start!45056)

(declare-fun b!494486 () Bool)

(declare-fun e!290205 () Bool)

(declare-fun e!290204 () Bool)

(assert (=> b!494486 (= e!290205 (not e!290204))))

(declare-fun res!297059 () Bool)

(assert (=> b!494486 (=> res!297059 e!290204)))

(declare-fun lt!223799 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3852 0))(
  ( (MissingZero!3852 (index!17587 (_ BitVec 32))) (Found!3852 (index!17588 (_ BitVec 32))) (Intermediate!3852 (undefined!4664 Bool) (index!17589 (_ BitVec 32)) (x!46658 (_ BitVec 32))) (Undefined!3852) (MissingVacant!3852 (index!17590 (_ BitVec 32))) )
))
(declare-fun lt!223801 () SeekEntryResult!3852)

(declare-datatypes ((array!32001 0))(
  ( (array!32002 (arr!15385 (Array (_ BitVec 32) (_ BitVec 64))) (size!15749 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32001)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32001 (_ BitVec 32)) SeekEntryResult!3852)

(assert (=> b!494486 (= res!297059 (= lt!223801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223799 (select (store (arr!15385 a!3235) i!1204 k0!2280) j!176) (array!32002 (store (arr!15385 a!3235) i!1204 k0!2280) (size!15749 a!3235)) mask!3524)))))

(declare-fun lt!223804 () (_ BitVec 32))

(assert (=> b!494486 (= lt!223801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223804 (select (arr!15385 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494486 (= lt!223799 (toIndex!0 (select (store (arr!15385 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494486 (= lt!223804 (toIndex!0 (select (arr!15385 a!3235) j!176) mask!3524))))

(declare-fun lt!223803 () SeekEntryResult!3852)

(assert (=> b!494486 (= lt!223803 (Found!3852 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32001 (_ BitVec 32)) SeekEntryResult!3852)

(assert (=> b!494486 (= lt!223803 (seekEntryOrOpen!0 (select (arr!15385 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32001 (_ BitVec 32)) Bool)

(assert (=> b!494486 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14650 0))(
  ( (Unit!14651) )
))
(declare-fun lt!223802 () Unit!14650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14650)

(assert (=> b!494486 (= lt!223802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494487 () Bool)

(declare-fun res!297065 () Bool)

(declare-fun e!290202 () Bool)

(assert (=> b!494487 (=> (not res!297065) (not e!290202))))

(assert (=> b!494487 (= res!297065 (and (= (size!15749 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15749 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15749 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494488 () Bool)

(declare-fun res!297057 () Bool)

(assert (=> b!494488 (=> res!297057 e!290204)))

(get-info :version)

(assert (=> b!494488 (= res!297057 (or (not ((_ is Intermediate!3852) lt!223801)) (not (undefined!4664 lt!223801))))))

(declare-fun b!494489 () Bool)

(declare-fun res!297062 () Bool)

(assert (=> b!494489 (=> (not res!297062) (not e!290205))))

(declare-datatypes ((List!9543 0))(
  ( (Nil!9540) (Cons!9539 (h!10407 (_ BitVec 64)) (t!15771 List!9543)) )
))
(declare-fun arrayNoDuplicates!0 (array!32001 (_ BitVec 32) List!9543) Bool)

(assert (=> b!494489 (= res!297062 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9540))))

(declare-fun b!494490 () Bool)

(declare-fun res!297056 () Bool)

(assert (=> b!494490 (=> (not res!297056) (not e!290202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494490 (= res!297056 (validKeyInArray!0 k0!2280))))

(declare-fun b!494491 () Bool)

(assert (=> b!494491 (= e!290202 e!290205)))

(declare-fun res!297058 () Bool)

(assert (=> b!494491 (=> (not res!297058) (not e!290205))))

(declare-fun lt!223800 () SeekEntryResult!3852)

(assert (=> b!494491 (= res!297058 (or (= lt!223800 (MissingZero!3852 i!1204)) (= lt!223800 (MissingVacant!3852 i!1204))))))

(assert (=> b!494491 (= lt!223800 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494492 () Bool)

(assert (=> b!494492 (= e!290204 true)))

(assert (=> b!494492 (= lt!223803 Undefined!3852)))

(declare-fun res!297061 () Bool)

(assert (=> start!45056 (=> (not res!297061) (not e!290202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45056 (= res!297061 (validMask!0 mask!3524))))

(assert (=> start!45056 e!290202))

(assert (=> start!45056 true))

(declare-fun array_inv!11181 (array!32001) Bool)

(assert (=> start!45056 (array_inv!11181 a!3235)))

(declare-fun b!494493 () Bool)

(declare-fun res!297063 () Bool)

(assert (=> b!494493 (=> (not res!297063) (not e!290202))))

(declare-fun arrayContainsKey!0 (array!32001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494493 (= res!297063 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494494 () Bool)

(declare-fun res!297060 () Bool)

(assert (=> b!494494 (=> (not res!297060) (not e!290202))))

(assert (=> b!494494 (= res!297060 (validKeyInArray!0 (select (arr!15385 a!3235) j!176)))))

(declare-fun b!494495 () Bool)

(declare-fun res!297064 () Bool)

(assert (=> b!494495 (=> (not res!297064) (not e!290205))))

(assert (=> b!494495 (= res!297064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45056 res!297061) b!494487))

(assert (= (and b!494487 res!297065) b!494494))

(assert (= (and b!494494 res!297060) b!494490))

(assert (= (and b!494490 res!297056) b!494493))

(assert (= (and b!494493 res!297063) b!494491))

(assert (= (and b!494491 res!297058) b!494495))

(assert (= (and b!494495 res!297064) b!494489))

(assert (= (and b!494489 res!297062) b!494486))

(assert (= (and b!494486 (not res!297059)) b!494488))

(assert (= (and b!494488 (not res!297057)) b!494492))

(declare-fun m!475539 () Bool)

(assert (=> start!45056 m!475539))

(declare-fun m!475541 () Bool)

(assert (=> start!45056 m!475541))

(declare-fun m!475543 () Bool)

(assert (=> b!494489 m!475543))

(declare-fun m!475545 () Bool)

(assert (=> b!494495 m!475545))

(declare-fun m!475547 () Bool)

(assert (=> b!494490 m!475547))

(declare-fun m!475549 () Bool)

(assert (=> b!494494 m!475549))

(assert (=> b!494494 m!475549))

(declare-fun m!475551 () Bool)

(assert (=> b!494494 m!475551))

(declare-fun m!475553 () Bool)

(assert (=> b!494493 m!475553))

(declare-fun m!475555 () Bool)

(assert (=> b!494491 m!475555))

(declare-fun m!475557 () Bool)

(assert (=> b!494486 m!475557))

(declare-fun m!475559 () Bool)

(assert (=> b!494486 m!475559))

(declare-fun m!475561 () Bool)

(assert (=> b!494486 m!475561))

(assert (=> b!494486 m!475549))

(declare-fun m!475563 () Bool)

(assert (=> b!494486 m!475563))

(assert (=> b!494486 m!475549))

(declare-fun m!475565 () Bool)

(assert (=> b!494486 m!475565))

(assert (=> b!494486 m!475561))

(declare-fun m!475567 () Bool)

(assert (=> b!494486 m!475567))

(assert (=> b!494486 m!475549))

(declare-fun m!475569 () Bool)

(assert (=> b!494486 m!475569))

(assert (=> b!494486 m!475549))

(declare-fun m!475571 () Bool)

(assert (=> b!494486 m!475571))

(assert (=> b!494486 m!475561))

(declare-fun m!475573 () Bool)

(assert (=> b!494486 m!475573))

(check-sat (not start!45056) (not b!494493) (not b!494495) (not b!494494) (not b!494489) (not b!494486) (not b!494490) (not b!494491))
(check-sat)
