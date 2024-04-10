; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115690 () Bool)

(assert start!115690)

(declare-fun b!1367916 () Bool)

(declare-fun res!911424 () Bool)

(declare-fun e!775190 () Bool)

(assert (=> b!1367916 (=> (not res!911424) (not e!775190))))

(declare-datatypes ((List!31933 0))(
  ( (Nil!31930) (Cons!31929 (h!33138 (_ BitVec 64)) (t!46627 List!31933)) )
))
(declare-fun newAcc!98 () List!31933)

(declare-fun contains!9615 (List!31933 (_ BitVec 64)) Bool)

(assert (=> b!1367916 (= res!911424 (not (contains!9615 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367917 () Bool)

(declare-fun e!775191 () Bool)

(assert (=> b!1367917 (= e!775190 e!775191)))

(declare-fun res!911428 () Bool)

(assert (=> b!1367917 (=> (not res!911428) (not e!775191))))

(declare-datatypes ((array!92882 0))(
  ( (array!92883 (arr!44865 (Array (_ BitVec 32) (_ BitVec 64))) (size!45415 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92882)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun acc!866 () List!31933)

(declare-fun arrayNoDuplicates!0 (array!92882 (_ BitVec 32) List!31933) Bool)

(assert (=> b!1367917 (= res!911428 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45167 0))(
  ( (Unit!45168) )
))
(declare-fun lt!601972 () Unit!45167)

(declare-fun noDuplicateSubseq!204 (List!31933 List!31933) Unit!45167)

(assert (=> b!1367917 (= lt!601972 (noDuplicateSubseq!204 newAcc!98 acc!866))))

(declare-fun b!1367918 () Bool)

(declare-fun res!911427 () Bool)

(assert (=> b!1367918 (=> (not res!911427) (not e!775190))))

(assert (=> b!1367918 (= res!911427 (not (contains!9615 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367919 () Bool)

(declare-fun res!911432 () Bool)

(assert (=> b!1367919 (=> (not res!911432) (not e!775190))))

(declare-fun noDuplicate!2472 (List!31933) Bool)

(assert (=> b!1367919 (= res!911432 (noDuplicate!2472 acc!866))))

(declare-fun b!1367920 () Bool)

(declare-fun res!911425 () Bool)

(assert (=> b!1367920 (=> (not res!911425) (not e!775190))))

(assert (=> b!1367920 (= res!911425 (not (contains!9615 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367921 () Bool)

(declare-fun res!911430 () Bool)

(assert (=> b!1367921 (=> (not res!911430) (not e!775191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367921 (= res!911430 (not (validKeyInArray!0 (select (arr!44865 a!3861) from!3239))))))

(declare-fun b!1367922 () Bool)

(declare-fun res!911429 () Bool)

(assert (=> b!1367922 (=> (not res!911429) (not e!775191))))

(assert (=> b!1367922 (= res!911429 (bvslt from!3239 (size!45415 a!3861)))))

(declare-fun b!1367923 () Bool)

(assert (=> b!1367923 (= e!775191 false)))

(declare-fun lt!601971 () Bool)

(assert (=> b!1367923 (= lt!601971 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367924 () Bool)

(declare-fun res!911431 () Bool)

(assert (=> b!1367924 (=> (not res!911431) (not e!775190))))

(assert (=> b!1367924 (= res!911431 (not (contains!9615 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367925 () Bool)

(declare-fun res!911426 () Bool)

(assert (=> b!1367925 (=> (not res!911426) (not e!775191))))

(assert (=> b!1367925 (= res!911426 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun res!911434 () Bool)

(assert (=> start!115690 (=> (not res!911434) (not e!775190))))

(assert (=> start!115690 (= res!911434 (and (bvslt (size!45415 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45415 a!3861))))))

(assert (=> start!115690 e!775190))

(declare-fun array_inv!33893 (array!92882) Bool)

(assert (=> start!115690 (array_inv!33893 a!3861)))

(assert (=> start!115690 true))

(declare-fun b!1367926 () Bool)

(declare-fun res!911433 () Bool)

(assert (=> b!1367926 (=> (not res!911433) (not e!775190))))

(declare-fun subseq!1017 (List!31933 List!31933) Bool)

(assert (=> b!1367926 (= res!911433 (subseq!1017 newAcc!98 acc!866))))

(assert (= (and start!115690 res!911434) b!1367919))

(assert (= (and b!1367919 res!911432) b!1367918))

(assert (= (and b!1367918 res!911427) b!1367920))

(assert (= (and b!1367920 res!911425) b!1367916))

(assert (= (and b!1367916 res!911424) b!1367924))

(assert (= (and b!1367924 res!911431) b!1367926))

(assert (= (and b!1367926 res!911433) b!1367917))

(assert (= (and b!1367917 res!911428) b!1367922))

(assert (= (and b!1367922 res!911429) b!1367921))

(assert (= (and b!1367921 res!911430) b!1367925))

(assert (= (and b!1367925 res!911426) b!1367923))

(declare-fun m!1252027 () Bool)

(assert (=> b!1367924 m!1252027))

(declare-fun m!1252029 () Bool)

(assert (=> b!1367926 m!1252029))

(declare-fun m!1252031 () Bool)

(assert (=> start!115690 m!1252031))

(declare-fun m!1252033 () Bool)

(assert (=> b!1367921 m!1252033))

(assert (=> b!1367921 m!1252033))

(declare-fun m!1252035 () Bool)

(assert (=> b!1367921 m!1252035))

(declare-fun m!1252037 () Bool)

(assert (=> b!1367923 m!1252037))

(declare-fun m!1252039 () Bool)

(assert (=> b!1367918 m!1252039))

(declare-fun m!1252041 () Bool)

(assert (=> b!1367920 m!1252041))

(declare-fun m!1252043 () Bool)

(assert (=> b!1367916 m!1252043))

(declare-fun m!1252045 () Bool)

(assert (=> b!1367919 m!1252045))

(declare-fun m!1252047 () Bool)

(assert (=> b!1367917 m!1252047))

(declare-fun m!1252049 () Bool)

(assert (=> b!1367917 m!1252049))

(check-sat (not b!1367924) (not b!1367916) (not b!1367919) (not b!1367923) (not b!1367920) (not b!1367918) (not b!1367926) (not b!1367921) (not start!115690) (not b!1367917))
(check-sat)
