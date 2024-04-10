; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26424 () Bool)

(assert start!26424)

(declare-fun res!138133 () Bool)

(declare-fun e!175568 () Bool)

(assert (=> start!26424 (=> (not res!138133) (not e!175568))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26424 (= res!138133 (validMask!0 mask!3868))))

(assert (=> start!26424 e!175568))

(declare-datatypes ((array!13521 0))(
  ( (array!13522 (arr!6410 (Array (_ BitVec 32) (_ BitVec 64))) (size!6762 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13521)

(declare-fun array_inv!4373 (array!13521) Bool)

(assert (=> start!26424 (array_inv!4373 a!3325)))

(assert (=> start!26424 true))

(declare-fun b!274143 () Bool)

(declare-fun res!138136 () Bool)

(declare-fun e!175569 () Bool)

(assert (=> b!274143 (=> (not res!138136) (not e!175569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13521 (_ BitVec 32)) Bool)

(assert (=> b!274143 (= res!138136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274144 () Bool)

(assert (=> b!274144 (= e!175568 e!175569)))

(declare-fun res!138138 () Bool)

(assert (=> b!274144 (=> (not res!138138) (not e!175569))))

(declare-datatypes ((SeekEntryResult!1568 0))(
  ( (MissingZero!1568 (index!8442 (_ BitVec 32))) (Found!1568 (index!8443 (_ BitVec 32))) (Intermediate!1568 (undefined!2380 Bool) (index!8444 (_ BitVec 32)) (x!26741 (_ BitVec 32))) (Undefined!1568) (MissingVacant!1568 (index!8445 (_ BitVec 32))) )
))
(declare-fun lt!136777 () SeekEntryResult!1568)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274144 (= res!138138 (or (= lt!136777 (MissingZero!1568 i!1267)) (= lt!136777 (MissingVacant!1568 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13521 (_ BitVec 32)) SeekEntryResult!1568)

(assert (=> b!274144 (= lt!136777 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274145 () Bool)

(declare-fun e!175570 () Bool)

(assert (=> b!274145 (= e!175569 e!175570)))

(declare-fun res!138141 () Bool)

(assert (=> b!274145 (=> (not res!138141) (not e!175570))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274145 (= res!138141 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136774 () array!13521)

(assert (=> b!274145 (= lt!136774 (array!13522 (store (arr!6410 a!3325) i!1267 k!2581) (size!6762 a!3325)))))

(declare-fun b!274146 () Bool)

(declare-fun res!138135 () Bool)

(assert (=> b!274146 (=> (not res!138135) (not e!175568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274146 (= res!138135 (validKeyInArray!0 k!2581))))

(declare-fun b!274147 () Bool)

(declare-fun res!138139 () Bool)

(assert (=> b!274147 (=> (not res!138139) (not e!175570))))

(assert (=> b!274147 (= res!138139 (validKeyInArray!0 (select (arr!6410 a!3325) startIndex!26)))))

(declare-fun b!274148 () Bool)

(declare-fun res!138140 () Bool)

(assert (=> b!274148 (=> (not res!138140) (not e!175568))))

(declare-fun arrayContainsKey!0 (array!13521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274148 (= res!138140 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274149 () Bool)

(assert (=> b!274149 (= e!175570 (not true))))

(assert (=> b!274149 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8623 0))(
  ( (Unit!8624) )
))
(declare-fun lt!136773 () Unit!8623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8623)

(assert (=> b!274149 (= lt!136773 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274149 (= (seekEntryOrOpen!0 (select (arr!6410 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6410 a!3325) i!1267 k!2581) startIndex!26) lt!136774 mask!3868))))

(declare-fun lt!136776 () Unit!8623)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8623)

(assert (=> b!274149 (= lt!136776 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4218 0))(
  ( (Nil!4215) (Cons!4214 (h!4881 (_ BitVec 64)) (t!9300 List!4218)) )
))
(declare-fun arrayNoDuplicates!0 (array!13521 (_ BitVec 32) List!4218) Bool)

(assert (=> b!274149 (arrayNoDuplicates!0 lt!136774 #b00000000000000000000000000000000 Nil!4215)))

(declare-fun lt!136775 () Unit!8623)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4218) Unit!8623)

(assert (=> b!274149 (= lt!136775 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4215))))

(declare-fun b!274150 () Bool)

(declare-fun res!138134 () Bool)

(assert (=> b!274150 (=> (not res!138134) (not e!175568))))

(assert (=> b!274150 (= res!138134 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4215))))

(declare-fun b!274151 () Bool)

(declare-fun res!138137 () Bool)

(assert (=> b!274151 (=> (not res!138137) (not e!175568))))

(assert (=> b!274151 (= res!138137 (and (= (size!6762 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6762 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6762 a!3325))))))

(assert (= (and start!26424 res!138133) b!274151))

(assert (= (and b!274151 res!138137) b!274146))

(assert (= (and b!274146 res!138135) b!274150))

(assert (= (and b!274150 res!138134) b!274148))

(assert (= (and b!274148 res!138140) b!274144))

(assert (= (and b!274144 res!138138) b!274143))

(assert (= (and b!274143 res!138136) b!274145))

(assert (= (and b!274145 res!138141) b!274147))

(assert (= (and b!274147 res!138139) b!274149))

(declare-fun m!289569 () Bool)

(assert (=> b!274146 m!289569))

(declare-fun m!289571 () Bool)

(assert (=> b!274148 m!289571))

(declare-fun m!289573 () Bool)

(assert (=> b!274143 m!289573))

(declare-fun m!289575 () Bool)

(assert (=> b!274150 m!289575))

(declare-fun m!289577 () Bool)

(assert (=> b!274145 m!289577))

(declare-fun m!289579 () Bool)

(assert (=> start!26424 m!289579))

(declare-fun m!289581 () Bool)

(assert (=> start!26424 m!289581))

(declare-fun m!289583 () Bool)

(assert (=> b!274149 m!289583))

(declare-fun m!289585 () Bool)

(assert (=> b!274149 m!289585))

(declare-fun m!289587 () Bool)

(assert (=> b!274149 m!289587))

(assert (=> b!274149 m!289585))

(assert (=> b!274149 m!289577))

(declare-fun m!289589 () Bool)

(assert (=> b!274149 m!289589))

(declare-fun m!289591 () Bool)

(assert (=> b!274149 m!289591))

(declare-fun m!289593 () Bool)

(assert (=> b!274149 m!289593))

(assert (=> b!274149 m!289591))

(declare-fun m!289595 () Bool)

(assert (=> b!274149 m!289595))

(declare-fun m!289597 () Bool)

(assert (=> b!274149 m!289597))

(declare-fun m!289599 () Bool)

(assert (=> b!274149 m!289599))

(assert (=> b!274147 m!289591))

(assert (=> b!274147 m!289591))

(declare-fun m!289601 () Bool)

(assert (=> b!274147 m!289601))

(declare-fun m!289603 () Bool)

(assert (=> b!274144 m!289603))

(push 1)

