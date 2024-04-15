; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27302 () Bool)

(assert start!27302)

(declare-fun b!282729 () Bool)

(declare-fun res!145851 () Bool)

(declare-fun e!179409 () Bool)

(assert (=> b!282729 (=> (not res!145851) (not e!179409))))

(declare-datatypes ((array!14109 0))(
  ( (array!14110 (arr!6696 (Array (_ BitVec 32) (_ BitVec 64))) (size!7049 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14109)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282729 (= res!145851 (validKeyInArray!0 (select (arr!6696 a!3325) startIndex!26)))))

(declare-fun b!282730 () Bool)

(declare-fun e!179407 () Bool)

(assert (=> b!282730 (= e!179407 e!179409)))

(declare-fun res!145855 () Bool)

(assert (=> b!282730 (=> (not res!145855) (not e!179409))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282730 (= res!145855 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139610 () array!14109)

(assert (=> b!282730 (= lt!139610 (array!14110 (store (arr!6696 a!3325) i!1267 k0!2581) (size!7049 a!3325)))))

(declare-fun b!282731 () Bool)

(declare-fun res!145853 () Bool)

(declare-fun e!179408 () Bool)

(assert (=> b!282731 (=> (not res!145853) (not e!179408))))

(declare-datatypes ((List!4477 0))(
  ( (Nil!4474) (Cons!4473 (h!5143 (_ BitVec 64)) (t!9550 List!4477)) )
))
(declare-fun arrayNoDuplicates!0 (array!14109 (_ BitVec 32) List!4477) Bool)

(assert (=> b!282731 (= res!145853 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4474))))

(declare-fun b!282732 () Bool)

(declare-fun res!145852 () Bool)

(assert (=> b!282732 (=> (not res!145852) (not e!179408))))

(declare-fun arrayContainsKey!0 (array!14109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282732 (= res!145852 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282733 () Bool)

(declare-fun res!145854 () Bool)

(assert (=> b!282733 (=> (not res!145854) (not e!179407))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14109 (_ BitVec 32)) Bool)

(assert (=> b!282733 (= res!145854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282734 () Bool)

(declare-fun res!145856 () Bool)

(assert (=> b!282734 (=> (not res!145856) (not e!179408))))

(assert (=> b!282734 (= res!145856 (validKeyInArray!0 k0!2581))))

(declare-fun b!282736 () Bool)

(assert (=> b!282736 (= e!179409 (not (or (bvsge startIndex!26 (bvsub (size!7049 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvslt (bvsub (size!7049 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7049 a!3325) startIndex!26)))))))

(assert (=> b!282736 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8952 0))(
  ( (Unit!8953) )
))
(declare-fun lt!139611 () Unit!8952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8952)

(assert (=> b!282736 (= lt!139611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1853 0))(
  ( (MissingZero!1853 (index!9582 (_ BitVec 32))) (Found!1853 (index!9583 (_ BitVec 32))) (Intermediate!1853 (undefined!2665 Bool) (index!9584 (_ BitVec 32)) (x!27810 (_ BitVec 32))) (Undefined!1853) (MissingVacant!1853 (index!9585 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14109 (_ BitVec 32)) SeekEntryResult!1853)

(assert (=> b!282736 (= (seekEntryOrOpen!0 (select (arr!6696 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6696 a!3325) i!1267 k0!2581) startIndex!26) lt!139610 mask!3868))))

(declare-fun lt!139607 () Unit!8952)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14109 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8952)

(assert (=> b!282736 (= lt!139607 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282736 (arrayNoDuplicates!0 lt!139610 #b00000000000000000000000000000000 Nil!4474)))

(declare-fun lt!139608 () Unit!8952)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14109 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4477) Unit!8952)

(assert (=> b!282736 (= lt!139608 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4474))))

(declare-fun b!282737 () Bool)

(declare-fun res!145857 () Bool)

(assert (=> b!282737 (=> (not res!145857) (not e!179408))))

(assert (=> b!282737 (= res!145857 (and (= (size!7049 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7049 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7049 a!3325))))))

(declare-fun res!145850 () Bool)

(assert (=> start!27302 (=> (not res!145850) (not e!179408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27302 (= res!145850 (validMask!0 mask!3868))))

(assert (=> start!27302 e!179408))

(declare-fun array_inv!4668 (array!14109) Bool)

(assert (=> start!27302 (array_inv!4668 a!3325)))

(assert (=> start!27302 true))

(declare-fun b!282735 () Bool)

(assert (=> b!282735 (= e!179408 e!179407)))

(declare-fun res!145858 () Bool)

(assert (=> b!282735 (=> (not res!145858) (not e!179407))))

(declare-fun lt!139609 () SeekEntryResult!1853)

(assert (=> b!282735 (= res!145858 (or (= lt!139609 (MissingZero!1853 i!1267)) (= lt!139609 (MissingVacant!1853 i!1267))))))

(assert (=> b!282735 (= lt!139609 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27302 res!145850) b!282737))

(assert (= (and b!282737 res!145857) b!282734))

(assert (= (and b!282734 res!145856) b!282731))

(assert (= (and b!282731 res!145853) b!282732))

(assert (= (and b!282732 res!145852) b!282735))

(assert (= (and b!282735 res!145858) b!282733))

(assert (= (and b!282733 res!145854) b!282730))

(assert (= (and b!282730 res!145855) b!282729))

(assert (= (and b!282729 res!145851) b!282736))

(declare-fun m!296999 () Bool)

(assert (=> b!282733 m!296999))

(declare-fun m!297001 () Bool)

(assert (=> b!282735 m!297001))

(declare-fun m!297003 () Bool)

(assert (=> b!282730 m!297003))

(declare-fun m!297005 () Bool)

(assert (=> b!282734 m!297005))

(declare-fun m!297007 () Bool)

(assert (=> b!282732 m!297007))

(declare-fun m!297009 () Bool)

(assert (=> start!27302 m!297009))

(declare-fun m!297011 () Bool)

(assert (=> start!27302 m!297011))

(declare-fun m!297013 () Bool)

(assert (=> b!282736 m!297013))

(declare-fun m!297015 () Bool)

(assert (=> b!282736 m!297015))

(declare-fun m!297017 () Bool)

(assert (=> b!282736 m!297017))

(assert (=> b!282736 m!297015))

(assert (=> b!282736 m!297003))

(declare-fun m!297019 () Bool)

(assert (=> b!282736 m!297019))

(declare-fun m!297021 () Bool)

(assert (=> b!282736 m!297021))

(declare-fun m!297023 () Bool)

(assert (=> b!282736 m!297023))

(assert (=> b!282736 m!297021))

(declare-fun m!297025 () Bool)

(assert (=> b!282736 m!297025))

(declare-fun m!297027 () Bool)

(assert (=> b!282736 m!297027))

(declare-fun m!297029 () Bool)

(assert (=> b!282736 m!297029))

(declare-fun m!297031 () Bool)

(assert (=> b!282731 m!297031))

(assert (=> b!282729 m!297021))

(assert (=> b!282729 m!297021))

(declare-fun m!297033 () Bool)

(assert (=> b!282729 m!297033))

(check-sat (not b!282731) (not b!282735) (not b!282732) (not b!282736) (not b!282733) (not b!282729) (not start!27302) (not b!282734))
(check-sat)
