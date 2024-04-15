; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117458 () Bool)

(assert start!117458)

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!93963 0))(
  ( (array!93964 (arr!45376 (Array (_ BitVec 32) (_ BitVec 64))) (size!45928 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!93963)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117458 (and (bvslt (size!45928 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45928 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001)) (bvsge pivot!34 to!135))))

(declare-fun array_inv!34609 (array!93963) Bool)

(assert (=> start!117458 (array_inv!34609 a!3961)))

(assert (=> start!117458 true))

(declare-fun bs!39808 () Bool)

(assert (= bs!39808 start!117458))

(declare-fun m!1264887 () Bool)

(assert (=> bs!39808 m!1264887))

(check-sat (not start!117458))
(check-sat)
