; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92346 () Bool)

(assert start!92346)

(declare-fun e!595630 () Bool)

(declare-datatypes ((array!66147 0))(
  ( (array!66148 (arr!31813 (Array (_ BitVec 32) (_ BitVec 64))) (size!32349 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66147)

(declare-fun b!1049754 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun lt!463644 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049754 (= e!595630 (arrayContainsKey!0 a!3488 k!2747 lt!463644))))

(declare-fun b!1049755 () Bool)

(declare-fun e!595626 () Bool)

(declare-fun e!595629 () Bool)

(assert (=> b!1049755 (= e!595626 e!595629)))

(declare-fun res!698887 () Bool)

(assert (=> b!1049755 (=> res!698887 e!595629)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049755 (= res!698887 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32349 a!3488)))))

(assert (=> b!1049755 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34346 0))(
  ( (Unit!34347) )
))
(declare-fun lt!463643 () Unit!34346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34346)

(assert (=> b!1049755 (= lt!463643 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463644 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22125 0))(
  ( (Nil!22122) (Cons!22121 (h!23330 (_ BitVec 64)) (t!31432 List!22125)) )
))
(declare-fun arrayNoDuplicates!0 (array!66147 (_ BitVec 32) List!22125) Bool)

(assert (=> b!1049755 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22122)))

(declare-fun lt!463645 () Unit!34346)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66147 (_ BitVec 32) (_ BitVec 32)) Unit!34346)

