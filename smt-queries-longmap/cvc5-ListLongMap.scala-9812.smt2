; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116522 () Bool)

(assert start!116522)

(declare-fun b!1374367 () Bool)

(declare-fun res!917551 () Bool)

(declare-fun e!778591 () Bool)

(assert (=> b!1374367 (=> (not res!917551) (not e!778591))))

(declare-datatypes ((array!93222 0))(
  ( (array!93223 (arr!45017 (Array (_ BitVec 32) (_ BitVec 64))) (size!45567 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93222)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374367 (= res!917551 (validKeyInArray!0 (select (arr!45017 a!4142) i!1457)))))

(declare-fun b!1374370 () Bool)

(assert (=> b!1374370 (= e!778591 (not true))))

(declare-fun lt!603457 () array!93222)

(declare-fun arrayCountValidKeys!0 (array!93222 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374370 (= (arrayCountValidKeys!0 lt!603457 (bvadd #b00000000000000000000000000000001 i!1457) (size!45567 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45567 a!4142)))))

(declare-datatypes ((Unit!45435 0))(
  ( (Unit!45436) )
))
(declare-fun lt!603456 () Unit!45435)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93222 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45435)

(assert (=> b!1374370 (= lt!603456 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374370 (= (arrayCountValidKeys!0 lt!603457 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374370 (= lt!603457 (array!93223 (store (arr!45017 a!4142) i!1457 k!2959) (size!45567 a!4142)))))

(declare-fun lt!603455 () Unit!45435)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93222 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45435)

(assert (=> b!1374370 (= lt!603455 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374369 () Bool)

(declare-fun res!917554 () Bool)

(assert (=> b!1374369 (=> (not res!917554) (not e!778591))))

(assert (=> b!1374369 (= res!917554 (bvslt (size!45567 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917552 () Bool)

(assert (=> start!116522 (=> (not res!917552) (not e!778591))))

(assert (=> start!116522 (= res!917552 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45567 a!4142))))))

(assert (=> start!116522 e!778591))

(assert (=> start!116522 true))

(declare-fun array_inv!34045 (array!93222) Bool)

(assert (=> start!116522 (array_inv!34045 a!4142)))

(declare-fun b!1374368 () Bool)

(declare-fun res!917553 () Bool)

(assert (=> b!1374368 (=> (not res!917553) (not e!778591))))

(assert (=> b!1374368 (= res!917553 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116522 res!917552) b!1374367))

(assert (= (and b!1374367 res!917551) b!1374368))

(assert (= (and b!1374368 res!917553) b!1374369))

(assert (= (and b!1374369 res!917554) b!1374370))

(declare-fun m!1257673 () Bool)

(assert (=> b!1374367 m!1257673))

(assert (=> b!1374367 m!1257673))

(declare-fun m!1257675 () Bool)

(assert (=> b!1374367 m!1257675))

(declare-fun m!1257677 () Bool)

(assert (=> b!1374370 m!1257677))

(declare-fun m!1257679 () Bool)

(assert (=> b!1374370 m!1257679))

(declare-fun m!1257681 () Bool)

(assert (=> b!1374370 m!1257681))

(declare-fun m!1257683 () Bool)

(assert (=> b!1374370 m!1257683))

(declare-fun m!1257685 () Bool)

(assert (=> b!1374370 m!1257685))

(declare-fun m!1257687 () Bool)

(assert (=> b!1374370 m!1257687))

(declare-fun m!1257689 () Bool)

(assert (=> b!1374370 m!1257689))

(declare-fun m!1257691 () Bool)

(assert (=> start!116522 m!1257691))

(declare-fun m!1257693 () Bool)

(assert (=> b!1374368 m!1257693))

(push 1)

(assert (not b!1374367))

(assert (not b!1374368))

(assert (not start!116522))

(assert (not b!1374370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

