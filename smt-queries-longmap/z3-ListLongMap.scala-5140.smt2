; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69762 () Bool)

(assert start!69762)

(declare-datatypes ((array!44162 0))(
  ( (array!44163 (arr!21148 (Array (_ BitVec 32) (_ BitVec 64))) (size!21569 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44162)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44162)

(assert (=> start!69762 (and (= (size!21569 a1!214) (size!21569 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21569 a1!214)) (bvslt (size!21569 a1!214) #b01111111111111111111111111111111) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!16944 (array!44162) Bool)

(assert (=> start!69762 (array_inv!16944 a1!214)))

(assert (=> start!69762 (array_inv!16944 a2!179)))

(assert (=> start!69762 true))

(declare-fun bs!22520 () Bool)

(assert (= bs!22520 start!69762))

(declare-fun m!754437 () Bool)

(assert (=> bs!22520 m!754437))

(declare-fun m!754439 () Bool)

(assert (=> bs!22520 m!754439))

(check-sat (not start!69762))
(check-sat)
