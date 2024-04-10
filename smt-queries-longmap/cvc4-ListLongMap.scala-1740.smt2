; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31950 () Bool)

(assert start!31950)

(declare-fun res!173707 () Bool)

(declare-fun e!198340 () Bool)

(assert (=> start!31950 (=> (not res!173707) (not e!198340))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31950 (= res!173707 (validMask!0 mask!3777))))

(assert (=> start!31950 e!198340))

(assert (=> start!31950 true))

(declare-datatypes ((array!16270 0))(
  ( (array!16271 (arr!7699 (Array (_ BitVec 32) (_ BitVec 64))) (size!8051 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16270)

(declare-fun array_inv!5662 (array!16270) Bool)

(assert (=> start!31950 (array_inv!5662 a!3305)))

(declare-fun b!319323 () Bool)

(declare-fun res!173709 () Bool)

(assert (=> b!319323 (=> (not res!173709) (not e!198340))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319323 (= res!173709 (and (= (size!8051 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8051 a!3305))))))

(declare-fun b!319324 () Bool)

(declare-fun res!173708 () Bool)

(assert (=> b!319324 (=> (not res!173708) (not e!198340))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319324 (= res!173708 (validKeyInArray!0 k!2497))))

(declare-fun b!319325 () Bool)

(assert (=> b!319325 (= e!198340 (bvsge #b00000000000000000000000000000000 (size!8051 a!3305)))))

(assert (= (and start!31950 res!173707) b!319323))

(assert (= (and b!319323 res!173709) b!319324))

(assert (= (and b!319324 res!173708) b!319325))

(declare-fun m!327959 () Bool)

(assert (=> start!31950 m!327959))

(declare-fun m!327961 () Bool)

(assert (=> start!31950 m!327961))

(declare-fun m!327963 () Bool)

(assert (=> b!319324 m!327963))

(push 1)

(assert (not start!31950))

(assert (not b!319324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

