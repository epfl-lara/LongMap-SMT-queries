; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61448 () Bool)

(assert start!61448)

(declare-fun b!687249 () Bool)

(declare-datatypes ((Unit!24215 0))(
  ( (Unit!24216) )
))
(declare-fun e!391416 () Unit!24215)

(declare-fun Unit!24217 () Unit!24215)

(assert (=> b!687249 (= e!391416 Unit!24217)))

(declare-fun lt!315194 () Unit!24215)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39681 0))(
  ( (array!39682 (arr!19013 (Array (_ BitVec 32) (_ BitVec 64))) (size!19391 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39681 (_ BitVec 64) (_ BitVec 32)) Unit!24215)

(assert (=> b!687249 (= lt!315194 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!687249 false))

(declare-fun b!687250 () Bool)

(declare-fun e!391420 () Bool)

(declare-datatypes ((List!13093 0))(
  ( (Nil!13090) (Cons!13089 (h!14134 (_ BitVec 64)) (t!19345 List!13093)) )
))
(declare-fun acc!681 () List!13093)

(declare-fun contains!3615 (List!13093 (_ BitVec 64)) Bool)

(assert (=> b!687250 (= e!391420 (contains!3615 acc!681 k0!2843))))

(declare-fun b!687251 () Bool)

(declare-fun e!391413 () Unit!24215)

(declare-fun Unit!24218 () Unit!24215)

(assert (=> b!687251 (= e!391413 Unit!24218)))

(declare-fun b!687252 () Bool)

(declare-fun e!391414 () Bool)

(assert (=> b!687252 (= e!391414 (not (contains!3615 acc!681 k0!2843)))))

(declare-fun res!452287 () Bool)

(declare-fun e!391412 () Bool)

(assert (=> start!61448 (=> (not res!452287) (not e!391412))))

(assert (=> start!61448 (= res!452287 (and (bvslt (size!19391 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19391 a!3626))))))

(assert (=> start!61448 e!391412))

(assert (=> start!61448 true))

(declare-fun array_inv!14896 (array!39681) Bool)

(assert (=> start!61448 (array_inv!14896 a!3626)))

(declare-fun b!687253 () Bool)

(declare-fun res!452303 () Bool)

(assert (=> b!687253 (=> (not res!452303) (not e!391412))))

(declare-fun arrayNoDuplicates!0 (array!39681 (_ BitVec 32) List!13093) Bool)

(assert (=> b!687253 (= res!452303 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13090))))

(declare-fun b!687254 () Bool)

(declare-fun e!391421 () Bool)

(declare-fun lt!315200 () List!13093)

(assert (=> b!687254 (= e!391421 (contains!3615 lt!315200 k0!2843))))

(declare-fun b!687255 () Bool)

(declare-fun lt!315201 () Unit!24215)

(assert (=> b!687255 (= e!391413 lt!315201)))

(declare-fun lt!315197 () Unit!24215)

(declare-fun lemmaListSubSeqRefl!0 (List!13093) Unit!24215)

(assert (=> b!687255 (= lt!315197 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!218 (List!13093 List!13093) Bool)

(assert (=> b!687255 (subseq!218 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39681 List!13093 List!13093 (_ BitVec 32)) Unit!24215)

(declare-fun $colon$colon!382 (List!13093 (_ BitVec 64)) List!13093)

(assert (=> b!687255 (= lt!315201 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!382 acc!681 (select (arr!19013 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687255 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!687256 () Bool)

(declare-fun res!452285 () Bool)

(declare-fun e!391419 () Bool)

(assert (=> b!687256 (=> res!452285 e!391419)))

(assert (=> b!687256 (= res!452285 (contains!3615 lt!315200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687257 () Bool)

(declare-fun e!391418 () Bool)

(assert (=> b!687257 (= e!391418 e!391414)))

(declare-fun res!452290 () Bool)

(assert (=> b!687257 (=> (not res!452290) (not e!391414))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!687257 (= res!452290 (bvsle from!3004 i!1382))))

(declare-fun b!687258 () Bool)

(declare-fun res!452294 () Bool)

(assert (=> b!687258 (=> (not res!452294) (not e!391412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687258 (= res!452294 (validKeyInArray!0 k0!2843))))

(declare-fun b!687259 () Bool)

(declare-fun e!391415 () Bool)

(assert (=> b!687259 (= e!391419 e!391415)))

(declare-fun res!452291 () Bool)

(assert (=> b!687259 (=> (not res!452291) (not e!391415))))

(assert (=> b!687259 (= res!452291 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687260 () Bool)

(declare-fun res!452286 () Bool)

(assert (=> b!687260 (=> (not res!452286) (not e!391412))))

(assert (=> b!687260 (= res!452286 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19391 a!3626))))))

(declare-fun b!687261 () Bool)

(assert (=> b!687261 (= e!391412 (not e!391419))))

(declare-fun res!452304 () Bool)

(assert (=> b!687261 (=> res!452304 e!391419)))

(assert (=> b!687261 (= res!452304 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!687261 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315200)))

(declare-fun lt!315196 () Unit!24215)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39681 (_ BitVec 64) (_ BitVec 32) List!13093 List!13093) Unit!24215)

(assert (=> b!687261 (= lt!315196 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315200))))

(declare-fun -!183 (List!13093 (_ BitVec 64)) List!13093)

(assert (=> b!687261 (= (-!183 lt!315200 k0!2843) acc!681)))

(assert (=> b!687261 (= lt!315200 ($colon$colon!382 acc!681 k0!2843))))

(declare-fun lt!315195 () Unit!24215)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13093) Unit!24215)

(assert (=> b!687261 (= lt!315195 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!687261 (subseq!218 acc!681 acc!681)))

(declare-fun lt!315193 () Unit!24215)

(assert (=> b!687261 (= lt!315193 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687261 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315199 () Unit!24215)

(assert (=> b!687261 (= lt!315199 e!391413)))

(declare-fun c!77850 () Bool)

(assert (=> b!687261 (= c!77850 (validKeyInArray!0 (select (arr!19013 a!3626) from!3004)))))

(declare-fun lt!315198 () Unit!24215)

(assert (=> b!687261 (= lt!315198 e!391416)))

(declare-fun c!77849 () Bool)

(declare-fun arrayContainsKey!0 (array!39681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687261 (= c!77849 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687261 (arrayContainsKey!0 (array!39682 (store (arr!19013 a!3626) i!1382 k0!2843) (size!19391 a!3626)) k0!2843 from!3004)))

(declare-fun b!687262 () Bool)

(declare-fun res!452296 () Bool)

(assert (=> b!687262 (=> res!452296 e!391419)))

(assert (=> b!687262 (= res!452296 e!391421)))

(declare-fun res!452295 () Bool)

(assert (=> b!687262 (=> (not res!452295) (not e!391421))))

(assert (=> b!687262 (= res!452295 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687263 () Bool)

(declare-fun res!452288 () Bool)

(assert (=> b!687263 (=> (not res!452288) (not e!391412))))

(assert (=> b!687263 (= res!452288 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687264 () Bool)

(declare-fun res!452301 () Bool)

(assert (=> b!687264 (=> (not res!452301) (not e!391412))))

(assert (=> b!687264 (= res!452301 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687265 () Bool)

(declare-fun res!452293 () Bool)

(assert (=> b!687265 (=> res!452293 e!391419)))

(assert (=> b!687265 (= res!452293 (contains!3615 lt!315200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687266 () Bool)

(declare-fun res!452305 () Bool)

(assert (=> b!687266 (=> (not res!452305) (not e!391412))))

(assert (=> b!687266 (= res!452305 (not (contains!3615 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687267 () Bool)

(declare-fun res!452298 () Bool)

(assert (=> b!687267 (=> (not res!452298) (not e!391412))))

(declare-fun noDuplicate!884 (List!13093) Bool)

(assert (=> b!687267 (= res!452298 (noDuplicate!884 acc!681))))

(declare-fun b!687268 () Bool)

(declare-fun Unit!24219 () Unit!24215)

(assert (=> b!687268 (= e!391416 Unit!24219)))

(declare-fun b!687269 () Bool)

(declare-fun res!452300 () Bool)

(assert (=> b!687269 (=> (not res!452300) (not e!391412))))

(assert (=> b!687269 (= res!452300 e!391418)))

(declare-fun res!452302 () Bool)

(assert (=> b!687269 (=> res!452302 e!391418)))

(assert (=> b!687269 (= res!452302 e!391420)))

(declare-fun res!452299 () Bool)

(assert (=> b!687269 (=> (not res!452299) (not e!391420))))

(assert (=> b!687269 (= res!452299 (bvsgt from!3004 i!1382))))

(declare-fun b!687270 () Bool)

(declare-fun res!452289 () Bool)

(assert (=> b!687270 (=> res!452289 e!391419)))

(assert (=> b!687270 (= res!452289 (not (noDuplicate!884 lt!315200)))))

(declare-fun b!687271 () Bool)

(assert (=> b!687271 (= e!391415 (not (contains!3615 lt!315200 k0!2843)))))

(declare-fun b!687272 () Bool)

(declare-fun res!452292 () Bool)

(assert (=> b!687272 (=> (not res!452292) (not e!391412))))

(assert (=> b!687272 (= res!452292 (not (contains!3615 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687273 () Bool)

(declare-fun res!452297 () Bool)

(assert (=> b!687273 (=> (not res!452297) (not e!391412))))

(assert (=> b!687273 (= res!452297 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19391 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!61448 res!452287) b!687267))

(assert (= (and b!687267 res!452298) b!687272))

(assert (= (and b!687272 res!452292) b!687266))

(assert (= (and b!687266 res!452305) b!687269))

(assert (= (and b!687269 res!452299) b!687250))

(assert (= (and b!687269 (not res!452302)) b!687257))

(assert (= (and b!687257 res!452290) b!687252))

(assert (= (and b!687269 res!452300) b!687253))

(assert (= (and b!687253 res!452303) b!687264))

(assert (= (and b!687264 res!452301) b!687260))

(assert (= (and b!687260 res!452286) b!687258))

(assert (= (and b!687258 res!452294) b!687263))

(assert (= (and b!687263 res!452288) b!687273))

(assert (= (and b!687273 res!452297) b!687261))

(assert (= (and b!687261 c!77849) b!687249))

(assert (= (and b!687261 (not c!77849)) b!687268))

(assert (= (and b!687261 c!77850) b!687255))

(assert (= (and b!687261 (not c!77850)) b!687251))

(assert (= (and b!687261 (not res!452304)) b!687270))

(assert (= (and b!687270 (not res!452289)) b!687265))

(assert (= (and b!687265 (not res!452293)) b!687256))

(assert (= (and b!687256 (not res!452285)) b!687262))

(assert (= (and b!687262 res!452295) b!687254))

(assert (= (and b!687262 (not res!452296)) b!687259))

(assert (= (and b!687259 res!452291) b!687271))

(declare-fun m!650787 () Bool)

(assert (=> b!687261 m!650787))

(declare-fun m!650789 () Bool)

(assert (=> b!687261 m!650789))

(declare-fun m!650791 () Bool)

(assert (=> b!687261 m!650791))

(declare-fun m!650793 () Bool)

(assert (=> b!687261 m!650793))

(declare-fun m!650795 () Bool)

(assert (=> b!687261 m!650795))

(declare-fun m!650797 () Bool)

(assert (=> b!687261 m!650797))

(declare-fun m!650799 () Bool)

(assert (=> b!687261 m!650799))

(declare-fun m!650801 () Bool)

(assert (=> b!687261 m!650801))

(declare-fun m!650803 () Bool)

(assert (=> b!687261 m!650803))

(declare-fun m!650805 () Bool)

(assert (=> b!687261 m!650805))

(assert (=> b!687261 m!650791))

(declare-fun m!650807 () Bool)

(assert (=> b!687261 m!650807))

(declare-fun m!650809 () Bool)

(assert (=> b!687261 m!650809))

(declare-fun m!650811 () Bool)

(assert (=> b!687261 m!650811))

(declare-fun m!650813 () Bool)

(assert (=> b!687272 m!650813))

(declare-fun m!650815 () Bool)

(assert (=> b!687253 m!650815))

(declare-fun m!650817 () Bool)

(assert (=> b!687250 m!650817))

(declare-fun m!650819 () Bool)

(assert (=> b!687258 m!650819))

(declare-fun m!650821 () Bool)

(assert (=> b!687249 m!650821))

(declare-fun m!650823 () Bool)

(assert (=> start!61448 m!650823))

(assert (=> b!687255 m!650789))

(assert (=> b!687255 m!650791))

(declare-fun m!650825 () Bool)

(assert (=> b!687255 m!650825))

(declare-fun m!650827 () Bool)

(assert (=> b!687255 m!650827))

(assert (=> b!687255 m!650791))

(assert (=> b!687255 m!650825))

(assert (=> b!687255 m!650799))

(assert (=> b!687255 m!650811))

(declare-fun m!650829 () Bool)

(assert (=> b!687263 m!650829))

(declare-fun m!650831 () Bool)

(assert (=> b!687265 m!650831))

(declare-fun m!650833 () Bool)

(assert (=> b!687254 m!650833))

(assert (=> b!687271 m!650833))

(declare-fun m!650835 () Bool)

(assert (=> b!687264 m!650835))

(declare-fun m!650837 () Bool)

(assert (=> b!687267 m!650837))

(assert (=> b!687252 m!650817))

(declare-fun m!650839 () Bool)

(assert (=> b!687266 m!650839))

(declare-fun m!650841 () Bool)

(assert (=> b!687256 m!650841))

(declare-fun m!650843 () Bool)

(assert (=> b!687270 m!650843))

(check-sat (not b!687271) (not b!687265) (not start!61448) (not b!687250) (not b!687264) (not b!687254) (not b!687249) (not b!687255) (not b!687266) (not b!687261) (not b!687263) (not b!687256) (not b!687267) (not b!687270) (not b!687253) (not b!687258) (not b!687272) (not b!687252))
(check-sat)
(get-model)

(declare-fun d!94855 () Bool)

(declare-fun lt!315258 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!299 (List!13093) (InoxSet (_ BitVec 64)))

(assert (=> d!94855 (= lt!315258 (select (content!299 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391486 () Bool)

(assert (=> d!94855 (= lt!315258 e!391486)))

(declare-fun res!452437 () Bool)

(assert (=> d!94855 (=> (not res!452437) (not e!391486))))

(get-info :version)

(assert (=> d!94855 (= res!452437 ((_ is Cons!13089) acc!681))))

(assert (=> d!94855 (= (contains!3615 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315258)))

(declare-fun b!687428 () Bool)

(declare-fun e!391487 () Bool)

(assert (=> b!687428 (= e!391486 e!391487)))

(declare-fun res!452436 () Bool)

(assert (=> b!687428 (=> res!452436 e!391487)))

(assert (=> b!687428 (= res!452436 (= (h!14134 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687429 () Bool)

(assert (=> b!687429 (= e!391487 (contains!3615 (t!19345 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94855 res!452437) b!687428))

(assert (= (and b!687428 (not res!452436)) b!687429))

(declare-fun m!650961 () Bool)

(assert (=> d!94855 m!650961))

(declare-fun m!650963 () Bool)

(assert (=> d!94855 m!650963))

(declare-fun m!650965 () Bool)

(assert (=> b!687429 m!650965))

(assert (=> b!687266 d!94855))

(declare-fun d!94857 () Bool)

(assert (=> d!94857 (= ($colon$colon!382 acc!681 (select (arr!19013 a!3626) from!3004)) (Cons!13089 (select (arr!19013 a!3626) from!3004) acc!681))))

(assert (=> b!687255 d!94857))

(declare-fun b!687440 () Bool)

(declare-fun e!391498 () Bool)

(assert (=> b!687440 (= e!391498 (subseq!218 (t!19345 acc!681) (t!19345 acc!681)))))

(declare-fun b!687438 () Bool)

(declare-fun e!391497 () Bool)

(declare-fun e!391499 () Bool)

(assert (=> b!687438 (= e!391497 e!391499)))

(declare-fun res!452448 () Bool)

(assert (=> b!687438 (=> (not res!452448) (not e!391499))))

(assert (=> b!687438 (= res!452448 ((_ is Cons!13089) acc!681))))

(declare-fun b!687439 () Bool)

(declare-fun e!391496 () Bool)

(assert (=> b!687439 (= e!391499 e!391496)))

(declare-fun res!452449 () Bool)

(assert (=> b!687439 (=> res!452449 e!391496)))

(assert (=> b!687439 (= res!452449 e!391498)))

(declare-fun res!452447 () Bool)

(assert (=> b!687439 (=> (not res!452447) (not e!391498))))

(assert (=> b!687439 (= res!452447 (= (h!14134 acc!681) (h!14134 acc!681)))))

(declare-fun b!687441 () Bool)

(assert (=> b!687441 (= e!391496 (subseq!218 acc!681 (t!19345 acc!681)))))

(declare-fun d!94859 () Bool)

(declare-fun res!452446 () Bool)

(assert (=> d!94859 (=> res!452446 e!391497)))

(assert (=> d!94859 (= res!452446 ((_ is Nil!13090) acc!681))))

(assert (=> d!94859 (= (subseq!218 acc!681 acc!681) e!391497)))

(assert (= (and d!94859 (not res!452446)) b!687438))

(assert (= (and b!687438 res!452448) b!687439))

(assert (= (and b!687439 res!452447) b!687440))

(assert (= (and b!687439 (not res!452449)) b!687441))

(declare-fun m!650967 () Bool)

(assert (=> b!687440 m!650967))

(declare-fun m!650969 () Bool)

(assert (=> b!687441 m!650969))

(assert (=> b!687255 d!94859))

(declare-fun d!94863 () Bool)

(assert (=> d!94863 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315264 () Unit!24215)

(declare-fun choose!80 (array!39681 List!13093 List!13093 (_ BitVec 32)) Unit!24215)

(assert (=> d!94863 (= lt!315264 (choose!80 a!3626 ($colon$colon!382 acc!681 (select (arr!19013 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94863 (bvslt (size!19391 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94863 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!382 acc!681 (select (arr!19013 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315264)))

(declare-fun bs!20137 () Bool)

(assert (= bs!20137 d!94863))

(assert (=> bs!20137 m!650789))

(assert (=> bs!20137 m!650825))

(declare-fun m!650973 () Bool)

(assert (=> bs!20137 m!650973))

(assert (=> b!687255 d!94863))

(declare-fun d!94871 () Bool)

(assert (=> d!94871 (subseq!218 acc!681 acc!681)))

(declare-fun lt!315267 () Unit!24215)

(declare-fun choose!36 (List!13093) Unit!24215)

(assert (=> d!94871 (= lt!315267 (choose!36 acc!681))))

(assert (=> d!94871 (= (lemmaListSubSeqRefl!0 acc!681) lt!315267)))

(declare-fun bs!20138 () Bool)

(assert (= bs!20138 d!94871))

(assert (=> bs!20138 m!650811))

(declare-fun m!650975 () Bool)

(assert (=> bs!20138 m!650975))

(assert (=> b!687255 d!94871))

(declare-fun b!687482 () Bool)

(declare-fun e!391539 () Bool)

(declare-fun e!391541 () Bool)

(assert (=> b!687482 (= e!391539 e!391541)))

(declare-fun c!77865 () Bool)

(assert (=> b!687482 (= c!77865 (validKeyInArray!0 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687483 () Bool)

(declare-fun call!34129 () Bool)

(assert (=> b!687483 (= e!391541 call!34129)))

(declare-fun b!687484 () Bool)

(assert (=> b!687484 (= e!391541 call!34129)))

(declare-fun b!687485 () Bool)

(declare-fun e!391540 () Bool)

(assert (=> b!687485 (= e!391540 e!391539)))

(declare-fun res!452487 () Bool)

(assert (=> b!687485 (=> (not res!452487) (not e!391539))))

(declare-fun e!391538 () Bool)

(assert (=> b!687485 (= res!452487 (not e!391538))))

(declare-fun res!452488 () Bool)

(assert (=> b!687485 (=> (not res!452488) (not e!391538))))

(assert (=> b!687485 (= res!452488 (validKeyInArray!0 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94873 () Bool)

(declare-fun res!452486 () Bool)

(assert (=> d!94873 (=> res!452486 e!391540)))

(assert (=> d!94873 (= res!452486 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19391 a!3626)))))

(assert (=> d!94873 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391540)))

(declare-fun bm!34126 () Bool)

(assert (=> bm!34126 (= call!34129 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77865 (Cons!13089 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687486 () Bool)

(assert (=> b!687486 (= e!391538 (contains!3615 acc!681 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94873 (not res!452486)) b!687485))

(assert (= (and b!687485 res!452488) b!687486))

(assert (= (and b!687485 res!452487) b!687482))

(assert (= (and b!687482 c!77865) b!687484))

(assert (= (and b!687482 (not c!77865)) b!687483))

(assert (= (or b!687484 b!687483) bm!34126))

(declare-fun m!651007 () Bool)

(assert (=> b!687482 m!651007))

(assert (=> b!687482 m!651007))

(declare-fun m!651009 () Bool)

(assert (=> b!687482 m!651009))

(assert (=> b!687485 m!651007))

(assert (=> b!687485 m!651007))

(assert (=> b!687485 m!651009))

(assert (=> bm!34126 m!651007))

(declare-fun m!651013 () Bool)

(assert (=> bm!34126 m!651013))

(assert (=> b!687486 m!651007))

(assert (=> b!687486 m!651007))

(declare-fun m!651015 () Bool)

(assert (=> b!687486 m!651015))

(assert (=> b!687255 d!94873))

(declare-fun d!94893 () Bool)

(declare-fun lt!315280 () Bool)

(assert (=> d!94893 (= lt!315280 (select (content!299 lt!315200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391542 () Bool)

(assert (=> d!94893 (= lt!315280 e!391542)))

(declare-fun res!452490 () Bool)

(assert (=> d!94893 (=> (not res!452490) (not e!391542))))

(assert (=> d!94893 (= res!452490 ((_ is Cons!13089) lt!315200))))

(assert (=> d!94893 (= (contains!3615 lt!315200 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315280)))

(declare-fun b!687487 () Bool)

(declare-fun e!391543 () Bool)

(assert (=> b!687487 (= e!391542 e!391543)))

(declare-fun res!452489 () Bool)

(assert (=> b!687487 (=> res!452489 e!391543)))

(assert (=> b!687487 (= res!452489 (= (h!14134 lt!315200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687488 () Bool)

(assert (=> b!687488 (= e!391543 (contains!3615 (t!19345 lt!315200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94893 res!452490) b!687487))

(assert (= (and b!687487 (not res!452489)) b!687488))

(declare-fun m!651017 () Bool)

(assert (=> d!94893 m!651017))

(declare-fun m!651019 () Bool)

(assert (=> d!94893 m!651019))

(declare-fun m!651021 () Bool)

(assert (=> b!687488 m!651021))

(assert (=> b!687265 d!94893))

(declare-fun d!94895 () Bool)

(declare-fun lt!315281 () Bool)

(assert (=> d!94895 (= lt!315281 (select (content!299 lt!315200) k0!2843))))

(declare-fun e!391544 () Bool)

(assert (=> d!94895 (= lt!315281 e!391544)))

(declare-fun res!452492 () Bool)

(assert (=> d!94895 (=> (not res!452492) (not e!391544))))

(assert (=> d!94895 (= res!452492 ((_ is Cons!13089) lt!315200))))

(assert (=> d!94895 (= (contains!3615 lt!315200 k0!2843) lt!315281)))

(declare-fun b!687489 () Bool)

(declare-fun e!391545 () Bool)

(assert (=> b!687489 (= e!391544 e!391545)))

(declare-fun res!452491 () Bool)

(assert (=> b!687489 (=> res!452491 e!391545)))

(assert (=> b!687489 (= res!452491 (= (h!14134 lt!315200) k0!2843))))

(declare-fun b!687490 () Bool)

(assert (=> b!687490 (= e!391545 (contains!3615 (t!19345 lt!315200) k0!2843))))

(assert (= (and d!94895 res!452492) b!687489))

(assert (= (and b!687489 (not res!452491)) b!687490))

(assert (=> d!94895 m!651017))

(declare-fun m!651023 () Bool)

(assert (=> d!94895 m!651023))

(declare-fun m!651025 () Bool)

(assert (=> b!687490 m!651025))

(assert (=> b!687254 d!94895))

(declare-fun b!687491 () Bool)

(declare-fun e!391547 () Bool)

(declare-fun e!391549 () Bool)

(assert (=> b!687491 (= e!391547 e!391549)))

(declare-fun c!77866 () Bool)

(assert (=> b!687491 (= c!77866 (validKeyInArray!0 (select (arr!19013 a!3626) from!3004)))))

(declare-fun b!687492 () Bool)

(declare-fun call!34130 () Bool)

(assert (=> b!687492 (= e!391549 call!34130)))

(declare-fun b!687493 () Bool)

(assert (=> b!687493 (= e!391549 call!34130)))

(declare-fun b!687494 () Bool)

(declare-fun e!391548 () Bool)

(assert (=> b!687494 (= e!391548 e!391547)))

(declare-fun res!452494 () Bool)

(assert (=> b!687494 (=> (not res!452494) (not e!391547))))

(declare-fun e!391546 () Bool)

(assert (=> b!687494 (= res!452494 (not e!391546))))

(declare-fun res!452495 () Bool)

(assert (=> b!687494 (=> (not res!452495) (not e!391546))))

(assert (=> b!687494 (= res!452495 (validKeyInArray!0 (select (arr!19013 a!3626) from!3004)))))

(declare-fun d!94897 () Bool)

(declare-fun res!452493 () Bool)

(assert (=> d!94897 (=> res!452493 e!391548)))

(assert (=> d!94897 (= res!452493 (bvsge from!3004 (size!19391 a!3626)))))

(assert (=> d!94897 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391548)))

(declare-fun bm!34127 () Bool)

(assert (=> bm!34127 (= call!34130 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77866 (Cons!13089 (select (arr!19013 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687495 () Bool)

(assert (=> b!687495 (= e!391546 (contains!3615 acc!681 (select (arr!19013 a!3626) from!3004)))))

(assert (= (and d!94897 (not res!452493)) b!687494))

(assert (= (and b!687494 res!452495) b!687495))

(assert (= (and b!687494 res!452494) b!687491))

(assert (= (and b!687491 c!77866) b!687493))

(assert (= (and b!687491 (not c!77866)) b!687492))

(assert (= (or b!687493 b!687492) bm!34127))

(assert (=> b!687491 m!650791))

(assert (=> b!687491 m!650791))

(assert (=> b!687491 m!650807))

(assert (=> b!687494 m!650791))

(assert (=> b!687494 m!650791))

(assert (=> b!687494 m!650807))

(assert (=> bm!34127 m!650791))

(declare-fun m!651029 () Bool)

(assert (=> bm!34127 m!651029))

(assert (=> b!687495 m!650791))

(assert (=> b!687495 m!650791))

(declare-fun m!651031 () Bool)

(assert (=> b!687495 m!651031))

(assert (=> b!687264 d!94897))

(declare-fun d!94901 () Bool)

(assert (=> d!94901 (= (array_inv!14896 a!3626) (bvsge (size!19391 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61448 d!94901))

(declare-fun d!94905 () Bool)

(assert (=> d!94905 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687258 d!94905))

(declare-fun d!94907 () Bool)

(declare-fun res!452514 () Bool)

(declare-fun e!391570 () Bool)

(assert (=> d!94907 (=> res!452514 e!391570)))

(assert (=> d!94907 (= res!452514 ((_ is Nil!13090) acc!681))))

(assert (=> d!94907 (= (noDuplicate!884 acc!681) e!391570)))

(declare-fun b!687518 () Bool)

(declare-fun e!391571 () Bool)

(assert (=> b!687518 (= e!391570 e!391571)))

(declare-fun res!452515 () Bool)

(assert (=> b!687518 (=> (not res!452515) (not e!391571))))

(assert (=> b!687518 (= res!452515 (not (contains!3615 (t!19345 acc!681) (h!14134 acc!681))))))

(declare-fun b!687519 () Bool)

(assert (=> b!687519 (= e!391571 (noDuplicate!884 (t!19345 acc!681)))))

(assert (= (and d!94907 (not res!452514)) b!687518))

(assert (= (and b!687518 res!452515) b!687519))

(declare-fun m!651033 () Bool)

(assert (=> b!687518 m!651033))

(declare-fun m!651035 () Bool)

(assert (=> b!687519 m!651035))

(assert (=> b!687267 d!94907))

(declare-fun d!94909 () Bool)

(declare-fun lt!315285 () Bool)

(assert (=> d!94909 (= lt!315285 (select (content!299 lt!315200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391572 () Bool)

(assert (=> d!94909 (= lt!315285 e!391572)))

(declare-fun res!452517 () Bool)

(assert (=> d!94909 (=> (not res!452517) (not e!391572))))

(assert (=> d!94909 (= res!452517 ((_ is Cons!13089) lt!315200))))

(assert (=> d!94909 (= (contains!3615 lt!315200 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315285)))

(declare-fun b!687520 () Bool)

(declare-fun e!391573 () Bool)

(assert (=> b!687520 (= e!391572 e!391573)))

(declare-fun res!452516 () Bool)

(assert (=> b!687520 (=> res!452516 e!391573)))

(assert (=> b!687520 (= res!452516 (= (h!14134 lt!315200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687521 () Bool)

(assert (=> b!687521 (= e!391573 (contains!3615 (t!19345 lt!315200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94909 res!452517) b!687520))

(assert (= (and b!687520 (not res!452516)) b!687521))

(assert (=> d!94909 m!651017))

(declare-fun m!651037 () Bool)

(assert (=> d!94909 m!651037))

(declare-fun m!651039 () Bool)

(assert (=> b!687521 m!651039))

(assert (=> b!687256 d!94909))

(assert (=> b!687261 d!94859))

(declare-fun d!94911 () Bool)

(declare-fun res!452529 () Bool)

(declare-fun e!391586 () Bool)

(assert (=> d!94911 (=> res!452529 e!391586)))

(assert (=> d!94911 (= res!452529 (= (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94911 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391586)))

(declare-fun b!687535 () Bool)

(declare-fun e!391587 () Bool)

(assert (=> b!687535 (= e!391586 e!391587)))

(declare-fun res!452530 () Bool)

(assert (=> b!687535 (=> (not res!452530) (not e!391587))))

(assert (=> b!687535 (= res!452530 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19391 a!3626)))))

(declare-fun b!687536 () Bool)

(assert (=> b!687536 (= e!391587 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94911 (not res!452529)) b!687535))

(assert (= (and b!687535 res!452530) b!687536))

(assert (=> d!94911 m!651007))

(declare-fun m!651053 () Bool)

(assert (=> b!687536 m!651053))

(assert (=> b!687261 d!94911))

(declare-fun d!94917 () Bool)

(assert (=> d!94917 (= (-!183 ($colon$colon!382 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!315298 () Unit!24215)

(declare-fun choose!16 ((_ BitVec 64) List!13093) Unit!24215)

(assert (=> d!94917 (= lt!315298 (choose!16 k0!2843 acc!681))))

(assert (=> d!94917 (not (contains!3615 acc!681 k0!2843))))

(assert (=> d!94917 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!315298)))

(declare-fun bs!20144 () Bool)

(assert (= bs!20144 d!94917))

(assert (=> bs!20144 m!650803))

(assert (=> bs!20144 m!650803))

(declare-fun m!651071 () Bool)

(assert (=> bs!20144 m!651071))

(declare-fun m!651073 () Bool)

(assert (=> bs!20144 m!651073))

(assert (=> bs!20144 m!650817))

(assert (=> b!687261 d!94917))

(declare-fun d!94927 () Bool)

(declare-fun res!452542 () Bool)

(declare-fun e!391600 () Bool)

(assert (=> d!94927 (=> res!452542 e!391600)))

(assert (=> d!94927 (= res!452542 (= (select (arr!19013 (array!39682 (store (arr!19013 a!3626) i!1382 k0!2843) (size!19391 a!3626))) from!3004) k0!2843))))

(assert (=> d!94927 (= (arrayContainsKey!0 (array!39682 (store (arr!19013 a!3626) i!1382 k0!2843) (size!19391 a!3626)) k0!2843 from!3004) e!391600)))

(declare-fun b!687550 () Bool)

(declare-fun e!391601 () Bool)

(assert (=> b!687550 (= e!391600 e!391601)))

(declare-fun res!452543 () Bool)

(assert (=> b!687550 (=> (not res!452543) (not e!391601))))

(assert (=> b!687550 (= res!452543 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19391 (array!39682 (store (arr!19013 a!3626) i!1382 k0!2843) (size!19391 a!3626)))))))

(declare-fun b!687551 () Bool)

(assert (=> b!687551 (= e!391601 (arrayContainsKey!0 (array!39682 (store (arr!19013 a!3626) i!1382 k0!2843) (size!19391 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94927 (not res!452542)) b!687550))

(assert (= (and b!687550 res!452543) b!687551))

(declare-fun m!651079 () Bool)

(assert (=> d!94927 m!651079))

(declare-fun m!651081 () Bool)

(assert (=> b!687551 m!651081))

(assert (=> b!687261 d!94927))

(assert (=> b!687261 d!94871))

(declare-fun d!94931 () Bool)

(assert (=> d!94931 (= (validKeyInArray!0 (select (arr!19013 a!3626) from!3004)) (and (not (= (select (arr!19013 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19013 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687261 d!94931))

(declare-fun d!94934 () Bool)

(assert (=> d!94934 (= ($colon$colon!382 acc!681 k0!2843) (Cons!13089 k0!2843 acc!681))))

(assert (=> b!687261 d!94934))

(assert (=> b!687261 d!94873))

(declare-fun b!687554 () Bool)

(declare-fun e!391605 () Bool)

(declare-fun e!391607 () Bool)

(assert (=> b!687554 (= e!391605 e!391607)))

(declare-fun c!77871 () Bool)

(assert (=> b!687554 (= c!77871 (validKeyInArray!0 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687555 () Bool)

(declare-fun call!34135 () Bool)

(assert (=> b!687555 (= e!391607 call!34135)))

(declare-fun b!687556 () Bool)

(assert (=> b!687556 (= e!391607 call!34135)))

(declare-fun b!687557 () Bool)

(declare-fun e!391606 () Bool)

(assert (=> b!687557 (= e!391606 e!391605)))

(declare-fun res!452547 () Bool)

(assert (=> b!687557 (=> (not res!452547) (not e!391605))))

(declare-fun e!391604 () Bool)

(assert (=> b!687557 (= res!452547 (not e!391604))))

(declare-fun res!452548 () Bool)

(assert (=> b!687557 (=> (not res!452548) (not e!391604))))

(assert (=> b!687557 (= res!452548 (validKeyInArray!0 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94937 () Bool)

(declare-fun res!452546 () Bool)

(assert (=> d!94937 (=> res!452546 e!391606)))

(assert (=> d!94937 (= res!452546 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19391 a!3626)))))

(assert (=> d!94937 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315200) e!391606)))

(declare-fun bm!34132 () Bool)

(assert (=> bm!34132 (= call!34135 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77871 (Cons!13089 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315200) lt!315200)))))

(declare-fun b!687558 () Bool)

(assert (=> b!687558 (= e!391604 (contains!3615 lt!315200 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94937 (not res!452546)) b!687557))

(assert (= (and b!687557 res!452548) b!687558))

(assert (= (and b!687557 res!452547) b!687554))

(assert (= (and b!687554 c!77871) b!687556))

(assert (= (and b!687554 (not c!77871)) b!687555))

(assert (= (or b!687556 b!687555) bm!34132))

(assert (=> b!687554 m!651007))

(assert (=> b!687554 m!651007))

(assert (=> b!687554 m!651009))

(assert (=> b!687557 m!651007))

(assert (=> b!687557 m!651007))

(assert (=> b!687557 m!651009))

(assert (=> bm!34132 m!651007))

(declare-fun m!651087 () Bool)

(assert (=> bm!34132 m!651087))

(assert (=> b!687558 m!651007))

(assert (=> b!687558 m!651007))

(declare-fun m!651089 () Bool)

(assert (=> b!687558 m!651089))

(assert (=> b!687261 d!94937))

(declare-fun b!687614 () Bool)

(declare-fun e!391655 () List!13093)

(assert (=> b!687614 (= e!391655 Nil!13090)))

(declare-fun d!94939 () Bool)

(declare-fun e!391656 () Bool)

(assert (=> d!94939 e!391656))

(declare-fun res!452586 () Bool)

(assert (=> d!94939 (=> (not res!452586) (not e!391656))))

(declare-fun lt!315305 () List!13093)

(declare-fun size!19394 (List!13093) Int)

(assert (=> d!94939 (= res!452586 (<= (size!19394 lt!315305) (size!19394 lt!315200)))))

(assert (=> d!94939 (= lt!315305 e!391655)))

(declare-fun c!77882 () Bool)

(assert (=> d!94939 (= c!77882 ((_ is Cons!13089) lt!315200))))

(assert (=> d!94939 (= (-!183 lt!315200 k0!2843) lt!315305)))

(declare-fun b!687615 () Bool)

(declare-fun e!391657 () List!13093)

(declare-fun call!34143 () List!13093)

(assert (=> b!687615 (= e!391657 call!34143)))

(declare-fun b!687616 () Bool)

(assert (=> b!687616 (= e!391655 e!391657)))

(declare-fun c!77881 () Bool)

(assert (=> b!687616 (= c!77881 (= k0!2843 (h!14134 lt!315200)))))

(declare-fun bm!34140 () Bool)

(assert (=> bm!34140 (= call!34143 (-!183 (t!19345 lt!315200) k0!2843))))

(declare-fun b!687617 () Bool)

(assert (=> b!687617 (= e!391657 (Cons!13089 (h!14134 lt!315200) call!34143))))

(declare-fun b!687618 () Bool)

(assert (=> b!687618 (= e!391656 (= (content!299 lt!315305) ((_ map and) (content!299 lt!315200) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(assert (= (and d!94939 c!77882) b!687616))

(assert (= (and d!94939 (not c!77882)) b!687614))

(assert (= (and b!687616 c!77881) b!687615))

(assert (= (and b!687616 (not c!77881)) b!687617))

(assert (= (or b!687615 b!687617) bm!34140))

(assert (= (and d!94939 res!452586) b!687618))

(declare-fun m!651135 () Bool)

(assert (=> d!94939 m!651135))

(declare-fun m!651137 () Bool)

(assert (=> d!94939 m!651137))

(declare-fun m!651139 () Bool)

(assert (=> bm!34140 m!651139))

(declare-fun m!651141 () Bool)

(assert (=> b!687618 m!651141))

(assert (=> b!687618 m!651017))

(declare-fun m!651143 () Bool)

(assert (=> b!687618 m!651143))

(assert (=> b!687261 d!94939))

(declare-fun d!94963 () Bool)

(assert (=> d!94963 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315200)))

(declare-fun lt!315309 () Unit!24215)

(declare-fun choose!66 (array!39681 (_ BitVec 64) (_ BitVec 32) List!13093 List!13093) Unit!24215)

(assert (=> d!94963 (= lt!315309 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315200))))

(assert (=> d!94963 (bvslt (size!19391 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94963 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315200) lt!315309)))

(declare-fun bs!20145 () Bool)

(assert (= bs!20145 d!94963))

(assert (=> bs!20145 m!650795))

(declare-fun m!651161 () Bool)

(assert (=> bs!20145 m!651161))

(assert (=> b!687261 d!94963))

(declare-fun d!94975 () Bool)

(declare-fun lt!315310 () Bool)

(assert (=> d!94975 (= lt!315310 (select (content!299 acc!681) k0!2843))))

(declare-fun e!391676 () Bool)

(assert (=> d!94975 (= lt!315310 e!391676)))

(declare-fun res!452604 () Bool)

(assert (=> d!94975 (=> (not res!452604) (not e!391676))))

(assert (=> d!94975 (= res!452604 ((_ is Cons!13089) acc!681))))

(assert (=> d!94975 (= (contains!3615 acc!681 k0!2843) lt!315310)))

(declare-fun b!687639 () Bool)

(declare-fun e!391677 () Bool)

(assert (=> b!687639 (= e!391676 e!391677)))

(declare-fun res!452603 () Bool)

(assert (=> b!687639 (=> res!452603 e!391677)))

(assert (=> b!687639 (= res!452603 (= (h!14134 acc!681) k0!2843))))

(declare-fun b!687640 () Bool)

(assert (=> b!687640 (= e!391677 (contains!3615 (t!19345 acc!681) k0!2843))))

(assert (= (and d!94975 res!452604) b!687639))

(assert (= (and b!687639 (not res!452603)) b!687640))

(assert (=> d!94975 m!650961))

(declare-fun m!651165 () Bool)

(assert (=> d!94975 m!651165))

(declare-fun m!651167 () Bool)

(assert (=> b!687640 m!651167))

(assert (=> b!687250 d!94975))

(assert (=> b!687271 d!94895))

(declare-fun d!94979 () Bool)

(assert (=> d!94979 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315316 () Unit!24215)

(declare-fun choose!13 (array!39681 (_ BitVec 64) (_ BitVec 32)) Unit!24215)

(assert (=> d!94979 (= lt!315316 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94979 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94979 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!315316)))

(declare-fun bs!20146 () Bool)

(assert (= bs!20146 d!94979))

(assert (=> bs!20146 m!650829))

(declare-fun m!651173 () Bool)

(assert (=> bs!20146 m!651173))

(assert (=> b!687249 d!94979))

(declare-fun d!94983 () Bool)

(declare-fun res!452607 () Bool)

(declare-fun e!391680 () Bool)

(assert (=> d!94983 (=> res!452607 e!391680)))

(assert (=> d!94983 (= res!452607 ((_ is Nil!13090) lt!315200))))

(assert (=> d!94983 (= (noDuplicate!884 lt!315200) e!391680)))

(declare-fun b!687643 () Bool)

(declare-fun e!391681 () Bool)

(assert (=> b!687643 (= e!391680 e!391681)))

(declare-fun res!452608 () Bool)

(assert (=> b!687643 (=> (not res!452608) (not e!391681))))

(assert (=> b!687643 (= res!452608 (not (contains!3615 (t!19345 lt!315200) (h!14134 lt!315200))))))

(declare-fun b!687644 () Bool)

(assert (=> b!687644 (= e!391681 (noDuplicate!884 (t!19345 lt!315200)))))

(assert (= (and d!94983 (not res!452607)) b!687643))

(assert (= (and b!687643 res!452608) b!687644))

(declare-fun m!651179 () Bool)

(assert (=> b!687643 m!651179))

(declare-fun m!651181 () Bool)

(assert (=> b!687644 m!651181))

(assert (=> b!687270 d!94983))

(declare-fun b!687647 () Bool)

(declare-fun e!391685 () Bool)

(declare-fun e!391687 () Bool)

(assert (=> b!687647 (= e!391685 e!391687)))

(declare-fun c!77885 () Bool)

(assert (=> b!687647 (= c!77885 (validKeyInArray!0 (select (arr!19013 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687648 () Bool)

(declare-fun call!34146 () Bool)

(assert (=> b!687648 (= e!391687 call!34146)))

(declare-fun b!687649 () Bool)

(assert (=> b!687649 (= e!391687 call!34146)))

(declare-fun b!687650 () Bool)

(declare-fun e!391686 () Bool)

(assert (=> b!687650 (= e!391686 e!391685)))

(declare-fun res!452612 () Bool)

(assert (=> b!687650 (=> (not res!452612) (not e!391685))))

(declare-fun e!391684 () Bool)

(assert (=> b!687650 (= res!452612 (not e!391684))))

(declare-fun res!452613 () Bool)

(assert (=> b!687650 (=> (not res!452613) (not e!391684))))

(assert (=> b!687650 (= res!452613 (validKeyInArray!0 (select (arr!19013 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94987 () Bool)

(declare-fun res!452611 () Bool)

(assert (=> d!94987 (=> res!452611 e!391686)))

(assert (=> d!94987 (= res!452611 (bvsge #b00000000000000000000000000000000 (size!19391 a!3626)))))

(assert (=> d!94987 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13090) e!391686)))

(declare-fun bm!34143 () Bool)

(assert (=> bm!34143 (= call!34146 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77885 (Cons!13089 (select (arr!19013 a!3626) #b00000000000000000000000000000000) Nil!13090) Nil!13090)))))

(declare-fun b!687651 () Bool)

(assert (=> b!687651 (= e!391684 (contains!3615 Nil!13090 (select (arr!19013 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94987 (not res!452611)) b!687650))

(assert (= (and b!687650 res!452613) b!687651))

(assert (= (and b!687650 res!452612) b!687647))

(assert (= (and b!687647 c!77885) b!687649))

(assert (= (and b!687647 (not c!77885)) b!687648))

(assert (= (or b!687649 b!687648) bm!34143))

(declare-fun m!651187 () Bool)

(assert (=> b!687647 m!651187))

(assert (=> b!687647 m!651187))

(declare-fun m!651191 () Bool)

(assert (=> b!687647 m!651191))

(assert (=> b!687650 m!651187))

(assert (=> b!687650 m!651187))

(assert (=> b!687650 m!651191))

(assert (=> bm!34143 m!651187))

(declare-fun m!651193 () Bool)

(assert (=> bm!34143 m!651193))

(assert (=> b!687651 m!651187))

(assert (=> b!687651 m!651187))

(declare-fun m!651195 () Bool)

(assert (=> b!687651 m!651195))

(assert (=> b!687253 d!94987))

(declare-fun d!94993 () Bool)

(declare-fun res!452616 () Bool)

(declare-fun e!391690 () Bool)

(assert (=> d!94993 (=> res!452616 e!391690)))

(assert (=> d!94993 (= res!452616 (= (select (arr!19013 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94993 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!391690)))

(declare-fun b!687654 () Bool)

(declare-fun e!391691 () Bool)

(assert (=> b!687654 (= e!391690 e!391691)))

(declare-fun res!452617 () Bool)

(assert (=> b!687654 (=> (not res!452617) (not e!391691))))

(assert (=> b!687654 (= res!452617 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19391 a!3626)))))

(declare-fun b!687655 () Bool)

(assert (=> b!687655 (= e!391691 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94993 (not res!452616)) b!687654))

(assert (= (and b!687654 res!452617) b!687655))

(assert (=> d!94993 m!651187))

(declare-fun m!651199 () Bool)

(assert (=> b!687655 m!651199))

(assert (=> b!687263 d!94993))

(assert (=> b!687252 d!94975))

(declare-fun d!94997 () Bool)

(declare-fun lt!315321 () Bool)

(assert (=> d!94997 (= lt!315321 (select (content!299 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391692 () Bool)

(assert (=> d!94997 (= lt!315321 e!391692)))

(declare-fun res!452619 () Bool)

(assert (=> d!94997 (=> (not res!452619) (not e!391692))))

(assert (=> d!94997 (= res!452619 ((_ is Cons!13089) acc!681))))

(assert (=> d!94997 (= (contains!3615 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315321)))

(declare-fun b!687656 () Bool)

(declare-fun e!391693 () Bool)

(assert (=> b!687656 (= e!391692 e!391693)))

(declare-fun res!452618 () Bool)

(assert (=> b!687656 (=> res!452618 e!391693)))

(assert (=> b!687656 (= res!452618 (= (h!14134 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687657 () Bool)

(assert (=> b!687657 (= e!391693 (contains!3615 (t!19345 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94997 res!452619) b!687656))

(assert (= (and b!687656 (not res!452618)) b!687657))

(assert (=> d!94997 m!650961))

(declare-fun m!651201 () Bool)

(assert (=> d!94997 m!651201))

(declare-fun m!651203 () Bool)

(assert (=> b!687657 m!651203))

(assert (=> b!687272 d!94997))

(check-sat (not b!687482) (not b!687519) (not bm!34126) (not b!687491) (not d!94871) (not b!687536) (not b!687518) (not b!687521) (not d!94855) (not b!687495) (not d!94979) (not b!687441) (not b!687643) (not b!687486) (not d!94975) (not bm!34143) (not d!94917) (not b!687618) (not b!687554) (not b!687651) (not b!687557) (not b!687655) (not d!94997) (not b!687657) (not d!94909) (not b!687551) (not b!687647) (not d!94893) (not b!687440) (not d!94939) (not b!687485) (not bm!34127) (not d!94895) (not d!94863) (not d!94963) (not b!687490) (not b!687640) (not bm!34132) (not b!687488) (not b!687429) (not b!687644) (not b!687494) (not b!687650) (not b!687558) (not bm!34140))
(check-sat)
