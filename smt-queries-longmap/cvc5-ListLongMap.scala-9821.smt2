; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116822 () Bool)

(assert start!116822)

(declare-fun b!1376102 () Bool)

(declare-fun res!918444 () Bool)

(declare-fun e!779673 () Bool)

(assert (=> b!1376102 (=> (not res!918444) (not e!779673))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376102 (= res!918444 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1376101 () Bool)

(declare-fun res!918445 () Bool)

(assert (=> b!1376101 (=> (not res!918445) (not e!779673))))

(declare-datatypes ((array!93398 0))(
  ( (array!93399 (arr!45099 (Array (_ BitVec 32) (_ BitVec 64))) (size!45650 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93398)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1376101 (= res!918445 (validKeyInArray!0 (select (arr!45099 a!4142) i!1457)))))

(declare-fun res!918446 () Bool)

(assert (=> start!116822 (=> (not res!918446) (not e!779673))))

(assert (=> start!116822 (= res!918446 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45650 a!4142))))))

(assert (=> start!116822 e!779673))

(assert (=> start!116822 true))

(declare-fun array_inv!34380 (array!93398) Bool)

(assert (=> start!116822 (array_inv!34380 a!4142)))

(declare-fun b!1376103 () Bool)

(declare-fun res!918447 () Bool)

(assert (=> b!1376103 (=> (not res!918447) (not e!779673))))

(assert (=> b!1376103 (= res!918447 (bvslt (size!45650 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1376104 () Bool)

(assert (=> b!1376104 (= e!779673 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93398 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376104 (= (arrayCountValidKeys!0 (array!93399 (store (arr!45099 a!4142) i!1457 k!2959) (size!45650 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45420 0))(
  ( (Unit!45421) )
))
(declare-fun lt!604371 () Unit!45420)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93398 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45420)

(assert (=> b!1376104 (= lt!604371 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116822 res!918446) b!1376101))

(assert (= (and b!1376101 res!918445) b!1376102))

(assert (= (and b!1376102 res!918444) b!1376103))

(assert (= (and b!1376103 res!918447) b!1376104))

(declare-fun m!1259959 () Bool)

(assert (=> b!1376102 m!1259959))

(declare-fun m!1259961 () Bool)

(assert (=> b!1376101 m!1259961))

(assert (=> b!1376101 m!1259961))

(declare-fun m!1259963 () Bool)

(assert (=> b!1376101 m!1259963))

(declare-fun m!1259965 () Bool)

(assert (=> start!116822 m!1259965))

(declare-fun m!1259967 () Bool)

(assert (=> b!1376104 m!1259967))

(declare-fun m!1259969 () Bool)

(assert (=> b!1376104 m!1259969))

(declare-fun m!1259971 () Bool)

(assert (=> b!1376104 m!1259971))

(declare-fun m!1259973 () Bool)

(assert (=> b!1376104 m!1259973))

(push 1)

(assert (not b!1376102))

(assert (not b!1376101))

(assert (not b!1376104))

(assert (not start!116822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

