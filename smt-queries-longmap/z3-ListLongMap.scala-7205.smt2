; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92290 () Bool)

(assert start!92290)

(declare-fun b!1048760 () Bool)

(declare-fun res!697970 () Bool)

(declare-fun e!594928 () Bool)

(assert (=> b!1048760 (=> (not res!697970) (not e!594928))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048760 (= res!697970 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048761 () Bool)

(declare-fun e!594933 () Bool)

(declare-fun e!594931 () Bool)

(assert (=> b!1048761 (= e!594933 e!594931)))

(declare-fun res!697975 () Bool)

(assert (=> b!1048761 (=> (not res!697975) (not e!594931))))

(declare-fun lt!463125 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048761 (= res!697975 (not (= lt!463125 i!1381)))))

(declare-datatypes ((array!66032 0))(
  ( (array!66033 (arr!31755 (Array (_ BitVec 32) (_ BitVec 64))) (size!32293 (_ BitVec 32))) )
))
(declare-fun lt!463126 () array!66032)

(declare-fun arrayScanForKey!0 (array!66032 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048761 (= lt!463125 (arrayScanForKey!0 lt!463126 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048762 () Bool)

(declare-fun e!594930 () Bool)

(assert (=> b!1048762 (= e!594931 (not e!594930))))

(declare-fun res!697978 () Bool)

(assert (=> b!1048762 (=> res!697978 e!594930)))

(assert (=> b!1048762 (= res!697978 (bvsle lt!463125 i!1381))))

(declare-fun e!594927 () Bool)

(assert (=> b!1048762 e!594927))

(declare-fun res!697972 () Bool)

(assert (=> b!1048762 (=> (not res!697972) (not e!594927))))

(declare-fun a!3488 () array!66032)

(assert (=> b!1048762 (= res!697972 (= (select (store (arr!31755 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463125) k0!2747))))

(declare-fun b!1048763 () Bool)

(assert (=> b!1048763 (= e!594930 true)))

(declare-datatypes ((List!22126 0))(
  ( (Nil!22123) (Cons!22122 (h!23331 (_ BitVec 64)) (t!31424 List!22126)) )
))
(declare-fun arrayNoDuplicates!0 (array!66032 (_ BitVec 32) List!22126) Bool)

(assert (=> b!1048763 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22123)))

(declare-datatypes ((Unit!34163 0))(
  ( (Unit!34164) )
))
(declare-fun lt!463124 () Unit!34163)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66032 (_ BitVec 32) (_ BitVec 32)) Unit!34163)

(assert (=> b!1048763 (= lt!463124 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1048765 () Bool)

(declare-fun e!594929 () Bool)

(assert (=> b!1048765 (= e!594927 e!594929)))

(declare-fun res!697976 () Bool)

(assert (=> b!1048765 (=> res!697976 e!594929)))

(assert (=> b!1048765 (= res!697976 (bvsle lt!463125 i!1381))))

(declare-fun b!1048766 () Bool)

(declare-fun res!697973 () Bool)

(assert (=> b!1048766 (=> (not res!697973) (not e!594928))))

(assert (=> b!1048766 (= res!697973 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22123))))

(declare-fun res!697971 () Bool)

(assert (=> start!92290 (=> (not res!697971) (not e!594928))))

(assert (=> start!92290 (= res!697971 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32293 a!3488)) (bvslt (size!32293 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92290 e!594928))

(assert (=> start!92290 true))

(declare-fun array_inv!24538 (array!66032) Bool)

(assert (=> start!92290 (array_inv!24538 a!3488)))

(declare-fun b!1048764 () Bool)

(assert (=> b!1048764 (= e!594928 e!594933)))

(declare-fun res!697977 () Bool)

(assert (=> b!1048764 (=> (not res!697977) (not e!594933))))

(declare-fun arrayContainsKey!0 (array!66032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048764 (= res!697977 (arrayContainsKey!0 lt!463126 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048764 (= lt!463126 (array!66033 (store (arr!31755 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32293 a!3488)))))

(declare-fun b!1048767 () Bool)

(declare-fun res!697974 () Bool)

(assert (=> b!1048767 (=> (not res!697974) (not e!594928))))

(assert (=> b!1048767 (= res!697974 (= (select (arr!31755 a!3488) i!1381) k0!2747))))

(declare-fun b!1048768 () Bool)

(assert (=> b!1048768 (= e!594929 (arrayContainsKey!0 a!3488 k0!2747 lt!463125))))

(assert (= (and start!92290 res!697971) b!1048766))

(assert (= (and b!1048766 res!697973) b!1048760))

(assert (= (and b!1048760 res!697970) b!1048767))

(assert (= (and b!1048767 res!697974) b!1048764))

(assert (= (and b!1048764 res!697977) b!1048761))

(assert (= (and b!1048761 res!697975) b!1048762))

(assert (= (and b!1048762 res!697972) b!1048765))

(assert (= (and b!1048765 (not res!697976)) b!1048768))

(assert (= (and b!1048762 (not res!697978)) b!1048763))

(declare-fun m!969151 () Bool)

(assert (=> start!92290 m!969151))

(declare-fun m!969153 () Bool)

(assert (=> b!1048763 m!969153))

(declare-fun m!969155 () Bool)

(assert (=> b!1048763 m!969155))

(declare-fun m!969157 () Bool)

(assert (=> b!1048768 m!969157))

(declare-fun m!969159 () Bool)

(assert (=> b!1048767 m!969159))

(declare-fun m!969161 () Bool)

(assert (=> b!1048761 m!969161))

(declare-fun m!969163 () Bool)

(assert (=> b!1048760 m!969163))

(declare-fun m!969165 () Bool)

(assert (=> b!1048766 m!969165))

(declare-fun m!969167 () Bool)

(assert (=> b!1048762 m!969167))

(declare-fun m!969169 () Bool)

(assert (=> b!1048762 m!969169))

(declare-fun m!969171 () Bool)

(assert (=> b!1048764 m!969171))

(assert (=> b!1048764 m!969167))

(check-sat (not b!1048761) (not b!1048766) (not b!1048764) (not b!1048768) (not b!1048763) (not start!92290) (not b!1048760))
(check-sat)
