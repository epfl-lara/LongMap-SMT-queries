; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85528 () Bool)

(assert start!85528)

(declare-datatypes ((array!62809 0))(
  ( (array!62810 (arr!30248 (Array (_ BitVec 32) (_ BitVec 64))) (size!30745 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62809)

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85528 (and (= (size!30745 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (bvslt size!36 #b00000000000000000000000000000000))))

(declare-fun array_inv!23372 (array!62809) Bool)

(assert (=> start!85528 (array_inv!23372 a!4424)))

(assert (=> start!85528 true))

(declare-fun bs!28313 () Bool)

(assert (= bs!28313 start!85528))

(declare-fun m!921453 () Bool)

(assert (=> bs!28313 m!921453))

(check-sat (not start!85528))
(check-sat)
(get-model)

(declare-fun d!118555 () Bool)

(assert (=> d!118555 (= (array_inv!23372 a!4424) (bvsge (size!30745 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85528 d!118555))

(check-sat)
