; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93468 () Bool)

(assert start!93468)

(declare-fun b!1058392 () Bool)

(declare-fun e!601939 () Bool)

(assert (=> b!1058392 (= e!601939 true)))

(declare-datatypes ((array!66721 0))(
  ( (array!66722 (arr!32077 (Array (_ BitVec 32) (_ BitVec 64))) (size!32614 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66721)

(declare-fun lt!466803 () (_ BitVec 32))

(declare-datatypes ((List!22359 0))(
  ( (Nil!22356) (Cons!22355 (h!23573 (_ BitVec 64)) (t!31658 List!22359)) )
))
(declare-fun arrayNoDuplicates!0 (array!66721 (_ BitVec 32) List!22359) Bool)

(assert (=> b!1058392 (arrayNoDuplicates!0 a!3488 lt!466803 Nil!22356)))

(declare-datatypes ((Unit!34645 0))(
  ( (Unit!34646) )
))
(declare-fun lt!466804 () Unit!34645)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66721 (_ BitVec 32) (_ BitVec 32)) Unit!34645)

(assert (=> b!1058392 (= lt!466804 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466803))))

(declare-fun b!1058393 () Bool)

(declare-fun e!601936 () Bool)

(assert (=> b!1058393 (= e!601936 (not e!601939))))

(declare-fun res!706293 () Bool)

(assert (=> b!1058393 (=> res!706293 e!601939)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058393 (= res!706293 (or (bvsgt lt!466803 i!1381) (bvsle i!1381 lt!466803)))))

(declare-fun e!601934 () Bool)

(assert (=> b!1058393 e!601934))

(declare-fun res!706292 () Bool)

(assert (=> b!1058393 (=> (not res!706292) (not e!601934))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1058393 (= res!706292 (= (select (store (arr!32077 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466803) k0!2747))))

(declare-fun res!706291 () Bool)

(declare-fun e!601938 () Bool)

(assert (=> start!93468 (=> (not res!706291) (not e!601938))))

(assert (=> start!93468 (= res!706291 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32614 a!3488)) (bvslt (size!32614 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93468 e!601938))

(assert (=> start!93468 true))

(declare-fun array_inv!24859 (array!66721) Bool)

(assert (=> start!93468 (array_inv!24859 a!3488)))

(declare-fun b!1058394 () Bool)

(declare-fun e!601935 () Bool)

(assert (=> b!1058394 (= e!601935 e!601936)))

(declare-fun res!706288 () Bool)

(assert (=> b!1058394 (=> (not res!706288) (not e!601936))))

(assert (=> b!1058394 (= res!706288 (not (= lt!466803 i!1381)))))

(declare-fun lt!466805 () array!66721)

(declare-fun arrayScanForKey!0 (array!66721 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058394 (= lt!466803 (arrayScanForKey!0 lt!466805 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058395 () Bool)

(declare-fun res!706287 () Bool)

(assert (=> b!1058395 (=> (not res!706287) (not e!601938))))

(assert (=> b!1058395 (= res!706287 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22356))))

(declare-fun b!1058396 () Bool)

(declare-fun e!601937 () Bool)

(declare-fun arrayContainsKey!0 (array!66721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058396 (= e!601937 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058397 () Bool)

(assert (=> b!1058397 (= e!601934 e!601937)))

(declare-fun res!706289 () Bool)

(assert (=> b!1058397 (=> res!706289 e!601937)))

(assert (=> b!1058397 (= res!706289 (or (bvsgt lt!466803 i!1381) (bvsle i!1381 lt!466803)))))

(declare-fun b!1058398 () Bool)

(declare-fun res!706290 () Bool)

(assert (=> b!1058398 (=> (not res!706290) (not e!601938))))

(assert (=> b!1058398 (= res!706290 (= (select (arr!32077 a!3488) i!1381) k0!2747))))

(declare-fun b!1058399 () Bool)

(assert (=> b!1058399 (= e!601938 e!601935)))

(declare-fun res!706295 () Bool)

(assert (=> b!1058399 (=> (not res!706295) (not e!601935))))

(assert (=> b!1058399 (= res!706295 (arrayContainsKey!0 lt!466805 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058399 (= lt!466805 (array!66722 (store (arr!32077 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32614 a!3488)))))

(declare-fun b!1058400 () Bool)

(declare-fun res!706294 () Bool)

(assert (=> b!1058400 (=> (not res!706294) (not e!601938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058400 (= res!706294 (validKeyInArray!0 k0!2747))))

(assert (= (and start!93468 res!706291) b!1058395))

(assert (= (and b!1058395 res!706287) b!1058400))

(assert (= (and b!1058400 res!706294) b!1058398))

(assert (= (and b!1058398 res!706290) b!1058399))

(assert (= (and b!1058399 res!706295) b!1058394))

(assert (= (and b!1058394 res!706288) b!1058393))

(assert (= (and b!1058393 res!706292) b!1058397))

(assert (= (and b!1058397 (not res!706289)) b!1058396))

(assert (= (and b!1058393 (not res!706293)) b!1058392))

(declare-fun m!978467 () Bool)

(assert (=> b!1058396 m!978467))

(declare-fun m!978469 () Bool)

(assert (=> b!1058393 m!978469))

(declare-fun m!978471 () Bool)

(assert (=> b!1058393 m!978471))

(declare-fun m!978473 () Bool)

(assert (=> b!1058392 m!978473))

(declare-fun m!978475 () Bool)

(assert (=> b!1058392 m!978475))

(declare-fun m!978477 () Bool)

(assert (=> b!1058400 m!978477))

(declare-fun m!978479 () Bool)

(assert (=> b!1058394 m!978479))

(declare-fun m!978481 () Bool)

(assert (=> b!1058395 m!978481))

(declare-fun m!978483 () Bool)

(assert (=> b!1058398 m!978483))

(declare-fun m!978485 () Bool)

(assert (=> b!1058399 m!978485))

(assert (=> b!1058399 m!978469))

(declare-fun m!978487 () Bool)

(assert (=> start!93468 m!978487))

(check-sat (not b!1058399) (not start!93468) (not b!1058396) (not b!1058394) (not b!1058395) (not b!1058392) (not b!1058400))
(check-sat)
