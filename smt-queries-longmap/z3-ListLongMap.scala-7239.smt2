; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92494 () Bool)

(assert start!92494)

(declare-fun b!1051718 () Bool)

(declare-fun e!597056 () Bool)

(declare-fun e!597055 () Bool)

(assert (=> b!1051718 (= e!597056 e!597055)))

(declare-fun res!700937 () Bool)

(assert (=> b!1051718 (=> res!700937 e!597055)))

(declare-fun lt!464278 () (_ BitVec 32))

(declare-datatypes ((array!66236 0))(
  ( (array!66237 (arr!31857 (Array (_ BitVec 32) (_ BitVec 64))) (size!32395 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66236)

(declare-fun lt!464276 () (_ BitVec 32))

(assert (=> b!1051718 (= res!700937 (or (bvslt lt!464278 #b00000000000000000000000000000000) (bvsge lt!464276 (size!32395 a!3488)) (bvsge lt!464278 (size!32395 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051718 (arrayContainsKey!0 a!3488 k0!2747 lt!464276)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((Unit!34319 0))(
  ( (Unit!34320) )
))
(declare-fun lt!464273 () Unit!34319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66236 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34319)

(assert (=> b!1051718 (= lt!464273 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464276))))

(assert (=> b!1051718 (= lt!464276 (bvadd #b00000000000000000000000000000001 lt!464278))))

(declare-datatypes ((List!22228 0))(
  ( (Nil!22225) (Cons!22224 (h!23433 (_ BitVec 64)) (t!31526 List!22228)) )
))
(declare-fun arrayNoDuplicates!0 (array!66236 (_ BitVec 32) List!22228) Bool)

(assert (=> b!1051718 (arrayNoDuplicates!0 a!3488 lt!464278 Nil!22225)))

(declare-fun lt!464277 () Unit!34319)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66236 (_ BitVec 32) (_ BitVec 32)) Unit!34319)

(assert (=> b!1051718 (= lt!464277 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464278))))

(declare-fun b!1051719 () Bool)

(declare-fun e!597057 () Bool)

(declare-fun e!597059 () Bool)

(assert (=> b!1051719 (= e!597057 e!597059)))

(declare-fun res!700931 () Bool)

(assert (=> b!1051719 (=> (not res!700931) (not e!597059))))

(declare-fun lt!464274 () array!66236)

(assert (=> b!1051719 (= res!700931 (arrayContainsKey!0 lt!464274 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051719 (= lt!464274 (array!66237 (store (arr!31857 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32395 a!3488)))))

(declare-fun b!1051720 () Bool)

(assert (=> b!1051720 (= e!597055 true)))

(declare-fun lt!464275 () Bool)

(declare-fun contains!6115 (List!22228 (_ BitVec 64)) Bool)

(assert (=> b!1051720 (= lt!464275 (contains!6115 Nil!22225 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051721 () Bool)

(declare-fun res!700932 () Bool)

(assert (=> b!1051721 (=> res!700932 e!597055)))

(declare-fun noDuplicate!1540 (List!22228) Bool)

(assert (=> b!1051721 (= res!700932 (not (noDuplicate!1540 Nil!22225)))))

(declare-fun b!1051722 () Bool)

(declare-fun res!700936 () Bool)

(assert (=> b!1051722 (=> res!700936 e!597055)))

(assert (=> b!1051722 (= res!700936 (contains!6115 Nil!22225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!597054 () Bool)

(declare-fun b!1051723 () Bool)

(assert (=> b!1051723 (= e!597054 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051724 () Bool)

(declare-fun e!597058 () Bool)

(assert (=> b!1051724 (= e!597058 e!597054)))

(declare-fun res!700938 () Bool)

(assert (=> b!1051724 (=> res!700938 e!597054)))

(assert (=> b!1051724 (= res!700938 (or (bvsgt lt!464278 i!1381) (bvsle i!1381 lt!464278)))))

(declare-fun res!700930 () Bool)

(assert (=> start!92494 (=> (not res!700930) (not e!597057))))

(assert (=> start!92494 (= res!700930 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32395 a!3488)) (bvslt (size!32395 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92494 e!597057))

(assert (=> start!92494 true))

(declare-fun array_inv!24640 (array!66236) Bool)

(assert (=> start!92494 (array_inv!24640 a!3488)))

(declare-fun b!1051725 () Bool)

(declare-fun res!700935 () Bool)

(assert (=> b!1051725 (=> (not res!700935) (not e!597057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051725 (= res!700935 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051726 () Bool)

(declare-fun e!597060 () Bool)

(assert (=> b!1051726 (= e!597059 e!597060)))

(declare-fun res!700928 () Bool)

(assert (=> b!1051726 (=> (not res!700928) (not e!597060))))

(assert (=> b!1051726 (= res!700928 (not (= lt!464278 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66236 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051726 (= lt!464278 (arrayScanForKey!0 lt!464274 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051727 () Bool)

(declare-fun res!700933 () Bool)

(assert (=> b!1051727 (=> (not res!700933) (not e!597057))))

(assert (=> b!1051727 (= res!700933 (= (select (arr!31857 a!3488) i!1381) k0!2747))))

(declare-fun b!1051728 () Bool)

(assert (=> b!1051728 (= e!597060 (not e!597056))))

(declare-fun res!700929 () Bool)

(assert (=> b!1051728 (=> res!700929 e!597056)))

(assert (=> b!1051728 (= res!700929 (or (bvsgt lt!464278 i!1381) (bvsle i!1381 lt!464278)))))

(assert (=> b!1051728 e!597058))

(declare-fun res!700939 () Bool)

(assert (=> b!1051728 (=> (not res!700939) (not e!597058))))

(assert (=> b!1051728 (= res!700939 (= (select (store (arr!31857 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464278) k0!2747))))

(declare-fun b!1051729 () Bool)

(declare-fun res!700934 () Bool)

(assert (=> b!1051729 (=> (not res!700934) (not e!597057))))

(assert (=> b!1051729 (= res!700934 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22225))))

(assert (= (and start!92494 res!700930) b!1051729))

(assert (= (and b!1051729 res!700934) b!1051725))

(assert (= (and b!1051725 res!700935) b!1051727))

(assert (= (and b!1051727 res!700933) b!1051719))

(assert (= (and b!1051719 res!700931) b!1051726))

(assert (= (and b!1051726 res!700928) b!1051728))

(assert (= (and b!1051728 res!700939) b!1051724))

(assert (= (and b!1051724 (not res!700938)) b!1051723))

(assert (= (and b!1051728 (not res!700929)) b!1051718))

(assert (= (and b!1051718 (not res!700937)) b!1051721))

(assert (= (and b!1051721 (not res!700932)) b!1051722))

(assert (= (and b!1051722 (not res!700936)) b!1051720))

(declare-fun m!971695 () Bool)

(assert (=> start!92494 m!971695))

(declare-fun m!971697 () Bool)

(assert (=> b!1051722 m!971697))

(declare-fun m!971699 () Bool)

(assert (=> b!1051718 m!971699))

(declare-fun m!971701 () Bool)

(assert (=> b!1051718 m!971701))

(declare-fun m!971703 () Bool)

(assert (=> b!1051718 m!971703))

(declare-fun m!971705 () Bool)

(assert (=> b!1051718 m!971705))

(declare-fun m!971707 () Bool)

(assert (=> b!1051729 m!971707))

(declare-fun m!971709 () Bool)

(assert (=> b!1051727 m!971709))

(declare-fun m!971711 () Bool)

(assert (=> b!1051725 m!971711))

(declare-fun m!971713 () Bool)

(assert (=> b!1051723 m!971713))

(declare-fun m!971715 () Bool)

(assert (=> b!1051719 m!971715))

(declare-fun m!971717 () Bool)

(assert (=> b!1051719 m!971717))

(declare-fun m!971719 () Bool)

(assert (=> b!1051720 m!971719))

(assert (=> b!1051728 m!971717))

(declare-fun m!971721 () Bool)

(assert (=> b!1051728 m!971721))

(declare-fun m!971723 () Bool)

(assert (=> b!1051726 m!971723))

(declare-fun m!971725 () Bool)

(assert (=> b!1051721 m!971725))

(check-sat (not b!1051722) (not b!1051725) (not b!1051720) (not b!1051721) (not start!92494) (not b!1051726) (not b!1051723) (not b!1051718) (not b!1051719) (not b!1051729))
(check-sat)
