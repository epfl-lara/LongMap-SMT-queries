; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92524 () Bool)

(assert start!92524)

(declare-fun b!1052374 () Bool)

(declare-fun e!597486 () Bool)

(declare-fun e!597481 () Bool)

(assert (=> b!1052374 (= e!597486 e!597481)))

(declare-fun res!701499 () Bool)

(assert (=> b!1052374 (=> (not res!701499) (not e!597481))))

(declare-datatypes ((array!66325 0))(
  ( (array!66326 (arr!31902 (Array (_ BitVec 32) (_ BitVec 64))) (size!32438 (_ BitVec 32))) )
))
(declare-fun lt!464728 () array!66325)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052374 (= res!701499 (arrayContainsKey!0 lt!464728 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66325)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052374 (= lt!464728 (array!66326 (store (arr!31902 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32438 a!3488)))))

(declare-fun b!1052375 () Bool)

(declare-fun res!701502 () Bool)

(declare-fun e!597480 () Bool)

(assert (=> b!1052375 (=> res!701502 e!597480)))

(declare-datatypes ((List!22214 0))(
  ( (Nil!22211) (Cons!22210 (h!23419 (_ BitVec 64)) (t!31521 List!22214)) )
))
(declare-fun noDuplicate!1541 (List!22214) Bool)

(assert (=> b!1052375 (= res!701502 (not (noDuplicate!1541 Nil!22211)))))

(declare-fun b!1052376 () Bool)

(assert (=> b!1052376 (= e!597480 true)))

(declare-fun lt!464727 () Bool)

(declare-fun contains!6156 (List!22214 (_ BitVec 64)) Bool)

