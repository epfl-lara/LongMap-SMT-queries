; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117262 () Bool)

(assert start!117262)

(declare-fun b!1379571 () Bool)

(declare-fun res!922009 () Bool)

(declare-fun e!781511 () Bool)

(assert (=> b!1379571 (=> (not res!922009) (not e!781511))))

(declare-datatypes ((array!93858 0))(
  ( (array!93859 (arr!45328 (Array (_ BitVec 32) (_ BitVec 64))) (size!45878 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93858)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379571 (= res!922009 (validKeyInArray!0 (select (arr!45328 a!4094) i!1451)))))

(declare-fun b!1379572 () Bool)

(declare-fun res!922011 () Bool)

(assert (=> b!1379572 (=> (not res!922011) (not e!781511))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379572 (= res!922011 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!922010 () Bool)

(assert (=> start!117262 (=> (not res!922010) (not e!781511))))

(assert (=> start!117262 (= res!922010 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45878 a!4094))))))

(assert (=> start!117262 e!781511))

(assert (=> start!117262 true))

(declare-fun array_inv!34356 (array!93858) Bool)

(assert (=> start!117262 (array_inv!34356 a!4094)))

(declare-fun b!1379573 () Bool)

(declare-fun res!922012 () Bool)

(assert (=> b!1379573 (=> (not res!922012) (not e!781511))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379573 (= res!922012 (and (bvslt (size!45878 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45878 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379574 () Bool)

(assert (=> b!1379574 (= e!781511 false)))

(declare-fun lt!607670 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93858 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379574 (= lt!607670 (arrayCountValidKeys!0 (array!93859 (store (arr!45328 a!4094) i!1451 k!2953) (size!45878 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607671 () (_ BitVec 32))

(assert (=> b!1379574 (= lt!607671 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (= (and start!117262 res!922010) b!1379571))

(assert (= (and b!1379571 res!922009) b!1379572))

(assert (= (and b!1379572 res!922011) b!1379573))

(assert (= (and b!1379573 res!922012) b!1379574))

(declare-fun m!1264729 () Bool)

(assert (=> b!1379571 m!1264729))

(assert (=> b!1379571 m!1264729))

(declare-fun m!1264731 () Bool)

(assert (=> b!1379571 m!1264731))

(declare-fun m!1264733 () Bool)

(assert (=> b!1379572 m!1264733))

(declare-fun m!1264735 () Bool)

(assert (=> start!117262 m!1264735))

(declare-fun m!1264737 () Bool)

(assert (=> b!1379574 m!1264737))

(declare-fun m!1264739 () Bool)

(assert (=> b!1379574 m!1264739))

(declare-fun m!1264741 () Bool)

(assert (=> b!1379574 m!1264741))

(push 1)

(assert (not b!1379571))

(assert (not b!1379572))

(assert (not b!1379574))

(assert (not start!117262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

