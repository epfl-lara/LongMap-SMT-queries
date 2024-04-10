; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117596 () Bool)

(assert start!117596)

(declare-fun res!922689 () Bool)

(declare-fun e!782503 () Bool)

(assert (=> start!117596 (=> (not res!922689) (not e!782503))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94114 0))(
  ( (array!94115 (arr!45450 (Array (_ BitVec 32) (_ BitVec 64))) (size!46000 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94114)

(assert (=> start!117596 (= res!922689 (and (bvslt (size!46000 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46000 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117596 e!782503))

(declare-fun array_inv!34478 (array!94114) Bool)

(assert (=> start!117596 (array_inv!34478 a!3931)))

(assert (=> start!117596 true))

(declare-fun b!1380755 () Bool)

(declare-fun res!922690 () Bool)

(assert (=> b!1380755 (=> (not res!922690) (not e!782503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380755 (= res!922690 (not (validKeyInArray!0 (select (arr!45450 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1380756 () Bool)

(assert (=> b!1380756 (= e!782503 (bvsgt from!3309 to!105))))

(assert (= (and start!117596 res!922689) b!1380755))

(assert (= (and b!1380755 res!922690) b!1380756))

(declare-fun m!1265985 () Bool)

(assert (=> start!117596 m!1265985))

(declare-fun m!1265987 () Bool)

(assert (=> b!1380755 m!1265987))

(assert (=> b!1380755 m!1265987))

(declare-fun m!1265989 () Bool)

(assert (=> b!1380755 m!1265989))

(check-sat (not b!1380755) (not start!117596))
(check-sat)
