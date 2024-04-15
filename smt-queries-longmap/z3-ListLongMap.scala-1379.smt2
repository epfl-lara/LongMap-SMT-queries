; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27128 () Bool)

(assert start!27128)

(declare-fun b!280380 () Bool)

(declare-fun res!143506 () Bool)

(declare-fun e!178468 () Bool)

(assert (=> b!280380 (=> (not res!143506) (not e!178468))))

(declare-datatypes ((array!13935 0))(
  ( (array!13936 (arr!6609 (Array (_ BitVec 32) (_ BitVec 64))) (size!6962 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13935)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13935 (_ BitVec 32)) Bool)

(assert (=> b!280380 (= res!143506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280381 () Bool)

(declare-fun e!178470 () Bool)

(assert (=> b!280381 (= e!178470 e!178468)))

(declare-fun res!143509 () Bool)

(assert (=> b!280381 (=> (not res!143509) (not e!178468))))

(declare-datatypes ((SeekEntryResult!1766 0))(
  ( (MissingZero!1766 (index!9234 (_ BitVec 32))) (Found!1766 (index!9235 (_ BitVec 32))) (Intermediate!1766 (undefined!2578 Bool) (index!9236 (_ BitVec 32)) (x!27491 (_ BitVec 32))) (Undefined!1766) (MissingVacant!1766 (index!9237 (_ BitVec 32))) )
))
(declare-fun lt!138665 () SeekEntryResult!1766)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280381 (= res!143509 (or (= lt!138665 (MissingZero!1766 i!1267)) (= lt!138665 (MissingVacant!1766 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13935 (_ BitVec 32)) SeekEntryResult!1766)

(assert (=> b!280381 (= lt!138665 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280382 () Bool)

(declare-fun res!143501 () Bool)

(assert (=> b!280382 (=> (not res!143501) (not e!178468))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280382 (= res!143501 (validKeyInArray!0 (select (arr!6609 a!3325) startIndex!26)))))

(declare-fun b!280383 () Bool)

(declare-fun res!143504 () Bool)

(assert (=> b!280383 (=> (not res!143504) (not e!178470))))

(assert (=> b!280383 (= res!143504 (and (= (size!6962 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6962 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6962 a!3325))))))

(declare-fun b!280385 () Bool)

(declare-fun res!143508 () Bool)

(assert (=> b!280385 (=> (not res!143508) (not e!178470))))

(assert (=> b!280385 (= res!143508 (validKeyInArray!0 k0!2581))))

(declare-fun b!280386 () Bool)

(declare-fun res!143505 () Bool)

(assert (=> b!280386 (=> (not res!143505) (not e!178470))))

(declare-fun arrayContainsKey!0 (array!13935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280386 (= res!143505 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280387 () Bool)

(declare-fun res!143502 () Bool)

(assert (=> b!280387 (=> (not res!143502) (not e!178470))))

(declare-datatypes ((List!4390 0))(
  ( (Nil!4387) (Cons!4386 (h!5056 (_ BitVec 64)) (t!9463 List!4390)) )
))
(declare-fun arrayNoDuplicates!0 (array!13935 (_ BitVec 32) List!4390) Bool)

(assert (=> b!280387 (= res!143502 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4387))))

(declare-fun b!280388 () Bool)

(assert (=> b!280388 (= e!178468 (not true))))

(assert (=> b!280388 (arrayNoDuplicates!0 (array!13936 (store (arr!6609 a!3325) i!1267 k0!2581) (size!6962 a!3325)) #b00000000000000000000000000000000 Nil!4387)))

(declare-datatypes ((Unit!8778 0))(
  ( (Unit!8779) )
))
(declare-fun lt!138666 () Unit!8778)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13935 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4390) Unit!8778)

(assert (=> b!280388 (= lt!138666 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4387))))

(declare-fun res!143503 () Bool)

(assert (=> start!27128 (=> (not res!143503) (not e!178470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27128 (= res!143503 (validMask!0 mask!3868))))

(assert (=> start!27128 e!178470))

(declare-fun array_inv!4581 (array!13935) Bool)

(assert (=> start!27128 (array_inv!4581 a!3325)))

(assert (=> start!27128 true))

(declare-fun b!280384 () Bool)

(declare-fun res!143507 () Bool)

(assert (=> b!280384 (=> (not res!143507) (not e!178468))))

(assert (=> b!280384 (= res!143507 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27128 res!143503) b!280383))

(assert (= (and b!280383 res!143504) b!280385))

(assert (= (and b!280385 res!143508) b!280387))

(assert (= (and b!280387 res!143502) b!280386))

(assert (= (and b!280386 res!143505) b!280381))

(assert (= (and b!280381 res!143509) b!280380))

(assert (= (and b!280380 res!143506) b!280384))

(assert (= (and b!280384 res!143507) b!280382))

(assert (= (and b!280382 res!143501) b!280388))

(declare-fun m!294359 () Bool)

(assert (=> b!280381 m!294359))

(declare-fun m!294361 () Bool)

(assert (=> start!27128 m!294361))

(declare-fun m!294363 () Bool)

(assert (=> start!27128 m!294363))

(declare-fun m!294365 () Bool)

(assert (=> b!280386 m!294365))

(declare-fun m!294367 () Bool)

(assert (=> b!280385 m!294367))

(declare-fun m!294369 () Bool)

(assert (=> b!280387 m!294369))

(declare-fun m!294371 () Bool)

(assert (=> b!280382 m!294371))

(assert (=> b!280382 m!294371))

(declare-fun m!294373 () Bool)

(assert (=> b!280382 m!294373))

(declare-fun m!294375 () Bool)

(assert (=> b!280380 m!294375))

(declare-fun m!294377 () Bool)

(assert (=> b!280388 m!294377))

(declare-fun m!294379 () Bool)

(assert (=> b!280388 m!294379))

(declare-fun m!294381 () Bool)

(assert (=> b!280388 m!294381))

(check-sat (not b!280388) (not b!280387) (not start!27128) (not b!280382) (not b!280386) (not b!280380) (not b!280385) (not b!280381))
(check-sat)
