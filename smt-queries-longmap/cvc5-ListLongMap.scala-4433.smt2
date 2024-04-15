; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61566 () Bool)

(assert start!61566)

(declare-fun b!688797 () Bool)

(declare-fun res!453569 () Bool)

(declare-fun e!392210 () Bool)

(assert (=> b!688797 (=> (not res!453569) (not e!392210))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39718 0))(
  ( (array!39719 (arr!19030 (Array (_ BitVec 32) (_ BitVec 64))) (size!19411 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39718)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!688797 (= res!453569 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19411 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688798 () Bool)

(declare-fun e!392214 () Bool)

(assert (=> b!688798 (= e!392214 true)))

(declare-fun lt!315778 () Bool)

(declare-fun e!392206 () Bool)

(assert (=> b!688798 (= lt!315778 e!392206)))

(declare-fun res!453565 () Bool)

(assert (=> b!688798 (=> res!453565 e!392206)))

(declare-fun e!392216 () Bool)

(assert (=> b!688798 (= res!453565 e!392216)))

(declare-fun res!453577 () Bool)

(assert (=> b!688798 (=> (not res!453577) (not e!392216))))

(assert (=> b!688798 (= res!453577 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688799 () Bool)

(declare-fun e!392213 () Bool)

(declare-fun e!392207 () Bool)

(assert (=> b!688799 (= e!392213 e!392207)))

(declare-fun res!453574 () Bool)

(assert (=> b!688799 (=> (not res!453574) (not e!392207))))

(assert (=> b!688799 (= res!453574 (bvsle from!3004 i!1382))))

(declare-fun b!688800 () Bool)

(declare-datatypes ((List!13110 0))(
  ( (Nil!13107) (Cons!13106 (h!14151 (_ BitVec 64)) (t!19365 List!13110)) )
))
(declare-fun lt!315782 () List!13110)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3632 (List!13110 (_ BitVec 64)) Bool)

(assert (=> b!688800 (= e!392216 (contains!3632 lt!315782 k!2843))))

(declare-fun b!688801 () Bool)

(declare-fun res!453571 () Bool)

(assert (=> b!688801 (=> (not res!453571) (not e!392210))))

(assert (=> b!688801 (= res!453571 e!392213)))

(declare-fun res!453576 () Bool)

(assert (=> b!688801 (=> res!453576 e!392213)))

(declare-fun e!392209 () Bool)

(assert (=> b!688801 (= res!453576 e!392209)))

(declare-fun res!453568 () Bool)

(assert (=> b!688801 (=> (not res!453568) (not e!392209))))

(assert (=> b!688801 (= res!453568 (bvsgt from!3004 i!1382))))

(declare-fun res!453575 () Bool)

(assert (=> start!61566 (=> (not res!453575) (not e!392210))))

(assert (=> start!61566 (= res!453575 (and (bvslt (size!19411 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19411 a!3626))))))

(assert (=> start!61566 e!392210))

(assert (=> start!61566 true))

(declare-fun array_inv!14913 (array!39718) Bool)

(assert (=> start!61566 (array_inv!14913 a!3626)))

(declare-fun b!688802 () Bool)

(declare-fun res!453557 () Bool)

(assert (=> b!688802 (=> (not res!453557) (not e!392210))))

(declare-fun acc!681 () List!13110)

(declare-fun arrayNoDuplicates!0 (array!39718 (_ BitVec 32) List!13110) Bool)

(assert (=> b!688802 (= res!453557 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688803 () Bool)

(declare-fun res!453559 () Bool)

(assert (=> b!688803 (=> res!453559 e!392214)))

(assert (=> b!688803 (= res!453559 (contains!3632 lt!315782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688804 () Bool)

(declare-fun res!453572 () Bool)

(assert (=> b!688804 (=> res!453572 e!392214)))

(assert (=> b!688804 (= res!453572 (contains!3632 lt!315782 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688805 () Bool)

(declare-datatypes ((Unit!24300 0))(
  ( (Unit!24301) )
))
(declare-fun e!392215 () Unit!24300)

(declare-fun lt!315775 () Unit!24300)

(assert (=> b!688805 (= e!392215 lt!315775)))

(declare-fun lt!315779 () Unit!24300)

(declare-fun lemmaListSubSeqRefl!0 (List!13110) Unit!24300)

(assert (=> b!688805 (= lt!315779 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!235 (List!13110 List!13110) Bool)

(assert (=> b!688805 (subseq!235 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39718 List!13110 List!13110 (_ BitVec 32)) Unit!24300)

(declare-fun $colon$colon!399 (List!13110 (_ BitVec 64)) List!13110)

(assert (=> b!688805 (= lt!315775 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!399 acc!681 (select (arr!19030 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688805 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688806 () Bool)

(declare-fun e!392212 () Unit!24300)

(declare-fun Unit!24302 () Unit!24300)

(assert (=> b!688806 (= e!392212 Unit!24302)))

(declare-fun lt!315780 () Unit!24300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39718 (_ BitVec 64) (_ BitVec 32)) Unit!24300)

(assert (=> b!688806 (= lt!315780 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688806 false))

(declare-fun b!688807 () Bool)

(assert (=> b!688807 (= e!392210 (not e!392214))))

(declare-fun res!453573 () Bool)

(assert (=> b!688807 (=> res!453573 e!392214)))

(assert (=> b!688807 (= res!453573 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688807 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315782)))

(declare-fun lt!315777 () Unit!24300)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39718 (_ BitVec 64) (_ BitVec 32) List!13110 List!13110) Unit!24300)

(assert (=> b!688807 (= lt!315777 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315782))))

(declare-fun -!200 (List!13110 (_ BitVec 64)) List!13110)

(assert (=> b!688807 (= (-!200 lt!315782 k!2843) acc!681)))

(assert (=> b!688807 (= lt!315782 ($colon$colon!399 acc!681 k!2843))))

(declare-fun lt!315781 () Unit!24300)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13110) Unit!24300)

(assert (=> b!688807 (= lt!315781 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!688807 (subseq!235 acc!681 acc!681)))

(declare-fun lt!315783 () Unit!24300)

(assert (=> b!688807 (= lt!315783 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688807 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315776 () Unit!24300)

(assert (=> b!688807 (= lt!315776 e!392215)))

(declare-fun c!77987 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688807 (= c!77987 (validKeyInArray!0 (select (arr!19030 a!3626) from!3004)))))

(declare-fun lt!315774 () Unit!24300)

(assert (=> b!688807 (= lt!315774 e!392212)))

(declare-fun c!77988 () Bool)

(declare-fun arrayContainsKey!0 (array!39718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688807 (= c!77988 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688807 (arrayContainsKey!0 (array!39719 (store (arr!19030 a!3626) i!1382 k!2843) (size!19411 a!3626)) k!2843 from!3004)))

(declare-fun b!688808 () Bool)

(declare-fun res!453570 () Bool)

(assert (=> b!688808 (=> res!453570 e!392214)))

(declare-fun noDuplicate!901 (List!13110) Bool)

(assert (=> b!688808 (= res!453570 (not (noDuplicate!901 lt!315782)))))

(declare-fun b!688809 () Bool)

(declare-fun e!392208 () Bool)

(assert (=> b!688809 (= e!392206 e!392208)))

(declare-fun res!453563 () Bool)

(assert (=> b!688809 (=> (not res!453563) (not e!392208))))

(assert (=> b!688809 (= res!453563 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688810 () Bool)

(assert (=> b!688810 (= e!392209 (contains!3632 acc!681 k!2843))))

(declare-fun b!688811 () Bool)

(declare-fun res!453564 () Bool)

(assert (=> b!688811 (=> (not res!453564) (not e!392210))))

(assert (=> b!688811 (= res!453564 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19411 a!3626))))))

(declare-fun b!688812 () Bool)

(assert (=> b!688812 (= e!392208 (not (contains!3632 lt!315782 k!2843)))))

(declare-fun b!688813 () Bool)

(declare-fun res!453566 () Bool)

(assert (=> b!688813 (=> (not res!453566) (not e!392210))))

(assert (=> b!688813 (= res!453566 (validKeyInArray!0 k!2843))))

(declare-fun b!688814 () Bool)

(declare-fun res!453567 () Bool)

(assert (=> b!688814 (=> (not res!453567) (not e!392210))))

(assert (=> b!688814 (= res!453567 (not (contains!3632 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688815 () Bool)

(declare-fun res!453560 () Bool)

(assert (=> b!688815 (=> (not res!453560) (not e!392210))))

(assert (=> b!688815 (= res!453560 (noDuplicate!901 acc!681))))

(declare-fun b!688816 () Bool)

(declare-fun res!453562 () Bool)

(assert (=> b!688816 (=> (not res!453562) (not e!392210))))

(assert (=> b!688816 (= res!453562 (not (contains!3632 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688817 () Bool)

(declare-fun res!453558 () Bool)

(assert (=> b!688817 (=> (not res!453558) (not e!392210))))

(assert (=> b!688817 (= res!453558 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688818 () Bool)

(declare-fun Unit!24303 () Unit!24300)

(assert (=> b!688818 (= e!392215 Unit!24303)))

(declare-fun b!688819 () Bool)

(declare-fun Unit!24304 () Unit!24300)

(assert (=> b!688819 (= e!392212 Unit!24304)))

(declare-fun b!688820 () Bool)

(assert (=> b!688820 (= e!392207 (not (contains!3632 acc!681 k!2843)))))

(declare-fun b!688821 () Bool)

(declare-fun res!453561 () Bool)

(assert (=> b!688821 (=> (not res!453561) (not e!392210))))

(assert (=> b!688821 (= res!453561 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13107))))

(assert (= (and start!61566 res!453575) b!688815))

(assert (= (and b!688815 res!453560) b!688816))

(assert (= (and b!688816 res!453562) b!688814))

(assert (= (and b!688814 res!453567) b!688801))

(assert (= (and b!688801 res!453568) b!688810))

(assert (= (and b!688801 (not res!453576)) b!688799))

(assert (= (and b!688799 res!453574) b!688820))

(assert (= (and b!688801 res!453571) b!688821))

(assert (= (and b!688821 res!453561) b!688802))

(assert (= (and b!688802 res!453557) b!688811))

(assert (= (and b!688811 res!453564) b!688813))

(assert (= (and b!688813 res!453566) b!688817))

(assert (= (and b!688817 res!453558) b!688797))

(assert (= (and b!688797 res!453569) b!688807))

(assert (= (and b!688807 c!77988) b!688806))

(assert (= (and b!688807 (not c!77988)) b!688819))

(assert (= (and b!688807 c!77987) b!688805))

(assert (= (and b!688807 (not c!77987)) b!688818))

(assert (= (and b!688807 (not res!453573)) b!688808))

(assert (= (and b!688808 (not res!453570)) b!688803))

(assert (= (and b!688803 (not res!453559)) b!688804))

(assert (= (and b!688804 (not res!453572)) b!688798))

(assert (= (and b!688798 res!453577) b!688800))

(assert (= (and b!688798 (not res!453565)) b!688809))

(assert (= (and b!688809 res!453563) b!688812))

(declare-fun m!652055 () Bool)

(assert (=> b!688806 m!652055))

(declare-fun m!652057 () Bool)

(assert (=> b!688814 m!652057))

(declare-fun m!652059 () Bool)

(assert (=> start!61566 m!652059))

(declare-fun m!652061 () Bool)

(assert (=> b!688813 m!652061))

(declare-fun m!652063 () Bool)

(assert (=> b!688816 m!652063))

(declare-fun m!652065 () Bool)

(assert (=> b!688820 m!652065))

(declare-fun m!652067 () Bool)

(assert (=> b!688808 m!652067))

(assert (=> b!688810 m!652065))

(declare-fun m!652069 () Bool)

(assert (=> b!688807 m!652069))

(declare-fun m!652071 () Bool)

(assert (=> b!688807 m!652071))

(declare-fun m!652073 () Bool)

(assert (=> b!688807 m!652073))

(declare-fun m!652075 () Bool)

(assert (=> b!688807 m!652075))

(declare-fun m!652077 () Bool)

(assert (=> b!688807 m!652077))

(declare-fun m!652079 () Bool)

(assert (=> b!688807 m!652079))

(declare-fun m!652081 () Bool)

(assert (=> b!688807 m!652081))

(declare-fun m!652083 () Bool)

(assert (=> b!688807 m!652083))

(declare-fun m!652085 () Bool)

(assert (=> b!688807 m!652085))

(declare-fun m!652087 () Bool)

(assert (=> b!688807 m!652087))

(assert (=> b!688807 m!652071))

(declare-fun m!652089 () Bool)

(assert (=> b!688807 m!652089))

(declare-fun m!652091 () Bool)

(assert (=> b!688807 m!652091))

(declare-fun m!652093 () Bool)

(assert (=> b!688807 m!652093))

(declare-fun m!652095 () Bool)

(assert (=> b!688800 m!652095))

(declare-fun m!652097 () Bool)

(assert (=> b!688817 m!652097))

(declare-fun m!652099 () Bool)

(assert (=> b!688821 m!652099))

(declare-fun m!652101 () Bool)

(assert (=> b!688803 m!652101))

(declare-fun m!652103 () Bool)

(assert (=> b!688804 m!652103))

(assert (=> b!688812 m!652095))

(assert (=> b!688805 m!652069))

(assert (=> b!688805 m!652071))

(declare-fun m!652105 () Bool)

(assert (=> b!688805 m!652105))

(declare-fun m!652107 () Bool)

(assert (=> b!688805 m!652107))

(assert (=> b!688805 m!652071))

(assert (=> b!688805 m!652105))

(assert (=> b!688805 m!652081))

(assert (=> b!688805 m!652093))

(declare-fun m!652109 () Bool)

(assert (=> b!688802 m!652109))

(declare-fun m!652111 () Bool)

(assert (=> b!688815 m!652111))

(push 1)

(assert (not start!61566))

(assert (not b!688812))

(assert (not b!688814))

(assert (not b!688817))

(assert (not b!688807))

(assert (not b!688813))

(assert (not b!688806))

(assert (not b!688815))

(assert (not b!688820))

(assert (not b!688802))

(assert (not b!688800))

(assert (not b!688805))

(assert (not b!688816))

(assert (not b!688808))

(assert (not b!688821))

(assert (not b!688803))

(assert (not b!688810))

(assert (not b!688804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

