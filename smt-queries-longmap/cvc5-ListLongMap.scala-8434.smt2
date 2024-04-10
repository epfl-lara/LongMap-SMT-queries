; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102690 () Bool)

(assert start!102690)

(declare-fun b!1234282 () Bool)

(declare-fun res!822466 () Bool)

(declare-fun e!700053 () Bool)

(assert (=> b!1234282 (=> (not res!822466) (not e!700053))))

(declare-datatypes ((List!27172 0))(
  ( (Nil!27169) (Cons!27168 (h!28377 (_ BitVec 64)) (t!40635 List!27172)) )
))
(declare-fun acc!846 () List!27172)

(declare-fun contains!7234 (List!27172 (_ BitVec 64)) Bool)

(assert (=> b!1234282 (= res!822466 (not (contains!7234 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234283 () Bool)

(declare-fun res!822462 () Bool)

(assert (=> b!1234283 (=> (not res!822462) (not e!700053))))

(declare-fun noDuplicate!1831 (List!27172) Bool)

(assert (=> b!1234283 (= res!822462 (noDuplicate!1831 acc!846))))

(declare-fun b!1234284 () Bool)

(declare-fun res!822469 () Bool)

(assert (=> b!1234284 (=> (not res!822469) (not e!700053))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79580 0))(
  ( (array!79581 (arr!38399 (Array (_ BitVec 32) (_ BitVec 64))) (size!38935 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79580)

(assert (=> b!1234284 (= res!822469 (not (= from!3213 (bvsub (size!38935 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234285 () Bool)

(declare-fun lt!559828 () List!27172)

(declare-fun isEmpty!1003 (List!27172) Bool)

(assert (=> b!1234285 (= e!700053 (not (not (isEmpty!1003 lt!559828))))))

(declare-fun subseq!506 (List!27172 List!27172) Bool)

(assert (=> b!1234285 (subseq!506 lt!559828 lt!559828)))

(declare-datatypes ((Unit!40868 0))(
  ( (Unit!40869) )
))
(declare-fun lt!559829 () Unit!40868)

(declare-fun lemmaListSubSeqRefl!0 (List!27172) Unit!40868)

(assert (=> b!1234285 (= lt!559829 (lemmaListSubSeqRefl!0 lt!559828))))

(assert (=> b!1234285 (= lt!559828 (Cons!27168 (select (arr!38399 a!3835) from!3213) acc!846))))

(declare-fun b!1234286 () Bool)

(declare-fun res!822465 () Bool)

(assert (=> b!1234286 (=> (not res!822465) (not e!700053))))

(assert (=> b!1234286 (= res!822465 (not (contains!7234 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234287 () Bool)

(declare-fun res!822464 () Bool)

(assert (=> b!1234287 (=> (not res!822464) (not e!700053))))

(declare-fun arrayNoDuplicates!0 (array!79580 (_ BitVec 32) List!27172) Bool)

(assert (=> b!1234287 (= res!822464 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!822467 () Bool)

(assert (=> start!102690 (=> (not res!822467) (not e!700053))))

(assert (=> start!102690 (= res!822467 (and (bvslt (size!38935 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38935 a!3835))))))

(assert (=> start!102690 e!700053))

(declare-fun array_inv!29247 (array!79580) Bool)

(assert (=> start!102690 (array_inv!29247 a!3835)))

(assert (=> start!102690 true))

(declare-fun b!1234288 () Bool)

(declare-fun res!822463 () Bool)

(assert (=> b!1234288 (=> (not res!822463) (not e!700053))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234288 (= res!822463 (contains!7234 acc!846 k!2925))))

(declare-fun b!1234289 () Bool)

(declare-fun res!822468 () Bool)

(assert (=> b!1234289 (=> (not res!822468) (not e!700053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234289 (= res!822468 (validKeyInArray!0 (select (arr!38399 a!3835) from!3213)))))

(assert (= (and start!102690 res!822467) b!1234283))

(assert (= (and b!1234283 res!822462) b!1234282))

(assert (= (and b!1234282 res!822466) b!1234286))

(assert (= (and b!1234286 res!822465) b!1234287))

(assert (= (and b!1234287 res!822464) b!1234288))

(assert (= (and b!1234288 res!822463) b!1234284))

(assert (= (and b!1234284 res!822469) b!1234289))

(assert (= (and b!1234289 res!822468) b!1234285))

(declare-fun m!1138273 () Bool)

(assert (=> b!1234285 m!1138273))

(declare-fun m!1138275 () Bool)

(assert (=> b!1234285 m!1138275))

(declare-fun m!1138277 () Bool)

(assert (=> b!1234285 m!1138277))

(declare-fun m!1138279 () Bool)

(assert (=> b!1234285 m!1138279))

(declare-fun m!1138281 () Bool)

(assert (=> b!1234282 m!1138281))

(declare-fun m!1138283 () Bool)

(assert (=> b!1234286 m!1138283))

(declare-fun m!1138285 () Bool)

(assert (=> b!1234283 m!1138285))

(declare-fun m!1138287 () Bool)

(assert (=> b!1234287 m!1138287))

(declare-fun m!1138289 () Bool)

(assert (=> start!102690 m!1138289))

(assert (=> b!1234289 m!1138279))

(assert (=> b!1234289 m!1138279))

(declare-fun m!1138291 () Bool)

(assert (=> b!1234289 m!1138291))

(declare-fun m!1138293 () Bool)

(assert (=> b!1234288 m!1138293))

(push 1)

(assert (not b!1234287))

(assert (not b!1234282))

(assert (not b!1234285))

(assert (not b!1234286))

(assert (not b!1234289))

(assert (not b!1234288))

(assert (not start!102690))

(assert (not b!1234283))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135391 () Bool)

(declare-fun lt!559844 () Bool)

(declare-fun content!578 (List!27172) (Set (_ BitVec 64)))

(assert (=> d!135391 (= lt!559844 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!578 acc!846)))))

(declare-fun e!700083 () Bool)

(assert (=> d!135391 (= lt!559844 e!700083)))

(declare-fun res!822535 () Bool)

(assert (=> d!135391 (=> (not res!822535) (not e!700083))))

(assert (=> d!135391 (= res!822535 (is-Cons!27168 acc!846))))

(assert (=> d!135391 (= (contains!7234 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559844)))

(declare-fun b!1234354 () Bool)

(declare-fun e!700082 () Bool)

(assert (=> b!1234354 (= e!700083 e!700082)))

(declare-fun res!822534 () Bool)

(assert (=> b!1234354 (=> res!822534 e!700082)))

(assert (=> b!1234354 (= res!822534 (= (h!28377 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234355 () Bool)

(assert (=> b!1234355 (= e!700082 (contains!7234 (t!40635 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135391 res!822535) b!1234354))

(assert (= (and b!1234354 (not res!822534)) b!1234355))

(declare-fun m!1138343 () Bool)

(assert (=> d!135391 m!1138343))

(declare-fun m!1138345 () Bool)

(assert (=> d!135391 m!1138345))

(declare-fun m!1138347 () Bool)

(assert (=> b!1234355 m!1138347))

(assert (=> b!1234282 d!135391))

(declare-fun d!135399 () Bool)

(assert (=> d!135399 (= (array_inv!29247 a!3835) (bvsge (size!38935 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102690 d!135399))

(declare-fun b!1234396 () Bool)

(declare-fun e!700119 () Bool)

(declare-fun e!700118 () Bool)

(assert (=> b!1234396 (= e!700119 e!700118)))

(declare-fun c!120776 () Bool)

(assert (=> b!1234396 (= c!120776 (validKeyInArray!0 (select (arr!38399 a!3835) from!3213)))))

(declare-fun call!60992 () Bool)

(declare-fun bm!60989 () Bool)

(assert (=> bm!60989 (= call!60992 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120776 (Cons!27168 (select (arr!38399 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1234397 () Bool)

(declare-fun e!700121 () Bool)

(assert (=> b!1234397 (= e!700121 (contains!7234 acc!846 (select (arr!38399 a!3835) from!3213)))))

(declare-fun b!1234398 () Bool)

(assert (=> b!1234398 (= e!700118 call!60992)))

(declare-fun b!1234399 () Bool)

(assert (=> b!1234399 (= e!700118 call!60992)))

(declare-fun b!1234400 () Bool)

(declare-fun e!700120 () Bool)

(assert (=> b!1234400 (= e!700120 e!700119)))

(declare-fun res!822564 () Bool)

(assert (=> b!1234400 (=> (not res!822564) (not e!700119))))

(assert (=> b!1234400 (= res!822564 (not e!700121))))

(declare-fun res!822566 () Bool)

(assert (=> b!1234400 (=> (not res!822566) (not e!700121))))

(assert (=> b!1234400 (= res!822566 (validKeyInArray!0 (select (arr!38399 a!3835) from!3213)))))

(declare-fun d!135401 () Bool)

(declare-fun res!822565 () Bool)

(assert (=> d!135401 (=> res!822565 e!700120)))

(assert (=> d!135401 (= res!822565 (bvsge from!3213 (size!38935 a!3835)))))

(assert (=> d!135401 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!700120)))

(assert (= (and d!135401 (not res!822565)) b!1234400))

(assert (= (and b!1234400 res!822566) b!1234397))

(assert (= (and b!1234400 res!822564) b!1234396))

(assert (= (and b!1234396 c!120776) b!1234398))

(assert (= (and b!1234396 (not c!120776)) b!1234399))

(assert (= (or b!1234398 b!1234399) bm!60989))

(assert (=> b!1234396 m!1138279))

(assert (=> b!1234396 m!1138279))

(assert (=> b!1234396 m!1138291))

(assert (=> bm!60989 m!1138279))

(declare-fun m!1138365 () Bool)

(assert (=> bm!60989 m!1138365))

(assert (=> b!1234397 m!1138279))

(assert (=> b!1234397 m!1138279))

(declare-fun m!1138367 () Bool)

(assert (=> b!1234397 m!1138367))

(assert (=> b!1234400 m!1138279))

(assert (=> b!1234400 m!1138279))

(assert (=> b!1234400 m!1138291))

(assert (=> b!1234287 d!135401))

(declare-fun d!135413 () Bool)

(assert (=> d!135413 (= (validKeyInArray!0 (select (arr!38399 a!3835) from!3213)) (and (not (= (select (arr!38399 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38399 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234289 d!135413))

(declare-fun d!135417 () Bool)

(declare-fun lt!559853 () Bool)

(assert (=> d!135417 (= lt!559853 (set.member k!2925 (content!578 acc!846)))))

(declare-fun e!700127 () Bool)

(assert (=> d!135417 (= lt!559853 e!700127)))

(declare-fun res!822571 () Bool)

(assert (=> d!135417 (=> (not res!822571) (not e!700127))))

(assert (=> d!135417 (= res!822571 (is-Cons!27168 acc!846))))

(assert (=> d!135417 (= (contains!7234 acc!846 k!2925) lt!559853)))

(declare-fun b!1234406 () Bool)

(declare-fun e!700126 () Bool)

(assert (=> b!1234406 (= e!700127 e!700126)))

(declare-fun res!822570 () Bool)

(assert (=> b!1234406 (=> res!822570 e!700126)))

(assert (=> b!1234406 (= res!822570 (= (h!28377 acc!846) k!2925))))

(declare-fun b!1234407 () Bool)

(assert (=> b!1234407 (= e!700126 (contains!7234 (t!40635 acc!846) k!2925))))

(assert (= (and d!135417 res!822571) b!1234406))

(assert (= (and b!1234406 (not res!822570)) b!1234407))

(assert (=> d!135417 m!1138343))

(declare-fun m!1138373 () Bool)

(assert (=> d!135417 m!1138373))

(declare-fun m!1138375 () Bool)

(assert (=> b!1234407 m!1138375))

(assert (=> b!1234288 d!135417))

(declare-fun d!135419 () Bool)

(declare-fun res!822587 () Bool)

(declare-fun e!700144 () Bool)

(assert (=> d!135419 (=> res!822587 e!700144)))

(assert (=> d!135419 (= res!822587 (is-Nil!27169 acc!846))))

(assert (=> d!135419 (= (noDuplicate!1831 acc!846) e!700144)))

(declare-fun b!1234425 () Bool)

(declare-fun e!700145 () Bool)

(assert (=> b!1234425 (= e!700144 e!700145)))

(declare-fun res!822588 () Bool)

(assert (=> b!1234425 (=> (not res!822588) (not e!700145))))

(assert (=> b!1234425 (= res!822588 (not (contains!7234 (t!40635 acc!846) (h!28377 acc!846))))))

(declare-fun b!1234426 () Bool)

(assert (=> b!1234426 (= e!700145 (noDuplicate!1831 (t!40635 acc!846)))))

(assert (= (and d!135419 (not res!822587)) b!1234425))

(assert (= (and b!1234425 res!822588) b!1234426))

(declare-fun m!1138381 () Bool)

(assert (=> b!1234425 m!1138381))

(declare-fun m!1138383 () Bool)

(assert (=> b!1234426 m!1138383))

(assert (=> b!1234283 d!135419))

(declare-fun d!135423 () Bool)

(assert (=> d!135423 (= (isEmpty!1003 lt!559828) (is-Nil!27169 lt!559828))))

(assert (=> b!1234285 d!135423))

(declare-fun b!1234455 () Bool)

(declare-fun e!700174 () Bool)

(declare-fun e!700176 () Bool)

(assert (=> b!1234455 (= e!700174 e!700176)))

(declare-fun res!822618 () Bool)

(assert (=> b!1234455 (=> (not res!822618) (not e!700176))))

(assert (=> b!1234455 (= res!822618 (is-Cons!27168 lt!559828))))

(declare-fun b!1234457 () Bool)

(declare-fun e!700177 () Bool)

(assert (=> b!1234457 (= e!700177 (subseq!506 (t!40635 lt!559828) (t!40635 lt!559828)))))

(declare-fun b!1234458 () Bool)

(declare-fun e!700175 () Bool)

(assert (=> b!1234458 (= e!700175 (subseq!506 lt!559828 (t!40635 lt!559828)))))

(declare-fun b!1234456 () Bool)

(assert (=> b!1234456 (= e!700176 e!700175)))

(declare-fun res!822619 () Bool)

(assert (=> b!1234456 (=> res!822619 e!700175)))

(assert (=> b!1234456 (= res!822619 e!700177)))

(declare-fun res!822617 () Bool)

(assert (=> b!1234456 (=> (not res!822617) (not e!700177))))

(assert (=> b!1234456 (= res!822617 (= (h!28377 lt!559828) (h!28377 lt!559828)))))

(declare-fun d!135427 () Bool)

(declare-fun res!822620 () Bool)

(assert (=> d!135427 (=> res!822620 e!700174)))

(assert (=> d!135427 (= res!822620 (is-Nil!27169 lt!559828))))

(assert (=> d!135427 (= (subseq!506 lt!559828 lt!559828) e!700174)))

(assert (= (and d!135427 (not res!822620)) b!1234455))

(assert (= (and b!1234455 res!822618) b!1234456))

(assert (= (and b!1234456 res!822617) b!1234457))

(assert (= (and b!1234456 (not res!822619)) b!1234458))

(declare-fun m!1138403 () Bool)

(assert (=> b!1234457 m!1138403))

(declare-fun m!1138405 () Bool)

(assert (=> b!1234458 m!1138405))

(assert (=> b!1234285 d!135427))

(declare-fun d!135441 () Bool)

(assert (=> d!135441 (subseq!506 lt!559828 lt!559828)))

(declare-fun lt!559861 () Unit!40868)

(declare-fun choose!36 (List!27172) Unit!40868)

(assert (=> d!135441 (= lt!559861 (choose!36 lt!559828))))

(assert (=> d!135441 (= (lemmaListSubSeqRefl!0 lt!559828) lt!559861)))

(declare-fun bs!34695 () Bool)

(assert (= bs!34695 d!135441))

(assert (=> bs!34695 m!1138275))

(declare-fun m!1138415 () Bool)

(assert (=> bs!34695 m!1138415))

(assert (=> b!1234285 d!135441))

(declare-fun d!135445 () Bool)

(declare-fun lt!559864 () Bool)

(assert (=> d!135445 (= lt!559864 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!578 acc!846)))))

(declare-fun e!700185 () Bool)

(assert (=> d!135445 (= lt!559864 e!700185)))

(declare-fun res!822628 () Bool)

(assert (=> d!135445 (=> (not res!822628) (not e!700185))))

(assert (=> d!135445 (= res!822628 (is-Cons!27168 acc!846))))

(assert (=> d!135445 (= (contains!7234 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559864)))

(declare-fun b!1234465 () Bool)

(declare-fun e!700184 () Bool)

(assert (=> b!1234465 (= e!700185 e!700184)))

(declare-fun res!822627 () Bool)

(assert (=> b!1234465 (=> res!822627 e!700184)))

(assert (=> b!1234465 (= res!822627 (= (h!28377 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234466 () Bool)

(assert (=> b!1234466 (= e!700184 (contains!7234 (t!40635 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135445 res!822628) b!1234465))

(assert (= (and b!1234465 (not res!822627)) b!1234466))

(assert (=> d!135445 m!1138343))

(declare-fun m!1138417 () Bool)

(assert (=> d!135445 m!1138417))

(declare-fun m!1138419 () Bool)

(assert (=> b!1234466 m!1138419))

(assert (=> b!1234286 d!135445))

(push 1)

