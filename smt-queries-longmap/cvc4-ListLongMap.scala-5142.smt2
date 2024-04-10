; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69776 () Bool)

(assert start!69776)

(declare-datatypes ((array!44176 0))(
  ( (array!44177 (arr!21155 (Array (_ BitVec 32) (_ BitVec 64))) (size!21576 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44176)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44176)

(assert (=> start!69776 (and (= (size!21576 a1!214) (size!21576 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21576 a1!214)) (bvslt (size!21576 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21576 a2!179)))))

(declare-fun array_inv!16951 (array!44176) Bool)

(assert (=> start!69776 (array_inv!16951 a1!214)))

(assert (=> start!69776 (array_inv!16951 a2!179)))

(assert (=> start!69776 true))

(declare-fun bs!22533 () Bool)

(assert (= bs!22533 start!69776))

(declare-fun m!754465 () Bool)

(assert (=> bs!22533 m!754465))

(declare-fun m!754467 () Bool)

(assert (=> bs!22533 m!754467))

(push 1)

(assert (not start!69776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

