; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92470 () Bool)

(assert start!92470)

(declare-fun b!1051307 () Bool)

(declare-fun e!596774 () Bool)

(declare-fun e!596778 () Bool)

(assert (=> b!1051307 (= e!596774 e!596778)))

(declare-fun res!700522 () Bool)

(assert (=> b!1051307 (=> (not res!700522) (not e!596778))))

(declare-fun lt!464078 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051307 (= res!700522 (not (= lt!464078 i!1381)))))

(declare-datatypes ((array!66212 0))(
  ( (array!66213 (arr!31845 (Array (_ BitVec 32) (_ BitVec 64))) (size!32383 (_ BitVec 32))) )
))
(declare-fun lt!464080 () array!66212)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66212 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051307 (= lt!464078 (arrayScanForKey!0 lt!464080 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051308 () Bool)

(declare-fun e!596773 () Bool)

(assert (=> b!1051308 (= e!596773 e!596774)))

(declare-fun res!700517 () Bool)

(assert (=> b!1051308 (=> (not res!700517) (not e!596774))))

(declare-fun arrayContainsKey!0 (array!66212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051308 (= res!700517 (arrayContainsKey!0 lt!464080 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66212)

(assert (=> b!1051308 (= lt!464080 (array!66213 (store (arr!31845 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32383 a!3488)))))

(declare-fun b!1051309 () Bool)

(declare-fun res!700525 () Bool)

(assert (=> b!1051309 (=> (not res!700525) (not e!596773))))

(assert (=> b!1051309 (= res!700525 (= (select (arr!31845 a!3488) i!1381) k0!2747))))

(declare-fun b!1051311 () Bool)

(declare-fun e!596776 () Bool)

(assert (=> b!1051311 (= e!596776 true)))

(declare-datatypes ((List!22216 0))(
  ( (Nil!22213) (Cons!22212 (h!23421 (_ BitVec 64)) (t!31514 List!22216)) )
))
(declare-fun arrayNoDuplicates!0 (array!66212 (_ BitVec 32) List!22216) Bool)

(assert (=> b!1051311 (arrayNoDuplicates!0 a!3488 lt!464078 Nil!22213)))

(declare-datatypes ((Unit!34295 0))(
  ( (Unit!34296) )
))
(declare-fun lt!464079 () Unit!34295)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66212 (_ BitVec 32) (_ BitVec 32)) Unit!34295)

(assert (=> b!1051311 (= lt!464079 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464078))))

(declare-fun res!700523 () Bool)

(assert (=> start!92470 (=> (not res!700523) (not e!596773))))

(assert (=> start!92470 (= res!700523 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32383 a!3488)) (bvslt (size!32383 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92470 e!596773))

(assert (=> start!92470 true))

(declare-fun array_inv!24628 (array!66212) Bool)

(assert (=> start!92470 (array_inv!24628 a!3488)))

(declare-fun b!1051310 () Bool)

(declare-fun res!700524 () Bool)

(assert (=> b!1051310 (=> (not res!700524) (not e!596773))))

(assert (=> b!1051310 (= res!700524 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22213))))

(declare-fun b!1051312 () Bool)

(declare-fun res!700518 () Bool)

(assert (=> b!1051312 (=> (not res!700518) (not e!596773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051312 (= res!700518 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051313 () Bool)

(declare-fun e!596775 () Bool)

(declare-fun e!596772 () Bool)

(assert (=> b!1051313 (= e!596775 e!596772)))

(declare-fun res!700519 () Bool)

(assert (=> b!1051313 (=> res!700519 e!596772)))

(assert (=> b!1051313 (= res!700519 (or (bvsgt lt!464078 i!1381) (bvsle i!1381 lt!464078)))))

(declare-fun b!1051314 () Bool)

(assert (=> b!1051314 (= e!596778 (not e!596776))))

(declare-fun res!700521 () Bool)

(assert (=> b!1051314 (=> res!700521 e!596776)))

(assert (=> b!1051314 (= res!700521 (or (bvsgt lt!464078 i!1381) (bvsle i!1381 lt!464078)))))

(assert (=> b!1051314 e!596775))

(declare-fun res!700520 () Bool)

(assert (=> b!1051314 (=> (not res!700520) (not e!596775))))

(assert (=> b!1051314 (= res!700520 (= (select (store (arr!31845 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464078) k0!2747))))

(declare-fun b!1051315 () Bool)

(assert (=> b!1051315 (= e!596772 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!92470 res!700523) b!1051310))

(assert (= (and b!1051310 res!700524) b!1051312))

(assert (= (and b!1051312 res!700518) b!1051309))

(assert (= (and b!1051309 res!700525) b!1051308))

(assert (= (and b!1051308 res!700517) b!1051307))

(assert (= (and b!1051307 res!700522) b!1051314))

(assert (= (and b!1051314 res!700520) b!1051313))

(assert (= (and b!1051313 (not res!700519)) b!1051315))

(assert (= (and b!1051314 (not res!700521)) b!1051311))

(declare-fun m!971341 () Bool)

(assert (=> start!92470 m!971341))

(declare-fun m!971343 () Bool)

(assert (=> b!1051315 m!971343))

(declare-fun m!971345 () Bool)

(assert (=> b!1051307 m!971345))

(declare-fun m!971347 () Bool)

(assert (=> b!1051309 m!971347))

(declare-fun m!971349 () Bool)

(assert (=> b!1051310 m!971349))

(declare-fun m!971351 () Bool)

(assert (=> b!1051314 m!971351))

(declare-fun m!971353 () Bool)

(assert (=> b!1051314 m!971353))

(declare-fun m!971355 () Bool)

(assert (=> b!1051308 m!971355))

(assert (=> b!1051308 m!971351))

(declare-fun m!971357 () Bool)

(assert (=> b!1051312 m!971357))

(declare-fun m!971359 () Bool)

(assert (=> b!1051311 m!971359))

(declare-fun m!971361 () Bool)

(assert (=> b!1051311 m!971361))

(check-sat (not b!1051311) (not b!1051312) (not b!1051310) (not start!92470) (not b!1051307) (not b!1051315) (not b!1051308))
(check-sat)
