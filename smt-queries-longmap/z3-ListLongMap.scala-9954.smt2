; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117584 () Bool)

(assert start!117584)

(declare-fun res!922653 () Bool)

(declare-fun e!782467 () Bool)

(assert (=> start!117584 (=> (not res!922653) (not e!782467))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94102 0))(
  ( (array!94103 (arr!45444 (Array (_ BitVec 32) (_ BitVec 64))) (size!45994 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94102)

(assert (=> start!117584 (= res!922653 (and (bvslt (size!45994 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45994 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117584 e!782467))

(declare-fun array_inv!34472 (array!94102) Bool)

(assert (=> start!117584 (array_inv!34472 a!3931)))

(assert (=> start!117584 true))

(declare-fun b!1380719 () Bool)

(declare-fun res!922654 () Bool)

(assert (=> b!1380719 (=> (not res!922654) (not e!782467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380719 (= res!922654 (validKeyInArray!0 (select (arr!45444 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380720 () Bool)

(assert (=> b!1380720 (= e!782467 (bvsgt from!3309 to!105))))

(assert (= (and start!117584 res!922653) b!1380719))

(assert (= (and b!1380719 res!922654) b!1380720))

(declare-fun m!1265949 () Bool)

(assert (=> start!117584 m!1265949))

(declare-fun m!1265951 () Bool)

(assert (=> b!1380719 m!1265951))

(assert (=> b!1380719 m!1265951))

(declare-fun m!1265953 () Bool)

(assert (=> b!1380719 m!1265953))

(check-sat (not b!1380719) (not start!117584))
(check-sat)
