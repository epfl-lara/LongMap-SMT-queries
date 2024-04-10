; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116454 () Bool)

(assert start!116454)

(declare-fun b!1373908 () Bool)

(declare-fun e!778333 () Bool)

(assert (=> b!1373908 (= e!778333 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lt!603141 () (_ BitVec 32))

(declare-datatypes ((array!93154 0))(
  ( (array!93155 (arr!44983 (Array (_ BitVec 32) (_ BitVec 64))) (size!45533 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93154)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93154 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373908 (= lt!603141 (arrayCountValidKeys!0 (array!93155 (store (arr!44983 a!4142) i!1457 k!2959) (size!45533 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603142 () (_ BitVec 32))

(assert (=> b!1373908 (= lt!603142 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917091 () Bool)

(assert (=> start!116454 (=> (not res!917091) (not e!778333))))

(assert (=> start!116454 (= res!917091 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45533 a!4142))))))

(assert (=> start!116454 e!778333))

(assert (=> start!116454 true))

(declare-fun array_inv!34011 (array!93154) Bool)

(assert (=> start!116454 (array_inv!34011 a!4142)))

(declare-fun b!1373905 () Bool)

(declare-fun res!917089 () Bool)

(assert (=> b!1373905 (=> (not res!917089) (not e!778333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373905 (= res!917089 (validKeyInArray!0 (select (arr!44983 a!4142) i!1457)))))

(declare-fun b!1373906 () Bool)

(declare-fun res!917092 () Bool)

(assert (=> b!1373906 (=> (not res!917092) (not e!778333))))

(assert (=> b!1373906 (= res!917092 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1373907 () Bool)

(declare-fun res!917090 () Bool)

(assert (=> b!1373907 (=> (not res!917090) (not e!778333))))

(assert (=> b!1373907 (= res!917090 (and (bvslt (size!45533 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45533 a!4142))))))

(assert (= (and start!116454 res!917091) b!1373905))

(assert (= (and b!1373905 res!917089) b!1373906))

(assert (= (and b!1373906 res!917092) b!1373907))

(assert (= (and b!1373907 res!917090) b!1373908))

(declare-fun m!1257089 () Bool)

(assert (=> b!1373908 m!1257089))

(declare-fun m!1257091 () Bool)

(assert (=> b!1373908 m!1257091))

(declare-fun m!1257093 () Bool)

(assert (=> b!1373908 m!1257093))

(declare-fun m!1257095 () Bool)

(assert (=> start!116454 m!1257095))

(declare-fun m!1257097 () Bool)

(assert (=> b!1373905 m!1257097))

(assert (=> b!1373905 m!1257097))

(declare-fun m!1257099 () Bool)

(assert (=> b!1373905 m!1257099))

(declare-fun m!1257101 () Bool)

(assert (=> b!1373906 m!1257101))

(push 1)

(assert (not b!1373905))

(assert (not b!1373906))

(assert (not start!116454))

(assert (not b!1373908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

