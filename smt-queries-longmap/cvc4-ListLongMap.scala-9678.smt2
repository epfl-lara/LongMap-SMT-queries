; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114210 () Bool)

(assert start!114210)

(declare-fun b!1356765 () Bool)

(declare-fun res!901521 () Bool)

(declare-fun e!770172 () Bool)

(assert (=> b!1356765 (=> (not res!901521) (not e!770172))))

(declare-datatypes ((List!31685 0))(
  ( (Nil!31682) (Cons!31681 (h!32890 (_ BitVec 64)) (t!46343 List!31685)) )
))
(declare-fun acc!759 () List!31685)

(declare-datatypes ((array!92392 0))(
  ( (array!92393 (arr!44644 (Array (_ BitVec 32) (_ BitVec 64))) (size!45194 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92392)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92392 (_ BitVec 32) List!31685) Bool)

(assert (=> b!1356765 (= res!901521 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356766 () Bool)

(declare-fun res!901522 () Bool)

(assert (=> b!1356766 (=> (not res!901522) (not e!770172))))

(assert (=> b!1356766 (= res!901522 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31682))))

(declare-fun b!1356767 () Bool)

(assert (=> b!1356767 (= e!770172 (bvslt (bvsub (size!45194 a!3742) from!3120) #b00000000000000000000000000000000))))

(declare-fun b!1356768 () Bool)

(declare-fun res!901526 () Bool)

(assert (=> b!1356768 (=> (not res!901526) (not e!770172))))

(declare-fun noDuplicate!2251 (List!31685) Bool)

(assert (=> b!1356768 (= res!901526 (noDuplicate!2251 acc!759))))

(declare-fun b!1356769 () Bool)

(declare-fun res!901523 () Bool)

(assert (=> b!1356769 (=> (not res!901523) (not e!770172))))

(declare-fun contains!9394 (List!31685 (_ BitVec 64)) Bool)

(assert (=> b!1356769 (= res!901523 (not (contains!9394 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356770 () Bool)

(declare-fun res!901524 () Bool)

(assert (=> b!1356770 (=> (not res!901524) (not e!770172))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356770 (= res!901524 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45194 a!3742))))))

(declare-fun res!901527 () Bool)

(assert (=> start!114210 (=> (not res!901527) (not e!770172))))

(assert (=> start!114210 (= res!901527 (and (bvslt (size!45194 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45194 a!3742))))))

(assert (=> start!114210 e!770172))

(assert (=> start!114210 true))

(declare-fun array_inv!33672 (array!92392) Bool)

(assert (=> start!114210 (array_inv!33672 a!3742)))

(declare-fun b!1356771 () Bool)

(declare-fun res!901525 () Bool)

(assert (=> b!1356771 (=> (not res!901525) (not e!770172))))

(assert (=> b!1356771 (= res!901525 (not (contains!9394 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356772 () Bool)

(declare-fun res!901528 () Bool)

(assert (=> b!1356772 (=> (not res!901528) (not e!770172))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356772 (= res!901528 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114210 res!901527) b!1356768))

(assert (= (and b!1356768 res!901526) b!1356769))

(assert (= (and b!1356769 res!901523) b!1356771))

(assert (= (and b!1356771 res!901525) b!1356766))

(assert (= (and b!1356766 res!901522) b!1356765))

(assert (= (and b!1356765 res!901521) b!1356770))

(assert (= (and b!1356770 res!901524) b!1356772))

(assert (= (and b!1356772 res!901528) b!1356767))

(declare-fun m!1242683 () Bool)

(assert (=> b!1356765 m!1242683))

(declare-fun m!1242685 () Bool)

(assert (=> b!1356771 m!1242685))

(declare-fun m!1242687 () Bool)

(assert (=> b!1356769 m!1242687))

(declare-fun m!1242689 () Bool)

(assert (=> b!1356766 m!1242689))

(declare-fun m!1242691 () Bool)

(assert (=> b!1356768 m!1242691))

(declare-fun m!1242693 () Bool)

(assert (=> b!1356772 m!1242693))

(declare-fun m!1242695 () Bool)

(assert (=> start!114210 m!1242695))

(push 1)

(assert (not b!1356765))

(assert (not b!1356771))

(assert (not b!1356766))

(assert (not b!1356772))

(assert (not start!114210))

(assert (not b!1356768))

(assert (not b!1356769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

