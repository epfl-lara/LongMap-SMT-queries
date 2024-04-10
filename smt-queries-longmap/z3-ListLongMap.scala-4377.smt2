; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60292 () Bool)

(assert start!60292)

(declare-fun b!676594 () Bool)

(declare-fun e!385847 () Bool)

(declare-datatypes ((List!12903 0))(
  ( (Nil!12900) (Cons!12899 (h!13944 (_ BitVec 64)) (t!19131 List!12903)) )
))
(declare-fun acc!681 () List!12903)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3480 (List!12903 (_ BitVec 64)) Bool)

(assert (=> b!676594 (= e!385847 (contains!3480 acc!681 k0!2843))))

(declare-fun b!676595 () Bool)

(declare-fun e!385849 () Bool)

(declare-fun e!385851 () Bool)

(assert (=> b!676595 (= e!385849 e!385851)))

(declare-fun res!443031 () Bool)

(assert (=> b!676595 (=> (not res!443031) (not e!385851))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676595 (= res!443031 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676596 () Bool)

(declare-fun e!385854 () Bool)

(declare-fun e!385852 () Bool)

(assert (=> b!676596 (= e!385854 e!385852)))

(declare-fun res!443030 () Bool)

(assert (=> b!676596 (=> (not res!443030) (not e!385852))))

(assert (=> b!676596 (= res!443030 (bvsle from!3004 i!1382))))

(declare-fun b!676597 () Bool)

(declare-fun e!385848 () Bool)

(assert (=> b!676597 (= e!385848 false)))

(declare-fun lt!312784 () Bool)

(declare-datatypes ((array!39339 0))(
  ( (array!39340 (arr!18862 (Array (_ BitVec 32) (_ BitVec 64))) (size!19226 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39339)

(declare-fun arrayNoDuplicates!0 (array!39339 (_ BitVec 32) List!12903) Bool)

(assert (=> b!676597 (= lt!312784 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676598 () Bool)

(declare-fun res!443038 () Bool)

(assert (=> b!676598 (=> (not res!443038) (not e!385848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676598 (= res!443038 (validKeyInArray!0 k0!2843))))

(declare-fun b!676599 () Bool)

(declare-fun res!443029 () Bool)

(assert (=> b!676599 (=> (not res!443029) (not e!385848))))

(assert (=> b!676599 (= res!443029 (not (contains!3480 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676600 () Bool)

(declare-fun res!443035 () Bool)

(assert (=> b!676600 (=> (not res!443035) (not e!385848))))

(assert (=> b!676600 (= res!443035 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676601 () Bool)

(declare-fun e!385853 () Bool)

(assert (=> b!676601 (= e!385853 (contains!3480 acc!681 k0!2843))))

(declare-fun b!676602 () Bool)

(declare-fun res!443023 () Bool)

(assert (=> b!676602 (=> (not res!443023) (not e!385848))))

(assert (=> b!676602 (= res!443023 e!385854)))

(declare-fun res!443039 () Bool)

(assert (=> b!676602 (=> res!443039 e!385854)))

(assert (=> b!676602 (= res!443039 e!385847)))

(declare-fun res!443020 () Bool)

(assert (=> b!676602 (=> (not res!443020) (not e!385847))))

(assert (=> b!676602 (= res!443020 (bvsgt from!3004 i!1382))))

(declare-fun b!676603 () Bool)

(declare-fun res!443021 () Bool)

(assert (=> b!676603 (=> (not res!443021) (not e!385848))))

(assert (=> b!676603 (= res!443021 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19226 a!3626))))))

(declare-fun b!676604 () Bool)

(assert (=> b!676604 (= e!385851 (not (contains!3480 acc!681 k0!2843)))))

(declare-fun b!676605 () Bool)

(declare-fun res!443026 () Bool)

(assert (=> b!676605 (=> (not res!443026) (not e!385848))))

(assert (=> b!676605 (= res!443026 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676606 () Bool)

(declare-fun res!443024 () Bool)

(assert (=> b!676606 (=> (not res!443024) (not e!385848))))

(declare-fun arrayContainsKey!0 (array!39339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676606 (= res!443024 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676607 () Bool)

(assert (=> b!676607 (= e!385852 (not (contains!3480 acc!681 k0!2843)))))

(declare-fun b!676608 () Bool)

(declare-fun res!443022 () Bool)

(assert (=> b!676608 (=> (not res!443022) (not e!385848))))

(assert (=> b!676608 (= res!443022 e!385849)))

(declare-fun res!443028 () Bool)

(assert (=> b!676608 (=> res!443028 e!385849)))

(assert (=> b!676608 (= res!443028 e!385853)))

(declare-fun res!443027 () Bool)

(assert (=> b!676608 (=> (not res!443027) (not e!385853))))

(assert (=> b!676608 (= res!443027 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676609 () Bool)

(declare-fun res!443025 () Bool)

(assert (=> b!676609 (=> (not res!443025) (not e!385848))))

(assert (=> b!676609 (= res!443025 (not (validKeyInArray!0 (select (arr!18862 a!3626) from!3004))))))

(declare-fun b!676610 () Bool)

(declare-fun res!443032 () Bool)

(assert (=> b!676610 (=> (not res!443032) (not e!385848))))

(assert (=> b!676610 (= res!443032 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19226 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676611 () Bool)

(declare-fun res!443033 () Bool)

(assert (=> b!676611 (=> (not res!443033) (not e!385848))))

(assert (=> b!676611 (= res!443033 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12900))))

(declare-fun b!676612 () Bool)

(declare-fun res!443036 () Bool)

(assert (=> b!676612 (=> (not res!443036) (not e!385848))))

(declare-fun noDuplicate!727 (List!12903) Bool)

(assert (=> b!676612 (= res!443036 (noDuplicate!727 acc!681))))

(declare-fun res!443034 () Bool)

(assert (=> start!60292 (=> (not res!443034) (not e!385848))))

(assert (=> start!60292 (= res!443034 (and (bvslt (size!19226 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19226 a!3626))))))

(assert (=> start!60292 e!385848))

(assert (=> start!60292 true))

(declare-fun array_inv!14658 (array!39339) Bool)

(assert (=> start!60292 (array_inv!14658 a!3626)))

(declare-fun b!676613 () Bool)

(declare-fun res!443037 () Bool)

(assert (=> b!676613 (=> (not res!443037) (not e!385848))))

(assert (=> b!676613 (= res!443037 (not (contains!3480 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60292 res!443034) b!676612))

(assert (= (and b!676612 res!443036) b!676613))

(assert (= (and b!676613 res!443037) b!676599))

(assert (= (and b!676599 res!443029) b!676602))

(assert (= (and b!676602 res!443020) b!676594))

(assert (= (and b!676602 (not res!443039)) b!676596))

(assert (= (and b!676596 res!443030) b!676607))

(assert (= (and b!676602 res!443023) b!676611))

(assert (= (and b!676611 res!443033) b!676605))

(assert (= (and b!676605 res!443026) b!676603))

(assert (= (and b!676603 res!443021) b!676598))

(assert (= (and b!676598 res!443038) b!676606))

(assert (= (and b!676606 res!443024) b!676610))

(assert (= (and b!676610 res!443032) b!676609))

(assert (= (and b!676609 res!443025) b!676600))

(assert (= (and b!676600 res!443035) b!676608))

(assert (= (and b!676608 res!443027) b!676601))

(assert (= (and b!676608 (not res!443028)) b!676595))

(assert (= (and b!676595 res!443031) b!676604))

(assert (= (and b!676608 res!443022) b!676597))

(declare-fun m!643355 () Bool)

(assert (=> b!676606 m!643355))

(declare-fun m!643357 () Bool)

(assert (=> b!676601 m!643357))

(declare-fun m!643359 () Bool)

(assert (=> b!676598 m!643359))

(declare-fun m!643361 () Bool)

(assert (=> b!676599 m!643361))

(assert (=> b!676607 m!643357))

(declare-fun m!643363 () Bool)

(assert (=> b!676611 m!643363))

(assert (=> b!676604 m!643357))

(declare-fun m!643365 () Bool)

(assert (=> b!676613 m!643365))

(declare-fun m!643367 () Bool)

(assert (=> b!676612 m!643367))

(declare-fun m!643369 () Bool)

(assert (=> b!676609 m!643369))

(assert (=> b!676609 m!643369))

(declare-fun m!643371 () Bool)

(assert (=> b!676609 m!643371))

(declare-fun m!643373 () Bool)

(assert (=> start!60292 m!643373))

(declare-fun m!643375 () Bool)

(assert (=> b!676597 m!643375))

(assert (=> b!676594 m!643357))

(declare-fun m!643377 () Bool)

(assert (=> b!676605 m!643377))

(check-sat (not b!676601) (not b!676605) (not b!676594) (not b!676597) (not b!676606) (not start!60292) (not b!676613) (not b!676609) (not b!676604) (not b!676598) (not b!676607) (not b!676612) (not b!676599) (not b!676611))
