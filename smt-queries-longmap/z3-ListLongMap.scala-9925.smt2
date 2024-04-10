; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117320 () Bool)

(assert start!117320)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93916 0))(
  ( (array!93917 (arr!45357 (Array (_ BitVec 32) (_ BitVec 64))) (size!45907 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93916)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117320 (and (bvslt (size!45907 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45907 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvslt pivot!64 #b00000000000000000000000000000000))))

(declare-fun array_inv!34385 (array!93916) Bool)

(assert (=> start!117320 (array_inv!34385 a!4010)))

(assert (=> start!117320 true))

(declare-fun bs!39777 () Bool)

(assert (= bs!39777 start!117320))

(declare-fun m!1264961 () Bool)

(assert (=> bs!39777 m!1264961))

(check-sat (not start!117320))
(check-sat)
