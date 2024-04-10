; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27302 () Bool)

(assert start!27302)

(declare-fun b!282903 () Bool)

(declare-fun res!145975 () Bool)

(declare-fun e!179521 () Bool)

(assert (=> b!282903 (=> (not res!145975) (not e!179521))))

(declare-datatypes ((array!14120 0))(
  ( (array!14121 (arr!6702 (Array (_ BitVec 32) (_ BitVec 64))) (size!7054 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14120)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14120 (_ BitVec 32)) Bool)

(assert (=> b!282903 (= res!145975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282904 () Bool)

(declare-fun res!145976 () Bool)

(declare-fun e!179519 () Bool)

(assert (=> b!282904 (=> (not res!145976) (not e!179519))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282904 (= res!145976 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282905 () Bool)

(declare-fun res!145974 () Bool)

(declare-fun e!179520 () Bool)

(assert (=> b!282905 (=> (not res!145974) (not e!179520))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282905 (= res!145974 (validKeyInArray!0 (select (arr!6702 a!3325) startIndex!26)))))

(declare-fun b!282906 () Bool)

(declare-fun res!145978 () Bool)

(assert (=> b!282906 (=> (not res!145978) (not e!179519))))

(declare-datatypes ((List!4510 0))(
  ( (Nil!4507) (Cons!4506 (h!5176 (_ BitVec 64)) (t!9592 List!4510)) )
))
(declare-fun arrayNoDuplicates!0 (array!14120 (_ BitVec 32) List!4510) Bool)

(assert (=> b!282906 (= res!145978 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4507))))

(declare-fun b!282907 () Bool)

(declare-fun res!145979 () Bool)

(assert (=> b!282907 (=> (not res!145979) (not e!179519))))

(assert (=> b!282907 (= res!145979 (validKeyInArray!0 k0!2581))))

(declare-fun b!282908 () Bool)

(assert (=> b!282908 (= e!179520 (not (or (bvsge startIndex!26 (bvsub (size!7054 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvslt (bvsub (size!7054 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7054 a!3325) startIndex!26)))))))

(assert (=> b!282908 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9004 0))(
  ( (Unit!9005) )
))
(declare-fun lt!139807 () Unit!9004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9004)

(assert (=> b!282908 (= lt!139807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139803 () array!14120)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1860 0))(
  ( (MissingZero!1860 (index!9610 (_ BitVec 32))) (Found!1860 (index!9611 (_ BitVec 32))) (Intermediate!1860 (undefined!2672 Bool) (index!9612 (_ BitVec 32)) (x!27818 (_ BitVec 32))) (Undefined!1860) (MissingVacant!1860 (index!9613 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14120 (_ BitVec 32)) SeekEntryResult!1860)

(assert (=> b!282908 (= (seekEntryOrOpen!0 (select (arr!6702 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26) lt!139803 mask!3868))))

(declare-fun lt!139804 () Unit!9004)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14120 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9004)

(assert (=> b!282908 (= lt!139804 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282908 (arrayNoDuplicates!0 lt!139803 #b00000000000000000000000000000000 Nil!4507)))

(declare-fun lt!139805 () Unit!9004)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14120 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4510) Unit!9004)

(assert (=> b!282908 (= lt!139805 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4507))))

(declare-fun b!282909 () Bool)

(assert (=> b!282909 (= e!179521 e!179520)))

(declare-fun res!145973 () Bool)

(assert (=> b!282909 (=> (not res!145973) (not e!179520))))

(assert (=> b!282909 (= res!145973 (not (= startIndex!26 i!1267)))))

(assert (=> b!282909 (= lt!139803 (array!14121 (store (arr!6702 a!3325) i!1267 k0!2581) (size!7054 a!3325)))))

(declare-fun res!145972 () Bool)

(assert (=> start!27302 (=> (not res!145972) (not e!179519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27302 (= res!145972 (validMask!0 mask!3868))))

(assert (=> start!27302 e!179519))

(declare-fun array_inv!4665 (array!14120) Bool)

(assert (=> start!27302 (array_inv!4665 a!3325)))

(assert (=> start!27302 true))

(declare-fun b!282910 () Bool)

(declare-fun res!145980 () Bool)

(assert (=> b!282910 (=> (not res!145980) (not e!179519))))

(assert (=> b!282910 (= res!145980 (and (= (size!7054 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7054 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7054 a!3325))))))

(declare-fun b!282911 () Bool)

(assert (=> b!282911 (= e!179519 e!179521)))

(declare-fun res!145977 () Bool)

(assert (=> b!282911 (=> (not res!145977) (not e!179521))))

(declare-fun lt!139806 () SeekEntryResult!1860)

(assert (=> b!282911 (= res!145977 (or (= lt!139806 (MissingZero!1860 i!1267)) (= lt!139806 (MissingVacant!1860 i!1267))))))

(assert (=> b!282911 (= lt!139806 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27302 res!145972) b!282910))

(assert (= (and b!282910 res!145980) b!282907))

(assert (= (and b!282907 res!145979) b!282906))

(assert (= (and b!282906 res!145978) b!282904))

(assert (= (and b!282904 res!145976) b!282911))

(assert (= (and b!282911 res!145977) b!282903))

(assert (= (and b!282903 res!145975) b!282909))

(assert (= (and b!282909 res!145973) b!282905))

(assert (= (and b!282905 res!145974) b!282908))

(declare-fun m!297627 () Bool)

(assert (=> b!282904 m!297627))

(declare-fun m!297629 () Bool)

(assert (=> b!282905 m!297629))

(assert (=> b!282905 m!297629))

(declare-fun m!297631 () Bool)

(assert (=> b!282905 m!297631))

(declare-fun m!297633 () Bool)

(assert (=> b!282906 m!297633))

(declare-fun m!297635 () Bool)

(assert (=> b!282903 m!297635))

(declare-fun m!297637 () Bool)

(assert (=> start!27302 m!297637))

(declare-fun m!297639 () Bool)

(assert (=> start!27302 m!297639))

(declare-fun m!297641 () Bool)

(assert (=> b!282911 m!297641))

(declare-fun m!297643 () Bool)

(assert (=> b!282909 m!297643))

(declare-fun m!297645 () Bool)

(assert (=> b!282907 m!297645))

(declare-fun m!297647 () Bool)

(assert (=> b!282908 m!297647))

(declare-fun m!297649 () Bool)

(assert (=> b!282908 m!297649))

(assert (=> b!282908 m!297643))

(assert (=> b!282908 m!297629))

(declare-fun m!297651 () Bool)

(assert (=> b!282908 m!297651))

(declare-fun m!297653 () Bool)

(assert (=> b!282908 m!297653))

(declare-fun m!297655 () Bool)

(assert (=> b!282908 m!297655))

(assert (=> b!282908 m!297629))

(declare-fun m!297657 () Bool)

(assert (=> b!282908 m!297657))

(declare-fun m!297659 () Bool)

(assert (=> b!282908 m!297659))

(assert (=> b!282908 m!297649))

(declare-fun m!297661 () Bool)

(assert (=> b!282908 m!297661))

(check-sat (not b!282904) (not start!27302) (not b!282908) (not b!282907) (not b!282911) (not b!282906) (not b!282903) (not b!282905))
(check-sat)
