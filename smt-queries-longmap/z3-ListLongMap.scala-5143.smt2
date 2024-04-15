; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69758 () Bool)

(assert start!69758)

(declare-datatypes ((array!44175 0))(
  ( (array!44176 (arr!21155 (Array (_ BitVec 32) (_ BitVec 64))) (size!21576 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44175)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun a1!214 () array!44175)

(declare-fun from!2863 () (_ BitVec 32))

(assert (=> start!69758 (and (= (size!21576 a1!214) (size!21576 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21576 a1!214)) (bvslt (size!21576 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21155 a1!214) from!2863) (select (arr!21155 a2!179) from!2863)) (bvsge (bvsub to!101 from!2863) (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863)))))

(declare-fun array_inv!17038 (array!44175) Bool)

(assert (=> start!69758 (array_inv!17038 a1!214)))

(assert (=> start!69758 (array_inv!17038 a2!179)))

(assert (=> start!69758 true))

(declare-fun bs!22505 () Bool)

(assert (= bs!22505 start!69758))

(declare-fun m!753717 () Bool)

(assert (=> bs!22505 m!753717))

(declare-fun m!753719 () Bool)

(assert (=> bs!22505 m!753719))

(declare-fun m!753721 () Bool)

(assert (=> bs!22505 m!753721))

(declare-fun m!753723 () Bool)

(assert (=> bs!22505 m!753723))

(check-sat (not start!69758))
(check-sat)
