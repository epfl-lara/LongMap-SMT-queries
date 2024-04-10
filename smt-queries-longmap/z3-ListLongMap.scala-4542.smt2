; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63270 () Bool)

(assert start!63270)

(declare-fun b!712536 () Bool)

(declare-fun res!475714 () Bool)

(declare-fun e!400884 () Bool)

(assert (=> b!712536 (=> (not res!475714) (not e!400884))))

(declare-datatypes ((List!13398 0))(
  ( (Nil!13395) (Cons!13394 (h!14439 (_ BitVec 64)) (t!19710 List!13398)) )
))
(declare-fun newAcc!49 () List!13398)

(declare-fun acc!652 () List!13398)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!385 (List!13398 (_ BitVec 64)) List!13398)

(assert (=> b!712536 (= res!475714 (= (-!385 newAcc!49 k0!2824) acc!652))))

(declare-fun b!712537 () Bool)

(declare-fun res!475705 () Bool)

(assert (=> b!712537 (=> (not res!475705) (not e!400884))))

(declare-datatypes ((array!40431 0))(
  ( (array!40432 (arr!19357 (Array (_ BitVec 32) (_ BitVec 64))) (size!19765 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40431)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712537 (= res!475705 (validKeyInArray!0 (select (arr!19357 a!3591) from!2969)))))

(declare-fun b!712538 () Bool)

(declare-fun res!475730 () Bool)

(declare-fun e!400886 () Bool)

(assert (=> b!712538 (=> (not res!475730) (not e!400886))))

(declare-fun lt!318589 () List!13398)

(declare-fun noDuplicate!1222 (List!13398) Bool)

(assert (=> b!712538 (= res!475730 (noDuplicate!1222 lt!318589))))

(declare-fun b!712539 () Bool)

(declare-fun res!475710 () Bool)

(assert (=> b!712539 (=> (not res!475710) (not e!400886))))

(declare-fun contains!3975 (List!13398 (_ BitVec 64)) Bool)

(assert (=> b!712539 (= res!475710 (contains!3975 lt!318589 k0!2824))))

(declare-fun res!475715 () Bool)

(assert (=> start!63270 (=> (not res!475715) (not e!400884))))

(assert (=> start!63270 (= res!475715 (and (bvslt (size!19765 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19765 a!3591))))))

(assert (=> start!63270 e!400884))

(assert (=> start!63270 true))

(declare-fun array_inv!15153 (array!40431) Bool)

(assert (=> start!63270 (array_inv!15153 a!3591)))

(declare-fun b!712540 () Bool)

(declare-fun res!475723 () Bool)

(assert (=> b!712540 (=> (not res!475723) (not e!400884))))

(assert (=> b!712540 (= res!475723 (not (contains!3975 acc!652 k0!2824)))))

(declare-fun b!712541 () Bool)

(declare-fun res!475716 () Bool)

(assert (=> b!712541 (=> (not res!475716) (not e!400884))))

(assert (=> b!712541 (= res!475716 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19765 a!3591)))))

(declare-fun b!712542 () Bool)

(declare-fun res!475726 () Bool)

(assert (=> b!712542 (=> (not res!475726) (not e!400886))))

(declare-fun lt!318590 () List!13398)

(declare-fun arrayNoDuplicates!0 (array!40431 (_ BitVec 32) List!13398) Bool)

(assert (=> b!712542 (= res!475726 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318590))))

(declare-fun b!712543 () Bool)

(declare-fun res!475713 () Bool)

(assert (=> b!712543 (=> (not res!475713) (not e!400886))))

(assert (=> b!712543 (= res!475713 (= (-!385 lt!318589 k0!2824) lt!318590))))

(declare-fun b!712544 () Bool)

(declare-fun res!475709 () Bool)

(assert (=> b!712544 (=> (not res!475709) (not e!400886))))

