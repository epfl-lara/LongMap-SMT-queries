; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25978 () Bool)

(assert start!25978)

(declare-fun b!268081 () Bool)

(declare-fun res!132359 () Bool)

(declare-fun e!173219 () Bool)

(assert (=> b!268081 (=> (not res!132359) (not e!173219))))

(declare-datatypes ((array!13075 0))(
  ( (array!13076 (arr!6187 (Array (_ BitVec 32) (_ BitVec 64))) (size!6539 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13075)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268081 (= res!132359 (and (= (size!6539 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6539 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6539 a!3325))))))

(declare-fun b!268082 () Bool)

(declare-fun res!132361 () Bool)

(assert (=> b!268082 (=> (not res!132361) (not e!173219))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268082 (= res!132361 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268083 () Bool)

(assert (=> b!268083 (= e!173219 false)))

(declare-datatypes ((SeekEntryResult!1345 0))(
  ( (MissingZero!1345 (index!7550 (_ BitVec 32))) (Found!1345 (index!7551 (_ BitVec 32))) (Intermediate!1345 (undefined!2157 Bool) (index!7552 (_ BitVec 32)) (x!25918 (_ BitVec 32))) (Undefined!1345) (MissingVacant!1345 (index!7553 (_ BitVec 32))) )
))
(declare-fun lt!134782 () SeekEntryResult!1345)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13075 (_ BitVec 32)) SeekEntryResult!1345)

(assert (=> b!268083 (= lt!134782 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132360 () Bool)

(assert (=> start!25978 (=> (not res!132360) (not e!173219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25978 (= res!132360 (validMask!0 mask!3868))))

(assert (=> start!25978 e!173219))

(declare-fun array_inv!4150 (array!13075) Bool)

(assert (=> start!25978 (array_inv!4150 a!3325)))

(assert (=> start!25978 true))

(declare-fun b!268084 () Bool)

(declare-fun res!132363 () Bool)

(assert (=> b!268084 (=> (not res!132363) (not e!173219))))

(declare-datatypes ((List!3995 0))(
  ( (Nil!3992) (Cons!3991 (h!4658 (_ BitVec 64)) (t!9077 List!3995)) )
))
(declare-fun arrayNoDuplicates!0 (array!13075 (_ BitVec 32) List!3995) Bool)

(assert (=> b!268084 (= res!132363 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3992))))

(declare-fun b!268085 () Bool)

(declare-fun res!132362 () Bool)

(assert (=> b!268085 (=> (not res!132362) (not e!173219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268085 (= res!132362 (validKeyInArray!0 k!2581))))

(assert (= (and start!25978 res!132360) b!268081))

(assert (= (and b!268081 res!132359) b!268085))

(assert (= (and b!268085 res!132362) b!268084))

(assert (= (and b!268084 res!132363) b!268082))

(assert (= (and b!268082 res!132361) b!268083))

(declare-fun m!284295 () Bool)

(assert (=> b!268082 m!284295))

(declare-fun m!284297 () Bool)

(assert (=> b!268083 m!284297))

(declare-fun m!284299 () Bool)

(assert (=> start!25978 m!284299))

(declare-fun m!284301 () Bool)

(assert (=> start!25978 m!284301))

(declare-fun m!284303 () Bool)

(assert (=> b!268085 m!284303))

(declare-fun m!284305 () Bool)

(assert (=> b!268084 m!284305))

(push 1)

(assert (not start!25978))

(assert (not b!268085))

(assert (not b!268084))

(assert (not b!268082))

(assert (not b!268083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

