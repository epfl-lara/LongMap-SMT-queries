; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62570 () Bool)

(assert start!62570)

(declare-fun b!705603 () Bool)

(declare-fun res!469426 () Bool)

(declare-fun e!397849 () Bool)

(assert (=> b!705603 (=> (not res!469426) (not e!397849))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13322 0))(
  ( (Nil!13319) (Cons!13318 (h!14363 (_ BitVec 64)) (t!19604 List!13322)) )
))
(declare-fun acc!652 () List!13322)

(declare-datatypes ((array!40249 0))(
  ( (array!40250 (arr!19281 (Array (_ BitVec 32) (_ BitVec 64))) (size!19666 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40249)

(declare-fun arrayNoDuplicates!0 (array!40249 (_ BitVec 32) List!13322) Bool)

(assert (=> b!705603 (= res!469426 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!469419 () Bool)

(assert (=> start!62570 (=> (not res!469419) (not e!397849))))

(assert (=> start!62570 (= res!469419 (and (bvslt (size!19666 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19666 a!3591))))))

(assert (=> start!62570 e!397849))

(assert (=> start!62570 true))

(declare-fun array_inv!15077 (array!40249) Bool)

(assert (=> start!62570 (array_inv!15077 a!3591)))

(declare-fun b!705604 () Bool)

(declare-fun res!469416 () Bool)

(assert (=> b!705604 (=> (not res!469416) (not e!397849))))

(declare-fun newAcc!49 () List!13322)

(declare-fun noDuplicate!1146 (List!13322) Bool)

(assert (=> b!705604 (= res!469416 (noDuplicate!1146 newAcc!49))))

(declare-fun b!705605 () Bool)

(declare-fun res!469431 () Bool)

(assert (=> b!705605 (=> (not res!469431) (not e!397849))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705605 (= res!469431 (validKeyInArray!0 k!2824))))

(declare-fun b!705606 () Bool)

(declare-fun res!469421 () Bool)

(assert (=> b!705606 (=> (not res!469421) (not e!397849))))

(declare-fun arrayContainsKey!0 (array!40249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705606 (= res!469421 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705607 () Bool)

(declare-fun res!469424 () Bool)

(assert (=> b!705607 (=> (not res!469424) (not e!397849))))

(assert (=> b!705607 (= res!469424 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705608 () Bool)

(declare-fun res!469425 () Bool)

(assert (=> b!705608 (=> (not res!469425) (not e!397849))))

(assert (=> b!705608 (= res!469425 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705609 () Bool)

(declare-fun res!469428 () Bool)

(assert (=> b!705609 (=> (not res!469428) (not e!397849))))

(declare-fun contains!3899 (List!13322 (_ BitVec 64)) Bool)

(assert (=> b!705609 (= res!469428 (not (contains!3899 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705610 () Bool)

(declare-fun res!469414 () Bool)

(assert (=> b!705610 (=> (not res!469414) (not e!397849))))

(assert (=> b!705610 (= res!469414 (not (contains!3899 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705611 () Bool)

(declare-fun res!469418 () Bool)

(assert (=> b!705611 (=> (not res!469418) (not e!397849))))

(assert (=> b!705611 (= res!469418 (not (contains!3899 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705612 () Bool)

(declare-fun res!469420 () Bool)

(assert (=> b!705612 (=> (not res!469420) (not e!397849))))

(assert (=> b!705612 (= res!469420 (not (contains!3899 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705613 () Bool)

(declare-fun res!469417 () Bool)

(assert (=> b!705613 (=> (not res!469417) (not e!397849))))

(assert (=> b!705613 (= res!469417 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705614 () Bool)

(declare-fun res!469429 () Bool)

(assert (=> b!705614 (=> (not res!469429) (not e!397849))))

(assert (=> b!705614 (= res!469429 (contains!3899 newAcc!49 k!2824))))

(declare-fun b!705615 () Bool)

(declare-fun res!469422 () Bool)

(assert (=> b!705615 (=> (not res!469422) (not e!397849))))

(assert (=> b!705615 (= res!469422 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19666 a!3591)))))

(declare-fun b!705616 () Bool)

(declare-fun res!469427 () Bool)

(assert (=> b!705616 (=> (not res!469427) (not e!397849))))

(assert (=> b!705616 (= res!469427 (not (validKeyInArray!0 (select (arr!19281 a!3591) from!2969))))))

(declare-fun b!705617 () Bool)

(declare-fun res!469423 () Bool)

(assert (=> b!705617 (=> (not res!469423) (not e!397849))))

(declare-fun subseq!344 (List!13322 List!13322) Bool)

(assert (=> b!705617 (= res!469423 (subseq!344 acc!652 newAcc!49))))

(declare-fun b!705618 () Bool)

(declare-fun res!469413 () Bool)

(assert (=> b!705618 (=> (not res!469413) (not e!397849))))

(declare-fun -!309 (List!13322 (_ BitVec 64)) List!13322)

(assert (=> b!705618 (= res!469413 (= (-!309 newAcc!49 k!2824) acc!652))))

(declare-fun b!705619 () Bool)

(declare-fun res!469430 () Bool)

(assert (=> b!705619 (=> (not res!469430) (not e!397849))))

(assert (=> b!705619 (= res!469430 (not (contains!3899 acc!652 k!2824)))))

(declare-fun b!705620 () Bool)

(assert (=> b!705620 (= e!397849 (not true))))

(assert (=> b!705620 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24612 0))(
  ( (Unit!24613) )
))
(declare-fun lt!317907 () Unit!24612)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40249 (_ BitVec 64) (_ BitVec 32) List!13322 List!13322) Unit!24612)

(assert (=> b!705620 (= lt!317907 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705621 () Bool)

(declare-fun res!469415 () Bool)

(assert (=> b!705621 (=> (not res!469415) (not e!397849))))

(assert (=> b!705621 (= res!469415 (noDuplicate!1146 acc!652))))

(assert (= (and start!62570 res!469419) b!705621))

(assert (= (and b!705621 res!469415) b!705604))

(assert (= (and b!705604 res!469416) b!705612))

(assert (= (and b!705612 res!469420) b!705610))

(assert (= (and b!705610 res!469414) b!705608))

(assert (= (and b!705608 res!469425) b!705619))

(assert (= (and b!705619 res!469430) b!705605))

(assert (= (and b!705605 res!469431) b!705603))

(assert (= (and b!705603 res!469426) b!705617))

(assert (= (and b!705617 res!469423) b!705614))

(assert (= (and b!705614 res!469429) b!705618))

(assert (= (and b!705618 res!469413) b!705611))

(assert (= (and b!705611 res!469418) b!705609))

(assert (= (and b!705609 res!469428) b!705615))

(assert (= (and b!705615 res!469422) b!705616))

(assert (= (and b!705616 res!469427) b!705607))

(assert (= (and b!705607 res!469424) b!705606))

(assert (= (and b!705606 res!469421) b!705613))

(assert (= (and b!705613 res!469417) b!705620))

(declare-fun m!663715 () Bool)

(assert (=> b!705610 m!663715))

(declare-fun m!663717 () Bool)

(assert (=> b!705612 m!663717))

(declare-fun m!663719 () Bool)

(assert (=> b!705613 m!663719))

(declare-fun m!663721 () Bool)

(assert (=> b!705608 m!663721))

(declare-fun m!663723 () Bool)

(assert (=> b!705611 m!663723))

(declare-fun m!663725 () Bool)

(assert (=> b!705619 m!663725))

(declare-fun m!663727 () Bool)

(assert (=> b!705618 m!663727))

(declare-fun m!663729 () Bool)

(assert (=> b!705620 m!663729))

(declare-fun m!663731 () Bool)

(assert (=> b!705620 m!663731))

(declare-fun m!663733 () Bool)

(assert (=> b!705614 m!663733))

(declare-fun m!663735 () Bool)

(assert (=> b!705606 m!663735))

(declare-fun m!663737 () Bool)

(assert (=> b!705617 m!663737))

(declare-fun m!663739 () Bool)

(assert (=> b!705605 m!663739))

(declare-fun m!663741 () Bool)

(assert (=> start!62570 m!663741))

(declare-fun m!663743 () Bool)

(assert (=> b!705604 m!663743))

(declare-fun m!663745 () Bool)

(assert (=> b!705609 m!663745))

(declare-fun m!663747 () Bool)

(assert (=> b!705616 m!663747))

(assert (=> b!705616 m!663747))

(declare-fun m!663749 () Bool)

(assert (=> b!705616 m!663749))

(declare-fun m!663751 () Bool)

(assert (=> b!705603 m!663751))

(declare-fun m!663753 () Bool)

(assert (=> b!705621 m!663753))

(push 1)

(assert (not b!705616))

(assert (not b!705605))

(assert (not b!705610))

(assert (not b!705617))

(assert (not start!62570))

(assert (not b!705606))

(assert (not b!705619))

(assert (not b!705609))

(assert (not b!705620))

(assert (not b!705604))

(assert (not b!705618))

(assert (not b!705603))

(assert (not b!705611))

(assert (not b!705613))

(assert (not b!705612))

(assert (not b!705608))

(assert (not b!705621))

(assert (not b!705614))

(check-sat)

(pop 1)

