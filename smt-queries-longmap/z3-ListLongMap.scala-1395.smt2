; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27224 () Bool)

(assert start!27224)

(declare-fun res!144798 () Bool)

(declare-fun e!178940 () Bool)

(assert (=> start!27224 (=> (not res!144798) (not e!178940))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27224 (= res!144798 (validMask!0 mask!3868))))

(assert (=> start!27224 e!178940))

(declare-datatypes ((array!14031 0))(
  ( (array!14032 (arr!6657 (Array (_ BitVec 32) (_ BitVec 64))) (size!7010 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14031)

(declare-fun array_inv!4629 (array!14031) Bool)

(assert (=> start!27224 (array_inv!4629 a!3325)))

(assert (=> start!27224 true))

(declare-fun b!281676 () Bool)

(declare-fun e!178941 () Bool)

(assert (=> b!281676 (= e!178940 e!178941)))

(declare-fun res!144804 () Bool)

(assert (=> b!281676 (=> (not res!144804) (not e!178941))))

(declare-datatypes ((SeekEntryResult!1814 0))(
  ( (MissingZero!1814 (index!9426 (_ BitVec 32))) (Found!1814 (index!9427 (_ BitVec 32))) (Intermediate!1814 (undefined!2626 Bool) (index!9428 (_ BitVec 32)) (x!27667 (_ BitVec 32))) (Undefined!1814) (MissingVacant!1814 (index!9429 (_ BitVec 32))) )
))
(declare-fun lt!139032 () SeekEntryResult!1814)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281676 (= res!144804 (or (= lt!139032 (MissingZero!1814 i!1267)) (= lt!139032 (MissingVacant!1814 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14031 (_ BitVec 32)) SeekEntryResult!1814)

(assert (=> b!281676 (= lt!139032 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281677 () Bool)

(declare-fun res!144803 () Bool)

(declare-fun e!178938 () Bool)

(assert (=> b!281677 (=> (not res!144803) (not e!178938))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281677 (= res!144803 (validKeyInArray!0 (select (arr!6657 a!3325) startIndex!26)))))

(declare-fun b!281678 () Bool)

(declare-fun res!144805 () Bool)

(assert (=> b!281678 (=> (not res!144805) (not e!178940))))

(declare-datatypes ((List!4438 0))(
  ( (Nil!4435) (Cons!4434 (h!5104 (_ BitVec 64)) (t!9511 List!4438)) )
))
(declare-fun arrayNoDuplicates!0 (array!14031 (_ BitVec 32) List!4438) Bool)

(assert (=> b!281678 (= res!144805 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4435))))

(declare-fun b!281679 () Bool)

(declare-fun res!144802 () Bool)

(assert (=> b!281679 (=> (not res!144802) (not e!178940))))

(assert (=> b!281679 (= res!144802 (validKeyInArray!0 k0!2581))))

(declare-fun b!281680 () Bool)

(declare-fun res!144800 () Bool)

(assert (=> b!281680 (=> (not res!144800) (not e!178940))))

(declare-fun arrayContainsKey!0 (array!14031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281680 (= res!144800 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281681 () Bool)

(assert (=> b!281681 (= e!178938 (not true))))

(declare-fun lt!139029 () array!14031)

(assert (=> b!281681 (= (seekEntryOrOpen!0 (select (arr!6657 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6657 a!3325) i!1267 k0!2581) startIndex!26) lt!139029 mask!3868))))

(declare-datatypes ((Unit!8874 0))(
  ( (Unit!8875) )
))
(declare-fun lt!139031 () Unit!8874)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14031 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8874)

(assert (=> b!281681 (= lt!139031 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281681 (arrayNoDuplicates!0 lt!139029 #b00000000000000000000000000000000 Nil!4435)))

(declare-fun lt!139030 () Unit!8874)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14031 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4438) Unit!8874)

(assert (=> b!281681 (= lt!139030 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4435))))

(declare-fun b!281682 () Bool)

(declare-fun res!144797 () Bool)

(assert (=> b!281682 (=> (not res!144797) (not e!178940))))

(assert (=> b!281682 (= res!144797 (and (= (size!7010 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7010 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7010 a!3325))))))

(declare-fun b!281683 () Bool)

(assert (=> b!281683 (= e!178941 e!178938)))

(declare-fun res!144801 () Bool)

(assert (=> b!281683 (=> (not res!144801) (not e!178938))))

(assert (=> b!281683 (= res!144801 (not (= startIndex!26 i!1267)))))

(assert (=> b!281683 (= lt!139029 (array!14032 (store (arr!6657 a!3325) i!1267 k0!2581) (size!7010 a!3325)))))

(declare-fun b!281684 () Bool)

(declare-fun res!144799 () Bool)

(assert (=> b!281684 (=> (not res!144799) (not e!178941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14031 (_ BitVec 32)) Bool)

(assert (=> b!281684 (= res!144799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27224 res!144798) b!281682))

(assert (= (and b!281682 res!144797) b!281679))

(assert (= (and b!281679 res!144802) b!281678))

(assert (= (and b!281678 res!144805) b!281680))

(assert (= (and b!281680 res!144800) b!281676))

(assert (= (and b!281676 res!144804) b!281684))

(assert (= (and b!281684 res!144799) b!281683))

(assert (= (and b!281683 res!144801) b!281677))

(assert (= (and b!281677 res!144803) b!281681))

(declare-fun m!295607 () Bool)

(assert (=> b!281683 m!295607))

(declare-fun m!295609 () Bool)

(assert (=> b!281681 m!295609))

(assert (=> b!281681 m!295607))

(declare-fun m!295611 () Bool)

(assert (=> b!281681 m!295611))

(declare-fun m!295613 () Bool)

(assert (=> b!281681 m!295613))

(assert (=> b!281681 m!295609))

(declare-fun m!295615 () Bool)

(assert (=> b!281681 m!295615))

(assert (=> b!281681 m!295611))

(declare-fun m!295617 () Bool)

(assert (=> b!281681 m!295617))

(declare-fun m!295619 () Bool)

(assert (=> b!281681 m!295619))

(declare-fun m!295621 () Bool)

(assert (=> b!281681 m!295621))

(declare-fun m!295623 () Bool)

(assert (=> b!281678 m!295623))

(declare-fun m!295625 () Bool)

(assert (=> start!27224 m!295625))

(declare-fun m!295627 () Bool)

(assert (=> start!27224 m!295627))

(declare-fun m!295629 () Bool)

(assert (=> b!281679 m!295629))

(assert (=> b!281677 m!295611))

(assert (=> b!281677 m!295611))

(declare-fun m!295631 () Bool)

(assert (=> b!281677 m!295631))

(declare-fun m!295633 () Bool)

(assert (=> b!281680 m!295633))

(declare-fun m!295635 () Bool)

(assert (=> b!281676 m!295635))

(declare-fun m!295637 () Bool)

(assert (=> b!281684 m!295637))

(check-sat (not b!281679) (not b!281676) (not b!281684) (not start!27224) (not b!281677) (not b!281681) (not b!281678) (not b!281680))
(check-sat)
