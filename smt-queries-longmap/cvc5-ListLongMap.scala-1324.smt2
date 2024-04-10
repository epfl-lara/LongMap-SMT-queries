; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26502 () Bool)

(assert start!26502)

(declare-fun b!275118 () Bool)

(declare-fun e!176035 () Bool)

(declare-fun e!176034 () Bool)

(assert (=> b!275118 (= e!176035 e!176034)))

(declare-fun res!139113 () Bool)

(assert (=> b!275118 (=> (not res!139113) (not e!176034))))

(declare-datatypes ((SeekEntryResult!1607 0))(
  ( (MissingZero!1607 (index!8598 (_ BitVec 32))) (Found!1607 (index!8599 (_ BitVec 32))) (Intermediate!1607 (undefined!2419 Bool) (index!8600 (_ BitVec 32)) (x!26884 (_ BitVec 32))) (Undefined!1607) (MissingVacant!1607 (index!8601 (_ BitVec 32))) )
))
(declare-fun lt!137281 () SeekEntryResult!1607)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275118 (= res!139113 (or (= lt!137281 (MissingZero!1607 i!1267)) (= lt!137281 (MissingVacant!1607 i!1267))))))

(declare-datatypes ((array!13599 0))(
  ( (array!13600 (arr!6449 (Array (_ BitVec 32) (_ BitVec 64))) (size!6801 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13599)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13599 (_ BitVec 32)) SeekEntryResult!1607)

(assert (=> b!275118 (= lt!137281 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275119 () Bool)

(declare-fun res!139111 () Bool)

(assert (=> b!275119 (=> (not res!139111) (not e!176035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275119 (= res!139111 (validKeyInArray!0 k!2581))))

(declare-fun b!275120 () Bool)

(declare-fun res!139110 () Bool)

(assert (=> b!275120 (=> (not res!139110) (not e!176035))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275120 (= res!139110 (and (= (size!6801 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6801 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6801 a!3325))))))

(declare-fun res!139109 () Bool)

(assert (=> start!26502 (=> (not res!139109) (not e!176035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26502 (= res!139109 (validMask!0 mask!3868))))

(assert (=> start!26502 e!176035))

(declare-fun array_inv!4412 (array!13599) Bool)

(assert (=> start!26502 (array_inv!4412 a!3325)))

(assert (=> start!26502 true))

(declare-fun b!275121 () Bool)

(declare-fun res!139112 () Bool)

(assert (=> b!275121 (=> (not res!139112) (not e!176035))))

(declare-datatypes ((List!4257 0))(
  ( (Nil!4254) (Cons!4253 (h!4920 (_ BitVec 64)) (t!9339 List!4257)) )
))
(declare-fun arrayNoDuplicates!0 (array!13599 (_ BitVec 32) List!4257) Bool)

(assert (=> b!275121 (= res!139112 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4254))))

(declare-fun b!275122 () Bool)

(declare-fun res!139108 () Bool)

(assert (=> b!275122 (=> (not res!139108) (not e!176035))))

(declare-fun arrayContainsKey!0 (array!13599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275122 (= res!139108 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275123 () Bool)

(assert (=> b!275123 (= e!176034 false)))

(declare-fun lt!137280 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13599 (_ BitVec 32)) Bool)

(assert (=> b!275123 (= lt!137280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26502 res!139109) b!275120))

(assert (= (and b!275120 res!139110) b!275119))

(assert (= (and b!275119 res!139111) b!275121))

(assert (= (and b!275121 res!139112) b!275122))

(assert (= (and b!275122 res!139108) b!275118))

(assert (= (and b!275118 res!139113) b!275123))

(declare-fun m!290757 () Bool)

(assert (=> b!275119 m!290757))

(declare-fun m!290759 () Bool)

(assert (=> b!275118 m!290759))

(declare-fun m!290761 () Bool)

(assert (=> start!26502 m!290761))

(declare-fun m!290763 () Bool)

(assert (=> start!26502 m!290763))

(declare-fun m!290765 () Bool)

(assert (=> b!275123 m!290765))

(declare-fun m!290767 () Bool)

(assert (=> b!275121 m!290767))

(declare-fun m!290769 () Bool)

(assert (=> b!275122 m!290769))

(push 1)

