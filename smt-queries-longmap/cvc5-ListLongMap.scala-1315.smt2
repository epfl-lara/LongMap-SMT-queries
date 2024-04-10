; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26448 () Bool)

(assert start!26448)

(declare-fun b!274496 () Bool)

(declare-fun res!138488 () Bool)

(declare-fun e!175742 () Bool)

(assert (=> b!274496 (=> (not res!138488) (not e!175742))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274496 (= res!138488 (validKeyInArray!0 k!2581))))

(declare-fun b!274497 () Bool)

(declare-fun e!175744 () Bool)

(declare-fun e!175745 () Bool)

(assert (=> b!274497 (= e!175744 e!175745)))

(declare-fun res!138493 () Bool)

(assert (=> b!274497 (=> (not res!138493) (not e!175745))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274497 (= res!138493 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13545 0))(
  ( (array!13546 (arr!6422 (Array (_ BitVec 32) (_ BitVec 64))) (size!6774 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13545)

(declare-fun lt!136983 () array!13545)

(assert (=> b!274497 (= lt!136983 (array!13546 (store (arr!6422 a!3325) i!1267 k!2581) (size!6774 a!3325)))))

(declare-fun b!274498 () Bool)

(declare-fun res!138495 () Bool)

(assert (=> b!274498 (=> (not res!138495) (not e!175742))))

(declare-fun arrayContainsKey!0 (array!13545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274498 (= res!138495 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274499 () Bool)

(declare-fun e!175741 () Bool)

(assert (=> b!274499 (= e!175741 (bvsle startIndex!26 (size!6774 a!3325)))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13545 (_ BitVec 32)) Bool)

(assert (=> b!274499 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136983 mask!3868)))

(declare-datatypes ((Unit!8647 0))(
  ( (Unit!8648) )
))
(declare-fun lt!136986 () Unit!8647)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8647)

(assert (=> b!274499 (= lt!136986 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274500 () Bool)

(declare-fun res!138492 () Bool)

(assert (=> b!274500 (=> (not res!138492) (not e!175745))))

(assert (=> b!274500 (= res!138492 (validKeyInArray!0 (select (arr!6422 a!3325) startIndex!26)))))

(declare-fun b!274501 () Bool)

(declare-fun res!138494 () Bool)

(assert (=> b!274501 (=> (not res!138494) (not e!175742))))

(assert (=> b!274501 (= res!138494 (and (= (size!6774 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6774 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6774 a!3325))))))

(declare-fun b!274502 () Bool)

(assert (=> b!274502 (= e!175745 (not e!175741))))

(declare-fun res!138489 () Bool)

(assert (=> b!274502 (=> res!138489 e!175741)))

(assert (=> b!274502 (= res!138489 (or (bvsge startIndex!26 (bvsub (size!6774 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274502 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136982 () Unit!8647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8647)

(assert (=> b!274502 (= lt!136982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1580 0))(
  ( (MissingZero!1580 (index!8490 (_ BitVec 32))) (Found!1580 (index!8491 (_ BitVec 32))) (Intermediate!1580 (undefined!2392 Bool) (index!8492 (_ BitVec 32)) (x!26785 (_ BitVec 32))) (Undefined!1580) (MissingVacant!1580 (index!8493 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13545 (_ BitVec 32)) SeekEntryResult!1580)

(assert (=> b!274502 (= (seekEntryOrOpen!0 (select (arr!6422 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6422 a!3325) i!1267 k!2581) startIndex!26) lt!136983 mask!3868))))

(declare-fun lt!136984 () Unit!8647)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8647)

(assert (=> b!274502 (= lt!136984 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4230 0))(
  ( (Nil!4227) (Cons!4226 (h!4893 (_ BitVec 64)) (t!9312 List!4230)) )
))
(declare-fun arrayNoDuplicates!0 (array!13545 (_ BitVec 32) List!4230) Bool)

(assert (=> b!274502 (arrayNoDuplicates!0 lt!136983 #b00000000000000000000000000000000 Nil!4227)))

(declare-fun lt!136985 () Unit!8647)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13545 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4230) Unit!8647)

(assert (=> b!274502 (= lt!136985 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4227))))

(declare-fun res!138490 () Bool)

(assert (=> start!26448 (=> (not res!138490) (not e!175742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26448 (= res!138490 (validMask!0 mask!3868))))

(assert (=> start!26448 e!175742))

(declare-fun array_inv!4385 (array!13545) Bool)

(assert (=> start!26448 (array_inv!4385 a!3325)))

(assert (=> start!26448 true))

(declare-fun b!274503 () Bool)

(assert (=> b!274503 (= e!175742 e!175744)))

(declare-fun res!138491 () Bool)

(assert (=> b!274503 (=> (not res!138491) (not e!175744))))

(declare-fun lt!136987 () SeekEntryResult!1580)

(assert (=> b!274503 (= res!138491 (or (= lt!136987 (MissingZero!1580 i!1267)) (= lt!136987 (MissingVacant!1580 i!1267))))))

(assert (=> b!274503 (= lt!136987 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274504 () Bool)

(declare-fun res!138487 () Bool)

(assert (=> b!274504 (=> (not res!138487) (not e!175742))))

(assert (=> b!274504 (= res!138487 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4227))))

(declare-fun b!274505 () Bool)

(declare-fun res!138486 () Bool)

(assert (=> b!274505 (=> (not res!138486) (not e!175744))))

(assert (=> b!274505 (= res!138486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26448 res!138490) b!274501))

(assert (= (and b!274501 res!138494) b!274496))

(assert (= (and b!274496 res!138488) b!274504))

(assert (= (and b!274504 res!138487) b!274498))

(assert (= (and b!274498 res!138495) b!274503))

(assert (= (and b!274503 res!138491) b!274505))

(assert (= (and b!274505 res!138486) b!274497))

(assert (= (and b!274497 res!138493) b!274500))

(assert (= (and b!274500 res!138492) b!274502))

(assert (= (and b!274502 (not res!138489)) b!274499))

(declare-fun m!290037 () Bool)

(assert (=> start!26448 m!290037))

(declare-fun m!290039 () Bool)

(assert (=> start!26448 m!290039))

(declare-fun m!290041 () Bool)

(assert (=> b!274500 m!290041))

(assert (=> b!274500 m!290041))

(declare-fun m!290043 () Bool)

(assert (=> b!274500 m!290043))

(declare-fun m!290045 () Bool)

(assert (=> b!274503 m!290045))

(declare-fun m!290047 () Bool)

(assert (=> b!274498 m!290047))

(declare-fun m!290049 () Bool)

(assert (=> b!274502 m!290049))

(declare-fun m!290051 () Bool)

(assert (=> b!274502 m!290051))

(declare-fun m!290053 () Bool)

(assert (=> b!274502 m!290053))

(declare-fun m!290055 () Bool)

(assert (=> b!274502 m!290055))

(declare-fun m!290057 () Bool)

(assert (=> b!274502 m!290057))

(assert (=> b!274502 m!290041))

(declare-fun m!290059 () Bool)

(assert (=> b!274502 m!290059))

(declare-fun m!290061 () Bool)

(assert (=> b!274502 m!290061))

(assert (=> b!274502 m!290041))

(declare-fun m!290063 () Bool)

(assert (=> b!274502 m!290063))

(assert (=> b!274502 m!290053))

(declare-fun m!290065 () Bool)

(assert (=> b!274502 m!290065))

(declare-fun m!290067 () Bool)

(assert (=> b!274504 m!290067))

(declare-fun m!290069 () Bool)

(assert (=> b!274499 m!290069))

(declare-fun m!290071 () Bool)

(assert (=> b!274499 m!290071))

(declare-fun m!290073 () Bool)

(assert (=> b!274496 m!290073))

(assert (=> b!274497 m!290055))

(declare-fun m!290075 () Bool)

(assert (=> b!274505 m!290075))

(push 1)

(assert (not b!274503))

(assert (not b!274504))

(assert (not b!274496))

(assert (not b!274498))

(assert (not b!274505))

(assert (not b!274502))

(assert (not b!274500))

(assert (not start!26448))

(assert (not b!274499))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

