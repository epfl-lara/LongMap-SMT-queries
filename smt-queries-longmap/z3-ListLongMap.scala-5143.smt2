; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69944 () Bool)

(assert start!69944)

(declare-datatypes ((array!44177 0))(
  ( (array!44178 (arr!21151 (Array (_ BitVec 32) (_ BitVec 64))) (size!21571 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44177)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44177)

(assert (=> start!69944 (and (= (size!21571 a1!214) (size!21571 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21571 a1!214)) (bvslt (size!21571 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21151 a1!214) from!2863) (select (arr!21151 a2!179) from!2863)) (bvsge (bvsub to!101 from!2863) (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863)))))

(declare-fun array_inv!17010 (array!44177) Bool)

(assert (=> start!69944 (array_inv!17010 a1!214)))

(assert (=> start!69944 (array_inv!17010 a2!179)))

(assert (=> start!69944 true))

(declare-fun bs!22551 () Bool)

(assert (= bs!22551 start!69944))

(declare-fun m!755751 () Bool)

(assert (=> bs!22551 m!755751))

(declare-fun m!755753 () Bool)

(assert (=> bs!22551 m!755753))

(declare-fun m!755755 () Bool)

(assert (=> bs!22551 m!755755))

(declare-fun m!755757 () Bool)

(assert (=> bs!22551 m!755757))

(check-sat (not start!69944))
(check-sat)
