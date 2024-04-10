; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92360 () Bool)

(assert start!92360)

(declare-fun b!1050006 () Bool)

(declare-fun res!699140 () Bool)

(declare-fun e!595794 () Bool)

(assert (=> b!1050006 (=> res!699140 e!595794)))

(declare-datatypes ((List!22132 0))(
  ( (Nil!22129) (Cons!22128 (h!23337 (_ BitVec 64)) (t!31439 List!22132)) )
))
(declare-fun contains!6125 (List!22132 (_ BitVec 64)) Bool)

(assert (=> b!1050006 (= res!699140 (contains!6125 Nil!22129 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!699136 () Bool)

(declare-fun e!595791 () Bool)

(assert (=> start!92360 (=> (not res!699136) (not e!595791))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66161 0))(
  ( (array!66162 (arr!31820 (Array (_ BitVec 32) (_ BitVec 64))) (size!32356 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66161)

(assert (=> start!92360 (= res!699136 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32356 a!3488)) (bvslt (size!32356 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92360 e!595791))

(assert (=> start!92360 true))

(declare-fun array_inv!24600 (array!66161) Bool)

(assert (=> start!92360 (array_inv!24600 a!3488)))

(declare-fun b!1050007 () Bool)

(declare-fun res!699137 () Bool)

(assert (=> b!1050007 (=> res!699137 e!595794)))

(declare-fun noDuplicate!1510 (List!22132) Bool)

(assert (=> b!1050007 (= res!699137 (not (noDuplicate!1510 Nil!22129)))))

(declare-fun b!1050008 () Bool)

(declare-fun res!699132 () Bool)

(assert (=> b!1050008 (=> (not res!699132) (not e!595791))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1050008 (= res!699132 (= (select (arr!31820 a!3488) i!1381) k0!2747))))

(declare-fun b!1050009 () Bool)

(declare-fun e!595798 () Bool)

(assert (=> b!1050009 (= e!595791 e!595798)))

(declare-fun res!699138 () Bool)

(assert (=> b!1050009 (=> (not res!699138) (not e!595798))))

(declare-fun lt!463751 () array!66161)

(declare-fun arrayContainsKey!0 (array!66161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050009 (= res!699138 (arrayContainsKey!0 lt!463751 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050009 (= lt!463751 (array!66162 (store (arr!31820 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32356 a!3488)))))

(declare-fun b!1050010 () Bool)

(declare-fun res!699143 () Bool)

(assert (=> b!1050010 (=> (not res!699143) (not e!595791))))

(declare-fun arrayNoDuplicates!0 (array!66161 (_ BitVec 32) List!22132) Bool)

(assert (=> b!1050010 (= res!699143 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22129))))

(declare-fun b!1050011 () Bool)

(declare-fun e!595793 () Bool)

(assert (=> b!1050011 (= e!595793 e!595794)))

(declare-fun res!699135 () Bool)

(assert (=> b!1050011 (=> res!699135 e!595794)))

(assert (=> b!1050011 (= res!699135 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32356 a!3488)))))

(assert (=> b!1050011 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34360 0))(
  ( (Unit!34361) )
))
(declare-fun lt!463748 () Unit!34360)

(declare-fun lt!463750 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66161 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34360)

(assert (=> b!1050011 (= lt!463748 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463750 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050011 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22129)))

(declare-fun lt!463749 () Unit!34360)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66161 (_ BitVec 32) (_ BitVec 32)) Unit!34360)

(assert (=> b!1050011 (= lt!463749 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun e!595795 () Bool)

(declare-fun b!1050012 () Bool)

(assert (=> b!1050012 (= e!595795 (arrayContainsKey!0 a!3488 k0!2747 lt!463750))))

(declare-fun b!1050013 () Bool)

(declare-fun e!595797 () Bool)

(assert (=> b!1050013 (= e!595798 e!595797)))

(declare-fun res!699139 () Bool)

(assert (=> b!1050013 (=> (not res!699139) (not e!595797))))

(assert (=> b!1050013 (= res!699139 (not (= lt!463750 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66161 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050013 (= lt!463750 (arrayScanForKey!0 lt!463751 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050014 () Bool)

(declare-fun res!699133 () Bool)

(assert (=> b!1050014 (=> (not res!699133) (not e!595791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050014 (= res!699133 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050015 () Bool)

(declare-fun e!595792 () Bool)

(assert (=> b!1050015 (= e!595792 e!595795)))

(declare-fun res!699134 () Bool)

(assert (=> b!1050015 (=> res!699134 e!595795)))

(assert (=> b!1050015 (= res!699134 (bvsle lt!463750 i!1381))))

(declare-fun b!1050016 () Bool)

(assert (=> b!1050016 (= e!595794 true)))

(declare-fun lt!463752 () Bool)

(assert (=> b!1050016 (= lt!463752 (contains!6125 Nil!22129 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050017 () Bool)

(assert (=> b!1050017 (= e!595797 (not e!595793))))

(declare-fun res!699141 () Bool)

(assert (=> b!1050017 (=> res!699141 e!595793)))

(assert (=> b!1050017 (= res!699141 (bvsle lt!463750 i!1381))))

(assert (=> b!1050017 e!595792))

(declare-fun res!699142 () Bool)

(assert (=> b!1050017 (=> (not res!699142) (not e!595792))))

(assert (=> b!1050017 (= res!699142 (= (select (store (arr!31820 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463750) k0!2747))))

(assert (= (and start!92360 res!699136) b!1050010))

(assert (= (and b!1050010 res!699143) b!1050014))

(assert (= (and b!1050014 res!699133) b!1050008))

(assert (= (and b!1050008 res!699132) b!1050009))

(assert (= (and b!1050009 res!699138) b!1050013))

(assert (= (and b!1050013 res!699139) b!1050017))

(assert (= (and b!1050017 res!699142) b!1050015))

(assert (= (and b!1050015 (not res!699134)) b!1050012))

(assert (= (and b!1050017 (not res!699141)) b!1050011))

(assert (= (and b!1050011 (not res!699135)) b!1050007))

(assert (= (and b!1050007 (not res!699137)) b!1050006))

(assert (= (and b!1050006 (not res!699140)) b!1050016))

(declare-fun m!970705 () Bool)

(assert (=> b!1050016 m!970705))

(declare-fun m!970707 () Bool)

(assert (=> b!1050010 m!970707))

(declare-fun m!970709 () Bool)

(assert (=> b!1050013 m!970709))

(declare-fun m!970711 () Bool)

(assert (=> b!1050012 m!970711))

(declare-fun m!970713 () Bool)

(assert (=> b!1050006 m!970713))

(declare-fun m!970715 () Bool)

(assert (=> b!1050009 m!970715))

(declare-fun m!970717 () Bool)

(assert (=> b!1050009 m!970717))

(assert (=> b!1050017 m!970717))

(declare-fun m!970719 () Bool)

(assert (=> b!1050017 m!970719))

(declare-fun m!970721 () Bool)

(assert (=> b!1050008 m!970721))

(declare-fun m!970723 () Bool)

(assert (=> b!1050014 m!970723))

(declare-fun m!970725 () Bool)

(assert (=> start!92360 m!970725))

(declare-fun m!970727 () Bool)

(assert (=> b!1050007 m!970727))

(declare-fun m!970729 () Bool)

(assert (=> b!1050011 m!970729))

(declare-fun m!970731 () Bool)

(assert (=> b!1050011 m!970731))

(declare-fun m!970733 () Bool)

(assert (=> b!1050011 m!970733))

(declare-fun m!970735 () Bool)

(assert (=> b!1050011 m!970735))

(check-sat (not b!1050013) (not b!1050009) (not start!92360) (not b!1050007) (not b!1050006) (not b!1050014) (not b!1050016) (not b!1050012) (not b!1050011) (not b!1050010))
