; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44958 () Bool)

(assert start!44958)

(declare-fun b!493041 () Bool)

(declare-fun e!289605 () Bool)

(declare-fun e!289608 () Bool)

(assert (=> b!493041 (= e!289605 e!289608)))

(declare-fun res!295615 () Bool)

(assert (=> b!493041 (=> (not res!295615) (not e!289608))))

(declare-datatypes ((SeekEntryResult!3803 0))(
  ( (MissingZero!3803 (index!17391 (_ BitVec 32))) (Found!3803 (index!17392 (_ BitVec 32))) (Intermediate!3803 (undefined!4615 Bool) (index!17393 (_ BitVec 32)) (x!46481 (_ BitVec 32))) (Undefined!3803) (MissingVacant!3803 (index!17394 (_ BitVec 32))) )
))
(declare-fun lt!222928 () SeekEntryResult!3803)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493041 (= res!295615 (or (= lt!222928 (MissingZero!3803 i!1204)) (= lt!222928 (MissingVacant!3803 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31903 0))(
  ( (array!31904 (arr!15336 (Array (_ BitVec 32) (_ BitVec 64))) (size!15700 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31903)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31903 (_ BitVec 32)) SeekEntryResult!3803)

(assert (=> b!493041 (= lt!222928 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!295613 () Bool)

(assert (=> start!44958 (=> (not res!295613) (not e!289605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44958 (= res!295613 (validMask!0 mask!3524))))

(assert (=> start!44958 e!289605))

(assert (=> start!44958 true))

(declare-fun array_inv!11132 (array!31903) Bool)

(assert (=> start!44958 (array_inv!11132 a!3235)))

(declare-fun b!493042 () Bool)

(assert (=> b!493042 (= e!289608 (not true))))

(declare-fun lt!222930 () SeekEntryResult!3803)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222931 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31903 (_ BitVec 32)) SeekEntryResult!3803)

(assert (=> b!493042 (= lt!222930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222931 (select (store (arr!15336 a!3235) i!1204 k!2280) j!176) (array!31904 (store (arr!15336 a!3235) i!1204 k!2280) (size!15700 a!3235)) mask!3524))))

(declare-fun lt!222926 () SeekEntryResult!3803)

(declare-fun lt!222929 () (_ BitVec 32))

(assert (=> b!493042 (= lt!222926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222929 (select (arr!15336 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493042 (= lt!222931 (toIndex!0 (select (store (arr!15336 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493042 (= lt!222929 (toIndex!0 (select (arr!15336 a!3235) j!176) mask!3524))))

(declare-fun e!289607 () Bool)

(assert (=> b!493042 e!289607))

(declare-fun res!295617 () Bool)

(assert (=> b!493042 (=> (not res!295617) (not e!289607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31903 (_ BitVec 32)) Bool)

(assert (=> b!493042 (= res!295617 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14552 0))(
  ( (Unit!14553) )
))
(declare-fun lt!222927 () Unit!14552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14552)

(assert (=> b!493042 (= lt!222927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493043 () Bool)

(declare-fun res!295619 () Bool)

(assert (=> b!493043 (=> (not res!295619) (not e!289605))))

(declare-fun arrayContainsKey!0 (array!31903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493043 (= res!295619 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493044 () Bool)

(assert (=> b!493044 (= e!289607 (= (seekEntryOrOpen!0 (select (arr!15336 a!3235) j!176) a!3235 mask!3524) (Found!3803 j!176)))))

(declare-fun b!493045 () Bool)

(declare-fun res!295612 () Bool)

(assert (=> b!493045 (=> (not res!295612) (not e!289605))))

(assert (=> b!493045 (= res!295612 (and (= (size!15700 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15700 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15700 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493046 () Bool)

(declare-fun res!295616 () Bool)

(assert (=> b!493046 (=> (not res!295616) (not e!289608))))

(declare-datatypes ((List!9494 0))(
  ( (Nil!9491) (Cons!9490 (h!10358 (_ BitVec 64)) (t!15722 List!9494)) )
))
(declare-fun arrayNoDuplicates!0 (array!31903 (_ BitVec 32) List!9494) Bool)

(assert (=> b!493046 (= res!295616 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9491))))

(declare-fun b!493047 () Bool)

(declare-fun res!295614 () Bool)

(assert (=> b!493047 (=> (not res!295614) (not e!289605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493047 (= res!295614 (validKeyInArray!0 k!2280))))

(declare-fun b!493048 () Bool)

(declare-fun res!295618 () Bool)

(assert (=> b!493048 (=> (not res!295618) (not e!289605))))

(assert (=> b!493048 (= res!295618 (validKeyInArray!0 (select (arr!15336 a!3235) j!176)))))

(declare-fun b!493049 () Bool)

(declare-fun res!295611 () Bool)

(assert (=> b!493049 (=> (not res!295611) (not e!289608))))

(assert (=> b!493049 (= res!295611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44958 res!295613) b!493045))

(assert (= (and b!493045 res!295612) b!493048))

(assert (= (and b!493048 res!295618) b!493047))

(assert (= (and b!493047 res!295614) b!493043))

(assert (= (and b!493043 res!295619) b!493041))

(assert (= (and b!493041 res!295615) b!493049))

(assert (= (and b!493049 res!295611) b!493046))

(assert (= (and b!493046 res!295616) b!493042))

(assert (= (and b!493042 res!295617) b!493044))

(declare-fun m!473775 () Bool)

(assert (=> b!493046 m!473775))

(declare-fun m!473777 () Bool)

(assert (=> b!493044 m!473777))

(assert (=> b!493044 m!473777))

(declare-fun m!473779 () Bool)

(assert (=> b!493044 m!473779))

(declare-fun m!473781 () Bool)

(assert (=> b!493047 m!473781))

(declare-fun m!473783 () Bool)

(assert (=> b!493041 m!473783))

(declare-fun m!473785 () Bool)

(assert (=> b!493049 m!473785))

(assert (=> b!493048 m!473777))

(assert (=> b!493048 m!473777))

(declare-fun m!473787 () Bool)

(assert (=> b!493048 m!473787))

(declare-fun m!473789 () Bool)

(assert (=> b!493043 m!473789))

(declare-fun m!473791 () Bool)

(assert (=> start!44958 m!473791))

(declare-fun m!473793 () Bool)

(assert (=> start!44958 m!473793))

(declare-fun m!473795 () Bool)

(assert (=> b!493042 m!473795))

(declare-fun m!473797 () Bool)

(assert (=> b!493042 m!473797))

(declare-fun m!473799 () Bool)

(assert (=> b!493042 m!473799))

(assert (=> b!493042 m!473799))

(declare-fun m!473801 () Bool)

(assert (=> b!493042 m!473801))

(assert (=> b!493042 m!473777))

(declare-fun m!473803 () Bool)

(assert (=> b!493042 m!473803))

(assert (=> b!493042 m!473777))

(declare-fun m!473805 () Bool)

(assert (=> b!493042 m!473805))

(assert (=> b!493042 m!473799))

(declare-fun m!473807 () Bool)

(assert (=> b!493042 m!473807))

(assert (=> b!493042 m!473777))

(declare-fun m!473809 () Bool)

(assert (=> b!493042 m!473809))

(push 1)

