; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62444 () Bool)

(assert start!62444)

(declare-fun b!701634 () Bool)

(declare-fun res!465453 () Bool)

(declare-fun e!397418 () Bool)

(assert (=> b!701634 (=> (not res!465453) (not e!397418))))

(declare-datatypes ((array!40123 0))(
  ( (array!40124 (arr!19218 (Array (_ BitVec 32) (_ BitVec 64))) (size!19603 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40123)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13259 0))(
  ( (Nil!13256) (Cons!13255 (h!14300 (_ BitVec 64)) (t!19541 List!13259)) )
))
(declare-fun lt!317616 () List!13259)

(declare-fun arrayNoDuplicates!0 (array!40123 (_ BitVec 32) List!13259) Bool)

(assert (=> b!701634 (= res!465453 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317616))))

(declare-fun b!701635 () Bool)

(declare-fun res!465461 () Bool)

(assert (=> b!701635 (=> (not res!465461) (not e!397418))))

(declare-fun contains!3836 (List!13259 (_ BitVec 64)) Bool)

(assert (=> b!701635 (= res!465461 (not (contains!3836 lt!317616 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701636 () Bool)

(declare-fun res!465448 () Bool)

(declare-fun e!397419 () Bool)

(assert (=> b!701636 (=> (not res!465448) (not e!397419))))

(declare-fun acc!652 () List!13259)

(assert (=> b!701636 (= res!465448 (not (contains!3836 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701638 () Bool)

(declare-fun res!465454 () Bool)

(assert (=> b!701638 (=> (not res!465454) (not e!397419))))

(assert (=> b!701638 (= res!465454 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!701639 () Bool)

(declare-fun res!465449 () Bool)

(assert (=> b!701639 (=> (not res!465449) (not e!397419))))

(declare-fun noDuplicate!1083 (List!13259) Bool)

(assert (=> b!701639 (= res!465449 (noDuplicate!1083 acc!652))))

(declare-fun b!701640 () Bool)

(declare-fun res!465457 () Bool)

(assert (=> b!701640 (=> (not res!465457) (not e!397418))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!701640 (= res!465457 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!701641 () Bool)

(declare-fun res!465460 () Bool)

(assert (=> b!701641 (=> (not res!465460) (not e!397419))))

(assert (=> b!701641 (= res!465460 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!701642 () Bool)

(declare-fun res!465470 () Bool)

(assert (=> b!701642 (=> (not res!465470) (not e!397419))))

(declare-fun newAcc!49 () List!13259)

(assert (=> b!701642 (= res!465470 (noDuplicate!1083 newAcc!49))))

(declare-fun b!701643 () Bool)

(declare-fun res!465467 () Bool)

(assert (=> b!701643 (=> (not res!465467) (not e!397419))))

(assert (=> b!701643 (= res!465467 (not (contains!3836 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701644 () Bool)

(assert (=> b!701644 (= e!397419 e!397418)))

(declare-fun res!465445 () Bool)

(assert (=> b!701644 (=> (not res!465445) (not e!397418))))

(assert (=> b!701644 (= res!465445 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun lt!317614 () List!13259)

(declare-fun $colon$colon!479 (List!13259 (_ BitVec 64)) List!13259)

(assert (=> b!701644 (= lt!317614 ($colon$colon!479 newAcc!49 (select (arr!19218 a!3591) from!2969)))))

(assert (=> b!701644 (= lt!317616 ($colon$colon!479 acc!652 (select (arr!19218 a!3591) from!2969)))))

(declare-fun b!701645 () Bool)

(declare-fun res!465451 () Bool)

(assert (=> b!701645 (=> (not res!465451) (not e!397418))))

(assert (=> b!701645 (= res!465451 (noDuplicate!1083 lt!317614))))

(declare-fun b!701646 () Bool)

(declare-fun res!465444 () Bool)

(assert (=> b!701646 (=> (not res!465444) (not e!397419))))

(assert (=> b!701646 (= res!465444 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19603 a!3591)))))

(declare-fun b!701647 () Bool)

(declare-fun res!465450 () Bool)

(assert (=> b!701647 (=> (not res!465450) (not e!397419))))

(assert (=> b!701647 (= res!465450 (not (contains!3836 acc!652 k!2824)))))

(declare-fun b!701648 () Bool)

(declare-fun res!465464 () Bool)

(assert (=> b!701648 (=> (not res!465464) (not e!397419))))

(assert (=> b!701648 (= res!465464 (contains!3836 newAcc!49 k!2824))))

(declare-fun b!701649 () Bool)

(declare-fun res!465459 () Bool)

(assert (=> b!701649 (=> (not res!465459) (not e!397418))))

(declare-fun subseq!281 (List!13259 List!13259) Bool)

(assert (=> b!701649 (= res!465459 (subseq!281 lt!317616 lt!317614))))

(declare-fun b!701650 () Bool)

(declare-fun res!465452 () Bool)

(assert (=> b!701650 (=> (not res!465452) (not e!397419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!701650 (= res!465452 (validKeyInArray!0 k!2824))))

(declare-fun b!701651 () Bool)

(declare-fun res!465458 () Bool)

(assert (=> b!701651 (=> (not res!465458) (not e!397419))))

(assert (=> b!701651 (= res!465458 (not (contains!3836 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701652 () Bool)

(assert (=> b!701652 (= e!397418 false)))

(declare-fun lt!317615 () Bool)

(assert (=> b!701652 (= lt!317615 (contains!3836 lt!317614 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!701653 () Bool)

(declare-fun res!465471 () Bool)

(assert (=> b!701653 (=> (not res!465471) (not e!397418))))

(assert (=> b!701653 (= res!465471 (not (contains!3836 lt!317616 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701654 () Bool)

(declare-fun res!465468 () Bool)

(assert (=> b!701654 (=> (not res!465468) (not e!397419))))

(assert (=> b!701654 (= res!465468 (not (contains!3836 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!465463 () Bool)

(assert (=> start!62444 (=> (not res!465463) (not e!397419))))

(assert (=> start!62444 (= res!465463 (and (bvslt (size!19603 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19603 a!3591))))))

(assert (=> start!62444 e!397419))

(assert (=> start!62444 true))

(declare-fun array_inv!15014 (array!40123) Bool)

(assert (=> start!62444 (array_inv!15014 a!3591)))

(declare-fun b!701637 () Bool)

(declare-fun res!465456 () Bool)

(assert (=> b!701637 (=> (not res!465456) (not e!397418))))

(declare-fun -!246 (List!13259 (_ BitVec 64)) List!13259)

(assert (=> b!701637 (= res!465456 (= (-!246 lt!317614 k!2824) lt!317616))))

(declare-fun b!701655 () Bool)

(declare-fun res!465469 () Bool)

(assert (=> b!701655 (=> (not res!465469) (not e!397419))))

(assert (=> b!701655 (= res!465469 (= (-!246 newAcc!49 k!2824) acc!652))))

(declare-fun b!701656 () Bool)

(declare-fun res!465455 () Bool)

(assert (=> b!701656 (=> (not res!465455) (not e!397418))))

(assert (=> b!701656 (= res!465455 (not (contains!3836 lt!317614 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!701657 () Bool)

(declare-fun res!465462 () Bool)

(assert (=> b!701657 (=> (not res!465462) (not e!397419))))

(assert (=> b!701657 (= res!465462 (subseq!281 acc!652 newAcc!49))))

(declare-fun b!701658 () Bool)

(declare-fun res!465446 () Bool)

(assert (=> b!701658 (=> (not res!465446) (not e!397418))))

(assert (=> b!701658 (= res!465446 (contains!3836 lt!317614 k!2824))))

(declare-fun b!701659 () Bool)

(declare-fun res!465466 () Bool)

(assert (=> b!701659 (=> (not res!465466) (not e!397419))))

(assert (=> b!701659 (= res!465466 (validKeyInArray!0 (select (arr!19218 a!3591) from!2969)))))

(declare-fun b!701660 () Bool)

(declare-fun res!465447 () Bool)

(assert (=> b!701660 (=> (not res!465447) (not e!397418))))

(assert (=> b!701660 (= res!465447 (not (contains!3836 lt!317616 k!2824)))))

(declare-fun b!701661 () Bool)

(declare-fun res!465465 () Bool)

(assert (=> b!701661 (=> (not res!465465) (not e!397418))))

(assert (=> b!701661 (= res!465465 (noDuplicate!1083 lt!317616))))

(assert (= (and start!62444 res!465463) b!701639))

(assert (= (and b!701639 res!465449) b!701642))

(assert (= (and b!701642 res!465470) b!701636))

(assert (= (and b!701636 res!465448) b!701654))

(assert (= (and b!701654 res!465468) b!701641))

(assert (= (and b!701641 res!465460) b!701647))

(assert (= (and b!701647 res!465450) b!701650))

(assert (= (and b!701650 res!465452) b!701638))

(assert (= (and b!701638 res!465454) b!701657))

(assert (= (and b!701657 res!465462) b!701648))

(assert (= (and b!701648 res!465464) b!701655))

(assert (= (and b!701655 res!465469) b!701651))

(assert (= (and b!701651 res!465458) b!701643))

(assert (= (and b!701643 res!465467) b!701646))

(assert (= (and b!701646 res!465444) b!701659))

(assert (= (and b!701659 res!465466) b!701644))

(assert (= (and b!701644 res!465445) b!701661))

(assert (= (and b!701661 res!465465) b!701645))

(assert (= (and b!701645 res!465451) b!701653))

(assert (= (and b!701653 res!465471) b!701635))

(assert (= (and b!701635 res!465461) b!701640))

(assert (= (and b!701640 res!465457) b!701660))

(assert (= (and b!701660 res!465447) b!701634))

(assert (= (and b!701634 res!465453) b!701649))

(assert (= (and b!701649 res!465459) b!701658))

(assert (= (and b!701658 res!465446) b!701637))

(assert (= (and b!701637 res!465456) b!701656))

(assert (= (and b!701656 res!465455) b!701652))

(declare-fun m!660955 () Bool)

(assert (=> b!701634 m!660955))

(declare-fun m!660957 () Bool)

(assert (=> b!701657 m!660957))

(declare-fun m!660959 () Bool)

(assert (=> b!701640 m!660959))

(declare-fun m!660961 () Bool)

(assert (=> b!701638 m!660961))

(declare-fun m!660963 () Bool)

(assert (=> b!701661 m!660963))

(declare-fun m!660965 () Bool)

(assert (=> b!701645 m!660965))

(declare-fun m!660967 () Bool)

(assert (=> b!701650 m!660967))

(declare-fun m!660969 () Bool)

(assert (=> b!701642 m!660969))

(declare-fun m!660971 () Bool)

(assert (=> b!701636 m!660971))

(declare-fun m!660973 () Bool)

(assert (=> b!701641 m!660973))

(declare-fun m!660975 () Bool)

(assert (=> b!701639 m!660975))

(declare-fun m!660977 () Bool)

(assert (=> b!701649 m!660977))

(declare-fun m!660979 () Bool)

(assert (=> b!701651 m!660979))

(declare-fun m!660981 () Bool)

(assert (=> b!701656 m!660981))

(declare-fun m!660983 () Bool)

(assert (=> b!701654 m!660983))

(declare-fun m!660985 () Bool)

(assert (=> b!701658 m!660985))

(declare-fun m!660987 () Bool)

(assert (=> b!701647 m!660987))

(declare-fun m!660989 () Bool)

(assert (=> b!701643 m!660989))

(declare-fun m!660991 () Bool)

(assert (=> b!701644 m!660991))

(assert (=> b!701644 m!660991))

(declare-fun m!660993 () Bool)

(assert (=> b!701644 m!660993))

(assert (=> b!701644 m!660991))

(declare-fun m!660995 () Bool)

(assert (=> b!701644 m!660995))

(assert (=> b!701659 m!660991))

(assert (=> b!701659 m!660991))

(declare-fun m!660997 () Bool)

(assert (=> b!701659 m!660997))

(declare-fun m!660999 () Bool)

(assert (=> b!701635 m!660999))

(declare-fun m!661001 () Bool)

(assert (=> b!701652 m!661001))

(declare-fun m!661003 () Bool)

(assert (=> b!701660 m!661003))

(declare-fun m!661005 () Bool)

(assert (=> start!62444 m!661005))

(declare-fun m!661007 () Bool)

(assert (=> b!701655 m!661007))

(declare-fun m!661009 () Bool)

(assert (=> b!701648 m!661009))

(declare-fun m!661011 () Bool)

(assert (=> b!701637 m!661011))

(declare-fun m!661013 () Bool)

(assert (=> b!701653 m!661013))

(push 1)

