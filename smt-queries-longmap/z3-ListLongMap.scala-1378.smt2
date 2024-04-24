; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27120 () Bool)

(assert start!27120)

(declare-fun b!280493 () Bool)

(declare-fun e!178567 () Bool)

(declare-fun e!178568 () Bool)

(assert (=> b!280493 (= e!178567 e!178568)))

(declare-fun res!143538 () Bool)

(assert (=> b!280493 (=> (not res!143538) (not e!178568))))

(declare-datatypes ((SeekEntryResult!1733 0))(
  ( (MissingZero!1733 (index!9102 (_ BitVec 32))) (Found!1733 (index!9103 (_ BitVec 32))) (Intermediate!1733 (undefined!2545 Bool) (index!9104 (_ BitVec 32)) (x!27451 (_ BitVec 32))) (Undefined!1733) (MissingVacant!1733 (index!9105 (_ BitVec 32))) )
))
(declare-fun lt!138887 () SeekEntryResult!1733)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280493 (= res!143538 (or (= lt!138887 (MissingZero!1733 i!1267)) (= lt!138887 (MissingVacant!1733 i!1267))))))

(declare-datatypes ((array!13937 0))(
  ( (array!13938 (arr!6610 (Array (_ BitVec 32) (_ BitVec 64))) (size!6962 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13937)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13937 (_ BitVec 32)) SeekEntryResult!1733)

(assert (=> b!280493 (= lt!138887 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280494 () Bool)

(assert (=> b!280494 (= e!178568 (not true))))

(declare-datatypes ((List!4331 0))(
  ( (Nil!4328) (Cons!4327 (h!4997 (_ BitVec 64)) (t!9405 List!4331)) )
))
(declare-fun arrayNoDuplicates!0 (array!13937 (_ BitVec 32) List!4331) Bool)

(assert (=> b!280494 (arrayNoDuplicates!0 (array!13938 (store (arr!6610 a!3325) i!1267 k0!2581) (size!6962 a!3325)) #b00000000000000000000000000000000 Nil!4328)))

(declare-datatypes ((Unit!8796 0))(
  ( (Unit!8797) )
))
(declare-fun lt!138888 () Unit!8796)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13937 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4331) Unit!8796)

(assert (=> b!280494 (= lt!138888 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4328))))

(declare-fun b!280495 () Bool)

(declare-fun res!143544 () Bool)

(assert (=> b!280495 (=> (not res!143544) (not e!178568))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280495 (= res!143544 (validKeyInArray!0 (select (arr!6610 a!3325) startIndex!26)))))

(declare-fun b!280496 () Bool)

(declare-fun res!143539 () Bool)

(assert (=> b!280496 (=> (not res!143539) (not e!178568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13937 (_ BitVec 32)) Bool)

(assert (=> b!280496 (= res!143539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!143542 () Bool)

(assert (=> start!27120 (=> (not res!143542) (not e!178567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27120 (= res!143542 (validMask!0 mask!3868))))

(assert (=> start!27120 e!178567))

(declare-fun array_inv!4560 (array!13937) Bool)

(assert (=> start!27120 (array_inv!4560 a!3325)))

(assert (=> start!27120 true))

(declare-fun b!280497 () Bool)

(declare-fun res!143541 () Bool)

(assert (=> b!280497 (=> (not res!143541) (not e!178567))))

(declare-fun arrayContainsKey!0 (array!13937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280497 (= res!143541 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280498 () Bool)

(declare-fun res!143543 () Bool)

(assert (=> b!280498 (=> (not res!143543) (not e!178567))))

(assert (=> b!280498 (= res!143543 (validKeyInArray!0 k0!2581))))

(declare-fun b!280499 () Bool)

(declare-fun res!143536 () Bool)

(assert (=> b!280499 (=> (not res!143536) (not e!178567))))

(assert (=> b!280499 (= res!143536 (and (= (size!6962 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6962 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6962 a!3325))))))

(declare-fun b!280500 () Bool)

(declare-fun res!143537 () Bool)

(assert (=> b!280500 (=> (not res!143537) (not e!178568))))

(assert (=> b!280500 (= res!143537 (not (= startIndex!26 i!1267)))))

(declare-fun b!280501 () Bool)

(declare-fun res!143540 () Bool)

(assert (=> b!280501 (=> (not res!143540) (not e!178567))))

(assert (=> b!280501 (= res!143540 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4328))))

(assert (= (and start!27120 res!143542) b!280499))

(assert (= (and b!280499 res!143536) b!280498))

(assert (= (and b!280498 res!143543) b!280501))

(assert (= (and b!280501 res!143540) b!280497))

(assert (= (and b!280497 res!143541) b!280493))

(assert (= (and b!280493 res!143538) b!280496))

(assert (= (and b!280496 res!143539) b!280500))

(assert (= (and b!280500 res!143537) b!280495))

(assert (= (and b!280495 res!143544) b!280494))

(declare-fun m!295085 () Bool)

(assert (=> b!280497 m!295085))

(declare-fun m!295087 () Bool)

(assert (=> b!280496 m!295087))

(declare-fun m!295089 () Bool)

(assert (=> b!280501 m!295089))

(declare-fun m!295091 () Bool)

(assert (=> b!280493 m!295091))

(declare-fun m!295093 () Bool)

(assert (=> b!280495 m!295093))

(assert (=> b!280495 m!295093))

(declare-fun m!295095 () Bool)

(assert (=> b!280495 m!295095))

(declare-fun m!295097 () Bool)

(assert (=> b!280498 m!295097))

(declare-fun m!295099 () Bool)

(assert (=> b!280494 m!295099))

(declare-fun m!295101 () Bool)

(assert (=> b!280494 m!295101))

(declare-fun m!295103 () Bool)

(assert (=> b!280494 m!295103))

(declare-fun m!295105 () Bool)

(assert (=> start!27120 m!295105))

(declare-fun m!295107 () Bool)

(assert (=> start!27120 m!295107))

(check-sat (not b!280501) (not b!280494) (not b!280493) (not start!27120) (not b!280498) (not b!280497) (not b!280495) (not b!280496))
(check-sat)
