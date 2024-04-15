; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116606 () Bool)

(assert start!116606)

(declare-fun res!918008 () Bool)

(declare-fun e!778849 () Bool)

(assert (=> start!116606 (=> (not res!918008) (not e!778849))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93250 0))(
  ( (array!93251 (arr!45030 (Array (_ BitVec 32) (_ BitVec 64))) (size!45582 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93250)

(assert (=> start!116606 (= res!918008 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45582 a!4142))))))

(assert (=> start!116606 e!778849))

(assert (=> start!116606 true))

(declare-fun array_inv!34263 (array!93250) Bool)

(assert (=> start!116606 (array_inv!34263 a!4142)))

(declare-fun b!1374837 () Bool)

(assert (=> b!1374837 (= e!778849 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1457) i!1457))))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93250 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374837 (= (arrayCountValidKeys!0 (array!93251 (store (arr!45030 a!4142) i!1457 k!2959) (size!45582 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45340 0))(
  ( (Unit!45341) )
))
(declare-fun lt!603734 () Unit!45340)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45340)

(assert (=> b!1374837 (= lt!603734 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374834 () Bool)

(declare-fun res!918005 () Bool)

(assert (=> b!1374834 (=> (not res!918005) (not e!778849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374834 (= res!918005 (validKeyInArray!0 (select (arr!45030 a!4142) i!1457)))))

(declare-fun b!1374835 () Bool)

(declare-fun res!918007 () Bool)

(assert (=> b!1374835 (=> (not res!918007) (not e!778849))))

(assert (=> b!1374835 (= res!918007 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374836 () Bool)

(declare-fun res!918006 () Bool)

(assert (=> b!1374836 (=> (not res!918006) (not e!778849))))

(assert (=> b!1374836 (= res!918006 (bvslt (size!45582 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116606 res!918008) b!1374834))

(assert (= (and b!1374834 res!918005) b!1374835))

(assert (= (and b!1374835 res!918007) b!1374836))

(assert (= (and b!1374836 res!918006) b!1374837))

(declare-fun m!1257977 () Bool)

(assert (=> start!116606 m!1257977))

(declare-fun m!1257979 () Bool)

(assert (=> b!1374837 m!1257979))

(declare-fun m!1257981 () Bool)

(assert (=> b!1374837 m!1257981))

(declare-fun m!1257983 () Bool)

(assert (=> b!1374837 m!1257983))

(declare-fun m!1257985 () Bool)

(assert (=> b!1374837 m!1257985))

(declare-fun m!1257987 () Bool)

(assert (=> b!1374834 m!1257987))

(assert (=> b!1374834 m!1257987))

(declare-fun m!1257989 () Bool)

(assert (=> b!1374834 m!1257989))

(declare-fun m!1257991 () Bool)

(assert (=> b!1374835 m!1257991))

(push 1)

(assert (not start!116606))

(assert (not b!1374837))

(assert (not b!1374835))

(assert (not b!1374834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

