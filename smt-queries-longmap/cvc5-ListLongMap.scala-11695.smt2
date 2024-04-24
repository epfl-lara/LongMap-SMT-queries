; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137208 () Bool)

(assert start!137208)

(declare-fun b!1581126 () Bool)

(declare-fun res!1079490 () Bool)

(declare-fun e!882056 () Bool)

(assert (=> b!1581126 (=> (not res!1079490) (not e!882056))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105906 0))(
  ( (array!105907 (arr!51054 (Array (_ BitVec 32) (_ BitVec 64))) (size!51605 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105906)

(declare-fun arrayContainsKey!0 (array!105906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581126 (= res!1079490 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1581129 () Bool)

(assert (=> b!1581129 (= e!882056 (not true))))

(assert (=> b!1581129 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52099 0))(
  ( (Unit!52100) )
))
(declare-fun lt!677229 () Unit!52099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105906 (_ BitVec 64) (_ BitVec 32)) Unit!52099)

(assert (=> b!1581129 (= lt!677229 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1079491 () Bool)

(assert (=> start!137208 (=> (not res!1079491) (not e!882056))))

(assert (=> start!137208 (= res!1079491 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51605 a!3559)) (bvslt (size!51605 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137208 e!882056))

(assert (=> start!137208 true))

(declare-fun array_inv!40009 (array!105906) Bool)

(assert (=> start!137208 (array_inv!40009 a!3559)))

(declare-fun b!1581128 () Bool)

(declare-fun res!1079489 () Bool)

(assert (=> b!1581128 (=> (not res!1079489) (not e!882056))))

(assert (=> b!1581128 (= res!1079489 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1581127 () Bool)

(declare-fun res!1079492 () Bool)

(assert (=> b!1581127 (=> (not res!1079492) (not e!882056))))

(assert (=> b!1581127 (= res!1079492 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51605 a!3559))))))

(assert (= (and start!137208 res!1079491) b!1581126))

(assert (= (and b!1581126 res!1079490) b!1581127))

(assert (= (and b!1581127 res!1079492) b!1581128))

(assert (= (and b!1581128 res!1079489) b!1581129))

(declare-fun m!1453013 () Bool)

(assert (=> b!1581126 m!1453013))

(declare-fun m!1453015 () Bool)

(assert (=> b!1581129 m!1453015))

(declare-fun m!1453017 () Bool)

(assert (=> b!1581129 m!1453017))

(declare-fun m!1453019 () Bool)

(assert (=> start!137208 m!1453019))

(declare-fun m!1453021 () Bool)

(assert (=> b!1581128 m!1453021))

(push 1)

(assert (not b!1581126))

(assert (not b!1581128))

(assert (not start!137208))

(assert (not b!1581129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

