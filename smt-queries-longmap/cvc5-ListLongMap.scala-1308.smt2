; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26406 () Bool)

(assert start!26406)

(declare-fun b!273900 () Bool)

(declare-fun res!137893 () Bool)

(declare-fun e!175460 () Bool)

(assert (=> b!273900 (=> (not res!137893) (not e!175460))))

(declare-datatypes ((array!13503 0))(
  ( (array!13504 (arr!6401 (Array (_ BitVec 32) (_ BitVec 64))) (size!6753 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13503)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13503 (_ BitVec 32)) Bool)

(assert (=> b!273900 (= res!137893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273901 () Bool)

(declare-fun res!137894 () Bool)

(declare-fun e!175461 () Bool)

(assert (=> b!273901 (=> (not res!137894) (not e!175461))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273901 (= res!137894 (validKeyInArray!0 (select (arr!6401 a!3325) startIndex!26)))))

(declare-fun b!273902 () Bool)

(declare-fun res!137890 () Bool)

(declare-fun e!175462 () Bool)

(assert (=> b!273902 (=> (not res!137890) (not e!175462))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273902 (= res!137890 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273903 () Bool)

(declare-fun res!137895 () Bool)

(assert (=> b!273903 (=> (not res!137895) (not e!175462))))

(assert (=> b!273903 (= res!137895 (validKeyInArray!0 k!2581))))

(declare-fun b!273904 () Bool)

(assert (=> b!273904 (= e!175460 e!175461)))

(declare-fun res!137898 () Bool)

(assert (=> b!273904 (=> (not res!137898) (not e!175461))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273904 (= res!137898 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136638 () array!13503)

(assert (=> b!273904 (= lt!136638 (array!13504 (store (arr!6401 a!3325) i!1267 k!2581) (size!6753 a!3325)))))

(declare-fun b!273905 () Bool)

(declare-fun res!137892 () Bool)

(assert (=> b!273905 (=> (not res!137892) (not e!175462))))

(declare-datatypes ((List!4209 0))(
  ( (Nil!4206) (Cons!4205 (h!4872 (_ BitVec 64)) (t!9291 List!4209)) )
))
(declare-fun arrayNoDuplicates!0 (array!13503 (_ BitVec 32) List!4209) Bool)

(assert (=> b!273905 (= res!137892 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4206))))

(declare-fun b!273906 () Bool)

(assert (=> b!273906 (= e!175461 (not true))))

(assert (=> b!273906 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8605 0))(
  ( (Unit!8606) )
))
(declare-fun lt!136639 () Unit!8605)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8605)

(assert (=> b!273906 (= lt!136639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1559 0))(
  ( (MissingZero!1559 (index!8406 (_ BitVec 32))) (Found!1559 (index!8407 (_ BitVec 32))) (Intermediate!1559 (undefined!2371 Bool) (index!8408 (_ BitVec 32)) (x!26708 (_ BitVec 32))) (Undefined!1559) (MissingVacant!1559 (index!8409 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13503 (_ BitVec 32)) SeekEntryResult!1559)

(assert (=> b!273906 (= (seekEntryOrOpen!0 (select (arr!6401 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6401 a!3325) i!1267 k!2581) startIndex!26) lt!136638 mask!3868))))

(declare-fun lt!136642 () Unit!8605)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13503 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8605)

(assert (=> b!273906 (= lt!136642 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273906 (arrayNoDuplicates!0 lt!136638 #b00000000000000000000000000000000 Nil!4206)))

(declare-fun lt!136640 () Unit!8605)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4209) Unit!8605)

(assert (=> b!273906 (= lt!136640 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4206))))

(declare-fun b!273908 () Bool)

(assert (=> b!273908 (= e!175462 e!175460)))

(declare-fun res!137897 () Bool)

(assert (=> b!273908 (=> (not res!137897) (not e!175460))))

(declare-fun lt!136641 () SeekEntryResult!1559)

(assert (=> b!273908 (= res!137897 (or (= lt!136641 (MissingZero!1559 i!1267)) (= lt!136641 (MissingVacant!1559 i!1267))))))

(assert (=> b!273908 (= lt!136641 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!137891 () Bool)

(assert (=> start!26406 (=> (not res!137891) (not e!175462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26406 (= res!137891 (validMask!0 mask!3868))))

(assert (=> start!26406 e!175462))

(declare-fun array_inv!4364 (array!13503) Bool)

(assert (=> start!26406 (array_inv!4364 a!3325)))

(assert (=> start!26406 true))

(declare-fun b!273907 () Bool)

(declare-fun res!137896 () Bool)

(assert (=> b!273907 (=> (not res!137896) (not e!175462))))

(assert (=> b!273907 (= res!137896 (and (= (size!6753 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6753 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6753 a!3325))))))

(assert (= (and start!26406 res!137891) b!273907))

(assert (= (and b!273907 res!137896) b!273903))

(assert (= (and b!273903 res!137895) b!273905))

(assert (= (and b!273905 res!137892) b!273902))

(assert (= (and b!273902 res!137890) b!273908))

(assert (= (and b!273908 res!137897) b!273900))

(assert (= (and b!273900 res!137893) b!273904))

(assert (= (and b!273904 res!137898) b!273901))

(assert (= (and b!273901 res!137894) b!273906))

(declare-fun m!289245 () Bool)

(assert (=> b!273905 m!289245))

(declare-fun m!289247 () Bool)

(assert (=> b!273901 m!289247))

(assert (=> b!273901 m!289247))

(declare-fun m!289249 () Bool)

(assert (=> b!273901 m!289249))

(declare-fun m!289251 () Bool)

(assert (=> b!273903 m!289251))

(declare-fun m!289253 () Bool)

(assert (=> b!273900 m!289253))

(declare-fun m!289255 () Bool)

(assert (=> b!273904 m!289255))

(declare-fun m!289257 () Bool)

(assert (=> b!273906 m!289257))

(declare-fun m!289259 () Bool)

(assert (=> b!273906 m!289259))

(assert (=> b!273906 m!289259))

(declare-fun m!289261 () Bool)

(assert (=> b!273906 m!289261))

(assert (=> b!273906 m!289255))

(declare-fun m!289263 () Bool)

(assert (=> b!273906 m!289263))

(assert (=> b!273906 m!289247))

(declare-fun m!289265 () Bool)

(assert (=> b!273906 m!289265))

(declare-fun m!289267 () Bool)

(assert (=> b!273906 m!289267))

(assert (=> b!273906 m!289247))

(declare-fun m!289269 () Bool)

(assert (=> b!273906 m!289269))

(declare-fun m!289271 () Bool)

(assert (=> b!273906 m!289271))

(declare-fun m!289273 () Bool)

(assert (=> start!26406 m!289273))

(declare-fun m!289275 () Bool)

(assert (=> start!26406 m!289275))

(declare-fun m!289277 () Bool)

(assert (=> b!273908 m!289277))

(declare-fun m!289279 () Bool)

(assert (=> b!273902 m!289279))

(push 1)

