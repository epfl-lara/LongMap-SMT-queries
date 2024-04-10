; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45840 () Bool)

(assert start!45840)

(declare-fun b!507643 () Bool)

(declare-fun e!297078 () Bool)

(assert (=> b!507643 (= e!297078 true)))

(declare-fun lt!231892 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32596 0))(
  ( (array!32597 (arr!15678 (Array (_ BitVec 32) (_ BitVec 64))) (size!16042 (_ BitVec 32))) )
))
(declare-fun lt!231891 () array!32596)

(declare-datatypes ((SeekEntryResult!4145 0))(
  ( (MissingZero!4145 (index!18768 (_ BitVec 32))) (Found!4145 (index!18769 (_ BitVec 32))) (Intermediate!4145 (undefined!4957 Bool) (index!18770 (_ BitVec 32)) (x!47762 (_ BitVec 32))) (Undefined!4145) (MissingVacant!4145 (index!18771 (_ BitVec 32))) )
))
(declare-fun lt!231893 () SeekEntryResult!4145)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32596 (_ BitVec 32)) SeekEntryResult!4145)

(assert (=> b!507643 (= lt!231893 (seekEntryOrOpen!0 lt!231892 lt!231891 mask!3524))))

(assert (=> b!507643 false))

(declare-fun b!507644 () Bool)

(declare-fun e!297076 () Bool)

(declare-fun e!297073 () Bool)

(assert (=> b!507644 (= e!297076 e!297073)))

(declare-fun res!308610 () Bool)

(assert (=> b!507644 (=> (not res!308610) (not e!297073))))

