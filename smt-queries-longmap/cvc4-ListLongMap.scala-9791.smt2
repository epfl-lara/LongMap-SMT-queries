; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116274 () Bool)

(assert start!116274)

(declare-fun b!1372711 () Bool)

(declare-fun res!915980 () Bool)

(declare-fun e!777669 () Bool)

(assert (=> b!1372711 (=> (not res!915980) (not e!777669))))

(declare-datatypes ((List!32024 0))(
  ( (Nil!32021) (Cons!32020 (h!33229 (_ BitVec 64)) (t!46718 List!32024)) )
))
(declare-fun newAcc!98 () List!32024)

(declare-fun contains!9706 (List!32024 (_ BitVec 64)) Bool)

(assert (=> b!1372711 (= res!915980 (not (contains!9706 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372712 () Bool)

(declare-fun res!915985 () Bool)

(assert (=> b!1372712 (=> (not res!915985) (not e!777669))))

(declare-fun acc!866 () List!32024)

(declare-fun noDuplicate!2563 (List!32024) Bool)

(assert (=> b!1372712 (= res!915985 (noDuplicate!2563 acc!866))))

(declare-fun res!915984 () Bool)

(assert (=> start!116274 (=> (not res!915984) (not e!777669))))

(declare-datatypes ((array!93091 0))(
  ( (array!93092 (arr!44956 (Array (_ BitVec 32) (_ BitVec 64))) (size!45506 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93091)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116274 (= res!915984 (and (bvslt (size!45506 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45506 a!3861))))))

(assert (=> start!116274 e!777669))

(declare-fun array_inv!33984 (array!93091) Bool)

(assert (=> start!116274 (array_inv!33984 a!3861)))

(assert (=> start!116274 true))

(declare-fun b!1372713 () Bool)

(assert (=> b!1372713 (= e!777669 false)))

(declare-fun lt!602917 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93091 (_ BitVec 32) List!32024) Bool)

(assert (=> b!1372713 (= lt!602917 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45349 0))(
  ( (Unit!45350) )
))
(declare-fun lt!602916 () Unit!45349)

(declare-fun noDuplicateSubseq!295 (List!32024 List!32024) Unit!45349)

(assert (=> b!1372713 (= lt!602916 (noDuplicateSubseq!295 newAcc!98 acc!866))))

(declare-fun b!1372714 () Bool)

(declare-fun res!915983 () Bool)

(assert (=> b!1372714 (=> (not res!915983) (not e!777669))))

(assert (=> b!1372714 (= res!915983 (not (contains!9706 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372715 () Bool)

(declare-fun res!915982 () Bool)

(assert (=> b!1372715 (=> (not res!915982) (not e!777669))))

(assert (=> b!1372715 (= res!915982 (not (contains!9706 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372716 () Bool)

(declare-fun res!915979 () Bool)

(assert (=> b!1372716 (=> (not res!915979) (not e!777669))))

(declare-fun subseq!1108 (List!32024 List!32024) Bool)

(assert (=> b!1372716 (= res!915979 (subseq!1108 newAcc!98 acc!866))))

(declare-fun b!1372717 () Bool)

(declare-fun res!915981 () Bool)

(assert (=> b!1372717 (=> (not res!915981) (not e!777669))))

(assert (=> b!1372717 (= res!915981 (not (contains!9706 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116274 res!915984) b!1372712))

(assert (= (and b!1372712 res!915985) b!1372717))

(assert (= (and b!1372717 res!915981) b!1372714))

(assert (= (and b!1372714 res!915983) b!1372715))

(assert (= (and b!1372715 res!915982) b!1372711))

(assert (= (and b!1372711 res!915980) b!1372716))

(assert (= (and b!1372716 res!915979) b!1372713))

(declare-fun m!1256107 () Bool)

(assert (=> b!1372711 m!1256107))

(declare-fun m!1256109 () Bool)

(assert (=> b!1372716 m!1256109))

(declare-fun m!1256111 () Bool)

(assert (=> start!116274 m!1256111))

(declare-fun m!1256113 () Bool)

(assert (=> b!1372714 m!1256113))

(declare-fun m!1256115 () Bool)

(assert (=> b!1372713 m!1256115))

(declare-fun m!1256117 () Bool)

(assert (=> b!1372713 m!1256117))

(declare-fun m!1256119 () Bool)

(assert (=> b!1372715 m!1256119))

(declare-fun m!1256121 () Bool)

(assert (=> b!1372712 m!1256121))

(declare-fun m!1256123 () Bool)

(assert (=> b!1372717 m!1256123))

(push 1)

(assert (not start!116274))

(assert (not b!1372716))

(assert (not b!1372713))

(assert (not b!1372712))

