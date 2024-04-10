; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117400 () Bool)

(assert start!117400)

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-datatypes ((array!93951 0))(
  ( (array!93952 (arr!45370 (Array (_ BitVec 32) (_ BitVec 64))) (size!45920 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93951)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(assert (=> start!117400 (and (bvslt (size!45920 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45920 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363) (or (bvsle to!159 from!3363) (bvsge knownPivot!5 to!159)))))

(assert (=> start!117400 true))

(declare-fun array_inv!34398 (array!93951) Bool)

(assert (=> start!117400 (array_inv!34398 a!3985)))

(declare-fun bs!39802 () Bool)

(assert (= bs!39802 start!117400))

(declare-fun m!1265179 () Bool)

(assert (=> bs!39802 m!1265179))

(push 1)

(assert (not start!117400))

(check-sat)

(pop 1)

(push 1)

(check-sat)
