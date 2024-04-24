; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116498 () Bool)

(assert start!116498)

(declare-fun b!1374010 () Bool)

(declare-fun res!916497 () Bool)

(declare-fun e!778512 () Bool)

(assert (=> b!1374010 (=> (not res!916497) (not e!778512))))

(declare-datatypes ((List!32064 0))(
  ( (Nil!32061) (Cons!32060 (h!33278 (_ BitVec 64)) (t!46750 List!32064)) )
))
(declare-fun acc!866 () List!32064)

(declare-fun contains!9749 (List!32064 (_ BitVec 64)) Bool)

(assert (=> b!1374010 (= res!916497 (not (contains!9749 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374011 () Bool)

(declare-fun res!916501 () Bool)

(assert (=> b!1374011 (=> (not res!916501) (not e!778512))))

(assert (=> b!1374011 (= res!916501 (not (contains!9749 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374012 () Bool)

(declare-fun res!916499 () Bool)

(assert (=> b!1374012 (=> (not res!916499) (not e!778512))))

(declare-fun newAcc!98 () List!32064)

(declare-fun subseq!1108 (List!32064 List!32064) Bool)

(assert (=> b!1374012 (= res!916499 (subseq!1108 newAcc!98 acc!866))))

(declare-fun b!1374013 () Bool)

(assert (=> b!1374013 (= e!778512 false)))

(declare-datatypes ((array!93206 0))(
  ( (array!93207 (arr!45009 (Array (_ BitVec 32) (_ BitVec 64))) (size!45560 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93206)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!603392 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93206 (_ BitVec 32) List!32064) Bool)

(assert (=> b!1374013 (= lt!603392 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45288 0))(
  ( (Unit!45289) )
))
(declare-fun lt!603393 () Unit!45288)

(declare-fun noDuplicateSubseq!295 (List!32064 List!32064) Unit!45288)

(assert (=> b!1374013 (= lt!603393 (noDuplicateSubseq!295 newAcc!98 acc!866))))

(declare-fun res!916503 () Bool)

(assert (=> start!116498 (=> (not res!916503) (not e!778512))))

(assert (=> start!116498 (= res!916503 (and (bvslt (size!45560 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45560 a!3861))))))

(assert (=> start!116498 e!778512))

(declare-fun array_inv!34290 (array!93206) Bool)

(assert (=> start!116498 (array_inv!34290 a!3861)))

(assert (=> start!116498 true))

(declare-fun b!1374014 () Bool)

(declare-fun res!916500 () Bool)

(assert (=> b!1374014 (=> (not res!916500) (not e!778512))))

(declare-fun noDuplicate!2580 (List!32064) Bool)

(assert (=> b!1374014 (= res!916500 (noDuplicate!2580 acc!866))))

(declare-fun b!1374015 () Bool)

(declare-fun res!916498 () Bool)

(assert (=> b!1374015 (=> (not res!916498) (not e!778512))))

(assert (=> b!1374015 (= res!916498 (not (contains!9749 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374016 () Bool)

(declare-fun res!916502 () Bool)

(assert (=> b!1374016 (=> (not res!916502) (not e!778512))))

(assert (=> b!1374016 (= res!916502 (not (contains!9749 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116498 res!916503) b!1374014))

(assert (= (and b!1374014 res!916500) b!1374010))

(assert (= (and b!1374010 res!916497) b!1374011))

(assert (= (and b!1374011 res!916501) b!1374015))

(assert (= (and b!1374015 res!916498) b!1374016))

(assert (= (and b!1374016 res!916502) b!1374012))

(assert (= (and b!1374012 res!916499) b!1374013))

(declare-fun m!1257703 () Bool)

(assert (=> b!1374013 m!1257703))

(declare-fun m!1257705 () Bool)

(assert (=> b!1374013 m!1257705))

(declare-fun m!1257707 () Bool)

(assert (=> b!1374016 m!1257707))

(declare-fun m!1257709 () Bool)

(assert (=> b!1374014 m!1257709))

(declare-fun m!1257711 () Bool)

(assert (=> b!1374012 m!1257711))

(declare-fun m!1257713 () Bool)

(assert (=> b!1374011 m!1257713))

(declare-fun m!1257715 () Bool)

(assert (=> b!1374010 m!1257715))

(declare-fun m!1257717 () Bool)

(assert (=> start!116498 m!1257717))

(declare-fun m!1257719 () Bool)

(assert (=> b!1374015 m!1257719))

(push 1)

(assert (not b!1374011))

(assert (not b!1374010))

(assert (not b!1374013))

(assert (not b!1374012))

(assert (not start!116498))

(assert (not b!1374015))

(assert (not b!1374014))

(assert (not b!1374016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

