; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102694 () Bool)

(assert start!102694)

(declare-fun b!1234330 () Bool)

(declare-fun res!822516 () Bool)

(declare-fun e!700064 () Bool)

(assert (=> b!1234330 (=> (not res!822516) (not e!700064))))

(declare-datatypes ((List!27174 0))(
  ( (Nil!27171) (Cons!27170 (h!28379 (_ BitVec 64)) (t!40637 List!27174)) )
))
(declare-fun acc!846 () List!27174)

(declare-fun contains!7236 (List!27174 (_ BitVec 64)) Bool)

(assert (=> b!1234330 (= res!822516 (not (contains!7236 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234331 () Bool)

(declare-fun lt!559841 () List!27174)

(declare-fun isEmpty!1005 (List!27174) Bool)

(assert (=> b!1234331 (= e!700064 (not (not (isEmpty!1005 lt!559841))))))

(declare-fun subseq!508 (List!27174 List!27174) Bool)

(assert (=> b!1234331 (subseq!508 lt!559841 lt!559841)))

(declare-datatypes ((Unit!40872 0))(
  ( (Unit!40873) )
))
(declare-fun lt!559840 () Unit!40872)

(declare-fun lemmaListSubSeqRefl!0 (List!27174) Unit!40872)

(assert (=> b!1234331 (= lt!559840 (lemmaListSubSeqRefl!0 lt!559841))))

(declare-datatypes ((array!79584 0))(
  ( (array!79585 (arr!38401 (Array (_ BitVec 32) (_ BitVec 64))) (size!38937 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79584)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1234331 (= lt!559841 (Cons!27170 (select (arr!38401 a!3835) from!3213) acc!846))))

(declare-fun b!1234332 () Bool)

(declare-fun res!822515 () Bool)

(assert (=> b!1234332 (=> (not res!822515) (not e!700064))))

(assert (=> b!1234332 (= res!822515 (not (contains!7236 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234333 () Bool)

(declare-fun res!822511 () Bool)

(assert (=> b!1234333 (=> (not res!822511) (not e!700064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234333 (= res!822511 (validKeyInArray!0 (select (arr!38401 a!3835) from!3213)))))

(declare-fun b!1234335 () Bool)

(declare-fun res!822513 () Bool)

(assert (=> b!1234335 (=> (not res!822513) (not e!700064))))

(assert (=> b!1234335 (= res!822513 (not (= from!3213 (bvsub (size!38937 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234336 () Bool)

(declare-fun res!822514 () Bool)

(assert (=> b!1234336 (=> (not res!822514) (not e!700064))))

(declare-fun noDuplicate!1833 (List!27174) Bool)

(assert (=> b!1234336 (= res!822514 (noDuplicate!1833 acc!846))))

(declare-fun b!1234337 () Bool)

(declare-fun res!822510 () Bool)

(assert (=> b!1234337 (=> (not res!822510) (not e!700064))))

(declare-fun arrayNoDuplicates!0 (array!79584 (_ BitVec 32) List!27174) Bool)

(assert (=> b!1234337 (= res!822510 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234334 () Bool)

(declare-fun res!822512 () Bool)

(assert (=> b!1234334 (=> (not res!822512) (not e!700064))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234334 (= res!822512 (contains!7236 acc!846 k!2925))))

(declare-fun res!822517 () Bool)

(assert (=> start!102694 (=> (not res!822517) (not e!700064))))

(assert (=> start!102694 (= res!822517 (and (bvslt (size!38937 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38937 a!3835))))))

(assert (=> start!102694 e!700064))

(declare-fun array_inv!29249 (array!79584) Bool)

(assert (=> start!102694 (array_inv!29249 a!3835)))

(assert (=> start!102694 true))

(assert (= (and start!102694 res!822517) b!1234336))

(assert (= (and b!1234336 res!822514) b!1234330))

(assert (= (and b!1234330 res!822516) b!1234332))

(assert (= (and b!1234332 res!822515) b!1234337))

(assert (= (and b!1234337 res!822510) b!1234334))

(assert (= (and b!1234334 res!822512) b!1234335))

(assert (= (and b!1234335 res!822513) b!1234333))

(assert (= (and b!1234333 res!822511) b!1234331))

(declare-fun m!1138317 () Bool)

(assert (=> b!1234333 m!1138317))

(assert (=> b!1234333 m!1138317))

(declare-fun m!1138319 () Bool)

(assert (=> b!1234333 m!1138319))

(declare-fun m!1138321 () Bool)

(assert (=> b!1234336 m!1138321))

(declare-fun m!1138323 () Bool)

(assert (=> start!102694 m!1138323))

(declare-fun m!1138325 () Bool)

(assert (=> b!1234331 m!1138325))

(declare-fun m!1138327 () Bool)

(assert (=> b!1234331 m!1138327))

(declare-fun m!1138329 () Bool)

(assert (=> b!1234331 m!1138329))

(assert (=> b!1234331 m!1138317))

(declare-fun m!1138331 () Bool)

(assert (=> b!1234337 m!1138331))

(declare-fun m!1138333 () Bool)

(assert (=> b!1234330 m!1138333))

(declare-fun m!1138335 () Bool)

(assert (=> b!1234332 m!1138335))

(declare-fun m!1138337 () Bool)

(assert (=> b!1234334 m!1138337))

(push 1)

(assert (not b!1234334))

(assert (not start!102694))

(assert (not b!1234330))

(assert (not b!1234333))

(assert (not b!1234331))

(assert (not b!1234332))

(assert (not b!1234336))

(assert (not b!1234337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135393 () Bool)

(assert (=> d!135393 (= (validKeyInArray!0 (select (arr!38401 a!3835) from!3213)) (and (not (= (select (arr!38401 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38401 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234333 d!135393))

(declare-fun d!135395 () Bool)

(declare-fun lt!559849 () Bool)

(declare-fun content!579 (List!27174) (Set (_ BitVec 64)))

(assert (=> d!135395 (= lt!559849 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!579 acc!846)))))

(declare-fun e!700089 () Bool)

(assert (=> d!135395 (= lt!559849 e!700089)))

(declare-fun res!822540 () Bool)

(assert (=> d!135395 (=> (not res!822540) (not e!700089))))

(assert (=> d!135395 (= res!822540 (is-Cons!27170 acc!846))))

(assert (=> d!135395 (= (contains!7236 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559849)))

(declare-fun b!1234360 () Bool)

(declare-fun e!700088 () Bool)

(assert (=> b!1234360 (= e!700089 e!700088)))

(declare-fun res!822541 () Bool)

(assert (=> b!1234360 (=> res!822541 e!700088)))

(assert (=> b!1234360 (= res!822541 (= (h!28379 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234361 () Bool)

(assert (=> b!1234361 (= e!700088 (contains!7236 (t!40637 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135395 res!822540) b!1234360))

(assert (= (and b!1234360 (not res!822541)) b!1234361))

(declare-fun m!1138351 () Bool)

(assert (=> d!135395 m!1138351))

(declare-fun m!1138353 () Bool)

(assert (=> d!135395 m!1138353))

(declare-fun m!1138355 () Bool)

(assert (=> b!1234361 m!1138355))

(assert (=> b!1234332 d!135395))

(declare-fun d!135405 () Bool)

(declare-fun lt!559851 () Bool)

(assert (=> d!135405 (= lt!559851 (member k!2925 (content!579 acc!846)))))

(declare-fun e!700091 () Bool)

(assert (=> d!135405 (= lt!559851 e!700091)))

(declare-fun res!822542 () Bool)

(assert (=> d!135405 (=> (not res!822542) (not e!700091))))

(assert (=> d!135405 (= res!822542 (is-Cons!27170 acc!846))))

(assert (=> d!135405 (= (contains!7236 acc!846 k!2925) lt!559851)))

(declare-fun b!1234362 () Bool)

(declare-fun e!700090 () Bool)

(assert (=> b!1234362 (= e!700091 e!700090)))

(declare-fun res!822543 () Bool)

(assert (=> b!1234362 (=> res!822543 e!700090)))

(assert (=> b!1234362 (= res!822543 (= (h!28379 acc!846) k!2925))))

(declare-fun b!1234363 () Bool)

(assert (=> b!1234363 (= e!700090 (contains!7236 (t!40637 acc!846) k!2925))))

(assert (= (and d!135405 res!822542) b!1234362))

(assert (= (and b!1234362 (not res!822543)) b!1234363))

(assert (=> d!135405 m!1138351))

(declare-fun m!1138357 () Bool)

(assert (=> d!135405 m!1138357))

(declare-fun m!1138359 () Bool)

(assert (=> b!1234363 m!1138359))

(assert (=> b!1234334 d!135405))

(declare-fun d!135407 () Bool)

(declare-fun lt!559852 () Bool)

(assert (=> d!135407 (= lt!559852 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!579 acc!846)))))

(declare-fun e!700093 () Bool)

(assert (=> d!135407 (= lt!559852 e!700093)))

(declare-fun res!822544 () Bool)

(assert (=> d!135407 (=> (not res!822544) (not e!700093))))

(assert (=> d!135407 (= res!822544 (is-Cons!27170 acc!846))))

(assert (=> d!135407 (= (contains!7236 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559852)))

(declare-fun b!1234364 () Bool)

(declare-fun e!700092 () Bool)

(assert (=> b!1234364 (= e!700093 e!700092)))

(declare-fun res!822545 () Bool)

(assert (=> b!1234364 (=> res!822545 e!700092)))

(assert (=> b!1234364 (= res!822545 (= (h!28379 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234365 () Bool)

(assert (=> b!1234365 (= e!700092 (contains!7236 (t!40637 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135407 res!822544) b!1234364))

(assert (= (and b!1234364 (not res!822545)) b!1234365))

(assert (=> d!135407 m!1138351))

(declare-fun m!1138361 () Bool)

(assert (=> d!135407 m!1138361))

(declare-fun m!1138363 () Bool)

(assert (=> b!1234365 m!1138363))

(assert (=> b!1234330 d!135407))

(declare-fun d!135409 () Bool)

(assert (=> d!135409 (= (array_inv!29249 a!3835) (bvsge (size!38937 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102694 d!135409))

(declare-fun call!60994 () Bool)

(declare-fun bm!60991 () Bool)

(declare-fun c!120778 () Bool)

(assert (=> bm!60991 (= call!60994 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120778 (Cons!27170 (select (arr!38401 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1234408 () Bool)

(declare-fun e!700129 () Bool)

(assert (=> b!1234408 (= e!700129 (contains!7236 acc!846 (select (arr!38401 a!3835) from!3213)))))

(declare-fun b!1234409 () Bool)

(declare-fun e!700128 () Bool)

(declare-fun e!700130 () Bool)

(assert (=> b!1234409 (= e!700128 e!700130)))

(assert (=> b!1234409 (= c!120778 (validKeyInArray!0 (select (arr!38401 a!3835) from!3213)))))

(declare-fun b!1234410 () Bool)

(declare-fun e!700131 () Bool)

(assert (=> b!1234410 (= e!700131 e!700128)))

(declare-fun res!822572 () Bool)

(assert (=> b!1234410 (=> (not res!822572) (not e!700128))))

(assert (=> b!1234410 (= res!822572 (not e!700129))))

(declare-fun res!822573 () Bool)

(assert (=> b!1234410 (=> (not res!822573) (not e!700129))))

(assert (=> b!1234410 (= res!822573 (validKeyInArray!0 (select (arr!38401 a!3835) from!3213)))))

(declare-fun d!135411 () Bool)

(declare-fun res!822574 () Bool)

(assert (=> d!135411 (=> res!822574 e!700131)))

(assert (=> d!135411 (= res!822574 (bvsge from!3213 (size!38937 a!3835)))))

(assert (=> d!135411 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!700131)))

(declare-fun b!1234411 () Bool)

(assert (=> b!1234411 (= e!700130 call!60994)))

(declare-fun b!1234412 () Bool)

(assert (=> b!1234412 (= e!700130 call!60994)))

(assert (= (and d!135411 (not res!822574)) b!1234410))

(assert (= (and b!1234410 res!822573) b!1234408))

(assert (= (and b!1234410 res!822572) b!1234409))

(assert (= (and b!1234409 c!120778) b!1234411))

(assert (= (and b!1234409 (not c!120778)) b!1234412))

(assert (= (or b!1234411 b!1234412) bm!60991))

(assert (=> bm!60991 m!1138317))

(declare-fun m!1138377 () Bool)

(assert (=> bm!60991 m!1138377))

(assert (=> b!1234408 m!1138317))

(assert (=> b!1234408 m!1138317))

(declare-fun m!1138379 () Bool)

(assert (=> b!1234408 m!1138379))

(assert (=> b!1234409 m!1138317))

(assert (=> b!1234409 m!1138317))

(assert (=> b!1234409 m!1138319))

(assert (=> b!1234410 m!1138317))

(assert (=> b!1234410 m!1138317))

(assert (=> b!1234410 m!1138319))

(assert (=> b!1234337 d!135411))

(declare-fun d!135421 () Bool)

(declare-fun res!822591 () Bool)

(declare-fun e!700148 () Bool)

(assert (=> d!135421 (=> res!822591 e!700148)))

(assert (=> d!135421 (= res!822591 (is-Nil!27171 acc!846))))

(assert (=> d!135421 (= (noDuplicate!1833 acc!846) e!700148)))

(declare-fun b!1234429 () Bool)

(declare-fun e!700149 () Bool)

(assert (=> b!1234429 (= e!700148 e!700149)))

(declare-fun res!822592 () Bool)

(assert (=> b!1234429 (=> (not res!822592) (not e!700149))))

(assert (=> b!1234429 (= res!822592 (not (contains!7236 (t!40637 acc!846) (h!28379 acc!846))))))

