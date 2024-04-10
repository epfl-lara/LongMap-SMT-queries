; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26446 () Bool)

(assert start!26446)

(declare-fun res!138460 () Bool)

(declare-fun e!175728 () Bool)

(assert (=> start!26446 (=> (not res!138460) (not e!175728))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26446 (= res!138460 (validMask!0 mask!3868))))

(assert (=> start!26446 e!175728))

(declare-datatypes ((array!13543 0))(
  ( (array!13544 (arr!6421 (Array (_ BitVec 32) (_ BitVec 64))) (size!6773 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13543)

(declare-fun array_inv!4384 (array!13543) Bool)

(assert (=> start!26446 (array_inv!4384 a!3325)))

(assert (=> start!26446 true))

(declare-fun b!274466 () Bool)

(declare-fun e!175727 () Bool)

(assert (=> b!274466 (= e!175728 e!175727)))

(declare-fun res!138461 () Bool)

(assert (=> b!274466 (=> (not res!138461) (not e!175727))))

(declare-datatypes ((SeekEntryResult!1579 0))(
  ( (MissingZero!1579 (index!8486 (_ BitVec 32))) (Found!1579 (index!8487 (_ BitVec 32))) (Intermediate!1579 (undefined!2391 Bool) (index!8488 (_ BitVec 32)) (x!26776 (_ BitVec 32))) (Undefined!1579) (MissingVacant!1579 (index!8489 (_ BitVec 32))) )
))
(declare-fun lt!136969 () SeekEntryResult!1579)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274466 (= res!138461 (or (= lt!136969 (MissingZero!1579 i!1267)) (= lt!136969 (MissingVacant!1579 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13543 (_ BitVec 32)) SeekEntryResult!1579)

(assert (=> b!274466 (= lt!136969 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274467 () Bool)

(declare-fun res!138465 () Bool)

(assert (=> b!274467 (=> (not res!138465) (not e!175728))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274467 (= res!138465 (and (= (size!6773 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6773 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6773 a!3325))))))

(declare-fun b!274468 () Bool)

(declare-fun res!138456 () Bool)

(assert (=> b!274468 (=> (not res!138456) (not e!175728))))

(declare-datatypes ((List!4229 0))(
  ( (Nil!4226) (Cons!4225 (h!4892 (_ BitVec 64)) (t!9311 List!4229)) )
))
(declare-fun arrayNoDuplicates!0 (array!13543 (_ BitVec 32) List!4229) Bool)

(assert (=> b!274468 (= res!138456 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4226))))

(declare-fun b!274469 () Bool)

(declare-fun res!138457 () Bool)

(declare-fun e!175726 () Bool)

(assert (=> b!274469 (=> (not res!138457) (not e!175726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274469 (= res!138457 (validKeyInArray!0 (select (arr!6421 a!3325) startIndex!26)))))

(declare-fun b!274470 () Bool)

(declare-fun res!138464 () Bool)

(assert (=> b!274470 (=> (not res!138464) (not e!175728))))

(declare-fun arrayContainsKey!0 (array!13543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274470 (= res!138464 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274471 () Bool)

(assert (=> b!274471 (= e!175727 e!175726)))

(declare-fun res!138459 () Bool)

(assert (=> b!274471 (=> (not res!138459) (not e!175726))))

(assert (=> b!274471 (= res!138459 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136968 () array!13543)

(assert (=> b!274471 (= lt!136968 (array!13544 (store (arr!6421 a!3325) i!1267 k!2581) (size!6773 a!3325)))))

(declare-fun b!274472 () Bool)

(declare-fun res!138463 () Bool)

(assert (=> b!274472 (=> (not res!138463) (not e!175727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13543 (_ BitVec 32)) Bool)

(assert (=> b!274472 (= res!138463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274473 () Bool)

(declare-fun e!175729 () Bool)

(assert (=> b!274473 (= e!175726 (not e!175729))))

(declare-fun res!138462 () Bool)

(assert (=> b!274473 (=> res!138462 e!175729)))

(assert (=> b!274473 (= res!138462 (or (bvsge startIndex!26 (bvsub (size!6773 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274473 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8645 0))(
  ( (Unit!8646) )
))
(declare-fun lt!136967 () Unit!8645)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8645)

(assert (=> b!274473 (= lt!136967 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274473 (= (seekEntryOrOpen!0 (select (arr!6421 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6421 a!3325) i!1267 k!2581) startIndex!26) lt!136968 mask!3868))))

(declare-fun lt!136964 () Unit!8645)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13543 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8645)

(assert (=> b!274473 (= lt!136964 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274473 (arrayNoDuplicates!0 lt!136968 #b00000000000000000000000000000000 Nil!4226)))

(declare-fun lt!136965 () Unit!8645)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4229) Unit!8645)

(assert (=> b!274473 (= lt!136965 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4226))))

(declare-fun b!274474 () Bool)

(assert (=> b!274474 (= e!175729 true)))

(assert (=> b!274474 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136968 mask!3868)))

(declare-fun lt!136966 () Unit!8645)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13543 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8645)

(assert (=> b!274474 (= lt!136966 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274475 () Bool)

(declare-fun res!138458 () Bool)

(assert (=> b!274475 (=> (not res!138458) (not e!175728))))

(assert (=> b!274475 (= res!138458 (validKeyInArray!0 k!2581))))

(assert (= (and start!26446 res!138460) b!274467))

(assert (= (and b!274467 res!138465) b!274475))

(assert (= (and b!274475 res!138458) b!274468))

(assert (= (and b!274468 res!138456) b!274470))

(assert (= (and b!274470 res!138464) b!274466))

(assert (= (and b!274466 res!138461) b!274472))

(assert (= (and b!274472 res!138463) b!274471))

(assert (= (and b!274471 res!138459) b!274469))

(assert (= (and b!274469 res!138457) b!274473))

(assert (= (and b!274473 (not res!138462)) b!274474))

(declare-fun m!289997 () Bool)

(assert (=> b!274473 m!289997))

(declare-fun m!289999 () Bool)

(assert (=> b!274473 m!289999))

(declare-fun m!290001 () Bool)

(assert (=> b!274473 m!290001))

(assert (=> b!274473 m!289999))

(declare-fun m!290003 () Bool)

(assert (=> b!274473 m!290003))

(declare-fun m!290005 () Bool)

(assert (=> b!274473 m!290005))

(declare-fun m!290007 () Bool)

(assert (=> b!274473 m!290007))

(declare-fun m!290009 () Bool)

(assert (=> b!274473 m!290009))

(assert (=> b!274473 m!290005))

(declare-fun m!290011 () Bool)

(assert (=> b!274473 m!290011))

(declare-fun m!290013 () Bool)

(assert (=> b!274473 m!290013))

(declare-fun m!290015 () Bool)

(assert (=> b!274473 m!290015))

(assert (=> b!274469 m!290005))

(assert (=> b!274469 m!290005))

(declare-fun m!290017 () Bool)

(assert (=> b!274469 m!290017))

(assert (=> b!274471 m!290013))

(declare-fun m!290019 () Bool)

(assert (=> b!274472 m!290019))

(declare-fun m!290021 () Bool)

(assert (=> b!274474 m!290021))

(declare-fun m!290023 () Bool)

(assert (=> b!274474 m!290023))

(declare-fun m!290025 () Bool)

(assert (=> b!274466 m!290025))

(declare-fun m!290027 () Bool)

(assert (=> b!274468 m!290027))

(declare-fun m!290029 () Bool)

(assert (=> b!274470 m!290029))

(declare-fun m!290031 () Bool)

(assert (=> start!26446 m!290031))

(declare-fun m!290033 () Bool)

(assert (=> start!26446 m!290033))

(declare-fun m!290035 () Bool)

(assert (=> b!274475 m!290035))

(push 1)

(assert (not b!274473))

(assert (not b!274468))

