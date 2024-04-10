; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104308 () Bool)

(assert start!104308)

(declare-fun b!1245754 () Bool)

(declare-fun res!831180 () Bool)

(declare-fun e!706446 () Bool)

(assert (=> b!1245754 (=> (not res!831180) (not e!706446))))

(declare-datatypes ((array!80199 0))(
  ( (array!80200 (arr!38681 (Array (_ BitVec 32) (_ BitVec 64))) (size!39217 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80199)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245754 (= res!831180 (validKeyInArray!0 (select (arr!38681 a!3892) from!3270)))))

(declare-fun b!1245755 () Bool)

(declare-fun res!831183 () Bool)

(declare-fun e!706447 () Bool)

(assert (=> b!1245755 (=> (not res!831183) (not e!706447))))

(declare-datatypes ((List!27484 0))(
  ( (Nil!27481) (Cons!27480 (h!28689 (_ BitVec 64)) (t!40953 List!27484)) )
))
(declare-fun lt!562968 () List!27484)

(declare-fun noDuplicate!2029 (List!27484) Bool)

(assert (=> b!1245755 (= res!831183 (noDuplicate!2029 lt!562968))))

(declare-fun b!1245756 () Bool)

(declare-fun res!831185 () Bool)

(assert (=> b!1245756 (=> (not res!831185) (not e!706447))))

(declare-fun contains!7450 (List!27484 (_ BitVec 64)) Bool)

(assert (=> b!1245756 (= res!831185 (not (contains!7450 lt!562968 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245757 () Bool)

(declare-fun e!706445 () Bool)

(assert (=> b!1245757 (= e!706447 e!706445)))

(declare-fun res!831179 () Bool)

(assert (=> b!1245757 (=> res!831179 e!706445)))

(assert (=> b!1245757 (= res!831179 (contains!7450 Nil!27481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245758 () Bool)

(declare-fun res!831187 () Bool)

(assert (=> b!1245758 (=> (not res!831187) (not e!706446))))

(declare-fun arrayNoDuplicates!0 (array!80199 (_ BitVec 32) List!27484) Bool)

(assert (=> b!1245758 (= res!831187 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27481))))

(declare-fun res!831182 () Bool)

(assert (=> start!104308 (=> (not res!831182) (not e!706446))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104308 (= res!831182 (and (bvslt (size!39217 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39217 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39217 a!3892))))))

(assert (=> start!104308 e!706446))

(declare-fun array_inv!29529 (array!80199) Bool)

(assert (=> start!104308 (array_inv!29529 a!3892)))

(assert (=> start!104308 true))

(declare-fun b!1245759 () Bool)

(declare-fun res!831184 () Bool)

(assert (=> b!1245759 (=> (not res!831184) (not e!706446))))

(assert (=> b!1245759 (= res!831184 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39217 a!3892)) (not (= newFrom!287 (size!39217 a!3892)))))))

(declare-fun b!1245760 () Bool)

(assert (=> b!1245760 (= e!706445 (contains!7450 Nil!27481 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245761 () Bool)

(assert (=> b!1245761 (= e!706446 e!706447)))

(declare-fun res!831186 () Bool)

(assert (=> b!1245761 (=> (not res!831186) (not e!706447))))

(assert (=> b!1245761 (= res!831186 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1245761 (= lt!562968 (Cons!27480 (select (arr!38681 a!3892) from!3270) Nil!27481))))

(declare-fun b!1245762 () Bool)

(declare-fun res!831181 () Bool)

(assert (=> b!1245762 (=> (not res!831181) (not e!706447))))

(assert (=> b!1245762 (= res!831181 (not (contains!7450 lt!562968 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!104308 res!831182) b!1245758))

(assert (= (and b!1245758 res!831187) b!1245759))

(assert (= (and b!1245759 res!831184) b!1245754))

(assert (= (and b!1245754 res!831180) b!1245761))

(assert (= (and b!1245761 res!831186) b!1245755))

(assert (= (and b!1245755 res!831183) b!1245756))

(assert (= (and b!1245756 res!831185) b!1245762))

(assert (= (and b!1245762 res!831181) b!1245757))

(assert (= (and b!1245757 (not res!831179)) b!1245760))

(declare-fun m!1147751 () Bool)

(assert (=> b!1245762 m!1147751))

(declare-fun m!1147753 () Bool)

(assert (=> b!1245758 m!1147753))

(declare-fun m!1147755 () Bool)

(assert (=> b!1245760 m!1147755))

(declare-fun m!1147757 () Bool)

(assert (=> b!1245756 m!1147757))

(declare-fun m!1147759 () Bool)

(assert (=> b!1245755 m!1147759))

(declare-fun m!1147761 () Bool)

(assert (=> b!1245757 m!1147761))

(declare-fun m!1147763 () Bool)

(assert (=> b!1245754 m!1147763))

(assert (=> b!1245754 m!1147763))

(declare-fun m!1147765 () Bool)

(assert (=> b!1245754 m!1147765))

(declare-fun m!1147767 () Bool)

(assert (=> start!104308 m!1147767))

(assert (=> b!1245761 m!1147763))

(push 1)

(assert (not b!1245755))

(assert (not b!1245754))

(assert (not b!1245757))

(assert (not b!1245756))

(assert (not b!1245762))

(assert (not b!1245760))

(assert (not b!1245758))

(assert (not start!104308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1245833 () Bool)

(declare-fun e!706490 () Bool)

(declare-fun e!706489 () Bool)

(assert (=> b!1245833 (= e!706490 e!706489)))

(declare-fun res!831254 () Bool)

(assert (=> b!1245833 (=> (not res!831254) (not e!706489))))

(declare-fun e!706488 () Bool)

(assert (=> b!1245833 (= res!831254 (not e!706488))))

(declare-fun res!831255 () Bool)

(assert (=> b!1245833 (=> (not res!831255) (not e!706488))))

(assert (=> b!1245833 (= res!831255 (validKeyInArray!0 (select (arr!38681 a!3892) from!3270)))))

(declare-fun b!1245834 () Bool)

(assert (=> b!1245834 (= e!706488 (contains!7450 Nil!27481 (select (arr!38681 a!3892) from!3270)))))

(declare-fun b!1245835 () Bool)

(declare-fun e!706487 () Bool)

(declare-fun call!61500 () Bool)

(assert (=> b!1245835 (= e!706487 call!61500)))

(declare-fun b!1245836 () Bool)

(assert (=> b!1245836 (= e!706487 call!61500)))

(declare-fun c!121974 () Bool)

(declare-fun bm!61497 () Bool)

(assert (=> bm!61497 (= call!61500 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121974 (Cons!27480 (select (arr!38681 a!3892) from!3270) Nil!27481) Nil!27481)))))

(declare-fun d!137471 () Bool)

(declare-fun res!831256 () Bool)

(assert (=> d!137471 (=> res!831256 e!706490)))

(assert (=> d!137471 (= res!831256 (bvsge from!3270 (size!39217 a!3892)))))

(assert (=> d!137471 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27481) e!706490)))

(declare-fun b!1245837 () Bool)

(assert (=> b!1245837 (= e!706489 e!706487)))

(assert (=> b!1245837 (= c!121974 (validKeyInArray!0 (select (arr!38681 a!3892) from!3270)))))

(assert (= (and d!137471 (not res!831256)) b!1245833))

(assert (= (and b!1245833 res!831255) b!1245834))

(assert (= (and b!1245833 res!831254) b!1245837))

(assert (= (and b!1245837 c!121974) b!1245835))

(assert (= (and b!1245837 (not c!121974)) b!1245836))

(assert (= (or b!1245835 b!1245836) bm!61497))

(assert (=> b!1245833 m!1147763))

(assert (=> b!1245833 m!1147763))

(assert (=> b!1245833 m!1147765))

(assert (=> b!1245834 m!1147763))

(assert (=> b!1245834 m!1147763))

(declare-fun m!1147811 () Bool)

(assert (=> b!1245834 m!1147811))

(assert (=> bm!61497 m!1147763))

(declare-fun m!1147813 () Bool)

(assert (=> bm!61497 m!1147813))

(assert (=> b!1245837 m!1147763))

(assert (=> b!1245837 m!1147763))

(assert (=> b!1245837 m!1147765))

(assert (=> b!1245758 d!137471))

(declare-fun d!137481 () Bool)

(declare-fun lt!562982 () Bool)

(declare-fun content!625 (List!27484) (Set (_ BitVec 64)))

(assert (=> d!137481 (= lt!562982 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!625 lt!562968)))))

(declare-fun e!706507 () Bool)

(assert (=> d!137481 (= lt!562982 e!706507)))

(declare-fun res!831271 () Bool)

(assert (=> d!137481 (=> (not res!831271) (not e!706507))))

(assert (=> d!137481 (= res!831271 (is-Cons!27480 lt!562968))))

(assert (=> d!137481 (= (contains!7450 lt!562968 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562982)))

(declare-fun b!1245856 () Bool)

(declare-fun e!706508 () Bool)

(assert (=> b!1245856 (= e!706507 e!706508)))

(declare-fun res!831272 () Bool)

(assert (=> b!1245856 (=> res!831272 e!706508)))

(assert (=> b!1245856 (= res!831272 (= (h!28689 lt!562968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245857 () Bool)

(assert (=> b!1245857 (= e!706508 (contains!7450 (t!40953 lt!562968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137481 res!831271) b!1245856))

(assert (= (and b!1245856 (not res!831272)) b!1245857))

(declare-fun m!1147815 () Bool)

(assert (=> d!137481 m!1147815))

(declare-fun m!1147817 () Bool)

(assert (=> d!137481 m!1147817))

(declare-fun m!1147819 () Bool)

(assert (=> b!1245857 m!1147819))

(assert (=> b!1245762 d!137481))

(declare-fun d!137483 () Bool)

(assert (=> d!137483 (= (array_inv!29529 a!3892) (bvsge (size!39217 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104308 d!137483))

(declare-fun d!137485 () Bool)

(declare-fun lt!562984 () Bool)

(assert (=> d!137485 (= lt!562984 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!625 Nil!27481)))))

(declare-fun e!706511 () Bool)

(assert (=> d!137485 (= lt!562984 e!706511)))

(declare-fun res!831275 () Bool)

(assert (=> d!137485 (=> (not res!831275) (not e!706511))))

(assert (=> d!137485 (= res!831275 (is-Cons!27480 Nil!27481))))

(assert (=> d!137485 (= (contains!7450 Nil!27481 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562984)))

(declare-fun b!1245860 () Bool)

(declare-fun e!706512 () Bool)

(assert (=> b!1245860 (= e!706511 e!706512)))

(declare-fun res!831276 () Bool)

(assert (=> b!1245860 (=> res!831276 e!706512)))

(assert (=> b!1245860 (= res!831276 (= (h!28689 Nil!27481) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245861 () Bool)

(assert (=> b!1245861 (= e!706512 (contains!7450 (t!40953 Nil!27481) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137485 res!831275) b!1245860))

(assert (= (and b!1245860 (not res!831276)) b!1245861))

(declare-fun m!1147821 () Bool)

(assert (=> d!137485 m!1147821))

(declare-fun m!1147823 () Bool)

(assert (=> d!137485 m!1147823))

(declare-fun m!1147825 () Bool)

(assert (=> b!1245861 m!1147825))

(assert (=> b!1245757 d!137485))

(declare-fun d!137487 () Bool)

(declare-fun res!831284 () Bool)

(declare-fun e!706521 () Bool)

(assert (=> d!137487 (=> res!831284 e!706521)))

(assert (=> d!137487 (= res!831284 (is-Nil!27481 lt!562968))))

(assert (=> d!137487 (= (noDuplicate!2029 lt!562968) e!706521)))

(declare-fun b!1245871 () Bool)

(declare-fun e!706522 () Bool)

(assert (=> b!1245871 (= e!706521 e!706522)))

(declare-fun res!831285 () Bool)

(assert (=> b!1245871 (=> (not res!831285) (not e!706522))))

(assert (=> b!1245871 (= res!831285 (not (contains!7450 (t!40953 lt!562968) (h!28689 lt!562968))))))

(declare-fun b!1245872 () Bool)

(assert (=> b!1245872 (= e!706522 (noDuplicate!2029 (t!40953 lt!562968)))))

(assert (= (and d!137487 (not res!831284)) b!1245871))

(assert (= (and b!1245871 res!831285) b!1245872))

(declare-fun m!1147837 () Bool)

(assert (=> b!1245871 m!1147837))

(declare-fun m!1147839 () Bool)

(assert (=> b!1245872 m!1147839))

(assert (=> b!1245755 d!137487))

(declare-fun d!137495 () Bool)

(declare-fun lt!562985 () Bool)

(assert (=> d!137495 (= lt!562985 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!625 lt!562968)))))

(declare-fun e!706523 () Bool)

(assert (=> d!137495 (= lt!562985 e!706523)))

(declare-fun res!831286 () Bool)

(assert (=> d!137495 (=> (not res!831286) (not e!706523))))

(assert (=> d!137495 (= res!831286 (is-Cons!27480 lt!562968))))

(assert (=> d!137495 (= (contains!7450 lt!562968 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562985)))

(declare-fun b!1245873 () Bool)

(declare-fun e!706524 () Bool)

(assert (=> b!1245873 (= e!706523 e!706524)))

(declare-fun res!831287 () Bool)

(assert (=> b!1245873 (=> res!831287 e!706524)))

(assert (=> b!1245873 (= res!831287 (= (h!28689 lt!562968) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245874 () Bool)

(assert (=> b!1245874 (= e!706524 (contains!7450 (t!40953 lt!562968) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137495 res!831286) b!1245873))

(assert (= (and b!1245873 (not res!831287)) b!1245874))

(assert (=> d!137495 m!1147815))

(declare-fun m!1147841 () Bool)

(assert (=> d!137495 m!1147841))

(declare-fun m!1147843 () Bool)

(assert (=> b!1245874 m!1147843))

(assert (=> b!1245756 d!137495))

(declare-fun d!137497 () Bool)

(assert (=> d!137497 (= (validKeyInArray!0 (select (arr!38681 a!3892) from!3270)) (and (not (= (select (arr!38681 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38681 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245754 d!137497))

(declare-fun d!137499 () Bool)

(declare-fun lt!562986 () Bool)

(assert (=> d!137499 (= lt!562986 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!625 Nil!27481)))))

(declare-fun e!706533 () Bool)

(assert (=> d!137499 (= lt!562986 e!706533)))

(declare-fun res!831296 () Bool)

(assert (=> d!137499 (=> (not res!831296) (not e!706533))))

(assert (=> d!137499 (= res!831296 (is-Cons!27480 Nil!27481))))

(assert (=> d!137499 (= (contains!7450 Nil!27481 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562986)))

(declare-fun b!1245883 () Bool)

(declare-fun e!706534 () Bool)

(assert (=> b!1245883 (= e!706533 e!706534)))

(declare-fun res!831297 () Bool)

(assert (=> b!1245883 (=> res!831297 e!706534)))

(assert (=> b!1245883 (= res!831297 (= (h!28689 Nil!27481) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245884 () Bool)

(assert (=> b!1245884 (= e!706534 (contains!7450 (t!40953 Nil!27481) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137499 res!831296) b!1245883))

(assert (= (and b!1245883 (not res!831297)) b!1245884))

(assert (=> d!137499 m!1147821))

(declare-fun m!1147845 () Bool)

(assert (=> d!137499 m!1147845))

(declare-fun m!1147847 () Bool)

(assert (=> b!1245884 m!1147847))

(assert (=> b!1245760 d!137499))

(push 1)

(assert (not b!1245884))

(assert (not b!1245872))

(assert (not b!1245857))

(assert (not d!137485))

(assert (not d!137481))

(assert (not b!1245874))

(assert (not bm!61497))

(assert (not d!137499))

(assert (not b!1245871))

(assert (not b!1245834))

(assert (not d!137495))

(assert (not b!1245833))

(assert (not b!1245861))

(assert (not b!1245837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

