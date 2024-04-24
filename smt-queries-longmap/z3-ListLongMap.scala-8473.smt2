; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103432 () Bool)

(assert start!103432)

(declare-fun b!1240054 () Bool)

(declare-fun res!826890 () Bool)

(declare-fun e!702919 () Bool)

(assert (=> b!1240054 (=> (not res!826890) (not e!702919))))

(declare-datatypes ((List!27314 0))(
  ( (Nil!27311) (Cons!27310 (h!28528 (_ BitVec 64)) (t!40769 List!27314)) )
))
(declare-fun acc!846 () List!27314)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7385 (List!27314 (_ BitVec 64)) Bool)

(assert (=> b!1240054 (= res!826890 (contains!7385 acc!846 k0!2925))))

(declare-fun b!1240056 () Bool)

(declare-fun res!826891 () Bool)

(assert (=> b!1240056 (=> (not res!826891) (not e!702919))))

(assert (=> b!1240056 (= res!826891 (not (contains!7385 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240057 () Bool)

(declare-fun res!826888 () Bool)

(assert (=> b!1240057 (=> (not res!826888) (not e!702919))))

(declare-fun noDuplicate!1966 (List!27314) Bool)

(assert (=> b!1240057 (= res!826888 (noDuplicate!1966 acc!846))))

(declare-fun b!1240058 () Bool)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1240058 (= e!702919 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41098 0))(
  ( (Unit!41099) )
))
(declare-fun lt!561883 () Unit!41098)

(declare-fun e!702920 () Unit!41098)

(assert (=> b!1240058 (= lt!561883 e!702920)))

(declare-fun c!121451 () Bool)

(declare-datatypes ((array!79865 0))(
  ( (array!79866 (arr!38528 (Array (_ BitVec 32) (_ BitVec 64))) (size!39065 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79865)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240058 (= c!121451 (validKeyInArray!0 (select (arr!38528 a!3835) from!3213)))))

(declare-fun b!1240059 () Bool)

(declare-fun Unit!41100 () Unit!41098)

(assert (=> b!1240059 (= e!702920 Unit!41100)))

(declare-fun b!1240060 () Bool)

(declare-fun res!826887 () Bool)

(assert (=> b!1240060 (=> (not res!826887) (not e!702919))))

(declare-fun arrayNoDuplicates!0 (array!79865 (_ BitVec 32) List!27314) Bool)

(assert (=> b!1240060 (= res!826887 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1240061 () Bool)

(declare-fun res!826893 () Bool)

(assert (=> b!1240061 (=> (not res!826893) (not e!702919))))

(assert (=> b!1240061 (= res!826893 (not (= from!3213 (bvsub (size!39065 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1240062 () Bool)

(declare-fun res!826889 () Bool)

(assert (=> b!1240062 (=> (not res!826889) (not e!702919))))

(assert (=> b!1240062 (= res!826889 (not (contains!7385 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240055 () Bool)

(declare-fun lt!561884 () Unit!41098)

(assert (=> b!1240055 (= e!702920 lt!561884)))

(declare-fun lt!561885 () List!27314)

(assert (=> b!1240055 (= lt!561885 (Cons!27310 (select (arr!38528 a!3835) from!3213) acc!846))))

(declare-fun lt!561887 () Unit!41098)

(declare-fun lemmaListSubSeqRefl!0 (List!27314) Unit!41098)

(assert (=> b!1240055 (= lt!561887 (lemmaListSubSeqRefl!0 lt!561885))))

(declare-fun subseq!605 (List!27314 List!27314) Bool)

(assert (=> b!1240055 (subseq!605 lt!561885 lt!561885)))

(declare-fun lt!561886 () Unit!41098)

(declare-fun subseqTail!92 (List!27314 List!27314) Unit!41098)

(assert (=> b!1240055 (= lt!561886 (subseqTail!92 lt!561885 lt!561885))))

(assert (=> b!1240055 (subseq!605 acc!846 lt!561885)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79865 List!27314 List!27314 (_ BitVec 32)) Unit!41098)

(assert (=> b!1240055 (= lt!561884 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561885 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1240055 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!826892 () Bool)

(assert (=> start!103432 (=> (not res!826892) (not e!702919))))

(assert (=> start!103432 (= res!826892 (and (bvslt (size!39065 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39065 a!3835))))))

(assert (=> start!103432 e!702919))

(declare-fun array_inv!29466 (array!79865) Bool)

(assert (=> start!103432 (array_inv!29466 a!3835)))

(assert (=> start!103432 true))

(assert (= (and start!103432 res!826892) b!1240057))

(assert (= (and b!1240057 res!826888) b!1240056))

(assert (= (and b!1240056 res!826891) b!1240062))

(assert (= (and b!1240062 res!826889) b!1240060))

(assert (= (and b!1240060 res!826887) b!1240054))

(assert (= (and b!1240054 res!826890) b!1240061))

(assert (= (and b!1240061 res!826893) b!1240058))

(assert (= (and b!1240058 c!121451) b!1240055))

(assert (= (and b!1240058 (not c!121451)) b!1240059))

(declare-fun m!1143887 () Bool)

(assert (=> b!1240058 m!1143887))

(assert (=> b!1240058 m!1143887))

(declare-fun m!1143889 () Bool)

(assert (=> b!1240058 m!1143889))

(declare-fun m!1143891 () Bool)

(assert (=> b!1240054 m!1143891))

(declare-fun m!1143893 () Bool)

(assert (=> b!1240055 m!1143893))

(declare-fun m!1143895 () Bool)

(assert (=> b!1240055 m!1143895))

(declare-fun m!1143897 () Bool)

(assert (=> b!1240055 m!1143897))

(declare-fun m!1143899 () Bool)

(assert (=> b!1240055 m!1143899))

(assert (=> b!1240055 m!1143887))

(declare-fun m!1143901 () Bool)

(assert (=> b!1240055 m!1143901))

(declare-fun m!1143903 () Bool)

(assert (=> b!1240055 m!1143903))

(declare-fun m!1143905 () Bool)

(assert (=> start!103432 m!1143905))

(declare-fun m!1143907 () Bool)

(assert (=> b!1240062 m!1143907))

(declare-fun m!1143909 () Bool)

(assert (=> b!1240056 m!1143909))

(declare-fun m!1143911 () Bool)

(assert (=> b!1240060 m!1143911))

(declare-fun m!1143913 () Bool)

(assert (=> b!1240057 m!1143913))

(check-sat (not b!1240060) (not b!1240057) (not start!103432) (not b!1240058) (not b!1240062) (not b!1240054) (not b!1240055) (not b!1240056))
(check-sat)
