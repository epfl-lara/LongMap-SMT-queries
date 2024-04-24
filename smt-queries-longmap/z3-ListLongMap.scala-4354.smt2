; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60210 () Bool)

(assert start!60210)

(declare-fun b!671784 () Bool)

(declare-fun res!438382 () Bool)

(declare-fun e!383917 () Bool)

(assert (=> b!671784 (=> (not res!438382) (not e!383917))))

(declare-datatypes ((List!12735 0))(
  ( (Nil!12732) (Cons!12731 (h!13779 (_ BitVec 64)) (t!18955 List!12735)) )
))
(declare-fun lt!312278 () List!12735)

(declare-fun contains!3387 (List!12735 (_ BitVec 64)) Bool)

(assert (=> b!671784 (= res!438382 (not (contains!3387 lt!312278 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671785 () Bool)

(declare-fun res!438369 () Bool)

(declare-fun e!383918 () Bool)

(assert (=> b!671785 (=> (not res!438369) (not e!383918))))

(declare-fun acc!681 () List!12735)

(declare-fun noDuplicate!661 (List!12735) Bool)

(assert (=> b!671785 (= res!438369 (noDuplicate!661 acc!681))))

(declare-fun b!671786 () Bool)

(declare-fun res!438367 () Bool)

(assert (=> b!671786 (=> (not res!438367) (not e!383918))))

(declare-datatypes ((array!39195 0))(
  ( (array!39196 (arr!18787 (Array (_ BitVec 32) (_ BitVec 64))) (size!19151 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39195)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39195 (_ BitVec 32) List!12735) Bool)

(assert (=> b!671786 (= res!438367 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671787 () Bool)

(declare-fun res!438384 () Bool)

(assert (=> b!671787 (=> (not res!438384) (not e!383917))))

(assert (=> b!671787 (= res!438384 (noDuplicate!661 lt!312278))))

(declare-fun b!671788 () Bool)

(declare-fun e!383914 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!671788 (= e!383914 (contains!3387 acc!681 k0!2843))))

(declare-fun b!671789 () Bool)

(declare-fun e!383911 () Bool)

(assert (=> b!671789 (= e!383918 e!383911)))

(declare-fun res!438386 () Bool)

(assert (=> b!671789 (=> (not res!438386) (not e!383911))))

(assert (=> b!671789 (= res!438386 (not (= (select (arr!18787 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23559 0))(
  ( (Unit!23560) )
))
(declare-fun lt!312279 () Unit!23559)

(declare-fun e!383910 () Unit!23559)

(assert (=> b!671789 (= lt!312279 e!383910)))

(declare-fun c!77078 () Bool)

(assert (=> b!671789 (= c!77078 (= (select (arr!18787 a!3626) from!3004) k0!2843))))

(declare-fun b!671790 () Bool)

(declare-fun res!438370 () Bool)

(assert (=> b!671790 (=> (not res!438370) (not e!383918))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671790 (= res!438370 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19151 a!3626))))))

(declare-fun res!438381 () Bool)

(assert (=> start!60210 (=> (not res!438381) (not e!383918))))

(assert (=> start!60210 (= res!438381 (and (bvslt (size!19151 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19151 a!3626))))))

(assert (=> start!60210 e!383918))

(assert (=> start!60210 true))

(declare-fun array_inv!14646 (array!39195) Bool)

(assert (=> start!60210 (array_inv!14646 a!3626)))

(declare-fun b!671791 () Bool)

(declare-fun e!383912 () Bool)

(assert (=> b!671791 (= e!383912 (contains!3387 lt!312278 k0!2843))))

(declare-fun b!671792 () Bool)

(declare-fun Unit!23561 () Unit!23559)

(assert (=> b!671792 (= e!383910 Unit!23561)))

(declare-fun arrayContainsKey!0 (array!39195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671792 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312277 () Unit!23559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39195 (_ BitVec 64) (_ BitVec 32)) Unit!23559)

(assert (=> b!671792 (= lt!312277 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!671792 false))

(declare-fun b!671793 () Bool)

(declare-fun res!438373 () Bool)

(assert (=> b!671793 (=> (not res!438373) (not e!383918))))

(declare-fun e!383919 () Bool)

(assert (=> b!671793 (= res!438373 e!383919)))

(declare-fun res!438385 () Bool)

(assert (=> b!671793 (=> res!438385 e!383919)))

(assert (=> b!671793 (= res!438385 e!383914)))

(declare-fun res!438379 () Bool)

(assert (=> b!671793 (=> (not res!438379) (not e!383914))))

(assert (=> b!671793 (= res!438379 (bvsgt from!3004 i!1382))))

(declare-fun b!671794 () Bool)

(declare-fun res!438377 () Bool)

(assert (=> b!671794 (=> (not res!438377) (not e!383918))))

(assert (=> b!671794 (= res!438377 (not (contains!3387 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671795 () Bool)

(declare-fun res!438383 () Bool)

(assert (=> b!671795 (=> (not res!438383) (not e!383918))))

(assert (=> b!671795 (= res!438383 (not (contains!3387 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671796 () Bool)

(declare-fun e!383909 () Bool)

(assert (=> b!671796 (= e!383909 (not (contains!3387 lt!312278 k0!2843)))))

(declare-fun b!671797 () Bool)

(declare-fun e!383913 () Bool)

(assert (=> b!671797 (= e!383913 e!383909)))

(declare-fun res!438388 () Bool)

(assert (=> b!671797 (=> (not res!438388) (not e!383909))))

(assert (=> b!671797 (= res!438388 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671798 () Bool)

(declare-fun Unit!23562 () Unit!23559)

(assert (=> b!671798 (= e!383910 Unit!23562)))

(declare-fun b!671799 () Bool)

(assert (=> b!671799 (= e!383911 e!383917)))

(declare-fun res!438375 () Bool)

(assert (=> b!671799 (=> (not res!438375) (not e!383917))))

(assert (=> b!671799 (= res!438375 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!257 (List!12735 (_ BitVec 64)) List!12735)

(assert (=> b!671799 (= lt!312278 ($colon$colon!257 acc!681 (select (arr!18787 a!3626) from!3004)))))

(declare-fun b!671800 () Bool)

(declare-fun e!383915 () Bool)

(assert (=> b!671800 (= e!383915 (not (contains!3387 acc!681 k0!2843)))))

(declare-fun b!671801 () Bool)

(declare-fun res!438365 () Bool)

(assert (=> b!671801 (=> (not res!438365) (not e!383917))))

(assert (=> b!671801 (= res!438365 e!383913)))

(declare-fun res!438368 () Bool)

(assert (=> b!671801 (=> res!438368 e!383913)))

(assert (=> b!671801 (= res!438368 e!383912)))

(declare-fun res!438371 () Bool)

(assert (=> b!671801 (=> (not res!438371) (not e!383912))))

(assert (=> b!671801 (= res!438371 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671802 () Bool)

(declare-fun res!438387 () Bool)

(assert (=> b!671802 (=> (not res!438387) (not e!383918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671802 (= res!438387 (validKeyInArray!0 k0!2843))))

(declare-fun b!671803 () Bool)

(assert (=> b!671803 (= e!383919 e!383915)))

(declare-fun res!438366 () Bool)

(assert (=> b!671803 (=> (not res!438366) (not e!383915))))

(assert (=> b!671803 (= res!438366 (bvsle from!3004 i!1382))))

(declare-fun b!671804 () Bool)

(assert (=> b!671804 (= e!383917 false)))

(declare-fun lt!312280 () Bool)

(assert (=> b!671804 (= lt!312280 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312278))))

(declare-fun b!671805 () Bool)

(declare-fun res!438374 () Bool)

(assert (=> b!671805 (=> (not res!438374) (not e!383918))))

(assert (=> b!671805 (= res!438374 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671806 () Bool)

(declare-fun res!438372 () Bool)

(assert (=> b!671806 (=> (not res!438372) (not e!383918))))

(assert (=> b!671806 (= res!438372 (validKeyInArray!0 (select (arr!18787 a!3626) from!3004)))))

(declare-fun b!671807 () Bool)

(declare-fun res!438378 () Bool)

(assert (=> b!671807 (=> (not res!438378) (not e!383918))))

(assert (=> b!671807 (= res!438378 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19151 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671808 () Bool)

(declare-fun res!438380 () Bool)

(assert (=> b!671808 (=> (not res!438380) (not e!383917))))

(assert (=> b!671808 (= res!438380 (not (contains!3387 lt!312278 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671809 () Bool)

(declare-fun res!438376 () Bool)

(assert (=> b!671809 (=> (not res!438376) (not e!383918))))

(assert (=> b!671809 (= res!438376 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12732))))

(assert (= (and start!60210 res!438381) b!671785))

(assert (= (and b!671785 res!438369) b!671795))

(assert (= (and b!671795 res!438383) b!671794))

(assert (= (and b!671794 res!438377) b!671793))

(assert (= (and b!671793 res!438379) b!671788))

(assert (= (and b!671793 (not res!438385)) b!671803))

(assert (= (and b!671803 res!438366) b!671800))

(assert (= (and b!671793 res!438373) b!671809))

(assert (= (and b!671809 res!438376) b!671786))

(assert (= (and b!671786 res!438367) b!671790))

(assert (= (and b!671790 res!438370) b!671802))

(assert (= (and b!671802 res!438387) b!671805))

(assert (= (and b!671805 res!438374) b!671807))

(assert (= (and b!671807 res!438378) b!671806))

(assert (= (and b!671806 res!438372) b!671789))

(assert (= (and b!671789 c!77078) b!671792))

(assert (= (and b!671789 (not c!77078)) b!671798))

(assert (= (and b!671789 res!438386) b!671799))

(assert (= (and b!671799 res!438375) b!671787))

(assert (= (and b!671787 res!438384) b!671808))

(assert (= (and b!671808 res!438380) b!671784))

(assert (= (and b!671784 res!438382) b!671801))

(assert (= (and b!671801 res!438371) b!671791))

(assert (= (and b!671801 (not res!438368)) b!671797))

(assert (= (and b!671797 res!438388) b!671796))

(assert (= (and b!671801 res!438365) b!671804))

(declare-fun m!641671 () Bool)

(assert (=> b!671787 m!641671))

(declare-fun m!641673 () Bool)

(assert (=> b!671796 m!641673))

(declare-fun m!641675 () Bool)

(assert (=> b!671799 m!641675))

(assert (=> b!671799 m!641675))

(declare-fun m!641677 () Bool)

(assert (=> b!671799 m!641677))

(assert (=> b!671789 m!641675))

(declare-fun m!641679 () Bool)

(assert (=> b!671800 m!641679))

(declare-fun m!641681 () Bool)

(assert (=> b!671805 m!641681))

(assert (=> b!671806 m!641675))

(assert (=> b!671806 m!641675))

(declare-fun m!641683 () Bool)

(assert (=> b!671806 m!641683))

(declare-fun m!641685 () Bool)

(assert (=> b!671794 m!641685))

(declare-fun m!641687 () Bool)

(assert (=> start!60210 m!641687))

(assert (=> b!671788 m!641679))

(declare-fun m!641689 () Bool)

(assert (=> b!671808 m!641689))

(declare-fun m!641691 () Bool)

(assert (=> b!671792 m!641691))

(declare-fun m!641693 () Bool)

(assert (=> b!671792 m!641693))

(declare-fun m!641695 () Bool)

(assert (=> b!671804 m!641695))

(declare-fun m!641697 () Bool)

(assert (=> b!671786 m!641697))

(declare-fun m!641699 () Bool)

(assert (=> b!671802 m!641699))

(declare-fun m!641701 () Bool)

(assert (=> b!671795 m!641701))

(assert (=> b!671791 m!641673))

(declare-fun m!641703 () Bool)

(assert (=> b!671784 m!641703))

(declare-fun m!641705 () Bool)

(assert (=> b!671785 m!641705))

(declare-fun m!641707 () Bool)

(assert (=> b!671809 m!641707))

(check-sat (not b!671788) (not b!671792) (not b!671786) (not b!671799) (not b!671795) (not b!671785) (not b!671805) (not b!671809) (not b!671787) (not b!671800) (not b!671808) (not b!671806) (not b!671804) (not b!671796) (not b!671802) (not start!60210) (not b!671794) (not b!671791) (not b!671784))
(check-sat)
