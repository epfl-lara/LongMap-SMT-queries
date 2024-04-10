; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60182 () Bool)

(assert start!60182)

(declare-fun b!672730 () Bool)

(declare-fun res!439341 () Bool)

(declare-fun e!384270 () Bool)

(assert (=> b!672730 (=> (not res!439341) (not e!384270))))

(declare-fun e!384272 () Bool)

(assert (=> b!672730 (= res!439341 e!384272)))

(declare-fun res!439352 () Bool)

(assert (=> b!672730 (=> res!439352 e!384272)))

(declare-fun e!384266 () Bool)

(assert (=> b!672730 (= res!439352 e!384266)))

(declare-fun res!439343 () Bool)

(assert (=> b!672730 (=> (not res!439343) (not e!384266))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672730 (= res!439343 (bvsgt from!3004 i!1382))))

(declare-fun b!672731 () Bool)

(declare-fun e!384273 () Bool)

(assert (=> b!672731 (= e!384270 e!384273)))

(declare-fun res!439349 () Bool)

(assert (=> b!672731 (=> (not res!439349) (not e!384273))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39229 0))(
  ( (array!39230 (arr!18807 (Array (_ BitVec 32) (_ BitVec 64))) (size!19171 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39229)

(assert (=> b!672731 (= res!439349 (not (= (select (arr!18807 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23640 0))(
  ( (Unit!23641) )
))
(declare-fun lt!312356 () Unit!23640)

(declare-fun e!384264 () Unit!23640)

(assert (=> b!672731 (= lt!312356 e!384264)))

(declare-fun c!77066 () Bool)

(assert (=> b!672731 (= c!77066 (= (select (arr!18807 a!3626) from!3004) k!2843))))

(declare-fun b!672732 () Bool)

(declare-fun res!439332 () Bool)

(assert (=> b!672732 (=> (not res!439332) (not e!384270))))

(declare-datatypes ((List!12848 0))(
  ( (Nil!12845) (Cons!12844 (h!13889 (_ BitVec 64)) (t!19076 List!12848)) )
))
(declare-fun acc!681 () List!12848)

(declare-fun contains!3425 (List!12848 (_ BitVec 64)) Bool)

(assert (=> b!672732 (= res!439332 (not (contains!3425 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672733 () Bool)

(declare-fun res!439340 () Bool)

(declare-fun e!384268 () Bool)

(assert (=> b!672733 (=> (not res!439340) (not e!384268))))

(declare-fun lt!312358 () List!12848)

(assert (=> b!672733 (= res!439340 (not (contains!3425 lt!312358 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672734 () Bool)

(declare-fun res!439335 () Bool)

(assert (=> b!672734 (=> (not res!439335) (not e!384268))))

(assert (=> b!672734 (= res!439335 (not (contains!3425 lt!312358 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672735 () Bool)

(assert (=> b!672735 (= e!384268 false)))

(declare-fun lt!312355 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39229 (_ BitVec 32) List!12848) Bool)

(assert (=> b!672735 (= lt!312355 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312358))))

(declare-fun b!672736 () Bool)

(declare-fun res!439334 () Bool)

(assert (=> b!672736 (=> (not res!439334) (not e!384270))))

(declare-fun arrayContainsKey!0 (array!39229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672736 (= res!439334 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672737 () Bool)

(declare-fun e!384267 () Bool)

(declare-fun e!384269 () Bool)

(assert (=> b!672737 (= e!384267 e!384269)))

(declare-fun res!439348 () Bool)

(assert (=> b!672737 (=> (not res!439348) (not e!384269))))

(assert (=> b!672737 (= res!439348 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672738 () Bool)

(declare-fun res!439345 () Bool)

(assert (=> b!672738 (=> (not res!439345) (not e!384270))))

(assert (=> b!672738 (= res!439345 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19171 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672739 () Bool)

(declare-fun res!439344 () Bool)

(assert (=> b!672739 (=> (not res!439344) (not e!384270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672739 (= res!439344 (validKeyInArray!0 (select (arr!18807 a!3626) from!3004)))))

(declare-fun b!672740 () Bool)

(declare-fun Unit!23642 () Unit!23640)

(assert (=> b!672740 (= e!384264 Unit!23642)))

(declare-fun b!672741 () Bool)

(declare-fun res!439347 () Bool)

(assert (=> b!672741 (=> (not res!439347) (not e!384270))))

(assert (=> b!672741 (= res!439347 (validKeyInArray!0 k!2843))))

(declare-fun b!672742 () Bool)

(declare-fun res!439346 () Bool)

(assert (=> b!672742 (=> (not res!439346) (not e!384268))))

(assert (=> b!672742 (= res!439346 e!384267)))

(declare-fun res!439353 () Bool)

(assert (=> b!672742 (=> res!439353 e!384267)))

(declare-fun e!384263 () Bool)

(assert (=> b!672742 (= res!439353 e!384263)))

(declare-fun res!439333 () Bool)

(assert (=> b!672742 (=> (not res!439333) (not e!384263))))

(assert (=> b!672742 (= res!439333 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672743 () Bool)

(declare-fun res!439337 () Bool)

(assert (=> b!672743 (=> (not res!439337) (not e!384268))))

(declare-fun noDuplicate!672 (List!12848) Bool)

(assert (=> b!672743 (= res!439337 (noDuplicate!672 lt!312358))))

(declare-fun b!672744 () Bool)

(assert (=> b!672744 (= e!384269 (not (contains!3425 lt!312358 k!2843)))))

(declare-fun b!672745 () Bool)

(declare-fun res!439342 () Bool)

(assert (=> b!672745 (=> (not res!439342) (not e!384270))))

(assert (=> b!672745 (= res!439342 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12845))))

(declare-fun b!672746 () Bool)

(declare-fun e!384265 () Bool)

(assert (=> b!672746 (= e!384265 (not (contains!3425 acc!681 k!2843)))))

(declare-fun b!672747 () Bool)

(declare-fun Unit!23643 () Unit!23640)

(assert (=> b!672747 (= e!384264 Unit!23643)))

(assert (=> b!672747 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312357 () Unit!23640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39229 (_ BitVec 64) (_ BitVec 32)) Unit!23640)

(assert (=> b!672747 (= lt!312357 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672747 false))

(declare-fun b!672748 () Bool)

(assert (=> b!672748 (= e!384266 (contains!3425 acc!681 k!2843))))

(declare-fun b!672749 () Bool)

(declare-fun res!439351 () Bool)

(assert (=> b!672749 (=> (not res!439351) (not e!384270))))

(assert (=> b!672749 (= res!439351 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!439338 () Bool)

(assert (=> start!60182 (=> (not res!439338) (not e!384270))))

(assert (=> start!60182 (= res!439338 (and (bvslt (size!19171 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19171 a!3626))))))

(assert (=> start!60182 e!384270))

(assert (=> start!60182 true))

(declare-fun array_inv!14603 (array!39229) Bool)

(assert (=> start!60182 (array_inv!14603 a!3626)))

(declare-fun b!672750 () Bool)

(declare-fun res!439355 () Bool)

(assert (=> b!672750 (=> (not res!439355) (not e!384270))))

(assert (=> b!672750 (= res!439355 (noDuplicate!672 acc!681))))

(declare-fun b!672751 () Bool)

(assert (=> b!672751 (= e!384273 e!384268)))

(declare-fun res!439354 () Bool)

(assert (=> b!672751 (=> (not res!439354) (not e!384268))))

(assert (=> b!672751 (= res!439354 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!275 (List!12848 (_ BitVec 64)) List!12848)

(assert (=> b!672751 (= lt!312358 ($colon$colon!275 acc!681 (select (arr!18807 a!3626) from!3004)))))

(declare-fun b!672752 () Bool)

(declare-fun res!439336 () Bool)

(assert (=> b!672752 (=> (not res!439336) (not e!384270))))

(assert (=> b!672752 (= res!439336 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19171 a!3626))))))

(declare-fun b!672753 () Bool)

(assert (=> b!672753 (= e!384272 e!384265)))

(declare-fun res!439339 () Bool)

(assert (=> b!672753 (=> (not res!439339) (not e!384265))))

(assert (=> b!672753 (= res!439339 (bvsle from!3004 i!1382))))

(declare-fun b!672754 () Bool)

(declare-fun res!439350 () Bool)

(assert (=> b!672754 (=> (not res!439350) (not e!384270))))

(assert (=> b!672754 (= res!439350 (not (contains!3425 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672755 () Bool)

(assert (=> b!672755 (= e!384263 (contains!3425 lt!312358 k!2843))))

(assert (= (and start!60182 res!439338) b!672750))

(assert (= (and b!672750 res!439355) b!672732))

(assert (= (and b!672732 res!439332) b!672754))

(assert (= (and b!672754 res!439350) b!672730))

(assert (= (and b!672730 res!439343) b!672748))

(assert (= (and b!672730 (not res!439352)) b!672753))

(assert (= (and b!672753 res!439339) b!672746))

(assert (= (and b!672730 res!439341) b!672745))

(assert (= (and b!672745 res!439342) b!672749))

(assert (= (and b!672749 res!439351) b!672752))

(assert (= (and b!672752 res!439336) b!672741))

(assert (= (and b!672741 res!439347) b!672736))

(assert (= (and b!672736 res!439334) b!672738))

(assert (= (and b!672738 res!439345) b!672739))

(assert (= (and b!672739 res!439344) b!672731))

(assert (= (and b!672731 c!77066) b!672747))

(assert (= (and b!672731 (not c!77066)) b!672740))

(assert (= (and b!672731 res!439349) b!672751))

(assert (= (and b!672751 res!439354) b!672743))

(assert (= (and b!672743 res!439337) b!672734))

(assert (= (and b!672734 res!439335) b!672733))

(assert (= (and b!672733 res!439340) b!672742))

(assert (= (and b!672742 res!439333) b!672755))

(assert (= (and b!672742 (not res!439353)) b!672737))

(assert (= (and b!672737 res!439348) b!672744))

(assert (= (and b!672742 res!439346) b!672735))

(declare-fun m!641543 () Bool)

(assert (=> b!672748 m!641543))

(declare-fun m!641545 () Bool)

(assert (=> b!672755 m!641545))

(declare-fun m!641547 () Bool)

(assert (=> b!672747 m!641547))

(declare-fun m!641549 () Bool)

(assert (=> b!672747 m!641549))

(declare-fun m!641551 () Bool)

(assert (=> start!60182 m!641551))

(declare-fun m!641553 () Bool)

(assert (=> b!672749 m!641553))

(declare-fun m!641555 () Bool)

(assert (=> b!672739 m!641555))

(assert (=> b!672739 m!641555))

(declare-fun m!641557 () Bool)

(assert (=> b!672739 m!641557))

(declare-fun m!641559 () Bool)

(assert (=> b!672734 m!641559))

(declare-fun m!641561 () Bool)

(assert (=> b!672741 m!641561))

(declare-fun m!641563 () Bool)

(assert (=> b!672750 m!641563))

(declare-fun m!641565 () Bool)

(assert (=> b!672733 m!641565))

(assert (=> b!672744 m!641545))

(declare-fun m!641567 () Bool)

(assert (=> b!672743 m!641567))

(declare-fun m!641569 () Bool)

(assert (=> b!672735 m!641569))

(declare-fun m!641571 () Bool)

(assert (=> b!672736 m!641571))

(declare-fun m!641573 () Bool)

(assert (=> b!672754 m!641573))

(declare-fun m!641575 () Bool)

(assert (=> b!672745 m!641575))

(assert (=> b!672731 m!641555))

(assert (=> b!672746 m!641543))

(declare-fun m!641577 () Bool)

(assert (=> b!672732 m!641577))

(assert (=> b!672751 m!641555))

(assert (=> b!672751 m!641555))

(declare-fun m!641579 () Bool)

(assert (=> b!672751 m!641579))

(push 1)

