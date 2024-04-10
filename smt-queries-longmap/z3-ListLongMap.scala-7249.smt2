; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92558 () Bool)

(assert start!92558)

(declare-fun b!1052820 () Bool)

(declare-fun res!701949 () Bool)

(declare-fun e!597808 () Bool)

(assert (=> b!1052820 (=> (not res!701949) (not e!597808))))

(declare-datatypes ((array!66359 0))(
  ( (array!66360 (arr!31919 (Array (_ BitVec 32) (_ BitVec 64))) (size!32455 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66359)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052820 (= res!701949 (= (select (arr!31919 a!3488) i!1381) k0!2747))))

(declare-fun b!1052821 () Bool)

(declare-fun e!597806 () Bool)

(declare-fun e!597805 () Bool)

(assert (=> b!1052821 (= e!597806 e!597805)))

(declare-fun res!701948 () Bool)

(assert (=> b!1052821 (=> (not res!701948) (not e!597805))))

(declare-fun lt!464975 () (_ BitVec 32))

(assert (=> b!1052821 (= res!701948 (not (= lt!464975 i!1381)))))

(declare-fun lt!464976 () array!66359)

(declare-fun arrayScanForKey!0 (array!66359 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052821 (= lt!464975 (arrayScanForKey!0 lt!464976 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052822 () Bool)

(assert (=> b!1052822 (= e!597808 e!597806)))

(declare-fun res!701946 () Bool)

(assert (=> b!1052822 (=> (not res!701946) (not e!597806))))

(declare-fun arrayContainsKey!0 (array!66359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052822 (= res!701946 (arrayContainsKey!0 lt!464976 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052822 (= lt!464976 (array!66360 (store (arr!31919 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32455 a!3488)))))

(declare-fun b!1052823 () Bool)

(assert (=> b!1052823 (= e!597805 (not (or (bvsgt lt!464975 i!1381) (bvsgt i!1381 lt!464975) (bvslt #b00000000000000000000000000000000 (size!32455 a!3488)))))))

(assert (=> b!1052823 (= (select (store (arr!31919 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464975) k0!2747)))

(declare-fun b!1052825 () Bool)

(declare-fun res!701951 () Bool)

(assert (=> b!1052825 (=> (not res!701951) (not e!597808))))

(declare-datatypes ((List!22231 0))(
  ( (Nil!22228) (Cons!22227 (h!23436 (_ BitVec 64)) (t!31538 List!22231)) )
))
(declare-fun arrayNoDuplicates!0 (array!66359 (_ BitVec 32) List!22231) Bool)

(assert (=> b!1052825 (= res!701951 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22228))))

(declare-fun res!701947 () Bool)

(assert (=> start!92558 (=> (not res!701947) (not e!597808))))

(assert (=> start!92558 (= res!701947 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32455 a!3488)) (bvslt (size!32455 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92558 e!597808))

(assert (=> start!92558 true))

(declare-fun array_inv!24699 (array!66359) Bool)

(assert (=> start!92558 (array_inv!24699 a!3488)))

(declare-fun b!1052824 () Bool)

(declare-fun res!701950 () Bool)

(assert (=> b!1052824 (=> (not res!701950) (not e!597808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052824 (= res!701950 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92558 res!701947) b!1052825))

(assert (= (and b!1052825 res!701951) b!1052824))

(assert (= (and b!1052824 res!701950) b!1052820))

(assert (= (and b!1052820 res!701949) b!1052822))

(assert (= (and b!1052822 res!701946) b!1052821))

(assert (= (and b!1052821 res!701948) b!1052823))

(declare-fun m!973221 () Bool)

(assert (=> b!1052823 m!973221))

(declare-fun m!973223 () Bool)

(assert (=> b!1052823 m!973223))

(declare-fun m!973225 () Bool)

(assert (=> b!1052821 m!973225))

(declare-fun m!973227 () Bool)

(assert (=> b!1052824 m!973227))

(declare-fun m!973229 () Bool)

(assert (=> start!92558 m!973229))

(declare-fun m!973231 () Bool)

(assert (=> b!1052825 m!973231))

(declare-fun m!973233 () Bool)

(assert (=> b!1052822 m!973233))

(assert (=> b!1052822 m!973221))

(declare-fun m!973235 () Bool)

(assert (=> b!1052820 m!973235))

(check-sat (not b!1052821) (not b!1052825) (not b!1052822) (not start!92558) (not b!1052824))
(check-sat)
