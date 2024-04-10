; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26348 () Bool)

(assert start!26348)

(declare-fun b!273117 () Bool)

(declare-fun e!175114 () Bool)

(declare-fun e!175115 () Bool)

(assert (=> b!273117 (= e!175114 e!175115)))

(declare-fun res!137110 () Bool)

(assert (=> b!273117 (=> (not res!137110) (not e!175115))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273117 (= res!137110 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13445 0))(
  ( (array!13446 (arr!6372 (Array (_ BitVec 32) (_ BitVec 64))) (size!6724 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13445)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136218 () array!13445)

(assert (=> b!273117 (= lt!136218 (array!13446 (store (arr!6372 a!3325) i!1267 k0!2581) (size!6724 a!3325)))))

(declare-fun b!273118 () Bool)

(declare-fun res!137107 () Bool)

(assert (=> b!273118 (=> (not res!137107) (not e!175115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273118 (= res!137107 (validKeyInArray!0 (select (arr!6372 a!3325) startIndex!26)))))

(declare-fun b!273119 () Bool)

(declare-fun res!137109 () Bool)

(declare-fun e!175112 () Bool)

(assert (=> b!273119 (=> (not res!137109) (not e!175112))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273119 (= res!137109 (and (= (size!6724 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6724 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6724 a!3325))))))

(declare-fun b!273120 () Bool)

(assert (=> b!273120 (= e!175115 (not true))))

(declare-datatypes ((SeekEntryResult!1530 0))(
  ( (MissingZero!1530 (index!8290 (_ BitVec 32))) (Found!1530 (index!8291 (_ BitVec 32))) (Intermediate!1530 (undefined!2342 Bool) (index!8292 (_ BitVec 32)) (x!26599 (_ BitVec 32))) (Undefined!1530) (MissingVacant!1530 (index!8293 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13445 (_ BitVec 32)) SeekEntryResult!1530)

(assert (=> b!273120 (= (seekEntryOrOpen!0 (select (arr!6372 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6372 a!3325) i!1267 k0!2581) startIndex!26) lt!136218 mask!3868))))

(declare-datatypes ((Unit!8547 0))(
  ( (Unit!8548) )
))
(declare-fun lt!136219 () Unit!8547)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13445 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8547)

(assert (=> b!273120 (= lt!136219 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4180 0))(
  ( (Nil!4177) (Cons!4176 (h!4843 (_ BitVec 64)) (t!9262 List!4180)) )
))
(declare-fun arrayNoDuplicates!0 (array!13445 (_ BitVec 32) List!4180) Bool)

(assert (=> b!273120 (arrayNoDuplicates!0 lt!136218 #b00000000000000000000000000000000 Nil!4177)))

(declare-fun lt!136217 () Unit!8547)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13445 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4180) Unit!8547)

(assert (=> b!273120 (= lt!136217 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4177))))

(declare-fun b!273121 () Bool)

(assert (=> b!273121 (= e!175112 e!175114)))

(declare-fun res!137108 () Bool)

(assert (=> b!273121 (=> (not res!137108) (not e!175114))))

(declare-fun lt!136216 () SeekEntryResult!1530)

(assert (=> b!273121 (= res!137108 (or (= lt!136216 (MissingZero!1530 i!1267)) (= lt!136216 (MissingVacant!1530 i!1267))))))

(assert (=> b!273121 (= lt!136216 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273122 () Bool)

(declare-fun res!137111 () Bool)

(assert (=> b!273122 (=> (not res!137111) (not e!175112))))

(assert (=> b!273122 (= res!137111 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4177))))

(declare-fun b!273123 () Bool)

(declare-fun res!137115 () Bool)

(assert (=> b!273123 (=> (not res!137115) (not e!175112))))

(declare-fun arrayContainsKey!0 (array!13445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273123 (= res!137115 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!137112 () Bool)

(assert (=> start!26348 (=> (not res!137112) (not e!175112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26348 (= res!137112 (validMask!0 mask!3868))))

(assert (=> start!26348 e!175112))

(declare-fun array_inv!4335 (array!13445) Bool)

(assert (=> start!26348 (array_inv!4335 a!3325)))

(assert (=> start!26348 true))

(declare-fun b!273124 () Bool)

(declare-fun res!137114 () Bool)

(assert (=> b!273124 (=> (not res!137114) (not e!175112))))

(assert (=> b!273124 (= res!137114 (validKeyInArray!0 k0!2581))))

(declare-fun b!273125 () Bool)

(declare-fun res!137113 () Bool)

(assert (=> b!273125 (=> (not res!137113) (not e!175114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13445 (_ BitVec 32)) Bool)

(assert (=> b!273125 (= res!137113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26348 res!137112) b!273119))

(assert (= (and b!273119 res!137109) b!273124))

(assert (= (and b!273124 res!137114) b!273122))

(assert (= (and b!273122 res!137111) b!273123))

(assert (= (and b!273123 res!137115) b!273121))

(assert (= (and b!273121 res!137108) b!273125))

(assert (= (and b!273125 res!137113) b!273117))

(assert (= (and b!273117 res!137110) b!273118))

(assert (= (and b!273118 res!137107) b!273120))

(declare-fun m!288221 () Bool)

(assert (=> b!273125 m!288221))

(declare-fun m!288223 () Bool)

(assert (=> start!26348 m!288223))

(declare-fun m!288225 () Bool)

(assert (=> start!26348 m!288225))

(declare-fun m!288227 () Bool)

(assert (=> b!273123 m!288227))

(declare-fun m!288229 () Bool)

(assert (=> b!273121 m!288229))

(declare-fun m!288231 () Bool)

(assert (=> b!273120 m!288231))

(declare-fun m!288233 () Bool)

(assert (=> b!273120 m!288233))

(declare-fun m!288235 () Bool)

(assert (=> b!273120 m!288235))

(assert (=> b!273120 m!288233))

(declare-fun m!288237 () Bool)

(assert (=> b!273120 m!288237))

(declare-fun m!288239 () Bool)

(assert (=> b!273120 m!288239))

(declare-fun m!288241 () Bool)

(assert (=> b!273120 m!288241))

(declare-fun m!288243 () Bool)

(assert (=> b!273120 m!288243))

(assert (=> b!273120 m!288239))

(declare-fun m!288245 () Bool)

(assert (=> b!273120 m!288245))

(declare-fun m!288247 () Bool)

(assert (=> b!273124 m!288247))

(assert (=> b!273118 m!288239))

(assert (=> b!273118 m!288239))

(declare-fun m!288249 () Bool)

(assert (=> b!273118 m!288249))

(assert (=> b!273117 m!288237))

(declare-fun m!288251 () Bool)

(assert (=> b!273122 m!288251))

(check-sat (not b!273124) (not b!273121) (not b!273122) (not start!26348) (not b!273125) (not b!273120) (not b!273123) (not b!273118))
(check-sat)
