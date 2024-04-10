; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27296 () Bool)

(assert start!27296)

(declare-fun b!282822 () Bool)

(declare-fun res!145896 () Bool)

(declare-fun e!179485 () Bool)

(assert (=> b!282822 (=> (not res!145896) (not e!179485))))

(declare-datatypes ((array!14114 0))(
  ( (array!14115 (arr!6699 (Array (_ BitVec 32) (_ BitVec 64))) (size!7051 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14114)

(declare-datatypes ((List!4507 0))(
  ( (Nil!4504) (Cons!4503 (h!5173 (_ BitVec 64)) (t!9589 List!4507)) )
))
(declare-fun arrayNoDuplicates!0 (array!14114 (_ BitVec 32) List!4507) Bool)

(assert (=> b!282822 (= res!145896 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4504))))

(declare-fun b!282823 () Bool)

(declare-fun res!145898 () Bool)

(declare-fun e!179486 () Bool)

(assert (=> b!282823 (=> (not res!145898) (not e!179486))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282823 (= res!145898 (validKeyInArray!0 (select (arr!6699 a!3325) startIndex!26)))))

(declare-fun b!282824 () Bool)

(declare-fun res!145897 () Bool)

(assert (=> b!282824 (=> (not res!145897) (not e!179485))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282824 (= res!145897 (and (= (size!7051 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7051 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7051 a!3325))))))

(declare-fun b!282825 () Bool)

(declare-fun res!145895 () Bool)

(assert (=> b!282825 (=> (not res!145895) (not e!179485))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!282825 (= res!145895 (validKeyInArray!0 k0!2581))))

(declare-fun b!282827 () Bool)

(declare-fun res!145892 () Bool)

(assert (=> b!282827 (=> (not res!145892) (not e!179485))))

(declare-fun arrayContainsKey!0 (array!14114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282827 (= res!145892 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282828 () Bool)

(assert (=> b!282828 (= e!179486 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14114 (_ BitVec 32)) Bool)

(assert (=> b!282828 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8998 0))(
  ( (Unit!8999) )
))
(declare-fun lt!139758 () Unit!8998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8998)

(assert (=> b!282828 (= lt!139758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139760 () array!14114)

(declare-datatypes ((SeekEntryResult!1857 0))(
  ( (MissingZero!1857 (index!9598 (_ BitVec 32))) (Found!1857 (index!9599 (_ BitVec 32))) (Intermediate!1857 (undefined!2669 Bool) (index!9600 (_ BitVec 32)) (x!27807 (_ BitVec 32))) (Undefined!1857) (MissingVacant!1857 (index!9601 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14114 (_ BitVec 32)) SeekEntryResult!1857)

(assert (=> b!282828 (= (seekEntryOrOpen!0 (select (arr!6699 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6699 a!3325) i!1267 k0!2581) startIndex!26) lt!139760 mask!3868))))

(declare-fun lt!139761 () Unit!8998)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14114 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8998)

(assert (=> b!282828 (= lt!139761 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282828 (arrayNoDuplicates!0 lt!139760 #b00000000000000000000000000000000 Nil!4504)))

(declare-fun lt!139762 () Unit!8998)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14114 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4507) Unit!8998)

(assert (=> b!282828 (= lt!139762 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4504))))

(declare-fun b!282829 () Bool)

(declare-fun e!179483 () Bool)

(assert (=> b!282829 (= e!179483 e!179486)))

(declare-fun res!145891 () Bool)

(assert (=> b!282829 (=> (not res!145891) (not e!179486))))

(assert (=> b!282829 (= res!145891 (not (= startIndex!26 i!1267)))))

(assert (=> b!282829 (= lt!139760 (array!14115 (store (arr!6699 a!3325) i!1267 k0!2581) (size!7051 a!3325)))))

(declare-fun b!282830 () Bool)

(declare-fun res!145899 () Bool)

(assert (=> b!282830 (=> (not res!145899) (not e!179483))))

(assert (=> b!282830 (= res!145899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282826 () Bool)

(assert (=> b!282826 (= e!179485 e!179483)))

(declare-fun res!145894 () Bool)

(assert (=> b!282826 (=> (not res!145894) (not e!179483))))

(declare-fun lt!139759 () SeekEntryResult!1857)

(assert (=> b!282826 (= res!145894 (or (= lt!139759 (MissingZero!1857 i!1267)) (= lt!139759 (MissingVacant!1857 i!1267))))))

(assert (=> b!282826 (= lt!139759 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!145893 () Bool)

(assert (=> start!27296 (=> (not res!145893) (not e!179485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27296 (= res!145893 (validMask!0 mask!3868))))

(assert (=> start!27296 e!179485))

(declare-fun array_inv!4662 (array!14114) Bool)

(assert (=> start!27296 (array_inv!4662 a!3325)))

(assert (=> start!27296 true))

(assert (= (and start!27296 res!145893) b!282824))

(assert (= (and b!282824 res!145897) b!282825))

(assert (= (and b!282825 res!145895) b!282822))

(assert (= (and b!282822 res!145896) b!282827))

(assert (= (and b!282827 res!145892) b!282826))

(assert (= (and b!282826 res!145894) b!282830))

(assert (= (and b!282830 res!145899) b!282829))

(assert (= (and b!282829 res!145891) b!282823))

(assert (= (and b!282823 res!145898) b!282828))

(declare-fun m!297519 () Bool)

(assert (=> b!282826 m!297519))

(declare-fun m!297521 () Bool)

(assert (=> b!282828 m!297521))

(declare-fun m!297523 () Bool)

(assert (=> b!282828 m!297523))

(declare-fun m!297525 () Bool)

(assert (=> b!282828 m!297525))

(assert (=> b!282828 m!297523))

(declare-fun m!297527 () Bool)

(assert (=> b!282828 m!297527))

(declare-fun m!297529 () Bool)

(assert (=> b!282828 m!297529))

(declare-fun m!297531 () Bool)

(assert (=> b!282828 m!297531))

(declare-fun m!297533 () Bool)

(assert (=> b!282828 m!297533))

(assert (=> b!282828 m!297529))

(declare-fun m!297535 () Bool)

(assert (=> b!282828 m!297535))

(declare-fun m!297537 () Bool)

(assert (=> b!282828 m!297537))

(declare-fun m!297539 () Bool)

(assert (=> b!282828 m!297539))

(assert (=> b!282823 m!297529))

(assert (=> b!282823 m!297529))

(declare-fun m!297541 () Bool)

(assert (=> b!282823 m!297541))

(declare-fun m!297543 () Bool)

(assert (=> b!282827 m!297543))

(declare-fun m!297545 () Bool)

(assert (=> b!282830 m!297545))

(declare-fun m!297547 () Bool)

(assert (=> start!27296 m!297547))

(declare-fun m!297549 () Bool)

(assert (=> start!27296 m!297549))

(assert (=> b!282829 m!297527))

(declare-fun m!297551 () Bool)

(assert (=> b!282825 m!297551))

(declare-fun m!297553 () Bool)

(assert (=> b!282822 m!297553))

(check-sat (not b!282830) (not b!282822) (not b!282826) (not b!282828) (not start!27296) (not b!282825) (not b!282827) (not b!282823))
(check-sat)
