; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92254 () Bool)

(assert start!92254)

(declare-fun res!697573 () Bool)

(declare-fun e!594667 () Bool)

(assert (=> start!92254 (=> (not res!697573) (not e!594667))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66055 0))(
  ( (array!66056 (arr!31767 (Array (_ BitVec 32) (_ BitVec 64))) (size!32303 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66055)

(assert (=> start!92254 (= res!697573 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32303 a!3488)) (bvslt (size!32303 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92254 e!594667))

(assert (=> start!92254 true))

(declare-fun array_inv!24547 (array!66055) Bool)

(assert (=> start!92254 (array_inv!24547 a!3488)))

(declare-fun b!1048446 () Bool)

(declare-fun res!697574 () Bool)

(assert (=> b!1048446 (=> (not res!697574) (not e!594667))))

(declare-datatypes ((List!22079 0))(
  ( (Nil!22076) (Cons!22075 (h!23284 (_ BitVec 64)) (t!31386 List!22079)) )
))
(declare-fun arrayNoDuplicates!0 (array!66055 (_ BitVec 32) List!22079) Bool)

(assert (=> b!1048446 (= res!697574 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22076))))

(declare-fun b!1048447 () Bool)

(declare-fun e!594669 () Bool)

(assert (=> b!1048447 (= e!594667 e!594669)))

(declare-fun res!697572 () Bool)

(assert (=> b!1048447 (=> (not res!697572) (not e!594669))))

(declare-fun lt!463199 () array!66055)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048447 (= res!697572 (arrayContainsKey!0 lt!463199 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048447 (= lt!463199 (array!66056 (store (arr!31767 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32303 a!3488)))))

(declare-fun b!1048448 () Bool)

(declare-fun e!594668 () Bool)

(assert (=> b!1048448 (= e!594668 (not true))))

(declare-fun lt!463200 () (_ BitVec 32))

(assert (=> b!1048448 (= (select (store (arr!31767 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463200) k!2747)))

(declare-fun b!1048449 () Bool)

(declare-fun res!697577 () Bool)

(assert (=> b!1048449 (=> (not res!697577) (not e!594667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048449 (= res!697577 (validKeyInArray!0 k!2747))))

(declare-fun b!1048450 () Bool)

(assert (=> b!1048450 (= e!594669 e!594668)))

(declare-fun res!697575 () Bool)

(assert (=> b!1048450 (=> (not res!697575) (not e!594668))))

(assert (=> b!1048450 (= res!697575 (not (= lt!463200 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66055 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048450 (= lt!463200 (arrayScanForKey!0 lt!463199 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048451 () Bool)

(declare-fun res!697576 () Bool)

(assert (=> b!1048451 (=> (not res!697576) (not e!594667))))

(assert (=> b!1048451 (= res!697576 (= (select (arr!31767 a!3488) i!1381) k!2747))))

(assert (= (and start!92254 res!697573) b!1048446))

(assert (= (and b!1048446 res!697574) b!1048449))

(assert (= (and b!1048449 res!697577) b!1048451))

(assert (= (and b!1048451 res!697576) b!1048447))

(assert (= (and b!1048447 res!697572) b!1048450))

(assert (= (and b!1048450 res!697575) b!1048448))

(declare-fun m!969415 () Bool)

(assert (=> b!1048448 m!969415))

(declare-fun m!969417 () Bool)

(assert (=> b!1048448 m!969417))

(declare-fun m!969419 () Bool)

(assert (=> b!1048451 m!969419))

(declare-fun m!969421 () Bool)

(assert (=> b!1048446 m!969421))

(declare-fun m!969423 () Bool)

(assert (=> b!1048447 m!969423))

(assert (=> b!1048447 m!969415))

(declare-fun m!969425 () Bool)

(assert (=> b!1048449 m!969425))

(declare-fun m!969427 () Bool)

(assert (=> start!92254 m!969427))

(declare-fun m!969429 () Bool)

(assert (=> b!1048450 m!969429))

(push 1)

(assert (not b!1048450))

(assert (not b!1048447))

(assert (not b!1048449))

(assert (not b!1048446))

(assert (not start!92254))

(check-sat)

