; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27164 () Bool)

(assert start!27164)

(declare-fun b!281040 () Bool)

(declare-fun res!144113 () Bool)

(declare-fun e!178741 () Bool)

(assert (=> b!281040 (=> (not res!144113) (not e!178741))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281040 (= res!144113 (not (= startIndex!26 i!1267)))))

(declare-fun b!281041 () Bool)

(declare-fun res!144111 () Bool)

(assert (=> b!281041 (=> (not res!144111) (not e!178741))))

(declare-datatypes ((array!13982 0))(
  ( (array!13983 (arr!6633 (Array (_ BitVec 32) (_ BitVec 64))) (size!6985 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13982)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281041 (= res!144111 (validKeyInArray!0 (select (arr!6633 a!3325) startIndex!26)))))

(declare-fun b!281042 () Bool)

(assert (=> b!281042 (= e!178741 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4441 0))(
  ( (Nil!4438) (Cons!4437 (h!5107 (_ BitVec 64)) (t!9523 List!4441)) )
))
(declare-fun arrayNoDuplicates!0 (array!13982 (_ BitVec 32) List!4441) Bool)

(assert (=> b!281042 (arrayNoDuplicates!0 (array!13983 (store (arr!6633 a!3325) i!1267 k0!2581) (size!6985 a!3325)) #b00000000000000000000000000000000 Nil!4438)))

(declare-datatypes ((Unit!8866 0))(
  ( (Unit!8867) )
))
(declare-fun lt!138960 () Unit!8866)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13982 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4441) Unit!8866)

(assert (=> b!281042 (= lt!138960 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4438))))

(declare-fun b!281043 () Bool)

(declare-fun res!144114 () Bool)

(assert (=> b!281043 (=> (not res!144114) (not e!178741))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13982 (_ BitVec 32)) Bool)

(assert (=> b!281043 (= res!144114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281044 () Bool)

(declare-fun res!144110 () Bool)

(declare-fun e!178740 () Bool)

(assert (=> b!281044 (=> (not res!144110) (not e!178740))))

(assert (=> b!281044 (= res!144110 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4438))))

(declare-fun res!144112 () Bool)

(assert (=> start!27164 (=> (not res!144112) (not e!178740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27164 (= res!144112 (validMask!0 mask!3868))))

(assert (=> start!27164 e!178740))

(declare-fun array_inv!4596 (array!13982) Bool)

(assert (=> start!27164 (array_inv!4596 a!3325)))

(assert (=> start!27164 true))

(declare-fun b!281045 () Bool)

(declare-fun res!144116 () Bool)

(assert (=> b!281045 (=> (not res!144116) (not e!178740))))

(assert (=> b!281045 (= res!144116 (validKeyInArray!0 k0!2581))))

(declare-fun b!281046 () Bool)

(declare-fun res!144109 () Bool)

(assert (=> b!281046 (=> (not res!144109) (not e!178740))))

(assert (=> b!281046 (= res!144109 (and (= (size!6985 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6985 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6985 a!3325))))))

(declare-fun b!281047 () Bool)

(assert (=> b!281047 (= e!178740 e!178741)))

(declare-fun res!144117 () Bool)

(assert (=> b!281047 (=> (not res!144117) (not e!178741))))

(declare-datatypes ((SeekEntryResult!1791 0))(
  ( (MissingZero!1791 (index!9334 (_ BitVec 32))) (Found!1791 (index!9335 (_ BitVec 32))) (Intermediate!1791 (undefined!2603 Bool) (index!9336 (_ BitVec 32)) (x!27565 (_ BitVec 32))) (Undefined!1791) (MissingVacant!1791 (index!9337 (_ BitVec 32))) )
))
(declare-fun lt!138961 () SeekEntryResult!1791)

(assert (=> b!281047 (= res!144117 (or (= lt!138961 (MissingZero!1791 i!1267)) (= lt!138961 (MissingVacant!1791 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13982 (_ BitVec 32)) SeekEntryResult!1791)

(assert (=> b!281047 (= lt!138961 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281048 () Bool)

(declare-fun res!144115 () Bool)

(assert (=> b!281048 (=> (not res!144115) (not e!178740))))

(declare-fun arrayContainsKey!0 (array!13982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281048 (= res!144115 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27164 res!144112) b!281046))

(assert (= (and b!281046 res!144109) b!281045))

(assert (= (and b!281045 res!144116) b!281044))

(assert (= (and b!281044 res!144110) b!281048))

(assert (= (and b!281048 res!144115) b!281047))

(assert (= (and b!281047 res!144117) b!281043))

(assert (= (and b!281043 res!144114) b!281040))

(assert (= (and b!281040 res!144113) b!281041))

(assert (= (and b!281041 res!144111) b!281042))

(declare-fun m!295407 () Bool)

(assert (=> b!281043 m!295407))

(declare-fun m!295409 () Bool)

(assert (=> b!281042 m!295409))

(declare-fun m!295411 () Bool)

(assert (=> b!281042 m!295411))

(declare-fun m!295413 () Bool)

(assert (=> b!281042 m!295413))

(declare-fun m!295415 () Bool)

(assert (=> b!281044 m!295415))

(declare-fun m!295417 () Bool)

(assert (=> b!281047 m!295417))

(declare-fun m!295419 () Bool)

(assert (=> b!281045 m!295419))

(declare-fun m!295421 () Bool)

(assert (=> start!27164 m!295421))

(declare-fun m!295423 () Bool)

(assert (=> start!27164 m!295423))

(declare-fun m!295425 () Bool)

(assert (=> b!281048 m!295425))

(declare-fun m!295427 () Bool)

(assert (=> b!281041 m!295427))

(assert (=> b!281041 m!295427))

(declare-fun m!295429 () Bool)

(assert (=> b!281041 m!295429))

(check-sat (not start!27164) (not b!281047) (not b!281042) (not b!281041) (not b!281048) (not b!281044) (not b!281043) (not b!281045))
(check-sat)
