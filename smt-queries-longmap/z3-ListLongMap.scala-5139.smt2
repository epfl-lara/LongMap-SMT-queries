; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69920 () Bool)

(assert start!69920)

(declare-datatypes ((array!44153 0))(
  ( (array!44154 (arr!21139 (Array (_ BitVec 32) (_ BitVec 64))) (size!21559 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44153)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44153)

(assert (=> start!69920 (and (= (size!21559 a1!214) (size!21559 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21559 a1!214)) (bvslt (size!21559 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21139 a1!214) from!2863) (select (arr!21139 a2!179) from!2863)) (bvslt (bvadd #b00000000000000000000000000000001 from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!16998 (array!44153) Bool)

(assert (=> start!69920 (array_inv!16998 a1!214)))

(assert (=> start!69920 (array_inv!16998 a2!179)))

(assert (=> start!69920 true))

(declare-fun bs!22527 () Bool)

(assert (= bs!22527 start!69920))

(declare-fun m!755691 () Bool)

(assert (=> bs!22527 m!755691))

(declare-fun m!755693 () Bool)

(assert (=> bs!22527 m!755693))

(declare-fun m!755695 () Bool)

(assert (=> bs!22527 m!755695))

(declare-fun m!755697 () Bool)

(assert (=> bs!22527 m!755697))

(check-sat (not start!69920))
(check-sat)
