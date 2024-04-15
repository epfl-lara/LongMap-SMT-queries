; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25986 () Bool)

(assert start!25986)

(declare-fun b!267979 () Bool)

(declare-fun res!132313 () Bool)

(declare-fun e!173135 () Bool)

(assert (=> b!267979 (=> (not res!132313) (not e!173135))))

(declare-datatypes ((array!13072 0))(
  ( (array!13073 (arr!6185 (Array (_ BitVec 32) (_ BitVec 64))) (size!6538 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13072)

(declare-datatypes ((List!3966 0))(
  ( (Nil!3963) (Cons!3962 (h!4629 (_ BitVec 64)) (t!9039 List!3966)) )
))
(declare-fun arrayNoDuplicates!0 (array!13072 (_ BitVec 32) List!3966) Bool)

(assert (=> b!267979 (= res!132313 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3963))))

(declare-fun b!267980 () Bool)

(assert (=> b!267980 (= e!173135 false)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1342 0))(
  ( (MissingZero!1342 (index!7538 (_ BitVec 32))) (Found!1342 (index!7539 (_ BitVec 32))) (Intermediate!1342 (undefined!2154 Bool) (index!7540 (_ BitVec 32)) (x!25922 (_ BitVec 32))) (Undefined!1342) (MissingVacant!1342 (index!7541 (_ BitVec 32))) )
))
(declare-fun lt!134610 () SeekEntryResult!1342)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13072 (_ BitVec 32)) SeekEntryResult!1342)

(assert (=> b!267980 (= lt!134610 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132309 () Bool)

(assert (=> start!25986 (=> (not res!132309) (not e!173135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25986 (= res!132309 (validMask!0 mask!3868))))

(assert (=> start!25986 e!173135))

(declare-fun array_inv!4157 (array!13072) Bool)

(assert (=> start!25986 (array_inv!4157 a!3325)))

(assert (=> start!25986 true))

(declare-fun b!267981 () Bool)

(declare-fun res!132311 () Bool)

(assert (=> b!267981 (=> (not res!132311) (not e!173135))))

(declare-fun arrayContainsKey!0 (array!13072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267981 (= res!132311 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267982 () Bool)

(declare-fun res!132310 () Bool)

(assert (=> b!267982 (=> (not res!132310) (not e!173135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267982 (= res!132310 (validKeyInArray!0 k!2581))))

(declare-fun b!267983 () Bool)

(declare-fun res!132312 () Bool)

(assert (=> b!267983 (=> (not res!132312) (not e!173135))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267983 (= res!132312 (and (= (size!6538 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6538 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6538 a!3325))))))

(assert (= (and start!25986 res!132309) b!267983))

(assert (= (and b!267983 res!132312) b!267982))

(assert (= (and b!267982 res!132310) b!267979))

(assert (= (and b!267979 res!132313) b!267981))

(assert (= (and b!267981 res!132311) b!267980))

(declare-fun m!283739 () Bool)

(assert (=> b!267979 m!283739))

(declare-fun m!283741 () Bool)

(assert (=> b!267981 m!283741))

(declare-fun m!283743 () Bool)

(assert (=> b!267980 m!283743))

(declare-fun m!283745 () Bool)

(assert (=> b!267982 m!283745))

(declare-fun m!283747 () Bool)

(assert (=> start!25986 m!283747))

(declare-fun m!283749 () Bool)

(assert (=> start!25986 m!283749))

(push 1)

(assert (not start!25986))

(assert (not b!267980))

(assert (not b!267981))

(assert (not b!267982))

(assert (not b!267979))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

