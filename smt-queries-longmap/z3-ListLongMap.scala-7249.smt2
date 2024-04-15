; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92554 () Bool)

(assert start!92554)

(declare-datatypes ((array!66296 0))(
  ( (array!66297 (arr!31887 (Array (_ BitVec 32) (_ BitVec 64))) (size!32425 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66296)

(declare-fun e!597702 () Bool)

(declare-fun b!1052651 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lt!464769 () (_ BitVec 32))

(assert (=> b!1052651 (= e!597702 (not (or (bvsgt lt!464769 i!1381) (bvsgt i!1381 lt!464769) (bvslt #b00000000000000000000000000000000 (size!32425 a!3488)))))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1052651 (= (select (store (arr!31887 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464769) k0!2747)))

(declare-fun b!1052652 () Bool)

(declare-fun res!701863 () Bool)

(declare-fun e!597703 () Bool)

(assert (=> b!1052652 (=> (not res!701863) (not e!597703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052652 (= res!701863 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052653 () Bool)

(declare-fun e!597704 () Bool)

(assert (=> b!1052653 (= e!597703 e!597704)))

(declare-fun res!701864 () Bool)

(assert (=> b!1052653 (=> (not res!701864) (not e!597704))))

(declare-fun lt!464770 () array!66296)

(declare-fun arrayContainsKey!0 (array!66296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052653 (= res!701864 (arrayContainsKey!0 lt!464770 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052653 (= lt!464770 (array!66297 (store (arr!31887 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32425 a!3488)))))

(declare-fun res!701861 () Bool)

(assert (=> start!92554 (=> (not res!701861) (not e!597703))))

(assert (=> start!92554 (= res!701861 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32425 a!3488)) (bvslt (size!32425 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92554 e!597703))

(assert (=> start!92554 true))

(declare-fun array_inv!24670 (array!66296) Bool)

(assert (=> start!92554 (array_inv!24670 a!3488)))

(declare-fun b!1052654 () Bool)

(assert (=> b!1052654 (= e!597704 e!597702)))

(declare-fun res!701862 () Bool)

(assert (=> b!1052654 (=> (not res!701862) (not e!597702))))

(assert (=> b!1052654 (= res!701862 (not (= lt!464769 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66296 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052654 (= lt!464769 (arrayScanForKey!0 lt!464770 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052655 () Bool)

(declare-fun res!701865 () Bool)

(assert (=> b!1052655 (=> (not res!701865) (not e!597703))))

(assert (=> b!1052655 (= res!701865 (= (select (arr!31887 a!3488) i!1381) k0!2747))))

(declare-fun b!1052656 () Bool)

(declare-fun res!701866 () Bool)

(assert (=> b!1052656 (=> (not res!701866) (not e!597703))))

(declare-datatypes ((List!22258 0))(
  ( (Nil!22255) (Cons!22254 (h!23463 (_ BitVec 64)) (t!31556 List!22258)) )
))
(declare-fun arrayNoDuplicates!0 (array!66296 (_ BitVec 32) List!22258) Bool)

(assert (=> b!1052656 (= res!701866 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22255))))

(assert (= (and start!92554 res!701861) b!1052656))

(assert (= (and b!1052656 res!701866) b!1052652))

(assert (= (and b!1052652 res!701863) b!1052655))

(assert (= (and b!1052655 res!701865) b!1052653))

(assert (= (and b!1052653 res!701864) b!1052654))

(assert (= (and b!1052654 res!701862) b!1052651))

(declare-fun m!972589 () Bool)

(assert (=> b!1052651 m!972589))

(declare-fun m!972591 () Bool)

(assert (=> b!1052651 m!972591))

(declare-fun m!972593 () Bool)

(assert (=> b!1052656 m!972593))

(declare-fun m!972595 () Bool)

(assert (=> b!1052652 m!972595))

(declare-fun m!972597 () Bool)

(assert (=> start!92554 m!972597))

(declare-fun m!972599 () Bool)

(assert (=> b!1052653 m!972599))

(assert (=> b!1052653 m!972589))

(declare-fun m!972601 () Bool)

(assert (=> b!1052655 m!972601))

(declare-fun m!972603 () Bool)

(assert (=> b!1052654 m!972603))

(check-sat (not b!1052653) (not b!1052654) (not b!1052656) (not start!92554) (not b!1052652))
(check-sat)
