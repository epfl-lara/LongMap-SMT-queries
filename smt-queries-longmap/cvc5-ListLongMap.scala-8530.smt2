; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104012 () Bool)

(assert start!104012)

(declare-fun b!1244609 () Bool)

(declare-fun e!705482 () Bool)

(declare-fun e!705481 () Bool)

(assert (=> b!1244609 (= e!705482 e!705481)))

(declare-fun res!830209 () Bool)

(assert (=> b!1244609 (=> (not res!830209) (not e!705481))))

(declare-datatypes ((List!27430 0))(
  ( (Nil!27427) (Cons!27426 (h!28635 (_ BitVec 64)) (t!40899 List!27430)) )
))
(declare-fun contains!7430 (List!27430 (_ BitVec 64)) Bool)

(assert (=> b!1244609 (= res!830209 (not (contains!7430 Nil!27427 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244610 () Bool)

(declare-fun e!705486 () Bool)

(assert (=> b!1244610 (= e!705486 (not e!705482))))

(declare-fun res!830214 () Bool)

(assert (=> b!1244610 (=> res!830214 e!705482)))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244610 (= res!830214 (bvslt newFrom!287 #b00000000000000000000000000000000))))

(declare-datatypes ((array!80071 0))(
  ( (array!80072 (arr!38627 (Array (_ BitVec 32) (_ BitVec 64))) (size!39163 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80071)

(declare-fun arrayNoDuplicates!0 (array!80071 (_ BitVec 32) List!27430) Bool)

(assert (=> b!1244610 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27427)))

(declare-datatypes ((Unit!41387 0))(
  ( (Unit!41388) )
))
(declare-fun lt!562790 () Unit!41387)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80071 (_ BitVec 32) (_ BitVec 32)) Unit!41387)

(assert (=> b!1244610 (= lt!562790 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244611 () Bool)

(declare-fun e!705483 () Unit!41387)

(declare-fun Unit!41389 () Unit!41387)

(assert (=> b!1244611 (= e!705483 Unit!41389)))

(declare-fun b!1244612 () Bool)

(declare-fun res!830211 () Bool)

(declare-fun e!705485 () Bool)

(assert (=> b!1244612 (=> (not res!830211) (not e!705485))))

(assert (=> b!1244612 (= res!830211 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39163 a!3892)) (not (= newFrom!287 (size!39163 a!3892)))))))

(declare-fun b!1244613 () Bool)

(assert (=> b!1244613 (= e!705485 e!705486)))

(declare-fun res!830215 () Bool)

(assert (=> b!1244613 (=> (not res!830215) (not e!705486))))

(assert (=> b!1244613 (= res!830215 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562789 () Unit!41387)

(assert (=> b!1244613 (= lt!562789 e!705483)))

(declare-fun c!121885 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244613 (= c!121885 (validKeyInArray!0 (select (arr!38627 a!3892) from!3270)))))

(declare-fun b!1244614 () Bool)

(assert (=> b!1244614 (= e!705481 (not (contains!7430 Nil!27427 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244615 () Bool)

(declare-fun res!830213 () Bool)

(assert (=> b!1244615 (=> (not res!830213) (not e!705486))))

(assert (=> b!1244615 (= res!830213 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27427))))

(declare-fun res!830210 () Bool)

(assert (=> start!104012 (=> (not res!830210) (not e!705485))))

(assert (=> start!104012 (= res!830210 (and (bvslt (size!39163 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39163 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39163 a!3892))))))

(assert (=> start!104012 e!705485))

(declare-fun array_inv!29475 (array!80071) Bool)

(assert (=> start!104012 (array_inv!29475 a!3892)))

(assert (=> start!104012 true))

(declare-fun b!1244616 () Bool)

(declare-fun lt!562788 () Unit!41387)

(assert (=> b!1244616 (= e!705483 lt!562788)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80071 List!27430 List!27430 (_ BitVec 32)) Unit!41387)

(assert (=> b!1244616 (= lt!562788 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27426 (select (arr!38627 a!3892) from!3270) Nil!27427) Nil!27427 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244616 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27427)))

(declare-fun b!1244617 () Bool)

(declare-fun res!830212 () Bool)

(assert (=> b!1244617 (=> (not res!830212) (not e!705485))))

(assert (=> b!1244617 (= res!830212 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27427))))

(declare-fun b!1244618 () Bool)

(declare-fun res!830208 () Bool)

(assert (=> b!1244618 (=> res!830208 e!705482)))

(declare-fun noDuplicate!2008 (List!27430) Bool)

(assert (=> b!1244618 (= res!830208 (not (noDuplicate!2008 Nil!27427)))))

(assert (= (and start!104012 res!830210) b!1244617))

(assert (= (and b!1244617 res!830212) b!1244612))

(assert (= (and b!1244612 res!830211) b!1244613))

(assert (= (and b!1244613 c!121885) b!1244616))

(assert (= (and b!1244613 (not c!121885)) b!1244611))

(assert (= (and b!1244613 res!830215) b!1244615))

(assert (= (and b!1244615 res!830213) b!1244610))

(assert (= (and b!1244610 (not res!830214)) b!1244618))

(assert (= (and b!1244618 (not res!830208)) b!1244609))

(assert (= (and b!1244609 res!830209) b!1244614))

(declare-fun m!1146857 () Bool)

(assert (=> b!1244615 m!1146857))

(declare-fun m!1146859 () Bool)

(assert (=> b!1244614 m!1146859))

(declare-fun m!1146861 () Bool)

(assert (=> b!1244613 m!1146861))

(assert (=> b!1244613 m!1146861))

(declare-fun m!1146863 () Bool)

(assert (=> b!1244613 m!1146863))

(declare-fun m!1146865 () Bool)

(assert (=> start!104012 m!1146865))

(assert (=> b!1244616 m!1146861))

(declare-fun m!1146867 () Bool)

(assert (=> b!1244616 m!1146867))

(assert (=> b!1244616 m!1146857))

(declare-fun m!1146869 () Bool)

(assert (=> b!1244617 m!1146869))

(declare-fun m!1146871 () Bool)

(assert (=> b!1244610 m!1146871))

(declare-fun m!1146873 () Bool)

(assert (=> b!1244610 m!1146873))

(declare-fun m!1146875 () Bool)

(assert (=> b!1244609 m!1146875))

(declare-fun m!1146877 () Bool)

(assert (=> b!1244618 m!1146877))

(push 1)

(assert (not b!1244610))

(assert (not b!1244617))

(assert (not b!1244613))

(assert (not b!1244615))

(assert (not b!1244614))

(assert (not start!104012))

(assert (not b!1244618))

(assert (not b!1244616))

(assert (not b!1244609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137179 () Bool)

(declare-fun lt!562814 () Bool)

(declare-fun content!612 (List!27430) (Set (_ BitVec 64)))

(assert (=> d!137179 (= lt!562814 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!612 Nil!27427)))))

(declare-fun e!705542 () Bool)

(assert (=> d!137179 (= lt!562814 e!705542)))

(declare-fun res!830281 () Bool)

(assert (=> d!137179 (=> (not res!830281) (not e!705542))))

(assert (=> d!137179 (= res!830281 (is-Cons!27426 Nil!27427))))

(assert (=> d!137179 (= (contains!7430 Nil!27427 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562814)))

(declare-fun b!1244699 () Bool)

(declare-fun e!705541 () Bool)

(assert (=> b!1244699 (= e!705542 e!705541)))

(declare-fun res!830280 () Bool)

(assert (=> b!1244699 (=> res!830280 e!705541)))

(assert (=> b!1244699 (= res!830280 (= (h!28635 Nil!27427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244700 () Bool)

(assert (=> b!1244700 (= e!705541 (contains!7430 (t!40899 Nil!27427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137179 res!830281) b!1244699))

(assert (= (and b!1244699 (not res!830280)) b!1244700))

(declare-fun m!1146929 () Bool)

(assert (=> d!137179 m!1146929))

(declare-fun m!1146931 () Bool)

(assert (=> d!137179 m!1146931))

(declare-fun m!1146933 () Bool)

(assert (=> b!1244700 m!1146933))

(assert (=> b!1244609 d!137179))

(declare-fun d!137183 () Bool)

(assert (=> d!137183 (= (array_inv!29475 a!3892) (bvsge (size!39163 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104012 d!137183))

(declare-fun d!137187 () Bool)

(declare-fun lt!562815 () Bool)

(assert (=> d!137187 (= lt!562815 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!612 Nil!27427)))))

(declare-fun e!705548 () Bool)

(assert (=> d!137187 (= lt!562815 e!705548)))

(declare-fun res!830286 () Bool)

(assert (=> d!137187 (=> (not res!830286) (not e!705548))))

(assert (=> d!137187 (= res!830286 (is-Cons!27426 Nil!27427))))

(assert (=> d!137187 (= (contains!7430 Nil!27427 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562815)))

(declare-fun b!1244706 () Bool)

(declare-fun e!705547 () Bool)

(assert (=> b!1244706 (= e!705548 e!705547)))

(declare-fun res!830285 () Bool)

(assert (=> b!1244706 (=> res!830285 e!705547)))

(assert (=> b!1244706 (= res!830285 (= (h!28635 Nil!27427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244707 () Bool)

(assert (=> b!1244707 (= e!705547 (contains!7430 (t!40899 Nil!27427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137187 res!830286) b!1244706))

(assert (= (and b!1244706 (not res!830285)) b!1244707))

(assert (=> d!137187 m!1146929))

(declare-fun m!1146939 () Bool)

(assert (=> d!137187 m!1146939))

(declare-fun m!1146943 () Bool)

(assert (=> b!1244707 m!1146943))

(assert (=> b!1244614 d!137187))

(declare-fun d!137189 () Bool)

(assert (=> d!137189 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27427)))

(declare-fun lt!562821 () Unit!41387)

(declare-fun choose!80 (array!80071 List!27430 List!27430 (_ BitVec 32)) Unit!41387)

(assert (=> d!137189 (= lt!562821 (choose!80 a!3892 (Cons!27426 (select (arr!38627 a!3892) from!3270) Nil!27427) Nil!27427 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> d!137189 (bvslt (size!39163 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137189 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27426 (select (arr!38627 a!3892) from!3270) Nil!27427) Nil!27427 (bvadd #b00000000000000000000000000000001 from!3270)) lt!562821)))

(declare-fun bs!35048 () Bool)

(assert (= bs!35048 d!137189))

(assert (=> bs!35048 m!1146857))

(declare-fun m!1146953 () Bool)

(assert (=> bs!35048 m!1146953))

(assert (=> b!1244616 d!137189))

(declare-fun d!137195 () Bool)

(declare-fun res!830321 () Bool)

(declare-fun e!705587 () Bool)

(assert (=> d!137195 (=> res!830321 e!705587)))

(assert (=> d!137195 (= res!830321 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) (size!39163 a!3892)))))

(assert (=> d!137195 (= (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27427) e!705587)))

(declare-fun b!1244752 () Bool)

(declare-fun e!705589 () Bool)

(declare-fun e!705588 () Bool)

(assert (=> b!1244752 (= e!705589 e!705588)))

(declare-fun c!121901 () Bool)

(assert (=> b!1244752 (= c!121901 (validKeyInArray!0 (select (arr!38627 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun call!61433 () Bool)

(declare-fun bm!61430 () Bool)

(assert (=> bm!61430 (= call!61433 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270 #b00000000000000000000000000000001) (ite c!121901 (Cons!27426 (select (arr!38627 a!3892) (bvadd #b00000000000000000000000000000001 from!3270)) Nil!27427) Nil!27427)))))

(declare-fun b!1244753 () Bool)

(assert (=> b!1244753 (= e!705587 e!705589)))

(declare-fun res!830319 () Bool)

(assert (=> b!1244753 (=> (not res!830319) (not e!705589))))

(declare-fun e!705590 () Bool)

(assert (=> b!1244753 (= res!830319 (not e!705590))))

(declare-fun res!830320 () Bool)

(assert (=> b!1244753 (=> (not res!830320) (not e!705590))))

(assert (=> b!1244753 (= res!830320 (validKeyInArray!0 (select (arr!38627 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun b!1244754 () Bool)

(assert (=> b!1244754 (= e!705588 call!61433)))

(declare-fun b!1244755 () Bool)

(assert (=> b!1244755 (= e!705588 call!61433)))

(declare-fun b!1244756 () Bool)

(assert (=> b!1244756 (= e!705590 (contains!7430 Nil!27427 (select (arr!38627 a!3892) (bvadd #b00000000000000000000000000000001 from!3270))))))

(assert (= (and d!137195 (not res!830321)) b!1244753))

(assert (= (and b!1244753 res!830320) b!1244756))

(assert (= (and b!1244753 res!830319) b!1244752))

(assert (= (and b!1244752 c!121901) b!1244755))

(assert (= (and b!1244752 (not c!121901)) b!1244754))

(assert (= (or b!1244755 b!1244754) bm!61430))

(declare-fun m!1146977 () Bool)

(assert (=> b!1244752 m!1146977))

(assert (=> b!1244752 m!1146977))

(declare-fun m!1146979 () Bool)

(assert (=> b!1244752 m!1146979))

(assert (=> bm!61430 m!1146977))

(declare-fun m!1146983 () Bool)

(assert (=> bm!61430 m!1146983))

(assert (=> b!1244753 m!1146977))

(assert (=> b!1244753 m!1146977))

(assert (=> b!1244753 m!1146979))

(assert (=> b!1244756 m!1146977))

(assert (=> b!1244756 m!1146977))

(declare-fun m!1146987 () Bool)

(assert (=> b!1244756 m!1146987))

(assert (=> b!1244616 d!137195))

(declare-fun d!137207 () Bool)

(declare-fun res!830327 () Bool)

(declare-fun e!705595 () Bool)

(assert (=> d!137207 (=> res!830327 e!705595)))

(assert (=> d!137207 (= res!830327 (bvsge newFrom!287 (size!39163 a!3892)))))

(assert (=> d!137207 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27427) e!705595)))

(declare-fun b!1244762 () Bool)

(declare-fun e!705597 () Bool)

(declare-fun e!705596 () Bool)

(assert (=> b!1244762 (= e!705597 e!705596)))

(declare-fun c!121903 () Bool)

(assert (=> b!1244762 (= c!121903 (validKeyInArray!0 (select (arr!38627 a!3892) newFrom!287)))))

(declare-fun bm!61432 () Bool)

(declare-fun call!61435 () Bool)

(assert (=> bm!61432 (= call!61435 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!121903 (Cons!27426 (select (arr!38627 a!3892) newFrom!287) Nil!27427) Nil!27427)))))

(declare-fun b!1244763 () Bool)

(assert (=> b!1244763 (= e!705595 e!705597)))

(declare-fun res!830325 () Bool)

(assert (=> b!1244763 (=> (not res!830325) (not e!705597))))

(declare-fun e!705598 () Bool)

(assert (=> b!1244763 (= res!830325 (not e!705598))))

(declare-fun res!830326 () Bool)

(assert (=> b!1244763 (=> (not res!830326) (not e!705598))))

(assert (=> b!1244763 (= res!830326 (validKeyInArray!0 (select (arr!38627 a!3892) newFrom!287)))))

(declare-fun b!1244764 () Bool)

(assert (=> b!1244764 (= e!705596 call!61435)))

(declare-fun b!1244765 () Bool)

(assert (=> b!1244765 (= e!705596 call!61435)))

(declare-fun b!1244766 () Bool)

(assert (=> b!1244766 (= e!705598 (contains!7430 Nil!27427 (select (arr!38627 a!3892) newFrom!287)))))

(assert (= (and d!137207 (not res!830327)) b!1244763))

(assert (= (and b!1244763 res!830326) b!1244766))

(assert (= (and b!1244763 res!830325) b!1244762))

(assert (= (and b!1244762 c!121903) b!1244765))

(assert (= (and b!1244762 (not c!121903)) b!1244764))

(assert (= (or b!1244765 b!1244764) bm!61432))

(declare-fun m!1146993 () Bool)

(assert (=> b!1244762 m!1146993))

(assert (=> b!1244762 m!1146993))

(declare-fun m!1146995 () Bool)

(assert (=> b!1244762 m!1146995))

(assert (=> bm!61432 m!1146993))

(declare-fun m!1146997 () Bool)

(assert (=> bm!61432 m!1146997))

(assert (=> b!1244763 m!1146993))

(assert (=> b!1244763 m!1146993))

(assert (=> b!1244763 m!1146995))

(assert (=> b!1244766 m!1146993))

(assert (=> b!1244766 m!1146993))

(declare-fun m!1147001 () Bool)

(assert (=> b!1244766 m!1147001))

(assert (=> b!1244610 d!137207))

(declare-fun d!137211 () Bool)

(assert (=> d!137211 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27427)))

(declare-fun lt!562831 () Unit!41387)

(declare-fun choose!39 (array!80071 (_ BitVec 32) (_ BitVec 32)) Unit!41387)

(assert (=> d!137211 (= lt!562831 (choose!39 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (=> d!137211 (bvslt (size!39163 a!3892) #b01111111111111111111111111111111)))

(assert (=> d!137211 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287) lt!562831)))

(declare-fun bs!35051 () Bool)

(assert (= bs!35051 d!137211))

(assert (=> bs!35051 m!1146871))

(declare-fun m!1147015 () Bool)

(assert (=> bs!35051 m!1147015))

(assert (=> b!1244610 d!137211))

(assert (=> b!1244615 d!137195))

(declare-fun d!137217 () Bool)

(declare-fun res!830339 () Bool)

(declare-fun e!705609 () Bool)

(assert (=> d!137217 (=> res!830339 e!705609)))

(assert (=> d!137217 (= res!830339 (bvsge from!3270 (size!39163 a!3892)))))

(assert (=> d!137217 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27427) e!705609)))

(declare-fun b!1244778 () Bool)

(declare-fun e!705611 () Bool)

(declare-fun e!705610 () Bool)

(assert (=> b!1244778 (= e!705611 e!705610)))

(declare-fun c!121905 () Bool)

(assert (=> b!1244778 (= c!121905 (validKeyInArray!0 (select (arr!38627 a!3892) from!3270)))))

(declare-fun call!61437 () Bool)

(declare-fun bm!61434 () Bool)

(assert (=> bm!61434 (= call!61437 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121905 (Cons!27426 (select (arr!38627 a!3892) from!3270) Nil!27427) Nil!27427)))))

(declare-fun b!1244779 () Bool)

(assert (=> b!1244779 (= e!705609 e!705611)))

(declare-fun res!830337 () Bool)

(assert (=> b!1244779 (=> (not res!830337) (not e!705611))))

(declare-fun e!705612 () Bool)

(assert (=> b!1244779 (= res!830337 (not e!705612))))

(declare-fun res!830338 () Bool)

(assert (=> b!1244779 (=> (not res!830338) (not e!705612))))

(assert (=> b!1244779 (= res!830338 (validKeyInArray!0 (select (arr!38627 a!3892) from!3270)))))

(declare-fun b!1244780 () Bool)

(assert (=> b!1244780 (= e!705610 call!61437)))

(declare-fun b!1244781 () Bool)

(assert (=> b!1244781 (= e!705610 call!61437)))

(declare-fun b!1244782 () Bool)

(assert (=> b!1244782 (= e!705612 (contains!7430 Nil!27427 (select (arr!38627 a!3892) from!3270)))))

(assert (= (and d!137217 (not res!830339)) b!1244779))

(assert (= (and b!1244779 res!830338) b!1244782))

(assert (= (and b!1244779 res!830337) b!1244778))

(assert (= (and b!1244778 c!121905) b!1244781))

