; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26304 () Bool)

(assert start!26304)

(declare-fun b!272570 () Bool)

(declare-fun res!136542 () Bool)

(declare-fun e!174906 () Bool)

(assert (=> b!272570 (=> (not res!136542) (not e!174906))))

(declare-datatypes ((array!13400 0))(
  ( (array!13401 (arr!6349 (Array (_ BitVec 32) (_ BitVec 64))) (size!6701 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13400)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13400 (_ BitVec 32)) Bool)

(assert (=> b!272570 (= res!136542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272571 () Bool)

(assert (=> b!272571 (= e!174906 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4070 0))(
  ( (Nil!4067) (Cons!4066 (h!4733 (_ BitVec 64)) (t!9144 List!4070)) )
))
(declare-fun arrayNoDuplicates!0 (array!13400 (_ BitVec 32) List!4070) Bool)

(assert (=> b!272571 (arrayNoDuplicates!0 (array!13401 (store (arr!6349 a!3325) i!1267 k0!2581) (size!6701 a!3325)) #b00000000000000000000000000000000 Nil!4067)))

(declare-datatypes ((Unit!8483 0))(
  ( (Unit!8484) )
))
(declare-fun lt!136079 () Unit!8483)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13400 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4070) Unit!8483)

(assert (=> b!272571 (= lt!136079 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4067))))

(declare-fun res!136539 () Bool)

(declare-fun e!174908 () Bool)

(assert (=> start!26304 (=> (not res!136539) (not e!174908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26304 (= res!136539 (validMask!0 mask!3868))))

(assert (=> start!26304 e!174908))

(declare-fun array_inv!4299 (array!13400) Bool)

(assert (=> start!26304 (array_inv!4299 a!3325)))

(assert (=> start!26304 true))

(declare-fun b!272572 () Bool)

(declare-fun res!136541 () Bool)

(assert (=> b!272572 (=> (not res!136541) (not e!174908))))

(declare-fun arrayContainsKey!0 (array!13400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272572 (= res!136541 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272573 () Bool)

(assert (=> b!272573 (= e!174908 e!174906)))

(declare-fun res!136535 () Bool)

(assert (=> b!272573 (=> (not res!136535) (not e!174906))))

(declare-datatypes ((SeekEntryResult!1472 0))(
  ( (MissingZero!1472 (index!8058 (_ BitVec 32))) (Found!1472 (index!8059 (_ BitVec 32))) (Intermediate!1472 (undefined!2284 Bool) (index!8060 (_ BitVec 32)) (x!26485 (_ BitVec 32))) (Undefined!1472) (MissingVacant!1472 (index!8061 (_ BitVec 32))) )
))
(declare-fun lt!136080 () SeekEntryResult!1472)

(assert (=> b!272573 (= res!136535 (or (= lt!136080 (MissingZero!1472 i!1267)) (= lt!136080 (MissingVacant!1472 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13400 (_ BitVec 32)) SeekEntryResult!1472)

(assert (=> b!272573 (= lt!136080 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272574 () Bool)

(declare-fun res!136534 () Bool)

(assert (=> b!272574 (=> (not res!136534) (not e!174906))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272574 (= res!136534 (not (= startIndex!26 i!1267)))))

(declare-fun b!272575 () Bool)

(declare-fun res!136537 () Bool)

(assert (=> b!272575 (=> (not res!136537) (not e!174906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272575 (= res!136537 (validKeyInArray!0 (select (arr!6349 a!3325) startIndex!26)))))

(declare-fun b!272576 () Bool)

(declare-fun res!136540 () Bool)

(assert (=> b!272576 (=> (not res!136540) (not e!174908))))

(assert (=> b!272576 (= res!136540 (and (= (size!6701 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6701 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6701 a!3325))))))

(declare-fun b!272577 () Bool)

(declare-fun res!136538 () Bool)

(assert (=> b!272577 (=> (not res!136538) (not e!174908))))

(assert (=> b!272577 (= res!136538 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4067))))

(declare-fun b!272578 () Bool)

(declare-fun res!136536 () Bool)

(assert (=> b!272578 (=> (not res!136536) (not e!174908))))

(assert (=> b!272578 (= res!136536 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26304 res!136539) b!272576))

(assert (= (and b!272576 res!136540) b!272578))

(assert (= (and b!272578 res!136536) b!272577))

(assert (= (and b!272577 res!136538) b!272572))

(assert (= (and b!272572 res!136541) b!272573))

(assert (= (and b!272573 res!136535) b!272570))

(assert (= (and b!272570 res!136542) b!272574))

(assert (= (and b!272574 res!136534) b!272575))

(assert (= (and b!272575 res!136537) b!272571))

(declare-fun m!287819 () Bool)

(assert (=> start!26304 m!287819))

(declare-fun m!287821 () Bool)

(assert (=> start!26304 m!287821))

(declare-fun m!287823 () Bool)

(assert (=> b!272571 m!287823))

(declare-fun m!287825 () Bool)

(assert (=> b!272571 m!287825))

(declare-fun m!287827 () Bool)

(assert (=> b!272571 m!287827))

(declare-fun m!287829 () Bool)

(assert (=> b!272578 m!287829))

(declare-fun m!287831 () Bool)

(assert (=> b!272573 m!287831))

(declare-fun m!287833 () Bool)

(assert (=> b!272575 m!287833))

(assert (=> b!272575 m!287833))

(declare-fun m!287835 () Bool)

(assert (=> b!272575 m!287835))

(declare-fun m!287837 () Bool)

(assert (=> b!272572 m!287837))

(declare-fun m!287839 () Bool)

(assert (=> b!272577 m!287839))

(declare-fun m!287841 () Bool)

(assert (=> b!272570 m!287841))

(check-sat (not b!272571) (not b!272575) (not b!272578) (not b!272577) (not b!272572) (not b!272570) (not start!26304) (not b!272573))
(check-sat)
