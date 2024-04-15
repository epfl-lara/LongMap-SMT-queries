; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27296 () Bool)

(assert start!27296)

(declare-fun b!282648 () Bool)

(declare-fun res!145770 () Bool)

(declare-fun e!179372 () Bool)

(assert (=> b!282648 (=> (not res!145770) (not e!179372))))

(declare-datatypes ((array!14103 0))(
  ( (array!14104 (arr!6693 (Array (_ BitVec 32) (_ BitVec 64))) (size!7046 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14103)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282648 (= res!145770 (validKeyInArray!0 (select (arr!6693 a!3325) startIndex!26)))))

(declare-fun b!282649 () Bool)

(declare-fun res!145769 () Bool)

(declare-fun e!179373 () Bool)

(assert (=> b!282649 (=> (not res!145769) (not e!179373))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282649 (= res!145769 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282650 () Bool)

(declare-fun res!145772 () Bool)

(assert (=> b!282650 (=> (not res!145772) (not e!179373))))

(assert (=> b!282650 (= res!145772 (validKeyInArray!0 k0!2581))))

(declare-fun b!282651 () Bool)

(declare-fun res!145774 () Bool)

(assert (=> b!282651 (=> (not res!145774) (not e!179373))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282651 (= res!145774 (and (= (size!7046 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7046 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7046 a!3325))))))

(declare-fun res!145773 () Bool)

(assert (=> start!27296 (=> (not res!145773) (not e!179373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27296 (= res!145773 (validMask!0 mask!3868))))

(assert (=> start!27296 e!179373))

(declare-fun array_inv!4665 (array!14103) Bool)

(assert (=> start!27296 (array_inv!4665 a!3325)))

(assert (=> start!27296 true))

(declare-fun b!282652 () Bool)

(declare-fun e!179371 () Bool)

(assert (=> b!282652 (= e!179371 e!179372)))

(declare-fun res!145776 () Bool)

(assert (=> b!282652 (=> (not res!145776) (not e!179372))))

(assert (=> b!282652 (= res!145776 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139562 () array!14103)

(assert (=> b!282652 (= lt!139562 (array!14104 (store (arr!6693 a!3325) i!1267 k0!2581) (size!7046 a!3325)))))

(declare-fun b!282653 () Bool)

(declare-fun res!145775 () Bool)

(assert (=> b!282653 (=> (not res!145775) (not e!179373))))

(declare-datatypes ((List!4474 0))(
  ( (Nil!4471) (Cons!4470 (h!5140 (_ BitVec 64)) (t!9547 List!4474)) )
))
(declare-fun arrayNoDuplicates!0 (array!14103 (_ BitVec 32) List!4474) Bool)

(assert (=> b!282653 (= res!145775 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4471))))

(declare-fun b!282654 () Bool)

(assert (=> b!282654 (= e!179372 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14103 (_ BitVec 32)) Bool)

(assert (=> b!282654 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8946 0))(
  ( (Unit!8947) )
))
(declare-fun lt!139563 () Unit!8946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!282654 (= lt!139563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1850 0))(
  ( (MissingZero!1850 (index!9570 (_ BitVec 32))) (Found!1850 (index!9571 (_ BitVec 32))) (Intermediate!1850 (undefined!2662 Bool) (index!9572 (_ BitVec 32)) (x!27799 (_ BitVec 32))) (Undefined!1850) (MissingVacant!1850 (index!9573 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14103 (_ BitVec 32)) SeekEntryResult!1850)

(assert (=> b!282654 (= (seekEntryOrOpen!0 (select (arr!6693 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6693 a!3325) i!1267 k0!2581) startIndex!26) lt!139562 mask!3868))))

(declare-fun lt!139565 () Unit!8946)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14103 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8946)

(assert (=> b!282654 (= lt!139565 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282654 (arrayNoDuplicates!0 lt!139562 #b00000000000000000000000000000000 Nil!4471)))

(declare-fun lt!139566 () Unit!8946)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14103 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4474) Unit!8946)

(assert (=> b!282654 (= lt!139566 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4471))))

(declare-fun b!282655 () Bool)

(declare-fun res!145777 () Bool)

(assert (=> b!282655 (=> (not res!145777) (not e!179371))))

(assert (=> b!282655 (= res!145777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282656 () Bool)

(assert (=> b!282656 (= e!179373 e!179371)))

(declare-fun res!145771 () Bool)

(assert (=> b!282656 (=> (not res!145771) (not e!179371))))

(declare-fun lt!139564 () SeekEntryResult!1850)

(assert (=> b!282656 (= res!145771 (or (= lt!139564 (MissingZero!1850 i!1267)) (= lt!139564 (MissingVacant!1850 i!1267))))))

(assert (=> b!282656 (= lt!139564 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27296 res!145773) b!282651))

(assert (= (and b!282651 res!145774) b!282650))

(assert (= (and b!282650 res!145772) b!282653))

(assert (= (and b!282653 res!145775) b!282649))

(assert (= (and b!282649 res!145769) b!282656))

(assert (= (and b!282656 res!145771) b!282655))

(assert (= (and b!282655 res!145777) b!282652))

(assert (= (and b!282652 res!145776) b!282648))

(assert (= (and b!282648 res!145770) b!282654))

(declare-fun m!296891 () Bool)

(assert (=> b!282656 m!296891))

(declare-fun m!296893 () Bool)

(assert (=> b!282653 m!296893))

(declare-fun m!296895 () Bool)

(assert (=> b!282650 m!296895))

(declare-fun m!296897 () Bool)

(assert (=> b!282654 m!296897))

(declare-fun m!296899 () Bool)

(assert (=> b!282654 m!296899))

(declare-fun m!296901 () Bool)

(assert (=> b!282654 m!296901))

(declare-fun m!296903 () Bool)

(assert (=> b!282654 m!296903))

(declare-fun m!296905 () Bool)

(assert (=> b!282654 m!296905))

(declare-fun m!296907 () Bool)

(assert (=> b!282654 m!296907))

(declare-fun m!296909 () Bool)

(assert (=> b!282654 m!296909))

(declare-fun m!296911 () Bool)

(assert (=> b!282654 m!296911))

(assert (=> b!282654 m!296899))

(declare-fun m!296913 () Bool)

(assert (=> b!282654 m!296913))

(assert (=> b!282654 m!296907))

(declare-fun m!296915 () Bool)

(assert (=> b!282654 m!296915))

(assert (=> b!282652 m!296903))

(declare-fun m!296917 () Bool)

(assert (=> b!282655 m!296917))

(declare-fun m!296919 () Bool)

(assert (=> start!27296 m!296919))

(declare-fun m!296921 () Bool)

(assert (=> start!27296 m!296921))

(assert (=> b!282648 m!296907))

(assert (=> b!282648 m!296907))

(declare-fun m!296923 () Bool)

(assert (=> b!282648 m!296923))

(declare-fun m!296925 () Bool)

(assert (=> b!282649 m!296925))

(check-sat (not b!282653) (not b!282648) (not b!282649) (not b!282650) (not b!282654) (not b!282656) (not start!27296) (not b!282655))
(check-sat)
