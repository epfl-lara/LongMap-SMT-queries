; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117586 () Bool)

(assert start!117586)

(declare-fun res!922659 () Bool)

(declare-fun e!782473 () Bool)

(assert (=> start!117586 (=> (not res!922659) (not e!782473))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94104 0))(
  ( (array!94105 (arr!45445 (Array (_ BitVec 32) (_ BitVec 64))) (size!45995 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94104)

(assert (=> start!117586 (= res!922659 (and (bvslt (size!45995 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45995 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117586 e!782473))

(declare-fun array_inv!34473 (array!94104) Bool)

(assert (=> start!117586 (array_inv!34473 a!3931)))

(assert (=> start!117586 true))

(declare-fun b!1380725 () Bool)

(declare-fun res!922660 () Bool)

(assert (=> b!1380725 (=> (not res!922660) (not e!782473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380725 (= res!922660 (validKeyInArray!0 (select (arr!45445 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun b!1380726 () Bool)

(assert (=> b!1380726 (= e!782473 (bvsgt from!3309 to!105))))

(assert (= (and start!117586 res!922659) b!1380725))

(assert (= (and b!1380725 res!922660) b!1380726))

(declare-fun m!1265955 () Bool)

(assert (=> start!117586 m!1265955))

(declare-fun m!1265957 () Bool)

(assert (=> b!1380725 m!1265957))

(assert (=> b!1380725 m!1265957))

(declare-fun m!1265959 () Bool)

(assert (=> b!1380725 m!1265959))

(push 1)

(assert (not b!1380725))

(assert (not start!117586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

