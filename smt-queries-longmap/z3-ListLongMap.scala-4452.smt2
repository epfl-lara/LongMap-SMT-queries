; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61912 () Bool)

(assert start!61912)

(declare-fun b!692819 () Bool)

(declare-fun e!394194 () Bool)

(declare-fun e!394190 () Bool)

(assert (=> b!692819 (= e!394194 e!394190)))

(declare-fun res!457020 () Bool)

(assert (=> b!692819 (=> (not res!457020) (not e!394190))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!692819 (= res!457020 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39843 0))(
  ( (array!39844 (arr!19087 (Array (_ BitVec 32) (_ BitVec 64))) (size!19472 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39843)

(declare-datatypes ((List!13128 0))(
  ( (Nil!13125) (Cons!13124 (h!14169 (_ BitVec 64)) (t!19401 List!13128)) )
))
(declare-fun acc!681 () List!13128)

(declare-fun lt!316654 () List!13128)

(declare-fun $colon$colon!417 (List!13128 (_ BitVec 64)) List!13128)

(assert (=> b!692819 (= lt!316654 ($colon$colon!417 acc!681 (select (arr!19087 a!3626) from!3004)))))

(declare-fun b!692820 () Bool)

(declare-fun res!457030 () Bool)

(declare-fun e!394185 () Bool)

(assert (=> b!692820 (=> (not res!457030) (not e!394185))))

(declare-fun arrayNoDuplicates!0 (array!39843 (_ BitVec 32) List!13128) Bool)

(assert (=> b!692820 (= res!457030 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692821 () Bool)

(declare-fun res!457034 () Bool)

(assert (=> b!692821 (=> (not res!457034) (not e!394190))))

(declare-fun noDuplicate!952 (List!13128) Bool)

(assert (=> b!692821 (= res!457034 (noDuplicate!952 lt!316654))))

(declare-fun res!457025 () Bool)

(assert (=> start!61912 (=> (not res!457025) (not e!394185))))

(assert (=> start!61912 (= res!457025 (and (bvslt (size!19472 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19472 a!3626))))))

(assert (=> start!61912 e!394185))

(assert (=> start!61912 true))

(declare-fun array_inv!14883 (array!39843) Bool)

(assert (=> start!61912 (array_inv!14883 a!3626)))

(declare-fun b!692822 () Bool)

(declare-fun res!457018 () Bool)

(assert (=> b!692822 (=> (not res!457018) (not e!394190))))

(declare-fun contains!3705 (List!13128 (_ BitVec 64)) Bool)

(assert (=> b!692822 (= res!457018 (not (contains!3705 lt!316654 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692823 () Bool)

(declare-fun e!394193 () Bool)

(declare-fun e!394188 () Bool)

(assert (=> b!692823 (= e!394193 e!394188)))

(declare-fun res!457023 () Bool)

(assert (=> b!692823 (=> (not res!457023) (not e!394188))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692823 (= res!457023 (bvsle from!3004 i!1382))))

(declare-fun b!692824 () Bool)

(declare-fun res!457017 () Bool)

(assert (=> b!692824 (=> (not res!457017) (not e!394190))))

(declare-fun e!394187 () Bool)

(assert (=> b!692824 (= res!457017 e!394187)))

(declare-fun res!457035 () Bool)

(assert (=> b!692824 (=> res!457035 e!394187)))

(assert (=> b!692824 (= res!457035 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692825 () Bool)

(declare-fun res!457033 () Bool)

(assert (=> b!692825 (=> (not res!457033) (not e!394185))))

(assert (=> b!692825 (= res!457033 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19472 a!3626))))))

(declare-fun b!692826 () Bool)

(declare-fun res!457019 () Bool)

(assert (=> b!692826 (=> (not res!457019) (not e!394185))))

(assert (=> b!692826 (= res!457019 e!394193)))

(declare-fun res!457016 () Bool)

(assert (=> b!692826 (=> res!457016 e!394193)))

(declare-fun e!394186 () Bool)

(assert (=> b!692826 (= res!457016 e!394186)))

(declare-fun res!457027 () Bool)

(assert (=> b!692826 (=> (not res!457027) (not e!394186))))

(assert (=> b!692826 (= res!457027 (bvsgt from!3004 i!1382))))

(declare-fun b!692827 () Bool)

(declare-fun res!457021 () Bool)

(assert (=> b!692827 (=> (not res!457021) (not e!394185))))

(assert (=> b!692827 (= res!457021 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19472 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692828 () Bool)

(declare-fun res!457026 () Bool)

(assert (=> b!692828 (=> (not res!457026) (not e!394185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692828 (= res!457026 (validKeyInArray!0 (select (arr!19087 a!3626) from!3004)))))

(declare-fun b!692829 () Bool)

(assert (=> b!692829 (= e!394185 e!394194)))

(declare-fun res!457029 () Bool)

(assert (=> b!692829 (=> (not res!457029) (not e!394194))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!692829 (= res!457029 (not (= (select (arr!19087 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!24466 0))(
  ( (Unit!24467) )
))
(declare-fun lt!316653 () Unit!24466)

(declare-fun e!394191 () Unit!24466)

(assert (=> b!692829 (= lt!316653 e!394191)))

(declare-fun c!78269 () Bool)

(assert (=> b!692829 (= c!78269 (= (select (arr!19087 a!3626) from!3004) k0!2843))))

(declare-fun b!692830 () Bool)

(declare-fun Unit!24468 () Unit!24466)

(assert (=> b!692830 (= e!394191 Unit!24468)))

(declare-fun b!692831 () Bool)

(assert (=> b!692831 (= e!394187 (not (contains!3705 lt!316654 k0!2843)))))

(declare-fun b!692832 () Bool)

(declare-fun res!457037 () Bool)

(assert (=> b!692832 (=> (not res!457037) (not e!394185))))

(declare-fun arrayContainsKey!0 (array!39843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692832 (= res!457037 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692833 () Bool)

(assert (=> b!692833 (= e!394188 (not (contains!3705 acc!681 k0!2843)))))

(declare-fun b!692834 () Bool)

(declare-fun e!394192 () Bool)

(assert (=> b!692834 (= e!394192 (contains!3705 lt!316654 k0!2843))))

(declare-fun b!692835 () Bool)

(assert (=> b!692835 (= e!394190 e!394192)))

(declare-fun res!457015 () Bool)

(assert (=> b!692835 (=> res!457015 e!394192)))

(assert (=> b!692835 (= res!457015 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!692836 () Bool)

(assert (=> b!692836 (= e!394186 (contains!3705 acc!681 k0!2843))))

(declare-fun b!692837 () Bool)

(declare-fun res!457036 () Bool)

(assert (=> b!692837 (=> (not res!457036) (not e!394185))))

(assert (=> b!692837 (= res!457036 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13125))))

(declare-fun b!692838 () Bool)

(declare-fun Unit!24469 () Unit!24466)

(assert (=> b!692838 (= e!394191 Unit!24469)))

(assert (=> b!692838 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316652 () Unit!24466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39843 (_ BitVec 64) (_ BitVec 32)) Unit!24466)

(assert (=> b!692838 (= lt!316652 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!692838 false))

(declare-fun b!692839 () Bool)

(declare-fun res!457022 () Bool)

(assert (=> b!692839 (=> (not res!457022) (not e!394185))))

(assert (=> b!692839 (= res!457022 (not (contains!3705 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692840 () Bool)

(declare-fun res!457028 () Bool)

(assert (=> b!692840 (=> (not res!457028) (not e!394185))))

(assert (=> b!692840 (= res!457028 (not (contains!3705 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692841 () Bool)

(declare-fun res!457032 () Bool)

(assert (=> b!692841 (=> (not res!457032) (not e!394190))))

(assert (=> b!692841 (= res!457032 (not (contains!3705 lt!316654 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692842 () Bool)

(declare-fun res!457024 () Bool)

(assert (=> b!692842 (=> (not res!457024) (not e!394185))))

(assert (=> b!692842 (= res!457024 (validKeyInArray!0 k0!2843))))

(declare-fun b!692843 () Bool)

(declare-fun res!457031 () Bool)

(assert (=> b!692843 (=> (not res!457031) (not e!394185))))

(assert (=> b!692843 (= res!457031 (noDuplicate!952 acc!681))))

(assert (= (and start!61912 res!457025) b!692843))

(assert (= (and b!692843 res!457031) b!692840))

(assert (= (and b!692840 res!457028) b!692839))

(assert (= (and b!692839 res!457022) b!692826))

(assert (= (and b!692826 res!457027) b!692836))

(assert (= (and b!692826 (not res!457016)) b!692823))

(assert (= (and b!692823 res!457023) b!692833))

(assert (= (and b!692826 res!457019) b!692837))

(assert (= (and b!692837 res!457036) b!692820))

(assert (= (and b!692820 res!457030) b!692825))

(assert (= (and b!692825 res!457033) b!692842))

(assert (= (and b!692842 res!457024) b!692832))

(assert (= (and b!692832 res!457037) b!692827))

(assert (= (and b!692827 res!457021) b!692828))

(assert (= (and b!692828 res!457026) b!692829))

(assert (= (and b!692829 c!78269) b!692838))

(assert (= (and b!692829 (not c!78269)) b!692830))

(assert (= (and b!692829 res!457029) b!692819))

(assert (= (and b!692819 res!457020) b!692821))

(assert (= (and b!692821 res!457034) b!692841))

(assert (= (and b!692841 res!457032) b!692822))

(assert (= (and b!692822 res!457018) b!692824))

(assert (= (and b!692824 (not res!457035)) b!692831))

(assert (= (and b!692824 res!457017) b!692835))

(assert (= (and b!692835 (not res!457015)) b!692834))

(declare-fun m!655295 () Bool)

(assert (=> b!692828 m!655295))

(assert (=> b!692828 m!655295))

(declare-fun m!655297 () Bool)

(assert (=> b!692828 m!655297))

(declare-fun m!655299 () Bool)

(assert (=> b!692842 m!655299))

(declare-fun m!655301 () Bool)

(assert (=> b!692833 m!655301))

(declare-fun m!655303 () Bool)

(assert (=> b!692831 m!655303))

(assert (=> b!692836 m!655301))

(declare-fun m!655305 () Bool)

(assert (=> b!692839 m!655305))

(declare-fun m!655307 () Bool)

(assert (=> b!692840 m!655307))

(declare-fun m!655309 () Bool)

(assert (=> b!692841 m!655309))

(declare-fun m!655311 () Bool)

(assert (=> b!692822 m!655311))

(declare-fun m!655313 () Bool)

(assert (=> b!692837 m!655313))

(declare-fun m!655315 () Bool)

(assert (=> b!692843 m!655315))

(declare-fun m!655317 () Bool)

(assert (=> b!692821 m!655317))

(assert (=> b!692834 m!655303))

(assert (=> b!692829 m!655295))

(declare-fun m!655319 () Bool)

(assert (=> b!692838 m!655319))

(declare-fun m!655321 () Bool)

(assert (=> b!692838 m!655321))

(assert (=> b!692819 m!655295))

(assert (=> b!692819 m!655295))

(declare-fun m!655323 () Bool)

(assert (=> b!692819 m!655323))

(declare-fun m!655325 () Bool)

(assert (=> b!692820 m!655325))

(declare-fun m!655327 () Bool)

(assert (=> b!692832 m!655327))

(declare-fun m!655329 () Bool)

(assert (=> start!61912 m!655329))

(check-sat (not b!692821) (not b!692836) (not b!692819) (not b!692820) (not b!692833) (not b!692842) (not start!61912) (not b!692840) (not b!692828) (not b!692822) (not b!692839) (not b!692831) (not b!692832) (not b!692834) (not b!692838) (not b!692837) (not b!692841) (not b!692843))
(check-sat)
(get-model)

(declare-fun d!95707 () Bool)

(declare-fun lt!316666 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!315 (List!13128) (InoxSet (_ BitVec 64)))

(assert (=> d!95707 (= lt!316666 (select (content!315 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394229 () Bool)

(assert (=> d!95707 (= lt!316666 e!394229)))

(declare-fun res!457111 () Bool)

(assert (=> d!95707 (=> (not res!457111) (not e!394229))))

(get-info :version)

(assert (=> d!95707 (= res!457111 ((_ is Cons!13124) acc!681))))

(assert (=> d!95707 (= (contains!3705 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316666)))

(declare-fun b!692923 () Bool)

(declare-fun e!394230 () Bool)

(assert (=> b!692923 (= e!394229 e!394230)))

(declare-fun res!457112 () Bool)

(assert (=> b!692923 (=> res!457112 e!394230)))

(assert (=> b!692923 (= res!457112 (= (h!14169 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692924 () Bool)

(assert (=> b!692924 (= e!394230 (contains!3705 (t!19401 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95707 res!457111) b!692923))

(assert (= (and b!692923 (not res!457112)) b!692924))

(declare-fun m!655367 () Bool)

(assert (=> d!95707 m!655367))

(declare-fun m!655369 () Bool)

(assert (=> d!95707 m!655369))

(declare-fun m!655371 () Bool)

(assert (=> b!692924 m!655371))

(assert (=> b!692840 d!95707))

(declare-fun d!95709 () Bool)

(declare-fun lt!316667 () Bool)

(assert (=> d!95709 (= lt!316667 (select (content!315 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394231 () Bool)

(assert (=> d!95709 (= lt!316667 e!394231)))

(declare-fun res!457113 () Bool)

(assert (=> d!95709 (=> (not res!457113) (not e!394231))))

(assert (=> d!95709 (= res!457113 ((_ is Cons!13124) acc!681))))

(assert (=> d!95709 (= (contains!3705 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316667)))

(declare-fun b!692925 () Bool)

(declare-fun e!394232 () Bool)

(assert (=> b!692925 (= e!394231 e!394232)))

(declare-fun res!457114 () Bool)

(assert (=> b!692925 (=> res!457114 e!394232)))

(assert (=> b!692925 (= res!457114 (= (h!14169 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692926 () Bool)

(assert (=> b!692926 (= e!394232 (contains!3705 (t!19401 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95709 res!457113) b!692925))

(assert (= (and b!692925 (not res!457114)) b!692926))

(assert (=> d!95709 m!655367))

(declare-fun m!655373 () Bool)

(assert (=> d!95709 m!655373))

(declare-fun m!655375 () Bool)

(assert (=> b!692926 m!655375))

(assert (=> b!692839 d!95709))

(declare-fun d!95711 () Bool)

(assert (=> d!95711 (= (validKeyInArray!0 (select (arr!19087 a!3626) from!3004)) (and (not (= (select (arr!19087 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19087 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692828 d!95711))

(declare-fun d!95713 () Bool)

(assert (=> d!95713 (= (array_inv!14883 a!3626) (bvsge (size!19472 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61912 d!95713))

(declare-fun d!95715 () Bool)

(declare-fun res!457119 () Bool)

(declare-fun e!394237 () Bool)

(assert (=> d!95715 (=> res!457119 e!394237)))

(assert (=> d!95715 (= res!457119 (= (select (arr!19087 a!3626) from!3004) k0!2843))))

(assert (=> d!95715 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!394237)))

(declare-fun b!692931 () Bool)

(declare-fun e!394238 () Bool)

(assert (=> b!692931 (= e!394237 e!394238)))

(declare-fun res!457120 () Bool)

(assert (=> b!692931 (=> (not res!457120) (not e!394238))))

(assert (=> b!692931 (= res!457120 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19472 a!3626)))))

(declare-fun b!692932 () Bool)

(assert (=> b!692932 (= e!394238 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95715 (not res!457119)) b!692931))

(assert (= (and b!692931 res!457120) b!692932))

(assert (=> d!95715 m!655295))

(declare-fun m!655377 () Bool)

(assert (=> b!692932 m!655377))

(assert (=> b!692838 d!95715))

(declare-fun d!95717 () Bool)

(assert (=> d!95717 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316670 () Unit!24466)

(declare-fun choose!13 (array!39843 (_ BitVec 64) (_ BitVec 32)) Unit!24466)

(assert (=> d!95717 (= lt!316670 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95717 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95717 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316670)))

(declare-fun bs!20275 () Bool)

(assert (= bs!20275 d!95717))

(assert (=> bs!20275 m!655327))

(declare-fun m!655379 () Bool)

(assert (=> bs!20275 m!655379))

(assert (=> b!692838 d!95717))

(declare-fun d!95719 () Bool)

(declare-fun res!457129 () Bool)

(declare-fun e!394247 () Bool)

(assert (=> d!95719 (=> res!457129 e!394247)))

(assert (=> d!95719 (= res!457129 (bvsge #b00000000000000000000000000000000 (size!19472 a!3626)))))

(assert (=> d!95719 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13125) e!394247)))

(declare-fun b!692943 () Bool)

(declare-fun e!394248 () Bool)

(declare-fun call!34253 () Bool)

(assert (=> b!692943 (= e!394248 call!34253)))

(declare-fun b!692944 () Bool)

(declare-fun e!394250 () Bool)

(assert (=> b!692944 (= e!394250 (contains!3705 Nil!13125 (select (arr!19087 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692945 () Bool)

(assert (=> b!692945 (= e!394248 call!34253)))

(declare-fun bm!34250 () Bool)

(declare-fun c!78275 () Bool)

(assert (=> bm!34250 (= call!34253 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78275 (Cons!13124 (select (arr!19087 a!3626) #b00000000000000000000000000000000) Nil!13125) Nil!13125)))))

(declare-fun b!692946 () Bool)

(declare-fun e!394249 () Bool)

(assert (=> b!692946 (= e!394249 e!394248)))

(assert (=> b!692946 (= c!78275 (validKeyInArray!0 (select (arr!19087 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692947 () Bool)

(assert (=> b!692947 (= e!394247 e!394249)))

(declare-fun res!457127 () Bool)

(assert (=> b!692947 (=> (not res!457127) (not e!394249))))

(assert (=> b!692947 (= res!457127 (not e!394250))))

(declare-fun res!457128 () Bool)

(assert (=> b!692947 (=> (not res!457128) (not e!394250))))

(assert (=> b!692947 (= res!457128 (validKeyInArray!0 (select (arr!19087 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95719 (not res!457129)) b!692947))

(assert (= (and b!692947 res!457128) b!692944))

(assert (= (and b!692947 res!457127) b!692946))

(assert (= (and b!692946 c!78275) b!692943))

(assert (= (and b!692946 (not c!78275)) b!692945))

(assert (= (or b!692943 b!692945) bm!34250))

(declare-fun m!655381 () Bool)

(assert (=> b!692944 m!655381))

(assert (=> b!692944 m!655381))

(declare-fun m!655383 () Bool)

(assert (=> b!692944 m!655383))

(assert (=> bm!34250 m!655381))

(declare-fun m!655385 () Bool)

(assert (=> bm!34250 m!655385))

(assert (=> b!692946 m!655381))

(assert (=> b!692946 m!655381))

(declare-fun m!655387 () Bool)

(assert (=> b!692946 m!655387))

(assert (=> b!692947 m!655381))

(assert (=> b!692947 m!655381))

(assert (=> b!692947 m!655387))

(assert (=> b!692837 d!95719))

(declare-fun d!95721 () Bool)

(declare-fun lt!316671 () Bool)

(assert (=> d!95721 (= lt!316671 (select (content!315 acc!681) k0!2843))))

(declare-fun e!394251 () Bool)

(assert (=> d!95721 (= lt!316671 e!394251)))

(declare-fun res!457130 () Bool)

(assert (=> d!95721 (=> (not res!457130) (not e!394251))))

(assert (=> d!95721 (= res!457130 ((_ is Cons!13124) acc!681))))

(assert (=> d!95721 (= (contains!3705 acc!681 k0!2843) lt!316671)))

(declare-fun b!692948 () Bool)

(declare-fun e!394252 () Bool)

(assert (=> b!692948 (= e!394251 e!394252)))

(declare-fun res!457131 () Bool)

(assert (=> b!692948 (=> res!457131 e!394252)))

(assert (=> b!692948 (= res!457131 (= (h!14169 acc!681) k0!2843))))

(declare-fun b!692949 () Bool)

(assert (=> b!692949 (= e!394252 (contains!3705 (t!19401 acc!681) k0!2843))))

(assert (= (and d!95721 res!457130) b!692948))

(assert (= (and b!692948 (not res!457131)) b!692949))

(assert (=> d!95721 m!655367))

(declare-fun m!655389 () Bool)

(assert (=> d!95721 m!655389))

(declare-fun m!655391 () Bool)

(assert (=> b!692949 m!655391))

(assert (=> b!692836 d!95721))

(declare-fun d!95723 () Bool)

(declare-fun lt!316672 () Bool)

(assert (=> d!95723 (= lt!316672 (select (content!315 lt!316654) k0!2843))))

(declare-fun e!394253 () Bool)

(assert (=> d!95723 (= lt!316672 e!394253)))

(declare-fun res!457132 () Bool)

(assert (=> d!95723 (=> (not res!457132) (not e!394253))))

(assert (=> d!95723 (= res!457132 ((_ is Cons!13124) lt!316654))))

(assert (=> d!95723 (= (contains!3705 lt!316654 k0!2843) lt!316672)))

(declare-fun b!692950 () Bool)

(declare-fun e!394254 () Bool)

(assert (=> b!692950 (= e!394253 e!394254)))

(declare-fun res!457133 () Bool)

(assert (=> b!692950 (=> res!457133 e!394254)))

(assert (=> b!692950 (= res!457133 (= (h!14169 lt!316654) k0!2843))))

(declare-fun b!692951 () Bool)

(assert (=> b!692951 (= e!394254 (contains!3705 (t!19401 lt!316654) k0!2843))))

(assert (= (and d!95723 res!457132) b!692950))

(assert (= (and b!692950 (not res!457133)) b!692951))

(declare-fun m!655393 () Bool)

(assert (=> d!95723 m!655393))

(declare-fun m!655395 () Bool)

(assert (=> d!95723 m!655395))

(declare-fun m!655397 () Bool)

(assert (=> b!692951 m!655397))

(assert (=> b!692834 d!95723))

(assert (=> b!692833 d!95721))

(declare-fun d!95725 () Bool)

(declare-fun lt!316673 () Bool)

(assert (=> d!95725 (= lt!316673 (select (content!315 lt!316654) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394255 () Bool)

(assert (=> d!95725 (= lt!316673 e!394255)))

(declare-fun res!457134 () Bool)

(assert (=> d!95725 (=> (not res!457134) (not e!394255))))

(assert (=> d!95725 (= res!457134 ((_ is Cons!13124) lt!316654))))

(assert (=> d!95725 (= (contains!3705 lt!316654 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316673)))

(declare-fun b!692952 () Bool)

(declare-fun e!394256 () Bool)

(assert (=> b!692952 (= e!394255 e!394256)))

(declare-fun res!457135 () Bool)

(assert (=> b!692952 (=> res!457135 e!394256)))

(assert (=> b!692952 (= res!457135 (= (h!14169 lt!316654) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692953 () Bool)

(assert (=> b!692953 (= e!394256 (contains!3705 (t!19401 lt!316654) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95725 res!457134) b!692952))

(assert (= (and b!692952 (not res!457135)) b!692953))

(assert (=> d!95725 m!655393))

(declare-fun m!655399 () Bool)

(assert (=> d!95725 m!655399))

(declare-fun m!655401 () Bool)

(assert (=> b!692953 m!655401))

(assert (=> b!692822 d!95725))

(declare-fun d!95727 () Bool)

(declare-fun res!457140 () Bool)

(declare-fun e!394261 () Bool)

(assert (=> d!95727 (=> res!457140 e!394261)))

(assert (=> d!95727 (= res!457140 ((_ is Nil!13125) acc!681))))

(assert (=> d!95727 (= (noDuplicate!952 acc!681) e!394261)))

(declare-fun b!692958 () Bool)

(declare-fun e!394262 () Bool)

(assert (=> b!692958 (= e!394261 e!394262)))

(declare-fun res!457141 () Bool)

(assert (=> b!692958 (=> (not res!457141) (not e!394262))))

(assert (=> b!692958 (= res!457141 (not (contains!3705 (t!19401 acc!681) (h!14169 acc!681))))))

(declare-fun b!692959 () Bool)

(assert (=> b!692959 (= e!394262 (noDuplicate!952 (t!19401 acc!681)))))

(assert (= (and d!95727 (not res!457140)) b!692958))

(assert (= (and b!692958 res!457141) b!692959))

(declare-fun m!655403 () Bool)

(assert (=> b!692958 m!655403))

(declare-fun m!655405 () Bool)

(assert (=> b!692959 m!655405))

(assert (=> b!692843 d!95727))

(declare-fun d!95731 () Bool)

(declare-fun res!457142 () Bool)

(declare-fun e!394263 () Bool)

(assert (=> d!95731 (=> res!457142 e!394263)))

(assert (=> d!95731 (= res!457142 (= (select (arr!19087 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95731 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!394263)))

(declare-fun b!692960 () Bool)

(declare-fun e!394264 () Bool)

(assert (=> b!692960 (= e!394263 e!394264)))

(declare-fun res!457143 () Bool)

(assert (=> b!692960 (=> (not res!457143) (not e!394264))))

(assert (=> b!692960 (= res!457143 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19472 a!3626)))))

(declare-fun b!692961 () Bool)

(assert (=> b!692961 (= e!394264 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95731 (not res!457142)) b!692960))

(assert (= (and b!692960 res!457143) b!692961))

(assert (=> d!95731 m!655381))

(declare-fun m!655407 () Bool)

(assert (=> b!692961 m!655407))

(assert (=> b!692832 d!95731))

(declare-fun d!95733 () Bool)

(declare-fun res!457144 () Bool)

(declare-fun e!394265 () Bool)

(assert (=> d!95733 (=> res!457144 e!394265)))

(assert (=> d!95733 (= res!457144 ((_ is Nil!13125) lt!316654))))

(assert (=> d!95733 (= (noDuplicate!952 lt!316654) e!394265)))

(declare-fun b!692962 () Bool)

(declare-fun e!394266 () Bool)

(assert (=> b!692962 (= e!394265 e!394266)))

(declare-fun res!457145 () Bool)

(assert (=> b!692962 (=> (not res!457145) (not e!394266))))

(assert (=> b!692962 (= res!457145 (not (contains!3705 (t!19401 lt!316654) (h!14169 lt!316654))))))

(declare-fun b!692963 () Bool)

(assert (=> b!692963 (= e!394266 (noDuplicate!952 (t!19401 lt!316654)))))

(assert (= (and d!95733 (not res!457144)) b!692962))

(assert (= (and b!692962 res!457145) b!692963))

(declare-fun m!655409 () Bool)

(assert (=> b!692962 m!655409))

(declare-fun m!655411 () Bool)

(assert (=> b!692963 m!655411))

(assert (=> b!692821 d!95733))

(declare-fun d!95735 () Bool)

(assert (=> d!95735 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692842 d!95735))

(assert (=> b!692831 d!95723))

(declare-fun d!95737 () Bool)

(declare-fun res!457148 () Bool)

(declare-fun e!394267 () Bool)

(assert (=> d!95737 (=> res!457148 e!394267)))

(assert (=> d!95737 (= res!457148 (bvsge from!3004 (size!19472 a!3626)))))

(assert (=> d!95737 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394267)))

(declare-fun b!692964 () Bool)

(declare-fun e!394268 () Bool)

(declare-fun call!34254 () Bool)

(assert (=> b!692964 (= e!394268 call!34254)))

(declare-fun b!692965 () Bool)

(declare-fun e!394270 () Bool)

(assert (=> b!692965 (= e!394270 (contains!3705 acc!681 (select (arr!19087 a!3626) from!3004)))))

(declare-fun b!692966 () Bool)

(assert (=> b!692966 (= e!394268 call!34254)))

(declare-fun bm!34251 () Bool)

(declare-fun c!78276 () Bool)

(assert (=> bm!34251 (= call!34254 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78276 (Cons!13124 (select (arr!19087 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!692967 () Bool)

(declare-fun e!394269 () Bool)

(assert (=> b!692967 (= e!394269 e!394268)))

(assert (=> b!692967 (= c!78276 (validKeyInArray!0 (select (arr!19087 a!3626) from!3004)))))

(declare-fun b!692968 () Bool)

(assert (=> b!692968 (= e!394267 e!394269)))

(declare-fun res!457146 () Bool)

(assert (=> b!692968 (=> (not res!457146) (not e!394269))))

(assert (=> b!692968 (= res!457146 (not e!394270))))

(declare-fun res!457147 () Bool)

(assert (=> b!692968 (=> (not res!457147) (not e!394270))))

(assert (=> b!692968 (= res!457147 (validKeyInArray!0 (select (arr!19087 a!3626) from!3004)))))

(assert (= (and d!95737 (not res!457148)) b!692968))

(assert (= (and b!692968 res!457147) b!692965))

(assert (= (and b!692968 res!457146) b!692967))

(assert (= (and b!692967 c!78276) b!692964))

(assert (= (and b!692967 (not c!78276)) b!692966))

(assert (= (or b!692964 b!692966) bm!34251))

(assert (=> b!692965 m!655295))

(assert (=> b!692965 m!655295))

(declare-fun m!655413 () Bool)

(assert (=> b!692965 m!655413))

(assert (=> bm!34251 m!655295))

(declare-fun m!655415 () Bool)

(assert (=> bm!34251 m!655415))

(assert (=> b!692967 m!655295))

(assert (=> b!692967 m!655295))

(assert (=> b!692967 m!655297))

(assert (=> b!692968 m!655295))

(assert (=> b!692968 m!655295))

(assert (=> b!692968 m!655297))

(assert (=> b!692820 d!95737))

(declare-fun d!95741 () Bool)

(declare-fun lt!316674 () Bool)

(assert (=> d!95741 (= lt!316674 (select (content!315 lt!316654) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394271 () Bool)

(assert (=> d!95741 (= lt!316674 e!394271)))

(declare-fun res!457149 () Bool)

(assert (=> d!95741 (=> (not res!457149) (not e!394271))))

(assert (=> d!95741 (= res!457149 ((_ is Cons!13124) lt!316654))))

(assert (=> d!95741 (= (contains!3705 lt!316654 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316674)))

(declare-fun b!692969 () Bool)

(declare-fun e!394272 () Bool)

(assert (=> b!692969 (= e!394271 e!394272)))

(declare-fun res!457150 () Bool)

(assert (=> b!692969 (=> res!457150 e!394272)))

(assert (=> b!692969 (= res!457150 (= (h!14169 lt!316654) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692970 () Bool)

(assert (=> b!692970 (= e!394272 (contains!3705 (t!19401 lt!316654) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95741 res!457149) b!692969))

(assert (= (and b!692969 (not res!457150)) b!692970))

(assert (=> d!95741 m!655393))

(declare-fun m!655417 () Bool)

(assert (=> d!95741 m!655417))

(declare-fun m!655419 () Bool)

(assert (=> b!692970 m!655419))

(assert (=> b!692841 d!95741))

(declare-fun d!95743 () Bool)

(assert (=> d!95743 (= ($colon$colon!417 acc!681 (select (arr!19087 a!3626) from!3004)) (Cons!13124 (select (arr!19087 a!3626) from!3004) acc!681))))

(assert (=> b!692819 d!95743))

(check-sat (not b!692958) (not b!692946) (not b!692949) (not b!692962) (not b!692970) (not d!95725) (not b!692924) (not d!95721) (not b!692968) (not bm!34250) (not d!95717) (not bm!34251) (not b!692953) (not b!692961) (not b!692944) (not b!692965) (not d!95709) (not b!692951) (not b!692967) (not b!692959) (not d!95723) (not b!692926) (not d!95741) (not b!692963) (not b!692947) (not d!95707) (not b!692932))
(check-sat)
