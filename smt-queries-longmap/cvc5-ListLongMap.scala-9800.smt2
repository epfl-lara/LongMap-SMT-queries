; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116444 () Bool)

(assert start!116444)

(declare-fun b!1373835 () Bool)

(declare-fun res!917061 () Bool)

(declare-fun e!778299 () Bool)

(assert (=> b!1373835 (=> (not res!917061) (not e!778299))))

(declare-datatypes ((array!93103 0))(
  ( (array!93104 (arr!44958 (Array (_ BitVec 32) (_ BitVec 64))) (size!45510 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93103)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1373835 (= res!917061 (and (bvslt (size!45510 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45510 a!4142))))))

(declare-fun res!917060 () Bool)

(assert (=> start!116444 (=> (not res!917060) (not e!778299))))

(assert (=> start!116444 (= res!917060 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45510 a!4142))))))

(assert (=> start!116444 e!778299))

(assert (=> start!116444 true))

(declare-fun array_inv!34191 (array!93103) Bool)

(assert (=> start!116444 (array_inv!34191 a!4142)))

(declare-fun b!1373833 () Bool)

(declare-fun res!917063 () Bool)

(assert (=> b!1373833 (=> (not res!917063) (not e!778299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373833 (= res!917063 (validKeyInArray!0 (select (arr!44958 a!4142) i!1457)))))

(declare-fun b!1373836 () Bool)

(assert (=> b!1373836 (= e!778299 false)))

(declare-fun lt!602954 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93103 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373836 (= lt!602954 (arrayCountValidKeys!0 (array!93104 (store (arr!44958 a!4142) i!1457 k!2959) (size!45510 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!602955 () (_ BitVec 32))

(assert (=> b!1373836 (= lt!602955 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373834 () Bool)

(declare-fun res!917062 () Bool)

(assert (=> b!1373834 (=> (not res!917062) (not e!778299))))

(assert (=> b!1373834 (= res!917062 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116444 res!917060) b!1373833))

(assert (= (and b!1373833 res!917063) b!1373834))

(assert (= (and b!1373834 res!917062) b!1373835))

(assert (= (and b!1373835 res!917061) b!1373836))

(declare-fun m!1256563 () Bool)

(assert (=> start!116444 m!1256563))

(declare-fun m!1256565 () Bool)

(assert (=> b!1373833 m!1256565))

(assert (=> b!1373833 m!1256565))

(declare-fun m!1256567 () Bool)

(assert (=> b!1373833 m!1256567))

(declare-fun m!1256569 () Bool)

(assert (=> b!1373836 m!1256569))

(declare-fun m!1256571 () Bool)

(assert (=> b!1373836 m!1256571))

(declare-fun m!1256573 () Bool)

(assert (=> b!1373836 m!1256573))

(declare-fun m!1256575 () Bool)

(assert (=> b!1373834 m!1256575))

(push 1)

(assert (not start!116444))

(assert (not b!1373836))

(assert (not b!1373834))

(assert (not b!1373833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

