; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26466 () Bool)

(assert start!26466)

(declare-fun res!138741 () Bool)

(declare-fun e!175856 () Bool)

(assert (=> start!26466 (=> (not res!138741) (not e!175856))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26466 (= res!138741 (validMask!0 mask!3868))))

(assert (=> start!26466 e!175856))

(declare-datatypes ((array!13563 0))(
  ( (array!13564 (arr!6431 (Array (_ BitVec 32) (_ BitVec 64))) (size!6783 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13563)

(declare-fun array_inv!4394 (array!13563) Bool)

(assert (=> start!26466 (array_inv!4394 a!3325)))

(assert (=> start!26466 true))

(declare-fun b!274746 () Bool)

(declare-fun res!138739 () Bool)

(declare-fun e!175857 () Bool)

(assert (=> b!274746 (=> (not res!138739) (not e!175857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13563 (_ BitVec 32)) Bool)

(assert (=> b!274746 (= res!138739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274747 () Bool)

(declare-fun res!138744 () Bool)

(assert (=> b!274747 (=> (not res!138744) (not e!175856))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274747 (= res!138744 (validKeyInArray!0 k!2581))))

(declare-fun b!274748 () Bool)

(declare-fun res!138743 () Bool)

(assert (=> b!274748 (=> (not res!138743) (not e!175856))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274748 (= res!138743 (and (= (size!6783 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6783 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6783 a!3325))))))

(declare-fun b!274749 () Bool)

(declare-fun e!175858 () Bool)

(assert (=> b!274749 (= e!175858 (not true))))

(assert (=> b!274749 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8665 0))(
  ( (Unit!8666) )
))
(declare-fun lt!137124 () Unit!8665)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8665)

(assert (=> b!274749 (= lt!137124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137127 () array!13563)

(declare-datatypes ((SeekEntryResult!1589 0))(
  ( (MissingZero!1589 (index!8526 (_ BitVec 32))) (Found!1589 (index!8527 (_ BitVec 32))) (Intermediate!1589 (undefined!2401 Bool) (index!8528 (_ BitVec 32)) (x!26818 (_ BitVec 32))) (Undefined!1589) (MissingVacant!1589 (index!8529 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13563 (_ BitVec 32)) SeekEntryResult!1589)

(assert (=> b!274749 (= (seekEntryOrOpen!0 (select (arr!6431 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6431 a!3325) i!1267 k!2581) startIndex!26) lt!137127 mask!3868))))

(declare-fun lt!137128 () Unit!8665)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8665)

(assert (=> b!274749 (= lt!137128 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4239 0))(
  ( (Nil!4236) (Cons!4235 (h!4902 (_ BitVec 64)) (t!9321 List!4239)) )
))
(declare-fun arrayNoDuplicates!0 (array!13563 (_ BitVec 32) List!4239) Bool)

(assert (=> b!274749 (arrayNoDuplicates!0 lt!137127 #b00000000000000000000000000000000 Nil!4236)))

(declare-fun lt!137125 () Unit!8665)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4239) Unit!8665)

(assert (=> b!274749 (= lt!137125 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4236))))

(declare-fun b!274750 () Bool)

(declare-fun res!138740 () Bool)

(assert (=> b!274750 (=> (not res!138740) (not e!175856))))

(assert (=> b!274750 (= res!138740 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4236))))

(declare-fun b!274751 () Bool)

(assert (=> b!274751 (= e!175856 e!175857)))

(declare-fun res!138736 () Bool)

(assert (=> b!274751 (=> (not res!138736) (not e!175857))))

(declare-fun lt!137126 () SeekEntryResult!1589)

(assert (=> b!274751 (= res!138736 (or (= lt!137126 (MissingZero!1589 i!1267)) (= lt!137126 (MissingVacant!1589 i!1267))))))

(assert (=> b!274751 (= lt!137126 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274752 () Bool)

(assert (=> b!274752 (= e!175857 e!175858)))

(declare-fun res!138737 () Bool)

(assert (=> b!274752 (=> (not res!138737) (not e!175858))))

(assert (=> b!274752 (= res!138737 (not (= startIndex!26 i!1267)))))

(assert (=> b!274752 (= lt!137127 (array!13564 (store (arr!6431 a!3325) i!1267 k!2581) (size!6783 a!3325)))))

(declare-fun b!274753 () Bool)

(declare-fun res!138738 () Bool)

(assert (=> b!274753 (=> (not res!138738) (not e!175858))))

(assert (=> b!274753 (= res!138738 (validKeyInArray!0 (select (arr!6431 a!3325) startIndex!26)))))

(declare-fun b!274754 () Bool)

(declare-fun res!138742 () Bool)

(assert (=> b!274754 (=> (not res!138742) (not e!175856))))

(declare-fun arrayContainsKey!0 (array!13563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274754 (= res!138742 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26466 res!138741) b!274748))

(assert (= (and b!274748 res!138743) b!274747))

(assert (= (and b!274747 res!138744) b!274750))

(assert (= (and b!274750 res!138740) b!274754))

(assert (= (and b!274754 res!138742) b!274751))

(assert (= (and b!274751 res!138736) b!274746))

(assert (= (and b!274746 res!138739) b!274752))

(assert (= (and b!274752 res!138737) b!274753))

(assert (= (and b!274753 res!138738) b!274749))

(declare-fun m!290373 () Bool)

(assert (=> b!274750 m!290373))

(declare-fun m!290375 () Bool)

(assert (=> b!274753 m!290375))

(assert (=> b!274753 m!290375))

(declare-fun m!290377 () Bool)

(assert (=> b!274753 m!290377))

(declare-fun m!290379 () Bool)

(assert (=> b!274752 m!290379))

(declare-fun m!290381 () Bool)

(assert (=> b!274754 m!290381))

(declare-fun m!290383 () Bool)

(assert (=> b!274746 m!290383))

(declare-fun m!290385 () Bool)

(assert (=> b!274749 m!290385))

(declare-fun m!290387 () Bool)

(assert (=> b!274749 m!290387))

(assert (=> b!274749 m!290385))

(assert (=> b!274749 m!290379))

(declare-fun m!290389 () Bool)

(assert (=> b!274749 m!290389))

(assert (=> b!274749 m!290375))

(declare-fun m!290391 () Bool)

(assert (=> b!274749 m!290391))

(declare-fun m!290393 () Bool)

(assert (=> b!274749 m!290393))

(assert (=> b!274749 m!290375))

(declare-fun m!290395 () Bool)

(assert (=> b!274749 m!290395))

(declare-fun m!290397 () Bool)

(assert (=> b!274749 m!290397))

(declare-fun m!290399 () Bool)

(assert (=> b!274749 m!290399))

(declare-fun m!290401 () Bool)

(assert (=> b!274747 m!290401))

(declare-fun m!290403 () Bool)

(assert (=> start!26466 m!290403))

(declare-fun m!290405 () Bool)

(assert (=> start!26466 m!290405))

(declare-fun m!290407 () Bool)

(assert (=> b!274751 m!290407))

(push 1)

