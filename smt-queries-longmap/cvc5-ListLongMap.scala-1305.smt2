; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26388 () Bool)

(assert start!26388)

(declare-fun b!273658 () Bool)

(declare-fun res!137647 () Bool)

(declare-fun e!175353 () Bool)

(assert (=> b!273658 (=> (not res!137647) (not e!175353))))

(declare-datatypes ((array!13485 0))(
  ( (array!13486 (arr!6392 (Array (_ BitVec 32) (_ BitVec 64))) (size!6744 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13485)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13485 (_ BitVec 32)) Bool)

(assert (=> b!273658 (= res!137647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273659 () Bool)

(declare-fun e!175355 () Bool)

(assert (=> b!273659 (= e!175355 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273659 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8587 0))(
  ( (Unit!8588) )
))
(declare-fun lt!136507 () Unit!8587)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8587)

(assert (=> b!273659 (= lt!136507 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136503 () array!13485)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1550 0))(
  ( (MissingZero!1550 (index!8370 (_ BitVec 32))) (Found!1550 (index!8371 (_ BitVec 32))) (Intermediate!1550 (undefined!2362 Bool) (index!8372 (_ BitVec 32)) (x!26675 (_ BitVec 32))) (Undefined!1550) (MissingVacant!1550 (index!8373 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13485 (_ BitVec 32)) SeekEntryResult!1550)

(assert (=> b!273659 (= (seekEntryOrOpen!0 (select (arr!6392 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6392 a!3325) i!1267 k!2581) startIndex!26) lt!136503 mask!3868))))

(declare-fun lt!136504 () Unit!8587)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8587)

(assert (=> b!273659 (= lt!136504 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4200 0))(
  ( (Nil!4197) (Cons!4196 (h!4863 (_ BitVec 64)) (t!9282 List!4200)) )
))
(declare-fun arrayNoDuplicates!0 (array!13485 (_ BitVec 32) List!4200) Bool)

(assert (=> b!273659 (arrayNoDuplicates!0 lt!136503 #b00000000000000000000000000000000 Nil!4197)))

(declare-fun lt!136505 () Unit!8587)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4200) Unit!8587)

(assert (=> b!273659 (= lt!136505 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4197))))

(declare-fun b!273660 () Bool)

(declare-fun res!137654 () Bool)

(declare-fun e!175354 () Bool)

(assert (=> b!273660 (=> (not res!137654) (not e!175354))))

(assert (=> b!273660 (= res!137654 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4197))))

(declare-fun b!273661 () Bool)

(assert (=> b!273661 (= e!175354 e!175353)))

(declare-fun res!137653 () Bool)

(assert (=> b!273661 (=> (not res!137653) (not e!175353))))

(declare-fun lt!136506 () SeekEntryResult!1550)

(assert (=> b!273661 (= res!137653 (or (= lt!136506 (MissingZero!1550 i!1267)) (= lt!136506 (MissingVacant!1550 i!1267))))))

(assert (=> b!273661 (= lt!136506 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273662 () Bool)

(declare-fun res!137650 () Bool)

(assert (=> b!273662 (=> (not res!137650) (not e!175355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273662 (= res!137650 (validKeyInArray!0 (select (arr!6392 a!3325) startIndex!26)))))

(declare-fun b!273663 () Bool)

(declare-fun res!137649 () Bool)

(assert (=> b!273663 (=> (not res!137649) (not e!175354))))

(assert (=> b!273663 (= res!137649 (and (= (size!6744 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6744 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6744 a!3325))))))

(declare-fun b!273664 () Bool)

(declare-fun res!137652 () Bool)

(assert (=> b!273664 (=> (not res!137652) (not e!175354))))

(assert (=> b!273664 (= res!137652 (validKeyInArray!0 k!2581))))

(declare-fun b!273665 () Bool)

(declare-fun res!137648 () Bool)

(assert (=> b!273665 (=> (not res!137648) (not e!175354))))

(declare-fun arrayContainsKey!0 (array!13485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273665 (= res!137648 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273657 () Bool)

(assert (=> b!273657 (= e!175353 e!175355)))

(declare-fun res!137655 () Bool)

(assert (=> b!273657 (=> (not res!137655) (not e!175355))))

(assert (=> b!273657 (= res!137655 (not (= startIndex!26 i!1267)))))

(assert (=> b!273657 (= lt!136503 (array!13486 (store (arr!6392 a!3325) i!1267 k!2581) (size!6744 a!3325)))))

(declare-fun res!137651 () Bool)

(assert (=> start!26388 (=> (not res!137651) (not e!175354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26388 (= res!137651 (validMask!0 mask!3868))))

(assert (=> start!26388 e!175354))

(declare-fun array_inv!4355 (array!13485) Bool)

(assert (=> start!26388 (array_inv!4355 a!3325)))

(assert (=> start!26388 true))

(assert (= (and start!26388 res!137651) b!273663))

(assert (= (and b!273663 res!137649) b!273664))

(assert (= (and b!273664 res!137652) b!273660))

(assert (= (and b!273660 res!137654) b!273665))

(assert (= (and b!273665 res!137648) b!273661))

(assert (= (and b!273661 res!137653) b!273658))

(assert (= (and b!273658 res!137647) b!273657))

(assert (= (and b!273657 res!137655) b!273662))

(assert (= (and b!273662 res!137650) b!273659))

(declare-fun m!288921 () Bool)

(assert (=> b!273664 m!288921))

(declare-fun m!288923 () Bool)

(assert (=> b!273665 m!288923))

(declare-fun m!288925 () Bool)

(assert (=> b!273658 m!288925))

(declare-fun m!288927 () Bool)

(assert (=> b!273659 m!288927))

(declare-fun m!288929 () Bool)

(assert (=> b!273659 m!288929))

(declare-fun m!288931 () Bool)

(assert (=> b!273659 m!288931))

(assert (=> b!273659 m!288931))

(declare-fun m!288933 () Bool)

(assert (=> b!273659 m!288933))

(declare-fun m!288935 () Bool)

(assert (=> b!273659 m!288935))

(declare-fun m!288937 () Bool)

(assert (=> b!273659 m!288937))

(declare-fun m!288939 () Bool)

(assert (=> b!273659 m!288939))

(declare-fun m!288941 () Bool)

(assert (=> b!273659 m!288941))

(declare-fun m!288943 () Bool)

(assert (=> b!273659 m!288943))

(assert (=> b!273659 m!288939))

(declare-fun m!288945 () Bool)

(assert (=> b!273659 m!288945))

(declare-fun m!288947 () Bool)

(assert (=> start!26388 m!288947))

(declare-fun m!288949 () Bool)

(assert (=> start!26388 m!288949))

(declare-fun m!288951 () Bool)

(assert (=> b!273661 m!288951))

(assert (=> b!273662 m!288939))

(assert (=> b!273662 m!288939))

(declare-fun m!288953 () Bool)

(assert (=> b!273662 m!288953))

(declare-fun m!288955 () Bool)

(assert (=> b!273660 m!288955))

(assert (=> b!273657 m!288935))

(push 1)

