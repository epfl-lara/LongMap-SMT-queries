; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116298 () Bool)

(assert start!116298)

(declare-fun b!1372963 () Bool)

(declare-fun res!916237 () Bool)

(declare-fun e!777742 () Bool)

(assert (=> b!1372963 (=> (not res!916237) (not e!777742))))

(declare-datatypes ((List!32036 0))(
  ( (Nil!32033) (Cons!32032 (h!33241 (_ BitVec 64)) (t!46730 List!32036)) )
))
(declare-fun acc!866 () List!32036)

(declare-fun contains!9718 (List!32036 (_ BitVec 64)) Bool)

(assert (=> b!1372963 (= res!916237 (not (contains!9718 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372964 () Bool)

(declare-fun res!916236 () Bool)

(assert (=> b!1372964 (=> (not res!916236) (not e!777742))))

(declare-fun noDuplicate!2575 (List!32036) Bool)

(assert (=> b!1372964 (= res!916236 (noDuplicate!2575 acc!866))))

(declare-fun b!1372965 () Bool)

(declare-fun res!916235 () Bool)

(assert (=> b!1372965 (=> (not res!916235) (not e!777742))))

(declare-fun newAcc!98 () List!32036)

(assert (=> b!1372965 (= res!916235 (not (contains!9718 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372966 () Bool)

(declare-fun res!916232 () Bool)

(assert (=> b!1372966 (=> (not res!916232) (not e!777742))))

(assert (=> b!1372966 (= res!916232 (not (contains!9718 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372967 () Bool)

(assert (=> b!1372967 (= e!777742 false)))

(declare-datatypes ((array!93115 0))(
  ( (array!93116 (arr!44968 (Array (_ BitVec 32) (_ BitVec 64))) (size!45518 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93115)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602989 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93115 (_ BitVec 32) List!32036) Bool)

(assert (=> b!1372967 (= lt!602989 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45373 0))(
  ( (Unit!45374) )
))
(declare-fun lt!602988 () Unit!45373)

(declare-fun noDuplicateSubseq!307 (List!32036 List!32036) Unit!45373)

(assert (=> b!1372967 (= lt!602988 (noDuplicateSubseq!307 newAcc!98 acc!866))))

(declare-fun res!916234 () Bool)

(assert (=> start!116298 (=> (not res!916234) (not e!777742))))

(assert (=> start!116298 (= res!916234 (and (bvslt (size!45518 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45518 a!3861))))))

(assert (=> start!116298 e!777742))

(declare-fun array_inv!33996 (array!93115) Bool)

(assert (=> start!116298 (array_inv!33996 a!3861)))

(assert (=> start!116298 true))

(declare-fun b!1372968 () Bool)

(declare-fun res!916231 () Bool)

(assert (=> b!1372968 (=> (not res!916231) (not e!777742))))

(assert (=> b!1372968 (= res!916231 (not (contains!9718 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372969 () Bool)

(declare-fun res!916233 () Bool)

(assert (=> b!1372969 (=> (not res!916233) (not e!777742))))

(declare-fun subseq!1120 (List!32036 List!32036) Bool)

(assert (=> b!1372969 (= res!916233 (subseq!1120 newAcc!98 acc!866))))

(assert (= (and start!116298 res!916234) b!1372964))

(assert (= (and b!1372964 res!916236) b!1372966))

(assert (= (and b!1372966 res!916232) b!1372963))

(assert (= (and b!1372963 res!916237) b!1372965))

(assert (= (and b!1372965 res!916235) b!1372968))

(assert (= (and b!1372968 res!916231) b!1372969))

(assert (= (and b!1372969 res!916233) b!1372967))

(declare-fun m!1256323 () Bool)

(assert (=> b!1372966 m!1256323))

(declare-fun m!1256325 () Bool)

(assert (=> b!1372967 m!1256325))

(declare-fun m!1256327 () Bool)

(assert (=> b!1372967 m!1256327))

(declare-fun m!1256329 () Bool)

(assert (=> b!1372963 m!1256329))

(declare-fun m!1256331 () Bool)

(assert (=> b!1372964 m!1256331))

(declare-fun m!1256333 () Bool)

(assert (=> start!116298 m!1256333))

(declare-fun m!1256335 () Bool)

(assert (=> b!1372968 m!1256335))

(declare-fun m!1256337 () Bool)

(assert (=> b!1372969 m!1256337))

(declare-fun m!1256339 () Bool)

(assert (=> b!1372965 m!1256339))

(push 1)

(assert (not b!1372963))

(assert (not b!1372967))

(assert (not b!1372969))

(assert (not b!1372968))

(assert (not b!1372964))

(assert (not start!116298))

(assert (not b!1372966))

(assert (not b!1372965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

