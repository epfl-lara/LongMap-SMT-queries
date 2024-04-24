; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115840 () Bool)

(assert start!115840)

(declare-fun b!1368547 () Bool)

(declare-fun res!911301 () Bool)

(declare-fun e!775742 () Bool)

(assert (=> b!1368547 (=> (not res!911301) (not e!775742))))

(declare-datatypes ((List!31957 0))(
  ( (Nil!31954) (Cons!31953 (h!33171 (_ BitVec 64)) (t!46643 List!31957)) )
))
(declare-fun newAcc!98 () List!31957)

(declare-fun acc!866 () List!31957)

(declare-fun subseq!1001 (List!31957 List!31957) Bool)

(assert (=> b!1368547 (= res!911301 (subseq!1001 newAcc!98 acc!866))))

(declare-fun b!1368548 () Bool)

(declare-fun res!911297 () Bool)

(assert (=> b!1368548 (=> (not res!911297) (not e!775742))))

(declare-fun contains!9642 (List!31957 (_ BitVec 64)) Bool)

(assert (=> b!1368548 (= res!911297 (not (contains!9642 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368549 () Bool)

(declare-fun res!911292 () Bool)

(assert (=> b!1368549 (=> (not res!911292) (not e!775742))))

(assert (=> b!1368549 (= res!911292 (not (contains!9642 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368550 () Bool)

(declare-fun res!911299 () Bool)

(declare-fun e!775744 () Bool)

(assert (=> b!1368550 (=> (not res!911299) (not e!775744))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92962 0))(
  ( (array!92963 (arr!44902 (Array (_ BitVec 32) (_ BitVec 64))) (size!45453 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92962)

(assert (=> b!1368550 (= res!911299 (bvslt from!3239 (size!45453 a!3861)))))

(declare-fun b!1368551 () Bool)

(assert (=> b!1368551 (= e!775742 e!775744)))

(declare-fun res!911293 () Bool)

(assert (=> b!1368551 (=> (not res!911293) (not e!775744))))

(declare-fun arrayNoDuplicates!0 (array!92962 (_ BitVec 32) List!31957) Bool)

(assert (=> b!1368551 (= res!911293 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45074 0))(
  ( (Unit!45075) )
))
(declare-fun lt!602330 () Unit!45074)

(declare-fun noDuplicateSubseq!188 (List!31957 List!31957) Unit!45074)

(assert (=> b!1368551 (= lt!602330 (noDuplicateSubseq!188 newAcc!98 acc!866))))

(declare-fun res!911294 () Bool)

(assert (=> start!115840 (=> (not res!911294) (not e!775742))))

(assert (=> start!115840 (= res!911294 (and (bvslt (size!45453 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45453 a!3861))))))

(assert (=> start!115840 e!775742))

(declare-fun array_inv!34183 (array!92962) Bool)

(assert (=> start!115840 (array_inv!34183 a!3861)))

(assert (=> start!115840 true))

(declare-fun b!1368552 () Bool)

(declare-fun res!911296 () Bool)

(assert (=> b!1368552 (=> (not res!911296) (not e!775744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368552 (= res!911296 (validKeyInArray!0 (select (arr!44902 a!3861) from!3239)))))

(declare-fun b!1368553 () Bool)

(declare-fun res!911300 () Bool)

(assert (=> b!1368553 (=> (not res!911300) (not e!775742))))

(declare-fun noDuplicate!2473 (List!31957) Bool)

(assert (=> b!1368553 (= res!911300 (noDuplicate!2473 acc!866))))

(declare-fun b!1368554 () Bool)

(declare-fun res!911298 () Bool)

(assert (=> b!1368554 (=> (not res!911298) (not e!775742))))

(assert (=> b!1368554 (= res!911298 (not (contains!9642 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368555 () Bool)

(assert (=> b!1368555 (= e!775744 false)))

(declare-fun lt!602331 () Bool)

(assert (=> b!1368555 (= lt!602331 (contains!9642 acc!866 (select (arr!44902 a!3861) from!3239)))))

(declare-fun b!1368556 () Bool)

(declare-fun res!911295 () Bool)

(assert (=> b!1368556 (=> (not res!911295) (not e!775742))))

(assert (=> b!1368556 (= res!911295 (not (contains!9642 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115840 res!911294) b!1368553))

(assert (= (and b!1368553 res!911300) b!1368554))

(assert (= (and b!1368554 res!911298) b!1368556))

(assert (= (and b!1368556 res!911295) b!1368549))

(assert (= (and b!1368549 res!911292) b!1368548))

(assert (= (and b!1368548 res!911297) b!1368547))

(assert (= (and b!1368547 res!911301) b!1368551))

(assert (= (and b!1368551 res!911293) b!1368550))

(assert (= (and b!1368550 res!911299) b!1368552))

(assert (= (and b!1368552 res!911296) b!1368555))

(declare-fun m!1253107 () Bool)

(assert (=> b!1368553 m!1253107))

(declare-fun m!1253109 () Bool)

(assert (=> b!1368552 m!1253109))

(assert (=> b!1368552 m!1253109))

(declare-fun m!1253111 () Bool)

(assert (=> b!1368552 m!1253111))

(declare-fun m!1253113 () Bool)

(assert (=> b!1368554 m!1253113))

(declare-fun m!1253115 () Bool)

(assert (=> start!115840 m!1253115))

(declare-fun m!1253117 () Bool)

(assert (=> b!1368551 m!1253117))

(declare-fun m!1253119 () Bool)

(assert (=> b!1368551 m!1253119))

(declare-fun m!1253121 () Bool)

(assert (=> b!1368548 m!1253121))

(declare-fun m!1253123 () Bool)

(assert (=> b!1368549 m!1253123))

(assert (=> b!1368555 m!1253109))

(assert (=> b!1368555 m!1253109))

(declare-fun m!1253125 () Bool)

(assert (=> b!1368555 m!1253125))

(declare-fun m!1253127 () Bool)

(assert (=> b!1368547 m!1253127))

(declare-fun m!1253129 () Bool)

(assert (=> b!1368556 m!1253129))

(check-sat (not b!1368547) (not start!115840) (not b!1368555) (not b!1368552) (not b!1368548) (not b!1368551) (not b!1368549) (not b!1368553) (not b!1368556) (not b!1368554))
(check-sat)
