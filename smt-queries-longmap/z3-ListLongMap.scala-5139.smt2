; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69756 () Bool)

(assert start!69756)

(declare-datatypes ((array!44156 0))(
  ( (array!44157 (arr!21145 (Array (_ BitVec 32) (_ BitVec 64))) (size!21566 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44156)

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44156)

(declare-fun to!101 () (_ BitVec 32))

(assert (=> start!69756 (and (= (size!21566 a1!214) (size!21566 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21566 a1!214)) (bvslt (size!21566 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21145 a1!214) from!2863) (select (arr!21145 a2!179) from!2863)) (bvslt (bvadd #b00000000000000000000000000000001 from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!16941 (array!44156) Bool)

(assert (=> start!69756 (array_inv!16941 a1!214)))

(assert (=> start!69756 (array_inv!16941 a2!179)))

(assert (=> start!69756 true))

(declare-fun bs!22514 () Bool)

(assert (= bs!22514 start!69756))

(declare-fun m!754417 () Bool)

(assert (=> bs!22514 m!754417))

(declare-fun m!754419 () Bool)

(assert (=> bs!22514 m!754419))

(declare-fun m!754421 () Bool)

(assert (=> bs!22514 m!754421))

(declare-fun m!754423 () Bool)

(assert (=> bs!22514 m!754423))

(check-sat (not start!69756))
(check-sat)
