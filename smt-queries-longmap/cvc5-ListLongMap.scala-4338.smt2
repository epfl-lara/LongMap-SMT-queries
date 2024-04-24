; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60118 () Bool)

(assert start!60118)

(declare-fun b!669052 () Bool)

(declare-fun e!382769 () Bool)

(declare-fun e!382772 () Bool)

(assert (=> b!669052 (= e!382769 (not e!382772))))

(declare-fun res!435932 () Bool)

(assert (=> b!669052 (=> res!435932 e!382772)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669052 (= res!435932 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39103 0))(
  ( (array!39104 (arr!18741 (Array (_ BitVec 32) (_ BitVec 64))) (size!19105 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39103)

(declare-datatypes ((List!12689 0))(
  ( (Nil!12686) (Cons!12685 (h!13733 (_ BitVec 64)) (t!18909 List!12689)) )
))
(declare-fun lt!311485 () List!12689)

(declare-fun arrayNoDuplicates!0 (array!39103 (_ BitVec 32) List!12689) Bool)

(assert (=> b!669052 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311485)))

(declare-datatypes ((Unit!23434 0))(
  ( (Unit!23435) )
))
(declare-fun lt!311482 () Unit!23434)

(declare-fun acc!681 () List!12689)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39103 (_ BitVec 64) (_ BitVec 32) List!12689 List!12689) Unit!23434)

(assert (=> b!669052 (= lt!311482 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311485))))

(declare-fun -!100 (List!12689 (_ BitVec 64)) List!12689)

(assert (=> b!669052 (= (-!100 lt!311485 k!2843) acc!681)))

(declare-fun $colon$colon!232 (List!12689 (_ BitVec 64)) List!12689)

(assert (=> b!669052 (= lt!311485 ($colon$colon!232 acc!681 k!2843))))

(declare-fun lt!311481 () Unit!23434)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12689) Unit!23434)

