; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117588 () Bool)

(assert start!117588)

(declare-fun res!922651 () Bool)

(declare-fun e!782460 () Bool)

(assert (=> start!117588 (=> (not res!922651) (not e!782460))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94060 0))(
  ( (array!94061 (arr!45423 (Array (_ BitVec 32) (_ BitVec 64))) (size!45975 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94060)

(assert (=> start!117588 (= res!922651 (and (bvslt (size!45975 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45975 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117588 e!782460))

(declare-fun array_inv!34656 (array!94060) Bool)

(assert (=> start!117588 (array_inv!34656 a!3931)))

(assert (=> start!117588 true))

(declare-fun b!1380674 () Bool)

(declare-fun res!922652 () Bool)

(assert (=> b!1380674 (=> (not res!922652) (not e!782460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380674 (= res!922652 (not (validKeyInArray!0 (select (arr!45423 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1380675 () Bool)

(assert (=> b!1380675 (= e!782460 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!45975 a!3931)))))

(assert (= (and start!117588 res!922651) b!1380674))

(assert (= (and b!1380674 res!922652) b!1380675))

(declare-fun m!1265469 () Bool)

(assert (=> start!117588 m!1265469))

(declare-fun m!1265471 () Bool)

(assert (=> b!1380674 m!1265471))

(assert (=> b!1380674 m!1265471))

(declare-fun m!1265473 () Bool)

(assert (=> b!1380674 m!1265473))

(push 1)

(assert (not b!1380674))

(assert (not start!117588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

