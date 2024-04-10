; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117576 () Bool)

(assert start!117576)

(declare-fun res!922629 () Bool)

(declare-fun e!782443 () Bool)

(assert (=> start!117576 (=> (not res!922629) (not e!782443))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94094 0))(
  ( (array!94095 (arr!45440 (Array (_ BitVec 32) (_ BitVec 64))) (size!45990 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94094)

(assert (=> start!117576 (= res!922629 (and (bvslt (size!45990 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45990 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117576 e!782443))

(declare-fun array_inv!34468 (array!94094) Bool)

(assert (=> start!117576 (array_inv!34468 a!3931)))

(assert (=> start!117576 true))

(declare-fun b!1380695 () Bool)

(declare-fun res!922630 () Bool)

(assert (=> b!1380695 (=> (not res!922630) (not e!782443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380695 (= res!922630 (validKeyInArray!0 (select (arr!45440 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380696 () Bool)

(assert (=> b!1380696 (= e!782443 (bvsgt (bvsub to!105 #b00000000000000000000000000000001) (size!45990 a!3931)))))

(assert (= (and start!117576 res!922629) b!1380695))

(assert (= (and b!1380695 res!922630) b!1380696))

(declare-fun m!1265925 () Bool)

(assert (=> start!117576 m!1265925))

(declare-fun m!1265927 () Bool)

(assert (=> b!1380695 m!1265927))

(assert (=> b!1380695 m!1265927))

(declare-fun m!1265929 () Bool)

(assert (=> b!1380695 m!1265929))

(push 1)

(assert (not b!1380695))

(assert (not start!117576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

