; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60050 () Bool)

(assert start!60050)

(declare-fun b!668453 () Bool)

(declare-fun e!382465 () Bool)

(declare-fun e!382466 () Bool)

(assert (=> b!668453 (= e!382465 (not e!382466))))

(declare-fun res!435518 () Bool)

(assert (=> b!668453 (=> res!435518 e!382466)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!668453 (= res!435518 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39097 0))(
  ( (array!39098 (arr!18741 (Array (_ BitVec 32) (_ BitVec 64))) (size!19105 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39097)

(declare-datatypes ((List!12782 0))(
  ( (Nil!12779) (Cons!12778 (h!13823 (_ BitVec 64)) (t!19010 List!12782)) )
))
(declare-fun lt!311232 () List!12782)

(declare-fun arrayNoDuplicates!0 (array!39097 (_ BitVec 32) List!12782) Bool)

(assert (=> b!668453 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311232)))

(declare-datatypes ((Unit!23430 0))(
  ( (Unit!23431) )
))
(declare-fun lt!311233 () Unit!23430)

(declare-fun acc!681 () List!12782)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39097 (_ BitVec 64) (_ BitVec 32) List!12782 List!12782) Unit!23430)

(assert (=> b!668453 (= lt!311233 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311232))))

(declare-fun -!96 (List!12782 (_ BitVec 64)) List!12782)

(assert (=> b!668453 (= (-!96 lt!311232 k!2843) acc!681)))

(declare-fun $colon$colon!230 (List!12782 (_ BitVec 64)) List!12782)

(assert (=> b!668453 (= lt!311232 ($colon$colon!230 acc!681 k!2843))))

(declare-fun lt!311225 () Unit!23430)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12782) Unit!23430)

