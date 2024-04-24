; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92724 () Bool)

(assert start!92724)

(declare-fun b!1053076 () Bool)

(declare-fun res!701407 () Bool)

(declare-fun e!597917 () Bool)

(assert (=> b!1053076 (=> (not res!701407) (not e!597917))))

(declare-datatypes ((array!66340 0))(
  ( (array!66341 (arr!31903 (Array (_ BitVec 32) (_ BitVec 64))) (size!32440 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66340)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053076 (= res!701407 (= (select (arr!31903 a!3488) i!1381) k0!2747))))

(declare-fun e!597916 () Bool)

(declare-fun b!1053077 () Bool)

(declare-fun arrayContainsKey!0 (array!66340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053077 (= e!597916 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1053078 () Bool)

(declare-fun res!701402 () Bool)

(assert (=> b!1053078 (=> (not res!701402) (not e!597917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053078 (= res!701402 (validKeyInArray!0 k0!2747))))

(declare-fun res!701397 () Bool)

(assert (=> start!92724 (=> (not res!701397) (not e!597917))))

(assert (=> start!92724 (= res!701397 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32440 a!3488)) (bvslt (size!32440 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92724 e!597917))

(assert (=> start!92724 true))

(declare-fun array_inv!24685 (array!66340) Bool)

(assert (=> start!92724 (array_inv!24685 a!3488)))

(declare-fun b!1053079 () Bool)

(declare-fun e!597915 () Bool)

(assert (=> b!1053079 (= e!597915 e!597916)))

(declare-fun res!701403 () Bool)

(assert (=> b!1053079 (=> res!701403 e!597916)))

(declare-fun lt!464936 () (_ BitVec 32))

(assert (=> b!1053079 (= res!701403 (or (bvsgt lt!464936 i!1381) (bvsle i!1381 lt!464936)))))

(declare-fun b!1053080 () Bool)

(declare-fun e!597918 () Bool)

(assert (=> b!1053080 (= e!597918 true)))

(declare-fun lt!464935 () Bool)

(declare-datatypes ((List!22185 0))(
  ( (Nil!22182) (Cons!22181 (h!23399 (_ BitVec 64)) (t!31484 List!22185)) )
))
(declare-fun contains!6164 (List!22185 (_ BitVec 64)) Bool)

(assert (=> b!1053080 (= lt!464935 (contains!6164 Nil!22182 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053081 () Bool)

(declare-fun e!597919 () Bool)

(assert (=> b!1053081 (= e!597917 e!597919)))

(declare-fun res!701404 () Bool)

(assert (=> b!1053081 (=> (not res!701404) (not e!597919))))

(declare-fun lt!464938 () array!66340)

(assert (=> b!1053081 (= res!701404 (arrayContainsKey!0 lt!464938 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053081 (= lt!464938 (array!66341 (store (arr!31903 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32440 a!3488)))))

(declare-fun b!1053082 () Bool)

(declare-fun res!701405 () Bool)

(assert (=> b!1053082 (=> res!701405 e!597918)))

(assert (=> b!1053082 (= res!701405 (contains!6164 Nil!22182 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1053083 () Bool)

(declare-fun res!701400 () Bool)

(assert (=> b!1053083 (=> (not res!701400) (not e!597917))))

(declare-fun arrayNoDuplicates!0 (array!66340 (_ BitVec 32) List!22185) Bool)

(assert (=> b!1053083 (= res!701400 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22182))))

(declare-fun b!1053084 () Bool)

(declare-fun res!701408 () Bool)

(assert (=> b!1053084 (=> res!701408 e!597918)))

(declare-fun noDuplicate!1540 (List!22185) Bool)

(assert (=> b!1053084 (= res!701408 (not (noDuplicate!1540 Nil!22182)))))

(declare-fun b!1053085 () Bool)

(declare-fun e!597922 () Bool)

(declare-fun e!597920 () Bool)

(assert (=> b!1053085 (= e!597922 (not e!597920))))

(declare-fun res!701401 () Bool)

(assert (=> b!1053085 (=> res!701401 e!597920)))

(assert (=> b!1053085 (= res!701401 (or (bvsgt lt!464936 i!1381) (bvsle i!1381 lt!464936)))))

(assert (=> b!1053085 e!597915))

(declare-fun res!701406 () Bool)

(assert (=> b!1053085 (=> (not res!701406) (not e!597915))))

(assert (=> b!1053085 (= res!701406 (= (select (store (arr!31903 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464936) k0!2747))))

(declare-fun b!1053086 () Bool)

(assert (=> b!1053086 (= e!597920 e!597918)))

(declare-fun res!701399 () Bool)

(assert (=> b!1053086 (=> res!701399 e!597918)))

(declare-fun lt!464934 () (_ BitVec 32))

(assert (=> b!1053086 (= res!701399 (or (bvslt lt!464936 #b00000000000000000000000000000000) (bvsge lt!464934 (size!32440 a!3488)) (bvsge lt!464936 (size!32440 a!3488))))))

(assert (=> b!1053086 (arrayContainsKey!0 a!3488 k0!2747 lt!464934)))

(declare-datatypes ((Unit!34447 0))(
  ( (Unit!34448) )
))
(declare-fun lt!464939 () Unit!34447)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66340 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34447)

(assert (=> b!1053086 (= lt!464939 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464934))))

(assert (=> b!1053086 (= lt!464934 (bvadd #b00000000000000000000000000000001 lt!464936))))

(assert (=> b!1053086 (arrayNoDuplicates!0 a!3488 lt!464936 Nil!22182)))

(declare-fun lt!464937 () Unit!34447)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66340 (_ BitVec 32) (_ BitVec 32)) Unit!34447)

(assert (=> b!1053086 (= lt!464937 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464936))))

(declare-fun b!1053087 () Bool)

(assert (=> b!1053087 (= e!597919 e!597922)))

(declare-fun res!701398 () Bool)

(assert (=> b!1053087 (=> (not res!701398) (not e!597922))))

(assert (=> b!1053087 (= res!701398 (not (= lt!464936 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66340 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053087 (= lt!464936 (arrayScanForKey!0 lt!464938 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92724 res!701397) b!1053083))

(assert (= (and b!1053083 res!701400) b!1053078))

(assert (= (and b!1053078 res!701402) b!1053076))

(assert (= (and b!1053076 res!701407) b!1053081))

(assert (= (and b!1053081 res!701404) b!1053087))

(assert (= (and b!1053087 res!701398) b!1053085))

(assert (= (and b!1053085 res!701406) b!1053079))

(assert (= (and b!1053079 (not res!701403)) b!1053077))

(assert (= (and b!1053085 (not res!701401)) b!1053086))

(assert (= (and b!1053086 (not res!701399)) b!1053084))

(assert (= (and b!1053084 (not res!701408)) b!1053082))

(assert (= (and b!1053082 (not res!701405)) b!1053080))

(declare-fun m!973883 () Bool)

(assert (=> b!1053084 m!973883))

(declare-fun m!973885 () Bool)

(assert (=> b!1053080 m!973885))

(declare-fun m!973887 () Bool)

(assert (=> b!1053082 m!973887))

(declare-fun m!973889 () Bool)

(assert (=> b!1053087 m!973889))

(declare-fun m!973891 () Bool)

(assert (=> b!1053085 m!973891))

(declare-fun m!973893 () Bool)

(assert (=> b!1053085 m!973893))

(declare-fun m!973895 () Bool)

(assert (=> b!1053086 m!973895))

(declare-fun m!973897 () Bool)

(assert (=> b!1053086 m!973897))

(declare-fun m!973899 () Bool)

(assert (=> b!1053086 m!973899))

(declare-fun m!973901 () Bool)

(assert (=> b!1053086 m!973901))

(declare-fun m!973903 () Bool)

(assert (=> b!1053076 m!973903))

(declare-fun m!973905 () Bool)

(assert (=> start!92724 m!973905))

(declare-fun m!973907 () Bool)

(assert (=> b!1053077 m!973907))

(declare-fun m!973909 () Bool)

(assert (=> b!1053078 m!973909))

(declare-fun m!973911 () Bool)

(assert (=> b!1053083 m!973911))

(declare-fun m!973913 () Bool)

(assert (=> b!1053081 m!973913))

(assert (=> b!1053081 m!973891))

(check-sat (not b!1053083) (not b!1053086) (not b!1053081) (not b!1053082) (not b!1053087) (not b!1053078) (not start!92724) (not b!1053077) (not b!1053080) (not b!1053084))
(check-sat)
