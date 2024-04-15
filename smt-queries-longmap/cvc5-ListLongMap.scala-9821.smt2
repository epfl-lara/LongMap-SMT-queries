; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116588 () Bool)

(assert start!116588)

(declare-fun b!1374726 () Bool)

(declare-fun res!917897 () Bool)

(declare-fun e!778794 () Bool)

(assert (=> b!1374726 (=> (not res!917897) (not e!778794))))

(declare-datatypes ((array!93232 0))(
  ( (array!93233 (arr!45021 (Array (_ BitVec 32) (_ BitVec 64))) (size!45573 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93232)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374726 (= res!917897 (validKeyInArray!0 (select (arr!45021 a!4142) i!1457)))))

(declare-fun b!1374727 () Bool)

(declare-fun res!917899 () Bool)

(assert (=> b!1374727 (=> (not res!917899) (not e!778794))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374727 (= res!917899 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917900 () Bool)

(assert (=> start!116588 (=> (not res!917900) (not e!778794))))

(assert (=> start!116588 (= res!917900 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45573 a!4142))))))

(assert (=> start!116588 e!778794))

(assert (=> start!116588 true))

(declare-fun array_inv!34254 (array!93232) Bool)

(assert (=> start!116588 (array_inv!34254 a!4142)))

(declare-fun b!1374729 () Bool)

(assert (=> b!1374729 (= e!778794 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93232 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374729 (= (arrayCountValidKeys!0 (array!93233 (store (arr!45021 a!4142) i!1457 k!2959) (size!45573 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45322 0))(
  ( (Unit!45323) )
))
(declare-fun lt!603707 () Unit!45322)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45322)

(assert (=> b!1374729 (= lt!603707 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374728 () Bool)

(declare-fun res!917898 () Bool)

(assert (=> b!1374728 (=> (not res!917898) (not e!778794))))

(assert (=> b!1374728 (= res!917898 (bvslt (size!45573 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116588 res!917900) b!1374726))

(assert (= (and b!1374726 res!917897) b!1374727))

(assert (= (and b!1374727 res!917899) b!1374728))

(assert (= (and b!1374728 res!917898) b!1374729))

(declare-fun m!1257833 () Bool)

(assert (=> b!1374726 m!1257833))

(assert (=> b!1374726 m!1257833))

(declare-fun m!1257835 () Bool)

(assert (=> b!1374726 m!1257835))

(declare-fun m!1257837 () Bool)

(assert (=> b!1374727 m!1257837))

(declare-fun m!1257839 () Bool)

(assert (=> start!116588 m!1257839))

(declare-fun m!1257841 () Bool)

(assert (=> b!1374729 m!1257841))

(declare-fun m!1257843 () Bool)

(assert (=> b!1374729 m!1257843))

(declare-fun m!1257845 () Bool)

(assert (=> b!1374729 m!1257845))

(declare-fun m!1257847 () Bool)

(assert (=> b!1374729 m!1257847))

(push 1)

(assert (not b!1374729))

(assert (not start!116588))

(assert (not b!1374727))

(assert (not b!1374726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

