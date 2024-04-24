; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59790 () Bool)

(assert start!59790)

(declare-fun b!660123 () Bool)

(declare-fun res!428078 () Bool)

(declare-fun e!379316 () Bool)

(assert (=> b!660123 (=> (not res!428078) (not e!379316))))

(declare-datatypes ((List!12534 0))(
  ( (Nil!12531) (Cons!12530 (h!13578 (_ BitVec 64)) (t!18754 List!12534)) )
))
(declare-fun noDuplicate!460 (List!12534) Bool)

(assert (=> b!660123 (= res!428078 (noDuplicate!460 Nil!12531))))

(declare-fun b!660124 () Bool)

(declare-fun e!379319 () Bool)

(declare-fun acc!681 () List!12534)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3186 (List!12534 (_ BitVec 64)) Bool)

(assert (=> b!660124 (= e!379319 (not (contains!3186 acc!681 k0!2843)))))

(declare-fun b!660125 () Bool)

(declare-fun e!379318 () Bool)

(assert (=> b!660125 (= e!379318 (contains!3186 Nil!12531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660126 () Bool)

(declare-fun res!428084 () Bool)

(assert (=> b!660126 (=> (not res!428084) (not e!379316))))

(assert (=> b!660126 (= res!428084 (not (contains!3186 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660127 () Bool)

(declare-fun res!428085 () Bool)

(assert (=> b!660127 (=> (not res!428085) (not e!379316))))

(declare-fun e!379315 () Bool)

(assert (=> b!660127 (= res!428085 e!379315)))

(declare-fun res!428076 () Bool)

(assert (=> b!660127 (=> res!428076 e!379315)))

(declare-fun e!379320 () Bool)

(assert (=> b!660127 (= res!428076 e!379320)))

(declare-fun res!428083 () Bool)

(assert (=> b!660127 (=> (not res!428083) (not e!379320))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660127 (= res!428083 (bvsgt from!3004 i!1382))))

(declare-fun b!660128 () Bool)

(assert (=> b!660128 (= e!379316 e!379318)))

(declare-fun res!428080 () Bool)

(assert (=> b!660128 (=> res!428080 e!379318)))

(assert (=> b!660128 (= res!428080 (contains!3186 Nil!12531 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!428086 () Bool)

(assert (=> start!59790 (=> (not res!428086) (not e!379316))))

(declare-datatypes ((array!38790 0))(
  ( (array!38791 (arr!18586 (Array (_ BitVec 32) (_ BitVec 64))) (size!18950 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38790)

(assert (=> start!59790 (= res!428086 (and (bvslt (size!18950 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18950 a!3626))))))

(assert (=> start!59790 e!379316))

(assert (=> start!59790 true))

(declare-fun array_inv!14445 (array!38790) Bool)

(assert (=> start!59790 (array_inv!14445 a!3626)))

(declare-fun b!660129 () Bool)

(assert (=> b!660129 (= e!379320 (contains!3186 acc!681 k0!2843))))

(declare-fun b!660130 () Bool)

(declare-fun res!428082 () Bool)

(assert (=> b!660130 (=> (not res!428082) (not e!379316))))

(assert (=> b!660130 (= res!428082 (bvsle #b00000000000000000000000000000000 (size!18950 a!3626)))))

(declare-fun b!660131 () Bool)

(declare-fun res!428081 () Bool)

(assert (=> b!660131 (=> (not res!428081) (not e!379316))))

(assert (=> b!660131 (= res!428081 (not (contains!3186 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660132 () Bool)

(assert (=> b!660132 (= e!379315 e!379319)))

(declare-fun res!428077 () Bool)

(assert (=> b!660132 (=> (not res!428077) (not e!379319))))

(assert (=> b!660132 (= res!428077 (bvsle from!3004 i!1382))))

(declare-fun b!660133 () Bool)

(declare-fun res!428079 () Bool)

(assert (=> b!660133 (=> (not res!428079) (not e!379316))))

(assert (=> b!660133 (= res!428079 (noDuplicate!460 acc!681))))

(assert (= (and start!59790 res!428086) b!660133))

(assert (= (and b!660133 res!428079) b!660131))

(assert (= (and b!660131 res!428081) b!660126))

(assert (= (and b!660126 res!428084) b!660127))

(assert (= (and b!660127 res!428083) b!660129))

(assert (= (and b!660127 (not res!428076)) b!660132))

(assert (= (and b!660132 res!428077) b!660124))

(assert (= (and b!660127 res!428085) b!660130))

(assert (= (and b!660130 res!428082) b!660123))

(assert (= (and b!660123 res!428078) b!660128))

(assert (= (and b!660128 (not res!428080)) b!660125))

(declare-fun m!633487 () Bool)

(assert (=> b!660124 m!633487))

(declare-fun m!633489 () Bool)

(assert (=> start!59790 m!633489))

(declare-fun m!633491 () Bool)

(assert (=> b!660133 m!633491))

(declare-fun m!633493 () Bool)

(assert (=> b!660128 m!633493))

(declare-fun m!633495 () Bool)

(assert (=> b!660126 m!633495))

(declare-fun m!633497 () Bool)

(assert (=> b!660125 m!633497))

(declare-fun m!633499 () Bool)

(assert (=> b!660123 m!633499))

(assert (=> b!660129 m!633487))

(declare-fun m!633501 () Bool)

(assert (=> b!660131 m!633501))

(check-sat (not b!660126) (not b!660125) (not b!660129) (not b!660133) (not start!59790) (not b!660131) (not b!660123) (not b!660124) (not b!660128))
(check-sat)
(get-model)

(declare-fun d!93285 () Bool)

(declare-fun lt!308830 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!258 (List!12534) (InoxSet (_ BitVec 64)))

(assert (=> d!93285 (= lt!308830 (select (content!258 acc!681) k0!2843))))

(declare-fun e!379361 () Bool)

(assert (=> d!93285 (= lt!308830 e!379361)))

(declare-fun res!428157 () Bool)

(assert (=> d!93285 (=> (not res!428157) (not e!379361))))

(get-info :version)

(assert (=> d!93285 (= res!428157 ((_ is Cons!12530) acc!681))))

(assert (=> d!93285 (= (contains!3186 acc!681 k0!2843) lt!308830)))

(declare-fun b!660204 () Bool)

(declare-fun e!379362 () Bool)

(assert (=> b!660204 (= e!379361 e!379362)))

(declare-fun res!428158 () Bool)

(assert (=> b!660204 (=> res!428158 e!379362)))

(assert (=> b!660204 (= res!428158 (= (h!13578 acc!681) k0!2843))))

(declare-fun b!660205 () Bool)

(assert (=> b!660205 (= e!379362 (contains!3186 (t!18754 acc!681) k0!2843))))

(assert (= (and d!93285 res!428157) b!660204))

(assert (= (and b!660204 (not res!428158)) b!660205))

(declare-fun m!633535 () Bool)

(assert (=> d!93285 m!633535))

(declare-fun m!633537 () Bool)

(assert (=> d!93285 m!633537))

(declare-fun m!633539 () Bool)

(assert (=> b!660205 m!633539))

(assert (=> b!660124 d!93285))

(declare-fun d!93287 () Bool)

(declare-fun lt!308831 () Bool)

(assert (=> d!93287 (= lt!308831 (select (content!258 Nil!12531) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379363 () Bool)

(assert (=> d!93287 (= lt!308831 e!379363)))

(declare-fun res!428159 () Bool)

(assert (=> d!93287 (=> (not res!428159) (not e!379363))))

(assert (=> d!93287 (= res!428159 ((_ is Cons!12530) Nil!12531))))

(assert (=> d!93287 (= (contains!3186 Nil!12531 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308831)))

(declare-fun b!660206 () Bool)

(declare-fun e!379364 () Bool)

(assert (=> b!660206 (= e!379363 e!379364)))

(declare-fun res!428160 () Bool)

(assert (=> b!660206 (=> res!428160 e!379364)))

(assert (=> b!660206 (= res!428160 (= (h!13578 Nil!12531) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660207 () Bool)

(assert (=> b!660207 (= e!379364 (contains!3186 (t!18754 Nil!12531) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93287 res!428159) b!660206))

(assert (= (and b!660206 (not res!428160)) b!660207))

(declare-fun m!633541 () Bool)

(assert (=> d!93287 m!633541))

(declare-fun m!633543 () Bool)

(assert (=> d!93287 m!633543))

(declare-fun m!633545 () Bool)

(assert (=> b!660207 m!633545))

(assert (=> b!660125 d!93287))

(declare-fun d!93289 () Bool)

(declare-fun lt!308832 () Bool)

(assert (=> d!93289 (= lt!308832 (select (content!258 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379365 () Bool)

(assert (=> d!93289 (= lt!308832 e!379365)))

(declare-fun res!428161 () Bool)

(assert (=> d!93289 (=> (not res!428161) (not e!379365))))

(assert (=> d!93289 (= res!428161 ((_ is Cons!12530) acc!681))))

(assert (=> d!93289 (= (contains!3186 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308832)))

(declare-fun b!660208 () Bool)

(declare-fun e!379366 () Bool)

(assert (=> b!660208 (= e!379365 e!379366)))

(declare-fun res!428162 () Bool)

(assert (=> b!660208 (=> res!428162 e!379366)))

(assert (=> b!660208 (= res!428162 (= (h!13578 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660209 () Bool)

(assert (=> b!660209 (= e!379366 (contains!3186 (t!18754 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93289 res!428161) b!660208))

(assert (= (and b!660208 (not res!428162)) b!660209))

(assert (=> d!93289 m!633535))

(declare-fun m!633547 () Bool)

(assert (=> d!93289 m!633547))

(declare-fun m!633549 () Bool)

(assert (=> b!660209 m!633549))

(assert (=> b!660131 d!93289))

(declare-fun d!93291 () Bool)

(declare-fun lt!308833 () Bool)

(assert (=> d!93291 (= lt!308833 (select (content!258 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379367 () Bool)

(assert (=> d!93291 (= lt!308833 e!379367)))

(declare-fun res!428163 () Bool)

(assert (=> d!93291 (=> (not res!428163) (not e!379367))))

(assert (=> d!93291 (= res!428163 ((_ is Cons!12530) acc!681))))

(assert (=> d!93291 (= (contains!3186 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308833)))

(declare-fun b!660210 () Bool)

(declare-fun e!379368 () Bool)

(assert (=> b!660210 (= e!379367 e!379368)))

(declare-fun res!428164 () Bool)

(assert (=> b!660210 (=> res!428164 e!379368)))

(assert (=> b!660210 (= res!428164 (= (h!13578 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660211 () Bool)

(assert (=> b!660211 (= e!379368 (contains!3186 (t!18754 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93291 res!428163) b!660210))

(assert (= (and b!660210 (not res!428164)) b!660211))

(assert (=> d!93291 m!633535))

(declare-fun m!633551 () Bool)

(assert (=> d!93291 m!633551))

(declare-fun m!633553 () Bool)

(assert (=> b!660211 m!633553))

(assert (=> b!660126 d!93291))

(declare-fun d!93293 () Bool)

(declare-fun res!428169 () Bool)

(declare-fun e!379373 () Bool)

(assert (=> d!93293 (=> res!428169 e!379373)))

(assert (=> d!93293 (= res!428169 ((_ is Nil!12531) acc!681))))

(assert (=> d!93293 (= (noDuplicate!460 acc!681) e!379373)))

(declare-fun b!660216 () Bool)

(declare-fun e!379374 () Bool)

(assert (=> b!660216 (= e!379373 e!379374)))

(declare-fun res!428170 () Bool)

(assert (=> b!660216 (=> (not res!428170) (not e!379374))))

(assert (=> b!660216 (= res!428170 (not (contains!3186 (t!18754 acc!681) (h!13578 acc!681))))))

(declare-fun b!660217 () Bool)

(assert (=> b!660217 (= e!379374 (noDuplicate!460 (t!18754 acc!681)))))

(assert (= (and d!93293 (not res!428169)) b!660216))

(assert (= (and b!660216 res!428170) b!660217))

(declare-fun m!633555 () Bool)

(assert (=> b!660216 m!633555))

(declare-fun m!633557 () Bool)

(assert (=> b!660217 m!633557))

(assert (=> b!660133 d!93293))

(declare-fun d!93297 () Bool)

(declare-fun lt!308834 () Bool)

(assert (=> d!93297 (= lt!308834 (select (content!258 Nil!12531) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379375 () Bool)

(assert (=> d!93297 (= lt!308834 e!379375)))

(declare-fun res!428171 () Bool)

(assert (=> d!93297 (=> (not res!428171) (not e!379375))))

(assert (=> d!93297 (= res!428171 ((_ is Cons!12530) Nil!12531))))

(assert (=> d!93297 (= (contains!3186 Nil!12531 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308834)))

(declare-fun b!660218 () Bool)

(declare-fun e!379376 () Bool)

(assert (=> b!660218 (= e!379375 e!379376)))

(declare-fun res!428172 () Bool)

(assert (=> b!660218 (=> res!428172 e!379376)))

(assert (=> b!660218 (= res!428172 (= (h!13578 Nil!12531) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!660219 () Bool)

(assert (=> b!660219 (= e!379376 (contains!3186 (t!18754 Nil!12531) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93297 res!428171) b!660218))

(assert (= (and b!660218 (not res!428172)) b!660219))

(assert (=> d!93297 m!633541))

(declare-fun m!633559 () Bool)

(assert (=> d!93297 m!633559))

(declare-fun m!633561 () Bool)

(assert (=> b!660219 m!633561))

(assert (=> b!660128 d!93297))

(declare-fun d!93301 () Bool)

(declare-fun res!428177 () Bool)

(declare-fun e!379381 () Bool)

(assert (=> d!93301 (=> res!428177 e!379381)))

(assert (=> d!93301 (= res!428177 ((_ is Nil!12531) Nil!12531))))

(assert (=> d!93301 (= (noDuplicate!460 Nil!12531) e!379381)))

(declare-fun b!660224 () Bool)

(declare-fun e!379382 () Bool)

(assert (=> b!660224 (= e!379381 e!379382)))

(declare-fun res!428178 () Bool)

(assert (=> b!660224 (=> (not res!428178) (not e!379382))))

(assert (=> b!660224 (= res!428178 (not (contains!3186 (t!18754 Nil!12531) (h!13578 Nil!12531))))))

(declare-fun b!660225 () Bool)

(assert (=> b!660225 (= e!379382 (noDuplicate!460 (t!18754 Nil!12531)))))

(assert (= (and d!93301 (not res!428177)) b!660224))

(assert (= (and b!660224 res!428178) b!660225))

(declare-fun m!633563 () Bool)

(assert (=> b!660224 m!633563))

(declare-fun m!633565 () Bool)

(assert (=> b!660225 m!633565))

(assert (=> b!660123 d!93301))

(assert (=> b!660129 d!93285))

(declare-fun d!93303 () Bool)

(assert (=> d!93303 (= (array_inv!14445 a!3626) (bvsge (size!18950 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!59790 d!93303))

(check-sat (not d!93289) (not b!660209) (not b!660225) (not b!660211) (not d!93291) (not d!93285) (not b!660216) (not b!660217) (not b!660219) (not d!93297) (not b!660224) (not d!93287) (not b!660205) (not b!660207))
(check-sat)
