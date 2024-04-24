; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92550 () Bool)

(assert start!92550)

(declare-fun b!1050550 () Bool)

(declare-fun res!698879 () Bool)

(declare-fun e!596117 () Bool)

(assert (=> b!1050550 (=> (not res!698879) (not e!596117))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66166 0))(
  ( (array!66167 (arr!31816 (Array (_ BitVec 32) (_ BitVec 64))) (size!32353 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66166)

(assert (=> b!1050550 (= res!698879 (= (select (arr!31816 a!3488) i!1381) k0!2747))))

(declare-fun b!1050551 () Bool)

(declare-fun e!596116 () Bool)

(assert (=> b!1050551 (= e!596117 e!596116)))

(declare-fun res!698871 () Bool)

(assert (=> b!1050551 (=> (not res!698871) (not e!596116))))

(declare-fun lt!463948 () array!66166)

(declare-fun arrayContainsKey!0 (array!66166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050551 (= res!698871 (arrayContainsKey!0 lt!463948 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050551 (= lt!463948 (array!66167 (store (arr!31816 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32353 a!3488)))))

(declare-fun b!1050552 () Bool)

(declare-fun res!698877 () Bool)

(assert (=> b!1050552 (=> (not res!698877) (not e!596117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050552 (= res!698877 (validKeyInArray!0 k0!2747))))

(declare-fun res!698876 () Bool)

(assert (=> start!92550 (=> (not res!698876) (not e!596117))))

(assert (=> start!92550 (= res!698876 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32353 a!3488)) (bvslt (size!32353 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92550 e!596117))

(assert (=> start!92550 true))

(declare-fun array_inv!24598 (array!66166) Bool)

(assert (=> start!92550 (array_inv!24598 a!3488)))

(declare-fun b!1050553 () Bool)

(declare-fun e!596114 () Bool)

(assert (=> b!1050553 (= e!596116 e!596114)))

(declare-fun res!698872 () Bool)

(assert (=> b!1050553 (=> (not res!698872) (not e!596114))))

(declare-fun lt!463947 () (_ BitVec 32))

(assert (=> b!1050553 (= res!698872 (not (= lt!463947 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66166 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050553 (= lt!463947 (arrayScanForKey!0 lt!463948 k0!2747 #b00000000000000000000000000000000))))

(declare-fun e!596118 () Bool)

(declare-fun b!1050554 () Bool)

(assert (=> b!1050554 (= e!596118 (arrayContainsKey!0 a!3488 k0!2747 lt!463947))))

(declare-fun b!1050555 () Bool)

(declare-fun e!596119 () Bool)

(assert (=> b!1050555 (= e!596119 e!596118)))

(declare-fun res!698878 () Bool)

(assert (=> b!1050555 (=> res!698878 e!596118)))

(assert (=> b!1050555 (= res!698878 (bvsle lt!463947 i!1381))))

(declare-fun b!1050556 () Bool)

(declare-fun e!596113 () Bool)

(assert (=> b!1050556 (= e!596113 true)))

(declare-datatypes ((List!22098 0))(
  ( (Nil!22095) (Cons!22094 (h!23312 (_ BitVec 64)) (t!31397 List!22098)) )
))
(declare-fun arrayNoDuplicates!0 (array!66166 (_ BitVec 32) List!22098) Bool)

(assert (=> b!1050556 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22095)))

(declare-datatypes ((Unit!34321 0))(
  ( (Unit!34322) )
))
(declare-fun lt!463949 () Unit!34321)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66166 (_ BitVec 32) (_ BitVec 32)) Unit!34321)

(assert (=> b!1050556 (= lt!463949 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050557 () Bool)

(declare-fun res!698874 () Bool)

(assert (=> b!1050557 (=> (not res!698874) (not e!596117))))

(assert (=> b!1050557 (= res!698874 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22095))))

(declare-fun b!1050558 () Bool)

(assert (=> b!1050558 (= e!596114 (not e!596113))))

(declare-fun res!698875 () Bool)

(assert (=> b!1050558 (=> res!698875 e!596113)))

(assert (=> b!1050558 (= res!698875 (bvsle lt!463947 i!1381))))

(assert (=> b!1050558 e!596119))

(declare-fun res!698873 () Bool)

(assert (=> b!1050558 (=> (not res!698873) (not e!596119))))

(assert (=> b!1050558 (= res!698873 (= (select (store (arr!31816 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463947) k0!2747))))

(assert (= (and start!92550 res!698876) b!1050557))

(assert (= (and b!1050557 res!698874) b!1050552))

(assert (= (and b!1050552 res!698877) b!1050550))

(assert (= (and b!1050550 res!698879) b!1050551))

(assert (= (and b!1050551 res!698871) b!1050553))

(assert (= (and b!1050553 res!698872) b!1050558))

(assert (= (and b!1050558 res!698873) b!1050555))

(assert (= (and b!1050555 (not res!698878)) b!1050554))

(assert (= (and b!1050558 (not res!698875)) b!1050556))

(declare-fun m!971699 () Bool)

(assert (=> b!1050557 m!971699))

(declare-fun m!971701 () Bool)

(assert (=> b!1050553 m!971701))

(declare-fun m!971703 () Bool)

(assert (=> b!1050550 m!971703))

(declare-fun m!971705 () Bool)

(assert (=> b!1050558 m!971705))

(declare-fun m!971707 () Bool)

(assert (=> b!1050558 m!971707))

(declare-fun m!971709 () Bool)

(assert (=> b!1050556 m!971709))

(declare-fun m!971711 () Bool)

(assert (=> b!1050556 m!971711))

(declare-fun m!971713 () Bool)

(assert (=> start!92550 m!971713))

(declare-fun m!971715 () Bool)

(assert (=> b!1050551 m!971715))

(assert (=> b!1050551 m!971705))

(declare-fun m!971717 () Bool)

(assert (=> b!1050552 m!971717))

(declare-fun m!971719 () Bool)

(assert (=> b!1050554 m!971719))

(check-sat (not b!1050554) (not b!1050557) (not b!1050551) (not b!1050552) (not b!1050556) (not start!92550) (not b!1050553))
(check-sat)
