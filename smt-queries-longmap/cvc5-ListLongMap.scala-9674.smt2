; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114182 () Bool)

(assert start!114182)

(declare-fun b!1356510 () Bool)

(declare-fun res!901273 () Bool)

(declare-fun e!770089 () Bool)

(assert (=> b!1356510 (=> (not res!901273) (not e!770089))))

(declare-datatypes ((List!31671 0))(
  ( (Nil!31668) (Cons!31667 (h!32876 (_ BitVec 64)) (t!46329 List!31671)) )
))
(declare-fun acc!759 () List!31671)

(declare-fun noDuplicate!2237 (List!31671) Bool)

(assert (=> b!1356510 (= res!901273 (noDuplicate!2237 acc!759))))

(declare-fun b!1356511 () Bool)

(declare-fun res!901270 () Bool)

(assert (=> b!1356511 (=> (not res!901270) (not e!770089))))

(declare-datatypes ((array!92364 0))(
  ( (array!92365 (arr!44630 (Array (_ BitVec 32) (_ BitVec 64))) (size!45180 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92364)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92364 (_ BitVec 32) List!31671) Bool)

(assert (=> b!1356511 (= res!901270 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356512 () Bool)

(declare-fun res!901267 () Bool)

(assert (=> b!1356512 (=> (not res!901267) (not e!770089))))

(declare-fun contains!9380 (List!31671 (_ BitVec 64)) Bool)

(assert (=> b!1356512 (= res!901267 (not (contains!9380 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356513 () Bool)

(declare-fun res!901269 () Bool)

(assert (=> b!1356513 (=> (not res!901269) (not e!770089))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356513 (= res!901269 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45180 a!3742))))))

(declare-fun res!901272 () Bool)

(assert (=> start!114182 (=> (not res!901272) (not e!770089))))

(assert (=> start!114182 (= res!901272 (and (bvslt (size!45180 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45180 a!3742))))))

(assert (=> start!114182 e!770089))

(assert (=> start!114182 true))

(declare-fun array_inv!33658 (array!92364) Bool)

(assert (=> start!114182 (array_inv!33658 a!3742)))

(declare-fun b!1356514 () Bool)

(declare-fun res!901266 () Bool)

(assert (=> b!1356514 (=> (not res!901266) (not e!770089))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356514 (= res!901266 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356515 () Bool)

(assert (=> b!1356515 (= e!770089 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45180 a!3742)) (bvsgt from!3120 (size!45180 a!3742))))))

(declare-fun b!1356516 () Bool)

(declare-fun res!901271 () Bool)

(assert (=> b!1356516 (=> (not res!901271) (not e!770089))))

(assert (=> b!1356516 (= res!901271 (not (contains!9380 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356517 () Bool)

(declare-fun res!901268 () Bool)

(assert (=> b!1356517 (=> (not res!901268) (not e!770089))))

(assert (=> b!1356517 (= res!901268 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31668))))

(assert (= (and start!114182 res!901272) b!1356510))

(assert (= (and b!1356510 res!901273) b!1356512))

(assert (= (and b!1356512 res!901267) b!1356516))

(assert (= (and b!1356516 res!901271) b!1356517))

(assert (= (and b!1356517 res!901268) b!1356511))

(assert (= (and b!1356511 res!901270) b!1356513))

(assert (= (and b!1356513 res!901269) b!1356514))

(assert (= (and b!1356514 res!901266) b!1356515))

(declare-fun m!1242505 () Bool)

(assert (=> b!1356512 m!1242505))

(declare-fun m!1242507 () Bool)

(assert (=> b!1356510 m!1242507))

(declare-fun m!1242509 () Bool)

(assert (=> b!1356516 m!1242509))

(declare-fun m!1242511 () Bool)

(assert (=> b!1356514 m!1242511))

(declare-fun m!1242513 () Bool)

(assert (=> start!114182 m!1242513))

(declare-fun m!1242515 () Bool)

(assert (=> b!1356517 m!1242515))

(declare-fun m!1242517 () Bool)

(assert (=> b!1356511 m!1242517))

(push 1)

(assert (not b!1356512))

(assert (not b!1356511))

(assert (not b!1356516))

(assert (not b!1356510))

(assert (not b!1356517))

(assert (not b!1356514))

(assert (not start!114182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

