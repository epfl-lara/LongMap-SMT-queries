; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115698 () Bool)

(assert start!115698)

(declare-fun b!1368048 () Bool)

(declare-fun res!911564 () Bool)

(declare-fun e!775227 () Bool)

(assert (=> b!1368048 (=> (not res!911564) (not e!775227))))

(declare-datatypes ((List!31937 0))(
  ( (Nil!31934) (Cons!31933 (h!33142 (_ BitVec 64)) (t!46631 List!31937)) )
))
(declare-fun acc!866 () List!31937)

(declare-fun noDuplicate!2476 (List!31937) Bool)

(assert (=> b!1368048 (= res!911564 (noDuplicate!2476 acc!866))))

(declare-fun res!911566 () Bool)

(assert (=> start!115698 (=> (not res!911566) (not e!775227))))

(declare-datatypes ((array!92890 0))(
  ( (array!92891 (arr!44869 (Array (_ BitVec 32) (_ BitVec 64))) (size!45419 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92890)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115698 (= res!911566 (and (bvslt (size!45419 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45419 a!3861))))))

(assert (=> start!115698 e!775227))

(declare-fun array_inv!33897 (array!92890) Bool)

(assert (=> start!115698 (array_inv!33897 a!3861)))

(assert (=> start!115698 true))

(declare-fun b!1368049 () Bool)

(declare-fun res!911565 () Bool)

(assert (=> b!1368049 (=> (not res!911565) (not e!775227))))

(declare-fun newAcc!98 () List!31937)

(declare-fun contains!9619 (List!31937 (_ BitVec 64)) Bool)

(assert (=> b!1368049 (= res!911565 (not (contains!9619 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368050 () Bool)

(declare-fun res!911557 () Bool)

(assert (=> b!1368050 (=> (not res!911557) (not e!775227))))

(assert (=> b!1368050 (= res!911557 (not (contains!9619 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368051 () Bool)

(declare-fun res!911556 () Bool)

(declare-fun e!775226 () Bool)

(assert (=> b!1368051 (=> (not res!911556) (not e!775226))))

(assert (=> b!1368051 (= res!911556 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368052 () Bool)

(declare-fun res!911558 () Bool)

(assert (=> b!1368052 (=> (not res!911558) (not e!775226))))

(assert (=> b!1368052 (= res!911558 (bvslt from!3239 (size!45419 a!3861)))))

(declare-fun b!1368053 () Bool)

(assert (=> b!1368053 (= e!775226 false)))

(declare-fun lt!601996 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92890 (_ BitVec 32) List!31937) Bool)

(assert (=> b!1368053 (= lt!601996 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368054 () Bool)

(declare-fun res!911559 () Bool)

(assert (=> b!1368054 (=> (not res!911559) (not e!775227))))

(assert (=> b!1368054 (= res!911559 (not (contains!9619 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368055 () Bool)

(assert (=> b!1368055 (= e!775227 e!775226)))

(declare-fun res!911560 () Bool)

(assert (=> b!1368055 (=> (not res!911560) (not e!775226))))

(assert (=> b!1368055 (= res!911560 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45175 0))(
  ( (Unit!45176) )
))
(declare-fun lt!601995 () Unit!45175)

(declare-fun noDuplicateSubseq!208 (List!31937 List!31937) Unit!45175)

(assert (=> b!1368055 (= lt!601995 (noDuplicateSubseq!208 newAcc!98 acc!866))))

(declare-fun b!1368056 () Bool)

(declare-fun res!911562 () Bool)

(assert (=> b!1368056 (=> (not res!911562) (not e!775227))))

(declare-fun subseq!1021 (List!31937 List!31937) Bool)

(assert (=> b!1368056 (= res!911562 (subseq!1021 newAcc!98 acc!866))))

(declare-fun b!1368057 () Bool)

(declare-fun res!911563 () Bool)

(assert (=> b!1368057 (=> (not res!911563) (not e!775226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368057 (= res!911563 (not (validKeyInArray!0 (select (arr!44869 a!3861) from!3239))))))

(declare-fun b!1368058 () Bool)

(declare-fun res!911561 () Bool)

(assert (=> b!1368058 (=> (not res!911561) (not e!775227))))

(assert (=> b!1368058 (= res!911561 (not (contains!9619 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115698 res!911566) b!1368048))

(assert (= (and b!1368048 res!911564) b!1368050))

(assert (= (and b!1368050 res!911557) b!1368058))

(assert (= (and b!1368058 res!911561) b!1368054))

(assert (= (and b!1368054 res!911559) b!1368049))

(assert (= (and b!1368049 res!911565) b!1368056))

(assert (= (and b!1368056 res!911562) b!1368055))

(assert (= (and b!1368055 res!911560) b!1368052))

(assert (= (and b!1368052 res!911558) b!1368057))

(assert (= (and b!1368057 res!911563) b!1368051))

(assert (= (and b!1368051 res!911556) b!1368053))

(declare-fun m!1252123 () Bool)

(assert (=> b!1368053 m!1252123))

(declare-fun m!1252125 () Bool)

(assert (=> b!1368055 m!1252125))

(declare-fun m!1252127 () Bool)

(assert (=> b!1368055 m!1252127))

(declare-fun m!1252129 () Bool)

(assert (=> b!1368050 m!1252129))

(declare-fun m!1252131 () Bool)

(assert (=> start!115698 m!1252131))

(declare-fun m!1252133 () Bool)

(assert (=> b!1368056 m!1252133))

(declare-fun m!1252135 () Bool)

(assert (=> b!1368058 m!1252135))

(declare-fun m!1252137 () Bool)

(assert (=> b!1368054 m!1252137))

(declare-fun m!1252139 () Bool)

(assert (=> b!1368049 m!1252139))

(declare-fun m!1252141 () Bool)

(assert (=> b!1368057 m!1252141))

(assert (=> b!1368057 m!1252141))

(declare-fun m!1252143 () Bool)

(assert (=> b!1368057 m!1252143))

(declare-fun m!1252145 () Bool)

(assert (=> b!1368048 m!1252145))

(push 1)

(assert (not b!1368054))

(assert (not b!1368048))

(assert (not start!115698))