(assert (=> b!712544 (= res!475709 (not (contains!3975 lt!318590 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712545 () Bool)

(declare-fun res!475727 () Bool)

(assert (=> b!712545 (=> (not res!475727) (not e!400884))))

(assert (=> b!712545 (= res!475727 (contains!3975 newAcc!49 k0!2824))))

(declare-fun b!712546 () Bool)

(declare-fun res!475718 () Bool)

(assert (=> b!712546 (=> (not res!475718) (not e!400884))))

(assert (=> b!712546 (= res!475718 (not (contains!3975 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712547 () Bool)

(assert (=> b!712547 (= e!400884 e!400886)))

(declare-fun res!475722 () Bool)

(assert (=> b!712547 (=> (not res!475722) (not e!400886))))

(assert (=> b!712547 (= res!475722 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!531 (List!13398 (_ BitVec 64)) List!13398)

(assert (=> b!712547 (= lt!318589 ($colon$colon!531 newAcc!49 (select (arr!19357 a!3591) from!2969)))))

(assert (=> b!712547 (= lt!318590 ($colon$colon!531 acc!652 (select (arr!19357 a!3591) from!2969)))))

(declare-fun b!712548 () Bool)

(declare-fun res!475717 () Bool)

(assert (=> b!712548 (=> (not res!475717) (not e!400884))))

(assert (=> b!712548 (= res!475717 (noDuplicate!1222 newAcc!49))))

(declare-fun b!712549 () Bool)

(declare-fun res!475719 () Bool)

(assert (=> b!712549 (=> (not res!475719) (not e!400884))))

(declare-fun subseq!420 (List!13398 List!13398) Bool)

(assert (=> b!712549 (= res!475719 (subseq!420 acc!652 newAcc!49))))

(declare-fun b!712550 () Bool)

(declare-fun res!475732 () Bool)

(assert (=> b!712550 (=> (not res!475732) (not e!400884))))

(assert (=> b!712550 (= res!475732 (not (contains!3975 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712551 () Bool)

(declare-fun res!475706 () Bool)

(assert (=> b!712551 (=> (not res!475706) (not e!400886))))

(assert (=> b!712551 (= res!475706 (not (contains!3975 lt!318589 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712552 () Bool)

(declare-fun res!475707 () Bool)

(assert (=> b!712552 (=> (not res!475707) (not e!400886))))

(assert (=> b!712552 (= res!475707 (not (contains!3975 lt!318590 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712553 () Bool)

(declare-fun res!475731 () Bool)

(assert (=> b!712553 (=> (not res!475731) (not e!400886))))

(declare-fun arrayContainsKey!0 (array!40431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712553 (= res!475731 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712554 () Bool)

(declare-fun res!475721 () Bool)

(assert (=> b!712554 (=> (not res!475721) (not e!400884))))

(assert (=> b!712554 (= res!475721 (validKeyInArray!0 k0!2824))))

(declare-fun b!712555 () Bool)

(declare-fun res!475711 () Bool)

(assert (=> b!712555 (=> (not res!475711) (not e!400886))))

(assert (=> b!712555 (= res!475711 (noDuplicate!1222 lt!318590))))

(declare-fun b!712556 () Bool)

(declare-fun res!475704 () Bool)

(assert (=> b!712556 (=> (not res!475704) (not e!400884))))

(assert (=> b!712556 (= res!475704 (not (contains!3975 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712557 () Bool)

(declare-fun res!475720 () Bool)

(assert (=> b!712557 (=> (not res!475720) (not e!400884))))

(assert (=> b!712557 (= res!475720 (noDuplicate!1222 acc!652))))

(declare-fun b!712558 () Bool)

(declare-fun res!475728 () Bool)

(assert (=> b!712558 (=> (not res!475728) (not e!400886))))

(assert (=> b!712558 (= res!475728 (not (contains!3975 lt!318589 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712559 () Bool)

(declare-fun res!475708 () Bool)

(assert (=> b!712559 (=> (not res!475708) (not e!400884))))

(assert (=> b!712559 (= res!475708 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712560 () Bool)

(declare-fun res!475724 () Bool)

(assert (=> b!712560 (=> (not res!475724) (not e!400886))))

(assert (=> b!712560 (= res!475724 (subseq!420 lt!318590 lt!318589))))

(declare-fun b!712561 () Bool)

(declare-fun res!475729 () Bool)

(assert (=> b!712561 (=> (not res!475729) (not e!400884))))

(assert (=> b!712561 (= res!475729 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!712562 () Bool)

(declare-fun res!475712 () Bool)

(assert (=> b!712562 (=> (not res!475712) (not e!400884))))

(assert (=> b!712562 (= res!475712 (not (contains!3975 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712563 () Bool)

(assert (=> b!712563 (= e!400886 (bvsge (bvsub (size!19765 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) (bvsub (size!19765 a!3591) from!2969)))))

(declare-fun b!712564 () Bool)

(declare-fun res!475725 () Bool)

(assert (=> b!712564 (=> (not res!475725) (not e!400886))))

(assert (=> b!712564 (= res!475725 (not (contains!3975 lt!318590 k0!2824)))))

(assert (= (and start!63270 res!475715) b!712557))

(assert (= (and b!712557 res!475720) b!712548))

(assert (= (and b!712548 res!475717) b!712556))

(assert (= (and b!712556 res!475704) b!712562))

(assert (= (and b!712562 res!475712) b!712561))

(assert (= (and b!712561 res!475729) b!712540))

(assert (= (and b!712540 res!475723) b!712554))

(assert (= (and b!712554 res!475721) b!712559))

(assert (= (and b!712559 res!475708) b!712549))

(assert (= (and b!712549 res!475719) b!712545))

(assert (= (and b!712545 res!475727) b!712536))

(assert (= (and b!712536 res!475714) b!712550))

(assert (= (and b!712550 res!475732) b!712546))

(assert (= (and b!712546 res!475718) b!712541))

(assert (= (and b!712541 res!475716) b!712537))

(assert (= (and b!712537 res!475705) b!712547))

(assert (= (and b!712547 res!475722) b!712555))

(assert (= (and b!712555 res!475711) b!712538))

(assert (= (and b!712538 res!475730) b!712544))

(assert (= (and b!712544 res!475709) b!712552))

(assert (= (and b!712552 res!475707) b!712553))

(assert (= (and b!712553 res!475731) b!712564))

(assert (= (and b!712564 res!475725) b!712542))

(assert (= (and b!712542 res!475726) b!712560))

(assert (= (and b!712560 res!475724) b!712539))

(assert (= (and b!712539 res!475710) b!712543))

(assert (= (and b!712543 res!475713) b!712558))

(assert (= (and b!712558 res!475728) b!712551))

(assert (= (and b!712551 res!475706) b!712563))

(declare-fun m!669445 () Bool)

(assert (=> b!712544 m!669445))

(declare-fun m!669447 () Bool)

(assert (=> b!712547 m!669447))

(assert (=> b!712547 m!669447))

(declare-fun m!669449 () Bool)

(assert (=> b!712547 m!669449))

(assert (=> b!712547 m!669447))

(declare-fun m!669451 () Bool)

(assert (=> b!712547 m!669451))

(declare-fun m!669453 () Bool)

(assert (=> b!712553 m!669453))

(declare-fun m!669455 () Bool)

(assert (=> b!712540 m!669455))

(declare-fun m!669457 () Bool)

(assert (=> b!712559 m!669457))

(declare-fun m!669459 () Bool)

(assert (=> b!712554 m!669459))

(declare-fun m!669461 () Bool)

(assert (=> b!712542 m!669461))

(declare-fun m!669463 () Bool)

(assert (=> b!712536 m!669463))

(declare-fun m!669465 () Bool)

(assert (=> b!712543 m!669465))

(declare-fun m!669467 () Bool)

(assert (=> b!712551 m!669467))

(declare-fun m!669469 () Bool)

(assert (=> start!63270 m!669469))

(declare-fun m!669471 () Bool)

(assert (=> b!712545 m!669471))

(declare-fun m!669473 () Bool)

(assert (=> b!712539 m!669473))

(declare-fun m!669475 () Bool)

(assert (=> b!712557 m!669475))

(declare-fun m!669477 () Bool)

(assert (=> b!712548 m!669477))

(declare-fun m!669479 () Bool)

(assert (=> b!712558 m!669479))

(declare-fun m!669481 () Bool)

(assert (=> b!712555 m!669481))

(assert (=> b!712537 m!669447))

(assert (=> b!712537 m!669447))

(declare-fun m!669483 () Bool)

(assert (=> b!712537 m!669483))

(declare-fun m!669485 () Bool)

(assert (=> b!712550 m!669485))

(declare-fun m!669487 () Bool)

(assert (=> b!712561 m!669487))

(declare-fun m!669489 () Bool)

(assert (=> b!712560 m!669489))

(declare-fun m!669491 () Bool)

(assert (=> b!712562 m!669491))

(declare-fun m!669493 () Bool)

(assert (=> b!712556 m!669493))

(declare-fun m!669495 () Bool)

(assert (=> b!712538 m!669495))

(declare-fun m!669497 () Bool)

(assert (=> b!712552 m!669497))

(declare-fun m!669499 () Bool)

(assert (=> b!712549 m!669499))

(declare-fun m!669501 () Bool)

(assert (=> b!712546 m!669501))

(declare-fun m!669503 () Bool)

(assert (=> b!712564 m!669503))

(check-sat (not b!712564) (not b!712546) (not b!712560) (not b!712559) (not b!712550) (not b!712558) (not b!712556) (not b!712557) (not b!712543) (not b!712548) (not b!712538) (not b!712540) (not start!63270) (not b!712545) (not b!712536) (not b!712542) (not b!712553) (not b!712561) (not b!712551) (not b!712562) (not b!712552) (not b!712555) (not b!712539) (not b!712554) (not b!712549) (not b!712547) (not b!712537) (not b!712544))
(check-sat)
