; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60880 () Bool)

(assert start!60880)

(declare-fun b!682947 () Bool)

(declare-fun res!448834 () Bool)

(declare-fun e!389067 () Bool)

(assert (=> b!682947 (=> (not res!448834) (not e!389067))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682947 (= res!448834 (validKeyInArray!0 k0!2843))))

(declare-fun b!682948 () Bool)

(assert (=> b!682948 (= e!389067 (not true))))

(declare-datatypes ((List!13005 0))(
  ( (Nil!13002) (Cons!13001 (h!14046 (_ BitVec 64)) (t!19248 List!13005)) )
))
(declare-fun acc!681 () List!13005)

(declare-fun -!133 (List!13005 (_ BitVec 64)) List!13005)

(declare-fun $colon$colon!333 (List!13005 (_ BitVec 64)) List!13005)

(assert (=> b!682948 (= (-!133 ($colon$colon!333 acc!681 k0!2843) k0!2843) acc!681)))

(declare-datatypes ((Unit!23987 0))(
  ( (Unit!23988) )
))
(declare-fun lt!313714 () Unit!23987)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13005) Unit!23987)

(assert (=> b!682948 (= lt!313714 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!168 (List!13005 List!13005) Bool)

(assert (=> b!682948 (subseq!168 acc!681 acc!681)))

(declare-fun lt!313711 () Unit!23987)

(declare-fun lemmaListSubSeqRefl!0 (List!13005) Unit!23987)

(assert (=> b!682948 (= lt!313711 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39564 0))(
  ( (array!39565 (arr!18964 (Array (_ BitVec 32) (_ BitVec 64))) (size!19328 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39564)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39564 (_ BitVec 32) List!13005) Bool)

(assert (=> b!682948 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313713 () Unit!23987)

(declare-fun e!389069 () Unit!23987)

(assert (=> b!682948 (= lt!313713 e!389069)))

(declare-fun c!77425 () Bool)

(assert (=> b!682948 (= c!77425 (validKeyInArray!0 (select (arr!18964 a!3626) from!3004)))))

(declare-fun lt!313716 () Unit!23987)

(declare-fun e!389070 () Unit!23987)

(assert (=> b!682948 (= lt!313716 e!389070)))

(declare-fun c!77426 () Bool)

(declare-fun arrayContainsKey!0 (array!39564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682948 (= c!77426 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682948 (arrayContainsKey!0 (array!39565 (store (arr!18964 a!3626) i!1382 k0!2843) (size!19328 a!3626)) k0!2843 from!3004)))

(declare-fun b!682949 () Bool)

(declare-fun res!448844 () Bool)

(assert (=> b!682949 (=> (not res!448844) (not e!389067))))

(assert (=> b!682949 (= res!448844 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13002))))

(declare-fun b!682950 () Bool)

(declare-fun res!448843 () Bool)

(assert (=> b!682950 (=> (not res!448843) (not e!389067))))

(declare-fun contains!3582 (List!13005 (_ BitVec 64)) Bool)

(assert (=> b!682950 (= res!448843 (not (contains!3582 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682951 () Bool)

(declare-fun res!448842 () Bool)

(assert (=> b!682951 (=> (not res!448842) (not e!389067))))

(assert (=> b!682951 (= res!448842 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19328 a!3626))))))

(declare-fun b!682952 () Bool)

(declare-fun e!389064 () Bool)

(declare-fun e!389066 () Bool)

(assert (=> b!682952 (= e!389064 e!389066)))

(declare-fun res!448837 () Bool)

(assert (=> b!682952 (=> (not res!448837) (not e!389066))))

(assert (=> b!682952 (= res!448837 (bvsle from!3004 i!1382))))

(declare-fun b!682953 () Bool)

(declare-fun lt!313717 () Unit!23987)

(assert (=> b!682953 (= e!389069 lt!313717)))

(declare-fun lt!313712 () Unit!23987)

(assert (=> b!682953 (= lt!313712 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682953 (subseq!168 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39564 List!13005 List!13005 (_ BitVec 32)) Unit!23987)

(assert (=> b!682953 (= lt!313717 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!333 acc!681 (select (arr!18964 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682953 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682954 () Bool)

(declare-fun res!448840 () Bool)

(assert (=> b!682954 (=> (not res!448840) (not e!389067))))

(assert (=> b!682954 (= res!448840 e!389064)))

(declare-fun res!448833 () Bool)

(assert (=> b!682954 (=> res!448833 e!389064)))

(declare-fun e!389065 () Bool)

(assert (=> b!682954 (= res!448833 e!389065)))

(declare-fun res!448831 () Bool)

(assert (=> b!682954 (=> (not res!448831) (not e!389065))))

(assert (=> b!682954 (= res!448831 (bvsgt from!3004 i!1382))))

(declare-fun res!448835 () Bool)

(assert (=> start!60880 (=> (not res!448835) (not e!389067))))

(assert (=> start!60880 (= res!448835 (and (bvslt (size!19328 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19328 a!3626))))))

(assert (=> start!60880 e!389067))

(assert (=> start!60880 true))

(declare-fun array_inv!14760 (array!39564) Bool)

(assert (=> start!60880 (array_inv!14760 a!3626)))

(declare-fun b!682955 () Bool)

(declare-fun Unit!23989 () Unit!23987)

(assert (=> b!682955 (= e!389069 Unit!23989)))

(declare-fun b!682956 () Bool)

(declare-fun res!448839 () Bool)

(assert (=> b!682956 (=> (not res!448839) (not e!389067))))

(assert (=> b!682956 (= res!448839 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682957 () Bool)

(declare-fun res!448841 () Bool)

(assert (=> b!682957 (=> (not res!448841) (not e!389067))))

(assert (=> b!682957 (= res!448841 (not (contains!3582 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682958 () Bool)

(assert (=> b!682958 (= e!389066 (not (contains!3582 acc!681 k0!2843)))))

(declare-fun b!682959 () Bool)

(declare-fun Unit!23990 () Unit!23987)

(assert (=> b!682959 (= e!389070 Unit!23990)))

(declare-fun lt!313715 () Unit!23987)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39564 (_ BitVec 64) (_ BitVec 32)) Unit!23987)

(assert (=> b!682959 (= lt!313715 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682959 false))

(declare-fun b!682960 () Bool)

(declare-fun res!448838 () Bool)

(assert (=> b!682960 (=> (not res!448838) (not e!389067))))

(declare-fun noDuplicate!829 (List!13005) Bool)

(assert (=> b!682960 (= res!448838 (noDuplicate!829 acc!681))))

(declare-fun b!682961 () Bool)

(assert (=> b!682961 (= e!389065 (contains!3582 acc!681 k0!2843))))

(declare-fun b!682962 () Bool)

(declare-fun res!448836 () Bool)

(assert (=> b!682962 (=> (not res!448836) (not e!389067))))

(assert (=> b!682962 (= res!448836 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682963 () Bool)

(declare-fun res!448832 () Bool)

(assert (=> b!682963 (=> (not res!448832) (not e!389067))))

(assert (=> b!682963 (= res!448832 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19328 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682964 () Bool)

(declare-fun Unit!23991 () Unit!23987)

(assert (=> b!682964 (= e!389070 Unit!23991)))

(assert (= (and start!60880 res!448835) b!682960))

(assert (= (and b!682960 res!448838) b!682950))

(assert (= (and b!682950 res!448843) b!682957))

(assert (= (and b!682957 res!448841) b!682954))

(assert (= (and b!682954 res!448831) b!682961))

(assert (= (and b!682954 (not res!448833)) b!682952))

(assert (= (and b!682952 res!448837) b!682958))

(assert (= (and b!682954 res!448840) b!682949))

(assert (= (and b!682949 res!448844) b!682956))

(assert (= (and b!682956 res!448839) b!682951))

(assert (= (and b!682951 res!448842) b!682947))

(assert (= (and b!682947 res!448834) b!682962))

(assert (= (and b!682962 res!448836) b!682963))

(assert (= (and b!682963 res!448832) b!682948))

(assert (= (and b!682948 c!77426) b!682959))

(assert (= (and b!682948 (not c!77426)) b!682964))

(assert (= (and b!682948 c!77425) b!682953))

(assert (= (and b!682948 (not c!77425)) b!682955))

(declare-fun m!647559 () Bool)

(assert (=> b!682949 m!647559))

(declare-fun m!647561 () Bool)

(assert (=> start!60880 m!647561))

(declare-fun m!647563 () Bool)

(assert (=> b!682961 m!647563))

(declare-fun m!647565 () Bool)

(assert (=> b!682950 m!647565))

(declare-fun m!647567 () Bool)

(assert (=> b!682959 m!647567))

(declare-fun m!647569 () Bool)

(assert (=> b!682953 m!647569))

(declare-fun m!647571 () Bool)

(assert (=> b!682953 m!647571))

(declare-fun m!647573 () Bool)

(assert (=> b!682953 m!647573))

(declare-fun m!647575 () Bool)

(assert (=> b!682953 m!647575))

(assert (=> b!682953 m!647571))

(assert (=> b!682953 m!647573))

(declare-fun m!647577 () Bool)

(assert (=> b!682953 m!647577))

(declare-fun m!647579 () Bool)

(assert (=> b!682953 m!647579))

(declare-fun m!647581 () Bool)

(assert (=> b!682962 m!647581))

(declare-fun m!647583 () Bool)

(assert (=> b!682947 m!647583))

(declare-fun m!647585 () Bool)

(assert (=> b!682960 m!647585))

(declare-fun m!647587 () Bool)

(assert (=> b!682957 m!647587))

(assert (=> b!682958 m!647563))

(declare-fun m!647589 () Bool)

(assert (=> b!682948 m!647589))

(declare-fun m!647591 () Bool)

(assert (=> b!682948 m!647591))

(assert (=> b!682948 m!647569))

(assert (=> b!682948 m!647571))

(declare-fun m!647593 () Bool)

(assert (=> b!682948 m!647593))

(declare-fun m!647595 () Bool)

(assert (=> b!682948 m!647595))

(assert (=> b!682948 m!647577))

(declare-fun m!647597 () Bool)

(assert (=> b!682948 m!647597))

(assert (=> b!682948 m!647589))

(assert (=> b!682948 m!647571))

(declare-fun m!647599 () Bool)

(assert (=> b!682948 m!647599))

(declare-fun m!647601 () Bool)

(assert (=> b!682948 m!647601))

(assert (=> b!682948 m!647579))

(declare-fun m!647603 () Bool)

(assert (=> b!682956 m!647603))

(check-sat (not b!682956) (not b!682947) (not b!682953) (not b!682961) (not b!682960) (not b!682948) (not start!60880) (not b!682957) (not b!682959) (not b!682962) (not b!682949) (not b!682950) (not b!682958))
