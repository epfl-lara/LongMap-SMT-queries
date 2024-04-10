; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103280 () Bool)

(assert start!103280)

(declare-fun b!1239395 () Bool)

(declare-fun e!702394 () Bool)

(assert (=> b!1239395 (= e!702394 false)))

(declare-fun lt!561684 () Bool)

(declare-datatypes ((array!79864 0))(
  ( (array!79865 (arr!38532 (Array (_ BitVec 32) (_ BitVec 64))) (size!39068 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79864)

(declare-datatypes ((List!27305 0))(
  ( (Nil!27302) (Cons!27301 (h!28510 (_ BitVec 64)) (t!40768 List!27305)) )
))
(declare-fun acc!846 () List!27305)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79864 (_ BitVec 32) List!27305) Bool)

(assert (=> b!1239395 (= lt!561684 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239396 () Bool)

(declare-fun res!826847 () Bool)

(declare-fun e!702393 () Bool)

(assert (=> b!1239396 (=> (not res!826847) (not e!702393))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7367 (List!27305 (_ BitVec 64)) Bool)

(assert (=> b!1239396 (= res!826847 (contains!7367 acc!846 k0!2925))))

(declare-fun b!1239398 () Bool)

(declare-fun res!826849 () Bool)

(assert (=> b!1239398 (=> (not res!826849) (not e!702393))))

(assert (=> b!1239398 (= res!826849 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239399 () Bool)

(declare-fun res!826851 () Bool)

(assert (=> b!1239399 (=> (not res!826851) (not e!702393))))

(assert (=> b!1239399 (= res!826851 (not (= from!3213 (bvsub (size!39068 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239400 () Bool)

(declare-fun res!826845 () Bool)

(assert (=> b!1239400 (=> (not res!826845) (not e!702393))))

(declare-fun noDuplicate!1964 (List!27305) Bool)

(assert (=> b!1239400 (= res!826845 (noDuplicate!1964 acc!846))))

(declare-fun b!1239401 () Bool)

(declare-datatypes ((Unit!41177 0))(
  ( (Unit!41178) )
))
(declare-fun e!702395 () Unit!41177)

(declare-fun Unit!41179 () Unit!41177)

(assert (=> b!1239401 (= e!702395 Unit!41179)))

(declare-fun b!1239402 () Bool)

(declare-fun res!826852 () Bool)

(assert (=> b!1239402 (=> (not res!826852) (not e!702393))))

(assert (=> b!1239402 (= res!826852 (not (contains!7367 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239397 () Bool)

(declare-fun lt!561687 () Unit!41177)

(assert (=> b!1239397 (= e!702395 lt!561687)))

(declare-fun lt!561686 () List!27305)

(assert (=> b!1239397 (= lt!561686 (Cons!27301 (select (arr!38532 a!3835) from!3213) acc!846))))

(declare-fun lt!561688 () Unit!41177)

(declare-fun lemmaListSubSeqRefl!0 (List!27305) Unit!41177)

(assert (=> b!1239397 (= lt!561688 (lemmaListSubSeqRefl!0 lt!561686))))

(declare-fun subseq!621 (List!27305 List!27305) Bool)

(assert (=> b!1239397 (subseq!621 lt!561686 lt!561686)))

(declare-fun lt!561689 () Unit!41177)

(declare-fun subseqTail!108 (List!27305 List!27305) Unit!41177)

(assert (=> b!1239397 (= lt!561689 (subseqTail!108 lt!561686 lt!561686))))

(assert (=> b!1239397 (subseq!621 acc!846 lt!561686)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79864 List!27305 List!27305 (_ BitVec 32)) Unit!41177)

(assert (=> b!1239397 (= lt!561687 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561686 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239397 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!826850 () Bool)

(assert (=> start!103280 (=> (not res!826850) (not e!702393))))

(assert (=> start!103280 (= res!826850 (and (bvslt (size!39068 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39068 a!3835))))))

(assert (=> start!103280 e!702393))

(declare-fun array_inv!29380 (array!79864) Bool)

(assert (=> start!103280 (array_inv!29380 a!3835)))

(assert (=> start!103280 true))

(declare-fun b!1239403 () Bool)

(assert (=> b!1239403 (= e!702393 e!702394)))

(declare-fun res!826848 () Bool)

(assert (=> b!1239403 (=> (not res!826848) (not e!702394))))

(assert (=> b!1239403 (= res!826848 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39068 a!3835))))))

(declare-fun lt!561685 () Unit!41177)

(assert (=> b!1239403 (= lt!561685 e!702395)))

(declare-fun c!121135 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239403 (= c!121135 (validKeyInArray!0 (select (arr!38532 a!3835) from!3213)))))

(declare-fun b!1239404 () Bool)

(declare-fun res!826846 () Bool)

(assert (=> b!1239404 (=> (not res!826846) (not e!702393))))

(assert (=> b!1239404 (= res!826846 (not (contains!7367 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103280 res!826850) b!1239400))

(assert (= (and b!1239400 res!826845) b!1239404))

(assert (= (and b!1239404 res!826846) b!1239402))

(assert (= (and b!1239402 res!826852) b!1239398))

(assert (= (and b!1239398 res!826849) b!1239396))

(assert (= (and b!1239396 res!826847) b!1239399))

(assert (= (and b!1239399 res!826851) b!1239403))

(assert (= (and b!1239403 c!121135) b!1239397))

(assert (= (and b!1239403 (not c!121135)) b!1239401))

(assert (= (and b!1239403 res!826848) b!1239395))

(declare-fun m!1142843 () Bool)

(assert (=> b!1239400 m!1142843))

(declare-fun m!1142845 () Bool)

(assert (=> b!1239404 m!1142845))

(declare-fun m!1142847 () Bool)

(assert (=> b!1239403 m!1142847))

(assert (=> b!1239403 m!1142847))

(declare-fun m!1142849 () Bool)

(assert (=> b!1239403 m!1142849))

(declare-fun m!1142851 () Bool)

(assert (=> b!1239398 m!1142851))

(declare-fun m!1142853 () Bool)

(assert (=> b!1239397 m!1142853))

(declare-fun m!1142855 () Bool)

(assert (=> b!1239397 m!1142855))

(declare-fun m!1142857 () Bool)

(assert (=> b!1239397 m!1142857))

(declare-fun m!1142859 () Bool)

(assert (=> b!1239397 m!1142859))

(assert (=> b!1239397 m!1142847))

(declare-fun m!1142861 () Bool)

(assert (=> b!1239397 m!1142861))

(declare-fun m!1142863 () Bool)

(assert (=> b!1239397 m!1142863))

(declare-fun m!1142865 () Bool)

(assert (=> b!1239396 m!1142865))

(declare-fun m!1142867 () Bool)

(assert (=> start!103280 m!1142867))

(declare-fun m!1142869 () Bool)

(assert (=> b!1239402 m!1142869))

(assert (=> b!1239395 m!1142859))

(check-sat (not b!1239403) (not b!1239396) (not start!103280) (not b!1239404) (not b!1239397) (not b!1239398) (not b!1239395) (not b!1239400) (not b!1239402))
(check-sat)
