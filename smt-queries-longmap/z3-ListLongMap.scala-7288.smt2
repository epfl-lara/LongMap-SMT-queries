; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93118 () Bool)

(assert start!93118)

(declare-fun b!1056114 () Bool)

(declare-fun e!600372 () Bool)

(declare-fun e!600370 () Bool)

(assert (=> b!1056114 (= e!600372 e!600370)))

(declare-fun res!704983 () Bool)

(assert (=> b!1056114 (=> (not res!704983) (not e!600370))))

(declare-fun lt!465870 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056114 (= res!704983 (not (= lt!465870 i!1381)))))

(declare-datatypes ((array!66557 0))(
  ( (array!66558 (arr!32004 (Array (_ BitVec 32) (_ BitVec 64))) (size!32542 (_ BitVec 32))) )
))
(declare-fun lt!465871 () array!66557)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66557 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056114 (= lt!465870 (arrayScanForKey!0 lt!465871 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056115 () Bool)

(declare-fun e!600374 () Bool)

(assert (=> b!1056115 (= e!600374 e!600372)))

(declare-fun res!704978 () Bool)

(assert (=> b!1056115 (=> (not res!704978) (not e!600372))))

(declare-fun arrayContainsKey!0 (array!66557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056115 (= res!704978 (arrayContainsKey!0 lt!465871 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66557)

(assert (=> b!1056115 (= lt!465871 (array!66558 (store (arr!32004 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32542 a!3488)))))

(declare-fun b!1056116 () Bool)

(declare-fun res!704977 () Bool)

(assert (=> b!1056116 (=> (not res!704977) (not e!600374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056116 (= res!704977 (validKeyInArray!0 k0!2747))))

(declare-fun res!704976 () Bool)

(assert (=> start!93118 (=> (not res!704976) (not e!600374))))

(assert (=> start!93118 (= res!704976 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32542 a!3488)) (bvslt (size!32542 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93118 e!600374))

(assert (=> start!93118 true))

(declare-fun array_inv!24787 (array!66557) Bool)

(assert (=> start!93118 (array_inv!24787 a!3488)))

(declare-fun b!1056117 () Bool)

(declare-fun e!600375 () Bool)

(declare-fun e!600373 () Bool)

(assert (=> b!1056117 (= e!600375 e!600373)))

(declare-fun res!704980 () Bool)

(assert (=> b!1056117 (=> res!704980 e!600373)))

(assert (=> b!1056117 (= res!704980 (or (bvsgt lt!465870 i!1381) (bvsle i!1381 lt!465870)))))

(declare-fun b!1056118 () Bool)

(assert (=> b!1056118 (= e!600370 (not (or (bvsgt lt!465870 i!1381) (bvsle i!1381 lt!465870) (bvsle #b00000000000000000000000000000000 (size!32542 a!3488)))))))

(assert (=> b!1056118 e!600375))

(declare-fun res!704981 () Bool)

(assert (=> b!1056118 (=> (not res!704981) (not e!600375))))

(assert (=> b!1056118 (= res!704981 (= (select (store (arr!32004 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465870) k0!2747))))

(declare-fun b!1056119 () Bool)

(declare-fun res!704982 () Bool)

(assert (=> b!1056119 (=> (not res!704982) (not e!600374))))

(declare-datatypes ((List!22375 0))(
  ( (Nil!22372) (Cons!22371 (h!23580 (_ BitVec 64)) (t!31673 List!22375)) )
))
(declare-fun arrayNoDuplicates!0 (array!66557 (_ BitVec 32) List!22375) Bool)

(assert (=> b!1056119 (= res!704982 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22372))))

(declare-fun b!1056120 () Bool)

(declare-fun res!704979 () Bool)

(assert (=> b!1056120 (=> (not res!704979) (not e!600374))))

(assert (=> b!1056120 (= res!704979 (= (select (arr!32004 a!3488) i!1381) k0!2747))))

(declare-fun b!1056121 () Bool)

(assert (=> b!1056121 (= e!600373 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93118 res!704976) b!1056119))

(assert (= (and b!1056119 res!704982) b!1056116))

(assert (= (and b!1056116 res!704977) b!1056120))

(assert (= (and b!1056120 res!704979) b!1056115))

(assert (= (and b!1056115 res!704978) b!1056114))

(assert (= (and b!1056114 res!704983) b!1056118))

(assert (= (and b!1056118 res!704981) b!1056117))

(assert (= (and b!1056117 (not res!704980)) b!1056121))

(declare-fun m!975545 () Bool)

(assert (=> b!1056116 m!975545))

(declare-fun m!975547 () Bool)

(assert (=> b!1056121 m!975547))

(declare-fun m!975549 () Bool)

(assert (=> start!93118 m!975549))

(declare-fun m!975551 () Bool)

(assert (=> b!1056114 m!975551))

(declare-fun m!975553 () Bool)

(assert (=> b!1056118 m!975553))

(declare-fun m!975555 () Bool)

(assert (=> b!1056118 m!975555))

(declare-fun m!975557 () Bool)

(assert (=> b!1056115 m!975557))

(assert (=> b!1056115 m!975553))

(declare-fun m!975559 () Bool)

(assert (=> b!1056120 m!975559))

(declare-fun m!975561 () Bool)

(assert (=> b!1056119 m!975561))

(check-sat (not b!1056114) (not start!93118) (not b!1056115) (not b!1056116) (not b!1056121) (not b!1056119))
(check-sat)
