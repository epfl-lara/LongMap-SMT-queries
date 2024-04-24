; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27300 () Bool)

(assert start!27300)

(declare-fun b!282923 () Bool)

(declare-fun res!145969 () Bool)

(declare-fun e!179531 () Bool)

(assert (=> b!282923 (=> (not res!145969) (not e!179531))))

(declare-datatypes ((array!14117 0))(
  ( (array!14118 (arr!6700 (Array (_ BitVec 32) (_ BitVec 64))) (size!7052 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14117)

(declare-datatypes ((List!4421 0))(
  ( (Nil!4418) (Cons!4417 (h!5087 (_ BitVec 64)) (t!9495 List!4421)) )
))
(declare-fun arrayNoDuplicates!0 (array!14117 (_ BitVec 32) List!4421) Bool)

(assert (=> b!282923 (= res!145969 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4418))))

(declare-fun b!282924 () Bool)

(declare-fun res!145970 () Bool)

(assert (=> b!282924 (=> (not res!145970) (not e!179531))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282924 (= res!145970 (validKeyInArray!0 k0!2581))))

(declare-fun b!282925 () Bool)

(declare-fun res!145973 () Bool)

(assert (=> b!282925 (=> (not res!145973) (not e!179531))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282925 (= res!145973 (and (= (size!7052 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7052 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7052 a!3325))))))

(declare-fun b!282926 () Bool)

(declare-fun e!179533 () Bool)

(assert (=> b!282926 (= e!179533 (not (or (bvsge startIndex!26 (bvsub (size!7052 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvslt (bvsub (size!7052 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7052 a!3325) startIndex!26)))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14117 (_ BitVec 32)) Bool)

(assert (=> b!282926 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8976 0))(
  ( (Unit!8977) )
))
(declare-fun lt!139850 () Unit!8976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14117 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8976)

(assert (=> b!282926 (= lt!139850 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139847 () array!14117)

(declare-datatypes ((SeekEntryResult!1823 0))(
  ( (MissingZero!1823 (index!9462 (_ BitVec 32))) (Found!1823 (index!9463 (_ BitVec 32))) (Intermediate!1823 (undefined!2635 Bool) (index!9464 (_ BitVec 32)) (x!27781 (_ BitVec 32))) (Undefined!1823) (MissingVacant!1823 (index!9465 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14117 (_ BitVec 32)) SeekEntryResult!1823)

(assert (=> b!282926 (= (seekEntryOrOpen!0 (select (arr!6700 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6700 a!3325) i!1267 k0!2581) startIndex!26) lt!139847 mask!3868))))

(declare-fun lt!139848 () Unit!8976)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14117 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8976)

(assert (=> b!282926 (= lt!139848 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282926 (arrayNoDuplicates!0 lt!139847 #b00000000000000000000000000000000 Nil!4418)))

(declare-fun lt!139849 () Unit!8976)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14117 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4421) Unit!8976)

(assert (=> b!282926 (= lt!139849 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4418))))

(declare-fun b!282927 () Bool)

(declare-fun res!145972 () Bool)

(declare-fun e!179534 () Bool)

(assert (=> b!282927 (=> (not res!145972) (not e!179534))))

(assert (=> b!282927 (= res!145972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282928 () Bool)

(assert (=> b!282928 (= e!179534 e!179533)))

(declare-fun res!145967 () Bool)

(assert (=> b!282928 (=> (not res!145967) (not e!179533))))

(assert (=> b!282928 (= res!145967 (not (= startIndex!26 i!1267)))))

(assert (=> b!282928 (= lt!139847 (array!14118 (store (arr!6700 a!3325) i!1267 k0!2581) (size!7052 a!3325)))))

(declare-fun b!282929 () Bool)

(declare-fun res!145974 () Bool)

(assert (=> b!282929 (=> (not res!145974) (not e!179533))))

(assert (=> b!282929 (= res!145974 (validKeyInArray!0 (select (arr!6700 a!3325) startIndex!26)))))

(declare-fun b!282930 () Bool)

(declare-fun res!145968 () Bool)

(assert (=> b!282930 (=> (not res!145968) (not e!179531))))

(declare-fun arrayContainsKey!0 (array!14117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282930 (= res!145968 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282931 () Bool)

(assert (=> b!282931 (= e!179531 e!179534)))

(declare-fun res!145966 () Bool)

(assert (=> b!282931 (=> (not res!145966) (not e!179534))))

(declare-fun lt!139851 () SeekEntryResult!1823)

(assert (=> b!282931 (= res!145966 (or (= lt!139851 (MissingZero!1823 i!1267)) (= lt!139851 (MissingVacant!1823 i!1267))))))

(assert (=> b!282931 (= lt!139851 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!145971 () Bool)

(assert (=> start!27300 (=> (not res!145971) (not e!179531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27300 (= res!145971 (validMask!0 mask!3868))))

(assert (=> start!27300 e!179531))

(declare-fun array_inv!4650 (array!14117) Bool)

(assert (=> start!27300 (array_inv!4650 a!3325)))

(assert (=> start!27300 true))

(assert (= (and start!27300 res!145971) b!282925))

(assert (= (and b!282925 res!145973) b!282924))

(assert (= (and b!282924 res!145970) b!282923))

(assert (= (and b!282923 res!145969) b!282930))

(assert (= (and b!282930 res!145968) b!282931))

(assert (= (and b!282931 res!145966) b!282927))

(assert (= (and b!282927 res!145972) b!282928))

(assert (= (and b!282928 res!145967) b!282929))

(assert (= (and b!282929 res!145974) b!282926))

(declare-fun m!297797 () Bool)

(assert (=> b!282928 m!297797))

(declare-fun m!297799 () Bool)

(assert (=> b!282927 m!297799))

(declare-fun m!297801 () Bool)

(assert (=> start!27300 m!297801))

(declare-fun m!297803 () Bool)

(assert (=> start!27300 m!297803))

(declare-fun m!297805 () Bool)

(assert (=> b!282929 m!297805))

(assert (=> b!282929 m!297805))

(declare-fun m!297807 () Bool)

(assert (=> b!282929 m!297807))

(declare-fun m!297809 () Bool)

(assert (=> b!282923 m!297809))

(declare-fun m!297811 () Bool)

(assert (=> b!282926 m!297811))

(declare-fun m!297813 () Bool)

(assert (=> b!282926 m!297813))

(assert (=> b!282926 m!297797))

(assert (=> b!282926 m!297813))

(declare-fun m!297815 () Bool)

(assert (=> b!282926 m!297815))

(declare-fun m!297817 () Bool)

(assert (=> b!282926 m!297817))

(assert (=> b!282926 m!297805))

(declare-fun m!297819 () Bool)

(assert (=> b!282926 m!297819))

(assert (=> b!282926 m!297805))

(declare-fun m!297821 () Bool)

(assert (=> b!282926 m!297821))

(declare-fun m!297823 () Bool)

(assert (=> b!282926 m!297823))

(declare-fun m!297825 () Bool)

(assert (=> b!282926 m!297825))

(declare-fun m!297827 () Bool)

(assert (=> b!282930 m!297827))

(declare-fun m!297829 () Bool)

(assert (=> b!282924 m!297829))

(declare-fun m!297831 () Bool)

(assert (=> b!282931 m!297831))

(check-sat (not b!282924) (not b!282923) (not b!282931) (not b!282929) (not b!282930) (not start!27300) (not b!282927) (not b!282926))
(check-sat)
