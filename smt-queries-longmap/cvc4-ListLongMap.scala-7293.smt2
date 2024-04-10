; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93184 () Bool)

(assert start!93184)

(declare-fun b!1056786 () Bool)

(declare-fun e!600864 () Bool)

(declare-fun e!600862 () Bool)

(assert (=> b!1056786 (= e!600864 e!600862)))

(declare-fun res!705536 () Bool)

(assert (=> b!1056786 (=> (not res!705536) (not e!600862))))

(declare-datatypes ((array!66655 0))(
  ( (array!66656 (arr!32052 (Array (_ BitVec 32) (_ BitVec 64))) (size!32588 (_ BitVec 32))) )
))
(declare-fun lt!466207 () array!66655)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056786 (= res!705536 (arrayContainsKey!0 lt!466207 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66655)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056786 (= lt!466207 (array!66656 (store (arr!32052 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32588 a!3488)))))

(declare-fun b!1056787 () Bool)

(declare-fun e!600865 () Bool)

(assert (=> b!1056787 (= e!600862 e!600865)))

(declare-fun res!705533 () Bool)

(assert (=> b!1056787 (=> (not res!705533) (not e!600865))))

(declare-fun lt!466208 () (_ BitVec 32))

(assert (=> b!1056787 (= res!705533 (not (= lt!466208 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66655 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056787 (= lt!466208 (arrayScanForKey!0 lt!466207 k!2747 #b00000000000000000000000000000000))))

(declare-fun e!600868 () Bool)

(declare-fun b!1056789 () Bool)

(assert (=> b!1056789 (= e!600868 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1056790 () Bool)

(declare-fun e!600867 () Bool)

(assert (=> b!1056790 (= e!600865 (not e!600867))))

(declare-fun res!705532 () Bool)

(assert (=> b!1056790 (=> res!705532 e!600867)))

(assert (=> b!1056790 (= res!705532 (or (bvsgt lt!466208 i!1381) (bvsle i!1381 lt!466208)))))

(declare-fun e!600866 () Bool)

(assert (=> b!1056790 e!600866))

(declare-fun res!705534 () Bool)

(assert (=> b!1056790 (=> (not res!705534) (not e!600866))))

(assert (=> b!1056790 (= res!705534 (= (select (store (arr!32052 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466208) k!2747))))

(declare-fun b!1056791 () Bool)

(declare-fun res!705529 () Bool)

(assert (=> b!1056791 (=> (not res!705529) (not e!600864))))

(declare-datatypes ((List!22364 0))(
  ( (Nil!22361) (Cons!22360 (h!23569 (_ BitVec 64)) (t!31671 List!22364)) )
))
(declare-fun arrayNoDuplicates!0 (array!66655 (_ BitVec 32) List!22364) Bool)

(assert (=> b!1056791 (= res!705529 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22361))))

(declare-fun b!1056792 () Bool)

(declare-fun res!705528 () Bool)

(assert (=> b!1056792 (=> (not res!705528) (not e!600864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056792 (= res!705528 (validKeyInArray!0 k!2747))))

(declare-fun res!705530 () Bool)

(assert (=> start!93184 (=> (not res!705530) (not e!600864))))

(assert (=> start!93184 (= res!705530 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32588 a!3488)) (bvslt (size!32588 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93184 e!600864))

(assert (=> start!93184 true))

(declare-fun array_inv!24832 (array!66655) Bool)

(assert (=> start!93184 (array_inv!24832 a!3488)))

(declare-fun b!1056788 () Bool)

(declare-fun res!705531 () Bool)

(assert (=> b!1056788 (=> (not res!705531) (not e!600864))))

(assert (=> b!1056788 (= res!705531 (= (select (arr!32052 a!3488) i!1381) k!2747))))

(declare-fun b!1056793 () Bool)

(assert (=> b!1056793 (= e!600866 e!600868)))

(declare-fun res!705535 () Bool)

(assert (=> b!1056793 (=> res!705535 e!600868)))

(assert (=> b!1056793 (= res!705535 (or (bvsgt lt!466208 i!1381) (bvsle i!1381 lt!466208)))))

(declare-fun b!1056794 () Bool)

(assert (=> b!1056794 (= e!600867 (bvsge (bvadd #b00000000000000000000000000000001 lt!466208) #b00000000000000000000000000000000))))

(assert (=> b!1056794 (arrayNoDuplicates!0 a!3488 lt!466208 Nil!22361)))

(declare-datatypes ((Unit!34626 0))(
  ( (Unit!34627) )
))
(declare-fun lt!466209 () Unit!34626)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66655 (_ BitVec 32) (_ BitVec 32)) Unit!34626)

(assert (=> b!1056794 (= lt!466209 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466208))))

(assert (= (and start!93184 res!705530) b!1056791))

(assert (= (and b!1056791 res!705529) b!1056792))

(assert (= (and b!1056792 res!705528) b!1056788))

(assert (= (and b!1056788 res!705531) b!1056786))

(assert (= (and b!1056786 res!705536) b!1056787))

(assert (= (and b!1056787 res!705533) b!1056790))

(assert (= (and b!1056790 res!705534) b!1056793))

(assert (= (and b!1056793 (not res!705535)) b!1056789))

(assert (= (and b!1056790 (not res!705532)) b!1056794))

(declare-fun m!976561 () Bool)

(assert (=> b!1056789 m!976561))

(declare-fun m!976563 () Bool)

(assert (=> b!1056792 m!976563))

(declare-fun m!976565 () Bool)

(assert (=> b!1056788 m!976565))

(declare-fun m!976567 () Bool)

(assert (=> b!1056790 m!976567))

(declare-fun m!976569 () Bool)

(assert (=> b!1056790 m!976569))

(declare-fun m!976571 () Bool)

(assert (=> start!93184 m!976571))

(declare-fun m!976573 () Bool)

(assert (=> b!1056787 m!976573))

(declare-fun m!976575 () Bool)

(assert (=> b!1056794 m!976575))

(declare-fun m!976577 () Bool)

(assert (=> b!1056794 m!976577))

(declare-fun m!976579 () Bool)

(assert (=> b!1056791 m!976579))

(declare-fun m!976581 () Bool)

(assert (=> b!1056786 m!976581))

(assert (=> b!1056786 m!976567))

(push 1)

(assert (not b!1056791))

(assert (not start!93184))

(assert (not b!1056786))

(assert (not b!1056792))

(assert (not b!1056787))

(assert (not b!1056789))

(assert (not b!1056794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128341 () Bool)

(assert (=> d!128341 (= (array_inv!24832 a!3488) (bvsge (size!32588 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93184 d!128341))

(declare-fun d!128343 () Bool)

(declare-fun res!705558 () Bool)

(declare-fun e!600899 () Bool)

(assert (=> d!128343 (=> res!705558 e!600899)))

(assert (=> d!128343 (= res!705558 (= (select (arr!32052 lt!466207) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128343 (= (arrayContainsKey!0 lt!466207 k!2747 #b00000000000000000000000000000000) e!600899)))

(declare-fun b!1056834 () Bool)

(declare-fun e!600900 () Bool)

(assert (=> b!1056834 (= e!600899 e!600900)))

(declare-fun res!705559 () Bool)

(assert (=> b!1056834 (=> (not res!705559) (not e!600900))))

(assert (=> b!1056834 (= res!705559 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32588 lt!466207)))))

(declare-fun b!1056835 () Bool)

(assert (=> b!1056835 (= e!600900 (arrayContainsKey!0 lt!466207 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128343 (not res!705558)) b!1056834))

(assert (= (and b!1056834 res!705559) b!1056835))

(declare-fun m!976607 () Bool)

(assert (=> d!128343 m!976607))

(declare-fun m!976609 () Bool)

(assert (=> b!1056835 m!976609))

(assert (=> b!1056786 d!128343))

(declare-fun d!128349 () Bool)

(declare-fun res!705580 () Bool)

(declare-fun e!600927 () Bool)

(assert (=> d!128349 (=> res!705580 e!600927)))

(assert (=> d!128349 (= res!705580 (bvsge #b00000000000000000000000000000000 (size!32588 a!3488)))))

(assert (=> d!128349 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22361) e!600927)))

(declare-fun b!1056866 () Bool)

(declare-fun e!600928 () Bool)

(declare-fun call!44834 () Bool)

(assert (=> b!1056866 (= e!600928 call!44834)))

(declare-fun b!1056867 () Bool)

(declare-fun e!600925 () Bool)

(assert (=> b!1056867 (= e!600925 e!600928)))

(declare-fun c!107104 () Bool)

(assert (=> b!1056867 (= c!107104 (validKeyInArray!0 (select (arr!32052 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056868 () Bool)

(declare-fun e!600926 () Bool)

(declare-fun contains!6197 (List!22364 (_ BitVec 64)) Bool)

(assert (=> b!1056868 (= e!600926 (contains!6197 Nil!22361 (select (arr!32052 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44831 () Bool)

(assert (=> bm!44831 (= call!44834 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107104 (Cons!22360 (select (arr!32052 a!3488) #b00000000000000000000000000000000) Nil!22361) Nil!22361)))))

(declare-fun b!1056869 () Bool)

(assert (=> b!1056869 (= e!600928 call!44834)))

(declare-fun b!1056870 () Bool)

(assert (=> b!1056870 (= e!600927 e!600925)))

(declare-fun res!705578 () Bool)

(assert (=> b!1056870 (=> (not res!705578) (not e!600925))))

(assert (=> b!1056870 (= res!705578 (not e!600926))))

(declare-fun res!705579 () Bool)

(assert (=> b!1056870 (=> (not res!705579) (not e!600926))))

(assert (=> b!1056870 (= res!705579 (validKeyInArray!0 (select (arr!32052 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128349 (not res!705580)) b!1056870))

(assert (= (and b!1056870 res!705579) b!1056868))

(assert (= (and b!1056870 res!705578) b!1056867))

(assert (= (and b!1056867 c!107104) b!1056869))

(assert (= (and b!1056867 (not c!107104)) b!1056866))

(assert (= (or b!1056869 b!1056866) bm!44831))

