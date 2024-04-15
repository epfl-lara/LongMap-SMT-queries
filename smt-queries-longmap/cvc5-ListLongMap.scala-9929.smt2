; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117396 () Bool)

(assert start!117396)

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93901 0))(
  ( (array!93902 (arr!45345 (Array (_ BitVec 32) (_ BitVec 64))) (size!45897 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93901)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117396 (and (bvslt (size!45897 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45897 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363) (or (bvsle to!159 from!3363) (bvsge knownPivot!5 to!159)))))

(assert (=> start!117396 true))

(declare-fun array_inv!34578 (array!93901) Bool)

(assert (=> start!117396 (array_inv!34578 a!3985)))

(declare-fun bs!39774 () Bool)

(assert (= bs!39774 start!117396))

(declare-fun m!1264675 () Bool)

(assert (=> bs!39774 m!1264675))

(push 1)

(assert (not start!117396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

