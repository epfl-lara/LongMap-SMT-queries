; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25978 () Bool)

(assert start!25978)

(declare-fun b!268128 () Bool)

(declare-fun res!132384 () Bool)

(declare-fun e!173242 () Bool)

(assert (=> b!268128 (=> (not res!132384) (not e!173242))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268128 (= res!132384 (validKeyInArray!0 k!2581))))

(declare-fun b!268129 () Bool)

(declare-fun res!132381 () Bool)

(assert (=> b!268129 (=> (not res!132381) (not e!173242))))

(declare-datatypes ((array!13074 0))(
  ( (array!13075 (arr!6186 (Array (_ BitVec 32) (_ BitVec 64))) (size!6538 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13074)

(declare-fun arrayContainsKey!0 (array!13074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268129 (= res!132381 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268130 () Bool)

(declare-fun res!132380 () Bool)

(assert (=> b!268130 (=> (not res!132380) (not e!173242))))

(declare-datatypes ((List!3907 0))(
  ( (Nil!3904) (Cons!3903 (h!4570 (_ BitVec 64)) (t!8981 List!3907)) )
))
(declare-fun arrayNoDuplicates!0 (array!13074 (_ BitVec 32) List!3907) Bool)

(assert (=> b!268130 (= res!132380 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3904))))

(declare-fun res!132382 () Bool)

(assert (=> start!25978 (=> (not res!132382) (not e!173242))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25978 (= res!132382 (validMask!0 mask!3868))))

(assert (=> start!25978 e!173242))

(declare-fun array_inv!4136 (array!13074) Bool)

(assert (=> start!25978 (array_inv!4136 a!3325)))

(assert (=> start!25978 true))

(declare-fun b!268131 () Bool)

(declare-fun res!132383 () Bool)

(assert (=> b!268131 (=> (not res!132383) (not e!173242))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268131 (= res!132383 (and (= (size!6538 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6538 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6538 a!3325))))))

(declare-fun b!268132 () Bool)

(assert (=> b!268132 (= e!173242 false)))

(declare-datatypes ((SeekEntryResult!1309 0))(
  ( (MissingZero!1309 (index!7406 (_ BitVec 32))) (Found!1309 (index!7407 (_ BitVec 32))) (Intermediate!1309 (undefined!2121 Bool) (index!7408 (_ BitVec 32)) (x!25882 (_ BitVec 32))) (Undefined!1309) (MissingVacant!1309 (index!7409 (_ BitVec 32))) )
))
(declare-fun lt!134841 () SeekEntryResult!1309)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13074 (_ BitVec 32)) SeekEntryResult!1309)

(assert (=> b!268132 (= lt!134841 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!25978 res!132382) b!268131))

(assert (= (and b!268131 res!132383) b!268128))

(assert (= (and b!268128 res!132384) b!268130))

(assert (= (and b!268130 res!132380) b!268129))

(assert (= (and b!268129 res!132381) b!268132))

(declare-fun m!284501 () Bool)

(assert (=> b!268128 m!284501))

(declare-fun m!284503 () Bool)

(assert (=> start!25978 m!284503))

(declare-fun m!284505 () Bool)

(assert (=> start!25978 m!284505))

(declare-fun m!284507 () Bool)

(assert (=> b!268129 m!284507))

(declare-fun m!284509 () Bool)

(assert (=> b!268130 m!284509))

(declare-fun m!284511 () Bool)

(assert (=> b!268132 m!284511))

(push 1)

(assert (not start!25978))

(assert (not b!268129))

(assert (not b!268130))

(assert (not b!268132))

(assert (not b!268128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

