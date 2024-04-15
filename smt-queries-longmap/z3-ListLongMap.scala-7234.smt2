; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92464 () Bool)

(assert start!92464)

(declare-fun b!1051226 () Bool)

(declare-fun res!700437 () Bool)

(declare-fun e!596714 () Bool)

(assert (=> b!1051226 (=> (not res!700437) (not e!596714))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051226 (= res!700437 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051227 () Bool)

(declare-datatypes ((array!66206 0))(
  ( (array!66207 (arr!31842 (Array (_ BitVec 32) (_ BitVec 64))) (size!32380 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66206)

(declare-fun e!596710 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051227 (= e!596710 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1051228 () Bool)

(declare-fun e!596713 () Bool)

(assert (=> b!1051228 (= e!596713 true)))

(declare-fun lt!464053 () (_ BitVec 32))

(declare-datatypes ((List!22213 0))(
  ( (Nil!22210) (Cons!22209 (h!23418 (_ BitVec 64)) (t!31511 List!22213)) )
))
(declare-fun arrayNoDuplicates!0 (array!66206 (_ BitVec 32) List!22213) Bool)

(assert (=> b!1051228 (arrayNoDuplicates!0 a!3488 lt!464053 Nil!22210)))

(declare-datatypes ((Unit!34289 0))(
  ( (Unit!34290) )
))
(declare-fun lt!464051 () Unit!34289)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66206 (_ BitVec 32) (_ BitVec 32)) Unit!34289)

(assert (=> b!1051228 (= lt!464051 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464053))))

(declare-fun b!1051229 () Bool)

(declare-fun res!700442 () Bool)

(assert (=> b!1051229 (=> (not res!700442) (not e!596714))))

(assert (=> b!1051229 (= res!700442 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22210))))

(declare-fun b!1051230 () Bool)

(declare-fun e!596709 () Bool)

(assert (=> b!1051230 (= e!596714 e!596709)))

(declare-fun res!700436 () Bool)

(assert (=> b!1051230 (=> (not res!700436) (not e!596709))))

(declare-fun lt!464052 () array!66206)

(assert (=> b!1051230 (= res!700436 (arrayContainsKey!0 lt!464052 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051230 (= lt!464052 (array!66207 (store (arr!31842 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32380 a!3488)))))

(declare-fun b!1051231 () Bool)

(declare-fun res!700441 () Bool)

(assert (=> b!1051231 (=> (not res!700441) (not e!596714))))

(assert (=> b!1051231 (= res!700441 (= (select (arr!31842 a!3488) i!1381) k0!2747))))

(declare-fun b!1051232 () Bool)

(declare-fun e!596715 () Bool)

(assert (=> b!1051232 (= e!596709 e!596715)))

(declare-fun res!700439 () Bool)

(assert (=> b!1051232 (=> (not res!700439) (not e!596715))))

(assert (=> b!1051232 (= res!700439 (not (= lt!464053 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66206 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051232 (= lt!464053 (arrayScanForKey!0 lt!464052 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!700443 () Bool)

(assert (=> start!92464 (=> (not res!700443) (not e!596714))))

(assert (=> start!92464 (= res!700443 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32380 a!3488)) (bvslt (size!32380 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92464 e!596714))

(assert (=> start!92464 true))

(declare-fun array_inv!24625 (array!66206) Bool)

(assert (=> start!92464 (array_inv!24625 a!3488)))

(declare-fun b!1051233 () Bool)

(declare-fun e!596712 () Bool)

(assert (=> b!1051233 (= e!596712 e!596710)))

(declare-fun res!700438 () Bool)

(assert (=> b!1051233 (=> res!700438 e!596710)))

(assert (=> b!1051233 (= res!700438 (or (bvsgt lt!464053 i!1381) (bvsle i!1381 lt!464053)))))

(declare-fun b!1051234 () Bool)

(assert (=> b!1051234 (= e!596715 (not e!596713))))

(declare-fun res!700440 () Bool)

(assert (=> b!1051234 (=> res!700440 e!596713)))

(assert (=> b!1051234 (= res!700440 (or (bvsgt lt!464053 i!1381) (bvsle i!1381 lt!464053)))))

(assert (=> b!1051234 e!596712))

(declare-fun res!700444 () Bool)

(assert (=> b!1051234 (=> (not res!700444) (not e!596712))))

(assert (=> b!1051234 (= res!700444 (= (select (store (arr!31842 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464053) k0!2747))))

(assert (= (and start!92464 res!700443) b!1051229))

(assert (= (and b!1051229 res!700442) b!1051226))

(assert (= (and b!1051226 res!700437) b!1051231))

(assert (= (and b!1051231 res!700441) b!1051230))

(assert (= (and b!1051230 res!700436) b!1051232))

(assert (= (and b!1051232 res!700439) b!1051234))

(assert (= (and b!1051234 res!700444) b!1051233))

(assert (= (and b!1051233 (not res!700438)) b!1051227))

(assert (= (and b!1051234 (not res!700440)) b!1051228))

(declare-fun m!971275 () Bool)

(assert (=> b!1051232 m!971275))

(declare-fun m!971277 () Bool)

(assert (=> b!1051234 m!971277))

(declare-fun m!971279 () Bool)

(assert (=> b!1051234 m!971279))

(declare-fun m!971281 () Bool)

(assert (=> b!1051226 m!971281))

(declare-fun m!971283 () Bool)

(assert (=> b!1051229 m!971283))

(declare-fun m!971285 () Bool)

(assert (=> b!1051231 m!971285))

(declare-fun m!971287 () Bool)

(assert (=> b!1051227 m!971287))

(declare-fun m!971289 () Bool)

(assert (=> b!1051230 m!971289))

(assert (=> b!1051230 m!971277))

(declare-fun m!971291 () Bool)

(assert (=> b!1051228 m!971291))

(declare-fun m!971293 () Bool)

(assert (=> b!1051228 m!971293))

(declare-fun m!971295 () Bool)

(assert (=> start!92464 m!971295))

(check-sat (not b!1051226) (not start!92464) (not b!1051227) (not b!1051228) (not b!1051230) (not b!1051229) (not b!1051232))
(check-sat)
