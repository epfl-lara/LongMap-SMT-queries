; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26372 () Bool)

(assert start!26372)

(declare-fun b!273267 () Bool)

(declare-fun e!175146 () Bool)

(declare-fun e!175144 () Bool)

(assert (=> b!273267 (= e!175146 e!175144)))

(declare-fun res!137315 () Bool)

(assert (=> b!273267 (=> (not res!137315) (not e!175144))))

(declare-datatypes ((SeekEntryResult!1535 0))(
  ( (MissingZero!1535 (index!8310 (_ BitVec 32))) (Found!1535 (index!8311 (_ BitVec 32))) (Intermediate!1535 (undefined!2347 Bool) (index!8312 (_ BitVec 32)) (x!26635 (_ BitVec 32))) (Undefined!1535) (MissingVacant!1535 (index!8313 (_ BitVec 32))) )
))
(declare-fun lt!136189 () SeekEntryResult!1535)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273267 (= res!137315 (or (= lt!136189 (MissingZero!1535 i!1267)) (= lt!136189 (MissingVacant!1535 i!1267))))))

(declare-datatypes ((array!13458 0))(
  ( (array!13459 (arr!6378 (Array (_ BitVec 32) (_ BitVec 64))) (size!6731 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13458)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13458 (_ BitVec 32)) SeekEntryResult!1535)

(assert (=> b!273267 (= lt!136189 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273268 () Bool)

(declare-fun res!137311 () Bool)

(assert (=> b!273268 (=> (not res!137311) (not e!175146))))

(declare-fun arrayContainsKey!0 (array!13458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273268 (= res!137311 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273269 () Bool)

(declare-fun res!137309 () Bool)

(assert (=> b!273269 (=> (not res!137309) (not e!175146))))

(declare-datatypes ((List!4159 0))(
  ( (Nil!4156) (Cons!4155 (h!4822 (_ BitVec 64)) (t!9232 List!4159)) )
))
(declare-fun arrayNoDuplicates!0 (array!13458 (_ BitVec 32) List!4159) Bool)

(assert (=> b!273269 (= res!137309 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4156))))

(declare-fun b!273270 () Bool)

(declare-fun res!137314 () Bool)

(assert (=> b!273270 (=> (not res!137314) (not e!175146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273270 (= res!137314 (validKeyInArray!0 k0!2581))))

(declare-fun b!273271 () Bool)

(declare-fun res!137313 () Bool)

(assert (=> b!273271 (=> (not res!137313) (not e!175144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13458 (_ BitVec 32)) Bool)

(assert (=> b!273271 (= res!137313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273272 () Bool)

(declare-fun res!137312 () Bool)

(declare-fun e!175143 () Bool)

(assert (=> b!273272 (=> (not res!137312) (not e!175143))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273272 (= res!137312 (validKeyInArray!0 (select (arr!6378 a!3325) startIndex!26)))))

(declare-fun res!137317 () Bool)

(assert (=> start!26372 (=> (not res!137317) (not e!175146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26372 (= res!137317 (validMask!0 mask!3868))))

(assert (=> start!26372 e!175146))

(declare-fun array_inv!4350 (array!13458) Bool)

(assert (=> start!26372 (array_inv!4350 a!3325)))

(assert (=> start!26372 true))

(declare-fun b!273273 () Bool)

(declare-fun res!137310 () Bool)

(assert (=> b!273273 (=> (not res!137310) (not e!175146))))

(assert (=> b!273273 (= res!137310 (and (= (size!6731 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6731 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6731 a!3325))))))

(declare-fun b!273274 () Bool)

(assert (=> b!273274 (= e!175143 (not true))))

(assert (=> b!273274 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8523 0))(
  ( (Unit!8524) )
))
(declare-fun lt!136190 () Unit!8523)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8523)

(assert (=> b!273274 (= lt!136190 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136187 () array!13458)

(assert (=> b!273274 (= (seekEntryOrOpen!0 (select (arr!6378 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6378 a!3325) i!1267 k0!2581) startIndex!26) lt!136187 mask!3868))))

(declare-fun lt!136191 () Unit!8523)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13458 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8523)

(assert (=> b!273274 (= lt!136191 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273274 (arrayNoDuplicates!0 lt!136187 #b00000000000000000000000000000000 Nil!4156)))

(declare-fun lt!136188 () Unit!8523)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4159) Unit!8523)

(assert (=> b!273274 (= lt!136188 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4156))))

(declare-fun b!273275 () Bool)

(assert (=> b!273275 (= e!175144 e!175143)))

(declare-fun res!137316 () Bool)

(assert (=> b!273275 (=> (not res!137316) (not e!175143))))

(assert (=> b!273275 (= res!137316 (not (= startIndex!26 i!1267)))))

(assert (=> b!273275 (= lt!136187 (array!13459 (store (arr!6378 a!3325) i!1267 k0!2581) (size!6731 a!3325)))))

(assert (= (and start!26372 res!137317) b!273273))

(assert (= (and b!273273 res!137310) b!273270))

(assert (= (and b!273270 res!137314) b!273269))

(assert (= (and b!273269 res!137309) b!273268))

(assert (= (and b!273268 res!137311) b!273267))

(assert (= (and b!273267 res!137315) b!273271))

(assert (= (and b!273271 res!137313) b!273275))

(assert (= (and b!273275 res!137316) b!273272))

(assert (= (and b!273272 res!137312) b!273274))

(declare-fun m!288005 () Bool)

(assert (=> b!273268 m!288005))

(declare-fun m!288007 () Bool)

(assert (=> start!26372 m!288007))

(declare-fun m!288009 () Bool)

(assert (=> start!26372 m!288009))

(declare-fun m!288011 () Bool)

(assert (=> b!273272 m!288011))

(assert (=> b!273272 m!288011))

(declare-fun m!288013 () Bool)

(assert (=> b!273272 m!288013))

(declare-fun m!288015 () Bool)

(assert (=> b!273270 m!288015))

(declare-fun m!288017 () Bool)

(assert (=> b!273271 m!288017))

(declare-fun m!288019 () Bool)

(assert (=> b!273267 m!288019))

(declare-fun m!288021 () Bool)

(assert (=> b!273275 m!288021))

(declare-fun m!288023 () Bool)

(assert (=> b!273274 m!288023))

(declare-fun m!288025 () Bool)

(assert (=> b!273274 m!288025))

(declare-fun m!288027 () Bool)

(assert (=> b!273274 m!288027))

(assert (=> b!273274 m!288025))

(assert (=> b!273274 m!288021))

(declare-fun m!288029 () Bool)

(assert (=> b!273274 m!288029))

(assert (=> b!273274 m!288011))

(declare-fun m!288031 () Bool)

(assert (=> b!273274 m!288031))

(assert (=> b!273274 m!288011))

(declare-fun m!288033 () Bool)

(assert (=> b!273274 m!288033))

(declare-fun m!288035 () Bool)

(assert (=> b!273274 m!288035))

(declare-fun m!288037 () Bool)

(assert (=> b!273274 m!288037))

(declare-fun m!288039 () Bool)

(assert (=> b!273269 m!288039))

(check-sat (not start!26372) (not b!273269) (not b!273270) (not b!273272) (not b!273271) (not b!273268) (not b!273274) (not b!273267))
(check-sat)
