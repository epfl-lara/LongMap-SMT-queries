; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137250 () Bool)

(assert start!137250)

(declare-fun b!1581287 () Bool)

(declare-fun res!1079651 () Bool)

(declare-fun e!882170 () Bool)

(assert (=> b!1581287 (=> (not res!1079651) (not e!882170))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105939 0))(
  ( (array!105940 (arr!51069 (Array (_ BitVec 32) (_ BitVec 64))) (size!51620 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105939)

(declare-fun arrayContainsKey!0 (array!105939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581287 (= res!1079651 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1581286 () Bool)

(declare-fun res!1079648 () Bool)

(assert (=> b!1581286 (=> (not res!1079648) (not e!882170))))

(assert (=> b!1581286 (= res!1079648 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51620 a!3559))))))

(declare-fun b!1581288 () Bool)

(assert (=> b!1581288 (= e!882170 (not true))))

(assert (=> b!1581288 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52105 0))(
  ( (Unit!52106) )
))
(declare-fun lt!677238 () Unit!52105)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105939 (_ BitVec 64) (_ BitVec 32)) Unit!52105)

(assert (=> b!1581288 (= lt!677238 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1581285 () Bool)

(declare-fun res!1079650 () Bool)

(assert (=> b!1581285 (=> (not res!1079650) (not e!882170))))

(assert (=> b!1581285 (= res!1079650 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun res!1079649 () Bool)

(assert (=> start!137250 (=> (not res!1079649) (not e!882170))))

(assert (=> start!137250 (= res!1079649 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51620 a!3559)) (bvslt (size!51620 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137250 e!882170))

(assert (=> start!137250 true))

(declare-fun array_inv!40024 (array!105939) Bool)

(assert (=> start!137250 (array_inv!40024 a!3559)))

(assert (= (and start!137250 res!1079649) b!1581285))

(assert (= (and b!1581285 res!1079650) b!1581286))

(assert (= (and b!1581286 res!1079648) b!1581287))

(assert (= (and b!1581287 res!1079651) b!1581288))

(declare-fun m!1453127 () Bool)

(assert (=> b!1581287 m!1453127))

(declare-fun m!1453129 () Bool)

(assert (=> b!1581288 m!1453129))

(declare-fun m!1453131 () Bool)

(assert (=> b!1581288 m!1453131))

(declare-fun m!1453133 () Bool)

(assert (=> b!1581285 m!1453133))

(declare-fun m!1453135 () Bool)

(assert (=> start!137250 m!1453135))

(push 1)

(assert (not b!1581287))

(assert (not start!137250))

(assert (not b!1581285))

(assert (not b!1581288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

