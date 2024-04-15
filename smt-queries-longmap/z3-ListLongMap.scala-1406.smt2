; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27290 () Bool)

(assert start!27290)

(declare-fun b!282568 () Bool)

(declare-fun res!145690 () Bool)

(declare-fun e!179336 () Bool)

(assert (=> b!282568 (=> (not res!145690) (not e!179336))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282568 (= res!145690 (validKeyInArray!0 k0!2581))))

(declare-fun b!282569 () Bool)

(declare-fun e!179335 () Bool)

(declare-fun e!179334 () Bool)

(assert (=> b!282569 (= e!179335 e!179334)))

(declare-fun res!145695 () Bool)

(assert (=> b!282569 (=> (not res!145695) (not e!179334))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282569 (= res!145695 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14097 0))(
  ( (array!14098 (arr!6690 (Array (_ BitVec 32) (_ BitVec 64))) (size!7043 (_ BitVec 32))) )
))
(declare-fun lt!139517 () array!14097)

(declare-fun a!3325 () array!14097)

(assert (=> b!282569 (= lt!139517 (array!14098 (store (arr!6690 a!3325) i!1267 k0!2581) (size!7043 a!3325)))))

(declare-fun b!282570 () Bool)

(declare-fun res!145692 () Bool)

(assert (=> b!282570 (=> (not res!145692) (not e!179335))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14097 (_ BitVec 32)) Bool)

(assert (=> b!282570 (= res!145692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282571 () Bool)

(declare-fun res!145694 () Bool)

(assert (=> b!282571 (=> (not res!145694) (not e!179336))))

(declare-fun arrayContainsKey!0 (array!14097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282571 (= res!145694 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282572 () Bool)

(assert (=> b!282572 (= e!179334 (not true))))

(assert (=> b!282572 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8940 0))(
  ( (Unit!8941) )
))
(declare-fun lt!139520 () Unit!8940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8940)

(assert (=> b!282572 (= lt!139520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1847 0))(
  ( (MissingZero!1847 (index!9558 (_ BitVec 32))) (Found!1847 (index!9559 (_ BitVec 32))) (Intermediate!1847 (undefined!2659 Bool) (index!9560 (_ BitVec 32)) (x!27788 (_ BitVec 32))) (Undefined!1847) (MissingVacant!1847 (index!9561 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14097 (_ BitVec 32)) SeekEntryResult!1847)

(assert (=> b!282572 (= (seekEntryOrOpen!0 (select (arr!6690 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6690 a!3325) i!1267 k0!2581) startIndex!26) lt!139517 mask!3868))))

(declare-fun lt!139521 () Unit!8940)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8940)

(assert (=> b!282572 (= lt!139521 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4471 0))(
  ( (Nil!4468) (Cons!4467 (h!5137 (_ BitVec 64)) (t!9544 List!4471)) )
))
(declare-fun arrayNoDuplicates!0 (array!14097 (_ BitVec 32) List!4471) Bool)

(assert (=> b!282572 (arrayNoDuplicates!0 lt!139517 #b00000000000000000000000000000000 Nil!4468)))

(declare-fun lt!139518 () Unit!8940)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14097 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4471) Unit!8940)

(assert (=> b!282572 (= lt!139518 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4468))))

(declare-fun b!282573 () Bool)

(declare-fun res!145696 () Bool)

(assert (=> b!282573 (=> (not res!145696) (not e!179336))))

(assert (=> b!282573 (= res!145696 (and (= (size!7043 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7043 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7043 a!3325))))))

(declare-fun b!282567 () Bool)

(assert (=> b!282567 (= e!179336 e!179335)))

(declare-fun res!145688 () Bool)

(assert (=> b!282567 (=> (not res!145688) (not e!179335))))

(declare-fun lt!139519 () SeekEntryResult!1847)

(assert (=> b!282567 (= res!145688 (or (= lt!139519 (MissingZero!1847 i!1267)) (= lt!139519 (MissingVacant!1847 i!1267))))))

(assert (=> b!282567 (= lt!139519 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!145691 () Bool)

(assert (=> start!27290 (=> (not res!145691) (not e!179336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27290 (= res!145691 (validMask!0 mask!3868))))

(assert (=> start!27290 e!179336))

(declare-fun array_inv!4662 (array!14097) Bool)

(assert (=> start!27290 (array_inv!4662 a!3325)))

(assert (=> start!27290 true))

(declare-fun b!282574 () Bool)

(declare-fun res!145693 () Bool)

(assert (=> b!282574 (=> (not res!145693) (not e!179336))))

(assert (=> b!282574 (= res!145693 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4468))))

(declare-fun b!282575 () Bool)

(declare-fun res!145689 () Bool)

(assert (=> b!282575 (=> (not res!145689) (not e!179334))))

(assert (=> b!282575 (= res!145689 (validKeyInArray!0 (select (arr!6690 a!3325) startIndex!26)))))

(assert (= (and start!27290 res!145691) b!282573))

(assert (= (and b!282573 res!145696) b!282568))

(assert (= (and b!282568 res!145690) b!282574))

(assert (= (and b!282574 res!145693) b!282571))

(assert (= (and b!282571 res!145694) b!282567))

(assert (= (and b!282567 res!145688) b!282570))

(assert (= (and b!282570 res!145692) b!282569))

(assert (= (and b!282569 res!145695) b!282575))

(assert (= (and b!282575 res!145689) b!282572))

(declare-fun m!296783 () Bool)

(assert (=> b!282569 m!296783))

(declare-fun m!296785 () Bool)

(assert (=> b!282570 m!296785))

(declare-fun m!296787 () Bool)

(assert (=> b!282567 m!296787))

(declare-fun m!296789 () Bool)

(assert (=> b!282574 m!296789))

(declare-fun m!296791 () Bool)

(assert (=> b!282568 m!296791))

(declare-fun m!296793 () Bool)

(assert (=> b!282575 m!296793))

(assert (=> b!282575 m!296793))

(declare-fun m!296795 () Bool)

(assert (=> b!282575 m!296795))

(declare-fun m!296797 () Bool)

(assert (=> b!282572 m!296797))

(declare-fun m!296799 () Bool)

(assert (=> b!282572 m!296799))

(declare-fun m!296801 () Bool)

(assert (=> b!282572 m!296801))

(assert (=> b!282572 m!296799))

(assert (=> b!282572 m!296783))

(declare-fun m!296803 () Bool)

(assert (=> b!282572 m!296803))

(declare-fun m!296805 () Bool)

(assert (=> b!282572 m!296805))

(declare-fun m!296807 () Bool)

(assert (=> b!282572 m!296807))

(assert (=> b!282572 m!296793))

(declare-fun m!296809 () Bool)

(assert (=> b!282572 m!296809))

(declare-fun m!296811 () Bool)

(assert (=> b!282572 m!296811))

(assert (=> b!282572 m!296793))

(declare-fun m!296813 () Bool)

(assert (=> b!282571 m!296813))

(declare-fun m!296815 () Bool)

(assert (=> start!27290 m!296815))

(declare-fun m!296817 () Bool)

(assert (=> start!27290 m!296817))

(check-sat (not start!27290) (not b!282570) (not b!282567) (not b!282571) (not b!282572) (not b!282574) (not b!282568) (not b!282575))
(check-sat)
