; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27206 () Bool)

(assert start!27206)

(declare-fun b!281607 () Bool)

(declare-fun e!178945 () Bool)

(assert (=> b!281607 (= e!178945 (not true))))

(declare-datatypes ((array!14024 0))(
  ( (array!14025 (arr!6654 (Array (_ BitVec 32) (_ BitVec 64))) (size!7006 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14024)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139116 () array!14024)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1812 0))(
  ( (MissingZero!1812 (index!9418 (_ BitVec 32))) (Found!1812 (index!9419 (_ BitVec 32))) (Intermediate!1812 (undefined!2624 Bool) (index!9420 (_ BitVec 32)) (x!27642 (_ BitVec 32))) (Undefined!1812) (MissingVacant!1812 (index!9421 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14024 (_ BitVec 32)) SeekEntryResult!1812)

(assert (=> b!281607 (= (seekEntryOrOpen!0 (select (arr!6654 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6654 a!3325) i!1267 k0!2581) startIndex!26) lt!139116 mask!3868))))

(declare-datatypes ((Unit!8908 0))(
  ( (Unit!8909) )
))
(declare-fun lt!139115 () Unit!8908)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14024 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8908)

(assert (=> b!281607 (= lt!139115 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4462 0))(
  ( (Nil!4459) (Cons!4458 (h!5128 (_ BitVec 64)) (t!9544 List!4462)) )
))
(declare-fun arrayNoDuplicates!0 (array!14024 (_ BitVec 32) List!4462) Bool)

(assert (=> b!281607 (arrayNoDuplicates!0 lt!139116 #b00000000000000000000000000000000 Nil!4459)))

(declare-fun lt!139114 () Unit!8908)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14024 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4462) Unit!8908)

(assert (=> b!281607 (= lt!139114 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4459))))

(declare-fun b!281608 () Bool)

(declare-fun res!144676 () Bool)

(declare-fun e!178946 () Bool)

(assert (=> b!281608 (=> (not res!144676) (not e!178946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14024 (_ BitVec 32)) Bool)

(assert (=> b!281608 (= res!144676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281609 () Bool)

(assert (=> b!281609 (= e!178946 e!178945)))

(declare-fun res!144679 () Bool)

(assert (=> b!281609 (=> (not res!144679) (not e!178945))))

(assert (=> b!281609 (= res!144679 (not (= startIndex!26 i!1267)))))

(assert (=> b!281609 (= lt!139116 (array!14025 (store (arr!6654 a!3325) i!1267 k0!2581) (size!7006 a!3325)))))

(declare-fun b!281610 () Bool)

(declare-fun res!144683 () Bool)

(declare-fun e!178944 () Bool)

(assert (=> b!281610 (=> (not res!144683) (not e!178944))))

(assert (=> b!281610 (= res!144683 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4459))))

(declare-fun res!144681 () Bool)

(assert (=> start!27206 (=> (not res!144681) (not e!178944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27206 (= res!144681 (validMask!0 mask!3868))))

(assert (=> start!27206 e!178944))

(declare-fun array_inv!4617 (array!14024) Bool)

(assert (=> start!27206 (array_inv!4617 a!3325)))

(assert (=> start!27206 true))

(declare-fun b!281611 () Bool)

(assert (=> b!281611 (= e!178944 e!178946)))

(declare-fun res!144684 () Bool)

(assert (=> b!281611 (=> (not res!144684) (not e!178946))))

(declare-fun lt!139117 () SeekEntryResult!1812)

(assert (=> b!281611 (= res!144684 (or (= lt!139117 (MissingZero!1812 i!1267)) (= lt!139117 (MissingVacant!1812 i!1267))))))

(assert (=> b!281611 (= lt!139117 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281612 () Bool)

(declare-fun res!144677 () Bool)

(assert (=> b!281612 (=> (not res!144677) (not e!178944))))

(declare-fun arrayContainsKey!0 (array!14024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281612 (= res!144677 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281613 () Bool)

(declare-fun res!144680 () Bool)

(assert (=> b!281613 (=> (not res!144680) (not e!178944))))

(assert (=> b!281613 (= res!144680 (and (= (size!7006 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7006 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7006 a!3325))))))

(declare-fun b!281614 () Bool)

(declare-fun res!144678 () Bool)

(assert (=> b!281614 (=> (not res!144678) (not e!178944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281614 (= res!144678 (validKeyInArray!0 k0!2581))))

(declare-fun b!281615 () Bool)

(declare-fun res!144682 () Bool)

(assert (=> b!281615 (=> (not res!144682) (not e!178945))))

(assert (=> b!281615 (= res!144682 (validKeyInArray!0 (select (arr!6654 a!3325) startIndex!26)))))

(assert (= (and start!27206 res!144681) b!281613))

(assert (= (and b!281613 res!144680) b!281614))

(assert (= (and b!281614 res!144678) b!281610))

(assert (= (and b!281610 res!144683) b!281612))

(assert (= (and b!281612 res!144677) b!281611))

(assert (= (and b!281611 res!144684) b!281608))

(assert (= (and b!281608 res!144676) b!281609))

(assert (= (and b!281609 res!144679) b!281615))

(assert (= (and b!281615 res!144682) b!281607))

(declare-fun m!295943 () Bool)

(assert (=> b!281610 m!295943))

(declare-fun m!295945 () Bool)

(assert (=> b!281609 m!295945))

(declare-fun m!295947 () Bool)

(assert (=> b!281612 m!295947))

(declare-fun m!295949 () Bool)

(assert (=> b!281615 m!295949))

(assert (=> b!281615 m!295949))

(declare-fun m!295951 () Bool)

(assert (=> b!281615 m!295951))

(declare-fun m!295953 () Bool)

(assert (=> b!281607 m!295953))

(declare-fun m!295955 () Bool)

(assert (=> b!281607 m!295955))

(assert (=> b!281607 m!295945))

(declare-fun m!295957 () Bool)

(assert (=> b!281607 m!295957))

(declare-fun m!295959 () Bool)

(assert (=> b!281607 m!295959))

(assert (=> b!281607 m!295949))

(declare-fun m!295961 () Bool)

(assert (=> b!281607 m!295961))

(assert (=> b!281607 m!295949))

(assert (=> b!281607 m!295953))

(declare-fun m!295963 () Bool)

(assert (=> b!281607 m!295963))

(declare-fun m!295965 () Bool)

(assert (=> b!281614 m!295965))

(declare-fun m!295967 () Bool)

(assert (=> start!27206 m!295967))

(declare-fun m!295969 () Bool)

(assert (=> start!27206 m!295969))

(declare-fun m!295971 () Bool)

(assert (=> b!281608 m!295971))

(declare-fun m!295973 () Bool)

(assert (=> b!281611 m!295973))

(check-sat (not start!27206) (not b!281608) (not b!281612) (not b!281610) (not b!281611) (not b!281607) (not b!281615) (not b!281614))
(check-sat)
