; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117588 () Bool)

(assert start!117588)

(declare-fun res!922665 () Bool)

(declare-fun e!782479 () Bool)

(assert (=> start!117588 (=> (not res!922665) (not e!782479))))

(declare-fun to!105 () (_ BitVec 32))

(declare-datatypes ((array!94106 0))(
  ( (array!94107 (arr!45446 (Array (_ BitVec 32) (_ BitVec 64))) (size!45996 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94106)

(declare-fun from!3309 () (_ BitVec 32))

(assert (=> start!117588 (= res!922665 (and (bvslt (size!45996 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45996 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117588 e!782479))

(declare-fun array_inv!34474 (array!94106) Bool)

(assert (=> start!117588 (array_inv!34474 a!3931)))

(assert (=> start!117588 true))

(declare-fun b!1380731 () Bool)

(declare-fun res!922666 () Bool)

(assert (=> b!1380731 (=> (not res!922666) (not e!782479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380731 (= res!922666 (not (validKeyInArray!0 (select (arr!45446 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1380732 () Bool)

(assert (=> b!1380732 (= e!782479 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!45996 a!3931)))))

(assert (= (and start!117588 res!922665) b!1380731))

(assert (= (and b!1380731 res!922666) b!1380732))

(declare-fun m!1265961 () Bool)

(assert (=> start!117588 m!1265961))

(declare-fun m!1265963 () Bool)

(assert (=> b!1380731 m!1265963))

(assert (=> b!1380731 m!1265963))

(declare-fun m!1265965 () Bool)

(assert (=> b!1380731 m!1265965))

(push 1)

(assert (not b!1380731))

(assert (not start!117588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

