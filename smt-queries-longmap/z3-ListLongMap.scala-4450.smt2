; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61790 () Bool)

(assert start!61790)

(declare-fun b!691795 () Bool)

(declare-fun res!456256 () Bool)

(declare-fun e!393556 () Bool)

(assert (=> b!691795 (=> (not res!456256) (not e!393556))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691795 (= res!456256 (validKeyInArray!0 k0!2843))))

(declare-fun b!691796 () Bool)

(declare-fun res!456252 () Bool)

(assert (=> b!691796 (=> (not res!456252) (not e!393556))))

(declare-fun e!393551 () Bool)

(assert (=> b!691796 (= res!456252 e!393551)))

(declare-fun res!456254 () Bool)

(assert (=> b!691796 (=> res!456254 e!393551)))

(declare-fun e!393553 () Bool)

(assert (=> b!691796 (= res!456254 e!393553)))

(declare-fun res!456253 () Bool)

(assert (=> b!691796 (=> (not res!456253) (not e!393553))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691796 (= res!456253 (bvsgt from!3004 i!1382))))

(declare-fun b!691797 () Bool)

(declare-fun res!456243 () Bool)

(assert (=> b!691797 (=> (not res!456243) (not e!393556))))

(declare-datatypes ((array!39822 0))(
  ( (array!39823 (arr!19079 (Array (_ BitVec 32) (_ BitVec 64))) (size!19461 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39822)

(assert (=> b!691797 (= res!456243 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19461 a!3626))))))

(declare-fun b!691798 () Bool)

(declare-fun res!456249 () Bool)

(assert (=> b!691798 (=> (not res!456249) (not e!393556))))

(declare-datatypes ((List!13159 0))(
  ( (Nil!13156) (Cons!13155 (h!14200 (_ BitVec 64)) (t!19417 List!13159)) )
))
(declare-fun acc!681 () List!13159)

(declare-fun contains!3681 (List!13159 (_ BitVec 64)) Bool)

(assert (=> b!691798 (= res!456249 (not (contains!3681 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691800 () Bool)

(declare-fun res!456251 () Bool)

(assert (=> b!691800 (=> (not res!456251) (not e!393556))))

(declare-fun arrayNoDuplicates!0 (array!39822 (_ BitVec 32) List!13159) Bool)

(assert (=> b!691800 (= res!456251 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691801 () Bool)

(declare-fun e!393555 () Bool)

(assert (=> b!691801 (= e!393551 e!393555)))

(declare-fun res!456250 () Bool)

(assert (=> b!691801 (=> (not res!456250) (not e!393555))))

(assert (=> b!691801 (= res!456250 (bvsle from!3004 i!1382))))

(declare-fun e!393552 () Bool)

(declare-fun b!691802 () Bool)

(declare-fun noDuplicate!950 (List!13159) Bool)

(declare-fun $colon$colon!409 (List!13159 (_ BitVec 64)) List!13159)

(assert (=> b!691802 (= e!393552 (not (noDuplicate!950 ($colon$colon!409 acc!681 (select (arr!19079 a!3626) from!3004)))))))

(declare-fun b!691803 () Bool)

(declare-datatypes ((Unit!24416 0))(
  ( (Unit!24417) )
))
(declare-fun e!393557 () Unit!24416)

(declare-fun Unit!24418 () Unit!24416)

(assert (=> b!691803 (= e!393557 Unit!24418)))

(declare-fun arrayContainsKey!0 (array!39822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691803 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316286 () Unit!24416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39822 (_ BitVec 64) (_ BitVec 32)) Unit!24416)

(assert (=> b!691803 (= lt!316286 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!691803 false))

(declare-fun b!691804 () Bool)

(assert (=> b!691804 (= e!393553 (contains!3681 acc!681 k0!2843))))

(declare-fun b!691805 () Bool)

(declare-fun res!456242 () Bool)

(assert (=> b!691805 (=> (not res!456242) (not e!393556))))

(assert (=> b!691805 (= res!456242 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691806 () Bool)

(declare-fun res!456245 () Bool)

(assert (=> b!691806 (=> (not res!456245) (not e!393556))))

(assert (=> b!691806 (= res!456245 (noDuplicate!950 acc!681))))

(declare-fun b!691807 () Bool)

(declare-fun res!456247 () Bool)

(assert (=> b!691807 (=> (not res!456247) (not e!393556))))

(assert (=> b!691807 (= res!456247 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19461 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691799 () Bool)

(declare-fun Unit!24419 () Unit!24416)

(assert (=> b!691799 (= e!393557 Unit!24419)))

(declare-fun res!456241 () Bool)

(assert (=> start!61790 (=> (not res!456241) (not e!393556))))

(assert (=> start!61790 (= res!456241 (and (bvslt (size!19461 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19461 a!3626))))))

(assert (=> start!61790 e!393556))

(assert (=> start!61790 true))

(declare-fun array_inv!14962 (array!39822) Bool)

(assert (=> start!61790 (array_inv!14962 a!3626)))

(declare-fun b!691808 () Bool)

(declare-fun res!456255 () Bool)

(assert (=> b!691808 (=> (not res!456255) (not e!393556))))

(assert (=> b!691808 (= res!456255 (not (contains!3681 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691809 () Bool)

(declare-fun res!456248 () Bool)

(assert (=> b!691809 (=> (not res!456248) (not e!393556))))

(assert (=> b!691809 (= res!456248 (validKeyInArray!0 (select (arr!19079 a!3626) from!3004)))))

(declare-fun b!691810 () Bool)

(declare-fun res!456244 () Bool)

(assert (=> b!691810 (=> (not res!456244) (not e!393556))))

(assert (=> b!691810 (= res!456244 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13156))))

(declare-fun b!691811 () Bool)

(assert (=> b!691811 (= e!393555 (not (contains!3681 acc!681 k0!2843)))))

(declare-fun b!691812 () Bool)

(assert (=> b!691812 (= e!393556 e!393552)))

(declare-fun res!456246 () Bool)

(assert (=> b!691812 (=> (not res!456246) (not e!393552))))

(assert (=> b!691812 (= res!456246 (and (not (= (select (arr!19079 a!3626) from!3004) k0!2843)) (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!316287 () Unit!24416)

(assert (=> b!691812 (= lt!316287 e!393557)))

(declare-fun c!78144 () Bool)

(assert (=> b!691812 (= c!78144 (= (select (arr!19079 a!3626) from!3004) k0!2843))))

(assert (= (and start!61790 res!456241) b!691806))

(assert (= (and b!691806 res!456245) b!691808))

(assert (= (and b!691808 res!456255) b!691798))

(assert (= (and b!691798 res!456249) b!691796))

(assert (= (and b!691796 res!456253) b!691804))

(assert (= (and b!691796 (not res!456254)) b!691801))

(assert (= (and b!691801 res!456250) b!691811))

(assert (= (and b!691796 res!456252) b!691810))

(assert (= (and b!691810 res!456244) b!691800))

(assert (= (and b!691800 res!456251) b!691797))

(assert (= (and b!691797 res!456243) b!691795))

(assert (= (and b!691795 res!456256) b!691805))

(assert (= (and b!691805 res!456242) b!691807))

(assert (= (and b!691807 res!456247) b!691809))

(assert (= (and b!691809 res!456248) b!691812))

(assert (= (and b!691812 c!78144) b!691803))

(assert (= (and b!691812 (not c!78144)) b!691799))

(assert (= (and b!691812 res!456246) b!691802))

(declare-fun m!654015 () Bool)

(assert (=> b!691802 m!654015))

(assert (=> b!691802 m!654015))

(declare-fun m!654017 () Bool)

(assert (=> b!691802 m!654017))

(assert (=> b!691802 m!654017))

(declare-fun m!654019 () Bool)

(assert (=> b!691802 m!654019))

(declare-fun m!654021 () Bool)

(assert (=> start!61790 m!654021))

(declare-fun m!654023 () Bool)

(assert (=> b!691808 m!654023))

(declare-fun m!654025 () Bool)

(assert (=> b!691803 m!654025))

(declare-fun m!654027 () Bool)

(assert (=> b!691803 m!654027))

(declare-fun m!654029 () Bool)

(assert (=> b!691800 m!654029))

(declare-fun m!654031 () Bool)

(assert (=> b!691810 m!654031))

(declare-fun m!654033 () Bool)

(assert (=> b!691795 m!654033))

(declare-fun m!654035 () Bool)

(assert (=> b!691806 m!654035))

(declare-fun m!654037 () Bool)

(assert (=> b!691804 m!654037))

(declare-fun m!654039 () Bool)

(assert (=> b!691805 m!654039))

(assert (=> b!691809 m!654015))

(assert (=> b!691809 m!654015))

(declare-fun m!654041 () Bool)

(assert (=> b!691809 m!654041))

(declare-fun m!654043 () Bool)

(assert (=> b!691798 m!654043))

(assert (=> b!691811 m!654037))

(assert (=> b!691812 m!654015))

(check-sat (not b!691798) (not b!691804) (not b!691795) (not b!691805) (not start!61790) (not b!691810) (not b!691802) (not b!691806) (not b!691808) (not b!691803) (not b!691809) (not b!691800) (not b!691811))
(check-sat)
(get-model)

(declare-fun d!95307 () Bool)

(assert (=> d!95307 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!691795 d!95307))

(declare-fun d!95309 () Bool)

(declare-fun res!456357 () Bool)

(declare-fun e!393604 () Bool)

(assert (=> d!95309 (=> res!456357 e!393604)))

(get-info :version)

(assert (=> d!95309 (= res!456357 ((_ is Nil!13156) acc!681))))

(assert (=> d!95309 (= (noDuplicate!950 acc!681) e!393604)))

(declare-fun b!691925 () Bool)

(declare-fun e!393605 () Bool)

(assert (=> b!691925 (= e!393604 e!393605)))

(declare-fun res!456358 () Bool)

(assert (=> b!691925 (=> (not res!456358) (not e!393605))))

(assert (=> b!691925 (= res!456358 (not (contains!3681 (t!19417 acc!681) (h!14200 acc!681))))))

(declare-fun b!691926 () Bool)

(assert (=> b!691926 (= e!393605 (noDuplicate!950 (t!19417 acc!681)))))

(assert (= (and d!95309 (not res!456357)) b!691925))

(assert (= (and b!691925 res!456358) b!691926))

(declare-fun m!654105 () Bool)

(assert (=> b!691925 m!654105))

(declare-fun m!654107 () Bool)

(assert (=> b!691926 m!654107))

(assert (=> b!691806 d!95309))

(declare-fun b!691937 () Bool)

(declare-fun e!393614 () Bool)

(declare-fun call!34201 () Bool)

(assert (=> b!691937 (= e!393614 call!34201)))

(declare-fun d!95311 () Bool)

(declare-fun res!456367 () Bool)

(declare-fun e!393616 () Bool)

(assert (=> d!95311 (=> res!456367 e!393616)))

(assert (=> d!95311 (= res!456367 (bvsge #b00000000000000000000000000000000 (size!19461 a!3626)))))

(assert (=> d!95311 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13156) e!393616)))

(declare-fun b!691938 () Bool)

(declare-fun e!393617 () Bool)

(assert (=> b!691938 (= e!393617 e!393614)))

(declare-fun c!78153 () Bool)

(assert (=> b!691938 (= c!78153 (validKeyInArray!0 (select (arr!19079 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!691939 () Bool)

(declare-fun e!393615 () Bool)

(assert (=> b!691939 (= e!393615 (contains!3681 Nil!13156 (select (arr!19079 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!691940 () Bool)

(assert (=> b!691940 (= e!393616 e!393617)))

(declare-fun res!456365 () Bool)

(assert (=> b!691940 (=> (not res!456365) (not e!393617))))

(assert (=> b!691940 (= res!456365 (not e!393615))))

(declare-fun res!456366 () Bool)

(assert (=> b!691940 (=> (not res!456366) (not e!393615))))

(assert (=> b!691940 (= res!456366 (validKeyInArray!0 (select (arr!19079 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34198 () Bool)

(assert (=> bm!34198 (= call!34201 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78153 (Cons!13155 (select (arr!19079 a!3626) #b00000000000000000000000000000000) Nil!13156) Nil!13156)))))

(declare-fun b!691941 () Bool)

(assert (=> b!691941 (= e!393614 call!34201)))

(assert (= (and d!95311 (not res!456367)) b!691940))

(assert (= (and b!691940 res!456366) b!691939))

(assert (= (and b!691940 res!456365) b!691938))

(assert (= (and b!691938 c!78153) b!691937))

(assert (= (and b!691938 (not c!78153)) b!691941))

(assert (= (or b!691937 b!691941) bm!34198))

(declare-fun m!654109 () Bool)

(assert (=> b!691938 m!654109))

(assert (=> b!691938 m!654109))

(declare-fun m!654111 () Bool)

(assert (=> b!691938 m!654111))

(assert (=> b!691939 m!654109))

(assert (=> b!691939 m!654109))

(declare-fun m!654113 () Bool)

(assert (=> b!691939 m!654113))

(assert (=> b!691940 m!654109))

(assert (=> b!691940 m!654109))

(assert (=> b!691940 m!654111))

(assert (=> bm!34198 m!654109))

(declare-fun m!654115 () Bool)

(assert (=> bm!34198 m!654115))

(assert (=> b!691810 d!95311))

(declare-fun d!95313 () Bool)

(declare-fun lt!316302 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!308 (List!13159) (InoxSet (_ BitVec 64)))

(assert (=> d!95313 (= lt!316302 (select (content!308 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393622 () Bool)

(assert (=> d!95313 (= lt!316302 e!393622)))

(declare-fun res!456373 () Bool)

(assert (=> d!95313 (=> (not res!456373) (not e!393622))))

(assert (=> d!95313 (= res!456373 ((_ is Cons!13155) acc!681))))

(assert (=> d!95313 (= (contains!3681 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316302)))

(declare-fun b!691946 () Bool)

(declare-fun e!393623 () Bool)

(assert (=> b!691946 (= e!393622 e!393623)))

(declare-fun res!456372 () Bool)

(assert (=> b!691946 (=> res!456372 e!393623)))

(assert (=> b!691946 (= res!456372 (= (h!14200 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!691947 () Bool)

(assert (=> b!691947 (= e!393623 (contains!3681 (t!19417 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95313 res!456373) b!691946))

(assert (= (and b!691946 (not res!456372)) b!691947))

(declare-fun m!654117 () Bool)

(assert (=> d!95313 m!654117))

(declare-fun m!654119 () Bool)

(assert (=> d!95313 m!654119))

(declare-fun m!654121 () Bool)

(assert (=> b!691947 m!654121))

(assert (=> b!691808 d!95313))

(declare-fun d!95315 () Bool)

(assert (=> d!95315 (= (array_inv!14962 a!3626) (bvsge (size!19461 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61790 d!95315))

(declare-fun d!95319 () Bool)

(declare-fun lt!316303 () Bool)

(assert (=> d!95319 (= lt!316303 (select (content!308 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393624 () Bool)

(assert (=> d!95319 (= lt!316303 e!393624)))

(declare-fun res!456375 () Bool)

(assert (=> d!95319 (=> (not res!456375) (not e!393624))))

(assert (=> d!95319 (= res!456375 ((_ is Cons!13155) acc!681))))

(assert (=> d!95319 (= (contains!3681 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316303)))

(declare-fun b!691948 () Bool)

(declare-fun e!393625 () Bool)

(assert (=> b!691948 (= e!393624 e!393625)))

(declare-fun res!456374 () Bool)

(assert (=> b!691948 (=> res!456374 e!393625)))

(assert (=> b!691948 (= res!456374 (= (h!14200 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!691949 () Bool)

(assert (=> b!691949 (= e!393625 (contains!3681 (t!19417 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95319 res!456375) b!691948))

(assert (= (and b!691948 (not res!456374)) b!691949))

(assert (=> d!95319 m!654117))

(declare-fun m!654123 () Bool)

(assert (=> d!95319 m!654123))

(declare-fun m!654125 () Bool)

(assert (=> b!691949 m!654125))

(assert (=> b!691798 d!95319))

(declare-fun d!95321 () Bool)

(assert (=> d!95321 (= (validKeyInArray!0 (select (arr!19079 a!3626) from!3004)) (and (not (= (select (arr!19079 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19079 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!691809 d!95321))

(declare-fun d!95323 () Bool)

(declare-fun res!456376 () Bool)

(declare-fun e!393626 () Bool)

(assert (=> d!95323 (=> res!456376 e!393626)))

(assert (=> d!95323 (= res!456376 ((_ is Nil!13156) ($colon$colon!409 acc!681 (select (arr!19079 a!3626) from!3004))))))

(assert (=> d!95323 (= (noDuplicate!950 ($colon$colon!409 acc!681 (select (arr!19079 a!3626) from!3004))) e!393626)))

(declare-fun b!691950 () Bool)

(declare-fun e!393627 () Bool)

(assert (=> b!691950 (= e!393626 e!393627)))

(declare-fun res!456377 () Bool)

(assert (=> b!691950 (=> (not res!456377) (not e!393627))))

(assert (=> b!691950 (= res!456377 (not (contains!3681 (t!19417 ($colon$colon!409 acc!681 (select (arr!19079 a!3626) from!3004))) (h!14200 ($colon$colon!409 acc!681 (select (arr!19079 a!3626) from!3004))))))))

(declare-fun b!691951 () Bool)

(assert (=> b!691951 (= e!393627 (noDuplicate!950 (t!19417 ($colon$colon!409 acc!681 (select (arr!19079 a!3626) from!3004)))))))

(assert (= (and d!95323 (not res!456376)) b!691950))

(assert (= (and b!691950 res!456377) b!691951))

(declare-fun m!654127 () Bool)

(assert (=> b!691950 m!654127))

(declare-fun m!654129 () Bool)

(assert (=> b!691951 m!654129))

(assert (=> b!691802 d!95323))

(declare-fun d!95325 () Bool)

(assert (=> d!95325 (= ($colon$colon!409 acc!681 (select (arr!19079 a!3626) from!3004)) (Cons!13155 (select (arr!19079 a!3626) from!3004) acc!681))))

(assert (=> b!691802 d!95325))

(declare-fun b!691956 () Bool)

(declare-fun e!393632 () Bool)

(declare-fun call!34202 () Bool)

(assert (=> b!691956 (= e!393632 call!34202)))

(declare-fun d!95327 () Bool)

(declare-fun res!456384 () Bool)

(declare-fun e!393634 () Bool)

(assert (=> d!95327 (=> res!456384 e!393634)))

(assert (=> d!95327 (= res!456384 (bvsge from!3004 (size!19461 a!3626)))))

(assert (=> d!95327 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!393634)))

(declare-fun b!691957 () Bool)

(declare-fun e!393635 () Bool)

(assert (=> b!691957 (= e!393635 e!393632)))

(declare-fun c!78154 () Bool)

(assert (=> b!691957 (= c!78154 (validKeyInArray!0 (select (arr!19079 a!3626) from!3004)))))

(declare-fun e!393633 () Bool)

(declare-fun b!691958 () Bool)

(assert (=> b!691958 (= e!393633 (contains!3681 acc!681 (select (arr!19079 a!3626) from!3004)))))

(declare-fun b!691959 () Bool)

(assert (=> b!691959 (= e!393634 e!393635)))

(declare-fun res!456382 () Bool)

(assert (=> b!691959 (=> (not res!456382) (not e!393635))))

(assert (=> b!691959 (= res!456382 (not e!393633))))

(declare-fun res!456383 () Bool)

(assert (=> b!691959 (=> (not res!456383) (not e!393633))))

(assert (=> b!691959 (= res!456383 (validKeyInArray!0 (select (arr!19079 a!3626) from!3004)))))

(declare-fun bm!34199 () Bool)

(assert (=> bm!34199 (= call!34202 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78154 (Cons!13155 (select (arr!19079 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!691960 () Bool)

(assert (=> b!691960 (= e!393632 call!34202)))

(assert (= (and d!95327 (not res!456384)) b!691959))

(assert (= (and b!691959 res!456383) b!691958))

(assert (= (and b!691959 res!456382) b!691957))

(assert (= (and b!691957 c!78154) b!691956))

(assert (= (and b!691957 (not c!78154)) b!691960))

(assert (= (or b!691956 b!691960) bm!34199))

(assert (=> b!691957 m!654015))

(assert (=> b!691957 m!654015))

(assert (=> b!691957 m!654041))

(assert (=> b!691958 m!654015))

(assert (=> b!691958 m!654015))

(declare-fun m!654131 () Bool)

(assert (=> b!691958 m!654131))

(assert (=> b!691959 m!654015))

(assert (=> b!691959 m!654015))

(assert (=> b!691959 m!654041))

(assert (=> bm!34199 m!654015))

(declare-fun m!654133 () Bool)

(assert (=> bm!34199 m!654133))

(assert (=> b!691800 d!95327))

(declare-fun d!95331 () Bool)

(declare-fun lt!316304 () Bool)

(assert (=> d!95331 (= lt!316304 (select (content!308 acc!681) k0!2843))))

(declare-fun e!393638 () Bool)

(assert (=> d!95331 (= lt!316304 e!393638)))

(declare-fun res!456388 () Bool)

(assert (=> d!95331 (=> (not res!456388) (not e!393638))))

(assert (=> d!95331 (= res!456388 ((_ is Cons!13155) acc!681))))

(assert (=> d!95331 (= (contains!3681 acc!681 k0!2843) lt!316304)))

(declare-fun b!691963 () Bool)

(declare-fun e!393639 () Bool)

(assert (=> b!691963 (= e!393638 e!393639)))

(declare-fun res!456387 () Bool)

(assert (=> b!691963 (=> res!456387 e!393639)))

(assert (=> b!691963 (= res!456387 (= (h!14200 acc!681) k0!2843))))

(declare-fun b!691964 () Bool)

(assert (=> b!691964 (= e!393639 (contains!3681 (t!19417 acc!681) k0!2843))))

(assert (= (and d!95331 res!456388) b!691963))

(assert (= (and b!691963 (not res!456387)) b!691964))

(assert (=> d!95331 m!654117))

(declare-fun m!654139 () Bool)

(assert (=> d!95331 m!654139))

(declare-fun m!654141 () Bool)

(assert (=> b!691964 m!654141))

(assert (=> b!691811 d!95331))

(assert (=> b!691804 d!95331))

(declare-fun d!95335 () Bool)

(declare-fun res!456401 () Bool)

(declare-fun e!393652 () Bool)

(assert (=> d!95335 (=> res!456401 e!393652)))

(assert (=> d!95335 (= res!456401 (= (select (arr!19079 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95335 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!393652)))

(declare-fun b!691977 () Bool)

(declare-fun e!393653 () Bool)

(assert (=> b!691977 (= e!393652 e!393653)))

(declare-fun res!456402 () Bool)

(assert (=> b!691977 (=> (not res!456402) (not e!393653))))

(assert (=> b!691977 (= res!456402 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19461 a!3626)))))

(declare-fun b!691978 () Bool)

(assert (=> b!691978 (= e!393653 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95335 (not res!456401)) b!691977))

(assert (= (and b!691977 res!456402) b!691978))

(assert (=> d!95335 m!654109))

(declare-fun m!654151 () Bool)

(assert (=> b!691978 m!654151))

(assert (=> b!691805 d!95335))

(declare-fun d!95347 () Bool)

(declare-fun res!456403 () Bool)

(declare-fun e!393654 () Bool)

(assert (=> d!95347 (=> res!456403 e!393654)))

(assert (=> d!95347 (= res!456403 (= (select (arr!19079 a!3626) from!3004) k0!2843))))

(assert (=> d!95347 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!393654)))

(declare-fun b!691979 () Bool)

(declare-fun e!393655 () Bool)

(assert (=> b!691979 (= e!393654 e!393655)))

(declare-fun res!456404 () Bool)

(assert (=> b!691979 (=> (not res!456404) (not e!393655))))

(assert (=> b!691979 (= res!456404 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19461 a!3626)))))

(declare-fun b!691980 () Bool)

(assert (=> b!691980 (= e!393655 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95347 (not res!456403)) b!691979))

(assert (= (and b!691979 res!456404) b!691980))

(assert (=> d!95347 m!654015))

(declare-fun m!654153 () Bool)

(assert (=> b!691980 m!654153))

(assert (=> b!691803 d!95347))

(declare-fun d!95349 () Bool)

(assert (=> d!95349 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316307 () Unit!24416)

(declare-fun choose!13 (array!39822 (_ BitVec 64) (_ BitVec 32)) Unit!24416)

(assert (=> d!95349 (= lt!316307 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95349 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95349 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316307)))

(declare-fun bs!20232 () Bool)

(assert (= bs!20232 d!95349))

(assert (=> bs!20232 m!654039))

(declare-fun m!654159 () Bool)

(assert (=> bs!20232 m!654159))

(assert (=> b!691803 d!95349))

(check-sat (not b!691938) (not b!691959) (not b!691939) (not b!691957) (not d!95349) (not b!691940) (not b!691925) (not b!691949) (not b!691926) (not b!691947) (not b!691950) (not b!691980) (not b!691978) (not b!691964) (not d!95319) (not d!95331) (not b!691951) (not d!95313) (not b!691958) (not bm!34198) (not bm!34199))
(check-sat)
