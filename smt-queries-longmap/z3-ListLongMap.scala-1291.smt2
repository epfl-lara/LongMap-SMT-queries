; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26306 () Bool)

(assert start!26306)

(declare-fun res!136545 () Bool)

(declare-fun e!174893 () Bool)

(assert (=> start!26306 (=> (not res!136545) (not e!174893))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26306 (= res!136545 (validMask!0 mask!3868))))

(assert (=> start!26306 e!174893))

(declare-datatypes ((array!13403 0))(
  ( (array!13404 (arr!6351 (Array (_ BitVec 32) (_ BitVec 64))) (size!6703 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13403)

(declare-fun array_inv!4314 (array!13403) Bool)

(assert (=> start!26306 (array_inv!4314 a!3325)))

(assert (=> start!26306 true))

(declare-fun b!272550 () Bool)

(declare-fun res!136540 () Bool)

(declare-fun e!174892 () Bool)

(assert (=> b!272550 (=> (not res!136540) (not e!174892))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272550 (= res!136540 (validKeyInArray!0 (select (arr!6351 a!3325) startIndex!26)))))

(declare-fun b!272551 () Bool)

(declare-fun res!136546 () Bool)

(assert (=> b!272551 (=> (not res!136546) (not e!174892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13403 (_ BitVec 32)) Bool)

(assert (=> b!272551 (= res!136546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272552 () Bool)

(assert (=> b!272552 (= e!174893 e!174892)))

(declare-fun res!136543 () Bool)

(assert (=> b!272552 (=> (not res!136543) (not e!174892))))

(declare-datatypes ((SeekEntryResult!1509 0))(
  ( (MissingZero!1509 (index!8206 (_ BitVec 32))) (Found!1509 (index!8207 (_ BitVec 32))) (Intermediate!1509 (undefined!2321 Bool) (index!8208 (_ BitVec 32)) (x!26522 (_ BitVec 32))) (Undefined!1509) (MissingVacant!1509 (index!8209 (_ BitVec 32))) )
))
(declare-fun lt!136027 () SeekEntryResult!1509)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272552 (= res!136543 (or (= lt!136027 (MissingZero!1509 i!1267)) (= lt!136027 (MissingVacant!1509 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13403 (_ BitVec 32)) SeekEntryResult!1509)

(assert (=> b!272552 (= lt!136027 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272553 () Bool)

(declare-fun res!136542 () Bool)

(assert (=> b!272553 (=> (not res!136542) (not e!174893))))

(declare-datatypes ((List!4159 0))(
  ( (Nil!4156) (Cons!4155 (h!4822 (_ BitVec 64)) (t!9241 List!4159)) )
))
(declare-fun arrayNoDuplicates!0 (array!13403 (_ BitVec 32) List!4159) Bool)

(assert (=> b!272553 (= res!136542 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4156))))

(declare-fun b!272554 () Bool)

(declare-fun res!136544 () Bool)

(assert (=> b!272554 (=> (not res!136544) (not e!174893))))

(assert (=> b!272554 (= res!136544 (and (= (size!6703 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6703 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6703 a!3325))))))

(declare-fun b!272555 () Bool)

(declare-fun res!136547 () Bool)

(assert (=> b!272555 (=> (not res!136547) (not e!174893))))

(assert (=> b!272555 (= res!136547 (validKeyInArray!0 k0!2581))))

(declare-fun b!272556 () Bool)

(assert (=> b!272556 (= e!174892 (not true))))

(assert (=> b!272556 (arrayNoDuplicates!0 (array!13404 (store (arr!6351 a!3325) i!1267 k0!2581) (size!6703 a!3325)) #b00000000000000000000000000000000 Nil!4156)))

(declare-datatypes ((Unit!8505 0))(
  ( (Unit!8506) )
))
(declare-fun lt!136026 () Unit!8505)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4159) Unit!8505)

(assert (=> b!272556 (= lt!136026 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4156))))

(declare-fun b!272557 () Bool)

(declare-fun res!136548 () Bool)

(assert (=> b!272557 (=> (not res!136548) (not e!174892))))

(assert (=> b!272557 (= res!136548 (not (= startIndex!26 i!1267)))))

(declare-fun b!272558 () Bool)

(declare-fun res!136541 () Bool)

(assert (=> b!272558 (=> (not res!136541) (not e!174893))))

(declare-fun arrayContainsKey!0 (array!13403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272558 (= res!136541 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26306 res!136545) b!272554))

(assert (= (and b!272554 res!136544) b!272555))

(assert (= (and b!272555 res!136547) b!272553))

(assert (= (and b!272553 res!136542) b!272558))

(assert (= (and b!272558 res!136541) b!272552))

(assert (= (and b!272552 res!136543) b!272551))

(assert (= (and b!272551 res!136546) b!272557))

(assert (= (and b!272557 res!136548) b!272550))

(assert (= (and b!272550 res!136540) b!272556))

(declare-fun m!287637 () Bool)

(assert (=> b!272555 m!287637))

(declare-fun m!287639 () Bool)

(assert (=> start!26306 m!287639))

(declare-fun m!287641 () Bool)

(assert (=> start!26306 m!287641))

(declare-fun m!287643 () Bool)

(assert (=> b!272553 m!287643))

(declare-fun m!287645 () Bool)

(assert (=> b!272550 m!287645))

(assert (=> b!272550 m!287645))

(declare-fun m!287647 () Bool)

(assert (=> b!272550 m!287647))

(declare-fun m!287649 () Bool)

(assert (=> b!272556 m!287649))

(declare-fun m!287651 () Bool)

(assert (=> b!272556 m!287651))

(declare-fun m!287653 () Bool)

(assert (=> b!272556 m!287653))

(declare-fun m!287655 () Bool)

(assert (=> b!272551 m!287655))

(declare-fun m!287657 () Bool)

(assert (=> b!272558 m!287657))

(declare-fun m!287659 () Bool)

(assert (=> b!272552 m!287659))

(check-sat (not b!272551) (not b!272556) (not b!272558) (not start!26306) (not b!272550) (not b!272553) (not b!272555) (not b!272552))
(check-sat)
