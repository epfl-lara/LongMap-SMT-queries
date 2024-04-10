; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26460 () Bool)

(assert start!26460)

(declare-fun b!274665 () Bool)

(declare-fun res!138660 () Bool)

(declare-fun e!175823 () Bool)

(assert (=> b!274665 (=> (not res!138660) (not e!175823))))

(declare-datatypes ((array!13557 0))(
  ( (array!13558 (arr!6428 (Array (_ BitVec 32) (_ BitVec 64))) (size!6780 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13557)

(declare-datatypes ((List!4236 0))(
  ( (Nil!4233) (Cons!4232 (h!4899 (_ BitVec 64)) (t!9318 List!4236)) )
))
(declare-fun arrayNoDuplicates!0 (array!13557 (_ BitVec 32) List!4236) Bool)

(assert (=> b!274665 (= res!138660 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4233))))

(declare-fun b!274666 () Bool)

(declare-fun res!138659 () Bool)

(declare-fun e!175820 () Bool)

(assert (=> b!274666 (=> (not res!138659) (not e!175820))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13557 (_ BitVec 32)) Bool)

(assert (=> b!274666 (= res!138659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!138657 () Bool)

(assert (=> start!26460 (=> (not res!138657) (not e!175823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26460 (= res!138657 (validMask!0 mask!3868))))

(assert (=> start!26460 e!175823))

(declare-fun array_inv!4391 (array!13557) Bool)

(assert (=> start!26460 (array_inv!4391 a!3325)))

(assert (=> start!26460 true))

(declare-fun b!274667 () Bool)

(assert (=> b!274667 (= e!175823 e!175820)))

(declare-fun res!138662 () Bool)

(assert (=> b!274667 (=> (not res!138662) (not e!175820))))

(declare-datatypes ((SeekEntryResult!1586 0))(
  ( (MissingZero!1586 (index!8514 (_ BitVec 32))) (Found!1586 (index!8515 (_ BitVec 32))) (Intermediate!1586 (undefined!2398 Bool) (index!8516 (_ BitVec 32)) (x!26807 (_ BitVec 32))) (Undefined!1586) (MissingVacant!1586 (index!8517 (_ BitVec 32))) )
))
(declare-fun lt!137083 () SeekEntryResult!1586)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274667 (= res!138662 (or (= lt!137083 (MissingZero!1586 i!1267)) (= lt!137083 (MissingVacant!1586 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13557 (_ BitVec 32)) SeekEntryResult!1586)

(assert (=> b!274667 (= lt!137083 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274668 () Bool)

(declare-fun res!138658 () Bool)

(declare-fun e!175821 () Bool)

(assert (=> b!274668 (=> (not res!138658) (not e!175821))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274668 (= res!138658 (validKeyInArray!0 (select (arr!6428 a!3325) startIndex!26)))))

(declare-fun b!274669 () Bool)

(declare-fun res!138655 () Bool)

(assert (=> b!274669 (=> (not res!138655) (not e!175823))))

(declare-fun arrayContainsKey!0 (array!13557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274669 (= res!138655 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274670 () Bool)

(declare-fun res!138661 () Bool)

(assert (=> b!274670 (=> (not res!138661) (not e!175823))))

(assert (=> b!274670 (= res!138661 (and (= (size!6780 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6780 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6780 a!3325))))))

(declare-fun b!274671 () Bool)

(assert (=> b!274671 (= e!175820 e!175821)))

(declare-fun res!138663 () Bool)

(assert (=> b!274671 (=> (not res!138663) (not e!175821))))

(assert (=> b!274671 (= res!138663 (not (= startIndex!26 i!1267)))))

(declare-fun lt!137079 () array!13557)

(assert (=> b!274671 (= lt!137079 (array!13558 (store (arr!6428 a!3325) i!1267 k!2581) (size!6780 a!3325)))))

(declare-fun b!274672 () Bool)

(declare-fun res!138656 () Bool)

(assert (=> b!274672 (=> (not res!138656) (not e!175823))))

(assert (=> b!274672 (= res!138656 (validKeyInArray!0 k!2581))))

(declare-fun b!274673 () Bool)

(assert (=> b!274673 (= e!175821 (not true))))

(assert (=> b!274673 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8659 0))(
  ( (Unit!8660) )
))
(declare-fun lt!137082 () Unit!8659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8659)

(assert (=> b!274673 (= lt!137082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274673 (= (seekEntryOrOpen!0 (select (arr!6428 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6428 a!3325) i!1267 k!2581) startIndex!26) lt!137079 mask!3868))))

(declare-fun lt!137080 () Unit!8659)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13557 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8659)

(assert (=> b!274673 (= lt!137080 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274673 (arrayNoDuplicates!0 lt!137079 #b00000000000000000000000000000000 Nil!4233)))

(declare-fun lt!137081 () Unit!8659)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4236) Unit!8659)

(assert (=> b!274673 (= lt!137081 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4233))))

(assert (= (and start!26460 res!138657) b!274670))

(assert (= (and b!274670 res!138661) b!274672))

(assert (= (and b!274672 res!138656) b!274665))

(assert (= (and b!274665 res!138660) b!274669))

(assert (= (and b!274669 res!138655) b!274667))

(assert (= (and b!274667 res!138662) b!274666))

(assert (= (and b!274666 res!138659) b!274671))

(assert (= (and b!274671 res!138663) b!274668))

(assert (= (and b!274668 res!138658) b!274673))

(declare-fun m!290265 () Bool)

(assert (=> start!26460 m!290265))

(declare-fun m!290267 () Bool)

(assert (=> start!26460 m!290267))

(declare-fun m!290269 () Bool)

(assert (=> b!274671 m!290269))

(declare-fun m!290271 () Bool)

(assert (=> b!274668 m!290271))

(assert (=> b!274668 m!290271))

(declare-fun m!290273 () Bool)

(assert (=> b!274668 m!290273))

(declare-fun m!290275 () Bool)

(assert (=> b!274673 m!290275))

(declare-fun m!290277 () Bool)

(assert (=> b!274673 m!290277))

(declare-fun m!290279 () Bool)

(assert (=> b!274673 m!290279))

(assert (=> b!274673 m!290279))

(declare-fun m!290281 () Bool)

(assert (=> b!274673 m!290281))

(assert (=> b!274673 m!290269))

(declare-fun m!290283 () Bool)

(assert (=> b!274673 m!290283))

(assert (=> b!274673 m!290271))

(declare-fun m!290285 () Bool)

(assert (=> b!274673 m!290285))

(declare-fun m!290287 () Bool)

(assert (=> b!274673 m!290287))

(assert (=> b!274673 m!290271))

(declare-fun m!290289 () Bool)

(assert (=> b!274673 m!290289))

(declare-fun m!290291 () Bool)

(assert (=> b!274665 m!290291))

(declare-fun m!290293 () Bool)

(assert (=> b!274667 m!290293))

(declare-fun m!290295 () Bool)

(assert (=> b!274669 m!290295))

(declare-fun m!290297 () Bool)

(assert (=> b!274672 m!290297))

(declare-fun m!290299 () Bool)

(assert (=> b!274666 m!290299))

(push 1)

