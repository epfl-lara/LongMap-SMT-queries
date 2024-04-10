; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117616 () Bool)

(assert start!117616)

(declare-datatypes ((array!94134 0))(
  ( (array!94135 (arr!45460 (Array (_ BitVec 32) (_ BitVec 64))) (size!46010 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94134)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117616 (and (bvslt (size!46010 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46010 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsge (bvsub to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsub to!105 from!3309)))))

(declare-fun array_inv!34488 (array!94134) Bool)

(assert (=> start!117616 (array_inv!34488 a!3931)))

(assert (=> start!117616 true))

(declare-fun bs!39910 () Bool)

(assert (= bs!39910 start!117616))

(declare-fun m!1266013 () Bool)

(assert (=> bs!39910 m!1266013))

(push 1)

(assert (not start!117616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

