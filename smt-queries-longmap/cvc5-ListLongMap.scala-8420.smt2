; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102456 () Bool)

(assert start!102456)

(declare-fun b!1232404 () Bool)

(declare-fun e!698982 () Bool)

(declare-datatypes ((array!79487 0))(
  ( (array!79488 (arr!38357 (Array (_ BitVec 32) (_ BitVec 64))) (size!38893 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79487)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27130 0))(
  ( (Nil!27127) (Cons!27126 (h!28335 (_ BitVec 64)) (t!40593 List!27130)) )
))
(declare-fun arrayNoDuplicates!0 (array!79487 (_ BitVec 32) List!27130) Bool)

(assert (=> b!1232404 (= e!698982 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)))))

(declare-fun b!1232405 () Bool)

(declare-fun e!698985 () Bool)

(declare-fun e!698984 () Bool)

(assert (=> b!1232405 (= e!698985 (not e!698984))))

(declare-fun res!820786 () Bool)

(assert (=> b!1232405 (=> res!820786 e!698984)))

(assert (=> b!1232405 (= res!820786 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1232405 e!698982))

(declare-fun res!820790 () Bool)

(assert (=> b!1232405 (=> (not res!820790) (not e!698982))))

(assert (=> b!1232405 (= res!820790 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27127))))

(declare-fun acc!823 () List!27130)

(declare-datatypes ((Unit!40820 0))(
  ( (Unit!40821) )
))
(declare-fun lt!559514 () Unit!40820)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79487 List!27130 List!27130 (_ BitVec 32)) Unit!40820)

(assert (=> b!1232405 (= lt!559514 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27127 from!3184))))

(assert (=> b!1232405 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823))))

(declare-fun b!1232406 () Bool)

(declare-fun res!820782 () Bool)

(assert (=> b!1232406 (=> (not res!820782) (not e!698985))))

(declare-fun noDuplicate!1789 (List!27130) Bool)

(assert (=> b!1232406 (= res!820782 (noDuplicate!1789 acc!823))))

(declare-fun b!1232407 () Bool)

(declare-fun res!820785 () Bool)

(assert (=> b!1232407 (=> (not res!820785) (not e!698985))))

(declare-fun contains!7192 (List!27130 (_ BitVec 64)) Bool)

(assert (=> b!1232407 (= res!820785 (not (contains!7192 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232408 () Bool)

(declare-fun res!820788 () Bool)

(assert (=> b!1232408 (=> (not res!820788) (not e!698985))))

(assert (=> b!1232408 (= res!820788 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38893 a!3806)) (bvslt from!3184 (size!38893 a!3806))))))

(declare-fun b!1232409 () Bool)

(assert (=> b!1232409 (= e!698984 (noDuplicate!1789 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)))))

(declare-fun b!1232410 () Bool)

(declare-fun res!820789 () Bool)

(assert (=> b!1232410 (=> (not res!820789) (not e!698985))))

