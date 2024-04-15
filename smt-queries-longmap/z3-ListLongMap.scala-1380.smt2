; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27134 () Bool)

(assert start!27134)

(declare-fun b!280461 () Bool)

(declare-fun res!143586 () Bool)

(declare-fun e!178495 () Bool)

(assert (=> b!280461 (=> (not res!143586) (not e!178495))))

(declare-datatypes ((array!13941 0))(
  ( (array!13942 (arr!6612 (Array (_ BitVec 32) (_ BitVec 64))) (size!6965 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13941)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13941 (_ BitVec 32)) Bool)

(assert (=> b!280461 (= res!143586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280462 () Bool)

(declare-fun res!143585 () Bool)

(declare-fun e!178497 () Bool)

(assert (=> b!280462 (=> (not res!143585) (not e!178497))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280462 (= res!143585 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280463 () Bool)

(declare-fun res!143590 () Bool)

(assert (=> b!280463 (=> (not res!143590) (not e!178497))))

(declare-datatypes ((List!4393 0))(
  ( (Nil!4390) (Cons!4389 (h!5059 (_ BitVec 64)) (t!9466 List!4393)) )
))
(declare-fun arrayNoDuplicates!0 (array!13941 (_ BitVec 32) List!4393) Bool)

(assert (=> b!280463 (= res!143590 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4390))))

(declare-fun res!143582 () Bool)

(assert (=> start!27134 (=> (not res!143582) (not e!178497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27134 (= res!143582 (validMask!0 mask!3868))))

(assert (=> start!27134 e!178497))

(declare-fun array_inv!4584 (array!13941) Bool)

(assert (=> start!27134 (array_inv!4584 a!3325)))

(assert (=> start!27134 true))

(declare-fun b!280464 () Bool)

(declare-fun res!143583 () Bool)

(assert (=> b!280464 (=> (not res!143583) (not e!178497))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280464 (= res!143583 (and (= (size!6965 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6965 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6965 a!3325))))))

(declare-fun b!280465 () Bool)

(declare-fun res!143584 () Bool)

(assert (=> b!280465 (=> (not res!143584) (not e!178495))))

(assert (=> b!280465 (= res!143584 (not (= startIndex!26 i!1267)))))

(declare-fun b!280466 () Bool)

(declare-fun res!143588 () Bool)

(assert (=> b!280466 (=> (not res!143588) (not e!178497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280466 (= res!143588 (validKeyInArray!0 k0!2581))))

(declare-fun b!280467 () Bool)

(assert (=> b!280467 (= e!178497 e!178495)))

(declare-fun res!143589 () Bool)

(assert (=> b!280467 (=> (not res!143589) (not e!178495))))

(declare-datatypes ((SeekEntryResult!1769 0))(
  ( (MissingZero!1769 (index!9246 (_ BitVec 32))) (Found!1769 (index!9247 (_ BitVec 32))) (Intermediate!1769 (undefined!2581 Bool) (index!9248 (_ BitVec 32)) (x!27502 (_ BitVec 32))) (Undefined!1769) (MissingVacant!1769 (index!9249 (_ BitVec 32))) )
))
(declare-fun lt!138684 () SeekEntryResult!1769)

(assert (=> b!280467 (= res!143589 (or (= lt!138684 (MissingZero!1769 i!1267)) (= lt!138684 (MissingVacant!1769 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13941 (_ BitVec 32)) SeekEntryResult!1769)

(assert (=> b!280467 (= lt!138684 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280468 () Bool)

(declare-fun res!143587 () Bool)

(assert (=> b!280468 (=> (not res!143587) (not e!178495))))

(assert (=> b!280468 (= res!143587 (validKeyInArray!0 (select (arr!6612 a!3325) startIndex!26)))))

(declare-fun b!280469 () Bool)

(assert (=> b!280469 (= e!178495 (not true))))

(assert (=> b!280469 (arrayNoDuplicates!0 (array!13942 (store (arr!6612 a!3325) i!1267 k0!2581) (size!6965 a!3325)) #b00000000000000000000000000000000 Nil!4390)))

(declare-datatypes ((Unit!8784 0))(
  ( (Unit!8785) )
))
(declare-fun lt!138683 () Unit!8784)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13941 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4393) Unit!8784)

(assert (=> b!280469 (= lt!138683 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4390))))

(assert (= (and start!27134 res!143582) b!280464))

(assert (= (and b!280464 res!143583) b!280466))

(assert (= (and b!280466 res!143588) b!280463))

(assert (= (and b!280463 res!143590) b!280462))

(assert (= (and b!280462 res!143585) b!280467))

(assert (= (and b!280467 res!143589) b!280461))

(assert (= (and b!280461 res!143586) b!280465))

(assert (= (and b!280465 res!143584) b!280468))

(assert (= (and b!280468 res!143587) b!280469))

(declare-fun m!294431 () Bool)

(assert (=> b!280467 m!294431))

(declare-fun m!294433 () Bool)

(assert (=> b!280463 m!294433))

(declare-fun m!294435 () Bool)

(assert (=> b!280462 m!294435))

(declare-fun m!294437 () Bool)

(assert (=> b!280466 m!294437))

(declare-fun m!294439 () Bool)

(assert (=> start!27134 m!294439))

(declare-fun m!294441 () Bool)

(assert (=> start!27134 m!294441))

(declare-fun m!294443 () Bool)

(assert (=> b!280469 m!294443))

(declare-fun m!294445 () Bool)

(assert (=> b!280469 m!294445))

(declare-fun m!294447 () Bool)

(assert (=> b!280469 m!294447))

(declare-fun m!294449 () Bool)

(assert (=> b!280468 m!294449))

(assert (=> b!280468 m!294449))

(declare-fun m!294451 () Bool)

(assert (=> b!280468 m!294451))

(declare-fun m!294453 () Bool)

(assert (=> b!280461 m!294453))

(check-sat (not b!280462) (not b!280461) (not start!27134) (not b!280468) (not b!280467) (not b!280463) (not b!280469) (not b!280466))
(check-sat)
