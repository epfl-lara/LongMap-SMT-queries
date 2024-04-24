; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27306 () Bool)

(assert start!27306)

(declare-fun b!283006 () Bool)

(declare-fun e!179571 () Bool)

(declare-fun e!179570 () Bool)

(assert (=> b!283006 (= e!179571 e!179570)))

(declare-fun res!146051 () Bool)

(assert (=> b!283006 (=> (not res!146051) (not e!179570))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!283006 (= res!146051 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14123 0))(
  ( (array!14124 (arr!6703 (Array (_ BitVec 32) (_ BitVec 64))) (size!7055 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14123)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139898 () array!14123)

(assert (=> b!283006 (= lt!139898 (array!14124 (store (arr!6703 a!3325) i!1267 k0!2581) (size!7055 a!3325)))))

(declare-fun b!283007 () Bool)

(declare-fun res!146050 () Bool)

(declare-fun e!179569 () Bool)

(assert (=> b!283007 (=> (not res!146050) (not e!179569))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!283007 (= res!146050 (and (= (size!7055 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7055 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7055 a!3325))))))

(declare-fun b!283008 () Bool)

(declare-fun res!146049 () Bool)

(assert (=> b!283008 (=> (not res!146049) (not e!179570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283008 (= res!146049 (validKeyInArray!0 (select (arr!6703 a!3325) startIndex!26)))))

(declare-fun b!283009 () Bool)

(assert (=> b!283009 (= e!179569 e!179571)))

(declare-fun res!146053 () Bool)

(assert (=> b!283009 (=> (not res!146053) (not e!179571))))

(declare-datatypes ((SeekEntryResult!1826 0))(
  ( (MissingZero!1826 (index!9474 (_ BitVec 32))) (Found!1826 (index!9475 (_ BitVec 32))) (Intermediate!1826 (undefined!2638 Bool) (index!9476 (_ BitVec 32)) (x!27792 (_ BitVec 32))) (Undefined!1826) (MissingVacant!1826 (index!9477 (_ BitVec 32))) )
))
(declare-fun lt!139899 () SeekEntryResult!1826)

(assert (=> b!283009 (= res!146053 (or (= lt!139899 (MissingZero!1826 i!1267)) (= lt!139899 (MissingVacant!1826 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14123 (_ BitVec 32)) SeekEntryResult!1826)

(assert (=> b!283009 (= lt!139899 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!146057 () Bool)

(assert (=> start!27306 (=> (not res!146057) (not e!179569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27306 (= res!146057 (validMask!0 mask!3868))))

(assert (=> start!27306 e!179569))

(declare-fun array_inv!4653 (array!14123) Bool)

(assert (=> start!27306 (array_inv!4653 a!3325)))

(assert (=> start!27306 true))

(declare-fun b!283010 () Bool)

(declare-fun res!146058 () Bool)

(assert (=> b!283010 (=> (not res!146058) (not e!179571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14123 (_ BitVec 32)) Bool)

(assert (=> b!283010 (= res!146058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283011 () Bool)

(declare-fun e!179573 () Bool)

(assert (=> b!283011 (= e!179573 true)))

(assert (=> b!283011 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139898 mask!3868)))

(declare-datatypes ((Unit!8982 0))(
  ( (Unit!8983) )
))
(declare-fun lt!139896 () Unit!8982)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14123 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8982)

(assert (=> b!283011 (= lt!139896 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!283012 () Bool)

(assert (=> b!283012 (= e!179570 (not e!179573))))

(declare-fun res!146055 () Bool)

(assert (=> b!283012 (=> res!146055 e!179573)))

(assert (=> b!283012 (= res!146055 (or (bvsge startIndex!26 (bvsub (size!7055 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!283012 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!139897 () Unit!8982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8982)

(assert (=> b!283012 (= lt!139897 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!283012 (= (seekEntryOrOpen!0 (select (arr!6703 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6703 a!3325) i!1267 k0!2581) startIndex!26) lt!139898 mask!3868))))

(declare-fun lt!139895 () Unit!8982)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14123 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8982)

(assert (=> b!283012 (= lt!139895 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4424 0))(
  ( (Nil!4421) (Cons!4420 (h!5090 (_ BitVec 64)) (t!9498 List!4424)) )
))
(declare-fun arrayNoDuplicates!0 (array!14123 (_ BitVec 32) List!4424) Bool)

(assert (=> b!283012 (arrayNoDuplicates!0 lt!139898 #b00000000000000000000000000000000 Nil!4421)))

(declare-fun lt!139894 () Unit!8982)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14123 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4424) Unit!8982)

(assert (=> b!283012 (= lt!139894 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4421))))

(declare-fun b!283013 () Bool)

(declare-fun res!146052 () Bool)

(assert (=> b!283013 (=> (not res!146052) (not e!179569))))

(declare-fun arrayContainsKey!0 (array!14123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283013 (= res!146052 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283014 () Bool)

(declare-fun res!146056 () Bool)

(assert (=> b!283014 (=> (not res!146056) (not e!179569))))

(assert (=> b!283014 (= res!146056 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4421))))

(declare-fun b!283015 () Bool)

(declare-fun res!146054 () Bool)

(assert (=> b!283015 (=> (not res!146054) (not e!179569))))

(assert (=> b!283015 (= res!146054 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27306 res!146057) b!283007))

(assert (= (and b!283007 res!146050) b!283015))

(assert (= (and b!283015 res!146054) b!283014))

(assert (= (and b!283014 res!146056) b!283013))

(assert (= (and b!283013 res!146052) b!283009))

(assert (= (and b!283009 res!146053) b!283010))

(assert (= (and b!283010 res!146058) b!283006))

(assert (= (and b!283006 res!146051) b!283008))

(assert (= (and b!283008 res!146049) b!283012))

(assert (= (and b!283012 (not res!146055)) b!283011))

(declare-fun m!297905 () Bool)

(assert (=> b!283006 m!297905))

(declare-fun m!297907 () Bool)

(assert (=> b!283009 m!297907))

(declare-fun m!297909 () Bool)

(assert (=> b!283013 m!297909))

(declare-fun m!297911 () Bool)

(assert (=> b!283012 m!297911))

(declare-fun m!297913 () Bool)

(assert (=> b!283012 m!297913))

(assert (=> b!283012 m!297905))

(declare-fun m!297915 () Bool)

(assert (=> b!283012 m!297915))

(declare-fun m!297917 () Bool)

(assert (=> b!283012 m!297917))

(declare-fun m!297919 () Bool)

(assert (=> b!283012 m!297919))

(declare-fun m!297921 () Bool)

(assert (=> b!283012 m!297921))

(assert (=> b!283012 m!297915))

(declare-fun m!297923 () Bool)

(assert (=> b!283012 m!297923))

(assert (=> b!283012 m!297913))

(declare-fun m!297925 () Bool)

(assert (=> b!283012 m!297925))

(declare-fun m!297927 () Bool)

(assert (=> b!283012 m!297927))

(declare-fun m!297929 () Bool)

(assert (=> b!283015 m!297929))

(declare-fun m!297931 () Bool)

(assert (=> start!27306 m!297931))

(declare-fun m!297933 () Bool)

(assert (=> start!27306 m!297933))

(declare-fun m!297935 () Bool)

(assert (=> b!283014 m!297935))

(declare-fun m!297937 () Bool)

(assert (=> b!283011 m!297937))

(declare-fun m!297939 () Bool)

(assert (=> b!283011 m!297939))

(assert (=> b!283008 m!297915))

(assert (=> b!283008 m!297915))

(declare-fun m!297941 () Bool)

(assert (=> b!283008 m!297941))

(declare-fun m!297943 () Bool)

(assert (=> b!283010 m!297943))

(check-sat (not b!283009) (not start!27306) (not b!283014) (not b!283015) (not b!283012) (not b!283011) (not b!283013) (not b!283008) (not b!283010))
(check-sat)
