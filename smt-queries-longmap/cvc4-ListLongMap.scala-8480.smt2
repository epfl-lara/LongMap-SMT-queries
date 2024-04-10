; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103294 () Bool)

(assert start!103294)

(declare-fun b!1239622 () Bool)

(declare-fun res!827033 () Bool)

(declare-fun e!702480 () Bool)

(assert (=> b!1239622 (=> (not res!827033) (not e!702480))))

(declare-datatypes ((List!27312 0))(
  ( (Nil!27309) (Cons!27308 (h!28517 (_ BitVec 64)) (t!40775 List!27312)) )
))
(declare-fun acc!846 () List!27312)

(declare-fun contains!7374 (List!27312 (_ BitVec 64)) Bool)

(assert (=> b!1239622 (= res!827033 (not (contains!7374 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239623 () Bool)

(declare-datatypes ((Unit!41198 0))(
  ( (Unit!41199) )
))
(declare-fun e!702479 () Unit!41198)

(declare-fun Unit!41200 () Unit!41198)

(assert (=> b!1239623 (= e!702479 Unit!41200)))

(declare-fun b!1239625 () Bool)

(declare-fun e!702478 () Bool)

(assert (=> b!1239625 (= e!702480 e!702478)))

(declare-fun res!827036 () Bool)

(assert (=> b!1239625 (=> (not res!827036) (not e!702478))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79878 0))(
  ( (array!79879 (arr!38539 (Array (_ BitVec 32) (_ BitVec 64))) (size!39075 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79878)

(assert (=> b!1239625 (= res!827036 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39075 a!3835))))))

(declare-fun lt!561802 () Unit!41198)

(assert (=> b!1239625 (= lt!561802 e!702479)))

(declare-fun c!121156 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239625 (= c!121156 (validKeyInArray!0 (select (arr!38539 a!3835) from!3213)))))

(declare-fun b!1239626 () Bool)

(declare-fun res!827030 () Bool)

(assert (=> b!1239626 (=> (not res!827030) (not e!702480))))

(assert (=> b!1239626 (= res!827030 (not (= from!3213 (bvsub (size!39075 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239627 () Bool)

(declare-fun res!827034 () Bool)

(assert (=> b!1239627 (=> (not res!827034) (not e!702480))))

(declare-fun noDuplicate!1971 (List!27312) Bool)

(assert (=> b!1239627 (= res!827034 (noDuplicate!1971 acc!846))))

(declare-fun b!1239628 () Bool)

(declare-fun res!827038 () Bool)

(assert (=> b!1239628 (=> (not res!827038) (not e!702480))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1239628 (= res!827038 (contains!7374 acc!846 k!2925))))

(declare-fun b!1239629 () Bool)

(declare-fun arrayContainsKey!0 (array!79878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1239629 (= e!702478 (not (not (arrayContainsKey!0 a!3835 k!2925 from!3213))))))

(assert (=> b!1239629 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!561803 () Unit!41198)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79878 (_ BitVec 32) (_ BitVec 64) List!27312) Unit!41198)

(assert (=> b!1239629 (= lt!561803 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(declare-fun b!1239630 () Bool)

(declare-fun res!827037 () Bool)

(assert (=> b!1239630 (=> (not res!827037) (not e!702480))))

(declare-fun arrayNoDuplicates!0 (array!79878 (_ BitVec 32) List!27312) Bool)

(assert (=> b!1239630 (= res!827037 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!827035 () Bool)

(assert (=> start!103294 (=> (not res!827035) (not e!702480))))

(assert (=> start!103294 (= res!827035 (and (bvslt (size!39075 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39075 a!3835))))))

(assert (=> start!103294 e!702480))

(declare-fun array_inv!29387 (array!79878) Bool)

(assert (=> start!103294 (array_inv!29387 a!3835)))

(assert (=> start!103294 true))

(declare-fun b!1239624 () Bool)

(declare-fun lt!561804 () Unit!41198)

(assert (=> b!1239624 (= e!702479 lt!561804)))

(declare-fun lt!561806 () List!27312)

(assert (=> b!1239624 (= lt!561806 (Cons!27308 (select (arr!38539 a!3835) from!3213) acc!846))))

(declare-fun lt!561805 () Unit!41198)

(declare-fun lemmaListSubSeqRefl!0 (List!27312) Unit!41198)

(assert (=> b!1239624 (= lt!561805 (lemmaListSubSeqRefl!0 lt!561806))))

(declare-fun subseq!628 (List!27312 List!27312) Bool)

(assert (=> b!1239624 (subseq!628 lt!561806 lt!561806)))

(declare-fun lt!561801 () Unit!41198)

(declare-fun subseqTail!115 (List!27312 List!27312) Unit!41198)

(assert (=> b!1239624 (= lt!561801 (subseqTail!115 lt!561806 lt!561806))))

(assert (=> b!1239624 (subseq!628 acc!846 lt!561806)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79878 List!27312 List!27312 (_ BitVec 32)) Unit!41198)

(assert (=> b!1239624 (= lt!561804 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561806 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239624 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239631 () Bool)

(declare-fun res!827031 () Bool)

(assert (=> b!1239631 (=> (not res!827031) (not e!702480))))

(assert (=> b!1239631 (= res!827031 (not (contains!7374 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239632 () Bool)

(declare-fun res!827032 () Bool)

(assert (=> b!1239632 (=> (not res!827032) (not e!702478))))

(assert (=> b!1239632 (= res!827032 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(assert (= (and start!103294 res!827035) b!1239627))

(assert (= (and b!1239627 res!827034) b!1239622))

(assert (= (and b!1239622 res!827033) b!1239631))

(assert (= (and b!1239631 res!827031) b!1239630))

(assert (= (and b!1239630 res!827037) b!1239628))

(assert (= (and b!1239628 res!827038) b!1239626))

(assert (= (and b!1239626 res!827030) b!1239625))

(assert (= (and b!1239625 c!121156) b!1239624))

(assert (= (and b!1239625 (not c!121156)) b!1239623))

(assert (= (and b!1239625 res!827036) b!1239632))

(assert (= (and b!1239632 res!827032) b!1239629))

(declare-fun m!1143051 () Bool)

(assert (=> b!1239631 m!1143051))

(declare-fun m!1143053 () Bool)

(assert (=> b!1239628 m!1143053))

(declare-fun m!1143055 () Bool)

(assert (=> b!1239624 m!1143055))

(declare-fun m!1143057 () Bool)

(assert (=> b!1239624 m!1143057))

(declare-fun m!1143059 () Bool)

(assert (=> b!1239624 m!1143059))

(declare-fun m!1143061 () Bool)

(assert (=> b!1239624 m!1143061))

(declare-fun m!1143063 () Bool)

(assert (=> b!1239624 m!1143063))

(declare-fun m!1143065 () Bool)

(assert (=> b!1239624 m!1143065))

(declare-fun m!1143067 () Bool)

(assert (=> b!1239624 m!1143067))

(declare-fun m!1143069 () Bool)

(assert (=> b!1239627 m!1143069))

(assert (=> b!1239632 m!1143065))

(assert (=> b!1239625 m!1143067))

(assert (=> b!1239625 m!1143067))

(declare-fun m!1143071 () Bool)

(assert (=> b!1239625 m!1143071))

(declare-fun m!1143073 () Bool)

(assert (=> b!1239622 m!1143073))

(declare-fun m!1143075 () Bool)

(assert (=> b!1239630 m!1143075))

(declare-fun m!1143077 () Bool)

(assert (=> b!1239629 m!1143077))

(declare-fun m!1143079 () Bool)

(assert (=> b!1239629 m!1143079))

(declare-fun m!1143081 () Bool)

(assert (=> b!1239629 m!1143081))

(declare-fun m!1143083 () Bool)

(assert (=> start!103294 m!1143083))

(push 1)

(assert (not b!1239631))

(assert (not b!1239628))

(assert (not b!1239622))

(assert (not start!103294))

(assert (not b!1239624))

(assert (not b!1239632))

(assert (not b!1239625))

(assert (not b!1239629))

(assert (not b!1239627))

(assert (not b!1239630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136059 () Bool)

(declare-fun res!827065 () Bool)

(declare-fun e!702509 () Bool)

(assert (=> d!136059 (=> res!827065 e!702509)))

(assert (=> d!136059 (= res!827065 (= (select (arr!38539 a!3835) from!3213) k!2925))))

(assert (=> d!136059 (= (arrayContainsKey!0 a!3835 k!2925 from!3213) e!702509)))

(declare-fun b!1239663 () Bool)

(declare-fun e!702510 () Bool)

(assert (=> b!1239663 (= e!702509 e!702510)))

(declare-fun res!827066 () Bool)

(assert (=> b!1239663 (=> (not res!827066) (not e!702510))))

(assert (=> b!1239663 (= res!827066 (bvslt (bvadd from!3213 #b00000000000000000000000000000001) (size!39075 a!3835)))))

(declare-fun b!1239664 () Bool)

(assert (=> b!1239664 (= e!702510 (arrayContainsKey!0 a!3835 k!2925 (bvadd from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136059 (not res!827065)) b!1239663))

(assert (= (and b!1239663 res!827066) b!1239664))

(assert (=> d!136059 m!1143067))

(declare-fun m!1143103 () Bool)

(assert (=> b!1239664 m!1143103))

(assert (=> b!1239629 d!136059))

(declare-fun d!136061 () Bool)

(declare-fun res!827071 () Bool)

(declare-fun e!702515 () Bool)

(assert (=> d!136061 (=> res!827071 e!702515)))

(assert (=> d!136061 (= res!827071 (= (select (arr!38539 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) k!2925))))

(assert (=> d!136061 (= (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)) e!702515)))

(declare-fun b!1239669 () Bool)

(declare-fun e!702516 () Bool)

(assert (=> b!1239669 (= e!702515 e!702516)))

(declare-fun res!827072 () Bool)

(assert (=> b!1239669 (=> (not res!827072) (not e!702516))))

(assert (=> b!1239669 (= res!827072 (bvslt (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (size!39075 a!3835)))))

(declare-fun b!1239670 () Bool)

(assert (=> b!1239670 (= e!702516 (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136061 (not res!827071)) b!1239669))

(assert (= (and b!1239669 res!827072) b!1239670))

(declare-fun m!1143105 () Bool)

(assert (=> d!136061 m!1143105))

(declare-fun m!1143107 () Bool)

(assert (=> b!1239670 m!1143107))

(assert (=> b!1239629 d!136061))

(declare-fun d!136063 () Bool)

(assert (=> d!136063 (not (arrayContainsKey!0 a!3835 k!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!561820 () Unit!41198)

(declare-fun choose!68 (array!79878 (_ BitVec 32) (_ BitVec 64) List!27312) Unit!41198)

(assert (=> d!136063 (= lt!561820 (choose!68 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846))))

(assert (=> d!136063 (bvslt (size!39075 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136063 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k!2925 acc!846) lt!561820)))

(declare-fun bs!34857 () Bool)

(assert (= bs!34857 d!136063))

(assert (=> bs!34857 m!1143079))

(declare-fun m!1143117 () Bool)

(assert (=> bs!34857 m!1143117))

(assert (=> b!1239629 d!136063))

(declare-fun b!1239709 () Bool)

(declare-fun e!702549 () Unit!41198)

(declare-fun call!61103 () Unit!41198)

(assert (=> b!1239709 (= e!702549 call!61103)))

(declare-fun bm!61100 () Bool)

(declare-fun c!121169 () Bool)

(assert (=> bm!61100 (= call!61103 (subseqTail!115 (ite c!121169 lt!561806 (t!40775 lt!561806)) (t!40775 lt!561806)))))

(declare-fun b!1239710 () Bool)

(declare-fun e!702550 () Unit!41198)

(assert (=> b!1239710 (= e!702550 e!702549)))

(assert (=> b!1239710 (= c!121169 (subseq!628 lt!561806 (t!40775 lt!561806)))))

(declare-fun d!136067 () Bool)

(declare-fun tail!170 (List!27312) List!27312)

(assert (=> d!136067 (subseq!628 (tail!170 lt!561806) lt!561806)))

(declare-fun lt!561830 () Unit!41198)

(assert (=> d!136067 (= lt!561830 e!702550)))

(declare-fun c!121168 () Bool)

(assert (=> d!136067 (= c!121168 (and (is-Cons!27308 lt!561806) (is-Cons!27308 lt!561806)))))

(declare-fun e!702548 () Bool)

(assert (=> d!136067 e!702548))

(declare-fun res!827095 () Bool)

(assert (=> d!136067 (=> (not res!827095) (not e!702548))))

(declare-fun isEmpty!1018 (List!27312) Bool)

(assert (=> d!136067 (= res!827095 (not (isEmpty!1018 lt!561806)))))

(assert (=> d!136067 (= (subseqTail!115 lt!561806 lt!561806) lt!561830)))

(declare-fun b!1239711 () Bool)

(declare-fun e!702547 () Unit!41198)

(assert (=> b!1239711 (= e!702547 call!61103)))

(declare-fun b!1239712 () Bool)

(assert (=> b!1239712 (= e!702548 (subseq!628 lt!561806 lt!561806))))

(declare-fun b!1239713 () Bool)

(declare-fun Unit!41201 () Unit!41198)

(assert (=> b!1239713 (= e!702547 Unit!41201)))

(declare-fun b!1239714 () Bool)

(declare-fun c!121167 () Bool)

(assert (=> b!1239714 (= c!121167 (not (isEmpty!1018 (t!40775 lt!561806))))))

(assert (=> b!1239714 (= e!702549 e!702547)))

(declare-fun b!1239715 () Bool)

(declare-fun Unit!41202 () Unit!41198)

(assert (=> b!1239715 (= e!702550 Unit!41202)))

(assert (= (and d!136067 res!827095) b!1239712))

(assert (= (and d!136067 c!121168) b!1239710))

(assert (= (and d!136067 (not c!121168)) b!1239715))

(assert (= (and b!1239710 c!121169) b!1239709))

(assert (= (and b!1239710 (not c!121169)) b!1239714))

(assert (= (and b!1239714 c!121167) b!1239711))

(assert (= (and b!1239714 (not c!121167)) b!1239713))

(assert (= (or b!1239709 b!1239711) bm!61100))

(declare-fun m!1143145 () Bool)

(assert (=> b!1239710 m!1143145))

(declare-fun m!1143147 () Bool)

(assert (=> d!136067 m!1143147))

(assert (=> d!136067 m!1143147))

(declare-fun m!1143149 () Bool)

(assert (=> d!136067 m!1143149))

(declare-fun m!1143151 () Bool)

(assert (=> d!136067 m!1143151))

(declare-fun m!1143153 () Bool)

(assert (=> bm!61100 m!1143153))

(declare-fun m!1143155 () Bool)

(assert (=> b!1239714 m!1143155))

(assert (=> b!1239712 m!1143055))

(assert (=> b!1239624 d!136067))

(declare-fun b!1239752 () Bool)

(declare-fun e!702578 () Bool)

(declare-fun e!702579 () Bool)

(assert (=> b!1239752 (= e!702578 e!702579)))

(declare-fun c!121180 () Bool)

(assert (=> b!1239752 (= c!121180 (validKeyInArray!0 (select (arr!38539 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun e!702580 () Bool)

(declare-fun b!1239753 () Bool)

(assert (=> b!1239753 (= e!702580 (contains!7374 acc!846 (select (arr!38539 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239754 () Bool)

(declare-fun e!702577 () Bool)

(assert (=> b!1239754 (= e!702577 e!702578)))

(declare-fun res!827112 () Bool)

(assert (=> b!1239754 (=> (not res!827112) (not e!702578))))

(assert (=> b!1239754 (= res!827112 (not e!702580))))

(declare-fun res!827114 () Bool)

(assert (=> b!1239754 (=> (not res!827114) (not e!702580))))

(assert (=> b!1239754 (= res!827114 (validKeyInArray!0 (select (arr!38539 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239755 () Bool)

(declare-fun call!61110 () Bool)

(assert (=> b!1239755 (= e!702579 call!61110)))

(declare-fun bm!61107 () Bool)

(assert (=> bm!61107 (= call!61110 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121180 (Cons!27308 (select (arr!38539 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(declare-fun b!1239756 () Bool)

(assert (=> b!1239756 (= e!702579 call!61110)))

(declare-fun d!136087 () Bool)

(declare-fun res!827113 () Bool)

(assert (=> d!136087 (=> res!827113 e!702577)))

(assert (=> d!136087 (= res!827113 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39075 a!3835)))))

(assert (=> d!136087 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!702577)))

(assert (= (and d!136087 (not res!827113)) b!1239754))

(assert (= (and b!1239754 res!827114) b!1239753))

(assert (= (and b!1239754 res!827112) b!1239752))

(assert (= (and b!1239752 c!121180) b!1239756))

(assert (= (and b!1239752 (not c!121180)) b!1239755))

(assert (= (or b!1239756 b!1239755) bm!61107))

(assert (=> b!1239752 m!1143105))

(assert (=> b!1239752 m!1143105))

(declare-fun m!1143161 () Bool)

(assert (=> b!1239752 m!1143161))

(assert (=> b!1239753 m!1143105))

(assert (=> b!1239753 m!1143105))

(declare-fun m!1143163 () Bool)

(assert (=> b!1239753 m!1143163))

(assert (=> b!1239754 m!1143105))

(assert (=> b!1239754 m!1143105))

(assert (=> b!1239754 m!1143161))

(assert (=> bm!61107 m!1143105))

(declare-fun m!1143165 () Bool)

(assert (=> bm!61107 m!1143165))

(assert (=> b!1239624 d!136087))

(declare-fun d!136091 () Bool)

(assert (=> d!136091 (subseq!628 lt!561806 lt!561806)))

(declare-fun lt!561836 () Unit!41198)

(declare-fun choose!36 (List!27312) Unit!41198)

(assert (=> d!136091 (= lt!561836 (choose!36 lt!561806))))

(assert (=> d!136091 (= (lemmaListSubSeqRefl!0 lt!561806) lt!561836)))

(declare-fun bs!34860 () Bool)

(assert (= bs!34860 d!136091))

(assert (=> bs!34860 m!1143055))

(declare-fun m!1143167 () Bool)

(assert (=> bs!34860 m!1143167))

(assert (=> b!1239624 d!136091))

(declare-fun d!136093 () Bool)

(assert (=> d!136093 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!561840 () Unit!41198)

(declare-fun choose!80 (array!79878 List!27312 List!27312 (_ BitVec 32)) Unit!41198)

(assert (=> d!136093 (= lt!561840 (choose!80 a!3835 lt!561806 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!136093 (bvslt (size!39075 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136093 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561806 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!561840)))

(declare-fun bs!34861 () Bool)

(assert (= bs!34861 d!136093))

(assert (=> bs!34861 m!1143065))

(declare-fun m!1143175 () Bool)

(assert (=> bs!34861 m!1143175))

(assert (=> b!1239624 d!136093))

(declare-fun b!1239778 () Bool)

(declare-fun e!702599 () Bool)

(declare-fun e!702600 () Bool)

(assert (=> b!1239778 (= e!702599 e!702600)))

(declare-fun res!827127 () Bool)

(assert (=> b!1239778 (=> res!827127 e!702600)))

(declare-fun e!702597 () Bool)

(assert (=> b!1239778 (= res!827127 e!702597)))

(declare-fun res!827128 () Bool)

(assert (=> b!1239778 (=> (not res!827128) (not e!702597))))

(assert (=> b!1239778 (= res!827128 (= (h!28517 acc!846) (h!28517 lt!561806)))))

(declare-fun b!1239779 () Bool)

(assert (=> b!1239779 (= e!702597 (subseq!628 (t!40775 acc!846) (t!40775 lt!561806)))))

(declare-fun d!136095 () Bool)

(declare-fun res!827130 () Bool)

(declare-fun e!702598 () Bool)

(assert (=> d!136095 (=> res!827130 e!702598)))

(assert (=> d!136095 (= res!827130 (is-Nil!27309 acc!846))))

(assert (=> d!136095 (= (subseq!628 acc!846 lt!561806) e!702598)))

(declare-fun b!1239777 () Bool)

(assert (=> b!1239777 (= e!702598 e!702599)))

(declare-fun res!827129 () Bool)

(assert (=> b!1239777 (=> (not res!827129) (not e!702599))))

(assert (=> b!1239777 (= res!827129 (is-Cons!27308 lt!561806))))

(declare-fun b!1239780 () Bool)

(assert (=> b!1239780 (= e!702600 (subseq!628 acc!846 (t!40775 lt!561806)))))

(assert (= (and d!136095 (not res!827130)) b!1239777))

(assert (= (and b!1239777 res!827129) b!1239778))

(assert (= (and b!1239778 res!827128) b!1239779))

(assert (= (and b!1239778 (not res!827127)) b!1239780))

(declare-fun m!1143191 () Bool)

(assert (=> b!1239779 m!1143191))

(declare-fun m!1143193 () Bool)

(assert (=> b!1239780 m!1143193))

(assert (=> b!1239624 d!136095))

(declare-fun b!1239782 () Bool)

(declare-fun e!702603 () Bool)

(declare-fun e!702604 () Bool)

(assert (=> b!1239782 (= e!702603 e!702604)))

(declare-fun res!827131 () Bool)

(assert (=> b!1239782 (=> res!827131 e!702604)))

(declare-fun e!702601 () Bool)

(assert (=> b!1239782 (= res!827131 e!702601)))

(declare-fun res!827132 () Bool)

(assert (=> b!1239782 (=> (not res!827132) (not e!702601))))

(assert (=> b!1239782 (= res!827132 (= (h!28517 lt!561806) (h!28517 lt!561806)))))

(declare-fun b!1239783 () Bool)

(assert (=> b!1239783 (= e!702601 (subseq!628 (t!40775 lt!561806) (t!40775 lt!561806)))))

(declare-fun d!136103 () Bool)

(declare-fun res!827134 () Bool)

(declare-fun e!702602 () Bool)

(assert (=> d!136103 (=> res!827134 e!702602)))

(assert (=> d!136103 (= res!827134 (is-Nil!27309 lt!561806))))

(assert (=> d!136103 (= (subseq!628 lt!561806 lt!561806) e!702602)))

(declare-fun b!1239781 () Bool)

(assert (=> b!1239781 (= e!702602 e!702603)))

(declare-fun res!827133 () Bool)

(assert (=> b!1239781 (=> (not res!827133) (not e!702603))))

(assert (=> b!1239781 (= res!827133 (is-Cons!27308 lt!561806))))

(declare-fun b!1239784 () Bool)

(assert (=> b!1239784 (= e!702604 (subseq!628 lt!561806 (t!40775 lt!561806)))))

(assert (= (and d!136103 (not res!827134)) b!1239781))

(assert (= (and b!1239781 res!827133) b!1239782))

(assert (= (and b!1239782 res!827132) b!1239783))

(assert (= (and b!1239782 (not res!827131)) b!1239784))

(declare-fun m!1143195 () Bool)

(assert (=> b!1239783 m!1143195))

(assert (=> b!1239784 m!1143145))

(assert (=> b!1239624 d!136103))

(declare-fun d!136105 () Bool)

(declare-fun lt!561849 () Bool)

(declare-fun content!598 (List!27312) (Set (_ BitVec 64)))

(assert (=> d!136105 (= lt!561849 (member k!2925 (content!598 acc!846)))))

(declare-fun e!702610 () Bool)

(assert (=> d!136105 (= lt!561849 e!702610)))

(declare-fun res!827140 () Bool)

(assert (=> d!136105 (=> (not res!827140) (not e!702610))))

(assert (=> d!136105 (= res!827140 (is-Cons!27308 acc!846))))

(assert (=> d!136105 (= (contains!7374 acc!846 k!2925) lt!561849)))

(declare-fun b!1239789 () Bool)

(declare-fun e!702609 () Bool)

(assert (=> b!1239789 (= e!702610 e!702609)))

(declare-fun res!827139 () Bool)

(assert (=> b!1239789 (=> res!827139 e!702609)))

(assert (=> b!1239789 (= res!827139 (= (h!28517 acc!846) k!2925))))

(declare-fun b!1239790 () Bool)

(assert (=> b!1239790 (= e!702609 (contains!7374 (t!40775 acc!846) k!2925))))

(assert (= (and d!136105 res!827140) b!1239789))

(assert (= (and b!1239789 (not res!827139)) b!1239790))

(declare-fun m!1143199 () Bool)

(assert (=> d!136105 m!1143199))

(declare-fun m!1143201 () Bool)

(assert (=> d!136105 m!1143201))

(declare-fun m!1143203 () Bool)

(assert (=> b!1239790 m!1143203))

(assert (=> b!1239628 d!136105))

(declare-fun d!136109 () Bool)

(declare-fun res!827153 () Bool)

(declare-fun e!702623 () Bool)

(assert (=> d!136109 (=> res!827153 e!702623)))

(assert (=> d!136109 (= res!827153 (is-Nil!27309 acc!846))))

(assert (=> d!136109 (= (noDuplicate!1971 acc!846) e!702623)))

(declare-fun b!1239803 () Bool)

(declare-fun e!702624 () Bool)

(assert (=> b!1239803 (= e!702623 e!702624)))

(declare-fun res!827154 () Bool)

(assert (=> b!1239803 (=> (not res!827154) (not e!702624))))

(assert (=> b!1239803 (= res!827154 (not (contains!7374 (t!40775 acc!846) (h!28517 acc!846))))))

(declare-fun b!1239804 () Bool)

(assert (=> b!1239804 (= e!702624 (noDuplicate!1971 (t!40775 acc!846)))))

(assert (= (and d!136109 (not res!827153)) b!1239803))

(assert (= (and b!1239803 res!827154) b!1239804))

(declare-fun m!1143205 () Bool)

(assert (=> b!1239803 m!1143205))

(declare-fun m!1143207 () Bool)

(assert (=> b!1239804 m!1143207))

(assert (=> b!1239627 d!136109))

(declare-fun d!136111 () Bool)

(declare-fun lt!561850 () Bool)

(assert (=> d!136111 (= lt!561850 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!598 acc!846)))))

(declare-fun e!702626 () Bool)

(assert (=> d!136111 (= lt!561850 e!702626)))

(declare-fun res!827156 () Bool)

(assert (=> d!136111 (=> (not res!827156) (not e!702626))))

(assert (=> d!136111 (= res!827156 (is-Cons!27308 acc!846))))

(assert (=> d!136111 (= (contains!7374 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561850)))

(declare-fun b!1239805 () Bool)

(declare-fun e!702625 () Bool)

(assert (=> b!1239805 (= e!702626 e!702625)))

(declare-fun res!827155 () Bool)

(assert (=> b!1239805 (=> res!827155 e!702625)))

(assert (=> b!1239805 (= res!827155 (= (h!28517 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239806 () Bool)

(assert (=> b!1239806 (= e!702625 (contains!7374 (t!40775 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136111 res!827156) b!1239805))

(assert (= (and b!1239805 (not res!827155)) b!1239806))

(assert (=> d!136111 m!1143199))

(declare-fun m!1143209 () Bool)

(assert (=> d!136111 m!1143209))

(declare-fun m!1143211 () Bool)

(assert (=> b!1239806 m!1143211))

(assert (=> b!1239622 d!136111))

(assert (=> b!1239632 d!136087))

(declare-fun d!136113 () Bool)

(declare-fun lt!561853 () Bool)

(assert (=> d!136113 (= lt!561853 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!598 acc!846)))))

(declare-fun e!702636 () Bool)

(assert (=> d!136113 (= lt!561853 e!702636)))

(declare-fun res!827164 () Bool)

(assert (=> d!136113 (=> (not res!827164) (not e!702636))))

(assert (=> d!136113 (= res!827164 (is-Cons!27308 acc!846))))

(assert (=> d!136113 (= (contains!7374 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561853)))

(declare-fun b!1239817 () Bool)

(declare-fun e!702635 () Bool)

(assert (=> b!1239817 (= e!702636 e!702635)))

(declare-fun res!827163 () Bool)

(assert (=> b!1239817 (=> res!827163 e!702635)))

(assert (=> b!1239817 (= res!827163 (= (h!28517 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239818 () Bool)

(assert (=> b!1239818 (= e!702635 (contains!7374 (t!40775 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136113 res!827164) b!1239817))

(assert (= (and b!1239817 (not res!827163)) b!1239818))

(assert (=> d!136113 m!1143199))

(declare-fun m!1143213 () Bool)

(assert (=> d!136113 m!1143213))

(declare-fun m!1143215 () Bool)

(assert (=> b!1239818 m!1143215))

(assert (=> b!1239631 d!136113))

(declare-fun d!136115 () Bool)

(assert (=> d!136115 (= (validKeyInArray!0 (select (arr!38539 a!3835) from!3213)) (and (not (= (select (arr!38539 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38539 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239625 d!136115))

(declare-fun d!136121 () Bool)

(assert (=> d!136121 (= (array_inv!29387 a!3835) (bvsge (size!39075 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103294 d!136121))

(declare-fun b!1239831 () Bool)

(declare-fun e!702646 () Bool)

(declare-fun e!702647 () Bool)

(assert (=> b!1239831 (= e!702646 e!702647)))

(declare-fun c!121191 () Bool)

(assert (=> b!1239831 (= c!121191 (validKeyInArray!0 (select (arr!38539 a!3835) from!3213)))))

(declare-fun e!702648 () Bool)

(declare-fun b!1239832 () Bool)

(assert (=> b!1239832 (= e!702648 (contains!7374 acc!846 (select (arr!38539 a!3835) from!3213)))))

(declare-fun b!1239833 () Bool)

(declare-fun e!702645 () Bool)

(assert (=> b!1239833 (= e!702645 e!702646)))

(declare-fun res!827169 () Bool)

(assert (=> b!1239833 (=> (not res!827169) (not e!702646))))

(assert (=> b!1239833 (= res!827169 (not e!702648))))

(declare-fun res!827171 () Bool)

(assert (=> b!1239833 (=> (not res!827171) (not e!702648))))

(assert (=> b!1239833 (= res!827171 (validKeyInArray!0 (select (arr!38539 a!3835) from!3213)))))

(declare-fun b!1239834 () Bool)

(declare-fun call!61115 () Bool)

(assert (=> b!1239834 (= e!702647 call!61115)))

(declare-fun bm!61112 () Bool)

(assert (=> bm!61112 (= call!61115 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121191 (Cons!27308 (select (arr!38539 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1239835 () Bool)

(assert (=> b!1239835 (= e!702647 call!61115)))

(declare-fun d!136123 () Bool)

(declare-fun res!827170 () Bool)

(assert (=> d!136123 (=> res!827170 e!702645)))

(assert (=> d!136123 (= res!827170 (bvsge from!3213 (size!39075 a!3835)))))

(assert (=> d!136123 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702645)))

(assert (= (and d!136123 (not res!827170)) b!1239833))

