; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114186 () Bool)

(assert start!114186)

(declare-fun res!901289 () Bool)

(declare-fun e!770067 () Bool)

(assert (=> start!114186 (=> (not res!901289) (not e!770067))))

(declare-datatypes ((array!92317 0))(
  ( (array!92318 (arr!44607 (Array (_ BitVec 32) (_ BitVec 64))) (size!45159 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92317)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114186 (= res!901289 (and (bvslt (size!45159 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45159 a!3742))))))

(assert (=> start!114186 e!770067))

(assert (=> start!114186 true))

(declare-fun array_inv!33840 (array!92317) Bool)

(assert (=> start!114186 (array_inv!33840 a!3742)))

(declare-fun b!1356488 () Bool)

(declare-fun res!901292 () Bool)

(assert (=> b!1356488 (=> (not res!901292) (not e!770067))))

(declare-datatypes ((List!31726 0))(
  ( (Nil!31723) (Cons!31722 (h!32931 (_ BitVec 64)) (t!46376 List!31726)) )
))
(declare-fun acc!759 () List!31726)

(declare-fun contains!9346 (List!31726 (_ BitVec 64)) Bool)

(assert (=> b!1356488 (= res!901292 (not (contains!9346 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356489 () Bool)

(declare-fun res!901287 () Bool)

(assert (=> b!1356489 (=> (not res!901287) (not e!770067))))

(assert (=> b!1356489 (= res!901287 (not (contains!9346 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356490 () Bool)

(declare-fun res!901291 () Bool)

(assert (=> b!1356490 (=> (not res!901291) (not e!770067))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356490 (= res!901291 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45159 a!3742))))))

(declare-fun b!1356491 () Bool)

(declare-fun res!901286 () Bool)

(assert (=> b!1356491 (=> (not res!901286) (not e!770067))))

(declare-fun noDuplicate!2261 (List!31726) Bool)

(assert (=> b!1356491 (= res!901286 (noDuplicate!2261 acc!759))))

(declare-fun b!1356492 () Bool)

(declare-fun res!901288 () Bool)

(assert (=> b!1356492 (=> (not res!901288) (not e!770067))))

(declare-fun arrayNoDuplicates!0 (array!92317 (_ BitVec 32) List!31726) Bool)

(assert (=> b!1356492 (= res!901288 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356493 () Bool)

(declare-fun res!901285 () Bool)

(assert (=> b!1356493 (=> (not res!901285) (not e!770067))))

(assert (=> b!1356493 (= res!901285 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31723))))

(declare-fun b!1356494 () Bool)

(declare-fun res!901290 () Bool)

(assert (=> b!1356494 (=> (not res!901290) (not e!770067))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356494 (= res!901290 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356495 () Bool)

(assert (=> b!1356495 (= e!770067 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45159 a!3742)) (bvsgt from!3120 (size!45159 a!3742))))))

(assert (= (and start!114186 res!901289) b!1356491))

(assert (= (and b!1356491 res!901286) b!1356488))

(assert (= (and b!1356488 res!901292) b!1356489))

(assert (= (and b!1356489 res!901287) b!1356493))

(assert (= (and b!1356493 res!901285) b!1356492))

(assert (= (and b!1356492 res!901288) b!1356490))

(assert (= (and b!1356490 res!901291) b!1356494))

(assert (= (and b!1356494 res!901290) b!1356495))

(declare-fun m!1242017 () Bool)

(assert (=> start!114186 m!1242017))

(declare-fun m!1242019 () Bool)

(assert (=> b!1356488 m!1242019))

(declare-fun m!1242021 () Bool)

(assert (=> b!1356489 m!1242021))

(declare-fun m!1242023 () Bool)

(assert (=> b!1356494 m!1242023))

(declare-fun m!1242025 () Bool)

(assert (=> b!1356493 m!1242025))

(declare-fun m!1242027 () Bool)

(assert (=> b!1356491 m!1242027))

(declare-fun m!1242029 () Bool)

(assert (=> b!1356492 m!1242029))

(push 1)

(assert (not b!1356488))

(assert (not start!114186))

(assert (not b!1356492))

(assert (not b!1356489))

(assert (not b!1356493))

(assert (not b!1356494))

(assert (not b!1356491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