(assert (=> b!668453 (= lt!311225 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!98 (List!12782 List!12782) Bool)

(assert (=> b!668453 (subseq!98 acc!681 acc!681)))

(declare-fun lt!311227 () Unit!23430)

(declare-fun lemmaListSubSeqRefl!0 (List!12782) Unit!23430)

(assert (=> b!668453 (= lt!311227 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668453 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311230 () Unit!23430)

(declare-fun e!382468 () Unit!23430)

(assert (=> b!668453 (= lt!311230 e!382468)))

(declare-fun c!76843 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668453 (= c!76843 (validKeyInArray!0 (select (arr!18741 a!3626) from!3004)))))

(declare-fun lt!311226 () Unit!23430)

(declare-fun e!382470 () Unit!23430)

(assert (=> b!668453 (= lt!311226 e!382470)))

(declare-fun c!76844 () Bool)

(declare-fun arrayContainsKey!0 (array!39097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668453 (= c!76844 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668453 (arrayContainsKey!0 (array!39098 (store (arr!18741 a!3626) i!1382 k!2843) (size!19105 a!3626)) k!2843 from!3004)))

(declare-fun b!668454 () Bool)

(declare-fun res!435506 () Bool)

(assert (=> b!668454 (=> (not res!435506) (not e!382465))))

(assert (=> b!668454 (= res!435506 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12779))))

(declare-fun b!668455 () Bool)

(declare-fun res!435501 () Bool)

(assert (=> b!668455 (=> (not res!435501) (not e!382465))))

(assert (=> b!668455 (= res!435501 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668456 () Bool)

(assert (=> b!668456 (= e!382466 true)))

(declare-fun lt!311228 () Bool)

(declare-fun e!382469 () Bool)

(assert (=> b!668456 (= lt!311228 e!382469)))

(declare-fun res!435505 () Bool)

(assert (=> b!668456 (=> res!435505 e!382469)))

(declare-fun e!382472 () Bool)

(assert (=> b!668456 (= res!435505 e!382472)))

(declare-fun res!435520 () Bool)

(assert (=> b!668456 (=> (not res!435520) (not e!382472))))

(assert (=> b!668456 (= res!435520 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668457 () Bool)

(declare-fun res!435502 () Bool)

(assert (=> b!668457 (=> (not res!435502) (not e!382465))))

(declare-fun noDuplicate!606 (List!12782) Bool)

(assert (=> b!668457 (= res!435502 (noDuplicate!606 acc!681))))

(declare-fun b!668458 () Bool)

(declare-fun e!382464 () Bool)

(declare-fun contains!3359 (List!12782 (_ BitVec 64)) Bool)

(assert (=> b!668458 (= e!382464 (not (contains!3359 acc!681 k!2843)))))

(declare-fun b!668459 () Bool)

(declare-fun e!382463 () Bool)

(assert (=> b!668459 (= e!382463 (contains!3359 acc!681 k!2843))))

(declare-fun b!668460 () Bool)

(declare-fun e!382471 () Bool)

(assert (=> b!668460 (= e!382471 (not (contains!3359 lt!311232 k!2843)))))

(declare-fun res!435509 () Bool)

(assert (=> start!60050 (=> (not res!435509) (not e!382465))))

(assert (=> start!60050 (= res!435509 (and (bvslt (size!19105 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19105 a!3626))))))

(assert (=> start!60050 e!382465))

(assert (=> start!60050 true))

(declare-fun array_inv!14537 (array!39097) Bool)

(assert (=> start!60050 (array_inv!14537 a!3626)))

(declare-fun b!668461 () Bool)

(declare-fun Unit!23432 () Unit!23430)

(assert (=> b!668461 (= e!382470 Unit!23432)))

(declare-fun lt!311231 () Unit!23430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39097 (_ BitVec 64) (_ BitVec 32)) Unit!23430)

(assert (=> b!668461 (= lt!311231 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668461 false))

(declare-fun b!668462 () Bool)

(declare-fun res!435519 () Bool)

(assert (=> b!668462 (=> (not res!435519) (not e!382465))))

(declare-fun e!382473 () Bool)

(assert (=> b!668462 (= res!435519 e!382473)))

(declare-fun res!435514 () Bool)

(assert (=> b!668462 (=> res!435514 e!382473)))

(assert (=> b!668462 (= res!435514 e!382463)))

(declare-fun res!435504 () Bool)

(assert (=> b!668462 (=> (not res!435504) (not e!382463))))

(assert (=> b!668462 (= res!435504 (bvsgt from!3004 i!1382))))

(declare-fun b!668463 () Bool)

(assert (=> b!668463 (= e!382472 (contains!3359 lt!311232 k!2843))))

(declare-fun b!668464 () Bool)

(declare-fun res!435503 () Bool)

(assert (=> b!668464 (=> (not res!435503) (not e!382465))))

(assert (=> b!668464 (= res!435503 (not (contains!3359 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668465 () Bool)

(declare-fun res!435507 () Bool)

(assert (=> b!668465 (=> (not res!435507) (not e!382465))))

(assert (=> b!668465 (= res!435507 (validKeyInArray!0 k!2843))))

(declare-fun b!668466 () Bool)

(assert (=> b!668466 (= e!382469 e!382471)))

(declare-fun res!435517 () Bool)

(assert (=> b!668466 (=> (not res!435517) (not e!382471))))

(assert (=> b!668466 (= res!435517 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668467 () Bool)

(declare-fun res!435512 () Bool)

(assert (=> b!668467 (=> (not res!435512) (not e!382465))))

(assert (=> b!668467 (= res!435512 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668468 () Bool)

(declare-fun res!435510 () Bool)

(assert (=> b!668468 (=> (not res!435510) (not e!382465))))

(assert (=> b!668468 (= res!435510 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19105 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668469 () Bool)

(declare-fun res!435516 () Bool)

(assert (=> b!668469 (=> res!435516 e!382466)))

(assert (=> b!668469 (= res!435516 (contains!3359 lt!311232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668470 () Bool)

(assert (=> b!668470 (= e!382473 e!382464)))

(declare-fun res!435521 () Bool)

(assert (=> b!668470 (=> (not res!435521) (not e!382464))))

(assert (=> b!668470 (= res!435521 (bvsle from!3004 i!1382))))

(declare-fun b!668471 () Bool)

(declare-fun Unit!23433 () Unit!23430)

(assert (=> b!668471 (= e!382470 Unit!23433)))

(declare-fun b!668472 () Bool)

(declare-fun res!435508 () Bool)

(assert (=> b!668472 (=> res!435508 e!382466)))

(assert (=> b!668472 (= res!435508 (not (noDuplicate!606 lt!311232)))))

(declare-fun b!668473 () Bool)

(declare-fun res!435511 () Bool)

(assert (=> b!668473 (=> (not res!435511) (not e!382465))))

(assert (=> b!668473 (= res!435511 (not (contains!3359 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668474 () Bool)

(declare-fun res!435515 () Bool)

(assert (=> b!668474 (=> (not res!435515) (not e!382465))))

(assert (=> b!668474 (= res!435515 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19105 a!3626))))))

(declare-fun b!668475 () Bool)

(declare-fun lt!311224 () Unit!23430)

(assert (=> b!668475 (= e!382468 lt!311224)))

(declare-fun lt!311229 () Unit!23430)

(assert (=> b!668475 (= lt!311229 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668475 (subseq!98 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39097 List!12782 List!12782 (_ BitVec 32)) Unit!23430)

(assert (=> b!668475 (= lt!311224 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!230 acc!681 (select (arr!18741 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668475 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668476 () Bool)

(declare-fun res!435513 () Bool)

(assert (=> b!668476 (=> res!435513 e!382466)))

(assert (=> b!668476 (= res!435513 (contains!3359 lt!311232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668477 () Bool)

(declare-fun Unit!23434 () Unit!23430)

(assert (=> b!668477 (= e!382468 Unit!23434)))

(assert (= (and start!60050 res!435509) b!668457))

(assert (= (and b!668457 res!435502) b!668473))

(assert (= (and b!668473 res!435511) b!668464))

(assert (= (and b!668464 res!435503) b!668462))

(assert (= (and b!668462 res!435504) b!668459))

(assert (= (and b!668462 (not res!435514)) b!668470))

(assert (= (and b!668470 res!435521) b!668458))

(assert (= (and b!668462 res!435519) b!668454))

(assert (= (and b!668454 res!435506) b!668455))

(assert (= (and b!668455 res!435501) b!668474))

(assert (= (and b!668474 res!435515) b!668465))

(assert (= (and b!668465 res!435507) b!668467))

(assert (= (and b!668467 res!435512) b!668468))

(assert (= (and b!668468 res!435510) b!668453))

(assert (= (and b!668453 c!76844) b!668461))

(assert (= (and b!668453 (not c!76844)) b!668471))

(assert (= (and b!668453 c!76843) b!668475))

(assert (= (and b!668453 (not c!76843)) b!668477))

(assert (= (and b!668453 (not res!435518)) b!668472))

(assert (= (and b!668472 (not res!435508)) b!668469))

(assert (= (and b!668469 (not res!435516)) b!668476))

(assert (= (and b!668476 (not res!435513)) b!668456))

(assert (= (and b!668456 res!435520) b!668463))

(assert (= (and b!668456 (not res!435505)) b!668466))

(assert (= (and b!668466 res!435517) b!668460))

(declare-fun m!638771 () Bool)

(assert (=> b!668459 m!638771))

(declare-fun m!638773 () Bool)

(assert (=> b!668463 m!638773))

(declare-fun m!638775 () Bool)

(assert (=> b!668457 m!638775))

(declare-fun m!638777 () Bool)

(assert (=> b!668455 m!638777))

(declare-fun m!638779 () Bool)

(assert (=> b!668467 m!638779))

(declare-fun m!638781 () Bool)

(assert (=> start!60050 m!638781))

(declare-fun m!638783 () Bool)

(assert (=> b!668469 m!638783))

(declare-fun m!638785 () Bool)

(assert (=> b!668476 m!638785))

(declare-fun m!638787 () Bool)

(assert (=> b!668464 m!638787))

(declare-fun m!638789 () Bool)

(assert (=> b!668475 m!638789))

(declare-fun m!638791 () Bool)

(assert (=> b!668475 m!638791))

(declare-fun m!638793 () Bool)

(assert (=> b!668475 m!638793))

(declare-fun m!638795 () Bool)

(assert (=> b!668475 m!638795))

(assert (=> b!668475 m!638791))

(assert (=> b!668475 m!638793))

(declare-fun m!638797 () Bool)

(assert (=> b!668475 m!638797))

(declare-fun m!638799 () Bool)

(assert (=> b!668475 m!638799))

(declare-fun m!638801 () Bool)

(assert (=> b!668472 m!638801))

(declare-fun m!638803 () Bool)

(assert (=> b!668454 m!638803))

(declare-fun m!638805 () Bool)

(assert (=> b!668465 m!638805))

(declare-fun m!638807 () Bool)

(assert (=> b!668461 m!638807))

(assert (=> b!668458 m!638771))

(declare-fun m!638809 () Bool)

(assert (=> b!668453 m!638809))

(declare-fun m!638811 () Bool)

(assert (=> b!668453 m!638811))

(assert (=> b!668453 m!638789))

(assert (=> b!668453 m!638791))

(declare-fun m!638813 () Bool)

(assert (=> b!668453 m!638813))

(declare-fun m!638815 () Bool)

(assert (=> b!668453 m!638815))

(assert (=> b!668453 m!638797))

(declare-fun m!638817 () Bool)

(assert (=> b!668453 m!638817))

(declare-fun m!638819 () Bool)

(assert (=> b!668453 m!638819))

(declare-fun m!638821 () Bool)

(assert (=> b!668453 m!638821))

(assert (=> b!668453 m!638791))

(declare-fun m!638823 () Bool)

(assert (=> b!668453 m!638823))

(declare-fun m!638825 () Bool)

(assert (=> b!668453 m!638825))

(assert (=> b!668453 m!638799))

(declare-fun m!638827 () Bool)

(assert (=> b!668473 m!638827))

(assert (=> b!668460 m!638773))

(push 1)

(assert (not b!668473))

(assert (not start!60050))

(assert (not b!668475))

(assert (not b!668455))

(assert (not b!668469))

(assert (not b!668463))

(assert (not b!668465))

(assert (not b!668457))

(assert (not b!668454))

(assert (not b!668461))

(assert (not b!668453))

(assert (not b!668464))

(assert (not b!668460))

(assert (not b!668467))

(assert (not b!668472))

(assert (not b!668476))

(assert (not b!668458))

(assert (not b!668459))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

