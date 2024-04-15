; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85508 () Bool)

(assert start!85508)

(declare-datatypes ((array!62744 0))(
  ( (array!62745 (arr!30216 (Array (_ BitVec 32) (_ BitVec 64))) (size!30714 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62744)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85508 (and (= (size!30714 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (bvslt size!36 #b00000000000000000000000000000000))))

(declare-fun array_inv!23359 (array!62744) Bool)

(assert (=> start!85508 (array_inv!23359 a!4424)))

(assert (=> start!85508 true))

(declare-fun bs!28279 () Bool)

(assert (= bs!28279 start!85508))

(declare-fun m!920693 () Bool)

(assert (=> bs!28279 m!920693))

(check-sat (not start!85508))
(check-sat)
(get-model)

(declare-fun d!118357 () Bool)

(assert (=> d!118357 (= (array_inv!23359 a!4424) (bvsge (size!30714 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85508 d!118357))

(check-sat)
