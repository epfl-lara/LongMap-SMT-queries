; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104094 () Bool)

(assert start!104094)

(declare-fun b!1244923 () Bool)

(declare-fun res!830464 () Bool)

(declare-fun e!705739 () Bool)

(assert (=> b!1244923 (=> (not res!830464) (not e!705739))))

(declare-datatypes ((array!80100 0))(
  ( (array!80101 (arr!38639 (Array (_ BitVec 32) (_ BitVec 64))) (size!39175 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80100)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1244923 (= res!830464 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39175 a!3892)) (= newFrom!287 (size!39175 a!3892)) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1244924 () Bool)

(declare-fun e!705740 () Bool)

(declare-datatypes ((List!27442 0))(
  ( (Nil!27439) (Cons!27438 (h!28647 (_ BitVec 64)) (t!40911 List!27442)) )
))
(declare-fun contains!7435 (List!27442 (_ BitVec 64)) Bool)

(assert (=> b!1244924 (= e!705740 (contains!7435 Nil!27439 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244925 () Bool)

(declare-fun res!830462 () Bool)

(assert (=> b!1244925 (=> (not res!830462) (not e!705739))))

(declare-fun noDuplicate!2014 (List!27442) Bool)

(assert (=> b!1244925 (= res!830462 (noDuplicate!2014 Nil!27439))))

(declare-fun b!1244926 () Bool)

(assert (=> b!1244926 (= e!705739 e!705740)))

(declare-fun res!830460 () Bool)

(assert (=> b!1244926 (=> res!830460 e!705740)))

(assert (=> b!1244926 (= res!830460 (contains!7435 Nil!27439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244927 () Bool)

(declare-fun res!830461 () Bool)

(assert (=> b!1244927 (=> (not res!830461) (not e!705739))))

(declare-fun arrayNoDuplicates!0 (array!80100 (_ BitVec 32) List!27442) Bool)

(assert (=> b!1244927 (= res!830461 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27439))))

(declare-fun res!830463 () Bool)

(assert (=> start!104094 (=> (not res!830463) (not e!705739))))

(assert (=> start!104094 (= res!830463 (and (bvslt (size!39175 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39175 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39175 a!3892))))))

(assert (=> start!104094 e!705739))

(declare-fun array_inv!29487 (array!80100) Bool)

(assert (=> start!104094 (array_inv!29487 a!3892)))

(assert (=> start!104094 true))

(assert (= (and start!104094 res!830463) b!1244927))

(assert (= (and b!1244927 res!830461) b!1244923))

(assert (= (and b!1244923 res!830464) b!1244925))

(assert (= (and b!1244925 res!830462) b!1244926))

(assert (= (and b!1244926 (not res!830460)) b!1244924))

(declare-fun m!1147107 () Bool)

(assert (=> b!1244927 m!1147107))

(declare-fun m!1147109 () Bool)

(assert (=> b!1244926 m!1147109))

(declare-fun m!1147111 () Bool)

(assert (=> b!1244925 m!1147111))

(declare-fun m!1147113 () Bool)

(assert (=> start!104094 m!1147113))

(declare-fun m!1147115 () Bool)

(assert (=> b!1244924 m!1147115))

(push 1)

(assert (not b!1244924))

(assert (not b!1244926))

(assert (not start!104094))

(assert (not b!1244927))

(assert (not b!1244925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137255 () Bool)

(declare-fun lt!562850 () Bool)

(declare-fun content!614 (List!27442) (Set (_ BitVec 64)))

(assert (=> d!137255 (= lt!562850 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!614 Nil!27439)))))

(declare-fun e!705764 () Bool)

(assert (=> d!137255 (= lt!562850 e!705764)))

(declare-fun res!830499 () Bool)

(assert (=> d!137255 (=> (not res!830499) (not e!705764))))

(assert (=> d!137255 (= res!830499 (is-Cons!27438 Nil!27439))))

(assert (=> d!137255 (= (contains!7435 Nil!27439 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562850)))

(declare-fun b!1244962 () Bool)

(declare-fun e!705765 () Bool)

(assert (=> b!1244962 (= e!705764 e!705765)))

(declare-fun res!830500 () Bool)

(assert (=> b!1244962 (=> res!830500 e!705765)))

(assert (=> b!1244962 (= res!830500 (= (h!28647 Nil!27439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244963 () Bool)

(assert (=> b!1244963 (= e!705765 (contains!7435 (t!40911 Nil!27439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137255 res!830499) b!1244962))

(assert (= (and b!1244962 (not res!830500)) b!1244963))

(declare-fun m!1147137 () Bool)

(assert (=> d!137255 m!1147137))

(declare-fun m!1147139 () Bool)

(assert (=> d!137255 m!1147139))

(declare-fun m!1147141 () Bool)

(assert (=> b!1244963 m!1147141))

(assert (=> b!1244924 d!137255))

(declare-fun d!137261 () Bool)

(assert (=> d!137261 (= (array_inv!29487 a!3892) (bvsge (size!39175 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104094 d!137261))

(declare-fun d!137263 () Bool)

(declare-fun res!830511 () Bool)

(declare-fun e!705776 () Bool)

(assert (=> d!137263 (=> res!830511 e!705776)))

(assert (=> d!137263 (= res!830511 (is-Nil!27439 Nil!27439))))

(assert (=> d!137263 (= (noDuplicate!2014 Nil!27439) e!705776)))

(declare-fun b!1244974 () Bool)

(declare-fun e!705777 () Bool)

(assert (=> b!1244974 (= e!705776 e!705777)))

(declare-fun res!830512 () Bool)

(assert (=> b!1244974 (=> (not res!830512) (not e!705777))))

(assert (=> b!1244974 (= res!830512 (not (contains!7435 (t!40911 Nil!27439) (h!28647 Nil!27439))))))

(declare-fun b!1244975 () Bool)

(assert (=> b!1244975 (= e!705777 (noDuplicate!2014 (t!40911 Nil!27439)))))

(assert (= (and d!137263 (not res!830511)) b!1244974))

(assert (= (and b!1244974 res!830512) b!1244975))

(declare-fun m!1147149 () Bool)

(assert (=> b!1244974 m!1147149))

(declare-fun m!1147151 () Bool)

(assert (=> b!1244975 m!1147151))

(assert (=> b!1244925 d!137263))

(declare-fun d!137267 () Bool)

(declare-fun lt!562854 () Bool)

(assert (=> d!137267 (= lt!562854 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!614 Nil!27439)))))

(declare-fun e!705778 () Bool)

(assert (=> d!137267 (= lt!562854 e!705778)))

(declare-fun res!830513 () Bool)

(assert (=> d!137267 (=> (not res!830513) (not e!705778))))

(assert (=> d!137267 (= res!830513 (is-Cons!27438 Nil!27439))))

(assert (=> d!137267 (= (contains!7435 Nil!27439 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562854)))

(declare-fun b!1244976 () Bool)

(declare-fun e!705779 () Bool)

(assert (=> b!1244976 (= e!705778 e!705779)))

(declare-fun res!830514 () Bool)

(assert (=> b!1244976 (=> res!830514 e!705779)))

(assert (=> b!1244976 (= res!830514 (= (h!28647 Nil!27439) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1244977 () Bool)

(assert (=> b!1244977 (= e!705779 (contains!7435 (t!40911 Nil!27439) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137267 res!830513) b!1244976))

(assert (= (and b!1244976 (not res!830514)) b!1244977))

(assert (=> d!137267 m!1147137))

(declare-fun m!1147153 () Bool)

(assert (=> d!137267 m!1147153))

(declare-fun m!1147155 () Bool)

(assert (=> b!1244977 m!1147155))

(assert (=> b!1244926 d!137267))

(declare-fun b!1245003 () Bool)

(declare-fun e!705800 () Bool)

(declare-fun e!705802 () Bool)

(assert (=> b!1245003 (= e!705800 e!705802)))

(declare-fun c!121921 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245003 (= c!121921 (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1245004 () Bool)

(declare-fun call!61453 () Bool)

(assert (=> b!1245004 (= e!705802 call!61453)))

(declare-fun bm!61450 () Bool)

(assert (=> bm!61450 (= call!61453 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121921 (Cons!27438 (select (arr!38639 a!3892) from!3270) Nil!27439) Nil!27439)))))

(declare-fun b!1245005 () Bool)

(assert (=> b!1245005 (= e!705802 call!61453)))

(declare-fun b!1245007 () Bool)

(declare-fun e!705803 () Bool)

(assert (=> b!1245007 (= e!705803 e!705800)))

(declare-fun res!830532 () Bool)

(assert (=> b!1245007 (=> (not res!830532) (not e!705800))))

(declare-fun e!705801 () Bool)

(assert (=> b!1245007 (= res!830532 (not e!705801))))

(declare-fun res!830530 () Bool)

(assert (=> b!1245007 (=> (not res!830530) (not e!705801))))

(assert (=> b!1245007 (= res!830530 (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)))))

(declare-fun d!137269 () Bool)

(declare-fun res!830531 () Bool)

(assert (=> d!137269 (=> res!830531 e!705803)))

(assert (=> d!137269 (= res!830531 (bvsge from!3270 (size!39175 a!3892)))))

(assert (=> d!137269 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27439) e!705803)))

(declare-fun b!1245006 () Bool)

(assert (=> b!1245006 (= e!705801 (contains!7435 Nil!27439 (select (arr!38639 a!3892) from!3270)))))

(assert (= (and d!137269 (not res!830531)) b!1245007))

(assert (= (and b!1245007 res!830530) b!1245006))

(assert (= (and b!1245007 res!830532) b!1245003))

(assert (= (and b!1245003 c!121921) b!1245005))

(assert (= (and b!1245003 (not c!121921)) b!1245004))

(assert (= (or b!1245005 b!1245004) bm!61450))

(declare-fun m!1147165 () Bool)

(assert (=> b!1245003 m!1147165))

(assert (=> b!1245003 m!1147165))

(declare-fun m!1147167 () Bool)

(assert (=> b!1245003 m!1147167))

(assert (=> bm!61450 m!1147165))

(declare-fun m!1147169 () Bool)

(assert (=> bm!61450 m!1147169))

(assert (=> b!1245007 m!1147165))

(assert (=> b!1245007 m!1147165))

(assert (=> b!1245007 m!1147167))

(assert (=> b!1245006 m!1147165))

(assert (=> b!1245006 m!1147165))

(declare-fun m!1147171 () Bool)

(assert (=> b!1245006 m!1147171))

(assert (=> b!1244927 d!137269))

(push 1)

(assert (not b!1245006))

(assert (not b!1244974))

(assert (not bm!61450))

(assert (not b!1245003))

(assert (not b!1244977))

(assert (not b!1245007))

(assert (not d!137255))

(assert (not b!1244963))

(assert (not b!1244975))

(assert (not d!137267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

