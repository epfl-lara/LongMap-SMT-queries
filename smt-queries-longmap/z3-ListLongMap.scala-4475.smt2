; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62278 () Bool)

(assert start!62278)

(declare-fun b!697800 () Bool)

(declare-fun res!461684 () Bool)

(declare-fun e!396683 () Bool)

(assert (=> b!697800 (=> (not res!461684) (not e!396683))))

(declare-datatypes ((List!13197 0))(
  ( (Nil!13194) (Cons!13193 (h!14238 (_ BitVec 64)) (t!19479 List!13197)) )
))
(declare-fun acc!681 () List!13197)

(declare-fun noDuplicate!1021 (List!13197) Bool)

(assert (=> b!697800 (= res!461684 (noDuplicate!1021 acc!681))))

(declare-fun b!697801 () Bool)

(declare-fun e!396681 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3774 (List!13197 (_ BitVec 64)) Bool)

(assert (=> b!697801 (= e!396681 (not (contains!3774 acc!681 k0!2843)))))

(declare-fun res!461681 () Bool)

(assert (=> start!62278 (=> (not res!461681) (not e!396683))))

(declare-datatypes ((array!39996 0))(
  ( (array!39997 (arr!19156 (Array (_ BitVec 32) (_ BitVec 64))) (size!19541 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39996)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62278 (= res!461681 (and (bvslt (size!19541 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19541 a!3626))))))

(assert (=> start!62278 e!396683))

(assert (=> start!62278 true))

(declare-fun array_inv!14952 (array!39996) Bool)

(assert (=> start!62278 (array_inv!14952 a!3626)))

(declare-fun b!697802 () Bool)

(assert (=> b!697802 (= e!396683 false)))

(declare-fun lt!317194 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39996 (_ BitVec 32) List!13197) Bool)

(assert (=> b!697802 (= lt!317194 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697803 () Bool)

(declare-fun e!396684 () Bool)

(assert (=> b!697803 (= e!396684 (contains!3774 acc!681 k0!2843))))

(declare-fun b!697804 () Bool)

(declare-fun res!461677 () Bool)

(assert (=> b!697804 (=> (not res!461677) (not e!396683))))

(declare-fun e!396680 () Bool)

(assert (=> b!697804 (= res!461677 e!396680)))

(declare-fun res!461679 () Bool)

(assert (=> b!697804 (=> res!461679 e!396680)))

(assert (=> b!697804 (= res!461679 e!396684)))

(declare-fun res!461678 () Bool)

(assert (=> b!697804 (=> (not res!461678) (not e!396684))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697804 (= res!461678 (bvsgt from!3004 i!1382))))

(declare-fun b!697805 () Bool)

(declare-fun res!461683 () Bool)

(assert (=> b!697805 (=> (not res!461683) (not e!396683))))

(assert (=> b!697805 (= res!461683 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13194))))

(declare-fun b!697806 () Bool)

(assert (=> b!697806 (= e!396680 e!396681)))

(declare-fun res!461676 () Bool)

(assert (=> b!697806 (=> (not res!461676) (not e!396681))))

(assert (=> b!697806 (= res!461676 (bvsle from!3004 i!1382))))

(declare-fun b!697807 () Bool)

(declare-fun res!461680 () Bool)

(assert (=> b!697807 (=> (not res!461680) (not e!396683))))

(assert (=> b!697807 (= res!461680 (not (contains!3774 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697808 () Bool)

(declare-fun res!461682 () Bool)

(assert (=> b!697808 (=> (not res!461682) (not e!396683))))

(assert (=> b!697808 (= res!461682 (not (contains!3774 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62278 res!461681) b!697800))

(assert (= (and b!697800 res!461684) b!697807))

(assert (= (and b!697807 res!461680) b!697808))

(assert (= (and b!697808 res!461682) b!697804))

(assert (= (and b!697804 res!461678) b!697803))

(assert (= (and b!697804 (not res!461679)) b!697806))

(assert (= (and b!697806 res!461676) b!697801))

(assert (= (and b!697804 res!461677) b!697805))

(assert (= (and b!697805 res!461683) b!697802))

(declare-fun m!658135 () Bool)

(assert (=> b!697802 m!658135))

(declare-fun m!658137 () Bool)

(assert (=> b!697800 m!658137))

(declare-fun m!658139 () Bool)

(assert (=> b!697801 m!658139))

(declare-fun m!658141 () Bool)

(assert (=> start!62278 m!658141))

(declare-fun m!658143 () Bool)

(assert (=> b!697805 m!658143))

(assert (=> b!697803 m!658139))

(declare-fun m!658145 () Bool)

(assert (=> b!697808 m!658145))

(declare-fun m!658147 () Bool)

(assert (=> b!697807 m!658147))

(check-sat (not b!697802) (not b!697808) (not b!697805) (not b!697801) (not b!697803) (not b!697800) (not start!62278) (not b!697807))
