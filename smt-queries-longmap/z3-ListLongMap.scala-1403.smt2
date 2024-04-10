; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27272 () Bool)

(assert start!27272)

(declare-fun b!282498 () Bool)

(declare-fun e!179341 () Bool)

(assert (=> b!282498 (= e!179341 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14090 0))(
  ( (array!14091 (arr!6687 (Array (_ BitVec 32) (_ BitVec 64))) (size!7039 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14090)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14090 (_ BitVec 32)) Bool)

(assert (=> b!282498 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8974 0))(
  ( (Unit!8975) )
))
(declare-fun lt!139580 () Unit!8974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8974)

(assert (=> b!282498 (= lt!139580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139581 () array!14090)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1845 0))(
  ( (MissingZero!1845 (index!9550 (_ BitVec 32))) (Found!1845 (index!9551 (_ BitVec 32))) (Intermediate!1845 (undefined!2657 Bool) (index!9552 (_ BitVec 32)) (x!27763 (_ BitVec 32))) (Undefined!1845) (MissingVacant!1845 (index!9553 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14090 (_ BitVec 32)) SeekEntryResult!1845)

(assert (=> b!282498 (= (seekEntryOrOpen!0 (select (arr!6687 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6687 a!3325) i!1267 k0!2581) startIndex!26) lt!139581 mask!3868))))

(declare-fun lt!139578 () Unit!8974)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14090 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8974)

(assert (=> b!282498 (= lt!139578 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4495 0))(
  ( (Nil!4492) (Cons!4491 (h!5161 (_ BitVec 64)) (t!9577 List!4495)) )
))
(declare-fun arrayNoDuplicates!0 (array!14090 (_ BitVec 32) List!4495) Bool)

(assert (=> b!282498 (arrayNoDuplicates!0 lt!139581 #b00000000000000000000000000000000 Nil!4492)))

(declare-fun lt!139582 () Unit!8974)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14090 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4495) Unit!8974)

(assert (=> b!282498 (= lt!139582 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4492))))

(declare-fun b!282500 () Bool)

(declare-fun e!179342 () Bool)

(declare-fun e!179340 () Bool)

(assert (=> b!282500 (= e!179342 e!179340)))

(declare-fun res!145575 () Bool)

(assert (=> b!282500 (=> (not res!145575) (not e!179340))))

(declare-fun lt!139579 () SeekEntryResult!1845)

(assert (=> b!282500 (= res!145575 (or (= lt!139579 (MissingZero!1845 i!1267)) (= lt!139579 (MissingVacant!1845 i!1267))))))

(assert (=> b!282500 (= lt!139579 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282501 () Bool)

(declare-fun res!145571 () Bool)

(assert (=> b!282501 (=> (not res!145571) (not e!179341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282501 (= res!145571 (validKeyInArray!0 (select (arr!6687 a!3325) startIndex!26)))))

(declare-fun b!282502 () Bool)

(declare-fun res!145574 () Bool)

(assert (=> b!282502 (=> (not res!145574) (not e!179342))))

(assert (=> b!282502 (= res!145574 (and (= (size!7039 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7039 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7039 a!3325))))))

(declare-fun b!282503 () Bool)

(declare-fun res!145572 () Bool)

(assert (=> b!282503 (=> (not res!145572) (not e!179340))))

(assert (=> b!282503 (= res!145572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282504 () Bool)

(declare-fun res!145567 () Bool)

(assert (=> b!282504 (=> (not res!145567) (not e!179342))))

(assert (=> b!282504 (= res!145567 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4492))))

(declare-fun b!282499 () Bool)

(assert (=> b!282499 (= e!179340 e!179341)))

(declare-fun res!145570 () Bool)

(assert (=> b!282499 (=> (not res!145570) (not e!179341))))

(assert (=> b!282499 (= res!145570 (not (= startIndex!26 i!1267)))))

(assert (=> b!282499 (= lt!139581 (array!14091 (store (arr!6687 a!3325) i!1267 k0!2581) (size!7039 a!3325)))))

(declare-fun res!145569 () Bool)

(assert (=> start!27272 (=> (not res!145569) (not e!179342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27272 (= res!145569 (validMask!0 mask!3868))))

(assert (=> start!27272 e!179342))

(declare-fun array_inv!4650 (array!14090) Bool)

(assert (=> start!27272 (array_inv!4650 a!3325)))

(assert (=> start!27272 true))

(declare-fun b!282505 () Bool)

(declare-fun res!145568 () Bool)

(assert (=> b!282505 (=> (not res!145568) (not e!179342))))

(assert (=> b!282505 (= res!145568 (validKeyInArray!0 k0!2581))))

(declare-fun b!282506 () Bool)

(declare-fun res!145573 () Bool)

(assert (=> b!282506 (=> (not res!145573) (not e!179342))))

(declare-fun arrayContainsKey!0 (array!14090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282506 (= res!145573 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27272 res!145569) b!282502))

(assert (= (and b!282502 res!145574) b!282505))

(assert (= (and b!282505 res!145568) b!282504))

(assert (= (and b!282504 res!145567) b!282506))

(assert (= (and b!282506 res!145573) b!282500))

(assert (= (and b!282500 res!145575) b!282503))

(assert (= (and b!282503 res!145572) b!282499))

(assert (= (and b!282499 res!145570) b!282501))

(assert (= (and b!282501 res!145571) b!282498))

(declare-fun m!297087 () Bool)

(assert (=> b!282506 m!297087))

(declare-fun m!297089 () Bool)

(assert (=> start!27272 m!297089))

(declare-fun m!297091 () Bool)

(assert (=> start!27272 m!297091))

(declare-fun m!297093 () Bool)

(assert (=> b!282505 m!297093))

(declare-fun m!297095 () Bool)

(assert (=> b!282504 m!297095))

(declare-fun m!297097 () Bool)

(assert (=> b!282498 m!297097))

(declare-fun m!297099 () Bool)

(assert (=> b!282498 m!297099))

(declare-fun m!297101 () Bool)

(assert (=> b!282498 m!297101))

(assert (=> b!282498 m!297099))

(declare-fun m!297103 () Bool)

(assert (=> b!282498 m!297103))

(declare-fun m!297105 () Bool)

(assert (=> b!282498 m!297105))

(declare-fun m!297107 () Bool)

(assert (=> b!282498 m!297107))

(declare-fun m!297109 () Bool)

(assert (=> b!282498 m!297109))

(declare-fun m!297111 () Bool)

(assert (=> b!282498 m!297111))

(declare-fun m!297113 () Bool)

(assert (=> b!282498 m!297113))

(assert (=> b!282498 m!297109))

(declare-fun m!297115 () Bool)

(assert (=> b!282498 m!297115))

(declare-fun m!297117 () Bool)

(assert (=> b!282503 m!297117))

(declare-fun m!297119 () Bool)

(assert (=> b!282500 m!297119))

(assert (=> b!282499 m!297105))

(assert (=> b!282501 m!297109))

(assert (=> b!282501 m!297109))

(declare-fun m!297121 () Bool)

(assert (=> b!282501 m!297121))

(check-sat (not b!282500) (not start!27272) (not b!282503) (not b!282501) (not b!282505) (not b!282498) (not b!282506) (not b!282504))
(check-sat)
