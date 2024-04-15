; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69734 () Bool)

(assert start!69734)

(declare-datatypes ((array!44151 0))(
  ( (array!44152 (arr!21143 (Array (_ BitVec 32) (_ BitVec 64))) (size!21564 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44151)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44151)

(assert (=> start!69734 (and (= (size!21564 a1!214) (size!21564 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21564 a1!214)) (bvslt (size!21564 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21143 a1!214) from!2863) (select (arr!21143 a2!179) from!2863)) (bvslt (bvadd #b00000000000000000000000000000001 from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!17026 (array!44151) Bool)

(assert (=> start!69734 (array_inv!17026 a1!214)))

(assert (=> start!69734 (array_inv!17026 a2!179)))

(assert (=> start!69734 true))

(declare-fun bs!22481 () Bool)

(assert (= bs!22481 start!69734))

(declare-fun m!753657 () Bool)

(assert (=> bs!22481 m!753657))

(declare-fun m!753659 () Bool)

(assert (=> bs!22481 m!753659))

(declare-fun m!753661 () Bool)

(assert (=> bs!22481 m!753661))

(declare-fun m!753663 () Bool)

(assert (=> bs!22481 m!753663))

(check-sat (not start!69734))
(check-sat)
