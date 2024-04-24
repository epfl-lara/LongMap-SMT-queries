; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116482 () Bool)

(assert start!116482)

(declare-fun b!1373815 () Bool)

(declare-fun res!916305 () Bool)

(declare-fun e!778456 () Bool)

(assert (=> b!1373815 (=> (not res!916305) (not e!778456))))

(declare-datatypes ((List!32056 0))(
  ( (Nil!32053) (Cons!32052 (h!33270 (_ BitVec 64)) (t!46742 List!32056)) )
))
(declare-fun newAcc!98 () List!32056)

(declare-fun acc!866 () List!32056)

(declare-fun subseq!1100 (List!32056 List!32056) Bool)

(assert (=> b!1373815 (= res!916305 (subseq!1100 newAcc!98 acc!866))))

(declare-fun res!916303 () Bool)

(assert (=> start!116482 (=> (not res!916303) (not e!778456))))

(declare-datatypes ((array!93190 0))(
  ( (array!93191 (arr!45001 (Array (_ BitVec 32) (_ BitVec 64))) (size!45552 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93190)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116482 (= res!916303 (and (bvslt (size!45552 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45552 a!3861))))))

(assert (=> start!116482 e!778456))

(declare-fun array_inv!34282 (array!93190) Bool)

(assert (=> start!116482 (array_inv!34282 a!3861)))

(assert (=> start!116482 true))

(declare-fun b!1373816 () Bool)

(declare-fun res!916304 () Bool)

(assert (=> b!1373816 (=> (not res!916304) (not e!778456))))

(declare-fun contains!9741 (List!32056 (_ BitVec 64)) Bool)

(assert (=> b!1373816 (= res!916304 (not (contains!9741 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373817 () Bool)

(declare-fun res!916302 () Bool)

(assert (=> b!1373817 (=> (not res!916302) (not e!778456))))

(assert (=> b!1373817 (= res!916302 (not (contains!9741 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373818 () Bool)

(assert (=> b!1373818 (= e!778456 false)))

(declare-fun lt!603354 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93190 (_ BitVec 32) List!32056) Bool)

(assert (=> b!1373818 (= lt!603354 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45272 0))(
  ( (Unit!45273) )
))
(declare-fun lt!603353 () Unit!45272)

(declare-fun noDuplicateSubseq!287 (List!32056 List!32056) Unit!45272)

(assert (=> b!1373818 (= lt!603353 (noDuplicateSubseq!287 newAcc!98 acc!866))))

(declare-fun b!1373819 () Bool)

(declare-fun res!916308 () Bool)

(assert (=> b!1373819 (=> (not res!916308) (not e!778456))))

(assert (=> b!1373819 (= res!916308 (not (contains!9741 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373820 () Bool)

(declare-fun res!916307 () Bool)

(assert (=> b!1373820 (=> (not res!916307) (not e!778456))))

(assert (=> b!1373820 (= res!916307 (not (contains!9741 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373821 () Bool)

(declare-fun res!916306 () Bool)

(assert (=> b!1373821 (=> (not res!916306) (not e!778456))))

(declare-fun noDuplicate!2572 (List!32056) Bool)

(assert (=> b!1373821 (= res!916306 (noDuplicate!2572 acc!866))))

(assert (= (and start!116482 res!916303) b!1373821))

(assert (= (and b!1373821 res!916306) b!1373820))

(assert (= (and b!1373820 res!916307) b!1373817))

(assert (= (and b!1373817 res!916302) b!1373816))

(assert (= (and b!1373816 res!916304) b!1373819))

(assert (= (and b!1373819 res!916308) b!1373815))

(assert (= (and b!1373815 res!916305) b!1373818))

(declare-fun m!1257547 () Bool)

(assert (=> start!116482 m!1257547))

(declare-fun m!1257549 () Bool)

(assert (=> b!1373820 m!1257549))

(declare-fun m!1257551 () Bool)

(assert (=> b!1373821 m!1257551))

(declare-fun m!1257553 () Bool)

(assert (=> b!1373816 m!1257553))

(declare-fun m!1257555 () Bool)

(assert (=> b!1373815 m!1257555))

(declare-fun m!1257557 () Bool)

(assert (=> b!1373818 m!1257557))

(declare-fun m!1257559 () Bool)

(assert (=> b!1373818 m!1257559))

(declare-fun m!1257561 () Bool)

(assert (=> b!1373817 m!1257561))

(declare-fun m!1257563 () Bool)

(assert (=> b!1373819 m!1257563))

(check-sat (not b!1373817) (not b!1373815) (not b!1373821) (not b!1373820) (not start!116482) (not b!1373816) (not b!1373818) (not b!1373819))
(check-sat)
