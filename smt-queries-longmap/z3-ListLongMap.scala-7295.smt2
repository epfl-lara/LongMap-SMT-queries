; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93462 () Bool)

(assert start!93462)

(declare-fun b!1058311 () Bool)

(declare-fun e!601875 () Bool)

(declare-fun e!601871 () Bool)

(assert (=> b!1058311 (= e!601875 e!601871)))

(declare-fun res!706211 () Bool)

(assert (=> b!1058311 (=> (not res!706211) (not e!601871))))

(declare-datatypes ((array!66715 0))(
  ( (array!66716 (arr!32074 (Array (_ BitVec 32) (_ BitVec 64))) (size!32611 (_ BitVec 32))) )
))
(declare-fun lt!466776 () array!66715)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058311 (= res!706211 (arrayContainsKey!0 lt!466776 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66715)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058311 (= lt!466776 (array!66716 (store (arr!32074 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32611 a!3488)))))

(declare-fun b!1058312 () Bool)

(declare-fun res!706214 () Bool)

(assert (=> b!1058312 (=> (not res!706214) (not e!601875))))

(declare-datatypes ((List!22356 0))(
  ( (Nil!22353) (Cons!22352 (h!23570 (_ BitVec 64)) (t!31655 List!22356)) )
))
(declare-fun arrayNoDuplicates!0 (array!66715 (_ BitVec 32) List!22356) Bool)

(assert (=> b!1058312 (= res!706214 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22353))))

(declare-fun b!1058313 () Bool)

(declare-fun e!601876 () Bool)

(assert (=> b!1058313 (= e!601876 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058314 () Bool)

(declare-fun e!601870 () Bool)

(declare-fun e!601872 () Bool)

(assert (=> b!1058314 (= e!601870 (not e!601872))))

(declare-fun res!706210 () Bool)

(assert (=> b!1058314 (=> res!706210 e!601872)))

(declare-fun lt!466778 () (_ BitVec 32))

(assert (=> b!1058314 (= res!706210 (or (bvsgt lt!466778 i!1381) (bvsle i!1381 lt!466778)))))

(declare-fun e!601874 () Bool)

(assert (=> b!1058314 e!601874))

(declare-fun res!706209 () Bool)

(assert (=> b!1058314 (=> (not res!706209) (not e!601874))))

(assert (=> b!1058314 (= res!706209 (= (select (store (arr!32074 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466778) k0!2747))))

(declare-fun b!1058315 () Bool)

(assert (=> b!1058315 (= e!601872 true)))

(assert (=> b!1058315 (arrayNoDuplicates!0 a!3488 lt!466778 Nil!22353)))

(declare-datatypes ((Unit!34639 0))(
  ( (Unit!34640) )
))
(declare-fun lt!466777 () Unit!34639)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66715 (_ BitVec 32) (_ BitVec 32)) Unit!34639)

(assert (=> b!1058315 (= lt!466777 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466778))))

(declare-fun b!1058316 () Bool)

(assert (=> b!1058316 (= e!601871 e!601870)))

(declare-fun res!706208 () Bool)

(assert (=> b!1058316 (=> (not res!706208) (not e!601870))))

(assert (=> b!1058316 (= res!706208 (not (= lt!466778 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66715 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058316 (= lt!466778 (arrayScanForKey!0 lt!466776 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!706207 () Bool)

(assert (=> start!93462 (=> (not res!706207) (not e!601875))))

(assert (=> start!93462 (= res!706207 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32611 a!3488)) (bvslt (size!32611 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93462 e!601875))

(assert (=> start!93462 true))

(declare-fun array_inv!24856 (array!66715) Bool)

(assert (=> start!93462 (array_inv!24856 a!3488)))

(declare-fun b!1058317 () Bool)

(declare-fun res!706206 () Bool)

(assert (=> b!1058317 (=> (not res!706206) (not e!601875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058317 (= res!706206 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058318 () Bool)

(assert (=> b!1058318 (= e!601874 e!601876)))

(declare-fun res!706213 () Bool)

(assert (=> b!1058318 (=> res!706213 e!601876)))

(assert (=> b!1058318 (= res!706213 (or (bvsgt lt!466778 i!1381) (bvsle i!1381 lt!466778)))))

(declare-fun b!1058319 () Bool)

(declare-fun res!706212 () Bool)

(assert (=> b!1058319 (=> (not res!706212) (not e!601875))))

(assert (=> b!1058319 (= res!706212 (= (select (arr!32074 a!3488) i!1381) k0!2747))))

(assert (= (and start!93462 res!706207) b!1058312))

(assert (= (and b!1058312 res!706214) b!1058317))

(assert (= (and b!1058317 res!706206) b!1058319))

(assert (= (and b!1058319 res!706212) b!1058311))

(assert (= (and b!1058311 res!706211) b!1058316))

(assert (= (and b!1058316 res!706208) b!1058314))

(assert (= (and b!1058314 res!706209) b!1058318))

(assert (= (and b!1058318 (not res!706213)) b!1058313))

(assert (= (and b!1058314 (not res!706210)) b!1058315))

(declare-fun m!978401 () Bool)

(assert (=> b!1058319 m!978401))

(declare-fun m!978403 () Bool)

(assert (=> b!1058316 m!978403))

(declare-fun m!978405 () Bool)

(assert (=> b!1058315 m!978405))

(declare-fun m!978407 () Bool)

(assert (=> b!1058315 m!978407))

(declare-fun m!978409 () Bool)

(assert (=> b!1058317 m!978409))

(declare-fun m!978411 () Bool)

(assert (=> b!1058314 m!978411))

(declare-fun m!978413 () Bool)

(assert (=> b!1058314 m!978413))

(declare-fun m!978415 () Bool)

(assert (=> b!1058312 m!978415))

(declare-fun m!978417 () Bool)

(assert (=> b!1058313 m!978417))

(declare-fun m!978419 () Bool)

(assert (=> start!93462 m!978419))

(declare-fun m!978421 () Bool)

(assert (=> b!1058311 m!978421))

(assert (=> b!1058311 m!978411))

(check-sat (not start!93462) (not b!1058316) (not b!1058312) (not b!1058317) (not b!1058313) (not b!1058311) (not b!1058315))
(check-sat)
