; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69928 () Bool)

(assert start!69928)

(declare-datatypes ((array!44161 0))(
  ( (array!44162 (arr!21143 (Array (_ BitVec 32) (_ BitVec 64))) (size!21563 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44161)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44161)

(assert (=> start!69928 (and (= (size!21563 a1!214) (size!21563 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21563 a1!214)) (bvslt (size!21563 a1!214) #b01111111111111111111111111111111) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!17002 (array!44161) Bool)

(assert (=> start!69928 (array_inv!17002 a1!214)))

(assert (=> start!69928 (array_inv!17002 a2!179)))

(assert (=> start!69928 true))

(declare-fun bs!22534 () Bool)

(assert (= bs!22534 start!69928))

(declare-fun m!755719 () Bool)

(assert (=> bs!22534 m!755719))

(declare-fun m!755721 () Bool)

(assert (=> bs!22534 m!755721))

(push 1)

(assert (not start!69928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

