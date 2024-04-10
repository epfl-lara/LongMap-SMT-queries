; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115680 () Bool)

(assert start!115680)

(declare-fun b!1367751 () Bool)

(declare-fun res!911267 () Bool)

(declare-fun e!775146 () Bool)

(assert (=> b!1367751 (=> (not res!911267) (not e!775146))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92872 0))(
  ( (array!92873 (arr!44860 (Array (_ BitVec 32) (_ BitVec 64))) (size!45410 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92872)

(assert (=> b!1367751 (= res!911267 (bvslt from!3239 (size!45410 a!3861)))))

(declare-fun b!1367752 () Bool)

(declare-fun res!911259 () Bool)

(declare-fun e!775145 () Bool)

(assert (=> b!1367752 (=> (not res!911259) (not e!775145))))

(declare-datatypes ((List!31928 0))(
  ( (Nil!31925) (Cons!31924 (h!33133 (_ BitVec 64)) (t!46622 List!31928)) )
))
(declare-fun newAcc!98 () List!31928)

(declare-fun acc!866 () List!31928)

(declare-fun subseq!1012 (List!31928 List!31928) Bool)

(assert (=> b!1367752 (= res!911259 (subseq!1012 newAcc!98 acc!866))))

(declare-fun b!1367753 () Bool)

(declare-fun res!911262 () Bool)

(assert (=> b!1367753 (=> (not res!911262) (not e!775145))))

(declare-fun noDuplicate!2467 (List!31928) Bool)

(assert (=> b!1367753 (= res!911262 (noDuplicate!2467 acc!866))))

(declare-fun b!1367754 () Bool)

(declare-fun res!911265 () Bool)

(assert (=> b!1367754 (=> (not res!911265) (not e!775146))))

(declare-fun contains!9610 (List!31928 (_ BitVec 64)) Bool)

(assert (=> b!1367754 (= res!911265 (contains!9610 acc!866 (select (arr!44860 a!3861) from!3239)))))

(declare-fun res!911269 () Bool)

(assert (=> start!115680 (=> (not res!911269) (not e!775145))))

(assert (=> start!115680 (= res!911269 (and (bvslt (size!45410 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45410 a!3861))))))

(assert (=> start!115680 e!775145))

(declare-fun array_inv!33888 (array!92872) Bool)

(assert (=> start!115680 (array_inv!33888 a!3861)))

(assert (=> start!115680 true))

(declare-fun b!1367755 () Bool)

(declare-fun res!911264 () Bool)

(assert (=> b!1367755 (=> (not res!911264) (not e!775145))))

(assert (=> b!1367755 (= res!911264 (not (contains!9610 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367756 () Bool)

(declare-fun res!911266 () Bool)

(assert (=> b!1367756 (=> (not res!911266) (not e!775145))))

(assert (=> b!1367756 (= res!911266 (not (contains!9610 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367757 () Bool)

(declare-fun res!911261 () Bool)

(assert (=> b!1367757 (=> (not res!911261) (not e!775145))))

(assert (=> b!1367757 (= res!911261 (not (contains!9610 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367758 () Bool)

(assert (=> b!1367758 (= e!775146 false)))

(declare-fun lt!601941 () Bool)

(assert (=> b!1367758 (= lt!601941 (noDuplicate!2467 newAcc!98))))

(declare-fun b!1367759 () Bool)

(assert (=> b!1367759 (= e!775145 e!775146)))

(declare-fun res!911263 () Bool)

(assert (=> b!1367759 (=> (not res!911263) (not e!775146))))

(declare-fun arrayNoDuplicates!0 (array!92872 (_ BitVec 32) List!31928) Bool)

(assert (=> b!1367759 (= res!911263 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45157 0))(
  ( (Unit!45158) )
))
(declare-fun lt!601942 () Unit!45157)

(declare-fun noDuplicateSubseq!199 (List!31928 List!31928) Unit!45157)

(assert (=> b!1367759 (= lt!601942 (noDuplicateSubseq!199 newAcc!98 acc!866))))

(declare-fun b!1367760 () Bool)

(declare-fun res!911268 () Bool)

(assert (=> b!1367760 (=> (not res!911268) (not e!775145))))

(assert (=> b!1367760 (= res!911268 (not (contains!9610 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367761 () Bool)

(declare-fun res!911260 () Bool)

(assert (=> b!1367761 (=> (not res!911260) (not e!775146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367761 (= res!911260 (validKeyInArray!0 (select (arr!44860 a!3861) from!3239)))))

(assert (= (and start!115680 res!911269) b!1367753))

(assert (= (and b!1367753 res!911262) b!1367757))

(assert (= (and b!1367757 res!911261) b!1367755))

(assert (= (and b!1367755 res!911264) b!1367756))

(assert (= (and b!1367756 res!911266) b!1367760))

(assert (= (and b!1367760 res!911268) b!1367752))

(assert (= (and b!1367752 res!911259) b!1367759))

(assert (= (and b!1367759 res!911263) b!1367751))

(assert (= (and b!1367751 res!911267) b!1367761))

(assert (= (and b!1367761 res!911260) b!1367754))

(assert (= (and b!1367754 res!911265) b!1367758))

(declare-fun m!1251905 () Bool)

(assert (=> b!1367758 m!1251905))

(declare-fun m!1251907 () Bool)

(assert (=> start!115680 m!1251907))

(declare-fun m!1251909 () Bool)

(assert (=> b!1367756 m!1251909))

(declare-fun m!1251911 () Bool)

(assert (=> b!1367760 m!1251911))

(declare-fun m!1251913 () Bool)

(assert (=> b!1367752 m!1251913))

(declare-fun m!1251915 () Bool)

(assert (=> b!1367757 m!1251915))

(declare-fun m!1251917 () Bool)

(assert (=> b!1367753 m!1251917))

(declare-fun m!1251919 () Bool)

(assert (=> b!1367754 m!1251919))

(assert (=> b!1367754 m!1251919))

(declare-fun m!1251921 () Bool)

(assert (=> b!1367754 m!1251921))

(declare-fun m!1251923 () Bool)

(assert (=> b!1367755 m!1251923))

(assert (=> b!1367761 m!1251919))

(assert (=> b!1367761 m!1251919))

(declare-fun m!1251925 () Bool)

(assert (=> b!1367761 m!1251925))

(declare-fun m!1251927 () Bool)

(assert (=> b!1367759 m!1251927))

(declare-fun m!1251929 () Bool)

(assert (=> b!1367759 m!1251929))

(push 1)

(assert (not b!1367754))

(assert (not b!1367755))

