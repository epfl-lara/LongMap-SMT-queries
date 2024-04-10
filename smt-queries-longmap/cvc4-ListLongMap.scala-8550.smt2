; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104390 () Bool)

(assert start!104390)

(declare-datatypes ((array!80221 0))(
  ( (array!80222 (arr!38689 (Array (_ BitVec 32) (_ BitVec 64))) (size!39225 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80221)

(declare-fun b!1246229 () Bool)

(declare-datatypes ((List!27492 0))(
  ( (Nil!27489) (Cons!27488 (h!28697 (_ BitVec 64)) (t!40961 List!27492)) )
))
(declare-fun lt!563036 () List!27492)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun e!706740 () Bool)

(declare-fun arrayNoDuplicates!0 (array!80221 (_ BitVec 32) List!27492) Bool)

(assert (=> b!1246229 (= e!706740 (not (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563036)))))

(declare-datatypes ((Unit!41400 0))(
  ( (Unit!41401) )
))
(declare-fun lt!563037 () Unit!41400)

(declare-fun noDuplicateSubseq!109 (List!27492 List!27492) Unit!41400)

(assert (=> b!1246229 (= lt!563037 (noDuplicateSubseq!109 Nil!27489 lt!563036))))

(declare-fun b!1246231 () Bool)

(declare-fun res!831623 () Bool)

(assert (=> b!1246231 (=> (not res!831623) (not e!706740))))

(declare-fun contains!7458 (List!27492 (_ BitVec 64)) Bool)

(assert (=> b!1246231 (= res!831623 (not (contains!7458 lt!563036 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246232 () Bool)

(declare-fun res!831624 () Bool)

(assert (=> b!1246232 (=> (not res!831624) (not e!706740))))

(declare-fun subseq!658 (List!27492 List!27492) Bool)

(assert (=> b!1246232 (= res!831624 (subseq!658 Nil!27489 lt!563036))))

(declare-fun b!1246233 () Bool)

(declare-fun res!831625 () Bool)

(assert (=> b!1246233 (=> (not res!831625) (not e!706740))))

(assert (=> b!1246233 (= res!831625 (not (contains!7458 Nil!27489 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246234 () Bool)

(declare-fun res!831621 () Bool)

(assert (=> b!1246234 (=> (not res!831621) (not e!706740))))

(assert (=> b!1246234 (= res!831621 (not (contains!7458 Nil!27489 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1246235 () Bool)

(declare-fun res!831628 () Bool)

(declare-fun e!706741 () Bool)

(assert (=> b!1246235 (=> (not res!831628) (not e!706741))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246235 (= res!831628 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39225 a!3892)) (not (= newFrom!287 (size!39225 a!3892)))))))

(declare-fun b!1246236 () Bool)

(declare-fun res!831626 () Bool)

(assert (=> b!1246236 (=> (not res!831626) (not e!706741))))

(assert (=> b!1246236 (= res!831626 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27489))))

(declare-fun b!1246237 () Bool)

(declare-fun res!831618 () Bool)

(assert (=> b!1246237 (=> (not res!831618) (not e!706740))))

(declare-fun noDuplicate!2037 (List!27492) Bool)

(assert (=> b!1246237 (= res!831618 (noDuplicate!2037 lt!563036))))

(declare-fun b!1246238 () Bool)

(declare-fun res!831619 () Bool)

(assert (=> b!1246238 (=> (not res!831619) (not e!706741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246238 (= res!831619 (validKeyInArray!0 (select (arr!38689 a!3892) from!3270)))))

(declare-fun b!1246239 () Bool)

(assert (=> b!1246239 (= e!706741 e!706740)))

(declare-fun res!831622 () Bool)

(assert (=> b!1246239 (=> (not res!831622) (not e!706740))))

(assert (=> b!1246239 (= res!831622 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1246239 (= lt!563036 (Cons!27488 (select (arr!38689 a!3892) from!3270) Nil!27489))))

(declare-fun res!831627 () Bool)

(assert (=> start!104390 (=> (not res!831627) (not e!706741))))

(assert (=> start!104390 (= res!831627 (and (bvslt (size!39225 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39225 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39225 a!3892))))))

(assert (=> start!104390 e!706741))

(declare-fun array_inv!29537 (array!80221) Bool)

(assert (=> start!104390 (array_inv!29537 a!3892)))

(assert (=> start!104390 true))

(declare-fun b!1246230 () Bool)

(declare-fun res!831620 () Bool)

(assert (=> b!1246230 (=> (not res!831620) (not e!706740))))

(assert (=> b!1246230 (= res!831620 (not (contains!7458 lt!563036 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!104390 res!831627) b!1246236))

(assert (= (and b!1246236 res!831626) b!1246235))

(assert (= (and b!1246235 res!831628) b!1246238))

(assert (= (and b!1246238 res!831619) b!1246239))

(assert (= (and b!1246239 res!831622) b!1246237))

(assert (= (and b!1246237 res!831618) b!1246230))

(assert (= (and b!1246230 res!831620) b!1246231))

(assert (= (and b!1246231 res!831623) b!1246234))

(assert (= (and b!1246234 res!831621) b!1246233))

(assert (= (and b!1246233 res!831625) b!1246232))

(assert (= (and b!1246232 res!831624) b!1246229))

(declare-fun m!1148093 () Bool)

(assert (=> b!1246230 m!1148093))

(declare-fun m!1148095 () Bool)

(assert (=> b!1246236 m!1148095))

(declare-fun m!1148097 () Bool)

(assert (=> b!1246238 m!1148097))

(assert (=> b!1246238 m!1148097))

(declare-fun m!1148099 () Bool)

(assert (=> b!1246238 m!1148099))

(declare-fun m!1148101 () Bool)

(assert (=> b!1246229 m!1148101))

(declare-fun m!1148103 () Bool)

(assert (=> b!1246229 m!1148103))

(declare-fun m!1148105 () Bool)

(assert (=> b!1246237 m!1148105))

(declare-fun m!1148107 () Bool)

(assert (=> start!104390 m!1148107))

(declare-fun m!1148109 () Bool)

(assert (=> b!1246232 m!1148109))

(declare-fun m!1148111 () Bool)

(assert (=> b!1246233 m!1148111))

(assert (=> b!1246239 m!1148097))

(declare-fun m!1148113 () Bool)

(assert (=> b!1246234 m!1148113))

(declare-fun m!1148115 () Bool)

(assert (=> b!1246231 m!1148115))

(push 1)

(assert (not b!1246234))

(assert (not b!1246230))

(assert (not b!1246237))

(assert (not b!1246238))

(assert (not b!1246229))

(assert (not b!1246232))

(assert (not b!1246233))

(assert (not start!104390))

(assert (not b!1246231))

(assert (not b!1246236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137577 () Bool)

(declare-fun lt!563042 () Bool)

(declare-fun content!630 (List!27492) (Set (_ BitVec 64)))

(assert (=> d!137577 (= lt!563042 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!630 lt!563036)))))

(declare-fun e!706748 () Bool)

(assert (=> d!137577 (= lt!563042 e!706748)))

(declare-fun res!831634 () Bool)

(assert (=> d!137577 (=> (not res!831634) (not e!706748))))

(assert (=> d!137577 (= res!831634 (is-Cons!27488 lt!563036))))

(assert (=> d!137577 (= (contains!7458 lt!563036 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563042)))

(declare-fun b!1246244 () Bool)

(declare-fun e!706747 () Bool)

(assert (=> b!1246244 (= e!706748 e!706747)))

(declare-fun res!831633 () Bool)

(assert (=> b!1246244 (=> res!831633 e!706747)))

(assert (=> b!1246244 (= res!831633 (= (h!28697 lt!563036) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246245 () Bool)

(assert (=> b!1246245 (= e!706747 (contains!7458 (t!40961 lt!563036) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137577 res!831634) b!1246244))

(assert (= (and b!1246244 (not res!831633)) b!1246245))

(declare-fun m!1148117 () Bool)

(assert (=> d!137577 m!1148117))

(declare-fun m!1148119 () Bool)

(assert (=> d!137577 m!1148119))

(declare-fun m!1148121 () Bool)

(assert (=> b!1246245 m!1148121))

(assert (=> b!1246231 d!137577))

(declare-fun b!1246270 () Bool)

(declare-fun e!706772 () Bool)

(declare-fun e!706771 () Bool)

(assert (=> b!1246270 (= e!706772 e!706771)))

(declare-fun c!121992 () Bool)

(assert (=> b!1246270 (= c!121992 (validKeyInArray!0 (select (arr!38689 a!3892) from!3270)))))

(declare-fun b!1246271 () Bool)

(declare-fun call!61518 () Bool)

(assert (=> b!1246271 (= e!706771 call!61518)))

(declare-fun bm!61515 () Bool)

(assert (=> bm!61515 (= call!61518 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121992 (Cons!27488 (select (arr!38689 a!3892) from!3270) Nil!27489) Nil!27489)))))

(declare-fun b!1246272 () Bool)

(declare-fun e!706774 () Bool)

(assert (=> b!1246272 (= e!706774 e!706772)))

(declare-fun res!831656 () Bool)

(assert (=> b!1246272 (=> (not res!831656) (not e!706772))))

(declare-fun e!706773 () Bool)

(assert (=> b!1246272 (= res!831656 (not e!706773))))

(declare-fun res!831657 () Bool)

(assert (=> b!1246272 (=> (not res!831657) (not e!706773))))

(assert (=> b!1246272 (= res!831657 (validKeyInArray!0 (select (arr!38689 a!3892) from!3270)))))

(declare-fun b!1246273 () Bool)

(assert (=> b!1246273 (= e!706773 (contains!7458 Nil!27489 (select (arr!38689 a!3892) from!3270)))))

(declare-fun d!137581 () Bool)

(declare-fun res!831655 () Bool)

(assert (=> d!137581 (=> res!831655 e!706774)))

(assert (=> d!137581 (= res!831655 (bvsge from!3270 (size!39225 a!3892)))))

(assert (=> d!137581 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27489) e!706774)))

(declare-fun b!1246274 () Bool)

(assert (=> b!1246274 (= e!706771 call!61518)))

(assert (= (and d!137581 (not res!831655)) b!1246272))

(assert (= (and b!1246272 res!831657) b!1246273))

(assert (= (and b!1246272 res!831656) b!1246270))

(assert (= (and b!1246270 c!121992) b!1246274))

(assert (= (and b!1246270 (not c!121992)) b!1246271))

(assert (= (or b!1246274 b!1246271) bm!61515))

(assert (=> b!1246270 m!1148097))

(assert (=> b!1246270 m!1148097))

(assert (=> b!1246270 m!1148099))

(assert (=> bm!61515 m!1148097))

(declare-fun m!1148141 () Bool)

(assert (=> bm!61515 m!1148141))

(assert (=> b!1246272 m!1148097))

(assert (=> b!1246272 m!1148097))

(assert (=> b!1246272 m!1148099))

(assert (=> b!1246273 m!1148097))

(assert (=> b!1246273 m!1148097))

(declare-fun m!1148143 () Bool)

(assert (=> b!1246273 m!1148143))

(assert (=> b!1246236 d!137581))

(declare-fun d!137593 () Bool)

(assert (=> d!137593 (= (array_inv!29537 a!3892) (bvsge (size!39225 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104390 d!137593))

(declare-fun d!137595 () Bool)

(assert (=> d!137595 (= (validKeyInArray!0 (select (arr!38689 a!3892) from!3270)) (and (not (= (select (arr!38689 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38689 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1246238 d!137595))

(declare-fun d!137597 () Bool)

(declare-fun res!831680 () Bool)

(declare-fun e!706799 () Bool)

(assert (=> d!137597 (=> res!831680 e!706799)))

(assert (=> d!137597 (= res!831680 (is-Nil!27489 lt!563036))))

(assert (=> d!137597 (= (noDuplicate!2037 lt!563036) e!706799)))

(declare-fun b!1246301 () Bool)

(declare-fun e!706800 () Bool)

(assert (=> b!1246301 (= e!706799 e!706800)))

(declare-fun res!831681 () Bool)

(assert (=> b!1246301 (=> (not res!831681) (not e!706800))))

(assert (=> b!1246301 (= res!831681 (not (contains!7458 (t!40961 lt!563036) (h!28697 lt!563036))))))

(declare-fun b!1246302 () Bool)

(assert (=> b!1246302 (= e!706800 (noDuplicate!2037 (t!40961 lt!563036)))))

(assert (= (and d!137597 (not res!831680)) b!1246301))

(assert (= (and b!1246301 res!831681) b!1246302))

(declare-fun m!1148149 () Bool)

(assert (=> b!1246301 m!1148149))

(declare-fun m!1148151 () Bool)

(assert (=> b!1246302 m!1148151))

(assert (=> b!1246237 d!137597))

(declare-fun b!1246327 () Bool)

(declare-fun e!706824 () Bool)

(declare-fun e!706822 () Bool)

(assert (=> b!1246327 (= e!706824 e!706822)))

(declare-fun res!831704 () Bool)

(assert (=> b!1246327 (=> res!831704 e!706822)))

(declare-fun e!706823 () Bool)

(assert (=> b!1246327 (= res!831704 e!706823)))

(declare-fun res!831701 () Bool)

(assert (=> b!1246327 (=> (not res!831701) (not e!706823))))

(assert (=> b!1246327 (= res!831701 (= (h!28697 Nil!27489) (h!28697 lt!563036)))))

(declare-fun b!1246328 () Bool)

(assert (=> b!1246328 (= e!706823 (subseq!658 (t!40961 Nil!27489) (t!40961 lt!563036)))))

(declare-fun b!1246326 () Bool)

(declare-fun e!706821 () Bool)

(assert (=> b!1246326 (= e!706821 e!706824)))

(declare-fun res!831703 () Bool)

(assert (=> b!1246326 (=> (not res!831703) (not e!706824))))

(assert (=> b!1246326 (= res!831703 (is-Cons!27488 lt!563036))))

(declare-fun b!1246329 () Bool)

(assert (=> b!1246329 (= e!706822 (subseq!658 Nil!27489 (t!40961 lt!563036)))))

(declare-fun d!137603 () Bool)

(declare-fun res!831702 () Bool)

(assert (=> d!137603 (=> res!831702 e!706821)))

(assert (=> d!137603 (= res!831702 (is-Nil!27489 Nil!27489))))

(assert (=> d!137603 (= (subseq!658 Nil!27489 lt!563036) e!706821)))

(assert (= (and d!137603 (not res!831702)) b!1246326))

(assert (= (and b!1246326 res!831703) b!1246327))

(assert (= (and b!1246327 res!831701) b!1246328))

(assert (= (and b!1246327 (not res!831704)) b!1246329))

(declare-fun m!1148165 () Bool)

(assert (=> b!1246328 m!1148165))

(declare-fun m!1148167 () Bool)

(assert (=> b!1246329 m!1148167))

(assert (=> b!1246232 d!137603))

(declare-fun d!137611 () Bool)

(declare-fun lt!563051 () Bool)

(assert (=> d!137611 (= lt!563051 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!630 Nil!27489)))))

(declare-fun e!706830 () Bool)

(assert (=> d!137611 (= lt!563051 e!706830)))

(declare-fun res!831708 () Bool)

(assert (=> d!137611 (=> (not res!831708) (not e!706830))))

(assert (=> d!137611 (= res!831708 (is-Cons!27488 Nil!27489))))

(assert (=> d!137611 (= (contains!7458 Nil!27489 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563051)))

(declare-fun b!1246334 () Bool)

(declare-fun e!706829 () Bool)

(assert (=> b!1246334 (= e!706830 e!706829)))

(declare-fun res!831707 () Bool)

(assert (=> b!1246334 (=> res!831707 e!706829)))

(assert (=> b!1246334 (= res!831707 (= (h!28697 Nil!27489) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246335 () Bool)

(assert (=> b!1246335 (= e!706829 (contains!7458 (t!40961 Nil!27489) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137611 res!831708) b!1246334))

(assert (= (and b!1246334 (not res!831707)) b!1246335))

(declare-fun m!1148169 () Bool)

(assert (=> d!137611 m!1148169))

(declare-fun m!1148171 () Bool)

(assert (=> d!137611 m!1148171))

(declare-fun m!1148173 () Bool)

(assert (=> b!1246335 m!1148173))

(assert (=> b!1246234 d!137611))

(declare-fun d!137613 () Bool)

(declare-fun lt!563052 () Bool)

(assert (=> d!137613 (= lt!563052 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!630 Nil!27489)))))

(declare-fun e!706832 () Bool)

(assert (=> d!137613 (= lt!563052 e!706832)))

(declare-fun res!831710 () Bool)

(assert (=> d!137613 (=> (not res!831710) (not e!706832))))

(assert (=> d!137613 (= res!831710 (is-Cons!27488 Nil!27489))))

(assert (=> d!137613 (= (contains!7458 Nil!27489 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563052)))

(declare-fun b!1246336 () Bool)

(declare-fun e!706831 () Bool)

(assert (=> b!1246336 (= e!706832 e!706831)))

(declare-fun res!831709 () Bool)

(assert (=> b!1246336 (=> res!831709 e!706831)))

(assert (=> b!1246336 (= res!831709 (= (h!28697 Nil!27489) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246337 () Bool)

(assert (=> b!1246337 (= e!706831 (contains!7458 (t!40961 Nil!27489) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137613 res!831710) b!1246336))

(assert (= (and b!1246336 (not res!831709)) b!1246337))

(assert (=> d!137613 m!1148169))

(declare-fun m!1148175 () Bool)

(assert (=> d!137613 m!1148175))

(declare-fun m!1148177 () Bool)

(assert (=> b!1246337 m!1148177))

(assert (=> b!1246233 d!137613))

(declare-fun d!137615 () Bool)

(declare-fun lt!563054 () Bool)

(assert (=> d!137615 (= lt!563054 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!630 lt!563036)))))

(declare-fun e!706835 () Bool)

(assert (=> d!137615 (= lt!563054 e!706835)))

(declare-fun res!831713 () Bool)

(assert (=> d!137615 (=> (not res!831713) (not e!706835))))

(assert (=> d!137615 (= res!831713 (is-Cons!27488 lt!563036))))

(assert (=> d!137615 (= (contains!7458 lt!563036 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563054)))

(declare-fun b!1246339 () Bool)

(declare-fun e!706834 () Bool)

(assert (=> b!1246339 (= e!706835 e!706834)))

(declare-fun res!831712 () Bool)

(assert (=> b!1246339 (=> res!831712 e!706834)))

(assert (=> b!1246339 (= res!831712 (= (h!28697 lt!563036) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246340 () Bool)

(assert (=> b!1246340 (= e!706834 (contains!7458 (t!40961 lt!563036) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137615 res!831713) b!1246339))

(assert (= (and b!1246339 (not res!831712)) b!1246340))

(assert (=> d!137615 m!1148117))

(declare-fun m!1148183 () Bool)

(assert (=> d!137615 m!1148183))

(declare-fun m!1148185 () Bool)

(assert (=> b!1246340 m!1148185))

(assert (=> b!1246230 d!137615))

(declare-fun b!1246341 () Bool)

(declare-fun e!706837 () Bool)

(declare-fun e!706836 () Bool)

(assert (=> b!1246341 (= e!706837 e!706836)))

(declare-fun c!121998 () Bool)

(assert (=> b!1246341 (= c!121998 (validKeyInArray!0 (select (arr!38689 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246342 () Bool)

(declare-fun call!61524 () Bool)

(assert (=> b!1246342 (= e!706836 call!61524)))

(declare-fun bm!61521 () Bool)

(assert (=> bm!61521 (= call!61524 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121998 (Cons!27488 (select (arr!38689 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) lt!563036) lt!563036)))))

(declare-fun b!1246343 () Bool)

(declare-fun e!706839 () Bool)

(assert (=> b!1246343 (= e!706839 e!706837)))

(declare-fun res!831715 () Bool)

(assert (=> b!1246343 (=> (not res!831715) (not e!706837))))

(declare-fun e!706838 () Bool)

(assert (=> b!1246343 (= res!831715 (not e!706838))))

(declare-fun res!831716 () Bool)

(assert (=> b!1246343 (=> (not res!831716) (not e!706838))))

(assert (=> b!1246343 (= res!831716 (validKeyInArray!0 (select (arr!38689 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1246344 () Bool)

(assert (=> b!1246344 (= e!706838 (contains!7458 lt!563036 (select (arr!38689 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun d!137619 () Bool)

(declare-fun res!831714 () Bool)

(assert (=> d!137619 (=> res!831714 e!706839)))

(assert (=> d!137619 (= res!831714 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39225 a!3892)))))

(assert (=> d!137619 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!563036) e!706839)))

(declare-fun b!1246345 () Bool)

(assert (=> b!1246345 (= e!706836 call!61524)))

(assert (= (and d!137619 (not res!831714)) b!1246343))

(assert (= (and b!1246343 res!831716) b!1246344))

(assert (= (and b!1246343 res!831715) b!1246341))

(assert (= (and b!1246341 c!121998) b!1246345))

(assert (= (and b!1246341 (not c!121998)) b!1246342))

(assert (= (or b!1246345 b!1246342) bm!61521))

(declare-fun m!1148187 () Bool)

(assert (=> b!1246341 m!1148187))

(assert (=> b!1246341 m!1148187))

(declare-fun m!1148189 () Bool)

(assert (=> b!1246341 m!1148189))

(assert (=> bm!61521 m!1148187))

(declare-fun m!1148191 () Bool)

(assert (=> bm!61521 m!1148191))

(assert (=> b!1246343 m!1148187))

(assert (=> b!1246343 m!1148187))

(assert (=> b!1246343 m!1148189))

(assert (=> b!1246344 m!1148187))

(assert (=> b!1246344 m!1148187))

(declare-fun m!1148193 () Bool)

(assert (=> b!1246344 m!1148193))

(assert (=> b!1246229 d!137619))

(declare-fun d!137621 () Bool)

(assert (=> d!137621 (noDuplicate!2037 Nil!27489)))

(declare-fun lt!563058 () Unit!41400)

(declare-fun choose!1845 (List!27492 List!27492) Unit!41400)

(assert (=> d!137621 (= lt!563058 (choose!1845 Nil!27489 lt!563036))))

(declare-fun e!706854 () Bool)

(assert (=> d!137621 e!706854))

(declare-fun res!831730 () Bool)

(assert (=> d!137621 (=> (not res!831730) (not e!706854))))

(assert (=> d!137621 (= res!831730 (subseq!658 Nil!27489 lt!563036))))

(assert (=> d!137621 (= (noDuplicateSubseq!109 Nil!27489 lt!563036) lt!563058)))

(declare-fun b!1246361 () Bool)

(assert (=> b!1246361 (= e!706854 (noDuplicate!2037 lt!563036))))

(assert (= (and d!137621 res!831730) b!1246361))

(declare-fun m!1148211 () Bool)

(assert (=> d!137621 m!1148211))

(declare-fun m!1148213 () Bool)

(assert (=> d!137621 m!1148213))

(assert (=> d!137621 m!1148109))

(assert (=> b!1246361 m!1148105))

(assert (=> b!1246229 d!137621))

(push 1)

