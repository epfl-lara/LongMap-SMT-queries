; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117920 () Bool)

(assert start!117920)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94286 0))(
  ( (array!94287 (arr!45528 (Array (_ BitVec 32) (_ BitVec 64))) (size!46079 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94286)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117920 (and (bvslt (size!46079 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46079 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (bvsgt pivot!39 (size!46079 a!3978)))))

(declare-fun array_inv!34809 (array!94286) Bool)

(assert (=> start!117920 (array_inv!34809 a!3978)))

(assert (=> start!117920 true))

(declare-fun bs!39948 () Bool)

(assert (= bs!39948 start!117920))

(declare-fun m!1267877 () Bool)

(assert (=> bs!39948 m!1267877))

(push 1)

(assert (not start!117920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

