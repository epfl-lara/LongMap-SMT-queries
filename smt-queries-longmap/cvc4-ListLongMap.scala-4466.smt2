; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62134 () Bool)

(assert start!62134)

(declare-fun b!695604 () Bool)

(declare-fun e!395581 () Bool)

(declare-fun e!395579 () Bool)

(assert (=> b!695604 (= e!395581 e!395579)))

(declare-fun res!459725 () Bool)

(assert (=> b!695604 (=> res!459725 e!395579)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695604 (= res!459725 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695605 () Bool)

(declare-fun res!459724 () Bool)

(assert (=> b!695605 (=> (not res!459724) (not e!395581))))

(declare-fun e!395577 () Bool)

(assert (=> b!695605 (= res!459724 e!395577)))

(declare-fun res!459729 () Bool)

(assert (=> b!695605 (=> res!459729 e!395577)))

(assert (=> b!695605 (= res!459729 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!459722 () Bool)

(assert (=> start!62134 (=> (not res!459722) (not e!395581))))

(declare-datatypes ((array!39935 0))(
  ( (array!39936 (arr!19128 (Array (_ BitVec 32) (_ BitVec 64))) (size!19510 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39935)

(assert (=> start!62134 (= res!459722 (and (bvslt (size!19510 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19510 a!3626))))))

(assert (=> start!62134 e!395581))

(assert (=> start!62134 true))

(declare-fun array_inv!15011 (array!39935) Bool)

(assert (=> start!62134 (array_inv!15011 a!3626)))

(declare-fun b!695606 () Bool)

(declare-datatypes ((List!13208 0))(
  ( (Nil!13205) (Cons!13204 (h!14249 (_ BitVec 64)) (t!19481 List!13208)) )
))
(declare-fun acc!681 () List!13208)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3730 (List!13208 (_ BitVec 64)) Bool)

(assert (=> b!695606 (= e!395579 (contains!3730 acc!681 k!2843))))

(declare-fun b!695607 () Bool)

(declare-fun res!459728 () Bool)

(assert (=> b!695607 (=> (not res!459728) (not e!395581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!695607 (= res!459728 (not (validKeyInArray!0 (select (arr!19128 a!3626) from!3004))))))

(declare-fun b!695608 () Bool)

(declare-fun res!459719 () Bool)

(assert (=> b!695608 (=> (not res!459719) (not e!395581))))

(declare-fun arrayContainsKey!0 (array!39935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!695608 (= res!459719 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!695609 () Bool)

(declare-fun res!459727 () Bool)

(assert (=> b!695609 (=> (not res!459727) (not e!395581))))

(assert (=> b!695609 (= res!459727 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19510 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!695610 () Bool)

(declare-fun e!395582 () Bool)

(assert (=> b!695610 (= e!395582 (not (contains!3730 acc!681 k!2843)))))

(declare-fun b!695611 () Bool)

(declare-fun e!395580 () Bool)

(assert (=> b!695611 (= e!395580 e!395582)))

(declare-fun res!459723 () Bool)

(assert (=> b!695611 (=> (not res!459723) (not e!395582))))

(assert (=> b!695611 (= res!459723 (bvsle from!3004 i!1382))))

(declare-fun b!695612 () Bool)

(declare-fun res!459726 () Bool)

(assert (=> b!695612 (=> (not res!459726) (not e!395581))))

(assert (=> b!695612 (= res!459726 (not (contains!3730 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695613 () Bool)

(declare-fun res!459721 () Bool)

(assert (=> b!695613 (=> (not res!459721) (not e!395581))))

(declare-fun arrayNoDuplicates!0 (array!39935 (_ BitVec 32) List!13208) Bool)

(assert (=> b!695613 (= res!459721 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13205))))

(declare-fun b!695614 () Bool)

(declare-fun res!459716 () Bool)

(assert (=> b!695614 (=> (not res!459716) (not e!395581))))

(declare-fun noDuplicate!999 (List!13208) Bool)

(assert (=> b!695614 (= res!459716 (noDuplicate!999 acc!681))))

(declare-fun b!695615 () Bool)

(declare-fun res!459730 () Bool)

(assert (=> b!695615 (=> (not res!459730) (not e!395581))))

(assert (=> b!695615 (= res!459730 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695616 () Bool)

(declare-fun res!459715 () Bool)

(assert (=> b!695616 (=> (not res!459715) (not e!395581))))

(assert (=> b!695616 (= res!459715 e!395580)))

(declare-fun res!459720 () Bool)

(assert (=> b!695616 (=> res!459720 e!395580)))

(declare-fun e!395576 () Bool)

(assert (=> b!695616 (= res!459720 e!395576)))

(declare-fun res!459718 () Bool)

(assert (=> b!695616 (=> (not res!459718) (not e!395576))))

(assert (=> b!695616 (= res!459718 (bvsgt from!3004 i!1382))))

(declare-fun b!695617 () Bool)

(assert (=> b!695617 (= e!395576 (contains!3730 acc!681 k!2843))))

(declare-fun b!695618 () Bool)

(assert (=> b!695618 (= e!395577 (not (contains!3730 acc!681 k!2843)))))

(declare-fun b!695619 () Bool)

(declare-fun res!459714 () Bool)

(assert (=> b!695619 (=> (not res!459714) (not e!395581))))

(assert (=> b!695619 (= res!459714 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19510 a!3626))))))

(declare-fun b!695620 () Bool)

(declare-fun res!459713 () Bool)

(assert (=> b!695620 (=> (not res!459713) (not e!395581))))

(assert (=> b!695620 (= res!459713 (not (contains!3730 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695621 () Bool)

(declare-fun res!459712 () Bool)

(assert (=> b!695621 (=> (not res!459712) (not e!395581))))

(assert (=> b!695621 (= res!459712 (validKeyInArray!0 k!2843))))

(declare-fun b!695622 () Bool)

(declare-fun res!459717 () Bool)

(assert (=> b!695622 (=> (not res!459717) (not e!395581))))

(assert (=> b!695622 (= res!459717 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (= (and start!62134 res!459722) b!695614))

(assert (= (and b!695614 res!459716) b!695620))

(assert (= (and b!695620 res!459713) b!695612))

(assert (= (and b!695612 res!459726) b!695616))

(assert (= (and b!695616 res!459718) b!695617))

(assert (= (and b!695616 (not res!459720)) b!695611))

(assert (= (and b!695611 res!459723) b!695610))

(assert (= (and b!695616 res!459715) b!695613))

(assert (= (and b!695613 res!459721) b!695615))

(assert (= (and b!695615 res!459730) b!695619))

(assert (= (and b!695619 res!459714) b!695621))

(assert (= (and b!695621 res!459712) b!695608))

(assert (= (and b!695608 res!459719) b!695609))

(assert (= (and b!695609 res!459727) b!695607))

(assert (= (and b!695607 res!459728) b!695622))

(assert (= (and b!695622 res!459717) b!695605))

(assert (= (and b!695605 (not res!459729)) b!695618))

(assert (= (and b!695605 res!459724) b!695604))

(assert (= (and b!695604 (not res!459725)) b!695606))

(declare-fun m!656383 () Bool)

(assert (=> b!695617 m!656383))

(declare-fun m!656385 () Bool)

(assert (=> start!62134 m!656385))

(assert (=> b!695610 m!656383))

(declare-fun m!656387 () Bool)

(assert (=> b!695621 m!656387))

(declare-fun m!656389 () Bool)

(assert (=> b!695612 m!656389))

(assert (=> b!695606 m!656383))

(declare-fun m!656391 () Bool)

(assert (=> b!695615 m!656391))

(declare-fun m!656393 () Bool)

(assert (=> b!695620 m!656393))

(declare-fun m!656395 () Bool)

(assert (=> b!695613 m!656395))

(assert (=> b!695618 m!656383))

(declare-fun m!656397 () Bool)

(assert (=> b!695607 m!656397))

(assert (=> b!695607 m!656397))

(declare-fun m!656399 () Bool)

(assert (=> b!695607 m!656399))

(declare-fun m!656401 () Bool)

(assert (=> b!695608 m!656401))

(declare-fun m!656403 () Bool)

(assert (=> b!695614 m!656403))

(push 1)

(assert (not b!695614))

(assert (not start!62134))

(assert (not b!695618))

(assert (not b!695606))

(assert (not b!695621))

(assert (not b!695612))

(assert (not b!695608))

(assert (not b!695617))

(assert (not b!695610))

(assert (not b!695620))

(assert (not b!695607))

(assert (not b!695613))

(assert (not b!695615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

