; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85526 () Bool)

(assert start!85526)

(declare-datatypes ((array!62807 0))(
  ( (array!62808 (arr!30247 (Array (_ BitVec 32) (_ BitVec 64))) (size!30744 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62807)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85526 (and (= (size!30744 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (bvslt size!36 #b00000000000000000000000000000000))))

(declare-fun array_inv!23371 (array!62807) Bool)

(assert (=> start!85526 (array_inv!23371 a!4424)))

(assert (=> start!85526 true))

(declare-fun bs!28312 () Bool)

(assert (= bs!28312 start!85526))

(declare-fun m!921451 () Bool)

(assert (=> bs!28312 m!921451))

(push 1)

(assert (not start!85526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

