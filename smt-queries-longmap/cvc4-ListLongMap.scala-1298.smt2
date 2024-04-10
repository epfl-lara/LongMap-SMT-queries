; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26350 () Bool)

(assert start!26350)

(declare-fun b!273144 () Bool)

(declare-fun res!137137 () Bool)

(declare-fun e!175127 () Bool)

(assert (=> b!273144 (=> (not res!137137) (not e!175127))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273144 (= res!137137 (validKeyInArray!0 k!2581))))

(declare-fun b!273145 () Bool)

(declare-fun res!137136 () Bool)

(assert (=> b!273145 (=> (not res!137136) (not e!175127))))

(declare-datatypes ((array!13447 0))(
  ( (array!13448 (arr!6373 (Array (_ BitVec 32) (_ BitVec 64))) (size!6725 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13447)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273145 (= res!137136 (and (= (size!6725 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6725 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6725 a!3325))))))

(declare-fun b!273146 () Bool)

(declare-fun res!137142 () Bool)

(declare-fun e!175124 () Bool)

(assert (=> b!273146 (=> (not res!137142) (not e!175124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13447 (_ BitVec 32)) Bool)

(assert (=> b!273146 (= res!137142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273147 () Bool)

(declare-fun res!137134 () Bool)

(assert (=> b!273147 (=> (not res!137134) (not e!175127))))

(declare-fun arrayContainsKey!0 (array!13447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273147 (= res!137134 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273148 () Bool)

(assert (=> b!273148 (= e!175127 e!175124)))

(declare-fun res!137141 () Bool)

(assert (=> b!273148 (=> (not res!137141) (not e!175124))))

(declare-datatypes ((SeekEntryResult!1531 0))(
  ( (MissingZero!1531 (index!8294 (_ BitVec 32))) (Found!1531 (index!8295 (_ BitVec 32))) (Intermediate!1531 (undefined!2343 Bool) (index!8296 (_ BitVec 32)) (x!26600 (_ BitVec 32))) (Undefined!1531) (MissingVacant!1531 (index!8297 (_ BitVec 32))) )
))
(declare-fun lt!136231 () SeekEntryResult!1531)

(assert (=> b!273148 (= res!137141 (or (= lt!136231 (MissingZero!1531 i!1267)) (= lt!136231 (MissingVacant!1531 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13447 (_ BitVec 32)) SeekEntryResult!1531)

(assert (=> b!273148 (= lt!136231 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273149 () Bool)

(declare-fun e!175125 () Bool)

(assert (=> b!273149 (= e!175124 e!175125)))

(declare-fun res!137140 () Bool)

(assert (=> b!273149 (=> (not res!137140) (not e!175125))))

(assert (=> b!273149 (= res!137140 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136228 () array!13447)

(assert (=> b!273149 (= lt!136228 (array!13448 (store (arr!6373 a!3325) i!1267 k!2581) (size!6725 a!3325)))))

(declare-fun res!137139 () Bool)

(assert (=> start!26350 (=> (not res!137139) (not e!175127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26350 (= res!137139 (validMask!0 mask!3868))))

(assert (=> start!26350 e!175127))

(declare-fun array_inv!4336 (array!13447) Bool)

(assert (=> start!26350 (array_inv!4336 a!3325)))

(assert (=> start!26350 true))

(declare-fun b!273150 () Bool)

(declare-fun res!137138 () Bool)

(assert (=> b!273150 (=> (not res!137138) (not e!175125))))

(assert (=> b!273150 (= res!137138 (validKeyInArray!0 (select (arr!6373 a!3325) startIndex!26)))))

(declare-fun b!273151 () Bool)

(declare-fun res!137135 () Bool)

(assert (=> b!273151 (=> (not res!137135) (not e!175127))))

(declare-datatypes ((List!4181 0))(
  ( (Nil!4178) (Cons!4177 (h!4844 (_ BitVec 64)) (t!9263 List!4181)) )
))
(declare-fun arrayNoDuplicates!0 (array!13447 (_ BitVec 32) List!4181) Bool)

(assert (=> b!273151 (= res!137135 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4178))))

(declare-fun b!273152 () Bool)

(assert (=> b!273152 (= e!175125 (not true))))

(assert (=> b!273152 (= (seekEntryOrOpen!0 (select (arr!6373 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6373 a!3325) i!1267 k!2581) startIndex!26) lt!136228 mask!3868))))

(declare-datatypes ((Unit!8549 0))(
  ( (Unit!8550) )
))
(declare-fun lt!136229 () Unit!8549)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13447 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8549)

(assert (=> b!273152 (= lt!136229 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273152 (arrayNoDuplicates!0 lt!136228 #b00000000000000000000000000000000 Nil!4178)))

(declare-fun lt!136230 () Unit!8549)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13447 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4181) Unit!8549)

(assert (=> b!273152 (= lt!136230 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4178))))

(assert (= (and start!26350 res!137139) b!273145))

(assert (= (and b!273145 res!137136) b!273144))

(assert (= (and b!273144 res!137137) b!273151))

(assert (= (and b!273151 res!137135) b!273147))

(assert (= (and b!273147 res!137134) b!273148))

(assert (= (and b!273148 res!137141) b!273146))

(assert (= (and b!273146 res!137142) b!273149))

(assert (= (and b!273149 res!137140) b!273150))

(assert (= (and b!273150 res!137138) b!273152))

(declare-fun m!288253 () Bool)

(assert (=> b!273151 m!288253))

(declare-fun m!288255 () Bool)

(assert (=> b!273150 m!288255))

(assert (=> b!273150 m!288255))

(declare-fun m!288257 () Bool)

(assert (=> b!273150 m!288257))

(declare-fun m!288259 () Bool)

(assert (=> b!273146 m!288259))

(declare-fun m!288261 () Bool)

(assert (=> start!26350 m!288261))

(declare-fun m!288263 () Bool)

(assert (=> start!26350 m!288263))

(declare-fun m!288265 () Bool)

(assert (=> b!273148 m!288265))

(declare-fun m!288267 () Bool)

(assert (=> b!273149 m!288267))

(declare-fun m!288269 () Bool)

(assert (=> b!273152 m!288269))

(declare-fun m!288271 () Bool)

(assert (=> b!273152 m!288271))

(assert (=> b!273152 m!288267))

(assert (=> b!273152 m!288255))

(declare-fun m!288273 () Bool)

(assert (=> b!273152 m!288273))

(declare-fun m!288275 () Bool)

(assert (=> b!273152 m!288275))

(assert (=> b!273152 m!288255))

(declare-fun m!288277 () Bool)

(assert (=> b!273152 m!288277))

(assert (=> b!273152 m!288271))

(declare-fun m!288279 () Bool)

(assert (=> b!273152 m!288279))

(declare-fun m!288281 () Bool)

(assert (=> b!273144 m!288281))

(declare-fun m!288283 () Bool)

(assert (=> b!273147 m!288283))

(push 1)

