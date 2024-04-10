; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116276 () Bool)

(assert start!116276)

(declare-fun b!1372732 () Bool)

(declare-fun res!916002 () Bool)

(declare-fun e!777675 () Bool)

(assert (=> b!1372732 (=> (not res!916002) (not e!777675))))

(declare-datatypes ((List!32025 0))(
  ( (Nil!32022) (Cons!32021 (h!33230 (_ BitVec 64)) (t!46719 List!32025)) )
))
(declare-fun acc!866 () List!32025)

(declare-fun contains!9707 (List!32025 (_ BitVec 64)) Bool)

(assert (=> b!1372732 (= res!916002 (not (contains!9707 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372733 () Bool)

(declare-fun res!916004 () Bool)

(assert (=> b!1372733 (=> (not res!916004) (not e!777675))))

(declare-fun noDuplicate!2564 (List!32025) Bool)

(assert (=> b!1372733 (= res!916004 (noDuplicate!2564 acc!866))))

(declare-fun b!1372735 () Bool)

(declare-fun res!916000 () Bool)

(assert (=> b!1372735 (=> (not res!916000) (not e!777675))))

(declare-fun newAcc!98 () List!32025)

(declare-fun subseq!1109 (List!32025 List!32025) Bool)

(assert (=> b!1372735 (= res!916000 (subseq!1109 newAcc!98 acc!866))))

(declare-fun b!1372736 () Bool)

(declare-fun res!916006 () Bool)

(assert (=> b!1372736 (=> (not res!916006) (not e!777675))))

(assert (=> b!1372736 (= res!916006 (not (contains!9707 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372737 () Bool)

(assert (=> b!1372737 (= e!777675 false)))

(declare-fun lt!602923 () Bool)

(declare-datatypes ((array!93093 0))(
  ( (array!93094 (arr!44957 (Array (_ BitVec 32) (_ BitVec 64))) (size!45507 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93093)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93093 (_ BitVec 32) List!32025) Bool)

(assert (=> b!1372737 (= lt!602923 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45351 0))(
  ( (Unit!45352) )
))
(declare-fun lt!602922 () Unit!45351)

(declare-fun noDuplicateSubseq!296 (List!32025 List!32025) Unit!45351)

(assert (=> b!1372737 (= lt!602922 (noDuplicateSubseq!296 newAcc!98 acc!866))))

(declare-fun b!1372738 () Bool)

(declare-fun res!916001 () Bool)

(assert (=> b!1372738 (=> (not res!916001) (not e!777675))))

(assert (=> b!1372738 (= res!916001 (not (contains!9707 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916003 () Bool)

(assert (=> start!116276 (=> (not res!916003) (not e!777675))))

(assert (=> start!116276 (= res!916003 (and (bvslt (size!45507 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45507 a!3861))))))

(assert (=> start!116276 e!777675))

(declare-fun array_inv!33985 (array!93093) Bool)

(assert (=> start!116276 (array_inv!33985 a!3861)))

(assert (=> start!116276 true))

(declare-fun b!1372734 () Bool)

(declare-fun res!916005 () Bool)

(assert (=> b!1372734 (=> (not res!916005) (not e!777675))))

(assert (=> b!1372734 (= res!916005 (not (contains!9707 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116276 res!916003) b!1372733))

(assert (= (and b!1372733 res!916004) b!1372732))

(assert (= (and b!1372732 res!916002) b!1372734))

(assert (= (and b!1372734 res!916005) b!1372738))

(assert (= (and b!1372738 res!916001) b!1372736))

(assert (= (and b!1372736 res!916006) b!1372735))

(assert (= (and b!1372735 res!916000) b!1372737))

(declare-fun m!1256125 () Bool)

(assert (=> b!1372733 m!1256125))

(declare-fun m!1256127 () Bool)

(assert (=> b!1372738 m!1256127))

(declare-fun m!1256129 () Bool)

(assert (=> b!1372737 m!1256129))

(declare-fun m!1256131 () Bool)

(assert (=> b!1372737 m!1256131))

(declare-fun m!1256133 () Bool)

(assert (=> b!1372736 m!1256133))

(declare-fun m!1256135 () Bool)

(assert (=> b!1372734 m!1256135))

(declare-fun m!1256137 () Bool)

(assert (=> start!116276 m!1256137))

(declare-fun m!1256139 () Bool)

(assert (=> b!1372732 m!1256139))

(declare-fun m!1256141 () Bool)

(assert (=> b!1372735 m!1256141))

(push 1)

(assert (not b!1372738))

(assert (not b!1372736))

(assert (not b!1372734))

(assert (not b!1372737))

(assert (not b!1372732))

(assert (not b!1372733))

(assert (not start!116276))

(assert (not b!1372735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

