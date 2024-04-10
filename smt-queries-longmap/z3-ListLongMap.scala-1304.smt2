; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26384 () Bool)

(assert start!26384)

(declare-fun b!273603 () Bool)

(declare-fun res!137597 () Bool)

(declare-fun e!175330 () Bool)

(assert (=> b!273603 (=> (not res!137597) (not e!175330))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273603 (= res!137597 (validKeyInArray!0 k0!2581))))

(declare-fun b!273604 () Bool)

(declare-fun res!137594 () Bool)

(assert (=> b!273604 (=> (not res!137594) (not e!175330))))

(declare-datatypes ((array!13481 0))(
  ( (array!13482 (arr!6390 (Array (_ BitVec 32) (_ BitVec 64))) (size!6742 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13481)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273604 (= res!137594 (and (= (size!6742 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6742 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6742 a!3325))))))

(declare-fun b!273605 () Bool)

(declare-fun e!175329 () Bool)

(declare-fun e!175331 () Bool)

(assert (=> b!273605 (= e!175329 e!175331)))

(declare-fun res!137598 () Bool)

(assert (=> b!273605 (=> (not res!137598) (not e!175331))))

(assert (=> b!273605 (= res!137598 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136473 () array!13481)

(assert (=> b!273605 (= lt!136473 (array!13482 (store (arr!6390 a!3325) i!1267 k0!2581) (size!6742 a!3325)))))

(declare-fun res!137601 () Bool)

(assert (=> start!26384 (=> (not res!137601) (not e!175330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26384 (= res!137601 (validMask!0 mask!3868))))

(assert (=> start!26384 e!175330))

(declare-fun array_inv!4353 (array!13481) Bool)

(assert (=> start!26384 (array_inv!4353 a!3325)))

(assert (=> start!26384 true))

(declare-fun b!273606 () Bool)

(assert (=> b!273606 (= e!175330 e!175329)))

(declare-fun res!137599 () Bool)

(assert (=> b!273606 (=> (not res!137599) (not e!175329))))

(declare-datatypes ((SeekEntryResult!1548 0))(
  ( (MissingZero!1548 (index!8362 (_ BitVec 32))) (Found!1548 (index!8363 (_ BitVec 32))) (Intermediate!1548 (undefined!2360 Bool) (index!8364 (_ BitVec 32)) (x!26665 (_ BitVec 32))) (Undefined!1548) (MissingVacant!1548 (index!8365 (_ BitVec 32))) )
))
(declare-fun lt!136477 () SeekEntryResult!1548)

(assert (=> b!273606 (= res!137599 (or (= lt!136477 (MissingZero!1548 i!1267)) (= lt!136477 (MissingVacant!1548 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13481 (_ BitVec 32)) SeekEntryResult!1548)

(assert (=> b!273606 (= lt!136477 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273607 () Bool)

(declare-fun res!137593 () Bool)

(assert (=> b!273607 (=> (not res!137593) (not e!175330))))

(declare-datatypes ((List!4198 0))(
  ( (Nil!4195) (Cons!4194 (h!4861 (_ BitVec 64)) (t!9280 List!4198)) )
))
(declare-fun arrayNoDuplicates!0 (array!13481 (_ BitVec 32) List!4198) Bool)

(assert (=> b!273607 (= res!137593 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4195))))

(declare-fun b!273608 () Bool)

(assert (=> b!273608 (= e!175331 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13481 (_ BitVec 32)) Bool)

(assert (=> b!273608 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8583 0))(
  ( (Unit!8584) )
))
(declare-fun lt!136476 () Unit!8583)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8583)

(assert (=> b!273608 (= lt!136476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273608 (= (seekEntryOrOpen!0 (select (arr!6390 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6390 a!3325) i!1267 k0!2581) startIndex!26) lt!136473 mask!3868))))

(declare-fun lt!136474 () Unit!8583)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8583)

(assert (=> b!273608 (= lt!136474 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273608 (arrayNoDuplicates!0 lt!136473 #b00000000000000000000000000000000 Nil!4195)))

(declare-fun lt!136475 () Unit!8583)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4198) Unit!8583)

(assert (=> b!273608 (= lt!136475 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4195))))

(declare-fun b!273609 () Bool)

(declare-fun res!137600 () Bool)

(assert (=> b!273609 (=> (not res!137600) (not e!175331))))

(assert (=> b!273609 (= res!137600 (validKeyInArray!0 (select (arr!6390 a!3325) startIndex!26)))))

(declare-fun b!273610 () Bool)

(declare-fun res!137595 () Bool)

(assert (=> b!273610 (=> (not res!137595) (not e!175330))))

(declare-fun arrayContainsKey!0 (array!13481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273610 (= res!137595 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273611 () Bool)

(declare-fun res!137596 () Bool)

(assert (=> b!273611 (=> (not res!137596) (not e!175329))))

(assert (=> b!273611 (= res!137596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26384 res!137601) b!273604))

(assert (= (and b!273604 res!137594) b!273603))

(assert (= (and b!273603 res!137597) b!273607))

(assert (= (and b!273607 res!137593) b!273610))

(assert (= (and b!273610 res!137595) b!273606))

(assert (= (and b!273606 res!137599) b!273611))

(assert (= (and b!273611 res!137596) b!273605))

(assert (= (and b!273605 res!137598) b!273609))

(assert (= (and b!273609 res!137600) b!273608))

(declare-fun m!288849 () Bool)

(assert (=> b!273611 m!288849))

(declare-fun m!288851 () Bool)

(assert (=> b!273605 m!288851))

(declare-fun m!288853 () Bool)

(assert (=> b!273603 m!288853))

(declare-fun m!288855 () Bool)

(assert (=> b!273608 m!288855))

(declare-fun m!288857 () Bool)

(assert (=> b!273608 m!288857))

(declare-fun m!288859 () Bool)

(assert (=> b!273608 m!288859))

(declare-fun m!288861 () Bool)

(assert (=> b!273608 m!288861))

(assert (=> b!273608 m!288859))

(assert (=> b!273608 m!288851))

(declare-fun m!288863 () Bool)

(assert (=> b!273608 m!288863))

(declare-fun m!288865 () Bool)

(assert (=> b!273608 m!288865))

(declare-fun m!288867 () Bool)

(assert (=> b!273608 m!288867))

(declare-fun m!288869 () Bool)

(assert (=> b!273608 m!288869))

(assert (=> b!273608 m!288865))

(declare-fun m!288871 () Bool)

(assert (=> b!273608 m!288871))

(declare-fun m!288873 () Bool)

(assert (=> b!273606 m!288873))

(assert (=> b!273609 m!288865))

(assert (=> b!273609 m!288865))

(declare-fun m!288875 () Bool)

(assert (=> b!273609 m!288875))

(declare-fun m!288877 () Bool)

(assert (=> start!26384 m!288877))

(declare-fun m!288879 () Bool)

(assert (=> start!26384 m!288879))

(declare-fun m!288881 () Bool)

(assert (=> b!273610 m!288881))

(declare-fun m!288883 () Bool)

(assert (=> b!273607 m!288883))

(check-sat (not b!273603) (not start!26384) (not b!273611) (not b!273607) (not b!273606) (not b!273608) (not b!273610) (not b!273609))
(check-sat)
