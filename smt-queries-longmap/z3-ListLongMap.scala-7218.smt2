; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92604 () Bool)

(assert start!92604)

(declare-fun b!1051501 () Bool)

(declare-fun e!596760 () Bool)

(declare-fun e!596754 () Bool)

(assert (=> b!1051501 (= e!596760 e!596754)))

(declare-fun res!699824 () Bool)

(assert (=> b!1051501 (=> (not res!699824) (not e!596754))))

(declare-fun lt!464339 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051501 (= res!699824 (not (= lt!464339 i!1381)))))

(declare-datatypes ((array!66220 0))(
  ( (array!66221 (arr!31843 (Array (_ BitVec 32) (_ BitVec 64))) (size!32380 (_ BitVec 32))) )
))
(declare-fun lt!464338 () array!66220)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66220 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051501 (= lt!464339 (arrayScanForKey!0 lt!464338 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051502 () Bool)

(declare-fun res!699830 () Bool)

(declare-fun e!596757 () Bool)

(assert (=> b!1051502 (=> res!699830 e!596757)))

(declare-datatypes ((List!22125 0))(
  ( (Nil!22122) (Cons!22121 (h!23339 (_ BitVec 64)) (t!31424 List!22125)) )
))
(declare-fun contains!6155 (List!22125 (_ BitVec 64)) Bool)

(assert (=> b!1051502 (= res!699830 (contains!6155 Nil!22122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051503 () Bool)

(declare-fun e!596758 () Bool)

(assert (=> b!1051503 (= e!596758 e!596760)))

(declare-fun res!699833 () Bool)

(assert (=> b!1051503 (=> (not res!699833) (not e!596760))))

(declare-fun arrayContainsKey!0 (array!66220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051503 (= res!699833 (arrayContainsKey!0 lt!464338 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66220)

(assert (=> b!1051503 (= lt!464338 (array!66221 (store (arr!31843 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32380 a!3488)))))

(declare-fun b!1051504 () Bool)

(declare-fun res!699823 () Bool)

(assert (=> b!1051504 (=> res!699823 e!596757)))

(declare-fun noDuplicate!1531 (List!22125) Bool)

(assert (=> b!1051504 (= res!699823 (not (noDuplicate!1531 Nil!22122)))))

(declare-fun e!596755 () Bool)

(declare-fun b!1051506 () Bool)

(assert (=> b!1051506 (= e!596755 (arrayContainsKey!0 a!3488 k0!2747 lt!464339))))

(declare-fun b!1051507 () Bool)

(declare-fun e!596756 () Bool)

(assert (=> b!1051507 (= e!596756 e!596755)))

(declare-fun res!699825 () Bool)

(assert (=> b!1051507 (=> res!699825 e!596755)))

(assert (=> b!1051507 (= res!699825 (bvsle lt!464339 i!1381))))

(declare-fun b!1051508 () Bool)

(declare-fun res!699831 () Bool)

(assert (=> b!1051508 (=> (not res!699831) (not e!596758))))

(declare-fun arrayNoDuplicates!0 (array!66220 (_ BitVec 32) List!22125) Bool)

(assert (=> b!1051508 (= res!699831 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22122))))

(declare-fun b!1051509 () Bool)

(declare-fun e!596761 () Bool)

(assert (=> b!1051509 (= e!596754 (not e!596761))))

(declare-fun res!699827 () Bool)

(assert (=> b!1051509 (=> res!699827 e!596761)))

(assert (=> b!1051509 (= res!699827 (bvsle lt!464339 i!1381))))

(assert (=> b!1051509 e!596756))

(declare-fun res!699822 () Bool)

(assert (=> b!1051509 (=> (not res!699822) (not e!596756))))

(assert (=> b!1051509 (= res!699822 (= (select (store (arr!31843 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464339) k0!2747))))

(declare-fun res!699828 () Bool)

(assert (=> start!92604 (=> (not res!699828) (not e!596758))))

(assert (=> start!92604 (= res!699828 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32380 a!3488)) (bvslt (size!32380 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92604 e!596758))

(assert (=> start!92604 true))

(declare-fun array_inv!24625 (array!66220) Bool)

(assert (=> start!92604 (array_inv!24625 a!3488)))

(declare-fun b!1051505 () Bool)

(declare-fun res!699829 () Bool)

(assert (=> b!1051505 (=> (not res!699829) (not e!596758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051505 (= res!699829 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051510 () Bool)

(assert (=> b!1051510 (= e!596757 true)))

(declare-fun lt!464341 () Bool)

(assert (=> b!1051510 (= lt!464341 (contains!6155 Nil!22122 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051511 () Bool)

(declare-fun res!699826 () Bool)

(assert (=> b!1051511 (=> (not res!699826) (not e!596758))))

(assert (=> b!1051511 (= res!699826 (= (select (arr!31843 a!3488) i!1381) k0!2747))))

(declare-fun b!1051512 () Bool)

(assert (=> b!1051512 (= e!596761 e!596757)))

(declare-fun res!699832 () Bool)

(assert (=> b!1051512 (=> res!699832 e!596757)))

(assert (=> b!1051512 (= res!699832 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32380 a!3488)))))

(assert (=> b!1051512 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34375 0))(
  ( (Unit!34376) )
))
(declare-fun lt!464340 () Unit!34375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66220 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34375)

(assert (=> b!1051512 (= lt!464340 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464339 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1051512 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22122)))

(declare-fun lt!464342 () Unit!34375)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66220 (_ BitVec 32) (_ BitVec 32)) Unit!34375)

(assert (=> b!1051512 (= lt!464342 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92604 res!699828) b!1051508))

(assert (= (and b!1051508 res!699831) b!1051505))

(assert (= (and b!1051505 res!699829) b!1051511))

(assert (= (and b!1051511 res!699826) b!1051503))

(assert (= (and b!1051503 res!699833) b!1051501))

(assert (= (and b!1051501 res!699824) b!1051509))

(assert (= (and b!1051509 res!699822) b!1051507))

(assert (= (and b!1051507 (not res!699825)) b!1051506))

(assert (= (and b!1051509 (not res!699827)) b!1051512))

(assert (= (and b!1051512 (not res!699832)) b!1051504))

(assert (= (and b!1051504 (not res!699823)) b!1051502))

(assert (= (and b!1051502 (not res!699830)) b!1051510))

(declare-fun m!972533 () Bool)

(assert (=> b!1051509 m!972533))

(declare-fun m!972535 () Bool)

(assert (=> b!1051509 m!972535))

(declare-fun m!972537 () Bool)

(assert (=> start!92604 m!972537))

(declare-fun m!972539 () Bool)

(assert (=> b!1051502 m!972539))

(declare-fun m!972541 () Bool)

(assert (=> b!1051506 m!972541))

(declare-fun m!972543 () Bool)

(assert (=> b!1051503 m!972543))

(assert (=> b!1051503 m!972533))

(declare-fun m!972545 () Bool)

(assert (=> b!1051511 m!972545))

(declare-fun m!972547 () Bool)

(assert (=> b!1051501 m!972547))

(declare-fun m!972549 () Bool)

(assert (=> b!1051510 m!972549))

(declare-fun m!972551 () Bool)

(assert (=> b!1051505 m!972551))

(declare-fun m!972553 () Bool)

(assert (=> b!1051512 m!972553))

(declare-fun m!972555 () Bool)

(assert (=> b!1051512 m!972555))

(declare-fun m!972557 () Bool)

(assert (=> b!1051512 m!972557))

(declare-fun m!972559 () Bool)

(assert (=> b!1051512 m!972559))

(declare-fun m!972561 () Bool)

(assert (=> b!1051508 m!972561))

(declare-fun m!972563 () Bool)

(assert (=> b!1051504 m!972563))

(check-sat (not b!1051510) (not b!1051503) (not b!1051508) (not b!1051512) (not b!1051504) (not b!1051502) (not b!1051501) (not b!1051506) (not start!92604) (not b!1051505))
(check-sat)
