; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60994 () Bool)

(assert start!60994)

(declare-fun b!684237 () Bool)

(declare-datatypes ((Unit!24077 0))(
  ( (Unit!24078) )
))
(declare-fun e!389693 () Unit!24077)

(declare-fun lt!314234 () Unit!24077)

(assert (=> b!684237 (= e!389693 lt!314234)))

(declare-fun lt!314236 () Unit!24077)

(declare-datatypes ((List!13023 0))(
  ( (Nil!13020) (Cons!13019 (h!14064 (_ BitVec 64)) (t!19269 List!13023)) )
))
(declare-fun acc!681 () List!13023)

(declare-fun lemmaListSubSeqRefl!0 (List!13023) Unit!24077)

(assert (=> b!684237 (= lt!314236 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!186 (List!13023 List!13023) Bool)

(assert (=> b!684237 (subseq!186 acc!681 acc!681)))

(declare-datatypes ((array!39603 0))(
  ( (array!39604 (arr!18982 (Array (_ BitVec 32) (_ BitVec 64))) (size!19349 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39603)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39603 List!13023 List!13023 (_ BitVec 32)) Unit!24077)

(declare-fun $colon$colon!351 (List!13023 (_ BitVec 64)) List!13023)

(assert (=> b!684237 (= lt!314234 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!351 acc!681 (select (arr!18982 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39603 (_ BitVec 32) List!13023) Bool)

(assert (=> b!684237 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684238 () Bool)

(declare-fun res!449853 () Bool)

(declare-fun e!389698 () Bool)

(assert (=> b!684238 (=> (not res!449853) (not e!389698))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684238 (= res!449853 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19349 a!3626))))))

(declare-fun b!684239 () Bool)

(declare-fun res!449846 () Bool)

(assert (=> b!684239 (=> (not res!449846) (not e!389698))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684239 (= res!449846 (validKeyInArray!0 k0!2843))))

(declare-fun b!684240 () Bool)

(declare-fun res!449855 () Bool)

(assert (=> b!684240 (=> (not res!449855) (not e!389698))))

(assert (=> b!684240 (= res!449855 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13020))))

(declare-fun b!684241 () Bool)

(declare-fun res!449848 () Bool)

(assert (=> b!684241 (=> (not res!449848) (not e!389698))))

(declare-fun noDuplicate!847 (List!13023) Bool)

(assert (=> b!684241 (= res!449848 (noDuplicate!847 acc!681))))

(declare-fun b!684242 () Bool)

(declare-fun e!389694 () Bool)

(assert (=> b!684242 (= e!389698 (not e!389694))))

(declare-fun res!449843 () Bool)

(assert (=> b!684242 (=> res!449843 e!389694)))

(assert (=> b!684242 (= res!449843 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!314230 () List!13023)

(declare-fun -!151 (List!13023 (_ BitVec 64)) List!13023)

(assert (=> b!684242 (= (-!151 lt!314230 k0!2843) acc!681)))

(assert (=> b!684242 (= lt!314230 ($colon$colon!351 acc!681 k0!2843))))

(declare-fun lt!314229 () Unit!24077)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13023) Unit!24077)

(assert (=> b!684242 (= lt!314229 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!684242 (subseq!186 acc!681 acc!681)))

(declare-fun lt!314233 () Unit!24077)

(assert (=> b!684242 (= lt!314233 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684242 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314231 () Unit!24077)

(assert (=> b!684242 (= lt!314231 e!389693)))

(declare-fun c!77566 () Bool)

(assert (=> b!684242 (= c!77566 (validKeyInArray!0 (select (arr!18982 a!3626) from!3004)))))

(declare-fun lt!314235 () Unit!24077)

(declare-fun e!389695 () Unit!24077)

(assert (=> b!684242 (= lt!314235 e!389695)))

(declare-fun c!77567 () Bool)

(declare-fun lt!314228 () Bool)

(assert (=> b!684242 (= c!77567 lt!314228)))

(declare-fun arrayContainsKey!0 (array!39603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684242 (= lt!314228 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684242 (arrayContainsKey!0 (array!39604 (store (arr!18982 a!3626) i!1382 k0!2843) (size!19349 a!3626)) k0!2843 from!3004)))

(declare-fun b!684243 () Bool)

(declare-fun res!449850 () Bool)

(assert (=> b!684243 (=> (not res!449850) (not e!389698))))

(declare-fun e!389697 () Bool)

(assert (=> b!684243 (= res!449850 e!389697)))

(declare-fun res!449844 () Bool)

(assert (=> b!684243 (=> res!449844 e!389697)))

(declare-fun e!389700 () Bool)

(assert (=> b!684243 (= res!449844 e!389700)))

(declare-fun res!449847 () Bool)

(assert (=> b!684243 (=> (not res!449847) (not e!389700))))

(assert (=> b!684243 (= res!449847 (bvsgt from!3004 i!1382))))

(declare-fun b!684244 () Bool)

(declare-fun Unit!24079 () Unit!24077)

(assert (=> b!684244 (= e!389695 Unit!24079)))

(declare-fun b!684245 () Bool)

(declare-fun res!449849 () Bool)

(assert (=> b!684245 (=> (not res!449849) (not e!389698))))

(assert (=> b!684245 (= res!449849 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684247 () Bool)

(declare-fun contains!3600 (List!13023 (_ BitVec 64)) Bool)

(assert (=> b!684247 (= e!389700 (contains!3600 acc!681 k0!2843))))

(declare-fun b!684248 () Bool)

(declare-fun res!449854 () Bool)

(assert (=> b!684248 (=> (not res!449854) (not e!389698))))

(assert (=> b!684248 (= res!449854 (not (contains!3600 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684249 () Bool)

(declare-fun e!389699 () Bool)

(assert (=> b!684249 (= e!389699 (not (contains!3600 acc!681 k0!2843)))))

(declare-fun b!684250 () Bool)

(declare-fun res!449842 () Bool)

(assert (=> b!684250 (=> (not res!449842) (not e!389698))))

(assert (=> b!684250 (= res!449842 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19349 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684251 () Bool)

(assert (=> b!684251 (= e!389694 true)))

(declare-fun lt!314232 () Bool)

(assert (=> b!684251 (= lt!314232 (contains!3600 acc!681 k0!2843))))

(declare-fun b!684252 () Bool)

(declare-fun Unit!24080 () Unit!24077)

(assert (=> b!684252 (= e!389695 Unit!24080)))

(declare-fun lt!314227 () Unit!24077)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39603 (_ BitVec 64) (_ BitVec 32)) Unit!24077)

(assert (=> b!684252 (= lt!314227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684252 false))

(declare-fun b!684253 () Bool)

(assert (=> b!684253 (= e!389697 e!389699)))

(declare-fun res!449851 () Bool)

(assert (=> b!684253 (=> (not res!449851) (not e!389699))))

(assert (=> b!684253 (= res!449851 (bvsle from!3004 i!1382))))

(declare-fun b!684254 () Bool)

(declare-fun res!449845 () Bool)

(assert (=> b!684254 (=> (not res!449845) (not e!389698))))

(assert (=> b!684254 (= res!449845 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684255 () Bool)

(declare-fun res!449852 () Bool)

(assert (=> b!684255 (=> (not res!449852) (not e!389698))))

(assert (=> b!684255 (= res!449852 (not (contains!3600 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684256 () Bool)

(declare-fun res!449839 () Bool)

(assert (=> b!684256 (=> res!449839 e!389694)))

(assert (=> b!684256 (= res!449839 (not (noDuplicate!847 lt!314230)))))

(declare-fun b!684257 () Bool)

(declare-fun Unit!24081 () Unit!24077)

(assert (=> b!684257 (= e!389693 Unit!24081)))

(declare-fun b!684246 () Bool)

(declare-fun res!449841 () Bool)

(assert (=> b!684246 (=> res!449841 e!389694)))

(assert (=> b!684246 (= res!449841 lt!314228)))

(declare-fun res!449840 () Bool)

(assert (=> start!60994 (=> (not res!449840) (not e!389698))))

(assert (=> start!60994 (= res!449840 (and (bvslt (size!19349 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19349 a!3626))))))

(assert (=> start!60994 e!389698))

(assert (=> start!60994 true))

(declare-fun array_inv!14778 (array!39603) Bool)

(assert (=> start!60994 (array_inv!14778 a!3626)))

(assert (= (and start!60994 res!449840) b!684241))

(assert (= (and b!684241 res!449848) b!684255))

(assert (= (and b!684255 res!449852) b!684248))

(assert (= (and b!684248 res!449854) b!684243))

(assert (= (and b!684243 res!449847) b!684247))

(assert (= (and b!684243 (not res!449844)) b!684253))

(assert (= (and b!684253 res!449851) b!684249))

(assert (= (and b!684243 res!449850) b!684240))

(assert (= (and b!684240 res!449855) b!684254))

(assert (= (and b!684254 res!449845) b!684238))

(assert (= (and b!684238 res!449853) b!684239))

(assert (= (and b!684239 res!449846) b!684245))

(assert (= (and b!684245 res!449849) b!684250))

(assert (= (and b!684250 res!449842) b!684242))

(assert (= (and b!684242 c!77567) b!684252))

(assert (= (and b!684242 (not c!77567)) b!684244))

(assert (= (and b!684242 c!77566) b!684237))

(assert (= (and b!684242 (not c!77566)) b!684257))

(assert (= (and b!684242 (not res!449843)) b!684256))

(assert (= (and b!684256 (not res!449839)) b!684246))

(assert (= (and b!684246 (not res!449841)) b!684251))

(declare-fun m!648641 () Bool)

(assert (=> b!684237 m!648641))

(declare-fun m!648643 () Bool)

(assert (=> b!684237 m!648643))

(declare-fun m!648645 () Bool)

(assert (=> b!684237 m!648645))

(declare-fun m!648647 () Bool)

(assert (=> b!684237 m!648647))

(assert (=> b!684237 m!648643))

(assert (=> b!684237 m!648645))

(declare-fun m!648649 () Bool)

(assert (=> b!684237 m!648649))

(declare-fun m!648651 () Bool)

(assert (=> b!684237 m!648651))

(declare-fun m!648653 () Bool)

(assert (=> b!684255 m!648653))

(declare-fun m!648655 () Bool)

(assert (=> b!684247 m!648655))

(declare-fun m!648657 () Bool)

(assert (=> b!684245 m!648657))

(declare-fun m!648659 () Bool)

(assert (=> start!60994 m!648659))

(declare-fun m!648661 () Bool)

(assert (=> b!684240 m!648661))

(assert (=> b!684242 m!648643))

(declare-fun m!648663 () Bool)

(assert (=> b!684242 m!648663))

(declare-fun m!648665 () Bool)

(assert (=> b!684242 m!648665))

(assert (=> b!684242 m!648649))

(declare-fun m!648667 () Bool)

(assert (=> b!684242 m!648667))

(declare-fun m!648669 () Bool)

(assert (=> b!684242 m!648669))

(assert (=> b!684242 m!648643))

(declare-fun m!648671 () Bool)

(assert (=> b!684242 m!648671))

(assert (=> b!684242 m!648641))

(declare-fun m!648673 () Bool)

(assert (=> b!684242 m!648673))

(declare-fun m!648675 () Bool)

(assert (=> b!684242 m!648675))

(assert (=> b!684242 m!648651))

(assert (=> b!684251 m!648655))

(assert (=> b!684249 m!648655))

(declare-fun m!648677 () Bool)

(assert (=> b!684239 m!648677))

(declare-fun m!648679 () Bool)

(assert (=> b!684256 m!648679))

(declare-fun m!648681 () Bool)

(assert (=> b!684248 m!648681))

(declare-fun m!648683 () Bool)

(assert (=> b!684252 m!648683))

(declare-fun m!648685 () Bool)

(assert (=> b!684254 m!648685))

(declare-fun m!648687 () Bool)

(assert (=> b!684241 m!648687))

(check-sat (not b!684256) (not b!684241) (not b!684255) (not b!684245) (not b!684247) (not b!684248) (not b!684249) (not start!60994) (not b!684239) (not b!684252) (not b!684240) (not b!684237) (not b!684251) (not b!684254) (not b!684242))
(check-sat)
