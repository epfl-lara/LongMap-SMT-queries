; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102076 () Bool)

(assert start!102076)

(declare-fun b!1228806 () Bool)

(declare-fun res!817365 () Bool)

(declare-fun e!697461 () Bool)

(assert (=> b!1228806 (=> (not res!817365) (not e!697461))))

(declare-datatypes ((array!79302 0))(
  ( (array!79303 (arr!38272 (Array (_ BitVec 32) (_ BitVec 64))) (size!38808 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79302)

(declare-datatypes ((List!27045 0))(
  ( (Nil!27042) (Cons!27041 (h!28250 (_ BitVec 64)) (t!40508 List!27045)) )
))
(declare-fun acc!823 () List!27045)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79302 (_ BitVec 32) List!27045) Bool)

(assert (=> b!1228806 (= res!817365 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228807 () Bool)

(declare-fun res!817367 () Bool)

(assert (=> b!1228807 (=> (not res!817367) (not e!697461))))

(declare-fun contains!7107 (List!27045 (_ BitVec 64)) Bool)

(assert (=> b!1228807 (= res!817367 (not (contains!7107 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228808 () Bool)

(declare-fun res!817364 () Bool)

(assert (=> b!1228808 (=> (not res!817364) (not e!697461))))

(assert (=> b!1228808 (= res!817364 (not (contains!7107 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228809 () Bool)

(declare-fun res!817375 () Bool)

(assert (=> b!1228809 (=> (not res!817375) (not e!697461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228809 (= res!817375 (validKeyInArray!0 (select (arr!38272 a!3806) from!3184)))))

(declare-fun b!1228810 () Bool)

(declare-fun e!697459 () Bool)

(declare-fun lt!559054 () List!27045)

(assert (=> b!1228810 (= e!697459 (not (contains!7107 lt!559054 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!817371 () Bool)

(assert (=> start!102076 (=> (not res!817371) (not e!697461))))

(assert (=> start!102076 (= res!817371 (bvslt (size!38808 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102076 e!697461))

(declare-fun array_inv!29120 (array!79302) Bool)

(assert (=> start!102076 (array_inv!29120 a!3806)))

(assert (=> start!102076 true))

(declare-fun b!1228811 () Bool)

(declare-fun e!697460 () Bool)

(assert (=> b!1228811 (= e!697460 e!697459)))

(declare-fun res!817368 () Bool)

(assert (=> b!1228811 (=> (not res!817368) (not e!697459))))

(assert (=> b!1228811 (= res!817368 (not (contains!7107 lt!559054 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228812 () Bool)

(declare-fun res!817369 () Bool)

(assert (=> b!1228812 (=> (not res!817369) (not e!697461))))

(assert (=> b!1228812 (= res!817369 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38808 a!3806)) (bvslt from!3184 (size!38808 a!3806))))))

(declare-fun b!1228813 () Bool)

(declare-fun res!817373 () Bool)

(assert (=> b!1228813 (=> (not res!817373) (not e!697461))))

(declare-fun noDuplicate!1704 (List!27045) Bool)

(assert (=> b!1228813 (= res!817373 (noDuplicate!1704 acc!823))))

(declare-fun b!1228814 () Bool)

(assert (=> b!1228814 (= e!697461 (not e!697460))))

(declare-fun res!817366 () Bool)

(assert (=> b!1228814 (=> res!817366 e!697460)))

(assert (=> b!1228814 (= res!817366 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1228814 (= lt!559054 (Cons!27041 (select (arr!38272 a!3806) from!3184) Nil!27042))))

(assert (=> b!1228814 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27042)))

(declare-datatypes ((Unit!40710 0))(
  ( (Unit!40711) )
))
(declare-fun lt!559055 () Unit!40710)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79302 List!27045 List!27045 (_ BitVec 32)) Unit!40710)

(assert (=> b!1228814 (= lt!559055 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27042 from!3184))))

(assert (=> b!1228814 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27041 (select (arr!38272 a!3806) from!3184) acc!823))))

(declare-fun b!1228815 () Bool)

(declare-fun res!817370 () Bool)

(assert (=> b!1228815 (=> (not res!817370) (not e!697461))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1228815 (= res!817370 (validKeyInArray!0 k!2913))))

(declare-fun b!1228816 () Bool)

(declare-fun res!817372 () Bool)

(assert (=> b!1228816 (=> (not res!817372) (not e!697461))))

(declare-fun arrayContainsKey!0 (array!79302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228816 (= res!817372 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228817 () Bool)

(declare-fun res!817374 () Bool)

(assert (=> b!1228817 (=> res!817374 e!697460)))

(assert (=> b!1228817 (= res!817374 (not (noDuplicate!1704 lt!559054)))))

(assert (= (and start!102076 res!817371) b!1228815))

(assert (= (and b!1228815 res!817370) b!1228812))

(assert (= (and b!1228812 res!817369) b!1228813))

(assert (= (and b!1228813 res!817373) b!1228807))

(assert (= (and b!1228807 res!817367) b!1228808))

(assert (= (and b!1228808 res!817364) b!1228816))

(assert (= (and b!1228816 res!817372) b!1228806))

(assert (= (and b!1228806 res!817365) b!1228809))

(assert (= (and b!1228809 res!817375) b!1228814))

(assert (= (and b!1228814 (not res!817366)) b!1228817))

(assert (= (and b!1228817 (not res!817374)) b!1228811))

(assert (= (and b!1228811 res!817368) b!1228810))

(declare-fun m!1133347 () Bool)

(assert (=> b!1228809 m!1133347))

(assert (=> b!1228809 m!1133347))

(declare-fun m!1133349 () Bool)

(assert (=> b!1228809 m!1133349))

(declare-fun m!1133351 () Bool)

(assert (=> b!1228817 m!1133351))

(declare-fun m!1133353 () Bool)

(assert (=> b!1228808 m!1133353))

(declare-fun m!1133355 () Bool)

(assert (=> b!1228815 m!1133355))

(declare-fun m!1133357 () Bool)

(assert (=> b!1228811 m!1133357))

(declare-fun m!1133359 () Bool)

(assert (=> b!1228807 m!1133359))

(declare-fun m!1133361 () Bool)

(assert (=> start!102076 m!1133361))

(declare-fun m!1133363 () Bool)

(assert (=> b!1228813 m!1133363))

(assert (=> b!1228814 m!1133347))

(declare-fun m!1133365 () Bool)

(assert (=> b!1228814 m!1133365))

(declare-fun m!1133367 () Bool)

(assert (=> b!1228814 m!1133367))

(declare-fun m!1133369 () Bool)

(assert (=> b!1228814 m!1133369))

(declare-fun m!1133371 () Bool)

(assert (=> b!1228806 m!1133371))

(declare-fun m!1133373 () Bool)

(assert (=> b!1228816 m!1133373))

(declare-fun m!1133375 () Bool)

(assert (=> b!1228810 m!1133375))

(push 1)

(assert (not b!1228807))

(assert (not b!1228809))

(assert (not b!1228813))

(assert (not b!1228808))

(assert (not b!1228806))

(assert (not b!1228811))

(assert (not b!1228816))

(assert (not b!1228817))

(assert (not b!1228815))

(assert (not b!1228814))

(assert (not b!1228810))

(assert (not start!102076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134351 () Bool)

(assert (=> d!134351 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228815 d!134351))

(declare-fun d!134353 () Bool)

(declare-fun res!817411 () Bool)

(declare-fun e!697500 () Bool)

(assert (=> d!134353 (=> res!817411 e!697500)))

(assert (=> d!134353 (= res!817411 (= (select (arr!38272 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134353 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697500)))

(declare-fun b!1228859 () Bool)

(declare-fun e!697501 () Bool)

(assert (=> b!1228859 (= e!697500 e!697501)))

(declare-fun res!817412 () Bool)

(assert (=> b!1228859 (=> (not res!817412) (not e!697501))))

(assert (=> b!1228859 (= res!817412 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38808 a!3806)))))

(declare-fun b!1228860 () Bool)

(assert (=> b!1228860 (= e!697501 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134353 (not res!817411)) b!1228859))

(assert (= (and b!1228859 res!817412) b!1228860))

(declare-fun m!1133395 () Bool)

(assert (=> d!134353 m!1133395))

(declare-fun m!1133397 () Bool)

(assert (=> b!1228860 m!1133397))

(assert (=> b!1228816 d!134353))

(declare-fun b!1228895 () Bool)

(declare-fun e!697533 () Bool)

(declare-fun call!60837 () Bool)

(assert (=> b!1228895 (= e!697533 call!60837)))

(declare-fun b!1228896 () Bool)

(assert (=> b!1228896 (= e!697533 call!60837)))

(declare-fun d!134359 () Bool)

(declare-fun res!817439 () Bool)

(declare-fun e!697534 () Bool)

(assert (=> d!134359 (=> res!817439 e!697534)))

(assert (=> d!134359 (= res!817439 (bvsge from!3184 (size!38808 a!3806)))))

(assert (=> d!134359 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27042) e!697534)))

(declare-fun c!120588 () Bool)

(declare-fun bm!60834 () Bool)

(assert (=> bm!60834 (= call!60837 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120588 (Cons!27041 (select (arr!38272 a!3806) from!3184) Nil!27042) Nil!27042)))))

(declare-fun b!1228897 () Bool)

(declare-fun e!697532 () Bool)

(assert (=> b!1228897 (= e!697534 e!697532)))

(declare-fun res!817441 () Bool)

(assert (=> b!1228897 (=> (not res!817441) (not e!697532))))

(declare-fun e!697535 () Bool)

(assert (=> b!1228897 (= res!817441 (not e!697535))))

(declare-fun res!817440 () Bool)

(assert (=> b!1228897 (=> (not res!817440) (not e!697535))))

(assert (=> b!1228897 (= res!817440 (validKeyInArray!0 (select (arr!38272 a!3806) from!3184)))))

(declare-fun b!1228898 () Bool)

(assert (=> b!1228898 (= e!697535 (contains!7107 Nil!27042 (select (arr!38272 a!3806) from!3184)))))

(declare-fun b!1228899 () Bool)

(assert (=> b!1228899 (= e!697532 e!697533)))

(assert (=> b!1228899 (= c!120588 (validKeyInArray!0 (select (arr!38272 a!3806) from!3184)))))

(assert (= (and d!134359 (not res!817439)) b!1228897))

(assert (= (and b!1228897 res!817440) b!1228898))

(assert (= (and b!1228897 res!817441) b!1228899))

(assert (= (and b!1228899 c!120588) b!1228895))

(assert (= (and b!1228899 (not c!120588)) b!1228896))

(assert (= (or b!1228895 b!1228896) bm!60834))

(assert (=> bm!60834 m!1133347))

(declare-fun m!1133437 () Bool)

(assert (=> bm!60834 m!1133437))

(assert (=> b!1228897 m!1133347))

(assert (=> b!1228897 m!1133347))

(assert (=> b!1228897 m!1133349))

(assert (=> b!1228898 m!1133347))

(assert (=> b!1228898 m!1133347))

(declare-fun m!1133439 () Bool)

(assert (=> b!1228898 m!1133439))

(assert (=> b!1228899 m!1133347))

(assert (=> b!1228899 m!1133347))

(assert (=> b!1228899 m!1133349))

(assert (=> b!1228814 d!134359))

(declare-fun d!134381 () Bool)

(assert (=> d!134381 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27042)))

(declare-fun lt!559072 () Unit!40710)

(declare-fun choose!80 (array!79302 List!27045 List!27045 (_ BitVec 32)) Unit!40710)

(assert (=> d!134381 (= lt!559072 (choose!80 a!3806 acc!823 Nil!27042 from!3184))))

(assert (=> d!134381 (bvslt (size!38808 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134381 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27042 from!3184) lt!559072)))

(declare-fun bs!34542 () Bool)

(assert (= bs!34542 d!134381))

(assert (=> bs!34542 m!1133365))

(declare-fun m!1133457 () Bool)

(assert (=> bs!34542 m!1133457))

(assert (=> b!1228814 d!134381))

(declare-fun b!1228922 () Bool)

(declare-fun e!697557 () Bool)

(declare-fun call!60840 () Bool)

(assert (=> b!1228922 (= e!697557 call!60840)))

(declare-fun b!1228923 () Bool)

(assert (=> b!1228923 (= e!697557 call!60840)))

(declare-fun d!134391 () Bool)

(declare-fun res!817460 () Bool)

(declare-fun e!697558 () Bool)

(assert (=> d!134391 (=> res!817460 e!697558)))

(assert (=> d!134391 (= res!817460 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38808 a!3806)))))

(assert (=> d!134391 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27041 (select (arr!38272 a!3806) from!3184) acc!823)) e!697558)))

(declare-fun bm!60837 () Bool)

(declare-fun c!120591 () Bool)

(assert (=> bm!60837 (= call!60840 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120591 (Cons!27041 (select (arr!38272 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27041 (select (arr!38272 a!3806) from!3184) acc!823)) (Cons!27041 (select (arr!38272 a!3806) from!3184) acc!823))))))

(declare-fun b!1228924 () Bool)

(declare-fun e!697556 () Bool)

(assert (=> b!1228924 (= e!697558 e!697556)))

(declare-fun res!817462 () Bool)

(assert (=> b!1228924 (=> (not res!817462) (not e!697556))))

(declare-fun e!697559 () Bool)

(assert (=> b!1228924 (= res!817462 (not e!697559))))

(declare-fun res!817461 () Bool)

(assert (=> b!1228924 (=> (not res!817461) (not e!697559))))

(assert (=> b!1228924 (= res!817461 (validKeyInArray!0 (select (arr!38272 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228925 () Bool)

(assert (=> b!1228925 (= e!697559 (contains!7107 (Cons!27041 (select (arr!38272 a!3806) from!3184) acc!823) (select (arr!38272 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228926 () Bool)

(assert (=> b!1228926 (= e!697556 e!697557)))

(assert (=> b!1228926 (= c!120591 (validKeyInArray!0 (select (arr!38272 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134391 (not res!817460)) b!1228924))

(assert (= (and b!1228924 res!817461) b!1228925))

(assert (= (and b!1228924 res!817462) b!1228926))

(assert (= (and b!1228926 c!120591) b!1228922))

(assert (= (and b!1228926 (not c!120591)) b!1228923))

(assert (= (or b!1228922 b!1228923) bm!60837))

(assert (=> bm!60837 m!1133395))

(declare-fun m!1133459 () Bool)

(assert (=> bm!60837 m!1133459))

(assert (=> b!1228924 m!1133395))

(assert (=> b!1228924 m!1133395))

(declare-fun m!1133461 () Bool)

(assert (=> b!1228924 m!1133461))

(assert (=> b!1228925 m!1133395))

(assert (=> b!1228925 m!1133395))

(declare-fun m!1133463 () Bool)

(assert (=> b!1228925 m!1133463))

(assert (=> b!1228926 m!1133395))

(assert (=> b!1228926 m!1133395))

(assert (=> b!1228926 m!1133461))

(assert (=> b!1228814 d!134391))

(declare-fun d!134393 () Bool)

(declare-fun lt!559076 () Bool)

(declare-fun content!558 (List!27045) (Set (_ BitVec 64)))

(assert (=> d!134393 (= lt!559076 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!558 acc!823)))))

(declare-fun e!697577 () Bool)

(assert (=> d!134393 (= lt!559076 e!697577)))

(declare-fun res!817477 () Bool)

(assert (=> d!134393 (=> (not res!817477) (not e!697577))))

(assert (=> d!134393 (= res!817477 (is-Cons!27041 acc!823))))

(assert (=> d!134393 (= (contains!7107 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559076)))

(declare-fun b!1228945 () Bool)

(declare-fun e!697576 () Bool)

(assert (=> b!1228945 (= e!697577 e!697576)))

(declare-fun res!817478 () Bool)

(assert (=> b!1228945 (=> res!817478 e!697576)))

(assert (=> b!1228945 (= res!817478 (= (h!28250 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228946 () Bool)

(assert (=> b!1228946 (= e!697576 (contains!7107 (t!40508 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134393 res!817477) b!1228945))

(assert (= (and b!1228945 (not res!817478)) b!1228946))

(declare-fun m!1133481 () Bool)

(assert (=> d!134393 m!1133481))

(declare-fun m!1133483 () Bool)

(assert (=> d!134393 m!1133483))

(declare-fun m!1133485 () Bool)

(assert (=> b!1228946 m!1133485))

(assert (=> b!1228807 d!134393))

(declare-fun d!134403 () Bool)

(declare-fun lt!559077 () Bool)

(assert (=> d!134403 (= lt!559077 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!558 acc!823)))))

(declare-fun e!697579 () Bool)

(assert (=> d!134403 (= lt!559077 e!697579)))

(declare-fun res!817479 () Bool)

(assert (=> d!134403 (=> (not res!817479) (not e!697579))))

(assert (=> d!134403 (= res!817479 (is-Cons!27041 acc!823))))

(assert (=> d!134403 (= (contains!7107 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559077)))

(declare-fun b!1228947 () Bool)

(declare-fun e!697578 () Bool)

(assert (=> b!1228947 (= e!697579 e!697578)))

(declare-fun res!817480 () Bool)

(assert (=> b!1228947 (=> res!817480 e!697578)))

(assert (=> b!1228947 (= res!817480 (= (h!28250 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228948 () Bool)

(assert (=> b!1228948 (= e!697578 (contains!7107 (t!40508 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134403 res!817479) b!1228947))

(assert (= (and b!1228947 (not res!817480)) b!1228948))

(assert (=> d!134403 m!1133481))

(declare-fun m!1133487 () Bool)

(assert (=> d!134403 m!1133487))

(declare-fun m!1133489 () Bool)

(assert (=> b!1228948 m!1133489))

(assert (=> b!1228808 d!134403))

(declare-fun b!1228949 () Bool)

(declare-fun e!697581 () Bool)

(declare-fun call!60843 () Bool)

(assert (=> b!1228949 (= e!697581 call!60843)))

(declare-fun b!1228950 () Bool)

(assert (=> b!1228950 (= e!697581 call!60843)))

(declare-fun d!134405 () Bool)

(declare-fun res!817481 () Bool)

(declare-fun e!697582 () Bool)

(assert (=> d!134405 (=> res!817481 e!697582)))

(assert (=> d!134405 (= res!817481 (bvsge from!3184 (size!38808 a!3806)))))

(assert (=> d!134405 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697582)))

(declare-fun bm!60840 () Bool)

(declare-fun c!120594 () Bool)

(assert (=> bm!60840 (= call!60843 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120594 (Cons!27041 (select (arr!38272 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1228951 () Bool)

(declare-fun e!697580 () Bool)

(assert (=> b!1228951 (= e!697582 e!697580)))

(declare-fun res!817483 () Bool)

(assert (=> b!1228951 (=> (not res!817483) (not e!697580))))

(declare-fun e!697583 () Bool)

(assert (=> b!1228951 (= res!817483 (not e!697583))))

(declare-fun res!817482 () Bool)

(assert (=> b!1228951 (=> (not res!817482) (not e!697583))))

(assert (=> b!1228951 (= res!817482 (validKeyInArray!0 (select (arr!38272 a!3806) from!3184)))))

(declare-fun b!1228952 () Bool)

(assert (=> b!1228952 (= e!697583 (contains!7107 acc!823 (select (arr!38272 a!3806) from!3184)))))

(declare-fun b!1228953 () Bool)

(assert (=> b!1228953 (= e!697580 e!697581)))

(assert (=> b!1228953 (= c!120594 (validKeyInArray!0 (select (arr!38272 a!3806) from!3184)))))

(assert (= (and d!134405 (not res!817481)) b!1228951))

(assert (= (and b!1228951 res!817482) b!1228952))

(assert (= (and b!1228951 res!817483) b!1228953))

(assert (= (and b!1228953 c!120594) b!1228949))

(assert (= (and b!1228953 (not c!120594)) b!1228950))

(assert (= (or b!1228949 b!1228950) bm!60840))

(assert (=> bm!60840 m!1133347))

(declare-fun m!1133491 () Bool)

(assert (=> bm!60840 m!1133491))

(assert (=> b!1228951 m!1133347))

(assert (=> b!1228951 m!1133347))

(assert (=> b!1228951 m!1133349))

(assert (=> b!1228952 m!1133347))

(assert (=> b!1228952 m!1133347))

(declare-fun m!1133493 () Bool)

(assert (=> b!1228952 m!1133493))

(assert (=> b!1228953 m!1133347))

(assert (=> b!1228953 m!1133347))

(assert (=> b!1228953 m!1133349))

(assert (=> b!1228806 d!134405))

(declare-fun d!134407 () Bool)

(declare-fun res!817491 () Bool)

(declare-fun e!697592 () Bool)

(assert (=> d!134407 (=> res!817491 e!697592)))

(assert (=> d!134407 (= res!817491 (is-Nil!27042 lt!559054))))

(assert (=> d!134407 (= (noDuplicate!1704 lt!559054) e!697592)))

(declare-fun b!1228963 () Bool)

(declare-fun e!697593 () Bool)

(assert (=> b!1228963 (= e!697592 e!697593)))

(declare-fun res!817492 () Bool)

(assert (=> b!1228963 (=> (not res!817492) (not e!697593))))

(assert (=> b!1228963 (= res!817492 (not (contains!7107 (t!40508 lt!559054) (h!28250 lt!559054))))))

(declare-fun b!1228964 () Bool)

(assert (=> b!1228964 (= e!697593 (noDuplicate!1704 (t!40508 lt!559054)))))

(assert (= (and d!134407 (not res!817491)) b!1228963))

(assert (= (and b!1228963 res!817492) b!1228964))

(declare-fun m!1133503 () Bool)

(assert (=> b!1228963 m!1133503))

(declare-fun m!1133505 () Bool)

(assert (=> b!1228964 m!1133505))

(assert (=> b!1228817 d!134407))

(declare-fun d!134413 () Bool)

(declare-fun lt!559081 () Bool)

(assert (=> d!134413 (= lt!559081 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!558 lt!559054)))))

(declare-fun e!697595 () Bool)

(assert (=> d!134413 (= lt!559081 e!697595)))

(declare-fun res!817493 () Bool)

(assert (=> d!134413 (=> (not res!817493) (not e!697595))))

(assert (=> d!134413 (= res!817493 (is-Cons!27041 lt!559054))))

(assert (=> d!134413 (= (contains!7107 lt!559054 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559081)))

(declare-fun b!1228965 () Bool)

(declare-fun e!697594 () Bool)

(assert (=> b!1228965 (= e!697595 e!697594)))

(declare-fun res!817494 () Bool)

(assert (=> b!1228965 (=> res!817494 e!697594)))

(assert (=> b!1228965 (= res!817494 (= (h!28250 lt!559054) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228966 () Bool)

(assert (=> b!1228966 (= e!697594 (contains!7107 (t!40508 lt!559054) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134413 res!817493) b!1228965))

(assert (= (and b!1228965 (not res!817494)) b!1228966))

(declare-fun m!1133507 () Bool)

(assert (=> d!134413 m!1133507))

(declare-fun m!1133509 () Bool)

(assert (=> d!134413 m!1133509))

(declare-fun m!1133511 () Bool)

(assert (=> b!1228966 m!1133511))

(assert (=> b!1228810 d!134413))

(declare-fun d!134417 () Bool)

(assert (=> d!134417 (= (validKeyInArray!0 (select (arr!38272 a!3806) from!3184)) (and (not (= (select (arr!38272 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38272 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228809 d!134417))

(declare-fun d!134419 () Bool)

(assert (=> d!134419 (= (array_inv!29120 a!3806) (bvsge (size!38808 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102076 d!134419))

(declare-fun d!134421 () Bool)

(declare-fun res!817495 () Bool)

(declare-fun e!697596 () Bool)

(assert (=> d!134421 (=> res!817495 e!697596)))

(assert (=> d!134421 (= res!817495 (is-Nil!27042 acc!823))))

(assert (=> d!134421 (= (noDuplicate!1704 acc!823) e!697596)))

(declare-fun b!1228967 () Bool)

(declare-fun e!697597 () Bool)

(assert (=> b!1228967 (= e!697596 e!697597)))

(declare-fun res!817496 () Bool)

(assert (=> b!1228967 (=> (not res!817496) (not e!697597))))

(assert (=> b!1228967 (= res!817496 (not (contains!7107 (t!40508 acc!823) (h!28250 acc!823))))))

(declare-fun b!1228968 () Bool)

(assert (=> b!1228968 (= e!697597 (noDuplicate!1704 (t!40508 acc!823)))))

(assert (= (and d!134421 (not res!817495)) b!1228967))

(assert (= (and b!1228967 res!817496) b!1228968))

(declare-fun m!1133513 () Bool)

(assert (=> b!1228967 m!1133513))

(declare-fun m!1133515 () Bool)

(assert (=> b!1228968 m!1133515))

(assert (=> b!1228813 d!134421))

(declare-fun d!134423 () Bool)

(declare-fun lt!559082 () Bool)

(assert (=> d!134423 (= lt!559082 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!558 lt!559054)))))

(declare-fun e!697599 () Bool)

(assert (=> d!134423 (= lt!559082 e!697599)))

(declare-fun res!817497 () Bool)

(assert (=> d!134423 (=> (not res!817497) (not e!697599))))

(assert (=> d!134423 (= res!817497 (is-Cons!27041 lt!559054))))

(assert (=> d!134423 (= (contains!7107 lt!559054 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559082)))

(declare-fun b!1228969 () Bool)

(declare-fun e!697598 () Bool)

(assert (=> b!1228969 (= e!697599 e!697598)))

(declare-fun res!817498 () Bool)

(assert (=> b!1228969 (=> res!817498 e!697598)))

(assert (=> b!1228969 (= res!817498 (= (h!28250 lt!559054) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228970 () Bool)

(assert (=> b!1228970 (= e!697598 (contains!7107 (t!40508 lt!559054) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134423 res!817497) b!1228969))

(assert (= (and b!1228969 (not res!817498)) b!1228970))

(assert (=> d!134423 m!1133507))

(declare-fun m!1133517 () Bool)

(assert (=> d!134423 m!1133517))

(declare-fun m!1133519 () Bool)

(assert (=> b!1228970 m!1133519))

(assert (=> b!1228811 d!134423))

(push 1)

(assert (not d!134423))

(assert (not b!1228897))

(assert (not b!1228951))

(assert (not b!1228952))

(assert (not d!134393))

(assert (not b!1228925))

(assert (not b!1228966))

(assert (not d!134381))

(assert (not b!1228963))

(assert (not b!1228946))

(assert (not bm!60840))

(assert (not b!1228898))

(assert (not b!1228953))

(assert (not bm!60837))

(assert (not b!1228967))

(assert (not d!134403))

(assert (not b!1228926))

(assert (not b!1228899))

(assert (not b!1228968))

(assert (not b!1228970))

(assert (not b!1228924))

(assert (not b!1228860))

(assert (not b!1228964))

(assert (not bm!60834))

(assert (not d!134413))

(assert (not b!1228948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!1228899 d!134417))

(assert (=> d!134381 d!134359))

(declare-fun d!134501 () Bool)

(assert (=> d!134501 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27042)))

(assert (=> d!134501 true))

(declare-fun _$70!86 () Unit!40710)

(assert (=> d!134501 (= (choose!80 a!3806 acc!823 Nil!27042 from!3184) _$70!86)))

(declare-fun bs!34546 () Bool)

(assert (= bs!34546 d!134501))

(assert (=> bs!34546 m!1133365))

(assert (=> d!134381 d!134501))

(declare-fun d!134503 () Bool)

(declare-fun lt!559101 () Bool)

(assert (=> d!134503 (= lt!559101 (member (select (arr!38272 a!3806) from!3184) (content!558 Nil!27042)))))

(declare-fun e!697681 () Bool)

(assert (=> d!134503 (= lt!559101 e!697681)))

(declare-fun res!817565 () Bool)

(assert (=> d!134503 (=> (not res!817565) (not e!697681))))

(assert (=> d!134503 (= res!817565 (is-Cons!27041 Nil!27042))))

(assert (=> d!134503 (= (contains!7107 Nil!27042 (select (arr!38272 a!3806) from!3184)) lt!559101)))

(declare-fun b!1229065 () Bool)

(declare-fun e!697680 () Bool)

