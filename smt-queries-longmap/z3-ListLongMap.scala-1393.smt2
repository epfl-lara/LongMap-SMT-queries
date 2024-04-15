; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27212 () Bool)

(assert start!27212)

(declare-fun b!281514 () Bool)

(declare-fun res!144641 () Bool)

(declare-fun e!178868 () Bool)

(assert (=> b!281514 (=> (not res!144641) (not e!178868))))

(declare-datatypes ((array!14019 0))(
  ( (array!14020 (arr!6651 (Array (_ BitVec 32) (_ BitVec 64))) (size!7004 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14019)

(declare-datatypes ((List!4432 0))(
  ( (Nil!4429) (Cons!4428 (h!5098 (_ BitVec 64)) (t!9505 List!4432)) )
))
(declare-fun arrayNoDuplicates!0 (array!14019 (_ BitVec 32) List!4432) Bool)

(assert (=> b!281514 (= res!144641 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4429))))

(declare-fun b!281515 () Bool)

(declare-fun res!144643 () Bool)

(assert (=> b!281515 (=> (not res!144643) (not e!178868))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281515 (= res!144643 (and (= (size!7004 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7004 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7004 a!3325))))))

(declare-fun b!281516 () Bool)

(declare-fun res!144639 () Bool)

(declare-fun e!178867 () Bool)

(assert (=> b!281516 (=> (not res!144639) (not e!178867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281516 (= res!144639 (validKeyInArray!0 (select (arr!6651 a!3325) startIndex!26)))))

(declare-fun b!281517 () Bool)

(declare-fun e!178869 () Bool)

(assert (=> b!281517 (= e!178868 e!178869)))

(declare-fun res!144638 () Bool)

(assert (=> b!281517 (=> (not res!144638) (not e!178869))))

(declare-datatypes ((SeekEntryResult!1808 0))(
  ( (MissingZero!1808 (index!9402 (_ BitVec 32))) (Found!1808 (index!9403 (_ BitVec 32))) (Intermediate!1808 (undefined!2620 Bool) (index!9404 (_ BitVec 32)) (x!27645 (_ BitVec 32))) (Undefined!1808) (MissingVacant!1808 (index!9405 (_ BitVec 32))) )
))
(declare-fun lt!138958 () SeekEntryResult!1808)

(assert (=> b!281517 (= res!144638 (or (= lt!138958 (MissingZero!1808 i!1267)) (= lt!138958 (MissingVacant!1808 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14019 (_ BitVec 32)) SeekEntryResult!1808)

(assert (=> b!281517 (= lt!138958 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281518 () Bool)

(declare-fun res!144640 () Bool)

(assert (=> b!281518 (=> (not res!144640) (not e!178869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14019 (_ BitVec 32)) Bool)

(assert (=> b!281518 (= res!144640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!144637 () Bool)

(assert (=> start!27212 (=> (not res!144637) (not e!178868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27212 (= res!144637 (validMask!0 mask!3868))))

(assert (=> start!27212 e!178868))

(declare-fun array_inv!4623 (array!14019) Bool)

(assert (=> start!27212 (array_inv!4623 a!3325)))

(assert (=> start!27212 true))

(declare-fun b!281519 () Bool)

(declare-fun res!144636 () Bool)

(assert (=> b!281519 (=> (not res!144636) (not e!178868))))

(declare-fun arrayContainsKey!0 (array!14019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281519 (= res!144636 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281520 () Bool)

(assert (=> b!281520 (= e!178869 e!178867)))

(declare-fun res!144642 () Bool)

(assert (=> b!281520 (=> (not res!144642) (not e!178867))))

(assert (=> b!281520 (= res!144642 (not (= startIndex!26 i!1267)))))

(declare-fun lt!138957 () array!14019)

(assert (=> b!281520 (= lt!138957 (array!14020 (store (arr!6651 a!3325) i!1267 k0!2581) (size!7004 a!3325)))))

(declare-fun b!281521 () Bool)

(assert (=> b!281521 (= e!178867 (not (bvsle #b00000000000000000000000000000000 (size!7004 a!3325))))))

(assert (=> b!281521 (= (seekEntryOrOpen!0 (select (arr!6651 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6651 a!3325) i!1267 k0!2581) startIndex!26) lt!138957 mask!3868))))

(declare-datatypes ((Unit!8862 0))(
  ( (Unit!8863) )
))
(declare-fun lt!138959 () Unit!8862)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8862)

(assert (=> b!281521 (= lt!138959 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281521 (arrayNoDuplicates!0 lt!138957 #b00000000000000000000000000000000 Nil!4429)))

(declare-fun lt!138960 () Unit!8862)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14019 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4432) Unit!8862)

(assert (=> b!281521 (= lt!138960 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4429))))

(declare-fun b!281522 () Bool)

(declare-fun res!144635 () Bool)

(assert (=> b!281522 (=> (not res!144635) (not e!178868))))

(assert (=> b!281522 (= res!144635 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27212 res!144637) b!281515))

(assert (= (and b!281515 res!144643) b!281522))

(assert (= (and b!281522 res!144635) b!281514))

(assert (= (and b!281514 res!144641) b!281519))

(assert (= (and b!281519 res!144636) b!281517))

(assert (= (and b!281517 res!144638) b!281518))

(assert (= (and b!281518 res!144640) b!281520))

(assert (= (and b!281520 res!144642) b!281516))

(assert (= (and b!281516 res!144639) b!281521))

(declare-fun m!295415 () Bool)

(assert (=> b!281519 m!295415))

(declare-fun m!295417 () Bool)

(assert (=> b!281521 m!295417))

(declare-fun m!295419 () Bool)

(assert (=> b!281521 m!295419))

(declare-fun m!295421 () Bool)

(assert (=> b!281521 m!295421))

(declare-fun m!295423 () Bool)

(assert (=> b!281521 m!295423))

(declare-fun m!295425 () Bool)

(assert (=> b!281521 m!295425))

(assert (=> b!281521 m!295421))

(declare-fun m!295427 () Bool)

(assert (=> b!281521 m!295427))

(declare-fun m!295429 () Bool)

(assert (=> b!281521 m!295429))

(assert (=> b!281521 m!295417))

(declare-fun m!295431 () Bool)

(assert (=> b!281521 m!295431))

(declare-fun m!295433 () Bool)

(assert (=> b!281518 m!295433))

(assert (=> b!281516 m!295421))

(assert (=> b!281516 m!295421))

(declare-fun m!295435 () Bool)

(assert (=> b!281516 m!295435))

(assert (=> b!281520 m!295429))

(declare-fun m!295437 () Bool)

(assert (=> start!27212 m!295437))

(declare-fun m!295439 () Bool)

(assert (=> start!27212 m!295439))

(declare-fun m!295441 () Bool)

(assert (=> b!281522 m!295441))

(declare-fun m!295443 () Bool)

(assert (=> b!281517 m!295443))

(declare-fun m!295445 () Bool)

(assert (=> b!281514 m!295445))

(check-sat (not b!281517) (not b!281519) (not b!281518) (not b!281514) (not b!281516) (not start!27212) (not b!281522) (not b!281521))
(check-sat)
