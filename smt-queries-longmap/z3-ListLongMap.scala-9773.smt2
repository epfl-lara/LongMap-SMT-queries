; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115810 () Bool)

(assert start!115810)

(declare-fun b!1369264 () Bool)

(declare-fun res!912742 () Bool)

(declare-fun e!775665 () Bool)

(assert (=> b!1369264 (=> (not res!912742) (not e!775665))))

(declare-datatypes ((List!31969 0))(
  ( (Nil!31966) (Cons!31965 (h!33174 (_ BitVec 64)) (t!46663 List!31969)) )
))
(declare-fun newAcc!98 () List!31969)

(declare-fun acc!866 () List!31969)

(declare-fun subseq!1053 (List!31969 List!31969) Bool)

(assert (=> b!1369264 (= res!912742 (subseq!1053 newAcc!98 acc!866))))

(declare-fun res!912745 () Bool)

(assert (=> start!115810 (=> (not res!912745) (not e!775665))))

(declare-datatypes ((array!92957 0))(
  ( (array!92958 (arr!44901 (Array (_ BitVec 32) (_ BitVec 64))) (size!45451 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92957)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115810 (= res!912745 (and (bvslt (size!45451 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45451 a!3861))))))

(assert (=> start!115810 e!775665))

(declare-fun array_inv!33929 (array!92957) Bool)

(assert (=> start!115810 (array_inv!33929 a!3861)))

(assert (=> start!115810 true))

(declare-fun b!1369265 () Bool)

(declare-fun res!912746 () Bool)

(assert (=> b!1369265 (=> (not res!912746) (not e!775665))))

(declare-fun contains!9651 (List!31969 (_ BitVec 64)) Bool)

(assert (=> b!1369265 (= res!912746 (not (contains!9651 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369266 () Bool)

(declare-fun res!912748 () Bool)

(assert (=> b!1369266 (=> (not res!912748) (not e!775665))))

(declare-fun noDuplicate!2508 (List!31969) Bool)

(assert (=> b!1369266 (= res!912748 (noDuplicate!2508 acc!866))))

(declare-fun b!1369267 () Bool)

(assert (=> b!1369267 (= e!775665 false)))

(declare-fun lt!602233 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92957 (_ BitVec 32) List!31969) Bool)

(assert (=> b!1369267 (= lt!602233 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45239 0))(
  ( (Unit!45240) )
))
(declare-fun lt!602232 () Unit!45239)

(declare-fun noDuplicateSubseq!240 (List!31969 List!31969) Unit!45239)

(assert (=> b!1369267 (= lt!602232 (noDuplicateSubseq!240 newAcc!98 acc!866))))

(declare-fun b!1369268 () Bool)

(declare-fun res!912747 () Bool)

(assert (=> b!1369268 (=> (not res!912747) (not e!775665))))

(assert (=> b!1369268 (= res!912747 (not (contains!9651 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369269 () Bool)

(declare-fun res!912744 () Bool)

(assert (=> b!1369269 (=> (not res!912744) (not e!775665))))

(assert (=> b!1369269 (= res!912744 (not (contains!9651 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369270 () Bool)

(declare-fun res!912743 () Bool)

(assert (=> b!1369270 (=> (not res!912743) (not e!775665))))

(assert (=> b!1369270 (= res!912743 (not (contains!9651 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115810 res!912745) b!1369266))

(assert (= (and b!1369266 res!912748) b!1369268))

(assert (= (and b!1369268 res!912747) b!1369265))

(assert (= (and b!1369265 res!912746) b!1369270))

(assert (= (and b!1369270 res!912743) b!1369269))

(assert (= (and b!1369269 res!912744) b!1369264))

(assert (= (and b!1369264 res!912742) b!1369267))

(declare-fun m!1253083 () Bool)

(assert (=> b!1369265 m!1253083))

(declare-fun m!1253085 () Bool)

(assert (=> start!115810 m!1253085))

(declare-fun m!1253087 () Bool)

(assert (=> b!1369266 m!1253087))

(declare-fun m!1253089 () Bool)

(assert (=> b!1369264 m!1253089))

(declare-fun m!1253091 () Bool)

(assert (=> b!1369269 m!1253091))

(declare-fun m!1253093 () Bool)

(assert (=> b!1369267 m!1253093))

(declare-fun m!1253095 () Bool)

(assert (=> b!1369267 m!1253095))

(declare-fun m!1253097 () Bool)

(assert (=> b!1369270 m!1253097))

(declare-fun m!1253099 () Bool)

(assert (=> b!1369268 m!1253099))

(check-sat (not start!115810) (not b!1369265) (not b!1369264) (not b!1369270) (not b!1369268) (not b!1369269) (not b!1369266) (not b!1369267))
(check-sat)
