; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69766 () Bool)

(assert start!69766)

(declare-datatypes ((array!44166 0))(
  ( (array!44167 (arr!21150 (Array (_ BitVec 32) (_ BitVec 64))) (size!21571 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44166)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44166)

(assert (=> start!69766 (and (= (size!21571 a1!214) (size!21571 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21571 a1!214)) (bvslt (size!21571 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21571 a1!214)))))

(declare-fun array_inv!16946 (array!44166) Bool)

(assert (=> start!69766 (array_inv!16946 a1!214)))

(assert (=> start!69766 (array_inv!16946 a2!179)))

(assert (=> start!69766 true))

(declare-fun bs!22525 () Bool)

(assert (= bs!22525 start!69766))

(declare-fun m!754445 () Bool)

(assert (=> bs!22525 m!754445))

(declare-fun m!754447 () Bool)

(assert (=> bs!22525 m!754447))

(push 1)

(assert (not start!69766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

