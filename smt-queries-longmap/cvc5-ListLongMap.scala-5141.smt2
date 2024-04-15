; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69750 () Bool)

(assert start!69750)

(declare-datatypes ((array!44167 0))(
  ( (array!44168 (arr!21151 (Array (_ BitVec 32) (_ BitVec 64))) (size!21572 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44167)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun a1!214 () array!44167)

(declare-fun from!2863 () (_ BitVec 32))

(assert (=> start!69750 (and (= (size!21572 a1!214) (size!21572 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21572 a1!214)) (bvslt (size!21572 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21572 a1!214)))))

(declare-fun array_inv!17034 (array!44167) Bool)

(assert (=> start!69750 (array_inv!17034 a1!214)))

(assert (=> start!69750 (array_inv!17034 a2!179)))

(assert (=> start!69750 true))

(declare-fun bs!22495 () Bool)

(assert (= bs!22495 start!69750))

(declare-fun m!753701 () Bool)

(assert (=> bs!22495 m!753701))

(declare-fun m!753703 () Bool)

(assert (=> bs!22495 m!753703))

(push 1)

(assert (not start!69750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

