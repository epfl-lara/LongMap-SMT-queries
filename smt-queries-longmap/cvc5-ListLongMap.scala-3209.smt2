; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45000 () Bool)

(assert start!45000)

(declare-fun b!493646 () Bool)

(declare-fun res!296223 () Bool)

(declare-fun e!289867 () Bool)

(assert (=> b!493646 (=> (not res!296223) (not e!289867))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493646 (= res!296223 (validKeyInArray!0 k!2280))))

(declare-fun b!493647 () Bool)

(declare-fun res!296222 () Bool)

(assert (=> b!493647 (=> (not res!296222) (not e!289867))))

(declare-datatypes ((array!31945 0))(
  ( (array!31946 (arr!15357 (Array (_ BitVec 32) (_ BitVec 64))) (size!15721 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31945)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493647 (= res!296222 (validKeyInArray!0 (select (arr!15357 a!3235) j!176)))))

(declare-fun b!493648 () Bool)

(declare-fun e!289869 () Bool)

(declare-fun e!289868 () Bool)

(assert (=> b!493648 (= e!289869 (not e!289868))))

(declare-fun res!296217 () Bool)

(assert (=> b!493648 (=> res!296217 e!289868)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3824 0))(
  ( (MissingZero!3824 (index!17475 (_ BitVec 32))) (Found!3824 (index!17476 (_ BitVec 32))) (Intermediate!3824 (undefined!4636 Bool) (index!17477 (_ BitVec 32)) (x!46558 (_ BitVec 32))) (Undefined!3824) (MissingVacant!3824 (index!17478 (_ BitVec 32))) )
))
(declare-fun lt!223296 () SeekEntryResult!3824)

(declare-fun lt!223297 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31945 (_ BitVec 32)) SeekEntryResult!3824)

(assert (=> b!493648 (= res!296217 (= lt!223296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223297 (select (store (arr!15357 a!3235) i!1204 k!2280) j!176) (array!31946 (store (arr!15357 a!3235) i!1204 k!2280) (size!15721 a!3235)) mask!3524)))))

(declare-fun lt!223300 () (_ BitVec 32))

