; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26290 () Bool)

(assert start!26290)

(declare-fun res!136324 () Bool)

(declare-fun e!174820 () Bool)

(assert (=> start!26290 (=> (not res!136324) (not e!174820))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26290 (= res!136324 (validMask!0 mask!3868))))

(assert (=> start!26290 e!174820))

(declare-datatypes ((array!13387 0))(
  ( (array!13388 (arr!6343 (Array (_ BitVec 32) (_ BitVec 64))) (size!6695 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13387)

(declare-fun array_inv!4306 (array!13387) Bool)

(assert (=> start!26290 (array_inv!4306 a!3325)))

(assert (=> start!26290 true))

(declare-fun b!272334 () Bool)

(declare-fun e!174819 () Bool)

(assert (=> b!272334 (= e!174819 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4151 0))(
  ( (Nil!4148) (Cons!4147 (h!4814 (_ BitVec 64)) (t!9233 List!4151)) )
))
(declare-fun arrayNoDuplicates!0 (array!13387 (_ BitVec 32) List!4151) Bool)

(assert (=> b!272334 (arrayNoDuplicates!0 (array!13388 (store (arr!6343 a!3325) i!1267 k!2581) (size!6695 a!3325)) #b00000000000000000000000000000000 Nil!4148)))

(declare-datatypes ((Unit!8489 0))(
  ( (Unit!8490) )
))
(declare-fun lt!135979 () Unit!8489)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13387 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4151) Unit!8489)

(assert (=> b!272334 (= lt!135979 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4148))))

(declare-fun b!272335 () Bool)

(declare-fun res!136332 () Bool)

(assert (=> b!272335 (=> (not res!136332) (not e!174819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13387 (_ BitVec 32)) Bool)

(assert (=> b!272335 (= res!136332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272336 () Bool)

(declare-fun res!136329 () Bool)

(assert (=> b!272336 (=> (not res!136329) (not e!174820))))

(declare-fun arrayContainsKey!0 (array!13387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272336 (= res!136329 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272337 () Bool)

(declare-fun res!136331 () Bool)

(assert (=> b!272337 (=> (not res!136331) (not e!174820))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272337 (= res!136331 (and (= (size!6695 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6695 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6695 a!3325))))))

(declare-fun b!272338 () Bool)

(declare-fun res!136326 () Bool)

(assert (=> b!272338 (=> (not res!136326) (not e!174820))))

(assert (=> b!272338 (= res!136326 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4148))))

(declare-fun b!272339 () Bool)

(declare-fun res!136330 () Bool)

(assert (=> b!272339 (=> (not res!136330) (not e!174820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272339 (= res!136330 (validKeyInArray!0 k!2581))))

(declare-fun b!272340 () Bool)

(declare-fun res!136327 () Bool)

(assert (=> b!272340 (=> (not res!136327) (not e!174819))))

(assert (=> b!272340 (= res!136327 (not (= startIndex!26 i!1267)))))

(declare-fun b!272341 () Bool)

(assert (=> b!272341 (= e!174820 e!174819)))

(declare-fun res!136328 () Bool)

(assert (=> b!272341 (=> (not res!136328) (not e!174819))))

(declare-datatypes ((SeekEntryResult!1501 0))(
  ( (MissingZero!1501 (index!8174 (_ BitVec 32))) (Found!1501 (index!8175 (_ BitVec 32))) (Intermediate!1501 (undefined!2313 Bool) (index!8176 (_ BitVec 32)) (x!26490 (_ BitVec 32))) (Undefined!1501) (MissingVacant!1501 (index!8177 (_ BitVec 32))) )
))
(declare-fun lt!135978 () SeekEntryResult!1501)

(assert (=> b!272341 (= res!136328 (or (= lt!135978 (MissingZero!1501 i!1267)) (= lt!135978 (MissingVacant!1501 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13387 (_ BitVec 32)) SeekEntryResult!1501)

(assert (=> b!272341 (= lt!135978 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272342 () Bool)

(declare-fun res!136325 () Bool)

(assert (=> b!272342 (=> (not res!136325) (not e!174819))))

(assert (=> b!272342 (= res!136325 (validKeyInArray!0 (select (arr!6343 a!3325) startIndex!26)))))

(assert (= (and start!26290 res!136324) b!272337))

(assert (= (and b!272337 res!136331) b!272339))

(assert (= (and b!272339 res!136330) b!272338))

(assert (= (and b!272338 res!136326) b!272336))

(assert (= (and b!272336 res!136329) b!272341))

(assert (= (and b!272341 res!136328) b!272335))

(assert (= (and b!272335 res!136332) b!272340))

(assert (= (and b!272340 res!136327) b!272342))

(assert (= (and b!272342 res!136325) b!272334))

(declare-fun m!287445 () Bool)

(assert (=> b!272336 m!287445))

(declare-fun m!287447 () Bool)

(assert (=> b!272334 m!287447))

(declare-fun m!287449 () Bool)

(assert (=> b!272334 m!287449))

(declare-fun m!287451 () Bool)

(assert (=> b!272334 m!287451))

(declare-fun m!287453 () Bool)

(assert (=> start!26290 m!287453))

(declare-fun m!287455 () Bool)

(assert (=> start!26290 m!287455))

(declare-fun m!287457 () Bool)

(assert (=> b!272335 m!287457))

(declare-fun m!287459 () Bool)

(assert (=> b!272339 m!287459))

(declare-fun m!287461 () Bool)

(assert (=> b!272341 m!287461))

(declare-fun m!287463 () Bool)

(assert (=> b!272338 m!287463))

(declare-fun m!287465 () Bool)

(assert (=> b!272342 m!287465))

(assert (=> b!272342 m!287465))

(declare-fun m!287467 () Bool)

(assert (=> b!272342 m!287467))

(push 1)

(assert (not b!272341))

(assert (not b!272336))

(assert (not b!272342))

