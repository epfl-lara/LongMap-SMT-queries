; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92476 () Bool)

(assert start!92476)

(declare-fun b!1051394 () Bool)

(declare-fun e!596842 () Bool)

(declare-fun e!596840 () Bool)

(assert (=> b!1051394 (= e!596842 e!596840)))

(declare-fun res!700612 () Bool)

(assert (=> b!1051394 (=> res!700612 e!596840)))

(declare-fun lt!464115 () (_ BitVec 32))

(declare-datatypes ((array!66218 0))(
  ( (array!66219 (arr!31848 (Array (_ BitVec 32) (_ BitVec 64))) (size!32386 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66218)

(declare-fun lt!464111 () (_ BitVec 32))

(assert (=> b!1051394 (= res!700612 (or (bvslt lt!464111 #b00000000000000000000000000000000) (bvsge lt!464115 (size!32386 a!3488)) (bvsge lt!464111 (size!32386 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051394 (arrayContainsKey!0 a!3488 k0!2747 lt!464115)))

(declare-datatypes ((Unit!34301 0))(
  ( (Unit!34302) )
))
(declare-fun lt!464114 () Unit!34301)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66218 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34301)

(assert (=> b!1051394 (= lt!464114 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!464115))))

(assert (=> b!1051394 (= lt!464115 (bvadd #b00000000000000000000000000000001 lt!464111))))

(declare-datatypes ((List!22219 0))(
  ( (Nil!22216) (Cons!22215 (h!23424 (_ BitVec 64)) (t!31517 List!22219)) )
))
(declare-fun arrayNoDuplicates!0 (array!66218 (_ BitVec 32) List!22219) Bool)

(assert (=> b!1051394 (arrayNoDuplicates!0 a!3488 lt!464111 Nil!22216)))

(declare-fun lt!464116 () Unit!34301)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66218 (_ BitVec 32) (_ BitVec 32)) Unit!34301)

(assert (=> b!1051394 (= lt!464116 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464111))))

(declare-fun b!1051395 () Bool)

(declare-fun res!700606 () Bool)

(declare-fun e!596837 () Bool)

(assert (=> b!1051395 (=> (not res!700606) (not e!596837))))

(assert (=> b!1051395 (= res!700606 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22216))))

(declare-fun b!1051396 () Bool)

(declare-fun res!700615 () Bool)

(assert (=> b!1051396 (=> res!700615 e!596840)))

(declare-fun noDuplicate!1531 (List!22219) Bool)

(assert (=> b!1051396 (= res!700615 (not (noDuplicate!1531 Nil!22216)))))

(declare-fun e!596844 () Bool)

(declare-fun b!1051397 () Bool)

(assert (=> b!1051397 (= e!596844 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!700605 () Bool)

(assert (=> start!92476 (=> (not res!700605) (not e!596837))))

(assert (=> start!92476 (= res!700605 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32386 a!3488)) (bvslt (size!32386 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92476 e!596837))

(assert (=> start!92476 true))

(declare-fun array_inv!24631 (array!66218) Bool)

(assert (=> start!92476 (array_inv!24631 a!3488)))

(declare-fun b!1051398 () Bool)

(declare-fun e!596841 () Bool)

(assert (=> b!1051398 (= e!596841 e!596844)))

(declare-fun res!700611 () Bool)

(assert (=> b!1051398 (=> res!700611 e!596844)))

(assert (=> b!1051398 (= res!700611 (or (bvsgt lt!464111 i!1381) (bvsle i!1381 lt!464111)))))

(declare-fun b!1051399 () Bool)

(declare-fun e!596838 () Bool)

(assert (=> b!1051399 (= e!596837 e!596838)))

(declare-fun res!700604 () Bool)

(assert (=> b!1051399 (=> (not res!700604) (not e!596838))))

(declare-fun lt!464113 () array!66218)

(assert (=> b!1051399 (= res!700604 (arrayContainsKey!0 lt!464113 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051399 (= lt!464113 (array!66219 (store (arr!31848 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32386 a!3488)))))

(declare-fun b!1051400 () Bool)

(declare-fun e!596839 () Bool)

(assert (=> b!1051400 (= e!596838 e!596839)))

(declare-fun res!700607 () Bool)

(assert (=> b!1051400 (=> (not res!700607) (not e!596839))))

(assert (=> b!1051400 (= res!700607 (not (= lt!464111 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66218 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051400 (= lt!464111 (arrayScanForKey!0 lt!464113 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051401 () Bool)

(declare-fun res!700608 () Bool)

(assert (=> b!1051401 (=> (not res!700608) (not e!596837))))

(assert (=> b!1051401 (= res!700608 (= (select (arr!31848 a!3488) i!1381) k0!2747))))

(declare-fun b!1051402 () Bool)

(declare-fun res!700610 () Bool)

(assert (=> b!1051402 (=> (not res!700610) (not e!596837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051402 (= res!700610 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051403 () Bool)

(assert (=> b!1051403 (= e!596839 (not e!596842))))

(declare-fun res!700609 () Bool)

(assert (=> b!1051403 (=> res!700609 e!596842)))

(assert (=> b!1051403 (= res!700609 (or (bvsgt lt!464111 i!1381) (bvsle i!1381 lt!464111)))))

(assert (=> b!1051403 e!596841))

(declare-fun res!700613 () Bool)

(assert (=> b!1051403 (=> (not res!700613) (not e!596841))))

(assert (=> b!1051403 (= res!700613 (= (select (store (arr!31848 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464111) k0!2747))))

(declare-fun b!1051404 () Bool)

(assert (=> b!1051404 (= e!596840 true)))

(declare-fun lt!464112 () Bool)

(declare-fun contains!6106 (List!22219 (_ BitVec 64)) Bool)

(assert (=> b!1051404 (= lt!464112 (contains!6106 Nil!22216 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051405 () Bool)

(declare-fun res!700614 () Bool)

(assert (=> b!1051405 (=> res!700614 e!596840)))

(assert (=> b!1051405 (= res!700614 (contains!6106 Nil!22216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92476 res!700605) b!1051395))

(assert (= (and b!1051395 res!700606) b!1051402))

(assert (= (and b!1051402 res!700610) b!1051401))

(assert (= (and b!1051401 res!700608) b!1051399))

(assert (= (and b!1051399 res!700604) b!1051400))

(assert (= (and b!1051400 res!700607) b!1051403))

(assert (= (and b!1051403 res!700613) b!1051398))

(assert (= (and b!1051398 (not res!700611)) b!1051397))

(assert (= (and b!1051403 (not res!700609)) b!1051394))

(assert (= (and b!1051394 (not res!700612)) b!1051396))

(assert (= (and b!1051396 (not res!700615)) b!1051405))

(assert (= (and b!1051405 (not res!700614)) b!1051404))

(declare-fun m!971407 () Bool)

(assert (=> b!1051403 m!971407))

(declare-fun m!971409 () Bool)

(assert (=> b!1051403 m!971409))

(declare-fun m!971411 () Bool)

(assert (=> b!1051405 m!971411))

(declare-fun m!971413 () Bool)

(assert (=> b!1051400 m!971413))

(declare-fun m!971415 () Bool)

(assert (=> b!1051394 m!971415))

(declare-fun m!971417 () Bool)

(assert (=> b!1051394 m!971417))

(declare-fun m!971419 () Bool)

(assert (=> b!1051394 m!971419))

(declare-fun m!971421 () Bool)

(assert (=> b!1051394 m!971421))

(declare-fun m!971423 () Bool)

(assert (=> b!1051396 m!971423))

(declare-fun m!971425 () Bool)

(assert (=> b!1051404 m!971425))

(declare-fun m!971427 () Bool)

(assert (=> start!92476 m!971427))

(declare-fun m!971429 () Bool)

(assert (=> b!1051395 m!971429))

(declare-fun m!971431 () Bool)

(assert (=> b!1051397 m!971431))

(declare-fun m!971433 () Bool)

(assert (=> b!1051401 m!971433))

(declare-fun m!971435 () Bool)

(assert (=> b!1051399 m!971435))

(assert (=> b!1051399 m!971407))

(declare-fun m!971437 () Bool)

(assert (=> b!1051402 m!971437))

(check-sat (not b!1051397) (not b!1051402) (not start!92476) (not b!1051400) (not b!1051405) (not b!1051396) (not b!1051394) (not b!1051395) (not b!1051404) (not b!1051399))
(check-sat)