(assert (=> b!1232410 (= res!820789 (not (contains!7192 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232411 () Bool)

(declare-fun res!820783 () Bool)

(assert (=> b!1232411 (=> (not res!820783) (not e!698985))))

(assert (=> b!1232411 (= res!820783 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232413 () Bool)

(declare-fun res!820792 () Bool)

(assert (=> b!1232413 (=> (not res!820792) (not e!698985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232413 (= res!820792 (validKeyInArray!0 (select (arr!38357 a!3806) from!3184)))))

(declare-fun b!1232414 () Bool)

(declare-fun res!820784 () Bool)

(assert (=> b!1232414 (=> (not res!820784) (not e!698985))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1232414 (= res!820784 (validKeyInArray!0 k!2913))))

(declare-fun b!1232412 () Bool)

(declare-fun res!820791 () Bool)

(assert (=> b!1232412 (=> (not res!820791) (not e!698985))))

(declare-fun arrayContainsKey!0 (array!79487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232412 (= res!820791 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!820787 () Bool)

(assert (=> start!102456 (=> (not res!820787) (not e!698985))))

(assert (=> start!102456 (= res!820787 (bvslt (size!38893 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102456 e!698985))

(declare-fun array_inv!29205 (array!79487) Bool)

(assert (=> start!102456 (array_inv!29205 a!3806)))

(assert (=> start!102456 true))

(assert (= (and start!102456 res!820787) b!1232414))

(assert (= (and b!1232414 res!820784) b!1232408))

(assert (= (and b!1232408 res!820788) b!1232406))

(assert (= (and b!1232406 res!820782) b!1232410))

(assert (= (and b!1232410 res!820789) b!1232407))

(assert (= (and b!1232407 res!820785) b!1232412))

(assert (= (and b!1232412 res!820791) b!1232411))

(assert (= (and b!1232411 res!820783) b!1232413))

(assert (= (and b!1232413 res!820792) b!1232405))

(assert (= (and b!1232405 res!820790) b!1232404))

(assert (= (and b!1232405 (not res!820786)) b!1232409))

(declare-fun m!1136395 () Bool)

(assert (=> b!1232412 m!1136395))

(declare-fun m!1136397 () Bool)

(assert (=> b!1232405 m!1136397))

(declare-fun m!1136399 () Bool)

(assert (=> b!1232405 m!1136399))

(declare-fun m!1136401 () Bool)

(assert (=> b!1232405 m!1136401))

(declare-fun m!1136403 () Bool)

(assert (=> b!1232405 m!1136403))

(assert (=> b!1232413 m!1136401))

(assert (=> b!1232413 m!1136401))

(declare-fun m!1136405 () Bool)

(assert (=> b!1232413 m!1136405))

(declare-fun m!1136407 () Bool)

(assert (=> b!1232406 m!1136407))

(declare-fun m!1136409 () Bool)

(assert (=> b!1232407 m!1136409))

(assert (=> b!1232409 m!1136401))

(declare-fun m!1136411 () Bool)

(assert (=> b!1232409 m!1136411))

(assert (=> b!1232404 m!1136401))

(declare-fun m!1136413 () Bool)

(assert (=> b!1232404 m!1136413))

(declare-fun m!1136415 () Bool)

(assert (=> start!102456 m!1136415))

(declare-fun m!1136417 () Bool)

(assert (=> b!1232410 m!1136417))

(declare-fun m!1136419 () Bool)

(assert (=> b!1232414 m!1136419))

(declare-fun m!1136421 () Bool)

(assert (=> b!1232411 m!1136421))

(push 1)

(assert (not b!1232413))

(assert (not b!1232404))

(assert (not b!1232409))

(assert (not b!1232405))

(assert (not b!1232407))

(assert (not b!1232411))

(assert (not b!1232414))

(assert (not b!1232406))

(assert (not b!1232412))

(assert (not start!102456))

(assert (not b!1232410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1232534 () Bool)

(declare-fun e!699059 () Bool)

(declare-fun e!699056 () Bool)

(assert (=> b!1232534 (= e!699059 e!699056)))

(declare-fun res!820900 () Bool)

(assert (=> b!1232534 (=> (not res!820900) (not e!699056))))

(declare-fun e!699058 () Bool)

(assert (=> b!1232534 (= res!820900 (not e!699058))))

(declare-fun res!820899 () Bool)

(assert (=> b!1232534 (=> (not res!820899) (not e!699058))))

(assert (=> b!1232534 (= res!820899 (validKeyInArray!0 (select (arr!38357 a!3806) from!3184)))))

(declare-fun b!1232535 () Bool)

(declare-fun e!699057 () Bool)

(declare-fun call!60915 () Bool)

(assert (=> b!1232535 (= e!699057 call!60915)))

(declare-fun d!134863 () Bool)

(declare-fun res!820898 () Bool)

(assert (=> d!134863 (=> res!820898 e!699059)))

(assert (=> d!134863 (= res!820898 (bvsge from!3184 (size!38893 a!3806)))))

(assert (=> d!134863 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699059)))

(declare-fun b!1232536 () Bool)

(assert (=> b!1232536 (= e!699058 (contains!7192 acc!823 (select (arr!38357 a!3806) from!3184)))))

(declare-fun bm!60912 () Bool)

(declare-fun c!120678 () Bool)

(assert (=> bm!60912 (= call!60915 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120678 (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1232537 () Bool)

(assert (=> b!1232537 (= e!699056 e!699057)))

(assert (=> b!1232537 (= c!120678 (validKeyInArray!0 (select (arr!38357 a!3806) from!3184)))))

(declare-fun b!1232538 () Bool)

(assert (=> b!1232538 (= e!699057 call!60915)))

(assert (= (and d!134863 (not res!820898)) b!1232534))

(assert (= (and b!1232534 res!820899) b!1232536))

(assert (= (and b!1232534 res!820900) b!1232537))

(assert (= (and b!1232537 c!120678) b!1232535))

(assert (= (and b!1232537 (not c!120678)) b!1232538))

(assert (= (or b!1232535 b!1232538) bm!60912))

(assert (=> b!1232534 m!1136401))

(assert (=> b!1232534 m!1136401))

(assert (=> b!1232534 m!1136405))

(assert (=> b!1232536 m!1136401))

(assert (=> b!1232536 m!1136401))

(declare-fun m!1136497 () Bool)

(assert (=> b!1232536 m!1136497))

(assert (=> bm!60912 m!1136401))

(declare-fun m!1136499 () Bool)

(assert (=> bm!60912 m!1136499))

(assert (=> b!1232537 m!1136401))

(assert (=> b!1232537 m!1136401))

(assert (=> b!1232537 m!1136405))

(assert (=> b!1232411 d!134863))

(declare-fun d!134879 () Bool)

(declare-fun res!820914 () Bool)

(declare-fun e!699074 () Bool)

(assert (=> d!134879 (=> res!820914 e!699074)))

(assert (=> d!134879 (= res!820914 (is-Nil!27127 acc!823))))

(assert (=> d!134879 (= (noDuplicate!1789 acc!823) e!699074)))

(declare-fun b!1232555 () Bool)

(declare-fun e!699076 () Bool)

(assert (=> b!1232555 (= e!699074 e!699076)))

(declare-fun res!820916 () Bool)

(assert (=> b!1232555 (=> (not res!820916) (not e!699076))))

(assert (=> b!1232555 (= res!820916 (not (contains!7192 (t!40593 acc!823) (h!28335 acc!823))))))

(declare-fun b!1232557 () Bool)

(assert (=> b!1232557 (= e!699076 (noDuplicate!1789 (t!40593 acc!823)))))

(assert (= (and d!134879 (not res!820914)) b!1232555))

(assert (= (and b!1232555 res!820916) b!1232557))

(declare-fun m!1136509 () Bool)

(assert (=> b!1232555 m!1136509))

(declare-fun m!1136511 () Bool)

(assert (=> b!1232557 m!1136511))

(assert (=> b!1232406 d!134879))

(declare-fun b!1232562 () Bool)

(declare-fun e!699085 () Bool)

(declare-fun e!699082 () Bool)

(assert (=> b!1232562 (= e!699085 e!699082)))

(declare-fun res!820924 () Bool)

(assert (=> b!1232562 (=> (not res!820924) (not e!699082))))

(declare-fun e!699084 () Bool)

(assert (=> b!1232562 (= res!820924 (not e!699084))))

(declare-fun res!820923 () Bool)

(assert (=> b!1232562 (=> (not res!820923) (not e!699084))))

(assert (=> b!1232562 (= res!820923 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232563 () Bool)

(declare-fun e!699083 () Bool)

(declare-fun call!60917 () Bool)

(assert (=> b!1232563 (= e!699083 call!60917)))

(declare-fun d!134883 () Bool)

(declare-fun res!820922 () Bool)

(assert (=> d!134883 (=> res!820922 e!699085)))

(assert (=> d!134883 (= res!820922 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38893 a!3806)))))

(assert (=> d!134883 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) e!699085)))

(declare-fun b!1232564 () Bool)

(assert (=> b!1232564 (= e!699084 (contains!7192 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127) (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60914 () Bool)

(declare-fun c!120680 () Bool)

(assert (=> bm!60914 (= call!60917 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120680 (Cons!27126 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))))))

(declare-fun b!1232565 () Bool)

(assert (=> b!1232565 (= e!699082 e!699083)))

(assert (=> b!1232565 (= c!120680 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232566 () Bool)

(assert (=> b!1232566 (= e!699083 call!60917)))

(assert (= (and d!134883 (not res!820922)) b!1232562))

(assert (= (and b!1232562 res!820923) b!1232564))

(assert (= (and b!1232562 res!820924) b!1232565))

(assert (= (and b!1232565 c!120680) b!1232563))

(assert (= (and b!1232565 (not c!120680)) b!1232566))

(assert (= (or b!1232563 b!1232566) bm!60914))

(declare-fun m!1136523 () Bool)

(assert (=> b!1232562 m!1136523))

(assert (=> b!1232562 m!1136523))

(declare-fun m!1136527 () Bool)

(assert (=> b!1232562 m!1136527))

(assert (=> b!1232564 m!1136523))

(assert (=> b!1232564 m!1136523))

(declare-fun m!1136529 () Bool)

(assert (=> b!1232564 m!1136529))

(assert (=> bm!60914 m!1136523))

(declare-fun m!1136531 () Bool)

(assert (=> bm!60914 m!1136531))

(assert (=> b!1232565 m!1136523))

(assert (=> b!1232565 m!1136523))

(assert (=> b!1232565 m!1136527))

(assert (=> b!1232404 d!134883))

(declare-fun d!134891 () Bool)

(declare-fun lt!559530 () Bool)

(declare-fun content!571 (List!27130) (Set (_ BitVec 64)))

(assert (=> d!134891 (= lt!559530 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!571 acc!823)))))

(declare-fun e!699119 () Bool)

(assert (=> d!134891 (= lt!559530 e!699119)))

(declare-fun res!820953 () Bool)

(assert (=> d!134891 (=> (not res!820953) (not e!699119))))

(assert (=> d!134891 (= res!820953 (is-Cons!27126 acc!823))))

(assert (=> d!134891 (= (contains!7192 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559530)))

(declare-fun b!1232603 () Bool)

(declare-fun e!699118 () Bool)

(assert (=> b!1232603 (= e!699119 e!699118)))

(declare-fun res!820954 () Bool)

(assert (=> b!1232603 (=> res!820954 e!699118)))

(assert (=> b!1232603 (= res!820954 (= (h!28335 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232604 () Bool)

(assert (=> b!1232604 (= e!699118 (contains!7192 (t!40593 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134891 res!820953) b!1232603))

(assert (= (and b!1232603 (not res!820954)) b!1232604))

(declare-fun m!1136563 () Bool)

(assert (=> d!134891 m!1136563))

(declare-fun m!1136565 () Bool)

(assert (=> d!134891 m!1136565))

(declare-fun m!1136567 () Bool)

(assert (=> b!1232604 m!1136567))

(assert (=> b!1232410 d!134891))

(declare-fun b!1232605 () Bool)

(declare-fun e!699123 () Bool)

(declare-fun e!699120 () Bool)

(assert (=> b!1232605 (= e!699123 e!699120)))

(declare-fun res!820957 () Bool)

(assert (=> b!1232605 (=> (not res!820957) (not e!699120))))

(declare-fun e!699122 () Bool)

(assert (=> b!1232605 (= res!820957 (not e!699122))))

(declare-fun res!820956 () Bool)

(assert (=> b!1232605 (=> (not res!820956) (not e!699122))))

(assert (=> b!1232605 (= res!820956 (validKeyInArray!0 (select (arr!38357 a!3806) from!3184)))))

(declare-fun b!1232606 () Bool)

(declare-fun e!699121 () Bool)

(declare-fun call!60922 () Bool)

(assert (=> b!1232606 (= e!699121 call!60922)))

(declare-fun d!134915 () Bool)

(declare-fun res!820955 () Bool)

(assert (=> d!134915 (=> res!820955 e!699123)))

(assert (=> d!134915 (= res!820955 (bvsge from!3184 (size!38893 a!3806)))))

(assert (=> d!134915 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27127) e!699123)))

(declare-fun b!1232607 () Bool)

(assert (=> b!1232607 (= e!699122 (contains!7192 Nil!27127 (select (arr!38357 a!3806) from!3184)))))

(declare-fun bm!60919 () Bool)

(declare-fun c!120685 () Bool)

(assert (=> bm!60919 (= call!60922 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120685 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127) Nil!27127)))))

(declare-fun b!1232608 () Bool)

(assert (=> b!1232608 (= e!699120 e!699121)))

(assert (=> b!1232608 (= c!120685 (validKeyInArray!0 (select (arr!38357 a!3806) from!3184)))))

(declare-fun b!1232609 () Bool)

(assert (=> b!1232609 (= e!699121 call!60922)))

(assert (= (and d!134915 (not res!820955)) b!1232605))

(assert (= (and b!1232605 res!820956) b!1232607))

(assert (= (and b!1232605 res!820957) b!1232608))

(assert (= (and b!1232608 c!120685) b!1232606))

(assert (= (and b!1232608 (not c!120685)) b!1232609))

(assert (= (or b!1232606 b!1232609) bm!60919))

(assert (=> b!1232605 m!1136401))

(assert (=> b!1232605 m!1136401))

(assert (=> b!1232605 m!1136405))

(assert (=> b!1232607 m!1136401))

(assert (=> b!1232607 m!1136401))

(declare-fun m!1136569 () Bool)

(assert (=> b!1232607 m!1136569))

(assert (=> bm!60919 m!1136401))

(declare-fun m!1136571 () Bool)

(assert (=> bm!60919 m!1136571))

(assert (=> b!1232608 m!1136401))

(assert (=> b!1232608 m!1136401))

(assert (=> b!1232608 m!1136405))

(assert (=> b!1232405 d!134915))

(declare-fun d!134917 () Bool)

(assert (=> d!134917 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27127)))

(declare-fun lt!559540 () Unit!40820)

(declare-fun choose!80 (array!79487 List!27130 List!27130 (_ BitVec 32)) Unit!40820)

(assert (=> d!134917 (= lt!559540 (choose!80 a!3806 acc!823 Nil!27127 from!3184))))

(assert (=> d!134917 (bvslt (size!38893 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134917 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27127 from!3184) lt!559540)))

(declare-fun bs!34639 () Bool)

(assert (= bs!34639 d!134917))

(assert (=> bs!34639 m!1136397))

(declare-fun m!1136589 () Bool)

(assert (=> bs!34639 m!1136589))

(assert (=> b!1232405 d!134917))

(declare-fun b!1232622 () Bool)

(declare-fun e!699137 () Bool)

(declare-fun e!699134 () Bool)

(assert (=> b!1232622 (= e!699137 e!699134)))

(declare-fun res!820968 () Bool)

(assert (=> b!1232622 (=> (not res!820968) (not e!699134))))

(declare-fun e!699136 () Bool)

(assert (=> b!1232622 (= res!820968 (not e!699136))))

(declare-fun res!820967 () Bool)

(assert (=> b!1232622 (=> (not res!820967) (not e!699136))))

(assert (=> b!1232622 (= res!820967 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232623 () Bool)

(declare-fun e!699135 () Bool)

(declare-fun call!60925 () Bool)

(assert (=> b!1232623 (= e!699135 call!60925)))

(declare-fun d!134925 () Bool)

(declare-fun res!820966 () Bool)

(assert (=> d!134925 (=> res!820966 e!699137)))

(assert (=> d!134925 (= res!820966 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38893 a!3806)))))

(assert (=> d!134925 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823)) e!699137)))

(declare-fun b!1232624 () Bool)

(assert (=> b!1232624 (= e!699136 (contains!7192 (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823) (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun c!120688 () Bool)

(declare-fun bm!60922 () Bool)

(assert (=> bm!60922 (= call!60925 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120688 (Cons!27126 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823)) (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823))))))

(declare-fun b!1232625 () Bool)

(assert (=> b!1232625 (= e!699134 e!699135)))

(assert (=> b!1232625 (= c!120688 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232626 () Bool)

(assert (=> b!1232626 (= e!699135 call!60925)))

(assert (= (and d!134925 (not res!820966)) b!1232622))

(assert (= (and b!1232622 res!820967) b!1232624))

(assert (= (and b!1232622 res!820968) b!1232625))

(assert (= (and b!1232625 c!120688) b!1232623))

(assert (= (and b!1232625 (not c!120688)) b!1232626))

(assert (= (or b!1232623 b!1232626) bm!60922))

(assert (=> b!1232622 m!1136523))

(assert (=> b!1232622 m!1136523))

(assert (=> b!1232622 m!1136527))

(assert (=> b!1232624 m!1136523))

(assert (=> b!1232624 m!1136523))

(declare-fun m!1136591 () Bool)

(assert (=> b!1232624 m!1136591))

(assert (=> bm!60922 m!1136523))

(declare-fun m!1136593 () Bool)

(assert (=> bm!60922 m!1136593))

(assert (=> b!1232625 m!1136523))

(assert (=> b!1232625 m!1136523))

(assert (=> b!1232625 m!1136527))

(assert (=> b!1232405 d!134925))

(declare-fun d!134927 () Bool)

(assert (=> d!134927 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232414 d!134927))

(declare-fun d!134929 () Bool)

(declare-fun res!820969 () Bool)

(declare-fun e!699138 () Bool)

(assert (=> d!134929 (=> res!820969 e!699138)))

(assert (=> d!134929 (= res!820969 (is-Nil!27127 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)))))

(assert (=> d!134929 (= (noDuplicate!1789 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) e!699138)))

(declare-fun b!1232627 () Bool)

(declare-fun e!699139 () Bool)

(assert (=> b!1232627 (= e!699138 e!699139)))

(declare-fun res!820970 () Bool)

(assert (=> b!1232627 (=> (not res!820970) (not e!699139))))

(assert (=> b!1232627 (= res!820970 (not (contains!7192 (t!40593 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) (h!28335 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)))))))

(declare-fun b!1232628 () Bool)

(assert (=> b!1232628 (= e!699139 (noDuplicate!1789 (t!40593 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))))))

(assert (= (and d!134929 (not res!820969)) b!1232627))

(assert (= (and b!1232627 res!820970) b!1232628))

(declare-fun m!1136595 () Bool)

(assert (=> b!1232627 m!1136595))

(declare-fun m!1136597 () Bool)

(assert (=> b!1232628 m!1136597))

(assert (=> b!1232409 d!134929))

(declare-fun d!134931 () Bool)

(assert (=> d!134931 (= (array_inv!29205 a!3806) (bvsge (size!38893 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102456 d!134931))

(declare-fun d!134933 () Bool)

(declare-fun res!820975 () Bool)

(declare-fun e!699144 () Bool)

(assert (=> d!134933 (=> res!820975 e!699144)))

(assert (=> d!134933 (= res!820975 (= (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134933 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699144)))

(declare-fun b!1232633 () Bool)

(declare-fun e!699145 () Bool)

(assert (=> b!1232633 (= e!699144 e!699145)))

(declare-fun res!820976 () Bool)

(assert (=> b!1232633 (=> (not res!820976) (not e!699145))))

(assert (=> b!1232633 (= res!820976 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38893 a!3806)))))

(declare-fun b!1232634 () Bool)

(assert (=> b!1232634 (= e!699145 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134933 (not res!820975)) b!1232633))

(assert (= (and b!1232633 res!820976) b!1232634))

(assert (=> d!134933 m!1136523))

(declare-fun m!1136599 () Bool)

(assert (=> b!1232634 m!1136599))

(assert (=> b!1232412 d!134933))

(declare-fun d!134935 () Bool)

(declare-fun lt!559541 () Bool)

(assert (=> d!134935 (= lt!559541 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!571 acc!823)))))

(declare-fun e!699147 () Bool)

(assert (=> d!134935 (= lt!559541 e!699147)))

(declare-fun res!820977 () Bool)

(assert (=> d!134935 (=> (not res!820977) (not e!699147))))

(assert (=> d!134935 (= res!820977 (is-Cons!27126 acc!823))))

(assert (=> d!134935 (= (contains!7192 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559541)))

(declare-fun b!1232635 () Bool)

(declare-fun e!699146 () Bool)

(assert (=> b!1232635 (= e!699147 e!699146)))

(declare-fun res!820978 () Bool)

(assert (=> b!1232635 (=> res!820978 e!699146)))

(assert (=> b!1232635 (= res!820978 (= (h!28335 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232636 () Bool)

(assert (=> b!1232636 (= e!699146 (contains!7192 (t!40593 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134935 res!820977) b!1232635))

(assert (= (and b!1232635 (not res!820978)) b!1232636))

(assert (=> d!134935 m!1136563))

(declare-fun m!1136601 () Bool)

(assert (=> d!134935 m!1136601))

(declare-fun m!1136603 () Bool)

(assert (=> b!1232636 m!1136603))

(assert (=> b!1232407 d!134935))

(declare-fun d!134937 () Bool)

(assert (=> d!134937 (= (validKeyInArray!0 (select (arr!38357 a!3806) from!3184)) (and (not (= (select (arr!38357 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38357 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232413 d!134937))

(push 1)

(assert (not b!1232607))

(assert (not b!1232634))

(assert (not b!1232562))

(assert (not bm!60914))

(assert (not b!1232636))

(assert (not b!1232627))

(assert (not d!134917))

(assert (not b!1232608))

(assert (not b!1232565))

(assert (not b!1232555))

(assert (not b!1232605))

(assert (not bm!60919))

(assert (not b!1232557))

(assert (not b!1232536))

(assert (not b!1232537))

(assert (not b!1232625))

(assert (not d!134935))

(assert (not bm!60912))

(assert (not b!1232628))

(assert (not b!1232624))

(assert (not b!1232564))

(assert (not bm!60922))

(assert (not b!1232604))

(assert (not b!1232622))

(assert (not b!1232534))

(assert (not d!134891))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134975 () Bool)

(declare-fun lt!559550 () Bool)

(assert (=> d!134975 (= lt!559550 (set.member (select (arr!38357 a!3806) from!3184) (content!571 Nil!27127)))))

(declare-fun e!699190 () Bool)

(assert (=> d!134975 (= lt!559550 e!699190)))

(declare-fun res!821013 () Bool)

(assert (=> d!134975 (=> (not res!821013) (not e!699190))))

(assert (=> d!134975 (= res!821013 (is-Cons!27126 Nil!27127))))

(assert (=> d!134975 (= (contains!7192 Nil!27127 (select (arr!38357 a!3806) from!3184)) lt!559550)))

(declare-fun b!1232685 () Bool)

(declare-fun e!699189 () Bool)

(assert (=> b!1232685 (= e!699190 e!699189)))

(declare-fun res!821014 () Bool)

(assert (=> b!1232685 (=> res!821014 e!699189)))

(assert (=> b!1232685 (= res!821014 (= (h!28335 Nil!27127) (select (arr!38357 a!3806) from!3184)))))

(declare-fun b!1232686 () Bool)

(assert (=> b!1232686 (= e!699189 (contains!7192 (t!40593 Nil!27127) (select (arr!38357 a!3806) from!3184)))))

(assert (= (and d!134975 res!821013) b!1232685))

(assert (= (and b!1232685 (not res!821014)) b!1232686))

(declare-fun m!1136683 () Bool)

(assert (=> d!134975 m!1136683))

(assert (=> d!134975 m!1136401))

(declare-fun m!1136685 () Bool)

(assert (=> d!134975 m!1136685))

(assert (=> b!1232686 m!1136401))

(declare-fun m!1136687 () Bool)

(assert (=> b!1232686 m!1136687))

(assert (=> b!1232607 d!134975))

(declare-fun d!134977 () Bool)

(declare-fun lt!559551 () Bool)

(assert (=> d!134977 (= lt!559551 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!571 (t!40593 acc!823))))))

(declare-fun e!699192 () Bool)

(assert (=> d!134977 (= lt!559551 e!699192)))

(declare-fun res!821015 () Bool)

(assert (=> d!134977 (=> (not res!821015) (not e!699192))))

(assert (=> d!134977 (= res!821015 (is-Cons!27126 (t!40593 acc!823)))))

(assert (=> d!134977 (= (contains!7192 (t!40593 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!559551)))

(declare-fun b!1232687 () Bool)

(declare-fun e!699191 () Bool)

(assert (=> b!1232687 (= e!699192 e!699191)))

(declare-fun res!821016 () Bool)

(assert (=> b!1232687 (=> res!821016 e!699191)))

(assert (=> b!1232687 (= res!821016 (= (h!28335 (t!40593 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232688 () Bool)

(assert (=> b!1232688 (= e!699191 (contains!7192 (t!40593 (t!40593 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134977 res!821015) b!1232687))

(assert (= (and b!1232687 (not res!821016)) b!1232688))

(declare-fun m!1136689 () Bool)

(assert (=> d!134977 m!1136689))

(declare-fun m!1136691 () Bool)

(assert (=> d!134977 m!1136691))

(declare-fun m!1136693 () Bool)

(assert (=> b!1232688 m!1136693))

(assert (=> b!1232604 d!134977))

(declare-fun b!1232689 () Bool)

(declare-fun e!699196 () Bool)

(declare-fun e!699193 () Bool)

(assert (=> b!1232689 (= e!699196 e!699193)))

(declare-fun res!821019 () Bool)

(assert (=> b!1232689 (=> (not res!821019) (not e!699193))))

(declare-fun e!699195 () Bool)

(assert (=> b!1232689 (= res!821019 (not e!699195))))

(declare-fun res!821018 () Bool)

(assert (=> b!1232689 (=> (not res!821018) (not e!699195))))

(assert (=> b!1232689 (= res!821018 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232690 () Bool)

(declare-fun e!699194 () Bool)

(declare-fun call!60930 () Bool)

(assert (=> b!1232690 (= e!699194 call!60930)))

(declare-fun d!134979 () Bool)

(declare-fun res!821017 () Bool)

(assert (=> d!134979 (=> res!821017 e!699196)))

(assert (=> d!134979 (= res!821017 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38893 a!3806)))))

(assert (=> d!134979 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120685 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127) Nil!27127)) e!699196)))

(declare-fun b!1232691 () Bool)

(assert (=> b!1232691 (= e!699195 (contains!7192 (ite c!120685 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127) Nil!27127) (select (arr!38357 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60927 () Bool)

(declare-fun c!120696 () Bool)

(assert (=> bm!60927 (= call!60930 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120696 (Cons!27126 (select (arr!38357 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120685 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127) Nil!27127)) (ite c!120685 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127) Nil!27127))))))

(declare-fun b!1232692 () Bool)

(assert (=> b!1232692 (= e!699193 e!699194)))

(assert (=> b!1232692 (= c!120696 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232693 () Bool)

(assert (=> b!1232693 (= e!699194 call!60930)))

(assert (= (and d!134979 (not res!821017)) b!1232689))

(assert (= (and b!1232689 res!821018) b!1232691))

(assert (= (and b!1232689 res!821019) b!1232692))

(assert (= (and b!1232692 c!120696) b!1232690))

(assert (= (and b!1232692 (not c!120696)) b!1232693))

(assert (= (or b!1232690 b!1232693) bm!60927))

(declare-fun m!1136695 () Bool)

(assert (=> b!1232689 m!1136695))

(assert (=> b!1232689 m!1136695))

(declare-fun m!1136697 () Bool)

(assert (=> b!1232689 m!1136697))

(assert (=> b!1232691 m!1136695))

(assert (=> b!1232691 m!1136695))

(declare-fun m!1136699 () Bool)

(assert (=> b!1232691 m!1136699))

(assert (=> bm!60927 m!1136695))

(declare-fun m!1136701 () Bool)

(assert (=> bm!60927 m!1136701))

(assert (=> b!1232692 m!1136695))

(assert (=> b!1232692 m!1136695))

(assert (=> b!1232692 m!1136697))

(assert (=> bm!60919 d!134979))

(declare-fun d!134981 () Bool)

(declare-fun c!120699 () Bool)

(assert (=> d!134981 (= c!120699 (is-Nil!27127 acc!823))))

(declare-fun e!699199 () (Set (_ BitVec 64)))

(assert (=> d!134981 (= (content!571 acc!823) e!699199)))

(declare-fun b!1232698 () Bool)

(assert (=> b!1232698 (= e!699199 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!1232699 () Bool)

(assert (=> b!1232699 (= e!699199 (set.union (set.insert (h!28335 acc!823) (as set.empty (Set (_ BitVec 64)))) (content!571 (t!40593 acc!823))))))

(assert (= (and d!134981 c!120699) b!1232698))

(assert (= (and d!134981 (not c!120699)) b!1232699))

(declare-fun m!1136703 () Bool)

(assert (=> b!1232699 m!1136703))

(assert (=> b!1232699 m!1136689))

(assert (=> d!134935 d!134981))

(assert (=> b!1232608 d!134937))

(declare-fun d!134983 () Bool)

(assert (=> d!134983 (= (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232562 d!134983))

(assert (=> d!134917 d!134915))

(declare-fun d!134985 () Bool)

(assert (=> d!134985 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27127)))

(assert (=> d!134985 true))

(declare-fun _$70!92 () Unit!40820)

(assert (=> d!134985 (= (choose!80 a!3806 acc!823 Nil!27127 from!3184) _$70!92)))

(declare-fun bs!34641 () Bool)

(assert (= bs!34641 d!134985))

(assert (=> bs!34641 m!1136397))

(assert (=> d!134917 d!134985))

(assert (=> b!1232534 d!134937))

(assert (=> b!1232537 d!134937))

(assert (=> d!134891 d!134981))

(declare-fun lt!559552 () Bool)

(declare-fun d!134987 () Bool)

(assert (=> d!134987 (= lt!559552 (set.member (select (arr!38357 a!3806) from!3184) (content!571 acc!823)))))

(declare-fun e!699201 () Bool)

(assert (=> d!134987 (= lt!559552 e!699201)))

(declare-fun res!821020 () Bool)

(assert (=> d!134987 (=> (not res!821020) (not e!699201))))

(assert (=> d!134987 (= res!821020 (is-Cons!27126 acc!823))))

(assert (=> d!134987 (= (contains!7192 acc!823 (select (arr!38357 a!3806) from!3184)) lt!559552)))

(declare-fun b!1232700 () Bool)

(declare-fun e!699200 () Bool)

(assert (=> b!1232700 (= e!699201 e!699200)))

(declare-fun res!821021 () Bool)

(assert (=> b!1232700 (=> res!821021 e!699200)))

(assert (=> b!1232700 (= res!821021 (= (h!28335 acc!823) (select (arr!38357 a!3806) from!3184)))))

(declare-fun b!1232701 () Bool)

(assert (=> b!1232701 (= e!699200 (contains!7192 (t!40593 acc!823) (select (arr!38357 a!3806) from!3184)))))

(assert (= (and d!134987 res!821020) b!1232700))

(assert (= (and b!1232700 (not res!821021)) b!1232701))

(assert (=> d!134987 m!1136563))

(assert (=> d!134987 m!1136401))

(declare-fun m!1136705 () Bool)

(assert (=> d!134987 m!1136705))

(assert (=> b!1232701 m!1136401))

(declare-fun m!1136707 () Bool)

(assert (=> b!1232701 m!1136707))

(assert (=> b!1232536 d!134987))

(declare-fun d!134989 () Bool)

(declare-fun res!821022 () Bool)

(declare-fun e!699202 () Bool)

(assert (=> d!134989 (=> res!821022 e!699202)))

(assert (=> d!134989 (= res!821022 (= (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k!2913))))

(assert (=> d!134989 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!699202)))

(declare-fun b!1232702 () Bool)

(declare-fun e!699203 () Bool)

(assert (=> b!1232702 (= e!699202 e!699203)))

(declare-fun res!821023 () Bool)

(assert (=> b!1232702 (=> (not res!821023) (not e!699203))))

(assert (=> b!1232702 (= res!821023 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38893 a!3806)))))

(declare-fun b!1232703 () Bool)

(assert (=> b!1232703 (= e!699203 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134989 (not res!821022)) b!1232702))

(assert (= (and b!1232702 res!821023) b!1232703))

(declare-fun m!1136709 () Bool)

(assert (=> d!134989 m!1136709))

(declare-fun m!1136711 () Bool)

(assert (=> b!1232703 m!1136711))

(assert (=> b!1232634 d!134989))

(declare-fun b!1232704 () Bool)

(declare-fun e!699207 () Bool)

(declare-fun e!699204 () Bool)

(assert (=> b!1232704 (= e!699207 e!699204)))

(declare-fun res!821026 () Bool)

(assert (=> b!1232704 (=> (not res!821026) (not e!699204))))

(declare-fun e!699206 () Bool)

(assert (=> b!1232704 (= res!821026 (not e!699206))))

(declare-fun res!821025 () Bool)

(assert (=> b!1232704 (=> (not res!821025) (not e!699206))))

(assert (=> b!1232704 (= res!821025 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232705 () Bool)

(declare-fun e!699205 () Bool)

(declare-fun call!60931 () Bool)

(assert (=> b!1232705 (= e!699205 call!60931)))

(declare-fun d!134991 () Bool)

(declare-fun res!821024 () Bool)

(assert (=> d!134991 (=> res!821024 e!699207)))

(assert (=> d!134991 (= res!821024 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38893 a!3806)))))

(assert (=> d!134991 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120678 (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823) acc!823)) e!699207)))

(declare-fun b!1232706 () Bool)

(assert (=> b!1232706 (= e!699206 (contains!7192 (ite c!120678 (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823) acc!823) (select (arr!38357 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun bm!60928 () Bool)

(declare-fun c!120700 () Bool)

(assert (=> bm!60928 (= call!60931 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120700 (Cons!27126 (select (arr!38357 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120678 (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823) acc!823)) (ite c!120678 (Cons!27126 (select (arr!38357 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1232707 () Bool)

(assert (=> b!1232707 (= e!699204 e!699205)))

(assert (=> b!1232707 (= c!120700 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232708 () Bool)

(assert (=> b!1232708 (= e!699205 call!60931)))

(assert (= (and d!134991 (not res!821024)) b!1232704))

(assert (= (and b!1232704 res!821025) b!1232706))

(assert (= (and b!1232704 res!821026) b!1232707))

(assert (= (and b!1232707 c!120700) b!1232705))

(assert (= (and b!1232707 (not c!120700)) b!1232708))

(assert (= (or b!1232705 b!1232708) bm!60928))

(assert (=> b!1232704 m!1136695))

(assert (=> b!1232704 m!1136695))

(assert (=> b!1232704 m!1136697))

(assert (=> b!1232706 m!1136695))

(assert (=> b!1232706 m!1136695))

(declare-fun m!1136713 () Bool)

(assert (=> b!1232706 m!1136713))

(assert (=> bm!60928 m!1136695))

(declare-fun m!1136715 () Bool)

(assert (=> bm!60928 m!1136715))

(assert (=> b!1232707 m!1136695))

(assert (=> b!1232707 m!1136695))

(assert (=> b!1232707 m!1136697))

(assert (=> bm!60912 d!134991))

(assert (=> b!1232605 d!134937))

(declare-fun d!134993 () Bool)

(declare-fun res!821027 () Bool)

(declare-fun e!699208 () Bool)

(assert (=> d!134993 (=> res!821027 e!699208)))

(assert (=> d!134993 (= res!821027 (is-Nil!27127 (t!40593 acc!823)))))

(assert (=> d!134993 (= (noDuplicate!1789 (t!40593 acc!823)) e!699208)))

(declare-fun b!1232709 () Bool)

(declare-fun e!699209 () Bool)

(assert (=> b!1232709 (= e!699208 e!699209)))

(declare-fun res!821028 () Bool)

(assert (=> b!1232709 (=> (not res!821028) (not e!699209))))

(assert (=> b!1232709 (= res!821028 (not (contains!7192 (t!40593 (t!40593 acc!823)) (h!28335 (t!40593 acc!823)))))))

(declare-fun b!1232710 () Bool)

(assert (=> b!1232710 (= e!699209 (noDuplicate!1789 (t!40593 (t!40593 acc!823))))))

(assert (= (and d!134993 (not res!821027)) b!1232709))

(assert (= (and b!1232709 res!821028) b!1232710))

(declare-fun m!1136717 () Bool)

(assert (=> b!1232709 m!1136717))

(declare-fun m!1136719 () Bool)

(assert (=> b!1232710 m!1136719))

(assert (=> b!1232557 d!134993))

(assert (=> b!1232622 d!134983))

(assert (=> b!1232565 d!134983))

(declare-fun d!134995 () Bool)

(declare-fun lt!559553 () Bool)

(assert (=> d!134995 (= lt!559553 (set.member (h!28335 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) (content!571 (t!40593 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)))))))

(declare-fun e!699211 () Bool)

(assert (=> d!134995 (= lt!559553 e!699211)))

(declare-fun res!821029 () Bool)

(assert (=> d!134995 (=> (not res!821029) (not e!699211))))

(assert (=> d!134995 (= res!821029 (is-Cons!27126 (t!40593 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))))))

(assert (=> d!134995 (= (contains!7192 (t!40593 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) (h!28335 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))) lt!559553)))

(declare-fun b!1232711 () Bool)

(declare-fun e!699210 () Bool)

(assert (=> b!1232711 (= e!699211 e!699210)))

(declare-fun res!821030 () Bool)

(assert (=> b!1232711 (=> res!821030 e!699210)))

(assert (=> b!1232711 (= res!821030 (= (h!28335 (t!40593 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))) (h!28335 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))))))

(declare-fun b!1232712 () Bool)

(assert (=> b!1232712 (= e!699210 (contains!7192 (t!40593 (t!40593 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))) (h!28335 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))))))

(assert (= (and d!134995 res!821029) b!1232711))

(assert (= (and b!1232711 (not res!821030)) b!1232712))

(declare-fun m!1136721 () Bool)

(assert (=> d!134995 m!1136721))

(declare-fun m!1136723 () Bool)

(assert (=> d!134995 m!1136723))

(declare-fun m!1136725 () Bool)

(assert (=> b!1232712 m!1136725))

(assert (=> b!1232627 d!134995))

(declare-fun d!134997 () Bool)

(declare-fun lt!559554 () Bool)

(assert (=> d!134997 (= lt!559554 (set.member (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (content!571 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))))))

(declare-fun e!699213 () Bool)

(assert (=> d!134997 (= lt!559554 e!699213)))

(declare-fun res!821031 () Bool)

(assert (=> d!134997 (=> (not res!821031) (not e!699213))))

(assert (=> d!134997 (= res!821031 (is-Cons!27126 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)))))

(assert (=> d!134997 (= (contains!7192 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127) (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!559554)))

(declare-fun b!1232713 () Bool)

(declare-fun e!699212 () Bool)

(assert (=> b!1232713 (= e!699213 e!699212)))

(declare-fun res!821032 () Bool)

(assert (=> b!1232713 (=> res!821032 e!699212)))

(assert (=> b!1232713 (= res!821032 (= (h!28335 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232714 () Bool)

(assert (=> b!1232714 (= e!699212 (contains!7192 (t!40593 (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134997 res!821031) b!1232713))

(assert (= (and b!1232713 (not res!821032)) b!1232714))

(declare-fun m!1136727 () Bool)

(assert (=> d!134997 m!1136727))

(assert (=> d!134997 m!1136523))

(declare-fun m!1136729 () Bool)

(assert (=> d!134997 m!1136729))

(assert (=> b!1232714 m!1136523))

(declare-fun m!1136731 () Bool)

(assert (=> b!1232714 m!1136731))

(assert (=> b!1232564 d!134997))

(declare-fun b!1232715 () Bool)

(declare-fun e!699217 () Bool)

(declare-fun e!699214 () Bool)

(assert (=> b!1232715 (= e!699217 e!699214)))

(declare-fun res!821035 () Bool)

(assert (=> b!1232715 (=> (not res!821035) (not e!699214))))

(declare-fun e!699216 () Bool)

(assert (=> b!1232715 (= res!821035 (not e!699216))))

(declare-fun res!821034 () Bool)

(assert (=> b!1232715 (=> (not res!821034) (not e!699216))))

(assert (=> b!1232715 (= res!821034 (validKeyInArray!0 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232716 () Bool)

(declare-fun e!699215 () Bool)

(declare-fun call!60932 () Bool)

(assert (=> b!1232716 (= e!699215 call!60932)))

(declare-fun d!134999 () Bool)

(declare-fun res!821033 () Bool)

(assert (=> d!134999 (=> res!821033 e!699217)))

(assert (=> d!134999 (= res!821033 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38893 a!3806)))))

(assert (=> d!134999 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120680 (Cons!27126 (select (arr!38357 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127)) (Cons!27126 (select (arr!38357 a!3806) from!3184) Nil!27127))) e!699217)))

