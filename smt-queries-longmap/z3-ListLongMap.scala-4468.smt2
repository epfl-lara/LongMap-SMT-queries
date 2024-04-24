; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62214 () Bool)

(assert start!62214)

(declare-fun b!696411 () Bool)

(declare-fun e!396028 () Bool)

(declare-datatypes ((List!13077 0))(
  ( (Nil!13074) (Cons!13073 (h!14121 (_ BitVec 64)) (t!19351 List!13077)) )
))
(declare-fun acc!681 () List!13077)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3729 (List!13077 (_ BitVec 64)) Bool)

(assert (=> b!696411 (= e!396028 (not (contains!3729 acc!681 k0!2843)))))

(declare-fun b!696413 () Bool)

(declare-fun res!460249 () Bool)

(declare-fun e!396027 () Bool)

(assert (=> b!696413 (=> (not res!460249) (not e!396027))))

(declare-datatypes ((array!39942 0))(
  ( (array!39943 (arr!19129 (Array (_ BitVec 32) (_ BitVec 64))) (size!19512 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39942)

(declare-fun arrayContainsKey!0 (array!39942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696413 (= res!460249 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696414 () Bool)

(declare-fun res!460254 () Bool)

(assert (=> b!696414 (=> (not res!460254) (not e!396027))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696414 (= res!460254 (not (validKeyInArray!0 (select (arr!19129 a!3626) from!3004))))))

(declare-fun b!696415 () Bool)

(declare-fun res!460258 () Bool)

(assert (=> b!696415 (=> (not res!460258) (not e!396027))))

(assert (=> b!696415 (= res!460258 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696416 () Bool)

(declare-fun res!460248 () Bool)

(assert (=> b!696416 (=> (not res!460248) (not e!396027))))

(declare-fun arrayNoDuplicates!0 (array!39942 (_ BitVec 32) List!13077) Bool)

(assert (=> b!696416 (= res!460248 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696417 () Bool)

(declare-fun res!460251 () Bool)

(assert (=> b!696417 (=> (not res!460251) (not e!396027))))

(declare-fun e!396026 () Bool)

(assert (=> b!696417 (= res!460251 e!396026)))

(declare-fun res!460266 () Bool)

(assert (=> b!696417 (=> res!460266 e!396026)))

(declare-fun e!396030 () Bool)

(assert (=> b!696417 (= res!460266 e!396030)))

(declare-fun res!460262 () Bool)

(assert (=> b!696417 (=> (not res!460262) (not e!396030))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696417 (= res!460262 (bvsgt from!3004 i!1382))))

(declare-fun b!696418 () Bool)

(assert (=> b!696418 (= e!396030 (contains!3729 acc!681 k0!2843))))

(declare-fun b!696419 () Bool)

(declare-fun e!396025 () Bool)

(assert (=> b!696419 (= e!396025 (not (contains!3729 acc!681 k0!2843)))))

(declare-fun res!460255 () Bool)

(assert (=> start!62214 (=> (not res!460255) (not e!396027))))

(assert (=> start!62214 (= res!460255 (and (bvslt (size!19512 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19512 a!3626))))))

(assert (=> start!62214 e!396027))

(assert (=> start!62214 true))

(declare-fun array_inv!14988 (array!39942) Bool)

(assert (=> start!62214 (array_inv!14988 a!3626)))

(declare-fun b!696412 () Bool)

(declare-fun res!460253 () Bool)

(assert (=> b!696412 (=> (not res!460253) (not e!396027))))

(assert (=> b!696412 (= res!460253 (validKeyInArray!0 k0!2843))))

(declare-fun b!696420 () Bool)

(assert (=> b!696420 (= e!396027 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))))

(declare-fun b!696421 () Bool)

(declare-fun res!460256 () Bool)

(assert (=> b!696421 (=> (not res!460256) (not e!396027))))

(assert (=> b!696421 (= res!460256 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13074))))

(declare-fun b!696422 () Bool)

(declare-fun res!460260 () Bool)

(assert (=> b!696422 (=> (not res!460260) (not e!396027))))

(assert (=> b!696422 (= res!460260 (not (contains!3729 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696423 () Bool)

(declare-fun res!460265 () Bool)

(assert (=> b!696423 (=> (not res!460265) (not e!396027))))

(assert (=> b!696423 (= res!460265 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19512 a!3626))))))

(declare-fun b!696424 () Bool)

(assert (=> b!696424 (= e!396026 e!396025)))

(declare-fun res!460263 () Bool)

(assert (=> b!696424 (=> (not res!460263) (not e!396025))))

(assert (=> b!696424 (= res!460263 (bvsle from!3004 i!1382))))

(declare-fun b!696425 () Bool)

(declare-fun res!460267 () Bool)

(assert (=> b!696425 (=> (not res!460267) (not e!396027))))

(assert (=> b!696425 (= res!460267 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19512 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696426 () Bool)

(declare-fun e!396024 () Bool)

(assert (=> b!696426 (= e!396024 e!396028)))

(declare-fun res!460257 () Bool)

(assert (=> b!696426 (=> (not res!460257) (not e!396028))))

(assert (=> b!696426 (= res!460257 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696427 () Bool)

(declare-fun res!460261 () Bool)

(assert (=> b!696427 (=> (not res!460261) (not e!396027))))

(declare-fun noDuplicate!1003 (List!13077) Bool)

(assert (=> b!696427 (= res!460261 (noDuplicate!1003 acc!681))))

(declare-fun b!696428 () Bool)

(declare-fun res!460252 () Bool)

(assert (=> b!696428 (=> (not res!460252) (not e!396027))))

(assert (=> b!696428 (= res!460252 (not (contains!3729 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696429 () Bool)

(declare-fun e!396029 () Bool)

(assert (=> b!696429 (= e!396029 (contains!3729 acc!681 k0!2843))))

(declare-fun b!696430 () Bool)

(declare-fun res!460259 () Bool)

(assert (=> b!696430 (=> (not res!460259) (not e!396027))))

(assert (=> b!696430 (= res!460259 e!396024)))

(declare-fun res!460250 () Bool)

(assert (=> b!696430 (=> res!460250 e!396024)))

(assert (=> b!696430 (= res!460250 e!396029)))

(declare-fun res!460264 () Bool)

(assert (=> b!696430 (=> (not res!460264) (not e!396029))))

(assert (=> b!696430 (= res!460264 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!62214 res!460255) b!696427))

(assert (= (and b!696427 res!460261) b!696422))

(assert (= (and b!696422 res!460260) b!696428))

(assert (= (and b!696428 res!460252) b!696417))

(assert (= (and b!696417 res!460262) b!696418))

(assert (= (and b!696417 (not res!460266)) b!696424))

(assert (= (and b!696424 res!460263) b!696419))

(assert (= (and b!696417 res!460251) b!696421))

(assert (= (and b!696421 res!460256) b!696416))

(assert (= (and b!696416 res!460248) b!696423))

(assert (= (and b!696423 res!460265) b!696412))

(assert (= (and b!696412 res!460253) b!696413))

(assert (= (and b!696413 res!460249) b!696425))

(assert (= (and b!696425 res!460267) b!696414))

(assert (= (and b!696414 res!460254) b!696415))

(assert (= (and b!696415 res!460258) b!696430))

(assert (= (and b!696430 res!460264) b!696429))

(assert (= (and b!696430 (not res!460250)) b!696426))

(assert (= (and b!696426 res!460257) b!696411))

(assert (= (and b!696430 res!460259) b!696420))

(declare-fun m!657973 () Bool)

(assert (=> start!62214 m!657973))

(declare-fun m!657975 () Bool)

(assert (=> b!696413 m!657975))

(declare-fun m!657977 () Bool)

(assert (=> b!696416 m!657977))

(declare-fun m!657979 () Bool)

(assert (=> b!696418 m!657979))

(declare-fun m!657981 () Bool)

(assert (=> b!696414 m!657981))

(assert (=> b!696414 m!657981))

(declare-fun m!657983 () Bool)

(assert (=> b!696414 m!657983))

(assert (=> b!696411 m!657979))

(declare-fun m!657985 () Bool)

(assert (=> b!696420 m!657985))

(declare-fun m!657987 () Bool)

(assert (=> b!696412 m!657987))

(assert (=> b!696419 m!657979))

(declare-fun m!657989 () Bool)

(assert (=> b!696421 m!657989))

(declare-fun m!657991 () Bool)

(assert (=> b!696428 m!657991))

(declare-fun m!657993 () Bool)

(assert (=> b!696427 m!657993))

(declare-fun m!657995 () Bool)

(assert (=> b!696422 m!657995))

(assert (=> b!696429 m!657979))

(check-sat (not b!696416) (not b!696419) (not b!696422) (not b!696428) (not b!696427) (not b!696412) (not start!62214) (not b!696420) (not b!696414) (not b!696429) (not b!696413) (not b!696421) (not b!696411) (not b!696418))
(check-sat)
(get-model)

(declare-fun d!96197 () Bool)

(declare-fun res!460392 () Bool)

(declare-fun e!396083 () Bool)

(assert (=> d!96197 (=> res!460392 e!396083)))

(get-info :version)

(assert (=> d!96197 (= res!460392 ((_ is Nil!13074) acc!681))))

(assert (=> d!96197 (= (noDuplicate!1003 acc!681) e!396083)))

(declare-fun b!696555 () Bool)

(declare-fun e!396084 () Bool)

(assert (=> b!696555 (= e!396083 e!396084)))

(declare-fun res!460393 () Bool)

(assert (=> b!696555 (=> (not res!460393) (not e!396084))))

(assert (=> b!696555 (= res!460393 (not (contains!3729 (t!19351 acc!681) (h!14121 acc!681))))))

(declare-fun b!696556 () Bool)

(assert (=> b!696556 (= e!396084 (noDuplicate!1003 (t!19351 acc!681)))))

(assert (= (and d!96197 (not res!460392)) b!696555))

(assert (= (and b!696555 res!460393) b!696556))

(declare-fun m!658045 () Bool)

(assert (=> b!696555 m!658045))

(declare-fun m!658047 () Bool)

(assert (=> b!696556 m!658047))

(assert (=> b!696427 d!96197))

(declare-fun call!34308 () Bool)

(declare-fun c!78452 () Bool)

(declare-fun bm!34305 () Bool)

(assert (=> bm!34305 (= call!34308 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78452 (Cons!13073 (select (arr!19129 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!96199 () Bool)

(declare-fun res!460402 () Bool)

(declare-fun e!396093 () Bool)

(assert (=> d!96199 (=> res!460402 e!396093)))

(assert (=> d!96199 (= res!460402 (bvsge from!3004 (size!19512 a!3626)))))

(assert (=> d!96199 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!396093)))

(declare-fun b!696567 () Bool)

(declare-fun e!396095 () Bool)

(assert (=> b!696567 (= e!396093 e!396095)))

(declare-fun res!460400 () Bool)

(assert (=> b!696567 (=> (not res!460400) (not e!396095))))

(declare-fun e!396096 () Bool)

(assert (=> b!696567 (= res!460400 (not e!396096))))

(declare-fun res!460401 () Bool)

(assert (=> b!696567 (=> (not res!460401) (not e!396096))))

(assert (=> b!696567 (= res!460401 (validKeyInArray!0 (select (arr!19129 a!3626) from!3004)))))

(declare-fun b!696568 () Bool)

(declare-fun e!396094 () Bool)

(assert (=> b!696568 (= e!396094 call!34308)))

(declare-fun b!696569 () Bool)

(assert (=> b!696569 (= e!396096 (contains!3729 acc!681 (select (arr!19129 a!3626) from!3004)))))

(declare-fun b!696570 () Bool)

(assert (=> b!696570 (= e!396094 call!34308)))

(declare-fun b!696571 () Bool)

(assert (=> b!696571 (= e!396095 e!396094)))

(assert (=> b!696571 (= c!78452 (validKeyInArray!0 (select (arr!19129 a!3626) from!3004)))))

(assert (= (and d!96199 (not res!460402)) b!696567))

(assert (= (and b!696567 res!460401) b!696569))

(assert (= (and b!696567 res!460400) b!696571))

(assert (= (and b!696571 c!78452) b!696568))

(assert (= (and b!696571 (not c!78452)) b!696570))

(assert (= (or b!696568 b!696570) bm!34305))

(assert (=> bm!34305 m!657981))

(declare-fun m!658049 () Bool)

(assert (=> bm!34305 m!658049))

(assert (=> b!696567 m!657981))

(assert (=> b!696567 m!657981))

(assert (=> b!696567 m!657983))

(assert (=> b!696569 m!657981))

(assert (=> b!696569 m!657981))

(declare-fun m!658051 () Bool)

(assert (=> b!696569 m!658051))

(assert (=> b!696571 m!657981))

(assert (=> b!696571 m!657981))

(assert (=> b!696571 m!657983))

(assert (=> b!696416 d!96199))

(declare-fun d!96201 () Bool)

(declare-fun lt!317200 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!324 (List!13077) (InoxSet (_ BitVec 64)))

(assert (=> d!96201 (= lt!317200 (select (content!324 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!396101 () Bool)

(assert (=> d!96201 (= lt!317200 e!396101)))

(declare-fun res!460408 () Bool)

(assert (=> d!96201 (=> (not res!460408) (not e!396101))))

(assert (=> d!96201 (= res!460408 ((_ is Cons!13073) acc!681))))

(assert (=> d!96201 (= (contains!3729 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317200)))

(declare-fun b!696576 () Bool)

(declare-fun e!396102 () Bool)

(assert (=> b!696576 (= e!396101 e!396102)))

(declare-fun res!460407 () Bool)

(assert (=> b!696576 (=> res!460407 e!396102)))

(assert (=> b!696576 (= res!460407 (= (h!14121 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!696577 () Bool)

(assert (=> b!696577 (= e!396102 (contains!3729 (t!19351 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96201 res!460408) b!696576))

(assert (= (and b!696576 (not res!460407)) b!696577))

(declare-fun m!658053 () Bool)

(assert (=> d!96201 m!658053))

(declare-fun m!658055 () Bool)

(assert (=> d!96201 m!658055))

(declare-fun m!658057 () Bool)

(assert (=> b!696577 m!658057))

(assert (=> b!696428 d!96201))

(declare-fun d!96203 () Bool)

(declare-fun lt!317201 () Bool)

(assert (=> d!96203 (= lt!317201 (select (content!324 acc!681) k0!2843))))

(declare-fun e!396103 () Bool)

(assert (=> d!96203 (= lt!317201 e!396103)))

(declare-fun res!460410 () Bool)

(assert (=> d!96203 (=> (not res!460410) (not e!396103))))

(assert (=> d!96203 (= res!460410 ((_ is Cons!13073) acc!681))))

(assert (=> d!96203 (= (contains!3729 acc!681 k0!2843) lt!317201)))

(declare-fun b!696578 () Bool)

(declare-fun e!396104 () Bool)

(assert (=> b!696578 (= e!396103 e!396104)))

(declare-fun res!460409 () Bool)

(assert (=> b!696578 (=> res!460409 e!396104)))

(assert (=> b!696578 (= res!460409 (= (h!14121 acc!681) k0!2843))))

(declare-fun b!696579 () Bool)

(assert (=> b!696579 (= e!396104 (contains!3729 (t!19351 acc!681) k0!2843))))

(assert (= (and d!96203 res!460410) b!696578))

(assert (= (and b!696578 (not res!460409)) b!696579))

(assert (=> d!96203 m!658053))

(declare-fun m!658059 () Bool)

(assert (=> d!96203 m!658059))

(declare-fun m!658061 () Bool)

(assert (=> b!696579 m!658061))

(assert (=> b!696429 d!96203))

(assert (=> b!696418 d!96203))

(assert (=> b!696419 d!96203))

(declare-fun c!78453 () Bool)

(declare-fun bm!34306 () Bool)

(declare-fun call!34309 () Bool)

(assert (=> bm!34306 (= call!34309 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78453 (Cons!13073 (select (arr!19129 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun d!96205 () Bool)

(declare-fun res!460413 () Bool)

(declare-fun e!396105 () Bool)

(assert (=> d!96205 (=> res!460413 e!396105)))

(assert (=> d!96205 (= res!460413 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19512 a!3626)))))

(assert (=> d!96205 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396105)))

(declare-fun b!696580 () Bool)

(declare-fun e!396107 () Bool)

(assert (=> b!696580 (= e!396105 e!396107)))

(declare-fun res!460411 () Bool)

(assert (=> b!696580 (=> (not res!460411) (not e!396107))))

(declare-fun e!396108 () Bool)

(assert (=> b!696580 (= res!460411 (not e!396108))))

(declare-fun res!460412 () Bool)

(assert (=> b!696580 (=> (not res!460412) (not e!396108))))

(assert (=> b!696580 (= res!460412 (validKeyInArray!0 (select (arr!19129 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!696581 () Bool)

(declare-fun e!396106 () Bool)

(assert (=> b!696581 (= e!396106 call!34309)))

(declare-fun b!696582 () Bool)

(assert (=> b!696582 (= e!396108 (contains!3729 acc!681 (select (arr!19129 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!696583 () Bool)

(assert (=> b!696583 (= e!396106 call!34309)))

(declare-fun b!696584 () Bool)

(assert (=> b!696584 (= e!396107 e!396106)))

(assert (=> b!696584 (= c!78453 (validKeyInArray!0 (select (arr!19129 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!96205 (not res!460413)) b!696580))

(assert (= (and b!696580 res!460412) b!696582))

(assert (= (and b!696580 res!460411) b!696584))

(assert (= (and b!696584 c!78453) b!696581))

(assert (= (and b!696584 (not c!78453)) b!696583))

(assert (= (or b!696581 b!696583) bm!34306))

(declare-fun m!658063 () Bool)

(assert (=> bm!34306 m!658063))

(declare-fun m!658065 () Bool)

(assert (=> bm!34306 m!658065))

(assert (=> b!696580 m!658063))

(assert (=> b!696580 m!658063))

(declare-fun m!658067 () Bool)

(assert (=> b!696580 m!658067))

(assert (=> b!696582 m!658063))

(assert (=> b!696582 m!658063))

(declare-fun m!658069 () Bool)

(assert (=> b!696582 m!658069))

(assert (=> b!696584 m!658063))

(assert (=> b!696584 m!658063))

(assert (=> b!696584 m!658067))

(assert (=> b!696420 d!96205))

(declare-fun bm!34307 () Bool)

(declare-fun call!34310 () Bool)

(declare-fun c!78454 () Bool)

(assert (=> bm!34307 (= call!34310 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78454 (Cons!13073 (select (arr!19129 a!3626) #b00000000000000000000000000000000) Nil!13074) Nil!13074)))))

(declare-fun d!96207 () Bool)

(declare-fun res!460416 () Bool)

(declare-fun e!396109 () Bool)

(assert (=> d!96207 (=> res!460416 e!396109)))

(assert (=> d!96207 (= res!460416 (bvsge #b00000000000000000000000000000000 (size!19512 a!3626)))))

(assert (=> d!96207 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13074) e!396109)))

(declare-fun b!696585 () Bool)

(declare-fun e!396111 () Bool)

(assert (=> b!696585 (= e!396109 e!396111)))

(declare-fun res!460414 () Bool)

(assert (=> b!696585 (=> (not res!460414) (not e!396111))))

(declare-fun e!396112 () Bool)

(assert (=> b!696585 (= res!460414 (not e!396112))))

(declare-fun res!460415 () Bool)

(assert (=> b!696585 (=> (not res!460415) (not e!396112))))

(assert (=> b!696585 (= res!460415 (validKeyInArray!0 (select (arr!19129 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!696586 () Bool)

(declare-fun e!396110 () Bool)

(assert (=> b!696586 (= e!396110 call!34310)))

(declare-fun b!696587 () Bool)

(assert (=> b!696587 (= e!396112 (contains!3729 Nil!13074 (select (arr!19129 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!696588 () Bool)

(assert (=> b!696588 (= e!396110 call!34310)))

(declare-fun b!696589 () Bool)

(assert (=> b!696589 (= e!396111 e!396110)))

(assert (=> b!696589 (= c!78454 (validKeyInArray!0 (select (arr!19129 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!96207 (not res!460416)) b!696585))

(assert (= (and b!696585 res!460415) b!696587))

(assert (= (and b!696585 res!460414) b!696589))

(assert (= (and b!696589 c!78454) b!696586))

(assert (= (and b!696589 (not c!78454)) b!696588))

(assert (= (or b!696586 b!696588) bm!34307))

(declare-fun m!658071 () Bool)

(assert (=> bm!34307 m!658071))

(declare-fun m!658073 () Bool)

(assert (=> bm!34307 m!658073))

(assert (=> b!696585 m!658071))

(assert (=> b!696585 m!658071))

(declare-fun m!658075 () Bool)

(assert (=> b!696585 m!658075))

(assert (=> b!696587 m!658071))

(assert (=> b!696587 m!658071))

(declare-fun m!658077 () Bool)

(assert (=> b!696587 m!658077))

(assert (=> b!696589 m!658071))

(assert (=> b!696589 m!658071))

(assert (=> b!696589 m!658075))

(assert (=> b!696421 d!96207))

(assert (=> b!696411 d!96203))

(declare-fun d!96211 () Bool)

(declare-fun lt!317202 () Bool)

(assert (=> d!96211 (= lt!317202 (select (content!324 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!396113 () Bool)

(assert (=> d!96211 (= lt!317202 e!396113)))

(declare-fun res!460418 () Bool)

(assert (=> d!96211 (=> (not res!460418) (not e!396113))))

(assert (=> d!96211 (= res!460418 ((_ is Cons!13073) acc!681))))

(assert (=> d!96211 (= (contains!3729 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317202)))

(declare-fun b!696590 () Bool)

(declare-fun e!396114 () Bool)

(assert (=> b!696590 (= e!396113 e!396114)))

(declare-fun res!460417 () Bool)

(assert (=> b!696590 (=> res!460417 e!396114)))

(assert (=> b!696590 (= res!460417 (= (h!14121 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!696591 () Bool)

(assert (=> b!696591 (= e!396114 (contains!3729 (t!19351 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96211 res!460418) b!696590))

(assert (= (and b!696590 (not res!460417)) b!696591))

(assert (=> d!96211 m!658053))

(declare-fun m!658079 () Bool)

(assert (=> d!96211 m!658079))

(declare-fun m!658081 () Bool)

(assert (=> b!696591 m!658081))

(assert (=> b!696422 d!96211))

(declare-fun d!96213 () Bool)

(assert (=> d!96213 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!696412 d!96213))

(declare-fun d!96215 () Bool)

(declare-fun res!460427 () Bool)

(declare-fun e!396123 () Bool)

(assert (=> d!96215 (=> res!460427 e!396123)))

(assert (=> d!96215 (= res!460427 (= (select (arr!19129 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!96215 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!396123)))

(declare-fun b!696600 () Bool)

(declare-fun e!396124 () Bool)

(assert (=> b!696600 (= e!396123 e!396124)))

(declare-fun res!460428 () Bool)

(assert (=> b!696600 (=> (not res!460428) (not e!396124))))

(assert (=> b!696600 (= res!460428 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19512 a!3626)))))

(declare-fun b!696601 () Bool)

(assert (=> b!696601 (= e!396124 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!96215 (not res!460427)) b!696600))

(assert (= (and b!696600 res!460428) b!696601))

(assert (=> d!96215 m!658071))

(declare-fun m!658083 () Bool)

(assert (=> b!696601 m!658083))

(assert (=> b!696413 d!96215))

(declare-fun d!96219 () Bool)

(assert (=> d!96219 (= (validKeyInArray!0 (select (arr!19129 a!3626) from!3004)) (and (not (= (select (arr!19129 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19129 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!696414 d!96219))

(declare-fun d!96221 () Bool)

(assert (=> d!96221 (= (array_inv!14988 a!3626) (bvsge (size!19512 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62214 d!96221))

(check-sat (not d!96211) (not b!696577) (not b!696567) (not b!696585) (not b!696579) (not b!696589) (not b!696587) (not bm!34305) (not b!696601) (not b!696555) (not d!96201) (not d!96203) (not b!696584) (not b!696571) (not bm!34307) (not b!696556) (not b!696582) (not b!696580) (not b!696591) (not b!696569) (not bm!34306))
(check-sat)
