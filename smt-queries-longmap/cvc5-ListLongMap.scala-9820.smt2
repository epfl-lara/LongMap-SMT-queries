; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116816 () Bool)

(assert start!116816)

(declare-fun b!1376066 () Bool)

(declare-fun res!918411 () Bool)

(declare-fun e!779655 () Bool)

(assert (=> b!1376066 (=> (not res!918411) (not e!779655))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376066 (= res!918411 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1376065 () Bool)

(declare-fun res!918410 () Bool)

(assert (=> b!1376065 (=> (not res!918410) (not e!779655))))

(declare-datatypes ((array!93392 0))(
  ( (array!93393 (arr!45096 (Array (_ BitVec 32) (_ BitVec 64))) (size!45647 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93392)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1376065 (= res!918410 (validKeyInArray!0 (select (arr!45096 a!4142) i!1457)))))

(declare-fun res!918408 () Bool)

(assert (=> start!116816 (=> (not res!918408) (not e!779655))))

(assert (=> start!116816 (= res!918408 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45647 a!4142))))))

(assert (=> start!116816 e!779655))

(assert (=> start!116816 true))

(declare-fun array_inv!34377 (array!93392) Bool)

(assert (=> start!116816 (array_inv!34377 a!4142)))

(declare-fun b!1376068 () Bool)

(assert (=> b!1376068 (= e!779655 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93392 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376068 (= (arrayCountValidKeys!0 (array!93393 (store (arr!45096 a!4142) i!1457 k!2959) (size!45647 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45414 0))(
  ( (Unit!45415) )
))
(declare-fun lt!604362 () Unit!45414)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93392 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45414)

(assert (=> b!1376068 (= lt!604362 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1376067 () Bool)

(declare-fun res!918409 () Bool)

(assert (=> b!1376067 (=> (not res!918409) (not e!779655))))

(assert (=> b!1376067 (= res!918409 (bvslt (size!45647 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116816 res!918408) b!1376065))

(assert (= (and b!1376065 res!918410) b!1376066))

(assert (= (and b!1376066 res!918411) b!1376067))

(assert (= (and b!1376067 res!918409) b!1376068))

(declare-fun m!1259911 () Bool)

(assert (=> b!1376066 m!1259911))

(declare-fun m!1259913 () Bool)

(assert (=> b!1376065 m!1259913))

(assert (=> b!1376065 m!1259913))

(declare-fun m!1259915 () Bool)

(assert (=> b!1376065 m!1259915))

(declare-fun m!1259917 () Bool)

(assert (=> start!116816 m!1259917))

(declare-fun m!1259919 () Bool)

(assert (=> b!1376068 m!1259919))

(declare-fun m!1259921 () Bool)

(assert (=> b!1376068 m!1259921))

(declare-fun m!1259923 () Bool)

(assert (=> b!1376068 m!1259923))

(declare-fun m!1259925 () Bool)

(assert (=> b!1376068 m!1259925))

(push 1)

(assert (not b!1376068))

(assert (not start!116816))

(assert (not b!1376066))

(assert (not b!1376065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

