; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116492 () Bool)

(assert start!116492)

(declare-fun b!1374147 () Bool)

(declare-fun res!917377 () Bool)

(declare-fun e!778468 () Bool)

(assert (=> b!1374147 (=> (not res!917377) (not e!778468))))

(declare-datatypes ((array!93151 0))(
  ( (array!93152 (arr!44982 (Array (_ BitVec 32) (_ BitVec 64))) (size!45534 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93151)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374147 (= res!917377 (validKeyInArray!0 (select (arr!44982 a!4142) i!1457)))))

(declare-fun b!1374148 () Bool)

(declare-fun e!778470 () Bool)

(assert (=> b!1374148 (= e!778470 true)))

(declare-fun lt!603150 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93151 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374148 (= lt!603150 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603153 () (_ BitVec 32))

(declare-fun lt!603152 () array!93151)

(assert (=> b!1374148 (= lt!603153 (arrayCountValidKeys!0 lt!603152 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374149 () Bool)

(declare-fun res!917375 () Bool)

(assert (=> b!1374149 (=> (not res!917375) (not e!778468))))

(assert (=> b!1374149 (= res!917375 (bvslt (size!45534 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917376 () Bool)

(assert (=> start!116492 (=> (not res!917376) (not e!778468))))

(assert (=> start!116492 (= res!917376 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45534 a!4142))))))

(assert (=> start!116492 e!778468))

(assert (=> start!116492 true))

(declare-fun array_inv!34215 (array!93151) Bool)

(assert (=> start!116492 (array_inv!34215 a!4142)))

(declare-fun b!1374150 () Bool)

(declare-fun res!917374 () Bool)

(assert (=> b!1374150 (=> (not res!917374) (not e!778468))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374150 (= res!917374 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374151 () Bool)

(assert (=> b!1374151 (= e!778468 (not e!778470))))

(declare-fun res!917378 () Bool)

(assert (=> b!1374151 (=> res!917378 e!778470)))

(assert (=> b!1374151 (= res!917378 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374151 (= (arrayCountValidKeys!0 lt!603152 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374151 (= lt!603152 (array!93152 (store (arr!44982 a!4142) i!1457 k!2959) (size!45534 a!4142)))))

(declare-datatypes ((Unit!45256 0))(
  ( (Unit!45257) )
))
(declare-fun lt!603151 () Unit!45256)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93151 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45256)

(assert (=> b!1374151 (= lt!603151 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116492 res!917376) b!1374147))

(assert (= (and b!1374147 res!917377) b!1374150))

(assert (= (and b!1374150 res!917374) b!1374149))

(assert (= (and b!1374149 res!917375) b!1374151))

(assert (= (and b!1374151 (not res!917378)) b!1374148))

(declare-fun m!1256947 () Bool)

(assert (=> b!1374147 m!1256947))

(assert (=> b!1374147 m!1256947))

(declare-fun m!1256949 () Bool)

(assert (=> b!1374147 m!1256949))

(declare-fun m!1256951 () Bool)

(assert (=> b!1374150 m!1256951))

(declare-fun m!1256953 () Bool)

(assert (=> b!1374151 m!1256953))

(declare-fun m!1256955 () Bool)

(assert (=> b!1374151 m!1256955))

(declare-fun m!1256957 () Bool)

(assert (=> b!1374151 m!1256957))

(declare-fun m!1256959 () Bool)

(assert (=> b!1374151 m!1256959))

(declare-fun m!1256961 () Bool)

(assert (=> start!116492 m!1256961))

(declare-fun m!1256963 () Bool)

(assert (=> b!1374148 m!1256963))

(declare-fun m!1256965 () Bool)

(assert (=> b!1374148 m!1256965))

(push 1)

(assert (not b!1374147))

(assert (not b!1374148))

(assert (not b!1374151))

(assert (not start!116492))

(assert (not b!1374150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

