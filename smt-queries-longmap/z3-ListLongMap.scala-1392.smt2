; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27206 () Bool)

(assert start!27206)

(declare-fun b!281433 () Bool)

(declare-fun res!144556 () Bool)

(declare-fun e!178833 () Bool)

(assert (=> b!281433 (=> (not res!144556) (not e!178833))))

(declare-datatypes ((array!14013 0))(
  ( (array!14014 (arr!6648 (Array (_ BitVec 32) (_ BitVec 64))) (size!7001 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14013)

(declare-datatypes ((List!4429 0))(
  ( (Nil!4426) (Cons!4425 (h!5095 (_ BitVec 64)) (t!9502 List!4429)) )
))
(declare-fun arrayNoDuplicates!0 (array!14013 (_ BitVec 32) List!4429) Bool)

(assert (=> b!281433 (= res!144556 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4426))))

(declare-fun b!281434 () Bool)

(declare-fun res!144560 () Bool)

(declare-fun e!178830 () Bool)

(assert (=> b!281434 (=> (not res!144560) (not e!178830))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281434 (= res!144560 (validKeyInArray!0 (select (arr!6648 a!3325) startIndex!26)))))

(declare-fun b!281435 () Bool)

(declare-fun res!144554 () Bool)

(assert (=> b!281435 (=> (not res!144554) (not e!178833))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!281435 (= res!144554 (validKeyInArray!0 k0!2581))))

(declare-fun b!281436 () Bool)

(assert (=> b!281436 (= e!178830 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!138923 () array!14013)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1805 0))(
  ( (MissingZero!1805 (index!9390 (_ BitVec 32))) (Found!1805 (index!9391 (_ BitVec 32))) (Intermediate!1805 (undefined!2617 Bool) (index!9392 (_ BitVec 32)) (x!27634 (_ BitVec 32))) (Undefined!1805) (MissingVacant!1805 (index!9393 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14013 (_ BitVec 32)) SeekEntryResult!1805)

(assert (=> b!281436 (= (seekEntryOrOpen!0 (select (arr!6648 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6648 a!3325) i!1267 k0!2581) startIndex!26) lt!138923 mask!3868))))

(declare-datatypes ((Unit!8856 0))(
  ( (Unit!8857) )
))
(declare-fun lt!138924 () Unit!8856)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14013 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8856)

(assert (=> b!281436 (= lt!138924 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281436 (arrayNoDuplicates!0 lt!138923 #b00000000000000000000000000000000 Nil!4426)))

(declare-fun lt!138921 () Unit!8856)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14013 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4429) Unit!8856)

(assert (=> b!281436 (= lt!138921 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4426))))

(declare-fun b!281437 () Bool)

(declare-fun res!144555 () Bool)

(assert (=> b!281437 (=> (not res!144555) (not e!178833))))

(declare-fun arrayContainsKey!0 (array!14013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281437 (= res!144555 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!144562 () Bool)

(assert (=> start!27206 (=> (not res!144562) (not e!178833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27206 (= res!144562 (validMask!0 mask!3868))))

(assert (=> start!27206 e!178833))

(declare-fun array_inv!4620 (array!14013) Bool)

(assert (=> start!27206 (array_inv!4620 a!3325)))

(assert (=> start!27206 true))

(declare-fun b!281438 () Bool)

(declare-fun e!178831 () Bool)

(assert (=> b!281438 (= e!178833 e!178831)))

(declare-fun res!144561 () Bool)

(assert (=> b!281438 (=> (not res!144561) (not e!178831))))

(declare-fun lt!138922 () SeekEntryResult!1805)

(assert (=> b!281438 (= res!144561 (or (= lt!138922 (MissingZero!1805 i!1267)) (= lt!138922 (MissingVacant!1805 i!1267))))))

(assert (=> b!281438 (= lt!138922 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281439 () Bool)

(declare-fun res!144559 () Bool)

(assert (=> b!281439 (=> (not res!144559) (not e!178831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14013 (_ BitVec 32)) Bool)

(assert (=> b!281439 (= res!144559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281440 () Bool)

(declare-fun res!144557 () Bool)

(assert (=> b!281440 (=> (not res!144557) (not e!178833))))

(assert (=> b!281440 (= res!144557 (and (= (size!7001 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7001 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7001 a!3325))))))

(declare-fun b!281441 () Bool)

(assert (=> b!281441 (= e!178831 e!178830)))

(declare-fun res!144558 () Bool)

(assert (=> b!281441 (=> (not res!144558) (not e!178830))))

(assert (=> b!281441 (= res!144558 (not (= startIndex!26 i!1267)))))

(assert (=> b!281441 (= lt!138923 (array!14014 (store (arr!6648 a!3325) i!1267 k0!2581) (size!7001 a!3325)))))

(assert (= (and start!27206 res!144562) b!281440))

(assert (= (and b!281440 res!144557) b!281435))

(assert (= (and b!281435 res!144554) b!281433))

(assert (= (and b!281433 res!144556) b!281437))

(assert (= (and b!281437 res!144555) b!281438))

(assert (= (and b!281438 res!144561) b!281439))

(assert (= (and b!281439 res!144559) b!281441))

(assert (= (and b!281441 res!144558) b!281434))

(assert (= (and b!281434 res!144560) b!281436))

(declare-fun m!295319 () Bool)

(assert (=> b!281439 m!295319))

(declare-fun m!295321 () Bool)

(assert (=> b!281436 m!295321))

(declare-fun m!295323 () Bool)

(assert (=> b!281436 m!295323))

(declare-fun m!295325 () Bool)

(assert (=> b!281436 m!295325))

(declare-fun m!295327 () Bool)

(assert (=> b!281436 m!295327))

(declare-fun m!295329 () Bool)

(assert (=> b!281436 m!295329))

(assert (=> b!281436 m!295325))

(declare-fun m!295331 () Bool)

(assert (=> b!281436 m!295331))

(declare-fun m!295333 () Bool)

(assert (=> b!281436 m!295333))

(assert (=> b!281436 m!295321))

(declare-fun m!295335 () Bool)

(assert (=> b!281436 m!295335))

(declare-fun m!295337 () Bool)

(assert (=> b!281433 m!295337))

(declare-fun m!295339 () Bool)

(assert (=> b!281437 m!295339))

(declare-fun m!295341 () Bool)

(assert (=> b!281435 m!295341))

(declare-fun m!295343 () Bool)

(assert (=> b!281438 m!295343))

(assert (=> b!281434 m!295325))

(assert (=> b!281434 m!295325))

(declare-fun m!295345 () Bool)

(assert (=> b!281434 m!295345))

(declare-fun m!295347 () Bool)

(assert (=> start!27206 m!295347))

(declare-fun m!295349 () Bool)

(assert (=> start!27206 m!295349))

(assert (=> b!281441 m!295323))

(check-sat (not b!281439) (not b!281436) (not b!281433) (not b!281437) (not b!281434) (not b!281435) (not start!27206) (not b!281438))
(check-sat)
