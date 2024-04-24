; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117962 () Bool)

(assert start!117962)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94328 0))(
  ( (array!94329 (arr!45549 (Array (_ BitVec 32) (_ BitVec 64))) (size!46100 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94328)

(assert (=> start!117962 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46100 a!3464)) (bvslt (size!46100 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94) (bvsge from!2839 (size!46100 a!3464)))))

(assert (=> start!117962 true))

(declare-fun array_inv!34830 (array!94328) Bool)

(assert (=> start!117962 (array_inv!34830 a!3464)))

(declare-fun bs!39984 () Bool)

(assert (= bs!39984 start!117962))

(declare-fun m!1267943 () Bool)

(assert (=> bs!39984 m!1267943))

(push 1)

(assert (not start!117962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

