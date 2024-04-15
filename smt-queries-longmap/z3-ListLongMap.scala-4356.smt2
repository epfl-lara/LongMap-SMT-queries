; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60152 () Bool)

(assert start!60152)

(declare-fun b!671732 () Bool)

(declare-fun res!438571 () Bool)

(declare-fun e!383781 () Bool)

(assert (=> b!671732 (=> (not res!438571) (not e!383781))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671732 (= res!438571 (validKeyInArray!0 k0!2843))))

(declare-fun b!671733 () Bool)

(declare-fun e!383776 () Bool)

(declare-datatypes ((List!12877 0))(
  ( (Nil!12874) (Cons!12873 (h!13918 (_ BitVec 64)) (t!19096 List!12877)) )
))
(declare-fun lt!311993 () List!12877)

(declare-fun contains!3399 (List!12877 (_ BitVec 64)) Bool)

(assert (=> b!671733 (= e!383776 (contains!3399 lt!311993 k0!2843))))

(declare-fun b!671734 () Bool)

(declare-fun e!383785 () Bool)

(assert (=> b!671734 (= e!383781 e!383785)))

(declare-fun res!438556 () Bool)

(assert (=> b!671734 (=> (not res!438556) (not e!383785))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39210 0))(
  ( (array!39211 (arr!18797 (Array (_ BitVec 32) (_ BitVec 64))) (size!19162 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39210)

(assert (=> b!671734 (= res!438556 (not (= (select (arr!18797 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23582 0))(
  ( (Unit!23583) )
))
(declare-fun lt!311994 () Unit!23582)

(declare-fun e!383780 () Unit!23582)

(assert (=> b!671734 (= lt!311994 e!383780)))

(declare-fun c!76959 () Bool)

(assert (=> b!671734 (= c!76959 (= (select (arr!18797 a!3626) from!3004) k0!2843))))

(declare-fun b!671735 () Bool)

(declare-fun e!383782 () Bool)

(declare-fun acc!681 () List!12877)

(assert (=> b!671735 (= e!383782 (contains!3399 acc!681 k0!2843))))

(declare-fun b!671736 () Bool)

(declare-fun e!383778 () Bool)

(declare-fun e!383784 () Bool)

(assert (=> b!671736 (= e!383778 e!383784)))

(declare-fun res!438568 () Bool)

(assert (=> b!671736 (=> (not res!438568) (not e!383784))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671736 (= res!438568 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671738 () Bool)

(declare-fun res!438565 () Bool)

(assert (=> b!671738 (=> (not res!438565) (not e!383781))))

(assert (=> b!671738 (= res!438565 (not (contains!3399 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671739 () Bool)

(assert (=> b!671739 (= e!383784 (not (contains!3399 lt!311993 k0!2843)))))

(declare-fun b!671740 () Bool)

(declare-fun e!383779 () Bool)

(assert (=> b!671740 (= e!383779 false)))

(declare-fun lt!311991 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39210 (_ BitVec 32) List!12877) Bool)

(assert (=> b!671740 (= lt!311991 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311993))))

(declare-fun b!671741 () Bool)

(declare-fun res!438549 () Bool)

(assert (=> b!671741 (=> (not res!438549) (not e!383781))))

(declare-fun e!383786 () Bool)

(assert (=> b!671741 (= res!438549 e!383786)))

(declare-fun res!438566 () Bool)

(assert (=> b!671741 (=> res!438566 e!383786)))

(assert (=> b!671741 (= res!438566 e!383782)))

(declare-fun res!438560 () Bool)

(assert (=> b!671741 (=> (not res!438560) (not e!383782))))

(assert (=> b!671741 (= res!438560 (bvsgt from!3004 i!1382))))

(declare-fun b!671742 () Bool)

(declare-fun Unit!23584 () Unit!23582)

(assert (=> b!671742 (= e!383780 Unit!23584)))

(declare-fun b!671743 () Bool)

(declare-fun e!383783 () Bool)

(assert (=> b!671743 (= e!383783 (not (contains!3399 acc!681 k0!2843)))))

(declare-fun b!671744 () Bool)

(declare-fun res!438557 () Bool)

(assert (=> b!671744 (=> (not res!438557) (not e!383779))))

(assert (=> b!671744 (= res!438557 e!383778)))

(declare-fun res!438553 () Bool)

(assert (=> b!671744 (=> res!438553 e!383778)))

(assert (=> b!671744 (= res!438553 e!383776)))

(declare-fun res!438567 () Bool)

(assert (=> b!671744 (=> (not res!438567) (not e!383776))))

(assert (=> b!671744 (= res!438567 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671745 () Bool)

(declare-fun res!438561 () Bool)

(assert (=> b!671745 (=> (not res!438561) (not e!383781))))

(declare-fun noDuplicate!668 (List!12877) Bool)

(assert (=> b!671745 (= res!438561 (noDuplicate!668 acc!681))))

(declare-fun b!671746 () Bool)

(declare-fun res!438569 () Bool)

(assert (=> b!671746 (=> (not res!438569) (not e!383781))))

(assert (=> b!671746 (= res!438569 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19162 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671747 () Bool)

(declare-fun res!438551 () Bool)

(assert (=> b!671747 (=> (not res!438551) (not e!383781))))

(declare-fun arrayContainsKey!0 (array!39210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671747 (= res!438551 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671748 () Bool)

(declare-fun res!438552 () Bool)

(assert (=> b!671748 (=> (not res!438552) (not e!383781))))

(assert (=> b!671748 (= res!438552 (not (contains!3399 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671749 () Bool)

(declare-fun res!438563 () Bool)

(assert (=> b!671749 (=> (not res!438563) (not e!383781))))

(assert (=> b!671749 (= res!438563 (validKeyInArray!0 (select (arr!18797 a!3626) from!3004)))))

(declare-fun b!671750 () Bool)

(declare-fun res!438558 () Bool)

(assert (=> b!671750 (=> (not res!438558) (not e!383781))))

(assert (=> b!671750 (= res!438558 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19162 a!3626))))))

(declare-fun b!671751 () Bool)

(declare-fun res!438554 () Bool)

(assert (=> b!671751 (=> (not res!438554) (not e!383779))))

(assert (=> b!671751 (= res!438554 (not (contains!3399 lt!311993 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!438550 () Bool)

(assert (=> start!60152 (=> (not res!438550) (not e!383781))))

(assert (=> start!60152 (= res!438550 (and (bvslt (size!19162 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19162 a!3626))))))

(assert (=> start!60152 e!383781))

(assert (=> start!60152 true))

(declare-fun array_inv!14680 (array!39210) Bool)

(assert (=> start!60152 (array_inv!14680 a!3626)))

(declare-fun b!671737 () Bool)

(declare-fun res!438559 () Bool)

(assert (=> b!671737 (=> (not res!438559) (not e!383781))))

(assert (=> b!671737 (= res!438559 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12874))))

(declare-fun b!671752 () Bool)

(declare-fun res!438564 () Bool)

(assert (=> b!671752 (=> (not res!438564) (not e!383779))))

(assert (=> b!671752 (= res!438564 (not (contains!3399 lt!311993 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671753 () Bool)

(assert (=> b!671753 (= e!383786 e!383783)))

(declare-fun res!438562 () Bool)

(assert (=> b!671753 (=> (not res!438562) (not e!383783))))

(assert (=> b!671753 (= res!438562 (bvsle from!3004 i!1382))))

(declare-fun b!671754 () Bool)

(declare-fun res!438555 () Bool)

(assert (=> b!671754 (=> (not res!438555) (not e!383781))))

(assert (=> b!671754 (= res!438555 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671755 () Bool)

(declare-fun Unit!23585 () Unit!23582)

(assert (=> b!671755 (= e!383780 Unit!23585)))

(assert (=> b!671755 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!311992 () Unit!23582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39210 (_ BitVec 64) (_ BitVec 32)) Unit!23582)

(assert (=> b!671755 (= lt!311992 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!671755 false))

(declare-fun b!671756 () Bool)

(declare-fun res!438548 () Bool)

(assert (=> b!671756 (=> (not res!438548) (not e!383779))))

(assert (=> b!671756 (= res!438548 (noDuplicate!668 lt!311993))))

(declare-fun b!671757 () Bool)

(assert (=> b!671757 (= e!383785 e!383779)))

(declare-fun res!438570 () Bool)

(assert (=> b!671757 (=> (not res!438570) (not e!383779))))

(assert (=> b!671757 (= res!438570 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!265 (List!12877 (_ BitVec 64)) List!12877)

(assert (=> b!671757 (= lt!311993 ($colon$colon!265 acc!681 (select (arr!18797 a!3626) from!3004)))))

(assert (= (and start!60152 res!438550) b!671745))

(assert (= (and b!671745 res!438561) b!671738))

(assert (= (and b!671738 res!438565) b!671748))

(assert (= (and b!671748 res!438552) b!671741))

(assert (= (and b!671741 res!438560) b!671735))

(assert (= (and b!671741 (not res!438566)) b!671753))

(assert (= (and b!671753 res!438562) b!671743))

(assert (= (and b!671741 res!438549) b!671737))

(assert (= (and b!671737 res!438559) b!671754))

(assert (= (and b!671754 res!438555) b!671750))

(assert (= (and b!671750 res!438558) b!671732))

(assert (= (and b!671732 res!438571) b!671747))

(assert (= (and b!671747 res!438551) b!671746))

(assert (= (and b!671746 res!438569) b!671749))

(assert (= (and b!671749 res!438563) b!671734))

(assert (= (and b!671734 c!76959) b!671755))

(assert (= (and b!671734 (not c!76959)) b!671742))

(assert (= (and b!671734 res!438556) b!671757))

(assert (= (and b!671757 res!438570) b!671756))

(assert (= (and b!671756 res!438548) b!671751))

(assert (= (and b!671751 res!438554) b!671752))

(assert (= (and b!671752 res!438564) b!671744))

(assert (= (and b!671744 res!438567) b!671733))

(assert (= (and b!671744 (not res!438553)) b!671736))

(assert (= (and b!671736 res!438568) b!671739))

(assert (= (and b!671744 res!438557) b!671740))

(declare-fun m!640419 () Bool)

(assert (=> b!671754 m!640419))

(declare-fun m!640421 () Bool)

(assert (=> b!671739 m!640421))

(declare-fun m!640423 () Bool)

(assert (=> b!671749 m!640423))

(assert (=> b!671749 m!640423))

(declare-fun m!640425 () Bool)

(assert (=> b!671749 m!640425))

(declare-fun m!640427 () Bool)

(assert (=> b!671737 m!640427))

(declare-fun m!640429 () Bool)

(assert (=> b!671738 m!640429))

(declare-fun m!640431 () Bool)

(assert (=> b!671732 m!640431))

(declare-fun m!640433 () Bool)

(assert (=> b!671752 m!640433))

(declare-fun m!640435 () Bool)

(assert (=> b!671751 m!640435))

(assert (=> b!671757 m!640423))

(assert (=> b!671757 m!640423))

(declare-fun m!640437 () Bool)

(assert (=> b!671757 m!640437))

(declare-fun m!640439 () Bool)

(assert (=> b!671745 m!640439))

(declare-fun m!640441 () Bool)

(assert (=> b!671748 m!640441))

(declare-fun m!640443 () Bool)

(assert (=> b!671743 m!640443))

(declare-fun m!640445 () Bool)

(assert (=> b!671756 m!640445))

(declare-fun m!640447 () Bool)

(assert (=> start!60152 m!640447))

(declare-fun m!640449 () Bool)

(assert (=> b!671740 m!640449))

(declare-fun m!640451 () Bool)

(assert (=> b!671755 m!640451))

(declare-fun m!640453 () Bool)

(assert (=> b!671755 m!640453))

(assert (=> b!671734 m!640423))

(declare-fun m!640455 () Bool)

(assert (=> b!671747 m!640455))

(assert (=> b!671733 m!640421))

(assert (=> b!671735 m!640443))

(check-sat (not b!671749) (not b!671737) (not b!671738) (not b!671745) (not start!60152) (not b!671739) (not b!671732) (not b!671756) (not b!671754) (not b!671747) (not b!671752) (not b!671755) (not b!671740) (not b!671733) (not b!671748) (not b!671743) (not b!671751) (not b!671757) (not b!671735))
(check-sat)
