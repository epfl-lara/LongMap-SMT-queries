; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92354 () Bool)

(assert start!92354)

(declare-fun b!1049898 () Bool)

(declare-fun e!595719 () Bool)

(declare-fun lt!463704 () (_ BitVec 32))

(declare-datatypes ((array!66155 0))(
  ( (array!66156 (arr!31817 (Array (_ BitVec 32) (_ BitVec 64))) (size!32353 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66155)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049898 (= e!595719 (arrayContainsKey!0 a!3488 k0!2747 lt!463704))))

(declare-fun b!1049899 () Bool)

(declare-fun e!595724 () Bool)

(declare-fun e!595726 () Bool)

(assert (=> b!1049899 (= e!595724 e!595726)))

(declare-fun res!699027 () Bool)

(assert (=> b!1049899 (=> (not res!699027) (not e!595726))))

(declare-fun lt!463703 () array!66155)

(assert (=> b!1049899 (= res!699027 (arrayContainsKey!0 lt!463703 k0!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049899 (= lt!463703 (array!66156 (store (arr!31817 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32353 a!3488)))))

(declare-fun b!1049900 () Bool)

(declare-fun res!699025 () Bool)

(declare-fun e!595723 () Bool)

(assert (=> b!1049900 (=> res!699025 e!595723)))

(declare-datatypes ((List!22129 0))(
  ( (Nil!22126) (Cons!22125 (h!23334 (_ BitVec 64)) (t!31436 List!22129)) )
))
(declare-fun contains!6122 (List!22129 (_ BitVec 64)) Bool)

(assert (=> b!1049900 (= res!699025 (contains!6122 Nil!22126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049901 () Bool)

(declare-fun res!699028 () Bool)

(assert (=> b!1049901 (=> (not res!699028) (not e!595724))))

(assert (=> b!1049901 (= res!699028 (= (select (arr!31817 a!3488) i!1381) k0!2747))))

(declare-fun b!1049902 () Bool)

(declare-fun res!699033 () Bool)

(assert (=> b!1049902 (=> (not res!699033) (not e!595724))))

(declare-fun arrayNoDuplicates!0 (array!66155 (_ BitVec 32) List!22129) Bool)

(assert (=> b!1049902 (= res!699033 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22126))))

(declare-fun b!1049903 () Bool)

(declare-fun e!595720 () Bool)

(declare-fun e!595722 () Bool)

(assert (=> b!1049903 (= e!595720 (not e!595722))))

(declare-fun res!699030 () Bool)

(assert (=> b!1049903 (=> res!699030 e!595722)))

(assert (=> b!1049903 (= res!699030 (bvsle lt!463704 i!1381))))

(declare-fun e!595725 () Bool)

(assert (=> b!1049903 e!595725))

(declare-fun res!699031 () Bool)

(assert (=> b!1049903 (=> (not res!699031) (not e!595725))))

(assert (=> b!1049903 (= res!699031 (= (select (store (arr!31817 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463704) k0!2747))))

(declare-fun b!1049904 () Bool)

(assert (=> b!1049904 (= e!595723 true)))

(declare-fun lt!463705 () Bool)

(assert (=> b!1049904 (= lt!463705 (contains!6122 Nil!22126 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!699029 () Bool)

(assert (=> start!92354 (=> (not res!699029) (not e!595724))))

(assert (=> start!92354 (= res!699029 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32353 a!3488)) (bvslt (size!32353 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92354 e!595724))

(assert (=> start!92354 true))

(declare-fun array_inv!24597 (array!66155) Bool)

(assert (=> start!92354 (array_inv!24597 a!3488)))

(declare-fun b!1049905 () Bool)

(assert (=> b!1049905 (= e!595726 e!595720)))

(declare-fun res!699034 () Bool)

(assert (=> b!1049905 (=> (not res!699034) (not e!595720))))

(assert (=> b!1049905 (= res!699034 (not (= lt!463704 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66155 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049905 (= lt!463704 (arrayScanForKey!0 lt!463703 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049906 () Bool)

(declare-fun res!699026 () Bool)

(assert (=> b!1049906 (=> (not res!699026) (not e!595724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049906 (= res!699026 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049907 () Bool)

(declare-fun res!699032 () Bool)

(assert (=> b!1049907 (=> res!699032 e!595723)))

(declare-fun noDuplicate!1507 (List!22129) Bool)

(assert (=> b!1049907 (= res!699032 (not (noDuplicate!1507 Nil!22126)))))

(declare-fun b!1049908 () Bool)

(assert (=> b!1049908 (= e!595722 e!595723)))

(declare-fun res!699035 () Bool)

(assert (=> b!1049908 (=> res!699035 e!595723)))

(assert (=> b!1049908 (= res!699035 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32353 a!3488)))))

(assert (=> b!1049908 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34354 0))(
  ( (Unit!34355) )
))
(declare-fun lt!463706 () Unit!34354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34354)

(assert (=> b!1049908 (= lt!463706 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463704 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049908 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22126)))

(declare-fun lt!463707 () Unit!34354)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66155 (_ BitVec 32) (_ BitVec 32)) Unit!34354)

(assert (=> b!1049908 (= lt!463707 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049909 () Bool)

(assert (=> b!1049909 (= e!595725 e!595719)))

(declare-fun res!699024 () Bool)

(assert (=> b!1049909 (=> res!699024 e!595719)))

(assert (=> b!1049909 (= res!699024 (bvsle lt!463704 i!1381))))

(assert (= (and start!92354 res!699029) b!1049902))

(assert (= (and b!1049902 res!699033) b!1049906))

(assert (= (and b!1049906 res!699026) b!1049901))

(assert (= (and b!1049901 res!699028) b!1049899))

(assert (= (and b!1049899 res!699027) b!1049905))

(assert (= (and b!1049905 res!699034) b!1049903))

(assert (= (and b!1049903 res!699031) b!1049909))

(assert (= (and b!1049909 (not res!699024)) b!1049898))

(assert (= (and b!1049903 (not res!699030)) b!1049908))

(assert (= (and b!1049908 (not res!699035)) b!1049907))

(assert (= (and b!1049907 (not res!699032)) b!1049900))

(assert (= (and b!1049900 (not res!699025)) b!1049904))

(declare-fun m!970609 () Bool)

(assert (=> b!1049905 m!970609))

(declare-fun m!970611 () Bool)

(assert (=> start!92354 m!970611))

(declare-fun m!970613 () Bool)

(assert (=> b!1049908 m!970613))

(declare-fun m!970615 () Bool)

(assert (=> b!1049908 m!970615))

(declare-fun m!970617 () Bool)

(assert (=> b!1049908 m!970617))

(declare-fun m!970619 () Bool)

(assert (=> b!1049908 m!970619))

(declare-fun m!970621 () Bool)

(assert (=> b!1049900 m!970621))

(declare-fun m!970623 () Bool)

(assert (=> b!1049899 m!970623))

(declare-fun m!970625 () Bool)

(assert (=> b!1049899 m!970625))

(declare-fun m!970627 () Bool)

(assert (=> b!1049902 m!970627))

(declare-fun m!970629 () Bool)

(assert (=> b!1049907 m!970629))

(declare-fun m!970631 () Bool)

(assert (=> b!1049901 m!970631))

(assert (=> b!1049903 m!970625))

(declare-fun m!970633 () Bool)

(assert (=> b!1049903 m!970633))

(declare-fun m!970635 () Bool)

(assert (=> b!1049904 m!970635))

(declare-fun m!970637 () Bool)

(assert (=> b!1049898 m!970637))

(declare-fun m!970639 () Bool)

(assert (=> b!1049906 m!970639))

(check-sat (not b!1049900) (not b!1049904) (not b!1049908) (not b!1049902) (not start!92354) (not b!1049899) (not b!1049905) (not b!1049906) (not b!1049907) (not b!1049898))
