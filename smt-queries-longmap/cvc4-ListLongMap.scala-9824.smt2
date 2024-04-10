; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116616 () Bool)

(assert start!116616)

(declare-fun b!1374907 () Bool)

(declare-fun res!918037 () Bool)

(declare-fun e!778883 () Bool)

(assert (=> b!1374907 (=> (not res!918037) (not e!778883))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374907 (= res!918037 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374906 () Bool)

(declare-fun res!918035 () Bool)

(assert (=> b!1374906 (=> (not res!918035) (not e!778883))))

(declare-datatypes ((array!93301 0))(
  ( (array!93302 (arr!45055 (Array (_ BitVec 32) (_ BitVec 64))) (size!45605 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93301)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374906 (= res!918035 (validKeyInArray!0 (select (arr!45055 a!4142) i!1457)))))

(declare-fun b!1374908 () Bool)

(declare-fun res!918036 () Bool)

(assert (=> b!1374908 (=> (not res!918036) (not e!778883))))

(assert (=> b!1374908 (= res!918036 (bvslt (size!45605 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918034 () Bool)

(assert (=> start!116616 (=> (not res!918034) (not e!778883))))

(assert (=> start!116616 (= res!918034 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45605 a!4142))))))

(assert (=> start!116616 e!778883))

(assert (=> start!116616 true))

(declare-fun array_inv!34083 (array!93301) Bool)

(assert (=> start!116616 (array_inv!34083 a!4142)))

(declare-fun b!1374909 () Bool)

(assert (=> b!1374909 (= e!778883 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1457) i!1457))))))

(declare-fun arrayCountValidKeys!0 (array!93301 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374909 (= (arrayCountValidKeys!0 (array!93302 (store (arr!45055 a!4142) i!1457 k!2959) (size!45605 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45499 0))(
  ( (Unit!45500) )
))
(declare-fun lt!603921 () Unit!45499)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93301 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45499)

(assert (=> b!1374909 (= lt!603921 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116616 res!918034) b!1374906))

(assert (= (and b!1374906 res!918035) b!1374907))

(assert (= (and b!1374907 res!918037) b!1374908))

(assert (= (and b!1374908 res!918036) b!1374909))

(declare-fun m!1258503 () Bool)

(assert (=> b!1374907 m!1258503))

(declare-fun m!1258505 () Bool)

(assert (=> b!1374906 m!1258505))

(assert (=> b!1374906 m!1258505))

(declare-fun m!1258507 () Bool)

(assert (=> b!1374906 m!1258507))

(declare-fun m!1258509 () Bool)

(assert (=> start!116616 m!1258509))

(declare-fun m!1258511 () Bool)

(assert (=> b!1374909 m!1258511))

(declare-fun m!1258513 () Bool)

(assert (=> b!1374909 m!1258513))

(declare-fun m!1258515 () Bool)

(assert (=> b!1374909 m!1258515))

(declare-fun m!1258517 () Bool)

(assert (=> b!1374909 m!1258517))

(push 1)

(assert (not b!1374909))

(assert (not b!1374907))

(assert (not start!116616))

(assert (not b!1374906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

