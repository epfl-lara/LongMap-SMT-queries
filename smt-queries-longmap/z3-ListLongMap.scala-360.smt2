; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6972 () Bool)

(assert start!6972)

(declare-datatypes ((array!2983 0))(
  ( (array!2984 (arr!1435 (Array (_ BitVec 32) (_ BitVec 64))) (size!1653 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2983)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6972 (and (bvslt (size!1653 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1653 a!4412)) (= (size!1653 a!4412) size!30) (bvslt size!30 #b00000000000000000000000000000000))))

(declare-fun array_inv!847 (array!2983) Bool)

(assert (=> start!6972 (array_inv!847 a!4412)))

(assert (=> start!6972 true))

(declare-fun bs!2083 () Bool)

(assert (= bs!2083 start!6972))

(declare-fun m!39751 () Bool)

(assert (=> bs!2083 m!39751))

(check-sat (not start!6972))
(check-sat)
