; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103428 () Bool)

(assert start!103428)

(declare-fun b!1240000 () Bool)

(declare-fun res!826849 () Bool)

(declare-fun e!702902 () Bool)

(assert (=> b!1240000 (=> (not res!826849) (not e!702902))))

(declare-datatypes ((array!79861 0))(
  ( (array!79862 (arr!38526 (Array (_ BitVec 32) (_ BitVec 64))) (size!39063 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79861)

(declare-datatypes ((List!27312 0))(
  ( (Nil!27309) (Cons!27308 (h!28526 (_ BitVec 64)) (t!40767 List!27312)) )
))
(declare-fun acc!846 () List!27312)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79861 (_ BitVec 32) List!27312) Bool)

(assert (=> b!1240000 (= res!826849 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1240001 () Bool)

(declare-datatypes ((Unit!41092 0))(
  ( (Unit!41093) )
))
(declare-fun e!702901 () Unit!41092)

(declare-fun Unit!41094 () Unit!41092)

(assert (=> b!1240001 (= e!702901 Unit!41094)))

(declare-fun b!1240002 () Bool)

(declare-fun res!826848 () Bool)

(assert (=> b!1240002 (=> (not res!826848) (not e!702902))))

(declare-fun noDuplicate!1964 (List!27312) Bool)

(assert (=> b!1240002 (= res!826848 (noDuplicate!1964 acc!846))))

(declare-fun b!1240003 () Bool)

(declare-fun res!826846 () Bool)

(assert (=> b!1240003 (=> (not res!826846) (not e!702902))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7383 (List!27312 (_ BitVec 64)) Bool)

(assert (=> b!1240003 (= res!826846 (contains!7383 acc!846 k!2925))))

(declare-fun b!1240004 () Bool)

(declare-fun res!826847 () Bool)

(assert (=> b!1240004 (=> (not res!826847) (not e!702902))))

(assert (=> b!1240004 (= res!826847 (not (contains!7383 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240005 () Bool)

(declare-fun res!826851 () Bool)

(assert (=> b!1240005 (=> (not res!826851) (not e!702902))))

(assert (=> b!1240005 (= res!826851 (not (= from!3213 (bvsub (size!39063 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1240006 () Bool)

(declare-fun lt!561854 () Unit!41092)

(assert (=> b!1240006 (= e!702901 lt!561854)))

(declare-fun lt!561857 () List!27312)

(assert (=> b!1240006 (= lt!561857 (Cons!27308 (select (arr!38526 a!3835) from!3213) acc!846))))

(declare-fun lt!561855 () Unit!41092)

(declare-fun lemmaListSubSeqRefl!0 (List!27312) Unit!41092)

(assert (=> b!1240006 (= lt!561855 (lemmaListSubSeqRefl!0 lt!561857))))

(declare-fun subseq!603 (List!27312 List!27312) Bool)

(assert (=> b!1240006 (subseq!603 lt!561857 lt!561857)))

(declare-fun lt!561856 () Unit!41092)

(declare-fun subseqTail!90 (List!27312 List!27312) Unit!41092)

(assert (=> b!1240006 (= lt!561856 (subseqTail!90 lt!561857 lt!561857))))

(assert (=> b!1240006 (subseq!603 acc!846 lt!561857)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79861 List!27312 List!27312 (_ BitVec 32)) Unit!41092)

(assert (=> b!1240006 (= lt!561854 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561857 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1240006 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!826845 () Bool)

(assert (=> start!103428 (=> (not res!826845) (not e!702902))))

(assert (=> start!103428 (= res!826845 (and (bvslt (size!39063 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39063 a!3835))))))

(assert (=> start!103428 e!702902))

(declare-fun array_inv!29464 (array!79861) Bool)

(assert (=> start!103428 (array_inv!29464 a!3835)))

(assert (=> start!103428 true))

(declare-fun b!1240007 () Bool)

(declare-fun res!826850 () Bool)

(assert (=> b!1240007 (=> (not res!826850) (not e!702902))))

(assert (=> b!1240007 (= res!826850 (not (contains!7383 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240008 () Bool)

(assert (=> b!1240008 (= e!702902 false)))

(declare-fun lt!561853 () Unit!41092)

(assert (=> b!1240008 (= lt!561853 e!702901)))

(declare-fun c!121445 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240008 (= c!121445 (validKeyInArray!0 (select (arr!38526 a!3835) from!3213)))))

(assert (= (and start!103428 res!826845) b!1240002))

(assert (= (and b!1240002 res!826848) b!1240004))

(assert (= (and b!1240004 res!826847) b!1240007))

(assert (= (and b!1240007 res!826850) b!1240000))

(assert (= (and b!1240000 res!826849) b!1240003))

(assert (= (and b!1240003 res!826846) b!1240005))

(assert (= (and b!1240005 res!826851) b!1240008))

(assert (= (and b!1240008 c!121445) b!1240006))

(assert (= (and b!1240008 (not c!121445)) b!1240001))

(declare-fun m!1143831 () Bool)

(assert (=> b!1240006 m!1143831))

(declare-fun m!1143833 () Bool)

(assert (=> b!1240006 m!1143833))

(declare-fun m!1143835 () Bool)

(assert (=> b!1240006 m!1143835))

(declare-fun m!1143837 () Bool)

(assert (=> b!1240006 m!1143837))

(declare-fun m!1143839 () Bool)

(assert (=> b!1240006 m!1143839))

(declare-fun m!1143841 () Bool)

(assert (=> b!1240006 m!1143841))

(declare-fun m!1143843 () Bool)

(assert (=> b!1240006 m!1143843))

(assert (=> b!1240008 m!1143843))

(assert (=> b!1240008 m!1143843))

(declare-fun m!1143845 () Bool)

(assert (=> b!1240008 m!1143845))

(declare-fun m!1143847 () Bool)

(assert (=> b!1240002 m!1143847))

(declare-fun m!1143849 () Bool)

(assert (=> start!103428 m!1143849))

(declare-fun m!1143851 () Bool)

(assert (=> b!1240000 m!1143851))

(declare-fun m!1143853 () Bool)

(assert (=> b!1240007 m!1143853))

(declare-fun m!1143855 () Bool)

(assert (=> b!1240004 m!1143855))

(declare-fun m!1143857 () Bool)

(assert (=> b!1240003 m!1143857))

(push 1)

(assert (not b!1240006))

(assert (not start!103428))

(assert (not b!1240000))

(assert (not b!1240008))

(assert (not b!1240004))

(assert (not b!1240002))

(assert (not b!1240003))

(assert (not b!1240007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

