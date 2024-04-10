; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26412 () Bool)

(assert start!26412)

(declare-fun b!273981 () Bool)

(declare-fun res!137973 () Bool)

(declare-fun e!175498 () Bool)

(assert (=> b!273981 (=> (not res!137973) (not e!175498))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273981 (= res!137973 (validKeyInArray!0 k!2581))))

(declare-fun b!273982 () Bool)

(declare-fun res!137979 () Bool)

(assert (=> b!273982 (=> (not res!137979) (not e!175498))))

(declare-datatypes ((array!13509 0))(
  ( (array!13510 (arr!6404 (Array (_ BitVec 32) (_ BitVec 64))) (size!6756 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13509)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273982 (= res!137979 (and (= (size!6756 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6756 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6756 a!3325))))))

(declare-fun b!273983 () Bool)

(declare-fun res!137971 () Bool)

(assert (=> b!273983 (=> (not res!137971) (not e!175498))))

(declare-fun arrayContainsKey!0 (array!13509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273983 (= res!137971 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273984 () Bool)

(declare-fun res!137976 () Bool)

(assert (=> b!273984 (=> (not res!137976) (not e!175498))))

(declare-datatypes ((List!4212 0))(
  ( (Nil!4209) (Cons!4208 (h!4875 (_ BitVec 64)) (t!9294 List!4212)) )
))
(declare-fun arrayNoDuplicates!0 (array!13509 (_ BitVec 32) List!4212) Bool)

(assert (=> b!273984 (= res!137976 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4209))))

(declare-fun b!273985 () Bool)

(declare-fun res!137978 () Bool)

(declare-fun e!175497 () Bool)

(assert (=> b!273985 (=> (not res!137978) (not e!175497))))

(assert (=> b!273985 (= res!137978 (validKeyInArray!0 (select (arr!6404 a!3325) startIndex!26)))))

(declare-fun b!273986 () Bool)

(assert (=> b!273986 (= e!175497 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13509 (_ BitVec 32)) Bool)

(assert (=> b!273986 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8611 0))(
  ( (Unit!8612) )
))
(declare-fun lt!136686 () Unit!8611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8611)

(assert (=> b!273986 (= lt!136686 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136683 () array!13509)

(declare-datatypes ((SeekEntryResult!1562 0))(
  ( (MissingZero!1562 (index!8418 (_ BitVec 32))) (Found!1562 (index!8419 (_ BitVec 32))) (Intermediate!1562 (undefined!2374 Bool) (index!8420 (_ BitVec 32)) (x!26719 (_ BitVec 32))) (Undefined!1562) (MissingVacant!1562 (index!8421 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13509 (_ BitVec 32)) SeekEntryResult!1562)

(assert (=> b!273986 (= (seekEntryOrOpen!0 (select (arr!6404 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6404 a!3325) i!1267 k!2581) startIndex!26) lt!136683 mask!3868))))

(declare-fun lt!136685 () Unit!8611)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8611)

(assert (=> b!273986 (= lt!136685 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273986 (arrayNoDuplicates!0 lt!136683 #b00000000000000000000000000000000 Nil!4209)))

(declare-fun lt!136687 () Unit!8611)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13509 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4212) Unit!8611)

(assert (=> b!273986 (= lt!136687 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4209))))

(declare-fun b!273987 () Bool)

(declare-fun e!175499 () Bool)

(assert (=> b!273987 (= e!175499 e!175497)))

(declare-fun res!137977 () Bool)

(assert (=> b!273987 (=> (not res!137977) (not e!175497))))

(assert (=> b!273987 (= res!137977 (not (= startIndex!26 i!1267)))))

(assert (=> b!273987 (= lt!136683 (array!13510 (store (arr!6404 a!3325) i!1267 k!2581) (size!6756 a!3325)))))

(declare-fun b!273988 () Bool)

(declare-fun res!137974 () Bool)

(assert (=> b!273988 (=> (not res!137974) (not e!175499))))

(assert (=> b!273988 (= res!137974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!137975 () Bool)

(assert (=> start!26412 (=> (not res!137975) (not e!175498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26412 (= res!137975 (validMask!0 mask!3868))))

(assert (=> start!26412 e!175498))

(declare-fun array_inv!4367 (array!13509) Bool)

(assert (=> start!26412 (array_inv!4367 a!3325)))

(assert (=> start!26412 true))

(declare-fun b!273989 () Bool)

(assert (=> b!273989 (= e!175498 e!175499)))

(declare-fun res!137972 () Bool)

(assert (=> b!273989 (=> (not res!137972) (not e!175499))))

(declare-fun lt!136684 () SeekEntryResult!1562)

(assert (=> b!273989 (= res!137972 (or (= lt!136684 (MissingZero!1562 i!1267)) (= lt!136684 (MissingVacant!1562 i!1267))))))

(assert (=> b!273989 (= lt!136684 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26412 res!137975) b!273982))

(assert (= (and b!273982 res!137979) b!273981))

(assert (= (and b!273981 res!137973) b!273984))

(assert (= (and b!273984 res!137976) b!273983))

(assert (= (and b!273983 res!137971) b!273989))

(assert (= (and b!273989 res!137972) b!273988))

(assert (= (and b!273988 res!137974) b!273987))

(assert (= (and b!273987 res!137977) b!273985))

(assert (= (and b!273985 res!137978) b!273986))

(declare-fun m!289353 () Bool)

(assert (=> b!273987 m!289353))

(declare-fun m!289355 () Bool)

(assert (=> start!26412 m!289355))

(declare-fun m!289357 () Bool)

(assert (=> start!26412 m!289357))

(declare-fun m!289359 () Bool)

(assert (=> b!273988 m!289359))

(declare-fun m!289361 () Bool)

(assert (=> b!273981 m!289361))

(declare-fun m!289363 () Bool)

(assert (=> b!273989 m!289363))

(declare-fun m!289365 () Bool)

(assert (=> b!273984 m!289365))

(declare-fun m!289367 () Bool)

(assert (=> b!273986 m!289367))

(declare-fun m!289369 () Bool)

(assert (=> b!273986 m!289369))

(declare-fun m!289371 () Bool)

(assert (=> b!273986 m!289371))

(assert (=> b!273986 m!289353))

(declare-fun m!289373 () Bool)

(assert (=> b!273986 m!289373))

(declare-fun m!289375 () Bool)

(assert (=> b!273986 m!289375))

(declare-fun m!289377 () Bool)

(assert (=> b!273986 m!289377))

(declare-fun m!289379 () Bool)

(assert (=> b!273986 m!289379))

(declare-fun m!289381 () Bool)

(assert (=> b!273986 m!289381))

(assert (=> b!273986 m!289379))

(assert (=> b!273986 m!289371))

(declare-fun m!289383 () Bool)

(assert (=> b!273986 m!289383))

(assert (=> b!273985 m!289379))

(assert (=> b!273985 m!289379))

(declare-fun m!289385 () Bool)

(assert (=> b!273985 m!289385))

(declare-fun m!289387 () Bool)

(assert (=> b!273983 m!289387))

(push 1)

