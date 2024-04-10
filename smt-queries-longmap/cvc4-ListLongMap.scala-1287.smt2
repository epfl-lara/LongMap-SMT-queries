; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26284 () Bool)

(assert start!26284)

(declare-fun b!272253 () Bool)

(declare-fun res!136244 () Bool)

(declare-fun e!174794 () Bool)

(assert (=> b!272253 (=> (not res!136244) (not e!174794))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272253 (= res!136244 (not (= startIndex!26 i!1267)))))

(declare-fun b!272254 () Bool)

(declare-fun res!136245 () Bool)

(declare-fun e!174792 () Bool)

(assert (=> b!272254 (=> (not res!136245) (not e!174792))))

(declare-datatypes ((array!13381 0))(
  ( (array!13382 (arr!6340 (Array (_ BitVec 32) (_ BitVec 64))) (size!6692 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13381)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272254 (= res!136245 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272255 () Bool)

(declare-fun res!136248 () Bool)

(assert (=> b!272255 (=> (not res!136248) (not e!174792))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272255 (= res!136248 (and (= (size!6692 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6692 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6692 a!3325))))))

(declare-fun b!272256 () Bool)

(declare-fun res!136243 () Bool)

(assert (=> b!272256 (=> (not res!136243) (not e!174792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272256 (= res!136243 (validKeyInArray!0 k!2581))))

(declare-fun res!136247 () Bool)

(assert (=> start!26284 (=> (not res!136247) (not e!174792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26284 (= res!136247 (validMask!0 mask!3868))))

(assert (=> start!26284 e!174792))

(declare-fun array_inv!4303 (array!13381) Bool)

(assert (=> start!26284 (array_inv!4303 a!3325)))

(assert (=> start!26284 true))

(declare-fun b!272257 () Bool)

(assert (=> b!272257 (= e!174792 e!174794)))

(declare-fun res!136250 () Bool)

(assert (=> b!272257 (=> (not res!136250) (not e!174794))))

(declare-datatypes ((SeekEntryResult!1498 0))(
  ( (MissingZero!1498 (index!8162 (_ BitVec 32))) (Found!1498 (index!8163 (_ BitVec 32))) (Intermediate!1498 (undefined!2310 Bool) (index!8164 (_ BitVec 32)) (x!26479 (_ BitVec 32))) (Undefined!1498) (MissingVacant!1498 (index!8165 (_ BitVec 32))) )
))
(declare-fun lt!135960 () SeekEntryResult!1498)

(assert (=> b!272257 (= res!136250 (or (= lt!135960 (MissingZero!1498 i!1267)) (= lt!135960 (MissingVacant!1498 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13381 (_ BitVec 32)) SeekEntryResult!1498)

(assert (=> b!272257 (= lt!135960 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272258 () Bool)

(declare-fun res!136249 () Bool)

(assert (=> b!272258 (=> (not res!136249) (not e!174794))))

(assert (=> b!272258 (= res!136249 (validKeyInArray!0 (select (arr!6340 a!3325) startIndex!26)))))

(declare-fun b!272259 () Bool)

(declare-fun res!136246 () Bool)

(assert (=> b!272259 (=> (not res!136246) (not e!174792))))

(declare-datatypes ((List!4148 0))(
  ( (Nil!4145) (Cons!4144 (h!4811 (_ BitVec 64)) (t!9230 List!4148)) )
))
(declare-fun arrayNoDuplicates!0 (array!13381 (_ BitVec 32) List!4148) Bool)

(assert (=> b!272259 (= res!136246 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4145))))

(declare-fun b!272260 () Bool)

(declare-fun res!136251 () Bool)

(assert (=> b!272260 (=> (not res!136251) (not e!174794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13381 (_ BitVec 32)) Bool)

(assert (=> b!272260 (= res!136251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272261 () Bool)

(assert (=> b!272261 (= e!174794 (not true))))

(assert (=> b!272261 (arrayNoDuplicates!0 (array!13382 (store (arr!6340 a!3325) i!1267 k!2581) (size!6692 a!3325)) #b00000000000000000000000000000000 Nil!4145)))

(declare-datatypes ((Unit!8483 0))(
  ( (Unit!8484) )
))
(declare-fun lt!135961 () Unit!8483)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13381 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4148) Unit!8483)

(assert (=> b!272261 (= lt!135961 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4145))))

(assert (= (and start!26284 res!136247) b!272255))

(assert (= (and b!272255 res!136248) b!272256))

(assert (= (and b!272256 res!136243) b!272259))

(assert (= (and b!272259 res!136246) b!272254))

(assert (= (and b!272254 res!136245) b!272257))

(assert (= (and b!272257 res!136250) b!272260))

(assert (= (and b!272260 res!136251) b!272253))

(assert (= (and b!272253 res!136244) b!272258))

(assert (= (and b!272258 res!136249) b!272261))

(declare-fun m!287373 () Bool)

(assert (=> b!272258 m!287373))

(assert (=> b!272258 m!287373))

(declare-fun m!287375 () Bool)

(assert (=> b!272258 m!287375))

(declare-fun m!287377 () Bool)

(assert (=> start!26284 m!287377))

(declare-fun m!287379 () Bool)

(assert (=> start!26284 m!287379))

(declare-fun m!287381 () Bool)

(assert (=> b!272260 m!287381))

(declare-fun m!287383 () Bool)

(assert (=> b!272261 m!287383))

(declare-fun m!287385 () Bool)

(assert (=> b!272261 m!287385))

(declare-fun m!287387 () Bool)

(assert (=> b!272261 m!287387))

(declare-fun m!287389 () Bool)

(assert (=> b!272254 m!287389))

(declare-fun m!287391 () Bool)

(assert (=> b!272257 m!287391))

(declare-fun m!287393 () Bool)

(assert (=> b!272256 m!287393))

(declare-fun m!287395 () Bool)

(assert (=> b!272259 m!287395))

(push 1)

(assert (not b!272260))

(assert (not b!272254))

(assert (not b!272259))

