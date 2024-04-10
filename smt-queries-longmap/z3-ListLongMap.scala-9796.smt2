; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116302 () Bool)

(assert start!116302)

(declare-fun b!1373025 () Bool)

(declare-fun res!916296 () Bool)

(declare-fun e!777758 () Bool)

(assert (=> b!1373025 (=> (not res!916296) (not e!777758))))

(declare-datatypes ((List!32038 0))(
  ( (Nil!32035) (Cons!32034 (h!33243 (_ BitVec 64)) (t!46732 List!32038)) )
))
(declare-fun newAcc!98 () List!32038)

(declare-fun acc!866 () List!32038)

(declare-fun subseq!1122 (List!32038 List!32038) Bool)

(assert (=> b!1373025 (= res!916296 (subseq!1122 newAcc!98 acc!866))))

(declare-fun res!916300 () Bool)

(assert (=> start!116302 (=> (not res!916300) (not e!777758))))

(declare-datatypes ((array!93119 0))(
  ( (array!93120 (arr!44970 (Array (_ BitVec 32) (_ BitVec 64))) (size!45520 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93119)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116302 (= res!916300 (and (bvslt (size!45520 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45520 a!3861))))))

(assert (=> start!116302 e!777758))

(declare-fun array_inv!33998 (array!93119) Bool)

(assert (=> start!116302 (array_inv!33998 a!3861)))

(assert (=> start!116302 true))

(declare-fun b!1373026 () Bool)

(declare-fun e!777759 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93119 (_ BitVec 32) List!32038) Bool)

(assert (=> b!1373026 (= e!777759 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866)))))

(declare-fun b!1373027 () Bool)

(declare-fun res!916298 () Bool)

(assert (=> b!1373027 (=> (not res!916298) (not e!777758))))

(declare-fun contains!9720 (List!32038 (_ BitVec 64)) Bool)

