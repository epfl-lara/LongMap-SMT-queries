; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92530 () Bool)

(assert start!92530)

(declare-fun b!1052481 () Bool)

(declare-fun e!597556 () Bool)

(declare-fun e!597552 () Bool)

(assert (=> b!1052481 (= e!597556 e!597552)))

(declare-fun res!701612 () Bool)

(assert (=> b!1052481 (=> res!701612 e!597552)))

(declare-fun lt!464781 () (_ BitVec 32))

(declare-datatypes ((array!66331 0))(
  ( (array!66332 (arr!31905 (Array (_ BitVec 32) (_ BitVec 64))) (size!32441 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66331)

(declare-fun lt!464779 () (_ BitVec 32))

(assert (=> b!1052481 (= res!701612 (or (bvslt lt!464781 #b00000000000000000000000000000000) (bvsge lt!464779 (size!32441 a!3488)) (bvsge lt!464781 (size!32441 a!3488))))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052481 (arrayContainsKey!0 a!3488 k!2747 lt!464779)))

(declare-datatypes ((Unit!34482 0))(
  ( (Unit!34483) )
))
(declare-fun lt!464783 () Unit!34482)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66331 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34482)

(assert (=> b!1052481 (= lt!464783 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464779))))

(assert (=> b!1052481 (= lt!464779 (bvadd #b00000000000000000000000000000001 lt!464781))))

(declare-datatypes ((List!22217 0))(
  ( (Nil!22214) (Cons!22213 (h!23422 (_ BitVec 64)) (t!31524 List!22217)) )
))
(declare-fun arrayNoDuplicates!0 (array!66331 (_ BitVec 32) List!22217) Bool)

(assert (=> b!1052481 (arrayNoDuplicates!0 a!3488 lt!464781 Nil!22214)))

(declare-fun lt!464784 () Unit!34482)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66331 (_ BitVec 32) (_ BitVec 32)) Unit!34482)

(assert (=> b!1052481 (= lt!464784 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464781))))

(declare-fun b!1052482 () Bool)

(declare-fun res!701613 () Bool)

(assert (=> b!1052482 (=> res!701613 e!597552)))

(declare-fun contains!6159 (List!22217 (_ BitVec 64)) Bool)

(assert (=> b!1052482 (= res!701613 (contains!6159 Nil!22214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1052483 () Bool)

(declare-fun e!597554 () Bool)

(assert (=> b!1052483 (= e!597554 (not e!597556))))

(declare-fun res!701610 () Bool)

(assert (=> b!1052483 (=> res!701610 e!597556)))

(assert (=> b!1052483 (= res!701610 (or (bvsgt lt!464781 i!1381) (bvsle i!1381 lt!464781)))))

(declare-fun e!597559 () Bool)

(assert (=> b!1052483 e!597559))

(declare-fun res!701607 () Bool)

(assert (=> b!1052483 (=> (not res!701607) (not e!597559))))

(assert (=> b!1052483 (= res!701607 (= (select (store (arr!31905 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464781) k!2747))))

(declare-fun b!1052484 () Bool)

(declare-fun e!597558 () Bool)

(declare-fun e!597555 () Bool)

(assert (=> b!1052484 (= e!597558 e!597555)))

(declare-fun res!701611 () Bool)

(assert (=> b!1052484 (=> (not res!701611) (not e!597555))))

(declare-fun lt!464780 () array!66331)

(assert (=> b!1052484 (= res!701611 (arrayContainsKey!0 lt!464780 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052484 (= lt!464780 (array!66332 (store (arr!31905 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32441 a!3488)))))

(declare-fun b!1052486 () Bool)

(assert (=> b!1052486 (= e!597555 e!597554)))

(declare-fun res!701616 () Bool)

(assert (=> b!1052486 (=> (not res!701616) (not e!597554))))

(assert (=> b!1052486 (= res!701616 (not (= lt!464781 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66331 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052486 (= lt!464781 (arrayScanForKey!0 lt!464780 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052487 () Bool)

(declare-fun res!701614 () Bool)

(assert (=> b!1052487 (=> res!701614 e!597552)))

(declare-fun noDuplicate!1544 (List!22217) Bool)

(assert (=> b!1052487 (= res!701614 (not (noDuplicate!1544 Nil!22214)))))

(declare-fun b!1052488 () Bool)

(assert (=> b!1052488 (= e!597552 true)))

(declare-fun lt!464782 () Bool)

(assert (=> b!1052488 (= lt!464782 (contains!6159 Nil!22214 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!597557 () Bool)

(declare-fun b!1052489 () Bool)

(assert (=> b!1052489 (= e!597557 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052490 () Bool)

(declare-fun res!701617 () Bool)

(assert (=> b!1052490 (=> (not res!701617) (not e!597558))))

(assert (=> b!1052490 (= res!701617 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22214))))

(declare-fun b!1052485 () Bool)

(declare-fun res!701609 () Bool)

(assert (=> b!1052485 (=> (not res!701609) (not e!597558))))

(assert (=> b!1052485 (= res!701609 (= (select (arr!31905 a!3488) i!1381) k!2747))))

(declare-fun res!701618 () Bool)

(assert (=> start!92530 (=> (not res!701618) (not e!597558))))

(assert (=> start!92530 (= res!701618 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32441 a!3488)) (bvslt (size!32441 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92530 e!597558))

(assert (=> start!92530 true))

(declare-fun array_inv!24685 (array!66331) Bool)

(assert (=> start!92530 (array_inv!24685 a!3488)))

(declare-fun b!1052491 () Bool)

(declare-fun res!701608 () Bool)

(assert (=> b!1052491 (=> (not res!701608) (not e!597558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052491 (= res!701608 (validKeyInArray!0 k!2747))))

(declare-fun b!1052492 () Bool)

(assert (=> b!1052492 (= e!597559 e!597557)))

(declare-fun res!701615 () Bool)

(assert (=> b!1052492 (=> res!701615 e!597557)))

(assert (=> b!1052492 (= res!701615 (or (bvsgt lt!464781 i!1381) (bvsle i!1381 lt!464781)))))

(assert (= (and start!92530 res!701618) b!1052490))

(assert (= (and b!1052490 res!701617) b!1052491))

(assert (= (and b!1052491 res!701608) b!1052485))

(assert (= (and b!1052485 res!701609) b!1052484))

(assert (= (and b!1052484 res!701611) b!1052486))

(assert (= (and b!1052486 res!701616) b!1052483))

(assert (= (and b!1052483 res!701607) b!1052492))

(assert (= (and b!1052492 (not res!701615)) b!1052489))

(assert (= (and b!1052483 (not res!701610)) b!1052481))

(assert (= (and b!1052481 (not res!701612)) b!1052487))

(assert (= (and b!1052487 (not res!701614)) b!1052482))

(assert (= (and b!1052482 (not res!701613)) b!1052488))

(declare-fun m!972855 () Bool)

(assert (=> b!1052488 m!972855))

(declare-fun m!972857 () Bool)

(assert (=> b!1052483 m!972857))

(declare-fun m!972859 () Bool)

(assert (=> b!1052483 m!972859))

(declare-fun m!972861 () Bool)

(assert (=> b!1052486 m!972861))

(declare-fun m!972863 () Bool)

(assert (=> b!1052487 m!972863))

(declare-fun m!972865 () Bool)

(assert (=> b!1052490 m!972865))

(declare-fun m!972867 () Bool)

(assert (=> b!1052491 m!972867))

(declare-fun m!972869 () Bool)

(assert (=> b!1052489 m!972869))

(declare-fun m!972871 () Bool)

(assert (=> b!1052481 m!972871))

(declare-fun m!972873 () Bool)

(assert (=> b!1052481 m!972873))

(declare-fun m!972875 () Bool)

(assert (=> b!1052481 m!972875))

(declare-fun m!972877 () Bool)

(assert (=> b!1052481 m!972877))

(declare-fun m!972879 () Bool)

(assert (=> start!92530 m!972879))

(declare-fun m!972881 () Bool)

(assert (=> b!1052482 m!972881))

(declare-fun m!972883 () Bool)

(assert (=> b!1052485 m!972883))

(declare-fun m!972885 () Bool)

(assert (=> b!1052484 m!972885))

(assert (=> b!1052484 m!972857))

(push 1)

(assert (not b!1052484))

(assert (not b!1052488))

(assert (not b!1052482))

(assert (not b!1052489))

(assert (not b!1052481))

(assert (not b!1052490))

(assert (not b!1052486))

(assert (not b!1052487))

(assert (not start!92530))

(assert (not b!1052491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

