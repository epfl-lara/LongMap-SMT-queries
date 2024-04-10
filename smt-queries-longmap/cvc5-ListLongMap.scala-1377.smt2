; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27114 () Bool)

(assert start!27114)

(declare-fun b!280337 () Bool)

(declare-fun res!143414 () Bool)

(declare-fun e!178517 () Bool)

(assert (=> b!280337 (=> (not res!143414) (not e!178517))))

(declare-datatypes ((List!4416 0))(
  ( (Nil!4413) (Cons!4412 (h!5082 (_ BitVec 64)) (t!9498 List!4416)) )
))
(declare-fun noDuplicate!170 (List!4416) Bool)

(assert (=> b!280337 (= res!143414 (noDuplicate!170 Nil!4413))))

(declare-fun b!280338 () Bool)

(declare-fun res!143412 () Bool)

(assert (=> b!280338 (=> (not res!143412) (not e!178517))))

(declare-datatypes ((array!13932 0))(
  ( (array!13933 (arr!6608 (Array (_ BitVec 32) (_ BitVec 64))) (size!6960 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13932)

(assert (=> b!280338 (= res!143412 (and (bvslt (size!6960 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6960 a!3325))))))

(declare-fun b!280339 () Bool)

(declare-fun res!143413 () Bool)

(assert (=> b!280339 (=> (not res!143413) (not e!178517))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280339 (= res!143413 (not (= startIndex!26 i!1267)))))

(declare-fun b!280340 () Bool)

(declare-fun res!143411 () Bool)

(declare-fun e!178516 () Bool)

(assert (=> b!280340 (=> (not res!143411) (not e!178516))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280340 (= res!143411 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280341 () Bool)

(declare-fun res!143416 () Bool)

(assert (=> b!280341 (=> (not res!143416) (not e!178517))))

(declare-fun contains!1988 (List!4416 (_ BitVec 64)) Bool)

(assert (=> b!280341 (= res!143416 (not (contains!1988 Nil!4413 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280342 () Bool)

(assert (=> b!280342 (= e!178517 false)))

(declare-fun lt!138810 () Bool)

(assert (=> b!280342 (= lt!138810 (contains!1988 Nil!4413 k!2581))))

(declare-fun b!280343 () Bool)

(assert (=> b!280343 (= e!178516 e!178517)))

(declare-fun res!143415 () Bool)

(assert (=> b!280343 (=> (not res!143415) (not e!178517))))

(declare-datatypes ((SeekEntryResult!1766 0))(
  ( (MissingZero!1766 (index!9234 (_ BitVec 32))) (Found!1766 (index!9235 (_ BitVec 32))) (Intermediate!1766 (undefined!2578 Bool) (index!9236 (_ BitVec 32)) (x!27476 (_ BitVec 32))) (Undefined!1766) (MissingVacant!1766 (index!9237 (_ BitVec 32))) )
))
(declare-fun lt!138811 () SeekEntryResult!1766)

(assert (=> b!280343 (= res!143415 (or (= lt!138811 (MissingZero!1766 i!1267)) (= lt!138811 (MissingVacant!1766 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13932 (_ BitVec 32)) SeekEntryResult!1766)

(assert (=> b!280343 (= lt!138811 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280344 () Bool)

(declare-fun res!143418 () Bool)

(assert (=> b!280344 (=> (not res!143418) (not e!178517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13932 (_ BitVec 32)) Bool)

(assert (=> b!280344 (= res!143418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280345 () Bool)

(declare-fun res!143407 () Bool)

(assert (=> b!280345 (=> (not res!143407) (not e!178516))))

(assert (=> b!280345 (= res!143407 (and (= (size!6960 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6960 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6960 a!3325))))))

(declare-fun b!280346 () Bool)

(declare-fun res!143409 () Bool)

(assert (=> b!280346 (=> (not res!143409) (not e!178517))))

(assert (=> b!280346 (= res!143409 (not (contains!1988 Nil!4413 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!280347 () Bool)

(declare-fun res!143417 () Bool)

(assert (=> b!280347 (=> (not res!143417) (not e!178517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280347 (= res!143417 (validKeyInArray!0 (select (arr!6608 a!3325) startIndex!26)))))

(declare-fun res!143408 () Bool)

(assert (=> start!27114 (=> (not res!143408) (not e!178516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27114 (= res!143408 (validMask!0 mask!3868))))

(assert (=> start!27114 e!178516))

(declare-fun array_inv!4571 (array!13932) Bool)

(assert (=> start!27114 (array_inv!4571 a!3325)))

(assert (=> start!27114 true))

(declare-fun b!280348 () Bool)

(declare-fun res!143410 () Bool)

(assert (=> b!280348 (=> (not res!143410) (not e!178516))))

(assert (=> b!280348 (= res!143410 (validKeyInArray!0 k!2581))))

(declare-fun b!280349 () Bool)

(declare-fun res!143406 () Bool)

(assert (=> b!280349 (=> (not res!143406) (not e!178516))))

(declare-fun arrayNoDuplicates!0 (array!13932 (_ BitVec 32) List!4416) Bool)

(assert (=> b!280349 (= res!143406 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4413))))

(assert (= (and start!27114 res!143408) b!280345))

(assert (= (and b!280345 res!143407) b!280348))

(assert (= (and b!280348 res!143410) b!280349))

(assert (= (and b!280349 res!143406) b!280340))

(assert (= (and b!280340 res!143411) b!280343))

(assert (= (and b!280343 res!143415) b!280344))

(assert (= (and b!280344 res!143418) b!280339))

(assert (= (and b!280339 res!143413) b!280347))

(assert (= (and b!280347 res!143417) b!280338))

(assert (= (and b!280338 res!143412) b!280337))

(assert (= (and b!280337 res!143414) b!280346))

(assert (= (and b!280346 res!143409) b!280341))

(assert (= (and b!280341 res!143416) b!280342))

(declare-fun m!294801 () Bool)

(assert (=> b!280343 m!294801))

(declare-fun m!294803 () Bool)

(assert (=> b!280337 m!294803))

(declare-fun m!294805 () Bool)

(assert (=> b!280349 m!294805))

(declare-fun m!294807 () Bool)

(assert (=> start!27114 m!294807))

(declare-fun m!294809 () Bool)

(assert (=> start!27114 m!294809))

(declare-fun m!294811 () Bool)

(assert (=> b!280342 m!294811))

(declare-fun m!294813 () Bool)

(assert (=> b!280346 m!294813))

(declare-fun m!294815 () Bool)

(assert (=> b!280344 m!294815))

(declare-fun m!294817 () Bool)

(assert (=> b!280348 m!294817))

(declare-fun m!294819 () Bool)

(assert (=> b!280340 m!294819))

(declare-fun m!294821 () Bool)

(assert (=> b!280347 m!294821))

(assert (=> b!280347 m!294821))

(declare-fun m!294823 () Bool)

(assert (=> b!280347 m!294823))

(declare-fun m!294825 () Bool)

(assert (=> b!280341 m!294825))

(push 1)

