; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62956 () Bool)

(assert start!62956)

(declare-fun b!709555 () Bool)

(declare-fun res!473217 () Bool)

(declare-fun e!399239 () Bool)

(assert (=> b!709555 (=> (not res!473217) (not e!399239))))

(declare-datatypes ((List!13420 0))(
  ( (Nil!13417) (Cons!13416 (h!14461 (_ BitVec 64)) (t!19708 List!13420)) )
))
(declare-fun newAcc!49 () List!13420)

(declare-fun contains!3942 (List!13420 (_ BitVec 64)) Bool)

(assert (=> b!709555 (= res!473217 (not (contains!3942 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709556 () Bool)

(declare-fun res!473224 () Bool)

(assert (=> b!709556 (=> (not res!473224) (not e!399239))))

(declare-fun noDuplicate!1211 (List!13420) Bool)

(assert (=> b!709556 (= res!473224 (noDuplicate!1211 newAcc!49))))

(declare-fun b!709557 () Bool)

(declare-fun res!473221 () Bool)

(assert (=> b!709557 (=> (not res!473221) (not e!399239))))

(declare-fun acc!652 () List!13420)

(declare-fun subseq!404 (List!13420 List!13420) Bool)

(assert (=> b!709557 (= res!473221 (subseq!404 acc!652 newAcc!49))))

(declare-fun b!709558 () Bool)

(declare-fun res!473226 () Bool)

(assert (=> b!709558 (=> (not res!473226) (not e!399239))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709558 (= res!473226 (validKeyInArray!0 k0!2824))))

(declare-fun lt!318014 () List!13420)

(declare-datatypes ((array!40383 0))(
  ( (array!40384 (arr!19340 (Array (_ BitVec 32) (_ BitVec 64))) (size!19734 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40383)

(declare-fun e!399241 () Bool)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun b!709559 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40383 (_ BitVec 32) List!13420) Bool)

(assert (=> b!709559 (= e!399241 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318014)))))

(declare-fun b!709560 () Bool)

(declare-fun res!473222 () Bool)

(assert (=> b!709560 (=> (not res!473222) (not e!399241))))

(assert (=> b!709560 (= res!473222 (not (contains!3942 lt!318014 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709561 () Bool)

(declare-fun res!473235 () Bool)

(assert (=> b!709561 (=> (not res!473235) (not e!399239))))

(assert (=> b!709561 (= res!473235 (noDuplicate!1211 acc!652))))

(declare-fun b!709562 () Bool)

(declare-fun res!473229 () Bool)

(assert (=> b!709562 (=> (not res!473229) (not e!399239))))

(assert (=> b!709562 (= res!473229 (not (contains!3942 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!473219 () Bool)

(assert (=> start!62956 (=> (not res!473219) (not e!399239))))

(assert (=> start!62956 (= res!473219 (and (bvslt (size!19734 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19734 a!3591))))))

(assert (=> start!62956 e!399239))

(assert (=> start!62956 true))

(declare-fun array_inv!15223 (array!40383) Bool)

(assert (=> start!62956 (array_inv!15223 a!3591)))

(declare-fun b!709563 () Bool)

(declare-fun res!473213 () Bool)

(assert (=> b!709563 (=> (not res!473213) (not e!399239))))

(assert (=> b!709563 (= res!473213 (contains!3942 newAcc!49 k0!2824))))

(declare-fun b!709564 () Bool)

(declare-fun res!473215 () Bool)

(assert (=> b!709564 (=> (not res!473215) (not e!399241))))

(assert (=> b!709564 (= res!473215 (noDuplicate!1211 lt!318014))))

(declare-fun b!709565 () Bool)

(declare-fun res!473228 () Bool)

(assert (=> b!709565 (=> (not res!473228) (not e!399239))))

(assert (=> b!709565 (= res!473228 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709566 () Bool)

(declare-fun res!473218 () Bool)

(assert (=> b!709566 (=> (not res!473218) (not e!399239))))

(assert (=> b!709566 (= res!473218 (not (contains!3942 acc!652 k0!2824)))))

(declare-fun b!709567 () Bool)

(assert (=> b!709567 (= e!399239 e!399241)))

(declare-fun res!473227 () Bool)

(assert (=> b!709567 (=> (not res!473227) (not e!399241))))

(assert (=> b!709567 (= res!473227 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!514 (List!13420 (_ BitVec 64)) List!13420)

(assert (=> b!709567 (= lt!318014 ($colon$colon!514 acc!652 (select (arr!19340 a!3591) from!2969)))))

(declare-fun b!709568 () Bool)

(declare-fun res!473225 () Bool)

(assert (=> b!709568 (=> (not res!473225) (not e!399239))))

(assert (=> b!709568 (= res!473225 (not (contains!3942 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709569 () Bool)

(declare-fun res!473234 () Bool)

(assert (=> b!709569 (=> (not res!473234) (not e!399239))))

(assert (=> b!709569 (= res!473234 (validKeyInArray!0 (select (arr!19340 a!3591) from!2969)))))

(declare-fun b!709570 () Bool)

(declare-fun res!473220 () Bool)

(assert (=> b!709570 (=> (not res!473220) (not e!399239))))

(declare-fun -!369 (List!13420 (_ BitVec 64)) List!13420)

(assert (=> b!709570 (= res!473220 (= (-!369 newAcc!49 k0!2824) acc!652))))

(declare-fun b!709571 () Bool)

(declare-fun res!473232 () Bool)

(assert (=> b!709571 (=> (not res!473232) (not e!399239))))

(assert (=> b!709571 (= res!473232 (not (contains!3942 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709572 () Bool)

(declare-fun res!473216 () Bool)

(assert (=> b!709572 (=> (not res!473216) (not e!399241))))

(assert (=> b!709572 (= res!473216 (not (contains!3942 lt!318014 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709573 () Bool)

(declare-fun res!473230 () Bool)

(assert (=> b!709573 (=> (not res!473230) (not e!399239))))

(declare-fun arrayContainsKey!0 (array!40383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709573 (= res!473230 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!709574 () Bool)

(declare-fun res!473223 () Bool)

(assert (=> b!709574 (=> (not res!473223) (not e!399239))))

(assert (=> b!709574 (= res!473223 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19734 a!3591)))))

(declare-fun b!709575 () Bool)

(declare-fun res!473231 () Bool)

(assert (=> b!709575 (=> (not res!473231) (not e!399241))))

(assert (=> b!709575 (= res!473231 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709576 () Bool)

(declare-fun res!473214 () Bool)

(assert (=> b!709576 (=> (not res!473214) (not e!399241))))

(assert (=> b!709576 (= res!473214 (noDuplicate!1211 ($colon$colon!514 newAcc!49 (select (arr!19340 a!3591) from!2969))))))

(declare-fun b!709577 () Bool)

(declare-fun res!473233 () Bool)

(assert (=> b!709577 (=> (not res!473233) (not e!399241))))

(assert (=> b!709577 (= res!473233 (not (contains!3942 lt!318014 k0!2824)))))

(assert (= (and start!62956 res!473219) b!709561))

(assert (= (and b!709561 res!473235) b!709556))

(assert (= (and b!709556 res!473224) b!709571))

(assert (= (and b!709571 res!473232) b!709568))

(assert (= (and b!709568 res!473225) b!709573))

(assert (= (and b!709573 res!473230) b!709566))

(assert (= (and b!709566 res!473218) b!709558))

(assert (= (and b!709558 res!473226) b!709565))

(assert (= (and b!709565 res!473228) b!709557))

(assert (= (and b!709557 res!473221) b!709563))

(assert (= (and b!709563 res!473213) b!709570))

(assert (= (and b!709570 res!473220) b!709555))

(assert (= (and b!709555 res!473217) b!709562))

(assert (= (and b!709562 res!473229) b!709574))

(assert (= (and b!709574 res!473223) b!709569))

(assert (= (and b!709569 res!473234) b!709567))

(assert (= (and b!709567 res!473227) b!709564))

(assert (= (and b!709564 res!473215) b!709576))

(assert (= (and b!709576 res!473214) b!709572))

(assert (= (and b!709572 res!473216) b!709560))

(assert (= (and b!709560 res!473222) b!709575))

(assert (= (and b!709575 res!473231) b!709577))

(assert (= (and b!709577 res!473233) b!709559))

(declare-fun m!666285 () Bool)

(assert (=> start!62956 m!666285))

(declare-fun m!666287 () Bool)

(assert (=> b!709573 m!666287))

(declare-fun m!666289 () Bool)

(assert (=> b!709566 m!666289))

(declare-fun m!666291 () Bool)

(assert (=> b!709562 m!666291))

(declare-fun m!666293 () Bool)

(assert (=> b!709571 m!666293))

(declare-fun m!666295 () Bool)

(assert (=> b!709558 m!666295))

(declare-fun m!666297 () Bool)

(assert (=> b!709563 m!666297))

(declare-fun m!666299 () Bool)

(assert (=> b!709572 m!666299))

(declare-fun m!666301 () Bool)

(assert (=> b!709565 m!666301))

(declare-fun m!666303 () Bool)

(assert (=> b!709567 m!666303))

(assert (=> b!709567 m!666303))

(declare-fun m!666305 () Bool)

(assert (=> b!709567 m!666305))

(declare-fun m!666307 () Bool)

(assert (=> b!709559 m!666307))

(declare-fun m!666309 () Bool)

(assert (=> b!709557 m!666309))

(declare-fun m!666311 () Bool)

(assert (=> b!709561 m!666311))

(declare-fun m!666313 () Bool)

(assert (=> b!709564 m!666313))

(declare-fun m!666315 () Bool)

(assert (=> b!709570 m!666315))

(declare-fun m!666317 () Bool)

(assert (=> b!709560 m!666317))

(assert (=> b!709576 m!666303))

(assert (=> b!709576 m!666303))

(declare-fun m!666319 () Bool)

(assert (=> b!709576 m!666319))

(assert (=> b!709576 m!666319))

(declare-fun m!666321 () Bool)

(assert (=> b!709576 m!666321))

(declare-fun m!666323 () Bool)

(assert (=> b!709555 m!666323))

(declare-fun m!666325 () Bool)

(assert (=> b!709577 m!666325))

(declare-fun m!666327 () Bool)

(assert (=> b!709556 m!666327))

(assert (=> b!709569 m!666303))

(assert (=> b!709569 m!666303))

(declare-fun m!666329 () Bool)

(assert (=> b!709569 m!666329))

(declare-fun m!666331 () Bool)

(assert (=> b!709575 m!666331))

(declare-fun m!666333 () Bool)

(assert (=> b!709568 m!666333))

(check-sat (not b!709563) (not b!709565) (not b!709577) (not b!709575) (not start!62956) (not b!709566) (not b!709557) (not b!709572) (not b!709558) (not b!709561) (not b!709573) (not b!709555) (not b!709562) (not b!709564) (not b!709556) (not b!709569) (not b!709576) (not b!709567) (not b!709568) (not b!709560) (not b!709570) (not b!709559) (not b!709571))
(check-sat)
(get-model)

(declare-fun d!97001 () Bool)

(assert (=> d!97001 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709558 d!97001))

(declare-fun d!97003 () Bool)

(assert (=> d!97003 (= (validKeyInArray!0 (select (arr!19340 a!3591) from!2969)) (and (not (= (select (arr!19340 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19340 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709569 d!97003))

(declare-fun d!97005 () Bool)

(declare-fun lt!318023 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!346 (List!13420) (InoxSet (_ BitVec 64)))

(assert (=> d!97005 (= lt!318023 (select (content!346 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399265 () Bool)

(assert (=> d!97005 (= lt!318023 e!399265)))

(declare-fun res!473378 () Bool)

(assert (=> d!97005 (=> (not res!473378) (not e!399265))))

(get-info :version)

(assert (=> d!97005 (= res!473378 ((_ is Cons!13416) acc!652))))

(assert (=> d!97005 (= (contains!3942 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318023)))

(declare-fun b!709720 () Bool)

(declare-fun e!399264 () Bool)

(assert (=> b!709720 (= e!399265 e!399264)))

(declare-fun res!473379 () Bool)

(assert (=> b!709720 (=> res!473379 e!399264)))

(assert (=> b!709720 (= res!473379 (= (h!14461 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709721 () Bool)

(assert (=> b!709721 (= e!399264 (contains!3942 (t!19708 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97005 res!473378) b!709720))

(assert (= (and b!709720 (not res!473379)) b!709721))

(declare-fun m!666435 () Bool)

(assert (=> d!97005 m!666435))

(declare-fun m!666437 () Bool)

(assert (=> d!97005 m!666437))

(declare-fun m!666439 () Bool)

(assert (=> b!709721 m!666439))

(assert (=> b!709568 d!97005))

(declare-fun d!97007 () Bool)

(declare-fun res!473390 () Bool)

(declare-fun e!399277 () Bool)

(assert (=> d!97007 (=> res!473390 e!399277)))

(assert (=> d!97007 (= res!473390 ((_ is Nil!13417) acc!652))))

(assert (=> d!97007 (= (subseq!404 acc!652 newAcc!49) e!399277)))

(declare-fun b!709731 () Bool)

(declare-fun e!399275 () Bool)

(declare-fun e!399276 () Bool)

(assert (=> b!709731 (= e!399275 e!399276)))

(declare-fun res!473388 () Bool)

(assert (=> b!709731 (=> res!473388 e!399276)))

(declare-fun e!399274 () Bool)

(assert (=> b!709731 (= res!473388 e!399274)))

(declare-fun res!473391 () Bool)

(assert (=> b!709731 (=> (not res!473391) (not e!399274))))

(assert (=> b!709731 (= res!473391 (= (h!14461 acc!652) (h!14461 newAcc!49)))))

(declare-fun b!709730 () Bool)

(assert (=> b!709730 (= e!399277 e!399275)))

(declare-fun res!473389 () Bool)

(assert (=> b!709730 (=> (not res!473389) (not e!399275))))

(assert (=> b!709730 (= res!473389 ((_ is Cons!13416) newAcc!49))))

(declare-fun b!709733 () Bool)

(assert (=> b!709733 (= e!399276 (subseq!404 acc!652 (t!19708 newAcc!49)))))

(declare-fun b!709732 () Bool)

(assert (=> b!709732 (= e!399274 (subseq!404 (t!19708 acc!652) (t!19708 newAcc!49)))))

(assert (= (and d!97007 (not res!473390)) b!709730))

(assert (= (and b!709730 res!473389) b!709731))

(assert (= (and b!709731 res!473391) b!709732))

(assert (= (and b!709731 (not res!473388)) b!709733))

(declare-fun m!666441 () Bool)

(assert (=> b!709733 m!666441))

(declare-fun m!666443 () Bool)

(assert (=> b!709732 m!666443))

(assert (=> b!709557 d!97007))

(declare-fun d!97009 () Bool)

(declare-fun res!473396 () Bool)

(declare-fun e!399282 () Bool)

(assert (=> d!97009 (=> res!473396 e!399282)))

(assert (=> d!97009 (= res!473396 ((_ is Nil!13417) newAcc!49))))

(assert (=> d!97009 (= (noDuplicate!1211 newAcc!49) e!399282)))

(declare-fun b!709738 () Bool)

(declare-fun e!399283 () Bool)

(assert (=> b!709738 (= e!399282 e!399283)))

(declare-fun res!473397 () Bool)

(assert (=> b!709738 (=> (not res!473397) (not e!399283))))

(assert (=> b!709738 (= res!473397 (not (contains!3942 (t!19708 newAcc!49) (h!14461 newAcc!49))))))

(declare-fun b!709739 () Bool)

(assert (=> b!709739 (= e!399283 (noDuplicate!1211 (t!19708 newAcc!49)))))

(assert (= (and d!97009 (not res!473396)) b!709738))

(assert (= (and b!709738 res!473397) b!709739))

(declare-fun m!666445 () Bool)

(assert (=> b!709738 m!666445))

(declare-fun m!666447 () Bool)

(assert (=> b!709739 m!666447))

(assert (=> b!709556 d!97009))

(declare-fun d!97011 () Bool)

(assert (=> d!97011 (= ($colon$colon!514 acc!652 (select (arr!19340 a!3591) from!2969)) (Cons!13416 (select (arr!19340 a!3591) from!2969) acc!652))))

(assert (=> b!709567 d!97011))

(declare-fun d!97013 () Bool)

(declare-fun lt!318024 () Bool)

(assert (=> d!97013 (= lt!318024 (select (content!346 acc!652) k0!2824))))

(declare-fun e!399285 () Bool)

(assert (=> d!97013 (= lt!318024 e!399285)))

(declare-fun res!473398 () Bool)

(assert (=> d!97013 (=> (not res!473398) (not e!399285))))

(assert (=> d!97013 (= res!473398 ((_ is Cons!13416) acc!652))))

(assert (=> d!97013 (= (contains!3942 acc!652 k0!2824) lt!318024)))

(declare-fun b!709740 () Bool)

(declare-fun e!399284 () Bool)

(assert (=> b!709740 (= e!399285 e!399284)))

(declare-fun res!473399 () Bool)

(assert (=> b!709740 (=> res!473399 e!399284)))

(assert (=> b!709740 (= res!473399 (= (h!14461 acc!652) k0!2824))))

(declare-fun b!709741 () Bool)

(assert (=> b!709741 (= e!399284 (contains!3942 (t!19708 acc!652) k0!2824))))

(assert (= (and d!97013 res!473398) b!709740))

(assert (= (and b!709740 (not res!473399)) b!709741))

(assert (=> d!97013 m!666435))

(declare-fun m!666449 () Bool)

(assert (=> d!97013 m!666449))

(declare-fun m!666451 () Bool)

(assert (=> b!709741 m!666451))

(assert (=> b!709566 d!97013))

(declare-fun d!97015 () Bool)

(declare-fun lt!318025 () Bool)

(assert (=> d!97015 (= lt!318025 (select (content!346 lt!318014) k0!2824))))

(declare-fun e!399287 () Bool)

(assert (=> d!97015 (= lt!318025 e!399287)))

(declare-fun res!473400 () Bool)

(assert (=> d!97015 (=> (not res!473400) (not e!399287))))

(assert (=> d!97015 (= res!473400 ((_ is Cons!13416) lt!318014))))

(assert (=> d!97015 (= (contains!3942 lt!318014 k0!2824) lt!318025)))

(declare-fun b!709742 () Bool)

(declare-fun e!399286 () Bool)

(assert (=> b!709742 (= e!399287 e!399286)))

(declare-fun res!473401 () Bool)

(assert (=> b!709742 (=> res!473401 e!399286)))

(assert (=> b!709742 (= res!473401 (= (h!14461 lt!318014) k0!2824))))

(declare-fun b!709743 () Bool)

(assert (=> b!709743 (= e!399286 (contains!3942 (t!19708 lt!318014) k0!2824))))

(assert (= (and d!97015 res!473400) b!709742))

(assert (= (and b!709742 (not res!473401)) b!709743))

(declare-fun m!666453 () Bool)

(assert (=> d!97015 m!666453))

(declare-fun m!666455 () Bool)

(assert (=> d!97015 m!666455))

(declare-fun m!666457 () Bool)

(assert (=> b!709743 m!666457))

(assert (=> b!709577 d!97015))

(declare-fun d!97017 () Bool)

(declare-fun res!473402 () Bool)

(declare-fun e!399288 () Bool)

(assert (=> d!97017 (=> res!473402 e!399288)))

(assert (=> d!97017 (= res!473402 ((_ is Nil!13417) ($colon$colon!514 newAcc!49 (select (arr!19340 a!3591) from!2969))))))

(assert (=> d!97017 (= (noDuplicate!1211 ($colon$colon!514 newAcc!49 (select (arr!19340 a!3591) from!2969))) e!399288)))

(declare-fun b!709744 () Bool)

(declare-fun e!399289 () Bool)

(assert (=> b!709744 (= e!399288 e!399289)))

(declare-fun res!473403 () Bool)

(assert (=> b!709744 (=> (not res!473403) (not e!399289))))

(assert (=> b!709744 (= res!473403 (not (contains!3942 (t!19708 ($colon$colon!514 newAcc!49 (select (arr!19340 a!3591) from!2969))) (h!14461 ($colon$colon!514 newAcc!49 (select (arr!19340 a!3591) from!2969))))))))

(declare-fun b!709745 () Bool)

(assert (=> b!709745 (= e!399289 (noDuplicate!1211 (t!19708 ($colon$colon!514 newAcc!49 (select (arr!19340 a!3591) from!2969)))))))

(assert (= (and d!97017 (not res!473402)) b!709744))

(assert (= (and b!709744 res!473403) b!709745))

(declare-fun m!666459 () Bool)

(assert (=> b!709744 m!666459))

(declare-fun m!666461 () Bool)

(assert (=> b!709745 m!666461))

(assert (=> b!709576 d!97017))

(declare-fun d!97021 () Bool)

(assert (=> d!97021 (= ($colon$colon!514 newAcc!49 (select (arr!19340 a!3591) from!2969)) (Cons!13416 (select (arr!19340 a!3591) from!2969) newAcc!49))))

(assert (=> b!709576 d!97021))

(declare-fun d!97023 () Bool)

(declare-fun lt!318026 () Bool)

(assert (=> d!97023 (= lt!318026 (select (content!346 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399291 () Bool)

(assert (=> d!97023 (= lt!318026 e!399291)))

(declare-fun res!473404 () Bool)

(assert (=> d!97023 (=> (not res!473404) (not e!399291))))

(assert (=> d!97023 (= res!473404 ((_ is Cons!13416) newAcc!49))))

(assert (=> d!97023 (= (contains!3942 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318026)))

(declare-fun b!709746 () Bool)

(declare-fun e!399290 () Bool)

(assert (=> b!709746 (= e!399291 e!399290)))

(declare-fun res!473405 () Bool)

(assert (=> b!709746 (=> res!473405 e!399290)))

(assert (=> b!709746 (= res!473405 (= (h!14461 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709747 () Bool)

(assert (=> b!709747 (= e!399290 (contains!3942 (t!19708 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97023 res!473404) b!709746))

(assert (= (and b!709746 (not res!473405)) b!709747))

(declare-fun m!666463 () Bool)

(assert (=> d!97023 m!666463))

(declare-fun m!666465 () Bool)

(assert (=> d!97023 m!666465))

(declare-fun m!666467 () Bool)

(assert (=> b!709747 m!666467))

(assert (=> b!709555 d!97023))

(declare-fun d!97025 () Bool)

(assert (=> d!97025 (= (array_inv!15223 a!3591) (bvsge (size!19734 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62956 d!97025))

(declare-fun b!709783 () Bool)

(declare-fun e!399320 () Bool)

(assert (=> b!709783 (= e!399320 (contains!3942 acc!652 (select (arr!19340 a!3591) from!2969)))))

(declare-fun b!709784 () Bool)

(declare-fun e!399324 () Bool)

(declare-fun call!34432 () Bool)

(assert (=> b!709784 (= e!399324 call!34432)))

(declare-fun b!709786 () Bool)

(declare-fun e!399327 () Bool)

(assert (=> b!709786 (= e!399327 e!399324)))

(declare-fun c!78545 () Bool)

(assert (=> b!709786 (= c!78545 (validKeyInArray!0 (select (arr!19340 a!3591) from!2969)))))

(declare-fun d!97029 () Bool)

(declare-fun res!473429 () Bool)

(declare-fun e!399321 () Bool)

(assert (=> d!97029 (=> res!473429 e!399321)))

(assert (=> d!97029 (= res!473429 (bvsge from!2969 (size!19734 a!3591)))))

(assert (=> d!97029 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399321)))

(declare-fun bm!34429 () Bool)

(assert (=> bm!34429 (= call!34432 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78545 (Cons!13416 (select (arr!19340 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!709789 () Bool)

(assert (=> b!709789 (= e!399324 call!34432)))

(declare-fun b!709791 () Bool)

(assert (=> b!709791 (= e!399321 e!399327)))

(declare-fun res!473428 () Bool)

(assert (=> b!709791 (=> (not res!473428) (not e!399327))))

(assert (=> b!709791 (= res!473428 (not e!399320))))

(declare-fun res!473431 () Bool)

(assert (=> b!709791 (=> (not res!473431) (not e!399320))))

(assert (=> b!709791 (= res!473431 (validKeyInArray!0 (select (arr!19340 a!3591) from!2969)))))

(assert (= (and d!97029 (not res!473429)) b!709791))

(assert (= (and b!709791 res!473431) b!709783))

(assert (= (and b!709791 res!473428) b!709786))

(assert (= (and b!709786 c!78545) b!709789))

(assert (= (and b!709786 (not c!78545)) b!709784))

(assert (= (or b!709789 b!709784) bm!34429))

(assert (=> b!709783 m!666303))

(assert (=> b!709783 m!666303))

(declare-fun m!666473 () Bool)

(assert (=> b!709783 m!666473))

(assert (=> b!709786 m!666303))

(assert (=> b!709786 m!666303))

(assert (=> b!709786 m!666329))

(assert (=> bm!34429 m!666303))

(declare-fun m!666477 () Bool)

(assert (=> bm!34429 m!666477))

(assert (=> b!709791 m!666303))

(assert (=> b!709791 m!666303))

(assert (=> b!709791 m!666329))

(assert (=> b!709565 d!97029))

(declare-fun d!97033 () Bool)

(declare-fun res!473433 () Bool)

(declare-fun e!399328 () Bool)

(assert (=> d!97033 (=> res!473433 e!399328)))

(assert (=> d!97033 (= res!473433 ((_ is Nil!13417) lt!318014))))

(assert (=> d!97033 (= (noDuplicate!1211 lt!318014) e!399328)))

(declare-fun b!709793 () Bool)

(declare-fun e!399329 () Bool)

(assert (=> b!709793 (= e!399328 e!399329)))

(declare-fun res!473434 () Bool)

(assert (=> b!709793 (=> (not res!473434) (not e!399329))))

(assert (=> b!709793 (= res!473434 (not (contains!3942 (t!19708 lt!318014) (h!14461 lt!318014))))))

(declare-fun b!709794 () Bool)

(assert (=> b!709794 (= e!399329 (noDuplicate!1211 (t!19708 lt!318014)))))

(assert (= (and d!97033 (not res!473433)) b!709793))

(assert (= (and b!709793 res!473434) b!709794))

(declare-fun m!666481 () Bool)

(assert (=> b!709793 m!666481))

(declare-fun m!666483 () Bool)

(assert (=> b!709794 m!666483))

(assert (=> b!709564 d!97033))

(declare-fun d!97037 () Bool)

(declare-fun res!473439 () Bool)

(declare-fun e!399339 () Bool)

(assert (=> d!97037 (=> res!473439 e!399339)))

(assert (=> d!97037 (= res!473439 (= (select (arr!19340 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97037 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399339)))

(declare-fun b!709807 () Bool)

(declare-fun e!399340 () Bool)

(assert (=> b!709807 (= e!399339 e!399340)))

(declare-fun res!473440 () Bool)

(assert (=> b!709807 (=> (not res!473440) (not e!399340))))

(assert (=> b!709807 (= res!473440 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19734 a!3591)))))

(declare-fun b!709808 () Bool)

(assert (=> b!709808 (= e!399340 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97037 (not res!473439)) b!709807))

(assert (= (and b!709807 res!473440) b!709808))

(declare-fun m!666485 () Bool)

(assert (=> d!97037 m!666485))

(declare-fun m!666487 () Bool)

(assert (=> b!709808 m!666487))

(assert (=> b!709575 d!97037))

(declare-fun d!97039 () Bool)

(declare-fun lt!318029 () Bool)

(assert (=> d!97039 (= lt!318029 (select (content!346 newAcc!49) k0!2824))))

(declare-fun e!399342 () Bool)

(assert (=> d!97039 (= lt!318029 e!399342)))

(declare-fun res!473441 () Bool)

(assert (=> d!97039 (=> (not res!473441) (not e!399342))))

(assert (=> d!97039 (= res!473441 ((_ is Cons!13416) newAcc!49))))

(assert (=> d!97039 (= (contains!3942 newAcc!49 k0!2824) lt!318029)))

(declare-fun b!709809 () Bool)

(declare-fun e!399341 () Bool)

(assert (=> b!709809 (= e!399342 e!399341)))

(declare-fun res!473442 () Bool)

(assert (=> b!709809 (=> res!473442 e!399341)))

(assert (=> b!709809 (= res!473442 (= (h!14461 newAcc!49) k0!2824))))

(declare-fun b!709810 () Bool)

(assert (=> b!709810 (= e!399341 (contains!3942 (t!19708 newAcc!49) k0!2824))))

(assert (= (and d!97039 res!473441) b!709809))

(assert (= (and b!709809 (not res!473442)) b!709810))

(assert (=> d!97039 m!666463))

(declare-fun m!666489 () Bool)

(assert (=> d!97039 m!666489))

(declare-fun m!666491 () Bool)

(assert (=> b!709810 m!666491))

(assert (=> b!709563 d!97039))

(declare-fun d!97041 () Bool)

(declare-fun lt!318032 () Bool)

(assert (=> d!97041 (= lt!318032 (select (content!346 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399349 () Bool)

(assert (=> d!97041 (= lt!318032 e!399349)))

(declare-fun res!473445 () Bool)

(assert (=> d!97041 (=> (not res!473445) (not e!399349))))

(assert (=> d!97041 (= res!473445 ((_ is Cons!13416) newAcc!49))))

(assert (=> d!97041 (= (contains!3942 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318032)))

(declare-fun b!709815 () Bool)

(declare-fun e!399348 () Bool)

(assert (=> b!709815 (= e!399349 e!399348)))

(declare-fun res!473446 () Bool)

(assert (=> b!709815 (=> res!473446 e!399348)))

(assert (=> b!709815 (= res!473446 (= (h!14461 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709816 () Bool)

(assert (=> b!709816 (= e!399348 (contains!3942 (t!19708 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97041 res!473445) b!709815))

(assert (= (and b!709815 (not res!473446)) b!709816))

(assert (=> d!97041 m!666463))

(declare-fun m!666493 () Bool)

(assert (=> d!97041 m!666493))

(declare-fun m!666495 () Bool)

(assert (=> b!709816 m!666495))

(assert (=> b!709562 d!97041))

(declare-fun d!97043 () Bool)

(declare-fun res!473447 () Bool)

(declare-fun e!399352 () Bool)

(assert (=> d!97043 (=> res!473447 e!399352)))

(assert (=> d!97043 (= res!473447 (= (select (arr!19340 a!3591) from!2969) k0!2824))))

(assert (=> d!97043 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399352)))

(declare-fun b!709823 () Bool)

(declare-fun e!399353 () Bool)

(assert (=> b!709823 (= e!399352 e!399353)))

(declare-fun res!473448 () Bool)

(assert (=> b!709823 (=> (not res!473448) (not e!399353))))

(assert (=> b!709823 (= res!473448 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19734 a!3591)))))

(declare-fun b!709824 () Bool)

(assert (=> b!709824 (= e!399353 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97043 (not res!473447)) b!709823))

(assert (= (and b!709823 res!473448) b!709824))

(assert (=> d!97043 m!666303))

(declare-fun m!666497 () Bool)

(assert (=> b!709824 m!666497))

(assert (=> b!709573 d!97043))

(declare-fun d!97045 () Bool)

(declare-fun lt!318033 () Bool)

(assert (=> d!97045 (= lt!318033 (select (content!346 lt!318014) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399355 () Bool)

(assert (=> d!97045 (= lt!318033 e!399355)))

(declare-fun res!473449 () Bool)

(assert (=> d!97045 (=> (not res!473449) (not e!399355))))

(assert (=> d!97045 (= res!473449 ((_ is Cons!13416) lt!318014))))

(assert (=> d!97045 (= (contains!3942 lt!318014 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318033)))

(declare-fun b!709825 () Bool)

(declare-fun e!399354 () Bool)

(assert (=> b!709825 (= e!399355 e!399354)))

(declare-fun res!473450 () Bool)

(assert (=> b!709825 (=> res!473450 e!399354)))

(assert (=> b!709825 (= res!473450 (= (h!14461 lt!318014) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709826 () Bool)

(assert (=> b!709826 (= e!399354 (contains!3942 (t!19708 lt!318014) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97045 res!473449) b!709825))

(assert (= (and b!709825 (not res!473450)) b!709826))

(assert (=> d!97045 m!666453))

(declare-fun m!666499 () Bool)

(assert (=> d!97045 m!666499))

(declare-fun m!666501 () Bool)

(assert (=> b!709826 m!666501))

(assert (=> b!709572 d!97045))

(declare-fun d!97047 () Bool)

(declare-fun res!473453 () Bool)

(declare-fun e!399358 () Bool)

(assert (=> d!97047 (=> res!473453 e!399358)))

(assert (=> d!97047 (= res!473453 ((_ is Nil!13417) acc!652))))

(assert (=> d!97047 (= (noDuplicate!1211 acc!652) e!399358)))

(declare-fun b!709829 () Bool)

(declare-fun e!399359 () Bool)

(assert (=> b!709829 (= e!399358 e!399359)))

(declare-fun res!473454 () Bool)

(assert (=> b!709829 (=> (not res!473454) (not e!399359))))

(assert (=> b!709829 (= res!473454 (not (contains!3942 (t!19708 acc!652) (h!14461 acc!652))))))

(declare-fun b!709830 () Bool)

(assert (=> b!709830 (= e!399359 (noDuplicate!1211 (t!19708 acc!652)))))

(assert (= (and d!97047 (not res!473453)) b!709829))

(assert (= (and b!709829 res!473454) b!709830))

(declare-fun m!666503 () Bool)

(assert (=> b!709829 m!666503))

(declare-fun m!666505 () Bool)

(assert (=> b!709830 m!666505))

(assert (=> b!709561 d!97047))

(declare-fun d!97049 () Bool)

(declare-fun lt!318034 () Bool)

(assert (=> d!97049 (= lt!318034 (select (content!346 lt!318014) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399361 () Bool)

(assert (=> d!97049 (= lt!318034 e!399361)))

(declare-fun res!473455 () Bool)

(assert (=> d!97049 (=> (not res!473455) (not e!399361))))

(assert (=> d!97049 (= res!473455 ((_ is Cons!13416) lt!318014))))

(assert (=> d!97049 (= (contains!3942 lt!318014 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318034)))

(declare-fun b!709831 () Bool)

(declare-fun e!399360 () Bool)

(assert (=> b!709831 (= e!399361 e!399360)))

(declare-fun res!473456 () Bool)

(assert (=> b!709831 (=> res!473456 e!399360)))

(assert (=> b!709831 (= res!473456 (= (h!14461 lt!318014) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709832 () Bool)

(assert (=> b!709832 (= e!399360 (contains!3942 (t!19708 lt!318014) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97049 res!473455) b!709831))

(assert (= (and b!709831 (not res!473456)) b!709832))

(assert (=> d!97049 m!666453))

(declare-fun m!666507 () Bool)

(assert (=> d!97049 m!666507))

(declare-fun m!666509 () Bool)

(assert (=> b!709832 m!666509))

(assert (=> b!709560 d!97049))

(declare-fun d!97051 () Bool)

(declare-fun lt!318035 () Bool)

(assert (=> d!97051 (= lt!318035 (select (content!346 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399363 () Bool)

(assert (=> d!97051 (= lt!318035 e!399363)))

(declare-fun res!473457 () Bool)

(assert (=> d!97051 (=> (not res!473457) (not e!399363))))

(assert (=> d!97051 (= res!473457 ((_ is Cons!13416) acc!652))))

(assert (=> d!97051 (= (contains!3942 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318035)))

(declare-fun b!709833 () Bool)

(declare-fun e!399362 () Bool)

(assert (=> b!709833 (= e!399363 e!399362)))

(declare-fun res!473458 () Bool)

(assert (=> b!709833 (=> res!473458 e!399362)))

(assert (=> b!709833 (= res!473458 (= (h!14461 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709834 () Bool)

(assert (=> b!709834 (= e!399362 (contains!3942 (t!19708 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97051 res!473457) b!709833))

(assert (= (and b!709833 (not res!473458)) b!709834))

(assert (=> d!97051 m!666435))

(declare-fun m!666511 () Bool)

(assert (=> d!97051 m!666511))

(declare-fun m!666513 () Bool)

(assert (=> b!709834 m!666513))

(assert (=> b!709571 d!97051))

(declare-fun bm!34439 () Bool)

(declare-fun call!34442 () List!13420)

(assert (=> bm!34439 (= call!34442 (-!369 (t!19708 newAcc!49) k0!2824))))

(declare-fun b!709884 () Bool)

(declare-fun e!399406 () List!13420)

(assert (=> b!709884 (= e!399406 (Cons!13416 (h!14461 newAcc!49) call!34442))))

(declare-fun d!97053 () Bool)

(declare-fun e!399405 () Bool)

(assert (=> d!97053 e!399405))

(declare-fun res!473490 () Bool)

(assert (=> d!97053 (=> (not res!473490) (not e!399405))))

(declare-fun lt!318040 () List!13420)

(declare-fun size!19739 (List!13420) Int)

(assert (=> d!97053 (= res!473490 (<= (size!19739 lt!318040) (size!19739 newAcc!49)))))

(declare-fun e!399407 () List!13420)

(assert (=> d!97053 (= lt!318040 e!399407)))

(declare-fun c!78564 () Bool)

(assert (=> d!97053 (= c!78564 ((_ is Cons!13416) newAcc!49))))

(assert (=> d!97053 (= (-!369 newAcc!49 k0!2824) lt!318040)))

(declare-fun b!709885 () Bool)

(assert (=> b!709885 (= e!399407 e!399406)))

(declare-fun c!78565 () Bool)

(assert (=> b!709885 (= c!78565 (= k0!2824 (h!14461 newAcc!49)))))

(declare-fun b!709886 () Bool)

(assert (=> b!709886 (= e!399407 Nil!13417)))

(declare-fun b!709887 () Bool)

(assert (=> b!709887 (= e!399405 (= (content!346 lt!318040) ((_ map and) (content!346 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!709888 () Bool)

(assert (=> b!709888 (= e!399406 call!34442)))

(assert (= (and d!97053 c!78564) b!709885))

(assert (= (and d!97053 (not c!78564)) b!709886))

(assert (= (and b!709885 c!78565) b!709888))

(assert (= (and b!709885 (not c!78565)) b!709884))

(assert (= (or b!709888 b!709884) bm!34439))

(assert (= (and d!97053 res!473490) b!709887))

(declare-fun m!666551 () Bool)

(assert (=> bm!34439 m!666551))

(declare-fun m!666555 () Bool)

(assert (=> d!97053 m!666555))

(declare-fun m!666559 () Bool)

(assert (=> d!97053 m!666559))

(declare-fun m!666561 () Bool)

(assert (=> b!709887 m!666561))

(assert (=> b!709887 m!666463))

(declare-fun m!666563 () Bool)

(assert (=> b!709887 m!666563))

(assert (=> b!709570 d!97053))

(declare-fun e!399412 () Bool)

(declare-fun b!709893 () Bool)

(assert (=> b!709893 (= e!399412 (contains!3942 lt!318014 (select (arr!19340 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709894 () Bool)

(declare-fun e!399414 () Bool)

(declare-fun call!34443 () Bool)

(assert (=> b!709894 (= e!399414 call!34443)))

(declare-fun b!709895 () Bool)

(declare-fun e!399415 () Bool)

(assert (=> b!709895 (= e!399415 e!399414)))

(declare-fun c!78566 () Bool)

(assert (=> b!709895 (= c!78566 (validKeyInArray!0 (select (arr!19340 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97065 () Bool)

(declare-fun res!473496 () Bool)

(declare-fun e!399413 () Bool)

(assert (=> d!97065 (=> res!473496 e!399413)))

(assert (=> d!97065 (= res!473496 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19734 a!3591)))))

(assert (=> d!97065 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318014) e!399413)))

(declare-fun bm!34440 () Bool)

(assert (=> bm!34440 (= call!34443 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78566 (Cons!13416 (select (arr!19340 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318014) lt!318014)))))

(declare-fun b!709896 () Bool)

(assert (=> b!709896 (= e!399414 call!34443)))

(declare-fun b!709897 () Bool)

(assert (=> b!709897 (= e!399413 e!399415)))

(declare-fun res!473495 () Bool)

(assert (=> b!709897 (=> (not res!473495) (not e!399415))))

(assert (=> b!709897 (= res!473495 (not e!399412))))

(declare-fun res!473497 () Bool)

(assert (=> b!709897 (=> (not res!473497) (not e!399412))))

(assert (=> b!709897 (= res!473497 (validKeyInArray!0 (select (arr!19340 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!97065 (not res!473496)) b!709897))

(assert (= (and b!709897 res!473497) b!709893))

(assert (= (and b!709897 res!473495) b!709895))

(assert (= (and b!709895 c!78566) b!709896))

(assert (= (and b!709895 (not c!78566)) b!709894))

(assert (= (or b!709896 b!709894) bm!34440))

(assert (=> b!709893 m!666485))

(assert (=> b!709893 m!666485))

(declare-fun m!666569 () Bool)

(assert (=> b!709893 m!666569))

(assert (=> b!709895 m!666485))

(assert (=> b!709895 m!666485))

(declare-fun m!666571 () Bool)

(assert (=> b!709895 m!666571))

(assert (=> bm!34440 m!666485))

(declare-fun m!666573 () Bool)

(assert (=> bm!34440 m!666573))

(assert (=> b!709897 m!666485))

(assert (=> b!709897 m!666485))

(assert (=> b!709897 m!666571))

(assert (=> b!709559 d!97065))

(check-sat (not d!97023) (not b!709745) (not bm!34439) (not b!709808) (not b!709786) (not b!709810) (not b!709739) (not b!709741) (not b!709744) (not b!709743) (not b!709733) (not b!709895) (not b!709747) (not d!97041) (not b!709721) (not b!709791) (not b!709829) (not d!97039) (not d!97015) (not b!709816) (not d!97045) (not d!97005) (not bm!34429) (not b!709732) (not b!709738) (not b!709783) (not b!709794) (not bm!34440) (not b!709887) (not b!709824) (not b!709793) (not b!709830) (not b!709893) (not b!709826) (not d!97051) (not b!709897) (not b!709832) (not d!97049) (not d!97013) (not b!709834) (not d!97053))
(check-sat)
