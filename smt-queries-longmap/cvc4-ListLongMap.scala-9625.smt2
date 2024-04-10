; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113892 () Bool)

(assert start!113892)

(declare-fun b!1350586 () Bool)

(declare-fun res!896045 () Bool)

(declare-fun e!768327 () Bool)

(assert (=> b!1350586 (=> (not res!896045) (not e!768327))))

(declare-datatypes ((List!31526 0))(
  ( (Nil!31523) (Cons!31522 (h!32731 (_ BitVec 64)) (t!46184 List!31526)) )
))
(declare-fun acc!759 () List!31526)

(declare-fun noDuplicate!2092 (List!31526) Bool)

(assert (=> b!1350586 (= res!896045 (noDuplicate!2092 acc!759))))

(declare-fun b!1350587 () Bool)

(declare-fun res!896047 () Bool)

(assert (=> b!1350587 (=> (not res!896047) (not e!768327))))

(declare-fun contains!9235 (List!31526 (_ BitVec 64)) Bool)

(assert (=> b!1350587 (= res!896047 (not (contains!9235 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350589 () Bool)

(assert (=> b!1350589 (= e!768327 false)))

(declare-fun lt!597001 () Bool)

(declare-datatypes ((array!92074 0))(
  ( (array!92075 (arr!44485 (Array (_ BitVec 32) (_ BitVec 64))) (size!45035 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92074)

(declare-fun arrayNoDuplicates!0 (array!92074 (_ BitVec 32) List!31526) Bool)

(assert (=> b!1350589 (= lt!597001 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31523))))

(declare-fun b!1350588 () Bool)

(declare-fun res!896046 () Bool)

(assert (=> b!1350588 (=> (not res!896046) (not e!768327))))

(assert (=> b!1350588 (= res!896046 (not (contains!9235 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896044 () Bool)

(assert (=> start!113892 (=> (not res!896044) (not e!768327))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113892 (= res!896044 (and (bvslt (size!45035 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45035 a!3742))))))

(assert (=> start!113892 e!768327))

(declare-fun array_inv!33513 (array!92074) Bool)

(assert (=> start!113892 (array_inv!33513 a!3742)))

(assert (=> start!113892 true))

(assert (= (and start!113892 res!896044) b!1350586))

(assert (= (and b!1350586 res!896045) b!1350587))

(assert (= (and b!1350587 res!896047) b!1350588))

(assert (= (and b!1350588 res!896046) b!1350589))

(declare-fun m!1237797 () Bool)

(assert (=> b!1350586 m!1237797))

(declare-fun m!1237799 () Bool)

(assert (=> b!1350589 m!1237799))

(declare-fun m!1237801 () Bool)

(assert (=> b!1350587 m!1237801))

(declare-fun m!1237803 () Bool)

(assert (=> b!1350588 m!1237803))

(declare-fun m!1237805 () Bool)

(assert (=> start!113892 m!1237805))

(push 1)

(assert (not b!1350586))

(assert (not b!1350589))

(assert (not b!1350588))

(assert (not b!1350587))

(assert (not start!113892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

