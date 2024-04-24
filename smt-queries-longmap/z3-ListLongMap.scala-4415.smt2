; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61038 () Bool)

(assert start!61038)

(declare-fun b!684027 () Bool)

(declare-datatypes ((Unit!24021 0))(
  ( (Unit!24022) )
))
(declare-fun e!389672 () Unit!24021)

(declare-fun Unit!24023 () Unit!24021)

(assert (=> b!684027 (= e!389672 Unit!24023)))

(declare-fun b!684028 () Bool)

(declare-fun Unit!24024 () Unit!24021)

(assert (=> b!684028 (= e!389672 Unit!24024)))

(declare-fun lt!314143 () Unit!24021)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39585 0))(
  ( (array!39586 (arr!18970 (Array (_ BitVec 32) (_ BitVec 64))) (size!19337 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39585 (_ BitVec 64) (_ BitVec 32)) Unit!24021)

(assert (=> b!684028 (= lt!314143 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684028 false))

(declare-fun res!449602 () Bool)

(declare-fun e!389671 () Bool)

(assert (=> start!61038 (=> (not res!449602) (not e!389671))))

(assert (=> start!61038 (= res!449602 (and (bvslt (size!19337 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19337 a!3626))))))

(assert (=> start!61038 e!389671))

(assert (=> start!61038 true))

(declare-fun array_inv!14829 (array!39585) Bool)

(assert (=> start!61038 (array_inv!14829 a!3626)))

(declare-fun b!684029 () Bool)

(declare-fun e!389668 () Bool)

(declare-fun e!389670 () Bool)

(assert (=> b!684029 (= e!389668 e!389670)))

(declare-fun res!449617 () Bool)

(assert (=> b!684029 (=> (not res!449617) (not e!389670))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684029 (= res!449617 (bvsle from!3004 i!1382))))

(declare-fun b!684030 () Bool)

(declare-fun res!449616 () Bool)

(assert (=> b!684030 (=> (not res!449616) (not e!389671))))

(declare-datatypes ((List!12918 0))(
  ( (Nil!12915) (Cons!12914 (h!13962 (_ BitVec 64)) (t!19156 List!12918)) )
))
(declare-fun acc!681 () List!12918)

(declare-fun noDuplicate!844 (List!12918) Bool)

(assert (=> b!684030 (= res!449616 (noDuplicate!844 acc!681))))

(declare-fun b!684031 () Bool)

(declare-fun res!449608 () Bool)

(assert (=> b!684031 (=> (not res!449608) (not e!389671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684031 (= res!449608 (validKeyInArray!0 k0!2843))))

(declare-fun b!684032 () Bool)

(declare-fun e!389666 () Unit!24021)

(declare-fun Unit!24025 () Unit!24021)

(assert (=> b!684032 (= e!389666 Unit!24025)))

(declare-fun b!684033 () Bool)

(declare-fun lt!314138 () Unit!24021)

(assert (=> b!684033 (= e!389666 lt!314138)))

(declare-fun lt!314137 () Unit!24021)

(declare-fun lemmaListSubSeqRefl!0 (List!12918) Unit!24021)

(assert (=> b!684033 (= lt!314137 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!179 (List!12918 List!12918) Bool)

(assert (=> b!684033 (subseq!179 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39585 List!12918 List!12918 (_ BitVec 32)) Unit!24021)

(declare-fun $colon$colon!341 (List!12918 (_ BitVec 64)) List!12918)

(assert (=> b!684033 (= lt!314138 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!341 acc!681 (select (arr!18970 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39585 (_ BitVec 32) List!12918) Bool)

(assert (=> b!684033 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684034 () Bool)

(declare-fun res!449603 () Bool)

(assert (=> b!684034 (=> (not res!449603) (not e!389671))))

(declare-fun contains!3570 (List!12918 (_ BitVec 64)) Bool)

(assert (=> b!684034 (= res!449603 (not (contains!3570 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684035 () Bool)

(declare-fun res!449613 () Bool)

(assert (=> b!684035 (=> (not res!449613) (not e!389671))))

(assert (=> b!684035 (= res!449613 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12915))))

(declare-fun b!684036 () Bool)

(declare-fun res!449612 () Bool)

(assert (=> b!684036 (=> (not res!449612) (not e!389671))))

(assert (=> b!684036 (= res!449612 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19337 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684037 () Bool)

(declare-fun e!389669 () Bool)

(declare-fun lt!314139 () Bool)

(assert (=> b!684037 (= e!389669 (not lt!314139))))

(declare-fun b!684038 () Bool)

(declare-fun res!449614 () Bool)

(assert (=> b!684038 (=> (not res!449614) (not e!389671))))

(assert (=> b!684038 (= res!449614 (not (contains!3570 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684039 () Bool)

(declare-fun res!449604 () Bool)

(assert (=> b!684039 (=> (not res!449604) (not e!389671))))

(declare-fun arrayContainsKey!0 (array!39585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684039 (= res!449604 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684040 () Bool)

(declare-fun e!389667 () Bool)

(assert (=> b!684040 (= e!389667 (contains!3570 acc!681 k0!2843))))

(declare-fun b!684041 () Bool)

(declare-fun res!449615 () Bool)

(assert (=> b!684041 (=> (not res!449615) (not e!389671))))

(assert (=> b!684041 (= res!449615 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19337 a!3626))))))

(declare-fun b!684042 () Bool)

(declare-fun res!449607 () Bool)

(assert (=> b!684042 (=> (not res!449607) (not e!389671))))

(assert (=> b!684042 (= res!449607 e!389668)))

(declare-fun res!449606 () Bool)

(assert (=> b!684042 (=> res!449606 e!389668)))

(assert (=> b!684042 (= res!449606 e!389667)))

(declare-fun res!449611 () Bool)

(assert (=> b!684042 (=> (not res!449611) (not e!389667))))

(assert (=> b!684042 (= res!449611 (bvsgt from!3004 i!1382))))

(declare-fun b!684043 () Bool)

(declare-fun res!449605 () Bool)

(assert (=> b!684043 (=> (not res!449605) (not e!389671))))

(assert (=> b!684043 (= res!449605 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684044 () Bool)

(declare-fun res!449609 () Bool)

(assert (=> b!684044 (=> res!449609 e!389669)))

(declare-fun lt!314141 () List!12918)

(assert (=> b!684044 (= res!449609 (not (noDuplicate!844 lt!314141)))))

(declare-fun b!684045 () Bool)

(assert (=> b!684045 (= e!389671 (not e!389669))))

(declare-fun res!449610 () Bool)

(assert (=> b!684045 (=> res!449610 e!389669)))

(assert (=> b!684045 (= res!449610 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!143 (List!12918 (_ BitVec 64)) List!12918)

(assert (=> b!684045 (= (-!143 lt!314141 k0!2843) acc!681)))

(assert (=> b!684045 (= lt!314141 ($colon$colon!341 acc!681 k0!2843))))

(declare-fun lt!314142 () Unit!24021)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12918) Unit!24021)

(assert (=> b!684045 (= lt!314142 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!684045 (subseq!179 acc!681 acc!681)))

(declare-fun lt!314140 () Unit!24021)

(assert (=> b!684045 (= lt!314140 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684045 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314135 () Unit!24021)

(assert (=> b!684045 (= lt!314135 e!389666)))

(declare-fun c!77582 () Bool)

(assert (=> b!684045 (= c!77582 (validKeyInArray!0 (select (arr!18970 a!3626) from!3004)))))

(declare-fun lt!314136 () Unit!24021)

(assert (=> b!684045 (= lt!314136 e!389672)))

(declare-fun c!77581 () Bool)

(assert (=> b!684045 (= c!77581 lt!314139)))

(assert (=> b!684045 (= lt!314139 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684045 (arrayContainsKey!0 (array!39586 (store (arr!18970 a!3626) i!1382 k0!2843) (size!19337 a!3626)) k0!2843 from!3004)))

(declare-fun b!684046 () Bool)

(assert (=> b!684046 (= e!389670 (not (contains!3570 acc!681 k0!2843)))))

(assert (= (and start!61038 res!449602) b!684030))

(assert (= (and b!684030 res!449616) b!684038))

(assert (= (and b!684038 res!449614) b!684034))

(assert (= (and b!684034 res!449603) b!684042))

(assert (= (and b!684042 res!449611) b!684040))

(assert (= (and b!684042 (not res!449606)) b!684029))

(assert (= (and b!684029 res!449617) b!684046))

(assert (= (and b!684042 res!449607) b!684035))

(assert (= (and b!684035 res!449613) b!684043))

(assert (= (and b!684043 res!449605) b!684041))

(assert (= (and b!684041 res!449615) b!684031))

(assert (= (and b!684031 res!449608) b!684039))

(assert (= (and b!684039 res!449604) b!684036))

(assert (= (and b!684036 res!449612) b!684045))

(assert (= (and b!684045 c!77581) b!684028))

(assert (= (and b!684045 (not c!77581)) b!684027))

(assert (= (and b!684045 c!77582) b!684033))

(assert (= (and b!684045 (not c!77582)) b!684032))

(assert (= (and b!684045 (not res!449610)) b!684044))

(assert (= (and b!684044 (not res!449609)) b!684037))

(declare-fun m!649003 () Bool)

(assert (=> b!684028 m!649003))

(declare-fun m!649005 () Bool)

(assert (=> start!61038 m!649005))

(declare-fun m!649007 () Bool)

(assert (=> b!684033 m!649007))

(declare-fun m!649009 () Bool)

(assert (=> b!684033 m!649009))

(declare-fun m!649011 () Bool)

(assert (=> b!684033 m!649011))

(declare-fun m!649013 () Bool)

(assert (=> b!684033 m!649013))

(assert (=> b!684033 m!649009))

(assert (=> b!684033 m!649011))

(declare-fun m!649015 () Bool)

(assert (=> b!684033 m!649015))

(declare-fun m!649017 () Bool)

(assert (=> b!684033 m!649017))

(assert (=> b!684045 m!649007))

(assert (=> b!684045 m!649009))

(declare-fun m!649019 () Bool)

(assert (=> b!684045 m!649019))

(declare-fun m!649021 () Bool)

(assert (=> b!684045 m!649021))

(declare-fun m!649023 () Bool)

(assert (=> b!684045 m!649023))

(assert (=> b!684045 m!649015))

(declare-fun m!649025 () Bool)

(assert (=> b!684045 m!649025))

(declare-fun m!649027 () Bool)

(assert (=> b!684045 m!649027))

(assert (=> b!684045 m!649009))

(declare-fun m!649029 () Bool)

(assert (=> b!684045 m!649029))

(declare-fun m!649031 () Bool)

(assert (=> b!684045 m!649031))

(assert (=> b!684045 m!649017))

(declare-fun m!649033 () Bool)

(assert (=> b!684031 m!649033))

(declare-fun m!649035 () Bool)

(assert (=> b!684035 m!649035))

(declare-fun m!649037 () Bool)

(assert (=> b!684043 m!649037))

(declare-fun m!649039 () Bool)

(assert (=> b!684040 m!649039))

(declare-fun m!649041 () Bool)

(assert (=> b!684039 m!649041))

(assert (=> b!684046 m!649039))

(declare-fun m!649043 () Bool)

(assert (=> b!684038 m!649043))

(declare-fun m!649045 () Bool)

(assert (=> b!684044 m!649045))

(declare-fun m!649047 () Bool)

(assert (=> b!684030 m!649047))

(declare-fun m!649049 () Bool)

(assert (=> b!684034 m!649049))

(check-sat (not b!684044) (not b!684033) (not start!61038) (not b!684028) (not b!684035) (not b!684034) (not b!684039) (not b!684038) (not b!684040) (not b!684043) (not b!684046) (not b!684030) (not b!684031) (not b!684045))
(check-sat)
