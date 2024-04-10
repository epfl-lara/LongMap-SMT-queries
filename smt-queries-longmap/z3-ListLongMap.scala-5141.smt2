; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69768 () Bool)

(assert start!69768)

(declare-datatypes ((array!44168 0))(
  ( (array!44169 (arr!21151 (Array (_ BitVec 32) (_ BitVec 64))) (size!21572 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44168)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44168)

(assert (=> start!69768 (and (= (size!21572 a1!214) (size!21572 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21572 a1!214)) (bvslt (size!21572 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21572 a1!214)))))

(declare-fun array_inv!16947 (array!44168) Bool)

(assert (=> start!69768 (array_inv!16947 a1!214)))

(assert (=> start!69768 (array_inv!16947 a2!179)))

(assert (=> start!69768 true))

(declare-fun bs!22526 () Bool)

(assert (= bs!22526 start!69768))

(declare-fun m!754449 () Bool)

(assert (=> bs!22526 m!754449))

(declare-fun m!754451 () Bool)

(assert (=> bs!22526 m!754451))

(check-sat (not start!69768))
(check-sat)
