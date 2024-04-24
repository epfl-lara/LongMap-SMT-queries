; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63268 () Bool)

(assert start!63268)

(declare-fun b!712144 () Bool)

(declare-fun res!475277 () Bool)

(declare-fun e!400735 () Bool)

(assert (=> b!712144 (=> (not res!475277) (not e!400735))))

(declare-datatypes ((List!13296 0))(
  ( (Nil!13293) (Cons!13292 (h!14340 (_ BitVec 64)) (t!19597 List!13296)) )
))
(declare-fun newAcc!49 () List!13296)

(declare-fun contains!3948 (List!13296 (_ BitVec 64)) Bool)

(assert (=> b!712144 (= res!475277 (not (contains!3948 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712145 () Bool)

(declare-fun res!475267 () Bool)

(assert (=> b!712145 (=> (not res!475267) (not e!400735))))

(declare-fun acc!652 () List!13296)

(declare-fun noDuplicate!1222 (List!13296) Bool)

(assert (=> b!712145 (= res!475267 (noDuplicate!1222 acc!652))))

(declare-fun b!712146 () Bool)

(declare-fun res!475284 () Bool)

(assert (=> b!712146 (=> (not res!475284) (not e!400735))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!380 (List!13296 (_ BitVec 64)) List!13296)

(assert (=> b!712146 (= res!475284 (= (-!380 newAcc!49 k0!2824) acc!652))))

(declare-fun b!712147 () Bool)

(declare-fun res!475262 () Bool)

(declare-fun e!400734 () Bool)

(assert (=> b!712147 (=> (not res!475262) (not e!400734))))

(declare-fun lt!318626 () List!13296)

(assert (=> b!712147 (= res!475262 (noDuplicate!1222 lt!318626))))

(declare-fun b!712148 () Bool)

(assert (=> b!712148 (= e!400735 e!400734)))

(declare-fun res!475270 () Bool)

(assert (=> b!712148 (=> (not res!475270) (not e!400734))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!712148 (= res!475270 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((array!40416 0))(
  ( (array!40417 (arr!19348 (Array (_ BitVec 32) (_ BitVec 64))) (size!19755 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40416)

(declare-fun $colon$colon!524 (List!13296 (_ BitVec 64)) List!13296)

(assert (=> b!712148 (= lt!318626 ($colon$colon!524 newAcc!49 (select (arr!19348 a!3591) from!2969)))))

(declare-fun lt!318627 () List!13296)

(assert (=> b!712148 (= lt!318627 ($colon$colon!524 acc!652 (select (arr!19348 a!3591) from!2969)))))

(declare-fun b!712149 () Bool)

(declare-fun res!475271 () Bool)

(assert (=> b!712149 (=> (not res!475271) (not e!400735))))

(declare-fun arrayNoDuplicates!0 (array!40416 (_ BitVec 32) List!13296) Bool)

(assert (=> b!712149 (= res!475271 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712150 () Bool)

(declare-fun res!475287 () Bool)

(assert (=> b!712150 (=> (not res!475287) (not e!400735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712150 (= res!475287 (validKeyInArray!0 k0!2824))))

(declare-fun b!712151 () Bool)

(declare-fun res!475282 () Bool)

(assert (=> b!712151 (=> (not res!475282) (not e!400735))))

(assert (=> b!712151 (= res!475282 (not (contains!3948 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712152 () Bool)

(declare-fun res!475272 () Bool)

(assert (=> b!712152 (=> (not res!475272) (not e!400735))))

(assert (=> b!712152 (= res!475272 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19755 a!3591)))))

(declare-fun b!712153 () Bool)

(declare-fun res!475280 () Bool)

(assert (=> b!712153 (=> (not res!475280) (not e!400734))))

(assert (=> b!712153 (= res!475280 (not (contains!3948 lt!318627 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712155 () Bool)

(declare-fun res!475276 () Bool)

(assert (=> b!712155 (=> (not res!475276) (not e!400735))))

(assert (=> b!712155 (= res!475276 (noDuplicate!1222 newAcc!49))))

(declare-fun b!712156 () Bool)

(declare-fun res!475274 () Bool)

(assert (=> b!712156 (=> (not res!475274) (not e!400734))))

(assert (=> b!712156 (= res!475274 (not (contains!3948 lt!318627 k0!2824)))))

(declare-fun b!712157 () Bool)

(declare-fun res!475283 () Bool)

(assert (=> b!712157 (=> (not res!475283) (not e!400735))))

(assert (=> b!712157 (= res!475283 (not (contains!3948 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712158 () Bool)

(declare-fun e!400736 () Bool)

(assert (=> b!712158 (= e!400734 e!400736)))

(declare-fun res!475285 () Bool)

(assert (=> b!712158 (=> res!475285 e!400736)))

(assert (=> b!712158 (= res!475285 (contains!3948 lt!318626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712159 () Bool)

(declare-fun res!475265 () Bool)

(assert (=> b!712159 (=> (not res!475265) (not e!400735))))

(declare-fun subseq!416 (List!13296 List!13296) Bool)

(assert (=> b!712159 (= res!475265 (subseq!416 acc!652 newAcc!49))))

(declare-fun b!712160 () Bool)

(declare-fun res!475264 () Bool)

(assert (=> b!712160 (=> (not res!475264) (not e!400734))))

(assert (=> b!712160 (= res!475264 (contains!3948 lt!318626 k0!2824))))

(declare-fun b!712161 () Bool)

(declare-fun res!475273 () Bool)

(assert (=> b!712161 (=> (not res!475273) (not e!400735))))

(assert (=> b!712161 (= res!475273 (contains!3948 newAcc!49 k0!2824))))

(declare-fun b!712162 () Bool)

(declare-fun res!475269 () Bool)

(assert (=> b!712162 (=> (not res!475269) (not e!400734))))

(assert (=> b!712162 (= res!475269 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318627))))

(declare-fun b!712163 () Bool)

(declare-fun res!475288 () Bool)

(assert (=> b!712163 (=> (not res!475288) (not e!400734))))

(assert (=> b!712163 (= res!475288 (subseq!416 lt!318627 lt!318626))))

(declare-fun b!712164 () Bool)

(declare-fun res!475278 () Bool)

(assert (=> b!712164 (=> (not res!475278) (not e!400735))))

(assert (=> b!712164 (= res!475278 (not (contains!3948 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712165 () Bool)

(declare-fun res!475268 () Bool)

(assert (=> b!712165 (=> (not res!475268) (not e!400735))))

(assert (=> b!712165 (= res!475268 (not (contains!3948 acc!652 k0!2824)))))

(declare-fun b!712166 () Bool)

(declare-fun res!475279 () Bool)

(assert (=> b!712166 (=> (not res!475279) (not e!400735))))

(declare-fun arrayContainsKey!0 (array!40416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712166 (= res!475279 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!712167 () Bool)

(assert (=> b!712167 (= e!400736 (contains!3948 lt!318626 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712168 () Bool)

(declare-fun res!475286 () Bool)

(assert (=> b!712168 (=> (not res!475286) (not e!400735))))

(assert (=> b!712168 (= res!475286 (validKeyInArray!0 (select (arr!19348 a!3591) from!2969)))))

(declare-fun b!712169 () Bool)

(declare-fun res!475275 () Bool)

(assert (=> b!712169 (=> (not res!475275) (not e!400734))))

(assert (=> b!712169 (= res!475275 (noDuplicate!1222 lt!318627))))

(declare-fun b!712170 () Bool)

(declare-fun res!475281 () Bool)

(assert (=> b!712170 (=> (not res!475281) (not e!400734))))

(assert (=> b!712170 (= res!475281 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712171 () Bool)

(declare-fun res!475263 () Bool)

(assert (=> b!712171 (=> (not res!475263) (not e!400734))))

(assert (=> b!712171 (= res!475263 (= (-!380 lt!318626 k0!2824) lt!318627))))

(declare-fun res!475266 () Bool)

(assert (=> start!63268 (=> (not res!475266) (not e!400735))))

(assert (=> start!63268 (= res!475266 (and (bvslt (size!19755 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19755 a!3591))))))

(assert (=> start!63268 e!400735))

(assert (=> start!63268 true))

(declare-fun array_inv!15207 (array!40416) Bool)

(assert (=> start!63268 (array_inv!15207 a!3591)))

(declare-fun b!712154 () Bool)

(declare-fun res!475261 () Bool)

(assert (=> b!712154 (=> (not res!475261) (not e!400734))))

(assert (=> b!712154 (= res!475261 (not (contains!3948 lt!318627 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63268 res!475266) b!712145))

(assert (= (and b!712145 res!475267) b!712155))

(assert (= (and b!712155 res!475276) b!712157))

(assert (= (and b!712157 res!475283) b!712151))

(assert (= (and b!712151 res!475282) b!712166))

(assert (= (and b!712166 res!475279) b!712165))

(assert (= (and b!712165 res!475268) b!712150))

(assert (= (and b!712150 res!475287) b!712149))

(assert (= (and b!712149 res!475271) b!712159))

(assert (= (and b!712159 res!475265) b!712161))

(assert (= (and b!712161 res!475273) b!712146))

(assert (= (and b!712146 res!475284) b!712144))

(assert (= (and b!712144 res!475277) b!712164))

(assert (= (and b!712164 res!475278) b!712152))

(assert (= (and b!712152 res!475272) b!712168))

(assert (= (and b!712168 res!475286) b!712148))

(assert (= (and b!712148 res!475270) b!712169))

(assert (= (and b!712169 res!475275) b!712147))

(assert (= (and b!712147 res!475262) b!712154))

(assert (= (and b!712154 res!475261) b!712153))

(assert (= (and b!712153 res!475280) b!712170))

(assert (= (and b!712170 res!475281) b!712156))

(assert (= (and b!712156 res!475274) b!712162))

(assert (= (and b!712162 res!475269) b!712163))

(assert (= (and b!712163 res!475288) b!712160))

(assert (= (and b!712160 res!475264) b!712171))

(assert (= (and b!712171 res!475263) b!712158))

(assert (= (and b!712158 (not res!475285)) b!712167))

(declare-fun m!669621 () Bool)

(assert (=> b!712148 m!669621))

(assert (=> b!712148 m!669621))

(declare-fun m!669623 () Bool)

(assert (=> b!712148 m!669623))

(assert (=> b!712148 m!669621))

(declare-fun m!669625 () Bool)

(assert (=> b!712148 m!669625))

(declare-fun m!669627 () Bool)

(assert (=> b!712156 m!669627))

(declare-fun m!669629 () Bool)

(assert (=> b!712147 m!669629))

(declare-fun m!669631 () Bool)

(assert (=> b!712169 m!669631))

(declare-fun m!669633 () Bool)

(assert (=> b!712162 m!669633))

(assert (=> b!712168 m!669621))

(assert (=> b!712168 m!669621))

(declare-fun m!669635 () Bool)

(assert (=> b!712168 m!669635))

(declare-fun m!669637 () Bool)

(assert (=> b!712150 m!669637))

(declare-fun m!669639 () Bool)

(assert (=> b!712155 m!669639))

(declare-fun m!669641 () Bool)

(assert (=> b!712154 m!669641))

(declare-fun m!669643 () Bool)

(assert (=> b!712153 m!669643))

(declare-fun m!669645 () Bool)

(assert (=> b!712161 m!669645))

(declare-fun m!669647 () Bool)

(assert (=> start!63268 m!669647))

(declare-fun m!669649 () Bool)

(assert (=> b!712160 m!669649))

(declare-fun m!669651 () Bool)

(assert (=> b!712171 m!669651))

(declare-fun m!669653 () Bool)

(assert (=> b!712146 m!669653))

(declare-fun m!669655 () Bool)

(assert (=> b!712166 m!669655))

(declare-fun m!669657 () Bool)

(assert (=> b!712164 m!669657))

(declare-fun m!669659 () Bool)

(assert (=> b!712144 m!669659))

(declare-fun m!669661 () Bool)

(assert (=> b!712167 m!669661))

(declare-fun m!669663 () Bool)

(assert (=> b!712170 m!669663))

(declare-fun m!669665 () Bool)

(assert (=> b!712151 m!669665))

(declare-fun m!669667 () Bool)

(assert (=> b!712165 m!669667))

(declare-fun m!669669 () Bool)

(assert (=> b!712145 m!669669))

(declare-fun m!669671 () Bool)

(assert (=> b!712163 m!669671))

(declare-fun m!669673 () Bool)

(assert (=> b!712157 m!669673))

(declare-fun m!669675 () Bool)

(assert (=> b!712149 m!669675))

(declare-fun m!669677 () Bool)

(assert (=> b!712158 m!669677))

(declare-fun m!669679 () Bool)

(assert (=> b!712159 m!669679))

(check-sat (not b!712168) (not b!712150) (not b!712151) (not b!712166) (not b!712170) (not b!712147) (not b!712148) (not b!712158) (not b!712161) (not b!712171) (not b!712146) (not b!712165) (not b!712159) (not b!712164) (not b!712167) (not b!712162) (not b!712149) (not b!712154) (not b!712169) (not b!712155) (not b!712160) (not b!712153) (not start!63268) (not b!712156) (not b!712157) (not b!712144) (not b!712163) (not b!712145))
(check-sat)
(get-model)

(declare-fun d!97991 () Bool)

(assert (=> d!97991 (= (array_inv!15207 a!3591) (bvsge (size!19755 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63268 d!97991))

(declare-fun d!97993 () Bool)

(declare-fun lt!318642 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!359 (List!13296) (InoxSet (_ BitVec 64)))

(assert (=> d!97993 (= lt!318642 (select (content!359 lt!318627) k0!2824))))

(declare-fun e!400767 () Bool)

(assert (=> d!97993 (= lt!318642 e!400767)))

(declare-fun res!475461 () Bool)

(assert (=> d!97993 (=> (not res!475461) (not e!400767))))

(get-info :version)

(assert (=> d!97993 (= res!475461 ((_ is Cons!13292) lt!318627))))

(assert (=> d!97993 (= (contains!3948 lt!318627 k0!2824) lt!318642)))

(declare-fun b!712344 () Bool)

(declare-fun e!400766 () Bool)

(assert (=> b!712344 (= e!400767 e!400766)))

(declare-fun res!475462 () Bool)

(assert (=> b!712344 (=> res!475462 e!400766)))

(assert (=> b!712344 (= res!475462 (= (h!14340 lt!318627) k0!2824))))

(declare-fun b!712345 () Bool)

(assert (=> b!712345 (= e!400766 (contains!3948 (t!19597 lt!318627) k0!2824))))

(assert (= (and d!97993 res!475461) b!712344))

(assert (= (and b!712344 (not res!475462)) b!712345))

(declare-fun m!669801 () Bool)

(assert (=> d!97993 m!669801))

(declare-fun m!669803 () Bool)

(assert (=> d!97993 m!669803))

(declare-fun m!669805 () Bool)

(assert (=> b!712345 m!669805))

(assert (=> b!712156 d!97993))

(declare-fun d!97995 () Bool)

(declare-fun lt!318643 () Bool)

(assert (=> d!97995 (= lt!318643 (select (content!359 lt!318627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400769 () Bool)

(assert (=> d!97995 (= lt!318643 e!400769)))

(declare-fun res!475463 () Bool)

(assert (=> d!97995 (=> (not res!475463) (not e!400769))))

(assert (=> d!97995 (= res!475463 ((_ is Cons!13292) lt!318627))))

(assert (=> d!97995 (= (contains!3948 lt!318627 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318643)))

(declare-fun b!712346 () Bool)

(declare-fun e!400768 () Bool)

(assert (=> b!712346 (= e!400769 e!400768)))

(declare-fun res!475464 () Bool)

(assert (=> b!712346 (=> res!475464 e!400768)))

(assert (=> b!712346 (= res!475464 (= (h!14340 lt!318627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712347 () Bool)

(assert (=> b!712347 (= e!400768 (contains!3948 (t!19597 lt!318627) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97995 res!475463) b!712346))

(assert (= (and b!712346 (not res!475464)) b!712347))

(assert (=> d!97995 m!669801))

(declare-fun m!669807 () Bool)

(assert (=> d!97995 m!669807))

(declare-fun m!669809 () Bool)

(assert (=> b!712347 m!669809))

(assert (=> b!712154 d!97995))

(declare-fun d!97997 () Bool)

(declare-fun res!475469 () Bool)

(declare-fun e!400774 () Bool)

(assert (=> d!97997 (=> res!475469 e!400774)))

(assert (=> d!97997 (= res!475469 ((_ is Nil!13293) newAcc!49))))

(assert (=> d!97997 (= (noDuplicate!1222 newAcc!49) e!400774)))

(declare-fun b!712352 () Bool)

(declare-fun e!400775 () Bool)

(assert (=> b!712352 (= e!400774 e!400775)))

(declare-fun res!475470 () Bool)

(assert (=> b!712352 (=> (not res!475470) (not e!400775))))

(assert (=> b!712352 (= res!475470 (not (contains!3948 (t!19597 newAcc!49) (h!14340 newAcc!49))))))

(declare-fun b!712353 () Bool)

(assert (=> b!712353 (= e!400775 (noDuplicate!1222 (t!19597 newAcc!49)))))

(assert (= (and d!97997 (not res!475469)) b!712352))

(assert (= (and b!712352 res!475470) b!712353))

(declare-fun m!669811 () Bool)

(assert (=> b!712352 m!669811))

(declare-fun m!669813 () Bool)

(assert (=> b!712353 m!669813))

(assert (=> b!712155 d!97997))

(declare-fun d!97999 () Bool)

(declare-fun lt!318644 () Bool)

(assert (=> d!97999 (= lt!318644 (select (content!359 lt!318626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400777 () Bool)

(assert (=> d!97999 (= lt!318644 e!400777)))

(declare-fun res!475471 () Bool)

(assert (=> d!97999 (=> (not res!475471) (not e!400777))))

(assert (=> d!97999 (= res!475471 ((_ is Cons!13292) lt!318626))))

(assert (=> d!97999 (= (contains!3948 lt!318626 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318644)))

(declare-fun b!712354 () Bool)

(declare-fun e!400776 () Bool)

(assert (=> b!712354 (= e!400777 e!400776)))

(declare-fun res!475472 () Bool)

(assert (=> b!712354 (=> res!475472 e!400776)))

(assert (=> b!712354 (= res!475472 (= (h!14340 lt!318626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712355 () Bool)

(assert (=> b!712355 (= e!400776 (contains!3948 (t!19597 lt!318626) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97999 res!475471) b!712354))

(assert (= (and b!712354 (not res!475472)) b!712355))

(declare-fun m!669815 () Bool)

(assert (=> d!97999 m!669815))

(declare-fun m!669817 () Bool)

(assert (=> d!97999 m!669817))

(declare-fun m!669819 () Bool)

(assert (=> b!712355 m!669819))

(assert (=> b!712158 d!97999))

(declare-fun b!712366 () Bool)

(declare-fun e!400788 () Bool)

(assert (=> b!712366 (= e!400788 (subseq!416 (t!19597 acc!652) (t!19597 newAcc!49)))))

(declare-fun b!712364 () Bool)

(declare-fun e!400787 () Bool)

(declare-fun e!400789 () Bool)

(assert (=> b!712364 (= e!400787 e!400789)))

(declare-fun res!475484 () Bool)

(assert (=> b!712364 (=> (not res!475484) (not e!400789))))

(assert (=> b!712364 (= res!475484 ((_ is Cons!13292) newAcc!49))))

(declare-fun d!98001 () Bool)

(declare-fun res!475481 () Bool)

(assert (=> d!98001 (=> res!475481 e!400787)))

(assert (=> d!98001 (= res!475481 ((_ is Nil!13293) acc!652))))

(assert (=> d!98001 (= (subseq!416 acc!652 newAcc!49) e!400787)))

(declare-fun b!712367 () Bool)

(declare-fun e!400786 () Bool)

(assert (=> b!712367 (= e!400786 (subseq!416 acc!652 (t!19597 newAcc!49)))))

(declare-fun b!712365 () Bool)

(assert (=> b!712365 (= e!400789 e!400786)))

(declare-fun res!475482 () Bool)

(assert (=> b!712365 (=> res!475482 e!400786)))

(assert (=> b!712365 (= res!475482 e!400788)))

(declare-fun res!475483 () Bool)

(assert (=> b!712365 (=> (not res!475483) (not e!400788))))

(assert (=> b!712365 (= res!475483 (= (h!14340 acc!652) (h!14340 newAcc!49)))))

(assert (= (and d!98001 (not res!475481)) b!712364))

(assert (= (and b!712364 res!475484) b!712365))

(assert (= (and b!712365 res!475483) b!712366))

(assert (= (and b!712365 (not res!475482)) b!712367))

(declare-fun m!669821 () Bool)

(assert (=> b!712366 m!669821))

(declare-fun m!669823 () Bool)

(assert (=> b!712367 m!669823))

(assert (=> b!712159 d!98001))

(declare-fun d!98003 () Bool)

(declare-fun lt!318645 () Bool)

(assert (=> d!98003 (= lt!318645 (select (content!359 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400791 () Bool)

(assert (=> d!98003 (= lt!318645 e!400791)))

(declare-fun res!475485 () Bool)

(assert (=> d!98003 (=> (not res!475485) (not e!400791))))

(assert (=> d!98003 (= res!475485 ((_ is Cons!13292) acc!652))))

(assert (=> d!98003 (= (contains!3948 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318645)))

(declare-fun b!712368 () Bool)

(declare-fun e!400790 () Bool)

(assert (=> b!712368 (= e!400791 e!400790)))

(declare-fun res!475486 () Bool)

(assert (=> b!712368 (=> res!475486 e!400790)))

(assert (=> b!712368 (= res!475486 (= (h!14340 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712369 () Bool)

(assert (=> b!712369 (= e!400790 (contains!3948 (t!19597 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98003 res!475485) b!712368))

(assert (= (and b!712368 (not res!475486)) b!712369))

(declare-fun m!669825 () Bool)

(assert (=> d!98003 m!669825))

(declare-fun m!669827 () Bool)

(assert (=> d!98003 m!669827))

(declare-fun m!669829 () Bool)

(assert (=> b!712369 m!669829))

(assert (=> b!712157 d!98003))

(declare-fun d!98005 () Bool)

(declare-fun lt!318646 () Bool)

(assert (=> d!98005 (= lt!318646 (select (content!359 newAcc!49) k0!2824))))

(declare-fun e!400793 () Bool)

(assert (=> d!98005 (= lt!318646 e!400793)))

(declare-fun res!475487 () Bool)

(assert (=> d!98005 (=> (not res!475487) (not e!400793))))

(assert (=> d!98005 (= res!475487 ((_ is Cons!13292) newAcc!49))))

(assert (=> d!98005 (= (contains!3948 newAcc!49 k0!2824) lt!318646)))

(declare-fun b!712370 () Bool)

(declare-fun e!400792 () Bool)

(assert (=> b!712370 (= e!400793 e!400792)))

(declare-fun res!475488 () Bool)

(assert (=> b!712370 (=> res!475488 e!400792)))

(assert (=> b!712370 (= res!475488 (= (h!14340 newAcc!49) k0!2824))))

(declare-fun b!712371 () Bool)

(assert (=> b!712371 (= e!400792 (contains!3948 (t!19597 newAcc!49) k0!2824))))

(assert (= (and d!98005 res!475487) b!712370))

(assert (= (and b!712370 (not res!475488)) b!712371))

(declare-fun m!669831 () Bool)

(assert (=> d!98005 m!669831))

(declare-fun m!669833 () Bool)

(assert (=> d!98005 m!669833))

(declare-fun m!669835 () Bool)

(assert (=> b!712371 m!669835))

(assert (=> b!712161 d!98005))

(declare-fun d!98007 () Bool)

(declare-fun lt!318647 () Bool)

(assert (=> d!98007 (= lt!318647 (select (content!359 lt!318626) k0!2824))))

(declare-fun e!400795 () Bool)

(assert (=> d!98007 (= lt!318647 e!400795)))

(declare-fun res!475489 () Bool)

(assert (=> d!98007 (=> (not res!475489) (not e!400795))))

(assert (=> d!98007 (= res!475489 ((_ is Cons!13292) lt!318626))))

(assert (=> d!98007 (= (contains!3948 lt!318626 k0!2824) lt!318647)))

(declare-fun b!712372 () Bool)

(declare-fun e!400794 () Bool)

(assert (=> b!712372 (= e!400795 e!400794)))

(declare-fun res!475490 () Bool)

(assert (=> b!712372 (=> res!475490 e!400794)))

(assert (=> b!712372 (= res!475490 (= (h!14340 lt!318626) k0!2824))))

(declare-fun b!712373 () Bool)

(assert (=> b!712373 (= e!400794 (contains!3948 (t!19597 lt!318626) k0!2824))))

(assert (= (and d!98007 res!475489) b!712372))

(assert (= (and b!712372 (not res!475490)) b!712373))

(assert (=> d!98007 m!669815))

(declare-fun m!669837 () Bool)

(assert (=> d!98007 m!669837))

(declare-fun m!669839 () Bool)

(assert (=> b!712373 m!669839))

(assert (=> b!712160 d!98007))

(declare-fun d!98009 () Bool)

(declare-fun lt!318648 () Bool)

(assert (=> d!98009 (= lt!318648 (select (content!359 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400797 () Bool)

(assert (=> d!98009 (= lt!318648 e!400797)))

(declare-fun res!475491 () Bool)

(assert (=> d!98009 (=> (not res!475491) (not e!400797))))

(assert (=> d!98009 (= res!475491 ((_ is Cons!13292) newAcc!49))))

(assert (=> d!98009 (= (contains!3948 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318648)))

(declare-fun b!712374 () Bool)

(declare-fun e!400796 () Bool)

(assert (=> b!712374 (= e!400797 e!400796)))

(declare-fun res!475492 () Bool)

(assert (=> b!712374 (=> res!475492 e!400796)))

(assert (=> b!712374 (= res!475492 (= (h!14340 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712375 () Bool)

(assert (=> b!712375 (= e!400796 (contains!3948 (t!19597 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98009 res!475491) b!712374))

(assert (= (and b!712374 (not res!475492)) b!712375))

(assert (=> d!98009 m!669831))

(declare-fun m!669841 () Bool)

(assert (=> d!98009 m!669841))

(declare-fun m!669843 () Bool)

(assert (=> b!712375 m!669843))

(assert (=> b!712164 d!98009))

(declare-fun c!78812 () Bool)

(declare-fun call!34548 () Bool)

(declare-fun bm!34545 () Bool)

(assert (=> bm!34545 (= call!34548 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78812 (Cons!13292 (select (arr!19348 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318627) lt!318627)))))

(declare-fun b!712390 () Bool)

(declare-fun e!400811 () Bool)

(declare-fun e!400812 () Bool)

(assert (=> b!712390 (= e!400811 e!400812)))

(assert (=> b!712390 (= c!78812 (validKeyInArray!0 (select (arr!19348 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712391 () Bool)

(assert (=> b!712391 (= e!400812 call!34548)))

(declare-fun d!98011 () Bool)

(declare-fun res!475503 () Bool)

(declare-fun e!400810 () Bool)

(assert (=> d!98011 (=> res!475503 e!400810)))

(assert (=> d!98011 (= res!475503 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19755 a!3591)))))

(assert (=> d!98011 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318627) e!400810)))

(declare-fun b!712392 () Bool)

(declare-fun e!400813 () Bool)

(assert (=> b!712392 (= e!400813 (contains!3948 lt!318627 (select (arr!19348 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712393 () Bool)

(assert (=> b!712393 (= e!400810 e!400811)))

(declare-fun res!475504 () Bool)

(assert (=> b!712393 (=> (not res!475504) (not e!400811))))

(assert (=> b!712393 (= res!475504 (not e!400813))))

(declare-fun res!475505 () Bool)

(assert (=> b!712393 (=> (not res!475505) (not e!400813))))

(assert (=> b!712393 (= res!475505 (validKeyInArray!0 (select (arr!19348 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712394 () Bool)

(assert (=> b!712394 (= e!400812 call!34548)))

(assert (= (and d!98011 (not res!475503)) b!712393))

(assert (= (and b!712393 res!475505) b!712392))

(assert (= (and b!712393 res!475504) b!712390))

(assert (= (and b!712390 c!78812) b!712391))

(assert (= (and b!712390 (not c!78812)) b!712394))

(assert (= (or b!712391 b!712394) bm!34545))

(declare-fun m!669845 () Bool)

(assert (=> bm!34545 m!669845))

(declare-fun m!669847 () Bool)

(assert (=> bm!34545 m!669847))

(assert (=> b!712390 m!669845))

(assert (=> b!712390 m!669845))

(declare-fun m!669849 () Bool)

(assert (=> b!712390 m!669849))

(assert (=> b!712392 m!669845))

(assert (=> b!712392 m!669845))

(declare-fun m!669853 () Bool)

(assert (=> b!712392 m!669853))

(assert (=> b!712393 m!669845))

(assert (=> b!712393 m!669845))

(assert (=> b!712393 m!669849))

(assert (=> b!712162 d!98011))

(declare-fun b!712399 () Bool)

(declare-fun e!400818 () Bool)

(assert (=> b!712399 (= e!400818 (subseq!416 (t!19597 lt!318627) (t!19597 lt!318626)))))

(declare-fun b!712397 () Bool)

(declare-fun e!400817 () Bool)

(declare-fun e!400819 () Bool)

(assert (=> b!712397 (= e!400817 e!400819)))

(declare-fun res!475511 () Bool)

(assert (=> b!712397 (=> (not res!475511) (not e!400819))))

(assert (=> b!712397 (= res!475511 ((_ is Cons!13292) lt!318626))))

(declare-fun d!98019 () Bool)

(declare-fun res!475508 () Bool)

(assert (=> d!98019 (=> res!475508 e!400817)))

(assert (=> d!98019 (= res!475508 ((_ is Nil!13293) lt!318627))))

(assert (=> d!98019 (= (subseq!416 lt!318627 lt!318626) e!400817)))

(declare-fun b!712400 () Bool)

(declare-fun e!400816 () Bool)

(assert (=> b!712400 (= e!400816 (subseq!416 lt!318627 (t!19597 lt!318626)))))

(declare-fun b!712398 () Bool)

(assert (=> b!712398 (= e!400819 e!400816)))

(declare-fun res!475509 () Bool)

(assert (=> b!712398 (=> res!475509 e!400816)))

(assert (=> b!712398 (= res!475509 e!400818)))

(declare-fun res!475510 () Bool)

(assert (=> b!712398 (=> (not res!475510) (not e!400818))))

(assert (=> b!712398 (= res!475510 (= (h!14340 lt!318627) (h!14340 lt!318626)))))

(assert (= (and d!98019 (not res!475508)) b!712397))

(assert (= (and b!712397 res!475511) b!712398))

(assert (= (and b!712398 res!475510) b!712399))

(assert (= (and b!712398 (not res!475509)) b!712400))

(declare-fun m!669857 () Bool)

(assert (=> b!712399 m!669857))

(declare-fun m!669859 () Bool)

(assert (=> b!712400 m!669859))

(assert (=> b!712163 d!98019))

(declare-fun d!98021 () Bool)

(declare-fun res!475516 () Bool)

(declare-fun e!400824 () Bool)

(assert (=> d!98021 (=> res!475516 e!400824)))

(assert (=> d!98021 (= res!475516 (= (select (arr!19348 a!3591) from!2969) k0!2824))))

(assert (=> d!98021 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!400824)))

(declare-fun b!712405 () Bool)

(declare-fun e!400825 () Bool)

(assert (=> b!712405 (= e!400824 e!400825)))

(declare-fun res!475517 () Bool)

(assert (=> b!712405 (=> (not res!475517) (not e!400825))))

(assert (=> b!712405 (= res!475517 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19755 a!3591)))))

(declare-fun b!712406 () Bool)

(assert (=> b!712406 (= e!400825 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98021 (not res!475516)) b!712405))

(assert (= (and b!712405 res!475517) b!712406))

(assert (=> d!98021 m!669621))

(declare-fun m!669861 () Bool)

(assert (=> b!712406 m!669861))

(assert (=> b!712166 d!98021))

(declare-fun d!98023 () Bool)

(declare-fun res!475518 () Bool)

(declare-fun e!400826 () Bool)

(assert (=> d!98023 (=> res!475518 e!400826)))

(assert (=> d!98023 (= res!475518 ((_ is Nil!13293) acc!652))))

(assert (=> d!98023 (= (noDuplicate!1222 acc!652) e!400826)))

(declare-fun b!712407 () Bool)

(declare-fun e!400827 () Bool)

(assert (=> b!712407 (= e!400826 e!400827)))

(declare-fun res!475519 () Bool)

(assert (=> b!712407 (=> (not res!475519) (not e!400827))))

(assert (=> b!712407 (= res!475519 (not (contains!3948 (t!19597 acc!652) (h!14340 acc!652))))))

(declare-fun b!712408 () Bool)

(assert (=> b!712408 (= e!400827 (noDuplicate!1222 (t!19597 acc!652)))))

(assert (= (and d!98023 (not res!475518)) b!712407))

(assert (= (and b!712407 res!475519) b!712408))

(declare-fun m!669863 () Bool)

(assert (=> b!712407 m!669863))

(declare-fun m!669865 () Bool)

(assert (=> b!712408 m!669865))

(assert (=> b!712145 d!98023))

(declare-fun d!98025 () Bool)

(declare-fun lt!318649 () Bool)

(assert (=> d!98025 (= lt!318649 (select (content!359 lt!318626) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400829 () Bool)

(assert (=> d!98025 (= lt!318649 e!400829)))

(declare-fun res!475520 () Bool)

(assert (=> d!98025 (=> (not res!475520) (not e!400829))))

(assert (=> d!98025 (= res!475520 ((_ is Cons!13292) lt!318626))))

(assert (=> d!98025 (= (contains!3948 lt!318626 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318649)))

(declare-fun b!712409 () Bool)

(declare-fun e!400828 () Bool)

(assert (=> b!712409 (= e!400829 e!400828)))

(declare-fun res!475521 () Bool)

(assert (=> b!712409 (=> res!475521 e!400828)))

(assert (=> b!712409 (= res!475521 (= (h!14340 lt!318626) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712410 () Bool)

(assert (=> b!712410 (= e!400828 (contains!3948 (t!19597 lt!318626) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98025 res!475520) b!712409))

(assert (= (and b!712409 (not res!475521)) b!712410))

(assert (=> d!98025 m!669815))

(declare-fun m!669867 () Bool)

(assert (=> d!98025 m!669867))

(declare-fun m!669869 () Bool)

(assert (=> b!712410 m!669869))

(assert (=> b!712167 d!98025))

(declare-fun d!98027 () Bool)

(declare-fun lt!318650 () Bool)

(assert (=> d!98027 (= lt!318650 (select (content!359 acc!652) k0!2824))))

(declare-fun e!400831 () Bool)

(assert (=> d!98027 (= lt!318650 e!400831)))

(declare-fun res!475522 () Bool)

(assert (=> d!98027 (=> (not res!475522) (not e!400831))))

(assert (=> d!98027 (= res!475522 ((_ is Cons!13292) acc!652))))

(assert (=> d!98027 (= (contains!3948 acc!652 k0!2824) lt!318650)))

(declare-fun b!712411 () Bool)

(declare-fun e!400830 () Bool)

(assert (=> b!712411 (= e!400831 e!400830)))

(declare-fun res!475523 () Bool)

(assert (=> b!712411 (=> res!475523 e!400830)))

(assert (=> b!712411 (= res!475523 (= (h!14340 acc!652) k0!2824))))

(declare-fun b!712412 () Bool)

(assert (=> b!712412 (= e!400830 (contains!3948 (t!19597 acc!652) k0!2824))))

(assert (= (and d!98027 res!475522) b!712411))

(assert (= (and b!712411 (not res!475523)) b!712412))

(assert (=> d!98027 m!669825))

(declare-fun m!669871 () Bool)

(assert (=> d!98027 m!669871))

(declare-fun m!669873 () Bool)

(assert (=> b!712412 m!669873))

(assert (=> b!712165 d!98027))

(declare-fun d!98029 () Bool)

(declare-fun lt!318651 () Bool)

(assert (=> d!98029 (= lt!318651 (select (content!359 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400839 () Bool)

(assert (=> d!98029 (= lt!318651 e!400839)))

(declare-fun res!475530 () Bool)

(assert (=> d!98029 (=> (not res!475530) (not e!400839))))

(assert (=> d!98029 (= res!475530 ((_ is Cons!13292) newAcc!49))))

(assert (=> d!98029 (= (contains!3948 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318651)))

(declare-fun b!712417 () Bool)

(declare-fun e!400838 () Bool)

(assert (=> b!712417 (= e!400839 e!400838)))

(declare-fun res!475531 () Bool)

(assert (=> b!712417 (=> res!475531 e!400838)))

(assert (=> b!712417 (= res!475531 (= (h!14340 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712418 () Bool)

(assert (=> b!712418 (= e!400838 (contains!3948 (t!19597 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98029 res!475530) b!712417))

(assert (= (and b!712417 (not res!475531)) b!712418))

(assert (=> d!98029 m!669831))

(declare-fun m!669875 () Bool)

(assert (=> d!98029 m!669875))

(declare-fun m!669877 () Bool)

(assert (=> b!712418 m!669877))

(assert (=> b!712144 d!98029))

(declare-fun d!98031 () Bool)

(declare-fun res!475532 () Bool)

(declare-fun e!400842 () Bool)

(assert (=> d!98031 (=> res!475532 e!400842)))

(assert (=> d!98031 (= res!475532 ((_ is Nil!13293) lt!318627))))

(assert (=> d!98031 (= (noDuplicate!1222 lt!318627) e!400842)))

(declare-fun b!712425 () Bool)

(declare-fun e!400843 () Bool)

(assert (=> b!712425 (= e!400842 e!400843)))

(declare-fun res!475533 () Bool)

(assert (=> b!712425 (=> (not res!475533) (not e!400843))))

(assert (=> b!712425 (= res!475533 (not (contains!3948 (t!19597 lt!318627) (h!14340 lt!318627))))))

(declare-fun b!712426 () Bool)

(assert (=> b!712426 (= e!400843 (noDuplicate!1222 (t!19597 lt!318627)))))

(assert (= (and d!98031 (not res!475532)) b!712425))

(assert (= (and b!712425 res!475533) b!712426))

(declare-fun m!669879 () Bool)

(assert (=> b!712425 m!669879))

(declare-fun m!669881 () Bool)

(assert (=> b!712426 m!669881))

(assert (=> b!712169 d!98031))

(declare-fun d!98033 () Bool)

(assert (=> d!98033 (= ($colon$colon!524 newAcc!49 (select (arr!19348 a!3591) from!2969)) (Cons!13292 (select (arr!19348 a!3591) from!2969) newAcc!49))))

(assert (=> b!712148 d!98033))

(declare-fun d!98035 () Bool)

(assert (=> d!98035 (= ($colon$colon!524 acc!652 (select (arr!19348 a!3591) from!2969)) (Cons!13292 (select (arr!19348 a!3591) from!2969) acc!652))))

(assert (=> b!712148 d!98035))

(declare-fun b!712457 () Bool)

(declare-fun e!400865 () List!13296)

(declare-fun call!34557 () List!13296)

(assert (=> b!712457 (= e!400865 (Cons!13292 (h!14340 newAcc!49) call!34557))))

(declare-fun b!712458 () Bool)

(declare-fun e!400867 () List!13296)

(assert (=> b!712458 (= e!400867 e!400865)))

(declare-fun c!78826 () Bool)

(assert (=> b!712458 (= c!78826 (= k0!2824 (h!14340 newAcc!49)))))

(declare-fun b!712459 () Bool)

(assert (=> b!712459 (= e!400867 Nil!13293)))

(declare-fun bm!34554 () Bool)

(assert (=> bm!34554 (= call!34557 (-!380 (t!19597 newAcc!49) k0!2824))))

(declare-fun d!98037 () Bool)

(declare-fun e!400866 () Bool)

(assert (=> d!98037 e!400866))

(declare-fun res!475542 () Bool)

(assert (=> d!98037 (=> (not res!475542) (not e!400866))))

(declare-fun lt!318657 () List!13296)

(declare-fun size!19759 (List!13296) Int)

(assert (=> d!98037 (= res!475542 (<= (size!19759 lt!318657) (size!19759 newAcc!49)))))

(assert (=> d!98037 (= lt!318657 e!400867)))

(declare-fun c!78827 () Bool)

(assert (=> d!98037 (= c!78827 ((_ is Cons!13292) newAcc!49))))

(assert (=> d!98037 (= (-!380 newAcc!49 k0!2824) lt!318657)))

(declare-fun b!712460 () Bool)

(assert (=> b!712460 (= e!400865 call!34557)))

(declare-fun b!712461 () Bool)

(assert (=> b!712461 (= e!400866 (= (content!359 lt!318657) ((_ map and) (content!359 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!98037 c!78827) b!712458))

(assert (= (and d!98037 (not c!78827)) b!712459))

(assert (= (and b!712458 c!78826) b!712460))

(assert (= (and b!712458 (not c!78826)) b!712457))

(assert (= (or b!712460 b!712457) bm!34554))

(assert (= (and d!98037 res!475542) b!712461))

(declare-fun m!669899 () Bool)

(assert (=> bm!34554 m!669899))

(declare-fun m!669901 () Bool)

(assert (=> d!98037 m!669901))

(declare-fun m!669903 () Bool)

(assert (=> d!98037 m!669903))

(declare-fun m!669905 () Bool)

(assert (=> b!712461 m!669905))

(assert (=> b!712461 m!669831))

(declare-fun m!669907 () Bool)

(assert (=> b!712461 m!669907))

(assert (=> b!712146 d!98037))

(declare-fun d!98043 () Bool)

(assert (=> d!98043 (= (validKeyInArray!0 (select (arr!19348 a!3591) from!2969)) (and (not (= (select (arr!19348 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19348 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712168 d!98043))

(declare-fun d!98045 () Bool)

(declare-fun res!475547 () Bool)

(declare-fun e!400872 () Bool)

(assert (=> d!98045 (=> res!475547 e!400872)))

(assert (=> d!98045 (= res!475547 ((_ is Nil!13293) lt!318626))))

(assert (=> d!98045 (= (noDuplicate!1222 lt!318626) e!400872)))

(declare-fun b!712466 () Bool)

(declare-fun e!400873 () Bool)

(assert (=> b!712466 (= e!400872 e!400873)))

(declare-fun res!475548 () Bool)

(assert (=> b!712466 (=> (not res!475548) (not e!400873))))

(assert (=> b!712466 (= res!475548 (not (contains!3948 (t!19597 lt!318626) (h!14340 lt!318626))))))

(declare-fun b!712467 () Bool)

(assert (=> b!712467 (= e!400873 (noDuplicate!1222 (t!19597 lt!318626)))))

(assert (= (and d!98045 (not res!475547)) b!712466))

(assert (= (and b!712466 res!475548) b!712467))

(declare-fun m!669909 () Bool)

(assert (=> b!712466 m!669909))

(declare-fun m!669911 () Bool)

(assert (=> b!712467 m!669911))

(assert (=> b!712147 d!98045))

(declare-fun d!98047 () Bool)

(assert (=> d!98047 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712150 d!98047))

(declare-fun d!98049 () Bool)

(declare-fun lt!318662 () Bool)

(assert (=> d!98049 (= lt!318662 (select (content!359 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400879 () Bool)

(assert (=> d!98049 (= lt!318662 e!400879)))

(declare-fun res!475553 () Bool)

(assert (=> d!98049 (=> (not res!475553) (not e!400879))))

(assert (=> d!98049 (= res!475553 ((_ is Cons!13292) acc!652))))

(assert (=> d!98049 (= (contains!3948 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318662)))

(declare-fun b!712472 () Bool)

(declare-fun e!400878 () Bool)

(assert (=> b!712472 (= e!400879 e!400878)))

(declare-fun res!475554 () Bool)

(assert (=> b!712472 (=> res!475554 e!400878)))

(assert (=> b!712472 (= res!475554 (= (h!14340 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712473 () Bool)

(assert (=> b!712473 (= e!400878 (contains!3948 (t!19597 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98049 res!475553) b!712472))

(assert (= (and b!712472 (not res!475554)) b!712473))

(assert (=> d!98049 m!669825))

(declare-fun m!669913 () Bool)

(assert (=> d!98049 m!669913))

(declare-fun m!669915 () Bool)

(assert (=> b!712473 m!669915))

(assert (=> b!712151 d!98049))

(declare-fun d!98051 () Bool)

(declare-fun res!475555 () Bool)

(declare-fun e!400880 () Bool)

(assert (=> d!98051 (=> res!475555 e!400880)))

(assert (=> d!98051 (= res!475555 (= (select (arr!19348 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98051 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400880)))

(declare-fun b!712474 () Bool)

(declare-fun e!400881 () Bool)

(assert (=> b!712474 (= e!400880 e!400881)))

(declare-fun res!475556 () Bool)

(assert (=> b!712474 (=> (not res!475556) (not e!400881))))

(assert (=> b!712474 (= res!475556 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19755 a!3591)))))

(declare-fun b!712475 () Bool)

(assert (=> b!712475 (= e!400881 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98051 (not res!475555)) b!712474))

(assert (= (and b!712474 res!475556) b!712475))

(assert (=> d!98051 m!669845))

(declare-fun m!669917 () Bool)

(assert (=> b!712475 m!669917))

(assert (=> b!712170 d!98051))

(declare-fun call!34558 () Bool)

(declare-fun bm!34555 () Bool)

(declare-fun c!78828 () Bool)

(assert (=> bm!34555 (= call!34558 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78828 (Cons!13292 (select (arr!19348 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!712476 () Bool)

(declare-fun e!400883 () Bool)

(declare-fun e!400884 () Bool)

(assert (=> b!712476 (= e!400883 e!400884)))

(assert (=> b!712476 (= c!78828 (validKeyInArray!0 (select (arr!19348 a!3591) from!2969)))))

(declare-fun b!712477 () Bool)

(assert (=> b!712477 (= e!400884 call!34558)))

(declare-fun d!98053 () Bool)

(declare-fun res!475557 () Bool)

(declare-fun e!400882 () Bool)

(assert (=> d!98053 (=> res!475557 e!400882)))

(assert (=> d!98053 (= res!475557 (bvsge from!2969 (size!19755 a!3591)))))

(assert (=> d!98053 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400882)))

(declare-fun e!400885 () Bool)

(declare-fun b!712478 () Bool)

(assert (=> b!712478 (= e!400885 (contains!3948 acc!652 (select (arr!19348 a!3591) from!2969)))))

(declare-fun b!712479 () Bool)

(assert (=> b!712479 (= e!400882 e!400883)))

(declare-fun res!475558 () Bool)

(assert (=> b!712479 (=> (not res!475558) (not e!400883))))

(assert (=> b!712479 (= res!475558 (not e!400885))))

(declare-fun res!475559 () Bool)

(assert (=> b!712479 (=> (not res!475559) (not e!400885))))

(assert (=> b!712479 (= res!475559 (validKeyInArray!0 (select (arr!19348 a!3591) from!2969)))))

(declare-fun b!712480 () Bool)

(assert (=> b!712480 (= e!400884 call!34558)))

(assert (= (and d!98053 (not res!475557)) b!712479))

(assert (= (and b!712479 res!475559) b!712478))

(assert (= (and b!712479 res!475558) b!712476))

(assert (= (and b!712476 c!78828) b!712477))

(assert (= (and b!712476 (not c!78828)) b!712480))

(assert (= (or b!712477 b!712480) bm!34555))

(assert (=> bm!34555 m!669621))

(declare-fun m!669919 () Bool)

(assert (=> bm!34555 m!669919))

(assert (=> b!712476 m!669621))

(assert (=> b!712476 m!669621))

(assert (=> b!712476 m!669635))

(assert (=> b!712478 m!669621))

(assert (=> b!712478 m!669621))

(declare-fun m!669921 () Bool)

(assert (=> b!712478 m!669921))

(assert (=> b!712479 m!669621))

(assert (=> b!712479 m!669621))

(assert (=> b!712479 m!669635))

(assert (=> b!712149 d!98053))

(declare-fun b!712485 () Bool)

(declare-fun e!400890 () List!13296)

(declare-fun call!34559 () List!13296)

(assert (=> b!712485 (= e!400890 (Cons!13292 (h!14340 lt!318626) call!34559))))

(declare-fun b!712486 () Bool)

(declare-fun e!400892 () List!13296)

(assert (=> b!712486 (= e!400892 e!400890)))

(declare-fun c!78829 () Bool)

(assert (=> b!712486 (= c!78829 (= k0!2824 (h!14340 lt!318626)))))

(declare-fun b!712487 () Bool)

(assert (=> b!712487 (= e!400892 Nil!13293)))

(declare-fun bm!34556 () Bool)

(assert (=> bm!34556 (= call!34559 (-!380 (t!19597 lt!318626) k0!2824))))

(declare-fun d!98055 () Bool)

(declare-fun e!400891 () Bool)

(assert (=> d!98055 e!400891))

(declare-fun res!475564 () Bool)

(assert (=> d!98055 (=> (not res!475564) (not e!400891))))

(declare-fun lt!318665 () List!13296)

(assert (=> d!98055 (= res!475564 (<= (size!19759 lt!318665) (size!19759 lt!318626)))))

(assert (=> d!98055 (= lt!318665 e!400892)))

(declare-fun c!78830 () Bool)

(assert (=> d!98055 (= c!78830 ((_ is Cons!13292) lt!318626))))

(assert (=> d!98055 (= (-!380 lt!318626 k0!2824) lt!318665)))

(declare-fun b!712488 () Bool)

(assert (=> b!712488 (= e!400890 call!34559)))

(declare-fun b!712489 () Bool)

(assert (=> b!712489 (= e!400891 (= (content!359 lt!318665) ((_ map and) (content!359 lt!318626) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(assert (= (and d!98055 c!78830) b!712486))

(assert (= (and d!98055 (not c!78830)) b!712487))

(assert (= (and b!712486 c!78829) b!712488))

(assert (= (and b!712486 (not c!78829)) b!712485))

(assert (= (or b!712488 b!712485) bm!34556))

(assert (= (and d!98055 res!475564) b!712489))

(declare-fun m!669933 () Bool)

(assert (=> bm!34556 m!669933))

(declare-fun m!669935 () Bool)

(assert (=> d!98055 m!669935))

(declare-fun m!669937 () Bool)

(assert (=> d!98055 m!669937))

(declare-fun m!669939 () Bool)

(assert (=> b!712489 m!669939))

(assert (=> b!712489 m!669815))

(assert (=> b!712489 m!669907))

(assert (=> b!712171 d!98055))

(declare-fun d!98061 () Bool)

(declare-fun lt!318667 () Bool)

(assert (=> d!98061 (= lt!318667 (select (content!359 lt!318627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400896 () Bool)

(assert (=> d!98061 (= lt!318667 e!400896)))

(declare-fun res!475567 () Bool)

(assert (=> d!98061 (=> (not res!475567) (not e!400896))))

(assert (=> d!98061 (= res!475567 ((_ is Cons!13292) lt!318627))))

(assert (=> d!98061 (= (contains!3948 lt!318627 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318667)))

(declare-fun b!712492 () Bool)

(declare-fun e!400895 () Bool)

(assert (=> b!712492 (= e!400896 e!400895)))

(declare-fun res!475568 () Bool)

(assert (=> b!712492 (=> res!475568 e!400895)))

(assert (=> b!712492 (= res!475568 (= (h!14340 lt!318627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712493 () Bool)

(assert (=> b!712493 (= e!400895 (contains!3948 (t!19597 lt!318627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98061 res!475567) b!712492))

(assert (= (and b!712492 (not res!475568)) b!712493))

(assert (=> d!98061 m!669801))

(declare-fun m!669947 () Bool)

(assert (=> d!98061 m!669947))

(declare-fun m!669949 () Bool)

(assert (=> b!712493 m!669949))

(assert (=> b!712153 d!98061))

(check-sat (not b!712366) (not b!712475) (not d!98055) (not b!712476) (not bm!34545) (not b!712347) (not b!712425) (not d!98061) (not b!712369) (not d!98025) (not b!712355) (not b!712418) (not d!97993) (not b!712399) (not d!98029) (not b!712400) (not b!712352) (not bm!34555) (not b!712390) (not d!98003) (not d!97995) (not b!712410) (not b!712466) (not b!712373) (not d!98049) (not bm!34556) (not d!97999) (not b!712393) (not b!712467) (not d!98027) (not b!712473) (not d!98009) (not b!712412) (not b!712367) (not b!712392) (not bm!34554) (not b!712408) (not b!712479) (not d!98037) (not b!712371) (not b!712406) (not b!712478) (not b!712353) (not b!712461) (not b!712426) (not b!712493) (not d!98007) (not d!98005) (not b!712375) (not b!712345) (not b!712407) (not b!712489))
(check-sat)
