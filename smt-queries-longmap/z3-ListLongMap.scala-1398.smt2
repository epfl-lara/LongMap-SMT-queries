; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27242 () Bool)

(assert start!27242)

(declare-fun b!281919 () Bool)

(declare-fun res!145043 () Bool)

(declare-fun e!179048 () Bool)

(assert (=> b!281919 (=> (not res!145043) (not e!179048))))

(declare-datatypes ((array!14049 0))(
  ( (array!14050 (arr!6666 (Array (_ BitVec 32) (_ BitVec 64))) (size!7019 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14049)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281919 (= res!145043 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281920 () Bool)

(declare-fun e!179049 () Bool)

(assert (=> b!281920 (= e!179048 e!179049)))

(declare-fun res!145045 () Bool)

(assert (=> b!281920 (=> (not res!145045) (not e!179049))))

(declare-datatypes ((SeekEntryResult!1823 0))(
  ( (MissingZero!1823 (index!9462 (_ BitVec 32))) (Found!1823 (index!9463 (_ BitVec 32))) (Intermediate!1823 (undefined!2635 Bool) (index!9464 (_ BitVec 32)) (x!27700 (_ BitVec 32))) (Undefined!1823) (MissingVacant!1823 (index!9465 (_ BitVec 32))) )
))
(declare-fun lt!139157 () SeekEntryResult!1823)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281920 (= res!145045 (or (= lt!139157 (MissingZero!1823 i!1267)) (= lt!139157 (MissingVacant!1823 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14049 (_ BitVec 32)) SeekEntryResult!1823)

(assert (=> b!281920 (= lt!139157 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281921 () Bool)

(declare-fun res!145047 () Bool)

(assert (=> b!281921 (=> (not res!145047) (not e!179048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281921 (= res!145047 (validKeyInArray!0 k0!2581))))

(declare-fun b!281922 () Bool)

(declare-fun e!179046 () Bool)

(assert (=> b!281922 (= e!179049 e!179046)))

(declare-fun res!145044 () Bool)

(assert (=> b!281922 (=> (not res!145044) (not e!179046))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281922 (= res!145044 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139158 () array!14049)

(assert (=> b!281922 (= lt!139158 (array!14050 (store (arr!6666 a!3325) i!1267 k0!2581) (size!7019 a!3325)))))

(declare-fun b!281923 () Bool)

(declare-fun res!145041 () Bool)

(assert (=> b!281923 (=> (not res!145041) (not e!179048))))

(assert (=> b!281923 (= res!145041 (and (= (size!7019 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7019 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7019 a!3325))))))

(declare-fun res!145048 () Bool)

(assert (=> start!27242 (=> (not res!145048) (not e!179048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27242 (= res!145048 (validMask!0 mask!3868))))

(assert (=> start!27242 e!179048))

(declare-fun array_inv!4638 (array!14049) Bool)

(assert (=> start!27242 (array_inv!4638 a!3325)))

(assert (=> start!27242 true))

(declare-fun b!281924 () Bool)

(declare-fun res!145040 () Bool)

(assert (=> b!281924 (=> (not res!145040) (not e!179049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14049 (_ BitVec 32)) Bool)

(assert (=> b!281924 (= res!145040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281925 () Bool)

(declare-fun res!145046 () Bool)

(assert (=> b!281925 (=> (not res!145046) (not e!179048))))

(declare-datatypes ((List!4447 0))(
  ( (Nil!4444) (Cons!4443 (h!5113 (_ BitVec 64)) (t!9520 List!4447)) )
))
(declare-fun arrayNoDuplicates!0 (array!14049 (_ BitVec 32) List!4447) Bool)

(assert (=> b!281925 (= res!145046 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4444))))

(declare-fun b!281926 () Bool)

(declare-fun res!145042 () Bool)

(assert (=> b!281926 (=> (not res!145042) (not e!179046))))

(assert (=> b!281926 (= res!145042 (validKeyInArray!0 (select (arr!6666 a!3325) startIndex!26)))))

(declare-fun b!281927 () Bool)

(assert (=> b!281927 (= e!179046 (not true))))

(assert (=> b!281927 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8892 0))(
  ( (Unit!8893) )
))
(declare-fun lt!139161 () Unit!8892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8892)

(assert (=> b!281927 (= lt!139161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!281927 (= (seekEntryOrOpen!0 (select (arr!6666 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6666 a!3325) i!1267 k0!2581) startIndex!26) lt!139158 mask!3868))))

(declare-fun lt!139160 () Unit!8892)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8892)

(assert (=> b!281927 (= lt!139160 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281927 (arrayNoDuplicates!0 lt!139158 #b00000000000000000000000000000000 Nil!4444)))

(declare-fun lt!139159 () Unit!8892)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14049 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4447) Unit!8892)

(assert (=> b!281927 (= lt!139159 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4444))))

(assert (= (and start!27242 res!145048) b!281923))

(assert (= (and b!281923 res!145041) b!281921))

(assert (= (and b!281921 res!145047) b!281925))

(assert (= (and b!281925 res!145046) b!281919))

(assert (= (and b!281919 res!145043) b!281920))

(assert (= (and b!281920 res!145045) b!281924))

(assert (= (and b!281924 res!145040) b!281922))

(assert (= (and b!281922 res!145044) b!281926))

(assert (= (and b!281926 res!145042) b!281927))

(declare-fun m!295919 () Bool)

(assert (=> b!281921 m!295919))

(declare-fun m!295921 () Bool)

(assert (=> start!27242 m!295921))

(declare-fun m!295923 () Bool)

(assert (=> start!27242 m!295923))

(declare-fun m!295925 () Bool)

(assert (=> b!281920 m!295925))

(declare-fun m!295927 () Bool)

(assert (=> b!281925 m!295927))

(declare-fun m!295929 () Bool)

(assert (=> b!281926 m!295929))

(assert (=> b!281926 m!295929))

(declare-fun m!295931 () Bool)

(assert (=> b!281926 m!295931))

(declare-fun m!295933 () Bool)

(assert (=> b!281927 m!295933))

(declare-fun m!295935 () Bool)

(assert (=> b!281927 m!295935))

(declare-fun m!295937 () Bool)

(assert (=> b!281927 m!295937))

(declare-fun m!295939 () Bool)

(assert (=> b!281927 m!295939))

(declare-fun m!295941 () Bool)

(assert (=> b!281927 m!295941))

(assert (=> b!281927 m!295929))

(declare-fun m!295943 () Bool)

(assert (=> b!281927 m!295943))

(assert (=> b!281927 m!295929))

(declare-fun m!295945 () Bool)

(assert (=> b!281927 m!295945))

(assert (=> b!281927 m!295935))

(declare-fun m!295947 () Bool)

(assert (=> b!281927 m!295947))

(declare-fun m!295949 () Bool)

(assert (=> b!281927 m!295949))

(declare-fun m!295951 () Bool)

(assert (=> b!281924 m!295951))

(assert (=> b!281922 m!295939))

(declare-fun m!295953 () Bool)

(assert (=> b!281919 m!295953))

(check-sat (not b!281926) (not b!281920) (not b!281925) (not b!281924) (not start!27242) (not b!281927) (not b!281919) (not b!281921))
(check-sat)
