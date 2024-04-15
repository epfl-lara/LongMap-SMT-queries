; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116276 () Bool)

(assert start!116276)

(declare-fun res!916077 () Bool)

(declare-fun e!777671 () Bool)

(assert (=> start!116276 (=> (not res!916077) (not e!777671))))

(declare-datatypes ((array!93052 0))(
  ( (array!93053 (arr!44937 (Array (_ BitVec 32) (_ BitVec 64))) (size!45489 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93052)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116276 (= res!916077 (and (bvslt (size!45489 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45489 a!3861))))))

(assert (=> start!116276 e!777671))

(declare-fun array_inv!34170 (array!93052) Bool)

(assert (=> start!116276 (array_inv!34170 a!3861)))

(assert (=> start!116276 true))

(declare-fun b!1372765 () Bool)

(declare-fun res!916082 () Bool)

(assert (=> b!1372765 (=> (not res!916082) (not e!777671))))

(declare-datatypes ((List!32083 0))(
  ( (Nil!32080) (Cons!32079 (h!33288 (_ BitVec 64)) (t!46769 List!32083)) )
))
(declare-fun newAcc!98 () List!32083)

(declare-fun acc!866 () List!32083)

(declare-fun subseq!1114 (List!32083 List!32083) Bool)

(assert (=> b!1372765 (= res!916082 (subseq!1114 newAcc!98 acc!866))))

(declare-fun b!1372766 () Bool)

(declare-fun res!916079 () Bool)

(assert (=> b!1372766 (=> (not res!916079) (not e!777671))))

(declare-fun contains!9676 (List!32083 (_ BitVec 64)) Bool)

(assert (=> b!1372766 (= res!916079 (not (contains!9676 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372767 () Bool)

(declare-fun res!916080 () Bool)

(assert (=> b!1372767 (=> (not res!916080) (not e!777671))))

(assert (=> b!1372767 (= res!916080 (not (contains!9676 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372768 () Bool)

(assert (=> b!1372768 (= e!777671 false)))

(declare-fun lt!602765 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93052 (_ BitVec 32) List!32083) Bool)

(assert (=> b!1372768 (= lt!602765 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45202 0))(
  ( (Unit!45203) )
))
(declare-fun lt!602766 () Unit!45202)

(declare-fun noDuplicateSubseq!301 (List!32083 List!32083) Unit!45202)

(assert (=> b!1372768 (= lt!602766 (noDuplicateSubseq!301 newAcc!98 acc!866))))

(declare-fun b!1372769 () Bool)

(declare-fun res!916081 () Bool)

(assert (=> b!1372769 (=> (not res!916081) (not e!777671))))

(assert (=> b!1372769 (= res!916081 (not (contains!9676 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372770 () Bool)

(declare-fun res!916078 () Bool)

(assert (=> b!1372770 (=> (not res!916078) (not e!777671))))

(declare-fun noDuplicate!2591 (List!32083) Bool)

(assert (=> b!1372770 (= res!916078 (noDuplicate!2591 acc!866))))

(declare-fun b!1372771 () Bool)

(declare-fun res!916076 () Bool)

(assert (=> b!1372771 (=> (not res!916076) (not e!777671))))

(assert (=> b!1372771 (= res!916076 (not (contains!9676 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116276 res!916077) b!1372770))

(assert (= (and b!1372770 res!916078) b!1372767))

(assert (= (and b!1372767 res!916080) b!1372769))

(assert (= (and b!1372769 res!916081) b!1372771))

(assert (= (and b!1372771 res!916076) b!1372766))

(assert (= (and b!1372766 res!916079) b!1372765))

(assert (= (and b!1372765 res!916082) b!1372768))

(declare-fun m!1255689 () Bool)

(assert (=> b!1372768 m!1255689))

(declare-fun m!1255691 () Bool)

(assert (=> b!1372768 m!1255691))

(declare-fun m!1255693 () Bool)

(assert (=> b!1372766 m!1255693))

(declare-fun m!1255695 () Bool)

(assert (=> b!1372769 m!1255695))

(declare-fun m!1255697 () Bool)

(assert (=> b!1372771 m!1255697))

(declare-fun m!1255699 () Bool)

(assert (=> b!1372765 m!1255699))

(declare-fun m!1255701 () Bool)

(assert (=> b!1372767 m!1255701))

(declare-fun m!1255703 () Bool)

(assert (=> b!1372770 m!1255703))

(declare-fun m!1255705 () Bool)

(assert (=> start!116276 m!1255705))

(push 1)

(assert (not b!1372766))

(assert (not b!1372767))

(assert (not b!1372770))

(assert (not b!1372768))

(assert (not start!116276))

(assert (not b!1372769))

(assert (not b!1372771))

(assert (not b!1372765))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

