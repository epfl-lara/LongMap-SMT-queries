; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61564 () Bool)

(assert start!61564)

(declare-fun b!688568 () Bool)

(declare-fun res!453259 () Bool)

(declare-fun e!392167 () Bool)

(assert (=> b!688568 (=> (not res!453259) (not e!392167))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39705 0))(
  ( (array!39706 (arr!19024 (Array (_ BitVec 32) (_ BitVec 64))) (size!19406 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39705)

(assert (=> b!688568 (= res!453259 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19406 a!3626))))))

(declare-fun b!688569 () Bool)

(declare-datatypes ((Unit!24287 0))(
  ( (Unit!24288) )
))
(declare-fun e!392170 () Unit!24287)

(declare-fun Unit!24289 () Unit!24287)

(assert (=> b!688569 (= e!392170 Unit!24289)))

(declare-fun b!688570 () Bool)

(declare-fun e!392173 () Bool)

(declare-fun e!392171 () Bool)

(assert (=> b!688570 (= e!392173 e!392171)))

(declare-fun res!453267 () Bool)

(assert (=> b!688570 (=> (not res!453267) (not e!392171))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!688570 (= res!453267 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688571 () Bool)

(declare-fun res!453252 () Bool)

(assert (=> b!688571 (=> (not res!453252) (not e!392167))))

(declare-datatypes ((List!13065 0))(
  ( (Nil!13062) (Cons!13061 (h!14106 (_ BitVec 64)) (t!19329 List!13065)) )
))
(declare-fun acc!681 () List!13065)

(declare-fun contains!3642 (List!13065 (_ BitVec 64)) Bool)

(assert (=> b!688571 (= res!453252 (not (contains!3642 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688572 () Bool)

(declare-fun res!453262 () Bool)

(declare-fun e!392168 () Bool)

(assert (=> b!688572 (=> res!453262 e!392168)))

(declare-fun lt!315820 () List!13065)

(declare-fun noDuplicate!889 (List!13065) Bool)

(assert (=> b!688572 (= res!453262 (not (noDuplicate!889 lt!315820)))))

(declare-fun b!688573 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!688573 (= e!392171 (not (contains!3642 lt!315820 k0!2843)))))

(declare-fun b!688574 () Bool)

(declare-fun e!392166 () Bool)

(assert (=> b!688574 (= e!392166 (contains!3642 acc!681 k0!2843))))

(declare-fun b!688575 () Bool)

(declare-fun res!453254 () Bool)

(assert (=> b!688575 (=> (not res!453254) (not e!392167))))

(declare-fun e!392174 () Bool)

(assert (=> b!688575 (= res!453254 e!392174)))

(declare-fun res!453255 () Bool)

(assert (=> b!688575 (=> res!453255 e!392174)))

(assert (=> b!688575 (= res!453255 e!392166)))

(declare-fun res!453266 () Bool)

(assert (=> b!688575 (=> (not res!453266) (not e!392166))))

(assert (=> b!688575 (= res!453266 (bvsgt from!3004 i!1382))))

(declare-fun b!688576 () Bool)

(declare-fun res!453265 () Bool)

(assert (=> b!688576 (=> res!453265 e!392168)))

(assert (=> b!688576 (= res!453265 (contains!3642 lt!315820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!453253 () Bool)

(assert (=> start!61564 (=> (not res!453253) (not e!392167))))

(assert (=> start!61564 (= res!453253 (and (bvslt (size!19406 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19406 a!3626))))))

(assert (=> start!61564 e!392167))

(assert (=> start!61564 true))

(declare-fun array_inv!14820 (array!39705) Bool)

(assert (=> start!61564 (array_inv!14820 a!3626)))

(declare-fun b!688577 () Bool)

(declare-fun e!392172 () Bool)

(assert (=> b!688577 (= e!392172 (not (contains!3642 acc!681 k0!2843)))))

(declare-fun b!688578 () Bool)

(assert (=> b!688578 (= e!392174 e!392172)))

(declare-fun res!453257 () Bool)

(assert (=> b!688578 (=> (not res!453257) (not e!392172))))

(assert (=> b!688578 (= res!453257 (bvsle from!3004 i!1382))))

(declare-fun b!688579 () Bool)

(declare-fun e!392165 () Unit!24287)

(declare-fun lt!315826 () Unit!24287)

(assert (=> b!688579 (= e!392165 lt!315826)))

(declare-fun lt!315821 () Unit!24287)

(declare-fun lemmaListSubSeqRefl!0 (List!13065) Unit!24287)

(assert (=> b!688579 (= lt!315821 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!228 (List!13065 List!13065) Bool)

(assert (=> b!688579 (subseq!228 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39705 List!13065 List!13065 (_ BitVec 32)) Unit!24287)

(declare-fun $colon$colon!393 (List!13065 (_ BitVec 64)) List!13065)

(assert (=> b!688579 (= lt!315826 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!393 acc!681 (select (arr!19024 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39705 (_ BitVec 32) List!13065) Bool)

(assert (=> b!688579 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688580 () Bool)

(declare-fun res!453263 () Bool)

(assert (=> b!688580 (=> res!453263 e!392168)))

(assert (=> b!688580 (= res!453263 (contains!3642 lt!315820 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688581 () Bool)

(declare-fun res!453258 () Bool)

(assert (=> b!688581 (=> (not res!453258) (not e!392167))))

(declare-fun arrayContainsKey!0 (array!39705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688581 (= res!453258 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688582 () Bool)

(assert (=> b!688582 (= e!392168 true)))

(declare-fun lt!315823 () Bool)

(assert (=> b!688582 (= lt!315823 e!392173)))

(declare-fun res!453271 () Bool)

(assert (=> b!688582 (=> res!453271 e!392173)))

(declare-fun e!392175 () Bool)

(assert (=> b!688582 (= res!453271 e!392175)))

(declare-fun res!453268 () Bool)

(assert (=> b!688582 (=> (not res!453268) (not e!392175))))

(assert (=> b!688582 (= res!453268 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688583 () Bool)

(declare-fun Unit!24290 () Unit!24287)

(assert (=> b!688583 (= e!392170 Unit!24290)))

(declare-fun lt!315829 () Unit!24287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39705 (_ BitVec 64) (_ BitVec 32)) Unit!24287)

(assert (=> b!688583 (= lt!315829 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!688583 false))

(declare-fun b!688584 () Bool)

(declare-fun res!453261 () Bool)

(assert (=> b!688584 (=> (not res!453261) (not e!392167))))

(assert (=> b!688584 (= res!453261 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688585 () Bool)

(declare-fun res!453270 () Bool)

(assert (=> b!688585 (=> (not res!453270) (not e!392167))))

(assert (=> b!688585 (= res!453270 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19406 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688586 () Bool)

(declare-fun res!453269 () Bool)

(assert (=> b!688586 (=> (not res!453269) (not e!392167))))

(assert (=> b!688586 (= res!453269 (not (contains!3642 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688587 () Bool)

(declare-fun res!453260 () Bool)

(assert (=> b!688587 (=> (not res!453260) (not e!392167))))

(assert (=> b!688587 (= res!453260 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13062))))

(declare-fun b!688588 () Bool)

(assert (=> b!688588 (= e!392167 (not e!392168))))

(declare-fun res!453264 () Bool)

(assert (=> b!688588 (=> res!453264 e!392168)))

(assert (=> b!688588 (= res!453264 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688588 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315820)))

(declare-fun lt!315827 () Unit!24287)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39705 (_ BitVec 64) (_ BitVec 32) List!13065 List!13065) Unit!24287)

(assert (=> b!688588 (= lt!315827 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315820))))

(declare-fun -!193 (List!13065 (_ BitVec 64)) List!13065)

(assert (=> b!688588 (= (-!193 lt!315820 k0!2843) acc!681)))

(assert (=> b!688588 (= lt!315820 ($colon$colon!393 acc!681 k0!2843))))

(declare-fun lt!315825 () Unit!24287)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13065) Unit!24287)

(assert (=> b!688588 (= lt!315825 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!688588 (subseq!228 acc!681 acc!681)))

(declare-fun lt!315828 () Unit!24287)

(assert (=> b!688588 (= lt!315828 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688588 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315822 () Unit!24287)

(assert (=> b!688588 (= lt!315822 e!392165)))

(declare-fun c!78025 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688588 (= c!78025 (validKeyInArray!0 (select (arr!19024 a!3626) from!3004)))))

(declare-fun lt!315824 () Unit!24287)

(assert (=> b!688588 (= lt!315824 e!392170)))

(declare-fun c!78026 () Bool)

(assert (=> b!688588 (= c!78026 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688588 (arrayContainsKey!0 (array!39706 (store (arr!19024 a!3626) i!1382 k0!2843) (size!19406 a!3626)) k0!2843 from!3004)))

(declare-fun b!688589 () Bool)

(declare-fun res!453256 () Bool)

(assert (=> b!688589 (=> (not res!453256) (not e!392167))))

(assert (=> b!688589 (= res!453256 (noDuplicate!889 acc!681))))

(declare-fun b!688590 () Bool)

(declare-fun Unit!24291 () Unit!24287)

(assert (=> b!688590 (= e!392165 Unit!24291)))

(declare-fun b!688591 () Bool)

(declare-fun res!453272 () Bool)

(assert (=> b!688591 (=> (not res!453272) (not e!392167))))

(assert (=> b!688591 (= res!453272 (validKeyInArray!0 k0!2843))))

(declare-fun b!688592 () Bool)

(assert (=> b!688592 (= e!392175 (contains!3642 lt!315820 k0!2843))))

(assert (= (and start!61564 res!453253) b!688589))

(assert (= (and b!688589 res!453256) b!688571))

(assert (= (and b!688571 res!453252) b!688586))

(assert (= (and b!688586 res!453269) b!688575))

(assert (= (and b!688575 res!453266) b!688574))

(assert (= (and b!688575 (not res!453255)) b!688578))

(assert (= (and b!688578 res!453257) b!688577))

(assert (= (and b!688575 res!453254) b!688587))

(assert (= (and b!688587 res!453260) b!688584))

(assert (= (and b!688584 res!453261) b!688568))

(assert (= (and b!688568 res!453259) b!688591))

(assert (= (and b!688591 res!453272) b!688581))

(assert (= (and b!688581 res!453258) b!688585))

(assert (= (and b!688585 res!453270) b!688588))

(assert (= (and b!688588 c!78026) b!688583))

(assert (= (and b!688588 (not c!78026)) b!688569))

(assert (= (and b!688588 c!78025) b!688579))

(assert (= (and b!688588 (not c!78025)) b!688590))

(assert (= (and b!688588 (not res!453264)) b!688572))

(assert (= (and b!688572 (not res!453262)) b!688576))

(assert (= (and b!688576 (not res!453265)) b!688580))

(assert (= (and b!688580 (not res!453263)) b!688582))

(assert (= (and b!688582 res!453268) b!688592))

(assert (= (and b!688582 (not res!453271)) b!688570))

(assert (= (and b!688570 res!453267) b!688573))

(declare-fun m!652431 () Bool)

(assert (=> b!688574 m!652431))

(declare-fun m!652433 () Bool)

(assert (=> b!688583 m!652433))

(declare-fun m!652435 () Bool)

(assert (=> start!61564 m!652435))

(declare-fun m!652437 () Bool)

(assert (=> b!688572 m!652437))

(declare-fun m!652439 () Bool)

(assert (=> b!688586 m!652439))

(declare-fun m!652441 () Bool)

(assert (=> b!688589 m!652441))

(declare-fun m!652443 () Bool)

(assert (=> b!688588 m!652443))

(declare-fun m!652445 () Bool)

(assert (=> b!688588 m!652445))

(declare-fun m!652447 () Bool)

(assert (=> b!688588 m!652447))

(declare-fun m!652449 () Bool)

(assert (=> b!688588 m!652449))

(declare-fun m!652451 () Bool)

(assert (=> b!688588 m!652451))

(declare-fun m!652453 () Bool)

(assert (=> b!688588 m!652453))

(declare-fun m!652455 () Bool)

(assert (=> b!688588 m!652455))

(declare-fun m!652457 () Bool)

(assert (=> b!688588 m!652457))

(declare-fun m!652459 () Bool)

(assert (=> b!688588 m!652459))

(declare-fun m!652461 () Bool)

(assert (=> b!688588 m!652461))

(assert (=> b!688588 m!652459))

(declare-fun m!652463 () Bool)

(assert (=> b!688588 m!652463))

(declare-fun m!652465 () Bool)

(assert (=> b!688588 m!652465))

(declare-fun m!652467 () Bool)

(assert (=> b!688588 m!652467))

(declare-fun m!652469 () Bool)

(assert (=> b!688573 m!652469))

(declare-fun m!652471 () Bool)

(assert (=> b!688581 m!652471))

(declare-fun m!652473 () Bool)

(assert (=> b!688591 m!652473))

(assert (=> b!688579 m!652445))

(assert (=> b!688579 m!652459))

(declare-fun m!652475 () Bool)

(assert (=> b!688579 m!652475))

(declare-fun m!652477 () Bool)

(assert (=> b!688579 m!652477))

(assert (=> b!688579 m!652459))

(assert (=> b!688579 m!652475))

(assert (=> b!688579 m!652453))

(assert (=> b!688579 m!652467))

(declare-fun m!652479 () Bool)

(assert (=> b!688584 m!652479))

(declare-fun m!652481 () Bool)

(assert (=> b!688571 m!652481))

(declare-fun m!652483 () Bool)

(assert (=> b!688580 m!652483))

(declare-fun m!652485 () Bool)

(assert (=> b!688576 m!652485))

(assert (=> b!688577 m!652431))

(assert (=> b!688592 m!652469))

(declare-fun m!652487 () Bool)

(assert (=> b!688587 m!652487))

(check-sat (not b!688583) (not b!688580) (not b!688574) (not b!688577) (not b!688572) (not b!688571) (not b!688586) (not b!688581) (not start!61564) (not b!688579) (not b!688587) (not b!688584) (not b!688588) (not b!688591) (not b!688589) (not b!688576) (not b!688592) (not b!688573))
(check-sat)
