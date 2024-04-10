; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61574 () Bool)

(assert start!61574)

(declare-fun b!688943 () Bool)

(declare-fun res!453583 () Bool)

(declare-fun e!392330 () Bool)

(assert (=> b!688943 (=> (not res!453583) (not e!392330))))

(declare-datatypes ((array!39715 0))(
  ( (array!39716 (arr!19029 (Array (_ BitVec 32) (_ BitVec 64))) (size!19411 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39715)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688943 (= res!453583 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688944 () Bool)

(declare-fun e!392340 () Bool)

(declare-fun e!392337 () Bool)

(assert (=> b!688944 (= e!392340 e!392337)))

(declare-fun res!453582 () Bool)

(assert (=> b!688944 (=> (not res!453582) (not e!392337))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688944 (= res!453582 (bvsle from!3004 i!1382))))

(declare-fun b!688945 () Bool)

(declare-fun res!453573 () Bool)

(declare-fun e!392334 () Bool)

(assert (=> b!688945 (=> res!453573 e!392334)))

(declare-datatypes ((List!13070 0))(
  ( (Nil!13067) (Cons!13066 (h!14111 (_ BitVec 64)) (t!19334 List!13070)) )
))
(declare-fun lt!315970 () List!13070)

(declare-fun contains!3647 (List!13070 (_ BitVec 64)) Bool)

(assert (=> b!688945 (= res!453573 (contains!3647 lt!315970 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688946 () Bool)

(assert (=> b!688946 (= e!392334 true)))

(declare-fun lt!315971 () Bool)

(declare-fun e!392335 () Bool)

(assert (=> b!688946 (= lt!315971 e!392335)))

(declare-fun res!453575 () Bool)

(assert (=> b!688946 (=> res!453575 e!392335)))

(declare-fun e!392331 () Bool)

(assert (=> b!688946 (= res!453575 e!392331)))

(declare-fun res!453572 () Bool)

(assert (=> b!688946 (=> (not res!453572) (not e!392331))))

(assert (=> b!688946 (= res!453572 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688947 () Bool)

(assert (=> b!688947 (= e!392330 (not e!392334))))

(declare-fun res!453578 () Bool)

(assert (=> b!688947 (=> res!453578 e!392334)))

(assert (=> b!688947 (= res!453578 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39715 (_ BitVec 32) List!13070) Bool)

(assert (=> b!688947 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315970)))

(declare-fun acc!681 () List!13070)

(declare-datatypes ((Unit!24312 0))(
  ( (Unit!24313) )
))
(declare-fun lt!315978 () Unit!24312)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39715 (_ BitVec 64) (_ BitVec 32) List!13070 List!13070) Unit!24312)

(assert (=> b!688947 (= lt!315978 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315970))))

(declare-fun -!198 (List!13070 (_ BitVec 64)) List!13070)

(assert (=> b!688947 (= (-!198 lt!315970 k!2843) acc!681)))

(declare-fun $colon$colon!398 (List!13070 (_ BitVec 64)) List!13070)

(assert (=> b!688947 (= lt!315970 ($colon$colon!398 acc!681 k!2843))))

(declare-fun lt!315972 () Unit!24312)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13070) Unit!24312)

(assert (=> b!688947 (= lt!315972 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!233 (List!13070 List!13070) Bool)

(assert (=> b!688947 (subseq!233 acc!681 acc!681)))

(declare-fun lt!315976 () Unit!24312)

(declare-fun lemmaListSubSeqRefl!0 (List!13070) Unit!24312)

(assert (=> b!688947 (= lt!315976 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688947 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315973 () Unit!24312)

(declare-fun e!392339 () Unit!24312)

(assert (=> b!688947 (= lt!315973 e!392339)))

(declare-fun c!78055 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688947 (= c!78055 (validKeyInArray!0 (select (arr!19029 a!3626) from!3004)))))

(declare-fun lt!315977 () Unit!24312)

(declare-fun e!392338 () Unit!24312)

(assert (=> b!688947 (= lt!315977 e!392338)))

(declare-fun c!78056 () Bool)

(assert (=> b!688947 (= c!78056 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688947 (arrayContainsKey!0 (array!39716 (store (arr!19029 a!3626) i!1382 k!2843) (size!19411 a!3626)) k!2843 from!3004)))

(declare-fun b!688948 () Bool)

(assert (=> b!688948 (= e!392331 (contains!3647 lt!315970 k!2843))))

(declare-fun b!688949 () Bool)

(declare-fun res!453586 () Bool)

(assert (=> b!688949 (=> (not res!453586) (not e!392330))))

(assert (=> b!688949 (= res!453586 (validKeyInArray!0 k!2843))))

(declare-fun b!688950 () Bool)

(declare-fun res!453571 () Bool)

(assert (=> b!688950 (=> res!453571 e!392334)))

(declare-fun noDuplicate!894 (List!13070) Bool)

(assert (=> b!688950 (= res!453571 (not (noDuplicate!894 lt!315970)))))

(declare-fun b!688951 () Bool)

(declare-fun res!453587 () Bool)

(assert (=> b!688951 (=> (not res!453587) (not e!392330))))

(assert (=> b!688951 (= res!453587 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19411 a!3626))))))

(declare-fun b!688952 () Bool)

(declare-fun res!453567 () Bool)

(assert (=> b!688952 (=> (not res!453567) (not e!392330))))

(assert (=> b!688952 (= res!453567 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13067))))

(declare-fun b!688953 () Bool)

(declare-fun res!453574 () Bool)

(assert (=> b!688953 (=> (not res!453574) (not e!392330))))

(assert (=> b!688953 (= res!453574 (not (contains!3647 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688954 () Bool)

(declare-fun Unit!24314 () Unit!24312)

(assert (=> b!688954 (= e!392339 Unit!24314)))

(declare-fun b!688955 () Bool)

(declare-fun Unit!24315 () Unit!24312)

(assert (=> b!688955 (= e!392338 Unit!24315)))

(declare-fun lt!315979 () Unit!24312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39715 (_ BitVec 64) (_ BitVec 32)) Unit!24312)

(assert (=> b!688955 (= lt!315979 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688955 false))

(declare-fun b!688956 () Bool)

(declare-fun Unit!24316 () Unit!24312)

(assert (=> b!688956 (= e!392338 Unit!24316)))

(declare-fun b!688957 () Bool)

(declare-fun res!453581 () Bool)

(assert (=> b!688957 (=> (not res!453581) (not e!392330))))

(assert (=> b!688957 (= res!453581 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19411 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688958 () Bool)

(declare-fun e!392333 () Bool)

(assert (=> b!688958 (= e!392333 (contains!3647 acc!681 k!2843))))

(declare-fun res!453570 () Bool)

(assert (=> start!61574 (=> (not res!453570) (not e!392330))))

(assert (=> start!61574 (= res!453570 (and (bvslt (size!19411 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19411 a!3626))))))

(assert (=> start!61574 e!392330))

(assert (=> start!61574 true))

(declare-fun array_inv!14825 (array!39715) Bool)

(assert (=> start!61574 (array_inv!14825 a!3626)))

(declare-fun b!688959 () Bool)

(declare-fun res!453577 () Bool)

(assert (=> b!688959 (=> (not res!453577) (not e!392330))))

(assert (=> b!688959 (= res!453577 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688960 () Bool)

(declare-fun res!453569 () Bool)

(assert (=> b!688960 (=> (not res!453569) (not e!392330))))

(assert (=> b!688960 (= res!453569 (noDuplicate!894 acc!681))))

(declare-fun b!688961 () Bool)

(declare-fun e!392336 () Bool)

(assert (=> b!688961 (= e!392336 (not (contains!3647 lt!315970 k!2843)))))

(declare-fun b!688962 () Bool)

(declare-fun lt!315974 () Unit!24312)

(assert (=> b!688962 (= e!392339 lt!315974)))

(declare-fun lt!315975 () Unit!24312)

(assert (=> b!688962 (= lt!315975 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688962 (subseq!233 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39715 List!13070 List!13070 (_ BitVec 32)) Unit!24312)

(assert (=> b!688962 (= lt!315974 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!398 acc!681 (select (arr!19029 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688962 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688963 () Bool)

(declare-fun res!453584 () Bool)

(assert (=> b!688963 (=> (not res!453584) (not e!392330))))

(assert (=> b!688963 (= res!453584 e!392340)))

(declare-fun res!453580 () Bool)

(assert (=> b!688963 (=> res!453580 e!392340)))

(assert (=> b!688963 (= res!453580 e!392333)))

(declare-fun res!453576 () Bool)

(assert (=> b!688963 (=> (not res!453576) (not e!392333))))

(assert (=> b!688963 (= res!453576 (bvsgt from!3004 i!1382))))

(declare-fun b!688964 () Bool)

(declare-fun res!453579 () Bool)

(assert (=> b!688964 (=> (not res!453579) (not e!392330))))

(assert (=> b!688964 (= res!453579 (not (contains!3647 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688965 () Bool)

(declare-fun res!453585 () Bool)

(assert (=> b!688965 (=> res!453585 e!392334)))

(assert (=> b!688965 (= res!453585 (contains!3647 lt!315970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688966 () Bool)

(assert (=> b!688966 (= e!392337 (not (contains!3647 acc!681 k!2843)))))

(declare-fun b!688967 () Bool)

(assert (=> b!688967 (= e!392335 e!392336)))

(declare-fun res!453568 () Bool)

(assert (=> b!688967 (=> (not res!453568) (not e!392336))))

(assert (=> b!688967 (= res!453568 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!61574 res!453570) b!688960))

(assert (= (and b!688960 res!453569) b!688964))

(assert (= (and b!688964 res!453579) b!688953))

(assert (= (and b!688953 res!453574) b!688963))

(assert (= (and b!688963 res!453576) b!688958))

(assert (= (and b!688963 (not res!453580)) b!688944))

(assert (= (and b!688944 res!453582) b!688966))

(assert (= (and b!688963 res!453584) b!688952))

(assert (= (and b!688952 res!453567) b!688959))

(assert (= (and b!688959 res!453577) b!688951))

(assert (= (and b!688951 res!453587) b!688949))

(assert (= (and b!688949 res!453586) b!688943))

(assert (= (and b!688943 res!453583) b!688957))

(assert (= (and b!688957 res!453581) b!688947))

(assert (= (and b!688947 c!78056) b!688955))

(assert (= (and b!688947 (not c!78056)) b!688956))

(assert (= (and b!688947 c!78055) b!688962))

(assert (= (and b!688947 (not c!78055)) b!688954))

(assert (= (and b!688947 (not res!453578)) b!688950))

(assert (= (and b!688950 (not res!453571)) b!688965))

(assert (= (and b!688965 (not res!453585)) b!688945))

(assert (= (and b!688945 (not res!453573)) b!688946))

(assert (= (and b!688946 res!453572) b!688948))

(assert (= (and b!688946 (not res!453575)) b!688967))

(assert (= (and b!688967 res!453568) b!688961))

(declare-fun m!652721 () Bool)

(assert (=> b!688947 m!652721))

(declare-fun m!652723 () Bool)

(assert (=> b!688947 m!652723))

(declare-fun m!652725 () Bool)

(assert (=> b!688947 m!652725))

(declare-fun m!652727 () Bool)

(assert (=> b!688947 m!652727))

(declare-fun m!652729 () Bool)

(assert (=> b!688947 m!652729))

(declare-fun m!652731 () Bool)

(assert (=> b!688947 m!652731))

(declare-fun m!652733 () Bool)

(assert (=> b!688947 m!652733))

(declare-fun m!652735 () Bool)

(assert (=> b!688947 m!652735))

(declare-fun m!652737 () Bool)

(assert (=> b!688947 m!652737))

(declare-fun m!652739 () Bool)

(assert (=> b!688947 m!652739))

(assert (=> b!688947 m!652725))

(declare-fun m!652741 () Bool)

(assert (=> b!688947 m!652741))

(declare-fun m!652743 () Bool)

(assert (=> b!688947 m!652743))

(declare-fun m!652745 () Bool)

(assert (=> b!688947 m!652745))

(declare-fun m!652747 () Bool)

(assert (=> b!688958 m!652747))

(assert (=> b!688962 m!652723))

(assert (=> b!688962 m!652725))

(declare-fun m!652749 () Bool)

(assert (=> b!688962 m!652749))

(declare-fun m!652751 () Bool)

(assert (=> b!688962 m!652751))

(assert (=> b!688962 m!652725))

(assert (=> b!688962 m!652749))

(assert (=> b!688962 m!652733))

(assert (=> b!688962 m!652745))

(declare-fun m!652753 () Bool)

(assert (=> b!688948 m!652753))

(declare-fun m!652755 () Bool)

(assert (=> b!688955 m!652755))

(declare-fun m!652757 () Bool)

(assert (=> b!688952 m!652757))

(declare-fun m!652759 () Bool)

(assert (=> b!688959 m!652759))

(declare-fun m!652761 () Bool)

(assert (=> b!688949 m!652761))

(assert (=> b!688966 m!652747))

(declare-fun m!652763 () Bool)

(assert (=> b!688960 m!652763))

(declare-fun m!652765 () Bool)

(assert (=> b!688943 m!652765))

(assert (=> b!688961 m!652753))

(declare-fun m!652767 () Bool)

(assert (=> b!688945 m!652767))

(declare-fun m!652769 () Bool)

(assert (=> start!61574 m!652769))

(declare-fun m!652771 () Bool)

(assert (=> b!688964 m!652771))

(declare-fun m!652773 () Bool)

(assert (=> b!688965 m!652773))

(declare-fun m!652775 () Bool)

(assert (=> b!688953 m!652775))

(declare-fun m!652777 () Bool)

(assert (=> b!688950 m!652777))

(push 1)

(assert (not b!688962))

(assert (not b!688949))

(assert (not b!688953))

(assert (not b!688952))

(assert (not b!688947))

(assert (not b!688945))

(assert (not b!688964))

(assert (not b!688958))

(assert (not b!688966))

(assert (not b!688955))

(assert (not b!688950))

(assert (not b!688959))

(assert (not b!688961))

(assert (not b!688960))

(assert (not b!688943))

(assert (not b!688948))

(assert (not b!688965))

(assert (not start!61574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

