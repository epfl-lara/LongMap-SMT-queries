; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26370 () Bool)

(assert start!26370)

(declare-fun b!273461 () Bool)

(declare-fun res!137427 () Bool)

(declare-fun e!175269 () Bool)

(assert (=> b!273461 (=> (not res!137427) (not e!175269))))

(declare-datatypes ((array!13466 0))(
  ( (array!13467 (arr!6382 (Array (_ BitVec 32) (_ BitVec 64))) (size!6734 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13466)

(declare-datatypes ((List!4103 0))(
  ( (Nil!4100) (Cons!4099 (h!4766 (_ BitVec 64)) (t!9177 List!4103)) )
))
(declare-fun arrayNoDuplicates!0 (array!13466 (_ BitVec 32) List!4103) Bool)

(assert (=> b!273461 (= res!137427 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4100))))

(declare-fun b!273462 () Bool)

(declare-fun e!175271 () Bool)

(assert (=> b!273462 (= e!175269 e!175271)))

(declare-fun res!137428 () Bool)

(assert (=> b!273462 (=> (not res!137428) (not e!175271))))

(declare-datatypes ((SeekEntryResult!1505 0))(
  ( (MissingZero!1505 (index!8190 (_ BitVec 32))) (Found!1505 (index!8191 (_ BitVec 32))) (Intermediate!1505 (undefined!2317 Bool) (index!8192 (_ BitVec 32)) (x!26606 (_ BitVec 32))) (Undefined!1505) (MissingVacant!1505 (index!8193 (_ BitVec 32))) )
))
(declare-fun lt!136430 () SeekEntryResult!1505)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273462 (= res!137428 (or (= lt!136430 (MissingZero!1505 i!1267)) (= lt!136430 (MissingVacant!1505 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13466 (_ BitVec 32)) SeekEntryResult!1505)

(assert (=> b!273462 (= lt!136430 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273463 () Bool)

(declare-fun e!175268 () Bool)

(assert (=> b!273463 (= e!175268 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13466 (_ BitVec 32)) Bool)

(assert (=> b!273463 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8549 0))(
  ( (Unit!8550) )
))
(declare-fun lt!136427 () Unit!8549)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8549)

(assert (=> b!273463 (= lt!136427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136428 () array!13466)

(assert (=> b!273463 (= (seekEntryOrOpen!0 (select (arr!6382 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6382 a!3325) i!1267 k0!2581) startIndex!26) lt!136428 mask!3868))))

(declare-fun lt!136429 () Unit!8549)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8549)

(assert (=> b!273463 (= lt!136429 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273463 (arrayNoDuplicates!0 lt!136428 #b00000000000000000000000000000000 Nil!4100)))

(declare-fun lt!136431 () Unit!8549)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13466 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4103) Unit!8549)

(assert (=> b!273463 (= lt!136431 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4100))))

(declare-fun b!273465 () Bool)

(assert (=> b!273465 (= e!175271 e!175268)))

(declare-fun res!137429 () Bool)

(assert (=> b!273465 (=> (not res!137429) (not e!175268))))

(assert (=> b!273465 (= res!137429 (not (= startIndex!26 i!1267)))))

(assert (=> b!273465 (= lt!136428 (array!13467 (store (arr!6382 a!3325) i!1267 k0!2581) (size!6734 a!3325)))))

(declare-fun b!273466 () Bool)

(declare-fun res!137431 () Bool)

(assert (=> b!273466 (=> (not res!137431) (not e!175269))))

(declare-fun arrayContainsKey!0 (array!13466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273466 (= res!137431 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273467 () Bool)

(declare-fun res!137430 () Bool)

(assert (=> b!273467 (=> (not res!137430) (not e!175268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273467 (= res!137430 (validKeyInArray!0 (select (arr!6382 a!3325) startIndex!26)))))

(declare-fun b!273468 () Bool)

(declare-fun res!137426 () Bool)

(assert (=> b!273468 (=> (not res!137426) (not e!175269))))

(assert (=> b!273468 (= res!137426 (and (= (size!6734 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6734 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6734 a!3325))))))

(declare-fun b!273469 () Bool)

(declare-fun res!137432 () Bool)

(assert (=> b!273469 (=> (not res!137432) (not e!175271))))

(assert (=> b!273469 (= res!137432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273464 () Bool)

(declare-fun res!137425 () Bool)

(assert (=> b!273464 (=> (not res!137425) (not e!175269))))

(assert (=> b!273464 (= res!137425 (validKeyInArray!0 k0!2581))))

(declare-fun res!137433 () Bool)

(assert (=> start!26370 (=> (not res!137433) (not e!175269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26370 (= res!137433 (validMask!0 mask!3868))))

(assert (=> start!26370 e!175269))

(declare-fun array_inv!4332 (array!13466) Bool)

(assert (=> start!26370 (array_inv!4332 a!3325)))

(assert (=> start!26370 true))

(assert (= (and start!26370 res!137433) b!273468))

(assert (= (and b!273468 res!137426) b!273464))

(assert (= (and b!273464 res!137425) b!273461))

(assert (= (and b!273461 res!137427) b!273466))

(assert (= (and b!273466 res!137431) b!273462))

(assert (= (and b!273462 res!137428) b!273469))

(assert (= (and b!273469 res!137432) b!273465))

(assert (= (and b!273465 res!137429) b!273467))

(assert (= (and b!273467 res!137430) b!273463))

(declare-fun m!288803 () Bool)

(assert (=> b!273465 m!288803))

(declare-fun m!288805 () Bool)

(assert (=> start!26370 m!288805))

(declare-fun m!288807 () Bool)

(assert (=> start!26370 m!288807))

(declare-fun m!288809 () Bool)

(assert (=> b!273462 m!288809))

(declare-fun m!288811 () Bool)

(assert (=> b!273464 m!288811))

(declare-fun m!288813 () Bool)

(assert (=> b!273469 m!288813))

(declare-fun m!288815 () Bool)

(assert (=> b!273467 m!288815))

(assert (=> b!273467 m!288815))

(declare-fun m!288817 () Bool)

(assert (=> b!273467 m!288817))

(declare-fun m!288819 () Bool)

(assert (=> b!273461 m!288819))

(declare-fun m!288821 () Bool)

(assert (=> b!273463 m!288821))

(declare-fun m!288823 () Bool)

(assert (=> b!273463 m!288823))

(assert (=> b!273463 m!288803))

(declare-fun m!288825 () Bool)

(assert (=> b!273463 m!288825))

(assert (=> b!273463 m!288815))

(declare-fun m!288827 () Bool)

(assert (=> b!273463 m!288827))

(declare-fun m!288829 () Bool)

(assert (=> b!273463 m!288829))

(assert (=> b!273463 m!288823))

(declare-fun m!288831 () Bool)

(assert (=> b!273463 m!288831))

(declare-fun m!288833 () Bool)

(assert (=> b!273463 m!288833))

(assert (=> b!273463 m!288815))

(declare-fun m!288835 () Bool)

(assert (=> b!273463 m!288835))

(declare-fun m!288837 () Bool)

(assert (=> b!273466 m!288837))

(check-sat (not b!273461) (not b!273462) (not start!26370) (not b!273464) (not b!273469) (not b!273463) (not b!273466) (not b!273467))
(check-sat)
