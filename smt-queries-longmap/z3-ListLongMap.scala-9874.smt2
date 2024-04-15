; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116926 () Bool)

(assert start!116926)

(declare-datatypes ((array!93549 0))(
  ( (array!93550 (arr!45178 (Array (_ BitVec 32) (_ BitVec 64))) (size!45730 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93549)

(declare-fun from!3579 () (_ BitVec 32))

(declare-fun to!375 () (_ BitVec 32))

(assert (=> start!116926 (and (bvslt (size!45730 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45730 a!4212)) (bvslt to!375 #b00000000000000000000000000000000))))

(declare-fun array_inv!34411 (array!93549) Bool)

(assert (=> start!116926 (array_inv!34411 a!4212)))

(assert (=> start!116926 true))

(declare-fun bs!39569 () Bool)

(assert (= bs!39569 start!116926))

(declare-fun m!1261547 () Bool)

(assert (=> bs!39569 m!1261547))

(check-sat (not start!116926))
(check-sat)