(assert (=> b!669052 (= lt!311481 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!103 (List!12689 List!12689) Bool)

(assert (=> b!669052 (subseq!103 acc!681 acc!681)))

(declare-fun lt!311484 () Unit!23434)

(declare-fun lemmaListSubSeqRefl!0 (List!12689) Unit!23434)

(assert (=> b!669052 (= lt!311484 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669052 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311479 () Unit!23434)

(declare-fun e!382774 () Unit!23434)

(assert (=> b!669052 (= lt!311479 e!382774)))

(declare-fun c!76930 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669052 (= c!76930 (validKeyInArray!0 (select (arr!18741 a!3626) from!3004)))))

(declare-fun lt!311476 () Unit!23434)

(declare-fun e!382771 () Unit!23434)

(assert (=> b!669052 (= lt!311476 e!382771)))

(declare-fun c!76931 () Bool)

(declare-fun arrayContainsKey!0 (array!39103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669052 (= c!76931 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669052 (arrayContainsKey!0 (array!39104 (store (arr!18741 a!3626) i!1382 k!2843) (size!19105 a!3626)) k!2843 from!3004)))

(declare-fun b!669053 () Bool)

(declare-fun res!435933 () Bool)

(assert (=> b!669053 (=> res!435933 e!382772)))

(declare-fun noDuplicate!615 (List!12689) Bool)

(assert (=> b!669053 (= res!435933 (not (noDuplicate!615 lt!311485)))))

(declare-fun b!669054 () Bool)

(declare-fun res!435946 () Bool)

(assert (=> b!669054 (=> (not res!435946) (not e!382769))))

(assert (=> b!669054 (= res!435946 (noDuplicate!615 acc!681))))

(declare-fun res!435948 () Bool)

(assert (=> start!60118 (=> (not res!435948) (not e!382769))))

(assert (=> start!60118 (= res!435948 (and (bvslt (size!19105 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19105 a!3626))))))

(assert (=> start!60118 e!382769))

(assert (=> start!60118 true))

(declare-fun array_inv!14600 (array!39103) Bool)

(assert (=> start!60118 (array_inv!14600 a!3626)))

(declare-fun b!669055 () Bool)

(declare-fun res!435931 () Bool)

(assert (=> b!669055 (=> res!435931 e!382772)))

(declare-fun contains!3341 (List!12689 (_ BitVec 64)) Bool)

(assert (=> b!669055 (= res!435931 (contains!3341 lt!311485 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669056 () Bool)

(declare-fun lt!311480 () Unit!23434)

(assert (=> b!669056 (= e!382774 lt!311480)))

(declare-fun lt!311478 () Unit!23434)

(assert (=> b!669056 (= lt!311478 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669056 (subseq!103 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39103 List!12689 List!12689 (_ BitVec 32)) Unit!23434)

(assert (=> b!669056 (= lt!311480 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!232 acc!681 (select (arr!18741 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669056 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669057 () Bool)

(declare-fun e!382776 () Bool)

(assert (=> b!669057 (= e!382776 (not (contains!3341 acc!681 k!2843)))))

(declare-fun b!669058 () Bool)

(declare-fun res!435941 () Bool)

(assert (=> b!669058 (=> (not res!435941) (not e!382769))))

(assert (=> b!669058 (= res!435941 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669059 () Bool)

(declare-fun e!382773 () Bool)

(assert (=> b!669059 (= e!382773 (contains!3341 lt!311485 k!2843))))

(declare-fun b!669060 () Bool)

(declare-fun e!382779 () Bool)

(assert (=> b!669060 (= e!382779 (not (contains!3341 lt!311485 k!2843)))))

(declare-fun b!669061 () Bool)

(declare-fun Unit!23436 () Unit!23434)

(assert (=> b!669061 (= e!382774 Unit!23436)))

(declare-fun b!669062 () Bool)

(declare-fun res!435929 () Bool)

(assert (=> b!669062 (=> (not res!435929) (not e!382769))))

(assert (=> b!669062 (= res!435929 (not (contains!3341 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669063 () Bool)

(declare-fun Unit!23437 () Unit!23434)

(assert (=> b!669063 (= e!382771 Unit!23437)))

(declare-fun b!669064 () Bool)

(declare-fun res!435943 () Bool)

(assert (=> b!669064 (=> (not res!435943) (not e!382769))))

(assert (=> b!669064 (= res!435943 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19105 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669065 () Bool)

(declare-fun res!435949 () Bool)

(assert (=> b!669065 (=> (not res!435949) (not e!382769))))

(assert (=> b!669065 (= res!435949 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669066 () Bool)

(declare-fun res!435947 () Bool)

(assert (=> b!669066 (=> res!435947 e!382772)))

(assert (=> b!669066 (= res!435947 (contains!3341 lt!311485 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669067 () Bool)

(declare-fun res!435935 () Bool)

(assert (=> b!669067 (=> (not res!435935) (not e!382769))))

(assert (=> b!669067 (= res!435935 (validKeyInArray!0 k!2843))))

(declare-fun b!669068 () Bool)

(declare-fun e!382775 () Bool)

(assert (=> b!669068 (= e!382775 e!382776)))

(declare-fun res!435930 () Bool)

(assert (=> b!669068 (=> (not res!435930) (not e!382776))))

(assert (=> b!669068 (= res!435930 (bvsle from!3004 i!1382))))

(declare-fun b!669069 () Bool)

(declare-fun Unit!23438 () Unit!23434)

(assert (=> b!669069 (= e!382771 Unit!23438)))

(declare-fun lt!311483 () Unit!23434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39103 (_ BitVec 64) (_ BitVec 32)) Unit!23434)

(assert (=> b!669069 (= lt!311483 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669069 false))

(declare-fun b!669070 () Bool)

(declare-fun e!382770 () Bool)

(assert (=> b!669070 (= e!382770 e!382779)))

(declare-fun res!435940 () Bool)

(assert (=> b!669070 (=> (not res!435940) (not e!382779))))

(assert (=> b!669070 (= res!435940 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669071 () Bool)

(declare-fun res!435934 () Bool)

(assert (=> b!669071 (=> (not res!435934) (not e!382769))))

(assert (=> b!669071 (= res!435934 (not (contains!3341 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669072 () Bool)

(declare-fun res!435936 () Bool)

(assert (=> b!669072 (=> (not res!435936) (not e!382769))))

(assert (=> b!669072 (= res!435936 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19105 a!3626))))))

(declare-fun b!669073 () Bool)

(declare-fun res!435944 () Bool)

(assert (=> b!669073 (=> (not res!435944) (not e!382769))))

(assert (=> b!669073 (= res!435944 e!382775)))

(declare-fun res!435939 () Bool)

(assert (=> b!669073 (=> res!435939 e!382775)))

(declare-fun e!382778 () Bool)

(assert (=> b!669073 (= res!435939 e!382778)))

(declare-fun res!435945 () Bool)

(assert (=> b!669073 (=> (not res!435945) (not e!382778))))

(assert (=> b!669073 (= res!435945 (bvsgt from!3004 i!1382))))

(declare-fun b!669074 () Bool)

(assert (=> b!669074 (= e!382778 (contains!3341 acc!681 k!2843))))

(declare-fun b!669075 () Bool)

(declare-fun res!435937 () Bool)

(assert (=> b!669075 (=> (not res!435937) (not e!382769))))

(assert (=> b!669075 (= res!435937 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12686))))

(declare-fun b!669076 () Bool)

(assert (=> b!669076 (= e!382772 true)))

(declare-fun lt!311477 () Bool)

(assert (=> b!669076 (= lt!311477 e!382770)))

(declare-fun res!435942 () Bool)

(assert (=> b!669076 (=> res!435942 e!382770)))

(assert (=> b!669076 (= res!435942 e!382773)))

(declare-fun res!435938 () Bool)

(assert (=> b!669076 (=> (not res!435938) (not e!382773))))

(assert (=> b!669076 (= res!435938 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60118 res!435948) b!669054))

(assert (= (and b!669054 res!435946) b!669071))

(assert (= (and b!669071 res!435934) b!669062))

(assert (= (and b!669062 res!435929) b!669073))

(assert (= (and b!669073 res!435945) b!669074))

(assert (= (and b!669073 (not res!435939)) b!669068))

(assert (= (and b!669068 res!435930) b!669057))

(assert (= (and b!669073 res!435944) b!669075))

(assert (= (and b!669075 res!435937) b!669065))

(assert (= (and b!669065 res!435949) b!669072))

(assert (= (and b!669072 res!435936) b!669067))

(assert (= (and b!669067 res!435935) b!669058))

(assert (= (and b!669058 res!435941) b!669064))

(assert (= (and b!669064 res!435943) b!669052))

(assert (= (and b!669052 c!76931) b!669069))

(assert (= (and b!669052 (not c!76931)) b!669063))

(assert (= (and b!669052 c!76930) b!669056))

(assert (= (and b!669052 (not c!76930)) b!669061))

(assert (= (and b!669052 (not res!435932)) b!669053))

(assert (= (and b!669053 (not res!435933)) b!669055))

(assert (= (and b!669055 (not res!435931)) b!669066))

(assert (= (and b!669066 (not res!435947)) b!669076))

(assert (= (and b!669076 res!435938) b!669059))

(assert (= (and b!669076 (not res!435942)) b!669070))

(assert (= (and b!669070 res!435940) b!669060))

(declare-fun m!639759 () Bool)

(assert (=> b!669065 m!639759))

(declare-fun m!639761 () Bool)

(assert (=> b!669074 m!639761))

(declare-fun m!639763 () Bool)

(assert (=> b!669069 m!639763))

(declare-fun m!639765 () Bool)

(assert (=> b!669059 m!639765))

(declare-fun m!639767 () Bool)

(assert (=> b!669071 m!639767))

(declare-fun m!639769 () Bool)

(assert (=> b!669052 m!639769))

(declare-fun m!639771 () Bool)

(assert (=> b!669052 m!639771))

(declare-fun m!639773 () Bool)

(assert (=> b!669052 m!639773))

(declare-fun m!639775 () Bool)

(assert (=> b!669052 m!639775))

(declare-fun m!639777 () Bool)

(assert (=> b!669052 m!639777))

(declare-fun m!639779 () Bool)

(assert (=> b!669052 m!639779))

(declare-fun m!639781 () Bool)

(assert (=> b!669052 m!639781))

(declare-fun m!639783 () Bool)

(assert (=> b!669052 m!639783))

(declare-fun m!639785 () Bool)

(assert (=> b!669052 m!639785))

(assert (=> b!669052 m!639773))

(declare-fun m!639787 () Bool)

(assert (=> b!669052 m!639787))

(declare-fun m!639789 () Bool)

(assert (=> b!669052 m!639789))

(declare-fun m!639791 () Bool)

(assert (=> b!669052 m!639791))

(declare-fun m!639793 () Bool)

(assert (=> b!669052 m!639793))

(declare-fun m!639795 () Bool)

(assert (=> b!669066 m!639795))

(declare-fun m!639797 () Bool)

(assert (=> b!669055 m!639797))

(declare-fun m!639799 () Bool)

(assert (=> b!669053 m!639799))

(declare-fun m!639801 () Bool)

(assert (=> b!669054 m!639801))

(assert (=> b!669056 m!639771))

(assert (=> b!669056 m!639773))

(declare-fun m!639803 () Bool)

(assert (=> b!669056 m!639803))

(declare-fun m!639805 () Bool)

(assert (=> b!669056 m!639805))

(assert (=> b!669056 m!639773))

(assert (=> b!669056 m!639803))

(assert (=> b!669056 m!639781))

(assert (=> b!669056 m!639793))

(declare-fun m!639807 () Bool)

(assert (=> b!669058 m!639807))

(assert (=> b!669057 m!639761))

(assert (=> b!669060 m!639765))

(declare-fun m!639809 () Bool)

(assert (=> start!60118 m!639809))

(declare-fun m!639811 () Bool)

(assert (=> b!669067 m!639811))

(declare-fun m!639813 () Bool)

(assert (=> b!669062 m!639813))

(declare-fun m!639815 () Bool)

(assert (=> b!669075 m!639815))

(push 1)

(assert (not start!60118))

(assert (not b!669053))

(assert (not b!669075))

(assert (not b!669067))

(assert (not b!669057))

(assert (not b!669056))

(assert (not b!669058))

(assert (not b!669074))

(assert (not b!669071))

(assert (not b!669065))

(assert (not b!669052))

(assert (not b!669059))

(assert (not b!669054))

(assert (not b!669062))

(assert (not b!669055))

(assert (not b!669066))

(assert (not b!669060))

(assert (not b!669069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

