; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60888 () Bool)

(assert start!60888)

(declare-fun b!683163 () Bool)

(declare-fun res!449000 () Bool)

(declare-fun e!389148 () Bool)

(assert (=> b!683163 (=> (not res!449000) (not e!389148))))

(declare-datatypes ((array!39572 0))(
  ( (array!39573 (arr!18968 (Array (_ BitVec 32) (_ BitVec 64))) (size!19332 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39572)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683163 (= res!449000 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683164 () Bool)

(declare-datatypes ((Unit!24007 0))(
  ( (Unit!24008) )
))
(declare-fun e!389149 () Unit!24007)

(declare-fun Unit!24009 () Unit!24007)

(assert (=> b!683164 (= e!389149 Unit!24009)))

(declare-fun res!448999 () Bool)

(assert (=> start!60888 (=> (not res!448999) (not e!389148))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60888 (= res!448999 (and (bvslt (size!19332 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19332 a!3626))))))

(assert (=> start!60888 e!389148))

(assert (=> start!60888 true))

(declare-fun array_inv!14764 (array!39572) Bool)

(assert (=> start!60888 (array_inv!14764 a!3626)))

(declare-fun b!683165 () Bool)

(declare-fun res!449009 () Bool)

(assert (=> b!683165 (=> (not res!449009) (not e!389148))))

(declare-datatypes ((List!13009 0))(
  ( (Nil!13006) (Cons!13005 (h!14050 (_ BitVec 64)) (t!19252 List!13009)) )
))
(declare-fun arrayNoDuplicates!0 (array!39572 (_ BitVec 32) List!13009) Bool)

(assert (=> b!683165 (= res!449009 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13006))))

(declare-fun b!683166 () Bool)

(declare-fun res!449004 () Bool)

(assert (=> b!683166 (=> (not res!449004) (not e!389148))))

(declare-fun acc!681 () List!13009)

(declare-fun contains!3586 (List!13009 (_ BitVec 64)) Bool)

(assert (=> b!683166 (= res!449004 (not (contains!3586 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683167 () Bool)

(declare-fun e!389152 () Unit!24007)

(declare-fun Unit!24010 () Unit!24007)

(assert (=> b!683167 (= e!389152 Unit!24010)))

(declare-fun lt!313797 () Unit!24007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39572 (_ BitVec 64) (_ BitVec 32)) Unit!24007)

(assert (=> b!683167 (= lt!313797 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683167 false))

(declare-fun b!683168 () Bool)

(declare-fun res!449010 () Bool)

(assert (=> b!683168 (=> (not res!449010) (not e!389148))))

(assert (=> b!683168 (= res!449010 (not (contains!3586 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683169 () Bool)

(declare-fun e!389153 () Bool)

(assert (=> b!683169 (= e!389153 (contains!3586 acc!681 k!2843))))

(declare-fun b!683170 () Bool)

(declare-fun lt!313800 () Unit!24007)

(assert (=> b!683170 (= e!389149 lt!313800)))

(declare-fun lt!313799 () Unit!24007)

(declare-fun lemmaListSubSeqRefl!0 (List!13009) Unit!24007)

(assert (=> b!683170 (= lt!313799 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!172 (List!13009 List!13009) Bool)

(assert (=> b!683170 (subseq!172 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39572 List!13009 List!13009 (_ BitVec 32)) Unit!24007)

(declare-fun $colon$colon!337 (List!13009 (_ BitVec 64)) List!13009)

(assert (=> b!683170 (= lt!313800 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!337 acc!681 (select (arr!18968 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683170 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683171 () Bool)

(declare-fun res!449006 () Bool)

(assert (=> b!683171 (=> (not res!449006) (not e!389148))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683171 (= res!449006 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19332 a!3626))))))

(declare-fun b!683172 () Bool)

(declare-fun res!449011 () Bool)

(assert (=> b!683172 (=> (not res!449011) (not e!389148))))

(declare-fun e!389150 () Bool)

(assert (=> b!683172 (= res!449011 e!389150)))

(declare-fun res!449001 () Bool)

(assert (=> b!683172 (=> res!449001 e!389150)))

(assert (=> b!683172 (= res!449001 e!389153)))

(declare-fun res!449008 () Bool)

(assert (=> b!683172 (=> (not res!449008) (not e!389153))))

(assert (=> b!683172 (= res!449008 (bvsgt from!3004 i!1382))))

(declare-fun b!683173 () Bool)

(declare-fun Unit!24011 () Unit!24007)

(assert (=> b!683173 (= e!389152 Unit!24011)))

(declare-fun b!683174 () Bool)

(declare-fun e!389151 () Bool)

(assert (=> b!683174 (= e!389150 e!389151)))

(declare-fun res!449005 () Bool)

(assert (=> b!683174 (=> (not res!449005) (not e!389151))))

(assert (=> b!683174 (= res!449005 (bvsle from!3004 i!1382))))

(declare-fun b!683175 () Bool)

(declare-fun res!449003 () Bool)

(assert (=> b!683175 (=> (not res!449003) (not e!389148))))

(assert (=> b!683175 (= res!449003 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19332 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683176 () Bool)

(declare-fun res!449002 () Bool)

(assert (=> b!683176 (=> (not res!449002) (not e!389148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683176 (= res!449002 (validKeyInArray!0 k!2843))))

(declare-fun b!683177 () Bool)

(assert (=> b!683177 (= e!389148 (not true))))

(declare-fun -!137 (List!13009 (_ BitVec 64)) List!13009)

(assert (=> b!683177 (= (-!137 ($colon$colon!337 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313801 () Unit!24007)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13009) Unit!24007)

(assert (=> b!683177 (= lt!313801 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!683177 (subseq!172 acc!681 acc!681)))

(declare-fun lt!313795 () Unit!24007)

(assert (=> b!683177 (= lt!313795 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683177 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313798 () Unit!24007)

(assert (=> b!683177 (= lt!313798 e!389149)))

(declare-fun c!77449 () Bool)

(assert (=> b!683177 (= c!77449 (validKeyInArray!0 (select (arr!18968 a!3626) from!3004)))))

(declare-fun lt!313796 () Unit!24007)

(assert (=> b!683177 (= lt!313796 e!389152)))

(declare-fun c!77450 () Bool)

(assert (=> b!683177 (= c!77450 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683177 (arrayContainsKey!0 (array!39573 (store (arr!18968 a!3626) i!1382 k!2843) (size!19332 a!3626)) k!2843 from!3004)))

(declare-fun b!683178 () Bool)

(declare-fun res!449012 () Bool)

(assert (=> b!683178 (=> (not res!449012) (not e!389148))))

(assert (=> b!683178 (= res!449012 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683179 () Bool)

(assert (=> b!683179 (= e!389151 (not (contains!3586 acc!681 k!2843)))))

(declare-fun b!683180 () Bool)

(declare-fun res!449007 () Bool)

(assert (=> b!683180 (=> (not res!449007) (not e!389148))))

(declare-fun noDuplicate!833 (List!13009) Bool)

(assert (=> b!683180 (= res!449007 (noDuplicate!833 acc!681))))

(assert (= (and start!60888 res!448999) b!683180))

(assert (= (and b!683180 res!449007) b!683168))

(assert (= (and b!683168 res!449010) b!683166))

(assert (= (and b!683166 res!449004) b!683172))

(assert (= (and b!683172 res!449008) b!683169))

(assert (= (and b!683172 (not res!449001)) b!683174))

(assert (= (and b!683174 res!449005) b!683179))

(assert (= (and b!683172 res!449011) b!683165))

(assert (= (and b!683165 res!449009) b!683178))

(assert (= (and b!683178 res!449012) b!683171))

(assert (= (and b!683171 res!449006) b!683176))

(assert (= (and b!683176 res!449002) b!683163))

(assert (= (and b!683163 res!449000) b!683175))

(assert (= (and b!683175 res!449003) b!683177))

(assert (= (and b!683177 c!77450) b!683167))

(assert (= (and b!683177 (not c!77450)) b!683173))

(assert (= (and b!683177 c!77449) b!683170))

(assert (= (and b!683177 (not c!77449)) b!683164))

(declare-fun m!647743 () Bool)

(assert (=> b!683169 m!647743))

(declare-fun m!647745 () Bool)

(assert (=> b!683170 m!647745))

(declare-fun m!647747 () Bool)

(assert (=> b!683170 m!647747))

(declare-fun m!647749 () Bool)

(assert (=> b!683170 m!647749))

(declare-fun m!647751 () Bool)

(assert (=> b!683170 m!647751))

(assert (=> b!683170 m!647747))

(assert (=> b!683170 m!647749))

(declare-fun m!647753 () Bool)

(assert (=> b!683170 m!647753))

(declare-fun m!647755 () Bool)

(assert (=> b!683170 m!647755))

(assert (=> b!683179 m!647743))

(declare-fun m!647757 () Bool)

(assert (=> b!683177 m!647757))

(declare-fun m!647759 () Bool)

(assert (=> b!683177 m!647759))

(assert (=> b!683177 m!647745))

(assert (=> b!683177 m!647747))

(declare-fun m!647761 () Bool)

(assert (=> b!683177 m!647761))

(declare-fun m!647763 () Bool)

(assert (=> b!683177 m!647763))

(assert (=> b!683177 m!647753))

(declare-fun m!647765 () Bool)

(assert (=> b!683177 m!647765))

(assert (=> b!683177 m!647757))

(assert (=> b!683177 m!647747))

(declare-fun m!647767 () Bool)

(assert (=> b!683177 m!647767))

(declare-fun m!647769 () Bool)

(assert (=> b!683177 m!647769))

(assert (=> b!683177 m!647755))

(declare-fun m!647771 () Bool)

(assert (=> b!683163 m!647771))

(declare-fun m!647773 () Bool)

(assert (=> b!683180 m!647773))

(declare-fun m!647775 () Bool)

(assert (=> b!683176 m!647775))

(declare-fun m!647777 () Bool)

(assert (=> b!683167 m!647777))

(declare-fun m!647779 () Bool)

(assert (=> b!683165 m!647779))

(declare-fun m!647781 () Bool)

(assert (=> b!683166 m!647781))

(declare-fun m!647783 () Bool)

(assert (=> b!683178 m!647783))

(declare-fun m!647785 () Bool)

(assert (=> start!60888 m!647785))

(declare-fun m!647787 () Bool)

(assert (=> b!683168 m!647787))

(push 1)

(assert (not b!683178))

(assert (not b!683179))

(assert (not b!683169))

(assert (not b!683165))

(assert (not b!683163))

(assert (not b!683176))

(assert (not b!683170))

(assert (not b!683180))

(assert (not start!60888))

(assert (not b!683166))

(assert (not b!683167))

(assert (not b!683177))

(assert (not b!683168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

