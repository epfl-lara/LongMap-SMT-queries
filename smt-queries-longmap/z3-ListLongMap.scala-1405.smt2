; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27282 () Bool)

(assert start!27282)

(declare-fun b!282680 () Bool)

(declare-fun res!145731 () Bool)

(declare-fun e!179425 () Bool)

(assert (=> b!282680 (=> (not res!145731) (not e!179425))))

(declare-datatypes ((array!14099 0))(
  ( (array!14100 (arr!6691 (Array (_ BitVec 32) (_ BitVec 64))) (size!7043 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14099)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14099 (_ BitVec 32)) Bool)

(assert (=> b!282680 (= res!145731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282681 () Bool)

(declare-fun res!145729 () Bool)

(declare-fun e!179423 () Bool)

(assert (=> b!282681 (=> (not res!145729) (not e!179423))))

(declare-datatypes ((List!4412 0))(
  ( (Nil!4409) (Cons!4408 (h!5078 (_ BitVec 64)) (t!9486 List!4412)) )
))
(declare-fun arrayNoDuplicates!0 (array!14099 (_ BitVec 32) List!4412) Bool)

(assert (=> b!282681 (= res!145729 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4409))))

(declare-fun b!282682 () Bool)

(declare-fun e!179426 () Bool)

(assert (=> b!282682 (= e!179426 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282682 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8958 0))(
  ( (Unit!8959) )
))
(declare-fun lt!139716 () Unit!8958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8958)

(assert (=> b!282682 (= lt!139716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139713 () array!14099)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1814 0))(
  ( (MissingZero!1814 (index!9426 (_ BitVec 32))) (Found!1814 (index!9427 (_ BitVec 32))) (Intermediate!1814 (undefined!2626 Bool) (index!9428 (_ BitVec 32)) (x!27748 (_ BitVec 32))) (Undefined!1814) (MissingVacant!1814 (index!9429 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14099 (_ BitVec 32)) SeekEntryResult!1814)

(assert (=> b!282682 (= (seekEntryOrOpen!0 (select (arr!6691 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6691 a!3325) i!1267 k0!2581) startIndex!26) lt!139713 mask!3868))))

(declare-fun lt!139712 () Unit!8958)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14099 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8958)

(assert (=> b!282682 (= lt!139712 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282682 (arrayNoDuplicates!0 lt!139713 #b00000000000000000000000000000000 Nil!4409)))

(declare-fun lt!139714 () Unit!8958)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14099 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4412) Unit!8958)

(assert (=> b!282682 (= lt!139714 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4409))))

(declare-fun b!282683 () Bool)

(assert (=> b!282683 (= e!179423 e!179425)))

(declare-fun res!145723 () Bool)

(assert (=> b!282683 (=> (not res!145723) (not e!179425))))

(declare-fun lt!139715 () SeekEntryResult!1814)

(assert (=> b!282683 (= res!145723 (or (= lt!139715 (MissingZero!1814 i!1267)) (= lt!139715 (MissingVacant!1814 i!1267))))))

(assert (=> b!282683 (= lt!139715 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282684 () Bool)

(declare-fun res!145728 () Bool)

(assert (=> b!282684 (=> (not res!145728) (not e!179423))))

(assert (=> b!282684 (= res!145728 (and (= (size!7043 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7043 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7043 a!3325))))))

(declare-fun b!282685 () Bool)

(declare-fun res!145725 () Bool)

(assert (=> b!282685 (=> (not res!145725) (not e!179423))))

(declare-fun arrayContainsKey!0 (array!14099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282685 (= res!145725 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282687 () Bool)

(declare-fun res!145726 () Bool)

(assert (=> b!282687 (=> (not res!145726) (not e!179423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282687 (= res!145726 (validKeyInArray!0 k0!2581))))

(declare-fun b!282688 () Bool)

(assert (=> b!282688 (= e!179425 e!179426)))

(declare-fun res!145727 () Bool)

(assert (=> b!282688 (=> (not res!145727) (not e!179426))))

(assert (=> b!282688 (= res!145727 (not (= startIndex!26 i!1267)))))

(assert (=> b!282688 (= lt!139713 (array!14100 (store (arr!6691 a!3325) i!1267 k0!2581) (size!7043 a!3325)))))

(declare-fun res!145730 () Bool)

(assert (=> start!27282 (=> (not res!145730) (not e!179423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27282 (= res!145730 (validMask!0 mask!3868))))

(assert (=> start!27282 e!179423))

(declare-fun array_inv!4641 (array!14099) Bool)

(assert (=> start!27282 (array_inv!4641 a!3325)))

(assert (=> start!27282 true))

(declare-fun b!282686 () Bool)

(declare-fun res!145724 () Bool)

(assert (=> b!282686 (=> (not res!145724) (not e!179426))))

(assert (=> b!282686 (= res!145724 (validKeyInArray!0 (select (arr!6691 a!3325) startIndex!26)))))

(assert (= (and start!27282 res!145730) b!282684))

(assert (= (and b!282684 res!145728) b!282687))

(assert (= (and b!282687 res!145726) b!282681))

(assert (= (and b!282681 res!145729) b!282685))

(assert (= (and b!282685 res!145725) b!282683))

(assert (= (and b!282683 res!145723) b!282680))

(assert (= (and b!282680 res!145731) b!282688))

(assert (= (and b!282688 res!145727) b!282686))

(assert (= (and b!282686 res!145724) b!282682))

(declare-fun m!297473 () Bool)

(assert (=> b!282685 m!297473))

(declare-fun m!297475 () Bool)

(assert (=> b!282682 m!297475))

(declare-fun m!297477 () Bool)

(assert (=> b!282682 m!297477))

(declare-fun m!297479 () Bool)

(assert (=> b!282682 m!297479))

(declare-fun m!297481 () Bool)

(assert (=> b!282682 m!297481))

(declare-fun m!297483 () Bool)

(assert (=> b!282682 m!297483))

(declare-fun m!297485 () Bool)

(assert (=> b!282682 m!297485))

(assert (=> b!282682 m!297481))

(declare-fun m!297487 () Bool)

(assert (=> b!282682 m!297487))

(declare-fun m!297489 () Bool)

(assert (=> b!282682 m!297489))

(assert (=> b!282682 m!297477))

(declare-fun m!297491 () Bool)

(assert (=> b!282682 m!297491))

(declare-fun m!297493 () Bool)

(assert (=> b!282682 m!297493))

(declare-fun m!297495 () Bool)

(assert (=> b!282683 m!297495))

(assert (=> b!282686 m!297481))

(assert (=> b!282686 m!297481))

(declare-fun m!297497 () Bool)

(assert (=> b!282686 m!297497))

(declare-fun m!297499 () Bool)

(assert (=> b!282680 m!297499))

(declare-fun m!297501 () Bool)

(assert (=> start!27282 m!297501))

(declare-fun m!297503 () Bool)

(assert (=> start!27282 m!297503))

(declare-fun m!297505 () Bool)

(assert (=> b!282687 m!297505))

(declare-fun m!297507 () Bool)

(assert (=> b!282681 m!297507))

(assert (=> b!282688 m!297479))

(check-sat (not b!282681) (not b!282682) (not b!282686) (not b!282680) (not start!27282) (not b!282685) (not b!282683) (not b!282687))
(check-sat)
