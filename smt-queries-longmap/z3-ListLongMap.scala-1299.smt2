; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26354 () Bool)

(assert start!26354)

(declare-fun b!273024 () Bool)

(declare-fun e!175038 () Bool)

(assert (=> b!273024 (= e!175038 (not true))))

(declare-datatypes ((array!13440 0))(
  ( (array!13441 (arr!6369 (Array (_ BitVec 32) (_ BitVec 64))) (size!6722 (_ BitVec 32))) )
))
(declare-fun lt!136059 () array!13440)

(declare-fun a!3325 () array!13440)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1526 0))(
  ( (MissingZero!1526 (index!8274 (_ BitVec 32))) (Found!1526 (index!8275 (_ BitVec 32))) (Intermediate!1526 (undefined!2338 Bool) (index!8276 (_ BitVec 32)) (x!26602 (_ BitVec 32))) (Undefined!1526) (MissingVacant!1526 (index!8277 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13440 (_ BitVec 32)) SeekEntryResult!1526)

(assert (=> b!273024 (= (seekEntryOrOpen!0 (select (arr!6369 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6369 a!3325) i!1267 k0!2581) startIndex!26) lt!136059 mask!3868))))

(declare-datatypes ((Unit!8505 0))(
  ( (Unit!8506) )
))
(declare-fun lt!136061 () Unit!8505)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13440 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8505)

(assert (=> b!273024 (= lt!136061 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4150 0))(
  ( (Nil!4147) (Cons!4146 (h!4813 (_ BitVec 64)) (t!9223 List!4150)) )
))
(declare-fun arrayNoDuplicates!0 (array!13440 (_ BitVec 32) List!4150) Bool)

(assert (=> b!273024 (arrayNoDuplicates!0 lt!136059 #b00000000000000000000000000000000 Nil!4147)))

(declare-fun lt!136060 () Unit!8505)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13440 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4150) Unit!8505)

(assert (=> b!273024 (= lt!136060 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4147))))

(declare-fun b!273025 () Bool)

(declare-fun res!137074 () Bool)

(declare-fun e!175035 () Bool)

(assert (=> b!273025 (=> (not res!137074) (not e!175035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273025 (= res!137074 (validKeyInArray!0 k0!2581))))

(declare-fun b!273027 () Bool)

(declare-fun res!137073 () Bool)

(assert (=> b!273027 (=> (not res!137073) (not e!175038))))

(assert (=> b!273027 (= res!137073 (validKeyInArray!0 (select (arr!6369 a!3325) startIndex!26)))))

(declare-fun b!273028 () Bool)

(declare-fun e!175037 () Bool)

(assert (=> b!273028 (= e!175037 e!175038)))

(declare-fun res!137066 () Bool)

(assert (=> b!273028 (=> (not res!137066) (not e!175038))))

(assert (=> b!273028 (= res!137066 (not (= startIndex!26 i!1267)))))

(assert (=> b!273028 (= lt!136059 (array!13441 (store (arr!6369 a!3325) i!1267 k0!2581) (size!6722 a!3325)))))

(declare-fun b!273029 () Bool)

(declare-fun res!137067 () Bool)

(assert (=> b!273029 (=> (not res!137067) (not e!175035))))

(assert (=> b!273029 (= res!137067 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4147))))

(declare-fun b!273030 () Bool)

(declare-fun res!137072 () Bool)

(assert (=> b!273030 (=> (not res!137072) (not e!175035))))

(assert (=> b!273030 (= res!137072 (and (= (size!6722 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6722 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6722 a!3325))))))

(declare-fun b!273031 () Bool)

(declare-fun res!137070 () Bool)

(assert (=> b!273031 (=> (not res!137070) (not e!175037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13440 (_ BitVec 32)) Bool)

(assert (=> b!273031 (= res!137070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273032 () Bool)

(declare-fun res!137068 () Bool)

(assert (=> b!273032 (=> (not res!137068) (not e!175035))))

(declare-fun arrayContainsKey!0 (array!13440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273032 (= res!137068 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!137071 () Bool)

(assert (=> start!26354 (=> (not res!137071) (not e!175035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26354 (= res!137071 (validMask!0 mask!3868))))

(assert (=> start!26354 e!175035))

(declare-fun array_inv!4341 (array!13440) Bool)

(assert (=> start!26354 (array_inv!4341 a!3325)))

(assert (=> start!26354 true))

(declare-fun b!273026 () Bool)

(assert (=> b!273026 (= e!175035 e!175037)))

(declare-fun res!137069 () Bool)

(assert (=> b!273026 (=> (not res!137069) (not e!175037))))

(declare-fun lt!136062 () SeekEntryResult!1526)

(assert (=> b!273026 (= res!137069 (or (= lt!136062 (MissingZero!1526 i!1267)) (= lt!136062 (MissingVacant!1526 i!1267))))))

(assert (=> b!273026 (= lt!136062 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26354 res!137071) b!273030))

(assert (= (and b!273030 res!137072) b!273025))

(assert (= (and b!273025 res!137074) b!273029))

(assert (= (and b!273029 res!137067) b!273032))

(assert (= (and b!273032 res!137068) b!273026))

(assert (= (and b!273026 res!137069) b!273031))

(assert (= (and b!273031 res!137070) b!273028))

(assert (= (and b!273028 res!137066) b!273027))

(assert (= (and b!273027 res!137073) b!273024))

(declare-fun m!287693 () Bool)

(assert (=> b!273025 m!287693))

(declare-fun m!287695 () Bool)

(assert (=> b!273031 m!287695))

(declare-fun m!287697 () Bool)

(assert (=> b!273028 m!287697))

(declare-fun m!287699 () Bool)

(assert (=> b!273032 m!287699))

(declare-fun m!287701 () Bool)

(assert (=> b!273024 m!287701))

(declare-fun m!287703 () Bool)

(assert (=> b!273024 m!287703))

(assert (=> b!273024 m!287701))

(declare-fun m!287705 () Bool)

(assert (=> b!273024 m!287705))

(assert (=> b!273024 m!287697))

(declare-fun m!287707 () Bool)

(assert (=> b!273024 m!287707))

(declare-fun m!287709 () Bool)

(assert (=> b!273024 m!287709))

(declare-fun m!287711 () Bool)

(assert (=> b!273024 m!287711))

(assert (=> b!273024 m!287707))

(declare-fun m!287713 () Bool)

(assert (=> b!273024 m!287713))

(declare-fun m!287715 () Bool)

(assert (=> b!273029 m!287715))

(declare-fun m!287717 () Bool)

(assert (=> start!26354 m!287717))

(declare-fun m!287719 () Bool)

(assert (=> start!26354 m!287719))

(assert (=> b!273027 m!287707))

(assert (=> b!273027 m!287707))

(declare-fun m!287721 () Bool)

(assert (=> b!273027 m!287721))

(declare-fun m!287723 () Bool)

(assert (=> b!273026 m!287723))

(check-sat (not b!273026) (not start!26354) (not b!273024) (not b!273027) (not b!273032) (not b!273031) (not b!273025) (not b!273029))
(check-sat)
