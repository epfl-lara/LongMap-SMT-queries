; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62568 () Bool)

(assert start!62568)

(declare-fun b!705600 () Bool)

(declare-fun res!469578 () Bool)

(declare-fun e!397696 () Bool)

(assert (=> b!705600 (=> (not res!469578) (not e!397696))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705600 (= res!469578 (validKeyInArray!0 k!2824))))

(declare-fun b!705601 () Bool)

(declare-fun res!469573 () Bool)

(assert (=> b!705601 (=> (not res!469573) (not e!397696))))

(declare-datatypes ((List!13365 0))(
  ( (Nil!13362) (Cons!13361 (h!14406 (_ BitVec 64)) (t!19638 List!13365)) )
))
(declare-fun acc!652 () List!13365)

(declare-fun contains!3887 (List!13365 (_ BitVec 64)) Bool)

(assert (=> b!705601 (= res!469573 (not (contains!3887 acc!652 k!2824)))))

(declare-fun b!705602 () Bool)

(declare-fun res!469587 () Bool)

(assert (=> b!705602 (=> (not res!469587) (not e!397696))))

(declare-datatypes ((array!40258 0))(
  ( (array!40259 (arr!19285 (Array (_ BitVec 32) (_ BitVec 64))) (size!19667 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40258)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40258 (_ BitVec 32) List!13365) Bool)

(assert (=> b!705602 (= res!469587 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705603 () Bool)

(assert (=> b!705603 (= e!397696 (not true))))

(declare-fun newAcc!49 () List!13365)

(assert (=> b!705603 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24600 0))(
  ( (Unit!24601) )
))
(declare-fun lt!317670 () Unit!24600)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40258 (_ BitVec 64) (_ BitVec 32) List!13365 List!13365) Unit!24600)

(assert (=> b!705603 (= lt!317670 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705605 () Bool)

(declare-fun res!469583 () Bool)

(assert (=> b!705605 (=> (not res!469583) (not e!397696))))

(assert (=> b!705605 (= res!469583 (not (contains!3887 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705606 () Bool)

(declare-fun res!469586 () Bool)

(assert (=> b!705606 (=> (not res!469586) (not e!397696))))

(assert (=> b!705606 (= res!469586 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19667 a!3591)))))

(declare-fun b!705607 () Bool)

(declare-fun res!469588 () Bool)

(assert (=> b!705607 (=> (not res!469588) (not e!397696))))

(assert (=> b!705607 (= res!469588 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705608 () Bool)

(declare-fun res!469581 () Bool)

(assert (=> b!705608 (=> (not res!469581) (not e!397696))))

(declare-fun arrayContainsKey!0 (array!40258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705608 (= res!469581 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705609 () Bool)

(declare-fun res!469579 () Bool)

(assert (=> b!705609 (=> (not res!469579) (not e!397696))))

(assert (=> b!705609 (= res!469579 (contains!3887 newAcc!49 k!2824))))

(declare-fun b!705610 () Bool)

(declare-fun res!469571 () Bool)

(assert (=> b!705610 (=> (not res!469571) (not e!397696))))

(declare-fun noDuplicate!1156 (List!13365) Bool)

(assert (=> b!705610 (= res!469571 (noDuplicate!1156 acc!652))))

(declare-fun b!705611 () Bool)

(declare-fun res!469570 () Bool)

(assert (=> b!705611 (=> (not res!469570) (not e!397696))))

(assert (=> b!705611 (= res!469570 (not (validKeyInArray!0 (select (arr!19285 a!3591) from!2969))))))

(declare-fun b!705612 () Bool)

(declare-fun res!469575 () Bool)

(assert (=> b!705612 (=> (not res!469575) (not e!397696))))

(assert (=> b!705612 (= res!469575 (not (contains!3887 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705613 () Bool)

(declare-fun res!469580 () Bool)

(assert (=> b!705613 (=> (not res!469580) (not e!397696))))

(assert (=> b!705613 (= res!469580 (not (contains!3887 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705614 () Bool)

(declare-fun res!469577 () Bool)

(assert (=> b!705614 (=> (not res!469577) (not e!397696))))

(assert (=> b!705614 (= res!469577 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705604 () Bool)

(declare-fun res!469584 () Bool)

(assert (=> b!705604 (=> (not res!469584) (not e!397696))))

(assert (=> b!705604 (= res!469584 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun res!469576 () Bool)

(assert (=> start!62568 (=> (not res!469576) (not e!397696))))

(assert (=> start!62568 (= res!469576 (and (bvslt (size!19667 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19667 a!3591))))))

(assert (=> start!62568 e!397696))

(assert (=> start!62568 true))

(declare-fun array_inv!15168 (array!40258) Bool)

(assert (=> start!62568 (array_inv!15168 a!3591)))

(declare-fun b!705615 () Bool)

(declare-fun res!469585 () Bool)

(assert (=> b!705615 (=> (not res!469585) (not e!397696))))

(assert (=> b!705615 (= res!469585 (noDuplicate!1156 newAcc!49))))

(declare-fun b!705616 () Bool)

(declare-fun res!469574 () Bool)

(assert (=> b!705616 (=> (not res!469574) (not e!397696))))

(declare-fun -!314 (List!13365 (_ BitVec 64)) List!13365)

(assert (=> b!705616 (= res!469574 (= (-!314 newAcc!49 k!2824) acc!652))))

(declare-fun b!705617 () Bool)

(declare-fun res!469572 () Bool)

(assert (=> b!705617 (=> (not res!469572) (not e!397696))))

(declare-fun subseq!349 (List!13365 List!13365) Bool)

(assert (=> b!705617 (= res!469572 (subseq!349 acc!652 newAcc!49))))

(declare-fun b!705618 () Bool)

(declare-fun res!469582 () Bool)

(assert (=> b!705618 (=> (not res!469582) (not e!397696))))

(assert (=> b!705618 (= res!469582 (not (contains!3887 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62568 res!469576) b!705610))

(assert (= (and b!705610 res!469571) b!705615))

(assert (= (and b!705615 res!469585) b!705613))

(assert (= (and b!705613 res!469580) b!705612))

(assert (= (and b!705612 res!469575) b!705604))

(assert (= (and b!705604 res!469584) b!705601))

(assert (= (and b!705601 res!469573) b!705600))

(assert (= (and b!705600 res!469578) b!705602))

(assert (= (and b!705602 res!469587) b!705617))

(assert (= (and b!705617 res!469572) b!705609))

(assert (= (and b!705609 res!469579) b!705616))

(assert (= (and b!705616 res!469574) b!705618))

(assert (= (and b!705618 res!469582) b!705605))

(assert (= (and b!705605 res!469583) b!705606))

(assert (= (and b!705606 res!469586) b!705611))

(assert (= (and b!705611 res!469570) b!705614))

(assert (= (and b!705614 res!469577) b!705608))

(assert (= (and b!705608 res!469581) b!705607))

(assert (= (and b!705607 res!469588) b!705603))

(declare-fun m!663155 () Bool)

(assert (=> b!705610 m!663155))

(declare-fun m!663157 () Bool)

(assert (=> b!705616 m!663157))

(declare-fun m!663159 () Bool)

(assert (=> b!705600 m!663159))

(declare-fun m!663161 () Bool)

(assert (=> b!705618 m!663161))

(declare-fun m!663163 () Bool)

(assert (=> b!705609 m!663163))

(declare-fun m!663165 () Bool)

(assert (=> b!705613 m!663165))

(declare-fun m!663167 () Bool)

(assert (=> b!705617 m!663167))

(declare-fun m!663169 () Bool)

(assert (=> b!705601 m!663169))

(declare-fun m!663171 () Bool)

(assert (=> b!705607 m!663171))

(declare-fun m!663173 () Bool)

(assert (=> b!705612 m!663173))

(declare-fun m!663175 () Bool)

(assert (=> b!705611 m!663175))

(assert (=> b!705611 m!663175))

(declare-fun m!663177 () Bool)

(assert (=> b!705611 m!663177))

(declare-fun m!663179 () Bool)

(assert (=> b!705615 m!663179))

(declare-fun m!663181 () Bool)

(assert (=> b!705608 m!663181))

(declare-fun m!663183 () Bool)

(assert (=> b!705603 m!663183))

(declare-fun m!663185 () Bool)

(assert (=> b!705603 m!663185))

(declare-fun m!663187 () Bool)

(assert (=> b!705602 m!663187))

(declare-fun m!663189 () Bool)

(assert (=> b!705604 m!663189))

(declare-fun m!663191 () Bool)

(assert (=> start!62568 m!663191))

(declare-fun m!663193 () Bool)

(assert (=> b!705605 m!663193))

(push 1)

(assert (not b!705604))

(assert (not b!705618))

(assert (not b!705610))

(assert (not b!705611))

(assert (not b!705613))

(assert (not b!705608))

(assert (not start!62568))

(assert (not b!705601))

(assert (not b!705615))

(assert (not b!705617))

(assert (not b!705600))

(assert (not b!705616))

(assert (not b!705605))

(assert (not b!705607))

(assert (not b!705609))

(assert (not b!705603))

(assert (not b!705612))

(assert (not b!705602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

