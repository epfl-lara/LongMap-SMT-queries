; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92920 () Bool)

(assert start!92920)

(declare-datatypes ((array!66482 0))(
  ( (array!66483 (arr!31971 (Array (_ BitVec 32) (_ BitVec 64))) (size!32509 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66482)

(declare-fun b!1054808 () Bool)

(declare-fun e!599373 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!465413 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054808 (= e!599373 (arrayContainsKey!0 a!3488 k0!2747 lt!465413))))

(declare-fun b!1054809 () Bool)

(declare-fun res!703795 () Bool)

(declare-fun e!599370 () Bool)

(assert (=> b!1054809 (=> (not res!703795) (not e!599370))))

(declare-datatypes ((List!22342 0))(
  ( (Nil!22339) (Cons!22338 (h!23547 (_ BitVec 64)) (t!31640 List!22342)) )
))
(declare-fun arrayNoDuplicates!0 (array!66482 (_ BitVec 32) List!22342) Bool)

(assert (=> b!1054809 (= res!703795 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22339))))

(declare-fun b!1054810 () Bool)

(declare-fun res!703797 () Bool)

(assert (=> b!1054810 (=> (not res!703797) (not e!599370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054810 (= res!703797 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054811 () Bool)

(declare-fun e!599372 () Bool)

(assert (=> b!1054811 (= e!599370 e!599372)))

(declare-fun res!703792 () Bool)

(assert (=> b!1054811 (=> (not res!703792) (not e!599372))))

(declare-fun lt!465415 () array!66482)

(assert (=> b!1054811 (= res!703792 (arrayContainsKey!0 lt!465415 k0!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054811 (= lt!465415 (array!66483 (store (arr!31971 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32509 a!3488)))))

(declare-fun b!1054812 () Bool)

(declare-fun e!599368 () Bool)

(declare-fun e!599367 () Bool)

(assert (=> b!1054812 (= e!599368 (not e!599367))))

(declare-fun res!703796 () Bool)

(assert (=> b!1054812 (=> res!703796 e!599367)))

(assert (=> b!1054812 (= res!703796 (bvsle lt!465413 i!1381))))

(declare-fun e!599369 () Bool)

(assert (=> b!1054812 e!599369))

(declare-fun res!703790 () Bool)

(assert (=> b!1054812 (=> (not res!703790) (not e!599369))))

(assert (=> b!1054812 (= res!703790 (= (select (store (arr!31971 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465413) k0!2747))))

(declare-fun b!1054813 () Bool)

(assert (=> b!1054813 (= e!599372 e!599368)))

(declare-fun res!703791 () Bool)

(assert (=> b!1054813 (=> (not res!703791) (not e!599368))))

(assert (=> b!1054813 (= res!703791 (not (= lt!465413 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66482 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054813 (= lt!465413 (arrayScanForKey!0 lt!465415 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!703798 () Bool)

(assert (=> start!92920 (=> (not res!703798) (not e!599370))))

(assert (=> start!92920 (= res!703798 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32509 a!3488)) (bvslt (size!32509 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92920 e!599370))

(assert (=> start!92920 true))

(declare-fun array_inv!24754 (array!66482) Bool)

(assert (=> start!92920 (array_inv!24754 a!3488)))

(declare-fun b!1054814 () Bool)

(declare-fun res!703793 () Bool)

(assert (=> b!1054814 (=> (not res!703793) (not e!599370))))

(assert (=> b!1054814 (= res!703793 (= (select (arr!31971 a!3488) i!1381) k0!2747))))

(declare-fun b!1054815 () Bool)

(assert (=> b!1054815 (= e!599369 e!599373)))

(declare-fun res!703794 () Bool)

(assert (=> b!1054815 (=> res!703794 e!599373)))

(assert (=> b!1054815 (= res!703794 (bvsle lt!465413 i!1381))))

(declare-fun b!1054816 () Bool)

(assert (=> b!1054816 (= e!599367 true)))

(assert (=> b!1054816 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34433 0))(
  ( (Unit!34434) )
))
(declare-fun lt!465414 () Unit!34433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34433)

(assert (=> b!1054816 (= lt!465414 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!465413 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1054816 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22339)))

(declare-fun lt!465412 () Unit!34433)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66482 (_ BitVec 32) (_ BitVec 32)) Unit!34433)

(assert (=> b!1054816 (= lt!465412 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92920 res!703798) b!1054809))

(assert (= (and b!1054809 res!703795) b!1054810))

(assert (= (and b!1054810 res!703797) b!1054814))

(assert (= (and b!1054814 res!703793) b!1054811))

(assert (= (and b!1054811 res!703792) b!1054813))

(assert (= (and b!1054813 res!703791) b!1054812))

(assert (= (and b!1054812 res!703790) b!1054815))

(assert (= (and b!1054815 (not res!703794)) b!1054808))

(assert (= (and b!1054812 (not res!703796)) b!1054816))

(declare-fun m!974377 () Bool)

(assert (=> b!1054812 m!974377))

(declare-fun m!974379 () Bool)

(assert (=> b!1054812 m!974379))

(declare-fun m!974381 () Bool)

(assert (=> b!1054810 m!974381))

(declare-fun m!974383 () Bool)

(assert (=> b!1054814 m!974383))

(declare-fun m!974385 () Bool)

(assert (=> b!1054809 m!974385))

(declare-fun m!974387 () Bool)

(assert (=> start!92920 m!974387))

(declare-fun m!974389 () Bool)

(assert (=> b!1054811 m!974389))

(assert (=> b!1054811 m!974377))

(declare-fun m!974391 () Bool)

(assert (=> b!1054816 m!974391))

(declare-fun m!974393 () Bool)

(assert (=> b!1054816 m!974393))

(declare-fun m!974395 () Bool)

(assert (=> b!1054816 m!974395))

(declare-fun m!974397 () Bool)

(assert (=> b!1054816 m!974397))

(declare-fun m!974399 () Bool)

(assert (=> b!1054813 m!974399))

(declare-fun m!974401 () Bool)

(assert (=> b!1054808 m!974401))

(check-sat (not b!1054808) (not b!1054811) (not b!1054813) (not b!1054816) (not b!1054809) (not start!92920) (not b!1054810))
(check-sat)
