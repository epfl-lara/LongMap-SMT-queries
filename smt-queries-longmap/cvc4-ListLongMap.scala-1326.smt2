; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26518 () Bool)

(assert start!26518)

(declare-fun res!139254 () Bool)

(declare-fun e!176108 () Bool)

(assert (=> start!26518 (=> (not res!139254) (not e!176108))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26518 (= res!139254 (validMask!0 mask!3868))))

(assert (=> start!26518 e!176108))

(declare-datatypes ((array!13615 0))(
  ( (array!13616 (arr!6457 (Array (_ BitVec 32) (_ BitVec 64))) (size!6809 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13615)

(declare-fun array_inv!4420 (array!13615) Bool)

(assert (=> start!26518 (array_inv!4420 a!3325)))

(assert (=> start!26518 true))

(declare-fun b!275262 () Bool)

(declare-fun res!139256 () Bool)

(assert (=> b!275262 (=> (not res!139256) (not e!176108))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275262 (= res!139256 (validKeyInArray!0 k!2581))))

(declare-fun b!275263 () Bool)

(declare-fun res!139257 () Bool)

(assert (=> b!275263 (=> (not res!139257) (not e!176108))))

(declare-fun arrayContainsKey!0 (array!13615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275263 (= res!139257 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275264 () Bool)

(declare-fun res!139252 () Bool)

(assert (=> b!275264 (=> (not res!139252) (not e!176108))))

(declare-datatypes ((List!4265 0))(
  ( (Nil!4262) (Cons!4261 (h!4928 (_ BitVec 64)) (t!9347 List!4265)) )
))
(declare-fun arrayNoDuplicates!0 (array!13615 (_ BitVec 32) List!4265) Bool)

(assert (=> b!275264 (= res!139252 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4262))))

(declare-fun b!275265 () Bool)

(declare-fun res!139253 () Bool)

(assert (=> b!275265 (=> (not res!139253) (not e!176108))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275265 (= res!139253 (and (= (size!6809 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6809 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6809 a!3325))))))

(declare-fun b!275266 () Bool)

(declare-fun e!176107 () Bool)

(assert (=> b!275266 (= e!176108 e!176107)))

(declare-fun res!139255 () Bool)

(assert (=> b!275266 (=> (not res!139255) (not e!176107))))

(declare-datatypes ((SeekEntryResult!1615 0))(
  ( (MissingZero!1615 (index!8630 (_ BitVec 32))) (Found!1615 (index!8631 (_ BitVec 32))) (Intermediate!1615 (undefined!2427 Bool) (index!8632 (_ BitVec 32)) (x!26908 (_ BitVec 32))) (Undefined!1615) (MissingVacant!1615 (index!8633 (_ BitVec 32))) )
))
(declare-fun lt!137329 () SeekEntryResult!1615)

(assert (=> b!275266 (= res!139255 (or (= lt!137329 (MissingZero!1615 i!1267)) (= lt!137329 (MissingVacant!1615 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13615 (_ BitVec 32)) SeekEntryResult!1615)

(assert (=> b!275266 (= lt!137329 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275267 () Bool)

(assert (=> b!275267 (= e!176107 false)))

(declare-fun lt!137328 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13615 (_ BitVec 32)) Bool)

(assert (=> b!275267 (= lt!137328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26518 res!139254) b!275265))

(assert (= (and b!275265 res!139253) b!275262))

(assert (= (and b!275262 res!139256) b!275264))

(assert (= (and b!275264 res!139252) b!275263))

(assert (= (and b!275263 res!139257) b!275266))

(assert (= (and b!275266 res!139255) b!275267))

(declare-fun m!290869 () Bool)

(assert (=> b!275262 m!290869))

(declare-fun m!290871 () Bool)

(assert (=> b!275264 m!290871))

(declare-fun m!290873 () Bool)

(assert (=> b!275263 m!290873))

(declare-fun m!290875 () Bool)

(assert (=> start!26518 m!290875))

(declare-fun m!290877 () Bool)

(assert (=> start!26518 m!290877))

(declare-fun m!290879 () Bool)

(assert (=> b!275267 m!290879))

(declare-fun m!290881 () Bool)

(assert (=> b!275266 m!290881))

(push 1)

(assert (not b!275264))

(assert (not b!275263))

(assert (not b!275267))

(assert (not start!26518))

(assert (not b!275262))

(assert (not b!275266))

(check-sat)

