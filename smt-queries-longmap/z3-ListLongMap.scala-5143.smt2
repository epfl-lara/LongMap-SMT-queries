; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69780 () Bool)

(assert start!69780)

(declare-datatypes ((array!44180 0))(
  ( (array!44181 (arr!21157 (Array (_ BitVec 32) (_ BitVec 64))) (size!21578 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44180)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44180)

(assert (=> start!69780 (and (= (size!21578 a1!214) (size!21578 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21578 a1!214)) (bvslt (size!21578 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21157 a1!214) from!2863) (select (arr!21157 a2!179) from!2863)) (bvsge (bvsub to!101 from!2863) (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863)))))

(declare-fun array_inv!16953 (array!44180) Bool)

(assert (=> start!69780 (array_inv!16953 a1!214)))

(assert (=> start!69780 (array_inv!16953 a2!179)))

(assert (=> start!69780 true))

(declare-fun bs!22538 () Bool)

(assert (= bs!22538 start!69780))

(declare-fun m!754477 () Bool)

(assert (=> bs!22538 m!754477))

(declare-fun m!754479 () Bool)

(assert (=> bs!22538 m!754479))

(declare-fun m!754481 () Bool)

(assert (=> bs!22538 m!754481))

(declare-fun m!754483 () Bool)

(assert (=> bs!22538 m!754483))

(check-sat (not start!69780))
(check-sat)
