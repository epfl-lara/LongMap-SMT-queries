; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117272 () Bool)

(assert start!117272)

(declare-fun res!922072 () Bool)

(declare-fun e!781549 () Bool)

(assert (=> start!117272 (=> (not res!922072) (not e!781549))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(declare-datatypes ((array!93868 0))(
  ( (array!93869 (arr!45333 (Array (_ BitVec 32) (_ BitVec 64))) (size!45883 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93868)

(assert (=> start!117272 (= res!922072 (and (bvslt (size!45883 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45883 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117272 e!781549))

(declare-fun array_inv!34361 (array!93868) Bool)

(assert (=> start!117272 (array_inv!34361 a!4010)))

(assert (=> start!117272 true))

(declare-fun b!1379634 () Bool)

(assert (=> b!1379634 (= e!781549 false)))

(declare-fun lt!607686 () Bool)

(declare-fun isPivot!0 (array!93868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379634 (= lt!607686 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and start!117272 res!922072) b!1379634))

(declare-fun m!1264801 () Bool)

(assert (=> start!117272 m!1264801))

(declare-fun m!1264803 () Bool)

(assert (=> b!1379634 m!1264803))

(check-sat (not b!1379634) (not start!117272))
