; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27198 () Bool)

(assert start!27198)

(declare-fun b!281546 () Bool)

(declare-fun res!144594 () Bool)

(declare-fun e!178922 () Bool)

(assert (=> b!281546 (=> (not res!144594) (not e!178922))))

(declare-datatypes ((array!14015 0))(
  ( (array!14016 (arr!6649 (Array (_ BitVec 32) (_ BitVec 64))) (size!7001 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14015)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281546 (= res!144594 (validKeyInArray!0 (select (arr!6649 a!3325) startIndex!26)))))

(declare-fun b!281547 () Bool)

(declare-fun res!144595 () Bool)

(declare-fun e!178919 () Bool)

(assert (=> b!281547 (=> (not res!144595) (not e!178919))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281547 (= res!144595 (and (= (size!7001 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7001 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7001 a!3325))))))

(declare-fun b!281548 () Bool)

(assert (=> b!281548 (= e!178922 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139127 () array!14015)

(declare-datatypes ((SeekEntryResult!1772 0))(
  ( (MissingZero!1772 (index!9258 (_ BitVec 32))) (Found!1772 (index!9259 (_ BitVec 32))) (Intermediate!1772 (undefined!2584 Bool) (index!9260 (_ BitVec 32)) (x!27594 (_ BitVec 32))) (Undefined!1772) (MissingVacant!1772 (index!9261 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14015 (_ BitVec 32)) SeekEntryResult!1772)

(assert (=> b!281548 (= (seekEntryOrOpen!0 (select (arr!6649 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6649 a!3325) i!1267 k0!2581) startIndex!26) lt!139127 mask!3868))))

(declare-datatypes ((Unit!8874 0))(
  ( (Unit!8875) )
))
(declare-fun lt!139128 () Unit!8874)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14015 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8874)

(assert (=> b!281548 (= lt!139128 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4370 0))(
  ( (Nil!4367) (Cons!4366 (h!5036 (_ BitVec 64)) (t!9444 List!4370)) )
))
(declare-fun arrayNoDuplicates!0 (array!14015 (_ BitVec 32) List!4370) Bool)

(assert (=> b!281548 (arrayNoDuplicates!0 lt!139127 #b00000000000000000000000000000000 Nil!4367)))

(declare-fun lt!139126 () Unit!8874)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14015 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4370) Unit!8874)

(assert (=> b!281548 (= lt!139126 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4367))))

(declare-fun b!281549 () Bool)

(declare-fun e!178920 () Bool)

(assert (=> b!281549 (= e!178919 e!178920)))

(declare-fun res!144593 () Bool)

(assert (=> b!281549 (=> (not res!144593) (not e!178920))))

(declare-fun lt!139125 () SeekEntryResult!1772)

(assert (=> b!281549 (= res!144593 (or (= lt!139125 (MissingZero!1772 i!1267)) (= lt!139125 (MissingVacant!1772 i!1267))))))

(assert (=> b!281549 (= lt!139125 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281550 () Bool)

(declare-fun res!144592 () Bool)

(assert (=> b!281550 (=> (not res!144592) (not e!178919))))

(assert (=> b!281550 (= res!144592 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4367))))

(declare-fun res!144596 () Bool)

(assert (=> start!27198 (=> (not res!144596) (not e!178919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27198 (= res!144596 (validMask!0 mask!3868))))

(assert (=> start!27198 e!178919))

(declare-fun array_inv!4599 (array!14015) Bool)

(assert (=> start!27198 (array_inv!4599 a!3325)))

(assert (=> start!27198 true))

(declare-fun b!281551 () Bool)

(assert (=> b!281551 (= e!178920 e!178922)))

(declare-fun res!144591 () Bool)

(assert (=> b!281551 (=> (not res!144591) (not e!178922))))

(assert (=> b!281551 (= res!144591 (not (= startIndex!26 i!1267)))))

(assert (=> b!281551 (= lt!139127 (array!14016 (store (arr!6649 a!3325) i!1267 k0!2581) (size!7001 a!3325)))))

(declare-fun b!281552 () Bool)

(declare-fun res!144597 () Bool)

(assert (=> b!281552 (=> (not res!144597) (not e!178919))))

(declare-fun arrayContainsKey!0 (array!14015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281552 (= res!144597 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281553 () Bool)

(declare-fun res!144589 () Bool)

(assert (=> b!281553 (=> (not res!144589) (not e!178920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14015 (_ BitVec 32)) Bool)

(assert (=> b!281553 (= res!144589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281554 () Bool)

(declare-fun res!144590 () Bool)

(assert (=> b!281554 (=> (not res!144590) (not e!178919))))

(assert (=> b!281554 (= res!144590 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27198 res!144596) b!281547))

(assert (= (and b!281547 res!144595) b!281554))

(assert (= (and b!281554 res!144590) b!281550))

(assert (= (and b!281550 res!144592) b!281552))

(assert (= (and b!281552 res!144597) b!281549))

(assert (= (and b!281549 res!144593) b!281553))

(assert (= (and b!281553 res!144589) b!281551))

(assert (= (and b!281551 res!144591) b!281546))

(assert (= (and b!281546 res!144594) b!281548))

(declare-fun m!296021 () Bool)

(assert (=> b!281552 m!296021))

(declare-fun m!296023 () Bool)

(assert (=> b!281548 m!296023))

(assert (=> b!281548 m!296023))

(declare-fun m!296025 () Bool)

(assert (=> b!281548 m!296025))

(declare-fun m!296027 () Bool)

(assert (=> b!281548 m!296027))

(declare-fun m!296029 () Bool)

(assert (=> b!281548 m!296029))

(declare-fun m!296031 () Bool)

(assert (=> b!281548 m!296031))

(assert (=> b!281548 m!296029))

(declare-fun m!296033 () Bool)

(assert (=> b!281548 m!296033))

(declare-fun m!296035 () Bool)

(assert (=> b!281548 m!296035))

(declare-fun m!296037 () Bool)

(assert (=> b!281548 m!296037))

(declare-fun m!296039 () Bool)

(assert (=> b!281550 m!296039))

(declare-fun m!296041 () Bool)

(assert (=> b!281553 m!296041))

(declare-fun m!296043 () Bool)

(assert (=> start!27198 m!296043))

(declare-fun m!296045 () Bool)

(assert (=> start!27198 m!296045))

(assert (=> b!281551 m!296027))

(assert (=> b!281546 m!296029))

(assert (=> b!281546 m!296029))

(declare-fun m!296047 () Bool)

(assert (=> b!281546 m!296047))

(declare-fun m!296049 () Bool)

(assert (=> b!281549 m!296049))

(declare-fun m!296051 () Bool)

(assert (=> b!281554 m!296051))

(check-sat (not b!281550) (not b!281552) (not b!281553) (not b!281548) (not b!281549) (not b!281554) (not start!27198) (not b!281546))
(check-sat)
