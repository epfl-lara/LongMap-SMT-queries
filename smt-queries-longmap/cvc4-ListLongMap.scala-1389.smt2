; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27190 () Bool)

(assert start!27190)

(declare-fun b!281391 () Bool)

(declare-fun res!144466 () Bool)

(declare-fun e!178857 () Bool)

(assert (=> b!281391 (=> (not res!144466) (not e!178857))))

(declare-datatypes ((array!14008 0))(
  ( (array!14009 (arr!6646 (Array (_ BitVec 32) (_ BitVec 64))) (size!6998 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14008)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281391 (= res!144466 (validKeyInArray!0 (select (arr!6646 a!3325) startIndex!26)))))

(declare-fun b!281392 () Bool)

(declare-fun res!144468 () Bool)

(declare-fun e!178859 () Bool)

(assert (=> b!281392 (=> (not res!144468) (not e!178859))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281392 (= res!144468 (and (= (size!6998 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6998 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6998 a!3325))))))

(declare-fun b!281393 () Bool)

(declare-fun res!144464 () Bool)

(assert (=> b!281393 (=> (not res!144464) (not e!178859))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!281393 (= res!144464 (validKeyInArray!0 k!2581))))

(declare-fun b!281394 () Bool)

(assert (=> b!281394 (= e!178857 (not true))))

(declare-datatypes ((List!4454 0))(
  ( (Nil!4451) (Cons!4450 (h!5120 (_ BitVec 64)) (t!9536 List!4454)) )
))
(declare-fun arrayNoDuplicates!0 (array!14008 (_ BitVec 32) List!4454) Bool)

(assert (=> b!281394 (arrayNoDuplicates!0 (array!14009 (store (arr!6646 a!3325) i!1267 k!2581) (size!6998 a!3325)) #b00000000000000000000000000000000 Nil!4451)))

(declare-datatypes ((Unit!8892 0))(
  ( (Unit!8893) )
))
(declare-fun lt!139038 () Unit!8892)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14008 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4454) Unit!8892)

(assert (=> b!281394 (= lt!139038 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4451))))

(declare-fun b!281395 () Bool)

(assert (=> b!281395 (= e!178859 e!178857)))

(declare-fun res!144460 () Bool)

(assert (=> b!281395 (=> (not res!144460) (not e!178857))))

(declare-datatypes ((SeekEntryResult!1804 0))(
  ( (MissingZero!1804 (index!9386 (_ BitVec 32))) (Found!1804 (index!9387 (_ BitVec 32))) (Intermediate!1804 (undefined!2616 Bool) (index!9388 (_ BitVec 32)) (x!27610 (_ BitVec 32))) (Undefined!1804) (MissingVacant!1804 (index!9389 (_ BitVec 32))) )
))
(declare-fun lt!139039 () SeekEntryResult!1804)

(assert (=> b!281395 (= res!144460 (or (= lt!139039 (MissingZero!1804 i!1267)) (= lt!139039 (MissingVacant!1804 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14008 (_ BitVec 32)) SeekEntryResult!1804)

(assert (=> b!281395 (= lt!139039 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281396 () Bool)

(declare-fun res!144465 () Bool)

(assert (=> b!281396 (=> (not res!144465) (not e!178859))))

(declare-fun arrayContainsKey!0 (array!14008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281396 (= res!144465 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281397 () Bool)

(declare-fun res!144461 () Bool)

(assert (=> b!281397 (=> (not res!144461) (not e!178857))))

(assert (=> b!281397 (= res!144461 (not (= startIndex!26 i!1267)))))

(declare-fun res!144467 () Bool)

(assert (=> start!27190 (=> (not res!144467) (not e!178859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27190 (= res!144467 (validMask!0 mask!3868))))

(assert (=> start!27190 e!178859))

(declare-fun array_inv!4609 (array!14008) Bool)

(assert (=> start!27190 (array_inv!4609 a!3325)))

(assert (=> start!27190 true))

(declare-fun b!281398 () Bool)

(declare-fun res!144462 () Bool)

(assert (=> b!281398 (=> (not res!144462) (not e!178859))))

(assert (=> b!281398 (= res!144462 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4451))))

(declare-fun b!281399 () Bool)

(declare-fun res!144463 () Bool)

(assert (=> b!281399 (=> (not res!144463) (not e!178857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14008 (_ BitVec 32)) Bool)

(assert (=> b!281399 (= res!144463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27190 res!144467) b!281392))

(assert (= (and b!281392 res!144468) b!281393))

(assert (= (and b!281393 res!144464) b!281398))

(assert (= (and b!281398 res!144462) b!281396))

(assert (= (and b!281396 res!144465) b!281395))

(assert (= (and b!281395 res!144460) b!281399))

(assert (= (and b!281399 res!144463) b!281397))

(assert (= (and b!281397 res!144461) b!281391))

(assert (= (and b!281391 res!144466) b!281394))

(declare-fun m!295719 () Bool)

(assert (=> b!281394 m!295719))

(declare-fun m!295721 () Bool)

(assert (=> b!281394 m!295721))

(declare-fun m!295723 () Bool)

(assert (=> b!281394 m!295723))

(declare-fun m!295725 () Bool)

(assert (=> b!281398 m!295725))

(declare-fun m!295727 () Bool)

(assert (=> b!281396 m!295727))

(declare-fun m!295729 () Bool)

(assert (=> start!27190 m!295729))

(declare-fun m!295731 () Bool)

(assert (=> start!27190 m!295731))

(declare-fun m!295733 () Bool)

(assert (=> b!281399 m!295733))

(declare-fun m!295735 () Bool)

(assert (=> b!281395 m!295735))

(declare-fun m!295737 () Bool)

(assert (=> b!281393 m!295737))

(declare-fun m!295739 () Bool)

(assert (=> b!281391 m!295739))

(assert (=> b!281391 m!295739))

(declare-fun m!295741 () Bool)

(assert (=> b!281391 m!295741))

(push 1)

(assert (not b!281391))

(assert (not b!281393))

(assert (not start!27190))

(assert (not b!281395))

(assert (not b!281394))

(assert (not b!281398))

