; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59958 () Bool)

(assert start!59958)

(declare-fun res!432605 () Bool)

(declare-fun e!381224 () Bool)

(assert (=> start!59958 (=> (not res!432605) (not e!381224))))

(declare-datatypes ((array!39005 0))(
  ( (array!39006 (arr!18695 (Array (_ BitVec 32) (_ BitVec 64))) (size!19059 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39005)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59958 (= res!432605 (and (bvslt (size!19059 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19059 a!3626))))))

(assert (=> start!59958 e!381224))

(assert (=> start!59958 true))

(declare-fun array_inv!14491 (array!39005) Bool)

(assert (=> start!59958 (array_inv!14491 a!3626)))

(declare-fun b!665003 () Bool)

(declare-fun e!381218 () Bool)

(declare-datatypes ((List!12736 0))(
  ( (Nil!12733) (Cons!12732 (h!13777 (_ BitVec 64)) (t!18964 List!12736)) )
))
(declare-fun acc!681 () List!12736)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3313 (List!12736 (_ BitVec 64)) Bool)

(assert (=> b!665003 (= e!381218 (not (contains!3313 acc!681 k!2843)))))

(declare-fun b!665004 () Bool)

(declare-datatypes ((Unit!23200 0))(
  ( (Unit!23201) )
))
(declare-fun e!381220 () Unit!23200)

(declare-fun Unit!23202 () Unit!23200)

(assert (=> b!665004 (= e!381220 Unit!23202)))

(declare-fun b!665005 () Bool)

(declare-fun res!432608 () Bool)

(declare-fun e!381221 () Bool)

(assert (=> b!665005 (=> res!432608 e!381221)))

(declare-fun lt!309850 () Bool)

(assert (=> b!665005 (= res!432608 lt!309850)))

(declare-fun b!665006 () Bool)

(declare-fun e!381225 () Unit!23200)

(declare-fun lt!309852 () Unit!23200)

(assert (=> b!665006 (= e!381225 lt!309852)))

(declare-fun lt!309847 () Unit!23200)

(declare-fun lemmaListSubSeqRefl!0 (List!12736) Unit!23200)

(assert (=> b!665006 (= lt!309847 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!52 (List!12736 List!12736) Bool)

(assert (=> b!665006 (subseq!52 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39005 List!12736 List!12736 (_ BitVec 32)) Unit!23200)

(declare-fun $colon$colon!184 (List!12736 (_ BitVec 64)) List!12736)

(assert (=> b!665006 (= lt!309852 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!184 acc!681 (select (arr!18695 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39005 (_ BitVec 32) List!12736) Bool)

(assert (=> b!665006 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665007 () Bool)

(declare-fun res!432615 () Bool)

(assert (=> b!665007 (=> (not res!432615) (not e!381224))))

(assert (=> b!665007 (= res!432615 (not (contains!3313 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665008 () Bool)

(declare-fun Unit!23203 () Unit!23200)

(assert (=> b!665008 (= e!381220 Unit!23203)))

(declare-fun lt!309845 () Unit!23200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39005 (_ BitVec 64) (_ BitVec 32)) Unit!23200)

(assert (=> b!665008 (= lt!309845 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665008 false))

(declare-fun b!665009 () Bool)

(declare-fun res!432620 () Bool)

(assert (=> b!665009 (=> res!432620 e!381221)))

(assert (=> b!665009 (= res!432620 (contains!3313 acc!681 k!2843))))

(declare-fun b!665010 () Bool)

(declare-fun res!432622 () Bool)

(assert (=> b!665010 (=> res!432622 e!381221)))

(declare-fun lt!309846 () List!12736)

(assert (=> b!665010 (= res!432622 (not (subseq!52 acc!681 lt!309846)))))

(declare-fun b!665011 () Bool)

(declare-fun Unit!23204 () Unit!23200)

(assert (=> b!665011 (= e!381225 Unit!23204)))

(declare-fun b!665012 () Bool)

(declare-fun e!381219 () Bool)

(assert (=> b!665012 (= e!381219 (contains!3313 acc!681 k!2843))))

(declare-fun b!665013 () Bool)

(declare-fun res!432612 () Bool)

(assert (=> b!665013 (=> (not res!432612) (not e!381224))))

(declare-fun arrayContainsKey!0 (array!39005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665013 (= res!432612 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665014 () Bool)

(declare-fun e!381222 () Bool)

(assert (=> b!665014 (= e!381222 e!381218)))

(declare-fun res!432619 () Bool)

(assert (=> b!665014 (=> (not res!432619) (not e!381218))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665014 (= res!432619 (bvsle from!3004 i!1382))))

(declare-fun b!665015 () Bool)

(declare-fun res!432614 () Bool)

(assert (=> b!665015 (=> (not res!432614) (not e!381224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665015 (= res!432614 (validKeyInArray!0 k!2843))))

(declare-fun b!665016 () Bool)

(declare-fun res!432618 () Bool)

(assert (=> b!665016 (=> (not res!432618) (not e!381224))))

(assert (=> b!665016 (= res!432618 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12733))))

(declare-fun b!665017 () Bool)

(assert (=> b!665017 (= e!381221 true)))

(declare-fun lt!309851 () Bool)

(assert (=> b!665017 (= lt!309851 (contains!3313 lt!309846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665018 () Bool)

(declare-fun res!432617 () Bool)

(assert (=> b!665018 (=> res!432617 e!381221)))

(declare-fun noDuplicate!560 (List!12736) Bool)

(assert (=> b!665018 (= res!432617 (not (noDuplicate!560 lt!309846)))))

(declare-fun b!665019 () Bool)

(declare-fun res!432610 () Bool)

(assert (=> b!665019 (=> (not res!432610) (not e!381224))))

(assert (=> b!665019 (= res!432610 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665020 () Bool)

(declare-fun res!432623 () Bool)

(assert (=> b!665020 (=> (not res!432623) (not e!381224))))

(assert (=> b!665020 (= res!432623 (not (contains!3313 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665021 () Bool)

(declare-fun res!432621 () Bool)

(assert (=> b!665021 (=> res!432621 e!381221)))

(assert (=> b!665021 (= res!432621 (contains!3313 lt!309846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665022 () Bool)

(declare-fun res!432604 () Bool)

(assert (=> b!665022 (=> (not res!432604) (not e!381224))))

(assert (=> b!665022 (= res!432604 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19059 a!3626))))))

(declare-fun b!665023 () Bool)

(declare-fun res!432606 () Bool)

(assert (=> b!665023 (=> res!432606 e!381221)))

(assert (=> b!665023 (= res!432606 (not (contains!3313 lt!309846 k!2843)))))

(declare-fun b!665024 () Bool)

(assert (=> b!665024 (= e!381224 (not e!381221))))

(declare-fun res!432611 () Bool)

(assert (=> b!665024 (=> res!432611 e!381221)))

(assert (=> b!665024 (= res!432611 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!50 (List!12736 (_ BitVec 64)) List!12736)

(assert (=> b!665024 (= (-!50 lt!309846 k!2843) acc!681)))

(assert (=> b!665024 (= lt!309846 ($colon$colon!184 acc!681 k!2843))))

(declare-fun lt!309848 () Unit!23200)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12736) Unit!23200)

(assert (=> b!665024 (= lt!309848 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665024 (subseq!52 acc!681 acc!681)))

(declare-fun lt!309844 () Unit!23200)

(assert (=> b!665024 (= lt!309844 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665024 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309849 () Unit!23200)

(assert (=> b!665024 (= lt!309849 e!381225)))

(declare-fun c!76568 () Bool)

(assert (=> b!665024 (= c!76568 (validKeyInArray!0 (select (arr!18695 a!3626) from!3004)))))

(declare-fun lt!309853 () Unit!23200)

(assert (=> b!665024 (= lt!309853 e!381220)))

(declare-fun c!76567 () Bool)

(assert (=> b!665024 (= c!76567 lt!309850)))

(assert (=> b!665024 (= lt!309850 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665024 (arrayContainsKey!0 (array!39006 (store (arr!18695 a!3626) i!1382 k!2843) (size!19059 a!3626)) k!2843 from!3004)))

(declare-fun b!665025 () Bool)

(declare-fun res!432616 () Bool)

(assert (=> b!665025 (=> (not res!432616) (not e!381224))))

(assert (=> b!665025 (= res!432616 (noDuplicate!560 acc!681))))

(declare-fun b!665026 () Bool)

(declare-fun res!432609 () Bool)

(assert (=> b!665026 (=> (not res!432609) (not e!381224))))

(assert (=> b!665026 (= res!432609 e!381222)))

(declare-fun res!432607 () Bool)

(assert (=> b!665026 (=> res!432607 e!381222)))

(assert (=> b!665026 (= res!432607 e!381219)))

(declare-fun res!432613 () Bool)

(assert (=> b!665026 (=> (not res!432613) (not e!381219))))

(assert (=> b!665026 (= res!432613 (bvsgt from!3004 i!1382))))

(declare-fun b!665027 () Bool)

(declare-fun res!432603 () Bool)

(assert (=> b!665027 (=> (not res!432603) (not e!381224))))

(assert (=> b!665027 (= res!432603 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19059 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!59958 res!432605) b!665025))

(assert (= (and b!665025 res!432616) b!665007))

(assert (= (and b!665007 res!432615) b!665020))

(assert (= (and b!665020 res!432623) b!665026))

(assert (= (and b!665026 res!432613) b!665012))

(assert (= (and b!665026 (not res!432607)) b!665014))

(assert (= (and b!665014 res!432619) b!665003))

(assert (= (and b!665026 res!432609) b!665016))

(assert (= (and b!665016 res!432618) b!665019))

(assert (= (and b!665019 res!432610) b!665022))

(assert (= (and b!665022 res!432604) b!665015))

(assert (= (and b!665015 res!432614) b!665013))

(assert (= (and b!665013 res!432612) b!665027))

(assert (= (and b!665027 res!432603) b!665024))

(assert (= (and b!665024 c!76567) b!665008))

(assert (= (and b!665024 (not c!76567)) b!665004))

(assert (= (and b!665024 c!76568) b!665006))

(assert (= (and b!665024 (not c!76568)) b!665011))

(assert (= (and b!665024 (not res!432611)) b!665018))

(assert (= (and b!665018 (not res!432617)) b!665005))

(assert (= (and b!665005 (not res!432608)) b!665009))

(assert (= (and b!665009 (not res!432620)) b!665010))

(assert (= (and b!665010 (not res!432622)) b!665023))

(assert (= (and b!665023 (not res!432606)) b!665021))

(assert (= (and b!665021 (not res!432621)) b!665017))

(declare-fun m!636165 () Bool)

(assert (=> b!665024 m!636165))

(declare-fun m!636167 () Bool)

(assert (=> b!665024 m!636167))

(declare-fun m!636169 () Bool)

(assert (=> b!665024 m!636169))

(declare-fun m!636171 () Bool)

(assert (=> b!665024 m!636171))

(declare-fun m!636173 () Bool)

(assert (=> b!665024 m!636173))

(declare-fun m!636175 () Bool)

(assert (=> b!665024 m!636175))

(declare-fun m!636177 () Bool)

(assert (=> b!665024 m!636177))

(declare-fun m!636179 () Bool)

(assert (=> b!665024 m!636179))

(assert (=> b!665024 m!636169))

(declare-fun m!636181 () Bool)

(assert (=> b!665024 m!636181))

(declare-fun m!636183 () Bool)

(assert (=> b!665024 m!636183))

(declare-fun m!636185 () Bool)

(assert (=> b!665024 m!636185))

(declare-fun m!636187 () Bool)

(assert (=> b!665009 m!636187))

(declare-fun m!636189 () Bool)

(assert (=> b!665010 m!636189))

(declare-fun m!636191 () Bool)

(assert (=> b!665021 m!636191))

(declare-fun m!636193 () Bool)

(assert (=> b!665007 m!636193))

(assert (=> b!665003 m!636187))

(declare-fun m!636195 () Bool)

(assert (=> b!665023 m!636195))

(declare-fun m!636197 () Bool)

(assert (=> b!665025 m!636197))

(declare-fun m!636199 () Bool)

(assert (=> b!665018 m!636199))

(declare-fun m!636201 () Bool)

(assert (=> start!59958 m!636201))

(declare-fun m!636203 () Bool)

(assert (=> b!665008 m!636203))

(assert (=> b!665012 m!636187))

(declare-fun m!636205 () Bool)

(assert (=> b!665017 m!636205))

(declare-fun m!636207 () Bool)

(assert (=> b!665020 m!636207))

(assert (=> b!665006 m!636167))

(assert (=> b!665006 m!636169))

(declare-fun m!636209 () Bool)

(assert (=> b!665006 m!636209))

(declare-fun m!636211 () Bool)

(assert (=> b!665006 m!636211))

(assert (=> b!665006 m!636169))

(assert (=> b!665006 m!636209))

(assert (=> b!665006 m!636175))

(assert (=> b!665006 m!636185))

(declare-fun m!636213 () Bool)

(assert (=> b!665013 m!636213))

(declare-fun m!636215 () Bool)

(assert (=> b!665016 m!636215))

(declare-fun m!636217 () Bool)

(assert (=> b!665015 m!636217))

(declare-fun m!636219 () Bool)

(assert (=> b!665019 m!636219))

(push 1)

(assert (not b!665017))

(assert (not b!665024))

(assert (not b!665023))

(assert (not b!665006))

(assert (not b!665019))

(assert (not b!665008))

(assert (not b!665007))

(assert (not b!665020))

(assert (not b!665018))

(assert (not b!665013))

(assert (not b!665021))

(assert (not b!665025))

(assert (not b!665012))

(assert (not b!665010))

(assert (not b!665015))

(assert (not b!665009))

(assert (not b!665016))

(assert (not start!59958))

(assert (not b!665003))

(check-sat)

