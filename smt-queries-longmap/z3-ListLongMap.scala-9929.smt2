; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117398 () Bool)

(assert start!117398)

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93949 0))(
  ( (array!93950 (arr!45369 (Array (_ BitVec 32) (_ BitVec 64))) (size!45919 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93949)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117398 (and (bvslt (size!45919 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45919 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363) (or (bvsle to!159 from!3363) (bvsge knownPivot!5 to!159)))))

(assert (=> start!117398 true))

(declare-fun array_inv!34397 (array!93949) Bool)

(assert (=> start!117398 (array_inv!34397 a!3985)))

(declare-fun bs!39801 () Bool)

(assert (= bs!39801 start!117398))

(declare-fun m!1265177 () Bool)

(assert (=> bs!39801 m!1265177))

(check-sat (not start!117398))
(check-sat)
