; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27120 () Bool)

(assert start!27120)

(declare-fun b!280446 () Bool)

(declare-fun res!143515 () Bool)

(declare-fun e!178542 () Bool)

(assert (=> b!280446 (=> (not res!143515) (not e!178542))))

(declare-datatypes ((array!13938 0))(
  ( (array!13939 (arr!6611 (Array (_ BitVec 32) (_ BitVec 64))) (size!6963 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13938)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280446 (= res!143515 (and (= (size!6963 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6963 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6963 a!3325))))))

(declare-fun b!280447 () Bool)

(declare-fun res!143517 () Bool)

(assert (=> b!280447 (=> (not res!143517) (not e!178542))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280447 (= res!143517 (validKeyInArray!0 k!2581))))

(declare-fun res!143522 () Bool)

(assert (=> start!27120 (=> (not res!143522) (not e!178542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27120 (= res!143522 (validMask!0 mask!3868))))

(assert (=> start!27120 e!178542))

(declare-fun array_inv!4574 (array!13938) Bool)

(assert (=> start!27120 (array_inv!4574 a!3325)))

(assert (=> start!27120 true))

(declare-fun b!280448 () Bool)

(declare-fun e!178544 () Bool)

(assert (=> b!280448 (= e!178542 e!178544)))

(declare-fun res!143523 () Bool)

(assert (=> b!280448 (=> (not res!143523) (not e!178544))))

(declare-datatypes ((SeekEntryResult!1769 0))(
  ( (MissingZero!1769 (index!9246 (_ BitVec 32))) (Found!1769 (index!9247 (_ BitVec 32))) (Intermediate!1769 (undefined!2581 Bool) (index!9248 (_ BitVec 32)) (x!27487 (_ BitVec 32))) (Undefined!1769) (MissingVacant!1769 (index!9249 (_ BitVec 32))) )
))
(declare-fun lt!138829 () SeekEntryResult!1769)

(assert (=> b!280448 (= res!143523 (or (= lt!138829 (MissingZero!1769 i!1267)) (= lt!138829 (MissingVacant!1769 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13938 (_ BitVec 32)) SeekEntryResult!1769)

(assert (=> b!280448 (= lt!138829 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280449 () Bool)

(declare-fun res!143516 () Bool)

(assert (=> b!280449 (=> (not res!143516) (not e!178544))))

(assert (=> b!280449 (= res!143516 (validKeyInArray!0 (select (arr!6611 a!3325) startIndex!26)))))

(declare-fun b!280450 () Bool)

(declare-fun res!143521 () Bool)

(assert (=> b!280450 (=> (not res!143521) (not e!178542))))

(declare-fun arrayContainsKey!0 (array!13938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280450 (= res!143521 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280451 () Bool)

(declare-fun res!143519 () Bool)

(assert (=> b!280451 (=> (not res!143519) (not e!178544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13938 (_ BitVec 32)) Bool)

(assert (=> b!280451 (= res!143519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280452 () Bool)

(declare-fun res!143518 () Bool)

(assert (=> b!280452 (=> (not res!143518) (not e!178544))))

(assert (=> b!280452 (= res!143518 (not (= startIndex!26 i!1267)))))

(declare-fun b!280453 () Bool)

(assert (=> b!280453 (= e!178544 (not true))))

(declare-datatypes ((List!4419 0))(
  ( (Nil!4416) (Cons!4415 (h!5085 (_ BitVec 64)) (t!9501 List!4419)) )
))
(declare-fun arrayNoDuplicates!0 (array!13938 (_ BitVec 32) List!4419) Bool)

(assert (=> b!280453 (arrayNoDuplicates!0 (array!13939 (store (arr!6611 a!3325) i!1267 k!2581) (size!6963 a!3325)) #b00000000000000000000000000000000 Nil!4416)))

(declare-datatypes ((Unit!8822 0))(
  ( (Unit!8823) )
))
(declare-fun lt!138828 () Unit!8822)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13938 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4419) Unit!8822)

(assert (=> b!280453 (= lt!138828 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4416))))

(declare-fun b!280454 () Bool)

(declare-fun res!143520 () Bool)

(assert (=> b!280454 (=> (not res!143520) (not e!178542))))

(assert (=> b!280454 (= res!143520 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4416))))

(assert (= (and start!27120 res!143522) b!280446))

(assert (= (and b!280446 res!143515) b!280447))

(assert (= (and b!280447 res!143517) b!280454))

(assert (= (and b!280454 res!143520) b!280450))

(assert (= (and b!280450 res!143521) b!280448))

(assert (= (and b!280448 res!143523) b!280451))

(assert (= (and b!280451 res!143519) b!280452))

(assert (= (and b!280452 res!143518) b!280449))

(assert (= (and b!280449 res!143516) b!280453))

(declare-fun m!294879 () Bool)

(assert (=> b!280454 m!294879))

(declare-fun m!294881 () Bool)

(assert (=> b!280448 m!294881))

(declare-fun m!294883 () Bool)

(assert (=> b!280450 m!294883))

(declare-fun m!294885 () Bool)

(assert (=> b!280451 m!294885))

(declare-fun m!294887 () Bool)

(assert (=> b!280453 m!294887))

(declare-fun m!294889 () Bool)

(assert (=> b!280453 m!294889))

(declare-fun m!294891 () Bool)

(assert (=> b!280453 m!294891))

(declare-fun m!294893 () Bool)

(assert (=> b!280447 m!294893))

(declare-fun m!294895 () Bool)

(assert (=> b!280449 m!294895))

(assert (=> b!280449 m!294895))

(declare-fun m!294897 () Bool)

(assert (=> b!280449 m!294897))

(declare-fun m!294899 () Bool)

(assert (=> start!27120 m!294899))

(declare-fun m!294901 () Bool)

(assert (=> start!27120 m!294901))

(push 1)

