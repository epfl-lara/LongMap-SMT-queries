; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60652 () Bool)

(assert start!60652)

(declare-fun b!681306 () Bool)

(declare-fun res!447480 () Bool)

(declare-fun e!388098 () Bool)

(assert (=> b!681306 (=> (not res!447480) (not e!388098))))

(declare-datatypes ((List!12987 0))(
  ( (Nil!12984) (Cons!12983 (h!14028 (_ BitVec 64)) (t!19221 List!12987)) )
))
(declare-fun acc!681 () List!12987)

(declare-fun contains!3564 (List!12987 (_ BitVec 64)) Bool)

(assert (=> b!681306 (= res!447480 (not (contains!3564 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681307 () Bool)

(declare-fun res!447469 () Bool)

(assert (=> b!681307 (=> (not res!447469) (not e!388098))))

(declare-fun e!388094 () Bool)

(assert (=> b!681307 (= res!447469 e!388094)))

(declare-fun res!447466 () Bool)

(assert (=> b!681307 (=> res!447466 e!388094)))

(declare-fun e!388095 () Bool)

(assert (=> b!681307 (= res!447466 e!388095)))

(declare-fun res!447467 () Bool)

(assert (=> b!681307 (=> (not res!447467) (not e!388095))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681307 (= res!447467 (bvsgt from!3004 i!1382))))

(declare-fun b!681308 () Bool)

(declare-fun res!447481 () Bool)

(assert (=> b!681308 (=> (not res!447481) (not e!388098))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681308 (= res!447481 (validKeyInArray!0 k0!2843))))

(declare-fun b!681309 () Bool)

(declare-fun res!447476 () Bool)

(assert (=> b!681309 (=> (not res!447476) (not e!388098))))

(declare-datatypes ((array!39519 0))(
  ( (array!39520 (arr!18946 (Array (_ BitVec 32) (_ BitVec 64))) (size!19310 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39519)

(declare-fun arrayNoDuplicates!0 (array!39519 (_ BitVec 32) List!12987) Bool)

(assert (=> b!681309 (= res!447476 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681310 () Bool)

(declare-fun res!447471 () Bool)

(assert (=> b!681310 (=> (not res!447471) (not e!388098))))

(declare-fun noDuplicate!811 (List!12987) Bool)

(assert (=> b!681310 (= res!447471 (noDuplicate!811 acc!681))))

(declare-fun b!681311 () Bool)

(declare-datatypes ((Unit!23902 0))(
  ( (Unit!23903) )
))
(declare-fun e!388100 () Unit!23902)

(declare-fun Unit!23904 () Unit!23902)

(assert (=> b!681311 (= e!388100 Unit!23904)))

(declare-fun lt!313264 () Unit!23902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39519 (_ BitVec 64) (_ BitVec 32)) Unit!23902)

(assert (=> b!681311 (= lt!313264 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!681311 false))

(declare-fun b!681312 () Bool)

(declare-fun res!447464 () Bool)

(assert (=> b!681312 (=> (not res!447464) (not e!388098))))

(assert (=> b!681312 (= res!447464 (not (contains!3564 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!447475 () Bool)

(assert (=> start!60652 (=> (not res!447475) (not e!388098))))

(assert (=> start!60652 (= res!447475 (and (bvslt (size!19310 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19310 a!3626))))))

(assert (=> start!60652 e!388098))

(assert (=> start!60652 true))

(declare-fun array_inv!14742 (array!39519) Bool)

(assert (=> start!60652 (array_inv!14742 a!3626)))

(declare-fun b!681313 () Bool)

(assert (=> b!681313 (= e!388095 (contains!3564 acc!681 k0!2843))))

(declare-fun b!681314 () Bool)

(declare-fun e!388099 () Bool)

(assert (=> b!681314 (= e!388094 e!388099)))

(declare-fun res!447474 () Bool)

(assert (=> b!681314 (=> (not res!447474) (not e!388099))))

(assert (=> b!681314 (= res!447474 (bvsle from!3004 i!1382))))

(declare-fun b!681315 () Bool)

(declare-fun Unit!23905 () Unit!23902)

(assert (=> b!681315 (= e!388100 Unit!23905)))

(declare-fun b!681316 () Bool)

(assert (=> b!681316 (= e!388099 (not (contains!3564 acc!681 k0!2843)))))

(declare-fun b!681317 () Bool)

(declare-fun e!388096 () Bool)

(declare-fun e!388101 () Bool)

(assert (=> b!681317 (= e!388096 e!388101)))

(declare-fun res!447479 () Bool)

(assert (=> b!681317 (=> res!447479 e!388101)))

(assert (=> b!681317 (= res!447479 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!313263 () List!12987)

(declare-fun $colon$colon!315 (List!12987 (_ BitVec 64)) List!12987)

(assert (=> b!681317 (= lt!313263 ($colon$colon!315 acc!681 (select (arr!18946 a!3626) from!3004)))))

(declare-fun subseq!150 (List!12987 List!12987) Bool)

(assert (=> b!681317 (subseq!150 acc!681 acc!681)))

(declare-fun lt!313261 () Unit!23902)

(declare-fun lemmaListSubSeqRefl!0 (List!12987) Unit!23902)

(assert (=> b!681317 (= lt!313261 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681318 () Bool)

(declare-fun res!447470 () Bool)

(assert (=> b!681318 (=> (not res!447470) (not e!388098))))

(assert (=> b!681318 (= res!447470 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19310 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681319 () Bool)

(declare-fun res!447482 () Bool)

(assert (=> b!681319 (=> res!447482 e!388101)))

(assert (=> b!681319 (= res!447482 (contains!3564 lt!313263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681320 () Bool)

(assert (=> b!681320 (= e!388098 (not e!388096))))

(declare-fun res!447473 () Bool)

(assert (=> b!681320 (=> res!447473 e!388096)))

(assert (=> b!681320 (= res!447473 (not (validKeyInArray!0 (select (arr!18946 a!3626) from!3004))))))

(declare-fun lt!313262 () Unit!23902)

(assert (=> b!681320 (= lt!313262 e!388100)))

(declare-fun c!77288 () Bool)

(declare-fun arrayContainsKey!0 (array!39519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681320 (= c!77288 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681320 (arrayContainsKey!0 (array!39520 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626)) k0!2843 from!3004)))

(declare-fun b!681321 () Bool)

(declare-fun res!447478 () Bool)

(assert (=> b!681321 (=> res!447478 e!388101)))

(assert (=> b!681321 (= res!447478 (contains!3564 lt!313263 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681322 () Bool)

(declare-fun res!447465 () Bool)

(assert (=> b!681322 (=> res!447465 e!388101)))

(assert (=> b!681322 (= res!447465 (not (noDuplicate!811 lt!313263)))))

(declare-fun b!681323 () Bool)

(declare-fun res!447468 () Bool)

(assert (=> b!681323 (=> (not res!447468) (not e!388098))))

(assert (=> b!681323 (= res!447468 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12984))))

(declare-fun b!681324 () Bool)

(declare-fun res!447477 () Bool)

(assert (=> b!681324 (=> (not res!447477) (not e!388098))))

(assert (=> b!681324 (= res!447477 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681325 () Bool)

(assert (=> b!681325 (= e!388101 (subseq!150 acc!681 lt!313263))))

(declare-fun b!681326 () Bool)

(declare-fun res!447472 () Bool)

(assert (=> b!681326 (=> (not res!447472) (not e!388098))))

(assert (=> b!681326 (= res!447472 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19310 a!3626))))))

(assert (= (and start!60652 res!447475) b!681310))

(assert (= (and b!681310 res!447471) b!681306))

(assert (= (and b!681306 res!447480) b!681312))

(assert (= (and b!681312 res!447464) b!681307))

(assert (= (and b!681307 res!447467) b!681313))

(assert (= (and b!681307 (not res!447466)) b!681314))

(assert (= (and b!681314 res!447474) b!681316))

(assert (= (and b!681307 res!447469) b!681323))

(assert (= (and b!681323 res!447468) b!681309))

(assert (= (and b!681309 res!447476) b!681326))

(assert (= (and b!681326 res!447472) b!681308))

(assert (= (and b!681308 res!447481) b!681324))

(assert (= (and b!681324 res!447477) b!681318))

(assert (= (and b!681318 res!447470) b!681320))

(assert (= (and b!681320 c!77288) b!681311))

(assert (= (and b!681320 (not c!77288)) b!681315))

(assert (= (and b!681320 (not res!447473)) b!681317))

(assert (= (and b!681317 (not res!447479)) b!681322))

(assert (= (and b!681322 (not res!447465)) b!681319))

(assert (= (and b!681319 (not res!447482)) b!681321))

(assert (= (and b!681321 (not res!447478)) b!681325))

(declare-fun m!646177 () Bool)

(assert (=> b!681309 m!646177))

(declare-fun m!646179 () Bool)

(assert (=> b!681313 m!646179))

(declare-fun m!646181 () Bool)

(assert (=> b!681308 m!646181))

(declare-fun m!646183 () Bool)

(assert (=> b!681322 m!646183))

(declare-fun m!646185 () Bool)

(assert (=> b!681310 m!646185))

(declare-fun m!646187 () Bool)

(assert (=> b!681312 m!646187))

(declare-fun m!646189 () Bool)

(assert (=> b!681317 m!646189))

(assert (=> b!681317 m!646189))

(declare-fun m!646191 () Bool)

(assert (=> b!681317 m!646191))

(declare-fun m!646193 () Bool)

(assert (=> b!681317 m!646193))

(declare-fun m!646195 () Bool)

(assert (=> b!681317 m!646195))

(declare-fun m!646197 () Bool)

(assert (=> b!681321 m!646197))

(declare-fun m!646199 () Bool)

(assert (=> b!681306 m!646199))

(declare-fun m!646201 () Bool)

(assert (=> start!60652 m!646201))

(declare-fun m!646203 () Bool)

(assert (=> b!681323 m!646203))

(declare-fun m!646205 () Bool)

(assert (=> b!681319 m!646205))

(declare-fun m!646207 () Bool)

(assert (=> b!681324 m!646207))

(assert (=> b!681316 m!646179))

(declare-fun m!646209 () Bool)

(assert (=> b!681325 m!646209))

(declare-fun m!646211 () Bool)

(assert (=> b!681311 m!646211))

(assert (=> b!681320 m!646189))

(declare-fun m!646213 () Bool)

(assert (=> b!681320 m!646213))

(declare-fun m!646215 () Bool)

(assert (=> b!681320 m!646215))

(assert (=> b!681320 m!646189))

(declare-fun m!646217 () Bool)

(assert (=> b!681320 m!646217))

(declare-fun m!646219 () Bool)

(assert (=> b!681320 m!646219))

(check-sat (not b!681306) (not b!681313) (not b!681319) (not b!681322) (not b!681321) (not b!681325) (not b!681309) (not b!681320) (not b!681323) (not b!681324) (not b!681310) (not b!681311) (not b!681308) (not b!681316) (not b!681317) (not start!60652) (not b!681312))
(check-sat)
(get-model)

(declare-fun d!93795 () Bool)

(declare-fun lt!313279 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!273 (List!12987) (InoxSet (_ BitVec 64)))

(assert (=> d!93795 (= lt!313279 (select (content!273 acc!681) k0!2843))))

(declare-fun e!388130 () Bool)

(assert (=> d!93795 (= lt!313279 e!388130)))

(declare-fun res!447544 () Bool)

(assert (=> d!93795 (=> (not res!447544) (not e!388130))))

(get-info :version)

(assert (=> d!93795 (= res!447544 ((_ is Cons!12983) acc!681))))

(assert (=> d!93795 (= (contains!3564 acc!681 k0!2843) lt!313279)))

(declare-fun b!681394 () Bool)

(declare-fun e!388131 () Bool)

(assert (=> b!681394 (= e!388130 e!388131)))

(declare-fun res!447545 () Bool)

(assert (=> b!681394 (=> res!447545 e!388131)))

(assert (=> b!681394 (= res!447545 (= (h!14028 acc!681) k0!2843))))

(declare-fun b!681395 () Bool)

(assert (=> b!681395 (= e!388131 (contains!3564 (t!19221 acc!681) k0!2843))))

(assert (= (and d!93795 res!447544) b!681394))

(assert (= (and b!681394 (not res!447545)) b!681395))

(declare-fun m!646265 () Bool)

(assert (=> d!93795 m!646265))

(declare-fun m!646267 () Bool)

(assert (=> d!93795 m!646267))

(declare-fun m!646269 () Bool)

(assert (=> b!681395 m!646269))

(assert (=> b!681313 d!93795))

(declare-fun d!93797 () Bool)

(declare-fun res!447550 () Bool)

(declare-fun e!388136 () Bool)

(assert (=> d!93797 (=> res!447550 e!388136)))

(assert (=> d!93797 (= res!447550 (= (select (arr!18946 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93797 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388136)))

(declare-fun b!681400 () Bool)

(declare-fun e!388137 () Bool)

(assert (=> b!681400 (= e!388136 e!388137)))

(declare-fun res!447551 () Bool)

(assert (=> b!681400 (=> (not res!447551) (not e!388137))))

(assert (=> b!681400 (= res!447551 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19310 a!3626)))))

(declare-fun b!681401 () Bool)

(assert (=> b!681401 (= e!388137 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93797 (not res!447550)) b!681400))

(assert (= (and b!681400 res!447551) b!681401))

(declare-fun m!646271 () Bool)

(assert (=> d!93797 m!646271))

(declare-fun m!646273 () Bool)

(assert (=> b!681401 m!646273))

(assert (=> b!681324 d!93797))

(declare-fun b!681416 () Bool)

(declare-fun e!388153 () Bool)

(declare-fun e!388154 () Bool)

(assert (=> b!681416 (= e!388153 e!388154)))

(declare-fun res!447566 () Bool)

(assert (=> b!681416 (=> (not res!447566) (not e!388154))))

(assert (=> b!681416 (= res!447566 ((_ is Cons!12983) lt!313263))))

(declare-fun b!681417 () Bool)

(declare-fun e!388152 () Bool)

(assert (=> b!681417 (= e!388154 e!388152)))

(declare-fun res!447569 () Bool)

(assert (=> b!681417 (=> res!447569 e!388152)))

(declare-fun e!388155 () Bool)

(assert (=> b!681417 (= res!447569 e!388155)))

(declare-fun res!447568 () Bool)

(assert (=> b!681417 (=> (not res!447568) (not e!388155))))

(assert (=> b!681417 (= res!447568 (= (h!14028 acc!681) (h!14028 lt!313263)))))

(declare-fun b!681419 () Bool)

(assert (=> b!681419 (= e!388152 (subseq!150 acc!681 (t!19221 lt!313263)))))

(declare-fun d!93799 () Bool)

(declare-fun res!447567 () Bool)

(assert (=> d!93799 (=> res!447567 e!388153)))

(assert (=> d!93799 (= res!447567 ((_ is Nil!12984) acc!681))))

(assert (=> d!93799 (= (subseq!150 acc!681 lt!313263) e!388153)))

(declare-fun b!681418 () Bool)

(assert (=> b!681418 (= e!388155 (subseq!150 (t!19221 acc!681) (t!19221 lt!313263)))))

(assert (= (and d!93799 (not res!447567)) b!681416))

(assert (= (and b!681416 res!447566) b!681417))

(assert (= (and b!681417 res!447568) b!681418))

(assert (= (and b!681417 (not res!447569)) b!681419))

(declare-fun m!646279 () Bool)

(assert (=> b!681419 m!646279))

(declare-fun m!646281 () Bool)

(assert (=> b!681418 m!646281))

(assert (=> b!681325 d!93799))

(declare-fun d!93807 () Bool)

(assert (=> d!93807 (= (array_inv!14742 a!3626) (bvsge (size!19310 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60652 d!93807))

(declare-fun d!93809 () Bool)

(declare-fun lt!313280 () Bool)

(assert (=> d!93809 (= lt!313280 (select (content!273 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388156 () Bool)

(assert (=> d!93809 (= lt!313280 e!388156)))

(declare-fun res!447570 () Bool)

(assert (=> d!93809 (=> (not res!447570) (not e!388156))))

(assert (=> d!93809 (= res!447570 ((_ is Cons!12983) acc!681))))

(assert (=> d!93809 (= (contains!3564 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313280)))

(declare-fun b!681420 () Bool)

(declare-fun e!388157 () Bool)

(assert (=> b!681420 (= e!388156 e!388157)))

(declare-fun res!447571 () Bool)

(assert (=> b!681420 (=> res!447571 e!388157)))

(assert (=> b!681420 (= res!447571 (= (h!14028 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681421 () Bool)

(assert (=> b!681421 (= e!388157 (contains!3564 (t!19221 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93809 res!447570) b!681420))

(assert (= (and b!681420 (not res!447571)) b!681421))

(assert (=> d!93809 m!646265))

(declare-fun m!646283 () Bool)

(assert (=> d!93809 m!646283))

(declare-fun m!646285 () Bool)

(assert (=> b!681421 m!646285))

(assert (=> b!681306 d!93809))

(assert (=> b!681316 d!93795))

(declare-fun d!93811 () Bool)

(assert (=> d!93811 (= ($colon$colon!315 acc!681 (select (arr!18946 a!3626) from!3004)) (Cons!12983 (select (arr!18946 a!3626) from!3004) acc!681))))

(assert (=> b!681317 d!93811))

(declare-fun b!681422 () Bool)

(declare-fun e!388159 () Bool)

(declare-fun e!388160 () Bool)

(assert (=> b!681422 (= e!388159 e!388160)))

(declare-fun res!447572 () Bool)

(assert (=> b!681422 (=> (not res!447572) (not e!388160))))

(assert (=> b!681422 (= res!447572 ((_ is Cons!12983) acc!681))))

(declare-fun b!681423 () Bool)

(declare-fun e!388158 () Bool)

(assert (=> b!681423 (= e!388160 e!388158)))

(declare-fun res!447575 () Bool)

(assert (=> b!681423 (=> res!447575 e!388158)))

(declare-fun e!388161 () Bool)

(assert (=> b!681423 (= res!447575 e!388161)))

(declare-fun res!447574 () Bool)

(assert (=> b!681423 (=> (not res!447574) (not e!388161))))

(assert (=> b!681423 (= res!447574 (= (h!14028 acc!681) (h!14028 acc!681)))))

(declare-fun b!681425 () Bool)

(assert (=> b!681425 (= e!388158 (subseq!150 acc!681 (t!19221 acc!681)))))

(declare-fun d!93815 () Bool)

(declare-fun res!447573 () Bool)

(assert (=> d!93815 (=> res!447573 e!388159)))

(assert (=> d!93815 (= res!447573 ((_ is Nil!12984) acc!681))))

(assert (=> d!93815 (= (subseq!150 acc!681 acc!681) e!388159)))

(declare-fun b!681424 () Bool)

(assert (=> b!681424 (= e!388161 (subseq!150 (t!19221 acc!681) (t!19221 acc!681)))))

(assert (= (and d!93815 (not res!447573)) b!681422))

(assert (= (and b!681422 res!447572) b!681423))

(assert (= (and b!681423 res!447574) b!681424))

(assert (= (and b!681423 (not res!447575)) b!681425))

(declare-fun m!646289 () Bool)

(assert (=> b!681425 m!646289))

(declare-fun m!646291 () Bool)

(assert (=> b!681424 m!646291))

(assert (=> b!681317 d!93815))

(declare-fun d!93817 () Bool)

(assert (=> d!93817 (subseq!150 acc!681 acc!681)))

(declare-fun lt!313289 () Unit!23902)

(declare-fun choose!36 (List!12987) Unit!23902)

(assert (=> d!93817 (= lt!313289 (choose!36 acc!681))))

(assert (=> d!93817 (= (lemmaListSubSeqRefl!0 acc!681) lt!313289)))

(declare-fun bs!20000 () Bool)

(assert (= bs!20000 d!93817))

(assert (=> bs!20000 m!646193))

(declare-fun m!646297 () Bool)

(assert (=> bs!20000 m!646297))

(assert (=> b!681317 d!93817))

(declare-fun d!93819 () Bool)

(declare-fun lt!313290 () Bool)

(assert (=> d!93819 (= lt!313290 (select (content!273 lt!313263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388168 () Bool)

(assert (=> d!93819 (= lt!313290 e!388168)))

(declare-fun res!447582 () Bool)

(assert (=> d!93819 (=> (not res!447582) (not e!388168))))

(assert (=> d!93819 (= res!447582 ((_ is Cons!12983) lt!313263))))

(assert (=> d!93819 (= (contains!3564 lt!313263 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313290)))

(declare-fun b!681432 () Bool)

(declare-fun e!388169 () Bool)

(assert (=> b!681432 (= e!388168 e!388169)))

(declare-fun res!447583 () Bool)

(assert (=> b!681432 (=> res!447583 e!388169)))

(assert (=> b!681432 (= res!447583 (= (h!14028 lt!313263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681433 () Bool)

(assert (=> b!681433 (= e!388169 (contains!3564 (t!19221 lt!313263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93819 res!447582) b!681432))

(assert (= (and b!681432 (not res!447583)) b!681433))

(declare-fun m!646301 () Bool)

(assert (=> d!93819 m!646301))

(declare-fun m!646303 () Bool)

(assert (=> d!93819 m!646303))

(declare-fun m!646305 () Bool)

(assert (=> b!681433 m!646305))

(assert (=> b!681319 d!93819))

(declare-fun d!93823 () Bool)

(assert (=> d!93823 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681308 d!93823))

(declare-fun d!93827 () Bool)

(declare-fun res!447602 () Bool)

(declare-fun e!388190 () Bool)

(assert (=> d!93827 (=> res!447602 e!388190)))

(assert (=> d!93827 (= res!447602 ((_ is Nil!12984) acc!681))))

(assert (=> d!93827 (= (noDuplicate!811 acc!681) e!388190)))

(declare-fun b!681456 () Bool)

(declare-fun e!388191 () Bool)

(assert (=> b!681456 (= e!388190 e!388191)))

(declare-fun res!447603 () Bool)

(assert (=> b!681456 (=> (not res!447603) (not e!388191))))

(assert (=> b!681456 (= res!447603 (not (contains!3564 (t!19221 acc!681) (h!14028 acc!681))))))

(declare-fun b!681457 () Bool)

(assert (=> b!681457 (= e!388191 (noDuplicate!811 (t!19221 acc!681)))))

(assert (= (and d!93827 (not res!447602)) b!681456))

(assert (= (and b!681456 res!447603) b!681457))

(declare-fun m!646307 () Bool)

(assert (=> b!681456 m!646307))

(declare-fun m!646309 () Bool)

(assert (=> b!681457 m!646309))

(assert (=> b!681310 d!93827))

(declare-fun b!681493 () Bool)

(declare-fun e!388227 () Bool)

(declare-fun e!388224 () Bool)

(assert (=> b!681493 (= e!388227 e!388224)))

(declare-fun c!77297 () Bool)

(assert (=> b!681493 (= c!77297 (validKeyInArray!0 (select (arr!18946 a!3626) from!3004)))))

(declare-fun d!93829 () Bool)

(declare-fun res!447635 () Bool)

(declare-fun e!388225 () Bool)

(assert (=> d!93829 (=> res!447635 e!388225)))

(assert (=> d!93829 (= res!447635 (bvsge from!3004 (size!19310 a!3626)))))

(assert (=> d!93829 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388225)))

(declare-fun call!33968 () Bool)

(declare-fun bm!33965 () Bool)

(assert (=> bm!33965 (= call!33968 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77297 (Cons!12983 (select (arr!18946 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681494 () Bool)

(assert (=> b!681494 (= e!388224 call!33968)))

(declare-fun b!681495 () Bool)

(assert (=> b!681495 (= e!388225 e!388227)))

(declare-fun res!447633 () Bool)

(assert (=> b!681495 (=> (not res!447633) (not e!388227))))

(declare-fun e!388226 () Bool)

(assert (=> b!681495 (= res!447633 (not e!388226))))

(declare-fun res!447634 () Bool)

(assert (=> b!681495 (=> (not res!447634) (not e!388226))))

(assert (=> b!681495 (= res!447634 (validKeyInArray!0 (select (arr!18946 a!3626) from!3004)))))

(declare-fun b!681496 () Bool)

(assert (=> b!681496 (= e!388224 call!33968)))

(declare-fun b!681497 () Bool)

(assert (=> b!681497 (= e!388226 (contains!3564 acc!681 (select (arr!18946 a!3626) from!3004)))))

(assert (= (and d!93829 (not res!447635)) b!681495))

(assert (= (and b!681495 res!447634) b!681497))

(assert (= (and b!681495 res!447633) b!681493))

(assert (= (and b!681493 c!77297) b!681494))

(assert (= (and b!681493 (not c!77297)) b!681496))

(assert (= (or b!681494 b!681496) bm!33965))

(assert (=> b!681493 m!646189))

(assert (=> b!681493 m!646189))

(assert (=> b!681493 m!646217))

(assert (=> bm!33965 m!646189))

(declare-fun m!646345 () Bool)

(assert (=> bm!33965 m!646345))

(assert (=> b!681495 m!646189))

(assert (=> b!681495 m!646189))

(assert (=> b!681495 m!646217))

(assert (=> b!681497 m!646189))

(assert (=> b!681497 m!646189))

(declare-fun m!646347 () Bool)

(assert (=> b!681497 m!646347))

(assert (=> b!681309 d!93829))

(declare-fun d!93851 () Bool)

(assert (=> d!93851 (= (validKeyInArray!0 (select (arr!18946 a!3626) from!3004)) (and (not (= (select (arr!18946 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18946 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681320 d!93851))

(declare-fun d!93853 () Bool)

(declare-fun res!447640 () Bool)

(declare-fun e!388232 () Bool)

(assert (=> d!93853 (=> res!447640 e!388232)))

(assert (=> d!93853 (= res!447640 (= (select (arr!18946 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93853 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388232)))

(declare-fun b!681502 () Bool)

(declare-fun e!388233 () Bool)

(assert (=> b!681502 (= e!388232 e!388233)))

(declare-fun res!447641 () Bool)

(assert (=> b!681502 (=> (not res!447641) (not e!388233))))

(assert (=> b!681502 (= res!447641 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19310 a!3626)))))

(declare-fun b!681503 () Bool)

(assert (=> b!681503 (= e!388233 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93853 (not res!447640)) b!681502))

(assert (= (and b!681502 res!447641) b!681503))

(declare-fun m!646355 () Bool)

(assert (=> d!93853 m!646355))

(declare-fun m!646360 () Bool)

(assert (=> b!681503 m!646360))

(assert (=> b!681320 d!93853))

(declare-fun d!93859 () Bool)

(declare-fun res!447644 () Bool)

(declare-fun e!388236 () Bool)

(assert (=> d!93859 (=> res!447644 e!388236)))

(assert (=> d!93859 (= res!447644 (= (select (arr!18946 (array!39520 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626))) from!3004) k0!2843))))

(assert (=> d!93859 (= (arrayContainsKey!0 (array!39520 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626)) k0!2843 from!3004) e!388236)))

(declare-fun b!681506 () Bool)

(declare-fun e!388237 () Bool)

(assert (=> b!681506 (= e!388236 e!388237)))

(declare-fun res!447645 () Bool)

(assert (=> b!681506 (=> (not res!447645) (not e!388237))))

(assert (=> b!681506 (= res!447645 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19310 (array!39520 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626)))))))

(declare-fun b!681507 () Bool)

(assert (=> b!681507 (= e!388237 (arrayContainsKey!0 (array!39520 (store (arr!18946 a!3626) i!1382 k0!2843) (size!19310 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93859 (not res!447644)) b!681506))

(assert (= (and b!681506 res!447645) b!681507))

(declare-fun m!646363 () Bool)

(assert (=> d!93859 m!646363))

(declare-fun m!646365 () Bool)

(assert (=> b!681507 m!646365))

(assert (=> b!681320 d!93859))

(declare-fun d!93861 () Bool)

(assert (=> d!93861 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313303 () Unit!23902)

(declare-fun choose!13 (array!39519 (_ BitVec 64) (_ BitVec 32)) Unit!23902)

(assert (=> d!93861 (= lt!313303 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93861 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93861 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313303)))

(declare-fun bs!20002 () Bool)

(assert (= bs!20002 d!93861))

(assert (=> bs!20002 m!646207))

(declare-fun m!646371 () Bool)

(assert (=> bs!20002 m!646371))

(assert (=> b!681311 d!93861))

(declare-fun d!93867 () Bool)

(declare-fun res!447662 () Bool)

(declare-fun e!388254 () Bool)

(assert (=> d!93867 (=> res!447662 e!388254)))

(assert (=> d!93867 (= res!447662 ((_ is Nil!12984) lt!313263))))

(assert (=> d!93867 (= (noDuplicate!811 lt!313263) e!388254)))

(declare-fun b!681524 () Bool)

(declare-fun e!388255 () Bool)

(assert (=> b!681524 (= e!388254 e!388255)))

(declare-fun res!447663 () Bool)

(assert (=> b!681524 (=> (not res!447663) (not e!388255))))

(assert (=> b!681524 (= res!447663 (not (contains!3564 (t!19221 lt!313263) (h!14028 lt!313263))))))

(declare-fun b!681525 () Bool)

(assert (=> b!681525 (= e!388255 (noDuplicate!811 (t!19221 lt!313263)))))

(assert (= (and d!93867 (not res!447662)) b!681524))

(assert (= (and b!681524 res!447663) b!681525))

(declare-fun m!646373 () Bool)

(assert (=> b!681524 m!646373))

(declare-fun m!646375 () Bool)

(assert (=> b!681525 m!646375))

(assert (=> b!681322 d!93867))

(declare-fun d!93869 () Bool)

(declare-fun lt!313304 () Bool)

(assert (=> d!93869 (= lt!313304 (select (content!273 lt!313263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388256 () Bool)

(assert (=> d!93869 (= lt!313304 e!388256)))

(declare-fun res!447664 () Bool)

(assert (=> d!93869 (=> (not res!447664) (not e!388256))))

(assert (=> d!93869 (= res!447664 ((_ is Cons!12983) lt!313263))))

(assert (=> d!93869 (= (contains!3564 lt!313263 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313304)))

(declare-fun b!681526 () Bool)

(declare-fun e!388257 () Bool)

(assert (=> b!681526 (= e!388256 e!388257)))

(declare-fun res!447665 () Bool)

(assert (=> b!681526 (=> res!447665 e!388257)))

(assert (=> b!681526 (= res!447665 (= (h!14028 lt!313263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681527 () Bool)

(assert (=> b!681527 (= e!388257 (contains!3564 (t!19221 lt!313263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93869 res!447664) b!681526))

(assert (= (and b!681526 (not res!447665)) b!681527))

(assert (=> d!93869 m!646301))

(declare-fun m!646377 () Bool)

(assert (=> d!93869 m!646377))

(declare-fun m!646379 () Bool)

(assert (=> b!681527 m!646379))

(assert (=> b!681321 d!93869))

(declare-fun b!681528 () Bool)

(declare-fun e!388261 () Bool)

(declare-fun e!388258 () Bool)

(assert (=> b!681528 (= e!388261 e!388258)))

(declare-fun c!77298 () Bool)

(assert (=> b!681528 (= c!77298 (validKeyInArray!0 (select (arr!18946 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93871 () Bool)

(declare-fun res!447668 () Bool)

(declare-fun e!388259 () Bool)

(assert (=> d!93871 (=> res!447668 e!388259)))

(assert (=> d!93871 (= res!447668 (bvsge #b00000000000000000000000000000000 (size!19310 a!3626)))))

(assert (=> d!93871 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12984) e!388259)))

(declare-fun bm!33966 () Bool)

(declare-fun call!33969 () Bool)

(assert (=> bm!33966 (= call!33969 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77298 (Cons!12983 (select (arr!18946 a!3626) #b00000000000000000000000000000000) Nil!12984) Nil!12984)))))

(declare-fun b!681529 () Bool)

(assert (=> b!681529 (= e!388258 call!33969)))

(declare-fun b!681530 () Bool)

(assert (=> b!681530 (= e!388259 e!388261)))

(declare-fun res!447666 () Bool)

(assert (=> b!681530 (=> (not res!447666) (not e!388261))))

(declare-fun e!388260 () Bool)

(assert (=> b!681530 (= res!447666 (not e!388260))))

(declare-fun res!447667 () Bool)

(assert (=> b!681530 (=> (not res!447667) (not e!388260))))

(assert (=> b!681530 (= res!447667 (validKeyInArray!0 (select (arr!18946 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681531 () Bool)

(assert (=> b!681531 (= e!388258 call!33969)))

(declare-fun b!681532 () Bool)

(assert (=> b!681532 (= e!388260 (contains!3564 Nil!12984 (select (arr!18946 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93871 (not res!447668)) b!681530))

(assert (= (and b!681530 res!447667) b!681532))

(assert (= (and b!681530 res!447666) b!681528))

(assert (= (and b!681528 c!77298) b!681529))

(assert (= (and b!681528 (not c!77298)) b!681531))

(assert (= (or b!681529 b!681531) bm!33966))

(assert (=> b!681528 m!646271))

(assert (=> b!681528 m!646271))

(declare-fun m!646387 () Bool)

(assert (=> b!681528 m!646387))

(assert (=> bm!33966 m!646271))

(declare-fun m!646389 () Bool)

(assert (=> bm!33966 m!646389))

(assert (=> b!681530 m!646271))

(assert (=> b!681530 m!646271))

(assert (=> b!681530 m!646387))

(assert (=> b!681532 m!646271))

(assert (=> b!681532 m!646271))

(declare-fun m!646391 () Bool)

(assert (=> b!681532 m!646391))

(assert (=> b!681323 d!93871))

(declare-fun d!93877 () Bool)

(declare-fun lt!313308 () Bool)

(assert (=> d!93877 (= lt!313308 (select (content!273 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388264 () Bool)

(assert (=> d!93877 (= lt!313308 e!388264)))

(declare-fun res!447671 () Bool)

(assert (=> d!93877 (=> (not res!447671) (not e!388264))))

(assert (=> d!93877 (= res!447671 ((_ is Cons!12983) acc!681))))

(assert (=> d!93877 (= (contains!3564 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313308)))

(declare-fun b!681535 () Bool)

(declare-fun e!388265 () Bool)

(assert (=> b!681535 (= e!388264 e!388265)))

(declare-fun res!447672 () Bool)

(assert (=> b!681535 (=> res!447672 e!388265)))

(assert (=> b!681535 (= res!447672 (= (h!14028 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681536 () Bool)

(assert (=> b!681536 (= e!388265 (contains!3564 (t!19221 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93877 res!447671) b!681535))

(assert (= (and b!681535 (not res!447672)) b!681536))

(assert (=> d!93877 m!646265))

(declare-fun m!646393 () Bool)

(assert (=> d!93877 m!646393))

(declare-fun m!646395 () Bool)

(assert (=> b!681536 m!646395))

(assert (=> b!681312 d!93877))

(check-sat (not b!681495) (not b!681418) (not b!681524) (not b!681456) (not d!93809) (not b!681525) (not b!681421) (not b!681530) (not bm!33965) (not b!681419) (not d!93819) (not b!681401) (not d!93795) (not d!93861) (not b!681433) (not b!681425) (not b!681507) (not b!681532) (not b!681457) (not d!93869) (not b!681497) (not b!681503) (not b!681536) (not b!681528) (not d!93817) (not d!93877) (not b!681527) (not b!681395) (not bm!33966) (not b!681424) (not b!681493))
(check-sat)
