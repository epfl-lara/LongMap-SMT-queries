; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117582 () Bool)

(assert start!117582)

(declare-fun res!922647 () Bool)

(declare-fun e!782461 () Bool)

(assert (=> start!117582 (=> (not res!922647) (not e!782461))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94100 0))(
  ( (array!94101 (arr!45443 (Array (_ BitVec 32) (_ BitVec 64))) (size!45993 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94100)

(assert (=> start!117582 (= res!922647 (and (bvslt (size!45993 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45993 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117582 e!782461))

(declare-fun array_inv!34471 (array!94100) Bool)

(assert (=> start!117582 (array_inv!34471 a!3931)))

(assert (=> start!117582 true))

(declare-fun b!1380713 () Bool)

(declare-fun res!922648 () Bool)

(assert (=> b!1380713 (=> (not res!922648) (not e!782461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380713 (= res!922648 (validKeyInArray!0 (select (arr!45443 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380714 () Bool)

(assert (=> b!1380714 (= e!782461 (bvsgt from!3309 to!105))))

(assert (= (and start!117582 res!922647) b!1380713))

(assert (= (and b!1380713 res!922648) b!1380714))

(declare-fun m!1265943 () Bool)

(assert (=> start!117582 m!1265943))

(declare-fun m!1265945 () Bool)

(assert (=> b!1380713 m!1265945))

(assert (=> b!1380713 m!1265945))

(declare-fun m!1265947 () Bool)

(assert (=> b!1380713 m!1265947))

(push 1)

(assert (not b!1380713))

(assert (not start!117582))

(check-sat)

(pop 1)

(push 1)

(check-sat)

