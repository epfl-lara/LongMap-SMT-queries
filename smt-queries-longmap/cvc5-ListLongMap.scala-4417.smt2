; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60992 () Bool)

(assert start!60992)

(declare-fun b!684174 () Bool)

(declare-fun res!449800 () Bool)

(declare-fun e!389670 () Bool)

(assert (=> b!684174 (=> (not res!449800) (not e!389670))))

(declare-datatypes ((array!39601 0))(
  ( (array!39602 (arr!18981 (Array (_ BitVec 32) (_ BitVec 64))) (size!19348 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39601)

(declare-datatypes ((List!13022 0))(
  ( (Nil!13019) (Cons!13018 (h!14063 (_ BitVec 64)) (t!19268 List!13022)) )
))
(declare-fun arrayNoDuplicates!0 (array!39601 (_ BitVec 32) List!13022) Bool)

(assert (=> b!684174 (= res!449800 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13019))))

(declare-fun b!684175 () Bool)

(declare-fun res!449803 () Bool)

(assert (=> b!684175 (=> (not res!449803) (not e!389670))))

(declare-fun acc!681 () List!13022)

(declare-fun contains!3599 (List!13022 (_ BitVec 64)) Bool)

(assert (=> b!684175 (= res!449803 (not (contains!3599 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684176 () Bool)

(declare-fun res!449788 () Bool)

(assert (=> b!684176 (=> (not res!449788) (not e!389670))))

(declare-fun noDuplicate!846 (List!13022) Bool)

(assert (=> b!684176 (= res!449788 (noDuplicate!846 acc!681))))

(declare-fun b!684177 () Bool)

(declare-fun e!389669 () Bool)

(assert (=> b!684177 (= e!389669 true)))

(declare-fun lt!314202 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!684177 (= lt!314202 (contains!3599 acc!681 k!2843))))

(declare-fun b!684178 () Bool)

(assert (=> b!684178 (= e!389670 (not e!389669))))

(declare-fun res!449789 () Bool)

(assert (=> b!684178 (=> res!449789 e!389669)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!684178 (= res!449789 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!314203 () List!13022)

(declare-fun -!150 (List!13022 (_ BitVec 64)) List!13022)

(assert (=> b!684178 (= (-!150 lt!314203 k!2843) acc!681)))

(declare-fun $colon$colon!350 (List!13022 (_ BitVec 64)) List!13022)

(assert (=> b!684178 (= lt!314203 ($colon$colon!350 acc!681 k!2843))))

(declare-datatypes ((Unit!24072 0))(
  ( (Unit!24073) )
))
(declare-fun lt!314198 () Unit!24072)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13022) Unit!24072)

(assert (=> b!684178 (= lt!314198 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!185 (List!13022 List!13022) Bool)

(assert (=> b!684178 (subseq!185 acc!681 acc!681)))

(declare-fun lt!314200 () Unit!24072)

(declare-fun lemmaListSubSeqRefl!0 (List!13022) Unit!24072)

(assert (=> b!684178 (= lt!314200 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684178 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314201 () Unit!24072)

(declare-fun e!389676 () Unit!24072)

(assert (=> b!684178 (= lt!314201 e!389676)))

(declare-fun c!77560 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684178 (= c!77560 (validKeyInArray!0 (select (arr!18981 a!3626) from!3004)))))

(declare-fun lt!314197 () Unit!24072)

(declare-fun e!389672 () Unit!24072)

(assert (=> b!684178 (= lt!314197 e!389672)))

(declare-fun c!77561 () Bool)

(declare-fun lt!314206 () Bool)

(assert (=> b!684178 (= c!77561 lt!314206)))

(declare-fun arrayContainsKey!0 (array!39601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684178 (= lt!314206 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684178 (arrayContainsKey!0 (array!39602 (store (arr!18981 a!3626) i!1382 k!2843) (size!19348 a!3626)) k!2843 from!3004)))

(declare-fun b!684179 () Bool)

(declare-fun res!449799 () Bool)

(assert (=> b!684179 (=> (not res!449799) (not e!389670))))

(assert (=> b!684179 (= res!449799 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684180 () Bool)

(declare-fun res!449796 () Bool)

(assert (=> b!684180 (=> (not res!449796) (not e!389670))))

(assert (=> b!684180 (= res!449796 (not (contains!3599 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684181 () Bool)

(declare-fun res!449790 () Bool)

(assert (=> b!684181 (=> (not res!449790) (not e!389670))))

(assert (=> b!684181 (= res!449790 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19348 a!3626))))))

(declare-fun b!684182 () Bool)

(declare-fun Unit!24074 () Unit!24072)

(assert (=> b!684182 (= e!389672 Unit!24074)))

(declare-fun lt!314205 () Unit!24072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39601 (_ BitVec 64) (_ BitVec 32)) Unit!24072)

(assert (=> b!684182 (= lt!314205 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684182 false))

(declare-fun res!449791 () Bool)

(assert (=> start!60992 (=> (not res!449791) (not e!389670))))

(assert (=> start!60992 (= res!449791 (and (bvslt (size!19348 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19348 a!3626))))))

(assert (=> start!60992 e!389670))

(assert (=> start!60992 true))

(declare-fun array_inv!14777 (array!39601) Bool)

(assert (=> start!60992 (array_inv!14777 a!3626)))

(declare-fun b!684183 () Bool)

(declare-fun Unit!24075 () Unit!24072)

(assert (=> b!684183 (= e!389676 Unit!24075)))

(declare-fun b!684184 () Bool)

(declare-fun res!449795 () Bool)

(assert (=> b!684184 (=> res!449795 e!389669)))

(assert (=> b!684184 (= res!449795 (not (noDuplicate!846 lt!314203)))))

(declare-fun b!684185 () Bool)

(declare-fun lt!314204 () Unit!24072)

(assert (=> b!684185 (= e!389676 lt!314204)))

(declare-fun lt!314199 () Unit!24072)

(assert (=> b!684185 (= lt!314199 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684185 (subseq!185 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39601 List!13022 List!13022 (_ BitVec 32)) Unit!24072)

(assert (=> b!684185 (= lt!314204 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!350 acc!681 (select (arr!18981 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684185 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684186 () Bool)

(declare-fun Unit!24076 () Unit!24072)

(assert (=> b!684186 (= e!389672 Unit!24076)))

(declare-fun b!684187 () Bool)

(declare-fun e!389674 () Bool)

(declare-fun e!389675 () Bool)

(assert (=> b!684187 (= e!389674 e!389675)))

(declare-fun res!449804 () Bool)

(assert (=> b!684187 (=> (not res!449804) (not e!389675))))

(assert (=> b!684187 (= res!449804 (bvsle from!3004 i!1382))))

(declare-fun b!684188 () Bool)

(declare-fun res!449792 () Bool)

(assert (=> b!684188 (=> (not res!449792) (not e!389670))))

(assert (=> b!684188 (= res!449792 (validKeyInArray!0 k!2843))))

(declare-fun b!684189 () Bool)

(declare-fun res!449802 () Bool)

(assert (=> b!684189 (=> (not res!449802) (not e!389670))))

(assert (=> b!684189 (= res!449802 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684190 () Bool)

(declare-fun res!449794 () Bool)

(assert (=> b!684190 (=> (not res!449794) (not e!389670))))

(assert (=> b!684190 (= res!449794 e!389674)))

(declare-fun res!449801 () Bool)

(assert (=> b!684190 (=> res!449801 e!389674)))

(declare-fun e!389673 () Bool)

(assert (=> b!684190 (= res!449801 e!389673)))

(declare-fun res!449798 () Bool)

(assert (=> b!684190 (=> (not res!449798) (not e!389673))))

(assert (=> b!684190 (= res!449798 (bvsgt from!3004 i!1382))))

(declare-fun b!684191 () Bool)

(declare-fun res!449797 () Bool)

(assert (=> b!684191 (=> (not res!449797) (not e!389670))))

(assert (=> b!684191 (= res!449797 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19348 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684192 () Bool)

(assert (=> b!684192 (= e!389675 (not (contains!3599 acc!681 k!2843)))))

(declare-fun b!684193 () Bool)

(assert (=> b!684193 (= e!389673 (contains!3599 acc!681 k!2843))))

(declare-fun b!684194 () Bool)

(declare-fun res!449793 () Bool)

(assert (=> b!684194 (=> res!449793 e!389669)))

(assert (=> b!684194 (= res!449793 lt!314206)))

(assert (= (and start!60992 res!449791) b!684176))

(assert (= (and b!684176 res!449788) b!684175))

(assert (= (and b!684175 res!449803) b!684180))

(assert (= (and b!684180 res!449796) b!684190))

(assert (= (and b!684190 res!449798) b!684193))

(assert (= (and b!684190 (not res!449801)) b!684187))

(assert (= (and b!684187 res!449804) b!684192))

(assert (= (and b!684190 res!449794) b!684174))

(assert (= (and b!684174 res!449800) b!684179))

(assert (= (and b!684179 res!449799) b!684181))

(assert (= (and b!684181 res!449790) b!684188))

(assert (= (and b!684188 res!449792) b!684189))

(assert (= (and b!684189 res!449802) b!684191))

(assert (= (and b!684191 res!449797) b!684178))

(assert (= (and b!684178 c!77561) b!684182))

(assert (= (and b!684178 (not c!77561)) b!684186))

(assert (= (and b!684178 c!77560) b!684185))

(assert (= (and b!684178 (not c!77560)) b!684183))

(assert (= (and b!684178 (not res!449789)) b!684184))

(assert (= (and b!684184 (not res!449795)) b!684194))

(assert (= (and b!684194 (not res!449793)) b!684177))

(declare-fun m!648593 () Bool)

(assert (=> b!684178 m!648593))

(declare-fun m!648595 () Bool)

(assert (=> b!684178 m!648595))

(declare-fun m!648597 () Bool)

(assert (=> b!684178 m!648597))

(declare-fun m!648599 () Bool)

(assert (=> b!684178 m!648599))

(declare-fun m!648601 () Bool)

(assert (=> b!684178 m!648601))

(declare-fun m!648603 () Bool)

(assert (=> b!684178 m!648603))

(declare-fun m!648605 () Bool)

(assert (=> b!684178 m!648605))

(declare-fun m!648607 () Bool)

(assert (=> b!684178 m!648607))

(assert (=> b!684178 m!648597))

(declare-fun m!648609 () Bool)

(assert (=> b!684178 m!648609))

(declare-fun m!648611 () Bool)

(assert (=> b!684178 m!648611))

(declare-fun m!648613 () Bool)

(assert (=> b!684178 m!648613))

(declare-fun m!648615 () Bool)

(assert (=> b!684188 m!648615))

(declare-fun m!648617 () Bool)

(assert (=> b!684174 m!648617))

(declare-fun m!648619 () Bool)

(assert (=> b!684182 m!648619))

(declare-fun m!648621 () Bool)

(assert (=> b!684184 m!648621))

(declare-fun m!648623 () Bool)

(assert (=> b!684179 m!648623))

(declare-fun m!648625 () Bool)

(assert (=> b!684180 m!648625))

(declare-fun m!648627 () Bool)

(assert (=> b!684192 m!648627))

(assert (=> b!684185 m!648593))

(assert (=> b!684185 m!648597))

(declare-fun m!648629 () Bool)

(assert (=> b!684185 m!648629))

(declare-fun m!648631 () Bool)

(assert (=> b!684185 m!648631))

(assert (=> b!684185 m!648597))

(assert (=> b!684185 m!648629))

(assert (=> b!684185 m!648603))

(assert (=> b!684185 m!648613))

(assert (=> b!684177 m!648627))

(declare-fun m!648633 () Bool)

(assert (=> start!60992 m!648633))

(declare-fun m!648635 () Bool)

(assert (=> b!684189 m!648635))

(declare-fun m!648637 () Bool)

(assert (=> b!684175 m!648637))

(declare-fun m!648639 () Bool)

(assert (=> b!684176 m!648639))

(assert (=> b!684193 m!648627))

(push 1)

(assert (not b!684175))

(assert (not b!684178))

(assert (not b!684176))

(assert (not b!684182))

(assert (not b!684179))

(assert (not b!684192))

(assert (not b!684174))

(assert (not b!684185))

(assert (not b!684188))

(assert (not b!684180))

(assert (not start!60992))

(assert (not b!684177))

(assert (not b!684189))

(assert (not b!684184))

(assert (not b!684193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

