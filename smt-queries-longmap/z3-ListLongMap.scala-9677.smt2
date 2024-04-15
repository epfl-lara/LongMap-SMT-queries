; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114200 () Bool)

(assert start!114200)

(declare-fun b!1356596 () Bool)

(declare-fun res!901395 () Bool)

(declare-fun e!770109 () Bool)

(assert (=> b!1356596 (=> (not res!901395) (not e!770109))))

(declare-datatypes ((List!31733 0))(
  ( (Nil!31730) (Cons!31729 (h!32938 (_ BitVec 64)) (t!46383 List!31733)) )
))
(declare-fun acc!759 () List!31733)

(declare-fun contains!9353 (List!31733 (_ BitVec 64)) Bool)

(assert (=> b!1356596 (= res!901395 (not (contains!9353 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356597 () Bool)

(declare-fun res!901394 () Bool)

(assert (=> b!1356597 (=> (not res!901394) (not e!770109))))

(declare-fun noDuplicate!2268 (List!31733) Bool)

(assert (=> b!1356597 (= res!901394 (noDuplicate!2268 acc!759))))

(declare-fun res!901397 () Bool)

(assert (=> start!114200 (=> (not res!901397) (not e!770109))))

(declare-datatypes ((array!92331 0))(
  ( (array!92332 (arr!44614 (Array (_ BitVec 32) (_ BitVec 64))) (size!45166 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92331)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114200 (= res!901397 (and (bvslt (size!45166 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45166 a!3742))))))

(assert (=> start!114200 e!770109))

(declare-fun array_inv!33847 (array!92331) Bool)

(assert (=> start!114200 (array_inv!33847 a!3742)))

(assert (=> start!114200 true))

(declare-fun b!1356598 () Bool)

(declare-fun res!901393 () Bool)

(assert (=> b!1356598 (=> (not res!901393) (not e!770109))))

(assert (=> b!1356598 (= res!901393 (not (contains!9353 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356599 () Bool)

(assert (=> b!1356599 (= e!770109 false)))

(declare-fun lt!598888 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92331 (_ BitVec 32) List!31733) Bool)

(assert (=> b!1356599 (= lt!598888 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356600 () Bool)

(declare-fun res!901396 () Bool)

(assert (=> b!1356600 (=> (not res!901396) (not e!770109))))

(assert (=> b!1356600 (= res!901396 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31730))))

(assert (= (and start!114200 res!901397) b!1356597))

(assert (= (and b!1356597 res!901394) b!1356598))

(assert (= (and b!1356598 res!901393) b!1356596))

(assert (= (and b!1356596 res!901395) b!1356600))

(assert (= (and b!1356600 res!901396) b!1356599))

(declare-fun m!1242103 () Bool)

(assert (=> b!1356599 m!1242103))

(declare-fun m!1242105 () Bool)

(assert (=> b!1356598 m!1242105))

(declare-fun m!1242107 () Bool)

(assert (=> start!114200 m!1242107))

(declare-fun m!1242109 () Bool)

(assert (=> b!1356597 m!1242109))

(declare-fun m!1242111 () Bool)

(assert (=> b!1356600 m!1242111))

(declare-fun m!1242113 () Bool)

(assert (=> b!1356596 m!1242113))

(check-sat (not start!114200) (not b!1356600) (not b!1356598) (not b!1356596) (not b!1356599) (not b!1356597))
(check-sat)
