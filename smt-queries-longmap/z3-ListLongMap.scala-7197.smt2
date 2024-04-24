; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92448 () Bool)

(assert start!92448)

(declare-fun b!1049590 () Bool)

(declare-fun res!697952 () Bool)

(declare-fun e!595388 () Bool)

(assert (=> b!1049590 (=> (not res!697952) (not e!595388))))

(declare-datatypes ((array!66091 0))(
  ( (array!66092 (arr!31780 (Array (_ BitVec 32) (_ BitVec 64))) (size!32317 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66091)

(declare-datatypes ((List!22062 0))(
  ( (Nil!22059) (Cons!22058 (h!23276 (_ BitVec 64)) (t!31361 List!22062)) )
))
(declare-fun arrayNoDuplicates!0 (array!66091 (_ BitVec 32) List!22062) Bool)

(assert (=> b!1049590 (= res!697952 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22059))))

(declare-fun res!697949 () Bool)

(assert (=> start!92448 (=> (not res!697949) (not e!595388))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92448 (= res!697949 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32317 a!3488)) (bvslt (size!32317 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92448 e!595388))

(assert (=> start!92448 true))

(declare-fun array_inv!24562 (array!66091) Bool)

(assert (=> start!92448 (array_inv!24562 a!3488)))

(declare-fun b!1049591 () Bool)

(declare-fun res!697950 () Bool)

(assert (=> b!1049591 (=> (not res!697950) (not e!595388))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049591 (= res!697950 (validKeyInArray!0 k0!2747))))

(declare-fun lt!463675 () (_ BitVec 32))

(declare-fun e!595389 () Bool)

(declare-fun b!1049592 () Bool)

(assert (=> b!1049592 (= e!595389 (not (or (bvsle lt!463675 i!1381) (bvslt lt!463675 #b00000000000000000000000000000000) (bvslt lt!463675 (size!32317 a!3488)))))))

(assert (=> b!1049592 (= (select (store (arr!31780 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463675) k0!2747)))

(declare-fun b!1049593 () Bool)

(declare-fun e!595387 () Bool)

(assert (=> b!1049593 (= e!595388 e!595387)))

(declare-fun res!697947 () Bool)

(assert (=> b!1049593 (=> (not res!697947) (not e!595387))))

(declare-fun lt!463676 () array!66091)

(declare-fun arrayContainsKey!0 (array!66091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049593 (= res!697947 (arrayContainsKey!0 lt!463676 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049593 (= lt!463676 (array!66092 (store (arr!31780 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32317 a!3488)))))

(declare-fun b!1049594 () Bool)

(declare-fun res!697948 () Bool)

(assert (=> b!1049594 (=> (not res!697948) (not e!595388))))

(assert (=> b!1049594 (= res!697948 (= (select (arr!31780 a!3488) i!1381) k0!2747))))

(declare-fun b!1049595 () Bool)

(assert (=> b!1049595 (= e!595387 e!595389)))

(declare-fun res!697951 () Bool)

(assert (=> b!1049595 (=> (not res!697951) (not e!595389))))

(assert (=> b!1049595 (= res!697951 (not (= lt!463675 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66091 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049595 (= lt!463675 (arrayScanForKey!0 lt!463676 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92448 res!697949) b!1049590))

(assert (= (and b!1049590 res!697952) b!1049591))

(assert (= (and b!1049591 res!697950) b!1049594))

(assert (= (and b!1049594 res!697948) b!1049593))

(assert (= (and b!1049593 res!697947) b!1049595))

(assert (= (and b!1049595 res!697951) b!1049592))

(declare-fun m!970955 () Bool)

(assert (=> b!1049595 m!970955))

(declare-fun m!970957 () Bool)

(assert (=> start!92448 m!970957))

(declare-fun m!970959 () Bool)

(assert (=> b!1049593 m!970959))

(declare-fun m!970961 () Bool)

(assert (=> b!1049593 m!970961))

(declare-fun m!970963 () Bool)

(assert (=> b!1049590 m!970963))

(declare-fun m!970965 () Bool)

(assert (=> b!1049594 m!970965))

(declare-fun m!970967 () Bool)

(assert (=> b!1049591 m!970967))

(assert (=> b!1049592 m!970961))

(declare-fun m!970969 () Bool)

(assert (=> b!1049592 m!970969))

(check-sat (not b!1049595) (not b!1049591) (not b!1049593) (not b!1049590) (not start!92448))
(check-sat)
(get-model)

(declare-fun d!128117 () Bool)

(assert (=> d!128117 (= (array_inv!24562 a!3488) (bvsge (size!32317 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92448 d!128117))

(declare-fun d!128119 () Bool)

(declare-fun lt!463691 () (_ BitVec 32))

(assert (=> d!128119 (and (or (bvslt lt!463691 #b00000000000000000000000000000000) (bvsge lt!463691 (size!32317 lt!463676)) (and (bvsge lt!463691 #b00000000000000000000000000000000) (bvslt lt!463691 (size!32317 lt!463676)))) (bvsge lt!463691 #b00000000000000000000000000000000) (bvslt lt!463691 (size!32317 lt!463676)) (= (select (arr!31780 lt!463676) lt!463691) k0!2747))))

(declare-fun e!595417 () (_ BitVec 32))

(assert (=> d!128119 (= lt!463691 e!595417)))

(declare-fun c!107291 () Bool)

(assert (=> d!128119 (= c!107291 (= (select (arr!31780 lt!463676) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128119 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32317 lt!463676)) (bvslt (size!32317 lt!463676) #b01111111111111111111111111111111))))

(assert (=> d!128119 (= (arrayScanForKey!0 lt!463676 k0!2747 #b00000000000000000000000000000000) lt!463691)))

(declare-fun b!1049636 () Bool)

(assert (=> b!1049636 (= e!595417 #b00000000000000000000000000000000)))

(declare-fun b!1049637 () Bool)

(assert (=> b!1049637 (= e!595417 (arrayScanForKey!0 lt!463676 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128119 c!107291) b!1049636))

(assert (= (and d!128119 (not c!107291)) b!1049637))

(declare-fun m!971003 () Bool)

(assert (=> d!128119 m!971003))

(declare-fun m!971005 () Bool)

(assert (=> d!128119 m!971005))

(declare-fun m!971007 () Bool)

(assert (=> b!1049637 m!971007))

(assert (=> b!1049595 d!128119))

(declare-fun b!1049658 () Bool)

(declare-fun e!595437 () Bool)

(declare-fun call!44785 () Bool)

(assert (=> b!1049658 (= e!595437 call!44785)))

(declare-fun bm!44782 () Bool)

(declare-fun c!107296 () Bool)

(assert (=> bm!44782 (= call!44785 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107296 (Cons!22058 (select (arr!31780 a!3488) #b00000000000000000000000000000000) Nil!22059) Nil!22059)))))

(declare-fun b!1049659 () Bool)

(assert (=> b!1049659 (= e!595437 call!44785)))

(declare-fun d!128121 () Bool)

(declare-fun res!698001 () Bool)

(declare-fun e!595434 () Bool)

(assert (=> d!128121 (=> res!698001 e!595434)))

(assert (=> d!128121 (= res!698001 (bvsge #b00000000000000000000000000000000 (size!32317 a!3488)))))

(assert (=> d!128121 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22059) e!595434)))

(declare-fun b!1049660 () Bool)

(declare-fun e!595436 () Bool)

(assert (=> b!1049660 (= e!595434 e!595436)))

(declare-fun res!698002 () Bool)

(assert (=> b!1049660 (=> (not res!698002) (not e!595436))))

(declare-fun e!595435 () Bool)

(assert (=> b!1049660 (= res!698002 (not e!595435))))

(declare-fun res!698003 () Bool)

(assert (=> b!1049660 (=> (not res!698003) (not e!595435))))

(assert (=> b!1049660 (= res!698003 (validKeyInArray!0 (select (arr!31780 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1049661 () Bool)

(assert (=> b!1049661 (= e!595436 e!595437)))

(assert (=> b!1049661 (= c!107296 (validKeyInArray!0 (select (arr!31780 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1049662 () Bool)

(declare-fun contains!6128 (List!22062 (_ BitVec 64)) Bool)

(assert (=> b!1049662 (= e!595435 (contains!6128 Nil!22059 (select (arr!31780 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128121 (not res!698001)) b!1049660))

(assert (= (and b!1049660 res!698003) b!1049662))

(assert (= (and b!1049660 res!698002) b!1049661))

(assert (= (and b!1049661 c!107296) b!1049659))

(assert (= (and b!1049661 (not c!107296)) b!1049658))

(assert (= (or b!1049659 b!1049658) bm!44782))

(declare-fun m!971009 () Bool)

(assert (=> bm!44782 m!971009))

(declare-fun m!971011 () Bool)

(assert (=> bm!44782 m!971011))

(assert (=> b!1049660 m!971009))

(assert (=> b!1049660 m!971009))

(declare-fun m!971013 () Bool)

(assert (=> b!1049660 m!971013))

(assert (=> b!1049661 m!971009))

(assert (=> b!1049661 m!971009))

(assert (=> b!1049661 m!971013))

(assert (=> b!1049662 m!971009))

(assert (=> b!1049662 m!971009))

(declare-fun m!971015 () Bool)

(assert (=> b!1049662 m!971015))

(assert (=> b!1049590 d!128121))

(declare-fun d!128127 () Bool)

(declare-fun res!698017 () Bool)

(declare-fun e!595454 () Bool)

(assert (=> d!128127 (=> res!698017 e!595454)))

(assert (=> d!128127 (= res!698017 (= (select (arr!31780 lt!463676) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128127 (= (arrayContainsKey!0 lt!463676 k0!2747 #b00000000000000000000000000000000) e!595454)))

(declare-fun b!1049682 () Bool)

(declare-fun e!595455 () Bool)

(assert (=> b!1049682 (= e!595454 e!595455)))

(declare-fun res!698018 () Bool)

(assert (=> b!1049682 (=> (not res!698018) (not e!595455))))

(assert (=> b!1049682 (= res!698018 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32317 lt!463676)))))

(declare-fun b!1049683 () Bool)

(assert (=> b!1049683 (= e!595455 (arrayContainsKey!0 lt!463676 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128127 (not res!698017)) b!1049682))

(assert (= (and b!1049682 res!698018) b!1049683))

(assert (=> d!128127 m!971005))

(declare-fun m!971025 () Bool)

(assert (=> b!1049683 m!971025))

(assert (=> b!1049593 d!128127))

(declare-fun d!128135 () Bool)

(assert (=> d!128135 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1049591 d!128135))

(check-sat (not b!1049660) (not b!1049661) (not b!1049637) (not b!1049683) (not b!1049662) (not bm!44782))
(check-sat)
