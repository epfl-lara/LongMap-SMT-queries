; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93018 () Bool)

(assert start!93018)

(declare-fun b!1055254 () Bool)

(declare-fun e!599506 () Bool)

(declare-fun e!599505 () Bool)

(assert (=> b!1055254 (= e!599506 e!599505)))

(declare-fun res!703436 () Bool)

(assert (=> b!1055254 (=> (not res!703436) (not e!599505))))

(declare-fun lt!465774 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055254 (= res!703436 (not (= lt!465774 i!1381)))))

(declare-datatypes ((array!66526 0))(
  ( (array!66527 (arr!31990 (Array (_ BitVec 32) (_ BitVec 64))) (size!32527 (_ BitVec 32))) )
))
(declare-fun lt!465775 () array!66526)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66526 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055254 (= lt!465774 (arrayScanForKey!0 lt!465775 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055255 () Bool)

(declare-fun e!599504 () Bool)

(assert (=> b!1055255 (= e!599504 (bvsge lt!465774 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66526)

(declare-datatypes ((List!22272 0))(
  ( (Nil!22269) (Cons!22268 (h!23486 (_ BitVec 64)) (t!31571 List!22272)) )
))
(declare-fun arrayNoDuplicates!0 (array!66526 (_ BitVec 32) List!22272) Bool)

(assert (=> b!1055255 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22269)))

(declare-datatypes ((Unit!34507 0))(
  ( (Unit!34508) )
))
(declare-fun lt!465776 () Unit!34507)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66526 (_ BitVec 32) (_ BitVec 32)) Unit!34507)

(assert (=> b!1055255 (= lt!465776 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055256 () Bool)

(declare-fun res!703437 () Bool)

(declare-fun e!599509 () Bool)

(assert (=> b!1055256 (=> (not res!703437) (not e!599509))))

(assert (=> b!1055256 (= res!703437 (= (select (arr!31990 a!3488) i!1381) k0!2747))))

(declare-fun e!599508 () Bool)

(declare-fun b!1055257 () Bool)

(declare-fun arrayContainsKey!0 (array!66526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055257 (= e!599508 (arrayContainsKey!0 a!3488 k0!2747 lt!465774))))

(declare-fun res!703439 () Bool)

(assert (=> start!93018 (=> (not res!703439) (not e!599509))))

(assert (=> start!93018 (= res!703439 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32527 a!3488)) (bvslt (size!32527 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93018 e!599509))

(assert (=> start!93018 true))

(declare-fun array_inv!24772 (array!66526) Bool)

(assert (=> start!93018 (array_inv!24772 a!3488)))

(declare-fun b!1055258 () Bool)

(assert (=> b!1055258 (= e!599509 e!599506)))

(declare-fun res!703435 () Bool)

(assert (=> b!1055258 (=> (not res!703435) (not e!599506))))

(assert (=> b!1055258 (= res!703435 (arrayContainsKey!0 lt!465775 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055258 (= lt!465775 (array!66527 (store (arr!31990 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32527 a!3488)))))

(declare-fun b!1055259 () Bool)

(declare-fun e!599503 () Bool)

(assert (=> b!1055259 (= e!599503 e!599508)))

(declare-fun res!703433 () Bool)

(assert (=> b!1055259 (=> res!703433 e!599508)))

(assert (=> b!1055259 (= res!703433 (bvsle lt!465774 i!1381))))

(declare-fun b!1055260 () Bool)

(declare-fun res!703434 () Bool)

(assert (=> b!1055260 (=> (not res!703434) (not e!599509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055260 (= res!703434 (validKeyInArray!0 k0!2747))))

(declare-fun b!1055261 () Bool)

(declare-fun res!703432 () Bool)

(assert (=> b!1055261 (=> (not res!703432) (not e!599509))))

(assert (=> b!1055261 (= res!703432 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22269))))

(declare-fun b!1055262 () Bool)

(assert (=> b!1055262 (= e!599505 (not e!599504))))

(declare-fun res!703431 () Bool)

(assert (=> b!1055262 (=> res!703431 e!599504)))

(assert (=> b!1055262 (= res!703431 (bvsle lt!465774 i!1381))))

(assert (=> b!1055262 e!599503))

(declare-fun res!703438 () Bool)

(assert (=> b!1055262 (=> (not res!703438) (not e!599503))))

(assert (=> b!1055262 (= res!703438 (= (select (store (arr!31990 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465774) k0!2747))))

(assert (= (and start!93018 res!703439) b!1055261))

(assert (= (and b!1055261 res!703432) b!1055260))

(assert (= (and b!1055260 res!703434) b!1055256))

(assert (= (and b!1055256 res!703437) b!1055258))

(assert (= (and b!1055258 res!703435) b!1055254))

(assert (= (and b!1055254 res!703436) b!1055262))

(assert (= (and b!1055262 res!703438) b!1055259))

(assert (= (and b!1055259 (not res!703433)) b!1055257))

(assert (= (and b!1055262 (not res!703431)) b!1055255))

(declare-fun m!975767 () Bool)

(assert (=> b!1055255 m!975767))

(declare-fun m!975769 () Bool)

(assert (=> b!1055255 m!975769))

(declare-fun m!975771 () Bool)

(assert (=> b!1055260 m!975771))

(declare-fun m!975773 () Bool)

(assert (=> b!1055258 m!975773))

(declare-fun m!975775 () Bool)

(assert (=> b!1055258 m!975775))

(declare-fun m!975777 () Bool)

(assert (=> start!93018 m!975777))

(declare-fun m!975779 () Bool)

(assert (=> b!1055261 m!975779))

(assert (=> b!1055262 m!975775))

(declare-fun m!975781 () Bool)

(assert (=> b!1055262 m!975781))

(declare-fun m!975783 () Bool)

(assert (=> b!1055254 m!975783))

(declare-fun m!975785 () Bool)

(assert (=> b!1055257 m!975785))

(declare-fun m!975787 () Bool)

(assert (=> b!1055256 m!975787))

(check-sat (not b!1055257) (not start!93018) (not b!1055260) (not b!1055261) (not b!1055254) (not b!1055258) (not b!1055255))
(check-sat)
