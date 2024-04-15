; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27230 () Bool)

(assert start!27230)

(declare-fun b!281757 () Bool)

(declare-fun res!144886 () Bool)

(declare-fun e!178977 () Bool)

(assert (=> b!281757 (=> (not res!144886) (not e!178977))))

(declare-datatypes ((array!14037 0))(
  ( (array!14038 (arr!6660 (Array (_ BitVec 32) (_ BitVec 64))) (size!7013 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14037)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281757 (= res!144886 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281758 () Bool)

(declare-fun res!144882 () Bool)

(assert (=> b!281758 (=> (not res!144882) (not e!178977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281758 (= res!144882 (validKeyInArray!0 k0!2581))))

(declare-fun b!281759 () Bool)

(declare-fun res!144881 () Bool)

(assert (=> b!281759 (=> (not res!144881) (not e!178977))))

(declare-datatypes ((List!4441 0))(
  ( (Nil!4438) (Cons!4437 (h!5107 (_ BitVec 64)) (t!9514 List!4441)) )
))
(declare-fun arrayNoDuplicates!0 (array!14037 (_ BitVec 32) List!4441) Bool)

(assert (=> b!281759 (= res!144881 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4438))))

(declare-fun b!281760 () Bool)

(declare-fun res!144879 () Bool)

(assert (=> b!281760 (=> (not res!144879) (not e!178977))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281760 (= res!144879 (and (= (size!7013 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7013 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7013 a!3325))))))

(declare-fun b!281761 () Bool)

(declare-fun e!178974 () Bool)

(declare-fun e!178976 () Bool)

(assert (=> b!281761 (= e!178974 e!178976)))

(declare-fun res!144878 () Bool)

(assert (=> b!281761 (=> (not res!144878) (not e!178976))))

(assert (=> b!281761 (= res!144878 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139071 () array!14037)

(assert (=> b!281761 (= lt!139071 (array!14038 (store (arr!6660 a!3325) i!1267 k0!2581) (size!7013 a!3325)))))

(declare-fun b!281762 () Bool)

(assert (=> b!281762 (= e!178977 e!178974)))

(declare-fun res!144884 () Bool)

(assert (=> b!281762 (=> (not res!144884) (not e!178974))))

(declare-datatypes ((SeekEntryResult!1817 0))(
  ( (MissingZero!1817 (index!9438 (_ BitVec 32))) (Found!1817 (index!9439 (_ BitVec 32))) (Intermediate!1817 (undefined!2629 Bool) (index!9440 (_ BitVec 32)) (x!27678 (_ BitVec 32))) (Undefined!1817) (MissingVacant!1817 (index!9441 (_ BitVec 32))) )
))
(declare-fun lt!139068 () SeekEntryResult!1817)

(assert (=> b!281762 (= res!144884 (or (= lt!139068 (MissingZero!1817 i!1267)) (= lt!139068 (MissingVacant!1817 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14037 (_ BitVec 32)) SeekEntryResult!1817)

(assert (=> b!281762 (= lt!139068 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281763 () Bool)

(declare-fun res!144885 () Bool)

(assert (=> b!281763 (=> (not res!144885) (not e!178974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14037 (_ BitVec 32)) Bool)

(assert (=> b!281763 (= res!144885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281765 () Bool)

(assert (=> b!281765 (= e!178976 (not true))))

(assert (=> b!281765 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8880 0))(
  ( (Unit!8881) )
))
(declare-fun lt!139069 () Unit!8880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8880)

(assert (=> b!281765 (= lt!139069 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!281765 (= (seekEntryOrOpen!0 (select (arr!6660 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6660 a!3325) i!1267 k0!2581) startIndex!26) lt!139071 mask!3868))))

(declare-fun lt!139067 () Unit!8880)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8880)

(assert (=> b!281765 (= lt!139067 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281765 (arrayNoDuplicates!0 lt!139071 #b00000000000000000000000000000000 Nil!4438)))

(declare-fun lt!139070 () Unit!8880)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14037 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4441) Unit!8880)

(assert (=> b!281765 (= lt!139070 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4438))))

(declare-fun res!144883 () Bool)

(assert (=> start!27230 (=> (not res!144883) (not e!178977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27230 (= res!144883 (validMask!0 mask!3868))))

(assert (=> start!27230 e!178977))

(declare-fun array_inv!4632 (array!14037) Bool)

(assert (=> start!27230 (array_inv!4632 a!3325)))

(assert (=> start!27230 true))

(declare-fun b!281764 () Bool)

(declare-fun res!144880 () Bool)

(assert (=> b!281764 (=> (not res!144880) (not e!178976))))

(assert (=> b!281764 (= res!144880 (validKeyInArray!0 (select (arr!6660 a!3325) startIndex!26)))))

(assert (= (and start!27230 res!144883) b!281760))

(assert (= (and b!281760 res!144879) b!281758))

(assert (= (and b!281758 res!144882) b!281759))

(assert (= (and b!281759 res!144881) b!281757))

(assert (= (and b!281757 res!144886) b!281762))

(assert (= (and b!281762 res!144884) b!281763))

(assert (= (and b!281763 res!144885) b!281761))

(assert (= (and b!281761 res!144878) b!281764))

(assert (= (and b!281764 res!144880) b!281765))

(declare-fun m!295703 () Bool)

(assert (=> b!281762 m!295703))

(declare-fun m!295705 () Bool)

(assert (=> b!281759 m!295705))

(declare-fun m!295707 () Bool)

(assert (=> b!281757 m!295707))

(declare-fun m!295709 () Bool)

(assert (=> b!281763 m!295709))

(declare-fun m!295711 () Bool)

(assert (=> start!27230 m!295711))

(declare-fun m!295713 () Bool)

(assert (=> start!27230 m!295713))

(declare-fun m!295715 () Bool)

(assert (=> b!281764 m!295715))

(assert (=> b!281764 m!295715))

(declare-fun m!295717 () Bool)

(assert (=> b!281764 m!295717))

(declare-fun m!295719 () Bool)

(assert (=> b!281761 m!295719))

(declare-fun m!295721 () Bool)

(assert (=> b!281765 m!295721))

(declare-fun m!295723 () Bool)

(assert (=> b!281765 m!295723))

(declare-fun m!295725 () Bool)

(assert (=> b!281765 m!295725))

(assert (=> b!281765 m!295723))

(declare-fun m!295727 () Bool)

(assert (=> b!281765 m!295727))

(assert (=> b!281765 m!295719))

(declare-fun m!295729 () Bool)

(assert (=> b!281765 m!295729))

(assert (=> b!281765 m!295715))

(declare-fun m!295731 () Bool)

(assert (=> b!281765 m!295731))

(declare-fun m!295733 () Bool)

(assert (=> b!281765 m!295733))

(assert (=> b!281765 m!295715))

(declare-fun m!295735 () Bool)

(assert (=> b!281765 m!295735))

(declare-fun m!295737 () Bool)

(assert (=> b!281758 m!295737))

(check-sat (not b!281758) (not b!281765) (not b!281759) (not b!281757) (not b!281763) (not start!27230) (not b!281762) (not b!281764))
(check-sat)
