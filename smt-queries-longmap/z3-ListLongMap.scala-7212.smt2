; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92332 () Bool)

(assert start!92332)

(declare-fun b!1049387 () Bool)

(declare-fun e!595395 () Bool)

(declare-fun e!595389 () Bool)

(assert (=> b!1049387 (= e!595395 e!595389)))

(declare-fun res!698604 () Bool)

(assert (=> b!1049387 (=> (not res!698604) (not e!595389))))

(declare-fun lt!463353 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049387 (= res!698604 (not (= lt!463353 i!1381)))))

(declare-datatypes ((array!66074 0))(
  ( (array!66075 (arr!31776 (Array (_ BitVec 32) (_ BitVec 64))) (size!32314 (_ BitVec 32))) )
))
(declare-fun lt!463357 () array!66074)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66074 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049387 (= lt!463353 (arrayScanForKey!0 lt!463357 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049388 () Bool)

(declare-fun e!595394 () Bool)

(assert (=> b!1049388 (= e!595394 e!595395)))

(declare-fun res!698599 () Bool)

(assert (=> b!1049388 (=> (not res!698599) (not e!595395))))

(declare-fun arrayContainsKey!0 (array!66074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049388 (= res!698599 (arrayContainsKey!0 lt!463357 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66074)

(assert (=> b!1049388 (= lt!463357 (array!66075 (store (arr!31776 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32314 a!3488)))))

(declare-fun b!1049389 () Bool)

(declare-fun res!698608 () Bool)

(declare-fun e!595393 () Bool)

(assert (=> b!1049389 (=> res!698608 e!595393)))

(declare-datatypes ((List!22147 0))(
  ( (Nil!22144) (Cons!22143 (h!23352 (_ BitVec 64)) (t!31445 List!22147)) )
))
(declare-fun contains!6085 (List!22147 (_ BitVec 64)) Bool)

(assert (=> b!1049389 (= res!698608 (contains!6085 Nil!22144 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!595392 () Bool)

(declare-fun b!1049390 () Bool)

(assert (=> b!1049390 (= e!595392 (arrayContainsKey!0 a!3488 k0!2747 lt!463353))))

(declare-fun b!1049391 () Bool)

(assert (=> b!1049391 (= e!595393 true)))

(declare-fun lt!463356 () Bool)

(assert (=> b!1049391 (= lt!463356 (contains!6085 Nil!22144 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049392 () Bool)

(declare-fun res!698606 () Bool)

(assert (=> b!1049392 (=> (not res!698606) (not e!595394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049392 (= res!698606 (validKeyInArray!0 k0!2747))))

(declare-fun res!698607 () Bool)

(assert (=> start!92332 (=> (not res!698607) (not e!595394))))

(assert (=> start!92332 (= res!698607 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32314 a!3488)) (bvslt (size!32314 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92332 e!595394))

(assert (=> start!92332 true))

(declare-fun array_inv!24559 (array!66074) Bool)

(assert (=> start!92332 (array_inv!24559 a!3488)))

(declare-fun b!1049393 () Bool)

(declare-fun e!595390 () Bool)

(assert (=> b!1049393 (= e!595390 e!595392)))

(declare-fun res!698601 () Bool)

(assert (=> b!1049393 (=> res!698601 e!595392)))

(assert (=> b!1049393 (= res!698601 (bvsle lt!463353 i!1381))))

(declare-fun b!1049394 () Bool)

(declare-fun res!698602 () Bool)

(assert (=> b!1049394 (=> res!698602 e!595393)))

(declare-fun noDuplicate!1510 (List!22147) Bool)

(assert (=> b!1049394 (= res!698602 (not (noDuplicate!1510 Nil!22144)))))

(declare-fun b!1049395 () Bool)

(declare-fun res!698605 () Bool)

(assert (=> b!1049395 (=> (not res!698605) (not e!595394))))

(assert (=> b!1049395 (= res!698605 (= (select (arr!31776 a!3488) i!1381) k0!2747))))

(declare-fun b!1049396 () Bool)

(declare-fun e!595391 () Bool)

(assert (=> b!1049396 (= e!595391 e!595393)))

(declare-fun res!698600 () Bool)

(assert (=> b!1049396 (=> res!698600 e!595393)))

(assert (=> b!1049396 (= res!698600 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32314 a!3488)))))

(assert (=> b!1049396 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34205 0))(
  ( (Unit!34206) )
))
(declare-fun lt!463354 () Unit!34205)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66074 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34205)

(assert (=> b!1049396 (= lt!463354 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463353 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66074 (_ BitVec 32) List!22147) Bool)

(assert (=> b!1049396 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22144)))

(declare-fun lt!463355 () Unit!34205)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66074 (_ BitVec 32) (_ BitVec 32)) Unit!34205)

(assert (=> b!1049396 (= lt!463355 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049397 () Bool)

(declare-fun res!698603 () Bool)

(assert (=> b!1049397 (=> (not res!698603) (not e!595394))))

(assert (=> b!1049397 (= res!698603 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22144))))

(declare-fun b!1049398 () Bool)

(assert (=> b!1049398 (= e!595389 (not e!595391))))

(declare-fun res!698598 () Bool)

(assert (=> b!1049398 (=> res!698598 e!595391)))

(assert (=> b!1049398 (= res!698598 (bvsle lt!463353 i!1381))))

(assert (=> b!1049398 e!595390))

(declare-fun res!698597 () Bool)

(assert (=> b!1049398 (=> (not res!698597) (not e!595390))))

(assert (=> b!1049398 (= res!698597 (= (select (store (arr!31776 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463353) k0!2747))))

(assert (= (and start!92332 res!698607) b!1049397))

(assert (= (and b!1049397 res!698603) b!1049392))

(assert (= (and b!1049392 res!698606) b!1049395))

(assert (= (and b!1049395 res!698605) b!1049388))

(assert (= (and b!1049388 res!698599) b!1049387))

(assert (= (and b!1049387 res!698604) b!1049398))

(assert (= (and b!1049398 res!698597) b!1049393))

(assert (= (and b!1049393 (not res!698601)) b!1049390))

(assert (= (and b!1049398 (not res!698598)) b!1049396))

(assert (= (and b!1049396 (not res!698600)) b!1049394))

(assert (= (and b!1049394 (not res!698602)) b!1049389))

(assert (= (and b!1049389 (not res!698608)) b!1049391))

(declare-fun m!969673 () Bool)

(assert (=> b!1049388 m!969673))

(declare-fun m!969675 () Bool)

(assert (=> b!1049388 m!969675))

(declare-fun m!969677 () Bool)

(assert (=> b!1049390 m!969677))

(assert (=> b!1049398 m!969675))

(declare-fun m!969679 () Bool)

(assert (=> b!1049398 m!969679))

(declare-fun m!969681 () Bool)

(assert (=> b!1049396 m!969681))

(declare-fun m!969683 () Bool)

(assert (=> b!1049396 m!969683))

(declare-fun m!969685 () Bool)

(assert (=> b!1049396 m!969685))

(declare-fun m!969687 () Bool)

(assert (=> b!1049396 m!969687))

(declare-fun m!969689 () Bool)

(assert (=> b!1049397 m!969689))

(declare-fun m!969691 () Bool)

(assert (=> b!1049392 m!969691))

(declare-fun m!969693 () Bool)

(assert (=> b!1049389 m!969693))

(declare-fun m!969695 () Bool)

(assert (=> b!1049394 m!969695))

(declare-fun m!969697 () Bool)

(assert (=> b!1049391 m!969697))

(declare-fun m!969699 () Bool)

(assert (=> start!92332 m!969699))

(declare-fun m!969701 () Bool)

(assert (=> b!1049387 m!969701))

(declare-fun m!969703 () Bool)

(assert (=> b!1049395 m!969703))

(check-sat (not b!1049392) (not b!1049389) (not b!1049391) (not b!1049396) (not start!92332) (not b!1049388) (not b!1049397) (not b!1049390) (not b!1049394) (not b!1049387))
(check-sat)
