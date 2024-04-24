; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69936 () Bool)

(assert start!69936)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-datatypes ((array!44169 0))(
  ( (array!44170 (arr!21147 (Array (_ BitVec 32) (_ BitVec 64))) (size!21567 (_ BitVec 32))) )
))
(declare-fun a1!214 () array!44169)

(declare-fun a2!179 () array!44169)

(assert (=> start!69936 (and (= (size!21567 a1!214) (size!21567 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21567 a1!214)) (bvslt (size!21567 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21567 a1!214)))))

(declare-fun array_inv!17006 (array!44169) Bool)

(assert (=> start!69936 (array_inv!17006 a1!214)))

(assert (=> start!69936 (array_inv!17006 a2!179)))

(assert (=> start!69936 true))

(declare-fun bs!22541 () Bool)

(assert (= bs!22541 start!69936))

(declare-fun m!755735 () Bool)

(assert (=> bs!22541 m!755735))

(declare-fun m!755737 () Bool)

(assert (=> bs!22541 m!755737))

(push 1)

(assert (not start!69936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

