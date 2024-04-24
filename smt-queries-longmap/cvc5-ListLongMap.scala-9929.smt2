; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117632 () Bool)

(assert start!117632)

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94067 0))(
  ( (array!94068 (arr!45423 (Array (_ BitVec 32) (_ BitVec 64))) (size!45974 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94067)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117632 (and (bvslt (size!45974 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45974 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363) (or (bvsle to!159 from!3363) (bvsge knownPivot!5 to!159)))))

(assert (=> start!117632 true))

(declare-fun array_inv!34704 (array!94067) Bool)

(assert (=> start!117632 (array_inv!34704 a!3985)))

(declare-fun bs!39819 () Bool)

(assert (= bs!39819 start!117632))

(declare-fun m!1266815 () Bool)

(assert (=> bs!39819 m!1266815))

(push 1)

(assert (not start!117632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

