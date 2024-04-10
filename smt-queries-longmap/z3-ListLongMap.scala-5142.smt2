; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69774 () Bool)

(assert start!69774)

(declare-datatypes ((array!44174 0))(
  ( (array!44175 (arr!21154 (Array (_ BitVec 32) (_ BitVec 64))) (size!21575 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44174)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44174)

(assert (=> start!69774 (and (= (size!21575 a1!214) (size!21575 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21575 a1!214)) (bvslt (size!21575 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21575 a2!179)))))

(declare-fun array_inv!16950 (array!44174) Bool)

(assert (=> start!69774 (array_inv!16950 a1!214)))

(assert (=> start!69774 (array_inv!16950 a2!179)))

(assert (=> start!69774 true))

(declare-fun bs!22532 () Bool)

(assert (= bs!22532 start!69774))

(declare-fun m!754461 () Bool)

(assert (=> bs!22532 m!754461))

(declare-fun m!754463 () Bool)

(assert (=> bs!22532 m!754463))

(check-sat (not start!69774))
(check-sat)
