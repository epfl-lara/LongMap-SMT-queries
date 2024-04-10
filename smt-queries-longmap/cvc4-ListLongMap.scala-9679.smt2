; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114216 () Bool)

(assert start!114216)

(declare-fun res!901569 () Bool)

(declare-fun e!770191 () Bool)

(assert (=> start!114216 (=> (not res!901569) (not e!770191))))

(declare-datatypes ((array!92398 0))(
  ( (array!92399 (arr!44647 (Array (_ BitVec 32) (_ BitVec 64))) (size!45197 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92398)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114216 (= res!901569 (and (bvslt (size!45197 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45197 a!3742))))))

(assert (=> start!114216 e!770191))

(declare-fun array_inv!33675 (array!92398) Bool)

(assert (=> start!114216 (array_inv!33675 a!3742)))

(assert (=> start!114216 true))

(declare-fun b!1356813 () Bool)

(assert (=> b!1356813 (= e!770191 false)))

(declare-datatypes ((List!31688 0))(
  ( (Nil!31685) (Cons!31684 (h!32893 (_ BitVec 64)) (t!46346 List!31688)) )
))
(declare-fun acc!759 () List!31688)

(declare-fun lt!599089 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92398 (_ BitVec 32) List!31688) Bool)

(assert (=> b!1356813 (= lt!599089 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356814 () Bool)

(declare-fun res!901570 () Bool)

(assert (=> b!1356814 (=> (not res!901570) (not e!770191))))

(declare-fun contains!9397 (List!31688 (_ BitVec 64)) Bool)

(assert (=> b!1356814 (= res!901570 (not (contains!9397 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356815 () Bool)

(declare-fun res!901572 () Bool)

(assert (=> b!1356815 (=> (not res!901572) (not e!770191))))

(assert (=> b!1356815 (= res!901572 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31685))))

(declare-fun b!1356816 () Bool)

(declare-fun res!901573 () Bool)

(assert (=> b!1356816 (=> (not res!901573) (not e!770191))))

(declare-fun noDuplicate!2254 (List!31688) Bool)

(assert (=> b!1356816 (= res!901573 (noDuplicate!2254 acc!759))))

(declare-fun b!1356817 () Bool)

(declare-fun res!901571 () Bool)

(assert (=> b!1356817 (=> (not res!901571) (not e!770191))))

(assert (=> b!1356817 (= res!901571 (not (contains!9397 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114216 res!901569) b!1356816))

(assert (= (and b!1356816 res!901573) b!1356817))

(assert (= (and b!1356817 res!901571) b!1356814))

(assert (= (and b!1356814 res!901570) b!1356815))

(assert (= (and b!1356815 res!901572) b!1356813))

(declare-fun m!1242721 () Bool)

(assert (=> start!114216 m!1242721))

(declare-fun m!1242723 () Bool)

(assert (=> b!1356813 m!1242723))

(declare-fun m!1242725 () Bool)

(assert (=> b!1356817 m!1242725))

(declare-fun m!1242727 () Bool)

(assert (=> b!1356815 m!1242727))

(declare-fun m!1242729 () Bool)

(assert (=> b!1356816 m!1242729))

(declare-fun m!1242731 () Bool)

(assert (=> b!1356814 m!1242731))

(push 1)

(assert (not b!1356813))

(assert (not b!1356816))

(assert (not b!1356815))

(assert (not b!1356814))

(assert (not b!1356817))

(assert (not start!114216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

