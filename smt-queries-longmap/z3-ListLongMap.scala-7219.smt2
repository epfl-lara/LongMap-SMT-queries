; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92378 () Bool)

(assert start!92378)

(declare-fun res!699445 () Bool)

(declare-fun e!596002 () Bool)

(assert (=> start!92378 (=> (not res!699445) (not e!596002))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66179 0))(
  ( (array!66180 (arr!31829 (Array (_ BitVec 32) (_ BitVec 64))) (size!32365 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66179)

(assert (=> start!92378 (= res!699445 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32365 a!3488)) (bvslt (size!32365 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92378 e!596002))

(assert (=> start!92378 true))

(declare-fun array_inv!24609 (array!66179) Bool)

(assert (=> start!92378 (array_inv!24609 a!3488)))

(declare-fun b!1050315 () Bool)

(declare-fun e!596005 () Bool)

(assert (=> b!1050315 (= e!596005 true)))

(assert (=> b!1050315 false))

(declare-datatypes ((Unit!34378 0))(
  ( (Unit!34379) )
))
(declare-fun lt!463887 () Unit!34378)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-datatypes ((List!22141 0))(
  ( (Nil!22138) (Cons!22137 (h!23346 (_ BitVec 64)) (t!31448 List!22141)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66179 (_ BitVec 64) (_ BitVec 32) List!22141) Unit!34378)

(assert (=> b!1050315 (= lt!463887 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22138))))

(declare-fun arrayContainsKey!0 (array!66179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050315 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463884 () (_ BitVec 32))

(declare-fun lt!463883 () Unit!34378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66179 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34378)

(assert (=> b!1050315 (= lt!463883 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463884 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66179 (_ BitVec 32) List!22141) Bool)

(assert (=> b!1050315 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22138)))

(declare-fun lt!463885 () Unit!34378)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66179 (_ BitVec 32) (_ BitVec 32)) Unit!34378)

(assert (=> b!1050315 (= lt!463885 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050316 () Bool)

(declare-fun e!596008 () Bool)

(assert (=> b!1050316 (= e!596002 e!596008)))

(declare-fun res!699449 () Bool)

(assert (=> b!1050316 (=> (not res!699449) (not e!596008))))

(declare-fun lt!463886 () array!66179)

(assert (=> b!1050316 (= res!699449 (arrayContainsKey!0 lt!463886 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050316 (= lt!463886 (array!66180 (store (arr!31829 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32365 a!3488)))))

(declare-fun b!1050317 () Bool)

(declare-fun e!596004 () Bool)

(assert (=> b!1050317 (= e!596008 e!596004)))

(declare-fun res!699444 () Bool)

(assert (=> b!1050317 (=> (not res!699444) (not e!596004))))

(assert (=> b!1050317 (= res!699444 (not (= lt!463884 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66179 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050317 (= lt!463884 (arrayScanForKey!0 lt!463886 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050318 () Bool)

(declare-fun res!699441 () Bool)

(assert (=> b!1050318 (=> (not res!699441) (not e!596002))))

(assert (=> b!1050318 (= res!699441 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22138))))

(declare-fun b!1050319 () Bool)

(assert (=> b!1050319 (= e!596004 (not e!596005))))

(declare-fun res!699447 () Bool)

(assert (=> b!1050319 (=> res!699447 e!596005)))

(assert (=> b!1050319 (= res!699447 (bvsle lt!463884 i!1381))))

(declare-fun e!596006 () Bool)

(assert (=> b!1050319 e!596006))

(declare-fun res!699448 () Bool)

(assert (=> b!1050319 (=> (not res!699448) (not e!596006))))

(assert (=> b!1050319 (= res!699448 (= (select (store (arr!31829 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463884) k0!2747))))

(declare-fun b!1050320 () Bool)

(declare-fun res!699443 () Bool)

(assert (=> b!1050320 (=> (not res!699443) (not e!596002))))

(assert (=> b!1050320 (= res!699443 (= (select (arr!31829 a!3488) i!1381) k0!2747))))

(declare-fun b!1050321 () Bool)

(declare-fun e!596003 () Bool)

(assert (=> b!1050321 (= e!596006 e!596003)))

(declare-fun res!699446 () Bool)

(assert (=> b!1050321 (=> res!699446 e!596003)))

(assert (=> b!1050321 (= res!699446 (bvsle lt!463884 i!1381))))

(declare-fun b!1050322 () Bool)

(declare-fun res!699442 () Bool)

(assert (=> b!1050322 (=> (not res!699442) (not e!596002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050322 (= res!699442 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050323 () Bool)

(assert (=> b!1050323 (= e!596003 (arrayContainsKey!0 a!3488 k0!2747 lt!463884))))

(assert (= (and start!92378 res!699445) b!1050318))

(assert (= (and b!1050318 res!699441) b!1050322))

(assert (= (and b!1050322 res!699442) b!1050320))

(assert (= (and b!1050320 res!699443) b!1050316))

(assert (= (and b!1050316 res!699449) b!1050317))

(assert (= (and b!1050317 res!699444) b!1050319))

(assert (= (and b!1050319 res!699448) b!1050321))

(assert (= (and b!1050321 (not res!699446)) b!1050323))

(assert (= (and b!1050319 (not res!699447)) b!1050315))

(declare-fun m!970989 () Bool)

(assert (=> b!1050317 m!970989))

(declare-fun m!970991 () Bool)

(assert (=> b!1050319 m!970991))

(declare-fun m!970993 () Bool)

(assert (=> b!1050319 m!970993))

(declare-fun m!970995 () Bool)

(assert (=> start!92378 m!970995))

(declare-fun m!970997 () Bool)

(assert (=> b!1050315 m!970997))

(declare-fun m!970999 () Bool)

(assert (=> b!1050315 m!970999))

(declare-fun m!971001 () Bool)

(assert (=> b!1050315 m!971001))

(declare-fun m!971003 () Bool)

(assert (=> b!1050315 m!971003))

(declare-fun m!971005 () Bool)

(assert (=> b!1050315 m!971005))

(declare-fun m!971007 () Bool)

(assert (=> b!1050316 m!971007))

(assert (=> b!1050316 m!970991))

(declare-fun m!971009 () Bool)

(assert (=> b!1050323 m!971009))

(declare-fun m!971011 () Bool)

(assert (=> b!1050318 m!971011))

(declare-fun m!971013 () Bool)

(assert (=> b!1050320 m!971013))

(declare-fun m!971015 () Bool)

(assert (=> b!1050322 m!971015))

(check-sat (not b!1050323) (not b!1050316) (not b!1050315) (not b!1050322) (not start!92378) (not b!1050318) (not b!1050317))
