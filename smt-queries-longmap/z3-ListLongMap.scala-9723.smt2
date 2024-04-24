; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115288 () Bool)

(assert start!115288)

(declare-fun b!1364837 () Bool)

(declare-fun res!907852 () Bool)

(declare-fun e!774137 () Bool)

(assert (=> b!1364837 (=> (not res!907852) (not e!774137))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92806 0))(
  ( (array!92807 (arr!44830 (Array (_ BitVec 32) (_ BitVec 64))) (size!45381 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92806)

(assert (=> b!1364837 (= res!907852 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45381 a!3742))))))

(declare-fun b!1364838 () Bool)

(declare-fun res!907853 () Bool)

(assert (=> b!1364838 (=> (not res!907853) (not e!774137))))

(declare-datatypes ((List!31858 0))(
  ( (Nil!31855) (Cons!31854 (h!33072 (_ BitVec 64)) (t!46541 List!31858)) )
))
(declare-fun acc!759 () List!31858)

(declare-fun contains!9570 (List!31858 (_ BitVec 64)) Bool)

(assert (=> b!1364838 (= res!907853 (not (contains!9570 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!907849 () Bool)

(assert (=> start!115288 (=> (not res!907849) (not e!774137))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!115288 (= res!907849 (and (bvslt (size!45381 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45381 a!3742))))))

(assert (=> start!115288 e!774137))

(assert (=> start!115288 true))

(declare-fun array_inv!34111 (array!92806) Bool)

(assert (=> start!115288 (array_inv!34111 a!3742)))

(declare-fun b!1364839 () Bool)

(declare-fun res!907848 () Bool)

(assert (=> b!1364839 (=> (not res!907848) (not e!774137))))

(assert (=> b!1364839 (= res!907848 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45381 a!3742)))))

(declare-fun b!1364840 () Bool)

(declare-fun res!907851 () Bool)

(assert (=> b!1364840 (=> (not res!907851) (not e!774137))))

(assert (=> b!1364840 (= res!907851 (not (contains!9570 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364841 () Bool)

(declare-datatypes ((Unit!44930 0))(
  ( (Unit!44931) )
))
(declare-fun e!774138 () Unit!44930)

(declare-fun lt!601286 () Unit!44930)

(assert (=> b!1364841 (= e!774138 lt!601286)))

(declare-fun lt!601283 () Unit!44930)

(declare-fun lemmaListSubSeqRefl!0 (List!31858) Unit!44930)

(assert (=> b!1364841 (= lt!601283 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!929 (List!31858 List!31858) Bool)

(assert (=> b!1364841 (subseq!929 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92806 List!31858 List!31858 (_ BitVec 32)) Unit!44930)

(declare-fun $colon$colon!931 (List!31858 (_ BitVec 64)) List!31858)

(assert (=> b!1364841 (= lt!601286 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!931 acc!759 (select (arr!44830 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92806 (_ BitVec 32) List!31858) Bool)

(assert (=> b!1364841 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1364842 () Bool)

(declare-fun res!907856 () Bool)

(assert (=> b!1364842 (=> (not res!907856) (not e!774137))))

(declare-fun noDuplicate!2401 (List!31858) Bool)

(assert (=> b!1364842 (= res!907856 (noDuplicate!2401 acc!759))))

(declare-fun b!1364843 () Bool)

(declare-fun Unit!44932 () Unit!44930)

(assert (=> b!1364843 (= e!774138 Unit!44932)))

(declare-fun b!1364844 () Bool)

(declare-fun res!907850 () Bool)

(assert (=> b!1364844 (=> (not res!907850) (not e!774137))))

(assert (=> b!1364844 (= res!907850 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364845 () Bool)

(declare-fun e!774139 () Bool)

(assert (=> b!1364845 (= e!774139 false)))

(declare-fun lt!601287 () Bool)

(assert (=> b!1364845 (= lt!601287 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1364846 () Bool)

(declare-fun res!907857 () Bool)

(assert (=> b!1364846 (=> (not res!907857) (not e!774137))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364846 (= res!907857 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364847 () Bool)

(assert (=> b!1364847 (= e!774137 e!774139)))

(declare-fun res!907854 () Bool)

(assert (=> b!1364847 (=> (not res!907854) (not e!774139))))

(declare-fun lt!601285 () Bool)

(assert (=> b!1364847 (= res!907854 (and (not (= from!3120 i!1404)) (not lt!601285) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!601284 () Unit!44930)

(assert (=> b!1364847 (= lt!601284 e!774138)))

(declare-fun c!127942 () Bool)

(assert (=> b!1364847 (= c!127942 lt!601285)))

(assert (=> b!1364847 (= lt!601285 (validKeyInArray!0 (select (arr!44830 a!3742) from!3120)))))

(declare-fun b!1364848 () Bool)

(declare-fun res!907855 () Bool)

(assert (=> b!1364848 (=> (not res!907855) (not e!774137))))

(assert (=> b!1364848 (= res!907855 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31855))))

(assert (= (and start!115288 res!907849) b!1364842))

(assert (= (and b!1364842 res!907856) b!1364838))

(assert (= (and b!1364838 res!907853) b!1364840))

(assert (= (and b!1364840 res!907851) b!1364848))

(assert (= (and b!1364848 res!907855) b!1364844))

(assert (= (and b!1364844 res!907850) b!1364837))

(assert (= (and b!1364837 res!907852) b!1364846))

(assert (= (and b!1364846 res!907857) b!1364839))

(assert (= (and b!1364839 res!907848) b!1364847))

(assert (= (and b!1364847 c!127942) b!1364841))

(assert (= (and b!1364847 (not c!127942)) b!1364843))

(assert (= (and b!1364847 res!907854) b!1364845))

(declare-fun m!1249921 () Bool)

(assert (=> b!1364847 m!1249921))

(assert (=> b!1364847 m!1249921))

(declare-fun m!1249923 () Bool)

(assert (=> b!1364847 m!1249923))

(declare-fun m!1249925 () Bool)

(assert (=> b!1364838 m!1249925))

(declare-fun m!1249927 () Bool)

(assert (=> b!1364848 m!1249927))

(declare-fun m!1249929 () Bool)

(assert (=> b!1364842 m!1249929))

(declare-fun m!1249931 () Bool)

(assert (=> b!1364846 m!1249931))

(declare-fun m!1249933 () Bool)

(assert (=> b!1364844 m!1249933))

(declare-fun m!1249935 () Bool)

(assert (=> b!1364840 m!1249935))

(declare-fun m!1249937 () Bool)

(assert (=> b!1364845 m!1249937))

(declare-fun m!1249939 () Bool)

(assert (=> start!115288 m!1249939))

(declare-fun m!1249941 () Bool)

(assert (=> b!1364841 m!1249941))

(assert (=> b!1364841 m!1249921))

(declare-fun m!1249943 () Bool)

(assert (=> b!1364841 m!1249943))

(declare-fun m!1249945 () Bool)

(assert (=> b!1364841 m!1249945))

(assert (=> b!1364841 m!1249937))

(assert (=> b!1364841 m!1249921))

(assert (=> b!1364841 m!1249943))

(declare-fun m!1249947 () Bool)

(assert (=> b!1364841 m!1249947))

(check-sat (not b!1364838) (not b!1364847) (not b!1364848) (not start!115288) (not b!1364845) (not b!1364840) (not b!1364844) (not b!1364841) (not b!1364846) (not b!1364842))
(check-sat)
