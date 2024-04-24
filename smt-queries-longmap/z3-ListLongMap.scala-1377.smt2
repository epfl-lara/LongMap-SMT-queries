; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27114 () Bool)

(assert start!27114)

(declare-fun b!280384 () Bool)

(declare-fun res!143436 () Bool)

(declare-fun e!178540 () Bool)

(assert (=> b!280384 (=> (not res!143436) (not e!178540))))

(declare-datatypes ((List!4328 0))(
  ( (Nil!4325) (Cons!4324 (h!4994 (_ BitVec 64)) (t!9402 List!4328)) )
))
(declare-fun contains!1962 (List!4328 (_ BitVec 64)) Bool)

(assert (=> b!280384 (= res!143436 (not (contains!1962 Nil!4325 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!143429 () Bool)

(declare-fun e!178539 () Bool)

(assert (=> start!27114 (=> (not res!143429) (not e!178539))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27114 (= res!143429 (validMask!0 mask!3868))))

(assert (=> start!27114 e!178539))

(declare-datatypes ((array!13931 0))(
  ( (array!13932 (arr!6607 (Array (_ BitVec 32) (_ BitVec 64))) (size!6959 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13931)

(declare-fun array_inv!4557 (array!13931) Bool)

(assert (=> start!27114 (array_inv!4557 a!3325)))

(assert (=> start!27114 true))

(declare-fun b!280385 () Bool)

(declare-fun res!143427 () Bool)

(assert (=> b!280385 (=> (not res!143427) (not e!178540))))

(assert (=> b!280385 (= res!143427 (not (contains!1962 Nil!4325 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280386 () Bool)

(declare-fun res!143437 () Bool)

(assert (=> b!280386 (=> (not res!143437) (not e!178540))))

(declare-fun noDuplicate!173 (List!4328) Bool)

(assert (=> b!280386 (= res!143437 (noDuplicate!173 Nil!4325))))

(declare-fun b!280387 () Bool)

(declare-fun res!143432 () Bool)

(assert (=> b!280387 (=> (not res!143432) (not e!178539))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280387 (= res!143432 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280388 () Bool)

(declare-fun res!143431 () Bool)

(assert (=> b!280388 (=> (not res!143431) (not e!178540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13931 (_ BitVec 32)) Bool)

(assert (=> b!280388 (= res!143431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280389 () Bool)

(declare-fun res!143434 () Bool)

(assert (=> b!280389 (=> (not res!143434) (not e!178540))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280389 (= res!143434 (validKeyInArray!0 (select (arr!6607 a!3325) startIndex!26)))))

(declare-fun b!280390 () Bool)

(assert (=> b!280390 (= e!178540 false)))

(declare-fun lt!138870 () Bool)

(assert (=> b!280390 (= lt!138870 (contains!1962 Nil!4325 k0!2581))))

(declare-fun b!280391 () Bool)

(declare-fun res!143439 () Bool)

(assert (=> b!280391 (=> (not res!143439) (not e!178540))))

(assert (=> b!280391 (= res!143439 (and (bvslt (size!6959 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6959 a!3325))))))

(declare-fun b!280392 () Bool)

(declare-fun res!143438 () Bool)

(assert (=> b!280392 (=> (not res!143438) (not e!178539))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280392 (= res!143438 (and (= (size!6959 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6959 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6959 a!3325))))))

(declare-fun b!280393 () Bool)

(declare-fun res!143433 () Bool)

(assert (=> b!280393 (=> (not res!143433) (not e!178539))))

(assert (=> b!280393 (= res!143433 (validKeyInArray!0 k0!2581))))

(declare-fun b!280394 () Bool)

(assert (=> b!280394 (= e!178539 e!178540)))

(declare-fun res!143428 () Bool)

(assert (=> b!280394 (=> (not res!143428) (not e!178540))))

(declare-datatypes ((SeekEntryResult!1730 0))(
  ( (MissingZero!1730 (index!9090 (_ BitVec 32))) (Found!1730 (index!9091 (_ BitVec 32))) (Intermediate!1730 (undefined!2542 Bool) (index!9092 (_ BitVec 32)) (x!27440 (_ BitVec 32))) (Undefined!1730) (MissingVacant!1730 (index!9093 (_ BitVec 32))) )
))
(declare-fun lt!138869 () SeekEntryResult!1730)

(assert (=> b!280394 (= res!143428 (or (= lt!138869 (MissingZero!1730 i!1267)) (= lt!138869 (MissingVacant!1730 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13931 (_ BitVec 32)) SeekEntryResult!1730)

(assert (=> b!280394 (= lt!138869 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280395 () Bool)

(declare-fun res!143435 () Bool)

(assert (=> b!280395 (=> (not res!143435) (not e!178540))))

(assert (=> b!280395 (= res!143435 (not (= startIndex!26 i!1267)))))

(declare-fun b!280396 () Bool)

(declare-fun res!143430 () Bool)

(assert (=> b!280396 (=> (not res!143430) (not e!178539))))

(declare-fun arrayNoDuplicates!0 (array!13931 (_ BitVec 32) List!4328) Bool)

(assert (=> b!280396 (= res!143430 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4325))))

(assert (= (and start!27114 res!143429) b!280392))

(assert (= (and b!280392 res!143438) b!280393))

(assert (= (and b!280393 res!143433) b!280396))

(assert (= (and b!280396 res!143430) b!280387))

(assert (= (and b!280387 res!143432) b!280394))

(assert (= (and b!280394 res!143428) b!280388))

(assert (= (and b!280388 res!143431) b!280395))

(assert (= (and b!280395 res!143435) b!280389))

(assert (= (and b!280389 res!143434) b!280391))

(assert (= (and b!280391 res!143439) b!280386))

(assert (= (and b!280386 res!143437) b!280384))

(assert (= (and b!280384 res!143436) b!280385))

(assert (= (and b!280385 res!143427) b!280390))

(declare-fun m!295007 () Bool)

(assert (=> start!27114 m!295007))

(declare-fun m!295009 () Bool)

(assert (=> start!27114 m!295009))

(declare-fun m!295011 () Bool)

(assert (=> b!280385 m!295011))

(declare-fun m!295013 () Bool)

(assert (=> b!280390 m!295013))

(declare-fun m!295015 () Bool)

(assert (=> b!280393 m!295015))

(declare-fun m!295017 () Bool)

(assert (=> b!280384 m!295017))

(declare-fun m!295019 () Bool)

(assert (=> b!280388 m!295019))

(declare-fun m!295021 () Bool)

(assert (=> b!280389 m!295021))

(assert (=> b!280389 m!295021))

(declare-fun m!295023 () Bool)

(assert (=> b!280389 m!295023))

(declare-fun m!295025 () Bool)

(assert (=> b!280387 m!295025))

(declare-fun m!295027 () Bool)

(assert (=> b!280396 m!295027))

(declare-fun m!295029 () Bool)

(assert (=> b!280394 m!295029))

(declare-fun m!295031 () Bool)

(assert (=> b!280386 m!295031))

(check-sat (not b!280386) (not b!280384) (not b!280389) (not b!280390) (not b!280385) (not b!280393) (not b!280388) (not start!27114) (not b!280387) (not b!280394) (not b!280396))
(check-sat)
