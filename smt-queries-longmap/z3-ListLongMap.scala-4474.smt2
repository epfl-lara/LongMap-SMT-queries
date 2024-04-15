; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62216 () Bool)

(assert start!62216)

(declare-fun b!697132 () Bool)

(declare-fun res!461210 () Bool)

(declare-fun e!396257 () Bool)

(assert (=> b!697132 (=> (not res!461210) (not e!396257))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39984 0))(
  ( (array!39985 (arr!19151 (Array (_ BitVec 32) (_ BitVec 64))) (size!19533 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39984)

(assert (=> b!697132 (= res!461210 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19533 a!3626))))))

(declare-fun b!697133 () Bool)

(declare-fun res!461229 () Bool)

(assert (=> b!697133 (=> (not res!461229) (not e!396257))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697133 (= res!461229 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697134 () Bool)

(declare-fun e!396253 () Bool)

(declare-datatypes ((List!13231 0))(
  ( (Nil!13228) (Cons!13227 (h!14272 (_ BitVec 64)) (t!19504 List!13231)) )
))
(declare-fun acc!681 () List!13231)

(declare-fun contains!3753 (List!13231 (_ BitVec 64)) Bool)

(assert (=> b!697134 (= e!396253 (contains!3753 acc!681 k0!2843))))

(declare-fun b!697135 () Bool)

(declare-fun res!461211 () Bool)

(assert (=> b!697135 (=> (not res!461211) (not e!396257))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697135 (= res!461211 (not (validKeyInArray!0 (select (arr!19151 a!3626) from!3004))))))

(declare-fun b!697136 () Bool)

(declare-fun res!461223 () Bool)

(assert (=> b!697136 (=> (not res!461223) (not e!396257))))

(declare-fun arrayNoDuplicates!0 (array!39984 (_ BitVec 32) List!13231) Bool)

(assert (=> b!697136 (= res!461223 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697137 () Bool)

(declare-fun res!461215 () Bool)

(assert (=> b!697137 (=> (not res!461215) (not e!396257))))

(assert (=> b!697137 (= res!461215 (not (contains!3753 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697138 () Bool)

(declare-fun lt!316895 () array!39984)

(assert (=> b!697138 (= e!396257 (not (arrayNoDuplicates!0 lt!316895 from!3004 acc!681)))))

(assert (=> b!697138 (arrayNoDuplicates!0 lt!316895 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (=> b!697138 (= lt!316895 (array!39985 (store (arr!19151 a!3626) i!1382 k0!2843) (size!19533 a!3626)))))

(declare-datatypes ((Unit!24554 0))(
  ( (Unit!24555) )
))
(declare-fun lt!316896 () Unit!24554)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39984 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13231) Unit!24554)

(assert (=> b!697138 (= lt!316896 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697139 () Bool)

(declare-fun e!396254 () Bool)

(declare-fun e!396256 () Bool)

(assert (=> b!697139 (= e!396254 e!396256)))

(declare-fun res!461216 () Bool)

(assert (=> b!697139 (=> (not res!461216) (not e!396256))))

(assert (=> b!697139 (= res!461216 (bvsle from!3004 i!1382))))

(declare-fun b!697141 () Bool)

(declare-fun res!461230 () Bool)

(assert (=> b!697141 (=> (not res!461230) (not e!396257))))

(declare-fun e!396252 () Bool)

(assert (=> b!697141 (= res!461230 e!396252)))

(declare-fun res!461228 () Bool)

(assert (=> b!697141 (=> res!461228 e!396252)))

(declare-fun e!396250 () Bool)

(assert (=> b!697141 (= res!461228 e!396250)))

(declare-fun res!461221 () Bool)

(assert (=> b!697141 (=> (not res!461221) (not e!396250))))

(assert (=> b!697141 (= res!461221 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697142 () Bool)

(declare-fun res!461219 () Bool)

(assert (=> b!697142 (=> (not res!461219) (not e!396257))))

(assert (=> b!697142 (= res!461219 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13228))))

(declare-fun b!697143 () Bool)

(declare-fun res!461225 () Bool)

(assert (=> b!697143 (=> (not res!461225) (not e!396257))))

(declare-fun noDuplicate!1022 (List!13231) Bool)

(assert (=> b!697143 (= res!461225 (noDuplicate!1022 acc!681))))

(declare-fun b!697144 () Bool)

(declare-fun res!461218 () Bool)

(assert (=> b!697144 (=> (not res!461218) (not e!396257))))

(assert (=> b!697144 (= res!461218 (not (contains!3753 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697145 () Bool)

(declare-fun res!461226 () Bool)

(assert (=> b!697145 (=> (not res!461226) (not e!396257))))

(assert (=> b!697145 (= res!461226 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697146 () Bool)

(assert (=> b!697146 (= e!396250 (contains!3753 acc!681 k0!2843))))

(declare-fun b!697147 () Bool)

(assert (=> b!697147 (= e!396256 (not (contains!3753 acc!681 k0!2843)))))

(declare-fun b!697148 () Bool)

(declare-fun res!461217 () Bool)

(assert (=> b!697148 (=> (not res!461217) (not e!396257))))

(assert (=> b!697148 (= res!461217 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19533 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697149 () Bool)

(declare-fun e!396251 () Bool)

(assert (=> b!697149 (= e!396251 (not (contains!3753 acc!681 k0!2843)))))

(declare-fun res!461213 () Bool)

(assert (=> start!62216 (=> (not res!461213) (not e!396257))))

(assert (=> start!62216 (= res!461213 (and (bvslt (size!19533 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19533 a!3626))))))

(assert (=> start!62216 e!396257))

(assert (=> start!62216 true))

(declare-fun array_inv!15034 (array!39984) Bool)

(assert (=> start!62216 (array_inv!15034 a!3626)))

(declare-fun b!697140 () Bool)

(declare-fun res!461212 () Bool)

(assert (=> b!697140 (=> (not res!461212) (not e!396257))))

(assert (=> b!697140 (= res!461212 (validKeyInArray!0 k0!2843))))

(declare-fun b!697150 () Bool)

(assert (=> b!697150 (= e!396252 e!396251)))

(declare-fun res!461222 () Bool)

(assert (=> b!697150 (=> (not res!461222) (not e!396251))))

(assert (=> b!697150 (= res!461222 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697151 () Bool)

(declare-fun res!461227 () Bool)

(assert (=> b!697151 (=> (not res!461227) (not e!396257))))

(assert (=> b!697151 (= res!461227 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697152 () Bool)

(declare-fun res!461220 () Bool)

(assert (=> b!697152 (=> (not res!461220) (not e!396257))))

(assert (=> b!697152 (= res!461220 e!396254)))

(declare-fun res!461224 () Bool)

(assert (=> b!697152 (=> res!461224 e!396254)))

(assert (=> b!697152 (= res!461224 e!396253)))

(declare-fun res!461214 () Bool)

(assert (=> b!697152 (=> (not res!461214) (not e!396253))))

(assert (=> b!697152 (= res!461214 (bvsgt from!3004 i!1382))))

(assert (= (and start!62216 res!461213) b!697143))

(assert (= (and b!697143 res!461225) b!697137))

(assert (= (and b!697137 res!461215) b!697144))

(assert (= (and b!697144 res!461218) b!697152))

(assert (= (and b!697152 res!461214) b!697134))

(assert (= (and b!697152 (not res!461224)) b!697139))

(assert (= (and b!697139 res!461216) b!697147))

(assert (= (and b!697152 res!461220) b!697142))

(assert (= (and b!697142 res!461219) b!697145))

(assert (= (and b!697145 res!461226) b!697132))

(assert (= (and b!697132 res!461210) b!697140))

(assert (= (and b!697140 res!461212) b!697133))

(assert (= (and b!697133 res!461229) b!697148))

(assert (= (and b!697148 res!461217) b!697135))

(assert (= (and b!697135 res!461211) b!697151))

(assert (= (and b!697151 res!461227) b!697141))

(assert (= (and b!697141 res!461221) b!697146))

(assert (= (and b!697141 (not res!461228)) b!697150))

(assert (= (and b!697150 res!461222) b!697149))

(assert (= (and b!697141 res!461230) b!697136))

(assert (= (and b!697136 res!461223) b!697138))

(declare-fun m!657063 () Bool)

(assert (=> b!697149 m!657063))

(declare-fun m!657065 () Bool)

(assert (=> b!697135 m!657065))

(assert (=> b!697135 m!657065))

(declare-fun m!657067 () Bool)

(assert (=> b!697135 m!657067))

(declare-fun m!657069 () Bool)

(assert (=> b!697143 m!657069))

(declare-fun m!657071 () Bool)

(assert (=> b!697142 m!657071))

(declare-fun m!657073 () Bool)

(assert (=> b!697137 m!657073))

(declare-fun m!657075 () Bool)

(assert (=> b!697140 m!657075))

(declare-fun m!657077 () Bool)

(assert (=> b!697144 m!657077))

(declare-fun m!657079 () Bool)

(assert (=> b!697145 m!657079))

(declare-fun m!657081 () Bool)

(assert (=> b!697138 m!657081))

(declare-fun m!657083 () Bool)

(assert (=> b!697138 m!657083))

(declare-fun m!657085 () Bool)

(assert (=> b!697138 m!657085))

(declare-fun m!657087 () Bool)

(assert (=> b!697138 m!657087))

(declare-fun m!657089 () Bool)

(assert (=> b!697133 m!657089))

(assert (=> b!697146 m!657063))

(assert (=> b!697134 m!657063))

(declare-fun m!657091 () Bool)

(assert (=> start!62216 m!657091))

(assert (=> b!697147 m!657063))

(declare-fun m!657093 () Bool)

(assert (=> b!697136 m!657093))

(check-sat (not b!697133) (not b!697137) (not b!697142) (not b!697146) (not b!697136) (not b!697143) (not b!697144) (not b!697147) (not b!697138) (not b!697140) (not b!697135) (not b!697145) (not b!697134) (not b!697149) (not start!62216))
(check-sat)
(get-model)

(declare-fun d!95937 () Bool)

(assert (=> d!95937 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697140 d!95937))

(declare-fun d!95939 () Bool)

(declare-fun lt!316911 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!325 (List!13231) (InoxSet (_ BitVec 64)))

(assert (=> d!95939 (= lt!316911 (select (content!325 acc!681) k0!2843))))

(declare-fun e!396310 () Bool)

(assert (=> d!95939 (= lt!316911 e!396310)))

(declare-fun res!461362 () Bool)

(assert (=> d!95939 (=> (not res!461362) (not e!396310))))

(get-info :version)

(assert (=> d!95939 (= res!461362 ((_ is Cons!13227) acc!681))))

(assert (=> d!95939 (= (contains!3753 acc!681 k0!2843) lt!316911)))

(declare-fun b!697283 () Bool)

(declare-fun e!396311 () Bool)

(assert (=> b!697283 (= e!396310 e!396311)))

(declare-fun res!461361 () Bool)

(assert (=> b!697283 (=> res!461361 e!396311)))

(assert (=> b!697283 (= res!461361 (= (h!14272 acc!681) k0!2843))))

(declare-fun b!697284 () Bool)

(assert (=> b!697284 (= e!396311 (contains!3753 (t!19504 acc!681) k0!2843))))

(assert (= (and d!95939 res!461362) b!697283))

(assert (= (and b!697283 (not res!461361)) b!697284))

(declare-fun m!657159 () Bool)

(assert (=> d!95939 m!657159))

(declare-fun m!657161 () Bool)

(assert (=> d!95939 m!657161))

(declare-fun m!657163 () Bool)

(assert (=> b!697284 m!657163))

(assert (=> b!697149 d!95939))

(declare-fun b!697295 () Bool)

(declare-fun e!396321 () Bool)

(declare-fun e!396323 () Bool)

(assert (=> b!697295 (= e!396321 e!396323)))

(declare-fun res!461371 () Bool)

(assert (=> b!697295 (=> (not res!461371) (not e!396323))))

(declare-fun e!396322 () Bool)

(assert (=> b!697295 (= res!461371 (not e!396322))))

(declare-fun res!461369 () Bool)

(assert (=> b!697295 (=> (not res!461369) (not e!396322))))

(assert (=> b!697295 (= res!461369 (validKeyInArray!0 (select (arr!19151 lt!316895) from!3004)))))

(declare-fun b!697296 () Bool)

(declare-fun e!396320 () Bool)

(assert (=> b!697296 (= e!396323 e!396320)))

(declare-fun c!78330 () Bool)

(assert (=> b!697296 (= c!78330 (validKeyInArray!0 (select (arr!19151 lt!316895) from!3004)))))

(declare-fun d!95941 () Bool)

(declare-fun res!461370 () Bool)

(assert (=> d!95941 (=> res!461370 e!396321)))

(assert (=> d!95941 (= res!461370 (bvsge from!3004 (size!19533 lt!316895)))))

(assert (=> d!95941 (= (arrayNoDuplicates!0 lt!316895 from!3004 acc!681) e!396321)))

(declare-fun b!697297 () Bool)

(assert (=> b!697297 (= e!396322 (contains!3753 acc!681 (select (arr!19151 lt!316895) from!3004)))))

(declare-fun call!34288 () Bool)

(declare-fun bm!34285 () Bool)

(assert (=> bm!34285 (= call!34288 (arrayNoDuplicates!0 lt!316895 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78330 (Cons!13227 (select (arr!19151 lt!316895) from!3004) acc!681) acc!681)))))

(declare-fun b!697298 () Bool)

(assert (=> b!697298 (= e!396320 call!34288)))

(declare-fun b!697299 () Bool)

(assert (=> b!697299 (= e!396320 call!34288)))

(assert (= (and d!95941 (not res!461370)) b!697295))

(assert (= (and b!697295 res!461369) b!697297))

(assert (= (and b!697295 res!461371) b!697296))

(assert (= (and b!697296 c!78330) b!697298))

(assert (= (and b!697296 (not c!78330)) b!697299))

(assert (= (or b!697298 b!697299) bm!34285))

(declare-fun m!657165 () Bool)

(assert (=> b!697295 m!657165))

(assert (=> b!697295 m!657165))

(declare-fun m!657167 () Bool)

(assert (=> b!697295 m!657167))

(assert (=> b!697296 m!657165))

(assert (=> b!697296 m!657165))

(assert (=> b!697296 m!657167))

(assert (=> b!697297 m!657165))

(assert (=> b!697297 m!657165))

(declare-fun m!657169 () Bool)

(assert (=> b!697297 m!657169))

(assert (=> bm!34285 m!657165))

(declare-fun m!657171 () Bool)

(assert (=> bm!34285 m!657171))

(assert (=> b!697138 d!95941))

(declare-fun b!697300 () Bool)

(declare-fun e!396325 () Bool)

(declare-fun e!396327 () Bool)

(assert (=> b!697300 (= e!396325 e!396327)))

(declare-fun res!461374 () Bool)

(assert (=> b!697300 (=> (not res!461374) (not e!396327))))

(declare-fun e!396326 () Bool)

(assert (=> b!697300 (= res!461374 (not e!396326))))

(declare-fun res!461372 () Bool)

(assert (=> b!697300 (=> (not res!461372) (not e!396326))))

(assert (=> b!697300 (= res!461372 (validKeyInArray!0 (select (arr!19151 lt!316895) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697301 () Bool)

(declare-fun e!396324 () Bool)

(assert (=> b!697301 (= e!396327 e!396324)))

(declare-fun c!78331 () Bool)

(assert (=> b!697301 (= c!78331 (validKeyInArray!0 (select (arr!19151 lt!316895) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95943 () Bool)

(declare-fun res!461373 () Bool)

(assert (=> d!95943 (=> res!461373 e!396325)))

(assert (=> d!95943 (= res!461373 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19533 lt!316895)))))

(assert (=> d!95943 (= (arrayNoDuplicates!0 lt!316895 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396325)))

(declare-fun b!697302 () Bool)

(assert (=> b!697302 (= e!396326 (contains!3753 acc!681 (select (arr!19151 lt!316895) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34289 () Bool)

(declare-fun bm!34286 () Bool)

(assert (=> bm!34286 (= call!34289 (arrayNoDuplicates!0 lt!316895 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78331 (Cons!13227 (select (arr!19151 lt!316895) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!697303 () Bool)

(assert (=> b!697303 (= e!396324 call!34289)))

(declare-fun b!697304 () Bool)

(assert (=> b!697304 (= e!396324 call!34289)))

(assert (= (and d!95943 (not res!461373)) b!697300))

(assert (= (and b!697300 res!461372) b!697302))

(assert (= (and b!697300 res!461374) b!697301))

(assert (= (and b!697301 c!78331) b!697303))

(assert (= (and b!697301 (not c!78331)) b!697304))

(assert (= (or b!697303 b!697304) bm!34286))

(declare-fun m!657173 () Bool)

(assert (=> b!697300 m!657173))

(assert (=> b!697300 m!657173))

(declare-fun m!657175 () Bool)

(assert (=> b!697300 m!657175))

(assert (=> b!697301 m!657173))

(assert (=> b!697301 m!657173))

(assert (=> b!697301 m!657175))

(assert (=> b!697302 m!657173))

(assert (=> b!697302 m!657173))

(declare-fun m!657177 () Bool)

(assert (=> b!697302 m!657177))

(assert (=> bm!34286 m!657173))

(declare-fun m!657179 () Bool)

(assert (=> bm!34286 m!657179))

(assert (=> b!697138 d!95943))

(declare-fun d!95945 () Bool)

(declare-fun e!396330 () Bool)

(assert (=> d!95945 e!396330))

(declare-fun res!461377 () Bool)

(assert (=> d!95945 (=> (not res!461377) (not e!396330))))

(assert (=> d!95945 (= res!461377 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19533 a!3626))))))

(declare-fun lt!316914 () Unit!24554)

(declare-fun choose!41 (array!39984 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13231) Unit!24554)

(assert (=> d!95945 (= lt!316914 (choose!41 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (=> d!95945 (bvslt (size!19533 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95945 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) lt!316914)))

(declare-fun b!697307 () Bool)

(assert (=> b!697307 (= e!396330 (arrayNoDuplicates!0 (array!39985 (store (arr!19151 a!3626) i!1382 k0!2843) (size!19533 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and d!95945 res!461377) b!697307))

(declare-fun m!657181 () Bool)

(assert (=> d!95945 m!657181))

(assert (=> b!697307 m!657085))

(declare-fun m!657183 () Bool)

(assert (=> b!697307 m!657183))

(assert (=> b!697138 d!95945))

(declare-fun d!95947 () Bool)

(declare-fun lt!316915 () Bool)

(assert (=> d!95947 (= lt!316915 (select (content!325 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!396331 () Bool)

(assert (=> d!95947 (= lt!316915 e!396331)))

(declare-fun res!461379 () Bool)

(assert (=> d!95947 (=> (not res!461379) (not e!396331))))

(assert (=> d!95947 (= res!461379 ((_ is Cons!13227) acc!681))))

(assert (=> d!95947 (= (contains!3753 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316915)))

(declare-fun b!697308 () Bool)

(declare-fun e!396332 () Bool)

(assert (=> b!697308 (= e!396331 e!396332)))

(declare-fun res!461378 () Bool)

(assert (=> b!697308 (=> res!461378 e!396332)))

(assert (=> b!697308 (= res!461378 (= (h!14272 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!697309 () Bool)

(assert (=> b!697309 (= e!396332 (contains!3753 (t!19504 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95947 res!461379) b!697308))

(assert (= (and b!697308 (not res!461378)) b!697309))

(assert (=> d!95947 m!657159))

(declare-fun m!657185 () Bool)

(assert (=> d!95947 m!657185))

(declare-fun m!657187 () Bool)

(assert (=> b!697309 m!657187))

(assert (=> b!697137 d!95947))

(assert (=> b!697147 d!95939))

(declare-fun b!697310 () Bool)

(declare-fun e!396334 () Bool)

(declare-fun e!396336 () Bool)

(assert (=> b!697310 (= e!396334 e!396336)))

(declare-fun res!461382 () Bool)

(assert (=> b!697310 (=> (not res!461382) (not e!396336))))

(declare-fun e!396335 () Bool)

(assert (=> b!697310 (= res!461382 (not e!396335))))

(declare-fun res!461380 () Bool)

(assert (=> b!697310 (=> (not res!461380) (not e!396335))))

(assert (=> b!697310 (= res!461380 (validKeyInArray!0 (select (arr!19151 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697311 () Bool)

(declare-fun e!396333 () Bool)

(assert (=> b!697311 (= e!396336 e!396333)))

(declare-fun c!78332 () Bool)

(assert (=> b!697311 (= c!78332 (validKeyInArray!0 (select (arr!19151 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95949 () Bool)

(declare-fun res!461381 () Bool)

(assert (=> d!95949 (=> res!461381 e!396334)))

(assert (=> d!95949 (= res!461381 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19533 a!3626)))))

(assert (=> d!95949 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396334)))

(declare-fun b!697312 () Bool)

(assert (=> b!697312 (= e!396335 (contains!3753 acc!681 (select (arr!19151 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34290 () Bool)

(declare-fun bm!34287 () Bool)

(assert (=> bm!34287 (= call!34290 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78332 (Cons!13227 (select (arr!19151 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!697313 () Bool)

(assert (=> b!697313 (= e!396333 call!34290)))

(declare-fun b!697314 () Bool)

(assert (=> b!697314 (= e!396333 call!34290)))

(assert (= (and d!95949 (not res!461381)) b!697310))

(assert (= (and b!697310 res!461380) b!697312))

(assert (= (and b!697310 res!461382) b!697311))

(assert (= (and b!697311 c!78332) b!697313))

(assert (= (and b!697311 (not c!78332)) b!697314))

(assert (= (or b!697313 b!697314) bm!34287))

(declare-fun m!657189 () Bool)

(assert (=> b!697310 m!657189))

(assert (=> b!697310 m!657189))

(declare-fun m!657191 () Bool)

(assert (=> b!697310 m!657191))

(assert (=> b!697311 m!657189))

(assert (=> b!697311 m!657189))

(assert (=> b!697311 m!657191))

(assert (=> b!697312 m!657189))

(assert (=> b!697312 m!657189))

(declare-fun m!657193 () Bool)

(assert (=> b!697312 m!657193))

(assert (=> bm!34287 m!657189))

(declare-fun m!657195 () Bool)

(assert (=> bm!34287 m!657195))

(assert (=> b!697136 d!95949))

(declare-fun d!95951 () Bool)

(assert (=> d!95951 (= (validKeyInArray!0 (select (arr!19151 a!3626) from!3004)) (and (not (= (select (arr!19151 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19151 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697135 d!95951))

(assert (=> b!697146 d!95939))

(declare-fun d!95953 () Bool)

(assert (=> d!95953 (= (array_inv!15034 a!3626) (bvsge (size!19533 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62216 d!95953))

(declare-fun b!697315 () Bool)

(declare-fun e!396338 () Bool)

(declare-fun e!396340 () Bool)

(assert (=> b!697315 (= e!396338 e!396340)))

(declare-fun res!461385 () Bool)

(assert (=> b!697315 (=> (not res!461385) (not e!396340))))

(declare-fun e!396339 () Bool)

(assert (=> b!697315 (= res!461385 (not e!396339))))

(declare-fun res!461383 () Bool)

(assert (=> b!697315 (=> (not res!461383) (not e!396339))))

(assert (=> b!697315 (= res!461383 (validKeyInArray!0 (select (arr!19151 a!3626) from!3004)))))

(declare-fun b!697316 () Bool)

(declare-fun e!396337 () Bool)

(assert (=> b!697316 (= e!396340 e!396337)))

(declare-fun c!78333 () Bool)

(assert (=> b!697316 (= c!78333 (validKeyInArray!0 (select (arr!19151 a!3626) from!3004)))))

(declare-fun d!95955 () Bool)

(declare-fun res!461384 () Bool)

(assert (=> d!95955 (=> res!461384 e!396338)))

(assert (=> d!95955 (= res!461384 (bvsge from!3004 (size!19533 a!3626)))))

(assert (=> d!95955 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!396338)))

(declare-fun b!697317 () Bool)

(assert (=> b!697317 (= e!396339 (contains!3753 acc!681 (select (arr!19151 a!3626) from!3004)))))

(declare-fun call!34291 () Bool)

(declare-fun bm!34288 () Bool)

(assert (=> bm!34288 (= call!34291 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78333 (Cons!13227 (select (arr!19151 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!697318 () Bool)

(assert (=> b!697318 (= e!396337 call!34291)))

(declare-fun b!697319 () Bool)

(assert (=> b!697319 (= e!396337 call!34291)))

(assert (= (and d!95955 (not res!461384)) b!697315))

(assert (= (and b!697315 res!461383) b!697317))

(assert (= (and b!697315 res!461385) b!697316))

(assert (= (and b!697316 c!78333) b!697318))

(assert (= (and b!697316 (not c!78333)) b!697319))

(assert (= (or b!697318 b!697319) bm!34288))

(assert (=> b!697315 m!657065))

(assert (=> b!697315 m!657065))

(assert (=> b!697315 m!657067))

(assert (=> b!697316 m!657065))

(assert (=> b!697316 m!657065))

(assert (=> b!697316 m!657067))

(assert (=> b!697317 m!657065))

(assert (=> b!697317 m!657065))

(declare-fun m!657197 () Bool)

(assert (=> b!697317 m!657197))

(assert (=> bm!34288 m!657065))

(declare-fun m!657199 () Bool)

(assert (=> bm!34288 m!657199))

(assert (=> b!697145 d!95955))

(assert (=> b!697134 d!95939))

(declare-fun d!95957 () Bool)

(declare-fun res!461390 () Bool)

(declare-fun e!396345 () Bool)

(assert (=> d!95957 (=> res!461390 e!396345)))

(assert (=> d!95957 (= res!461390 (= (select (arr!19151 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95957 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!396345)))

(declare-fun b!697324 () Bool)

(declare-fun e!396346 () Bool)

(assert (=> b!697324 (= e!396345 e!396346)))

(declare-fun res!461391 () Bool)

(assert (=> b!697324 (=> (not res!461391) (not e!396346))))

(assert (=> b!697324 (= res!461391 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19533 a!3626)))))

(declare-fun b!697325 () Bool)

(assert (=> b!697325 (= e!396346 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95957 (not res!461390)) b!697324))

(assert (= (and b!697324 res!461391) b!697325))

(declare-fun m!657201 () Bool)

(assert (=> d!95957 m!657201))

(declare-fun m!657203 () Bool)

(assert (=> b!697325 m!657203))

(assert (=> b!697133 d!95957))

(declare-fun d!95961 () Bool)

(declare-fun lt!316916 () Bool)

(assert (=> d!95961 (= lt!316916 (select (content!325 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!396347 () Bool)

(assert (=> d!95961 (= lt!316916 e!396347)))

(declare-fun res!461393 () Bool)

(assert (=> d!95961 (=> (not res!461393) (not e!396347))))

(assert (=> d!95961 (= res!461393 ((_ is Cons!13227) acc!681))))

(assert (=> d!95961 (= (contains!3753 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316916)))

(declare-fun b!697326 () Bool)

(declare-fun e!396348 () Bool)

(assert (=> b!697326 (= e!396347 e!396348)))

(declare-fun res!461392 () Bool)

(assert (=> b!697326 (=> res!461392 e!396348)))

(assert (=> b!697326 (= res!461392 (= (h!14272 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!697327 () Bool)

(assert (=> b!697327 (= e!396348 (contains!3753 (t!19504 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95961 res!461393) b!697326))

(assert (= (and b!697326 (not res!461392)) b!697327))

(assert (=> d!95961 m!657159))

(declare-fun m!657205 () Bool)

(assert (=> d!95961 m!657205))

(declare-fun m!657207 () Bool)

(assert (=> b!697327 m!657207))

(assert (=> b!697144 d!95961))

(declare-fun d!95963 () Bool)

(declare-fun res!461404 () Bool)

(declare-fun e!396361 () Bool)

(assert (=> d!95963 (=> res!461404 e!396361)))

(assert (=> d!95963 (= res!461404 ((_ is Nil!13228) acc!681))))

(assert (=> d!95963 (= (noDuplicate!1022 acc!681) e!396361)))

(declare-fun b!697342 () Bool)

(declare-fun e!396362 () Bool)

(assert (=> b!697342 (= e!396361 e!396362)))

(declare-fun res!461405 () Bool)

(assert (=> b!697342 (=> (not res!461405) (not e!396362))))

(assert (=> b!697342 (= res!461405 (not (contains!3753 (t!19504 acc!681) (h!14272 acc!681))))))

(declare-fun b!697343 () Bool)

(assert (=> b!697343 (= e!396362 (noDuplicate!1022 (t!19504 acc!681)))))

(assert (= (and d!95963 (not res!461404)) b!697342))

(assert (= (and b!697342 res!461405) b!697343))

(declare-fun m!657209 () Bool)

(assert (=> b!697342 m!657209))

(declare-fun m!657211 () Bool)

(assert (=> b!697343 m!657211))

(assert (=> b!697143 d!95963))

(declare-fun b!697344 () Bool)

(declare-fun e!396364 () Bool)

(declare-fun e!396366 () Bool)

(assert (=> b!697344 (= e!396364 e!396366)))

(declare-fun res!461408 () Bool)

(assert (=> b!697344 (=> (not res!461408) (not e!396366))))

(declare-fun e!396365 () Bool)

(assert (=> b!697344 (= res!461408 (not e!396365))))

(declare-fun res!461406 () Bool)

(assert (=> b!697344 (=> (not res!461406) (not e!396365))))

(assert (=> b!697344 (= res!461406 (validKeyInArray!0 (select (arr!19151 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!697345 () Bool)

(declare-fun e!396363 () Bool)

(assert (=> b!697345 (= e!396366 e!396363)))

(declare-fun c!78336 () Bool)

(assert (=> b!697345 (= c!78336 (validKeyInArray!0 (select (arr!19151 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95965 () Bool)

(declare-fun res!461407 () Bool)

(assert (=> d!95965 (=> res!461407 e!396364)))

(assert (=> d!95965 (= res!461407 (bvsge #b00000000000000000000000000000000 (size!19533 a!3626)))))

(assert (=> d!95965 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13228) e!396364)))

(declare-fun b!697346 () Bool)

(assert (=> b!697346 (= e!396365 (contains!3753 Nil!13228 (select (arr!19151 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34291 () Bool)

(declare-fun call!34294 () Bool)

(assert (=> bm!34291 (= call!34294 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78336 (Cons!13227 (select (arr!19151 a!3626) #b00000000000000000000000000000000) Nil!13228) Nil!13228)))))

(declare-fun b!697347 () Bool)

(assert (=> b!697347 (= e!396363 call!34294)))

(declare-fun b!697348 () Bool)

(assert (=> b!697348 (= e!396363 call!34294)))

(assert (= (and d!95965 (not res!461407)) b!697344))

(assert (= (and b!697344 res!461406) b!697346))

(assert (= (and b!697344 res!461408) b!697345))

(assert (= (and b!697345 c!78336) b!697347))

(assert (= (and b!697345 (not c!78336)) b!697348))

(assert (= (or b!697347 b!697348) bm!34291))

(assert (=> b!697344 m!657201))

(assert (=> b!697344 m!657201))

(declare-fun m!657213 () Bool)

(assert (=> b!697344 m!657213))

(assert (=> b!697345 m!657201))

(assert (=> b!697345 m!657201))

(assert (=> b!697345 m!657213))

(assert (=> b!697346 m!657201))

(assert (=> b!697346 m!657201))

(declare-fun m!657215 () Bool)

(assert (=> b!697346 m!657215))

(assert (=> bm!34291 m!657201))

(declare-fun m!657217 () Bool)

(assert (=> bm!34291 m!657217))

(assert (=> b!697142 d!95965))

(check-sat (not b!697300) (not d!95947) (not b!697307) (not b!697343) (not b!697297) (not bm!34287) (not b!697311) (not b!697312) (not b!697296) (not b!697301) (not b!697317) (not b!697309) (not b!697345) (not b!697316) (not d!95961) (not b!697342) (not b!697315) (not d!95945) (not b!697310) (not bm!34288) (not b!697346) (not b!697284) (not b!697327) (not b!697325) (not bm!34291) (not bm!34285) (not b!697344) (not d!95939) (not bm!34286) (not b!697295) (not b!697302))
(check-sat)
