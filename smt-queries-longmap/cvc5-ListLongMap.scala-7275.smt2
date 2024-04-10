; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92868 () Bool)

(assert start!92868)

(declare-fun b!1054689 () Bool)

(declare-fun e!599245 () Bool)

(declare-fun e!599248 () Bool)

(assert (=> b!1054689 (= e!599245 e!599248)))

(declare-fun res!703631 () Bool)

(assert (=> b!1054689 (=> (not res!703631) (not e!599248))))

(declare-datatypes ((array!66528 0))(
  ( (array!66529 (arr!31996 (Array (_ BitVec 32) (_ BitVec 64))) (size!32532 (_ BitVec 32))) )
))
(declare-fun lt!465515 () array!66528)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054689 (= res!703631 (arrayContainsKey!0 lt!465515 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66528)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054689 (= lt!465515 (array!66529 (store (arr!31996 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32532 a!3488)))))

(declare-fun res!703630 () Bool)

(assert (=> start!92868 (=> (not res!703630) (not e!599245))))

(assert (=> start!92868 (= res!703630 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32532 a!3488)) (bvslt (size!32532 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92868 e!599245))

(assert (=> start!92868 true))

(declare-fun array_inv!24776 (array!66528) Bool)

(assert (=> start!92868 (array_inv!24776 a!3488)))

(declare-fun b!1054690 () Bool)

(declare-fun res!703637 () Bool)

(assert (=> b!1054690 (=> (not res!703637) (not e!599245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054690 (= res!703637 (validKeyInArray!0 k!2747))))

(declare-fun b!1054691 () Bool)

(declare-fun e!599249 () Bool)

(declare-fun e!599251 () Bool)

(assert (=> b!1054691 (= e!599249 e!599251)))

(declare-fun res!703633 () Bool)

(assert (=> b!1054691 (=> res!703633 e!599251)))

(declare-fun lt!465513 () (_ BitVec 32))

(assert (=> b!1054691 (= res!703633 (bvsle lt!465513 i!1381))))

(declare-fun b!1054692 () Bool)

(assert (=> b!1054692 (= e!599251 (arrayContainsKey!0 a!3488 k!2747 lt!465513))))

(declare-fun b!1054693 () Bool)

(declare-fun e!599246 () Bool)

(assert (=> b!1054693 (= e!599248 e!599246)))

(declare-fun res!703636 () Bool)

(assert (=> b!1054693 (=> (not res!703636) (not e!599246))))

(assert (=> b!1054693 (= res!703636 (not (= lt!465513 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66528 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054693 (= lt!465513 (arrayScanForKey!0 lt!465515 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054694 () Bool)

(declare-fun e!599247 () Bool)

(assert (=> b!1054694 (= e!599247 true)))

(assert (=> b!1054694 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34550 0))(
  ( (Unit!34551) )
))
(declare-fun lt!465514 () Unit!34550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66528 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34550)

(assert (=> b!1054694 (= lt!465514 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465513 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22308 0))(
  ( (Nil!22305) (Cons!22304 (h!23513 (_ BitVec 64)) (t!31615 List!22308)) )
))
(declare-fun arrayNoDuplicates!0 (array!66528 (_ BitVec 32) List!22308) Bool)

(assert (=> b!1054694 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22305)))

(declare-fun lt!465516 () Unit!34550)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66528 (_ BitVec 32) (_ BitVec 32)) Unit!34550)

(assert (=> b!1054694 (= lt!465516 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054695 () Bool)

(declare-fun res!703635 () Bool)

(assert (=> b!1054695 (=> (not res!703635) (not e!599245))))

(assert (=> b!1054695 (= res!703635 (= (select (arr!31996 a!3488) i!1381) k!2747))))

(declare-fun b!1054696 () Bool)

(declare-fun res!703629 () Bool)

(assert (=> b!1054696 (=> (not res!703629) (not e!599245))))

(assert (=> b!1054696 (= res!703629 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22305))))

(declare-fun b!1054697 () Bool)

(assert (=> b!1054697 (= e!599246 (not e!599247))))

(declare-fun res!703632 () Bool)

(assert (=> b!1054697 (=> res!703632 e!599247)))

(assert (=> b!1054697 (= res!703632 (bvsle lt!465513 i!1381))))

(assert (=> b!1054697 e!599249))

(declare-fun res!703634 () Bool)

(assert (=> b!1054697 (=> (not res!703634) (not e!599249))))

(assert (=> b!1054697 (= res!703634 (= (select (store (arr!31996 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465513) k!2747))))

(assert (= (and start!92868 res!703630) b!1054696))

(assert (= (and b!1054696 res!703629) b!1054690))

(assert (= (and b!1054690 res!703637) b!1054695))

(assert (= (and b!1054695 res!703635) b!1054689))

(assert (= (and b!1054689 res!703631) b!1054693))

(assert (= (and b!1054693 res!703636) b!1054697))

(assert (= (and b!1054697 res!703634) b!1054691))

(assert (= (and b!1054691 (not res!703633)) b!1054692))

(assert (= (and b!1054697 (not res!703632)) b!1054694))

(declare-fun m!974735 () Bool)

(assert (=> b!1054689 m!974735))

(declare-fun m!974737 () Bool)

(assert (=> b!1054689 m!974737))

(assert (=> b!1054697 m!974737))

(declare-fun m!974739 () Bool)

(assert (=> b!1054697 m!974739))

(declare-fun m!974741 () Bool)

(assert (=> start!92868 m!974741))

(declare-fun m!974743 () Bool)

(assert (=> b!1054692 m!974743))

(declare-fun m!974745 () Bool)

(assert (=> b!1054696 m!974745))

(declare-fun m!974747 () Bool)

(assert (=> b!1054690 m!974747))

(declare-fun m!974749 () Bool)

(assert (=> b!1054695 m!974749))

(declare-fun m!974751 () Bool)

(assert (=> b!1054694 m!974751))

(declare-fun m!974753 () Bool)

(assert (=> b!1054694 m!974753))

(declare-fun m!974755 () Bool)

(assert (=> b!1054694 m!974755))

(declare-fun m!974757 () Bool)

(assert (=> b!1054694 m!974757))

(declare-fun m!974759 () Bool)

(assert (=> b!1054693 m!974759))

(push 1)

