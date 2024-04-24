; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137198 () Bool)

(assert start!137198)

(declare-fun b!1581069 () Bool)

(declare-fun e!882026 () Bool)

(declare-datatypes ((array!105896 0))(
  ( (array!105897 (arr!51049 (Array (_ BitVec 32) (_ BitVec 64))) (size!51600 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105896)

(assert (=> b!1581069 (= e!882026 (not (bvslt #b00000000000000000000000000000000 (size!51600 a!3559))))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581069 (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52089 0))(
  ( (Unit!52090) )
))
(declare-fun lt!677214 () Unit!52089)

(declare-fun from!2937 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105896 (_ BitVec 64) (_ BitVec 32)) Unit!52089)

(assert (=> b!1581069 (= lt!677214 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1079431 () Bool)

(assert (=> start!137198 (=> (not res!1079431) (not e!882026))))

(assert (=> start!137198 (= res!1079431 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51600 a!3559)) (bvslt (size!51600 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137198 e!882026))

(assert (=> start!137198 true))

(declare-fun array_inv!40004 (array!105896) Bool)

(assert (=> start!137198 (array_inv!40004 a!3559)))

(declare-fun b!1581067 () Bool)

(declare-fun res!1079430 () Bool)

(assert (=> b!1581067 (=> (not res!1079430) (not e!882026))))

(assert (=> b!1581067 (= res!1079430 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51600 a!3559))))))

(declare-fun b!1581066 () Bool)

(declare-fun res!1079432 () Bool)

(assert (=> b!1581066 (=> (not res!1079432) (not e!882026))))

(assert (=> b!1581066 (= res!1079432 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1581068 () Bool)

(declare-fun res!1079429 () Bool)

(assert (=> b!1581068 (=> (not res!1079429) (not e!882026))))

(assert (=> b!1581068 (= res!1079429 (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!137198 res!1079431) b!1581066))

(assert (= (and b!1581066 res!1079432) b!1581067))

(assert (= (and b!1581067 res!1079430) b!1581068))

(assert (= (and b!1581068 res!1079429) b!1581069))

(declare-fun m!1452963 () Bool)

(assert (=> b!1581069 m!1452963))

(declare-fun m!1452965 () Bool)

(assert (=> b!1581069 m!1452965))

(declare-fun m!1452967 () Bool)

(assert (=> start!137198 m!1452967))

(declare-fun m!1452969 () Bool)

(assert (=> b!1581066 m!1452969))

(declare-fun m!1452971 () Bool)

(assert (=> b!1581068 m!1452971))

(check-sat (not b!1581066) (not b!1581068) (not start!137198) (not b!1581069))
(check-sat)
