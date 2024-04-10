; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61858 () Bool)

(assert start!61858)

(declare-fun b!692460 () Bool)

(declare-fun e!393968 () Bool)

(declare-datatypes ((List!13125 0))(
  ( (Nil!13122) (Cons!13121 (h!14166 (_ BitVec 64)) (t!19395 List!13125)) )
))
(declare-fun acc!681 () List!13125)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3702 (List!13125 (_ BitVec 64)) Bool)

(assert (=> b!692460 (= e!393968 (contains!3702 acc!681 k0!2843))))

(declare-fun b!692461 () Bool)

(declare-fun res!456701 () Bool)

(declare-fun e!393962 () Bool)

(assert (=> b!692461 (=> (not res!456701) (not e!393962))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39834 0))(
  ( (array!39835 (arr!19084 (Array (_ BitVec 32) (_ BitVec 64))) (size!19469 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39834)

(assert (=> b!692461 (= res!456701 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19469 a!3626))))))

(declare-fun b!692462 () Bool)

(declare-fun res!456716 () Bool)

(assert (=> b!692462 (=> (not res!456716) (not e!393962))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692462 (= res!456716 (validKeyInArray!0 (select (arr!19084 a!3626) from!3004)))))

(declare-fun b!692463 () Bool)

(declare-fun res!456700 () Bool)

(assert (=> b!692463 (=> (not res!456700) (not e!393962))))

