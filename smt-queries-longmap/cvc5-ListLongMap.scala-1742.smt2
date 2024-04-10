; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31972 () Bool)

(assert start!31972)

(declare-fun b!319364 () Bool)

(declare-fun e!198364 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!319364 (= e!198364 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319362 () Bool)

(declare-fun res!173748 () Bool)

(assert (=> b!319362 (=> (not res!173748) (not e!198364))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319362 (= res!173748 (validKeyInArray!0 k!2497))))

(declare-fun b!319361 () Bool)

(declare-fun res!173745 () Bool)

(assert (=> b!319361 (=> (not res!173745) (not e!198364))))

(declare-datatypes ((array!16279 0))(
  ( (array!16280 (arr!7703 (Array (_ BitVec 32) (_ BitVec 64))) (size!8055 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16279)

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319361 (= res!173745 (and (= (size!8055 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8055 a!3305))))))

(declare-fun b!319363 () Bool)

(declare-fun res!173746 () Bool)

(assert (=> b!319363 (=> (not res!173746) (not e!198364))))

(declare-fun arrayContainsKey!0 (array!16279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319363 (= res!173746 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173747 () Bool)

(assert (=> start!31972 (=> (not res!173747) (not e!198364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31972 (= res!173747 (validMask!0 mask!3777))))

(assert (=> start!31972 e!198364))

(assert (=> start!31972 true))

(declare-fun array_inv!5666 (array!16279) Bool)

(assert (=> start!31972 (array_inv!5666 a!3305)))

(assert (= (and start!31972 res!173747) b!319361))

(assert (= (and b!319361 res!173745) b!319362))

(assert (= (and b!319362 res!173748) b!319363))

(assert (= (and b!319363 res!173746) b!319364))

(declare-fun m!327983 () Bool)

(assert (=> b!319362 m!327983))

(declare-fun m!327985 () Bool)

(assert (=> b!319363 m!327985))

(declare-fun m!327987 () Bool)

(assert (=> start!31972 m!327987))

(declare-fun m!327989 () Bool)

(assert (=> start!31972 m!327989))

(push 1)

(assert (not start!31972))

(assert (not b!319362))

(assert (not b!319363))

(check-sat)

(pop 1)

