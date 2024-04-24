; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137196 () Bool)

(assert start!137196)

(declare-fun res!1079420 () Bool)

(declare-fun e!882020 () Bool)

(assert (=> start!137196 (=> (not res!1079420) (not e!882020))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105894 0))(
  ( (array!105895 (arr!51048 (Array (_ BitVec 32) (_ BitVec 64))) (size!51599 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105894)

(assert (=> start!137196 (= res!1079420 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51599 a!3559)) (bvslt (size!51599 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137196 e!882020))

(assert (=> start!137196 true))

(declare-fun array_inv!40003 (array!105894) Bool)

(assert (=> start!137196 (array_inv!40003 a!3559)))

(declare-fun b!1581054 () Bool)

(declare-fun res!1079418 () Bool)

(assert (=> b!1581054 (=> (not res!1079418) (not e!882020))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581054 (= res!1079418 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1581057 () Bool)

(assert (=> b!1581057 (= e!882020 (not true))))

(assert (=> b!1581057 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52087 0))(
  ( (Unit!52088) )
))
(declare-fun lt!677211 () Unit!52087)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105894 (_ BitVec 64) (_ BitVec 32)) Unit!52087)

(assert (=> b!1581057 (= lt!677211 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1581055 () Bool)

(declare-fun res!1079417 () Bool)

(assert (=> b!1581055 (=> (not res!1079417) (not e!882020))))

(assert (=> b!1581055 (= res!1079417 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51599 a!3559))))))

(declare-fun b!1581056 () Bool)

(declare-fun res!1079419 () Bool)

(assert (=> b!1581056 (=> (not res!1079419) (not e!882020))))

(assert (=> b!1581056 (= res!1079419 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!137196 res!1079420) b!1581054))

(assert (= (and b!1581054 res!1079418) b!1581055))

(assert (= (and b!1581055 res!1079417) b!1581056))

(assert (= (and b!1581056 res!1079419) b!1581057))

(declare-fun m!1452953 () Bool)

(assert (=> start!137196 m!1452953))

(declare-fun m!1452955 () Bool)

(assert (=> b!1581054 m!1452955))

(declare-fun m!1452957 () Bool)

(assert (=> b!1581057 m!1452957))

(declare-fun m!1452959 () Bool)

(assert (=> b!1581057 m!1452959))

(declare-fun m!1452961 () Bool)

(assert (=> b!1581056 m!1452961))

(push 1)

(assert (not b!1581057))

(assert (not b!1581054))

(assert (not b!1581056))

(assert (not start!137196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

