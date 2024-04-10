; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93316 () Bool)

(assert start!93316)

(declare-fun b!1057733 () Bool)

(declare-fun e!601609 () Bool)

(declare-fun e!601610 () Bool)

(assert (=> b!1057733 (= e!601609 e!601610)))

(declare-fun res!706399 () Bool)

(assert (=> b!1057733 (=> (not res!706399) (not e!601610))))

(declare-fun lt!466603 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057733 (= res!706399 (not (= lt!466603 i!1381)))))

(declare-datatypes ((array!66715 0))(
  ( (array!66716 (arr!32079 (Array (_ BitVec 32) (_ BitVec 64))) (size!32615 (_ BitVec 32))) )
))
(declare-fun lt!466601 () array!66715)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66715 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057733 (= lt!466603 (arrayScanForKey!0 lt!466601 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057734 () Bool)

(declare-fun e!601605 () Bool)

(assert (=> b!1057734 (= e!601605 e!601609)))

(declare-fun res!706393 () Bool)

(assert (=> b!1057734 (=> (not res!706393) (not e!601609))))

(declare-fun arrayContainsKey!0 (array!66715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057734 (= res!706393 (arrayContainsKey!0 lt!466601 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66715)

(assert (=> b!1057734 (= lt!466601 (array!66716 (store (arr!32079 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32615 a!3488)))))

(declare-fun b!1057735 () Bool)

(declare-fun e!601606 () Bool)

(declare-datatypes ((List!22391 0))(
  ( (Nil!22388) (Cons!22387 (h!23596 (_ BitVec 64)) (t!31698 List!22391)) )
))
(declare-fun noDuplicate!1559 (List!22391) Bool)

(assert (=> b!1057735 (= e!601606 (noDuplicate!1559 Nil!22388))))

(declare-fun b!1057736 () Bool)

(declare-fun e!601608 () Bool)

(assert (=> b!1057736 (= e!601608 e!601606)))

(declare-fun res!706398 () Bool)

(assert (=> b!1057736 (=> res!706398 e!601606)))

(declare-fun lt!466605 () (_ BitVec 32))

(assert (=> b!1057736 (= res!706398 (or (bvslt lt!466603 #b00000000000000000000000000000000) (bvsge lt!466605 (size!32615 a!3488)) (bvsge lt!466603 (size!32615 a!3488))))))

(assert (=> b!1057736 (arrayContainsKey!0 a!3488 k!2747 lt!466605)))

(declare-datatypes ((Unit!34680 0))(
  ( (Unit!34681) )
))
(declare-fun lt!466604 () Unit!34680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66715 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34680)

(assert (=> b!1057736 (= lt!466604 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466605))))

(assert (=> b!1057736 (= lt!466605 (bvadd #b00000000000000000000000000000001 lt!466603))))

(declare-fun arrayNoDuplicates!0 (array!66715 (_ BitVec 32) List!22391) Bool)

(assert (=> b!1057736 (arrayNoDuplicates!0 a!3488 lt!466603 Nil!22388)))

(declare-fun lt!466602 () Unit!34680)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66715 (_ BitVec 32) (_ BitVec 32)) Unit!34680)

(assert (=> b!1057736 (= lt!466602 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466603))))

(declare-fun b!1057737 () Bool)

(declare-fun res!706391 () Bool)

(assert (=> b!1057737 (=> (not res!706391) (not e!601605))))

(assert (=> b!1057737 (= res!706391 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22388))))

(declare-fun b!1057739 () Bool)

(assert (=> b!1057739 (= e!601610 (not e!601608))))

(declare-fun res!706392 () Bool)

(assert (=> b!1057739 (=> res!706392 e!601608)))

(assert (=> b!1057739 (= res!706392 (or (bvsgt lt!466603 i!1381) (bvsle i!1381 lt!466603)))))

(declare-fun e!601611 () Bool)

(assert (=> b!1057739 e!601611))

(declare-fun res!706400 () Bool)

(assert (=> b!1057739 (=> (not res!706400) (not e!601611))))

(assert (=> b!1057739 (= res!706400 (= (select (store (arr!32079 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466603) k!2747))))

(declare-fun b!1057740 () Bool)

(declare-fun res!706397 () Bool)

(assert (=> b!1057740 (=> (not res!706397) (not e!601605))))

(assert (=> b!1057740 (= res!706397 (= (select (arr!32079 a!3488) i!1381) k!2747))))

(declare-fun e!601612 () Bool)

(declare-fun b!1057741 () Bool)

(assert (=> b!1057741 (= e!601612 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057742 () Bool)

(assert (=> b!1057742 (= e!601611 e!601612)))

(declare-fun res!706396 () Bool)

(assert (=> b!1057742 (=> res!706396 e!601612)))

(assert (=> b!1057742 (= res!706396 (or (bvsgt lt!466603 i!1381) (bvsle i!1381 lt!466603)))))

(declare-fun res!706394 () Bool)

(assert (=> start!93316 (=> (not res!706394) (not e!601605))))

(assert (=> start!93316 (= res!706394 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32615 a!3488)) (bvslt (size!32615 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93316 e!601605))

(assert (=> start!93316 true))

(declare-fun array_inv!24859 (array!66715) Bool)

(assert (=> start!93316 (array_inv!24859 a!3488)))

(declare-fun b!1057738 () Bool)

(declare-fun res!706395 () Bool)

(assert (=> b!1057738 (=> (not res!706395) (not e!601605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057738 (= res!706395 (validKeyInArray!0 k!2747))))

(assert (= (and start!93316 res!706394) b!1057737))

(assert (= (and b!1057737 res!706391) b!1057738))

(assert (= (and b!1057738 res!706395) b!1057740))

(assert (= (and b!1057740 res!706397) b!1057734))

(assert (= (and b!1057734 res!706393) b!1057733))

(assert (= (and b!1057733 res!706399) b!1057739))

(assert (= (and b!1057739 res!706400) b!1057742))

(assert (= (and b!1057742 (not res!706396)) b!1057741))

(assert (= (and b!1057739 (not res!706392)) b!1057736))

(assert (= (and b!1057736 (not res!706398)) b!1057735))

(declare-fun m!977413 () Bool)

(assert (=> b!1057734 m!977413))

(declare-fun m!977415 () Bool)

(assert (=> b!1057734 m!977415))

(declare-fun m!977417 () Bool)

(assert (=> b!1057741 m!977417))

(declare-fun m!977419 () Bool)

(assert (=> b!1057733 m!977419))

(declare-fun m!977421 () Bool)

(assert (=> b!1057735 m!977421))

(declare-fun m!977423 () Bool)

(assert (=> b!1057737 m!977423))

(assert (=> b!1057739 m!977415))

(declare-fun m!977425 () Bool)

(assert (=> b!1057739 m!977425))

(declare-fun m!977427 () Bool)

(assert (=> b!1057740 m!977427))

(declare-fun m!977429 () Bool)

(assert (=> b!1057736 m!977429))

(declare-fun m!977431 () Bool)

(assert (=> b!1057736 m!977431))

(declare-fun m!977433 () Bool)

(assert (=> b!1057736 m!977433))

(declare-fun m!977435 () Bool)

(assert (=> b!1057736 m!977435))

(declare-fun m!977437 () Bool)

(assert (=> b!1057738 m!977437))

(declare-fun m!977439 () Bool)

(assert (=> start!93316 m!977439))

(push 1)

(assert (not b!1057734))

(assert (not b!1057733))

(assert (not b!1057735))

(assert (not b!1057741))

(assert (not b!1057738))

(assert (not b!1057737))

(assert (not start!93316))

(assert (not b!1057736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128469 () Bool)

(declare-fun res!706430 () Bool)

(declare-fun e!601651 () Bool)

(assert (=> d!128469 (=> res!706430 e!601651)))

(assert (=> d!128469 (= res!706430 (= (select (arr!32079 lt!466601) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128469 (= (arrayContainsKey!0 lt!466601 k!2747 #b00000000000000000000000000000000) e!601651)))

(declare-fun b!1057790 () Bool)

(declare-fun e!601652 () Bool)

(assert (=> b!1057790 (= e!601651 e!601652)))

(declare-fun res!706431 () Bool)

(assert (=> b!1057790 (=> (not res!706431) (not e!601652))))

(assert (=> b!1057790 (= res!706431 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32615 lt!466601)))))

(declare-fun b!1057791 () Bool)

(assert (=> b!1057791 (= e!601652 (arrayContainsKey!0 lt!466601 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128469 (not res!706430)) b!1057790))

(assert (= (and b!1057790 res!706431) b!1057791))

(declare-fun m!977473 () Bool)

(assert (=> d!128469 m!977473))

(declare-fun m!977475 () Bool)

(assert (=> b!1057791 m!977475))

(assert (=> b!1057734 d!128469))

(declare-fun d!128475 () Bool)

(assert (=> d!128475 (= (array_inv!24859 a!3488) (bvsge (size!32615 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93316 d!128475))

(declare-fun d!128477 () Bool)

(declare-fun res!706434 () Bool)

(declare-fun e!601655 () Bool)

(assert (=> d!128477 (=> res!706434 e!601655)))

(assert (=> d!128477 (= res!706434 (= (select (arr!32079 a!3488) lt!466605) k!2747))))

(assert (=> d!128477 (= (arrayContainsKey!0 a!3488 k!2747 lt!466605) e!601655)))

(declare-fun b!1057794 () Bool)

(declare-fun e!601656 () Bool)

(assert (=> b!1057794 (= e!601655 e!601656)))

(declare-fun res!706435 () Bool)

(assert (=> b!1057794 (=> (not res!706435) (not e!601656))))

(assert (=> b!1057794 (= res!706435 (bvslt (bvadd lt!466605 #b00000000000000000000000000000001) (size!32615 a!3488)))))

(declare-fun b!1057795 () Bool)

(assert (=> b!1057795 (= e!601656 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!466605 #b00000000000000000000000000000001)))))

(assert (= (and d!128477 (not res!706434)) b!1057794))

(assert (= (and b!1057794 res!706435) b!1057795))

(declare-fun m!977481 () Bool)

(assert (=> d!128477 m!977481))

(declare-fun m!977483 () Bool)

(assert (=> b!1057795 m!977483))

(assert (=> b!1057736 d!128477))

(declare-fun d!128481 () Bool)

(assert (=> d!128481 (arrayContainsKey!0 a!3488 k!2747 lt!466605)))

(declare-fun lt!466623 () Unit!34680)

(declare-fun choose!114 (array!66715 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34680)

(assert (=> d!128481 (= lt!466623 (choose!114 a!3488 k!2747 i!1381 lt!466605))))

(assert (=> d!128481 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128481 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466605) lt!466623)))

(declare-fun bs!31021 () Bool)

(assert (= bs!31021 d!128481))

(assert (=> bs!31021 m!977429))

(declare-fun m!977497 () Bool)

(assert (=> bs!31021 m!977497))

(assert (=> b!1057736 d!128481))

(declare-fun b!1057830 () Bool)

(declare-fun e!601688 () Bool)

(declare-fun call!44858 () Bool)

(assert (=> b!1057830 (= e!601688 call!44858)))

(declare-fun b!1057831 () Bool)

(assert (=> b!1057831 (= e!601688 call!44858)))

(declare-fun b!1057832 () Bool)

(declare-fun e!601686 () Bool)

(declare-fun e!601687 () Bool)

(assert (=> b!1057832 (= e!601686 e!601687)))

(declare-fun res!706458 () Bool)

(assert (=> b!1057832 (=> (not res!706458) (not e!601687))))

(declare-fun e!601685 () Bool)

(assert (=> b!1057832 (= res!706458 (not e!601685))))

(declare-fun res!706459 () Bool)

(assert (=> b!1057832 (=> (not res!706459) (not e!601685))))

(assert (=> b!1057832 (= res!706459 (validKeyInArray!0 (select (arr!32079 a!3488) lt!466603)))))

(declare-fun b!1057833 () Bool)

(declare-fun contains!6203 (List!22391 (_ BitVec 64)) Bool)

(assert (=> b!1057833 (= e!601685 (contains!6203 Nil!22388 (select (arr!32079 a!3488) lt!466603)))))

(declare-fun b!1057834 () Bool)

(assert (=> b!1057834 (= e!601687 e!601688)))

(declare-fun c!107146 () Bool)

(assert (=> b!1057834 (= c!107146 (validKeyInArray!0 (select (arr!32079 a!3488) lt!466603)))))

(declare-fun d!128491 () Bool)

(declare-fun res!706460 () Bool)

(assert (=> d!128491 (=> res!706460 e!601686)))