(declare-fun lt!231897 () SeekEntryResult!4145)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507644 (= res!308610 (or (= lt!231897 (MissingZero!4145 i!1204)) (= lt!231897 (MissingVacant!4145 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun a!3235 () array!32596)

(assert (=> b!507644 (= lt!231897 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507645 () Bool)

(declare-fun res!308604 () Bool)

(assert (=> b!507645 (=> (not res!308604) (not e!297076))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507645 (= res!308604 (validKeyInArray!0 (select (arr!15678 a!3235) j!176)))))

(declare-fun b!507646 () Bool)

(declare-fun e!297077 () Bool)

(assert (=> b!507646 (= e!297077 (= (seekEntryOrOpen!0 (select (arr!15678 a!3235) j!176) a!3235 mask!3524) (Found!4145 j!176)))))

(declare-fun res!308603 () Bool)

(assert (=> start!45840 (=> (not res!308603) (not e!297076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45840 (= res!308603 (validMask!0 mask!3524))))

(assert (=> start!45840 e!297076))

(assert (=> start!45840 true))

(declare-fun array_inv!11474 (array!32596) Bool)

(assert (=> start!45840 (array_inv!11474 a!3235)))

(declare-fun b!507647 () Bool)

(declare-fun res!308608 () Bool)

(assert (=> b!507647 (=> (not res!308608) (not e!297076))))

(declare-fun arrayContainsKey!0 (array!32596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507647 (= res!308608 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507648 () Bool)

(declare-fun res!308605 () Bool)

(assert (=> b!507648 (=> (not res!308605) (not e!297076))))

(assert (=> b!507648 (= res!308605 (validKeyInArray!0 k!2280))))

(declare-fun b!507649 () Bool)

(declare-fun res!308612 () Bool)

(assert (=> b!507649 (=> (not res!308612) (not e!297073))))

(declare-datatypes ((List!9836 0))(
  ( (Nil!9833) (Cons!9832 (h!10709 (_ BitVec 64)) (t!16064 List!9836)) )
))
(declare-fun arrayNoDuplicates!0 (array!32596 (_ BitVec 32) List!9836) Bool)

(assert (=> b!507649 (= res!308612 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9833))))

(declare-fun b!507650 () Bool)

(declare-fun e!297075 () Bool)

(assert (=> b!507650 (= e!297073 (not e!297075))))

(declare-fun res!308607 () Bool)

(assert (=> b!507650 (=> res!308607 e!297075)))

(declare-fun lt!231895 () SeekEntryResult!4145)

(declare-fun lt!231896 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32596 (_ BitVec 32)) SeekEntryResult!4145)

(assert (=> b!507650 (= res!308607 (= lt!231895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231896 lt!231892 lt!231891 mask!3524)))))

(declare-fun lt!231898 () (_ BitVec 32))

(assert (=> b!507650 (= lt!231895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231898 (select (arr!15678 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507650 (= lt!231896 (toIndex!0 lt!231892 mask!3524))))

(assert (=> b!507650 (= lt!231892 (select (store (arr!15678 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507650 (= lt!231898 (toIndex!0 (select (arr!15678 a!3235) j!176) mask!3524))))

(assert (=> b!507650 (= lt!231891 (array!32597 (store (arr!15678 a!3235) i!1204 k!2280) (size!16042 a!3235)))))

(assert (=> b!507650 e!297077))

(declare-fun res!308606 () Bool)

(assert (=> b!507650 (=> (not res!308606) (not e!297077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32596 (_ BitVec 32)) Bool)

(assert (=> b!507650 (= res!308606 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15578 0))(
  ( (Unit!15579) )
))
(declare-fun lt!231890 () Unit!15578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15578)

(assert (=> b!507650 (= lt!231890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507651 () Bool)

(declare-fun res!308602 () Bool)

(assert (=> b!507651 (=> (not res!308602) (not e!297073))))

(assert (=> b!507651 (= res!308602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507652 () Bool)

(assert (=> b!507652 (= e!297075 e!297078)))

(declare-fun res!308611 () Bool)

(assert (=> b!507652 (=> res!308611 e!297078)))

(declare-fun lt!231894 () Bool)

(assert (=> b!507652 (= res!308611 (or (and (not lt!231894) (undefined!4957 lt!231895)) (and (not lt!231894) (not (undefined!4957 lt!231895)))))))

(assert (=> b!507652 (= lt!231894 (not (is-Intermediate!4145 lt!231895)))))

(declare-fun b!507653 () Bool)

(declare-fun res!308609 () Bool)

(assert (=> b!507653 (=> (not res!308609) (not e!297076))))

(assert (=> b!507653 (= res!308609 (and (= (size!16042 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16042 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16042 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45840 res!308603) b!507653))

(assert (= (and b!507653 res!308609) b!507645))

(assert (= (and b!507645 res!308604) b!507648))

(assert (= (and b!507648 res!308605) b!507647))

(assert (= (and b!507647 res!308608) b!507644))

(assert (= (and b!507644 res!308610) b!507651))

(assert (= (and b!507651 res!308602) b!507649))

(assert (= (and b!507649 res!308612) b!507650))

(assert (= (and b!507650 res!308606) b!507646))

(assert (= (and b!507650 (not res!308607)) b!507652))

(assert (= (and b!507652 (not res!308611)) b!507643))

(declare-fun m!488445 () Bool)

(assert (=> b!507643 m!488445))

(declare-fun m!488447 () Bool)

(assert (=> b!507645 m!488447))

(assert (=> b!507645 m!488447))

(declare-fun m!488449 () Bool)

(assert (=> b!507645 m!488449))

(declare-fun m!488451 () Bool)

(assert (=> b!507648 m!488451))

(declare-fun m!488453 () Bool)

(assert (=> b!507647 m!488453))

(assert (=> b!507650 m!488447))

(declare-fun m!488455 () Bool)

(assert (=> b!507650 m!488455))

(declare-fun m!488457 () Bool)

(assert (=> b!507650 m!488457))

(declare-fun m!488459 () Bool)

(assert (=> b!507650 m!488459))

(declare-fun m!488461 () Bool)

(assert (=> b!507650 m!488461))

(declare-fun m!488463 () Bool)

(assert (=> b!507650 m!488463))

(assert (=> b!507650 m!488447))

(declare-fun m!488465 () Bool)

(assert (=> b!507650 m!488465))

(assert (=> b!507650 m!488447))

(declare-fun m!488467 () Bool)

(assert (=> b!507650 m!488467))

(declare-fun m!488469 () Bool)

(assert (=> b!507650 m!488469))

(assert (=> b!507646 m!488447))

(assert (=> b!507646 m!488447))

(declare-fun m!488471 () Bool)

(assert (=> b!507646 m!488471))

(declare-fun m!488473 () Bool)

(assert (=> b!507644 m!488473))

(declare-fun m!488475 () Bool)

(assert (=> start!45840 m!488475))

(declare-fun m!488477 () Bool)

(assert (=> start!45840 m!488477))

(declare-fun m!488479 () Bool)

(assert (=> b!507651 m!488479))

(declare-fun m!488481 () Bool)

(assert (=> b!507649 m!488481))

(push 1)

