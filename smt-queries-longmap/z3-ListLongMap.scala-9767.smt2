; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115714 () Bool)

(assert start!115714)

(declare-fun b!1368405 () Bool)

(declare-fun res!911964 () Bool)

(declare-fun e!775309 () Bool)

(assert (=> b!1368405 (=> (not res!911964) (not e!775309))))

(declare-datatypes ((List!32003 0))(
  ( (Nil!32000) (Cons!31999 (h!33208 (_ BitVec 64)) (t!46689 List!32003)) )
))
(declare-fun newAcc!98 () List!32003)

(declare-fun contains!9596 (List!32003 (_ BitVec 64)) Bool)

(assert (=> b!1368405 (= res!911964 (not (contains!9596 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368406 () Bool)

(declare-fun res!911961 () Bool)

(assert (=> b!1368406 (=> (not res!911961) (not e!775309))))

(declare-fun acc!866 () List!32003)

(assert (=> b!1368406 (= res!911961 (not (contains!9596 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368407 () Bool)

(declare-fun e!775310 () Bool)

(assert (=> b!1368407 (= e!775309 e!775310)))

(declare-fun res!911958 () Bool)

(assert (=> b!1368407 (=> (not res!911958) (not e!775310))))

(declare-datatypes ((array!92865 0))(
  ( (array!92866 (arr!44857 (Array (_ BitVec 32) (_ BitVec 64))) (size!45409 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92865)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92865 (_ BitVec 32) List!32003) Bool)

(assert (=> b!1368407 (= res!911958 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45042 0))(
  ( (Unit!45043) )
))
(declare-fun lt!601886 () Unit!45042)

(declare-fun noDuplicateSubseq!221 (List!32003 List!32003) Unit!45042)

(assert (=> b!1368407 (= lt!601886 (noDuplicateSubseq!221 newAcc!98 acc!866))))

(declare-fun res!911957 () Bool)

(assert (=> start!115714 (=> (not res!911957) (not e!775309))))

(assert (=> start!115714 (= res!911957 (and (bvslt (size!45409 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45409 a!3861))))))

(assert (=> start!115714 e!775309))

(declare-fun array_inv!34090 (array!92865) Bool)

(assert (=> start!115714 (array_inv!34090 a!3861)))

(assert (=> start!115714 true))

(declare-fun b!1368408 () Bool)

(assert (=> b!1368408 (= e!775310 false)))

(declare-fun lt!601887 () Bool)

(assert (=> b!1368408 (= lt!601887 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368409 () Bool)

(declare-fun res!911962 () Bool)

(assert (=> b!1368409 (=> (not res!911962) (not e!775309))))

(assert (=> b!1368409 (= res!911962 (not (contains!9596 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368410 () Bool)

(declare-fun res!911963 () Bool)

(assert (=> b!1368410 (=> (not res!911963) (not e!775309))))

(assert (=> b!1368410 (= res!911963 (not (contains!9596 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368411 () Bool)

(declare-fun res!911966 () Bool)

(assert (=> b!1368411 (=> (not res!911966) (not e!775310))))

(assert (=> b!1368411 (= res!911966 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368412 () Bool)

(declare-fun res!911960 () Bool)

(assert (=> b!1368412 (=> (not res!911960) (not e!775310))))

(assert (=> b!1368412 (= res!911960 (bvslt from!3239 (size!45409 a!3861)))))

(declare-fun b!1368413 () Bool)

(declare-fun res!911956 () Bool)

(assert (=> b!1368413 (=> (not res!911956) (not e!775310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368413 (= res!911956 (not (validKeyInArray!0 (select (arr!44857 a!3861) from!3239))))))

(declare-fun b!1368414 () Bool)

(declare-fun res!911965 () Bool)

(assert (=> b!1368414 (=> (not res!911965) (not e!775309))))

(declare-fun noDuplicate!2511 (List!32003) Bool)

(assert (=> b!1368414 (= res!911965 (noDuplicate!2511 acc!866))))

(declare-fun b!1368415 () Bool)

(declare-fun res!911959 () Bool)

(assert (=> b!1368415 (=> (not res!911959) (not e!775309))))

(declare-fun subseq!1034 (List!32003 List!32003) Bool)

(assert (=> b!1368415 (= res!911959 (subseq!1034 newAcc!98 acc!866))))

(assert (= (and start!115714 res!911957) b!1368414))

(assert (= (and b!1368414 res!911965) b!1368409))

(assert (= (and b!1368409 res!911962) b!1368406))

(assert (= (and b!1368406 res!911961) b!1368410))

(assert (= (and b!1368410 res!911963) b!1368405))

(assert (= (and b!1368405 res!911964) b!1368415))

(assert (= (and b!1368415 res!911959) b!1368407))

(assert (= (and b!1368407 res!911958) b!1368412))

(assert (= (and b!1368412 res!911960) b!1368413))

(assert (= (and b!1368413 res!911956) b!1368411))

(assert (= (and b!1368411 res!911966) b!1368408))

(declare-fun m!1251909 () Bool)

(assert (=> b!1368408 m!1251909))

(declare-fun m!1251911 () Bool)

(assert (=> b!1368414 m!1251911))

(declare-fun m!1251913 () Bool)

(assert (=> start!115714 m!1251913))

(declare-fun m!1251915 () Bool)

(assert (=> b!1368410 m!1251915))

(declare-fun m!1251917 () Bool)

(assert (=> b!1368407 m!1251917))

(declare-fun m!1251919 () Bool)

(assert (=> b!1368407 m!1251919))

(declare-fun m!1251921 () Bool)

(assert (=> b!1368413 m!1251921))

(assert (=> b!1368413 m!1251921))

(declare-fun m!1251923 () Bool)

(assert (=> b!1368413 m!1251923))

(declare-fun m!1251925 () Bool)

(assert (=> b!1368406 m!1251925))

(declare-fun m!1251927 () Bool)

(assert (=> b!1368409 m!1251927))

(declare-fun m!1251929 () Bool)

(assert (=> b!1368415 m!1251929))

(declare-fun m!1251931 () Bool)

(assert (=> b!1368405 m!1251931))

(check-sat (not b!1368405) (not b!1368408) (not start!115714) (not b!1368410) (not b!1368414) (not b!1368406) (not b!1368413) (not b!1368409) (not b!1368407) (not b!1368415))
(check-sat)