(assert (=> b!692463 (= res!456700 (not (contains!3702 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692464 () Bool)

(declare-fun res!456715 () Bool)

(assert (=> b!692464 (=> (not res!456715) (not e!393962))))

(assert (=> b!692464 (= res!456715 (not (contains!3702 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692465 () Bool)

(declare-fun res!456712 () Bool)

(assert (=> b!692465 (=> (not res!456712) (not e!393962))))

(declare-fun arrayContainsKey!0 (array!39834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692465 (= res!456712 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692466 () Bool)

(declare-fun e!393964 () Bool)

(declare-fun e!393966 () Bool)

(assert (=> b!692466 (= e!393964 e!393966)))

(declare-fun res!456708 () Bool)

(assert (=> b!692466 (=> (not res!456708) (not e!393966))))

(assert (=> b!692466 (= res!456708 (bvsle from!3004 i!1382))))

(declare-fun b!692467 () Bool)

(declare-fun res!456713 () Bool)

(declare-fun e!393965 () Bool)

(assert (=> b!692467 (=> (not res!456713) (not e!393965))))

(declare-fun lt!316595 () List!13125)

(declare-fun noDuplicate!949 (List!13125) Bool)

(assert (=> b!692467 (= res!456713 (noDuplicate!949 lt!316595))))

(declare-fun res!456709 () Bool)

(assert (=> start!61858 (=> (not res!456709) (not e!393962))))

(assert (=> start!61858 (= res!456709 (and (bvslt (size!19469 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19469 a!3626))))))

(assert (=> start!61858 e!393962))

(assert (=> start!61858 true))

(declare-fun array_inv!14880 (array!39834) Bool)

(assert (=> start!61858 (array_inv!14880 a!3626)))

(declare-fun b!692468 () Bool)

(declare-datatypes ((Unit!24454 0))(
  ( (Unit!24455) )
))
(declare-fun e!393961 () Unit!24454)

(declare-fun Unit!24456 () Unit!24454)

(assert (=> b!692468 (= e!393961 Unit!24456)))

(assert (=> b!692468 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316597 () Unit!24454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39834 (_ BitVec 64) (_ BitVec 32)) Unit!24454)

(assert (=> b!692468 (= lt!316597 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!692468 false))

(declare-fun b!692469 () Bool)

(declare-fun Unit!24457 () Unit!24454)

(assert (=> b!692469 (= e!393961 Unit!24457)))

(declare-fun b!692470 () Bool)

(declare-fun e!393963 () Bool)

(assert (=> b!692470 (= e!393963 (contains!3702 lt!316595 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692471 () Bool)

(declare-fun e!393969 () Bool)

(assert (=> b!692471 (= e!393962 e!393969)))

(declare-fun res!456705 () Bool)

(assert (=> b!692471 (=> (not res!456705) (not e!393969))))

(assert (=> b!692471 (= res!456705 (not (= (select (arr!19084 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316596 () Unit!24454)

(assert (=> b!692471 (= lt!316596 e!393961)))

(declare-fun c!78248 () Bool)

(assert (=> b!692471 (= c!78248 (= (select (arr!19084 a!3626) from!3004) k0!2843))))

(declare-fun b!692472 () Bool)

(assert (=> b!692472 (= e!393969 e!393965)))

(declare-fun res!456699 () Bool)

(assert (=> b!692472 (=> (not res!456699) (not e!393965))))

(assert (=> b!692472 (= res!456699 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!414 (List!13125 (_ BitVec 64)) List!13125)

(assert (=> b!692472 (= lt!316595 ($colon$colon!414 acc!681 (select (arr!19084 a!3626) from!3004)))))

(declare-fun b!692473 () Bool)

(assert (=> b!692473 (= e!393966 (not (contains!3702 acc!681 k0!2843)))))

(declare-fun b!692474 () Bool)

(declare-fun res!456711 () Bool)

(assert (=> b!692474 (=> (not res!456711) (not e!393962))))

(assert (=> b!692474 (= res!456711 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19469 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692475 () Bool)

(declare-fun res!456714 () Bool)

(assert (=> b!692475 (=> (not res!456714) (not e!393962))))

(declare-fun arrayNoDuplicates!0 (array!39834 (_ BitVec 32) List!13125) Bool)

(assert (=> b!692475 (= res!456714 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692476 () Bool)

(declare-fun res!456706 () Bool)

(assert (=> b!692476 (=> (not res!456706) (not e!393962))))

(assert (=> b!692476 (= res!456706 (validKeyInArray!0 k0!2843))))

(declare-fun b!692477 () Bool)

(assert (=> b!692477 (= e!393965 e!393963)))

(declare-fun res!456704 () Bool)

(assert (=> b!692477 (=> res!456704 e!393963)))

(assert (=> b!692477 (= res!456704 (contains!3702 lt!316595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692478 () Bool)

(declare-fun res!456707 () Bool)

(assert (=> b!692478 (=> (not res!456707) (not e!393962))))

(assert (=> b!692478 (= res!456707 e!393964)))

(declare-fun res!456698 () Bool)

(assert (=> b!692478 (=> res!456698 e!393964)))

(assert (=> b!692478 (= res!456698 e!393968)))

(declare-fun res!456710 () Bool)

(assert (=> b!692478 (=> (not res!456710) (not e!393968))))

(assert (=> b!692478 (= res!456710 (bvsgt from!3004 i!1382))))

(declare-fun b!692479 () Bool)

(declare-fun res!456703 () Bool)

(assert (=> b!692479 (=> (not res!456703) (not e!393962))))

(assert (=> b!692479 (= res!456703 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13122))))

(declare-fun b!692480 () Bool)

(declare-fun res!456702 () Bool)

(assert (=> b!692480 (=> (not res!456702) (not e!393962))))

(assert (=> b!692480 (= res!456702 (noDuplicate!949 acc!681))))

(assert (= (and start!61858 res!456709) b!692480))

(assert (= (and b!692480 res!456702) b!692464))

(assert (= (and b!692464 res!456715) b!692463))

(assert (= (and b!692463 res!456700) b!692478))

(assert (= (and b!692478 res!456710) b!692460))

(assert (= (and b!692478 (not res!456698)) b!692466))

(assert (= (and b!692466 res!456708) b!692473))

(assert (= (and b!692478 res!456707) b!692479))

(assert (= (and b!692479 res!456703) b!692475))

(assert (= (and b!692475 res!456714) b!692461))

(assert (= (and b!692461 res!456701) b!692476))

(assert (= (and b!692476 res!456706) b!692465))

(assert (= (and b!692465 res!456712) b!692474))

(assert (= (and b!692474 res!456711) b!692462))

(assert (= (and b!692462 res!456716) b!692471))

(assert (= (and b!692471 c!78248) b!692468))

(assert (= (and b!692471 (not c!78248)) b!692469))

(assert (= (and b!692471 res!456705) b!692472))

(assert (= (and b!692472 res!456699) b!692467))

(assert (= (and b!692467 res!456713) b!692477))

(assert (= (and b!692477 (not res!456704)) b!692470))

(declare-fun m!655041 () Bool)

(assert (=> b!692479 m!655041))

(declare-fun m!655043 () Bool)

(assert (=> b!692473 m!655043))

(declare-fun m!655045 () Bool)

(assert (=> b!692471 m!655045))

(declare-fun m!655047 () Bool)

(assert (=> b!692476 m!655047))

(declare-fun m!655049 () Bool)

(assert (=> b!692465 m!655049))

(declare-fun m!655051 () Bool)

(assert (=> b!692470 m!655051))

(declare-fun m!655053 () Bool)

(assert (=> b!692463 m!655053))

(assert (=> b!692472 m!655045))

(assert (=> b!692472 m!655045))

(declare-fun m!655055 () Bool)

(assert (=> b!692472 m!655055))

(declare-fun m!655057 () Bool)

(assert (=> b!692475 m!655057))

(declare-fun m!655059 () Bool)

(assert (=> b!692477 m!655059))

(declare-fun m!655061 () Bool)

(assert (=> b!692464 m!655061))

(declare-fun m!655063 () Bool)

(assert (=> b!692468 m!655063))

(declare-fun m!655065 () Bool)

(assert (=> b!692468 m!655065))

(declare-fun m!655067 () Bool)

(assert (=> b!692480 m!655067))

(assert (=> b!692460 m!655043))

(assert (=> b!692462 m!655045))

(assert (=> b!692462 m!655045))

(declare-fun m!655069 () Bool)

(assert (=> b!692462 m!655069))

(declare-fun m!655071 () Bool)

(assert (=> start!61858 m!655071))

(declare-fun m!655073 () Bool)

(assert (=> b!692467 m!655073))

(check-sat (not b!692465) (not b!692470) (not b!692467) (not b!692472) (not b!692475) (not b!692476) (not b!692464) (not b!692460) (not b!692480) (not b!692462) (not start!61858) (not b!692473) (not b!692468) (not b!692477) (not b!692479) (not b!692463))
(check-sat)
(get-model)

(declare-fun d!95609 () Bool)

(declare-fun lt!316609 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!312 (List!13125) (InoxSet (_ BitVec 64)))

(assert (=> d!95609 (= lt!316609 (select (content!312 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394001 () Bool)

(assert (=> d!95609 (= lt!316609 e!394001)))

(declare-fun res!456779 () Bool)

(assert (=> d!95609 (=> (not res!456779) (not e!394001))))

(get-info :version)

(assert (=> d!95609 (= res!456779 ((_ is Cons!13121) acc!681))))

(assert (=> d!95609 (= (contains!3702 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316609)))

(declare-fun b!692548 () Bool)

(declare-fun e!394002 () Bool)

(assert (=> b!692548 (= e!394001 e!394002)))

(declare-fun res!456778 () Bool)

(assert (=> b!692548 (=> res!456778 e!394002)))

(assert (=> b!692548 (= res!456778 (= (h!14166 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692549 () Bool)

(assert (=> b!692549 (= e!394002 (contains!3702 (t!19395 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95609 res!456779) b!692548))

(assert (= (and b!692548 (not res!456778)) b!692549))

(declare-fun m!655109 () Bool)

(assert (=> d!95609 m!655109))

(declare-fun m!655111 () Bool)

(assert (=> d!95609 m!655111))

(declare-fun m!655113 () Bool)

(assert (=> b!692549 m!655113))

(assert (=> b!692464 d!95609))

(declare-fun c!78254 () Bool)

(declare-fun call!34241 () Bool)

(declare-fun bm!34238 () Bool)

(assert (=> bm!34238 (= call!34241 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78254 (Cons!13121 (select (arr!19084 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun e!394011 () Bool)

(declare-fun b!692560 () Bool)

(assert (=> b!692560 (= e!394011 (contains!3702 acc!681 (select (arr!19084 a!3626) from!3004)))))

(declare-fun b!692561 () Bool)

(declare-fun e!394013 () Bool)

(declare-fun e!394014 () Bool)

(assert (=> b!692561 (= e!394013 e!394014)))

(declare-fun res!456786 () Bool)

(assert (=> b!692561 (=> (not res!456786) (not e!394014))))

(assert (=> b!692561 (= res!456786 (not e!394011))))

(declare-fun res!456787 () Bool)

(assert (=> b!692561 (=> (not res!456787) (not e!394011))))

(assert (=> b!692561 (= res!456787 (validKeyInArray!0 (select (arr!19084 a!3626) from!3004)))))

(declare-fun b!692562 () Bool)

(declare-fun e!394012 () Bool)

(assert (=> b!692562 (= e!394012 call!34241)))

(declare-fun d!95611 () Bool)

(declare-fun res!456788 () Bool)

(assert (=> d!95611 (=> res!456788 e!394013)))

(assert (=> d!95611 (= res!456788 (bvsge from!3004 (size!19469 a!3626)))))

(assert (=> d!95611 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394013)))

(declare-fun b!692563 () Bool)

(assert (=> b!692563 (= e!394012 call!34241)))

(declare-fun b!692564 () Bool)

(assert (=> b!692564 (= e!394014 e!394012)))

(assert (=> b!692564 (= c!78254 (validKeyInArray!0 (select (arr!19084 a!3626) from!3004)))))

(assert (= (and d!95611 (not res!456788)) b!692561))

(assert (= (and b!692561 res!456787) b!692560))

(assert (= (and b!692561 res!456786) b!692564))

(assert (= (and b!692564 c!78254) b!692563))

(assert (= (and b!692564 (not c!78254)) b!692562))

(assert (= (or b!692563 b!692562) bm!34238))

(assert (=> bm!34238 m!655045))

(declare-fun m!655115 () Bool)

(assert (=> bm!34238 m!655115))

(assert (=> b!692560 m!655045))

(assert (=> b!692560 m!655045))

(declare-fun m!655117 () Bool)

(assert (=> b!692560 m!655117))

(assert (=> b!692561 m!655045))

(assert (=> b!692561 m!655045))

(assert (=> b!692561 m!655069))

(assert (=> b!692564 m!655045))

(assert (=> b!692564 m!655045))

(assert (=> b!692564 m!655069))

(assert (=> b!692475 d!95611))

(declare-fun d!95613 () Bool)

(declare-fun res!456793 () Bool)

(declare-fun e!394019 () Bool)

(assert (=> d!95613 (=> res!456793 e!394019)))

(assert (=> d!95613 (= res!456793 (= (select (arr!19084 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95613 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!394019)))

(declare-fun b!692569 () Bool)

(declare-fun e!394020 () Bool)

(assert (=> b!692569 (= e!394019 e!394020)))

(declare-fun res!456794 () Bool)

(assert (=> b!692569 (=> (not res!456794) (not e!394020))))

(assert (=> b!692569 (= res!456794 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19469 a!3626)))))

(declare-fun b!692570 () Bool)

(assert (=> b!692570 (= e!394020 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95613 (not res!456793)) b!692569))

(assert (= (and b!692569 res!456794) b!692570))

(declare-fun m!655119 () Bool)

(assert (=> d!95613 m!655119))

(declare-fun m!655121 () Bool)

(assert (=> b!692570 m!655121))

(assert (=> b!692465 d!95613))

(declare-fun d!95617 () Bool)

(assert (=> d!95617 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692476 d!95617))

(declare-fun d!95621 () Bool)

(declare-fun lt!316610 () Bool)

(assert (=> d!95621 (= lt!316610 (select (content!312 lt!316595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394021 () Bool)

(assert (=> d!95621 (= lt!316610 e!394021)))

(declare-fun res!456796 () Bool)

(assert (=> d!95621 (=> (not res!456796) (not e!394021))))

(assert (=> d!95621 (= res!456796 ((_ is Cons!13121) lt!316595))))

(assert (=> d!95621 (= (contains!3702 lt!316595 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316610)))

(declare-fun b!692571 () Bool)

(declare-fun e!394022 () Bool)

(assert (=> b!692571 (= e!394021 e!394022)))

(declare-fun res!456795 () Bool)

(assert (=> b!692571 (=> res!456795 e!394022)))

(assert (=> b!692571 (= res!456795 (= (h!14166 lt!316595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692572 () Bool)

(assert (=> b!692572 (= e!394022 (contains!3702 (t!19395 lt!316595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95621 res!456796) b!692571))

(assert (= (and b!692571 (not res!456795)) b!692572))

(declare-fun m!655123 () Bool)

(assert (=> d!95621 m!655123))

(declare-fun m!655125 () Bool)

(assert (=> d!95621 m!655125))

(declare-fun m!655127 () Bool)

(assert (=> b!692572 m!655127))

(assert (=> b!692477 d!95621))

(declare-fun d!95625 () Bool)

(declare-fun res!456811 () Bool)

(declare-fun e!394039 () Bool)

(assert (=> d!95625 (=> res!456811 e!394039)))

(assert (=> d!95625 (= res!456811 ((_ is Nil!13122) lt!316595))))

(assert (=> d!95625 (= (noDuplicate!949 lt!316595) e!394039)))

(declare-fun b!692591 () Bool)

(declare-fun e!394040 () Bool)

(assert (=> b!692591 (= e!394039 e!394040)))

(declare-fun res!456812 () Bool)

(assert (=> b!692591 (=> (not res!456812) (not e!394040))))

(assert (=> b!692591 (= res!456812 (not (contains!3702 (t!19395 lt!316595) (h!14166 lt!316595))))))

(declare-fun b!692592 () Bool)

(assert (=> b!692592 (= e!394040 (noDuplicate!949 (t!19395 lt!316595)))))

(assert (= (and d!95625 (not res!456811)) b!692591))

(assert (= (and b!692591 res!456812) b!692592))

(declare-fun m!655129 () Bool)

(assert (=> b!692591 m!655129))

(declare-fun m!655131 () Bool)

(assert (=> b!692592 m!655131))

(assert (=> b!692467 d!95625))

(declare-fun d!95627 () Bool)

(declare-fun res!456813 () Bool)

(declare-fun e!394041 () Bool)

(assert (=> d!95627 (=> res!456813 e!394041)))

(assert (=> d!95627 (= res!456813 (= (select (arr!19084 a!3626) from!3004) k0!2843))))

(assert (=> d!95627 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!394041)))

(declare-fun b!692593 () Bool)

(declare-fun e!394042 () Bool)

(assert (=> b!692593 (= e!394041 e!394042)))

(declare-fun res!456814 () Bool)

(assert (=> b!692593 (=> (not res!456814) (not e!394042))))

(assert (=> b!692593 (= res!456814 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19469 a!3626)))))

(declare-fun b!692594 () Bool)

(assert (=> b!692594 (= e!394042 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95627 (not res!456813)) b!692593))

(assert (= (and b!692593 res!456814) b!692594))

(assert (=> d!95627 m!655045))

(declare-fun m!655133 () Bool)

(assert (=> b!692594 m!655133))

(assert (=> b!692468 d!95627))

(declare-fun d!95629 () Bool)

(assert (=> d!95629 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316617 () Unit!24454)

(declare-fun choose!13 (array!39834 (_ BitVec 64) (_ BitVec 32)) Unit!24454)

(assert (=> d!95629 (= lt!316617 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95629 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95629 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316617)))

(declare-fun bs!20269 () Bool)

(assert (= bs!20269 d!95629))

(assert (=> bs!20269 m!655049))

(declare-fun m!655147 () Bool)

(assert (=> bs!20269 m!655147))

(assert (=> b!692468 d!95629))

(declare-fun bm!34242 () Bool)

(declare-fun call!34245 () Bool)

(declare-fun c!78258 () Bool)

(assert (=> bm!34242 (= call!34245 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78258 (Cons!13121 (select (arr!19084 a!3626) #b00000000000000000000000000000000) Nil!13122) Nil!13122)))))

(declare-fun b!692606 () Bool)

(declare-fun e!394053 () Bool)

(assert (=> b!692606 (= e!394053 (contains!3702 Nil!13122 (select (arr!19084 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692607 () Bool)

(declare-fun e!394055 () Bool)

(declare-fun e!394056 () Bool)

(assert (=> b!692607 (= e!394055 e!394056)))

(declare-fun res!456824 () Bool)

(assert (=> b!692607 (=> (not res!456824) (not e!394056))))

(assert (=> b!692607 (= res!456824 (not e!394053))))

(declare-fun res!456825 () Bool)

(assert (=> b!692607 (=> (not res!456825) (not e!394053))))

(assert (=> b!692607 (= res!456825 (validKeyInArray!0 (select (arr!19084 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692608 () Bool)

(declare-fun e!394054 () Bool)

(assert (=> b!692608 (= e!394054 call!34245)))

(declare-fun d!95635 () Bool)

(declare-fun res!456826 () Bool)

(assert (=> d!95635 (=> res!456826 e!394055)))

(assert (=> d!95635 (= res!456826 (bvsge #b00000000000000000000000000000000 (size!19469 a!3626)))))

(assert (=> d!95635 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13122) e!394055)))

(declare-fun b!692609 () Bool)

(assert (=> b!692609 (= e!394054 call!34245)))

(declare-fun b!692610 () Bool)

(assert (=> b!692610 (= e!394056 e!394054)))

(assert (=> b!692610 (= c!78258 (validKeyInArray!0 (select (arr!19084 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95635 (not res!456826)) b!692607))

(assert (= (and b!692607 res!456825) b!692606))

(assert (= (and b!692607 res!456824) b!692610))

(assert (= (and b!692610 c!78258) b!692609))

(assert (= (and b!692610 (not c!78258)) b!692608))

(assert (= (or b!692609 b!692608) bm!34242))

(assert (=> bm!34242 m!655119))

(declare-fun m!655153 () Bool)

(assert (=> bm!34242 m!655153))

(assert (=> b!692606 m!655119))

(assert (=> b!692606 m!655119))

(declare-fun m!655155 () Bool)

(assert (=> b!692606 m!655155))

(assert (=> b!692607 m!655119))

(assert (=> b!692607 m!655119))

(declare-fun m!655157 () Bool)

(assert (=> b!692607 m!655157))

(assert (=> b!692610 m!655119))

(assert (=> b!692610 m!655119))

(assert (=> b!692610 m!655157))

(assert (=> b!692479 d!95635))

(declare-fun d!95639 () Bool)

(declare-fun res!456829 () Bool)

(declare-fun e!394059 () Bool)

(assert (=> d!95639 (=> res!456829 e!394059)))

(assert (=> d!95639 (= res!456829 ((_ is Nil!13122) acc!681))))

(assert (=> d!95639 (= (noDuplicate!949 acc!681) e!394059)))

(declare-fun b!692613 () Bool)

(declare-fun e!394060 () Bool)

(assert (=> b!692613 (= e!394059 e!394060)))

(declare-fun res!456830 () Bool)

(assert (=> b!692613 (=> (not res!456830) (not e!394060))))

(assert (=> b!692613 (= res!456830 (not (contains!3702 (t!19395 acc!681) (h!14166 acc!681))))))

(declare-fun b!692614 () Bool)

(assert (=> b!692614 (= e!394060 (noDuplicate!949 (t!19395 acc!681)))))

(assert (= (and d!95639 (not res!456829)) b!692613))

(assert (= (and b!692613 res!456830) b!692614))

(declare-fun m!655159 () Bool)

(assert (=> b!692613 m!655159))

(declare-fun m!655161 () Bool)

(assert (=> b!692614 m!655161))

(assert (=> b!692480 d!95639))

(declare-fun d!95641 () Bool)

(declare-fun lt!316618 () Bool)

(assert (=> d!95641 (= lt!316618 (select (content!312 lt!316595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394063 () Bool)

(assert (=> d!95641 (= lt!316618 e!394063)))

(declare-fun res!456834 () Bool)

(assert (=> d!95641 (=> (not res!456834) (not e!394063))))

(assert (=> d!95641 (= res!456834 ((_ is Cons!13121) lt!316595))))

(assert (=> d!95641 (= (contains!3702 lt!316595 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316618)))

(declare-fun b!692617 () Bool)

(declare-fun e!394064 () Bool)

(assert (=> b!692617 (= e!394063 e!394064)))

(declare-fun res!456833 () Bool)

(assert (=> b!692617 (=> res!456833 e!394064)))

(assert (=> b!692617 (= res!456833 (= (h!14166 lt!316595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692618 () Bool)

(assert (=> b!692618 (= e!394064 (contains!3702 (t!19395 lt!316595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95641 res!456834) b!692617))

(assert (= (and b!692617 (not res!456833)) b!692618))

(assert (=> d!95641 m!655123))

(declare-fun m!655167 () Bool)

(assert (=> d!95641 m!655167))

(declare-fun m!655169 () Bool)

(assert (=> b!692618 m!655169))

(assert (=> b!692470 d!95641))

(declare-fun d!95645 () Bool)

(assert (=> d!95645 (= (array_inv!14880 a!3626) (bvsge (size!19469 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61858 d!95645))

(declare-fun d!95647 () Bool)

(declare-fun lt!316619 () Bool)

(assert (=> d!95647 (= lt!316619 (select (content!312 acc!681) k0!2843))))

(declare-fun e!394065 () Bool)

(assert (=> d!95647 (= lt!316619 e!394065)))

(declare-fun res!456836 () Bool)

(assert (=> d!95647 (=> (not res!456836) (not e!394065))))

(assert (=> d!95647 (= res!456836 ((_ is Cons!13121) acc!681))))

(assert (=> d!95647 (= (contains!3702 acc!681 k0!2843) lt!316619)))

(declare-fun b!692619 () Bool)

(declare-fun e!394066 () Bool)

(assert (=> b!692619 (= e!394065 e!394066)))

(declare-fun res!456835 () Bool)

(assert (=> b!692619 (=> res!456835 e!394066)))

(assert (=> b!692619 (= res!456835 (= (h!14166 acc!681) k0!2843))))

(declare-fun b!692620 () Bool)

(assert (=> b!692620 (= e!394066 (contains!3702 (t!19395 acc!681) k0!2843))))

(assert (= (and d!95647 res!456836) b!692619))

(assert (= (and b!692619 (not res!456835)) b!692620))

(assert (=> d!95647 m!655109))

(declare-fun m!655171 () Bool)

(assert (=> d!95647 m!655171))

(declare-fun m!655173 () Bool)

(assert (=> b!692620 m!655173))

(assert (=> b!692460 d!95647))

(declare-fun d!95651 () Bool)

(assert (=> d!95651 (= ($colon$colon!414 acc!681 (select (arr!19084 a!3626) from!3004)) (Cons!13121 (select (arr!19084 a!3626) from!3004) acc!681))))

(assert (=> b!692472 d!95651))

(declare-fun d!95653 () Bool)

(assert (=> d!95653 (= (validKeyInArray!0 (select (arr!19084 a!3626) from!3004)) (and (not (= (select (arr!19084 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19084 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692462 d!95653))

(assert (=> b!692473 d!95647))

(declare-fun d!95655 () Bool)

(declare-fun lt!316622 () Bool)

(assert (=> d!95655 (= lt!316622 (select (content!312 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394071 () Bool)

(assert (=> d!95655 (= lt!316622 e!394071)))

(declare-fun res!456842 () Bool)

(assert (=> d!95655 (=> (not res!456842) (not e!394071))))

(assert (=> d!95655 (= res!456842 ((_ is Cons!13121) acc!681))))

(assert (=> d!95655 (= (contains!3702 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316622)))

(declare-fun b!692625 () Bool)

(declare-fun e!394072 () Bool)

(assert (=> b!692625 (= e!394071 e!394072)))

(declare-fun res!456841 () Bool)

(assert (=> b!692625 (=> res!456841 e!394072)))

(assert (=> b!692625 (= res!456841 (= (h!14166 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692626 () Bool)

(assert (=> b!692626 (= e!394072 (contains!3702 (t!19395 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95655 res!456842) b!692625))

(assert (= (and b!692625 (not res!456841)) b!692626))

(assert (=> d!95655 m!655109))

(declare-fun m!655175 () Bool)

(assert (=> d!95655 m!655175))

(declare-fun m!655177 () Bool)

(assert (=> b!692626 m!655177))

(assert (=> b!692463 d!95655))

(check-sat (not d!95609) (not b!692594) (not b!692564) (not b!692570) (not b!692561) (not b!692610) (not b!692560) (not d!95647) (not b!692549) (not b!692618) (not d!95629) (not d!95641) (not b!692614) (not d!95655) (not bm!34242) (not b!692613) (not d!95621) (not b!692620) (not b!692606) (not b!692592) (not b!692572) (not b!692591) (not bm!34238) (not b!692626) (not b!692607))
(check-sat)
