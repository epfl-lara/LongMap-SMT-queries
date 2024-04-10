; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117730 () Bool)

(assert start!117730)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94212 0))(
  ( (array!94213 (arr!45496 (Array (_ BitVec 32) (_ BitVec 64))) (size!46046 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94212)

(assert (=> start!117730 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46046 a!3464)) (bvslt (size!46046 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94) (bvsge from!2839 (size!46046 a!3464)))))

(assert (=> start!117730 true))

(declare-fun array_inv!34524 (array!94212) Bool)

(assert (=> start!117730 (array_inv!34524 a!3464)))

(declare-fun bs!39967 () Bool)

(assert (= bs!39967 start!117730))

(declare-fun m!1266307 () Bool)

(assert (=> bs!39967 m!1266307))

(push 1)

(assert (not start!117730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

