; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116460 () Bool)

(assert start!116460)

(declare-fun b!1373943 () Bool)

(declare-fun res!917125 () Bool)

(declare-fun e!778351 () Bool)

(assert (=> b!1373943 (=> (not res!917125) (not e!778351))))

(declare-datatypes ((array!93160 0))(
  ( (array!93161 (arr!44986 (Array (_ BitVec 32) (_ BitVec 64))) (size!45536 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93160)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1373943 (= res!917125 (and (bvslt (size!45536 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45536 a!4142))))))

(declare-fun b!1373941 () Bool)

(declare-fun res!917126 () Bool)

(assert (=> b!1373941 (=> (not res!917126) (not e!778351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373941 (= res!917126 (validKeyInArray!0 (select (arr!44986 a!4142) i!1457)))))

(declare-fun b!1373944 () Bool)

(assert (=> b!1373944 (= e!778351 false)))

(declare-fun lt!603159 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93160 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373944 (= lt!603159 (arrayCountValidKeys!0 (array!93161 (store (arr!44986 a!4142) i!1457 k!2959) (size!45536 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603160 () (_ BitVec 32))

(assert (=> b!1373944 (= lt!603160 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373942 () Bool)

(declare-fun res!917128 () Bool)

(assert (=> b!1373942 (=> (not res!917128) (not e!778351))))

(assert (=> b!1373942 (= res!917128 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917127 () Bool)

(assert (=> start!116460 (=> (not res!917127) (not e!778351))))

(assert (=> start!116460 (= res!917127 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45536 a!4142))))))

(assert (=> start!116460 e!778351))

(assert (=> start!116460 true))

(declare-fun array_inv!34014 (array!93160) Bool)

(assert (=> start!116460 (array_inv!34014 a!4142)))

(assert (= (and start!116460 res!917127) b!1373941))

(assert (= (and b!1373941 res!917126) b!1373942))

(assert (= (and b!1373942 res!917128) b!1373943))

(assert (= (and b!1373943 res!917125) b!1373944))

(declare-fun m!1257131 () Bool)

(assert (=> b!1373941 m!1257131))

(assert (=> b!1373941 m!1257131))

(declare-fun m!1257133 () Bool)

(assert (=> b!1373941 m!1257133))

(declare-fun m!1257135 () Bool)

(assert (=> b!1373944 m!1257135))

(declare-fun m!1257137 () Bool)

(assert (=> b!1373944 m!1257137))

(declare-fun m!1257139 () Bool)

(assert (=> b!1373944 m!1257139))

(declare-fun m!1257141 () Bool)

(assert (=> b!1373942 m!1257141))

(declare-fun m!1257143 () Bool)

(assert (=> start!116460 m!1257143))

(push 1)

(assert (not start!116460))

(assert (not b!1373944))

(assert (not b!1373942))

(assert (not b!1373941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

