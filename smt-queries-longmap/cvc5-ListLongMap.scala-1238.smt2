; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25986 () Bool)

(assert start!25986)

(declare-fun b!268141 () Bool)

(declare-fun res!132420 () Bool)

(declare-fun e!173242 () Bool)

(assert (=> b!268141 (=> (not res!132420) (not e!173242))))

(declare-datatypes ((array!13083 0))(
  ( (array!13084 (arr!6191 (Array (_ BitVec 32) (_ BitVec 64))) (size!6543 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13083)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268141 (= res!132420 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268142 () Bool)

(declare-fun res!132419 () Bool)

(assert (=> b!268142 (=> (not res!132419) (not e!173242))))

(declare-datatypes ((List!3999 0))(
  ( (Nil!3996) (Cons!3995 (h!4662 (_ BitVec 64)) (t!9081 List!3999)) )
))
(declare-fun arrayNoDuplicates!0 (array!13083 (_ BitVec 32) List!3999) Bool)

(assert (=> b!268142 (= res!132419 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3996))))

(declare-fun res!132423 () Bool)

(assert (=> start!25986 (=> (not res!132423) (not e!173242))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25986 (= res!132423 (validMask!0 mask!3868))))

(assert (=> start!25986 e!173242))

(declare-fun array_inv!4154 (array!13083) Bool)

(assert (=> start!25986 (array_inv!4154 a!3325)))

(assert (=> start!25986 true))

(declare-fun b!268143 () Bool)

(declare-fun res!132422 () Bool)

(assert (=> b!268143 (=> (not res!132422) (not e!173242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268143 (= res!132422 (validKeyInArray!0 k!2581))))

(declare-fun b!268144 () Bool)

(declare-fun res!132421 () Bool)

(assert (=> b!268144 (=> (not res!132421) (not e!173242))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268144 (= res!132421 (and (= (size!6543 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6543 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6543 a!3325))))))

(declare-datatypes ((SeekEntryResult!1349 0))(
  ( (MissingZero!1349 (index!7566 (_ BitVec 32))) (Found!1349 (index!7567 (_ BitVec 32))) (Intermediate!1349 (undefined!2161 Bool) (index!7568 (_ BitVec 32)) (x!25938 (_ BitVec 32))) (Undefined!1349) (MissingVacant!1349 (index!7569 (_ BitVec 32))) )
))
(declare-fun lt!134794 () SeekEntryResult!1349)

(declare-fun b!268145 () Bool)

(assert (=> b!268145 (= e!173242 (and (or (= lt!134794 (MissingZero!1349 i!1267)) (= lt!134794 (MissingVacant!1349 i!1267))) (bvsgt #b00000000000000000000000000000000 (size!6543 a!3325))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13083 (_ BitVec 32)) SeekEntryResult!1349)

(assert (=> b!268145 (= lt!134794 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!25986 res!132423) b!268144))

(assert (= (and b!268144 res!132421) b!268143))

(assert (= (and b!268143 res!132422) b!268142))

(assert (= (and b!268142 res!132419) b!268141))

(assert (= (and b!268141 res!132420) b!268145))

(declare-fun m!284343 () Bool)

(assert (=> b!268143 m!284343))

(declare-fun m!284345 () Bool)

(assert (=> b!268142 m!284345))

(declare-fun m!284347 () Bool)

(assert (=> b!268145 m!284347))

(declare-fun m!284349 () Bool)

(assert (=> start!25986 m!284349))

(declare-fun m!284351 () Bool)

(assert (=> start!25986 m!284351))

(declare-fun m!284353 () Bool)

(assert (=> b!268141 m!284353))

(push 1)

(assert (not b!268142))

