; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93360 () Bool)

(assert start!93360)

(declare-fun b!1057652 () Bool)

(declare-fun e!601361 () Bool)

(declare-fun e!601363 () Bool)

(assert (=> b!1057652 (= e!601361 e!601363)))

(declare-fun res!705630 () Bool)

(assert (=> b!1057652 (=> (not res!705630) (not e!601363))))

(declare-datatypes ((array!66673 0))(
  ( (array!66674 (arr!32056 (Array (_ BitVec 32) (_ BitVec 64))) (size!32593 (_ BitVec 32))) )
))
(declare-fun lt!466604 () array!66673)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057652 (= res!705630 (arrayContainsKey!0 lt!466604 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66673)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057652 (= lt!466604 (array!66674 (store (arr!32056 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32593 a!3488)))))

(declare-fun b!1057653 () Bool)

(declare-fun e!601362 () Bool)

(assert (=> b!1057653 (= e!601363 e!601362)))

(declare-fun res!705629 () Bool)

(assert (=> b!1057653 (=> (not res!705629) (not e!601362))))

(declare-fun lt!466603 () (_ BitVec 32))

(assert (=> b!1057653 (= res!705629 (not (= lt!466603 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66673 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057653 (= lt!466603 (arrayScanForKey!0 lt!466604 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057654 () Bool)

(declare-fun res!705625 () Bool)

(assert (=> b!1057654 (=> (not res!705625) (not e!601361))))

(assert (=> b!1057654 (= res!705625 (= (select (arr!32056 a!3488) i!1381) k0!2747))))

(declare-fun b!1057655 () Bool)

(declare-fun res!705626 () Bool)

(assert (=> b!1057655 (=> (not res!705626) (not e!601361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057655 (= res!705626 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057656 () Bool)

(declare-fun res!705631 () Bool)

(assert (=> b!1057656 (=> (not res!705631) (not e!601361))))

(declare-datatypes ((List!22338 0))(
  ( (Nil!22335) (Cons!22334 (h!23552 (_ BitVec 64)) (t!31637 List!22338)) )
))
(declare-fun arrayNoDuplicates!0 (array!66673 (_ BitVec 32) List!22338) Bool)

(assert (=> b!1057656 (= res!705631 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22335))))

(declare-fun res!705628 () Bool)

(assert (=> start!93360 (=> (not res!705628) (not e!601361))))

(assert (=> start!93360 (= res!705628 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32593 a!3488)) (bvslt (size!32593 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93360 e!601361))

(assert (=> start!93360 true))

(declare-fun array_inv!24838 (array!66673) Bool)

(assert (=> start!93360 (array_inv!24838 a!3488)))

(declare-fun b!1057657 () Bool)

(declare-fun e!601358 () Bool)

(assert (=> b!1057657 (= e!601358 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057658 () Bool)

(declare-fun e!601359 () Bool)

(assert (=> b!1057658 (= e!601359 e!601358)))

(declare-fun res!705627 () Bool)

(assert (=> b!1057658 (=> res!705627 e!601358)))

(assert (=> b!1057658 (= res!705627 (or (bvsgt lt!466603 i!1381) (bvsle i!1381 lt!466603)))))

(declare-fun b!1057659 () Bool)

(assert (=> b!1057659 (= e!601362 (not (or (bvsgt lt!466603 i!1381) (bvsle i!1381 lt!466603) (bvsgt #b00000000000000000000000000000000 (size!32593 a!3488)) (and (bvsge lt!466603 #b00000000000000000000000000000000) (bvsle lt!466603 (size!32593 a!3488))))))))

(assert (=> b!1057659 e!601359))

(declare-fun res!705632 () Bool)

(assert (=> b!1057659 (=> (not res!705632) (not e!601359))))

(assert (=> b!1057659 (= res!705632 (= (select (store (arr!32056 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466603) k0!2747))))

(assert (= (and start!93360 res!705628) b!1057656))

(assert (= (and b!1057656 res!705631) b!1057655))

(assert (= (and b!1057655 res!705626) b!1057654))

(assert (= (and b!1057654 res!705625) b!1057652))

(assert (= (and b!1057652 res!705630) b!1057653))

(assert (= (and b!1057653 res!705629) b!1057659))

(assert (= (and b!1057659 res!705632) b!1057658))

(assert (= (and b!1057658 (not res!705627)) b!1057657))

(declare-fun m!977891 () Bool)

(assert (=> b!1057655 m!977891))

(declare-fun m!977893 () Bool)

(assert (=> b!1057652 m!977893))

(declare-fun m!977895 () Bool)

(assert (=> b!1057652 m!977895))

(declare-fun m!977897 () Bool)

(assert (=> b!1057657 m!977897))

(assert (=> b!1057659 m!977895))

(declare-fun m!977899 () Bool)

(assert (=> b!1057659 m!977899))

(declare-fun m!977901 () Bool)

(assert (=> start!93360 m!977901))

(declare-fun m!977903 () Bool)

(assert (=> b!1057654 m!977903))

(declare-fun m!977905 () Bool)

(assert (=> b!1057656 m!977905))

(declare-fun m!977907 () Bool)

(assert (=> b!1057653 m!977907))

(check-sat (not start!93360) (not b!1057657) (not b!1057656) (not b!1057652) (not b!1057655) (not b!1057653))
(check-sat)
(get-model)

(declare-fun d!128745 () Bool)

(declare-fun res!705685 () Bool)

(declare-fun e!601404 () Bool)

(assert (=> d!128745 (=> res!705685 e!601404)))

(assert (=> d!128745 (= res!705685 (= (select (arr!32056 lt!466604) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128745 (= (arrayContainsKey!0 lt!466604 k0!2747 #b00000000000000000000000000000000) e!601404)))

(declare-fun b!1057712 () Bool)

(declare-fun e!601405 () Bool)

(assert (=> b!1057712 (= e!601404 e!601405)))

(declare-fun res!705686 () Bool)

(assert (=> b!1057712 (=> (not res!705686) (not e!601405))))

(assert (=> b!1057712 (= res!705686 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32593 lt!466604)))))

(declare-fun b!1057713 () Bool)

(assert (=> b!1057713 (= e!601405 (arrayContainsKey!0 lt!466604 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128745 (not res!705685)) b!1057712))

(assert (= (and b!1057712 res!705686) b!1057713))

(declare-fun m!977945 () Bool)

(assert (=> d!128745 m!977945))

(declare-fun m!977947 () Bool)

(assert (=> b!1057713 m!977947))

(assert (=> b!1057652 d!128745))

(declare-fun d!128747 () Bool)

(declare-fun res!705687 () Bool)

(declare-fun e!601406 () Bool)

(assert (=> d!128747 (=> res!705687 e!601406)))

(assert (=> d!128747 (= res!705687 (= (select (arr!32056 a!3488) i!1381) k0!2747))))

(assert (=> d!128747 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601406)))

(declare-fun b!1057714 () Bool)

(declare-fun e!601407 () Bool)

(assert (=> b!1057714 (= e!601406 e!601407)))

(declare-fun res!705688 () Bool)

(assert (=> b!1057714 (=> (not res!705688) (not e!601407))))

(assert (=> b!1057714 (= res!705688 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32593 a!3488)))))

(declare-fun b!1057715 () Bool)

(assert (=> b!1057715 (= e!601407 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128747 (not res!705687)) b!1057714))

(assert (= (and b!1057714 res!705688) b!1057715))

(assert (=> d!128747 m!977903))

(declare-fun m!977949 () Bool)

(assert (=> b!1057715 m!977949))

(assert (=> b!1057657 d!128747))

(declare-fun bm!44882 () Bool)

(declare-fun call!44885 () Bool)

(declare-fun c!107483 () Bool)

(assert (=> bm!44882 (= call!44885 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107483 (Cons!22334 (select (arr!32056 a!3488) #b00000000000000000000000000000000) Nil!22335) Nil!22335)))))

(declare-fun b!1057726 () Bool)

(declare-fun e!601418 () Bool)

(assert (=> b!1057726 (= e!601418 call!44885)))

(declare-fun b!1057727 () Bool)

(assert (=> b!1057727 (= e!601418 call!44885)))

(declare-fun d!128749 () Bool)

(declare-fun res!705696 () Bool)

(declare-fun e!601417 () Bool)

(assert (=> d!128749 (=> res!705696 e!601417)))

(assert (=> d!128749 (= res!705696 (bvsge #b00000000000000000000000000000000 (size!32593 a!3488)))))

(assert (=> d!128749 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22335) e!601417)))

(declare-fun b!1057728 () Bool)

(declare-fun e!601416 () Bool)

(assert (=> b!1057728 (= e!601416 e!601418)))

(assert (=> b!1057728 (= c!107483 (validKeyInArray!0 (select (arr!32056 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057729 () Bool)

(assert (=> b!1057729 (= e!601417 e!601416)))

(declare-fun res!705697 () Bool)

(assert (=> b!1057729 (=> (not res!705697) (not e!601416))))

(declare-fun e!601419 () Bool)

(assert (=> b!1057729 (= res!705697 (not e!601419))))

(declare-fun res!705695 () Bool)

(assert (=> b!1057729 (=> (not res!705695) (not e!601419))))

(assert (=> b!1057729 (= res!705695 (validKeyInArray!0 (select (arr!32056 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057730 () Bool)

(declare-fun contains!6216 (List!22338 (_ BitVec 64)) Bool)

(assert (=> b!1057730 (= e!601419 (contains!6216 Nil!22335 (select (arr!32056 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128749 (not res!705696)) b!1057729))

(assert (= (and b!1057729 res!705695) b!1057730))

(assert (= (and b!1057729 res!705697) b!1057728))

(assert (= (and b!1057728 c!107483) b!1057726))

(assert (= (and b!1057728 (not c!107483)) b!1057727))

(assert (= (or b!1057726 b!1057727) bm!44882))

(declare-fun m!977951 () Bool)

(assert (=> bm!44882 m!977951))

(declare-fun m!977953 () Bool)

(assert (=> bm!44882 m!977953))

(assert (=> b!1057728 m!977951))

(assert (=> b!1057728 m!977951))

(declare-fun m!977955 () Bool)

(assert (=> b!1057728 m!977955))

(assert (=> b!1057729 m!977951))

(assert (=> b!1057729 m!977951))

(assert (=> b!1057729 m!977955))

(assert (=> b!1057730 m!977951))

(assert (=> b!1057730 m!977951))

(declare-fun m!977957 () Bool)

(assert (=> b!1057730 m!977957))

(assert (=> b!1057656 d!128749))

(declare-fun d!128757 () Bool)

(assert (=> d!128757 (= (array_inv!24838 a!3488) (bvsge (size!32593 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93360 d!128757))

(declare-fun d!128761 () Bool)

(assert (=> d!128761 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057655 d!128761))

(declare-fun d!128765 () Bool)

(declare-fun lt!466619 () (_ BitVec 32))

(assert (=> d!128765 (and (or (bvslt lt!466619 #b00000000000000000000000000000000) (bvsge lt!466619 (size!32593 lt!466604)) (and (bvsge lt!466619 #b00000000000000000000000000000000) (bvslt lt!466619 (size!32593 lt!466604)))) (bvsge lt!466619 #b00000000000000000000000000000000) (bvslt lt!466619 (size!32593 lt!466604)) (= (select (arr!32056 lt!466604) lt!466619) k0!2747))))

(declare-fun e!601450 () (_ BitVec 32))

(assert (=> d!128765 (= lt!466619 e!601450)))

(declare-fun c!107491 () Bool)

(assert (=> d!128765 (= c!107491 (= (select (arr!32056 lt!466604) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32593 lt!466604)) (bvslt (size!32593 lt!466604) #b01111111111111111111111111111111))))

(assert (=> d!128765 (= (arrayScanForKey!0 lt!466604 k0!2747 #b00000000000000000000000000000000) lt!466619)))

(declare-fun b!1057768 () Bool)

(assert (=> b!1057768 (= e!601450 #b00000000000000000000000000000000)))

(declare-fun b!1057769 () Bool)

(assert (=> b!1057769 (= e!601450 (arrayScanForKey!0 lt!466604 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128765 c!107491) b!1057768))

(assert (= (and d!128765 (not c!107491)) b!1057769))

(declare-fun m!977973 () Bool)

(assert (=> d!128765 m!977973))

(assert (=> d!128765 m!977945))

(declare-fun m!977975 () Bool)

(assert (=> b!1057769 m!977975))

(assert (=> b!1057653 d!128765))

(check-sat (not b!1057769) (not b!1057730) (not b!1057713) (not b!1057715) (not b!1057729) (not bm!44882) (not b!1057728))
(check-sat)
