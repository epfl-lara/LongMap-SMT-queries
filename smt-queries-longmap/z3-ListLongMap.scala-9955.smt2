; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117590 () Bool)

(assert start!117590)

(declare-fun res!922671 () Bool)

(declare-fun e!782485 () Bool)

(assert (=> start!117590 (=> (not res!922671) (not e!782485))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94108 0))(
  ( (array!94109 (arr!45447 (Array (_ BitVec 32) (_ BitVec 64))) (size!45997 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94108)

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117590 (= res!922671 (and (bvslt (size!45997 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45997 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117590 e!782485))

(declare-fun array_inv!34475 (array!94108) Bool)

(assert (=> start!117590 (array_inv!34475 a!3931)))

(assert (=> start!117590 true))

(declare-fun b!1380737 () Bool)

(declare-fun res!922672 () Bool)

(assert (=> b!1380737 (=> (not res!922672) (not e!782485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380737 (= res!922672 (not (validKeyInArray!0 (select (arr!45447 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1380738 () Bool)

(assert (=> b!1380738 (= e!782485 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!45997 a!3931)))))

(assert (= (and start!117590 res!922671) b!1380737))

(assert (= (and b!1380737 res!922672) b!1380738))

(declare-fun m!1265967 () Bool)

(assert (=> start!117590 m!1265967))

(declare-fun m!1265969 () Bool)

(assert (=> b!1380737 m!1265969))

(assert (=> b!1380737 m!1265969))

(declare-fun m!1265971 () Bool)

(assert (=> b!1380737 m!1265971))

(check-sat (not start!117590) (not b!1380737))
(check-sat)
