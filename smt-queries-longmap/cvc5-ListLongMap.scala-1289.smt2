; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26292 () Bool)

(assert start!26292)

(declare-fun res!136356 () Bool)

(declare-fun e!174828 () Bool)

(assert (=> start!26292 (=> (not res!136356) (not e!174828))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26292 (= res!136356 (validMask!0 mask!3868))))

(assert (=> start!26292 e!174828))

(declare-datatypes ((array!13389 0))(
  ( (array!13390 (arr!6344 (Array (_ BitVec 32) (_ BitVec 64))) (size!6696 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13389)

(declare-fun array_inv!4307 (array!13389) Bool)

(assert (=> start!26292 (array_inv!4307 a!3325)))

(assert (=> start!26292 true))

(declare-fun b!272361 () Bool)

(declare-fun e!174829 () Bool)

(assert (=> b!272361 (= e!174829 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((List!4152 0))(
  ( (Nil!4149) (Cons!4148 (h!4815 (_ BitVec 64)) (t!9234 List!4152)) )
))
(declare-fun arrayNoDuplicates!0 (array!13389 (_ BitVec 32) List!4152) Bool)

(assert (=> b!272361 (arrayNoDuplicates!0 (array!13390 (store (arr!6344 a!3325) i!1267 k!2581) (size!6696 a!3325)) #b00000000000000000000000000000000 Nil!4149)))

(declare-datatypes ((Unit!8491 0))(
  ( (Unit!8492) )
))
(declare-fun lt!135985 () Unit!8491)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4152) Unit!8491)

(assert (=> b!272361 (= lt!135985 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4149))))

(declare-fun b!272362 () Bool)

(declare-fun res!136351 () Bool)

(assert (=> b!272362 (=> (not res!136351) (not e!174828))))

(assert (=> b!272362 (= res!136351 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4149))))

(declare-fun b!272363 () Bool)

(declare-fun res!136359 () Bool)

(assert (=> b!272363 (=> (not res!136359) (not e!174828))))

(declare-fun arrayContainsKey!0 (array!13389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272363 (= res!136359 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272364 () Bool)

(declare-fun res!136355 () Bool)

(assert (=> b!272364 (=> (not res!136355) (not e!174828))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272364 (= res!136355 (and (= (size!6696 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6696 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6696 a!3325))))))

(declare-fun b!272365 () Bool)

(declare-fun res!136352 () Bool)

(assert (=> b!272365 (=> (not res!136352) (not e!174829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13389 (_ BitVec 32)) Bool)

(assert (=> b!272365 (= res!136352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272366 () Bool)

(assert (=> b!272366 (= e!174828 e!174829)))

(declare-fun res!136358 () Bool)

(assert (=> b!272366 (=> (not res!136358) (not e!174829))))

(declare-datatypes ((SeekEntryResult!1502 0))(
  ( (MissingZero!1502 (index!8178 (_ BitVec 32))) (Found!1502 (index!8179 (_ BitVec 32))) (Intermediate!1502 (undefined!2314 Bool) (index!8180 (_ BitVec 32)) (x!26499 (_ BitVec 32))) (Undefined!1502) (MissingVacant!1502 (index!8181 (_ BitVec 32))) )
))
(declare-fun lt!135984 () SeekEntryResult!1502)

(assert (=> b!272366 (= res!136358 (or (= lt!135984 (MissingZero!1502 i!1267)) (= lt!135984 (MissingVacant!1502 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13389 (_ BitVec 32)) SeekEntryResult!1502)

(assert (=> b!272366 (= lt!135984 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272367 () Bool)

(declare-fun res!136357 () Bool)

(assert (=> b!272367 (=> (not res!136357) (not e!174828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272367 (= res!136357 (validKeyInArray!0 k!2581))))

(declare-fun b!272368 () Bool)

(declare-fun res!136353 () Bool)

(assert (=> b!272368 (=> (not res!136353) (not e!174829))))

(assert (=> b!272368 (= res!136353 (validKeyInArray!0 (select (arr!6344 a!3325) startIndex!26)))))

(declare-fun b!272369 () Bool)

(declare-fun res!136354 () Bool)

(assert (=> b!272369 (=> (not res!136354) (not e!174829))))

(assert (=> b!272369 (= res!136354 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26292 res!136356) b!272364))

(assert (= (and b!272364 res!136355) b!272367))

(assert (= (and b!272367 res!136357) b!272362))

(assert (= (and b!272362 res!136351) b!272363))

(assert (= (and b!272363 res!136359) b!272366))

(assert (= (and b!272366 res!136358) b!272365))

(assert (= (and b!272365 res!136352) b!272369))

(assert (= (and b!272369 res!136354) b!272368))

(assert (= (and b!272368 res!136353) b!272361))

(declare-fun m!287469 () Bool)

(assert (=> start!26292 m!287469))

(declare-fun m!287471 () Bool)

(assert (=> start!26292 m!287471))

(declare-fun m!287473 () Bool)

(assert (=> b!272362 m!287473))

(declare-fun m!287475 () Bool)

(assert (=> b!272368 m!287475))

(assert (=> b!272368 m!287475))

(declare-fun m!287477 () Bool)

(assert (=> b!272368 m!287477))

(declare-fun m!287479 () Bool)

(assert (=> b!272366 m!287479))

(declare-fun m!287481 () Bool)

(assert (=> b!272367 m!287481))

(declare-fun m!287483 () Bool)

(assert (=> b!272363 m!287483))

(declare-fun m!287485 () Bool)

(assert (=> b!272361 m!287485))

(declare-fun m!287487 () Bool)

(assert (=> b!272361 m!287487))

(declare-fun m!287489 () Bool)

(assert (=> b!272361 m!287489))

(declare-fun m!287491 () Bool)

(assert (=> b!272365 m!287491))

(push 1)

