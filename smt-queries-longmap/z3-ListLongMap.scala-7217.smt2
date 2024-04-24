; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92598 () Bool)

(assert start!92598)

(declare-fun b!1051393 () Bool)

(declare-fun res!699723 () Bool)

(declare-fun e!596686 () Bool)

(assert (=> b!1051393 (=> (not res!699723) (not e!596686))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051393 (= res!699723 (validKeyInArray!0 k0!2747))))

(declare-fun res!699719 () Bool)

(assert (=> start!92598 (=> (not res!699719) (not e!596686))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66214 0))(
  ( (array!66215 (arr!31840 (Array (_ BitVec 32) (_ BitVec 64))) (size!32377 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66214)

(assert (=> start!92598 (= res!699719 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32377 a!3488)) (bvslt (size!32377 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92598 e!596686))

(assert (=> start!92598 true))

(declare-fun array_inv!24622 (array!66214) Bool)

(assert (=> start!92598 (array_inv!24622 a!3488)))

(declare-fun b!1051394 () Bool)

(declare-fun res!699716 () Bool)

(declare-fun e!596683 () Bool)

(assert (=> b!1051394 (=> res!699716 e!596683)))

(declare-datatypes ((List!22122 0))(
  ( (Nil!22119) (Cons!22118 (h!23336 (_ BitVec 64)) (t!31421 List!22122)) )
))
(declare-fun contains!6152 (List!22122 (_ BitVec 64)) Bool)

(assert (=> b!1051394 (= res!699716 (contains!6152 Nil!22119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051395 () Bool)

(assert (=> b!1051395 (= e!596683 true)))

(declare-fun lt!464297 () Bool)

(assert (=> b!1051395 (= lt!464297 (contains!6152 Nil!22119 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051396 () Bool)

(declare-fun e!596687 () Bool)

(assert (=> b!1051396 (= e!596687 e!596683)))

(declare-fun res!699714 () Bool)

(assert (=> b!1051396 (=> res!699714 e!596683)))

(assert (=> b!1051396 (= res!699714 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32377 a!3488)))))

(declare-fun arrayContainsKey!0 (array!66214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051396 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!464294 () (_ BitVec 32))

(declare-datatypes ((Unit!34369 0))(
  ( (Unit!34370) )
))
(declare-fun lt!464295 () Unit!34369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66214 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34369)

(assert (=> b!1051396 (= lt!464295 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464294 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66214 (_ BitVec 32) List!22122) Bool)

(assert (=> b!1051396 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22119)))

(declare-fun lt!464296 () Unit!34369)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66214 (_ BitVec 32) (_ BitVec 32)) Unit!34369)

(assert (=> b!1051396 (= lt!464296 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1051397 () Bool)

(declare-fun res!699721 () Bool)

(assert (=> b!1051397 (=> res!699721 e!596683)))

(declare-fun noDuplicate!1528 (List!22122) Bool)

(assert (=> b!1051397 (= res!699721 (not (noDuplicate!1528 Nil!22119)))))

(declare-fun b!1051398 () Bool)

(declare-fun e!596685 () Bool)

(declare-fun e!596684 () Bool)

(assert (=> b!1051398 (= e!596685 e!596684)))

(declare-fun res!699722 () Bool)

(assert (=> b!1051398 (=> (not res!699722) (not e!596684))))

(assert (=> b!1051398 (= res!699722 (not (= lt!464294 i!1381)))))

(declare-fun lt!464293 () array!66214)

(declare-fun arrayScanForKey!0 (array!66214 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051398 (= lt!464294 (arrayScanForKey!0 lt!464293 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051399 () Bool)

(declare-fun res!699720 () Bool)

(assert (=> b!1051399 (=> (not res!699720) (not e!596686))))

(assert (=> b!1051399 (= res!699720 (= (select (arr!31840 a!3488) i!1381) k0!2747))))

(declare-fun b!1051400 () Bool)

(declare-fun res!699718 () Bool)

(assert (=> b!1051400 (=> (not res!699718) (not e!596686))))

(assert (=> b!1051400 (= res!699718 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22119))))

(declare-fun b!1051401 () Bool)

(assert (=> b!1051401 (= e!596686 e!596685)))

(declare-fun res!699717 () Bool)

(assert (=> b!1051401 (=> (not res!699717) (not e!596685))))

(assert (=> b!1051401 (= res!699717 (arrayContainsKey!0 lt!464293 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051401 (= lt!464293 (array!66215 (store (arr!31840 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32377 a!3488)))))

(declare-fun b!1051402 () Bool)

(assert (=> b!1051402 (= e!596684 (not e!596687))))

(declare-fun res!699715 () Bool)

(assert (=> b!1051402 (=> res!699715 e!596687)))

(assert (=> b!1051402 (= res!699715 (bvsle lt!464294 i!1381))))

(declare-fun e!596689 () Bool)

(assert (=> b!1051402 e!596689))

(declare-fun res!699725 () Bool)

(assert (=> b!1051402 (=> (not res!699725) (not e!596689))))

(assert (=> b!1051402 (= res!699725 (= (select (store (arr!31840 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464294) k0!2747))))

(declare-fun b!1051403 () Bool)

(declare-fun e!596682 () Bool)

(assert (=> b!1051403 (= e!596682 (arrayContainsKey!0 a!3488 k0!2747 lt!464294))))

(declare-fun b!1051404 () Bool)

(assert (=> b!1051404 (= e!596689 e!596682)))

(declare-fun res!699724 () Bool)

(assert (=> b!1051404 (=> res!699724 e!596682)))

(assert (=> b!1051404 (= res!699724 (bvsle lt!464294 i!1381))))

(assert (= (and start!92598 res!699719) b!1051400))

(assert (= (and b!1051400 res!699718) b!1051393))

(assert (= (and b!1051393 res!699723) b!1051399))

(assert (= (and b!1051399 res!699720) b!1051401))

(assert (= (and b!1051401 res!699717) b!1051398))

(assert (= (and b!1051398 res!699722) b!1051402))

(assert (= (and b!1051402 res!699725) b!1051404))

(assert (= (and b!1051404 (not res!699724)) b!1051403))

(assert (= (and b!1051402 (not res!699715)) b!1051396))

(assert (= (and b!1051396 (not res!699714)) b!1051397))

(assert (= (and b!1051397 (not res!699721)) b!1051394))

(assert (= (and b!1051394 (not res!699716)) b!1051395))

(declare-fun m!972437 () Bool)

(assert (=> b!1051398 m!972437))

(declare-fun m!972439 () Bool)

(assert (=> b!1051396 m!972439))

(declare-fun m!972441 () Bool)

(assert (=> b!1051396 m!972441))

(declare-fun m!972443 () Bool)

(assert (=> b!1051396 m!972443))

(declare-fun m!972445 () Bool)

(assert (=> b!1051396 m!972445))

(declare-fun m!972447 () Bool)

(assert (=> b!1051401 m!972447))

(declare-fun m!972449 () Bool)

(assert (=> b!1051401 m!972449))

(assert (=> b!1051402 m!972449))

(declare-fun m!972451 () Bool)

(assert (=> b!1051402 m!972451))

(declare-fun m!972453 () Bool)

(assert (=> b!1051400 m!972453))

(declare-fun m!972455 () Bool)

(assert (=> b!1051394 m!972455))

(declare-fun m!972457 () Bool)

(assert (=> start!92598 m!972457))

(declare-fun m!972459 () Bool)

(assert (=> b!1051395 m!972459))

(declare-fun m!972461 () Bool)

(assert (=> b!1051397 m!972461))

(declare-fun m!972463 () Bool)

(assert (=> b!1051403 m!972463))

(declare-fun m!972465 () Bool)

(assert (=> b!1051399 m!972465))

(declare-fun m!972467 () Bool)

(assert (=> b!1051393 m!972467))

(check-sat (not b!1051401) (not b!1051400) (not b!1051397) (not b!1051398) (not b!1051393) (not b!1051394) (not b!1051403) (not b!1051395) (not b!1051396) (not start!92598))
(check-sat)
