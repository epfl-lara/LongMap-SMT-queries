; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27196 () Bool)

(assert start!27196)

(declare-fun res!144542 () Bool)

(declare-fun e!178885 () Bool)

(assert (=> start!27196 (=> (not res!144542) (not e!178885))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27196 (= res!144542 (validMask!0 mask!3868))))

(assert (=> start!27196 e!178885))

(declare-datatypes ((array!14014 0))(
  ( (array!14015 (arr!6649 (Array (_ BitVec 32) (_ BitVec 64))) (size!7001 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14014)

(declare-fun array_inv!4612 (array!14014) Bool)

(assert (=> start!27196 (array_inv!4612 a!3325)))

(assert (=> start!27196 true))

(declare-fun b!281472 () Bool)

(declare-fun res!144541 () Bool)

(assert (=> b!281472 (=> (not res!144541) (not e!178885))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281472 (= res!144541 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281473 () Bool)

(declare-fun e!178886 () Bool)

(assert (=> b!281473 (= e!178886 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((List!4457 0))(
  ( (Nil!4454) (Cons!4453 (h!5123 (_ BitVec 64)) (t!9539 List!4457)) )
))
(declare-fun arrayNoDuplicates!0 (array!14014 (_ BitVec 32) List!4457) Bool)

(assert (=> b!281473 (arrayNoDuplicates!0 (array!14015 (store (arr!6649 a!3325) i!1267 k!2581) (size!7001 a!3325)) #b00000000000000000000000000000000 Nil!4454)))

(declare-datatypes ((Unit!8898 0))(
  ( (Unit!8899) )
))
(declare-fun lt!139056 () Unit!8898)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14014 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4457) Unit!8898)

(assert (=> b!281473 (= lt!139056 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4454))))

(declare-fun b!281474 () Bool)

(declare-fun res!144547 () Bool)

(assert (=> b!281474 (=> (not res!144547) (not e!178885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281474 (= res!144547 (validKeyInArray!0 k!2581))))

(declare-fun b!281475 () Bool)

(declare-fun res!144543 () Bool)

(assert (=> b!281475 (=> (not res!144543) (not e!178885))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281475 (= res!144543 (and (= (size!7001 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7001 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7001 a!3325))))))

(declare-fun b!281476 () Bool)

(declare-fun res!144545 () Bool)

(assert (=> b!281476 (=> (not res!144545) (not e!178886))))

(assert (=> b!281476 (= res!144545 (validKeyInArray!0 (select (arr!6649 a!3325) startIndex!26)))))

(declare-fun b!281477 () Bool)

(declare-fun res!144549 () Bool)

(assert (=> b!281477 (=> (not res!144549) (not e!178885))))

(assert (=> b!281477 (= res!144549 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4454))))

(declare-fun b!281478 () Bool)

(declare-fun res!144544 () Bool)

(assert (=> b!281478 (=> (not res!144544) (not e!178886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14014 (_ BitVec 32)) Bool)

(assert (=> b!281478 (= res!144544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281479 () Bool)

(declare-fun res!144548 () Bool)

(assert (=> b!281479 (=> (not res!144548) (not e!178886))))

(assert (=> b!281479 (= res!144548 (not (= startIndex!26 i!1267)))))

(declare-fun b!281480 () Bool)

(assert (=> b!281480 (= e!178885 e!178886)))

(declare-fun res!144546 () Bool)

(assert (=> b!281480 (=> (not res!144546) (not e!178886))))

(declare-datatypes ((SeekEntryResult!1807 0))(
  ( (MissingZero!1807 (index!9398 (_ BitVec 32))) (Found!1807 (index!9399 (_ BitVec 32))) (Intermediate!1807 (undefined!2619 Bool) (index!9400 (_ BitVec 32)) (x!27621 (_ BitVec 32))) (Undefined!1807) (MissingVacant!1807 (index!9401 (_ BitVec 32))) )
))
(declare-fun lt!139057 () SeekEntryResult!1807)

(assert (=> b!281480 (= res!144546 (or (= lt!139057 (MissingZero!1807 i!1267)) (= lt!139057 (MissingVacant!1807 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14014 (_ BitVec 32)) SeekEntryResult!1807)

(assert (=> b!281480 (= lt!139057 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27196 res!144542) b!281475))

(assert (= (and b!281475 res!144543) b!281474))

(assert (= (and b!281474 res!144547) b!281477))

(assert (= (and b!281477 res!144549) b!281472))

(assert (= (and b!281472 res!144541) b!281480))

(assert (= (and b!281480 res!144546) b!281478))

(assert (= (and b!281478 res!144544) b!281479))

(assert (= (and b!281479 res!144548) b!281476))

(assert (= (and b!281476 res!144545) b!281473))

(declare-fun m!295791 () Bool)

(assert (=> b!281474 m!295791))

(declare-fun m!295793 () Bool)

(assert (=> b!281472 m!295793))

(declare-fun m!295795 () Bool)

(assert (=> b!281476 m!295795))

(assert (=> b!281476 m!295795))

(declare-fun m!295797 () Bool)

(assert (=> b!281476 m!295797))

(declare-fun m!295799 () Bool)

(assert (=> b!281477 m!295799))

(declare-fun m!295801 () Bool)

(assert (=> b!281480 m!295801))

(declare-fun m!295803 () Bool)

(assert (=> b!281473 m!295803))

(declare-fun m!295805 () Bool)

(assert (=> b!281473 m!295805))

(declare-fun m!295807 () Bool)

(assert (=> b!281473 m!295807))

(declare-fun m!295809 () Bool)

(assert (=> b!281478 m!295809))

(declare-fun m!295811 () Bool)

(assert (=> start!27196 m!295811))

(declare-fun m!295813 () Bool)

(assert (=> start!27196 m!295813))

(push 1)

(assert (not b!281478))

