; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102322 () Bool)

(assert start!102322)

(declare-fun b!1231323 () Bool)

(declare-fun res!819769 () Bool)

(declare-fun e!698486 () Bool)

(assert (=> b!1231323 (=> (not res!819769) (not e!698486))))

(declare-datatypes ((List!27105 0))(
  ( (Nil!27102) (Cons!27101 (h!28310 (_ BitVec 64)) (t!40568 List!27105)) )
))
(declare-fun acc!823 () List!27105)

(declare-fun contains!7167 (List!27105 (_ BitVec 64)) Bool)

(assert (=> b!1231323 (= res!819769 (not (contains!7167 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!819771 () Bool)

(assert (=> start!102322 (=> (not res!819771) (not e!698486))))

(declare-datatypes ((array!79431 0))(
  ( (array!79432 (arr!38332 (Array (_ BitVec 32) (_ BitVec 64))) (size!38868 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79431)

(assert (=> start!102322 (= res!819771 (bvslt (size!38868 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102322 e!698486))

(declare-fun array_inv!29180 (array!79431) Bool)

(assert (=> start!102322 (array_inv!29180 a!3806)))

(assert (=> start!102322 true))

(declare-fun b!1231324 () Bool)

(declare-fun res!819768 () Bool)

(assert (=> b!1231324 (=> (not res!819768) (not e!698486))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79431 (_ BitVec 32) List!27105) Bool)

(assert (=> b!1231324 (= res!819768 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231325 () Bool)

(declare-fun res!819772 () Bool)

(declare-fun e!698487 () Bool)

(assert (=> b!1231325 (=> res!819772 e!698487)))

(assert (=> b!1231325 (= res!819772 (contains!7167 Nil!27102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231326 () Bool)

(declare-fun res!819761 () Bool)

(assert (=> b!1231326 (=> (not res!819761) (not e!698486))))

(assert (=> b!1231326 (= res!819761 (not (contains!7167 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231327 () Bool)

(declare-fun subseq!502 (List!27105 List!27105) Bool)

(assert (=> b!1231327 (= e!698487 (subseq!502 Nil!27102 acc!823))))

(declare-fun b!1231328 () Bool)

(declare-fun res!819767 () Bool)

(assert (=> b!1231328 (=> (not res!819767) (not e!698486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231328 (= res!819767 (validKeyInArray!0 (select (arr!38332 a!3806) from!3184)))))

(declare-fun b!1231329 () Bool)

(assert (=> b!1231329 (= e!698486 (not e!698487))))

(declare-fun res!819763 () Bool)

(assert (=> b!1231329 (=> res!819763 e!698487)))

(assert (=> b!1231329 (= res!819763 (bvsgt from!3184 (size!38868 a!3806)))))

(assert (=> b!1231329 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27101 (select (arr!38332 a!3806) from!3184) acc!823))))

(declare-fun b!1231330 () Bool)

(declare-fun res!819770 () Bool)

(assert (=> b!1231330 (=> (not res!819770) (not e!698486))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1231330 (= res!819770 (validKeyInArray!0 k!2913))))

(declare-fun b!1231331 () Bool)

(declare-fun res!819765 () Bool)

(assert (=> b!1231331 (=> (not res!819765) (not e!698486))))

(declare-fun noDuplicate!1764 (List!27105) Bool)

(assert (=> b!1231331 (= res!819765 (noDuplicate!1764 acc!823))))

(declare-fun b!1231332 () Bool)

(declare-fun res!819764 () Bool)

(assert (=> b!1231332 (=> (not res!819764) (not e!698486))))

(assert (=> b!1231332 (= res!819764 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38868 a!3806)) (bvslt from!3184 (size!38868 a!3806))))))

(declare-fun b!1231333 () Bool)

(declare-fun res!819762 () Bool)

(assert (=> b!1231333 (=> (not res!819762) (not e!698486))))

(declare-fun arrayContainsKey!0 (array!79431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231333 (= res!819762 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231334 () Bool)

(declare-fun res!819766 () Bool)

(assert (=> b!1231334 (=> res!819766 e!698487)))

(assert (=> b!1231334 (= res!819766 (contains!7167 Nil!27102 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102322 res!819771) b!1231330))

(assert (= (and b!1231330 res!819770) b!1231332))

(assert (= (and b!1231332 res!819764) b!1231331))

(assert (= (and b!1231331 res!819765) b!1231326))

(assert (= (and b!1231326 res!819761) b!1231323))

(assert (= (and b!1231323 res!819769) b!1231333))

(assert (= (and b!1231333 res!819762) b!1231324))

(assert (= (and b!1231324 res!819768) b!1231328))

(assert (= (and b!1231328 res!819767) b!1231329))

(assert (= (and b!1231329 (not res!819763)) b!1231325))

(assert (= (and b!1231325 (not res!819772)) b!1231334))

(assert (= (and b!1231334 (not res!819766)) b!1231327))

(declare-fun m!1135505 () Bool)

(assert (=> b!1231329 m!1135505))

(declare-fun m!1135507 () Bool)

(assert (=> b!1231329 m!1135507))

(assert (=> b!1231328 m!1135505))

(assert (=> b!1231328 m!1135505))

(declare-fun m!1135509 () Bool)

(assert (=> b!1231328 m!1135509))

(declare-fun m!1135511 () Bool)

(assert (=> b!1231324 m!1135511))

(declare-fun m!1135513 () Bool)

(assert (=> b!1231325 m!1135513))

(declare-fun m!1135515 () Bool)

(assert (=> start!102322 m!1135515))

(declare-fun m!1135517 () Bool)

(assert (=> b!1231323 m!1135517))

(declare-fun m!1135519 () Bool)

(assert (=> b!1231326 m!1135519))

(declare-fun m!1135521 () Bool)

(assert (=> b!1231333 m!1135521))

(declare-fun m!1135523 () Bool)

(assert (=> b!1231331 m!1135523))

(declare-fun m!1135525 () Bool)

(assert (=> b!1231327 m!1135525))

(declare-fun m!1135527 () Bool)

(assert (=> b!1231330 m!1135527))

(declare-fun m!1135529 () Bool)

(assert (=> b!1231334 m!1135529))

(push 1)

(assert (not b!1231323))

(assert (not b!1231328))

(assert (not b!1231329))

(assert (not b!1231327))

(assert (not b!1231325))

(assert (not start!102322))

(assert (not b!1231334))

(assert (not b!1231330))

(assert (not b!1231326))

(assert (not b!1231324))

(assert (not b!1231331))

(assert (not b!1231333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1231383 () Bool)

(declare-fun e!698534 () Bool)

(declare-fun call!60882 () Bool)

(assert (=> b!1231383 (= e!698534 call!60882)))

(declare-fun bm!60879 () Bool)

(declare-fun c!120645 () Bool)

(assert (=> bm!60879 (= call!60882 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120645 (Cons!27101 (select (arr!38332 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27101 (select (arr!38332 a!3806) from!3184) acc!823)) (Cons!27101 (select (arr!38332 a!3806) from!3184) acc!823))))))

(declare-fun b!1231384 () Bool)

(declare-fun e!698532 () Bool)

(declare-fun e!698533 () Bool)

(assert (=> b!1231384 (= e!698532 e!698533)))

(declare-fun res!819814 () Bool)

(assert (=> b!1231384 (=> (not res!819814) (not e!698533))))

(declare-fun e!698535 () Bool)

(assert (=> b!1231384 (= res!819814 (not e!698535))))

(declare-fun res!819813 () Bool)

(assert (=> b!1231384 (=> (not res!819813) (not e!698535))))

(assert (=> b!1231384 (= res!819813 (validKeyInArray!0 (select (arr!38332 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231385 () Bool)

(assert (=> b!1231385 (= e!698534 call!60882)))

(declare-fun d!134709 () Bool)

(declare-fun res!819815 () Bool)

(assert (=> d!134709 (=> res!819815 e!698532)))

(assert (=> d!134709 (= res!819815 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38868 a!3806)))))

(assert (=> d!134709 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27101 (select (arr!38332 a!3806) from!3184) acc!823)) e!698532)))

(declare-fun b!1231386 () Bool)

(assert (=> b!1231386 (= e!698535 (contains!7167 (Cons!27101 (select (arr!38332 a!3806) from!3184) acc!823) (select (arr!38332 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231387 () Bool)

(assert (=> b!1231387 (= e!698533 e!698534)))

(assert (=> b!1231387 (= c!120645 (validKeyInArray!0 (select (arr!38332 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134709 (not res!819815)) b!1231384))

(assert (= (and b!1231384 res!819813) b!1231386))

(assert (= (and b!1231384 res!819814) b!1231387))

(assert (= (and b!1231387 c!120645) b!1231385))

(assert (= (and b!1231387 (not c!120645)) b!1231383))

(assert (= (or b!1231385 b!1231383) bm!60879))

(declare-fun m!1135557 () Bool)

(assert (=> bm!60879 m!1135557))

(declare-fun m!1135561 () Bool)

(assert (=> bm!60879 m!1135561))

(assert (=> b!1231384 m!1135557))

(assert (=> b!1231384 m!1135557))

(declare-fun m!1135565 () Bool)

(assert (=> b!1231384 m!1135565))

(assert (=> b!1231386 m!1135557))

(assert (=> b!1231386 m!1135557))

(declare-fun m!1135567 () Bool)

(assert (=> b!1231386 m!1135567))

(assert (=> b!1231387 m!1135557))

(assert (=> b!1231387 m!1135557))

(assert (=> b!1231387 m!1135565))

(assert (=> b!1231329 d!134709))

(declare-fun d!134723 () Bool)

(assert (=> d!134723 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231330 d!134723))

(declare-fun d!134727 () Bool)

(declare-fun lt!559410 () Bool)

(declare-fun content!565 (List!27105) (Set (_ BitVec 64)))

(assert (=> d!134727 (= lt!559410 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!565 acc!823)))))

(declare-fun e!698560 () Bool)

(assert (=> d!134727 (= lt!559410 e!698560)))

(declare-fun res!819836 () Bool)

(assert (=> d!134727 (=> (not res!819836) (not e!698560))))

(assert (=> d!134727 (= res!819836 (is-Cons!27101 acc!823))))

(assert (=> d!134727 (= (contains!7167 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559410)))

(declare-fun b!1231416 () Bool)

(declare-fun e!698561 () Bool)

(assert (=> b!1231416 (= e!698560 e!698561)))

(declare-fun res!819837 () Bool)

(assert (=> b!1231416 (=> res!819837 e!698561)))

(assert (=> b!1231416 (= res!819837 (= (h!28310 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231417 () Bool)

(assert (=> b!1231417 (= e!698561 (contains!7167 (t!40568 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134727 res!819836) b!1231416))

(assert (= (and b!1231416 (not res!819837)) b!1231417))

(declare-fun m!1135577 () Bool)

(assert (=> d!134727 m!1135577))

(declare-fun m!1135579 () Bool)

(assert (=> d!134727 m!1135579))

(declare-fun m!1135583 () Bool)

(assert (=> b!1231417 m!1135583))

(assert (=> b!1231326 d!134727))

(declare-fun d!134733 () Bool)

(assert (=> d!134733 (= (array_inv!29180 a!3806) (bvsge (size!38868 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102322 d!134733))

(declare-fun b!1231453 () Bool)

(declare-fun e!698596 () Bool)

(assert (=> b!1231453 (= e!698596 (subseq!502 (t!40568 Nil!27102) (t!40568 acc!823)))))

(declare-fun b!1231451 () Bool)

(declare-fun e!698595 () Bool)

(declare-fun e!698597 () Bool)

(assert (=> b!1231451 (= e!698595 e!698597)))

(declare-fun res!819872 () Bool)

(assert (=> b!1231451 (=> (not res!819872) (not e!698597))))

(assert (=> b!1231451 (= res!819872 (is-Cons!27101 acc!823))))

(declare-fun b!1231454 () Bool)

(declare-fun e!698594 () Bool)

(assert (=> b!1231454 (= e!698594 (subseq!502 Nil!27102 (t!40568 acc!823)))))

(declare-fun d!134739 () Bool)

(declare-fun res!819870 () Bool)

(assert (=> d!134739 (=> res!819870 e!698595)))

(assert (=> d!134739 (= res!819870 (is-Nil!27102 Nil!27102))))

(assert (=> d!134739 (= (subseq!502 Nil!27102 acc!823) e!698595)))

(declare-fun b!1231452 () Bool)

(assert (=> b!1231452 (= e!698597 e!698594)))

(declare-fun res!819869 () Bool)

(assert (=> b!1231452 (=> res!819869 e!698594)))

(assert (=> b!1231452 (= res!819869 e!698596)))

(declare-fun res!819871 () Bool)

(assert (=> b!1231452 (=> (not res!819871) (not e!698596))))

(assert (=> b!1231452 (= res!819871 (= (h!28310 Nil!27102) (h!28310 acc!823)))))

(assert (= (and d!134739 (not res!819870)) b!1231451))

(assert (= (and b!1231451 res!819872) b!1231452))

(assert (= (and b!1231452 res!819871) b!1231453))

(assert (= (and b!1231452 (not res!819869)) b!1231454))

(declare-fun m!1135607 () Bool)

(assert (=> b!1231453 m!1135607))

(declare-fun m!1135609 () Bool)

(assert (=> b!1231454 m!1135609))

(assert (=> b!1231327 d!134739))

(declare-fun d!134749 () Bool)

(assert (=> d!134749 (= (validKeyInArray!0 (select (arr!38332 a!3806) from!3184)) (and (not (= (select (arr!38332 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38332 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231328 d!134749))

(declare-fun d!134751 () Bool)

(declare-fun lt!559414 () Bool)

(assert (=> d!134751 (= lt!559414 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!565 Nil!27102)))))

(declare-fun e!698600 () Bool)

(assert (=> d!134751 (= lt!559414 e!698600)))

(declare-fun res!819875 () Bool)

(assert (=> d!134751 (=> (not res!819875) (not e!698600))))

(assert (=> d!134751 (= res!819875 (is-Cons!27101 Nil!27102))))

(assert (=> d!134751 (= (contains!7167 Nil!27102 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559414)))

(declare-fun b!1231457 () Bool)

(declare-fun e!698601 () Bool)

(assert (=> b!1231457 (= e!698600 e!698601)))

(declare-fun res!819876 () Bool)

(assert (=> b!1231457 (=> res!819876 e!698601)))

(assert (=> b!1231457 (= res!819876 (= (h!28310 Nil!27102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231458 () Bool)

(assert (=> b!1231458 (= e!698601 (contains!7167 (t!40568 Nil!27102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134751 res!819875) b!1231457))

(assert (= (and b!1231457 (not res!819876)) b!1231458))

(declare-fun m!1135611 () Bool)

(assert (=> d!134751 m!1135611))

(declare-fun m!1135613 () Bool)

(assert (=> d!134751 m!1135613))

