; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92852 () Bool)

(assert start!92852)

(declare-fun b!1054473 () Bool)

(declare-fun e!599083 () Bool)

(declare-fun e!599080 () Bool)

(assert (=> b!1054473 (= e!599083 (not e!599080))))

(declare-fun res!703418 () Bool)

(assert (=> b!1054473 (=> res!703418 e!599080)))

(declare-fun lt!465423 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054473 (= res!703418 (bvsle lt!465423 i!1381))))

(declare-fun e!599078 () Bool)

(assert (=> b!1054473 e!599078))

(declare-fun res!703415 () Bool)

(assert (=> b!1054473 (=> (not res!703415) (not e!599078))))

(declare-datatypes ((array!66512 0))(
  ( (array!66513 (arr!31988 (Array (_ BitVec 32) (_ BitVec 64))) (size!32524 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66512)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1054473 (= res!703415 (= (select (store (arr!31988 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465423) k0!2747))))

(declare-fun b!1054474 () Bool)

(declare-fun res!703414 () Bool)

(declare-fun e!599082 () Bool)

(assert (=> b!1054474 (=> (not res!703414) (not e!599082))))

(declare-datatypes ((List!22300 0))(
  ( (Nil!22297) (Cons!22296 (h!23505 (_ BitVec 64)) (t!31607 List!22300)) )
))
(declare-fun arrayNoDuplicates!0 (array!66512 (_ BitVec 32) List!22300) Bool)

(assert (=> b!1054474 (= res!703414 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22297))))

(declare-fun res!703420 () Bool)

(assert (=> start!92852 (=> (not res!703420) (not e!599082))))

(assert (=> start!92852 (= res!703420 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32524 a!3488)) (bvslt (size!32524 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92852 e!599082))

(assert (=> start!92852 true))

(declare-fun array_inv!24768 (array!66512) Bool)

(assert (=> start!92852 (array_inv!24768 a!3488)))

(declare-fun b!1054475 () Bool)

(declare-fun e!599081 () Bool)

(assert (=> b!1054475 (= e!599081 e!599083)))

(declare-fun res!703419 () Bool)

(assert (=> b!1054475 (=> (not res!703419) (not e!599083))))

(assert (=> b!1054475 (= res!703419 (not (= lt!465423 i!1381)))))

(declare-fun lt!465422 () array!66512)

(declare-fun arrayScanForKey!0 (array!66512 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054475 (= lt!465423 (arrayScanForKey!0 lt!465422 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054476 () Bool)

(assert (=> b!1054476 (= e!599080 true)))

(assert (=> b!1054476 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22297)))

(declare-datatypes ((Unit!34534 0))(
  ( (Unit!34535) )
))
(declare-fun lt!465421 () Unit!34534)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66512 (_ BitVec 32) (_ BitVec 32)) Unit!34534)

(assert (=> b!1054476 (= lt!465421 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054477 () Bool)

(declare-fun e!599079 () Bool)

(assert (=> b!1054477 (= e!599078 e!599079)))

(declare-fun res!703421 () Bool)

(assert (=> b!1054477 (=> res!703421 e!599079)))

(assert (=> b!1054477 (= res!703421 (bvsle lt!465423 i!1381))))

(declare-fun b!1054478 () Bool)

(assert (=> b!1054478 (= e!599082 e!599081)))

(declare-fun res!703413 () Bool)

(assert (=> b!1054478 (=> (not res!703413) (not e!599081))))

(declare-fun arrayContainsKey!0 (array!66512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054478 (= res!703413 (arrayContainsKey!0 lt!465422 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054478 (= lt!465422 (array!66513 (store (arr!31988 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32524 a!3488)))))

(declare-fun b!1054479 () Bool)

(assert (=> b!1054479 (= e!599079 (arrayContainsKey!0 a!3488 k0!2747 lt!465423))))

(declare-fun b!1054480 () Bool)

(declare-fun res!703416 () Bool)

(assert (=> b!1054480 (=> (not res!703416) (not e!599082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054480 (= res!703416 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054481 () Bool)

(declare-fun res!703417 () Bool)

(assert (=> b!1054481 (=> (not res!703417) (not e!599082))))

(assert (=> b!1054481 (= res!703417 (= (select (arr!31988 a!3488) i!1381) k0!2747))))

(assert (= (and start!92852 res!703420) b!1054474))

(assert (= (and b!1054474 res!703414) b!1054480))

(assert (= (and b!1054480 res!703416) b!1054481))

(assert (= (and b!1054481 res!703417) b!1054478))

(assert (= (and b!1054478 res!703413) b!1054475))

(assert (= (and b!1054475 res!703419) b!1054473))

(assert (= (and b!1054473 res!703415) b!1054477))

(assert (= (and b!1054477 (not res!703421)) b!1054479))

(assert (= (and b!1054473 (not res!703418)) b!1054476))

(declare-fun m!974535 () Bool)

(assert (=> b!1054479 m!974535))

(declare-fun m!974537 () Bool)

(assert (=> b!1054476 m!974537))

(declare-fun m!974539 () Bool)

(assert (=> b!1054476 m!974539))

(declare-fun m!974541 () Bool)

(assert (=> b!1054480 m!974541))

(declare-fun m!974543 () Bool)

(assert (=> b!1054475 m!974543))

(declare-fun m!974545 () Bool)

(assert (=> b!1054478 m!974545))

(declare-fun m!974547 () Bool)

(assert (=> b!1054478 m!974547))

(declare-fun m!974549 () Bool)

(assert (=> b!1054474 m!974549))

(assert (=> b!1054473 m!974547))

(declare-fun m!974551 () Bool)

(assert (=> b!1054473 m!974551))

(declare-fun m!974553 () Bool)

(assert (=> start!92852 m!974553))

(declare-fun m!974555 () Bool)

(assert (=> b!1054481 m!974555))

(check-sat (not b!1054474) (not b!1054476) (not b!1054479) (not start!92852) (not b!1054475) (not b!1054480) (not b!1054478))
(check-sat)