(assert (=> b!1373027 (= res!916298 (not (contains!9720 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373028 () Bool)

(declare-fun res!916293 () Bool)

(assert (=> b!1373028 (=> (not res!916293) (not e!777759))))

(assert (=> b!1373028 (= res!916293 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373029 () Bool)

(declare-fun res!916301 () Bool)

(assert (=> b!1373029 (=> (not res!916301) (not e!777758))))

(assert (=> b!1373029 (= res!916301 (not (contains!9720 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373030 () Bool)

(declare-fun res!916299 () Bool)

(assert (=> b!1373030 (=> (not res!916299) (not e!777759))))

(assert (=> b!1373030 (= res!916299 (bvslt from!3239 (size!45520 a!3861)))))

(declare-fun b!1373031 () Bool)

(declare-fun res!916303 () Bool)

(assert (=> b!1373031 (=> (not res!916303) (not e!777758))))

(declare-fun noDuplicate!2577 (List!32038) Bool)

(assert (=> b!1373031 (= res!916303 (noDuplicate!2577 acc!866))))

(declare-fun b!1373032 () Bool)

(declare-fun res!916297 () Bool)

(assert (=> b!1373032 (=> (not res!916297) (not e!777758))))

(assert (=> b!1373032 (= res!916297 (not (contains!9720 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373033 () Bool)

(declare-fun res!916295 () Bool)

(assert (=> b!1373033 (=> (not res!916295) (not e!777758))))

(assert (=> b!1373033 (= res!916295 (not (contains!9720 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373034 () Bool)

(assert (=> b!1373034 (= e!777758 e!777759)))

(declare-fun res!916302 () Bool)

(assert (=> b!1373034 (=> (not res!916302) (not e!777759))))

(assert (=> b!1373034 (= res!916302 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45377 0))(
  ( (Unit!45378) )
))
(declare-fun lt!602995 () Unit!45377)

(declare-fun noDuplicateSubseq!309 (List!32038 List!32038) Unit!45377)

(assert (=> b!1373034 (= lt!602995 (noDuplicateSubseq!309 newAcc!98 acc!866))))

(declare-fun b!1373035 () Bool)

(declare-fun res!916294 () Bool)

(assert (=> b!1373035 (=> (not res!916294) (not e!777759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373035 (= res!916294 (not (validKeyInArray!0 (select (arr!44970 a!3861) from!3239))))))

(assert (= (and start!116302 res!916300) b!1373031))

(assert (= (and b!1373031 res!916303) b!1373033))

(assert (= (and b!1373033 res!916295) b!1373027))

(assert (= (and b!1373027 res!916298) b!1373029))

(assert (= (and b!1373029 res!916301) b!1373032))

(assert (= (and b!1373032 res!916297) b!1373025))

(assert (= (and b!1373025 res!916296) b!1373034))

(assert (= (and b!1373034 res!916302) b!1373030))

(assert (= (and b!1373030 res!916299) b!1373035))

(assert (= (and b!1373035 res!916294) b!1373028))

(assert (= (and b!1373028 res!916293) b!1373026))

(declare-fun m!1256365 () Bool)

(assert (=> b!1373035 m!1256365))

(assert (=> b!1373035 m!1256365))

(declare-fun m!1256367 () Bool)

(assert (=> b!1373035 m!1256367))

(declare-fun m!1256369 () Bool)

(assert (=> b!1373033 m!1256369))

(declare-fun m!1256371 () Bool)

(assert (=> b!1373032 m!1256371))

(declare-fun m!1256373 () Bool)

(assert (=> b!1373025 m!1256373))

(declare-fun m!1256375 () Bool)

(assert (=> b!1373026 m!1256375))

(declare-fun m!1256377 () Bool)

(assert (=> b!1373031 m!1256377))

(declare-fun m!1256379 () Bool)

(assert (=> b!1373029 m!1256379))

(declare-fun m!1256381 () Bool)

(assert (=> b!1373034 m!1256381))

(declare-fun m!1256383 () Bool)

(assert (=> b!1373034 m!1256383))

(declare-fun m!1256385 () Bool)

(assert (=> start!116302 m!1256385))

(declare-fun m!1256387 () Bool)

(assert (=> b!1373027 m!1256387))

(check-sat (not b!1373034) (not b!1373025) (not b!1373027) (not b!1373033) (not b!1373029) (not b!1373026) (not b!1373031) (not b!1373032) (not start!116302) (not b!1373035))
(check-sat)
(get-model)

(declare-fun b!1373083 () Bool)

(declare-fun e!777784 () Bool)

(declare-fun e!777783 () Bool)

(assert (=> b!1373083 (= e!777784 e!777783)))

(declare-fun c!127808 () Bool)

(assert (=> b!1373083 (= c!127808 (validKeyInArray!0 (select (arr!44970 a!3861) from!3239)))))

(declare-fun d!147885 () Bool)

(declare-fun res!916349 () Bool)

(declare-fun e!777785 () Bool)

(assert (=> d!147885 (=> res!916349 e!777785)))

(assert (=> d!147885 (= res!916349 (bvsge from!3239 (size!45520 a!3861)))))

(assert (=> d!147885 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777785)))

(declare-fun b!1373084 () Bool)

(assert (=> b!1373084 (= e!777785 e!777784)))

(declare-fun res!916347 () Bool)

(assert (=> b!1373084 (=> (not res!916347) (not e!777784))))

(declare-fun e!777782 () Bool)

(assert (=> b!1373084 (= res!916347 (not e!777782))))

(declare-fun res!916348 () Bool)

(assert (=> b!1373084 (=> (not res!916348) (not e!777782))))

(assert (=> b!1373084 (= res!916348 (validKeyInArray!0 (select (arr!44970 a!3861) from!3239)))))

(declare-fun b!1373085 () Bool)

(declare-fun call!65603 () Bool)

(assert (=> b!1373085 (= e!777783 call!65603)))

(declare-fun bm!65600 () Bool)

(assert (=> bm!65600 (= call!65603 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127808 (Cons!32034 (select (arr!44970 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373086 () Bool)

(assert (=> b!1373086 (= e!777782 (contains!9720 acc!866 (select (arr!44970 a!3861) from!3239)))))

(declare-fun b!1373087 () Bool)

(assert (=> b!1373087 (= e!777783 call!65603)))

(assert (= (and d!147885 (not res!916349)) b!1373084))

(assert (= (and b!1373084 res!916348) b!1373086))

(assert (= (and b!1373084 res!916347) b!1373083))

(assert (= (and b!1373083 c!127808) b!1373087))

(assert (= (and b!1373083 (not c!127808)) b!1373085))

(assert (= (or b!1373087 b!1373085) bm!65600))

(assert (=> b!1373083 m!1256365))

(assert (=> b!1373083 m!1256365))

(assert (=> b!1373083 m!1256367))

(assert (=> b!1373084 m!1256365))

(assert (=> b!1373084 m!1256365))

(assert (=> b!1373084 m!1256367))

(assert (=> bm!65600 m!1256365))

(declare-fun m!1256413 () Bool)

(assert (=> bm!65600 m!1256413))

(assert (=> b!1373086 m!1256365))

(assert (=> b!1373086 m!1256365))

(declare-fun m!1256415 () Bool)

(assert (=> b!1373086 m!1256415))

(assert (=> b!1373034 d!147885))

(declare-fun d!147889 () Bool)

(assert (=> d!147889 (noDuplicate!2577 newAcc!98)))

(declare-fun lt!603005 () Unit!45377)

(declare-fun choose!2022 (List!32038 List!32038) Unit!45377)

(assert (=> d!147889 (= lt!603005 (choose!2022 newAcc!98 acc!866))))

(declare-fun e!777798 () Bool)

(assert (=> d!147889 e!777798))

(declare-fun res!916362 () Bool)

(assert (=> d!147889 (=> (not res!916362) (not e!777798))))

(assert (=> d!147889 (= res!916362 (subseq!1122 newAcc!98 acc!866))))

(assert (=> d!147889 (= (noDuplicateSubseq!309 newAcc!98 acc!866) lt!603005)))

(declare-fun b!1373100 () Bool)

(assert (=> b!1373100 (= e!777798 (noDuplicate!2577 acc!866))))

(assert (= (and d!147889 res!916362) b!1373100))

(declare-fun m!1256421 () Bool)

(assert (=> d!147889 m!1256421))

(declare-fun m!1256423 () Bool)

(assert (=> d!147889 m!1256423))

(assert (=> d!147889 m!1256373))

(assert (=> b!1373100 m!1256377))

(assert (=> b!1373034 d!147889))

(declare-fun d!147895 () Bool)

(declare-fun lt!603010 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!749 (List!32038) (InoxSet (_ BitVec 64)))

(assert (=> d!147895 (= lt!603010 (select (content!749 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777815 () Bool)

(assert (=> d!147895 (= lt!603010 e!777815)))

(declare-fun res!916380 () Bool)

(assert (=> d!147895 (=> (not res!916380) (not e!777815))))

(get-info :version)

(assert (=> d!147895 (= res!916380 ((_ is Cons!32034) newAcc!98))))

(assert (=> d!147895 (= (contains!9720 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603010)))

(declare-fun b!1373117 () Bool)

(declare-fun e!777816 () Bool)

(assert (=> b!1373117 (= e!777815 e!777816)))

(declare-fun res!916379 () Bool)

(assert (=> b!1373117 (=> res!916379 e!777816)))

(assert (=> b!1373117 (= res!916379 (= (h!33243 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373118 () Bool)

(assert (=> b!1373118 (= e!777816 (contains!9720 (t!46732 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147895 res!916380) b!1373117))

(assert (= (and b!1373117 (not res!916379)) b!1373118))

(declare-fun m!1256437 () Bool)

(assert (=> d!147895 m!1256437))

(declare-fun m!1256439 () Bool)

(assert (=> d!147895 m!1256439))

(declare-fun m!1256441 () Bool)

(assert (=> b!1373118 m!1256441))

(assert (=> b!1373029 d!147895))

(declare-fun d!147903 () Bool)

(assert (=> d!147903 (= (validKeyInArray!0 (select (arr!44970 a!3861) from!3239)) (and (not (= (select (arr!44970 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44970 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1373035 d!147903))

(declare-fun b!1373149 () Bool)

(declare-fun e!777844 () Bool)

(assert (=> b!1373149 (= e!777844 (subseq!1122 newAcc!98 (t!46732 acc!866)))))

(declare-fun b!1373146 () Bool)

(declare-fun e!777842 () Bool)

(declare-fun e!777841 () Bool)

(assert (=> b!1373146 (= e!777842 e!777841)))

(declare-fun res!916405 () Bool)

(assert (=> b!1373146 (=> (not res!916405) (not e!777841))))

(assert (=> b!1373146 (= res!916405 ((_ is Cons!32034) acc!866))))

(declare-fun b!1373148 () Bool)

(declare-fun e!777843 () Bool)

(assert (=> b!1373148 (= e!777843 (subseq!1122 (t!46732 newAcc!98) (t!46732 acc!866)))))

(declare-fun b!1373147 () Bool)

(assert (=> b!1373147 (= e!777841 e!777844)))

(declare-fun res!916403 () Bool)

(assert (=> b!1373147 (=> res!916403 e!777844)))

(assert (=> b!1373147 (= res!916403 e!777843)))

(declare-fun res!916404 () Bool)

(assert (=> b!1373147 (=> (not res!916404) (not e!777843))))

(assert (=> b!1373147 (= res!916404 (= (h!33243 newAcc!98) (h!33243 acc!866)))))

(declare-fun d!147905 () Bool)

(declare-fun res!916402 () Bool)

(assert (=> d!147905 (=> res!916402 e!777842)))

(assert (=> d!147905 (= res!916402 ((_ is Nil!32035) newAcc!98))))

(assert (=> d!147905 (= (subseq!1122 newAcc!98 acc!866) e!777842)))

(assert (= (and d!147905 (not res!916402)) b!1373146))

(assert (= (and b!1373146 res!916405) b!1373147))

(assert (= (and b!1373147 res!916404) b!1373148))

(assert (= (and b!1373147 (not res!916403)) b!1373149))

(declare-fun m!1256451 () Bool)

(assert (=> b!1373149 m!1256451))

(declare-fun m!1256453 () Bool)

(assert (=> b!1373148 m!1256453))

(assert (=> b!1373025 d!147905))

(declare-fun b!1373158 () Bool)

(declare-fun e!777853 () Bool)

(declare-fun e!777852 () Bool)

(assert (=> b!1373158 (= e!777853 e!777852)))

(declare-fun c!127812 () Bool)

(assert (=> b!1373158 (= c!127812 (validKeyInArray!0 (select (arr!44970 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!147913 () Bool)

(declare-fun res!916414 () Bool)

(declare-fun e!777854 () Bool)

(assert (=> d!147913 (=> res!916414 e!777854)))

(assert (=> d!147913 (= res!916414 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45520 a!3861)))))

(assert (=> d!147913 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!777854)))

(declare-fun b!1373159 () Bool)

(assert (=> b!1373159 (= e!777854 e!777853)))

(declare-fun res!916412 () Bool)

(assert (=> b!1373159 (=> (not res!916412) (not e!777853))))

(declare-fun e!777851 () Bool)

(assert (=> b!1373159 (= res!916412 (not e!777851))))

(declare-fun res!916413 () Bool)

(assert (=> b!1373159 (=> (not res!916413) (not e!777851))))

(assert (=> b!1373159 (= res!916413 (validKeyInArray!0 (select (arr!44970 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373160 () Bool)

(declare-fun call!65607 () Bool)

(assert (=> b!1373160 (= e!777852 call!65607)))

(declare-fun bm!65604 () Bool)

(assert (=> bm!65604 (= call!65607 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127812 (Cons!32034 (select (arr!44970 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun b!1373161 () Bool)

(assert (=> b!1373161 (= e!777851 (contains!9720 acc!866 (select (arr!44970 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373162 () Bool)

(assert (=> b!1373162 (= e!777852 call!65607)))

(assert (= (and d!147913 (not res!916414)) b!1373159))

(assert (= (and b!1373159 res!916413) b!1373161))

(assert (= (and b!1373159 res!916412) b!1373158))

(assert (= (and b!1373158 c!127812) b!1373162))

(assert (= (and b!1373158 (not c!127812)) b!1373160))

(assert (= (or b!1373162 b!1373160) bm!65604))

(declare-fun m!1256455 () Bool)

(assert (=> b!1373158 m!1256455))

(assert (=> b!1373158 m!1256455))

(declare-fun m!1256457 () Bool)

(assert (=> b!1373158 m!1256457))

(assert (=> b!1373159 m!1256455))

(assert (=> b!1373159 m!1256455))

(assert (=> b!1373159 m!1256457))

(assert (=> bm!65604 m!1256455))

(declare-fun m!1256459 () Bool)

(assert (=> bm!65604 m!1256459))

(assert (=> b!1373161 m!1256455))

(assert (=> b!1373161 m!1256455))

(declare-fun m!1256461 () Bool)

(assert (=> b!1373161 m!1256461))

(assert (=> b!1373026 d!147913))

(declare-fun d!147915 () Bool)

(declare-fun res!916425 () Bool)

(declare-fun e!777868 () Bool)

(assert (=> d!147915 (=> res!916425 e!777868)))

(assert (=> d!147915 (= res!916425 ((_ is Nil!32035) acc!866))))

(assert (=> d!147915 (= (noDuplicate!2577 acc!866) e!777868)))

(declare-fun b!1373177 () Bool)

(declare-fun e!777869 () Bool)

(assert (=> b!1373177 (= e!777868 e!777869)))

(declare-fun res!916426 () Bool)

(assert (=> b!1373177 (=> (not res!916426) (not e!777869))))

(assert (=> b!1373177 (= res!916426 (not (contains!9720 (t!46732 acc!866) (h!33243 acc!866))))))

(declare-fun b!1373178 () Bool)

(assert (=> b!1373178 (= e!777869 (noDuplicate!2577 (t!46732 acc!866)))))

(assert (= (and d!147915 (not res!916425)) b!1373177))

(assert (= (and b!1373177 res!916426) b!1373178))

(declare-fun m!1256467 () Bool)

(assert (=> b!1373177 m!1256467))

(declare-fun m!1256471 () Bool)

(assert (=> b!1373178 m!1256471))

(assert (=> b!1373031 d!147915))

(declare-fun d!147921 () Bool)

(declare-fun lt!603015 () Bool)

(assert (=> d!147921 (= lt!603015 (select (content!749 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777872 () Bool)

(assert (=> d!147921 (= lt!603015 e!777872)))

(declare-fun res!916430 () Bool)

(assert (=> d!147921 (=> (not res!916430) (not e!777872))))

(assert (=> d!147921 (= res!916430 ((_ is Cons!32034) newAcc!98))))

(assert (=> d!147921 (= (contains!9720 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603015)))

(declare-fun b!1373181 () Bool)

(declare-fun e!777873 () Bool)

(assert (=> b!1373181 (= e!777872 e!777873)))

(declare-fun res!916429 () Bool)

(assert (=> b!1373181 (=> res!916429 e!777873)))

(assert (=> b!1373181 (= res!916429 (= (h!33243 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373182 () Bool)

(assert (=> b!1373182 (= e!777873 (contains!9720 (t!46732 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147921 res!916430) b!1373181))

(assert (= (and b!1373181 (not res!916429)) b!1373182))

(assert (=> d!147921 m!1256437))

(declare-fun m!1256485 () Bool)

(assert (=> d!147921 m!1256485))

(declare-fun m!1256487 () Bool)

(assert (=> b!1373182 m!1256487))

(assert (=> b!1373032 d!147921))

(declare-fun d!147927 () Bool)

(assert (=> d!147927 (= (array_inv!33998 a!3861) (bvsge (size!45520 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116302 d!147927))

(declare-fun d!147931 () Bool)

(declare-fun lt!603017 () Bool)

(assert (=> d!147931 (= lt!603017 (select (content!749 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777880 () Bool)

(assert (=> d!147931 (= lt!603017 e!777880)))

(declare-fun res!916437 () Bool)

(assert (=> d!147931 (=> (not res!916437) (not e!777880))))

(assert (=> d!147931 (= res!916437 ((_ is Cons!32034) acc!866))))

(assert (=> d!147931 (= (contains!9720 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603017)))

(declare-fun b!1373190 () Bool)

(declare-fun e!777881 () Bool)

(assert (=> b!1373190 (= e!777880 e!777881)))

(declare-fun res!916436 () Bool)

(assert (=> b!1373190 (=> res!916436 e!777881)))

(assert (=> b!1373190 (= res!916436 (= (h!33243 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373191 () Bool)

(assert (=> b!1373191 (= e!777881 (contains!9720 (t!46732 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147931 res!916437) b!1373190))

(assert (= (and b!1373190 (not res!916436)) b!1373191))

(declare-fun m!1256503 () Bool)

(assert (=> d!147931 m!1256503))

(declare-fun m!1256505 () Bool)

(assert (=> d!147931 m!1256505))

(declare-fun m!1256507 () Bool)

(assert (=> b!1373191 m!1256507))

(assert (=> b!1373027 d!147931))

(declare-fun d!147935 () Bool)

(declare-fun lt!603019 () Bool)

(assert (=> d!147935 (= lt!603019 (select (content!749 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777884 () Bool)

(assert (=> d!147935 (= lt!603019 e!777884)))

(declare-fun res!916441 () Bool)

(assert (=> d!147935 (=> (not res!916441) (not e!777884))))

(assert (=> d!147935 (= res!916441 ((_ is Cons!32034) acc!866))))

(assert (=> d!147935 (= (contains!9720 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603019)))

(declare-fun b!1373194 () Bool)

(declare-fun e!777885 () Bool)

(assert (=> b!1373194 (= e!777884 e!777885)))

(declare-fun res!916440 () Bool)

(assert (=> b!1373194 (=> res!916440 e!777885)))

(assert (=> b!1373194 (= res!916440 (= (h!33243 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373195 () Bool)

(assert (=> b!1373195 (= e!777885 (contains!9720 (t!46732 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147935 res!916441) b!1373194))

(assert (= (and b!1373194 (not res!916440)) b!1373195))

(assert (=> d!147935 m!1256503))

(declare-fun m!1256513 () Bool)

(assert (=> d!147935 m!1256513))

(declare-fun m!1256515 () Bool)

(assert (=> b!1373195 m!1256515))

(assert (=> b!1373033 d!147935))

(check-sat (not b!1373177) (not b!1373149) (not b!1373148) (not bm!65600) (not b!1373100) (not bm!65604) (not b!1373195) (not b!1373083) (not b!1373161) (not b!1373118) (not d!147921) (not d!147935) (not d!147931) (not d!147889) (not b!1373191) (not b!1373182) (not b!1373159) (not b!1373158) (not b!1373178) (not b!1373084) (not b!1373086) (not d!147895))
(check-sat)
