; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93474 () Bool)

(assert start!93474)

(declare-fun res!706374 () Bool)

(declare-fun e!601997 () Bool)

(assert (=> start!93474 (=> (not res!706374) (not e!601997))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66727 0))(
  ( (array!66728 (arr!32080 (Array (_ BitVec 32) (_ BitVec 64))) (size!32617 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66727)

(assert (=> start!93474 (= res!706374 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32617 a!3488)) (bvslt (size!32617 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93474 e!601997))

(assert (=> start!93474 true))

(declare-fun array_inv!24862 (array!66727) Bool)

(assert (=> start!93474 (array_inv!24862 a!3488)))

(declare-fun b!1058473 () Bool)

(declare-fun e!602001 () Bool)

(declare-fun e!602002 () Bool)

(assert (=> b!1058473 (= e!602001 (not e!602002))))

(declare-fun res!706376 () Bool)

(assert (=> b!1058473 (=> res!706376 e!602002)))

(declare-fun lt!466837 () (_ BitVec 32))

(assert (=> b!1058473 (= res!706376 (or (bvsgt lt!466837 i!1381) (bvsle i!1381 lt!466837)))))

(declare-fun e!601999 () Bool)

(assert (=> b!1058473 e!601999))

(declare-fun res!706371 () Bool)

(assert (=> b!1058473 (=> (not res!706371) (not e!601999))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1058473 (= res!706371 (= (select (store (arr!32080 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466837) k0!2747))))

(declare-fun b!1058474 () Bool)

(assert (=> b!1058474 (= e!602002 true)))

(declare-fun lt!466836 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058474 (arrayContainsKey!0 a!3488 k0!2747 lt!466836)))

(declare-datatypes ((Unit!34651 0))(
  ( (Unit!34652) )
))
(declare-fun lt!466834 () Unit!34651)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66727 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34651)

(assert (=> b!1058474 (= lt!466834 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466836))))

(assert (=> b!1058474 (= lt!466836 (bvadd #b00000000000000000000000000000001 lt!466837))))

(declare-datatypes ((List!22362 0))(
  ( (Nil!22359) (Cons!22358 (h!23576 (_ BitVec 64)) (t!31661 List!22362)) )
))
(declare-fun arrayNoDuplicates!0 (array!66727 (_ BitVec 32) List!22362) Bool)

(assert (=> b!1058474 (arrayNoDuplicates!0 a!3488 lt!466837 Nil!22359)))

(declare-fun lt!466838 () Unit!34651)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66727 (_ BitVec 32) (_ BitVec 32)) Unit!34651)

(assert (=> b!1058474 (= lt!466838 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466837))))

(declare-fun b!1058475 () Bool)

(declare-fun res!706375 () Bool)

(assert (=> b!1058475 (=> (not res!706375) (not e!601997))))

(assert (=> b!1058475 (= res!706375 (= (select (arr!32080 a!3488) i!1381) k0!2747))))

(declare-fun e!602000 () Bool)

(declare-fun b!1058476 () Bool)

(assert (=> b!1058476 (= e!602000 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058477 () Bool)

(declare-fun res!706370 () Bool)

(assert (=> b!1058477 (=> (not res!706370) (not e!601997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058477 (= res!706370 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058478 () Bool)

(declare-fun e!601998 () Bool)

(assert (=> b!1058478 (= e!601997 e!601998)))

(declare-fun res!706372 () Bool)

(assert (=> b!1058478 (=> (not res!706372) (not e!601998))))

(declare-fun lt!466835 () array!66727)

(assert (=> b!1058478 (= res!706372 (arrayContainsKey!0 lt!466835 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058478 (= lt!466835 (array!66728 (store (arr!32080 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32617 a!3488)))))

(declare-fun b!1058479 () Bool)

(assert (=> b!1058479 (= e!601998 e!602001)))

(declare-fun res!706368 () Bool)

(assert (=> b!1058479 (=> (not res!706368) (not e!602001))))

(assert (=> b!1058479 (= res!706368 (not (= lt!466837 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66727 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058479 (= lt!466837 (arrayScanForKey!0 lt!466835 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058480 () Bool)

(declare-fun res!706369 () Bool)

(assert (=> b!1058480 (=> (not res!706369) (not e!601997))))

(assert (=> b!1058480 (= res!706369 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22359))))

(declare-fun b!1058481 () Bool)

(assert (=> b!1058481 (= e!601999 e!602000)))

(declare-fun res!706373 () Bool)

(assert (=> b!1058481 (=> res!706373 e!602000)))

(assert (=> b!1058481 (= res!706373 (or (bvsgt lt!466837 i!1381) (bvsle i!1381 lt!466837)))))

(assert (= (and start!93474 res!706374) b!1058480))

(assert (= (and b!1058480 res!706369) b!1058477))

(assert (= (and b!1058477 res!706370) b!1058475))

(assert (= (and b!1058475 res!706375) b!1058478))

(assert (= (and b!1058478 res!706372) b!1058479))

(assert (= (and b!1058479 res!706368) b!1058473))

(assert (= (and b!1058473 res!706371) b!1058481))

(assert (= (and b!1058481 (not res!706373)) b!1058476))

(assert (= (and b!1058473 (not res!706376)) b!1058474))

(declare-fun m!978533 () Bool)

(assert (=> b!1058474 m!978533))

(declare-fun m!978535 () Bool)

(assert (=> b!1058474 m!978535))

(declare-fun m!978537 () Bool)

(assert (=> b!1058474 m!978537))

(declare-fun m!978539 () Bool)

(assert (=> b!1058474 m!978539))

(declare-fun m!978541 () Bool)

(assert (=> start!93474 m!978541))

(declare-fun m!978543 () Bool)

(assert (=> b!1058477 m!978543))

(declare-fun m!978545 () Bool)

(assert (=> b!1058479 m!978545))

(declare-fun m!978547 () Bool)

(assert (=> b!1058476 m!978547))

(declare-fun m!978549 () Bool)

(assert (=> b!1058480 m!978549))

(declare-fun m!978551 () Bool)

(assert (=> b!1058473 m!978551))

(declare-fun m!978553 () Bool)

(assert (=> b!1058473 m!978553))

(declare-fun m!978555 () Bool)

(assert (=> b!1058478 m!978555))

(assert (=> b!1058478 m!978551))

(declare-fun m!978557 () Bool)

(assert (=> b!1058475 m!978557))

(check-sat (not b!1058480) (not b!1058477) (not b!1058476) (not b!1058474) (not b!1058479) (not b!1058478) (not start!93474))
(check-sat)
