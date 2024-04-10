; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26464 () Bool)

(assert start!26464)

(declare-fun b!274719 () Bool)

(declare-fun e!175844 () Bool)

(assert (=> b!274719 (= e!175844 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13561 0))(
  ( (array!13562 (arr!6430 (Array (_ BitVec 32) (_ BitVec 64))) (size!6782 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13561)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13561 (_ BitVec 32)) Bool)

(assert (=> b!274719 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8663 0))(
  ( (Unit!8664) )
))
(declare-fun lt!137110 () Unit!8663)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8663)

(assert (=> b!274719 (= lt!137110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137112 () array!13561)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1588 0))(
  ( (MissingZero!1588 (index!8522 (_ BitVec 32))) (Found!1588 (index!8523 (_ BitVec 32))) (Intermediate!1588 (undefined!2400 Bool) (index!8524 (_ BitVec 32)) (x!26809 (_ BitVec 32))) (Undefined!1588) (MissingVacant!1588 (index!8525 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13561 (_ BitVec 32)) SeekEntryResult!1588)

(assert (=> b!274719 (= (seekEntryOrOpen!0 (select (arr!6430 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6430 a!3325) i!1267 k!2581) startIndex!26) lt!137112 mask!3868))))

(declare-fun lt!137113 () Unit!8663)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8663)

(assert (=> b!274719 (= lt!137113 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4238 0))(
  ( (Nil!4235) (Cons!4234 (h!4901 (_ BitVec 64)) (t!9320 List!4238)) )
))
(declare-fun arrayNoDuplicates!0 (array!13561 (_ BitVec 32) List!4238) Bool)

(assert (=> b!274719 (arrayNoDuplicates!0 lt!137112 #b00000000000000000000000000000000 Nil!4235)))

(declare-fun lt!137111 () Unit!8663)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13561 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4238) Unit!8663)

(assert (=> b!274719 (= lt!137111 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4235))))

(declare-fun res!138711 () Bool)

(declare-fun e!175845 () Bool)

(assert (=> start!26464 (=> (not res!138711) (not e!175845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26464 (= res!138711 (validMask!0 mask!3868))))

(assert (=> start!26464 e!175845))

(declare-fun array_inv!4393 (array!13561) Bool)

(assert (=> start!26464 (array_inv!4393 a!3325)))

(assert (=> start!26464 true))

(declare-fun b!274720 () Bool)

(declare-fun res!138716 () Bool)

(assert (=> b!274720 (=> (not res!138716) (not e!175845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274720 (= res!138716 (validKeyInArray!0 k!2581))))

(declare-fun b!274721 () Bool)

(declare-fun e!175846 () Bool)

(assert (=> b!274721 (= e!175846 e!175844)))

(declare-fun res!138713 () Bool)

(assert (=> b!274721 (=> (not res!138713) (not e!175844))))

(assert (=> b!274721 (= res!138713 (not (= startIndex!26 i!1267)))))

(assert (=> b!274721 (= lt!137112 (array!13562 (store (arr!6430 a!3325) i!1267 k!2581) (size!6782 a!3325)))))

(declare-fun b!274722 () Bool)

(declare-fun res!138717 () Bool)

(assert (=> b!274722 (=> (not res!138717) (not e!175846))))

(assert (=> b!274722 (= res!138717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274723 () Bool)

(declare-fun res!138714 () Bool)

(assert (=> b!274723 (=> (not res!138714) (not e!175845))))

(assert (=> b!274723 (= res!138714 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4235))))

(declare-fun b!274724 () Bool)

(assert (=> b!274724 (= e!175845 e!175846)))

(declare-fun res!138710 () Bool)

(assert (=> b!274724 (=> (not res!138710) (not e!175846))))

(declare-fun lt!137109 () SeekEntryResult!1588)

(assert (=> b!274724 (= res!138710 (or (= lt!137109 (MissingZero!1588 i!1267)) (= lt!137109 (MissingVacant!1588 i!1267))))))

(assert (=> b!274724 (= lt!137109 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274725 () Bool)

(declare-fun res!138712 () Bool)

(assert (=> b!274725 (=> (not res!138712) (not e!175844))))

(assert (=> b!274725 (= res!138712 (validKeyInArray!0 (select (arr!6430 a!3325) startIndex!26)))))

(declare-fun b!274726 () Bool)

(declare-fun res!138715 () Bool)

(assert (=> b!274726 (=> (not res!138715) (not e!175845))))

(assert (=> b!274726 (= res!138715 (and (= (size!6782 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6782 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6782 a!3325))))))

(declare-fun b!274727 () Bool)

(declare-fun res!138709 () Bool)

(assert (=> b!274727 (=> (not res!138709) (not e!175845))))

(declare-fun arrayContainsKey!0 (array!13561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274727 (= res!138709 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26464 res!138711) b!274726))

(assert (= (and b!274726 res!138715) b!274720))

(assert (= (and b!274720 res!138716) b!274723))

(assert (= (and b!274723 res!138714) b!274727))

(assert (= (and b!274727 res!138709) b!274724))

(assert (= (and b!274724 res!138710) b!274722))

(assert (= (and b!274722 res!138717) b!274721))

(assert (= (and b!274721 res!138713) b!274725))

(assert (= (and b!274725 res!138712) b!274719))

(declare-fun m!290337 () Bool)

(assert (=> start!26464 m!290337))

(declare-fun m!290339 () Bool)

(assert (=> start!26464 m!290339))

(declare-fun m!290341 () Bool)

(assert (=> b!274725 m!290341))

(assert (=> b!274725 m!290341))

(declare-fun m!290343 () Bool)

(assert (=> b!274725 m!290343))

(declare-fun m!290345 () Bool)

(assert (=> b!274719 m!290345))

(declare-fun m!290347 () Bool)

(assert (=> b!274719 m!290347))

(declare-fun m!290349 () Bool)

(assert (=> b!274719 m!290349))

(declare-fun m!290351 () Bool)

(assert (=> b!274719 m!290351))

(declare-fun m!290353 () Bool)

(assert (=> b!274719 m!290353))

(assert (=> b!274719 m!290341))

(declare-fun m!290355 () Bool)

(assert (=> b!274719 m!290355))

(assert (=> b!274719 m!290347))

(declare-fun m!290357 () Bool)

(assert (=> b!274719 m!290357))

(declare-fun m!290359 () Bool)

(assert (=> b!274719 m!290359))

(assert (=> b!274719 m!290341))

(declare-fun m!290361 () Bool)

(assert (=> b!274719 m!290361))

(declare-fun m!290363 () Bool)

(assert (=> b!274722 m!290363))

(declare-fun m!290365 () Bool)

(assert (=> b!274723 m!290365))

(assert (=> b!274721 m!290349))

(declare-fun m!290367 () Bool)

(assert (=> b!274727 m!290367))

(declare-fun m!290369 () Bool)

(assert (=> b!274724 m!290369))

(declare-fun m!290371 () Bool)

(assert (=> b!274720 m!290371))

(push 1)

