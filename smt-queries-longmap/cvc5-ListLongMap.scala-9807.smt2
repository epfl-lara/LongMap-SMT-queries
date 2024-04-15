; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116486 () Bool)

(assert start!116486)

(declare-fun res!917331 () Bool)

(declare-fun e!778443 () Bool)

(assert (=> start!116486 (=> (not res!917331) (not e!778443))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93145 0))(
  ( (array!93146 (arr!44979 (Array (_ BitVec 32) (_ BitVec 64))) (size!45531 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93145)

(assert (=> start!116486 (= res!917331 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45531 a!4142))))))

(assert (=> start!116486 e!778443))

(assert (=> start!116486 true))

(declare-fun array_inv!34212 (array!93145) Bool)

(assert (=> start!116486 (array_inv!34212 a!4142)))

(declare-fun b!1374102 () Bool)

(declare-fun e!778441 () Bool)

(assert (=> b!1374102 (= e!778443 (not e!778441))))

(declare-fun res!917332 () Bool)

(assert (=> b!1374102 (=> res!917332 e!778441)))

(assert (=> b!1374102 (= res!917332 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603117 () array!93145)

(declare-fun arrayCountValidKeys!0 (array!93145 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374102 (= (arrayCountValidKeys!0 lt!603117 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374102 (= lt!603117 (array!93146 (store (arr!44979 a!4142) i!1457 k!2959) (size!45531 a!4142)))))

(declare-datatypes ((Unit!45250 0))(
  ( (Unit!45251) )
))
(declare-fun lt!603115 () Unit!45250)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45250)

(assert (=> b!1374102 (= lt!603115 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374103 () Bool)

(declare-fun res!917329 () Bool)

(assert (=> b!1374103 (=> (not res!917329) (not e!778443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374103 (= res!917329 (validKeyInArray!0 (select (arr!44979 a!4142) i!1457)))))

(declare-fun b!1374104 () Bool)

(declare-fun res!917333 () Bool)

(assert (=> b!1374104 (=> (not res!917333) (not e!778443))))

(assert (=> b!1374104 (= res!917333 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374105 () Bool)

(assert (=> b!1374105 (= e!778441 true)))

(declare-fun lt!603114 () (_ BitVec 32))

(assert (=> b!1374105 (= lt!603114 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603116 () (_ BitVec 32))

(assert (=> b!1374105 (= lt!603116 (arrayCountValidKeys!0 lt!603117 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374106 () Bool)

(declare-fun res!917330 () Bool)

(assert (=> b!1374106 (=> (not res!917330) (not e!778443))))

(assert (=> b!1374106 (= res!917330 (bvslt (size!45531 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116486 res!917331) b!1374103))

(assert (= (and b!1374103 res!917329) b!1374104))

(assert (= (and b!1374104 res!917333) b!1374106))

(assert (= (and b!1374106 res!917330) b!1374102))

(assert (= (and b!1374102 (not res!917332)) b!1374105))

(declare-fun m!1256887 () Bool)

(assert (=> b!1374102 m!1256887))

(declare-fun m!1256889 () Bool)

(assert (=> b!1374102 m!1256889))

(declare-fun m!1256891 () Bool)

(assert (=> b!1374102 m!1256891))

(declare-fun m!1256893 () Bool)

(assert (=> b!1374102 m!1256893))

(declare-fun m!1256895 () Bool)

(assert (=> b!1374105 m!1256895))

(declare-fun m!1256897 () Bool)

(assert (=> b!1374105 m!1256897))

(declare-fun m!1256899 () Bool)

(assert (=> b!1374103 m!1256899))

(assert (=> b!1374103 m!1256899))

(declare-fun m!1256901 () Bool)

(assert (=> b!1374103 m!1256901))

(declare-fun m!1256903 () Bool)

(assert (=> b!1374104 m!1256903))

(declare-fun m!1256905 () Bool)

(assert (=> start!116486 m!1256905))

(push 1)

(assert (not b!1374103))

(assert (not b!1374105))

(assert (not b!1374104))

(assert (not b!1374102))

(assert (not start!116486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

