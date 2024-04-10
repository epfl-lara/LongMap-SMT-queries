; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85530 () Bool)

(assert start!85530)

(declare-datatypes ((array!62811 0))(
  ( (array!62812 (arr!30249 (Array (_ BitVec 32) (_ BitVec 64))) (size!30746 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62811)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85530 (and (= (size!30746 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (bvslt size!36 #b00000000000000000000000000000000))))

(declare-fun array_inv!23373 (array!62811) Bool)

(assert (=> start!85530 (array_inv!23373 a!4424)))

(assert (=> start!85530 true))

(declare-fun bs!28314 () Bool)

(assert (= bs!28314 start!85530))

(declare-fun m!921455 () Bool)

(assert (=> bs!28314 m!921455))

(push 1)

(assert (not start!85530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

