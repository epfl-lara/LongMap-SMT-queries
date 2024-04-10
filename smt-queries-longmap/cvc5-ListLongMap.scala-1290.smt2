; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26298 () Bool)

(assert start!26298)

(declare-fun res!136439 () Bool)

(declare-fun e!174857 () Bool)

(assert (=> start!26298 (=> (not res!136439) (not e!174857))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26298 (= res!136439 (validMask!0 mask!3868))))

(assert (=> start!26298 e!174857))

(declare-datatypes ((array!13395 0))(
  ( (array!13396 (arr!6347 (Array (_ BitVec 32) (_ BitVec 64))) (size!6699 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13395)

(declare-fun array_inv!4310 (array!13395) Bool)

(assert (=> start!26298 (array_inv!4310 a!3325)))

(assert (=> start!26298 true))

(declare-fun b!272442 () Bool)

(declare-fun res!136434 () Bool)

(assert (=> b!272442 (=> (not res!136434) (not e!174857))))

(declare-datatypes ((List!4155 0))(
  ( (Nil!4152) (Cons!4151 (h!4818 (_ BitVec 64)) (t!9237 List!4155)) )
))
(declare-fun arrayNoDuplicates!0 (array!13395 (_ BitVec 32) List!4155) Bool)

(assert (=> b!272442 (= res!136434 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4152))))

(declare-fun b!272443 () Bool)

(declare-fun res!136440 () Bool)

(declare-fun e!174856 () Bool)

(assert (=> b!272443 (=> (not res!136440) (not e!174856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13395 (_ BitVec 32)) Bool)

(assert (=> b!272443 (= res!136440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272444 () Bool)

(declare-fun res!136435 () Bool)

(assert (=> b!272444 (=> (not res!136435) (not e!174856))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272444 (= res!136435 (not (= startIndex!26 i!1267)))))

(declare-fun b!272445 () Bool)

(declare-fun res!136437 () Bool)

(assert (=> b!272445 (=> (not res!136437) (not e!174856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272445 (= res!136437 (validKeyInArray!0 (select (arr!6347 a!3325) startIndex!26)))))

(declare-fun b!272446 () Bool)

(declare-fun res!136433 () Bool)

(assert (=> b!272446 (=> (not res!136433) (not e!174857))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272446 (= res!136433 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272447 () Bool)

(assert (=> b!272447 (= e!174857 e!174856)))

(declare-fun res!136438 () Bool)

(assert (=> b!272447 (=> (not res!136438) (not e!174856))))

(declare-datatypes ((SeekEntryResult!1505 0))(
  ( (MissingZero!1505 (index!8190 (_ BitVec 32))) (Found!1505 (index!8191 (_ BitVec 32))) (Intermediate!1505 (undefined!2317 Bool) (index!8192 (_ BitVec 32)) (x!26510 (_ BitVec 32))) (Undefined!1505) (MissingVacant!1505 (index!8193 (_ BitVec 32))) )
))
(declare-fun lt!136002 () SeekEntryResult!1505)

(assert (=> b!272447 (= res!136438 (or (= lt!136002 (MissingZero!1505 i!1267)) (= lt!136002 (MissingVacant!1505 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13395 (_ BitVec 32)) SeekEntryResult!1505)

(assert (=> b!272447 (= lt!136002 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272448 () Bool)

(assert (=> b!272448 (= e!174856 (not true))))

(assert (=> b!272448 (arrayNoDuplicates!0 (array!13396 (store (arr!6347 a!3325) i!1267 k!2581) (size!6699 a!3325)) #b00000000000000000000000000000000 Nil!4152)))

(declare-datatypes ((Unit!8497 0))(
  ( (Unit!8498) )
))
(declare-fun lt!136003 () Unit!8497)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4155) Unit!8497)

(assert (=> b!272448 (= lt!136003 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4152))))

(declare-fun b!272449 () Bool)

(declare-fun res!136436 () Bool)

(assert (=> b!272449 (=> (not res!136436) (not e!174857))))

(assert (=> b!272449 (= res!136436 (validKeyInArray!0 k!2581))))

(declare-fun b!272450 () Bool)

(declare-fun res!136432 () Bool)

(assert (=> b!272450 (=> (not res!136432) (not e!174857))))

(assert (=> b!272450 (= res!136432 (and (= (size!6699 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6699 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6699 a!3325))))))

(assert (= (and start!26298 res!136439) b!272450))

(assert (= (and b!272450 res!136432) b!272449))

(assert (= (and b!272449 res!136436) b!272442))

(assert (= (and b!272442 res!136434) b!272446))

(assert (= (and b!272446 res!136433) b!272447))

(assert (= (and b!272447 res!136438) b!272443))

(assert (= (and b!272443 res!136440) b!272444))

(assert (= (and b!272444 res!136435) b!272445))

(assert (= (and b!272445 res!136437) b!272448))

(declare-fun m!287541 () Bool)

(assert (=> b!272448 m!287541))

(declare-fun m!287543 () Bool)

(assert (=> b!272448 m!287543))

(declare-fun m!287545 () Bool)

(assert (=> b!272448 m!287545))

(declare-fun m!287547 () Bool)

(assert (=> b!272443 m!287547))

(declare-fun m!287549 () Bool)

(assert (=> b!272445 m!287549))

(assert (=> b!272445 m!287549))

(declare-fun m!287551 () Bool)

(assert (=> b!272445 m!287551))

(declare-fun m!287553 () Bool)

(assert (=> b!272449 m!287553))

(declare-fun m!287555 () Bool)

(assert (=> b!272442 m!287555))

(declare-fun m!287557 () Bool)

(assert (=> start!26298 m!287557))

(declare-fun m!287559 () Bool)

(assert (=> start!26298 m!287559))

(declare-fun m!287561 () Bool)

(assert (=> b!272446 m!287561))

(declare-fun m!287563 () Bool)

(assert (=> b!272447 m!287563))

(push 1)

