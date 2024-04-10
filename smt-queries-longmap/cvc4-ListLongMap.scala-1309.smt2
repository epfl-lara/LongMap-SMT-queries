; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26416 () Bool)

(assert start!26416)

(declare-fun b!274035 () Bool)

(declare-fun e!175520 () Bool)

(assert (=> b!274035 (= e!175520 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13513 0))(
  ( (array!13514 (arr!6406 (Array (_ BitVec 32) (_ BitVec 64))) (size!6758 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13513)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13513 (_ BitVec 32)) Bool)

(assert (=> b!274035 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8615 0))(
  ( (Unit!8616) )
))
(declare-fun lt!136714 () Unit!8615)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8615)

(assert (=> b!274035 (= lt!136714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136716 () array!13513)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1564 0))(
  ( (MissingZero!1564 (index!8426 (_ BitVec 32))) (Found!1564 (index!8427 (_ BitVec 32))) (Intermediate!1564 (undefined!2376 Bool) (index!8428 (_ BitVec 32)) (x!26721 (_ BitVec 32))) (Undefined!1564) (MissingVacant!1564 (index!8429 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13513 (_ BitVec 32)) SeekEntryResult!1564)

(assert (=> b!274035 (= (seekEntryOrOpen!0 (select (arr!6406 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6406 a!3325) i!1267 k!2581) startIndex!26) lt!136716 mask!3868))))

(declare-fun lt!136717 () Unit!8615)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8615)

(assert (=> b!274035 (= lt!136717 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4214 0))(
  ( (Nil!4211) (Cons!4210 (h!4877 (_ BitVec 64)) (t!9296 List!4214)) )
))
(declare-fun arrayNoDuplicates!0 (array!13513 (_ BitVec 32) List!4214) Bool)

(assert (=> b!274035 (arrayNoDuplicates!0 lt!136716 #b00000000000000000000000000000000 Nil!4211)))

(declare-fun lt!136713 () Unit!8615)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13513 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4214) Unit!8615)

(assert (=> b!274035 (= lt!136713 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4211))))

(declare-fun b!274036 () Bool)

(declare-fun res!138032 () Bool)

(declare-fun e!175521 () Bool)

(assert (=> b!274036 (=> (not res!138032) (not e!175521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274036 (= res!138032 (validKeyInArray!0 k!2581))))

(declare-fun b!274037 () Bool)

(declare-fun res!138025 () Bool)

(assert (=> b!274037 (=> (not res!138025) (not e!175521))))

(assert (=> b!274037 (= res!138025 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4211))))

(declare-fun b!274038 () Bool)

(declare-fun e!175522 () Bool)

(assert (=> b!274038 (= e!175521 e!175522)))

(declare-fun res!138028 () Bool)

(assert (=> b!274038 (=> (not res!138028) (not e!175522))))

(declare-fun lt!136715 () SeekEntryResult!1564)

(assert (=> b!274038 (= res!138028 (or (= lt!136715 (MissingZero!1564 i!1267)) (= lt!136715 (MissingVacant!1564 i!1267))))))

(assert (=> b!274038 (= lt!136715 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274039 () Bool)

(declare-fun res!138029 () Bool)

(assert (=> b!274039 (=> (not res!138029) (not e!175520))))

(assert (=> b!274039 (= res!138029 (validKeyInArray!0 (select (arr!6406 a!3325) startIndex!26)))))

(declare-fun b!274040 () Bool)

(declare-fun res!138026 () Bool)

(assert (=> b!274040 (=> (not res!138026) (not e!175521))))

(declare-fun arrayContainsKey!0 (array!13513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274040 (= res!138026 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138027 () Bool)

(assert (=> start!26416 (=> (not res!138027) (not e!175521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26416 (= res!138027 (validMask!0 mask!3868))))

(assert (=> start!26416 e!175521))

(declare-fun array_inv!4369 (array!13513) Bool)

(assert (=> start!26416 (array_inv!4369 a!3325)))

(assert (=> start!26416 true))

(declare-fun b!274041 () Bool)

(declare-fun res!138031 () Bool)

(assert (=> b!274041 (=> (not res!138031) (not e!175522))))

(assert (=> b!274041 (= res!138031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274042 () Bool)

(assert (=> b!274042 (= e!175522 e!175520)))

(declare-fun res!138030 () Bool)

(assert (=> b!274042 (=> (not res!138030) (not e!175520))))

(assert (=> b!274042 (= res!138030 (not (= startIndex!26 i!1267)))))

(assert (=> b!274042 (= lt!136716 (array!13514 (store (arr!6406 a!3325) i!1267 k!2581) (size!6758 a!3325)))))

(declare-fun b!274043 () Bool)

(declare-fun res!138033 () Bool)

(assert (=> b!274043 (=> (not res!138033) (not e!175521))))

(assert (=> b!274043 (= res!138033 (and (= (size!6758 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6758 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6758 a!3325))))))

(assert (= (and start!26416 res!138027) b!274043))

(assert (= (and b!274043 res!138033) b!274036))

(assert (= (and b!274036 res!138032) b!274037))

(assert (= (and b!274037 res!138025) b!274040))

(assert (= (and b!274040 res!138026) b!274038))

(assert (= (and b!274038 res!138028) b!274041))

(assert (= (and b!274041 res!138031) b!274042))

(assert (= (and b!274042 res!138030) b!274039))

(assert (= (and b!274039 res!138029) b!274035))

(declare-fun m!289425 () Bool)

(assert (=> b!274036 m!289425))

(declare-fun m!289427 () Bool)

(assert (=> b!274040 m!289427))

(declare-fun m!289429 () Bool)

(assert (=> b!274042 m!289429))

(declare-fun m!289431 () Bool)

(assert (=> b!274038 m!289431))

(declare-fun m!289433 () Bool)

(assert (=> b!274039 m!289433))

(assert (=> b!274039 m!289433))

(declare-fun m!289435 () Bool)

(assert (=> b!274039 m!289435))

(declare-fun m!289437 () Bool)

(assert (=> b!274035 m!289437))

(declare-fun m!289439 () Bool)

(assert (=> b!274035 m!289439))

(declare-fun m!289441 () Bool)

(assert (=> b!274035 m!289441))

(assert (=> b!274035 m!289429))

(declare-fun m!289443 () Bool)

(assert (=> b!274035 m!289443))

(assert (=> b!274035 m!289433))

(declare-fun m!289445 () Bool)

(assert (=> b!274035 m!289445))

(assert (=> b!274035 m!289439))

(declare-fun m!289447 () Bool)

(assert (=> b!274035 m!289447))

(declare-fun m!289449 () Bool)

(assert (=> b!274035 m!289449))

(assert (=> b!274035 m!289433))

(declare-fun m!289451 () Bool)

(assert (=> b!274035 m!289451))

(declare-fun m!289453 () Bool)

(assert (=> b!274037 m!289453))

(declare-fun m!289455 () Bool)

(assert (=> start!26416 m!289455))

(declare-fun m!289457 () Bool)

(assert (=> start!26416 m!289457))

(declare-fun m!289459 () Bool)

(assert (=> b!274041 m!289459))

(push 1)

