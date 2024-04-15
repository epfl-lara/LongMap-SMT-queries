; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113898 () Bool)

(assert start!113898)

(declare-fun res!896051 () Bool)

(declare-fun e!768313 () Bool)

(assert (=> start!113898 (=> (not res!896051) (not e!768313))))

(declare-datatypes ((array!92029 0))(
  ( (array!92030 (arr!44463 (Array (_ BitVec 32) (_ BitVec 64))) (size!45015 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92029)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113898 (= res!896051 (and (bvslt (size!45015 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45015 a!3742))))))

(assert (=> start!113898 e!768313))

(declare-fun array_inv!33696 (array!92029) Bool)

(assert (=> start!113898 (array_inv!33696 a!3742)))

(assert (=> start!113898 true))

(declare-fun b!1350552 () Bool)

(declare-fun res!896053 () Bool)

(assert (=> b!1350552 (=> (not res!896053) (not e!768313))))

(declare-datatypes ((List!31582 0))(
  ( (Nil!31579) (Cons!31578 (h!32787 (_ BitVec 64)) (t!46232 List!31582)) )
))
(declare-fun acc!759 () List!31582)

(declare-fun noDuplicate!2117 (List!31582) Bool)

(assert (=> b!1350552 (= res!896053 (noDuplicate!2117 acc!759))))

(declare-fun b!1350555 () Bool)

(assert (=> b!1350555 (= e!768313 false)))

(declare-fun lt!596824 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92029 (_ BitVec 32) List!31582) Bool)

(assert (=> b!1350555 (= lt!596824 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31579))))

(declare-fun b!1350553 () Bool)

(declare-fun res!896052 () Bool)

(assert (=> b!1350553 (=> (not res!896052) (not e!768313))))

(declare-fun contains!9202 (List!31582 (_ BitVec 64)) Bool)

(assert (=> b!1350553 (= res!896052 (not (contains!9202 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350554 () Bool)

(declare-fun res!896054 () Bool)

(assert (=> b!1350554 (=> (not res!896054) (not e!768313))))

(assert (=> b!1350554 (= res!896054 (not (contains!9202 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113898 res!896051) b!1350552))

(assert (= (and b!1350552 res!896053) b!1350553))

(assert (= (and b!1350553 res!896052) b!1350554))

(assert (= (and b!1350554 res!896054) b!1350555))

(declare-fun m!1237311 () Bool)

(assert (=> b!1350552 m!1237311))

(declare-fun m!1237313 () Bool)

(assert (=> b!1350554 m!1237313))

(declare-fun m!1237315 () Bool)

(assert (=> b!1350553 m!1237315))

(declare-fun m!1237317 () Bool)

(assert (=> start!113898 m!1237317))

(declare-fun m!1237319 () Bool)

(assert (=> b!1350555 m!1237319))

(push 1)

(assert (not b!1350552))

(assert (not b!1350553))

(assert (not start!113898))

(assert (not b!1350555))

(assert (not b!1350554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

