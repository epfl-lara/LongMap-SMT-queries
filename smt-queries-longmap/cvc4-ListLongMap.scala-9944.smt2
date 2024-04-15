; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117484 () Bool)

(assert start!117484)

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-fun call!66137 () (_ BitVec 32))

(declare-fun bm!66134 () Bool)

(declare-datatypes ((array!93989 0))(
  ( (array!93990 (arr!45389 (Array (_ BitVec 32) (_ BitVec 64))) (size!45941 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!93989)

(declare-fun arrayCountValidKeys!0 (array!93989 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66134 (= call!66137 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun b!1380221 () Bool)

(declare-fun e!782094 () Bool)

(declare-fun call!66138 () (_ BitVec 32))

(assert (=> b!1380221 (= e!782094 (= call!66137 call!66138))))

(declare-fun b!1380222 () Bool)

(declare-fun res!922508 () Bool)

(declare-fun e!782095 () Bool)

(assert (=> b!1380222 (=> (not res!922508) (not e!782095))))

(declare-fun to!135 () (_ BitVec 32))

(declare-fun isPivot!0 (array!93989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380222 (= res!922508 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun b!1380223 () Bool)

(declare-fun res!922506 () Bool)

(assert (=> b!1380223 (=> (not res!922506) (not e!782095))))

(assert (=> b!1380223 (= res!922506 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45941 a!3961)))))

(declare-fun b!1380224 () Bool)

(assert (=> b!1380224 (= e!782095 (not (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34))))))

(assert (=> b!1380224 e!782094))

(declare-fun c!128300 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380224 (= c!128300 (validKeyInArray!0 (select (arr!45389 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45800 0))(
  ( (Unit!45801) )
))
(declare-fun lt!607724 () Unit!45800)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!93989 (_ BitVec 32) (_ BitVec 32)) Unit!45800)

(assert (=> b!1380224 (= lt!607724 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun res!922507 () Bool)

(assert (=> start!117484 (=> (not res!922507) (not e!782095))))

(assert (=> start!117484 (= res!922507 (and (bvslt (size!45941 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45941 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117484 e!782095))

(declare-fun array_inv!34622 (array!93989) Bool)

(assert (=> start!117484 (array_inv!34622 a!3961)))

(assert (=> start!117484 true))

(declare-fun b!1380225 () Bool)

(assert (=> b!1380225 (= e!782094 (= (bvadd #b00000000000000000000000000000001 call!66137) call!66138))))

(declare-fun bm!66135 () Bool)

(assert (=> bm!66135 (= call!66138 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (= (and start!117484 res!922507) b!1380222))

(assert (= (and b!1380222 res!922508) b!1380223))

(assert (= (and b!1380223 res!922506) b!1380224))

(assert (= (and b!1380224 c!128300) b!1380225))

(assert (= (and b!1380224 (not c!128300)) b!1380221))

(assert (= (or b!1380225 b!1380221) bm!66134))

(assert (= (or b!1380225 b!1380221) bm!66135))

(declare-fun m!1264975 () Bool)

(assert (=> bm!66135 m!1264975))

(declare-fun m!1264977 () Bool)

(assert (=> b!1380222 m!1264977))

(declare-fun m!1264979 () Bool)

(assert (=> start!117484 m!1264979))

(declare-fun m!1264981 () Bool)

(assert (=> bm!66134 m!1264981))

(declare-fun m!1264983 () Bool)

(assert (=> b!1380224 m!1264983))

(declare-fun m!1264985 () Bool)

(assert (=> b!1380224 m!1264985))

(assert (=> b!1380224 m!1264985))

(declare-fun m!1264987 () Bool)

(assert (=> b!1380224 m!1264987))

(declare-fun m!1264989 () Bool)

(assert (=> b!1380224 m!1264989))

(push 1)

(assert (not b!1380224))

(assert (not b!1380222))

(assert (not start!117484))

(assert (not bm!66134))

(assert (not bm!66135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148641 () Bool)

(assert (=> d!148641 (= (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34)) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39825 () Bool)

(assert (= bs!39825 d!148641))

(assert (=> bs!39825 m!1264975))

(declare-fun m!1265023 () Bool)

(assert (=> bs!39825 m!1265023))

(declare-fun m!1265025 () Bool)

(assert (=> bs!39825 m!1265025))

(assert (=> b!1380224 d!148641))

(declare-fun d!148643 () Bool)

(assert (=> d!148643 (= (validKeyInArray!0 (select (arr!45389 a!3961) pivot!34)) (and (not (= (select (arr!45389 a!3961) pivot!34) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45389 a!3961) pivot!34) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380224 d!148643))

(declare-fun bm!66162 () Bool)

(declare-fun call!66166 () (_ BitVec 32))

(assert (=> bm!66162 (= call!66166 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun b!1380281 () Bool)

(declare-fun e!782129 () Bool)

(declare-fun call!66165 () (_ BitVec 32))

(assert (=> b!1380281 (= e!782129 (= call!66166 call!66165))))

(declare-fun b!1380282 () Bool)

(assert (=> b!1380282 (= e!782129 (= (bvadd call!66166 #b00000000000000000000000000000001) call!66165))))

(declare-fun bm!66163 () Bool)

(assert (=> bm!66163 (= call!66165 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun d!148649 () Bool)

(declare-fun e!782130 () Bool)

(assert (=> d!148649 e!782130))

(declare-fun res!922526 () Bool)

(assert (=> d!148649 (=> (not res!922526) (not e!782130))))

(declare-fun lt!607748 () (_ BitVec 32))

(assert (=> d!148649 (= res!922526 (and (bvsge lt!607748 #b00000000000000000000000000000000) (bvslt lt!607748 (size!45941 a!3961))))))

(assert (=> d!148649 (= lt!607748 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))

(declare-fun lt!607749 () Unit!45800)

(declare-fun choose!86 (array!93989 (_ BitVec 32) (_ BitVec 32)) Unit!45800)

(assert (=> d!148649 (= lt!607749 (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148649 (and (bvslt (size!45941 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) from!3339) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45941 a!3961)))))

(assert (=> d!148649 (= (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607749)))

(declare-fun b!1380283 () Bool)

(assert (=> b!1380283 (= e!782130 e!782129)))

(declare-fun c!128320 () Bool)

(assert (=> b!1380283 (= c!128320 (validKeyInArray!0 (select (arr!45389 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(assert (= (and d!148649 res!922526) b!1380283))

(assert (= (and b!1380283 c!128320) b!1380282))

(assert (= (and b!1380283 (not c!128320)) b!1380281))

(assert (= (or b!1380282 b!1380281) bm!66163))

(assert (= (or b!1380282 b!1380281) bm!66162))

(declare-fun m!1265045 () Bool)

(assert (=> bm!66162 m!1265045))

(assert (=> bm!66163 m!1264975))

(declare-fun m!1265047 () Bool)

(assert (=> d!148649 m!1265047))

(declare-fun m!1265049 () Bool)

(assert (=> b!1380283 m!1265049))

(assert (=> b!1380283 m!1265049))

(declare-fun m!1265051 () Bool)

(assert (=> b!1380283 m!1265051))

(assert (=> b!1380224 d!148649))

(declare-fun b!1380304 () Bool)

(declare-fun e!782142 () (_ BitVec 32))

(declare-fun call!66172 () (_ BitVec 32))

(assert (=> b!1380304 (= e!782142 (bvadd #b00000000000000000000000000000001 call!66172))))

(declare-fun b!1380305 () Bool)

(declare-fun e!782141 () (_ BitVec 32))

(assert (=> b!1380305 (= e!782141 e!782142)))

(declare-fun c!128332 () Bool)

(assert (=> b!1380305 (= c!128332 (validKeyInArray!0 (select (arr!45389 a!3961) from!3339)))))

(declare-fun b!1380306 () Bool)

(assert (=> b!1380306 (= e!782141 #b00000000000000000000000000000000)))

(declare-fun b!1380307 () Bool)

(assert (=> b!1380307 (= e!782142 call!66172)))

(declare-fun bm!66169 () Bool)

(assert (=> bm!66169 (= call!66172 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(declare-fun d!148655 () Bool)

(declare-fun lt!607755 () (_ BitVec 32))

(assert (=> d!148655 (and (bvsge lt!607755 #b00000000000000000000000000000000) (bvsle lt!607755 (bvsub (size!45941 a!3961) from!3339)))))

(assert (=> d!148655 (= lt!607755 e!782141)))

(declare-fun c!128331 () Bool)

(assert (=> d!148655 (= c!128331 (bvsge from!3339 pivot!34))))

(assert (=> d!148655 (and (bvsle from!3339 pivot!34) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle pivot!34 (size!45941 a!3961)))))

(assert (=> d!148655 (= (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) lt!607755)))

(assert (= (and d!148655 c!128331) b!1380306))

(assert (= (and d!148655 (not c!128331)) b!1380305))

(assert (= (and b!1380305 c!128332) b!1380304))

(assert (= (and b!1380305 (not c!128332)) b!1380307))

(assert (= (or b!1380304 b!1380307) bm!66169))

(declare-fun m!1265053 () Bool)

(assert (=> b!1380305 m!1265053))

(assert (=> b!1380305 m!1265053))

(declare-fun m!1265055 () Bool)

(assert (=> b!1380305 m!1265055))

(declare-fun m!1265057 () Bool)

(assert (=> bm!66169 m!1265057))

(assert (=> bm!66134 d!148655))

(declare-fun b!1380308 () Bool)

(declare-fun e!782144 () (_ BitVec 32))

(declare-fun call!66173 () (_ BitVec 32))

(assert (=> b!1380308 (= e!782144 (bvadd #b00000000000000000000000000000001 call!66173))))

(declare-fun b!1380309 () Bool)

(declare-fun e!782143 () (_ BitVec 32))

(assert (=> b!1380309 (= e!782143 e!782144)))

(declare-fun c!128334 () Bool)

(assert (=> b!1380309 (= c!128334 (validKeyInArray!0 (select (arr!45389 a!3961) from!3339)))))

(declare-fun b!1380310 () Bool)

(assert (=> b!1380310 (= e!782143 #b00000000000000000000000000000000)))

(declare-fun b!1380311 () Bool)

(assert (=> b!1380311 (= e!782144 call!66173)))

(declare-fun bm!66170 () Bool)

(assert (=> bm!66170 (= call!66173 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun d!148657 () Bool)

(declare-fun lt!607756 () (_ BitVec 32))

(assert (=> d!148657 (and (bvsge lt!607756 #b00000000000000000000000000000000) (bvsle lt!607756 (bvsub (size!45941 a!3961) from!3339)))))

(assert (=> d!148657 (= lt!607756 e!782143)))

(declare-fun c!128333 () Bool)

(assert (=> d!148657 (= c!128333 (bvsge from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148657 (and (bvsle from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45941 a!3961)))))

(assert (=> d!148657 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607756)))

(assert (= (and d!148657 c!128333) b!1380310))

(assert (= (and d!148657 (not c!128333)) b!1380309))

(assert (= (and b!1380309 c!128334) b!1380308))

(assert (= (and b!1380309 (not c!128334)) b!1380311))

(assert (= (or b!1380308 b!1380311) bm!66170))

(assert (=> b!1380309 m!1265053))

(assert (=> b!1380309 m!1265053))

(assert (=> b!1380309 m!1265055))

(declare-fun m!1265067 () Bool)

(assert (=> bm!66170 m!1265067))

(assert (=> bm!66135 d!148657))

(declare-fun d!148661 () Bool)

(assert (=> d!148661 (= (array_inv!34622 a!3961) (bvsge (size!45941 a!3961) #b00000000000000000000000000000000))))

(assert (=> start!117484 d!148661))

(declare-fun d!148665 () Bool)

(assert (=> d!148665 (= (isPivot!0 a!3961 from!3339 to!135 pivot!34) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) (arrayCountValidKeys!0 a!3961 pivot!34 to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39828 () Bool)

(assert (= bs!39828 d!148665))

(assert (=> bs!39828 m!1264981))

(declare-fun m!1265071 () Bool)

(assert (=> bs!39828 m!1265071))

(assert (=> bs!39828 m!1265025))

(assert (=> b!1380222 d!148665))

(push 1)

(assert (not bm!66163))

(assert (not bm!66169))

(assert (not b!1380309))

(assert (not bm!66170))

(assert (not bm!66162))

(assert (not d!148649))

(assert (not b!1380283))

(assert (not d!148641))

(assert (not b!1380305))

(assert (not d!148665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148703 () Bool)

(assert (=> d!148703 (= (validKeyInArray!0 (select (arr!45389 a!3961) from!3339)) (and (not (= (select (arr!45389 a!3961) from!3339) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45389 a!3961) from!3339) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380309 d!148703))

(assert (=> d!148665 d!148655))

(declare-fun b!1380376 () Bool)

(declare-fun e!782178 () (_ BitVec 32))

(declare-fun call!66199 () (_ BitVec 32))

(assert (=> b!1380376 (= e!782178 (bvadd #b00000000000000000000000000000001 call!66199))))

(declare-fun b!1380377 () Bool)

(declare-fun e!782177 () (_ BitVec 32))

(assert (=> b!1380377 (= e!782177 e!782178)))

(declare-fun c!128368 () Bool)

(assert (=> b!1380377 (= c!128368 (validKeyInArray!0 (select (arr!45389 a!3961) pivot!34)))))

(declare-fun b!1380378 () Bool)

(assert (=> b!1380378 (= e!782177 #b00000000000000000000000000000000)))

(declare-fun b!1380379 () Bool)

(assert (=> b!1380379 (= e!782178 call!66199)))

(declare-fun bm!66196 () Bool)

(assert (=> bm!66196 (= call!66199 (arrayCountValidKeys!0 a!3961 (bvadd pivot!34 #b00000000000000000000000000000001) to!135))))

(declare-fun d!148705 () Bool)

(declare-fun lt!607770 () (_ BitVec 32))

(assert (=> d!148705 (and (bvsge lt!607770 #b00000000000000000000000000000000) (bvsle lt!607770 (bvsub (size!45941 a!3961) pivot!34)))))

(assert (=> d!148705 (= lt!607770 e!782177)))

(declare-fun c!128367 () Bool)

(assert (=> d!148705 (= c!128367 (bvsge pivot!34 to!135))))

(assert (=> d!148705 (and (bvsle pivot!34 to!135) (bvsge pivot!34 #b00000000000000000000000000000000) (bvsle to!135 (size!45941 a!3961)))))

(assert (=> d!148705 (= (arrayCountValidKeys!0 a!3961 pivot!34 to!135) lt!607770)))

(assert (= (and d!148705 c!128367) b!1380378))

(assert (= (and d!148705 (not c!128367)) b!1380377))

(assert (= (and b!1380377 c!128368) b!1380376))

(assert (= (and b!1380377 (not c!128368)) b!1380379))

(assert (= (or b!1380376 b!1380379) bm!66196))

(assert (=> b!1380377 m!1264985))

(assert (=> b!1380377 m!1264985))

(assert (=> b!1380377 m!1264987))

(declare-fun m!1265113 () Bool)

(assert (=> bm!66196 m!1265113))

(assert (=> d!148665 d!148705))

(declare-fun b!1380380 () Bool)

(declare-fun e!782180 () (_ BitVec 32))

(declare-fun call!66200 () (_ BitVec 32))

(assert (=> b!1380380 (= e!782180 (bvadd #b00000000000000000000000000000001 call!66200))))

(declare-fun b!1380381 () Bool)

(declare-fun e!782179 () (_ BitVec 32))

(assert (=> b!1380381 (= e!782179 e!782180)))

(declare-fun c!128370 () Bool)

(assert (=> b!1380381 (= c!128370 (validKeyInArray!0 (select (arr!45389 a!3961) from!3339)))))

(declare-fun b!1380382 () Bool)

(assert (=> b!1380382 (= e!782179 #b00000000000000000000000000000000)))

(declare-fun b!1380383 () Bool)

(assert (=> b!1380383 (= e!782180 call!66200)))

(declare-fun bm!66197 () Bool)

(assert (=> bm!66197 (= call!66200 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) to!135))))

(declare-fun d!148707 () Bool)

(declare-fun lt!607771 () (_ BitVec 32))

(assert (=> d!148707 (and (bvsge lt!607771 #b00000000000000000000000000000000) (bvsle lt!607771 (bvsub (size!45941 a!3961) from!3339)))))

(assert (=> d!148707 (= lt!607771 e!782179)))

(declare-fun c!128369 () Bool)

(assert (=> d!148707 (= c!128369 (bvsge from!3339 to!135))))

(assert (=> d!148707 (and (bvsle from!3339 to!135) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle to!135 (size!45941 a!3961)))))

(assert (=> d!148707 (= (arrayCountValidKeys!0 a!3961 from!3339 to!135) lt!607771)))

(assert (= (and d!148707 c!128369) b!1380382))

(assert (= (and d!148707 (not c!128369)) b!1380381))

(assert (= (and b!1380381 c!128370) b!1380380))

(assert (= (and b!1380381 (not c!128370)) b!1380383))

(assert (= (or b!1380380 b!1380383) bm!66197))

(assert (=> b!1380381 m!1265053))

(assert (=> b!1380381 m!1265053))

(assert (=> b!1380381 m!1265055))

(declare-fun m!1265115 () Bool)

(assert (=> bm!66197 m!1265115))

(assert (=> d!148665 d!148707))

(assert (=> bm!66163 d!148657))

(declare-fun b!1380384 () Bool)

(declare-fun e!782182 () (_ BitVec 32))

(declare-fun call!66201 () (_ BitVec 32))

(assert (=> b!1380384 (= e!782182 (bvadd #b00000000000000000000000000000001 call!66201))))

(declare-fun b!1380385 () Bool)

(declare-fun e!782181 () (_ BitVec 32))

(assert (=> b!1380385 (= e!782181 e!782182)))

(declare-fun c!128372 () Bool)

(assert (=> b!1380385 (= c!128372 (validKeyInArray!0 (select (arr!45389 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun b!1380386 () Bool)

(assert (=> b!1380386 (= e!782181 #b00000000000000000000000000000000)))

(declare-fun b!1380387 () Bool)

(assert (=> b!1380387 (= e!782182 call!66201)))

(declare-fun bm!66198 () Bool)

(assert (=> bm!66198 (= call!66201 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) pivot!34))))

(declare-fun d!148709 () Bool)

(declare-fun lt!607772 () (_ BitVec 32))

(assert (=> d!148709 (and (bvsge lt!607772 #b00000000000000000000000000000000) (bvsle lt!607772 (bvsub (size!45941 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!148709 (= lt!607772 e!782181)))

(declare-fun c!128371 () Bool)

(assert (=> d!148709 (= c!128371 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(assert (=> d!148709 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle pivot!34 (size!45941 a!3961)))))

(assert (=> d!148709 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) lt!607772)))

(assert (= (and d!148709 c!128371) b!1380386))

(assert (= (and d!148709 (not c!128371)) b!1380385))

(assert (= (and b!1380385 c!128372) b!1380384))

(assert (= (and b!1380385 (not c!128372)) b!1380387))

(assert (= (or b!1380384 b!1380387) bm!66198))

(declare-fun m!1265117 () Bool)

(assert (=> b!1380385 m!1265117))

(assert (=> b!1380385 m!1265117))

(declare-fun m!1265119 () Bool)

(assert (=> b!1380385 m!1265119))

(declare-fun m!1265121 () Bool)

(assert (=> bm!66198 m!1265121))

(assert (=> bm!66169 d!148709))

(assert (=> d!148641 d!148657))

(declare-fun b!1380388 () Bool)

(declare-fun e!782184 () (_ BitVec 32))

(declare-fun call!66202 () (_ BitVec 32))

(assert (=> b!1380388 (= e!782184 (bvadd #b00000000000000000000000000000001 call!66202))))

(declare-fun b!1380389 () Bool)

(declare-fun e!782183 () (_ BitVec 32))

(assert (=> b!1380389 (= e!782183 e!782184)))

(declare-fun c!128374 () Bool)

(assert (=> b!1380389 (= c!128374 (validKeyInArray!0 (select (arr!45389 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(declare-fun b!1380390 () Bool)

(assert (=> b!1380390 (= e!782183 #b00000000000000000000000000000000)))

(declare-fun b!1380391 () Bool)

(assert (=> b!1380391 (= e!782184 call!66202)))

(declare-fun bm!66199 () Bool)

(assert (=> bm!66199 (= call!66202 (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34 #b00000000000000000000000000000001) to!135))))

(declare-fun d!148711 () Bool)

(declare-fun lt!607773 () (_ BitVec 32))

(assert (=> d!148711 (and (bvsge lt!607773 #b00000000000000000000000000000000) (bvsle lt!607773 (bvsub (size!45941 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(assert (=> d!148711 (= lt!607773 e!782183)))

(declare-fun c!128373 () Bool)

(assert (=> d!148711 (= c!128373 (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) to!135))))

(assert (=> d!148711 (and (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) to!135) (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000000) (bvsle to!135 (size!45941 a!3961)))))

(assert (=> d!148711 (= (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135) lt!607773)))

(assert (= (and d!148711 c!128373) b!1380390))

(assert (= (and d!148711 (not c!128373)) b!1380389))

(assert (= (and b!1380389 c!128374) b!1380388))

(assert (= (and b!1380389 (not c!128374)) b!1380391))

(assert (= (or b!1380388 b!1380391) bm!66199))

(declare-fun m!1265123 () Bool)

(assert (=> b!1380389 m!1265123))

(assert (=> b!1380389 m!1265123))

(declare-fun m!1265125 () Bool)

(assert (=> b!1380389 m!1265125))

(declare-fun m!1265127 () Bool)

(assert (=> bm!66199 m!1265127))

(assert (=> d!148641 d!148711))

(assert (=> d!148641 d!148707))

(declare-fun d!148713 () Bool)

(assert (=> d!148713 (= (validKeyInArray!0 (select (arr!45389 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))) (and (not (= (select (arr!45389 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45389 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380283 d!148713))

(declare-fun b!1380392 () Bool)

(declare-fun e!782186 () (_ BitVec 32))

(declare-fun call!66203 () (_ BitVec 32))

(assert (=> b!1380392 (= e!782186 (bvadd #b00000000000000000000000000000001 call!66203))))

(declare-fun b!1380393 () Bool)

(declare-fun e!782185 () (_ BitVec 32))

(assert (=> b!1380393 (= e!782185 e!782186)))

(declare-fun c!128376 () Bool)

(assert (=> b!1380393 (= c!128376 (validKeyInArray!0 (select (arr!45389 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun b!1380394 () Bool)

(assert (=> b!1380394 (= e!782185 #b00000000000000000000000000000000)))

(declare-fun b!1380395 () Bool)

(assert (=> b!1380395 (= e!782186 call!66203)))

(declare-fun bm!66200 () Bool)

(assert (=> bm!66200 (= call!66203 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun d!148715 () Bool)

(declare-fun lt!607774 () (_ BitVec 32))

(assert (=> d!148715 (and (bvsge lt!607774 #b00000000000000000000000000000000) (bvsle lt!607774 (bvsub (size!45941 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!148715 (= lt!607774 e!782185)))

(declare-fun c!128375 () Bool)

(assert (=> d!148715 (= c!128375 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148715 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45941 a!3961)))))

(assert (=> d!148715 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607774)))

(assert (= (and d!148715 c!128375) b!1380394))

(assert (= (and d!148715 (not c!128375)) b!1380393))

(assert (= (and b!1380393 c!128376) b!1380392))

(assert (= (and b!1380393 (not c!128376)) b!1380395))

(assert (= (or b!1380392 b!1380395) bm!66200))

(assert (=> b!1380393 m!1265117))

(assert (=> b!1380393 m!1265117))

(assert (=> b!1380393 m!1265119))

(declare-fun m!1265129 () Bool)

(assert (=> bm!66200 m!1265129))

(assert (=> bm!66170 d!148715))

(declare-fun d!148717 () Bool)

(declare-fun e!782189 () Bool)

(assert (=> d!148717 e!782189))

(declare-fun c!128379 () Bool)

(assert (=> d!148717 (= c!128379 (validKeyInArray!0 (select (arr!45389 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(assert (=> d!148717 true))

(declare-fun _$73!20 () Unit!45800)

(assert (=> d!148717 (= (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) _$73!20)))

(declare-fun b!1380400 () Bool)

(declare-fun call!66208 () (_ BitVec 32))

(declare-fun call!66209 () (_ BitVec 32))

(assert (=> b!1380400 (= e!782189 (= (bvadd call!66208 #b00000000000000000000000000000001) call!66209))))

(declare-fun bm!66205 () Bool)

(assert (=> bm!66205 (= call!66208 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun bm!66206 () Bool)

(assert (=> bm!66206 (= call!66209 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380401 () Bool)

(assert (=> b!1380401 (= e!782189 (= call!66208 call!66209))))

(assert (= (and d!148717 c!128379) b!1380400))

(assert (= (and d!148717 (not c!128379)) b!1380401))

(assert (= (or b!1380400 b!1380401) bm!66205))

(assert (= (or b!1380400 b!1380401) bm!66206))

(assert (=> d!148717 m!1265049))

(assert (=> d!148717 m!1265049))

(assert (=> d!148717 m!1265051))

(assert (=> bm!66205 m!1265045))

(assert (=> bm!66206 m!1264975))

(assert (=> d!148649 d!148717))

(declare-fun b!1380402 () Bool)

(declare-fun e!782191 () (_ BitVec 32))

(declare-fun call!66210 () (_ BitVec 32))

(assert (=> b!1380402 (= e!782191 (bvadd #b00000000000000000000000000000001 call!66210))))

(declare-fun b!1380403 () Bool)

(declare-fun e!782190 () (_ BitVec 32))

(assert (=> b!1380403 (= e!782190 e!782191)))

(declare-fun c!128381 () Bool)

(assert (=> b!1380403 (= c!128381 (validKeyInArray!0 (select (arr!45389 a!3961) from!3339)))))

(declare-fun b!1380404 () Bool)

(assert (=> b!1380404 (= e!782190 #b00000000000000000000000000000000)))

(declare-fun b!1380405 () Bool)

(assert (=> b!1380405 (= e!782191 call!66210)))

(declare-fun bm!66207 () Bool)

(assert (=> bm!66207 (= call!66210 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun d!148719 () Bool)

(declare-fun lt!607775 () (_ BitVec 32))

(assert (=> d!148719 (and (bvsge lt!607775 #b00000000000000000000000000000000) (bvsle lt!607775 (bvsub (size!45941 a!3961) from!3339)))))

(assert (=> d!148719 (= lt!607775 e!782190)))

(declare-fun c!128380 () Bool)

(assert (=> d!148719 (= c!128380 (bvsge from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(assert (=> d!148719 (and (bvsle from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001) (size!45941 a!3961)))))

(assert (=> d!148719 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) lt!607775)))

(assert (= (and d!148719 c!128380) b!1380404))

(assert (= (and d!148719 (not c!128380)) b!1380403))

(assert (= (and b!1380403 c!128381) b!1380402))

(assert (= (and b!1380403 (not c!128381)) b!1380405))

(assert (= (or b!1380402 b!1380405) bm!66207))

(assert (=> b!1380403 m!1265053))

(assert (=> b!1380403 m!1265053))

(assert (=> b!1380403 m!1265055))

(declare-fun m!1265131 () Bool)

(assert (=> bm!66207 m!1265131))

(assert (=> bm!66162 d!148719))

(assert (=> b!1380305 d!148703))

(push 1)

(assert (not bm!66200))

(assert (not b!1380385))

(assert (not b!1380403))

(assert (not bm!66196))

(assert (not bm!66199))

(assert (not b!1380393))

(assert (not bm!66197))

(assert (not b!1380389))

(assert (not b!1380377))

(assert (not bm!66207))

(assert (not b!1380381))

(assert (not bm!66198))

(assert (not bm!66205))

(assert (not d!148717))

(assert (not bm!66206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

