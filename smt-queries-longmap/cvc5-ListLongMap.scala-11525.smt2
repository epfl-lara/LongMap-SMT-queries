; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134186 () Bool)

(assert start!134186)

(declare-fun b!1567751 () Bool)

(declare-fun res!1071438 () Bool)

(declare-fun e!873929 () Bool)

(assert (=> b!1567751 (=> (not res!1071438) (not e!873929))))

(declare-datatypes ((List!36674 0))(
  ( (Nil!36671) (Cons!36670 (h!38117 (_ BitVec 64)) (t!51582 List!36674)) )
))
(declare-fun acc!619 () List!36674)

(declare-fun noDuplicate!2648 (List!36674) Bool)

(assert (=> b!1567751 (= res!1071438 (noDuplicate!2648 acc!619))))

(declare-fun b!1567752 () Bool)

(declare-fun res!1071440 () Bool)

(assert (=> b!1567752 (=> (not res!1071440) (not e!873929))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104718 0))(
  ( (array!104719 (arr!50542 (Array (_ BitVec 32) (_ BitVec 64))) (size!51092 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104718)

(assert (=> b!1567752 (= res!1071440 (bvslt from!2856 (size!51092 a!3481)))))

(declare-fun b!1567753 () Bool)

(declare-fun e!873926 () Bool)

(assert (=> b!1567753 (= e!873929 e!873926)))

(declare-fun res!1071437 () Bool)

(assert (=> b!1567753 (=> (not res!1071437) (not e!873926))))

(declare-fun e!873928 () Bool)

(assert (=> b!1567753 (= res!1071437 e!873928)))

(declare-fun res!1071443 () Bool)

(assert (=> b!1567753 (=> res!1071443 e!873928)))

(declare-fun lt!673042 () Bool)

(assert (=> b!1567753 (= res!1071443 lt!673042)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567753 (= lt!673042 (not (validKeyInArray!0 (select (arr!50542 a!3481) from!2856))))))

(declare-fun res!1071441 () Bool)

(assert (=> start!134186 (=> (not res!1071441) (not e!873929))))

(assert (=> start!134186 (= res!1071441 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51092 a!3481)) (bvslt (size!51092 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134186 e!873929))

(assert (=> start!134186 true))

(declare-fun array_inv!39269 (array!104718) Bool)

(assert (=> start!134186 (array_inv!39269 a!3481)))

(declare-fun b!1567754 () Bool)

(declare-fun contains!10376 (List!36674 (_ BitVec 64)) Bool)

(assert (=> b!1567754 (= e!873928 (not (contains!10376 acc!619 (select (arr!50542 a!3481) from!2856))))))

(declare-fun b!1567755 () Bool)

(declare-fun res!1071442 () Bool)

(assert (=> b!1567755 (=> (not res!1071442) (not e!873926))))

(assert (=> b!1567755 (= res!1071442 (and (not lt!673042) (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun b!1567756 () Bool)

(assert (=> b!1567756 (= e!873926 (not (noDuplicate!2648 (Cons!36670 (select (arr!50542 a!3481) from!2856) acc!619))))))

(declare-fun b!1567757 () Bool)

(declare-fun res!1071444 () Bool)

(assert (=> b!1567757 (=> (not res!1071444) (not e!873929))))

(assert (=> b!1567757 (= res!1071444 (not (contains!10376 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567758 () Bool)

(declare-fun res!1071439 () Bool)

(assert (=> b!1567758 (=> (not res!1071439) (not e!873929))))

(assert (=> b!1567758 (= res!1071439 (not (contains!10376 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134186 res!1071441) b!1567751))

(assert (= (and b!1567751 res!1071438) b!1567758))

(assert (= (and b!1567758 res!1071439) b!1567757))

(assert (= (and b!1567757 res!1071444) b!1567752))

(assert (= (and b!1567752 res!1071440) b!1567753))

(assert (= (and b!1567753 (not res!1071443)) b!1567754))

(assert (= (and b!1567753 res!1071437) b!1567755))

(assert (= (and b!1567755 res!1071442) b!1567756))

(declare-fun m!1442521 () Bool)

(assert (=> b!1567756 m!1442521))

(declare-fun m!1442523 () Bool)

(assert (=> b!1567756 m!1442523))

(assert (=> b!1567754 m!1442521))

(assert (=> b!1567754 m!1442521))

(declare-fun m!1442525 () Bool)

(assert (=> b!1567754 m!1442525))

(declare-fun m!1442527 () Bool)

(assert (=> b!1567751 m!1442527))

(declare-fun m!1442529 () Bool)

(assert (=> b!1567758 m!1442529))

(declare-fun m!1442531 () Bool)

(assert (=> start!134186 m!1442531))

(assert (=> b!1567753 m!1442521))

(assert (=> b!1567753 m!1442521))

(declare-fun m!1442533 () Bool)

(assert (=> b!1567753 m!1442533))

(declare-fun m!1442535 () Bool)

(assert (=> b!1567757 m!1442535))

(push 1)

(assert (not b!1567754))

(assert (not b!1567758))

(assert (not b!1567751))

(assert (not b!1567753))

(assert (not b!1567757))

(assert (not start!134186))

(assert (not b!1567756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163635 () Bool)

(declare-fun res!1071507 () Bool)

(declare-fun e!873968 () Bool)

(assert (=> d!163635 (=> res!1071507 e!873968)))

(assert (=> d!163635 (= res!1071507 (is-Nil!36671 acc!619))))

(assert (=> d!163635 (= (noDuplicate!2648 acc!619) e!873968)))

(declare-fun b!1567821 () Bool)

(declare-fun e!873969 () Bool)

(assert (=> b!1567821 (= e!873968 e!873969)))

(declare-fun res!1071508 () Bool)

(assert (=> b!1567821 (=> (not res!1071508) (not e!873969))))

(assert (=> b!1567821 (= res!1071508 (not (contains!10376 (t!51582 acc!619) (h!38117 acc!619))))))

(declare-fun b!1567822 () Bool)

(assert (=> b!1567822 (= e!873969 (noDuplicate!2648 (t!51582 acc!619)))))

(assert (= (and d!163635 (not res!1071507)) b!1567821))

(assert (= (and b!1567821 res!1071508) b!1567822))

(declare-fun m!1442575 () Bool)

(assert (=> b!1567821 m!1442575))

(declare-fun m!1442577 () Bool)

(assert (=> b!1567822 m!1442577))

(assert (=> b!1567751 d!163635))

(declare-fun d!163641 () Bool)

(declare-fun res!1071509 () Bool)

(declare-fun e!873970 () Bool)

(assert (=> d!163641 (=> res!1071509 e!873970)))

(assert (=> d!163641 (= res!1071509 (is-Nil!36671 (Cons!36670 (select (arr!50542 a!3481) from!2856) acc!619)))))

(assert (=> d!163641 (= (noDuplicate!2648 (Cons!36670 (select (arr!50542 a!3481) from!2856) acc!619)) e!873970)))

(declare-fun b!1567823 () Bool)

(declare-fun e!873971 () Bool)

(assert (=> b!1567823 (= e!873970 e!873971)))

(declare-fun res!1071510 () Bool)

(assert (=> b!1567823 (=> (not res!1071510) (not e!873971))))

(assert (=> b!1567823 (= res!1071510 (not (contains!10376 (t!51582 (Cons!36670 (select (arr!50542 a!3481) from!2856) acc!619)) (h!38117 (Cons!36670 (select (arr!50542 a!3481) from!2856) acc!619)))))))

(declare-fun b!1567824 () Bool)

(assert (=> b!1567824 (= e!873971 (noDuplicate!2648 (t!51582 (Cons!36670 (select (arr!50542 a!3481) from!2856) acc!619))))))

(assert (= (and d!163641 (not res!1071509)) b!1567823))

(assert (= (and b!1567823 res!1071510) b!1567824))

(declare-fun m!1442583 () Bool)

(assert (=> b!1567823 m!1442583))

(declare-fun m!1442585 () Bool)

(assert (=> b!1567824 m!1442585))

(assert (=> b!1567756 d!163641))

(declare-fun d!163645 () Bool)

(declare-fun lt!673058 () Bool)

(declare-fun content!814 (List!36674) (Set (_ BitVec 64)))

(assert (=> d!163645 (= lt!673058 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!814 acc!619)))))

(declare-fun e!873989 () Bool)

(assert (=> d!163645 (= lt!673058 e!873989)))

(declare-fun res!1071528 () Bool)

(assert (=> d!163645 (=> (not res!1071528) (not e!873989))))

(assert (=> d!163645 (= res!1071528 (is-Cons!36670 acc!619))))

(assert (=> d!163645 (= (contains!10376 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673058)))

(declare-fun b!1567841 () Bool)

(declare-fun e!873988 () Bool)

(assert (=> b!1567841 (= e!873989 e!873988)))

(declare-fun res!1071527 () Bool)

(assert (=> b!1567841 (=> res!1071527 e!873988)))

(assert (=> b!1567841 (= res!1071527 (= (h!38117 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567842 () Bool)

(assert (=> b!1567842 (= e!873988 (contains!10376 (t!51582 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163645 res!1071528) b!1567841))

(assert (= (and b!1567841 (not res!1071527)) b!1567842))

(declare-fun m!1442599 () Bool)

(assert (=> d!163645 m!1442599))

(declare-fun m!1442601 () Bool)

(assert (=> d!163645 m!1442601))

(declare-fun m!1442603 () Bool)

(assert (=> b!1567842 m!1442603))

(assert (=> b!1567757 d!163645))

(declare-fun d!163653 () Bool)

(assert (=> d!163653 (= (validKeyInArray!0 (select (arr!50542 a!3481) from!2856)) (and (not (= (select (arr!50542 a!3481) from!2856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50542 a!3481) from!2856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567753 d!163653))

(declare-fun d!163655 () Bool)

(declare-fun lt!673060 () Bool)

(assert (=> d!163655 (= lt!673060 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!814 acc!619)))))

(declare-fun e!873993 () Bool)

(assert (=> d!163655 (= lt!673060 e!873993)))

(declare-fun res!1071532 () Bool)

(assert (=> d!163655 (=> (not res!1071532) (not e!873993))))

