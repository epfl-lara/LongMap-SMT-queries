; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92488 () Bool)

(assert start!92488)

(declare-fun b!1051610 () Bool)

(declare-fun e!596983 () Bool)

(declare-fun e!596987 () Bool)

(assert (=> b!1051610 (= e!596983 (not e!596987))))

(declare-fun res!700830 () Bool)

(assert (=> b!1051610 (=> res!700830 e!596987)))

(declare-fun lt!464221 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051610 (= res!700830 (or (bvsgt lt!464221 i!1381) (bvsle i!1381 lt!464221)))))

(declare-fun e!596982 () Bool)

(assert (=> b!1051610 e!596982))

(declare-fun res!700820 () Bool)

(assert (=> b!1051610 (=> (not res!700820) (not e!596982))))

(declare-datatypes ((array!66230 0))(
  ( (array!66231 (arr!31854 (Array (_ BitVec 32) (_ BitVec 64))) (size!32392 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66230)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1051610 (= res!700820 (= (select (store (arr!31854 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464221) k0!2747))))

(declare-fun b!1051611 () Bool)

(declare-fun e!596986 () Bool)

(assert (=> b!1051611 (= e!596986 true)))

(declare-fun lt!464223 () Bool)

(declare-datatypes ((List!22225 0))(
  ( (Nil!22222) (Cons!22221 (h!23430 (_ BitVec 64)) (t!31523 List!22225)) )
))
(declare-fun contains!6112 (List!22225 (_ BitVec 64)) Bool)

(assert (=> b!1051611 (= lt!464223 (contains!6112 Nil!22222 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051612 () Bool)

(declare-fun res!700831 () Bool)

(declare-fun e!596985 () Bool)

(assert (=> b!1051612 (=> (not res!700831) (not e!596985))))

(declare-fun arrayNoDuplicates!0 (array!66230 (_ BitVec 32) List!22225) Bool)

(assert (=> b!1051612 (= res!700831 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22222))))

(declare-fun b!1051613 () Bool)

(declare-fun res!700823 () Bool)

(assert (=> b!1051613 (=> (not res!700823) (not e!596985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051613 (= res!700823 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051614 () Bool)

(declare-fun res!700829 () Bool)

(assert (=> b!1051614 (=> res!700829 e!596986)))

(assert (=> b!1051614 (= res!700829 (contains!6112 Nil!22222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051615 () Bool)

(assert (=> b!1051615 (= e!596987 e!596986)))

(declare-fun res!700826 () Bool)

(assert (=> b!1051615 (=> res!700826 e!596986)))

(declare-fun lt!464220 () (_ BitVec 32))

(assert (=> b!1051615 (= res!700826 (or (bvslt lt!464221 #b00000000000000000000000000000000) (bvsge lt!464220 (size!32392 a!3488)) (bvsge lt!464221 (size!32392 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051615 (arrayContainsKey!0 a!3488 k0!2747 lt!464220)))

(declare-datatypes ((Unit!34313 0))(
  ( (Unit!34314) )
))
(declare-fun lt!464222 () Unit!34313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66230 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34313)

(assert (=> b!1051615 (= lt!464222 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464220))))

(assert (=> b!1051615 (= lt!464220 (bvadd #b00000000000000000000000000000001 lt!464221))))

(assert (=> b!1051615 (arrayNoDuplicates!0 a!3488 lt!464221 Nil!22222)))

(declare-fun lt!464219 () Unit!34313)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66230 (_ BitVec 32) (_ BitVec 32)) Unit!34313)

(assert (=> b!1051615 (= lt!464219 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464221))))

(declare-fun e!596984 () Bool)

(declare-fun b!1051616 () Bool)

(assert (=> b!1051616 (= e!596984 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051617 () Bool)

(declare-fun e!596988 () Bool)

(assert (=> b!1051617 (= e!596985 e!596988)))

(declare-fun res!700825 () Bool)

(assert (=> b!1051617 (=> (not res!700825) (not e!596988))))

(declare-fun lt!464224 () array!66230)

(assert (=> b!1051617 (= res!700825 (arrayContainsKey!0 lt!464224 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051617 (= lt!464224 (array!66231 (store (arr!31854 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32392 a!3488)))))

(declare-fun b!1051618 () Bool)

(declare-fun res!700822 () Bool)

(assert (=> b!1051618 (=> res!700822 e!596986)))

(declare-fun noDuplicate!1537 (List!22225) Bool)

(assert (=> b!1051618 (= res!700822 (not (noDuplicate!1537 Nil!22222)))))

(declare-fun b!1051619 () Bool)

(assert (=> b!1051619 (= e!596982 e!596984)))

(declare-fun res!700828 () Bool)

(assert (=> b!1051619 (=> res!700828 e!596984)))

(assert (=> b!1051619 (= res!700828 (or (bvsgt lt!464221 i!1381) (bvsle i!1381 lt!464221)))))

(declare-fun b!1051621 () Bool)

(assert (=> b!1051621 (= e!596988 e!596983)))

(declare-fun res!700827 () Bool)

(assert (=> b!1051621 (=> (not res!700827) (not e!596983))))

(assert (=> b!1051621 (= res!700827 (not (= lt!464221 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66230 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051621 (= lt!464221 (arrayScanForKey!0 lt!464224 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700821 () Bool)

(assert (=> start!92488 (=> (not res!700821) (not e!596985))))

(assert (=> start!92488 (= res!700821 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32392 a!3488)) (bvslt (size!32392 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92488 e!596985))

(assert (=> start!92488 true))

(declare-fun array_inv!24637 (array!66230) Bool)

(assert (=> start!92488 (array_inv!24637 a!3488)))

(declare-fun b!1051620 () Bool)

(declare-fun res!700824 () Bool)

(assert (=> b!1051620 (=> (not res!700824) (not e!596985))))

(assert (=> b!1051620 (= res!700824 (= (select (arr!31854 a!3488) i!1381) k0!2747))))

(assert (= (and start!92488 res!700821) b!1051612))

(assert (= (and b!1051612 res!700831) b!1051613))

(assert (= (and b!1051613 res!700823) b!1051620))

(assert (= (and b!1051620 res!700824) b!1051617))

(assert (= (and b!1051617 res!700825) b!1051621))

(assert (= (and b!1051621 res!700827) b!1051610))

(assert (= (and b!1051610 res!700820) b!1051619))

(assert (= (and b!1051619 (not res!700828)) b!1051616))

(assert (= (and b!1051610 (not res!700830)) b!1051615))

(assert (= (and b!1051615 (not res!700826)) b!1051618))

(assert (= (and b!1051618 (not res!700822)) b!1051614))

(assert (= (and b!1051614 (not res!700829)) b!1051611))

(declare-fun m!971599 () Bool)

(assert (=> b!1051613 m!971599))

(declare-fun m!971601 () Bool)

(assert (=> b!1051618 m!971601))

(declare-fun m!971603 () Bool)

(assert (=> start!92488 m!971603))

(declare-fun m!971605 () Bool)

(assert (=> b!1051617 m!971605))

(declare-fun m!971607 () Bool)

(assert (=> b!1051617 m!971607))

(declare-fun m!971609 () Bool)

(assert (=> b!1051614 m!971609))

(declare-fun m!971611 () Bool)

(assert (=> b!1051612 m!971611))

(declare-fun m!971613 () Bool)

(assert (=> b!1051611 m!971613))

(assert (=> b!1051610 m!971607))

(declare-fun m!971615 () Bool)

(assert (=> b!1051610 m!971615))

(declare-fun m!971617 () Bool)

(assert (=> b!1051615 m!971617))

(declare-fun m!971619 () Bool)

(assert (=> b!1051615 m!971619))

(declare-fun m!971621 () Bool)

(assert (=> b!1051615 m!971621))

(declare-fun m!971623 () Bool)

(assert (=> b!1051615 m!971623))

(declare-fun m!971625 () Bool)

(assert (=> b!1051616 m!971625))

(declare-fun m!971627 () Bool)

(assert (=> b!1051621 m!971627))

(declare-fun m!971629 () Bool)

(assert (=> b!1051620 m!971629))

(check-sat (not b!1051616) (not b!1051618) (not b!1051621) (not b!1051613) (not start!92488) (not b!1051617) (not b!1051615) (not b!1051611) (not b!1051612) (not b!1051614))
(check-sat)
