; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26280 () Bool)

(assert start!26280)

(declare-fun b!272199 () Bool)

(declare-fun res!136192 () Bool)

(declare-fun e!174774 () Bool)

(assert (=> b!272199 (=> (not res!136192) (not e!174774))))

(declare-datatypes ((array!13377 0))(
  ( (array!13378 (arr!6338 (Array (_ BitVec 32) (_ BitVec 64))) (size!6690 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13377)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272199 (= res!136192 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272200 () Bool)

(declare-fun res!136189 () Bool)

(assert (=> b!272200 (=> (not res!136189) (not e!174774))))

(declare-datatypes ((List!4146 0))(
  ( (Nil!4143) (Cons!4142 (h!4809 (_ BitVec 64)) (t!9228 List!4146)) )
))
(declare-fun arrayNoDuplicates!0 (array!13377 (_ BitVec 32) List!4146) Bool)

(assert (=> b!272200 (= res!136189 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4143))))

(declare-fun b!272202 () Bool)

(declare-fun res!136193 () Bool)

(declare-fun e!174775 () Bool)

(assert (=> b!272202 (=> (not res!136193) (not e!174775))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272202 (= res!136193 (validKeyInArray!0 (select (arr!6338 a!3325) startIndex!26)))))

(declare-fun b!272203 () Bool)

(assert (=> b!272203 (= e!174775 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272203 (arrayNoDuplicates!0 (array!13378 (store (arr!6338 a!3325) i!1267 k!2581) (size!6690 a!3325)) #b00000000000000000000000000000000 Nil!4143)))

(declare-datatypes ((Unit!8479 0))(
  ( (Unit!8480) )
))
(declare-fun lt!135948 () Unit!8479)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4146) Unit!8479)

(assert (=> b!272203 (= lt!135948 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4143))))

(declare-fun b!272204 () Bool)

(declare-fun res!136190 () Bool)

(assert (=> b!272204 (=> (not res!136190) (not e!174774))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272204 (= res!136190 (and (= (size!6690 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6690 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6690 a!3325))))))

(declare-fun b!272205 () Bool)

(declare-fun res!136194 () Bool)

(assert (=> b!272205 (=> (not res!136194) (not e!174774))))

(assert (=> b!272205 (= res!136194 (validKeyInArray!0 k!2581))))

(declare-fun b!272206 () Bool)

(declare-fun res!136191 () Bool)

(assert (=> b!272206 (=> (not res!136191) (not e!174775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13377 (_ BitVec 32)) Bool)

(assert (=> b!272206 (= res!136191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272207 () Bool)

(assert (=> b!272207 (= e!174774 e!174775)))

(declare-fun res!136197 () Bool)

(assert (=> b!272207 (=> (not res!136197) (not e!174775))))

(declare-datatypes ((SeekEntryResult!1496 0))(
  ( (MissingZero!1496 (index!8154 (_ BitVec 32))) (Found!1496 (index!8155 (_ BitVec 32))) (Intermediate!1496 (undefined!2308 Bool) (index!8156 (_ BitVec 32)) (x!26477 (_ BitVec 32))) (Undefined!1496) (MissingVacant!1496 (index!8157 (_ BitVec 32))) )
))
(declare-fun lt!135949 () SeekEntryResult!1496)

(assert (=> b!272207 (= res!136197 (or (= lt!135949 (MissingZero!1496 i!1267)) (= lt!135949 (MissingVacant!1496 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13377 (_ BitVec 32)) SeekEntryResult!1496)

(assert (=> b!272207 (= lt!135949 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!136196 () Bool)

(assert (=> start!26280 (=> (not res!136196) (not e!174774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26280 (= res!136196 (validMask!0 mask!3868))))

(assert (=> start!26280 e!174774))

(declare-fun array_inv!4301 (array!13377) Bool)

(assert (=> start!26280 (array_inv!4301 a!3325)))

(assert (=> start!26280 true))

(declare-fun b!272201 () Bool)

(declare-fun res!136195 () Bool)

(assert (=> b!272201 (=> (not res!136195) (not e!174775))))

(assert (=> b!272201 (= res!136195 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26280 res!136196) b!272204))

(assert (= (and b!272204 res!136190) b!272205))

(assert (= (and b!272205 res!136194) b!272200))

(assert (= (and b!272200 res!136189) b!272199))

(assert (= (and b!272199 res!136192) b!272207))

(assert (= (and b!272207 res!136197) b!272206))

(assert (= (and b!272206 res!136191) b!272201))

(assert (= (and b!272201 res!136195) b!272202))

(assert (= (and b!272202 res!136193) b!272203))

(declare-fun m!287325 () Bool)

(assert (=> start!26280 m!287325))

(declare-fun m!287327 () Bool)

(assert (=> start!26280 m!287327))

(declare-fun m!287329 () Bool)

(assert (=> b!272202 m!287329))

(assert (=> b!272202 m!287329))

(declare-fun m!287331 () Bool)

(assert (=> b!272202 m!287331))

(declare-fun m!287333 () Bool)

(assert (=> b!272205 m!287333))

(declare-fun m!287335 () Bool)

(assert (=> b!272203 m!287335))

(declare-fun m!287337 () Bool)

(assert (=> b!272203 m!287337))

(declare-fun m!287339 () Bool)

(assert (=> b!272203 m!287339))

(declare-fun m!287341 () Bool)

(assert (=> b!272207 m!287341))

(declare-fun m!287343 () Bool)

(assert (=> b!272206 m!287343))

(declare-fun m!287345 () Bool)

(assert (=> b!272200 m!287345))

(declare-fun m!287347 () Bool)

(assert (=> b!272199 m!287347))

(push 1)

