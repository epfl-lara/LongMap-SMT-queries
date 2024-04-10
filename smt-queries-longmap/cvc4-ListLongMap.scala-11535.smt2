; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134298 () Bool)

(assert start!134298)

(declare-fun b!1568434 () Bool)

(declare-fun e!874350 () Bool)

(assert (=> b!1568434 (= e!874350 false)))

(declare-fun lt!673183 () Bool)

(declare-fun e!874352 () Bool)

(assert (=> b!1568434 (= lt!673183 e!874352)))

(declare-fun res!1072123 () Bool)

(assert (=> b!1568434 (=> res!1072123 e!874352)))

(declare-datatypes ((array!104788 0))(
  ( (array!104789 (arr!50574 (Array (_ BitVec 32) (_ BitVec 64))) (size!51124 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104788)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568434 (= res!1072123 (not (validKeyInArray!0 (select (arr!50574 a!3481) from!2856))))))

(declare-fun b!1568435 () Bool)

(declare-fun res!1072125 () Bool)

(assert (=> b!1568435 (=> (not res!1072125) (not e!874350))))

(declare-datatypes ((List!36706 0))(
  ( (Nil!36703) (Cons!36702 (h!38149 (_ BitVec 64)) (t!51614 List!36706)) )
))
(declare-fun acc!619 () List!36706)

(declare-fun contains!10408 (List!36706 (_ BitVec 64)) Bool)

(assert (=> b!1568435 (= res!1072125 (not (contains!10408 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568436 () Bool)

(assert (=> b!1568436 (= e!874352 (not (contains!10408 acc!619 (select (arr!50574 a!3481) from!2856))))))

(declare-fun b!1568438 () Bool)

(declare-fun res!1072121 () Bool)

(assert (=> b!1568438 (=> (not res!1072121) (not e!874350))))

(assert (=> b!1568438 (= res!1072121 (bvslt from!2856 (size!51124 a!3481)))))

(declare-fun b!1568439 () Bool)

(declare-fun res!1072124 () Bool)

(assert (=> b!1568439 (=> (not res!1072124) (not e!874350))))

(declare-fun noDuplicate!2680 (List!36706) Bool)

(assert (=> b!1568439 (= res!1072124 (noDuplicate!2680 acc!619))))

(declare-fun b!1568437 () Bool)

(declare-fun res!1072120 () Bool)

(assert (=> b!1568437 (=> (not res!1072120) (not e!874350))))

(assert (=> b!1568437 (= res!1072120 (not (contains!10408 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072122 () Bool)

(assert (=> start!134298 (=> (not res!1072122) (not e!874350))))

(assert (=> start!134298 (= res!1072122 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51124 a!3481)) (bvslt (size!51124 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134298 e!874350))

(assert (=> start!134298 true))

(declare-fun array_inv!39301 (array!104788) Bool)

(assert (=> start!134298 (array_inv!39301 a!3481)))

(assert (= (and start!134298 res!1072122) b!1568439))

(assert (= (and b!1568439 res!1072124) b!1568437))

(assert (= (and b!1568437 res!1072120) b!1568435))

(assert (= (and b!1568435 res!1072125) b!1568438))

(assert (= (and b!1568438 res!1072121) b!1568434))

(assert (= (and b!1568434 (not res!1072123)) b!1568436))

(declare-fun m!1443101 () Bool)

(assert (=> b!1568434 m!1443101))

(assert (=> b!1568434 m!1443101))

(declare-fun m!1443103 () Bool)

(assert (=> b!1568434 m!1443103))

(declare-fun m!1443105 () Bool)

(assert (=> b!1568437 m!1443105))

(declare-fun m!1443107 () Bool)

(assert (=> b!1568435 m!1443107))

(declare-fun m!1443109 () Bool)

(assert (=> b!1568439 m!1443109))

(declare-fun m!1443111 () Bool)

(assert (=> start!134298 m!1443111))

(assert (=> b!1568436 m!1443101))

(assert (=> b!1568436 m!1443101))

(declare-fun m!1443113 () Bool)

(assert (=> b!1568436 m!1443113))

(push 1)

(assert (not b!1568436))

(assert (not start!134298))

(assert (not b!1568437))

(assert (not b!1568434))

(assert (not b!1568439))

(assert (not b!1568435))

(check-sat)

