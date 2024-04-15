; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59996 () Bool)

(assert start!59996)

(declare-fun b!666582 () Bool)

(declare-fun res!434059 () Bool)

(declare-fun e!381632 () Bool)

(assert (=> b!666582 (=> res!434059 e!381632)))

(declare-fun lt!310345 () Bool)

(assert (=> b!666582 (= res!434059 lt!310345)))

(declare-fun b!666583 () Bool)

(declare-fun e!381633 () Bool)

(declare-datatypes ((List!12799 0))(
  ( (Nil!12796) (Cons!12795 (h!13840 (_ BitVec 64)) (t!19018 List!12799)) )
))
(declare-fun acc!681 () List!12799)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3321 (List!12799 (_ BitVec 64)) Bool)

(assert (=> b!666583 (= e!381633 (not (contains!3321 acc!681 k0!2843)))))

(declare-fun b!666584 () Bool)

(declare-fun res!434060 () Bool)

(declare-fun e!381628 () Bool)

(assert (=> b!666584 (=> (not res!434060) (not e!381628))))

(declare-datatypes ((array!39054 0))(
  ( (array!39055 (arr!18719 (Array (_ BitVec 32) (_ BitVec 64))) (size!19084 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39054)

(declare-fun arrayContainsKey!0 (array!39054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666584 (= res!434060 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666585 () Bool)

(declare-fun res!434042 () Bool)

(assert (=> b!666585 (=> (not res!434042) (not e!381628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666585 (= res!434042 (validKeyInArray!0 k0!2843))))

(declare-fun b!666586 () Bool)

(assert (=> b!666586 (= e!381632 true)))

(declare-fun lt!310347 () Bool)

(declare-fun lt!310342 () List!12799)

(assert (=> b!666586 (= lt!310347 (contains!3321 lt!310342 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666587 () Bool)

(declare-fun res!434043 () Bool)

(assert (=> b!666587 (=> (not res!434043) (not e!381628))))

(declare-fun arrayNoDuplicates!0 (array!39054 (_ BitVec 32) List!12799) Bool)

(assert (=> b!666587 (= res!434043 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12796))))

(declare-fun b!666588 () Bool)

(declare-fun res!434056 () Bool)

(assert (=> b!666588 (=> res!434056 e!381632)))

(assert (=> b!666588 (= res!434056 (contains!3321 acc!681 k0!2843))))

(declare-fun b!666589 () Bool)

(declare-fun res!434053 () Bool)

(assert (=> b!666589 (=> (not res!434053) (not e!381628))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!666589 (= res!434053 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666590 () Bool)

(declare-fun res!434054 () Bool)

(assert (=> b!666590 (=> (not res!434054) (not e!381628))))

(declare-fun e!381634 () Bool)

(assert (=> b!666590 (= res!434054 e!381634)))

(declare-fun res!434051 () Bool)

(assert (=> b!666590 (=> res!434051 e!381634)))

(declare-fun e!381630 () Bool)

(assert (=> b!666590 (= res!434051 e!381630)))

(declare-fun res!434050 () Bool)

(assert (=> b!666590 (=> (not res!434050) (not e!381630))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666590 (= res!434050 (bvsgt from!3004 i!1382))))

(declare-fun b!666591 () Bool)

(declare-datatypes ((Unit!23303 0))(
  ( (Unit!23304) )
))
(declare-fun e!381635 () Unit!23303)

(declare-fun Unit!23305 () Unit!23303)

(assert (=> b!666591 (= e!381635 Unit!23305)))

(declare-fun b!666592 () Bool)

(assert (=> b!666592 (= e!381630 (contains!3321 acc!681 k0!2843))))

(declare-fun b!666593 () Bool)

(declare-fun res!434062 () Bool)

(assert (=> b!666593 (=> (not res!434062) (not e!381628))))

(assert (=> b!666593 (= res!434062 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19084 a!3626))))))

(declare-fun b!666594 () Bool)

(declare-fun res!434048 () Bool)

(assert (=> b!666594 (=> res!434048 e!381632)))

(declare-fun subseq!77 (List!12799 List!12799) Bool)

(assert (=> b!666594 (= res!434048 (not (subseq!77 acc!681 lt!310342)))))

(declare-fun b!666595 () Bool)

(declare-fun res!434045 () Bool)

(assert (=> b!666595 (=> res!434045 e!381632)))

(assert (=> b!666595 (= res!434045 (contains!3321 lt!310342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666596 () Bool)

(declare-fun res!434061 () Bool)

(assert (=> b!666596 (=> res!434061 e!381632)))

(assert (=> b!666596 (= res!434061 (not (contains!3321 lt!310342 k0!2843)))))

(declare-fun b!666597 () Bool)

(declare-fun res!434052 () Bool)

(assert (=> b!666597 (=> (not res!434052) (not e!381628))))

(assert (=> b!666597 (= res!434052 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19084 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!434046 () Bool)

(assert (=> start!59996 (=> (not res!434046) (not e!381628))))

(assert (=> start!59996 (= res!434046 (and (bvslt (size!19084 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19084 a!3626))))))

(assert (=> start!59996 e!381628))

(assert (=> start!59996 true))

(declare-fun array_inv!14602 (array!39054) Bool)

(assert (=> start!59996 (array_inv!14602 a!3626)))

(declare-fun b!666598 () Bool)

(declare-fun lt!310338 () Unit!23303)

(assert (=> b!666598 (= e!381635 lt!310338)))

(declare-fun lt!310339 () Unit!23303)

(declare-fun lemmaListSubSeqRefl!0 (List!12799) Unit!23303)

(assert (=> b!666598 (= lt!310339 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666598 (subseq!77 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39054 List!12799 List!12799 (_ BitVec 32)) Unit!23303)

(declare-fun $colon$colon!208 (List!12799 (_ BitVec 64)) List!12799)

(assert (=> b!666598 (= lt!310338 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!208 acc!681 (select (arr!18719 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666598 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666599 () Bool)

(declare-fun e!381631 () Unit!23303)

(declare-fun Unit!23306 () Unit!23303)

(assert (=> b!666599 (= e!381631 Unit!23306)))

(declare-fun lt!310346 () Unit!23303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39054 (_ BitVec 64) (_ BitVec 32)) Unit!23303)

(assert (=> b!666599 (= lt!310346 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666599 false))

(declare-fun b!666600 () Bool)

(declare-fun res!434049 () Bool)

(assert (=> b!666600 (=> (not res!434049) (not e!381628))))

(assert (=> b!666600 (= res!434049 (not (contains!3321 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666601 () Bool)

(declare-fun Unit!23307 () Unit!23303)

(assert (=> b!666601 (= e!381631 Unit!23307)))

(declare-fun b!666602 () Bool)

(assert (=> b!666602 (= e!381634 e!381633)))

(declare-fun res!434058 () Bool)

(assert (=> b!666602 (=> (not res!434058) (not e!381633))))

(assert (=> b!666602 (= res!434058 (bvsle from!3004 i!1382))))

(declare-fun b!666603 () Bool)

(declare-fun res!434055 () Bool)

(assert (=> b!666603 (=> res!434055 e!381632)))

(declare-fun noDuplicate!590 (List!12799) Bool)

(assert (=> b!666603 (= res!434055 (not (noDuplicate!590 lt!310342)))))

(declare-fun b!666604 () Bool)

(assert (=> b!666604 (= e!381628 (not e!381632))))

(declare-fun res!434044 () Bool)

(assert (=> b!666604 (=> res!434044 e!381632)))

(assert (=> b!666604 (= res!434044 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!75 (List!12799 (_ BitVec 64)) List!12799)

(assert (=> b!666604 (= (-!75 lt!310342 k0!2843) acc!681)))

(assert (=> b!666604 (= lt!310342 ($colon$colon!208 acc!681 k0!2843))))

(declare-fun lt!310344 () Unit!23303)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12799) Unit!23303)

(assert (=> b!666604 (= lt!310344 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!666604 (subseq!77 acc!681 acc!681)))

(declare-fun lt!310340 () Unit!23303)

(assert (=> b!666604 (= lt!310340 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666604 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310343 () Unit!23303)

(assert (=> b!666604 (= lt!310343 e!381635)))

(declare-fun c!76638 () Bool)

(assert (=> b!666604 (= c!76638 (validKeyInArray!0 (select (arr!18719 a!3626) from!3004)))))

(declare-fun lt!310341 () Unit!23303)

(assert (=> b!666604 (= lt!310341 e!381631)))

(declare-fun c!76637 () Bool)

(assert (=> b!666604 (= c!76637 lt!310345)))

(assert (=> b!666604 (= lt!310345 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666604 (arrayContainsKey!0 (array!39055 (store (arr!18719 a!3626) i!1382 k0!2843) (size!19084 a!3626)) k0!2843 from!3004)))

(declare-fun b!666605 () Bool)

(declare-fun res!434047 () Bool)

(assert (=> b!666605 (=> (not res!434047) (not e!381628))))

(assert (=> b!666605 (= res!434047 (noDuplicate!590 acc!681))))

(declare-fun b!666606 () Bool)

(declare-fun res!434057 () Bool)

(assert (=> b!666606 (=> (not res!434057) (not e!381628))))

(assert (=> b!666606 (= res!434057 (not (contains!3321 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59996 res!434046) b!666605))

(assert (= (and b!666605 res!434047) b!666600))

(assert (= (and b!666600 res!434049) b!666606))

(assert (= (and b!666606 res!434057) b!666590))

(assert (= (and b!666590 res!434050) b!666592))

(assert (= (and b!666590 (not res!434051)) b!666602))

(assert (= (and b!666602 res!434058) b!666583))

(assert (= (and b!666590 res!434054) b!666587))

(assert (= (and b!666587 res!434043) b!666589))

(assert (= (and b!666589 res!434053) b!666593))

(assert (= (and b!666593 res!434062) b!666585))

(assert (= (and b!666585 res!434042) b!666584))

(assert (= (and b!666584 res!434060) b!666597))

(assert (= (and b!666597 res!434052) b!666604))

(assert (= (and b!666604 c!76637) b!666599))

(assert (= (and b!666604 (not c!76637)) b!666601))

(assert (= (and b!666604 c!76638) b!666598))

(assert (= (and b!666604 (not c!76638)) b!666591))

(assert (= (and b!666604 (not res!434044)) b!666603))

(assert (= (and b!666603 (not res!434055)) b!666582))

(assert (= (and b!666582 (not res!434059)) b!666588))

(assert (= (and b!666588 (not res!434056)) b!666594))

(assert (= (and b!666594 (not res!434048)) b!666596))

(assert (= (and b!666596 (not res!434061)) b!666595))

(assert (= (and b!666595 (not res!434045)) b!666586))

(declare-fun m!636783 () Bool)

(assert (=> b!666600 m!636783))

(declare-fun m!636785 () Bool)

(assert (=> b!666588 m!636785))

(assert (=> b!666583 m!636785))

(declare-fun m!636787 () Bool)

(assert (=> b!666606 m!636787))

(declare-fun m!636789 () Bool)

(assert (=> b!666584 m!636789))

(declare-fun m!636791 () Bool)

(assert (=> b!666586 m!636791))

(declare-fun m!636793 () Bool)

(assert (=> b!666604 m!636793))

(declare-fun m!636795 () Bool)

(assert (=> b!666604 m!636795))

(declare-fun m!636797 () Bool)

(assert (=> b!666604 m!636797))

(declare-fun m!636799 () Bool)

(assert (=> b!666604 m!636799))

(declare-fun m!636801 () Bool)

(assert (=> b!666604 m!636801))

(declare-fun m!636803 () Bool)

(assert (=> b!666604 m!636803))

(assert (=> b!666604 m!636795))

(declare-fun m!636805 () Bool)

(assert (=> b!666604 m!636805))

(declare-fun m!636807 () Bool)

(assert (=> b!666604 m!636807))

(declare-fun m!636809 () Bool)

(assert (=> b!666604 m!636809))

(declare-fun m!636811 () Bool)

(assert (=> b!666604 m!636811))

(declare-fun m!636813 () Bool)

(assert (=> b!666604 m!636813))

(declare-fun m!636815 () Bool)

(assert (=> b!666605 m!636815))

(declare-fun m!636817 () Bool)

(assert (=> b!666596 m!636817))

(declare-fun m!636819 () Bool)

(assert (=> b!666585 m!636819))

(declare-fun m!636821 () Bool)

(assert (=> start!59996 m!636821))

(declare-fun m!636823 () Bool)

(assert (=> b!666594 m!636823))

(declare-fun m!636825 () Bool)

(assert (=> b!666603 m!636825))

(declare-fun m!636827 () Bool)

(assert (=> b!666587 m!636827))

(declare-fun m!636829 () Bool)

(assert (=> b!666599 m!636829))

(assert (=> b!666598 m!636793))

(assert (=> b!666598 m!636795))

(declare-fun m!636831 () Bool)

(assert (=> b!666598 m!636831))

(declare-fun m!636833 () Bool)

(assert (=> b!666598 m!636833))

(assert (=> b!666598 m!636795))

(assert (=> b!666598 m!636831))

(assert (=> b!666598 m!636801))

(assert (=> b!666598 m!636813))

(assert (=> b!666592 m!636785))

(declare-fun m!636835 () Bool)

(assert (=> b!666595 m!636835))

(declare-fun m!636837 () Bool)

(assert (=> b!666589 m!636837))

(check-sat (not b!666600) (not b!666605) (not b!666594) (not b!666587) (not start!59996) (not b!666585) (not b!666592) (not b!666604) (not b!666588) (not b!666589) (not b!666584) (not b!666596) (not b!666595) (not b!666598) (not b!666583) (not b!666606) (not b!666599) (not b!666603) (not b!666586))
(check-sat)
