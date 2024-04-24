; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92562 () Bool)

(assert start!92562)

(declare-fun b!1050745 () Bool)

(declare-fun e!596254 () Bool)

(assert (=> b!1050745 (= e!596254 true)))

(declare-fun lt!464025 () Bool)

(declare-datatypes ((List!22104 0))(
  ( (Nil!22101) (Cons!22100 (h!23318 (_ BitVec 64)) (t!31403 List!22104)) )
))
(declare-fun contains!6134 (List!22104 (_ BitVec 64)) Bool)

(assert (=> b!1050745 (= lt!464025 (contains!6134 Nil!22101 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050746 () Bool)

(declare-fun res!699069 () Bool)

(declare-fun e!596253 () Bool)

(assert (=> b!1050746 (=> (not res!699069) (not e!596253))))

(declare-datatypes ((array!66178 0))(
  ( (array!66179 (arr!31822 (Array (_ BitVec 32) (_ BitVec 64))) (size!32359 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66178)

(declare-fun arrayNoDuplicates!0 (array!66178 (_ BitVec 32) List!22104) Bool)

(assert (=> b!1050746 (= res!699069 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22101))))

(declare-fun b!1050747 () Bool)

(declare-fun e!596257 () Bool)

(declare-fun e!596256 () Bool)

(assert (=> b!1050747 (= e!596257 e!596256)))

(declare-fun res!699074 () Bool)

(assert (=> b!1050747 (=> (not res!699074) (not e!596256))))

(declare-fun lt!464027 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050747 (= res!699074 (not (= lt!464027 i!1381)))))

(declare-fun lt!464023 () array!66178)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66178 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050747 (= lt!464027 (arrayScanForKey!0 lt!464023 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050748 () Bool)

(declare-fun res!699066 () Bool)

(assert (=> b!1050748 (=> res!699066 e!596254)))

(declare-fun noDuplicate!1510 (List!22104) Bool)

(assert (=> b!1050748 (= res!699066 (not (noDuplicate!1510 Nil!22101)))))

(declare-fun b!1050749 () Bool)

(assert (=> b!1050749 (= e!596253 e!596257)))

(declare-fun res!699075 () Bool)

(assert (=> b!1050749 (=> (not res!699075) (not e!596257))))

(declare-fun arrayContainsKey!0 (array!66178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050749 (= res!699075 (arrayContainsKey!0 lt!464023 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050749 (= lt!464023 (array!66179 (store (arr!31822 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32359 a!3488)))))

(declare-fun b!1050750 () Bool)

(declare-fun e!596251 () Bool)

(declare-fun e!596255 () Bool)

(assert (=> b!1050750 (= e!596251 e!596255)))

(declare-fun res!699076 () Bool)

(assert (=> b!1050750 (=> res!699076 e!596255)))

(assert (=> b!1050750 (= res!699076 (bvsle lt!464027 i!1381))))

(declare-fun b!1050751 () Bool)

(assert (=> b!1050751 (= e!596255 (arrayContainsKey!0 a!3488 k0!2747 lt!464027))))

(declare-fun b!1050752 () Bool)

(declare-fun e!596252 () Bool)

(assert (=> b!1050752 (= e!596256 (not e!596252))))

(declare-fun res!699071 () Bool)

(assert (=> b!1050752 (=> res!699071 e!596252)))

(assert (=> b!1050752 (= res!699071 (bvsle lt!464027 i!1381))))

(assert (=> b!1050752 e!596251))

(declare-fun res!699067 () Bool)

(assert (=> b!1050752 (=> (not res!699067) (not e!596251))))

(assert (=> b!1050752 (= res!699067 (= (select (store (arr!31822 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464027) k0!2747))))

(declare-fun res!699077 () Bool)

(assert (=> start!92562 (=> (not res!699077) (not e!596253))))

(assert (=> start!92562 (= res!699077 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32359 a!3488)) (bvslt (size!32359 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92562 e!596253))

(assert (=> start!92562 true))

(declare-fun array_inv!24604 (array!66178) Bool)

(assert (=> start!92562 (array_inv!24604 a!3488)))

(declare-fun b!1050753 () Bool)

(declare-fun res!699068 () Bool)

(assert (=> b!1050753 (=> res!699068 e!596254)))

(assert (=> b!1050753 (= res!699068 (contains!6134 Nil!22101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050754 () Bool)

(declare-fun res!699073 () Bool)

(assert (=> b!1050754 (=> (not res!699073) (not e!596253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050754 (= res!699073 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050755 () Bool)

(assert (=> b!1050755 (= e!596252 e!596254)))

(declare-fun res!699072 () Bool)

(assert (=> b!1050755 (=> res!699072 e!596254)))

(assert (=> b!1050755 (= res!699072 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32359 a!3488)))))

(assert (=> b!1050755 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34333 0))(
  ( (Unit!34334) )
))
(declare-fun lt!464026 () Unit!34333)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66178 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34333)

(assert (=> b!1050755 (= lt!464026 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464027 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050755 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22101)))

(declare-fun lt!464024 () Unit!34333)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66178 (_ BitVec 32) (_ BitVec 32)) Unit!34333)

(assert (=> b!1050755 (= lt!464024 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050756 () Bool)

(declare-fun res!699070 () Bool)

(assert (=> b!1050756 (=> (not res!699070) (not e!596253))))

(assert (=> b!1050756 (= res!699070 (= (select (arr!31822 a!3488) i!1381) k0!2747))))

(assert (= (and start!92562 res!699077) b!1050746))

(assert (= (and b!1050746 res!699069) b!1050754))

(assert (= (and b!1050754 res!699073) b!1050756))

(assert (= (and b!1050756 res!699070) b!1050749))

(assert (= (and b!1050749 res!699075) b!1050747))

(assert (= (and b!1050747 res!699074) b!1050752))

(assert (= (and b!1050752 res!699067) b!1050750))

(assert (= (and b!1050750 (not res!699076)) b!1050751))

(assert (= (and b!1050752 (not res!699071)) b!1050755))

(assert (= (and b!1050755 (not res!699072)) b!1050748))

(assert (= (and b!1050748 (not res!699066)) b!1050753))

(assert (= (and b!1050753 (not res!699068)) b!1050745))

(declare-fun m!971861 () Bool)

(assert (=> start!92562 m!971861))

(declare-fun m!971863 () Bool)

(assert (=> b!1050755 m!971863))

(declare-fun m!971865 () Bool)

(assert (=> b!1050755 m!971865))

(declare-fun m!971867 () Bool)

(assert (=> b!1050755 m!971867))

(declare-fun m!971869 () Bool)

(assert (=> b!1050755 m!971869))

(declare-fun m!971871 () Bool)

(assert (=> b!1050746 m!971871))

(declare-fun m!971873 () Bool)

(assert (=> b!1050749 m!971873))

(declare-fun m!971875 () Bool)

(assert (=> b!1050749 m!971875))

(declare-fun m!971877 () Bool)

(assert (=> b!1050747 m!971877))

(declare-fun m!971879 () Bool)

(assert (=> b!1050748 m!971879))

(declare-fun m!971881 () Bool)

(assert (=> b!1050756 m!971881))

(declare-fun m!971883 () Bool)

(assert (=> b!1050754 m!971883))

(declare-fun m!971885 () Bool)

(assert (=> b!1050745 m!971885))

(declare-fun m!971887 () Bool)

(assert (=> b!1050753 m!971887))

(assert (=> b!1050752 m!971875))

(declare-fun m!971889 () Bool)

(assert (=> b!1050752 m!971889))

(declare-fun m!971891 () Bool)

(assert (=> b!1050751 m!971891))

(check-sat (not b!1050748) (not start!92562) (not b!1050755) (not b!1050747) (not b!1050746) (not b!1050751) (not b!1050753) (not b!1050754) (not b!1050749) (not b!1050745))
(check-sat)
