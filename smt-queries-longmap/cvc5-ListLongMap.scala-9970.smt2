; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117720 () Bool)

(assert start!117720)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94202 0))(
  ( (array!94203 (arr!45491 (Array (_ BitVec 32) (_ BitVec 64))) (size!46041 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94202)

(assert (=> start!117720 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46041 a!3464)) (bvslt (size!46041 a!3464) #b01111111111111111111111111111111) (bvsge from!2839 to!94) (bvsgt #b00000000000000000000000000000000 (bvsub (size!46041 a!3464) from!2839)))))

(assert (=> start!117720 true))

(declare-fun array_inv!34519 (array!94202) Bool)

(assert (=> start!117720 (array_inv!34519 a!3464)))

(declare-fun bs!39959 () Bool)

(assert (= bs!39959 start!117720))

(declare-fun m!1266297 () Bool)

(assert (=> bs!39959 m!1266297))

(push 1)

(assert (not start!117720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

