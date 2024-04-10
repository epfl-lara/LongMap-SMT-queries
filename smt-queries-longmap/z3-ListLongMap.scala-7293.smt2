; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93182 () Bool)

(assert start!93182)

(declare-fun b!1056759 () Bool)

(declare-fun e!600847 () Bool)

(declare-fun e!600846 () Bool)

(assert (=> b!1056759 (= e!600847 (not e!600846))))

(declare-fun res!705506 () Bool)

(assert (=> b!1056759 (=> res!705506 e!600846)))

(declare-fun lt!466199 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056759 (= res!705506 (or (bvsgt lt!466199 i!1381) (bvsle i!1381 lt!466199)))))

(declare-fun e!600845 () Bool)

(assert (=> b!1056759 e!600845))

(declare-fun res!705505 () Bool)

(assert (=> b!1056759 (=> (not res!705505) (not e!600845))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-datatypes ((array!66653 0))(
  ( (array!66654 (arr!32051 (Array (_ BitVec 32) (_ BitVec 64))) (size!32587 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66653)

(assert (=> b!1056759 (= res!705505 (= (select (store (arr!32051 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466199) k0!2747))))

(declare-fun b!1056760 () Bool)

(declare-fun e!600841 () Bool)

(assert (=> b!1056760 (= e!600841 e!600847)))

(declare-fun res!705504 () Bool)

(assert (=> b!1056760 (=> (not res!705504) (not e!600847))))

(assert (=> b!1056760 (= res!705504 (not (= lt!466199 i!1381)))))

(declare-fun lt!466198 () array!66653)

(declare-fun arrayScanForKey!0 (array!66653 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056760 (= lt!466199 (arrayScanForKey!0 lt!466198 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056761 () Bool)

(declare-fun e!600842 () Bool)

(assert (=> b!1056761 (= e!600842 e!600841)))

(declare-fun res!705503 () Bool)

(assert (=> b!1056761 (=> (not res!705503) (not e!600841))))

(declare-fun arrayContainsKey!0 (array!66653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056761 (= res!705503 (arrayContainsKey!0 lt!466198 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056761 (= lt!466198 (array!66654 (store (arr!32051 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32587 a!3488)))))

(declare-fun b!1056762 () Bool)

(declare-fun res!705502 () Bool)

(assert (=> b!1056762 (=> (not res!705502) (not e!600842))))

(assert (=> b!1056762 (= res!705502 (= (select (arr!32051 a!3488) i!1381) k0!2747))))

(declare-fun b!1056763 () Bool)

(assert (=> b!1056763 (= e!600846 (bvsge (bvadd #b00000000000000000000000000000001 lt!466199) #b00000000000000000000000000000000))))

(declare-datatypes ((List!22363 0))(
  ( (Nil!22360) (Cons!22359 (h!23568 (_ BitVec 64)) (t!31670 List!22363)) )
))
(declare-fun arrayNoDuplicates!0 (array!66653 (_ BitVec 32) List!22363) Bool)

(assert (=> b!1056763 (arrayNoDuplicates!0 a!3488 lt!466199 Nil!22360)))

(declare-datatypes ((Unit!34624 0))(
  ( (Unit!34625) )
))
(declare-fun lt!466200 () Unit!34624)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66653 (_ BitVec 32) (_ BitVec 32)) Unit!34624)

(assert (=> b!1056763 (= lt!466200 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466199))))

(declare-fun b!1056764 () Bool)

(declare-fun res!705507 () Bool)

(assert (=> b!1056764 (=> (not res!705507) (not e!600842))))

(assert (=> b!1056764 (= res!705507 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22360))))

(declare-fun b!1056765 () Bool)

(declare-fun res!705508 () Bool)

(assert (=> b!1056765 (=> (not res!705508) (not e!600842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056765 (= res!705508 (validKeyInArray!0 k0!2747))))

(declare-fun res!705501 () Bool)

(assert (=> start!93182 (=> (not res!705501) (not e!600842))))

(assert (=> start!93182 (= res!705501 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32587 a!3488)) (bvslt (size!32587 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93182 e!600842))

(assert (=> start!93182 true))

(declare-fun array_inv!24831 (array!66653) Bool)

(assert (=> start!93182 (array_inv!24831 a!3488)))

(declare-fun b!1056766 () Bool)

(declare-fun e!600843 () Bool)

(assert (=> b!1056766 (= e!600845 e!600843)))

(declare-fun res!705509 () Bool)

(assert (=> b!1056766 (=> res!705509 e!600843)))

(assert (=> b!1056766 (= res!705509 (or (bvsgt lt!466199 i!1381) (bvsle i!1381 lt!466199)))))

(declare-fun b!1056767 () Bool)

(assert (=> b!1056767 (= e!600843 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93182 res!705501) b!1056764))

(assert (= (and b!1056764 res!705507) b!1056765))

(assert (= (and b!1056765 res!705508) b!1056762))

(assert (= (and b!1056762 res!705502) b!1056761))

(assert (= (and b!1056761 res!705503) b!1056760))

(assert (= (and b!1056760 res!705504) b!1056759))

(assert (= (and b!1056759 res!705505) b!1056766))

(assert (= (and b!1056766 (not res!705509)) b!1056767))

(assert (= (and b!1056759 (not res!705506)) b!1056763))

(declare-fun m!976539 () Bool)

(assert (=> b!1056765 m!976539))

(declare-fun m!976541 () Bool)

(assert (=> b!1056767 m!976541))

(declare-fun m!976543 () Bool)

(assert (=> b!1056761 m!976543))

(declare-fun m!976545 () Bool)

(assert (=> b!1056761 m!976545))

(declare-fun m!976547 () Bool)

(assert (=> b!1056760 m!976547))

(assert (=> b!1056759 m!976545))

(declare-fun m!976549 () Bool)

(assert (=> b!1056759 m!976549))

(declare-fun m!976551 () Bool)

(assert (=> b!1056763 m!976551))

(declare-fun m!976553 () Bool)

(assert (=> b!1056763 m!976553))

(declare-fun m!976555 () Bool)

(assert (=> b!1056764 m!976555))

(declare-fun m!976557 () Bool)

(assert (=> start!93182 m!976557))

(declare-fun m!976559 () Bool)

(assert (=> b!1056762 m!976559))

(check-sat (not b!1056765) (not b!1056763) (not b!1056761) (not start!93182) (not b!1056760) (not b!1056767) (not b!1056764))
(check-sat)
(get-model)

(declare-fun d!128327 () Bool)

(declare-fun lt!466212 () (_ BitVec 32))

(assert (=> d!128327 (and (or (bvslt lt!466212 #b00000000000000000000000000000000) (bvsge lt!466212 (size!32587 lt!466198)) (and (bvsge lt!466212 #b00000000000000000000000000000000) (bvslt lt!466212 (size!32587 lt!466198)))) (bvsge lt!466212 #b00000000000000000000000000000000) (bvslt lt!466212 (size!32587 lt!466198)) (= (select (arr!32051 lt!466198) lt!466212) k0!2747))))

(declare-fun e!600871 () (_ BitVec 32))

(assert (=> d!128327 (= lt!466212 e!600871)))

(declare-fun c!107091 () Bool)

(assert (=> d!128327 (= c!107091 (= (select (arr!32051 lt!466198) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128327 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32587 lt!466198)) (bvslt (size!32587 lt!466198) #b01111111111111111111111111111111))))

(assert (=> d!128327 (= (arrayScanForKey!0 lt!466198 k0!2747 #b00000000000000000000000000000000) lt!466212)))

(declare-fun b!1056799 () Bool)

(assert (=> b!1056799 (= e!600871 #b00000000000000000000000000000000)))

(declare-fun b!1056800 () Bool)

(assert (=> b!1056800 (= e!600871 (arrayScanForKey!0 lt!466198 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128327 c!107091) b!1056799))

(assert (= (and d!128327 (not c!107091)) b!1056800))

(declare-fun m!976583 () Bool)

(assert (=> d!128327 m!976583))

(declare-fun m!976585 () Bool)

(assert (=> d!128327 m!976585))

(declare-fun m!976587 () Bool)

(assert (=> b!1056800 m!976587))

(assert (=> b!1056760 d!128327))

(declare-fun d!128329 () Bool)

(declare-fun res!705541 () Bool)

(declare-fun e!600876 () Bool)

(assert (=> d!128329 (=> res!705541 e!600876)))

(assert (=> d!128329 (= res!705541 (= (select (arr!32051 lt!466198) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128329 (= (arrayContainsKey!0 lt!466198 k0!2747 #b00000000000000000000000000000000) e!600876)))

(declare-fun b!1056805 () Bool)

(declare-fun e!600877 () Bool)

(assert (=> b!1056805 (= e!600876 e!600877)))

(declare-fun res!705542 () Bool)

(assert (=> b!1056805 (=> (not res!705542) (not e!600877))))

(assert (=> b!1056805 (= res!705542 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32587 lt!466198)))))

(declare-fun b!1056806 () Bool)

(assert (=> b!1056806 (= e!600877 (arrayContainsKey!0 lt!466198 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128329 (not res!705541)) b!1056805))

(assert (= (and b!1056805 res!705542) b!1056806))

(assert (=> d!128329 m!976585))

(declare-fun m!976589 () Bool)

(assert (=> b!1056806 m!976589))

(assert (=> b!1056761 d!128329))

(declare-fun d!128333 () Bool)

(declare-fun res!705543 () Bool)

(declare-fun e!600878 () Bool)

(assert (=> d!128333 (=> res!705543 e!600878)))

(assert (=> d!128333 (= res!705543 (= (select (arr!32051 a!3488) i!1381) k0!2747))))

(assert (=> d!128333 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!600878)))

(declare-fun b!1056807 () Bool)

(declare-fun e!600879 () Bool)

(assert (=> b!1056807 (= e!600878 e!600879)))

(declare-fun res!705544 () Bool)

(assert (=> b!1056807 (=> (not res!705544) (not e!600879))))

(assert (=> b!1056807 (= res!705544 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32587 a!3488)))))

(declare-fun b!1056808 () Bool)

(assert (=> b!1056808 (= e!600879 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128333 (not res!705543)) b!1056807))

(assert (= (and b!1056807 res!705544) b!1056808))

(assert (=> d!128333 m!976559))

(declare-fun m!976591 () Bool)

(assert (=> b!1056808 m!976591))

(assert (=> b!1056767 d!128333))

(declare-fun d!128335 () Bool)

(assert (=> d!128335 (= (array_inv!24831 a!3488) (bvsge (size!32587 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93182 d!128335))

(declare-fun d!128339 () Bool)

(declare-fun res!705552 () Bool)

(declare-fun e!600893 () Bool)

(assert (=> d!128339 (=> res!705552 e!600893)))

(assert (=> d!128339 (= res!705552 (bvsge lt!466199 (size!32587 a!3488)))))

(assert (=> d!128339 (= (arrayNoDuplicates!0 a!3488 lt!466199 Nil!22360) e!600893)))

(declare-fun b!1056825 () Bool)

(declare-fun e!600891 () Bool)

(assert (=> b!1056825 (= e!600893 e!600891)))

(declare-fun res!705551 () Bool)

(assert (=> b!1056825 (=> (not res!705551) (not e!600891))))

(declare-fun e!600892 () Bool)

(assert (=> b!1056825 (= res!705551 (not e!600892))))

(declare-fun res!705553 () Bool)

(assert (=> b!1056825 (=> (not res!705553) (not e!600892))))

(assert (=> b!1056825 (= res!705553 (validKeyInArray!0 (select (arr!32051 a!3488) lt!466199)))))

(declare-fun c!107097 () Bool)

(declare-fun call!44827 () Bool)

(declare-fun bm!44824 () Bool)

(assert (=> bm!44824 (= call!44827 (arrayNoDuplicates!0 a!3488 (bvadd lt!466199 #b00000000000000000000000000000001) (ite c!107097 (Cons!22359 (select (arr!32051 a!3488) lt!466199) Nil!22360) Nil!22360)))))

(declare-fun b!1056826 () Bool)

(declare-fun e!600894 () Bool)

(assert (=> b!1056826 (= e!600891 e!600894)))

(assert (=> b!1056826 (= c!107097 (validKeyInArray!0 (select (arr!32051 a!3488) lt!466199)))))

(declare-fun b!1056827 () Bool)

(assert (=> b!1056827 (= e!600894 call!44827)))

(declare-fun b!1056828 () Bool)

(declare-fun contains!6195 (List!22363 (_ BitVec 64)) Bool)

(assert (=> b!1056828 (= e!600892 (contains!6195 Nil!22360 (select (arr!32051 a!3488) lt!466199)))))

(declare-fun b!1056829 () Bool)

(assert (=> b!1056829 (= e!600894 call!44827)))

(assert (= (and d!128339 (not res!705552)) b!1056825))

(assert (= (and b!1056825 res!705553) b!1056828))

(assert (= (and b!1056825 res!705551) b!1056826))

(assert (= (and b!1056826 c!107097) b!1056827))

(assert (= (and b!1056826 (not c!107097)) b!1056829))

(assert (= (or b!1056827 b!1056829) bm!44824))

(declare-fun m!976599 () Bool)

(assert (=> b!1056825 m!976599))

(assert (=> b!1056825 m!976599))

(declare-fun m!976601 () Bool)

(assert (=> b!1056825 m!976601))

(assert (=> bm!44824 m!976599))

(declare-fun m!976603 () Bool)

(assert (=> bm!44824 m!976603))

(assert (=> b!1056826 m!976599))

(assert (=> b!1056826 m!976599))

(assert (=> b!1056826 m!976601))

(assert (=> b!1056828 m!976599))

(assert (=> b!1056828 m!976599))

(declare-fun m!976605 () Bool)

(assert (=> b!1056828 m!976605))

(assert (=> b!1056763 d!128339))

(declare-fun d!128347 () Bool)

(assert (=> d!128347 (arrayNoDuplicates!0 a!3488 lt!466199 Nil!22360)))

(declare-fun lt!466218 () Unit!34624)

(declare-fun choose!39 (array!66653 (_ BitVec 32) (_ BitVec 32)) Unit!34624)

(assert (=> d!128347 (= lt!466218 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466199))))

(assert (=> d!128347 (bvslt (size!32587 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128347 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466199) lt!466218)))

(declare-fun bs!30982 () Bool)

(assert (= bs!30982 d!128347))

(assert (=> bs!30982 m!976551))

(declare-fun m!976611 () Bool)

(assert (=> bs!30982 m!976611))

(assert (=> b!1056763 d!128347))

(declare-fun d!128351 () Bool)

(declare-fun res!705567 () Bool)

(declare-fun e!600911 () Bool)

(assert (=> d!128351 (=> res!705567 e!600911)))

(assert (=> d!128351 (= res!705567 (bvsge #b00000000000000000000000000000000 (size!32587 a!3488)))))

(assert (=> d!128351 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22360) e!600911)))

(declare-fun b!1056846 () Bool)

(declare-fun e!600909 () Bool)

(assert (=> b!1056846 (= e!600911 e!600909)))

(declare-fun res!705566 () Bool)

(assert (=> b!1056846 (=> (not res!705566) (not e!600909))))

(declare-fun e!600910 () Bool)

(assert (=> b!1056846 (= res!705566 (not e!600910))))

(declare-fun res!705568 () Bool)

(assert (=> b!1056846 (=> (not res!705568) (not e!600910))))

(assert (=> b!1056846 (= res!705568 (validKeyInArray!0 (select (arr!32051 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44825 () Bool)

(declare-fun call!44828 () Bool)

(declare-fun c!107100 () Bool)

(assert (=> bm!44825 (= call!44828 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107100 (Cons!22359 (select (arr!32051 a!3488) #b00000000000000000000000000000000) Nil!22360) Nil!22360)))))

(declare-fun b!1056847 () Bool)

(declare-fun e!600912 () Bool)

(assert (=> b!1056847 (= e!600909 e!600912)))

(assert (=> b!1056847 (= c!107100 (validKeyInArray!0 (select (arr!32051 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056848 () Bool)

(assert (=> b!1056848 (= e!600912 call!44828)))

(declare-fun b!1056849 () Bool)

(assert (=> b!1056849 (= e!600910 (contains!6195 Nil!22360 (select (arr!32051 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056850 () Bool)

(assert (=> b!1056850 (= e!600912 call!44828)))

(assert (= (and d!128351 (not res!705567)) b!1056846))

(assert (= (and b!1056846 res!705568) b!1056849))

(assert (= (and b!1056846 res!705566) b!1056847))

(assert (= (and b!1056847 c!107100) b!1056848))

(assert (= (and b!1056847 (not c!107100)) b!1056850))

(assert (= (or b!1056848 b!1056850) bm!44825))

(declare-fun m!976613 () Bool)

(assert (=> b!1056846 m!976613))

(assert (=> b!1056846 m!976613))

(declare-fun m!976615 () Bool)

(assert (=> b!1056846 m!976615))

(assert (=> bm!44825 m!976613))

(declare-fun m!976617 () Bool)

(assert (=> bm!44825 m!976617))

(assert (=> b!1056847 m!976613))

(assert (=> b!1056847 m!976613))

(assert (=> b!1056847 m!976615))

(assert (=> b!1056849 m!976613))

(assert (=> b!1056849 m!976613))

(declare-fun m!976619 () Bool)

(assert (=> b!1056849 m!976619))

(assert (=> b!1056764 d!128351))

(declare-fun d!128353 () Bool)

(assert (=> d!128353 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056765 d!128353))

(check-sat (not b!1056826) (not b!1056806) (not b!1056847) (not bm!44824) (not b!1056849) (not b!1056828) (not bm!44825) (not b!1056800) (not b!1056846) (not d!128347) (not b!1056808) (not b!1056825))
(check-sat)
