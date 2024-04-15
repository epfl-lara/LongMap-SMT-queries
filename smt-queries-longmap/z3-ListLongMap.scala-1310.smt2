; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26420 () Bool)

(assert start!26420)

(declare-fun b!273915 () Bool)

(declare-fun res!137965 () Bool)

(declare-fun e!175434 () Bool)

(assert (=> b!273915 (=> (not res!137965) (not e!175434))))

(declare-datatypes ((array!13506 0))(
  ( (array!13507 (arr!6402 (Array (_ BitVec 32) (_ BitVec 64))) (size!6755 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13506)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273915 (= res!137965 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273916 () Bool)

(declare-fun res!137962 () Bool)

(assert (=> b!273916 (=> (not res!137962) (not e!175434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273916 (= res!137962 (validKeyInArray!0 k0!2581))))

(declare-fun b!273917 () Bool)

(declare-fun e!175432 () Bool)

(assert (=> b!273917 (= e!175434 e!175432)))

(declare-fun res!137964 () Bool)

(assert (=> b!273917 (=> (not res!137964) (not e!175432))))

(declare-datatypes ((SeekEntryResult!1559 0))(
  ( (MissingZero!1559 (index!8406 (_ BitVec 32))) (Found!1559 (index!8407 (_ BitVec 32))) (Intermediate!1559 (undefined!2371 Bool) (index!8408 (_ BitVec 32)) (x!26723 (_ BitVec 32))) (Undefined!1559) (MissingVacant!1559 (index!8409 (_ BitVec 32))) )
))
(declare-fun lt!136548 () SeekEntryResult!1559)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273917 (= res!137964 (or (= lt!136548 (MissingZero!1559 i!1267)) (= lt!136548 (MissingVacant!1559 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13506 (_ BitVec 32)) SeekEntryResult!1559)

(assert (=> b!273917 (= lt!136548 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!137957 () Bool)

(assert (=> start!26420 (=> (not res!137957) (not e!175434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26420 (= res!137957 (validMask!0 mask!3868))))

(assert (=> start!26420 e!175434))

(declare-fun array_inv!4374 (array!13506) Bool)

(assert (=> start!26420 (array_inv!4374 a!3325)))

(assert (=> start!26420 true))

(declare-fun b!273918 () Bool)

(declare-fun res!137960 () Bool)

(assert (=> b!273918 (=> (not res!137960) (not e!175432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13506 (_ BitVec 32)) Bool)

(assert (=> b!273918 (= res!137960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273919 () Bool)

(declare-fun res!137959 () Bool)

(assert (=> b!273919 (=> (not res!137959) (not e!175434))))

(declare-datatypes ((List!4183 0))(
  ( (Nil!4180) (Cons!4179 (h!4846 (_ BitVec 64)) (t!9256 List!4183)) )
))
(declare-fun arrayNoDuplicates!0 (array!13506 (_ BitVec 32) List!4183) Bool)

(assert (=> b!273919 (= res!137959 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4180))))

(declare-fun b!273920 () Bool)

(declare-fun e!175431 () Bool)

(assert (=> b!273920 (= e!175431 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273920 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8571 0))(
  ( (Unit!8572) )
))
(declare-fun lt!136549 () Unit!8571)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8571)

(assert (=> b!273920 (= lt!136549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136551 () array!13506)

(assert (=> b!273920 (= (seekEntryOrOpen!0 (select (arr!6402 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6402 a!3325) i!1267 k0!2581) startIndex!26) lt!136551 mask!3868))))

(declare-fun lt!136550 () Unit!8571)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8571)

(assert (=> b!273920 (= lt!136550 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273920 (arrayNoDuplicates!0 lt!136551 #b00000000000000000000000000000000 Nil!4180)))

(declare-fun lt!136547 () Unit!8571)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13506 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4183) Unit!8571)

(assert (=> b!273920 (= lt!136547 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4180))))

(declare-fun b!273921 () Bool)

(assert (=> b!273921 (= e!175432 e!175431)))

(declare-fun res!137958 () Bool)

(assert (=> b!273921 (=> (not res!137958) (not e!175431))))

(assert (=> b!273921 (= res!137958 (not (= startIndex!26 i!1267)))))

(assert (=> b!273921 (= lt!136551 (array!13507 (store (arr!6402 a!3325) i!1267 k0!2581) (size!6755 a!3325)))))

(declare-fun b!273922 () Bool)

(declare-fun res!137963 () Bool)

(assert (=> b!273922 (=> (not res!137963) (not e!175431))))

(assert (=> b!273922 (= res!137963 (validKeyInArray!0 (select (arr!6402 a!3325) startIndex!26)))))

(declare-fun b!273923 () Bool)

(declare-fun res!137961 () Bool)

(assert (=> b!273923 (=> (not res!137961) (not e!175434))))

(assert (=> b!273923 (= res!137961 (and (= (size!6755 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6755 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6755 a!3325))))))

(assert (= (and start!26420 res!137957) b!273923))

(assert (= (and b!273923 res!137961) b!273916))

(assert (= (and b!273916 res!137962) b!273919))

(assert (= (and b!273919 res!137959) b!273915))

(assert (= (and b!273915 res!137965) b!273917))

(assert (= (and b!273917 res!137964) b!273918))

(assert (= (and b!273918 res!137960) b!273921))

(assert (= (and b!273921 res!137958) b!273922))

(assert (= (and b!273922 res!137963) b!273920))

(declare-fun m!288869 () Bool)

(assert (=> b!273918 m!288869))

(declare-fun m!288871 () Bool)

(assert (=> start!26420 m!288871))

(declare-fun m!288873 () Bool)

(assert (=> start!26420 m!288873))

(declare-fun m!288875 () Bool)

(assert (=> b!273919 m!288875))

(declare-fun m!288877 () Bool)

(assert (=> b!273916 m!288877))

(declare-fun m!288879 () Bool)

(assert (=> b!273920 m!288879))

(declare-fun m!288881 () Bool)

(assert (=> b!273920 m!288881))

(declare-fun m!288883 () Bool)

(assert (=> b!273920 m!288883))

(declare-fun m!288885 () Bool)

(assert (=> b!273920 m!288885))

(declare-fun m!288887 () Bool)

(assert (=> b!273920 m!288887))

(declare-fun m!288889 () Bool)

(assert (=> b!273920 m!288889))

(assert (=> b!273920 m!288881))

(declare-fun m!288891 () Bool)

(assert (=> b!273920 m!288891))

(assert (=> b!273920 m!288887))

(declare-fun m!288893 () Bool)

(assert (=> b!273920 m!288893))

(declare-fun m!288895 () Bool)

(assert (=> b!273920 m!288895))

(declare-fun m!288897 () Bool)

(assert (=> b!273920 m!288897))

(declare-fun m!288899 () Bool)

(assert (=> b!273915 m!288899))

(assert (=> b!273921 m!288883))

(assert (=> b!273922 m!288887))

(assert (=> b!273922 m!288887))

(declare-fun m!288901 () Bool)

(assert (=> b!273922 m!288901))

(declare-fun m!288903 () Bool)

(assert (=> b!273917 m!288903))

(check-sat (not start!26420) (not b!273916) (not b!273920) (not b!273918) (not b!273922) (not b!273919) (not b!273915) (not b!273917))
(check-sat)
