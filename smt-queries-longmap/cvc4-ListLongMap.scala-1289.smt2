; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26296 () Bool)

(assert start!26296)

(declare-fun b!272415 () Bool)

(declare-fun res!136413 () Bool)

(declare-fun e!174847 () Bool)

(assert (=> b!272415 (=> (not res!136413) (not e!174847))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272415 (= res!136413 (validKeyInArray!0 k!2581))))

(declare-fun b!272416 () Bool)

(declare-fun e!174848 () Bool)

(assert (=> b!272416 (= e!174847 e!174848)))

(declare-fun res!136411 () Bool)

(assert (=> b!272416 (=> (not res!136411) (not e!174848))))

(declare-datatypes ((SeekEntryResult!1504 0))(
  ( (MissingZero!1504 (index!8186 (_ BitVec 32))) (Found!1504 (index!8187 (_ BitVec 32))) (Intermediate!1504 (undefined!2316 Bool) (index!8188 (_ BitVec 32)) (x!26501 (_ BitVec 32))) (Undefined!1504) (MissingVacant!1504 (index!8189 (_ BitVec 32))) )
))
(declare-fun lt!135996 () SeekEntryResult!1504)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272416 (= res!136411 (or (= lt!135996 (MissingZero!1504 i!1267)) (= lt!135996 (MissingVacant!1504 i!1267))))))

(declare-datatypes ((array!13393 0))(
  ( (array!13394 (arr!6346 (Array (_ BitVec 32) (_ BitVec 64))) (size!6698 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13393)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13393 (_ BitVec 32)) SeekEntryResult!1504)

(assert (=> b!272416 (= lt!135996 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272417 () Bool)

(declare-fun res!136410 () Bool)

(assert (=> b!272417 (=> (not res!136410) (not e!174848))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272417 (= res!136410 (validKeyInArray!0 (select (arr!6346 a!3325) startIndex!26)))))

(declare-fun res!136409 () Bool)

(assert (=> start!26296 (=> (not res!136409) (not e!174847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26296 (= res!136409 (validMask!0 mask!3868))))

(assert (=> start!26296 e!174847))

(declare-fun array_inv!4309 (array!13393) Bool)

(assert (=> start!26296 (array_inv!4309 a!3325)))

(assert (=> start!26296 true))

(declare-fun b!272418 () Bool)

(declare-fun res!136412 () Bool)

(assert (=> b!272418 (=> (not res!136412) (not e!174847))))

(declare-fun arrayContainsKey!0 (array!13393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272418 (= res!136412 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272419 () Bool)

(assert (=> b!272419 (= e!174848 (not true))))

(declare-datatypes ((List!4154 0))(
  ( (Nil!4151) (Cons!4150 (h!4817 (_ BitVec 64)) (t!9236 List!4154)) )
))
(declare-fun arrayNoDuplicates!0 (array!13393 (_ BitVec 32) List!4154) Bool)

(assert (=> b!272419 (arrayNoDuplicates!0 (array!13394 (store (arr!6346 a!3325) i!1267 k!2581) (size!6698 a!3325)) #b00000000000000000000000000000000 Nil!4151)))

(declare-datatypes ((Unit!8495 0))(
  ( (Unit!8496) )
))
(declare-fun lt!135997 () Unit!8495)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13393 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4154) Unit!8495)

(assert (=> b!272419 (= lt!135997 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4151))))

(declare-fun b!272420 () Bool)

(declare-fun res!136405 () Bool)

(assert (=> b!272420 (=> (not res!136405) (not e!174848))))

(assert (=> b!272420 (= res!136405 (not (= startIndex!26 i!1267)))))

(declare-fun b!272421 () Bool)

(declare-fun res!136406 () Bool)

(assert (=> b!272421 (=> (not res!136406) (not e!174847))))

(assert (=> b!272421 (= res!136406 (and (= (size!6698 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6698 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6698 a!3325))))))

(declare-fun b!272422 () Bool)

(declare-fun res!136407 () Bool)

(assert (=> b!272422 (=> (not res!136407) (not e!174847))))

(assert (=> b!272422 (= res!136407 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4151))))

(declare-fun b!272423 () Bool)

(declare-fun res!136408 () Bool)

(assert (=> b!272423 (=> (not res!136408) (not e!174848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13393 (_ BitVec 32)) Bool)

(assert (=> b!272423 (= res!136408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26296 res!136409) b!272421))

(assert (= (and b!272421 res!136406) b!272415))

(assert (= (and b!272415 res!136413) b!272422))

(assert (= (and b!272422 res!136407) b!272418))

(assert (= (and b!272418 res!136412) b!272416))

(assert (= (and b!272416 res!136411) b!272423))

(assert (= (and b!272423 res!136408) b!272420))

(assert (= (and b!272420 res!136405) b!272417))

(assert (= (and b!272417 res!136410) b!272419))

(declare-fun m!287517 () Bool)

(assert (=> start!26296 m!287517))

(declare-fun m!287519 () Bool)

(assert (=> start!26296 m!287519))

(declare-fun m!287521 () Bool)

(assert (=> b!272417 m!287521))

(assert (=> b!272417 m!287521))

(declare-fun m!287523 () Bool)

(assert (=> b!272417 m!287523))

(declare-fun m!287525 () Bool)

(assert (=> b!272418 m!287525))

(declare-fun m!287527 () Bool)

(assert (=> b!272415 m!287527))

(declare-fun m!287529 () Bool)

(assert (=> b!272422 m!287529))

(declare-fun m!287531 () Bool)

(assert (=> b!272419 m!287531))

(declare-fun m!287533 () Bool)

(assert (=> b!272419 m!287533))

(declare-fun m!287535 () Bool)

(assert (=> b!272419 m!287535))

(declare-fun m!287537 () Bool)

(assert (=> b!272423 m!287537))

(declare-fun m!287539 () Bool)

(assert (=> b!272416 m!287539))

(push 1)

(assert (not b!272416))

(assert (not b!272417))

(assert (not start!26296))

