; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26340 () Bool)

(assert start!26340)

(declare-fun b!273056 () Bool)

(declare-fun res!137024 () Bool)

(declare-fun e!175089 () Bool)

(assert (=> b!273056 (=> (not res!137024) (not e!175089))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273056 (= res!137024 (validKeyInArray!0 k0!2581))))

(declare-fun res!137027 () Bool)

(assert (=> start!26340 (=> (not res!137027) (not e!175089))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26340 (= res!137027 (validMask!0 mask!3868))))

(assert (=> start!26340 e!175089))

(declare-datatypes ((array!13436 0))(
  ( (array!13437 (arr!6367 (Array (_ BitVec 32) (_ BitVec 64))) (size!6719 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13436)

(declare-fun array_inv!4317 (array!13436) Bool)

(assert (=> start!26340 (array_inv!4317 a!3325)))

(assert (=> start!26340 true))

(declare-fun b!273057 () Bool)

(declare-fun res!137021 () Bool)

(assert (=> b!273057 (=> (not res!137021) (not e!175089))))

(declare-datatypes ((List!4088 0))(
  ( (Nil!4085) (Cons!4084 (h!4751 (_ BitVec 64)) (t!9162 List!4088)) )
))
(declare-fun arrayNoDuplicates!0 (array!13436 (_ BitVec 32) List!4088) Bool)

(assert (=> b!273057 (= res!137021 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4085))))

(declare-fun b!273058 () Bool)

(declare-fun e!175090 () Bool)

(assert (=> b!273058 (= e!175089 e!175090)))

(declare-fun res!137020 () Bool)

(assert (=> b!273058 (=> (not res!137020) (not e!175090))))

(declare-datatypes ((SeekEntryResult!1490 0))(
  ( (MissingZero!1490 (index!8130 (_ BitVec 32))) (Found!1490 (index!8131 (_ BitVec 32))) (Intermediate!1490 (undefined!2302 Bool) (index!8132 (_ BitVec 32)) (x!26551 (_ BitVec 32))) (Undefined!1490) (MissingVacant!1490 (index!8133 (_ BitVec 32))) )
))
(declare-fun lt!136229 () SeekEntryResult!1490)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273058 (= res!137020 (or (= lt!136229 (MissingZero!1490 i!1267)) (= lt!136229 (MissingVacant!1490 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13436 (_ BitVec 32)) SeekEntryResult!1490)

(assert (=> b!273058 (= lt!136229 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273059 () Bool)

(declare-fun res!137028 () Bool)

(assert (=> b!273059 (=> (not res!137028) (not e!175090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13436 (_ BitVec 32)) Bool)

(assert (=> b!273059 (= res!137028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273060 () Bool)

(declare-fun res!137026 () Bool)

(declare-fun e!175088 () Bool)

(assert (=> b!273060 (=> (not res!137026) (not e!175088))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273060 (= res!137026 (validKeyInArray!0 (select (arr!6367 a!3325) startIndex!26)))))

(declare-fun b!273061 () Bool)

(declare-fun res!137023 () Bool)

(assert (=> b!273061 (=> (not res!137023) (not e!175089))))

(assert (=> b!273061 (= res!137023 (and (= (size!6719 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6719 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6719 a!3325))))))

(declare-fun b!273062 () Bool)

(declare-fun res!137025 () Bool)

(assert (=> b!273062 (=> (not res!137025) (not e!175089))))

(declare-fun arrayContainsKey!0 (array!13436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273062 (= res!137025 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273063 () Bool)

(assert (=> b!273063 (= e!175090 e!175088)))

(declare-fun res!137022 () Bool)

(assert (=> b!273063 (=> (not res!137022) (not e!175088))))

(assert (=> b!273063 (= res!137022 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136230 () array!13436)

(assert (=> b!273063 (= lt!136230 (array!13437 (store (arr!6367 a!3325) i!1267 k0!2581) (size!6719 a!3325)))))

(declare-fun b!273064 () Bool)

(assert (=> b!273064 (= e!175088 (not true))))

(assert (=> b!273064 (= (seekEntryOrOpen!0 (select (arr!6367 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6367 a!3325) i!1267 k0!2581) startIndex!26) lt!136230 mask!3868))))

(declare-datatypes ((Unit!8519 0))(
  ( (Unit!8520) )
))
(declare-fun lt!136227 () Unit!8519)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13436 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8519)

(assert (=> b!273064 (= lt!136227 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273064 (arrayNoDuplicates!0 lt!136230 #b00000000000000000000000000000000 Nil!4085)))

(declare-fun lt!136228 () Unit!8519)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13436 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4088) Unit!8519)

(assert (=> b!273064 (= lt!136228 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4085))))

(assert (= (and start!26340 res!137027) b!273061))

(assert (= (and b!273061 res!137023) b!273056))

(assert (= (and b!273056 res!137024) b!273057))

(assert (= (and b!273057 res!137021) b!273062))

(assert (= (and b!273062 res!137025) b!273058))

(assert (= (and b!273058 res!137020) b!273059))

(assert (= (and b!273059 res!137028) b!273063))

(assert (= (and b!273063 res!137022) b!273060))

(assert (= (and b!273060 res!137026) b!273064))

(declare-fun m!288299 () Bool)

(assert (=> b!273058 m!288299))

(declare-fun m!288301 () Bool)

(assert (=> b!273064 m!288301))

(declare-fun m!288303 () Bool)

(assert (=> b!273064 m!288303))

(declare-fun m!288305 () Bool)

(assert (=> b!273064 m!288305))

(declare-fun m!288307 () Bool)

(assert (=> b!273064 m!288307))

(declare-fun m!288309 () Bool)

(assert (=> b!273064 m!288309))

(declare-fun m!288311 () Bool)

(assert (=> b!273064 m!288311))

(assert (=> b!273064 m!288303))

(declare-fun m!288313 () Bool)

(assert (=> b!273064 m!288313))

(assert (=> b!273064 m!288307))

(declare-fun m!288315 () Bool)

(assert (=> b!273064 m!288315))

(declare-fun m!288317 () Bool)

(assert (=> start!26340 m!288317))

(declare-fun m!288319 () Bool)

(assert (=> start!26340 m!288319))

(declare-fun m!288321 () Bool)

(assert (=> b!273062 m!288321))

(assert (=> b!273063 m!288305))

(declare-fun m!288323 () Bool)

(assert (=> b!273059 m!288323))

(declare-fun m!288325 () Bool)

(assert (=> b!273057 m!288325))

(assert (=> b!273060 m!288307))

(assert (=> b!273060 m!288307))

(declare-fun m!288327 () Bool)

(assert (=> b!273060 m!288327))

(declare-fun m!288329 () Bool)

(assert (=> b!273056 m!288329))

(check-sat (not b!273056) (not b!273058) (not b!273060) (not b!273062) (not b!273057) (not start!26340) (not b!273059) (not b!273064))
(check-sat)