(assert (=> b!1052376 (= lt!464727 (contains!6156 Nil!22211 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!597482 () Bool)

(declare-fun b!1052377 () Bool)

(assert (=> b!1052377 (= e!597482 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052378 () Bool)

(declare-fun res!701501 () Bool)

(assert (=> b!1052378 (=> (not res!701501) (not e!597486))))

(assert (=> b!1052378 (= res!701501 (= (select (arr!31902 a!3488) i!1381) k!2747))))

(declare-fun b!1052379 () Bool)

(declare-fun res!701505 () Bool)

(assert (=> b!1052379 (=> (not res!701505) (not e!597486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052379 (= res!701505 (validKeyInArray!0 k!2747))))

(declare-fun b!1052380 () Bool)

(declare-fun e!597483 () Bool)

(assert (=> b!1052380 (= e!597483 e!597480)))

(declare-fun res!701500 () Bool)

(assert (=> b!1052380 (=> res!701500 e!597480)))

(declare-fun lt!464730 () (_ BitVec 32))

(declare-fun lt!464729 () (_ BitVec 32))

(assert (=> b!1052380 (= res!701500 (or (bvslt lt!464729 #b00000000000000000000000000000000) (bvsge lt!464730 (size!32438 a!3488)) (bvsge lt!464729 (size!32438 a!3488))))))

(assert (=> b!1052380 (arrayContainsKey!0 a!3488 k!2747 lt!464730)))

(declare-datatypes ((Unit!34476 0))(
  ( (Unit!34477) )
))
(declare-fun lt!464725 () Unit!34476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34476)

(assert (=> b!1052380 (= lt!464725 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464730))))

(assert (=> b!1052380 (= lt!464730 (bvadd #b00000000000000000000000000000001 lt!464729))))

(declare-fun arrayNoDuplicates!0 (array!66325 (_ BitVec 32) List!22214) Bool)

(assert (=> b!1052380 (arrayNoDuplicates!0 a!3488 lt!464729 Nil!22211)))

(declare-fun lt!464726 () Unit!34476)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66325 (_ BitVec 32) (_ BitVec 32)) Unit!34476)

(assert (=> b!1052380 (= lt!464726 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464729))))

(declare-fun b!1052381 () Bool)

(declare-fun e!597485 () Bool)

(assert (=> b!1052381 (= e!597485 e!597482)))

(declare-fun res!701510 () Bool)

(assert (=> b!1052381 (=> res!701510 e!597482)))

(assert (=> b!1052381 (= res!701510 (or (bvsgt lt!464729 i!1381) (bvsle i!1381 lt!464729)))))

(declare-fun b!1052382 () Bool)

(declare-fun res!701503 () Bool)

(assert (=> b!1052382 (=> (not res!701503) (not e!597486))))

(assert (=> b!1052382 (= res!701503 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22211))))

(declare-fun b!1052383 () Bool)

(declare-fun res!701507 () Bool)

(assert (=> b!1052383 (=> res!701507 e!597480)))

(assert (=> b!1052383 (= res!701507 (contains!6156 Nil!22211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052384 () Bool)

(declare-fun e!597484 () Bool)

(assert (=> b!1052384 (= e!597484 (not e!597483))))

(declare-fun res!701506 () Bool)

(assert (=> b!1052384 (=> res!701506 e!597483)))

(assert (=> b!1052384 (= res!701506 (or (bvsgt lt!464729 i!1381) (bvsle i!1381 lt!464729)))))

(assert (=> b!1052384 e!597485))

(declare-fun res!701504 () Bool)

(assert (=> b!1052384 (=> (not res!701504) (not e!597485))))

(assert (=> b!1052384 (= res!701504 (= (select (store (arr!31902 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464729) k!2747))))

(declare-fun res!701508 () Bool)

(assert (=> start!92524 (=> (not res!701508) (not e!597486))))

(assert (=> start!92524 (= res!701508 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32438 a!3488)) (bvslt (size!32438 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92524 e!597486))

(assert (=> start!92524 true))

(declare-fun array_inv!24682 (array!66325) Bool)

(assert (=> start!92524 (array_inv!24682 a!3488)))

(declare-fun b!1052373 () Bool)

(assert (=> b!1052373 (= e!597481 e!597484)))

(declare-fun res!701509 () Bool)

(assert (=> b!1052373 (=> (not res!701509) (not e!597484))))

(assert (=> b!1052373 (= res!701509 (not (= lt!464729 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66325 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052373 (= lt!464729 (arrayScanForKey!0 lt!464728 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92524 res!701508) b!1052382))

(assert (= (and b!1052382 res!701503) b!1052379))

(assert (= (and b!1052379 res!701505) b!1052378))

(assert (= (and b!1052378 res!701501) b!1052374))

(assert (= (and b!1052374 res!701499) b!1052373))

(assert (= (and b!1052373 res!701509) b!1052384))

(assert (= (and b!1052384 res!701504) b!1052381))

(assert (= (and b!1052381 (not res!701510)) b!1052377))

(assert (= (and b!1052384 (not res!701506)) b!1052380))

(assert (= (and b!1052380 (not res!701500)) b!1052375))

(assert (= (and b!1052375 (not res!701502)) b!1052383))

(assert (= (and b!1052383 (not res!701507)) b!1052376))

(declare-fun m!972759 () Bool)

(assert (=> b!1052383 m!972759))

(declare-fun m!972761 () Bool)

(assert (=> b!1052376 m!972761))

(declare-fun m!972763 () Bool)

(assert (=> b!1052377 m!972763))

(declare-fun m!972765 () Bool)

(assert (=> b!1052384 m!972765))

(declare-fun m!972767 () Bool)

(assert (=> b!1052384 m!972767))

(declare-fun m!972769 () Bool)

(assert (=> b!1052374 m!972769))

(assert (=> b!1052374 m!972765))

(declare-fun m!972771 () Bool)

(assert (=> b!1052378 m!972771))

(declare-fun m!972773 () Bool)

(assert (=> b!1052380 m!972773))

(declare-fun m!972775 () Bool)

(assert (=> b!1052380 m!972775))

(declare-fun m!972777 () Bool)

(assert (=> b!1052380 m!972777))

(declare-fun m!972779 () Bool)

(assert (=> b!1052380 m!972779))

(declare-fun m!972781 () Bool)

(assert (=> b!1052373 m!972781))

(declare-fun m!972783 () Bool)

(assert (=> b!1052382 m!972783))

(declare-fun m!972785 () Bool)

(assert (=> start!92524 m!972785))

(declare-fun m!972787 () Bool)

(assert (=> b!1052375 m!972787))

(declare-fun m!972789 () Bool)

(assert (=> b!1052379 m!972789))

(push 1)

