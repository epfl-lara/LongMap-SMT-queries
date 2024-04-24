; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92712 () Bool)

(assert start!92712)

(declare-fun b!1052860 () Bool)

(declare-fun e!597778 () Bool)

(declare-fun e!597772 () Bool)

(assert (=> b!1052860 (= e!597778 e!597772)))

(declare-fun res!701183 () Bool)

(assert (=> b!1052860 (=> res!701183 e!597772)))

(declare-fun lt!464830 () (_ BitVec 32))

(declare-datatypes ((array!66328 0))(
  ( (array!66329 (arr!31897 (Array (_ BitVec 32) (_ BitVec 64))) (size!32434 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66328)

(declare-fun lt!464826 () (_ BitVec 32))

(assert (=> b!1052860 (= res!701183 (or (bvslt lt!464826 #b00000000000000000000000000000000) (bvsge lt!464830 (size!32434 a!3488)) (bvsge lt!464826 (size!32434 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052860 (arrayContainsKey!0 a!3488 k0!2747 lt!464830)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((Unit!34435 0))(
  ( (Unit!34436) )
))
(declare-fun lt!464829 () Unit!34435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34435)

(assert (=> b!1052860 (= lt!464829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464830))))

(assert (=> b!1052860 (= lt!464830 (bvadd #b00000000000000000000000000000001 lt!464826))))

(declare-datatypes ((List!22179 0))(
  ( (Nil!22176) (Cons!22175 (h!23393 (_ BitVec 64)) (t!31478 List!22179)) )
))
(declare-fun arrayNoDuplicates!0 (array!66328 (_ BitVec 32) List!22179) Bool)

(assert (=> b!1052860 (arrayNoDuplicates!0 a!3488 lt!464826 Nil!22176)))

(declare-fun lt!464831 () Unit!34435)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66328 (_ BitVec 32) (_ BitVec 32)) Unit!34435)

(assert (=> b!1052860 (= lt!464831 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464826))))

(declare-fun b!1052861 () Bool)

(declare-fun e!597774 () Bool)

(declare-fun e!597771 () Bool)

(assert (=> b!1052861 (= e!597774 e!597771)))

(declare-fun res!701188 () Bool)

(assert (=> b!1052861 (=> res!701188 e!597771)))

(assert (=> b!1052861 (= res!701188 (or (bvsgt lt!464826 i!1381) (bvsle i!1381 lt!464826)))))

(declare-fun b!1052863 () Bool)

(declare-fun e!597776 () Bool)

(declare-fun e!597773 () Bool)

(assert (=> b!1052863 (= e!597776 e!597773)))

(declare-fun res!701191 () Bool)

(assert (=> b!1052863 (=> (not res!701191) (not e!597773))))

(assert (=> b!1052863 (= res!701191 (not (= lt!464826 i!1381)))))

(declare-fun lt!464827 () array!66328)

(declare-fun arrayScanForKey!0 (array!66328 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052863 (= lt!464826 (arrayScanForKey!0 lt!464827 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052864 () Bool)

(assert (=> b!1052864 (= e!597772 true)))

(declare-fun lt!464828 () Bool)

(declare-fun contains!6158 (List!22179 (_ BitVec 64)) Bool)

(assert (=> b!1052864 (= lt!464828 (contains!6158 Nil!22176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052865 () Bool)

(declare-fun e!597777 () Bool)

(assert (=> b!1052865 (= e!597777 e!597776)))

(declare-fun res!701186 () Bool)

(assert (=> b!1052865 (=> (not res!701186) (not e!597776))))

(assert (=> b!1052865 (= res!701186 (arrayContainsKey!0 lt!464827 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052865 (= lt!464827 (array!66329 (store (arr!31897 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32434 a!3488)))))

(declare-fun b!1052866 () Bool)

(declare-fun res!701184 () Bool)

(assert (=> b!1052866 (=> res!701184 e!597772)))

(assert (=> b!1052866 (= res!701184 (contains!6158 Nil!22176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052867 () Bool)

(declare-fun res!701181 () Bool)

(assert (=> b!1052867 (=> (not res!701181) (not e!597777))))

(assert (=> b!1052867 (= res!701181 (= (select (arr!31897 a!3488) i!1381) k0!2747))))

(declare-fun b!1052868 () Bool)

(declare-fun res!701185 () Bool)

(assert (=> b!1052868 (=> res!701185 e!597772)))

(declare-fun noDuplicate!1534 (List!22179) Bool)

(assert (=> b!1052868 (= res!701185 (not (noDuplicate!1534 Nil!22176)))))

(declare-fun b!1052869 () Bool)

(declare-fun res!701182 () Bool)

(assert (=> b!1052869 (=> (not res!701182) (not e!597777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052869 (= res!701182 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052862 () Bool)

(assert (=> b!1052862 (= e!597771 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!701190 () Bool)

(assert (=> start!92712 (=> (not res!701190) (not e!597777))))

(assert (=> start!92712 (= res!701190 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32434 a!3488)) (bvslt (size!32434 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92712 e!597777))

(assert (=> start!92712 true))

(declare-fun array_inv!24679 (array!66328) Bool)

(assert (=> start!92712 (array_inv!24679 a!3488)))

(declare-fun b!1052870 () Bool)

(declare-fun res!701187 () Bool)

(assert (=> b!1052870 (=> (not res!701187) (not e!597777))))

(assert (=> b!1052870 (= res!701187 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22176))))

(declare-fun b!1052871 () Bool)

(assert (=> b!1052871 (= e!597773 (not e!597778))))

(declare-fun res!701189 () Bool)

(assert (=> b!1052871 (=> res!701189 e!597778)))

(assert (=> b!1052871 (= res!701189 (or (bvsgt lt!464826 i!1381) (bvsle i!1381 lt!464826)))))

(assert (=> b!1052871 e!597774))

(declare-fun res!701192 () Bool)

(assert (=> b!1052871 (=> (not res!701192) (not e!597774))))

(assert (=> b!1052871 (= res!701192 (= (select (store (arr!31897 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464826) k0!2747))))

(assert (= (and start!92712 res!701190) b!1052870))

(assert (= (and b!1052870 res!701187) b!1052869))

(assert (= (and b!1052869 res!701182) b!1052867))

(assert (= (and b!1052867 res!701181) b!1052865))

(assert (= (and b!1052865 res!701186) b!1052863))

(assert (= (and b!1052863 res!701191) b!1052871))

(assert (= (and b!1052871 res!701192) b!1052861))

(assert (= (and b!1052861 (not res!701188)) b!1052862))

(assert (= (and b!1052871 (not res!701189)) b!1052860))

(assert (= (and b!1052860 (not res!701183)) b!1052868))

(assert (= (and b!1052868 (not res!701185)) b!1052866))

(assert (= (and b!1052866 (not res!701184)) b!1052864))

(declare-fun m!973691 () Bool)

(assert (=> b!1052871 m!973691))

(declare-fun m!973693 () Bool)

(assert (=> b!1052871 m!973693))

(declare-fun m!973695 () Bool)

(assert (=> b!1052865 m!973695))

(assert (=> b!1052865 m!973691))

(declare-fun m!973697 () Bool)

(assert (=> b!1052870 m!973697))

(declare-fun m!973699 () Bool)

(assert (=> b!1052862 m!973699))

(declare-fun m!973701 () Bool)

(assert (=> b!1052867 m!973701))

(declare-fun m!973703 () Bool)

(assert (=> b!1052863 m!973703))

(declare-fun m!973705 () Bool)

(assert (=> b!1052868 m!973705))

(declare-fun m!973707 () Bool)

(assert (=> b!1052864 m!973707))

(declare-fun m!973709 () Bool)

(assert (=> start!92712 m!973709))

(declare-fun m!973711 () Bool)

(assert (=> b!1052869 m!973711))

(declare-fun m!973713 () Bool)

(assert (=> b!1052866 m!973713))

(declare-fun m!973715 () Bool)

(assert (=> b!1052860 m!973715))

(declare-fun m!973717 () Bool)

(assert (=> b!1052860 m!973717))

(declare-fun m!973719 () Bool)

(assert (=> b!1052860 m!973719))

(declare-fun m!973721 () Bool)

(assert (=> b!1052860 m!973721))

(check-sat (not b!1052860) (not b!1052865) (not b!1052870) (not start!92712) (not b!1052866) (not b!1052864) (not b!1052868) (not b!1052862) (not b!1052863) (not b!1052869))
(check-sat)
