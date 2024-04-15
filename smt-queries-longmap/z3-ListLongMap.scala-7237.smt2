; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92482 () Bool)

(assert start!92482)

(declare-fun b!1051502 () Bool)

(declare-fun e!596912 () Bool)

(declare-fun e!596914 () Bool)

(assert (=> b!1051502 (= e!596912 e!596914)))

(declare-fun res!700712 () Bool)

(assert (=> b!1051502 (=> res!700712 e!596914)))

(declare-fun lt!464170 () (_ BitVec 32))

(declare-fun lt!464168 () (_ BitVec 32))

(declare-datatypes ((array!66224 0))(
  ( (array!66225 (arr!31851 (Array (_ BitVec 32) (_ BitVec 64))) (size!32389 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66224)

(assert (=> b!1051502 (= res!700712 (or (bvslt lt!464170 #b00000000000000000000000000000000) (bvsge lt!464168 (size!32389 a!3488)) (bvsge lt!464170 (size!32389 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051502 (arrayContainsKey!0 a!3488 k0!2747 lt!464168)))

(declare-datatypes ((Unit!34307 0))(
  ( (Unit!34308) )
))
(declare-fun lt!464165 () Unit!34307)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66224 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34307)

(assert (=> b!1051502 (= lt!464165 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464168))))

(assert (=> b!1051502 (= lt!464168 (bvadd #b00000000000000000000000000000001 lt!464170))))

(declare-datatypes ((List!22222 0))(
  ( (Nil!22219) (Cons!22218 (h!23427 (_ BitVec 64)) (t!31520 List!22222)) )
))
(declare-fun arrayNoDuplicates!0 (array!66224 (_ BitVec 32) List!22222) Bool)

(assert (=> b!1051502 (arrayNoDuplicates!0 a!3488 lt!464170 Nil!22219)))

(declare-fun lt!464167 () Unit!34307)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66224 (_ BitVec 32) (_ BitVec 32)) Unit!34307)

(assert (=> b!1051502 (= lt!464167 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464170))))

(declare-fun b!1051503 () Bool)

(declare-fun e!596911 () Bool)

(declare-fun e!596916 () Bool)

(assert (=> b!1051503 (= e!596911 e!596916)))

(declare-fun res!700716 () Bool)

(assert (=> b!1051503 (=> res!700716 e!596916)))

(assert (=> b!1051503 (= res!700716 (or (bvsgt lt!464170 i!1381) (bvsle i!1381 lt!464170)))))

(declare-fun res!700723 () Bool)

(declare-fun e!596915 () Bool)

(assert (=> start!92482 (=> (not res!700723) (not e!596915))))

(assert (=> start!92482 (= res!700723 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32389 a!3488)) (bvslt (size!32389 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92482 e!596915))

(assert (=> start!92482 true))

(declare-fun array_inv!24634 (array!66224) Bool)

(assert (=> start!92482 (array_inv!24634 a!3488)))

(declare-fun b!1051504 () Bool)

(declare-fun res!700717 () Bool)

(assert (=> b!1051504 (=> res!700717 e!596914)))

(declare-fun noDuplicate!1534 (List!22222) Bool)

(assert (=> b!1051504 (= res!700717 (not (noDuplicate!1534 Nil!22219)))))

(declare-fun b!1051505 () Bool)

(declare-fun e!596909 () Bool)

(assert (=> b!1051505 (= e!596909 (not e!596912))))

(declare-fun res!700714 () Bool)

(assert (=> b!1051505 (=> res!700714 e!596912)))

(assert (=> b!1051505 (= res!700714 (or (bvsgt lt!464170 i!1381) (bvsle i!1381 lt!464170)))))

(assert (=> b!1051505 e!596911))

(declare-fun res!700718 () Bool)

(assert (=> b!1051505 (=> (not res!700718) (not e!596911))))

(assert (=> b!1051505 (= res!700718 (= (select (store (arr!31851 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464170) k0!2747))))

(declare-fun b!1051506 () Bool)

(assert (=> b!1051506 (= e!596914 true)))

(declare-fun lt!464169 () Bool)

(declare-fun contains!6109 (List!22222 (_ BitVec 64)) Bool)

(assert (=> b!1051506 (= lt!464169 (contains!6109 Nil!22219 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051507 () Bool)

(declare-fun res!700720 () Bool)

(assert (=> b!1051507 (=> (not res!700720) (not e!596915))))

(assert (=> b!1051507 (= res!700720 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22219))))

(declare-fun b!1051508 () Bool)

(declare-fun e!596910 () Bool)

(assert (=> b!1051508 (= e!596910 e!596909)))

(declare-fun res!700721 () Bool)

(assert (=> b!1051508 (=> (not res!700721) (not e!596909))))

(assert (=> b!1051508 (= res!700721 (not (= lt!464170 i!1381)))))

(declare-fun lt!464166 () array!66224)

(declare-fun arrayScanForKey!0 (array!66224 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051508 (= lt!464170 (arrayScanForKey!0 lt!464166 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051509 () Bool)

(declare-fun res!700719 () Bool)

(assert (=> b!1051509 (=> res!700719 e!596914)))

(assert (=> b!1051509 (= res!700719 (contains!6109 Nil!22219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051510 () Bool)

(declare-fun res!700713 () Bool)

(assert (=> b!1051510 (=> (not res!700713) (not e!596915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051510 (= res!700713 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051511 () Bool)

(declare-fun res!700715 () Bool)

(assert (=> b!1051511 (=> (not res!700715) (not e!596915))))

(assert (=> b!1051511 (= res!700715 (= (select (arr!31851 a!3488) i!1381) k0!2747))))

(declare-fun b!1051512 () Bool)

(assert (=> b!1051512 (= e!596915 e!596910)))

(declare-fun res!700722 () Bool)

(assert (=> b!1051512 (=> (not res!700722) (not e!596910))))

(assert (=> b!1051512 (= res!700722 (arrayContainsKey!0 lt!464166 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051512 (= lt!464166 (array!66225 (store (arr!31851 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32389 a!3488)))))

(declare-fun b!1051513 () Bool)

(assert (=> b!1051513 (= e!596916 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!92482 res!700723) b!1051507))

(assert (= (and b!1051507 res!700720) b!1051510))

(assert (= (and b!1051510 res!700713) b!1051511))

(assert (= (and b!1051511 res!700715) b!1051512))

(assert (= (and b!1051512 res!700722) b!1051508))

(assert (= (and b!1051508 res!700721) b!1051505))

(assert (= (and b!1051505 res!700718) b!1051503))

(assert (= (and b!1051503 (not res!700716)) b!1051513))

(assert (= (and b!1051505 (not res!700714)) b!1051502))

(assert (= (and b!1051502 (not res!700712)) b!1051504))

(assert (= (and b!1051504 (not res!700717)) b!1051509))

(assert (= (and b!1051509 (not res!700719)) b!1051506))

(declare-fun m!971503 () Bool)

(assert (=> b!1051509 m!971503))

(declare-fun m!971505 () Bool)

(assert (=> b!1051512 m!971505))

(declare-fun m!971507 () Bool)

(assert (=> b!1051512 m!971507))

(declare-fun m!971509 () Bool)

(assert (=> b!1051511 m!971509))

(declare-fun m!971511 () Bool)

(assert (=> b!1051508 m!971511))

(declare-fun m!971513 () Bool)

(assert (=> b!1051510 m!971513))

(assert (=> b!1051505 m!971507))

(declare-fun m!971515 () Bool)

(assert (=> b!1051505 m!971515))

(declare-fun m!971517 () Bool)

(assert (=> start!92482 m!971517))

(declare-fun m!971519 () Bool)

(assert (=> b!1051504 m!971519))

(declare-fun m!971521 () Bool)

(assert (=> b!1051513 m!971521))

(declare-fun m!971523 () Bool)

(assert (=> b!1051507 m!971523))

(declare-fun m!971525 () Bool)

(assert (=> b!1051506 m!971525))

(declare-fun m!971527 () Bool)

(assert (=> b!1051502 m!971527))

(declare-fun m!971529 () Bool)

(assert (=> b!1051502 m!971529))

(declare-fun m!971531 () Bool)

(assert (=> b!1051502 m!971531))

(declare-fun m!971533 () Bool)

(assert (=> b!1051502 m!971533))

(check-sat (not start!92482) (not b!1051508) (not b!1051502) (not b!1051512) (not b!1051507) (not b!1051513) (not b!1051504) (not b!1051510) (not b!1051506) (not b!1051509))
(check-sat)
