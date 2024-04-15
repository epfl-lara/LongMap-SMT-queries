; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69742 () Bool)

(assert start!69742)

(declare-datatypes ((array!44159 0))(
  ( (array!44160 (arr!21147 (Array (_ BitVec 32) (_ BitVec 64))) (size!21568 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44159)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44159)

(assert (=> start!69742 (and (= (size!21568 a1!214) (size!21568 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21568 a1!214)) (bvslt (size!21568 a1!214) #b01111111111111111111111111111111) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!17030 (array!44159) Bool)

(assert (=> start!69742 (array_inv!17030 a1!214)))

(assert (=> start!69742 (array_inv!17030 a2!179)))

(assert (=> start!69742 true))

(declare-fun bs!22488 () Bool)

(assert (= bs!22488 start!69742))

(declare-fun m!753685 () Bool)

(assert (=> bs!22488 m!753685))

(declare-fun m!753687 () Bool)

(assert (=> bs!22488 m!753687))

(push 1)

(assert (not start!69742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

