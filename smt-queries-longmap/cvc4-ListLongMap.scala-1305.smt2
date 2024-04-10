; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26392 () Bool)

(assert start!26392)

(declare-fun b!273711 () Bool)

(declare-fun e!175378 () Bool)

(declare-fun e!175376 () Bool)

(assert (=> b!273711 (= e!175378 e!175376)))

(declare-fun res!137704 () Bool)

(assert (=> b!273711 (=> (not res!137704) (not e!175376))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273711 (= res!137704 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13489 0))(
  ( (array!13490 (arr!6394 (Array (_ BitVec 32) (_ BitVec 64))) (size!6746 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13489)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!136536 () array!13489)

(assert (=> b!273711 (= lt!136536 (array!13490 (store (arr!6394 a!3325) i!1267 k!2581) (size!6746 a!3325)))))

(declare-fun b!273712 () Bool)

(declare-fun res!137708 () Bool)

(declare-fun e!175377 () Bool)

(assert (=> b!273712 (=> (not res!137708) (not e!175377))))

(declare-datatypes ((List!4202 0))(
  ( (Nil!4199) (Cons!4198 (h!4865 (_ BitVec 64)) (t!9284 List!4202)) )
))
(declare-fun arrayNoDuplicates!0 (array!13489 (_ BitVec 32) List!4202) Bool)

(assert (=> b!273712 (= res!137708 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4199))))

(declare-fun b!273713 () Bool)

(declare-fun res!137701 () Bool)

(assert (=> b!273713 (=> (not res!137701) (not e!175377))))

(declare-fun arrayContainsKey!0 (array!13489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273713 (= res!137701 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273714 () Bool)

(declare-fun res!137706 () Bool)

(assert (=> b!273714 (=> (not res!137706) (not e!175377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273714 (= res!137706 (validKeyInArray!0 k!2581))))

(declare-fun res!137709 () Bool)

(assert (=> start!26392 (=> (not res!137709) (not e!175377))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26392 (= res!137709 (validMask!0 mask!3868))))

(assert (=> start!26392 e!175377))

(declare-fun array_inv!4357 (array!13489) Bool)

(assert (=> start!26392 (array_inv!4357 a!3325)))

(assert (=> start!26392 true))

(declare-fun b!273715 () Bool)

(assert (=> b!273715 (= e!175376 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13489 (_ BitVec 32)) Bool)

(assert (=> b!273715 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8591 0))(
  ( (Unit!8592) )
))
(declare-fun lt!136535 () Unit!8591)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8591)

(assert (=> b!273715 (= lt!136535 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1552 0))(
  ( (MissingZero!1552 (index!8378 (_ BitVec 32))) (Found!1552 (index!8379 (_ BitVec 32))) (Intermediate!1552 (undefined!2364 Bool) (index!8380 (_ BitVec 32)) (x!26677 (_ BitVec 32))) (Undefined!1552) (MissingVacant!1552 (index!8381 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13489 (_ BitVec 32)) SeekEntryResult!1552)

(assert (=> b!273715 (= (seekEntryOrOpen!0 (select (arr!6394 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6394 a!3325) i!1267 k!2581) startIndex!26) lt!136536 mask!3868))))

(declare-fun lt!136534 () Unit!8591)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8591)

(assert (=> b!273715 (= lt!136534 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273715 (arrayNoDuplicates!0 lt!136536 #b00000000000000000000000000000000 Nil!4199)))

(declare-fun lt!136533 () Unit!8591)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13489 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4202) Unit!8591)

(assert (=> b!273715 (= lt!136533 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4199))))

(declare-fun b!273716 () Bool)

(declare-fun res!137703 () Bool)

(assert (=> b!273716 (=> (not res!137703) (not e!175377))))

(assert (=> b!273716 (= res!137703 (and (= (size!6746 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6746 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6746 a!3325))))))

(declare-fun b!273717 () Bool)

(declare-fun res!137702 () Bool)

(assert (=> b!273717 (=> (not res!137702) (not e!175378))))

(assert (=> b!273717 (= res!137702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273718 () Bool)

(declare-fun res!137705 () Bool)

(assert (=> b!273718 (=> (not res!137705) (not e!175376))))

(assert (=> b!273718 (= res!137705 (validKeyInArray!0 (select (arr!6394 a!3325) startIndex!26)))))

(declare-fun b!273719 () Bool)

(assert (=> b!273719 (= e!175377 e!175378)))

(declare-fun res!137707 () Bool)

(assert (=> b!273719 (=> (not res!137707) (not e!175378))))

(declare-fun lt!136537 () SeekEntryResult!1552)

(assert (=> b!273719 (= res!137707 (or (= lt!136537 (MissingZero!1552 i!1267)) (= lt!136537 (MissingVacant!1552 i!1267))))))

(assert (=> b!273719 (= lt!136537 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26392 res!137709) b!273716))

(assert (= (and b!273716 res!137703) b!273714))

(assert (= (and b!273714 res!137706) b!273712))

(assert (= (and b!273712 res!137708) b!273713))

(assert (= (and b!273713 res!137701) b!273719))

(assert (= (and b!273719 res!137707) b!273717))

(assert (= (and b!273717 res!137702) b!273711))

(assert (= (and b!273711 res!137704) b!273718))

(assert (= (and b!273718 res!137705) b!273715))

(declare-fun m!288993 () Bool)

(assert (=> b!273718 m!288993))

(assert (=> b!273718 m!288993))

(declare-fun m!288995 () Bool)

(assert (=> b!273718 m!288995))

(declare-fun m!288997 () Bool)

(assert (=> b!273717 m!288997))

(declare-fun m!288999 () Bool)

(assert (=> b!273714 m!288999))

(declare-fun m!289001 () Bool)

(assert (=> b!273712 m!289001))

(declare-fun m!289003 () Bool)

(assert (=> start!26392 m!289003))

(declare-fun m!289005 () Bool)

(assert (=> start!26392 m!289005))

(declare-fun m!289007 () Bool)

(assert (=> b!273719 m!289007))

(declare-fun m!289009 () Bool)

(assert (=> b!273711 m!289009))

(declare-fun m!289011 () Bool)

(assert (=> b!273713 m!289011))

(declare-fun m!289013 () Bool)

(assert (=> b!273715 m!289013))

(declare-fun m!289015 () Bool)

(assert (=> b!273715 m!289015))

(assert (=> b!273715 m!289009))

(declare-fun m!289017 () Bool)

(assert (=> b!273715 m!289017))

(assert (=> b!273715 m!288993))

(declare-fun m!289019 () Bool)

(assert (=> b!273715 m!289019))

(assert (=> b!273715 m!289015))

(declare-fun m!289021 () Bool)

(assert (=> b!273715 m!289021))

(declare-fun m!289023 () Bool)

(assert (=> b!273715 m!289023))

(assert (=> b!273715 m!288993))

(declare-fun m!289025 () Bool)

(assert (=> b!273715 m!289025))

(declare-fun m!289027 () Bool)

(assert (=> b!273715 m!289027))

(push 1)

