; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92284 () Bool)

(assert start!92284)

(declare-fun b!1048679 () Bool)

(declare-fun e!594870 () Bool)

(declare-fun e!594864 () Bool)

(assert (=> b!1048679 (= e!594870 e!594864)))

(declare-fun res!697894 () Bool)

(assert (=> b!1048679 (=> (not res!697894) (not e!594864))))

(declare-datatypes ((array!66026 0))(
  ( (array!66027 (arr!31752 (Array (_ BitVec 32) (_ BitVec 64))) (size!32290 (_ BitVec 32))) )
))
(declare-fun lt!463099 () array!66026)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048679 (= res!697894 (arrayContainsKey!0 lt!463099 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66026)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048679 (= lt!463099 (array!66027 (store (arr!31752 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32290 a!3488)))))

(declare-fun b!1048680 () Bool)

(declare-fun e!594867 () Bool)

(assert (=> b!1048680 (= e!594867 true)))

(declare-datatypes ((List!22123 0))(
  ( (Nil!22120) (Cons!22119 (h!23328 (_ BitVec 64)) (t!31421 List!22123)) )
))
(declare-fun arrayNoDuplicates!0 (array!66026 (_ BitVec 32) List!22123) Bool)

(assert (=> b!1048680 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22120)))

(declare-datatypes ((Unit!34157 0))(
  ( (Unit!34158) )
))
(declare-fun lt!463098 () Unit!34157)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66026 (_ BitVec 32) (_ BitVec 32)) Unit!34157)

(assert (=> b!1048680 (= lt!463098 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun e!594866 () Bool)

(declare-fun b!1048681 () Bool)

(declare-fun lt!463097 () (_ BitVec 32))

(assert (=> b!1048681 (= e!594866 (arrayContainsKey!0 a!3488 k0!2747 lt!463097))))

(declare-fun b!1048682 () Bool)

(declare-fun res!697895 () Bool)

(assert (=> b!1048682 (=> (not res!697895) (not e!594870))))

(assert (=> b!1048682 (= res!697895 (= (select (arr!31752 a!3488) i!1381) k0!2747))))

(declare-fun b!1048683 () Bool)

(declare-fun e!594865 () Bool)

(assert (=> b!1048683 (= e!594865 (not e!594867))))

(declare-fun res!697891 () Bool)

(assert (=> b!1048683 (=> res!697891 e!594867)))

(assert (=> b!1048683 (= res!697891 (bvsle lt!463097 i!1381))))

(declare-fun e!594868 () Bool)

(assert (=> b!1048683 e!594868))

(declare-fun res!697893 () Bool)

(assert (=> b!1048683 (=> (not res!697893) (not e!594868))))

(assert (=> b!1048683 (= res!697893 (= (select (store (arr!31752 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463097) k0!2747))))

(declare-fun b!1048684 () Bool)

(declare-fun res!697896 () Bool)

(assert (=> b!1048684 (=> (not res!697896) (not e!594870))))

(assert (=> b!1048684 (= res!697896 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22120))))

(declare-fun b!1048685 () Bool)

(assert (=> b!1048685 (= e!594864 e!594865)))

(declare-fun res!697892 () Bool)

(assert (=> b!1048685 (=> (not res!697892) (not e!594865))))

(assert (=> b!1048685 (= res!697892 (not (= lt!463097 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66026 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048685 (= lt!463097 (arrayScanForKey!0 lt!463099 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!697897 () Bool)

(assert (=> start!92284 (=> (not res!697897) (not e!594870))))

(assert (=> start!92284 (= res!697897 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32290 a!3488)) (bvslt (size!32290 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92284 e!594870))

(assert (=> start!92284 true))

(declare-fun array_inv!24535 (array!66026) Bool)

(assert (=> start!92284 (array_inv!24535 a!3488)))

(declare-fun b!1048686 () Bool)

(assert (=> b!1048686 (= e!594868 e!594866)))

(declare-fun res!697889 () Bool)

(assert (=> b!1048686 (=> res!697889 e!594866)))

(assert (=> b!1048686 (= res!697889 (bvsle lt!463097 i!1381))))

(declare-fun b!1048687 () Bool)

(declare-fun res!697890 () Bool)

(assert (=> b!1048687 (=> (not res!697890) (not e!594870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048687 (= res!697890 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92284 res!697897) b!1048684))

(assert (= (and b!1048684 res!697896) b!1048687))

(assert (= (and b!1048687 res!697890) b!1048682))

(assert (= (and b!1048682 res!697895) b!1048679))

(assert (= (and b!1048679 res!697894) b!1048685))

(assert (= (and b!1048685 res!697892) b!1048683))

(assert (= (and b!1048683 res!697893) b!1048686))

(assert (= (and b!1048686 (not res!697889)) b!1048681))

(assert (= (and b!1048683 (not res!697891)) b!1048680))

(declare-fun m!969085 () Bool)

(assert (=> b!1048687 m!969085))

(declare-fun m!969087 () Bool)

(assert (=> start!92284 m!969087))

(declare-fun m!969089 () Bool)

(assert (=> b!1048682 m!969089))

(declare-fun m!969091 () Bool)

(assert (=> b!1048683 m!969091))

(declare-fun m!969093 () Bool)

(assert (=> b!1048683 m!969093))

(declare-fun m!969095 () Bool)

(assert (=> b!1048684 m!969095))

(declare-fun m!969097 () Bool)

(assert (=> b!1048680 m!969097))

(declare-fun m!969099 () Bool)

(assert (=> b!1048680 m!969099))

(declare-fun m!969101 () Bool)

(assert (=> b!1048679 m!969101))

(assert (=> b!1048679 m!969091))

(declare-fun m!969103 () Bool)

(assert (=> b!1048685 m!969103))

(declare-fun m!969105 () Bool)

(assert (=> b!1048681 m!969105))

(check-sat (not b!1048680) (not b!1048687) (not b!1048681) (not b!1048679) (not b!1048684) (not b!1048685) (not start!92284))
(check-sat)
