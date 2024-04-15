; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62642 () Bool)

(assert start!62642)

(declare-fun b!707156 () Bool)

(declare-fun res!471132 () Bool)

(declare-fun e!397918 () Bool)

(assert (=> b!707156 (=> (not res!471132) (not e!397918))))

(declare-datatypes ((List!13402 0))(
  ( (Nil!13399) (Cons!13398 (h!14443 (_ BitVec 64)) (t!19675 List!13402)) )
))
(declare-fun acc!652 () List!13402)

(declare-fun contains!3924 (List!13402 (_ BitVec 64)) Bool)

(assert (=> b!707156 (= res!471132 (not (contains!3924 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707157 () Bool)

(declare-fun res!471137 () Bool)

(assert (=> b!707157 (=> (not res!471137) (not e!397918))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!707157 (= res!471137 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707158 () Bool)

(declare-fun res!471139 () Bool)

(assert (=> b!707158 (=> (not res!471139) (not e!397918))))

(declare-datatypes ((array!40332 0))(
  ( (array!40333 (arr!19322 (Array (_ BitVec 32) (_ BitVec 64))) (size!19704 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40332)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707158 (= res!471139 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707159 () Bool)

(declare-fun res!471128 () Bool)

(assert (=> b!707159 (=> (not res!471128) (not e!397918))))

(declare-fun newAcc!49 () List!13402)

(assert (=> b!707159 (= res!471128 (not (contains!3924 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707160 () Bool)

(declare-fun res!471131 () Bool)

(assert (=> b!707160 (=> (not res!471131) (not e!397918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707160 (= res!471131 (validKeyInArray!0 k0!2824))))

(declare-fun b!707161 () Bool)

(declare-fun res!471126 () Bool)

(assert (=> b!707161 (=> (not res!471126) (not e!397918))))

(assert (=> b!707161 (= res!471126 (not (contains!3924 acc!652 k0!2824)))))

(declare-fun b!707163 () Bool)

(declare-fun res!471140 () Bool)

(assert (=> b!707163 (=> (not res!471140) (not e!397918))))

(declare-fun arrayNoDuplicates!0 (array!40332 (_ BitVec 32) List!13402) Bool)

(assert (=> b!707163 (= res!471140 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707164 () Bool)

(declare-fun res!471133 () Bool)

(assert (=> b!707164 (=> (not res!471133) (not e!397918))))

(assert (=> b!707164 (= res!471133 (contains!3924 newAcc!49 k0!2824))))

(declare-fun b!707165 () Bool)

(declare-fun res!471142 () Bool)

(assert (=> b!707165 (=> (not res!471142) (not e!397918))))

(declare-fun noDuplicate!1193 (List!13402) Bool)

(assert (=> b!707165 (= res!471142 (noDuplicate!1193 newAcc!49))))

(declare-fun b!707166 () Bool)

(declare-fun res!471136 () Bool)

(assert (=> b!707166 (=> (not res!471136) (not e!397918))))

(assert (=> b!707166 (= res!471136 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19704 a!3591)))))

(declare-fun b!707167 () Bool)

(declare-fun res!471135 () Bool)

(assert (=> b!707167 (=> (not res!471135) (not e!397918))))

(assert (=> b!707167 (= res!471135 (not (contains!3924 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707168 () Bool)

(declare-fun res!471141 () Bool)

(assert (=> b!707168 (=> (not res!471141) (not e!397918))))

(declare-fun -!351 (List!13402 (_ BitVec 64)) List!13402)

(assert (=> b!707168 (= res!471141 (= (-!351 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707169 () Bool)

(declare-fun $colon$colon!496 (List!13402 (_ BitVec 64)) List!13402)

(assert (=> b!707169 (= e!397918 (not (noDuplicate!1193 ($colon$colon!496 acc!652 (select (arr!19322 a!3591) from!2969)))))))

(declare-fun b!707170 () Bool)

(declare-fun res!471129 () Bool)

(assert (=> b!707170 (=> (not res!471129) (not e!397918))))

(assert (=> b!707170 (= res!471129 (validKeyInArray!0 (select (arr!19322 a!3591) from!2969)))))

(declare-fun b!707171 () Bool)

(declare-fun res!471134 () Bool)

(assert (=> b!707171 (=> (not res!471134) (not e!397918))))

(declare-fun subseq!386 (List!13402 List!13402) Bool)

(assert (=> b!707171 (= res!471134 (subseq!386 acc!652 newAcc!49))))

(declare-fun b!707172 () Bool)

(declare-fun res!471127 () Bool)

(assert (=> b!707172 (=> (not res!471127) (not e!397918))))

(assert (=> b!707172 (= res!471127 (noDuplicate!1193 acc!652))))

(declare-fun res!471130 () Bool)

(assert (=> start!62642 (=> (not res!471130) (not e!397918))))

(assert (=> start!62642 (= res!471130 (and (bvslt (size!19704 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19704 a!3591))))))

(assert (=> start!62642 e!397918))

(assert (=> start!62642 true))

(declare-fun array_inv!15205 (array!40332) Bool)

(assert (=> start!62642 (array_inv!15205 a!3591)))

(declare-fun b!707162 () Bool)

(declare-fun res!471138 () Bool)

(assert (=> b!707162 (=> (not res!471138) (not e!397918))))

(assert (=> b!707162 (= res!471138 (not (contains!3924 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62642 res!471130) b!707172))

(assert (= (and b!707172 res!471127) b!707165))

(assert (= (and b!707165 res!471142) b!707167))

(assert (= (and b!707167 res!471135) b!707156))

(assert (= (and b!707156 res!471132) b!707158))

(assert (= (and b!707158 res!471139) b!707161))

(assert (= (and b!707161 res!471126) b!707160))

(assert (= (and b!707160 res!471131) b!707163))

(assert (= (and b!707163 res!471140) b!707171))

(assert (= (and b!707171 res!471134) b!707164))

(assert (= (and b!707164 res!471133) b!707168))

(assert (= (and b!707168 res!471141) b!707159))

(assert (= (and b!707159 res!471128) b!707162))

(assert (= (and b!707162 res!471138) b!707166))

(assert (= (and b!707166 res!471136) b!707170))

(assert (= (and b!707170 res!471129) b!707157))

(assert (= (and b!707157 res!471137) b!707169))

(declare-fun m!664251 () Bool)

(assert (=> b!707163 m!664251))

(declare-fun m!664253 () Bool)

(assert (=> b!707171 m!664253))

(declare-fun m!664255 () Bool)

(assert (=> start!62642 m!664255))

(declare-fun m!664257 () Bool)

(assert (=> b!707160 m!664257))

(declare-fun m!664259 () Bool)

(assert (=> b!707165 m!664259))

(declare-fun m!664261 () Bool)

(assert (=> b!707169 m!664261))

(assert (=> b!707169 m!664261))

(declare-fun m!664263 () Bool)

(assert (=> b!707169 m!664263))

(assert (=> b!707169 m!664263))

(declare-fun m!664265 () Bool)

(assert (=> b!707169 m!664265))

(declare-fun m!664267 () Bool)

(assert (=> b!707172 m!664267))

(declare-fun m!664269 () Bool)

(assert (=> b!707159 m!664269))

(declare-fun m!664271 () Bool)

(assert (=> b!707168 m!664271))

(declare-fun m!664273 () Bool)

(assert (=> b!707162 m!664273))

(assert (=> b!707170 m!664261))

(assert (=> b!707170 m!664261))

(declare-fun m!664275 () Bool)

(assert (=> b!707170 m!664275))

(declare-fun m!664277 () Bool)

(assert (=> b!707161 m!664277))

(declare-fun m!664279 () Bool)

(assert (=> b!707164 m!664279))

(declare-fun m!664281 () Bool)

(assert (=> b!707167 m!664281))

(declare-fun m!664283 () Bool)

(assert (=> b!707156 m!664283))

(declare-fun m!664285 () Bool)

(assert (=> b!707158 m!664285))

(check-sat (not b!707158) (not b!707160) (not b!707159) (not b!707163) (not b!707172) (not b!707161) (not b!707171) (not b!707170) (not b!707169) (not b!707164) (not start!62642) (not b!707168) (not b!707167) (not b!707156) (not b!707165) (not b!707162))
(check-sat)
(get-model)

(declare-fun d!96291 () Bool)

(declare-fun res!471249 () Bool)

(declare-fun e!397936 () Bool)

(assert (=> d!96291 (=> res!471249 e!397936)))

(get-info :version)

(assert (=> d!96291 (= res!471249 ((_ is Nil!13399) newAcc!49))))

(assert (=> d!96291 (= (noDuplicate!1193 newAcc!49) e!397936)))

(declare-fun b!707279 () Bool)

(declare-fun e!397937 () Bool)

(assert (=> b!707279 (= e!397936 e!397937)))

(declare-fun res!471250 () Bool)

(assert (=> b!707279 (=> (not res!471250) (not e!397937))))

(assert (=> b!707279 (= res!471250 (not (contains!3924 (t!19675 newAcc!49) (h!14443 newAcc!49))))))

(declare-fun b!707280 () Bool)

(assert (=> b!707280 (= e!397937 (noDuplicate!1193 (t!19675 newAcc!49)))))

(assert (= (and d!96291 (not res!471249)) b!707279))

(assert (= (and b!707279 res!471250) b!707280))

(declare-fun m!664359 () Bool)

(assert (=> b!707279 m!664359))

(declare-fun m!664361 () Bool)

(assert (=> b!707280 m!664361))

(assert (=> b!707165 d!96291))

(declare-fun d!96293 () Bool)

(declare-fun lt!317754 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!331 (List!13402) (InoxSet (_ BitVec 64)))

(assert (=> d!96293 (= lt!317754 (select (content!331 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!397943 () Bool)

(assert (=> d!96293 (= lt!317754 e!397943)))

(declare-fun res!471255 () Bool)

(assert (=> d!96293 (=> (not res!471255) (not e!397943))))

(assert (=> d!96293 (= res!471255 ((_ is Cons!13398) acc!652))))

(assert (=> d!96293 (= (contains!3924 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317754)))

(declare-fun b!707285 () Bool)

(declare-fun e!397942 () Bool)

(assert (=> b!707285 (= e!397943 e!397942)))

(declare-fun res!471256 () Bool)

(assert (=> b!707285 (=> res!471256 e!397942)))

(assert (=> b!707285 (= res!471256 (= (h!14443 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707286 () Bool)

(assert (=> b!707286 (= e!397942 (contains!3924 (t!19675 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96293 res!471255) b!707285))

(assert (= (and b!707285 (not res!471256)) b!707286))

(declare-fun m!664363 () Bool)

(assert (=> d!96293 m!664363))

(declare-fun m!664365 () Bool)

(assert (=> d!96293 m!664365))

(declare-fun m!664367 () Bool)

(assert (=> b!707286 m!664367))

(assert (=> b!707156 d!96293))

(declare-fun d!96295 () Bool)

(declare-fun lt!317755 () Bool)

(assert (=> d!96295 (= lt!317755 (select (content!331 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!397945 () Bool)

(assert (=> d!96295 (= lt!317755 e!397945)))

(declare-fun res!471257 () Bool)

(assert (=> d!96295 (=> (not res!471257) (not e!397945))))

(assert (=> d!96295 (= res!471257 ((_ is Cons!13398) acc!652))))

(assert (=> d!96295 (= (contains!3924 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317755)))

(declare-fun b!707287 () Bool)

(declare-fun e!397944 () Bool)

(assert (=> b!707287 (= e!397945 e!397944)))

(declare-fun res!471258 () Bool)

(assert (=> b!707287 (=> res!471258 e!397944)))

(assert (=> b!707287 (= res!471258 (= (h!14443 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707288 () Bool)

(assert (=> b!707288 (= e!397944 (contains!3924 (t!19675 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96295 res!471257) b!707287))

(assert (= (and b!707287 (not res!471258)) b!707288))

(assert (=> d!96295 m!664363))

(declare-fun m!664369 () Bool)

(assert (=> d!96295 m!664369))

(declare-fun m!664371 () Bool)

(assert (=> b!707288 m!664371))

(assert (=> b!707167 d!96295))

(declare-fun d!96297 () Bool)

(declare-fun res!471273 () Bool)

(declare-fun e!397962 () Bool)

(assert (=> d!96297 (=> res!471273 e!397962)))

(assert (=> d!96297 (= res!471273 (bvsge from!2969 (size!19704 a!3591)))))

(assert (=> d!96297 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!397962)))

(declare-fun bm!34330 () Bool)

(declare-fun c!78384 () Bool)

(declare-fun call!34333 () Bool)

(assert (=> bm!34330 (= call!34333 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78384 (Cons!13398 (select (arr!19322 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!707305 () Bool)

(declare-fun e!397960 () Bool)

(assert (=> b!707305 (= e!397960 call!34333)))

(declare-fun b!707306 () Bool)

(declare-fun e!397961 () Bool)

(assert (=> b!707306 (= e!397961 e!397960)))

(assert (=> b!707306 (= c!78384 (validKeyInArray!0 (select (arr!19322 a!3591) from!2969)))))

(declare-fun b!707307 () Bool)

(declare-fun e!397963 () Bool)

(assert (=> b!707307 (= e!397963 (contains!3924 acc!652 (select (arr!19322 a!3591) from!2969)))))

(declare-fun b!707308 () Bool)

(assert (=> b!707308 (= e!397960 call!34333)))

(declare-fun b!707309 () Bool)

(assert (=> b!707309 (= e!397962 e!397961)))

(declare-fun res!471272 () Bool)

(assert (=> b!707309 (=> (not res!471272) (not e!397961))))

(assert (=> b!707309 (= res!471272 (not e!397963))))

(declare-fun res!471271 () Bool)

(assert (=> b!707309 (=> (not res!471271) (not e!397963))))

(assert (=> b!707309 (= res!471271 (validKeyInArray!0 (select (arr!19322 a!3591) from!2969)))))

(assert (= (and d!96297 (not res!471273)) b!707309))

(assert (= (and b!707309 res!471271) b!707307))

(assert (= (and b!707309 res!471272) b!707306))

(assert (= (and b!707306 c!78384) b!707305))

(assert (= (and b!707306 (not c!78384)) b!707308))

(assert (= (or b!707305 b!707308) bm!34330))

(assert (=> bm!34330 m!664261))

(declare-fun m!664385 () Bool)

(assert (=> bm!34330 m!664385))

(assert (=> b!707306 m!664261))

(assert (=> b!707306 m!664261))

(assert (=> b!707306 m!664275))

(assert (=> b!707307 m!664261))

(assert (=> b!707307 m!664261))

(declare-fun m!664387 () Bool)

(assert (=> b!707307 m!664387))

(assert (=> b!707309 m!664261))

(assert (=> b!707309 m!664261))

(assert (=> b!707309 m!664275))

(assert (=> b!707163 d!96297))

(declare-fun d!96307 () Bool)

(declare-fun lt!317762 () Bool)

(assert (=> d!96307 (= lt!317762 (select (content!331 newAcc!49) k0!2824))))

(declare-fun e!397972 () Bool)

(assert (=> d!96307 (= lt!317762 e!397972)))

(declare-fun res!471276 () Bool)

(assert (=> d!96307 (=> (not res!471276) (not e!397972))))

(assert (=> d!96307 (= res!471276 ((_ is Cons!13398) newAcc!49))))

(assert (=> d!96307 (= (contains!3924 newAcc!49 k0!2824) lt!317762)))

(declare-fun b!707320 () Bool)

(declare-fun e!397971 () Bool)

(assert (=> b!707320 (= e!397972 e!397971)))

(declare-fun res!471277 () Bool)

(assert (=> b!707320 (=> res!471277 e!397971)))

(assert (=> b!707320 (= res!471277 (= (h!14443 newAcc!49) k0!2824))))

(declare-fun b!707321 () Bool)

(assert (=> b!707321 (= e!397971 (contains!3924 (t!19675 newAcc!49) k0!2824))))

(assert (= (and d!96307 res!471276) b!707320))

(assert (= (and b!707320 (not res!471277)) b!707321))

(declare-fun m!664389 () Bool)

(assert (=> d!96307 m!664389))

(declare-fun m!664391 () Bool)

(assert (=> d!96307 m!664391))

(declare-fun m!664393 () Bool)

(assert (=> b!707321 m!664393))

(assert (=> b!707164 d!96307))

(declare-fun d!96309 () Bool)

(assert (=> d!96309 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707160 d!96309))

(declare-fun d!96311 () Bool)

(assert (=> d!96311 (= (array_inv!15205 a!3591) (bvsge (size!19704 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62642 d!96311))

(declare-fun b!707353 () Bool)

(declare-fun e!398005 () Bool)

(declare-fun e!398003 () Bool)

(assert (=> b!707353 (= e!398005 e!398003)))

(declare-fun res!471306 () Bool)

(assert (=> b!707353 (=> (not res!471306) (not e!398003))))

(assert (=> b!707353 (= res!471306 ((_ is Cons!13398) newAcc!49))))

(declare-fun b!707356 () Bool)

(declare-fun e!398002 () Bool)

(assert (=> b!707356 (= e!398002 (subseq!386 acc!652 (t!19675 newAcc!49)))))

(declare-fun b!707354 () Bool)

(assert (=> b!707354 (= e!398003 e!398002)))

(declare-fun res!471307 () Bool)

(assert (=> b!707354 (=> res!471307 e!398002)))

(declare-fun e!398004 () Bool)

(assert (=> b!707354 (= res!471307 e!398004)))

(declare-fun res!471308 () Bool)

(assert (=> b!707354 (=> (not res!471308) (not e!398004))))

(assert (=> b!707354 (= res!471308 (= (h!14443 acc!652) (h!14443 newAcc!49)))))

(declare-fun d!96313 () Bool)

(declare-fun res!471305 () Bool)

(assert (=> d!96313 (=> res!471305 e!398005)))

(assert (=> d!96313 (= res!471305 ((_ is Nil!13399) acc!652))))

(assert (=> d!96313 (= (subseq!386 acc!652 newAcc!49) e!398005)))

(declare-fun b!707355 () Bool)

(assert (=> b!707355 (= e!398004 (subseq!386 (t!19675 acc!652) (t!19675 newAcc!49)))))

(assert (= (and d!96313 (not res!471305)) b!707353))

(assert (= (and b!707353 res!471306) b!707354))

(assert (= (and b!707354 res!471308) b!707355))

(assert (= (and b!707354 (not res!471307)) b!707356))

(declare-fun m!664423 () Bool)

(assert (=> b!707356 m!664423))

(declare-fun m!664425 () Bool)

(assert (=> b!707355 m!664425))

(assert (=> b!707171 d!96313))

(declare-fun d!96329 () Bool)

(declare-fun lt!317769 () Bool)

(assert (=> d!96329 (= lt!317769 (select (content!331 acc!652) k0!2824))))

(declare-fun e!398007 () Bool)

(assert (=> d!96329 (= lt!317769 e!398007)))

(declare-fun res!471309 () Bool)

(assert (=> d!96329 (=> (not res!471309) (not e!398007))))

(assert (=> d!96329 (= res!471309 ((_ is Cons!13398) acc!652))))

(assert (=> d!96329 (= (contains!3924 acc!652 k0!2824) lt!317769)))

(declare-fun b!707357 () Bool)

(declare-fun e!398006 () Bool)

(assert (=> b!707357 (= e!398007 e!398006)))

(declare-fun res!471310 () Bool)

(assert (=> b!707357 (=> res!471310 e!398006)))

(assert (=> b!707357 (= res!471310 (= (h!14443 acc!652) k0!2824))))

(declare-fun b!707358 () Bool)

(assert (=> b!707358 (= e!398006 (contains!3924 (t!19675 acc!652) k0!2824))))

(assert (= (and d!96329 res!471309) b!707357))

(assert (= (and b!707357 (not res!471310)) b!707358))

(assert (=> d!96329 m!664363))

(declare-fun m!664427 () Bool)

(assert (=> d!96329 m!664427))

(declare-fun m!664429 () Bool)

(assert (=> b!707358 m!664429))

(assert (=> b!707161 d!96329))

(declare-fun d!96331 () Bool)

(declare-fun res!471311 () Bool)

(declare-fun e!398008 () Bool)

(assert (=> d!96331 (=> res!471311 e!398008)))

(assert (=> d!96331 (= res!471311 ((_ is Nil!13399) acc!652))))

(assert (=> d!96331 (= (noDuplicate!1193 acc!652) e!398008)))

(declare-fun b!707359 () Bool)

(declare-fun e!398009 () Bool)

(assert (=> b!707359 (= e!398008 e!398009)))

(declare-fun res!471312 () Bool)

(assert (=> b!707359 (=> (not res!471312) (not e!398009))))

(assert (=> b!707359 (= res!471312 (not (contains!3924 (t!19675 acc!652) (h!14443 acc!652))))))

(declare-fun b!707360 () Bool)

(assert (=> b!707360 (= e!398009 (noDuplicate!1193 (t!19675 acc!652)))))

(assert (= (and d!96331 (not res!471311)) b!707359))

(assert (= (and b!707359 res!471312) b!707360))

(declare-fun m!664431 () Bool)

(assert (=> b!707359 m!664431))

(declare-fun m!664433 () Bool)

(assert (=> b!707360 m!664433))

(assert (=> b!707172 d!96331))

(declare-fun d!96333 () Bool)

(declare-fun lt!317771 () Bool)

(assert (=> d!96333 (= lt!317771 (select (content!331 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398013 () Bool)

(assert (=> d!96333 (= lt!317771 e!398013)))

(declare-fun res!471315 () Bool)

(assert (=> d!96333 (=> (not res!471315) (not e!398013))))

(assert (=> d!96333 (= res!471315 ((_ is Cons!13398) newAcc!49))))

(assert (=> d!96333 (= (contains!3924 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317771)))

(declare-fun b!707363 () Bool)

(declare-fun e!398012 () Bool)

(assert (=> b!707363 (= e!398013 e!398012)))

(declare-fun res!471316 () Bool)

(assert (=> b!707363 (=> res!471316 e!398012)))

(assert (=> b!707363 (= res!471316 (= (h!14443 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707364 () Bool)

(assert (=> b!707364 (= e!398012 (contains!3924 (t!19675 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96333 res!471315) b!707363))

(assert (= (and b!707363 (not res!471316)) b!707364))

(assert (=> d!96333 m!664389))

(declare-fun m!664437 () Bool)

(assert (=> d!96333 m!664437))

(declare-fun m!664441 () Bool)

(assert (=> b!707364 m!664441))

(assert (=> b!707162 d!96333))

(declare-fun b!707408 () Bool)

(declare-fun e!398055 () List!13402)

(declare-fun call!34342 () List!13402)

(assert (=> b!707408 (= e!398055 (Cons!13398 (h!14443 newAcc!49) call!34342))))

(declare-fun b!707409 () Bool)

(declare-fun e!398053 () List!13402)

(assert (=> b!707409 (= e!398053 e!398055)))

(declare-fun c!78398 () Bool)

(assert (=> b!707409 (= c!78398 (= k0!2824 (h!14443 newAcc!49)))))

(declare-fun b!707410 () Bool)

(assert (=> b!707410 (= e!398055 call!34342)))

(declare-fun d!96337 () Bool)

(declare-fun e!398054 () Bool)

(assert (=> d!96337 e!398054))

(declare-fun res!471348 () Bool)

(assert (=> d!96337 (=> (not res!471348) (not e!398054))))

(declare-fun lt!317775 () List!13402)

(declare-fun size!19708 (List!13402) Int)

(assert (=> d!96337 (= res!471348 (<= (size!19708 lt!317775) (size!19708 newAcc!49)))))

(assert (=> d!96337 (= lt!317775 e!398053)))

(declare-fun c!78399 () Bool)

(assert (=> d!96337 (= c!78399 ((_ is Cons!13398) newAcc!49))))

(assert (=> d!96337 (= (-!351 newAcc!49 k0!2824) lt!317775)))

(declare-fun b!707411 () Bool)

(assert (=> b!707411 (= e!398053 Nil!13399)))

(declare-fun b!707412 () Bool)

(assert (=> b!707412 (= e!398054 (= (content!331 lt!317775) ((_ map and) (content!331 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34339 () Bool)

(assert (=> bm!34339 (= call!34342 (-!351 (t!19675 newAcc!49) k0!2824))))

(assert (= (and d!96337 c!78399) b!707409))

(assert (= (and d!96337 (not c!78399)) b!707411))

(assert (= (and b!707409 c!78398) b!707410))

(assert (= (and b!707409 (not c!78398)) b!707408))

(assert (= (or b!707410 b!707408) bm!34339))

(assert (= (and d!96337 res!471348) b!707412))

(declare-fun m!664457 () Bool)

(assert (=> d!96337 m!664457))

(declare-fun m!664459 () Bool)

(assert (=> d!96337 m!664459))

(declare-fun m!664461 () Bool)

(assert (=> b!707412 m!664461))

(assert (=> b!707412 m!664389))

(declare-fun m!664463 () Bool)

(assert (=> b!707412 m!664463))

(declare-fun m!664465 () Bool)

(assert (=> bm!34339 m!664465))

(assert (=> b!707168 d!96337))

(declare-fun d!96345 () Bool)

(declare-fun res!471365 () Bool)

(declare-fun e!398074 () Bool)

(assert (=> d!96345 (=> res!471365 e!398074)))

(assert (=> d!96345 (= res!471365 (= (select (arr!19322 a!3591) from!2969) k0!2824))))

(assert (=> d!96345 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398074)))

(declare-fun b!707435 () Bool)

(declare-fun e!398075 () Bool)

(assert (=> b!707435 (= e!398074 e!398075)))

(declare-fun res!471366 () Bool)

(assert (=> b!707435 (=> (not res!471366) (not e!398075))))

(assert (=> b!707435 (= res!471366 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19704 a!3591)))))

(declare-fun b!707436 () Bool)

(assert (=> b!707436 (= e!398075 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96345 (not res!471365)) b!707435))

(assert (= (and b!707435 res!471366) b!707436))

(assert (=> d!96345 m!664261))

(declare-fun m!664471 () Bool)

(assert (=> b!707436 m!664471))

(assert (=> b!707158 d!96345))

(declare-fun d!96349 () Bool)

(declare-fun res!471371 () Bool)

(declare-fun e!398080 () Bool)

(assert (=> d!96349 (=> res!471371 e!398080)))

(assert (=> d!96349 (= res!471371 ((_ is Nil!13399) ($colon$colon!496 acc!652 (select (arr!19322 a!3591) from!2969))))))

(assert (=> d!96349 (= (noDuplicate!1193 ($colon$colon!496 acc!652 (select (arr!19322 a!3591) from!2969))) e!398080)))

(declare-fun b!707441 () Bool)

(declare-fun e!398081 () Bool)

(assert (=> b!707441 (= e!398080 e!398081)))

(declare-fun res!471372 () Bool)

(assert (=> b!707441 (=> (not res!471372) (not e!398081))))

(assert (=> b!707441 (= res!471372 (not (contains!3924 (t!19675 ($colon$colon!496 acc!652 (select (arr!19322 a!3591) from!2969))) (h!14443 ($colon$colon!496 acc!652 (select (arr!19322 a!3591) from!2969))))))))

(declare-fun b!707442 () Bool)

(assert (=> b!707442 (= e!398081 (noDuplicate!1193 (t!19675 ($colon$colon!496 acc!652 (select (arr!19322 a!3591) from!2969)))))))

(assert (= (and d!96349 (not res!471371)) b!707441))

(assert (= (and b!707441 res!471372) b!707442))

(declare-fun m!664473 () Bool)

(assert (=> b!707441 m!664473))

(declare-fun m!664475 () Bool)

(assert (=> b!707442 m!664475))

(assert (=> b!707169 d!96349))

(declare-fun d!96351 () Bool)

(assert (=> d!96351 (= ($colon$colon!496 acc!652 (select (arr!19322 a!3591) from!2969)) (Cons!13398 (select (arr!19322 a!3591) from!2969) acc!652))))

(assert (=> b!707169 d!96351))

(declare-fun d!96353 () Bool)

(declare-fun lt!317776 () Bool)

(assert (=> d!96353 (= lt!317776 (select (content!331 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398085 () Bool)

(assert (=> d!96353 (= lt!317776 e!398085)))

(declare-fun res!471375 () Bool)

(assert (=> d!96353 (=> (not res!471375) (not e!398085))))

(assert (=> d!96353 (= res!471375 ((_ is Cons!13398) newAcc!49))))

(assert (=> d!96353 (= (contains!3924 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317776)))

(declare-fun b!707445 () Bool)

(declare-fun e!398084 () Bool)

(assert (=> b!707445 (= e!398085 e!398084)))

(declare-fun res!471376 () Bool)

(assert (=> b!707445 (=> res!471376 e!398084)))

(assert (=> b!707445 (= res!471376 (= (h!14443 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707446 () Bool)

(assert (=> b!707446 (= e!398084 (contains!3924 (t!19675 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96353 res!471375) b!707445))

(assert (= (and b!707445 (not res!471376)) b!707446))

(assert (=> d!96353 m!664389))

(declare-fun m!664479 () Bool)

(assert (=> d!96353 m!664479))

(declare-fun m!664481 () Bool)

(assert (=> b!707446 m!664481))

(assert (=> b!707159 d!96353))

(declare-fun d!96357 () Bool)

(assert (=> d!96357 (= (validKeyInArray!0 (select (arr!19322 a!3591) from!2969)) (and (not (= (select (arr!19322 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19322 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707170 d!96357))

(check-sat (not b!707412) (not d!96333) (not b!707321) (not b!707280) (not b!707309) (not d!96337) (not b!707307) (not b!707358) (not b!707306) (not b!707288) (not b!707442) (not b!707360) (not d!96329) (not b!707441) (not b!707356) (not b!707359) (not d!96293) (not b!707279) (not b!707355) (not b!707286) (not bm!34330) (not bm!34339) (not d!96307) (not b!707436) (not b!707364) (not d!96353) (not b!707446) (not d!96295))
(check-sat)
