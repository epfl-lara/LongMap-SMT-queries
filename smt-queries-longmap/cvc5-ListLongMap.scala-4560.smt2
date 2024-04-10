; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63586 () Bool)

(assert start!63586)

(declare-fun b!716279 () Bool)

(declare-fun res!479190 () Bool)

(declare-fun e!402161 () Bool)

(assert (=> b!716279 (=> (not res!479190) (not e!402161))))

(declare-datatypes ((List!13451 0))(
  ( (Nil!13448) (Cons!13447 (h!14492 (_ BitVec 64)) (t!19766 List!13451)) )
))
(declare-fun newAcc!49 () List!13451)

(declare-fun noDuplicate!1275 (List!13451) Bool)

(assert (=> b!716279 (= res!479190 (noDuplicate!1275 newAcc!49))))

(declare-fun b!716280 () Bool)

(declare-fun res!479182 () Bool)

(assert (=> b!716280 (=> (not res!479182) (not e!402161))))

(declare-fun acc!652 () List!13451)

(assert (=> b!716280 (= res!479182 (noDuplicate!1275 acc!652))))

(declare-fun b!716281 () Bool)

(declare-fun res!479181 () Bool)

(assert (=> b!716281 (=> (not res!479181) (not e!402161))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!438 (List!13451 (_ BitVec 64)) List!13451)

(assert (=> b!716281 (= res!479181 (= (-!438 newAcc!49 k!2824) acc!652))))

(declare-fun b!716282 () Bool)

(declare-fun res!479177 () Bool)

(assert (=> b!716282 (=> (not res!479177) (not e!402161))))

(declare-fun contains!4028 (List!13451 (_ BitVec 64)) Bool)

(assert (=> b!716282 (= res!479177 (contains!4028 newAcc!49 k!2824))))

(declare-fun b!716283 () Bool)

(declare-fun res!479180 () Bool)

(assert (=> b!716283 (=> (not res!479180) (not e!402161))))

(assert (=> b!716283 (= res!479180 (not (contains!4028 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716284 () Bool)

(declare-fun res!479184 () Bool)

(assert (=> b!716284 (=> (not res!479184) (not e!402161))))

(assert (=> b!716284 (= res!479184 (not (contains!4028 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716285 () Bool)

(declare-fun res!479191 () Bool)

(assert (=> b!716285 (=> (not res!479191) (not e!402161))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40549 0))(
  ( (array!40550 (arr!19410 (Array (_ BitVec 32) (_ BitVec 64))) (size!19828 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40549)

(assert (=> b!716285 (= res!479191 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19828 a!3591)))))

(declare-fun b!716286 () Bool)

(declare-fun res!479189 () Bool)

(assert (=> b!716286 (=> (not res!479189) (not e!402161))))

(assert (=> b!716286 (= res!479189 (not (contains!4028 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716287 () Bool)

(declare-fun res!479179 () Bool)

(assert (=> b!716287 (=> (not res!479179) (not e!402161))))

(assert (=> b!716287 (= res!479179 (not (contains!4028 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716288 () Bool)

(declare-fun res!479183 () Bool)

(assert (=> b!716288 (=> (not res!479183) (not e!402161))))

(declare-fun arrayNoDuplicates!0 (array!40549 (_ BitVec 32) List!13451) Bool)

(assert (=> b!716288 (= res!479183 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!716289 () Bool)

(declare-fun res!479186 () Bool)

(assert (=> b!716289 (=> (not res!479186) (not e!402161))))

(assert (=> b!716289 (= res!479186 (not (contains!4028 acc!652 k!2824)))))

(declare-fun res!479185 () Bool)

(assert (=> start!63586 (=> (not res!479185) (not e!402161))))

(assert (=> start!63586 (= res!479185 (and (bvslt (size!19828 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19828 a!3591))))))

(assert (=> start!63586 e!402161))

(assert (=> start!63586 true))

(declare-fun array_inv!15206 (array!40549) Bool)

(assert (=> start!63586 (array_inv!15206 a!3591)))

(declare-fun b!716290 () Bool)

(declare-fun res!479187 () Bool)

(assert (=> b!716290 (=> (not res!479187) (not e!402161))))

(declare-fun arrayContainsKey!0 (array!40549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716290 (= res!479187 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!716291 () Bool)

(declare-fun res!479178 () Bool)

(assert (=> b!716291 (=> (not res!479178) (not e!402161))))

(declare-fun subseq!473 (List!13451 List!13451) Bool)

(assert (=> b!716291 (= res!479178 (subseq!473 acc!652 newAcc!49))))

(declare-fun b!716292 () Bool)

(declare-fun res!479188 () Bool)

(assert (=> b!716292 (=> (not res!479188) (not e!402161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716292 (= res!479188 (validKeyInArray!0 k!2824))))

(declare-fun b!716293 () Bool)

(assert (=> b!716293 (= e!402161 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (= (and start!63586 res!479185) b!716280))

(assert (= (and b!716280 res!479182) b!716279))

(assert (= (and b!716279 res!479190) b!716283))

(assert (= (and b!716283 res!479180) b!716286))

(assert (= (and b!716286 res!479189) b!716290))

(assert (= (and b!716290 res!479187) b!716289))

(assert (= (and b!716289 res!479186) b!716292))

(assert (= (and b!716292 res!479188) b!716288))

(assert (= (and b!716288 res!479183) b!716291))

(assert (= (and b!716291 res!479178) b!716282))

(assert (= (and b!716282 res!479177) b!716281))

(assert (= (and b!716281 res!479181) b!716287))

(assert (= (and b!716287 res!479179) b!716284))

(assert (= (and b!716284 res!479184) b!716285))

(assert (= (and b!716285 res!479191) b!716293))

(declare-fun m!672301 () Bool)

(assert (=> b!716292 m!672301))

(declare-fun m!672303 () Bool)

(assert (=> b!716279 m!672303))

(declare-fun m!672305 () Bool)

(assert (=> b!716287 m!672305))

(declare-fun m!672307 () Bool)

(assert (=> b!716290 m!672307))

(declare-fun m!672309 () Bool)

(assert (=> b!716293 m!672309))

(declare-fun m!672311 () Bool)

(assert (=> b!716286 m!672311))

(declare-fun m!672313 () Bool)

(assert (=> b!716281 m!672313))

(declare-fun m!672315 () Bool)

(assert (=> start!63586 m!672315))

(declare-fun m!672317 () Bool)

(assert (=> b!716280 m!672317))

(declare-fun m!672319 () Bool)

(assert (=> b!716284 m!672319))

(declare-fun m!672321 () Bool)

(assert (=> b!716283 m!672321))

(declare-fun m!672323 () Bool)

(assert (=> b!716282 m!672323))

(declare-fun m!672325 () Bool)

(assert (=> b!716291 m!672325))

(declare-fun m!672327 () Bool)

(assert (=> b!716288 m!672327))

(declare-fun m!672329 () Bool)

(assert (=> b!716289 m!672329))

(push 1)

(assert (not start!63586))

(assert (not b!716291))

(assert (not b!716286))

(assert (not b!716283))

(assert (not b!716288))

(assert (not b!716293))

(assert (not b!716280))

(assert (not b!716281))

(assert (not b!716289))

(assert (not b!716284))

(assert (not b!716292))

(assert (not b!716279))

(assert (not b!716287))

(assert (not b!716282))

(assert (not b!716290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98573 () Bool)

(declare-fun lt!318914 () Bool)

(declare-fun content!374 (List!13451) (Set (_ BitVec 64)))

(assert (=> d!98573 (= lt!318914 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!374 acc!652)))))

(declare-fun e!402208 () Bool)

(assert (=> d!98573 (= lt!318914 e!402208)))

(declare-fun res!479309 () Bool)

(assert (=> d!98573 (=> (not res!479309) (not e!402208))))

(assert (=> d!98573 (= res!479309 (is-Cons!13447 acc!652))))

(assert (=> d!98573 (= (contains!4028 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318914)))

(declare-fun b!716423 () Bool)

(declare-fun e!402209 () Bool)

(assert (=> b!716423 (= e!402208 e!402209)))

(declare-fun res!479310 () Bool)

(assert (=> b!716423 (=> res!479310 e!402209)))

(assert (=> b!716423 (= res!479310 (= (h!14492 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716424 () Bool)

(assert (=> b!716424 (= e!402209 (contains!4028 (t!19766 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98573 res!479309) b!716423))

(assert (= (and b!716423 (not res!479310)) b!716424))

(declare-fun m!672413 () Bool)

(assert (=> d!98573 m!672413))

(declare-fun m!672415 () Bool)

(assert (=> d!98573 m!672415))

(declare-fun m!672417 () Bool)

(assert (=> b!716424 m!672417))

(assert (=> b!716283 d!98573))

(declare-fun b!716461 () Bool)

(declare-fun e!402240 () Bool)

(declare-fun e!402241 () Bool)

(assert (=> b!716461 (= e!402240 e!402241)))

(declare-fun res!479337 () Bool)

(assert (=> b!716461 (=> (not res!479337) (not e!402241))))

(declare-fun e!402243 () Bool)

(assert (=> b!716461 (= res!479337 (not e!402243))))

(declare-fun res!479336 () Bool)

(assert (=> b!716461 (=> (not res!479336) (not e!402243))))

(assert (=> b!716461 (= res!479336 (validKeyInArray!0 (select (arr!19410 a!3591) from!2969)))))

(declare-fun b!716462 () Bool)

(declare-fun e!402242 () Bool)

(declare-fun call!34669 () Bool)

(assert (=> b!716462 (= e!402242 call!34669)))

(declare-fun b!716464 () Bool)

(assert (=> b!716464 (= e!402241 e!402242)))

(declare-fun c!78930 () Bool)

(assert (=> b!716464 (= c!78930 (validKeyInArray!0 (select (arr!19410 a!3591) from!2969)))))

(declare-fun b!716465 () Bool)

(assert (=> b!716465 (= e!402242 call!34669)))

(declare-fun bm!34666 () Bool)

(assert (=> bm!34666 (= call!34669 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78930 (Cons!13447 (select (arr!19410 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!716463 () Bool)

(assert (=> b!716463 (= e!402243 (contains!4028 newAcc!49 (select (arr!19410 a!3591) from!2969)))))

(declare-fun d!98579 () Bool)

(declare-fun res!479335 () Bool)

(assert (=> d!98579 (=> res!479335 e!402240)))

(assert (=> d!98579 (= res!479335 (bvsge from!2969 (size!19828 a!3591)))))

(assert (=> d!98579 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!402240)))

(assert (= (and d!98579 (not res!479335)) b!716461))

(assert (= (and b!716461 res!479336) b!716463))

(assert (= (and b!716461 res!479337) b!716464))

(assert (= (and b!716464 c!78930) b!716465))

(assert (= (and b!716464 (not c!78930)) b!716462))

(assert (= (or b!716465 b!716462) bm!34666))

(declare-fun m!672429 () Bool)

(assert (=> b!716461 m!672429))

(assert (=> b!716461 m!672429))

(declare-fun m!672431 () Bool)

(assert (=> b!716461 m!672431))

(assert (=> b!716464 m!672429))

(assert (=> b!716464 m!672429))

(assert (=> b!716464 m!672431))

(assert (=> bm!34666 m!672429))

(declare-fun m!672433 () Bool)

(assert (=> bm!34666 m!672433))

(assert (=> b!716463 m!672429))

(assert (=> b!716463 m!672429))

(declare-fun m!672437 () Bool)

(assert (=> b!716463 m!672437))

(assert (=> b!716293 d!98579))

(declare-fun d!98587 () Bool)

(assert (=> d!98587 (= (array_inv!15206 a!3591) (bvsge (size!19828 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63586 d!98587))

(declare-fun d!98591 () Bool)

(declare-fun lt!318916 () Bool)

(assert (=> d!98591 (= lt!318916 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!374 newAcc!49)))))

(declare-fun e!402248 () Bool)

(assert (=> d!98591 (= lt!318916 e!402248)))

(declare-fun res!479341 () Bool)

(assert (=> d!98591 (=> (not res!479341) (not e!402248))))

(assert (=> d!98591 (= res!479341 (is-Cons!13447 newAcc!49))))

(assert (=> d!98591 (= (contains!4028 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318916)))

(declare-fun b!716471 () Bool)

(declare-fun e!402249 () Bool)

(assert (=> b!716471 (= e!402248 e!402249)))

(declare-fun res!479342 () Bool)

(assert (=> b!716471 (=> res!479342 e!402249)))

(assert (=> b!716471 (= res!479342 (= (h!14492 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716472 () Bool)

(assert (=> b!716472 (= e!402249 (contains!4028 (t!19766 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98591 res!479341) b!716471))

(assert (= (and b!716471 (not res!479342)) b!716472))

(declare-fun m!672445 () Bool)

(assert (=> d!98591 m!672445))

(declare-fun m!672447 () Bool)

(assert (=> d!98591 m!672447))

(declare-fun m!672449 () Bool)

(assert (=> b!716472 m!672449))

(assert (=> b!716284 d!98591))

(declare-fun d!98593 () Bool)

(declare-fun lt!318917 () Bool)

(assert (=> d!98593 (= lt!318917 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!374 acc!652)))))

(declare-fun e!402254 () Bool)

(assert (=> d!98593 (= lt!318917 e!402254)))

(declare-fun res!479346 () Bool)

(assert (=> d!98593 (=> (not res!479346) (not e!402254))))

(assert (=> d!98593 (= res!479346 (is-Cons!13447 acc!652))))

(assert (=> d!98593 (= (contains!4028 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318917)))

(declare-fun b!716478 () Bool)

(declare-fun e!402255 () Bool)

(assert (=> b!716478 (= e!402254 e!402255)))

(declare-fun res!479347 () Bool)

(assert (=> b!716478 (=> res!479347 e!402255)))

(assert (=> b!716478 (= res!479347 (= (h!14492 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716479 () Bool)

(assert (=> b!716479 (= e!402255 (contains!4028 (t!19766 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98593 res!479346) b!716478))

(assert (= (and b!716478 (not res!479347)) b!716479))

(assert (=> d!98593 m!672413))

(declare-fun m!672453 () Bool)

(assert (=> d!98593 m!672453))

(declare-fun m!672457 () Bool)

(assert (=> b!716479 m!672457))

(assert (=> b!716286 d!98593))

(declare-fun d!98595 () Bool)

(declare-fun lt!318918 () Bool)

(assert (=> d!98595 (= lt!318918 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!374 newAcc!49)))))

(declare-fun e!402256 () Bool)

(assert (=> d!98595 (= lt!318918 e!402256)))

(declare-fun res!479348 () Bool)

(assert (=> d!98595 (=> (not res!479348) (not e!402256))))

(assert (=> d!98595 (= res!479348 (is-Cons!13447 newAcc!49))))

(assert (=> d!98595 (= (contains!4028 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318918)))

(declare-fun b!716480 () Bool)

(declare-fun e!402257 () Bool)

(assert (=> b!716480 (= e!402256 e!402257)))

(declare-fun res!479349 () Bool)

(assert (=> b!716480 (=> res!479349 e!402257)))

(assert (=> b!716480 (= res!479349 (= (h!14492 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716481 () Bool)

(assert (=> b!716481 (= e!402257 (contains!4028 (t!19766 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98595 res!479348) b!716480))

(assert (= (and b!716480 (not res!479349)) b!716481))

(assert (=> d!98595 m!672445))

(declare-fun m!672463 () Bool)

(assert (=> d!98595 m!672463))

(declare-fun m!672465 () Bool)

(assert (=> b!716481 m!672465))

(assert (=> b!716287 d!98595))

(declare-fun b!716482 () Bool)

(declare-fun e!402258 () Bool)

(declare-fun e!402259 () Bool)

(assert (=> b!716482 (= e!402258 e!402259)))

(declare-fun res!479352 () Bool)

(assert (=> b!716482 (=> (not res!479352) (not e!402259))))

(declare-fun e!402261 () Bool)

(assert (=> b!716482 (= res!479352 (not e!402261))))

(declare-fun res!479351 () Bool)

(assert (=> b!716482 (=> (not res!479351) (not e!402261))))

(assert (=> b!716482 (= res!479351 (validKeyInArray!0 (select (arr!19410 a!3591) from!2969)))))

(declare-fun b!716483 () Bool)

(declare-fun e!402260 () Bool)

(declare-fun call!34672 () Bool)

(assert (=> b!716483 (= e!402260 call!34672)))

(declare-fun b!716485 () Bool)

(assert (=> b!716485 (= e!402259 e!402260)))

(declare-fun c!78933 () Bool)

(assert (=> b!716485 (= c!78933 (validKeyInArray!0 (select (arr!19410 a!3591) from!2969)))))

(declare-fun b!716486 () Bool)

(assert (=> b!716486 (= e!402260 call!34672)))

(declare-fun bm!34669 () Bool)

(assert (=> bm!34669 (= call!34672 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78933 (Cons!13447 (select (arr!19410 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!716484 () Bool)

(assert (=> b!716484 (= e!402261 (contains!4028 acc!652 (select (arr!19410 a!3591) from!2969)))))

(declare-fun d!98599 () Bool)

(declare-fun res!479350 () Bool)

(assert (=> d!98599 (=> res!479350 e!402258)))

(assert (=> d!98599 (= res!479350 (bvsge from!2969 (size!19828 a!3591)))))

(assert (=> d!98599 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!402258)))

(assert (= (and d!98599 (not res!479350)) b!716482))

(assert (= (and b!716482 res!479351) b!716484))

(assert (= (and b!716482 res!479352) b!716485))

(assert (= (and b!716485 c!78933) b!716486))

(assert (= (and b!716485 (not c!78933)) b!716483))

(assert (= (or b!716486 b!716483) bm!34669))

(assert (=> b!716482 m!672429))

(assert (=> b!716482 m!672429))

(assert (=> b!716482 m!672431))

(assert (=> b!716485 m!672429))

(assert (=> b!716485 m!672429))

(assert (=> b!716485 m!672431))

(assert (=> bm!34669 m!672429))

(declare-fun m!672467 () Bool)

(assert (=> bm!34669 m!672467))

(assert (=> b!716484 m!672429))

(assert (=> b!716484 m!672429))

(declare-fun m!672469 () Bool)

(assert (=> b!716484 m!672469))

(assert (=> b!716288 d!98599))

(declare-fun d!98603 () Bool)

(declare-fun res!479378 () Bool)

(declare-fun e!402288 () Bool)

(assert (=> d!98603 (=> res!479378 e!402288)))

(assert (=> d!98603 (= res!479378 (is-Nil!13448 newAcc!49))))

(assert (=> d!98603 (= (noDuplicate!1275 newAcc!49) e!402288)))

(declare-fun b!716514 () Bool)

(declare-fun e!402289 () Bool)

(assert (=> b!716514 (= e!402288 e!402289)))

(declare-fun res!479379 () Bool)

(assert (=> b!716514 (=> (not res!479379) (not e!402289))))

(assert (=> b!716514 (= res!479379 (not (contains!4028 (t!19766 newAcc!49) (h!14492 newAcc!49))))))

(declare-fun b!716515 () Bool)

(assert (=> b!716515 (= e!402289 (noDuplicate!1275 (t!19766 newAcc!49)))))

(assert (= (and d!98603 (not res!479378)) b!716514))

(assert (= (and b!716514 res!479379) b!716515))

(declare-fun m!672491 () Bool)

(assert (=> b!716514 m!672491))

(declare-fun m!672493 () Bool)

(assert (=> b!716515 m!672493))

(assert (=> b!716279 d!98603))

(declare-fun d!98615 () Bool)

(declare-fun res!479394 () Bool)

(declare-fun e!402304 () Bool)

(assert (=> d!98615 (=> res!479394 e!402304)))

(assert (=> d!98615 (= res!479394 (= (select (arr!19410 a!3591) from!2969) k!2824))))

(assert (=> d!98615 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!402304)))

(declare-fun b!716530 () Bool)

(declare-fun e!402305 () Bool)

(assert (=> b!716530 (= e!402304 e!402305)))

(declare-fun res!479395 () Bool)

(assert (=> b!716530 (=> (not res!479395) (not e!402305))))

(assert (=> b!716530 (= res!479395 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19828 a!3591)))))

(declare-fun b!716531 () Bool)

(assert (=> b!716531 (= e!402305 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98615 (not res!479394)) b!716530))

(assert (= (and b!716530 res!479395) b!716531))

(assert (=> d!98615 m!672429))

(declare-fun m!672505 () Bool)

(assert (=> b!716531 m!672505))

(assert (=> b!716290 d!98615))

(declare-fun d!98623 () Bool)

(declare-fun lt!318924 () Bool)

(assert (=> d!98623 (= lt!318924 (set.member k!2824 (content!374 acc!652)))))

(declare-fun e!402306 () Bool)

(assert (=> d!98623 (= lt!318924 e!402306)))

(declare-fun res!479396 () Bool)

(assert (=> d!98623 (=> (not res!479396) (not e!402306))))

(assert (=> d!98623 (= res!479396 (is-Cons!13447 acc!652))))

(assert (=> d!98623 (= (contains!4028 acc!652 k!2824) lt!318924)))

(declare-fun b!716532 () Bool)

(declare-fun e!402307 () Bool)

(assert (=> b!716532 (= e!402306 e!402307)))

(declare-fun res!479397 () Bool)

(assert (=> b!716532 (=> res!479397 e!402307)))

(assert (=> b!716532 (= res!479397 (= (h!14492 acc!652) k!2824))))

(declare-fun b!716533 () Bool)

(assert (=> b!716533 (= e!402307 (contains!4028 (t!19766 acc!652) k!2824))))

(assert (= (and d!98623 res!479396) b!716532))

(assert (= (and b!716532 (not res!479397)) b!716533))

(assert (=> d!98623 m!672413))

(declare-fun m!672507 () Bool)

(assert (=> d!98623 m!672507))

(declare-fun m!672509 () Bool)

(assert (=> b!716533 m!672509))

(assert (=> b!716289 d!98623))

(declare-fun b!716568 () Bool)

(declare-fun e!402335 () Bool)

(assert (=> b!716568 (= e!402335 (subseq!473 acc!652 (t!19766 newAcc!49)))))

(declare-fun d!98625 () Bool)

(declare-fun res!479417 () Bool)

(declare-fun e!402337 () Bool)

(assert (=> d!98625 (=> res!479417 e!402337)))

(assert (=> d!98625 (= res!479417 (is-Nil!13448 acc!652))))

(assert (=> d!98625 (= (subseq!473 acc!652 newAcc!49) e!402337)))

(declare-fun b!716567 () Bool)

(declare-fun e!402336 () Bool)

(assert (=> b!716567 (= e!402336 (subseq!473 (t!19766 acc!652) (t!19766 newAcc!49)))))

(declare-fun b!716566 () Bool)

(declare-fun e!402334 () Bool)

(assert (=> b!716566 (= e!402334 e!402335)))

(declare-fun res!479419 () Bool)

(assert (=> b!716566 (=> res!479419 e!402335)))

(assert (=> b!716566 (= res!479419 e!402336)))

(declare-fun res!479418 () Bool)

(assert (=> b!716566 (=> (not res!479418) (not e!402336))))

(assert (=> b!716566 (= res!479418 (= (h!14492 acc!652) (h!14492 newAcc!49)))))

(declare-fun b!716565 () Bool)

(assert (=> b!716565 (= e!402337 e!402334)))

(declare-fun res!479420 () Bool)

(assert (=> b!716565 (=> (not res!479420) (not e!402334))))

(assert (=> b!716565 (= res!479420 (is-Cons!13447 newAcc!49))))

(assert (= (and d!98625 (not res!479417)) b!716565))

(assert (= (and b!716565 res!479420) b!716566))

(assert (= (and b!716566 res!479418) b!716567))

(assert (= (and b!716566 (not res!479419)) b!716568))

(declare-fun m!672531 () Bool)

(assert (=> b!716568 m!672531))

(declare-fun m!672533 () Bool)

(assert (=> b!716567 m!672533))

(assert (=> b!716291 d!98625))

(declare-fun d!98631 () Bool)

(declare-fun res!479421 () Bool)

(declare-fun e!402338 () Bool)

(assert (=> d!98631 (=> res!479421 e!402338)))

(assert (=> d!98631 (= res!479421 (is-Nil!13448 acc!652))))

(assert (=> d!98631 (= (noDuplicate!1275 acc!652) e!402338)))

(declare-fun b!716569 () Bool)

(declare-fun e!402339 () Bool)

(assert (=> b!716569 (= e!402338 e!402339)))

(declare-fun res!479422 () Bool)

(assert (=> b!716569 (=> (not res!479422) (not e!402339))))

(assert (=> b!716569 (= res!479422 (not (contains!4028 (t!19766 acc!652) (h!14492 acc!652))))))

(declare-fun b!716570 () Bool)

(assert (=> b!716570 (= e!402339 (noDuplicate!1275 (t!19766 acc!652)))))

(assert (= (and d!98631 (not res!479421)) b!716569))

(assert (= (and b!716569 res!479422) b!716570))

(declare-fun m!672535 () Bool)

(assert (=> b!716569 m!672535))

(declare-fun m!672537 () Bool)

(assert (=> b!716570 m!672537))

(assert (=> b!716280 d!98631))

(declare-fun d!98633 () Bool)

(declare-fun lt!318928 () Bool)

(assert (=> d!98633 (= lt!318928 (set.member k!2824 (content!374 newAcc!49)))))

(declare-fun e!402340 () Bool)

(assert (=> d!98633 (= lt!318928 e!402340)))

(declare-fun res!479423 () Bool)

(assert (=> d!98633 (=> (not res!479423) (not e!402340))))

(assert (=> d!98633 (= res!479423 (is-Cons!13447 newAcc!49))))

(assert (=> d!98633 (= (contains!4028 newAcc!49 k!2824) lt!318928)))

(declare-fun b!716571 () Bool)

(declare-fun e!402341 () Bool)

(assert (=> b!716571 (= e!402340 e!402341)))

(declare-fun res!479424 () Bool)

(assert (=> b!716571 (=> res!479424 e!402341)))

(assert (=> b!716571 (= res!479424 (= (h!14492 newAcc!49) k!2824))))

(declare-fun b!716572 () Bool)

(assert (=> b!716572 (= e!402341 (contains!4028 (t!19766 newAcc!49) k!2824))))

(assert (= (and d!98633 res!479423) b!716571))

(assert (= (and b!716571 (not res!479424)) b!716572))

(assert (=> d!98633 m!672445))

(declare-fun m!672539 () Bool)

(assert (=> d!98633 m!672539))

(declare-fun m!672541 () Bool)

(assert (=> b!716572 m!672541))

(assert (=> b!716282 d!98633))

(declare-fun b!716606 () Bool)

(declare-fun e!402371 () List!13451)

(assert (=> b!716606 (= e!402371 Nil!13448)))

(declare-fun b!716607 () Bool)

(declare-fun lt!318934 () List!13451)

(declare-fun e!402372 () Bool)

(assert (=> b!716607 (= e!402372 (= (content!374 lt!318934) (set.minus (content!374 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!716608 () Bool)

(declare-fun e!402373 () List!13451)

(assert (=> b!716608 (= e!402371 e!402373)))

(declare-fun c!78946 () Bool)

(assert (=> b!716608 (= c!78946 (= k!2824 (h!14492 newAcc!49)))))

(declare-fun b!716609 () Bool)

(declare-fun call!34680 () List!13451)

(assert (=> b!716609 (= e!402373 (Cons!13447 (h!14492 newAcc!49) call!34680))))

(declare-fun d!98635 () Bool)

(assert (=> d!98635 e!402372))

(declare-fun res!479448 () Bool)

(assert (=> d!98635 (=> (not res!479448) (not e!402372))))

(declare-fun size!19833 (List!13451) Int)

(assert (=> d!98635 (= res!479448 (<= (size!19833 lt!318934) (size!19833 newAcc!49)))))

(assert (=> d!98635 (= lt!318934 e!402371)))

(declare-fun c!78947 () Bool)

(assert (=> d!98635 (= c!78947 (is-Cons!13447 newAcc!49))))

(assert (=> d!98635 (= (-!438 newAcc!49 k!2824) lt!318934)))

(declare-fun bm!34677 () Bool)

(assert (=> bm!34677 (= call!34680 (-!438 (t!19766 newAcc!49) k!2824))))

(declare-fun b!716610 () Bool)

(assert (=> b!716610 (= e!402373 call!34680)))

(assert (= (and d!98635 c!78947) b!716608))

(assert (= (and d!98635 (not c!78947)) b!716606))

(assert (= (and b!716608 c!78946) b!716610))

(assert (= (and b!716608 (not c!78946)) b!716609))

(assert (= (or b!716610 b!716609) bm!34677))

(assert (= (and d!98635 res!479448) b!716607))

(declare-fun m!672565 () Bool)

(assert (=> b!716607 m!672565))

(assert (=> b!716607 m!672445))

(declare-fun m!672567 () Bool)

(assert (=> b!716607 m!672567))

(declare-fun m!672569 () Bool)

(assert (=> d!98635 m!672569))

(declare-fun m!672571 () Bool)

(assert (=> d!98635 m!672571))

(declare-fun m!672573 () Bool)

(assert (=> bm!34677 m!672573))

(assert (=> b!716281 d!98635))

(declare-fun d!98649 () Bool)

(assert (=> d!98649 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!716292 d!98649))

(push 1)

(assert (not b!716464))

(assert (not d!98623))

(assert (not bm!34669))

(assert (not b!716607))

(assert (not b!716515))

(assert (not d!98635))

(assert (not d!98595))

(assert (not b!716479))

(assert (not b!716485))

(assert (not b!716484))

(assert (not b!716531))

(assert (not d!98591))

(assert (not b!716463))

(assert (not b!716569))

(assert (not d!98633))

(assert (not b!716481))

(assert (not b!716482))

(assert (not b!716568))

(assert (not b!716514))

(assert (not b!716567))

(assert (not b!716424))

(assert (not d!98573))

(assert (not bm!34666))

(assert (not bm!34677))

(assert (not b!716472))

(assert (not b!716570))

(assert (not b!716572))

(assert (not b!716461))

(assert (not b!716533))

(assert (not d!98593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98703 () Bool)

(declare-fun c!78963 () Bool)

(assert (=> d!98703 (= c!78963 (is-Nil!13448 newAcc!49))))

(declare-fun e!402434 () (Set (_ BitVec 64)))

(assert (=> d!98703 (= (content!374 newAcc!49) e!402434)))

(declare-fun b!716686 () Bool)

(assert (=> b!716686 (= e!402434 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!716687 () Bool)

(assert (=> b!716687 (= e!402434 (set.union (set.insert (h!14492 newAcc!49) (as set.empty (Set (_ BitVec 64)))) (content!374 (t!19766 newAcc!49))))))

(assert (= (and d!98703 c!78963) b!716686))

(assert (= (and d!98703 (not c!78963)) b!716687))

(declare-fun m!672673 () Bool)

(assert (=> b!716687 m!672673))

(declare-fun m!672675 () Bool)

(assert (=> b!716687 m!672675))

(assert (=> d!98595 d!98703))

(assert (=> d!98633 d!98703))

(declare-fun d!98705 () Bool)

(declare-fun c!78964 () Bool)

(assert (=> d!98705 (= c!78964 (is-Nil!13448 acc!652))))

(declare-fun e!402435 () (Set (_ BitVec 64)))

(assert (=> d!98705 (= (content!374 acc!652) e!402435)))

(declare-fun b!716688 () Bool)

(assert (=> b!716688 (= e!402435 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!716689 () Bool)

(assert (=> b!716689 (= e!402435 (set.union (set.insert (h!14492 acc!652) (as set.empty (Set (_ BitVec 64)))) (content!374 (t!19766 acc!652))))))

(assert (= (and d!98705 c!78964) b!716688))

(assert (= (and d!98705 (not c!78964)) b!716689))

(declare-fun m!672677 () Bool)

(assert (=> b!716689 m!672677))

(declare-fun m!672679 () Bool)

(assert (=> b!716689 m!672679))

(assert (=> d!98623 d!98705))

(declare-fun d!98707 () Bool)

(declare-fun lt!318951 () Bool)

(assert (=> d!98707 (= lt!318951 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!374 (t!19766 newAcc!49))))))

(declare-fun e!402436 () Bool)

(assert (=> d!98707 (= lt!318951 e!402436)))

(declare-fun res!479494 () Bool)

(assert (=> d!98707 (=> (not res!479494) (not e!402436))))

(assert (=> d!98707 (= res!479494 (is-Cons!13447 (t!19766 newAcc!49)))))

(assert (=> d!98707 (= (contains!4028 (t!19766 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000) lt!318951)))

(declare-fun b!716690 () Bool)

(declare-fun e!402437 () Bool)

(assert (=> b!716690 (= e!402436 e!402437)))

(declare-fun res!479495 () Bool)

(assert (=> b!716690 (=> res!479495 e!402437)))

(assert (=> b!716690 (= res!479495 (= (h!14492 (t!19766 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716691 () Bool)

(assert (=> b!716691 (= e!402437 (contains!4028 (t!19766 (t!19766 newAcc!49)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98707 res!479494) b!716690))

(assert (= (and b!716690 (not res!479495)) b!716691))

(assert (=> d!98707 m!672675))

(declare-fun m!672681 () Bool)

(assert (=> d!98707 m!672681))

(declare-fun m!672683 () Bool)

(assert (=> b!716691 m!672683))

(assert (=> b!716472 d!98707))

(declare-fun b!716695 () Bool)

(declare-fun e!402439 () Bool)

(assert (=> b!716695 (= e!402439 (subseq!473 (t!19766 acc!652) (t!19766 (t!19766 newAcc!49))))))

(declare-fun d!98709 () Bool)

(declare-fun res!479496 () Bool)

(declare-fun e!402441 () Bool)

(assert (=> d!98709 (=> res!479496 e!402441)))

(assert (=> d!98709 (= res!479496 (is-Nil!13448 (t!19766 acc!652)))))

(assert (=> d!98709 (= (subseq!473 (t!19766 acc!652) (t!19766 newAcc!49)) e!402441)))

(declare-fun b!716694 () Bool)

(declare-fun e!402440 () Bool)

(assert (=> b!716694 (= e!402440 (subseq!473 (t!19766 (t!19766 acc!652)) (t!19766 (t!19766 newAcc!49))))))

(declare-fun b!716693 () Bool)

(declare-fun e!402438 () Bool)

(assert (=> b!716693 (= e!402438 e!402439)))

(declare-fun res!479498 () Bool)

(assert (=> b!716693 (=> res!479498 e!402439)))

(assert (=> b!716693 (= res!479498 e!402440)))

(declare-fun res!479497 () Bool)

(assert (=> b!716693 (=> (not res!479497) (not e!402440))))

(assert (=> b!716693 (= res!479497 (= (h!14492 (t!19766 acc!652)) (h!14492 (t!19766 newAcc!49))))))

(declare-fun b!716692 () Bool)

(assert (=> b!716692 (= e!402441 e!402438)))

(declare-fun res!479499 () Bool)

(assert (=> b!716692 (=> (not res!479499) (not e!402438))))

(assert (=> b!716692 (= res!479499 (is-Cons!13447 (t!19766 newAcc!49)))))

(assert (= (and d!98709 (not res!479496)) b!716692))

(assert (= (and b!716692 res!479499) b!716693))

(assert (= (and b!716693 res!479497) b!716694))

(assert (= (and b!716693 (not res!479498)) b!716695))

(declare-fun m!672685 () Bool)

(assert (=> b!716695 m!672685))

(declare-fun m!672687 () Bool)

(assert (=> b!716694 m!672687))

(assert (=> b!716567 d!98709))

(declare-fun d!98711 () Bool)

(declare-fun lt!318954 () Int)

(assert (=> d!98711 (>= lt!318954 0)))

(declare-fun e!402444 () Int)

(assert (=> d!98711 (= lt!318954 e!402444)))

(declare-fun c!78967 () Bool)

(assert (=> d!98711 (= c!78967 (is-Nil!13448 lt!318934))))

(assert (=> d!98711 (= (size!19833 lt!318934) lt!318954)))

(declare-fun b!716700 () Bool)

(assert (=> b!716700 (= e!402444 0)))

(declare-fun b!716701 () Bool)

(assert (=> b!716701 (= e!402444 (+ 1 (size!19833 (t!19766 lt!318934))))))

(assert (= (and d!98711 c!78967) b!716700))

(assert (= (and d!98711 (not c!78967)) b!716701))

