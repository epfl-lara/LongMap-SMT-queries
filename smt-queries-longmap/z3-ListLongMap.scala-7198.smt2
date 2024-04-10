; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92252 () Bool)

(assert start!92252)

(declare-fun res!697559 () Bool)

(declare-fun e!594655 () Bool)

(assert (=> start!92252 (=> (not res!697559) (not e!594655))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66053 0))(
  ( (array!66054 (arr!31766 (Array (_ BitVec 32) (_ BitVec 64))) (size!32302 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66053)

(assert (=> start!92252 (= res!697559 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32302 a!3488)) (bvslt (size!32302 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92252 e!594655))

(assert (=> start!92252 true))

(declare-fun array_inv!24546 (array!66053) Bool)

(assert (=> start!92252 (array_inv!24546 a!3488)))

(declare-fun b!1048428 () Bool)

(declare-fun res!697554 () Bool)

(assert (=> b!1048428 (=> (not res!697554) (not e!594655))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1048428 (= res!697554 (= (select (arr!31766 a!3488) i!1381) k0!2747))))

(declare-fun b!1048429 () Bool)

(declare-fun res!697555 () Bool)

(assert (=> b!1048429 (=> (not res!697555) (not e!594655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048429 (= res!697555 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048430 () Bool)

(declare-fun e!594657 () Bool)

(assert (=> b!1048430 (= e!594655 e!594657)))

(declare-fun res!697557 () Bool)

(assert (=> b!1048430 (=> (not res!697557) (not e!594657))))

(declare-fun lt!463194 () array!66053)

(declare-fun arrayContainsKey!0 (array!66053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048430 (= res!697557 (arrayContainsKey!0 lt!463194 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048430 (= lt!463194 (array!66054 (store (arr!31766 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32302 a!3488)))))

(declare-fun b!1048431 () Bool)

(declare-fun res!697556 () Bool)

(assert (=> b!1048431 (=> (not res!697556) (not e!594655))))

(declare-datatypes ((List!22078 0))(
  ( (Nil!22075) (Cons!22074 (h!23283 (_ BitVec 64)) (t!31385 List!22078)) )
))
(declare-fun arrayNoDuplicates!0 (array!66053 (_ BitVec 32) List!22078) Bool)

(assert (=> b!1048431 (= res!697556 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22075))))

(declare-fun b!1048432 () Bool)

(declare-fun e!594658 () Bool)

(assert (=> b!1048432 (= e!594657 e!594658)))

(declare-fun res!697558 () Bool)

(assert (=> b!1048432 (=> (not res!697558) (not e!594658))))

(declare-fun lt!463193 () (_ BitVec 32))

(assert (=> b!1048432 (= res!697558 (not (= lt!463193 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66053 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048432 (= lt!463193 (arrayScanForKey!0 lt!463194 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048433 () Bool)

(assert (=> b!1048433 (= e!594658 (not true))))

(assert (=> b!1048433 (= (select (store (arr!31766 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463193) k0!2747)))

(assert (= (and start!92252 res!697559) b!1048431))

(assert (= (and b!1048431 res!697556) b!1048429))

(assert (= (and b!1048429 res!697555) b!1048428))

(assert (= (and b!1048428 res!697554) b!1048430))

(assert (= (and b!1048430 res!697557) b!1048432))

(assert (= (and b!1048432 res!697558) b!1048433))

(declare-fun m!969399 () Bool)

(assert (=> b!1048431 m!969399))

(declare-fun m!969401 () Bool)

(assert (=> start!92252 m!969401))

(declare-fun m!969403 () Bool)

(assert (=> b!1048429 m!969403))

(declare-fun m!969405 () Bool)

(assert (=> b!1048428 m!969405))

(declare-fun m!969407 () Bool)

(assert (=> b!1048433 m!969407))

(declare-fun m!969409 () Bool)

(assert (=> b!1048433 m!969409))

(declare-fun m!969411 () Bool)

(assert (=> b!1048430 m!969411))

(assert (=> b!1048430 m!969407))

(declare-fun m!969413 () Bool)

(assert (=> b!1048432 m!969413))

(check-sat (not b!1048429) (not b!1048430) (not b!1048432) (not b!1048431) (not start!92252))
(check-sat)
