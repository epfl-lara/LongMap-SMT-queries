; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26458 () Bool)

(assert start!26458)

(declare-fun b!274638 () Bool)

(declare-fun e!175810 () Bool)

(declare-fun e!175808 () Bool)

(assert (=> b!274638 (= e!175810 e!175808)))

(declare-fun res!138630 () Bool)

(assert (=> b!274638 (=> (not res!138630) (not e!175808))))

(declare-datatypes ((SeekEntryResult!1585 0))(
  ( (MissingZero!1585 (index!8510 (_ BitVec 32))) (Found!1585 (index!8511 (_ BitVec 32))) (Intermediate!1585 (undefined!2397 Bool) (index!8512 (_ BitVec 32)) (x!26798 (_ BitVec 32))) (Undefined!1585) (MissingVacant!1585 (index!8513 (_ BitVec 32))) )
))
(declare-fun lt!137068 () SeekEntryResult!1585)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274638 (= res!138630 (or (= lt!137068 (MissingZero!1585 i!1267)) (= lt!137068 (MissingVacant!1585 i!1267))))))

(declare-datatypes ((array!13555 0))(
  ( (array!13556 (arr!6427 (Array (_ BitVec 32) (_ BitVec 64))) (size!6779 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13555)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13555 (_ BitVec 32)) SeekEntryResult!1585)

(assert (=> b!274638 (= lt!137068 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274639 () Bool)

(declare-fun res!138635 () Bool)

(assert (=> b!274639 (=> (not res!138635) (not e!175810))))

(declare-datatypes ((List!4235 0))(
  ( (Nil!4232) (Cons!4231 (h!4898 (_ BitVec 64)) (t!9317 List!4235)) )
))
(declare-fun arrayNoDuplicates!0 (array!13555 (_ BitVec 32) List!4235) Bool)

(assert (=> b!274639 (= res!138635 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4232))))

(declare-fun b!274640 () Bool)

(declare-fun e!175811 () Bool)

(assert (=> b!274640 (= e!175811 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13555 (_ BitVec 32)) Bool)

(assert (=> b!274640 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8657 0))(
  ( (Unit!8658) )
))
(declare-fun lt!137065 () Unit!8657)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8657)

(assert (=> b!274640 (= lt!137065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137067 () array!13555)

(assert (=> b!274640 (= (seekEntryOrOpen!0 (select (arr!6427 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6427 a!3325) i!1267 k!2581) startIndex!26) lt!137067 mask!3868))))

(declare-fun lt!137066 () Unit!8657)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8657)

(assert (=> b!274640 (= lt!137066 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274640 (arrayNoDuplicates!0 lt!137067 #b00000000000000000000000000000000 Nil!4232)))

(declare-fun lt!137064 () Unit!8657)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4235) Unit!8657)

(assert (=> b!274640 (= lt!137064 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4232))))

(declare-fun res!138634 () Bool)

(assert (=> start!26458 (=> (not res!138634) (not e!175810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26458 (= res!138634 (validMask!0 mask!3868))))

(assert (=> start!26458 e!175810))

(declare-fun array_inv!4390 (array!13555) Bool)

(assert (=> start!26458 (array_inv!4390 a!3325)))

(assert (=> start!26458 true))

(declare-fun b!274641 () Bool)

(declare-fun res!138631 () Bool)

(assert (=> b!274641 (=> (not res!138631) (not e!175810))))

(assert (=> b!274641 (= res!138631 (and (= (size!6779 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6779 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6779 a!3325))))))

(declare-fun b!274642 () Bool)

(declare-fun res!138628 () Bool)

(assert (=> b!274642 (=> (not res!138628) (not e!175810))))

(declare-fun arrayContainsKey!0 (array!13555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274642 (= res!138628 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274643 () Bool)

(declare-fun res!138632 () Bool)

(assert (=> b!274643 (=> (not res!138632) (not e!175810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274643 (= res!138632 (validKeyInArray!0 k!2581))))

(declare-fun b!274644 () Bool)

(declare-fun res!138636 () Bool)

(assert (=> b!274644 (=> (not res!138636) (not e!175808))))

(assert (=> b!274644 (= res!138636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274645 () Bool)

(declare-fun res!138633 () Bool)

(assert (=> b!274645 (=> (not res!138633) (not e!175811))))

(assert (=> b!274645 (= res!138633 (validKeyInArray!0 (select (arr!6427 a!3325) startIndex!26)))))

(declare-fun b!274646 () Bool)

(assert (=> b!274646 (= e!175808 e!175811)))

(declare-fun res!138629 () Bool)

(assert (=> b!274646 (=> (not res!138629) (not e!175811))))

(assert (=> b!274646 (= res!138629 (not (= startIndex!26 i!1267)))))

(assert (=> b!274646 (= lt!137067 (array!13556 (store (arr!6427 a!3325) i!1267 k!2581) (size!6779 a!3325)))))

(assert (= (and start!26458 res!138634) b!274641))

(assert (= (and b!274641 res!138631) b!274643))

(assert (= (and b!274643 res!138632) b!274639))

(assert (= (and b!274639 res!138635) b!274642))

(assert (= (and b!274642 res!138628) b!274638))

(assert (= (and b!274638 res!138630) b!274644))

(assert (= (and b!274644 res!138636) b!274646))

(assert (= (and b!274646 res!138629) b!274645))

(assert (= (and b!274645 res!138633) b!274640))

(declare-fun m!290229 () Bool)

(assert (=> start!26458 m!290229))

(declare-fun m!290231 () Bool)

(assert (=> start!26458 m!290231))

(declare-fun m!290233 () Bool)

(assert (=> b!274645 m!290233))

(assert (=> b!274645 m!290233))

(declare-fun m!290235 () Bool)

(assert (=> b!274645 m!290235))

(declare-fun m!290237 () Bool)

(assert (=> b!274640 m!290237))

(declare-fun m!290239 () Bool)

(assert (=> b!274640 m!290239))

(assert (=> b!274640 m!290239))

(declare-fun m!290241 () Bool)

(assert (=> b!274640 m!290241))

(declare-fun m!290243 () Bool)

(assert (=> b!274640 m!290243))

(declare-fun m!290245 () Bool)

(assert (=> b!274640 m!290245))

(assert (=> b!274640 m!290233))

(declare-fun m!290247 () Bool)

(assert (=> b!274640 m!290247))

(declare-fun m!290249 () Bool)

(assert (=> b!274640 m!290249))

(declare-fun m!290251 () Bool)

(assert (=> b!274640 m!290251))

(assert (=> b!274640 m!290233))

(declare-fun m!290253 () Bool)

(assert (=> b!274640 m!290253))

(declare-fun m!290255 () Bool)

(assert (=> b!274643 m!290255))

(declare-fun m!290257 () Bool)

(assert (=> b!274642 m!290257))

(declare-fun m!290259 () Bool)

(assert (=> b!274644 m!290259))

(assert (=> b!274646 m!290243))

(declare-fun m!290261 () Bool)

(assert (=> b!274639 m!290261))

(declare-fun m!290263 () Bool)

(assert (=> b!274638 m!290263))

(push 1)

