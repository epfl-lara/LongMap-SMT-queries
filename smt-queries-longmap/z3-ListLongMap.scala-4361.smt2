; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60182 () Bool)

(assert start!60182)

(declare-fun b!672902 () Bool)

(declare-fun res!439639 () Bool)

(declare-fun e!384272 () Bool)

(assert (=> b!672902 (=> (not res!439639) (not e!384272))))

(declare-datatypes ((List!12892 0))(
  ( (Nil!12889) (Cons!12888 (h!13933 (_ BitVec 64)) (t!19111 List!12892)) )
))
(declare-fun acc!681 () List!12892)

(declare-fun noDuplicate!683 (List!12892) Bool)

(assert (=> b!672902 (= res!439639 (noDuplicate!683 acc!681))))

(declare-fun b!672903 () Bool)

(declare-fun res!439644 () Bool)

(assert (=> b!672903 (=> (not res!439644) (not e!384272))))

(declare-datatypes ((array!39240 0))(
  ( (array!39241 (arr!18812 (Array (_ BitVec 32) (_ BitVec 64))) (size!19177 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39240)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39240 (_ BitVec 32) List!12892) Bool)

(assert (=> b!672903 (= res!439644 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672904 () Bool)

(declare-fun e!384271 () Bool)

(declare-fun lt!312172 () List!12892)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3414 (List!12892 (_ BitVec 64)) Bool)

(assert (=> b!672904 (= e!384271 (contains!3414 lt!312172 k0!2843))))

(declare-fun b!672905 () Bool)

(declare-fun e!384278 () Bool)

(assert (=> b!672905 (= e!384278 (not (contains!3414 acc!681 k0!2843)))))

(declare-fun b!672906 () Bool)

(declare-fun res!439633 () Bool)

(assert (=> b!672906 (=> (not res!439633) (not e!384272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672906 (= res!439633 (validKeyInArray!0 (select (arr!18812 a!3626) from!3004)))))

(declare-fun b!672907 () Bool)

(declare-fun e!384279 () Bool)

(assert (=> b!672907 (= e!384272 e!384279)))

(declare-fun res!439634 () Bool)

(assert (=> b!672907 (=> (not res!439634) (not e!384279))))

(assert (=> b!672907 (= res!439634 (not (= (select (arr!18812 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23642 0))(
  ( (Unit!23643) )
))
(declare-fun lt!312173 () Unit!23642)

(declare-fun e!384274 () Unit!23642)

(assert (=> b!672907 (= lt!312173 e!384274)))

(declare-fun c!77004 () Bool)

(assert (=> b!672907 (= c!77004 (= (select (arr!18812 a!3626) from!3004) k0!2843))))

(declare-fun b!672908 () Bool)

(declare-fun res!439630 () Bool)

(declare-fun e!384277 () Bool)

(assert (=> b!672908 (=> (not res!439630) (not e!384277))))

(assert (=> b!672908 (= res!439630 (not (contains!3414 lt!312172 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!439631 () Bool)

(assert (=> start!60182 (=> (not res!439631) (not e!384272))))

(assert (=> start!60182 (= res!439631 (and (bvslt (size!19177 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19177 a!3626))))))

(assert (=> start!60182 e!384272))

(assert (=> start!60182 true))

(declare-fun array_inv!14695 (array!39240) Bool)

(assert (=> start!60182 (array_inv!14695 a!3626)))

(declare-fun b!672909 () Bool)

(declare-fun res!439650 () Bool)

(assert (=> b!672909 (=> (not res!439650) (not e!384272))))

(assert (=> b!672909 (= res!439650 (not (contains!3414 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672910 () Bool)

(declare-fun res!439640 () Bool)

(assert (=> b!672910 (=> (not res!439640) (not e!384277))))

(assert (=> b!672910 (= res!439640 (not (contains!3414 lt!312172 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672911 () Bool)

(declare-fun res!439638 () Bool)

(assert (=> b!672911 (=> (not res!439638) (not e!384277))))

(assert (=> b!672911 (= res!439638 (noDuplicate!683 lt!312172))))

(declare-fun b!672912 () Bool)

(declare-fun res!439648 () Bool)

(assert (=> b!672912 (=> (not res!439648) (not e!384272))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672912 (= res!439648 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19177 a!3626))))))

(declare-fun b!672913 () Bool)

(declare-fun res!439642 () Bool)

(assert (=> b!672913 (=> (not res!439642) (not e!384272))))

(assert (=> b!672913 (= res!439642 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12889))))

(declare-fun b!672914 () Bool)

(declare-fun res!439651 () Bool)

(assert (=> b!672914 (=> (not res!439651) (not e!384272))))

(assert (=> b!672914 (= res!439651 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19177 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672915 () Bool)

(declare-fun e!384275 () Bool)

(assert (=> b!672915 (= e!384275 (not (contains!3414 lt!312172 k0!2843)))))

(declare-fun b!672916 () Bool)

(declare-fun res!439649 () Bool)

(assert (=> b!672916 (=> (not res!439649) (not e!384272))))

(assert (=> b!672916 (= res!439649 (validKeyInArray!0 k0!2843))))

(declare-fun b!672917 () Bool)

(assert (=> b!672917 (= e!384279 e!384277)))

(declare-fun res!439636 () Bool)

(assert (=> b!672917 (=> (not res!439636) (not e!384277))))

(assert (=> b!672917 (= res!439636 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!280 (List!12892 (_ BitVec 64)) List!12892)

(assert (=> b!672917 (= lt!312172 ($colon$colon!280 acc!681 (select (arr!18812 a!3626) from!3004)))))

(declare-fun b!672918 () Bool)

(assert (=> b!672918 (= e!384277 false)))

(declare-fun lt!312171 () Bool)

(assert (=> b!672918 (= lt!312171 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312172))))

(declare-fun b!672919 () Bool)

(declare-fun Unit!23644 () Unit!23642)

(assert (=> b!672919 (= e!384274 Unit!23644)))

(declare-fun arrayContainsKey!0 (array!39240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672919 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312174 () Unit!23642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39240 (_ BitVec 64) (_ BitVec 32)) Unit!23642)

(assert (=> b!672919 (= lt!312174 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672919 false))

(declare-fun b!672920 () Bool)

(declare-fun Unit!23645 () Unit!23642)

(assert (=> b!672920 (= e!384274 Unit!23645)))

(declare-fun b!672921 () Bool)

(declare-fun res!439641 () Bool)

(assert (=> b!672921 (=> (not res!439641) (not e!384272))))

(assert (=> b!672921 (= res!439641 (not (contains!3414 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672922 () Bool)

(declare-fun res!439632 () Bool)

(assert (=> b!672922 (=> (not res!439632) (not e!384277))))

(declare-fun e!384273 () Bool)

(assert (=> b!672922 (= res!439632 e!384273)))

(declare-fun res!439637 () Bool)

(assert (=> b!672922 (=> res!439637 e!384273)))

(assert (=> b!672922 (= res!439637 e!384271)))

(declare-fun res!439628 () Bool)

(assert (=> b!672922 (=> (not res!439628) (not e!384271))))

(assert (=> b!672922 (= res!439628 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672923 () Bool)

(declare-fun e!384281 () Bool)

(assert (=> b!672923 (= e!384281 e!384278)))

(declare-fun res!439643 () Bool)

(assert (=> b!672923 (=> (not res!439643) (not e!384278))))

(assert (=> b!672923 (= res!439643 (bvsle from!3004 i!1382))))

(declare-fun b!672924 () Bool)

(declare-fun res!439645 () Bool)

(assert (=> b!672924 (=> (not res!439645) (not e!384272))))

(assert (=> b!672924 (= res!439645 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672925 () Bool)

(declare-fun res!439646 () Bool)

(assert (=> b!672925 (=> (not res!439646) (not e!384272))))

(assert (=> b!672925 (= res!439646 e!384281)))

(declare-fun res!439647 () Bool)

(assert (=> b!672925 (=> res!439647 e!384281)))

(declare-fun e!384276 () Bool)

(assert (=> b!672925 (= res!439647 e!384276)))

(declare-fun res!439629 () Bool)

(assert (=> b!672925 (=> (not res!439629) (not e!384276))))

(assert (=> b!672925 (= res!439629 (bvsgt from!3004 i!1382))))

(declare-fun b!672926 () Bool)

(assert (=> b!672926 (= e!384276 (contains!3414 acc!681 k0!2843))))

(declare-fun b!672927 () Bool)

(assert (=> b!672927 (= e!384273 e!384275)))

(declare-fun res!439635 () Bool)

(assert (=> b!672927 (=> (not res!439635) (not e!384275))))

(assert (=> b!672927 (= res!439635 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60182 res!439631) b!672902))

(assert (= (and b!672902 res!439639) b!672921))

(assert (= (and b!672921 res!439641) b!672909))

(assert (= (and b!672909 res!439650) b!672925))

(assert (= (and b!672925 res!439629) b!672926))

(assert (= (and b!672925 (not res!439647)) b!672923))

(assert (= (and b!672923 res!439643) b!672905))

(assert (= (and b!672925 res!439646) b!672913))

(assert (= (and b!672913 res!439642) b!672903))

(assert (= (and b!672903 res!439644) b!672912))

(assert (= (and b!672912 res!439648) b!672916))

(assert (= (and b!672916 res!439649) b!672924))

(assert (= (and b!672924 res!439645) b!672914))

(assert (= (and b!672914 res!439651) b!672906))

(assert (= (and b!672906 res!439633) b!672907))

(assert (= (and b!672907 c!77004) b!672919))

(assert (= (and b!672907 (not c!77004)) b!672920))

(assert (= (and b!672907 res!439634) b!672917))

(assert (= (and b!672917 res!439636) b!672911))

(assert (= (and b!672911 res!439638) b!672908))

(assert (= (and b!672908 res!439630) b!672910))

(assert (= (and b!672910 res!439640) b!672922))

(assert (= (and b!672922 res!439628) b!672904))

(assert (= (and b!672922 (not res!439637)) b!672927))

(assert (= (and b!672927 res!439635) b!672915))

(assert (= (and b!672922 res!439632) b!672918))

(declare-fun m!640989 () Bool)

(assert (=> b!672919 m!640989))

(declare-fun m!640991 () Bool)

(assert (=> b!672919 m!640991))

(declare-fun m!640993 () Bool)

(assert (=> b!672902 m!640993))

(declare-fun m!640995 () Bool)

(assert (=> b!672903 m!640995))

(declare-fun m!640997 () Bool)

(assert (=> b!672906 m!640997))

(assert (=> b!672906 m!640997))

(declare-fun m!640999 () Bool)

(assert (=> b!672906 m!640999))

(declare-fun m!641001 () Bool)

(assert (=> b!672908 m!641001))

(declare-fun m!641003 () Bool)

(assert (=> b!672926 m!641003))

(declare-fun m!641005 () Bool)

(assert (=> b!672910 m!641005))

(declare-fun m!641007 () Bool)

(assert (=> b!672909 m!641007))

(declare-fun m!641009 () Bool)

(assert (=> b!672911 m!641009))

(declare-fun m!641011 () Bool)

(assert (=> b!672924 m!641011))

(assert (=> b!672917 m!640997))

(assert (=> b!672917 m!640997))

(declare-fun m!641013 () Bool)

(assert (=> b!672917 m!641013))

(declare-fun m!641015 () Bool)

(assert (=> b!672913 m!641015))

(declare-fun m!641017 () Bool)

(assert (=> b!672904 m!641017))

(assert (=> b!672915 m!641017))

(declare-fun m!641019 () Bool)

(assert (=> b!672916 m!641019))

(declare-fun m!641021 () Bool)

(assert (=> b!672921 m!641021))

(declare-fun m!641023 () Bool)

(assert (=> start!60182 m!641023))

(assert (=> b!672907 m!640997))

(assert (=> b!672905 m!641003))

(declare-fun m!641025 () Bool)

(assert (=> b!672918 m!641025))

(check-sat (not b!672924) (not b!672909) (not b!672918) (not b!672908) (not b!672913) (not b!672921) (not start!60182) (not b!672916) (not b!672903) (not b!672911) (not b!672902) (not b!672919) (not b!672905) (not b!672915) (not b!672906) (not b!672904) (not b!672926) (not b!672910) (not b!672917))
(check-sat)