(assert (=> b!493648 (= lt!223296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223300 (select (arr!15357 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493648 (= lt!223297 (toIndex!0 (select (store (arr!15357 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493648 (= lt!223300 (toIndex!0 (select (arr!15357 a!3235) j!176) mask!3524))))

(declare-fun lt!223299 () SeekEntryResult!3824)

(assert (=> b!493648 (= lt!223299 (Found!3824 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31945 (_ BitVec 32)) SeekEntryResult!3824)

(assert (=> b!493648 (= lt!223299 (seekEntryOrOpen!0 (select (arr!15357 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31945 (_ BitVec 32)) Bool)

(assert (=> b!493648 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14594 0))(
  ( (Unit!14595) )
))
(declare-fun lt!223298 () Unit!14594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14594)

(assert (=> b!493648 (= lt!223298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493649 () Bool)

(declare-fun res!296221 () Bool)

(assert (=> b!493649 (=> (not res!296221) (not e!289867))))

(assert (=> b!493649 (= res!296221 (and (= (size!15721 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15721 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15721 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493650 () Bool)

(assert (=> b!493650 (= e!289867 e!289869)))

(declare-fun res!296220 () Bool)

(assert (=> b!493650 (=> (not res!296220) (not e!289869))))

(declare-fun lt!223295 () SeekEntryResult!3824)

(assert (=> b!493650 (= res!296220 (or (= lt!223295 (MissingZero!3824 i!1204)) (= lt!223295 (MissingVacant!3824 i!1204))))))

(assert (=> b!493650 (= lt!223295 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493651 () Bool)

(declare-fun res!296219 () Bool)

(assert (=> b!493651 (=> (not res!296219) (not e!289869))))

(declare-datatypes ((List!9515 0))(
  ( (Nil!9512) (Cons!9511 (h!10379 (_ BitVec 64)) (t!15743 List!9515)) )
))
(declare-fun arrayNoDuplicates!0 (array!31945 (_ BitVec 32) List!9515) Bool)

(assert (=> b!493651 (= res!296219 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9512))))

(declare-fun res!296224 () Bool)

(assert (=> start!45000 (=> (not res!296224) (not e!289867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45000 (= res!296224 (validMask!0 mask!3524))))

(assert (=> start!45000 e!289867))

(assert (=> start!45000 true))

(declare-fun array_inv!11153 (array!31945) Bool)

(assert (=> start!45000 (array_inv!11153 a!3235)))

(declare-fun b!493652 () Bool)

(declare-fun res!296225 () Bool)

(assert (=> b!493652 (=> (not res!296225) (not e!289867))))

(declare-fun arrayContainsKey!0 (array!31945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493652 (= res!296225 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493653 () Bool)

(declare-fun res!296216 () Bool)

(assert (=> b!493653 (=> (not res!296216) (not e!289869))))

(assert (=> b!493653 (= res!296216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493654 () Bool)

(declare-fun res!296218 () Bool)

(assert (=> b!493654 (=> res!296218 e!289868)))

(assert (=> b!493654 (= res!296218 (or (not (is-Intermediate!3824 lt!223296)) (not (undefined!4636 lt!223296))))))

(declare-fun b!493655 () Bool)

(assert (=> b!493655 (= e!289868 true)))

(assert (=> b!493655 (= lt!223299 Undefined!3824)))

(assert (= (and start!45000 res!296224) b!493649))

(assert (= (and b!493649 res!296221) b!493647))

(assert (= (and b!493647 res!296222) b!493646))

(assert (= (and b!493646 res!296223) b!493652))

(assert (= (and b!493652 res!296225) b!493650))

(assert (= (and b!493650 res!296220) b!493653))

(assert (= (and b!493653 res!296216) b!493651))

(assert (= (and b!493651 res!296219) b!493648))

(assert (= (and b!493648 (not res!296217)) b!493654))

(assert (= (and b!493654 (not res!296218)) b!493655))

(declare-fun m!474531 () Bool)

(assert (=> b!493647 m!474531))

(assert (=> b!493647 m!474531))

(declare-fun m!474533 () Bool)

(assert (=> b!493647 m!474533))

(declare-fun m!474535 () Bool)

(assert (=> b!493648 m!474535))

(declare-fun m!474537 () Bool)

(assert (=> b!493648 m!474537))

(declare-fun m!474539 () Bool)

(assert (=> b!493648 m!474539))

(assert (=> b!493648 m!474531))

(declare-fun m!474541 () Bool)

(assert (=> b!493648 m!474541))

(assert (=> b!493648 m!474531))

(declare-fun m!474543 () Bool)

(assert (=> b!493648 m!474543))

(declare-fun m!474545 () Bool)

(assert (=> b!493648 m!474545))

(assert (=> b!493648 m!474531))

(declare-fun m!474547 () Bool)

(assert (=> b!493648 m!474547))

(assert (=> b!493648 m!474539))

(declare-fun m!474549 () Bool)

(assert (=> b!493648 m!474549))

(assert (=> b!493648 m!474539))

(declare-fun m!474551 () Bool)

(assert (=> b!493648 m!474551))

(assert (=> b!493648 m!474531))

(declare-fun m!474553 () Bool)

(assert (=> b!493650 m!474553))

(declare-fun m!474555 () Bool)

(assert (=> b!493653 m!474555))

(declare-fun m!474557 () Bool)

(assert (=> start!45000 m!474557))

(declare-fun m!474559 () Bool)

(assert (=> start!45000 m!474559))

(declare-fun m!474561 () Bool)

(assert (=> b!493652 m!474561))

(declare-fun m!474563 () Bool)

(assert (=> b!493651 m!474563))

(declare-fun m!474565 () Bool)

(assert (=> b!493646 m!474565))

(push 1)

