; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26394 () Bool)

(assert start!26394)

(declare-fun b!273786 () Bool)

(declare-fun e!175414 () Bool)

(assert (=> b!273786 (= e!175414 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13490 0))(
  ( (array!13491 (arr!6394 (Array (_ BitVec 32) (_ BitVec 64))) (size!6746 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13490)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13490 (_ BitVec 32)) Bool)

(assert (=> b!273786 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8573 0))(
  ( (Unit!8574) )
))
(declare-fun lt!136607 () Unit!8573)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8573)

(assert (=> b!273786 (= lt!136607 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136610 () array!13490)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1517 0))(
  ( (MissingZero!1517 (index!8238 (_ BitVec 32))) (Found!1517 (index!8239 (_ BitVec 32))) (Intermediate!1517 (undefined!2329 Bool) (index!8240 (_ BitVec 32)) (x!26650 (_ BitVec 32))) (Undefined!1517) (MissingVacant!1517 (index!8241 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13490 (_ BitVec 32)) SeekEntryResult!1517)

(assert (=> b!273786 (= (seekEntryOrOpen!0 (select (arr!6394 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6394 a!3325) i!1267 k0!2581) startIndex!26) lt!136610 mask!3868))))

(declare-fun lt!136609 () Unit!8573)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8573)

(assert (=> b!273786 (= lt!136609 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4115 0))(
  ( (Nil!4112) (Cons!4111 (h!4778 (_ BitVec 64)) (t!9189 List!4115)) )
))
(declare-fun arrayNoDuplicates!0 (array!13490 (_ BitVec 32) List!4115) Bool)

(assert (=> b!273786 (arrayNoDuplicates!0 lt!136610 #b00000000000000000000000000000000 Nil!4112)))

(declare-fun lt!136608 () Unit!8573)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13490 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4115) Unit!8573)

(assert (=> b!273786 (= lt!136608 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4112))))

(declare-fun b!273787 () Bool)

(declare-fun res!137750 () Bool)

(declare-fun e!175415 () Bool)

(assert (=> b!273787 (=> (not res!137750) (not e!175415))))

(assert (=> b!273787 (= res!137750 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4112))))

(declare-fun b!273788 () Bool)

(declare-fun res!137753 () Bool)

(assert (=> b!273788 (=> (not res!137753) (not e!175415))))

(assert (=> b!273788 (= res!137753 (and (= (size!6746 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6746 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6746 a!3325))))))

(declare-fun b!273789 () Bool)

(declare-fun res!137752 () Bool)

(declare-fun e!175413 () Bool)

(assert (=> b!273789 (=> (not res!137752) (not e!175413))))

(assert (=> b!273789 (= res!137752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273790 () Bool)

(declare-fun res!137757 () Bool)

(assert (=> b!273790 (=> (not res!137757) (not e!175414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273790 (= res!137757 (validKeyInArray!0 (select (arr!6394 a!3325) startIndex!26)))))

(declare-fun b!273791 () Bool)

(declare-fun res!137755 () Bool)

(assert (=> b!273791 (=> (not res!137755) (not e!175415))))

(declare-fun arrayContainsKey!0 (array!13490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273791 (= res!137755 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273792 () Bool)

(assert (=> b!273792 (= e!175413 e!175414)))

(declare-fun res!137749 () Bool)

(assert (=> b!273792 (=> (not res!137749) (not e!175414))))

(assert (=> b!273792 (= res!137749 (not (= startIndex!26 i!1267)))))

(assert (=> b!273792 (= lt!136610 (array!13491 (store (arr!6394 a!3325) i!1267 k0!2581) (size!6746 a!3325)))))

(declare-fun b!273793 () Bool)

(assert (=> b!273793 (= e!175415 e!175413)))

(declare-fun res!137754 () Bool)

(assert (=> b!273793 (=> (not res!137754) (not e!175413))))

(declare-fun lt!136611 () SeekEntryResult!1517)

(assert (=> b!273793 (= res!137754 (or (= lt!136611 (MissingZero!1517 i!1267)) (= lt!136611 (MissingVacant!1517 i!1267))))))

(assert (=> b!273793 (= lt!136611 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!137756 () Bool)

(assert (=> start!26394 (=> (not res!137756) (not e!175415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26394 (= res!137756 (validMask!0 mask!3868))))

(assert (=> start!26394 e!175415))

(declare-fun array_inv!4344 (array!13490) Bool)

(assert (=> start!26394 (array_inv!4344 a!3325)))

(assert (=> start!26394 true))

(declare-fun b!273785 () Bool)

(declare-fun res!137751 () Bool)

(assert (=> b!273785 (=> (not res!137751) (not e!175415))))

(assert (=> b!273785 (= res!137751 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26394 res!137756) b!273788))

(assert (= (and b!273788 res!137753) b!273785))

(assert (= (and b!273785 res!137751) b!273787))

(assert (= (and b!273787 res!137750) b!273791))

(assert (= (and b!273791 res!137755) b!273793))

(assert (= (and b!273793 res!137754) b!273789))

(assert (= (and b!273789 res!137752) b!273792))

(assert (= (and b!273792 res!137749) b!273790))

(assert (= (and b!273790 res!137757) b!273786))

(declare-fun m!289235 () Bool)

(assert (=> b!273790 m!289235))

(assert (=> b!273790 m!289235))

(declare-fun m!289237 () Bool)

(assert (=> b!273790 m!289237))

(declare-fun m!289239 () Bool)

(assert (=> b!273791 m!289239))

(declare-fun m!289241 () Bool)

(assert (=> b!273793 m!289241))

(declare-fun m!289243 () Bool)

(assert (=> b!273787 m!289243))

(declare-fun m!289245 () Bool)

(assert (=> b!273789 m!289245))

(declare-fun m!289247 () Bool)

(assert (=> b!273786 m!289247))

(declare-fun m!289249 () Bool)

(assert (=> b!273786 m!289249))

(declare-fun m!289251 () Bool)

(assert (=> b!273786 m!289251))

(declare-fun m!289253 () Bool)

(assert (=> b!273786 m!289253))

(assert (=> b!273786 m!289249))

(declare-fun m!289255 () Bool)

(assert (=> b!273786 m!289255))

(assert (=> b!273786 m!289235))

(declare-fun m!289257 () Bool)

(assert (=> b!273786 m!289257))

(declare-fun m!289259 () Bool)

(assert (=> b!273786 m!289259))

(declare-fun m!289261 () Bool)

(assert (=> b!273786 m!289261))

(assert (=> b!273786 m!289235))

(declare-fun m!289263 () Bool)

(assert (=> b!273786 m!289263))

(declare-fun m!289265 () Bool)

(assert (=> start!26394 m!289265))

(declare-fun m!289267 () Bool)

(assert (=> start!26394 m!289267))

(assert (=> b!273792 m!289251))

(declare-fun m!289269 () Bool)

(assert (=> b!273785 m!289269))

(check-sat (not b!273790) (not b!273793) (not b!273786) (not start!26394) (not b!273787) (not b!273789) (not b!273791) (not b!273785))
(check-sat)
