; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26344 () Bool)

(assert start!26344)

(declare-fun b!273063 () Bool)

(declare-fun res!137058 () Bool)

(declare-fun e!175090 () Bool)

(assert (=> b!273063 (=> (not res!137058) (not e!175090))))

(declare-datatypes ((array!13441 0))(
  ( (array!13442 (arr!6370 (Array (_ BitVec 32) (_ BitVec 64))) (size!6722 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13441)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273063 (= res!137058 (validKeyInArray!0 (select (arr!6370 a!3325) startIndex!26)))))

(declare-fun b!273064 () Bool)

(assert (=> b!273064 (= e!175090 (not true))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!136192 () array!13441)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1528 0))(
  ( (MissingZero!1528 (index!8282 (_ BitVec 32))) (Found!1528 (index!8283 (_ BitVec 32))) (Intermediate!1528 (undefined!2340 Bool) (index!8284 (_ BitVec 32)) (x!26589 (_ BitVec 32))) (Undefined!1528) (MissingVacant!1528 (index!8285 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13441 (_ BitVec 32)) SeekEntryResult!1528)

(assert (=> b!273064 (= (seekEntryOrOpen!0 (select (arr!6370 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6370 a!3325) i!1267 k!2581) startIndex!26) lt!136192 mask!3868))))

(declare-datatypes ((Unit!8543 0))(
  ( (Unit!8544) )
))
(declare-fun lt!136195 () Unit!8543)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8543)

(assert (=> b!273064 (= lt!136195 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4178 0))(
  ( (Nil!4175) (Cons!4174 (h!4841 (_ BitVec 64)) (t!9260 List!4178)) )
))
(declare-fun arrayNoDuplicates!0 (array!13441 (_ BitVec 32) List!4178) Bool)

(assert (=> b!273064 (arrayNoDuplicates!0 lt!136192 #b00000000000000000000000000000000 Nil!4175)))

(declare-fun lt!136194 () Unit!8543)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13441 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4178) Unit!8543)

(assert (=> b!273064 (= lt!136194 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4175))))

(declare-fun b!273065 () Bool)

(declare-fun e!175089 () Bool)

(declare-fun e!175091 () Bool)

(assert (=> b!273065 (= e!175089 e!175091)))

(declare-fun res!137053 () Bool)

(assert (=> b!273065 (=> (not res!137053) (not e!175091))))

(declare-fun lt!136193 () SeekEntryResult!1528)

(assert (=> b!273065 (= res!137053 (or (= lt!136193 (MissingZero!1528 i!1267)) (= lt!136193 (MissingVacant!1528 i!1267))))))

(assert (=> b!273065 (= lt!136193 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!137061 () Bool)

(assert (=> start!26344 (=> (not res!137061) (not e!175089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26344 (= res!137061 (validMask!0 mask!3868))))

(assert (=> start!26344 e!175089))

(declare-fun array_inv!4333 (array!13441) Bool)

(assert (=> start!26344 (array_inv!4333 a!3325)))

(assert (=> start!26344 true))

(declare-fun b!273066 () Bool)

(declare-fun res!137056 () Bool)

(assert (=> b!273066 (=> (not res!137056) (not e!175089))))

(declare-fun arrayContainsKey!0 (array!13441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273066 (= res!137056 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273067 () Bool)

(declare-fun res!137054 () Bool)

(assert (=> b!273067 (=> (not res!137054) (not e!175089))))

(assert (=> b!273067 (= res!137054 (and (= (size!6722 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6722 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6722 a!3325))))))

(declare-fun b!273068 () Bool)

(declare-fun res!137057 () Bool)

(assert (=> b!273068 (=> (not res!137057) (not e!175089))))

(assert (=> b!273068 (= res!137057 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4175))))

(declare-fun b!273069 () Bool)

(declare-fun res!137060 () Bool)

(assert (=> b!273069 (=> (not res!137060) (not e!175091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13441 (_ BitVec 32)) Bool)

(assert (=> b!273069 (= res!137060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273070 () Bool)

(declare-fun res!137055 () Bool)

(assert (=> b!273070 (=> (not res!137055) (not e!175089))))

(assert (=> b!273070 (= res!137055 (validKeyInArray!0 k!2581))))

(declare-fun b!273071 () Bool)

(assert (=> b!273071 (= e!175091 e!175090)))

(declare-fun res!137059 () Bool)

(assert (=> b!273071 (=> (not res!137059) (not e!175090))))

(assert (=> b!273071 (= res!137059 (not (= startIndex!26 i!1267)))))

(assert (=> b!273071 (= lt!136192 (array!13442 (store (arr!6370 a!3325) i!1267 k!2581) (size!6722 a!3325)))))

(assert (= (and start!26344 res!137061) b!273067))

(assert (= (and b!273067 res!137054) b!273070))

(assert (= (and b!273070 res!137055) b!273068))

(assert (= (and b!273068 res!137057) b!273066))

(assert (= (and b!273066 res!137056) b!273065))

(assert (= (and b!273065 res!137053) b!273069))

(assert (= (and b!273069 res!137060) b!273071))

(assert (= (and b!273071 res!137059) b!273063))

(assert (= (and b!273063 res!137058) b!273064))

(declare-fun m!288157 () Bool)

(assert (=> b!273065 m!288157))

(declare-fun m!288159 () Bool)

(assert (=> b!273068 m!288159))

(declare-fun m!288161 () Bool)

(assert (=> b!273066 m!288161))

(declare-fun m!288163 () Bool)

(assert (=> b!273070 m!288163))

(declare-fun m!288165 () Bool)

(assert (=> b!273071 m!288165))

(declare-fun m!288167 () Bool)

(assert (=> start!26344 m!288167))

(declare-fun m!288169 () Bool)

(assert (=> start!26344 m!288169))

(declare-fun m!288171 () Bool)

(assert (=> b!273063 m!288171))

(assert (=> b!273063 m!288171))

(declare-fun m!288173 () Bool)

(assert (=> b!273063 m!288173))

(declare-fun m!288175 () Bool)

(assert (=> b!273069 m!288175))

(declare-fun m!288177 () Bool)

(assert (=> b!273064 m!288177))

(declare-fun m!288179 () Bool)

(assert (=> b!273064 m!288179))

(assert (=> b!273064 m!288165))

(assert (=> b!273064 m!288171))

(declare-fun m!288181 () Bool)

(assert (=> b!273064 m!288181))

(assert (=> b!273064 m!288179))

(declare-fun m!288183 () Bool)

(assert (=> b!273064 m!288183))

(declare-fun m!288185 () Bool)

(assert (=> b!273064 m!288185))

(assert (=> b!273064 m!288171))

(declare-fun m!288187 () Bool)

(assert (=> b!273064 m!288187))

(push 1)

