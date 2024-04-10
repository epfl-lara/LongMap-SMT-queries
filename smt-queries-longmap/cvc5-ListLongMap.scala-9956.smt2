; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117594 () Bool)

(assert start!117594)

(declare-fun res!922683 () Bool)

(declare-fun e!782497 () Bool)

(assert (=> start!117594 (=> (not res!922683) (not e!782497))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94112 0))(
  ( (array!94113 (arr!45449 (Array (_ BitVec 32) (_ BitVec 64))) (size!45999 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94112)

(assert (=> start!117594 (= res!922683 (and (bvslt (size!45999 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45999 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117594 e!782497))

(declare-fun array_inv!34477 (array!94112) Bool)

(assert (=> start!117594 (array_inv!34477 a!3931)))

(assert (=> start!117594 true))

(declare-fun b!1380749 () Bool)

(declare-fun res!922684 () Bool)

(assert (=> b!1380749 (=> (not res!922684) (not e!782497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380749 (= res!922684 (not (validKeyInArray!0 (select (arr!45449 a!3931) (bvsub to!105 #b00000000000000000000000000000001)))))))

(declare-fun b!1380750 () Bool)

(assert (=> b!1380750 (= e!782497 (bvsgt from!3309 to!105))))

(assert (= (and start!117594 res!922683) b!1380749))

(assert (= (and b!1380749 res!922684) b!1380750))

(declare-fun m!1265979 () Bool)

(assert (=> start!117594 m!1265979))

(declare-fun m!1265981 () Bool)

(assert (=> b!1380749 m!1265981))

(assert (=> b!1380749 m!1265981))

(declare-fun m!1265983 () Bool)

(assert (=> b!1380749 m!1265983))

(push 1)

(assert (not b!1380749))

(assert (not start!117594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

