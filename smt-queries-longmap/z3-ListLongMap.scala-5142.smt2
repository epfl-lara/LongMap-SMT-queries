; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69752 () Bool)

(assert start!69752)

(declare-datatypes ((array!44169 0))(
  ( (array!44170 (arr!21152 (Array (_ BitVec 32) (_ BitVec 64))) (size!21573 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44169)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44169)

(assert (=> start!69752 (and (= (size!21573 a1!214) (size!21573 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21573 a1!214)) (bvslt (size!21573 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21573 a2!179)))))

(declare-fun array_inv!17035 (array!44169) Bool)

(assert (=> start!69752 (array_inv!17035 a1!214)))

(assert (=> start!69752 (array_inv!17035 a2!179)))

(assert (=> start!69752 true))

(declare-fun bs!22499 () Bool)

(assert (= bs!22499 start!69752))

(declare-fun m!753705 () Bool)

(assert (=> bs!22499 m!753705))

(declare-fun m!753707 () Bool)

(assert (=> bs!22499 m!753707))

(check-sat (not start!69752))
(check-sat)
