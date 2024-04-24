; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60264 () Bool)

(assert start!60264)

(declare-fun b!673890 () Bool)

(declare-fun res!440327 () Bool)

(declare-fun e!384807 () Bool)

(assert (=> b!673890 (=> (not res!440327) (not e!384807))))

(declare-datatypes ((List!12762 0))(
  ( (Nil!12759) (Cons!12758 (h!13806 (_ BitVec 64)) (t!18982 List!12762)) )
))
(declare-fun acc!681 () List!12762)

(declare-fun contains!3414 (List!12762 (_ BitVec 64)) Bool)

(assert (=> b!673890 (= res!440327 (not (contains!3414 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673891 () Bool)

(declare-fun e!384803 () Bool)

(assert (=> b!673891 (= e!384803 false)))

(declare-fun lt!312602 () Bool)

(declare-datatypes ((array!39249 0))(
  ( (array!39250 (arr!18814 (Array (_ BitVec 32) (_ BitVec 64))) (size!19178 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39249)

(declare-fun lt!312601 () List!12762)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39249 (_ BitVec 32) List!12762) Bool)

(assert (=> b!673891 (= lt!312602 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312601))))

(declare-fun b!673892 () Bool)

(declare-datatypes ((Unit!23667 0))(
  ( (Unit!23668) )
))
(declare-fun e!384801 () Unit!23667)

(declare-fun Unit!23669 () Unit!23667)

(assert (=> b!673892 (= e!384801 Unit!23669)))

(declare-fun b!673893 () Bool)

(declare-fun res!440320 () Bool)

(assert (=> b!673893 (=> (not res!440320) (not e!384807))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673893 (= res!440320 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19178 a!3626))))))

(declare-fun b!673894 () Bool)

(declare-fun res!440325 () Bool)

(assert (=> b!673894 (=> (not res!440325) (not e!384807))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673894 (= res!440325 (validKeyInArray!0 k0!2843))))

(declare-fun b!673895 () Bool)

(declare-fun res!440311 () Bool)

(assert (=> b!673895 (=> (not res!440311) (not e!384807))))

(declare-fun e!384802 () Bool)

(assert (=> b!673895 (= res!440311 e!384802)))

(declare-fun res!440321 () Bool)

(assert (=> b!673895 (=> res!440321 e!384802)))

(declare-fun e!384809 () Bool)

(assert (=> b!673895 (= res!440321 e!384809)))

(declare-fun res!440319 () Bool)

(assert (=> b!673895 (=> (not res!440319) (not e!384809))))

(assert (=> b!673895 (= res!440319 (bvsgt from!3004 i!1382))))

(declare-fun b!673896 () Bool)

(declare-fun res!440324 () Bool)

(assert (=> b!673896 (=> (not res!440324) (not e!384807))))

(declare-fun arrayContainsKey!0 (array!39249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673896 (= res!440324 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673897 () Bool)

(declare-fun res!440309 () Bool)

(assert (=> b!673897 (=> (not res!440309) (not e!384803))))

(declare-fun noDuplicate!688 (List!12762) Bool)

(assert (=> b!673897 (= res!440309 (noDuplicate!688 lt!312601))))

(declare-fun b!673898 () Bool)

(declare-fun Unit!23670 () Unit!23667)

(assert (=> b!673898 (= e!384801 Unit!23670)))

(assert (=> b!673898 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312603 () Unit!23667)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39249 (_ BitVec 64) (_ BitVec 32)) Unit!23667)

(assert (=> b!673898 (= lt!312603 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673898 false))

(declare-fun b!673899 () Bool)

(declare-fun e!384804 () Bool)

(assert (=> b!673899 (= e!384804 (not (contains!3414 lt!312601 k0!2843)))))

(declare-fun b!673900 () Bool)

(declare-fun e!384800 () Bool)

(assert (=> b!673900 (= e!384800 (contains!3414 lt!312601 k0!2843))))

(declare-fun res!440315 () Bool)

(assert (=> start!60264 (=> (not res!440315) (not e!384807))))

(assert (=> start!60264 (= res!440315 (and (bvslt (size!19178 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19178 a!3626))))))

(assert (=> start!60264 e!384807))

(assert (=> start!60264 true))

(declare-fun array_inv!14673 (array!39249) Bool)

(assert (=> start!60264 (array_inv!14673 a!3626)))

(declare-fun b!673901 () Bool)

(assert (=> b!673901 (= e!384809 (contains!3414 acc!681 k0!2843))))

(declare-fun b!673902 () Bool)

(declare-fun e!384806 () Bool)

(assert (=> b!673902 (= e!384807 e!384806)))

(declare-fun res!440322 () Bool)

(assert (=> b!673902 (=> (not res!440322) (not e!384806))))

(assert (=> b!673902 (= res!440322 (not (= (select (arr!18814 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312604 () Unit!23667)

(assert (=> b!673902 (= lt!312604 e!384801)))

(declare-fun c!77159 () Bool)

(assert (=> b!673902 (= c!77159 (= (select (arr!18814 a!3626) from!3004) k0!2843))))

(declare-fun b!673903 () Bool)

(declare-fun e!384810 () Bool)

(assert (=> b!673903 (= e!384802 e!384810)))

(declare-fun res!440318 () Bool)

(assert (=> b!673903 (=> (not res!440318) (not e!384810))))

(assert (=> b!673903 (= res!440318 (bvsle from!3004 i!1382))))

(declare-fun b!673904 () Bool)

(declare-fun res!440328 () Bool)

(assert (=> b!673904 (=> (not res!440328) (not e!384803))))

(assert (=> b!673904 (= res!440328 (not (contains!3414 lt!312601 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673905 () Bool)

(declare-fun res!440330 () Bool)

(assert (=> b!673905 (=> (not res!440330) (not e!384807))))

(assert (=> b!673905 (= res!440330 (validKeyInArray!0 (select (arr!18814 a!3626) from!3004)))))

(declare-fun b!673906 () Bool)

(declare-fun e!384805 () Bool)

(assert (=> b!673906 (= e!384805 e!384804)))

(declare-fun res!440316 () Bool)

(assert (=> b!673906 (=> (not res!440316) (not e!384804))))

(assert (=> b!673906 (= res!440316 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673907 () Bool)

(declare-fun res!440329 () Bool)

(assert (=> b!673907 (=> (not res!440329) (not e!384803))))

(assert (=> b!673907 (= res!440329 (not (contains!3414 lt!312601 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673908 () Bool)

(declare-fun res!440312 () Bool)

(assert (=> b!673908 (=> (not res!440312) (not e!384807))))

(assert (=> b!673908 (= res!440312 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673909 () Bool)

(declare-fun res!440326 () Bool)

(assert (=> b!673909 (=> (not res!440326) (not e!384807))))

(assert (=> b!673909 (= res!440326 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12759))))

(declare-fun b!673910 () Bool)

(assert (=> b!673910 (= e!384810 (not (contains!3414 acc!681 k0!2843)))))

(declare-fun b!673911 () Bool)

(assert (=> b!673911 (= e!384806 e!384803)))

(declare-fun res!440317 () Bool)

(assert (=> b!673911 (=> (not res!440317) (not e!384803))))

(assert (=> b!673911 (= res!440317 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!284 (List!12762 (_ BitVec 64)) List!12762)

(assert (=> b!673911 (= lt!312601 ($colon$colon!284 acc!681 (select (arr!18814 a!3626) from!3004)))))

(declare-fun b!673912 () Bool)

(declare-fun res!440310 () Bool)

(assert (=> b!673912 (=> (not res!440310) (not e!384807))))

(assert (=> b!673912 (= res!440310 (noDuplicate!688 acc!681))))

(declare-fun b!673913 () Bool)

(declare-fun res!440331 () Bool)

(assert (=> b!673913 (=> (not res!440331) (not e!384807))))

(assert (=> b!673913 (= res!440331 (not (contains!3414 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673914 () Bool)

(declare-fun res!440314 () Bool)

(assert (=> b!673914 (=> (not res!440314) (not e!384807))))

(assert (=> b!673914 (= res!440314 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19178 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673915 () Bool)

(declare-fun res!440332 () Bool)

(assert (=> b!673915 (=> (not res!440332) (not e!384803))))

(assert (=> b!673915 (= res!440332 e!384805)))

(declare-fun res!440323 () Bool)

(assert (=> b!673915 (=> res!440323 e!384805)))

(assert (=> b!673915 (= res!440323 e!384800)))

(declare-fun res!440313 () Bool)

(assert (=> b!673915 (=> (not res!440313) (not e!384800))))

(assert (=> b!673915 (= res!440313 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60264 res!440315) b!673912))

(assert (= (and b!673912 res!440310) b!673890))

(assert (= (and b!673890 res!440327) b!673913))

(assert (= (and b!673913 res!440331) b!673895))

(assert (= (and b!673895 res!440319) b!673901))

(assert (= (and b!673895 (not res!440321)) b!673903))

(assert (= (and b!673903 res!440318) b!673910))

(assert (= (and b!673895 res!440311) b!673909))

(assert (= (and b!673909 res!440326) b!673908))

(assert (= (and b!673908 res!440312) b!673893))

(assert (= (and b!673893 res!440320) b!673894))

(assert (= (and b!673894 res!440325) b!673896))

(assert (= (and b!673896 res!440324) b!673914))

(assert (= (and b!673914 res!440314) b!673905))

(assert (= (and b!673905 res!440330) b!673902))

(assert (= (and b!673902 c!77159) b!673898))

(assert (= (and b!673902 (not c!77159)) b!673892))

(assert (= (and b!673902 res!440322) b!673911))

(assert (= (and b!673911 res!440317) b!673897))

(assert (= (and b!673897 res!440309) b!673904))

(assert (= (and b!673904 res!440328) b!673907))

(assert (= (and b!673907 res!440329) b!673915))

(assert (= (and b!673915 res!440313) b!673900))

(assert (= (and b!673915 (not res!440323)) b!673906))

(assert (= (and b!673906 res!440316) b!673899))

(assert (= (and b!673915 res!440332) b!673891))

(declare-fun m!642697 () Bool)

(assert (=> b!673908 m!642697))

(declare-fun m!642699 () Bool)

(assert (=> b!673898 m!642699))

(declare-fun m!642701 () Bool)

(assert (=> b!673898 m!642701))

(declare-fun m!642703 () Bool)

(assert (=> start!60264 m!642703))

(declare-fun m!642705 () Bool)

(assert (=> b!673911 m!642705))

(assert (=> b!673911 m!642705))

(declare-fun m!642707 () Bool)

(assert (=> b!673911 m!642707))

(declare-fun m!642709 () Bool)

(assert (=> b!673891 m!642709))

(declare-fun m!642711 () Bool)

(assert (=> b!673894 m!642711))

(assert (=> b!673905 m!642705))

(assert (=> b!673905 m!642705))

(declare-fun m!642713 () Bool)

(assert (=> b!673905 m!642713))

(declare-fun m!642715 () Bool)

(assert (=> b!673913 m!642715))

(declare-fun m!642717 () Bool)

(assert (=> b!673904 m!642717))

(declare-fun m!642719 () Bool)

(assert (=> b!673910 m!642719))

(assert (=> b!673902 m!642705))

(assert (=> b!673901 m!642719))

(declare-fun m!642721 () Bool)

(assert (=> b!673909 m!642721))

(declare-fun m!642723 () Bool)

(assert (=> b!673897 m!642723))

(declare-fun m!642725 () Bool)

(assert (=> b!673907 m!642725))

(declare-fun m!642727 () Bool)

(assert (=> b!673900 m!642727))

(assert (=> b!673899 m!642727))

(declare-fun m!642729 () Bool)

(assert (=> b!673896 m!642729))

(declare-fun m!642731 () Bool)

(assert (=> b!673890 m!642731))

(declare-fun m!642733 () Bool)

(assert (=> b!673912 m!642733))

(check-sat (not b!673905) (not b!673897) (not b!673910) (not b!673907) (not b!673896) (not b!673894) (not b!673898) (not b!673909) (not b!673904) (not b!673900) (not b!673891) (not start!60264) (not b!673911) (not b!673890) (not b!673908) (not b!673912) (not b!673899) (not b!673901) (not b!673913))
(check-sat)
