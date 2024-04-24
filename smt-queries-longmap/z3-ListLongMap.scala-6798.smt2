; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85694 () Bool)

(assert start!85694)

(declare-datatypes ((array!62852 0))(
  ( (array!62853 (arr!30265 (Array (_ BitVec 32) (_ BitVec 64))) (size!30762 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62852)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85694 (and (= (size!30762 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (bvslt size!36 #b00000000000000000000000000000000))))

(declare-fun array_inv!23401 (array!62852) Bool)

(assert (=> start!85694 (array_inv!23401 a!4424)))

(assert (=> start!85694 true))

(declare-fun bs!28325 () Bool)

(assert (= bs!28325 start!85694))

(declare-fun m!922745 () Bool)

(assert (=> bs!28325 m!922745))

(check-sat (not start!85694))
(check-sat)
(get-model)

(declare-fun d!118877 () Bool)

(assert (=> d!118877 (= (array_inv!23401 a!4424) (bvsge (size!30762 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85694 d!118877))

(check-sat)
