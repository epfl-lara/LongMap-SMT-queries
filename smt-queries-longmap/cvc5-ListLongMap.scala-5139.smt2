; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69754 () Bool)

(assert start!69754)

(declare-datatypes ((array!44154 0))(
  ( (array!44155 (arr!21144 (Array (_ BitVec 32) (_ BitVec 64))) (size!21565 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44154)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44154)

(assert (=> start!69754 (and (= (size!21565 a1!214) (size!21565 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21565 a1!214)) (bvslt (size!21565 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21144 a1!214) from!2863) (select (arr!21144 a2!179) from!2863)) (bvslt (bvadd #b00000000000000000000000000000001 from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!16940 (array!44154) Bool)

(assert (=> start!69754 (array_inv!16940 a1!214)))

(assert (=> start!69754 (array_inv!16940 a2!179)))

(assert (=> start!69754 true))

(declare-fun bs!22513 () Bool)

(assert (= bs!22513 start!69754))

(declare-fun m!754409 () Bool)

(assert (=> bs!22513 m!754409))

(declare-fun m!754411 () Bool)

(assert (=> bs!22513 m!754411))

(declare-fun m!754413 () Bool)

(assert (=> bs!22513 m!754413))

(declare-fun m!754415 () Bool)

(assert (=> bs!22513 m!754415))

(push 1)

(assert (not start!69754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

