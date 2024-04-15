; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27140 () Bool)

(assert start!27140)

(declare-fun b!280542 () Bool)

(declare-fun res!143668 () Bool)

(declare-fun e!178524 () Bool)

(assert (=> b!280542 (=> (not res!143668) (not e!178524))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13947 0))(
  ( (array!13948 (arr!6615 (Array (_ BitVec 32) (_ BitVec 64))) (size!6968 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13947)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!280542 (= res!143668 (and (= (size!6968 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6968 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6968 a!3325))))))

(declare-fun b!280543 () Bool)

(declare-fun res!143669 () Bool)

(declare-fun e!178522 () Bool)

(assert (=> b!280543 (=> (not res!143669) (not e!178522))))

(assert (=> b!280543 (= res!143669 (not (= startIndex!26 i!1267)))))

(declare-fun b!280544 () Bool)

(declare-fun res!143663 () Bool)

(assert (=> b!280544 (=> (not res!143663) (not e!178524))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280544 (= res!143663 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280545 () Bool)

(declare-fun res!143666 () Bool)

(assert (=> b!280545 (=> (not res!143666) (not e!178522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280545 (= res!143666 (validKeyInArray!0 (select (arr!6615 a!3325) startIndex!26)))))

(declare-fun b!280547 () Bool)

(declare-fun res!143664 () Bool)

(assert (=> b!280547 (=> (not res!143664) (not e!178524))))

(assert (=> b!280547 (= res!143664 (validKeyInArray!0 k0!2581))))

(declare-fun b!280548 () Bool)

(declare-fun res!143665 () Bool)

(assert (=> b!280548 (=> (not res!143665) (not e!178522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13947 (_ BitVec 32)) Bool)

(assert (=> b!280548 (= res!143665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280549 () Bool)

(assert (=> b!280549 (= e!178522 (not true))))

(declare-datatypes ((List!4396 0))(
  ( (Nil!4393) (Cons!4392 (h!5062 (_ BitVec 64)) (t!9469 List!4396)) )
))
(declare-fun arrayNoDuplicates!0 (array!13947 (_ BitVec 32) List!4396) Bool)

(assert (=> b!280549 (arrayNoDuplicates!0 (array!13948 (store (arr!6615 a!3325) i!1267 k0!2581) (size!6968 a!3325)) #b00000000000000000000000000000000 Nil!4393)))

(declare-datatypes ((Unit!8790 0))(
  ( (Unit!8791) )
))
(declare-fun lt!138701 () Unit!8790)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13947 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4396) Unit!8790)

(assert (=> b!280549 (= lt!138701 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4393))))

(declare-fun b!280550 () Bool)

(declare-fun res!143671 () Bool)

(assert (=> b!280550 (=> (not res!143671) (not e!178524))))

(assert (=> b!280550 (= res!143671 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4393))))

(declare-fun b!280546 () Bool)

(assert (=> b!280546 (= e!178524 e!178522)))

(declare-fun res!143667 () Bool)

(assert (=> b!280546 (=> (not res!143667) (not e!178522))))

(declare-datatypes ((SeekEntryResult!1772 0))(
  ( (MissingZero!1772 (index!9258 (_ BitVec 32))) (Found!1772 (index!9259 (_ BitVec 32))) (Intermediate!1772 (undefined!2584 Bool) (index!9260 (_ BitVec 32)) (x!27513 (_ BitVec 32))) (Undefined!1772) (MissingVacant!1772 (index!9261 (_ BitVec 32))) )
))
(declare-fun lt!138702 () SeekEntryResult!1772)

(assert (=> b!280546 (= res!143667 (or (= lt!138702 (MissingZero!1772 i!1267)) (= lt!138702 (MissingVacant!1772 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13947 (_ BitVec 32)) SeekEntryResult!1772)

(assert (=> b!280546 (= lt!138702 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!143670 () Bool)

(assert (=> start!27140 (=> (not res!143670) (not e!178524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27140 (= res!143670 (validMask!0 mask!3868))))

(assert (=> start!27140 e!178524))

(declare-fun array_inv!4587 (array!13947) Bool)

(assert (=> start!27140 (array_inv!4587 a!3325)))

(assert (=> start!27140 true))

(assert (= (and start!27140 res!143670) b!280542))

(assert (= (and b!280542 res!143668) b!280547))

(assert (= (and b!280547 res!143664) b!280550))

(assert (= (and b!280550 res!143671) b!280544))

(assert (= (and b!280544 res!143663) b!280546))

(assert (= (and b!280546 res!143667) b!280548))

(assert (= (and b!280548 res!143665) b!280543))

(assert (= (and b!280543 res!143669) b!280545))

(assert (= (and b!280545 res!143666) b!280549))

(declare-fun m!294503 () Bool)

(assert (=> b!280544 m!294503))

(declare-fun m!294505 () Bool)

(assert (=> b!280547 m!294505))

(declare-fun m!294507 () Bool)

(assert (=> b!280549 m!294507))

(declare-fun m!294509 () Bool)

(assert (=> b!280549 m!294509))

(declare-fun m!294511 () Bool)

(assert (=> b!280549 m!294511))

(declare-fun m!294513 () Bool)

(assert (=> b!280546 m!294513))

(declare-fun m!294515 () Bool)

(assert (=> b!280548 m!294515))

(declare-fun m!294517 () Bool)

(assert (=> start!27140 m!294517))

(declare-fun m!294519 () Bool)

(assert (=> start!27140 m!294519))

(declare-fun m!294521 () Bool)

(assert (=> b!280545 m!294521))

(assert (=> b!280545 m!294521))

(declare-fun m!294523 () Bool)

(assert (=> b!280545 m!294523))

(declare-fun m!294525 () Bool)

(assert (=> b!280550 m!294525))

(check-sat (not start!27140) (not b!280547) (not b!280545) (not b!280548) (not b!280546) (not b!280549) (not b!280550) (not b!280544))
(check-sat)
