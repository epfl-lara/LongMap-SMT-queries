; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115720 () Bool)

(assert start!115720)

(declare-fun b!1368411 () Bool)

(declare-fun res!911926 () Bool)

(declare-fun e!775325 () Bool)

(assert (=> b!1368411 (=> (not res!911926) (not e!775325))))

(declare-datatypes ((List!31948 0))(
  ( (Nil!31945) (Cons!31944 (h!33153 (_ BitVec 64)) (t!46642 List!31948)) )
))
(declare-fun newAcc!98 () List!31948)

(declare-fun acc!866 () List!31948)

(declare-fun subseq!1032 (List!31948 List!31948) Bool)

(assert (=> b!1368411 (= res!911926 (subseq!1032 newAcc!98 acc!866))))

(declare-fun b!1368412 () Bool)

(declare-fun res!911922 () Bool)

(declare-fun e!775327 () Bool)

(assert (=> b!1368412 (=> (not res!911922) (not e!775327))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92912 0))(
  ( (array!92913 (arr!44880 (Array (_ BitVec 32) (_ BitVec 64))) (size!45430 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92912)

(assert (=> b!1368412 (= res!911922 (bvslt from!3239 (size!45430 a!3861)))))

(declare-fun b!1368413 () Bool)

(declare-fun res!911923 () Bool)

(assert (=> b!1368413 (=> (not res!911923) (not e!775325))))

(declare-fun contains!9630 (List!31948 (_ BitVec 64)) Bool)

(assert (=> b!1368413 (= res!911923 (not (contains!9630 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368414 () Bool)

(declare-fun res!911929 () Bool)

(assert (=> b!1368414 (=> (not res!911929) (not e!775325))))

(declare-fun noDuplicate!2487 (List!31948) Bool)

(assert (=> b!1368414 (= res!911929 (noDuplicate!2487 acc!866))))

(declare-fun b!1368415 () Bool)

(declare-fun res!911928 () Bool)

(assert (=> b!1368415 (=> (not res!911928) (not e!775325))))

(assert (=> b!1368415 (= res!911928 (not (contains!9630 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!911925 () Bool)

(assert (=> start!115720 (=> (not res!911925) (not e!775325))))

(assert (=> start!115720 (= res!911925 (and (bvslt (size!45430 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45430 a!3861))))))

(assert (=> start!115720 e!775325))

(declare-fun array_inv!33908 (array!92912) Bool)

(assert (=> start!115720 (array_inv!33908 a!3861)))

(assert (=> start!115720 true))

(declare-fun b!1368416 () Bool)

(declare-fun res!911927 () Bool)

(assert (=> b!1368416 (=> (not res!911927) (not e!775327))))

(assert (=> b!1368416 (= res!911927 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368417 () Bool)

(assert (=> b!1368417 (= e!775325 e!775327)))

(declare-fun res!911920 () Bool)

(assert (=> b!1368417 (=> (not res!911920) (not e!775327))))

(declare-fun arrayNoDuplicates!0 (array!92912 (_ BitVec 32) List!31948) Bool)

(assert (=> b!1368417 (= res!911920 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45197 0))(
  ( (Unit!45198) )
))
(declare-fun lt!602061 () Unit!45197)

(declare-fun noDuplicateSubseq!219 (List!31948 List!31948) Unit!45197)

(assert (=> b!1368417 (= lt!602061 (noDuplicateSubseq!219 newAcc!98 acc!866))))

(declare-fun b!1368418 () Bool)

(assert (=> b!1368418 (= e!775327 false)))

(declare-fun lt!602062 () Bool)

(assert (=> b!1368418 (= lt!602062 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368419 () Bool)

(declare-fun res!911919 () Bool)

(assert (=> b!1368419 (=> (not res!911919) (not e!775325))))

(assert (=> b!1368419 (= res!911919 (not (contains!9630 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368420 () Bool)

(declare-fun res!911921 () Bool)

(assert (=> b!1368420 (=> (not res!911921) (not e!775327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368420 (= res!911921 (not (validKeyInArray!0 (select (arr!44880 a!3861) from!3239))))))

(declare-fun b!1368421 () Bool)

(declare-fun res!911924 () Bool)

(assert (=> b!1368421 (=> (not res!911924) (not e!775325))))

(assert (=> b!1368421 (= res!911924 (not (contains!9630 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115720 res!911925) b!1368414))

(assert (= (and b!1368414 res!911929) b!1368421))

(assert (= (and b!1368421 res!911924) b!1368415))

(assert (= (and b!1368415 res!911928) b!1368419))

(assert (= (and b!1368419 res!911919) b!1368413))

(assert (= (and b!1368413 res!911923) b!1368411))

(assert (= (and b!1368411 res!911926) b!1368417))

(assert (= (and b!1368417 res!911920) b!1368412))

(assert (= (and b!1368412 res!911922) b!1368420))

(assert (= (and b!1368420 res!911921) b!1368416))

(assert (= (and b!1368416 res!911927) b!1368418))

(declare-fun m!1252387 () Bool)

(assert (=> b!1368414 m!1252387))

(declare-fun m!1252389 () Bool)

(assert (=> b!1368411 m!1252389))

(declare-fun m!1252391 () Bool)

(assert (=> b!1368421 m!1252391))

(declare-fun m!1252393 () Bool)

(assert (=> b!1368419 m!1252393))

(declare-fun m!1252395 () Bool)

(assert (=> b!1368418 m!1252395))

(declare-fun m!1252397 () Bool)

(assert (=> b!1368415 m!1252397))

(declare-fun m!1252399 () Bool)

(assert (=> b!1368413 m!1252399))

(declare-fun m!1252401 () Bool)

(assert (=> b!1368420 m!1252401))

(assert (=> b!1368420 m!1252401))

(declare-fun m!1252403 () Bool)

(assert (=> b!1368420 m!1252403))

(declare-fun m!1252405 () Bool)

(assert (=> start!115720 m!1252405))

(declare-fun m!1252407 () Bool)

(assert (=> b!1368417 m!1252407))

(declare-fun m!1252409 () Bool)

(assert (=> b!1368417 m!1252409))

(check-sat (not b!1368421) (not b!1368419) (not b!1368417) (not start!115720) (not b!1368415) (not b!1368418) (not b!1368420) (not b!1368414) (not b!1368413) (not b!1368411))
(check-sat)