(assert (=> b!1049755 (= lt!463645 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049756 () Bool)

(declare-fun res!698880 () Bool)

(assert (=> b!1049756 (=> res!698880 e!595629)))

(declare-fun contains!6118 (List!22125 (_ BitVec 64)) Bool)

(assert (=> b!1049756 (= res!698880 (contains!6118 Nil!22122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049757 () Bool)

(declare-fun e!595625 () Bool)

(assert (=> b!1049757 (= e!595625 e!595630)))

(declare-fun res!698884 () Bool)

(assert (=> b!1049757 (=> res!698884 e!595630)))

(assert (=> b!1049757 (= res!698884 (bvsle lt!463644 i!1381))))

(declare-fun b!1049758 () Bool)

(assert (=> b!1049758 (= e!595629 true)))

(declare-fun lt!463647 () Bool)

(assert (=> b!1049758 (= lt!463647 (contains!6118 Nil!22122 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049760 () Bool)

(declare-fun e!595624 () Bool)

(assert (=> b!1049760 (= e!595624 (not e!595626))))

(declare-fun res!698888 () Bool)

(assert (=> b!1049760 (=> res!698888 e!595626)))

(assert (=> b!1049760 (= res!698888 (bvsle lt!463644 i!1381))))

(assert (=> b!1049760 e!595625))

(declare-fun res!698890 () Bool)

(assert (=> b!1049760 (=> (not res!698890) (not e!595625))))

(assert (=> b!1049760 (= res!698890 (= (select (store (arr!31813 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463644) k!2747))))

(declare-fun b!1049761 () Bool)

(declare-fun e!595628 () Bool)

(declare-fun e!595627 () Bool)

(assert (=> b!1049761 (= e!595628 e!595627)))

(declare-fun res!698889 () Bool)

(assert (=> b!1049761 (=> (not res!698889) (not e!595627))))

(declare-fun lt!463646 () array!66147)

(assert (=> b!1049761 (= res!698889 (arrayContainsKey!0 lt!463646 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049761 (= lt!463646 (array!66148 (store (arr!31813 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32349 a!3488)))))

(declare-fun b!1049762 () Bool)

(declare-fun res!698883 () Bool)

(assert (=> b!1049762 (=> (not res!698883) (not e!595628))))

(assert (=> b!1049762 (= res!698883 (= (select (arr!31813 a!3488) i!1381) k!2747))))

(declare-fun b!1049763 () Bool)

(declare-fun res!698881 () Bool)

(assert (=> b!1049763 (=> (not res!698881) (not e!595628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049763 (= res!698881 (validKeyInArray!0 k!2747))))

(declare-fun res!698886 () Bool)

(assert (=> start!92346 (=> (not res!698886) (not e!595628))))

(assert (=> start!92346 (= res!698886 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32349 a!3488)) (bvslt (size!32349 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92346 e!595628))

(assert (=> start!92346 true))

(declare-fun array_inv!24593 (array!66147) Bool)

(assert (=> start!92346 (array_inv!24593 a!3488)))

(declare-fun b!1049759 () Bool)

(assert (=> b!1049759 (= e!595627 e!595624)))

(declare-fun res!698882 () Bool)

(assert (=> b!1049759 (=> (not res!698882) (not e!595624))))

(assert (=> b!1049759 (= res!698882 (not (= lt!463644 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66147 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049759 (= lt!463644 (arrayScanForKey!0 lt!463646 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049764 () Bool)

(declare-fun res!698891 () Bool)

(assert (=> b!1049764 (=> (not res!698891) (not e!595628))))

(assert (=> b!1049764 (= res!698891 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22122))))

(declare-fun b!1049765 () Bool)

(declare-fun res!698885 () Bool)

(assert (=> b!1049765 (=> res!698885 e!595629)))

(declare-fun noDuplicate!1503 (List!22125) Bool)

(assert (=> b!1049765 (= res!698885 (not (noDuplicate!1503 Nil!22122)))))

(assert (= (and start!92346 res!698886) b!1049764))

(assert (= (and b!1049764 res!698891) b!1049763))

(assert (= (and b!1049763 res!698881) b!1049762))

(assert (= (and b!1049762 res!698883) b!1049761))

(assert (= (and b!1049761 res!698889) b!1049759))

(assert (= (and b!1049759 res!698882) b!1049760))

(assert (= (and b!1049760 res!698890) b!1049757))

(assert (= (and b!1049757 (not res!698884)) b!1049754))

(assert (= (and b!1049760 (not res!698888)) b!1049755))

(assert (= (and b!1049755 (not res!698887)) b!1049765))

(assert (= (and b!1049765 (not res!698885)) b!1049756))

(assert (= (and b!1049756 (not res!698880)) b!1049758))

(declare-fun m!970481 () Bool)

(assert (=> b!1049754 m!970481))

(declare-fun m!970483 () Bool)

(assert (=> start!92346 m!970483))

(declare-fun m!970485 () Bool)

(assert (=> b!1049759 m!970485))

(declare-fun m!970487 () Bool)

(assert (=> b!1049765 m!970487))

(declare-fun m!970489 () Bool)

(assert (=> b!1049763 m!970489))

(declare-fun m!970491 () Bool)

(assert (=> b!1049762 m!970491))

(declare-fun m!970493 () Bool)

(assert (=> b!1049764 m!970493))

(declare-fun m!970495 () Bool)

(assert (=> b!1049756 m!970495))

(declare-fun m!970497 () Bool)

(assert (=> b!1049755 m!970497))

(declare-fun m!970499 () Bool)

(assert (=> b!1049755 m!970499))

(declare-fun m!970501 () Bool)

(assert (=> b!1049755 m!970501))

(declare-fun m!970503 () Bool)

(assert (=> b!1049755 m!970503))

(declare-fun m!970505 () Bool)

(assert (=> b!1049761 m!970505))

(declare-fun m!970507 () Bool)

(assert (=> b!1049761 m!970507))

(assert (=> b!1049760 m!970507))

(declare-fun m!970509 () Bool)

(assert (=> b!1049760 m!970509))

(declare-fun m!970511 () Bool)

(assert (=> b!1049758 m!970511))

(push 1)

(assert (not b!1049764))

(assert (not b!1049765))

(assert (not b!1049763))

(assert (not b!1049761))

(assert (not start!92346))

(assert (not b!1049756))

(assert (not b!1049758))

(assert (not b!1049754))

(assert (not b!1049759))

(assert (not b!1049755))

(check-sat)

(pop 1)

