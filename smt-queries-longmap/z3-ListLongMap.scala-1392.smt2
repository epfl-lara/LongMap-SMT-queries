; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27204 () Bool)

(assert start!27204)

(declare-fun b!281627 () Bool)

(declare-fun e!178957 () Bool)

(declare-fun e!178958 () Bool)

(assert (=> b!281627 (= e!178957 e!178958)))

(declare-fun res!144675 () Bool)

(assert (=> b!281627 (=> (not res!144675) (not e!178958))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281627 (= res!144675 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14021 0))(
  ( (array!14022 (arr!6652 (Array (_ BitVec 32) (_ BitVec 64))) (size!7004 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14021)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139164 () array!14021)

(assert (=> b!281627 (= lt!139164 (array!14022 (store (arr!6652 a!3325) i!1267 k0!2581) (size!7004 a!3325)))))

(declare-fun b!281628 () Bool)

(declare-fun res!144673 () Bool)

(declare-fun e!178956 () Bool)

(assert (=> b!281628 (=> (not res!144673) (not e!178956))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281628 (= res!144673 (and (= (size!7004 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7004 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7004 a!3325))))))

(declare-fun b!281629 () Bool)

(declare-fun res!144674 () Bool)

(assert (=> b!281629 (=> (not res!144674) (not e!178956))))

(declare-fun arrayContainsKey!0 (array!14021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281629 (= res!144674 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281630 () Bool)

(assert (=> b!281630 (= e!178956 e!178957)))

(declare-fun res!144671 () Bool)

(assert (=> b!281630 (=> (not res!144671) (not e!178957))))

(declare-datatypes ((SeekEntryResult!1775 0))(
  ( (MissingZero!1775 (index!9270 (_ BitVec 32))) (Found!1775 (index!9271 (_ BitVec 32))) (Intermediate!1775 (undefined!2587 Bool) (index!9272 (_ BitVec 32)) (x!27605 (_ BitVec 32))) (Undefined!1775) (MissingVacant!1775 (index!9273 (_ BitVec 32))) )
))
(declare-fun lt!139161 () SeekEntryResult!1775)

(assert (=> b!281630 (= res!144671 (or (= lt!139161 (MissingZero!1775 i!1267)) (= lt!139161 (MissingVacant!1775 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14021 (_ BitVec 32)) SeekEntryResult!1775)

(assert (=> b!281630 (= lt!139161 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281632 () Bool)

(assert (=> b!281632 (= e!178958 (not true))))

(assert (=> b!281632 (= (seekEntryOrOpen!0 (select (arr!6652 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6652 a!3325) i!1267 k0!2581) startIndex!26) lt!139164 mask!3868))))

(declare-datatypes ((Unit!8880 0))(
  ( (Unit!8881) )
))
(declare-fun lt!139162 () Unit!8880)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14021 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8880)

(assert (=> b!281632 (= lt!139162 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4373 0))(
  ( (Nil!4370) (Cons!4369 (h!5039 (_ BitVec 64)) (t!9447 List!4373)) )
))
(declare-fun arrayNoDuplicates!0 (array!14021 (_ BitVec 32) List!4373) Bool)

(assert (=> b!281632 (arrayNoDuplicates!0 lt!139164 #b00000000000000000000000000000000 Nil!4370)))

(declare-fun lt!139163 () Unit!8880)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14021 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4373) Unit!8880)

(assert (=> b!281632 (= lt!139163 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4370))))

(declare-fun b!281633 () Bool)

(declare-fun res!144676 () Bool)

(assert (=> b!281633 (=> (not res!144676) (not e!178956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281633 (= res!144676 (validKeyInArray!0 k0!2581))))

(declare-fun b!281634 () Bool)

(declare-fun res!144677 () Bool)

(assert (=> b!281634 (=> (not res!144677) (not e!178956))))

(assert (=> b!281634 (= res!144677 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4370))))

(declare-fun b!281635 () Bool)

(declare-fun res!144670 () Bool)

(assert (=> b!281635 (=> (not res!144670) (not e!178958))))

(assert (=> b!281635 (= res!144670 (validKeyInArray!0 (select (arr!6652 a!3325) startIndex!26)))))

(declare-fun res!144672 () Bool)

(assert (=> start!27204 (=> (not res!144672) (not e!178956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27204 (= res!144672 (validMask!0 mask!3868))))

(assert (=> start!27204 e!178956))

(declare-fun array_inv!4602 (array!14021) Bool)

(assert (=> start!27204 (array_inv!4602 a!3325)))

(assert (=> start!27204 true))

(declare-fun b!281631 () Bool)

(declare-fun res!144678 () Bool)

(assert (=> b!281631 (=> (not res!144678) (not e!178957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14021 (_ BitVec 32)) Bool)

(assert (=> b!281631 (= res!144678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27204 res!144672) b!281628))

(assert (= (and b!281628 res!144673) b!281633))

(assert (= (and b!281633 res!144676) b!281634))

(assert (= (and b!281634 res!144677) b!281629))

(assert (= (and b!281629 res!144674) b!281630))

(assert (= (and b!281630 res!144671) b!281631))

(assert (= (and b!281631 res!144678) b!281627))

(assert (= (and b!281627 res!144675) b!281635))

(assert (= (and b!281635 res!144670) b!281632))

(declare-fun m!296117 () Bool)

(assert (=> b!281632 m!296117))

(declare-fun m!296119 () Bool)

(assert (=> b!281632 m!296119))

(assert (=> b!281632 m!296117))

(declare-fun m!296121 () Bool)

(assert (=> b!281632 m!296121))

(declare-fun m!296123 () Bool)

(assert (=> b!281632 m!296123))

(declare-fun m!296125 () Bool)

(assert (=> b!281632 m!296125))

(declare-fun m!296127 () Bool)

(assert (=> b!281632 m!296127))

(declare-fun m!296129 () Bool)

(assert (=> b!281632 m!296129))

(declare-fun m!296131 () Bool)

(assert (=> b!281632 m!296131))

(assert (=> b!281632 m!296127))

(declare-fun m!296133 () Bool)

(assert (=> b!281631 m!296133))

(declare-fun m!296135 () Bool)

(assert (=> b!281633 m!296135))

(declare-fun m!296137 () Bool)

(assert (=> b!281630 m!296137))

(declare-fun m!296139 () Bool)

(assert (=> start!27204 m!296139))

(declare-fun m!296141 () Bool)

(assert (=> start!27204 m!296141))

(declare-fun m!296143 () Bool)

(assert (=> b!281629 m!296143))

(assert (=> b!281627 m!296121))

(declare-fun m!296145 () Bool)

(assert (=> b!281634 m!296145))

(assert (=> b!281635 m!296127))

(assert (=> b!281635 m!296127))

(declare-fun m!296147 () Bool)

(assert (=> b!281635 m!296147))

(check-sat (not b!281633) (not b!281632) (not b!281634) (not b!281630) (not start!27204) (not b!281629) (not b!281631) (not b!281635))
(check-sat)
