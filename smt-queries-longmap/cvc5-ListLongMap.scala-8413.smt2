; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102616 () Bool)

(assert start!102616)

(declare-fun b!1233020 () Bool)

(declare-fun res!820641 () Bool)

(declare-fun e!699553 () Bool)

(assert (=> b!1233020 (=> (not res!820641) (not e!699553))))

(declare-datatypes ((List!27136 0))(
  ( (Nil!27133) (Cons!27132 (h!28350 (_ BitVec 64)) (t!40591 List!27136)) )
))
(declare-fun acc!823 () List!27136)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79482 0))(
  ( (array!79483 (arr!38350 (Array (_ BitVec 32) (_ BitVec 64))) (size!38887 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79482)

(declare-fun arrayNoDuplicates!0 (array!79482 (_ BitVec 32) List!27136) Bool)

(assert (=> b!1233020 (= res!820641 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233021 () Bool)

(declare-fun res!820646 () Bool)

(assert (=> b!1233021 (=> (not res!820646) (not e!699553))))

(assert (=> b!1233021 (= res!820646 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38887 a!3806)) (bvslt from!3184 (size!38887 a!3806))))))

(declare-fun b!1233022 () Bool)

(declare-fun res!820642 () Bool)

(assert (=> b!1233022 (=> (not res!820642) (not e!699553))))

(declare-fun noDuplicate!1788 (List!27136) Bool)

(assert (=> b!1233022 (= res!820642 (noDuplicate!1788 acc!823))))

(declare-fun b!1233023 () Bool)

(declare-fun res!820645 () Bool)

(assert (=> b!1233023 (=> (not res!820645) (not e!699553))))

(declare-fun contains!7207 (List!27136 (_ BitVec 64)) Bool)

(assert (=> b!1233023 (= res!820645 (not (contains!7207 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233024 () Bool)

(declare-fun res!820649 () Bool)

(assert (=> b!1233024 (=> (not res!820649) (not e!699553))))

(assert (=> b!1233024 (= res!820649 (not (contains!7207 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233025 () Bool)

(declare-fun res!820647 () Bool)

(assert (=> b!1233025 (=> (not res!820647) (not e!699553))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233025 (= res!820647 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233026 () Bool)

(declare-fun res!820643 () Bool)

(assert (=> b!1233026 (=> (not res!820643) (not e!699553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233026 (= res!820643 (validKeyInArray!0 k!2913))))

(declare-fun b!1233027 () Bool)

(declare-fun res!820644 () Bool)

(assert (=> b!1233027 (=> (not res!820644) (not e!699553))))

(assert (=> b!1233027 (= res!820644 (validKeyInArray!0 (select (arr!38350 a!3806) from!3184)))))

(declare-fun b!1233028 () Bool)

(assert (=> b!1233028 (= e!699553 (not true))))

(assert (=> b!1233028 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27133)))

(declare-datatypes ((Unit!40755 0))(
  ( (Unit!40756) )
))
(declare-fun lt!559923 () Unit!40755)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79482 List!27136 List!27136 (_ BitVec 32)) Unit!40755)

(assert (=> b!1233028 (= lt!559923 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27133 from!3184))))

(assert (=> b!1233028 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27132 (select (arr!38350 a!3806) from!3184) acc!823))))

(declare-fun res!820648 () Bool)

(assert (=> start!102616 (=> (not res!820648) (not e!699553))))

(assert (=> start!102616 (= res!820648 (bvslt (size!38887 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102616 e!699553))

(declare-fun array_inv!29288 (array!79482) Bool)

(assert (=> start!102616 (array_inv!29288 a!3806)))

(assert (=> start!102616 true))

(assert (= (and start!102616 res!820648) b!1233026))

(assert (= (and b!1233026 res!820643) b!1233021))

(assert (= (and b!1233021 res!820646) b!1233022))

(assert (= (and b!1233022 res!820642) b!1233024))

(assert (= (and b!1233024 res!820649) b!1233023))

(assert (= (and b!1233023 res!820645) b!1233025))

(assert (= (and b!1233025 res!820647) b!1233020))

(assert (= (and b!1233020 res!820641) b!1233027))

(assert (= (and b!1233027 res!820644) b!1233028))

(declare-fun m!1137447 () Bool)

(assert (=> b!1233026 m!1137447))

(declare-fun m!1137449 () Bool)

(assert (=> b!1233023 m!1137449))

(declare-fun m!1137451 () Bool)

(assert (=> b!1233028 m!1137451))

(declare-fun m!1137453 () Bool)

(assert (=> b!1233028 m!1137453))

(declare-fun m!1137455 () Bool)

(assert (=> b!1233028 m!1137455))

(declare-fun m!1137457 () Bool)

(assert (=> b!1233028 m!1137457))

(declare-fun m!1137459 () Bool)

(assert (=> start!102616 m!1137459))

(declare-fun m!1137461 () Bool)

(assert (=> b!1233022 m!1137461))

(declare-fun m!1137463 () Bool)

(assert (=> b!1233020 m!1137463))

(assert (=> b!1233027 m!1137455))

(assert (=> b!1233027 m!1137455))

(declare-fun m!1137465 () Bool)

(assert (=> b!1233027 m!1137465))

(declare-fun m!1137467 () Bool)

(assert (=> b!1233024 m!1137467))

(declare-fun m!1137469 () Bool)

(assert (=> b!1233025 m!1137469))

(push 1)

(assert (not b!1233024))

(assert (not start!102616))

(assert (not b!1233020))

(assert (not b!1233025))

(assert (not b!1233026))

(assert (not b!1233028))

(assert (not b!1233022))

(assert (not b!1233027))

(assert (not b!1233023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

