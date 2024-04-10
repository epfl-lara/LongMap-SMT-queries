; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103366 () Bool)

(assert start!103366)

(declare-fun b!1239932 () Bool)

(declare-fun res!827263 () Bool)

(declare-fun e!702702 () Bool)

(assert (=> b!1239932 (=> (not res!827263) (not e!702702))))

(declare-datatypes ((List!27315 0))(
  ( (Nil!27312) (Cons!27311 (h!28520 (_ BitVec 64)) (t!40778 List!27315)) )
))
(declare-fun acc!846 () List!27315)

(declare-fun contains!7377 (List!27315 (_ BitVec 64)) Bool)

(assert (=> b!1239932 (= res!827263 (not (contains!7377 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!827264 () Bool)

(assert (=> start!103366 (=> (not res!827264) (not e!702702))))

(declare-datatypes ((array!79887 0))(
  ( (array!79888 (arr!38542 (Array (_ BitVec 32) (_ BitVec 64))) (size!39078 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79887)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103366 (= res!827264 (and (bvslt (size!39078 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39078 a!3835))))))

(assert (=> start!103366 e!702702))

(declare-fun array_inv!29390 (array!79887) Bool)

(assert (=> start!103366 (array_inv!29390 a!3835)))

(assert (=> start!103366 true))

(declare-fun b!1239933 () Bool)

(declare-fun res!827260 () Bool)

(assert (=> b!1239933 (=> (not res!827260) (not e!702702))))

(assert (=> b!1239933 (= res!827260 (= from!3213 (bvsub (size!39078 a!3835) #b00000000000000000000000000000001)))))

(declare-fun b!1239934 () Bool)

(declare-fun res!827266 () Bool)

(assert (=> b!1239934 (=> (not res!827266) (not e!702702))))

(declare-fun noDuplicate!1974 (List!27315) Bool)

(assert (=> b!1239934 (= res!827266 (noDuplicate!1974 acc!846))))

(declare-fun b!1239935 () Bool)

(declare-fun res!827261 () Bool)

(assert (=> b!1239935 (=> (not res!827261) (not e!702702))))

(declare-fun arrayNoDuplicates!0 (array!79887 (_ BitVec 32) List!27315) Bool)

(assert (=> b!1239935 (= res!827261 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239936 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1239936 (= e!702702 (arrayContainsKey!0 a!3835 k!2925 from!3213))))

(declare-fun b!1239937 () Bool)

(declare-fun res!827262 () Bool)

(assert (=> b!1239937 (=> (not res!827262) (not e!702702))))

(assert (=> b!1239937 (= res!827262 (not (contains!7377 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239938 () Bool)

(declare-fun res!827265 () Bool)

(assert (=> b!1239938 (=> (not res!827265) (not e!702702))))

(assert (=> b!1239938 (= res!827265 (contains!7377 acc!846 k!2925))))

(assert (= (and start!103366 res!827264) b!1239934))

(assert (= (and b!1239934 res!827266) b!1239932))

(assert (= (and b!1239932 res!827263) b!1239937))

(assert (= (and b!1239937 res!827262) b!1239935))

(assert (= (and b!1239935 res!827261) b!1239938))

(assert (= (and b!1239938 res!827265) b!1239933))

(assert (= (and b!1239933 res!827260) b!1239936))

(declare-fun m!1143287 () Bool)

(assert (=> b!1239937 m!1143287))

(declare-fun m!1143289 () Bool)

(assert (=> b!1239936 m!1143289))

(declare-fun m!1143291 () Bool)

(assert (=> b!1239938 m!1143291))

(declare-fun m!1143293 () Bool)

(assert (=> b!1239935 m!1143293))

(declare-fun m!1143295 () Bool)

(assert (=> start!103366 m!1143295))

(declare-fun m!1143297 () Bool)

(assert (=> b!1239934 m!1143297))

(declare-fun m!1143299 () Bool)

(assert (=> b!1239932 m!1143299))

(push 1)

(assert (not b!1239932))

(assert (not b!1239938))

(assert (not b!1239936))

(assert (not b!1239934))

(assert (not b!1239937))

(assert (not start!103366))

(assert (not b!1239935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136147 () Bool)

(declare-fun res!827290 () Bool)

(declare-fun e!702729 () Bool)

(assert (=> d!136147 (=> res!827290 e!702729)))

(assert (=> d!136147 (= res!827290 (= (select (arr!38542 a!3835) from!3213) k!2925))))

(assert (=> d!136147 (= (arrayContainsKey!0 a!3835 k!2925 from!3213) e!702729)))

(declare-fun b!1239968 () Bool)

(declare-fun e!702730 () Bool)

(assert (=> b!1239968 (= e!702729 e!702730)))

(declare-fun res!827291 () Bool)

(assert (=> b!1239968 (=> (not res!827291) (not e!702730))))

(assert (=> b!1239968 (= res!827291 (bvslt (bvadd from!3213 #b00000000000000000000000000000001) (size!39078 a!3835)))))

(declare-fun b!1239969 () Bool)

(assert (=> b!1239969 (= e!702730 (arrayContainsKey!0 a!3835 k!2925 (bvadd from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136147 (not res!827290)) b!1239968))

(assert (= (and b!1239968 res!827291) b!1239969))

(declare-fun m!1143315 () Bool)

(assert (=> d!136147 m!1143315))

(declare-fun m!1143319 () Bool)

(assert (=> b!1239969 m!1143319))

(assert (=> b!1239936 d!136147))

(declare-fun d!136153 () Bool)

(declare-fun res!827306 () Bool)

(declare-fun e!702745 () Bool)

(assert (=> d!136153 (=> res!827306 e!702745)))

(assert (=> d!136153 (= res!827306 (is-Nil!27312 acc!846))))

(assert (=> d!136153 (= (noDuplicate!1974 acc!846) e!702745)))

(declare-fun b!1239984 () Bool)

(declare-fun e!702746 () Bool)

(assert (=> b!1239984 (= e!702745 e!702746)))

(declare-fun res!827307 () Bool)

(assert (=> b!1239984 (=> (not res!827307) (not e!702746))))

(assert (=> b!1239984 (= res!827307 (not (contains!7377 (t!40778 acc!846) (h!28520 acc!846))))))

(declare-fun b!1239985 () Bool)

(assert (=> b!1239985 (= e!702746 (noDuplicate!1974 (t!40778 acc!846)))))

(assert (= (and d!136153 (not res!827306)) b!1239984))

(assert (= (and b!1239984 res!827307) b!1239985))

(declare-fun m!1143333 () Bool)

(assert (=> b!1239984 m!1143333))

(declare-fun m!1143335 () Bool)

(assert (=> b!1239985 m!1143335))

(assert (=> b!1239934 d!136153))

(declare-fun b!1240029 () Bool)

(declare-fun e!702787 () Bool)

(declare-fun call!61126 () Bool)

(assert (=> b!1240029 (= e!702787 call!61126)))

(declare-fun bm!61123 () Bool)

(declare-fun c!121204 () Bool)

(assert (=> bm!61123 (= call!61126 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121204 (Cons!27311 (select (arr!38542 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1240030 () Bool)

(assert (=> b!1240030 (= e!702787 call!61126)))

(declare-fun b!1240031 () Bool)

(declare-fun e!702788 () Bool)

(declare-fun e!702786 () Bool)

(assert (=> b!1240031 (= e!702788 e!702786)))

(declare-fun res!827341 () Bool)

(assert (=> b!1240031 (=> (not res!827341) (not e!702786))))

(declare-fun e!702785 () Bool)

(assert (=> b!1240031 (= res!827341 (not e!702785))))

(declare-fun res!827342 () Bool)

(assert (=> b!1240031 (=> (not res!827342) (not e!702785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240031 (= res!827342 (validKeyInArray!0 (select (arr!38542 a!3835) from!3213)))))

(declare-fun b!1240032 () Bool)

(assert (=> b!1240032 (= e!702785 (contains!7377 acc!846 (select (arr!38542 a!3835) from!3213)))))

(declare-fun b!1240033 () Bool)

(assert (=> b!1240033 (= e!702786 e!702787)))

(assert (=> b!1240033 (= c!121204 (validKeyInArray!0 (select (arr!38542 a!3835) from!3213)))))

(declare-fun d!136161 () Bool)

(declare-fun res!827343 () Bool)

(assert (=> d!136161 (=> res!827343 e!702788)))

(assert (=> d!136161 (= res!827343 (bvsge from!3213 (size!39078 a!3835)))))

(assert (=> d!136161 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702788)))

(assert (= (and d!136161 (not res!827343)) b!1240031))

(assert (= (and b!1240031 res!827342) b!1240032))

(assert (= (and b!1240031 res!827341) b!1240033))

(assert (= (and b!1240033 c!121204) b!1240030))

(assert (= (and b!1240033 (not c!121204)) b!1240029))

(assert (= (or b!1240030 b!1240029) bm!61123))

(assert (=> bm!61123 m!1143315))

(declare-fun m!1143363 () Bool)

(assert (=> bm!61123 m!1143363))

(assert (=> b!1240031 m!1143315))

(assert (=> b!1240031 m!1143315))

(declare-fun m!1143365 () Bool)

(assert (=> b!1240031 m!1143365))

(assert (=> b!1240032 m!1143315))

(assert (=> b!1240032 m!1143315))

(declare-fun m!1143367 () Bool)

(assert (=> b!1240032 m!1143367))

(assert (=> b!1240033 m!1143315))

(assert (=> b!1240033 m!1143315))

(assert (=> b!1240033 m!1143365))

(assert (=> b!1239935 d!136161))

(declare-fun d!136175 () Bool)

(assert (=> d!136175 (= (array_inv!29390 a!3835) (bvsge (size!39078 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103366 d!136175))

(declare-fun d!136177 () Bool)

(declare-fun lt!561870 () Bool)

(declare-fun content!601 (List!27315) (Set (_ BitVec 64)))

(assert (=> d!136177 (= lt!561870 (member k!2925 (content!601 acc!846)))))

(declare-fun e!702799 () Bool)

(assert (=> d!136177 (= lt!561870 e!702799)))

(declare-fun res!827355 () Bool)

(assert (=> d!136177 (=> (not res!827355) (not e!702799))))

(assert (=> d!136177 (= res!827355 (is-Cons!27311 acc!846))))

(assert (=> d!136177 (= (contains!7377 acc!846 k!2925) lt!561870)))

(declare-fun b!1240044 () Bool)

(declare-fun e!702800 () Bool)

(assert (=> b!1240044 (= e!702799 e!702800)))

(declare-fun res!827354 () Bool)

(assert (=> b!1240044 (=> res!827354 e!702800)))

(assert (=> b!1240044 (= res!827354 (= (h!28520 acc!846) k!2925))))

(declare-fun b!1240045 () Bool)

(assert (=> b!1240045 (= e!702800 (contains!7377 (t!40778 acc!846) k!2925))))

(assert (= (and d!136177 res!827355) b!1240044))

(assert (= (and b!1240044 (not res!827354)) b!1240045))

(declare-fun m!1143371 () Bool)

(assert (=> d!136177 m!1143371))

(declare-fun m!1143373 () Bool)

(assert (=> d!136177 m!1143373))

(declare-fun m!1143375 () Bool)

(assert (=> b!1240045 m!1143375))

(assert (=> b!1239938 d!136177))

(declare-fun d!136179 () Bool)

(declare-fun lt!561871 () Bool)

(assert (=> d!136179 (= lt!561871 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!601 acc!846)))))

(declare-fun e!702801 () Bool)

(assert (=> d!136179 (= lt!561871 e!702801)))

(declare-fun res!827357 () Bool)

(assert (=> d!136179 (=> (not res!827357) (not e!702801))))

(assert (=> d!136179 (= res!827357 (is-Cons!27311 acc!846))))

(assert (=> d!136179 (= (contains!7377 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561871)))

(declare-fun b!1240046 () Bool)

(declare-fun e!702802 () Bool)

(assert (=> b!1240046 (= e!702801 e!702802)))

(declare-fun res!827356 () Bool)

(assert (=> b!1240046 (=> res!827356 e!702802)))

(assert (=> b!1240046 (= res!827356 (= (h!28520 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1240047 () Bool)

(assert (=> b!1240047 (= e!702802 (contains!7377 (t!40778 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136179 res!827357) b!1240046))

(assert (= (and b!1240046 (not res!827356)) b!1240047))

(assert (=> d!136179 m!1143371))

(declare-fun m!1143377 () Bool)

(assert (=> d!136179 m!1143377))

(declare-fun m!1143379 () Bool)

(assert (=> b!1240047 m!1143379))

(assert (=> b!1239937 d!136179))

(declare-fun d!136181 () Bool)

(declare-fun lt!561872 () Bool)

(assert (=> d!136181 (= lt!561872 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!601 acc!846)))))

(declare-fun e!702803 () Bool)

(assert (=> d!136181 (= lt!561872 e!702803)))

(declare-fun res!827359 () Bool)

(assert (=> d!136181 (=> (not res!827359) (not e!702803))))

(assert (=> d!136181 (= res!827359 (is-Cons!27311 acc!846))))

(assert (=> d!136181 (= (contains!7377 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561872)))

(declare-fun b!1240048 () Bool)

(declare-fun e!702804 () Bool)

(assert (=> b!1240048 (= e!702803 e!702804)))

(declare-fun res!827358 () Bool)

(assert (=> b!1240048 (=> res!827358 e!702804)))

(assert (=> b!1240048 (= res!827358 (= (h!28520 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1240049 () Bool)

(assert (=> b!1240049 (= e!702804 (contains!7377 (t!40778 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136181 res!827359) b!1240048))

(assert (= (and b!1240048 (not res!827358)) b!1240049))

(assert (=> d!136181 m!1143371))

(declare-fun m!1143381 () Bool)

(assert (=> d!136181 m!1143381))

(declare-fun m!1143383 () Bool)

(assert (=> b!1240049 m!1143383))

(assert (=> b!1239932 d!136181))

(push 1)

(assert (not b!1239969))

(assert (not b!1240032))

(assert (not b!1240031))

(assert (not d!136181))

(assert (not b!1240047))

(assert (not bm!61123))

(assert (not b!1239984))

(assert (not b!1240049))

(assert (not b!1240033))

(assert (not d!136179))

(assert (not b!1239985))

(assert (not d!136177))

(assert (not b!1240045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136223 () Bool)

(declare-fun lt!561883 () Bool)

(assert (=> d!136223 (= lt!561883 (member (h!28520 acc!846) (content!601 (t!40778 acc!846))))))

(declare-fun e!702847 () Bool)

(assert (=> d!136223 (= lt!561883 e!702847)))

(declare-fun res!827395 () Bool)

(assert (=> d!136223 (=> (not res!827395) (not e!702847))))

(assert (=> d!136223 (= res!827395 (is-Cons!27311 (t!40778 acc!846)))))

(assert (=> d!136223 (= (contains!7377 (t!40778 acc!846) (h!28520 acc!846)) lt!561883)))

(declare-fun b!1240100 () Bool)

(declare-fun e!702848 () Bool)

(assert (=> b!1240100 (= e!702847 e!702848)))

(declare-fun res!827394 () Bool)

(assert (=> b!1240100 (=> res!827394 e!702848)))

(assert (=> b!1240100 (= res!827394 (= (h!28520 (t!40778 acc!846)) (h!28520 acc!846)))))

(declare-fun b!1240101 () Bool)

(assert (=> b!1240101 (= e!702848 (contains!7377 (t!40778 (t!40778 acc!846)) (h!28520 acc!846)))))

(assert (= (and d!136223 res!827395) b!1240100))

(assert (= (and b!1240100 (not res!827394)) b!1240101))

(declare-fun m!1143461 () Bool)

(assert (=> d!136223 m!1143461))

(declare-fun m!1143463 () Bool)

(assert (=> d!136223 m!1143463))

(declare-fun m!1143465 () Bool)

(assert (=> b!1240101 m!1143465))

(assert (=> b!1239984 d!136223))

(declare-fun d!136225 () Bool)

(declare-fun c!121215 () Bool)

(assert (=> d!136225 (= c!121215 (is-Nil!27312 acc!846))))

(declare-fun e!702851 () (Set (_ BitVec 64)))

(assert (=> d!136225 (= (content!601 acc!846) e!702851)))

(declare-fun b!1240106 () Bool)

(assert (=> b!1240106 (= e!702851 (as emptyset (Set (_ BitVec 64))))))

(declare-fun b!1240107 () Bool)

(assert (=> b!1240107 (= e!702851 (union (insert (h!28520 acc!846) (as emptyset (Set (_ BitVec 64)))) (content!601 (t!40778 acc!846))))))

(assert (= (and d!136225 c!121215) b!1240106))

(assert (= (and d!136225 (not c!121215)) b!1240107))

(declare-fun m!1143467 () Bool)

(assert (=> b!1240107 m!1143467))

(assert (=> b!1240107 m!1143461))

(assert (=> d!136181 d!136225))

(declare-fun d!136227 () Bool)

(declare-fun res!827396 () Bool)

(declare-fun e!702852 () Bool)

(assert (=> d!136227 (=> res!827396 e!702852)))

(assert (=> d!136227 (= res!827396 (is-Nil!27312 (t!40778 acc!846)))))

(assert (=> d!136227 (= (noDuplicate!1974 (t!40778 acc!846)) e!702852)))

(declare-fun b!1240108 () Bool)

(declare-fun e!702853 () Bool)

(assert (=> b!1240108 (= e!702852 e!702853)))

(declare-fun res!827397 () Bool)

(assert (=> b!1240108 (=> (not res!827397) (not e!702853))))

(assert (=> b!1240108 (= res!827397 (not (contains!7377 (t!40778 (t!40778 acc!846)) (h!28520 (t!40778 acc!846)))))))

(declare-fun b!1240109 () Bool)

(assert (=> b!1240109 (= e!702853 (noDuplicate!1974 (t!40778 (t!40778 acc!846))))))

(assert (= (and d!136227 (not res!827396)) b!1240108))

(assert (= (and b!1240108 res!827397) b!1240109))

(declare-fun m!1143469 () Bool)

(assert (=> b!1240108 m!1143469))

(declare-fun m!1143471 () Bool)

(assert (=> b!1240109 m!1143471))

(assert (=> b!1239985 d!136227))

(declare-fun d!136229 () Bool)

(declare-fun lt!561884 () Bool)

(assert (=> d!136229 (= lt!561884 (member (select (arr!38542 a!3835) from!3213) (content!601 acc!846)))))

(declare-fun e!702854 () Bool)

(assert (=> d!136229 (= lt!561884 e!702854)))

(declare-fun res!827399 () Bool)

(assert (=> d!136229 (=> (not res!827399) (not e!702854))))

(assert (=> d!136229 (= res!827399 (is-Cons!27311 acc!846))))

(assert (=> d!136229 (= (contains!7377 acc!846 (select (arr!38542 a!3835) from!3213)) lt!561884)))

(declare-fun b!1240110 () Bool)

(declare-fun e!702855 () Bool)

(assert (=> b!1240110 (= e!702854 e!702855)))

(declare-fun res!827398 () Bool)

(assert (=> b!1240110 (=> res!827398 e!702855)))

(assert (=> b!1240110 (= res!827398 (= (h!28520 acc!846) (select (arr!38542 a!3835) from!3213)))))

(declare-fun b!1240111 () Bool)

(assert (=> b!1240111 (= e!702855 (contains!7377 (t!40778 acc!846) (select (arr!38542 a!3835) from!3213)))))

(assert (= (and d!136229 res!827399) b!1240110))

(assert (= (and b!1240110 (not res!827398)) b!1240111))

(assert (=> d!136229 m!1143371))

(assert (=> d!136229 m!1143315))

(declare-fun m!1143473 () Bool)

(assert (=> d!136229 m!1143473))

(assert (=> b!1240111 m!1143315))

(declare-fun m!1143475 () Bool)

(assert (=> b!1240111 m!1143475))

(assert (=> b!1240032 d!136229))

(declare-fun d!136231 () Bool)

(assert (=> d!136231 (= (validKeyInArray!0 (select (arr!38542 a!3835) from!3213)) (and (not (= (select (arr!38542 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38542 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1240033 d!136231))

(declare-fun d!136233 () Bool)

(declare-fun lt!561885 () Bool)

(assert (=> d!136233 (= lt!561885 (member k!2925 (content!601 (t!40778 acc!846))))))

