; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60084 () Bool)

(assert start!60084)

(declare-fun b!669899 () Bool)

(declare-fun res!436837 () Bool)

(declare-fun e!383035 () Bool)

(assert (=> b!669899 (=> (not res!436837) (not e!383035))))

(declare-datatypes ((array!39142 0))(
  ( (array!39143 (arr!18763 (Array (_ BitVec 32) (_ BitVec 64))) (size!19128 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39142)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669899 (= res!436837 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669900 () Bool)

(declare-fun res!436846 () Bool)

(assert (=> b!669900 (=> (not res!436846) (not e!383035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669900 (= res!436846 (validKeyInArray!0 k!2843))))

(declare-fun b!669901 () Bool)

(declare-fun e!383041 () Bool)

(declare-datatypes ((List!12843 0))(
  ( (Nil!12840) (Cons!12839 (h!13884 (_ BitVec 64)) (t!19062 List!12843)) )
))
(declare-fun acc!681 () List!12843)

(declare-fun contains!3365 (List!12843 (_ BitVec 64)) Bool)

(assert (=> b!669901 (= e!383041 (contains!3365 acc!681 k!2843))))

(declare-fun b!669902 () Bool)

(declare-fun e!383034 () Bool)

(assert (=> b!669902 (= e!383035 (not e!383034))))

(declare-fun res!436841 () Bool)

(assert (=> b!669902 (=> res!436841 e!383034)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669902 (= res!436841 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!311679 () List!12843)

(declare-fun arrayNoDuplicates!0 (array!39142 (_ BitVec 32) List!12843) Bool)

(assert (=> b!669902 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311679)))

(declare-datatypes ((Unit!23523 0))(
  ( (Unit!23524) )
))
(declare-fun lt!311681 () Unit!23523)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39142 (_ BitVec 64) (_ BitVec 32) List!12843 List!12843) Unit!23523)

(assert (=> b!669902 (= lt!311681 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311679))))

(declare-fun -!119 (List!12843 (_ BitVec 64)) List!12843)

(assert (=> b!669902 (= (-!119 lt!311679 k!2843) acc!681)))

(declare-fun $colon$colon!252 (List!12843 (_ BitVec 64)) List!12843)

(assert (=> b!669902 (= lt!311679 ($colon$colon!252 acc!681 k!2843))))

(declare-fun lt!311678 () Unit!23523)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12843) Unit!23523)

(assert (=> b!669902 (= lt!311678 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!121 (List!12843 List!12843) Bool)

(assert (=> b!669902 (subseq!121 acc!681 acc!681)))

(declare-fun lt!311682 () Unit!23523)

(declare-fun lemmaListSubSeqRefl!0 (List!12843) Unit!23523)

(assert (=> b!669902 (= lt!311682 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669902 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311676 () Unit!23523)

(declare-fun e!383036 () Unit!23523)

(assert (=> b!669902 (= lt!311676 e!383036)))

(declare-fun c!76902 () Bool)

(assert (=> b!669902 (= c!76902 (validKeyInArray!0 (select (arr!18763 a!3626) from!3004)))))

(declare-fun lt!311685 () Unit!23523)

(declare-fun e!383038 () Unit!23523)

(assert (=> b!669902 (= lt!311685 e!383038)))

(declare-fun c!76901 () Bool)

(assert (=> b!669902 (= c!76901 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!311683 () array!39142)

(assert (=> b!669902 (arrayContainsKey!0 lt!311683 k!2843 from!3004)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669902 (= lt!311683 (array!39143 (store (arr!18763 a!3626) i!1382 k!2843) (size!19128 a!3626)))))

(declare-fun b!669903 () Bool)

(declare-fun e!383040 () Bool)

(assert (=> b!669903 (= e!383040 (not (contains!3365 acc!681 k!2843)))))

(declare-fun b!669904 () Bool)

(declare-fun res!436850 () Bool)

(assert (=> b!669904 (=> (not res!436850) (not e!383035))))

(assert (=> b!669904 (= res!436850 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19128 a!3626))))))

(declare-fun b!669905 () Bool)

(declare-fun Unit!23525 () Unit!23523)

(assert (=> b!669905 (= e!383038 Unit!23525)))

(declare-fun res!436840 () Bool)

(assert (=> start!60084 (=> (not res!436840) (not e!383035))))

(assert (=> start!60084 (= res!436840 (and (bvslt (size!19128 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19128 a!3626))))))

(assert (=> start!60084 e!383035))

(assert (=> start!60084 true))

(declare-fun array_inv!14646 (array!39142) Bool)

(assert (=> start!60084 (array_inv!14646 a!3626)))

(declare-fun b!669906 () Bool)

(declare-fun res!436835 () Bool)

(assert (=> b!669906 (=> res!436835 e!383034)))

(assert (=> b!669906 (= res!436835 (contains!3365 lt!311679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669907 () Bool)

(declare-fun res!436843 () Bool)

(assert (=> b!669907 (=> (not res!436843) (not e!383035))))

(assert (=> b!669907 (= res!436843 (not (contains!3365 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669908 () Bool)

(declare-fun Unit!23526 () Unit!23523)

(assert (=> b!669908 (= e!383038 Unit!23526)))

(declare-fun lt!311675 () Unit!23523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39142 (_ BitVec 64) (_ BitVec 32)) Unit!23523)

(assert (=> b!669908 (= lt!311675 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669908 false))

(declare-fun b!669909 () Bool)

(declare-fun e!383039 () Bool)

(assert (=> b!669909 (= e!383039 e!383040)))

(declare-fun res!436834 () Bool)

(assert (=> b!669909 (=> (not res!436834) (not e!383040))))

(assert (=> b!669909 (= res!436834 (bvsle from!3004 i!1382))))

(declare-fun b!669910 () Bool)

(declare-fun res!436851 () Bool)

(assert (=> b!669910 (=> res!436851 e!383034)))

(assert (=> b!669910 (= res!436851 (contains!3365 lt!311679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669911 () Bool)

(declare-fun e!383032 () Bool)

(assert (=> b!669911 (= e!383032 (not (contains!3365 lt!311679 k!2843)))))

(declare-fun b!669912 () Bool)

(declare-fun res!436838 () Bool)

(assert (=> b!669912 (=> res!436838 e!383034)))

(declare-fun e!383037 () Bool)

(assert (=> b!669912 (= res!436838 e!383037)))

(declare-fun res!436847 () Bool)

(assert (=> b!669912 (=> (not res!436847) (not e!383037))))

(assert (=> b!669912 (= res!436847 e!383032)))

(declare-fun res!436845 () Bool)

(assert (=> b!669912 (=> res!436845 e!383032)))

(assert (=> b!669912 (= res!436845 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669913 () Bool)

(declare-fun res!436842 () Bool)

(assert (=> b!669913 (=> (not res!436842) (not e!383035))))

(assert (=> b!669913 (= res!436842 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669914 () Bool)

(declare-fun e!383042 () Bool)

(assert (=> b!669914 (= e!383042 (contains!3365 lt!311679 k!2843))))

(declare-fun b!669915 () Bool)

(declare-fun res!436831 () Bool)

(assert (=> b!669915 (=> (not res!436831) (not e!383035))))

(assert (=> b!669915 (= res!436831 e!383039)))

(declare-fun res!436839 () Bool)

(assert (=> b!669915 (=> res!436839 e!383039)))

(assert (=> b!669915 (= res!436839 e!383041)))

(declare-fun res!436836 () Bool)

(assert (=> b!669915 (=> (not res!436836) (not e!383041))))

(assert (=> b!669915 (= res!436836 (bvsgt from!3004 i!1382))))

(declare-fun b!669916 () Bool)

(declare-fun Unit!23527 () Unit!23523)

(assert (=> b!669916 (= e!383036 Unit!23527)))

(declare-fun b!669917 () Bool)

(declare-fun res!436832 () Bool)

(assert (=> b!669917 (=> (not res!436832) (not e!383035))))

(declare-fun noDuplicate!634 (List!12843) Bool)

(assert (=> b!669917 (= res!436832 (noDuplicate!634 acc!681))))

(declare-fun b!669918 () Bool)

(assert (=> b!669918 (= e!383037 e!383042)))

(declare-fun res!436848 () Bool)

(assert (=> b!669918 (=> res!436848 e!383042)))

(assert (=> b!669918 (= res!436848 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669919 () Bool)

(assert (=> b!669919 (= e!383034 true)))

(assert (=> b!669919 (arrayNoDuplicates!0 lt!311683 (bvadd #b00000000000000000000000000000001 from!3004) lt!311679)))

(declare-fun lt!311677 () Unit!23523)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39142 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12843) Unit!23523)

(assert (=> b!669919 (= lt!311677 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311679))))

(declare-fun b!669920 () Bool)

(declare-fun res!436844 () Bool)

(assert (=> b!669920 (=> (not res!436844) (not e!383035))))

(assert (=> b!669920 (= res!436844 (not (contains!3365 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669921 () Bool)

(declare-fun res!436849 () Bool)

(assert (=> b!669921 (=> res!436849 e!383034)))

(assert (=> b!669921 (= res!436849 (not (noDuplicate!634 lt!311679)))))

(declare-fun b!669922 () Bool)

(declare-fun res!436852 () Bool)

(assert (=> b!669922 (=> (not res!436852) (not e!383035))))

(assert (=> b!669922 (= res!436852 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19128 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669923 () Bool)

(declare-fun res!436833 () Bool)

(assert (=> b!669923 (=> (not res!436833) (not e!383035))))

(assert (=> b!669923 (= res!436833 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12840))))

(declare-fun b!669924 () Bool)

(declare-fun lt!311684 () Unit!23523)

(assert (=> b!669924 (= e!383036 lt!311684)))

(declare-fun lt!311680 () Unit!23523)

(assert (=> b!669924 (= lt!311680 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669924 (subseq!121 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39142 List!12843 List!12843 (_ BitVec 32)) Unit!23523)

(assert (=> b!669924 (= lt!311684 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!252 acc!681 (select (arr!18763 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669924 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60084 res!436840) b!669917))

(assert (= (and b!669917 res!436832) b!669907))

(assert (= (and b!669907 res!436843) b!669920))

(assert (= (and b!669920 res!436844) b!669915))

(assert (= (and b!669915 res!436836) b!669901))

(assert (= (and b!669915 (not res!436839)) b!669909))

(assert (= (and b!669909 res!436834) b!669903))

(assert (= (and b!669915 res!436831) b!669923))

(assert (= (and b!669923 res!436833) b!669913))

(assert (= (and b!669913 res!436842) b!669904))

(assert (= (and b!669904 res!436850) b!669900))

(assert (= (and b!669900 res!436846) b!669899))

(assert (= (and b!669899 res!436837) b!669922))

(assert (= (and b!669922 res!436852) b!669902))

(assert (= (and b!669902 c!76901) b!669908))

(assert (= (and b!669902 (not c!76901)) b!669905))

(assert (= (and b!669902 c!76902) b!669924))

(assert (= (and b!669902 (not c!76902)) b!669916))

(assert (= (and b!669902 (not res!436841)) b!669921))

(assert (= (and b!669921 (not res!436849)) b!669906))

(assert (= (and b!669906 (not res!436835)) b!669910))

(assert (= (and b!669910 (not res!436851)) b!669912))

(assert (= (and b!669912 (not res!436845)) b!669911))

(assert (= (and b!669912 res!436847) b!669918))

(assert (= (and b!669918 (not res!436848)) b!669914))

(assert (= (and b!669912 (not res!436838)) b!669919))

(declare-fun m!639343 () Bool)

(assert (=> b!669920 m!639343))

(declare-fun m!639345 () Bool)

(assert (=> start!60084 m!639345))

(declare-fun m!639347 () Bool)

(assert (=> b!669921 m!639347))

(declare-fun m!639349 () Bool)

(assert (=> b!669914 m!639349))

(declare-fun m!639351 () Bool)

(assert (=> b!669907 m!639351))

(declare-fun m!639353 () Bool)

(assert (=> b!669913 m!639353))

(assert (=> b!669911 m!639349))

(declare-fun m!639355 () Bool)

(assert (=> b!669923 m!639355))

(declare-fun m!639357 () Bool)

(assert (=> b!669902 m!639357))

(declare-fun m!639359 () Bool)

(assert (=> b!669902 m!639359))

(declare-fun m!639361 () Bool)

(assert (=> b!669902 m!639361))

(declare-fun m!639363 () Bool)

(assert (=> b!669902 m!639363))

(declare-fun m!639365 () Bool)

(assert (=> b!669902 m!639365))

(declare-fun m!639367 () Bool)

(assert (=> b!669902 m!639367))

(assert (=> b!669902 m!639359))

(declare-fun m!639369 () Bool)

(assert (=> b!669902 m!639369))

(declare-fun m!639371 () Bool)

(assert (=> b!669902 m!639371))

(declare-fun m!639373 () Bool)

(assert (=> b!669902 m!639373))

(declare-fun m!639375 () Bool)

(assert (=> b!669902 m!639375))

(declare-fun m!639377 () Bool)

(assert (=> b!669902 m!639377))

(declare-fun m!639379 () Bool)

(assert (=> b!669902 m!639379))

(declare-fun m!639381 () Bool)

(assert (=> b!669902 m!639381))

(declare-fun m!639383 () Bool)

(assert (=> b!669900 m!639383))

(declare-fun m!639385 () Bool)

(assert (=> b!669908 m!639385))

(declare-fun m!639387 () Bool)

(assert (=> b!669901 m!639387))

(assert (=> b!669924 m!639375))

(assert (=> b!669924 m!639359))

(declare-fun m!639389 () Bool)

(assert (=> b!669924 m!639389))

(declare-fun m!639391 () Bool)

(assert (=> b!669924 m!639391))

(assert (=> b!669924 m!639359))

(assert (=> b!669924 m!639389))

(assert (=> b!669924 m!639365))

(assert (=> b!669924 m!639371))

(assert (=> b!669903 m!639387))

(declare-fun m!639393 () Bool)

(assert (=> b!669910 m!639393))

(declare-fun m!639395 () Bool)

(assert (=> b!669917 m!639395))

(declare-fun m!639397 () Bool)

(assert (=> b!669919 m!639397))

(declare-fun m!639399 () Bool)

(assert (=> b!669919 m!639399))

(declare-fun m!639401 () Bool)

(assert (=> b!669906 m!639401))

(declare-fun m!639403 () Bool)

(assert (=> b!669899 m!639403))

(push 1)

(assert (not b!669902))

(assert (not b!669923))

(assert (not b!669900))

(assert (not b!669910))

(assert (not b!669899))

(assert (not b!669924))

(assert (not b!669919))

(assert (not b!669908))

(assert (not b!669913))

(assert (not b!669920))

(assert (not b!669907))

(assert (not b!669914))

(assert (not b!669921))

(assert (not b!669917))

(assert (not b!669911))

(assert (not b!669901))

(assert (not start!60084))

(assert (not b!669903))

(assert (not b!669906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

