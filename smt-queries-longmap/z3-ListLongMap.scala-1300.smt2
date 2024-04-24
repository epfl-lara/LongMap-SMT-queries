; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26358 () Bool)

(assert start!26358)

(declare-fun b!273299 () Bool)

(declare-fun res!137270 () Bool)

(declare-fun e!175198 () Bool)

(assert (=> b!273299 (=> (not res!137270) (not e!175198))))

(declare-datatypes ((array!13454 0))(
  ( (array!13455 (arr!6376 (Array (_ BitVec 32) (_ BitVec 64))) (size!6728 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13454)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13454 (_ BitVec 32)) Bool)

(assert (=> b!273299 (= res!137270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!137268 () Bool)

(declare-fun e!175196 () Bool)

(assert (=> start!26358 (=> (not res!137268) (not e!175196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26358 (= res!137268 (validMask!0 mask!3868))))

(assert (=> start!26358 e!175196))

(declare-fun array_inv!4326 (array!13454) Bool)

(assert (=> start!26358 (array_inv!4326 a!3325)))

(assert (=> start!26358 true))

(declare-fun b!273300 () Bool)

(assert (=> b!273300 (= e!175196 e!175198)))

(declare-fun res!137271 () Bool)

(assert (=> b!273300 (=> (not res!137271) (not e!175198))))

(declare-datatypes ((SeekEntryResult!1499 0))(
  ( (MissingZero!1499 (index!8166 (_ BitVec 32))) (Found!1499 (index!8167 (_ BitVec 32))) (Intermediate!1499 (undefined!2311 Bool) (index!8168 (_ BitVec 32)) (x!26584 (_ BitVec 32))) (Undefined!1499) (MissingVacant!1499 (index!8169 (_ BitVec 32))) )
))
(declare-fun lt!136340 () SeekEntryResult!1499)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273300 (= res!137271 (or (= lt!136340 (MissingZero!1499 i!1267)) (= lt!136340 (MissingVacant!1499 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13454 (_ BitVec 32)) SeekEntryResult!1499)

(assert (=> b!273300 (= lt!136340 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273301 () Bool)

(declare-fun res!137267 () Bool)

(assert (=> b!273301 (=> (not res!137267) (not e!175196))))

(declare-fun arrayContainsKey!0 (array!13454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273301 (= res!137267 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273302 () Bool)

(declare-fun e!175199 () Bool)

(assert (=> b!273302 (= e!175199 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273302 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8537 0))(
  ( (Unit!8538) )
))
(declare-fun lt!136337 () Unit!8537)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8537)

(assert (=> b!273302 (= lt!136337 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136338 () array!13454)

(assert (=> b!273302 (= (seekEntryOrOpen!0 (select (arr!6376 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6376 a!3325) i!1267 k0!2581) startIndex!26) lt!136338 mask!3868))))

(declare-fun lt!136339 () Unit!8537)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13454 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8537)

(assert (=> b!273302 (= lt!136339 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4097 0))(
  ( (Nil!4094) (Cons!4093 (h!4760 (_ BitVec 64)) (t!9171 List!4097)) )
))
(declare-fun arrayNoDuplicates!0 (array!13454 (_ BitVec 32) List!4097) Bool)

(assert (=> b!273302 (arrayNoDuplicates!0 lt!136338 #b00000000000000000000000000000000 Nil!4094)))

(declare-fun lt!136341 () Unit!8537)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4097) Unit!8537)

(assert (=> b!273302 (= lt!136341 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4094))))

(declare-fun b!273303 () Bool)

(declare-fun res!137269 () Bool)

(assert (=> b!273303 (=> (not res!137269) (not e!175199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273303 (= res!137269 (validKeyInArray!0 (select (arr!6376 a!3325) startIndex!26)))))

(declare-fun b!273304 () Bool)

(declare-fun res!137264 () Bool)

(assert (=> b!273304 (=> (not res!137264) (not e!175196))))

(assert (=> b!273304 (= res!137264 (validKeyInArray!0 k0!2581))))

(declare-fun b!273305 () Bool)

(declare-fun res!137263 () Bool)

(assert (=> b!273305 (=> (not res!137263) (not e!175196))))

(assert (=> b!273305 (= res!137263 (and (= (size!6728 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6728 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6728 a!3325))))))

(declare-fun b!273306 () Bool)

(declare-fun res!137266 () Bool)

(assert (=> b!273306 (=> (not res!137266) (not e!175196))))

(assert (=> b!273306 (= res!137266 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4094))))

(declare-fun b!273307 () Bool)

(assert (=> b!273307 (= e!175198 e!175199)))

(declare-fun res!137265 () Bool)

(assert (=> b!273307 (=> (not res!137265) (not e!175199))))

(assert (=> b!273307 (= res!137265 (not (= startIndex!26 i!1267)))))

(assert (=> b!273307 (= lt!136338 (array!13455 (store (arr!6376 a!3325) i!1267 k0!2581) (size!6728 a!3325)))))

(assert (= (and start!26358 res!137268) b!273305))

(assert (= (and b!273305 res!137263) b!273304))

(assert (= (and b!273304 res!137264) b!273306))

(assert (= (and b!273306 res!137266) b!273301))

(assert (= (and b!273301 res!137267) b!273300))

(assert (= (and b!273300 res!137271) b!273299))

(assert (= (and b!273299 res!137270) b!273307))

(assert (= (and b!273307 res!137265) b!273303))

(assert (= (and b!273303 res!137269) b!273302))

(declare-fun m!288587 () Bool)

(assert (=> b!273303 m!288587))

(assert (=> b!273303 m!288587))

(declare-fun m!288589 () Bool)

(assert (=> b!273303 m!288589))

(declare-fun m!288591 () Bool)

(assert (=> b!273300 m!288591))

(declare-fun m!288593 () Bool)

(assert (=> b!273301 m!288593))

(declare-fun m!288595 () Bool)

(assert (=> b!273306 m!288595))

(declare-fun m!288597 () Bool)

(assert (=> b!273307 m!288597))

(declare-fun m!288599 () Bool)

(assert (=> b!273304 m!288599))

(declare-fun m!288601 () Bool)

(assert (=> start!26358 m!288601))

(declare-fun m!288603 () Bool)

(assert (=> start!26358 m!288603))

(declare-fun m!288605 () Bool)

(assert (=> b!273302 m!288605))

(declare-fun m!288607 () Bool)

(assert (=> b!273302 m!288607))

(assert (=> b!273302 m!288597))

(declare-fun m!288609 () Bool)

(assert (=> b!273302 m!288609))

(declare-fun m!288611 () Bool)

(assert (=> b!273302 m!288611))

(assert (=> b!273302 m!288587))

(declare-fun m!288613 () Bool)

(assert (=> b!273302 m!288613))

(declare-fun m!288615 () Bool)

(assert (=> b!273302 m!288615))

(assert (=> b!273302 m!288607))

(declare-fun m!288617 () Bool)

(assert (=> b!273302 m!288617))

(assert (=> b!273302 m!288587))

(declare-fun m!288619 () Bool)

(assert (=> b!273302 m!288619))

(declare-fun m!288621 () Bool)

(assert (=> b!273299 m!288621))

(check-sat (not b!273300) (not start!26358) (not b!273303) (not b!273301) (not b!273302) (not b!273299) (not b!273304) (not b!273306))
(check-sat)
