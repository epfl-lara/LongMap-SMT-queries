; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115672 () Bool)

(assert start!115672)

(declare-fun b!1367712 () Bool)

(declare-fun res!911272 () Bool)

(declare-fun e!775120 () Bool)

(assert (=> b!1367712 (=> (not res!911272) (not e!775120))))

(declare-datatypes ((List!31982 0))(
  ( (Nil!31979) (Cons!31978 (h!33187 (_ BitVec 64)) (t!46668 List!31982)) )
))
(declare-fun acc!866 () List!31982)

(declare-fun contains!9575 (List!31982 (_ BitVec 64)) Bool)

(assert (=> b!1367712 (= res!911272 (not (contains!9575 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367713 () Bool)

(declare-fun res!911273 () Bool)

(declare-fun e!775121 () Bool)

(assert (=> b!1367713 (=> (not res!911273) (not e!775121))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92823 0))(
  ( (array!92824 (arr!44836 (Array (_ BitVec 32) (_ BitVec 64))) (size!45388 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92823)

(assert (=> b!1367713 (= res!911273 (bvslt from!3239 (size!45388 a!3861)))))

(declare-fun b!1367714 () Bool)

(declare-fun res!911269 () Bool)

(assert (=> b!1367714 (=> (not res!911269) (not e!775121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367714 (= res!911269 (not (validKeyInArray!0 (select (arr!44836 a!3861) from!3239))))))

(declare-fun res!911271 () Bool)

(assert (=> start!115672 (=> (not res!911271) (not e!775120))))

(assert (=> start!115672 (= res!911271 (and (bvslt (size!45388 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45388 a!3861))))))

(assert (=> start!115672 e!775120))

(declare-fun array_inv!34069 (array!92823) Bool)

(assert (=> start!115672 (array_inv!34069 a!3861)))

(assert (=> start!115672 true))

(declare-fun b!1367715 () Bool)

(declare-fun res!911270 () Bool)

(assert (=> b!1367715 (=> (not res!911270) (not e!775120))))

(declare-fun noDuplicate!2490 (List!31982) Bool)

(assert (=> b!1367715 (= res!911270 (noDuplicate!2490 acc!866))))

(declare-fun b!1367716 () Bool)

(declare-fun res!911264 () Bool)

(assert (=> b!1367716 (=> (not res!911264) (not e!775120))))

(declare-fun newAcc!98 () List!31982)

(declare-fun subseq!1013 (List!31982 List!31982) Bool)

(assert (=> b!1367716 (= res!911264 (subseq!1013 newAcc!98 acc!866))))

(declare-fun b!1367717 () Bool)

(declare-fun res!911263 () Bool)

(assert (=> b!1367717 (=> (not res!911263) (not e!775121))))

(assert (=> b!1367717 (= res!911263 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1367718 () Bool)

(assert (=> b!1367718 (= e!775121 false)))

(declare-fun lt!601761 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92823 (_ BitVec 32) List!31982) Bool)

(assert (=> b!1367718 (= lt!601761 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367719 () Bool)

(declare-fun res!911267 () Bool)

(assert (=> b!1367719 (=> (not res!911267) (not e!775120))))

(assert (=> b!1367719 (= res!911267 (not (contains!9575 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367720 () Bool)

(declare-fun res!911268 () Bool)

(assert (=> b!1367720 (=> (not res!911268) (not e!775120))))

(assert (=> b!1367720 (= res!911268 (not (contains!9575 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367721 () Bool)

(declare-fun res!911266 () Bool)

(assert (=> b!1367721 (=> (not res!911266) (not e!775120))))

(assert (=> b!1367721 (= res!911266 (not (contains!9575 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367722 () Bool)

(assert (=> b!1367722 (= e!775120 e!775121)))

(declare-fun res!911265 () Bool)

(assert (=> b!1367722 (=> (not res!911265) (not e!775121))))

(assert (=> b!1367722 (= res!911265 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45000 0))(
  ( (Unit!45001) )
))
(declare-fun lt!601760 () Unit!45000)

(declare-fun noDuplicateSubseq!200 (List!31982 List!31982) Unit!45000)

(assert (=> b!1367722 (= lt!601760 (noDuplicateSubseq!200 newAcc!98 acc!866))))

(assert (= (and start!115672 res!911271) b!1367715))

(assert (= (and b!1367715 res!911270) b!1367712))

(assert (= (and b!1367712 res!911272) b!1367721))

(assert (= (and b!1367721 res!911266) b!1367719))

(assert (= (and b!1367719 res!911267) b!1367720))

(assert (= (and b!1367720 res!911268) b!1367716))

(assert (= (and b!1367716 res!911264) b!1367722))

(assert (= (and b!1367722 res!911265) b!1367713))

(assert (= (and b!1367713 res!911273) b!1367714))

(assert (= (and b!1367714 res!911269) b!1367717))

(assert (= (and b!1367717 res!911263) b!1367718))

(declare-fun m!1251405 () Bool)

(assert (=> b!1367722 m!1251405))

(declare-fun m!1251407 () Bool)

(assert (=> b!1367722 m!1251407))

(declare-fun m!1251409 () Bool)

(assert (=> b!1367718 m!1251409))

(declare-fun m!1251411 () Bool)

(assert (=> b!1367714 m!1251411))

(assert (=> b!1367714 m!1251411))

(declare-fun m!1251413 () Bool)

(assert (=> b!1367714 m!1251413))

(declare-fun m!1251415 () Bool)

(assert (=> b!1367719 m!1251415))

(declare-fun m!1251417 () Bool)

(assert (=> b!1367712 m!1251417))

(declare-fun m!1251419 () Bool)

(assert (=> b!1367716 m!1251419))

(declare-fun m!1251421 () Bool)

(assert (=> b!1367721 m!1251421))

(declare-fun m!1251423 () Bool)

(assert (=> b!1367720 m!1251423))

(declare-fun m!1251425 () Bool)

(assert (=> b!1367715 m!1251425))

(declare-fun m!1251427 () Bool)

(assert (=> start!115672 m!1251427))

(check-sat (not b!1367722) (not b!1367719) (not b!1367714) (not b!1367720) (not start!115672) (not b!1367712) (not b!1367715) (not b!1367718) (not b!1367721) (not b!1367716))
(check-sat)
