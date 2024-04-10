; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116272 () Bool)

(assert start!116272)

(declare-fun b!1372690 () Bool)

(declare-fun res!915958 () Bool)

(declare-fun e!777663 () Bool)

(assert (=> b!1372690 (=> (not res!915958) (not e!777663))))

(declare-datatypes ((List!32023 0))(
  ( (Nil!32020) (Cons!32019 (h!33228 (_ BitVec 64)) (t!46717 List!32023)) )
))
(declare-fun acc!866 () List!32023)

(declare-fun noDuplicate!2562 (List!32023) Bool)

(assert (=> b!1372690 (= res!915958 (noDuplicate!2562 acc!866))))

(declare-fun b!1372691 () Bool)

(declare-fun res!915959 () Bool)

(assert (=> b!1372691 (=> (not res!915959) (not e!777663))))

(declare-fun newAcc!98 () List!32023)

(declare-fun subseq!1107 (List!32023 List!32023) Bool)

(assert (=> b!1372691 (= res!915959 (subseq!1107 newAcc!98 acc!866))))

(declare-fun b!1372692 () Bool)

(declare-fun res!915962 () Bool)

(assert (=> b!1372692 (=> (not res!915962) (not e!777663))))

(declare-fun contains!9705 (List!32023 (_ BitVec 64)) Bool)

(assert (=> b!1372692 (= res!915962 (not (contains!9705 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372693 () Bool)

(declare-fun res!915960 () Bool)

(assert (=> b!1372693 (=> (not res!915960) (not e!777663))))

(assert (=> b!1372693 (= res!915960 (not (contains!9705 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372694 () Bool)

(assert (=> b!1372694 (= e!777663 false)))

(declare-datatypes ((array!93089 0))(
  ( (array!93090 (arr!44955 (Array (_ BitVec 32) (_ BitVec 64))) (size!45505 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93089)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602911 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93089 (_ BitVec 32) List!32023) Bool)

(assert (=> b!1372694 (= lt!602911 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45347 0))(
  ( (Unit!45348) )
))
(declare-fun lt!602910 () Unit!45347)

(declare-fun noDuplicateSubseq!294 (List!32023 List!32023) Unit!45347)

(assert (=> b!1372694 (= lt!602910 (noDuplicateSubseq!294 newAcc!98 acc!866))))

(declare-fun b!1372695 () Bool)

(declare-fun res!915964 () Bool)

(assert (=> b!1372695 (=> (not res!915964) (not e!777663))))

(assert (=> b!1372695 (= res!915964 (not (contains!9705 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915961 () Bool)

(assert (=> start!116272 (=> (not res!915961) (not e!777663))))

(assert (=> start!116272 (= res!915961 (and (bvslt (size!45505 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45505 a!3861))))))

(assert (=> start!116272 e!777663))

(declare-fun array_inv!33983 (array!93089) Bool)

(assert (=> start!116272 (array_inv!33983 a!3861)))

(assert (=> start!116272 true))

(declare-fun b!1372696 () Bool)

(declare-fun res!915963 () Bool)

(assert (=> b!1372696 (=> (not res!915963) (not e!777663))))

(assert (=> b!1372696 (= res!915963 (not (contains!9705 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116272 res!915961) b!1372690))

(assert (= (and b!1372690 res!915958) b!1372692))

(assert (= (and b!1372692 res!915962) b!1372693))

(assert (= (and b!1372693 res!915960) b!1372695))

(assert (= (and b!1372695 res!915964) b!1372696))

(assert (= (and b!1372696 res!915963) b!1372691))

(assert (= (and b!1372691 res!915959) b!1372694))

(declare-fun m!1256089 () Bool)

(assert (=> b!1372696 m!1256089))

(declare-fun m!1256091 () Bool)

(assert (=> start!116272 m!1256091))

(declare-fun m!1256093 () Bool)

(assert (=> b!1372694 m!1256093))

(declare-fun m!1256095 () Bool)

(assert (=> b!1372694 m!1256095))

(declare-fun m!1256097 () Bool)

(assert (=> b!1372692 m!1256097))

(declare-fun m!1256099 () Bool)

(assert (=> b!1372691 m!1256099))

(declare-fun m!1256101 () Bool)

(assert (=> b!1372693 m!1256101))

(declare-fun m!1256103 () Bool)

(assert (=> b!1372695 m!1256103))

(declare-fun m!1256105 () Bool)

(assert (=> b!1372690 m!1256105))

(check-sat (not b!1372696) (not b!1372692) (not start!116272) (not b!1372693) (not b!1372695) (not b!1372694) (not b!1372690) (not b!1372691))
(check-sat)
