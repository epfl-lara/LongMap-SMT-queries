; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26346 () Bool)

(assert start!26346)

(declare-fun b!273090 () Bool)

(declare-fun e!175102 () Bool)

(declare-fun e!175101 () Bool)

(assert (=> b!273090 (= e!175102 e!175101)))

(declare-fun res!137082 () Bool)

(assert (=> b!273090 (=> (not res!137082) (not e!175101))))

(declare-datatypes ((SeekEntryResult!1529 0))(
  ( (MissingZero!1529 (index!8286 (_ BitVec 32))) (Found!1529 (index!8287 (_ BitVec 32))) (Intermediate!1529 (undefined!2341 Bool) (index!8288 (_ BitVec 32)) (x!26598 (_ BitVec 32))) (Undefined!1529) (MissingVacant!1529 (index!8289 (_ BitVec 32))) )
))
(declare-fun lt!136204 () SeekEntryResult!1529)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273090 (= res!137082 (or (= lt!136204 (MissingZero!1529 i!1267)) (= lt!136204 (MissingVacant!1529 i!1267))))))

(declare-datatypes ((array!13443 0))(
  ( (array!13444 (arr!6371 (Array (_ BitVec 32) (_ BitVec 64))) (size!6723 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13443)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13443 (_ BitVec 32)) SeekEntryResult!1529)

(assert (=> b!273090 (= lt!136204 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!137083 () Bool)

(assert (=> start!26346 (=> (not res!137083) (not e!175102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26346 (= res!137083 (validMask!0 mask!3868))))

(assert (=> start!26346 e!175102))

(declare-fun array_inv!4334 (array!13443) Bool)

(assert (=> start!26346 (array_inv!4334 a!3325)))

(assert (=> start!26346 true))

(declare-fun b!273091 () Bool)

(declare-fun res!137087 () Bool)

(assert (=> b!273091 (=> (not res!137087) (not e!175101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13443 (_ BitVec 32)) Bool)

(assert (=> b!273091 (= res!137087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273092 () Bool)

(declare-fun res!137080 () Bool)

(assert (=> b!273092 (=> (not res!137080) (not e!175102))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273092 (= res!137080 (and (= (size!6723 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6723 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6723 a!3325))))))

(declare-fun b!273093 () Bool)

(declare-fun res!137088 () Bool)

(assert (=> b!273093 (=> (not res!137088) (not e!175102))))

(declare-datatypes ((List!4179 0))(
  ( (Nil!4176) (Cons!4175 (h!4842 (_ BitVec 64)) (t!9261 List!4179)) )
))
(declare-fun arrayNoDuplicates!0 (array!13443 (_ BitVec 32) List!4179) Bool)

(assert (=> b!273093 (= res!137088 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4176))))

(declare-fun b!273094 () Bool)

(declare-fun res!137084 () Bool)

(assert (=> b!273094 (=> (not res!137084) (not e!175102))))

(declare-fun arrayContainsKey!0 (array!13443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273094 (= res!137084 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273095 () Bool)

(declare-fun res!137085 () Bool)

(declare-fun e!175100 () Bool)

(assert (=> b!273095 (=> (not res!137085) (not e!175100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273095 (= res!137085 (validKeyInArray!0 (select (arr!6371 a!3325) startIndex!26)))))

(declare-fun b!273096 () Bool)

(declare-fun res!137081 () Bool)

(assert (=> b!273096 (=> (not res!137081) (not e!175102))))

(assert (=> b!273096 (= res!137081 (validKeyInArray!0 k!2581))))

(declare-fun b!273097 () Bool)

(assert (=> b!273097 (= e!175101 e!175100)))

(declare-fun res!137086 () Bool)

(assert (=> b!273097 (=> (not res!137086) (not e!175100))))

(assert (=> b!273097 (= res!137086 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136205 () array!13443)

(assert (=> b!273097 (= lt!136205 (array!13444 (store (arr!6371 a!3325) i!1267 k!2581) (size!6723 a!3325)))))

(declare-fun b!273098 () Bool)

(assert (=> b!273098 (= e!175100 (not true))))

(assert (=> b!273098 (= (seekEntryOrOpen!0 (select (arr!6371 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6371 a!3325) i!1267 k!2581) startIndex!26) lt!136205 mask!3868))))

(declare-datatypes ((Unit!8545 0))(
  ( (Unit!8546) )
))
(declare-fun lt!136206 () Unit!8545)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13443 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8545)

(assert (=> b!273098 (= lt!136206 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273098 (arrayNoDuplicates!0 lt!136205 #b00000000000000000000000000000000 Nil!4176)))

(declare-fun lt!136207 () Unit!8545)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13443 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4179) Unit!8545)

(assert (=> b!273098 (= lt!136207 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4176))))

(assert (= (and start!26346 res!137083) b!273092))

(assert (= (and b!273092 res!137080) b!273096))

(assert (= (and b!273096 res!137081) b!273093))

(assert (= (and b!273093 res!137088) b!273094))

(assert (= (and b!273094 res!137084) b!273090))

(assert (= (and b!273090 res!137082) b!273091))

(assert (= (and b!273091 res!137087) b!273097))

(assert (= (and b!273097 res!137086) b!273095))

(assert (= (and b!273095 res!137085) b!273098))

(declare-fun m!288189 () Bool)

(assert (=> b!273098 m!288189))

(declare-fun m!288191 () Bool)

(assert (=> b!273098 m!288191))

(declare-fun m!288193 () Bool)

(assert (=> b!273098 m!288193))

(declare-fun m!288195 () Bool)

(assert (=> b!273098 m!288195))

(assert (=> b!273098 m!288193))

(declare-fun m!288197 () Bool)

(assert (=> b!273098 m!288197))

(declare-fun m!288199 () Bool)

(assert (=> b!273098 m!288199))

(assert (=> b!273098 m!288189))

(declare-fun m!288201 () Bool)

(assert (=> b!273098 m!288201))

(declare-fun m!288203 () Bool)

(assert (=> b!273098 m!288203))

(declare-fun m!288205 () Bool)

(assert (=> b!273091 m!288205))

(declare-fun m!288207 () Bool)

(assert (=> start!26346 m!288207))

(declare-fun m!288209 () Bool)

(assert (=> start!26346 m!288209))

(declare-fun m!288211 () Bool)

(assert (=> b!273094 m!288211))

(assert (=> b!273097 m!288191))

(declare-fun m!288213 () Bool)

(assert (=> b!273090 m!288213))

(declare-fun m!288215 () Bool)

(assert (=> b!273093 m!288215))

(assert (=> b!273095 m!288193))

(assert (=> b!273095 m!288193))

(declare-fun m!288217 () Bool)

(assert (=> b!273095 m!288217))

(declare-fun m!288219 () Bool)

(assert (=> b!273096 m!288219))

(push 1)

