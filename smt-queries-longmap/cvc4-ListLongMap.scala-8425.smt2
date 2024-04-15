; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102636 () Bool)

(assert start!102636)

(declare-fun b!1233717 () Bool)

(declare-fun res!821936 () Bool)

(declare-fun e!699841 () Bool)

(assert (=> b!1233717 (=> (not res!821936) (not e!699841))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79449 0))(
  ( (array!79450 (arr!38334 (Array (_ BitVec 32) (_ BitVec 64))) (size!38872 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79449)

(assert (=> b!1233717 (= res!821936 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38872 a!3806)) (bvslt from!3184 (size!38872 a!3806))))))

(declare-fun res!821933 () Bool)

(assert (=> start!102636 (=> (not res!821933) (not e!699841))))

(assert (=> start!102636 (= res!821933 (bvslt (size!38872 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102636 e!699841))

(declare-fun array_inv!29317 (array!79449) Bool)

(assert (=> start!102636 (array_inv!29317 a!3806)))

(assert (=> start!102636 true))

(declare-fun b!1233718 () Bool)

(declare-fun res!821941 () Bool)

(assert (=> b!1233718 (=> (not res!821941) (not e!699841))))

(declare-datatypes ((List!27208 0))(
  ( (Nil!27205) (Cons!27204 (h!28413 (_ BitVec 64)) (t!40662 List!27208)) )
))
(declare-fun acc!823 () List!27208)

(declare-fun contains!7180 (List!27208 (_ BitVec 64)) Bool)

(assert (=> b!1233718 (= res!821941 (not (contains!7180 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233719 () Bool)

(declare-fun e!699840 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79449 (_ BitVec 32) List!27208) Bool)

(assert (=> b!1233719 (= e!699840 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27204 (select (arr!38334 a!3806) from!3184) Nil!27205)))))

(declare-fun b!1233720 () Bool)

(declare-fun res!821935 () Bool)

(assert (=> b!1233720 (=> (not res!821935) (not e!699841))))

(declare-fun noDuplicate!1823 (List!27208) Bool)

(assert (=> b!1233720 (= res!821935 (noDuplicate!1823 acc!823))))

(declare-fun b!1233721 () Bool)

(declare-fun res!821942 () Bool)

(assert (=> b!1233721 (=> (not res!821942) (not e!699841))))

(assert (=> b!1233721 (= res!821942 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233722 () Bool)

(declare-fun res!821937 () Bool)

(assert (=> b!1233722 (=> (not res!821937) (not e!699841))))

(assert (=> b!1233722 (= res!821937 (not (contains!7180 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233723 () Bool)

(declare-fun res!821934 () Bool)

(assert (=> b!1233723 (=> (not res!821934) (not e!699841))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233723 (= res!821934 (validKeyInArray!0 k!2913))))

(declare-fun b!1233724 () Bool)

(declare-fun res!821939 () Bool)

(assert (=> b!1233724 (=> (not res!821939) (not e!699841))))

(assert (=> b!1233724 (= res!821939 (validKeyInArray!0 (select (arr!38334 a!3806) from!3184)))))

(declare-fun b!1233725 () Bool)

(assert (=> b!1233725 (= e!699841 (not true))))

(declare-fun arrayContainsKey!0 (array!79449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233725 (not (arrayContainsKey!0 a!3806 (select (arr!38334 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40699 0))(
  ( (Unit!40700) )
))
(declare-fun lt!559571 () Unit!40699)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79449 (_ BitVec 32) (_ BitVec 64) List!27208) Unit!40699)

(assert (=> b!1233725 (= lt!559571 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38334 a!3806) from!3184) (Cons!27204 (select (arr!38334 a!3806) from!3184) Nil!27205)))))

(assert (=> b!1233725 e!699840))

(declare-fun res!821940 () Bool)

(assert (=> b!1233725 (=> (not res!821940) (not e!699840))))

(assert (=> b!1233725 (= res!821940 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27205))))

(declare-fun lt!559570 () Unit!40699)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79449 List!27208 List!27208 (_ BitVec 32)) Unit!40699)

(assert (=> b!1233725 (= lt!559570 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27205 from!3184))))

(assert (=> b!1233725 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27204 (select (arr!38334 a!3806) from!3184) acc!823))))

(declare-fun b!1233726 () Bool)

(declare-fun res!821938 () Bool)

(assert (=> b!1233726 (=> (not res!821938) (not e!699841))))

(assert (=> b!1233726 (= res!821938 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102636 res!821933) b!1233723))

(assert (= (and b!1233723 res!821934) b!1233717))

(assert (= (and b!1233717 res!821936) b!1233720))

(assert (= (and b!1233720 res!821935) b!1233718))

(assert (= (and b!1233718 res!821941) b!1233722))

(assert (= (and b!1233722 res!821937) b!1233726))

(assert (= (and b!1233726 res!821938) b!1233721))

(assert (= (and b!1233721 res!821942) b!1233724))

(assert (= (and b!1233724 res!821939) b!1233725))

(assert (= (and b!1233725 res!821940) b!1233719))

(declare-fun m!1137345 () Bool)

(assert (=> b!1233720 m!1137345))

(declare-fun m!1137347 () Bool)

(assert (=> b!1233723 m!1137347))

(declare-fun m!1137349 () Bool)

(assert (=> b!1233726 m!1137349))

(declare-fun m!1137351 () Bool)

(assert (=> b!1233722 m!1137351))

(declare-fun m!1137353 () Bool)

(assert (=> b!1233724 m!1137353))

(assert (=> b!1233724 m!1137353))

(declare-fun m!1137355 () Bool)

(assert (=> b!1233724 m!1137355))

(declare-fun m!1137357 () Bool)

(assert (=> b!1233721 m!1137357))

(declare-fun m!1137359 () Bool)

(assert (=> start!102636 m!1137359))

(declare-fun m!1137361 () Bool)

(assert (=> b!1233725 m!1137361))

(declare-fun m!1137363 () Bool)

(assert (=> b!1233725 m!1137363))

(assert (=> b!1233725 m!1137353))

(declare-fun m!1137365 () Bool)

(assert (=> b!1233725 m!1137365))

(assert (=> b!1233725 m!1137353))

(declare-fun m!1137367 () Bool)

(assert (=> b!1233725 m!1137367))

(assert (=> b!1233725 m!1137353))

(declare-fun m!1137369 () Bool)

(assert (=> b!1233725 m!1137369))

(assert (=> b!1233719 m!1137353))

(declare-fun m!1137371 () Bool)

(assert (=> b!1233719 m!1137371))

(declare-fun m!1137373 () Bool)

(assert (=> b!1233718 m!1137373))

(push 1)

(assert (not b!1233725))

(assert (not b!1233719))

(assert (not b!1233726))

(assert (not b!1233721))

(assert (not b!1233723))

(assert (not start!102636))

(assert (not b!1233722))

(assert (not b!1233724))

(assert (not b!1233718))

(assert (not b!1233720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

