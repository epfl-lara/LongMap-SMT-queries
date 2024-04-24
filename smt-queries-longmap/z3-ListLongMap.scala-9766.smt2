; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115942 () Bool)

(assert start!115942)

(declare-fun b!1369677 () Bool)

(declare-fun res!912412 () Bool)

(declare-fun e!776160 () Bool)

(assert (=> b!1369677 (=> (not res!912412) (not e!776160))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1369677 (= res!912412 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369678 () Bool)

(declare-fun e!776159 () Bool)

(assert (=> b!1369678 (= e!776159 e!776160)))

(declare-fun res!912407 () Bool)

(assert (=> b!1369678 (=> (not res!912407) (not e!776160))))

(declare-datatypes ((array!93025 0))(
  ( (array!93026 (arr!44932 (Array (_ BitVec 32) (_ BitVec 64))) (size!45483 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93025)

(declare-datatypes ((List!31987 0))(
  ( (Nil!31984) (Cons!31983 (h!33201 (_ BitVec 64)) (t!46673 List!31987)) )
))
(declare-fun acc!866 () List!31987)

(declare-fun arrayNoDuplicates!0 (array!93025 (_ BitVec 32) List!31987) Bool)

(assert (=> b!1369678 (= res!912407 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45134 0))(
  ( (Unit!45135) )
))
(declare-fun lt!602531 () Unit!45134)

(declare-fun newAcc!98 () List!31987)

(declare-fun noDuplicateSubseq!218 (List!31987 List!31987) Unit!45134)

(assert (=> b!1369678 (= lt!602531 (noDuplicateSubseq!218 newAcc!98 acc!866))))

(declare-fun res!912408 () Bool)

(assert (=> start!115942 (=> (not res!912408) (not e!776159))))

(assert (=> start!115942 (= res!912408 (and (bvslt (size!45483 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45483 a!3861))))))

(assert (=> start!115942 e!776159))

(declare-fun array_inv!34213 (array!93025) Bool)

(assert (=> start!115942 (array_inv!34213 a!3861)))

(assert (=> start!115942 true))

(declare-fun b!1369679 () Bool)

(declare-fun res!912406 () Bool)

(assert (=> b!1369679 (=> (not res!912406) (not e!776159))))

(declare-fun subseq!1031 (List!31987 List!31987) Bool)

(assert (=> b!1369679 (= res!912406 (subseq!1031 newAcc!98 acc!866))))

(declare-fun b!1369680 () Bool)

(declare-fun res!912404 () Bool)

(assert (=> b!1369680 (=> (not res!912404) (not e!776159))))

(declare-fun contains!9672 (List!31987 (_ BitVec 64)) Bool)

(assert (=> b!1369680 (= res!912404 (not (contains!9672 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369681 () Bool)

(declare-fun res!912413 () Bool)

(assert (=> b!1369681 (=> (not res!912413) (not e!776159))))

(assert (=> b!1369681 (= res!912413 (not (contains!9672 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369682 () Bool)

(declare-fun res!912411 () Bool)

(assert (=> b!1369682 (=> (not res!912411) (not e!776160))))

(assert (=> b!1369682 (= res!912411 (bvslt from!3239 (size!45483 a!3861)))))

(declare-fun b!1369683 () Bool)

(declare-fun res!912405 () Bool)

(assert (=> b!1369683 (=> (not res!912405) (not e!776159))))

(assert (=> b!1369683 (= res!912405 (not (contains!9672 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369684 () Bool)

(declare-fun res!912410 () Bool)

(assert (=> b!1369684 (=> (not res!912410) (not e!776159))))

(declare-fun noDuplicate!2503 (List!31987) Bool)

(assert (=> b!1369684 (= res!912410 (noDuplicate!2503 acc!866))))

(declare-fun b!1369685 () Bool)

(declare-fun res!912414 () Bool)

(assert (=> b!1369685 (=> (not res!912414) (not e!776159))))

(assert (=> b!1369685 (= res!912414 (not (contains!9672 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369686 () Bool)

(assert (=> b!1369686 (= e!776160 false)))

(declare-fun lt!602532 () Bool)

(assert (=> b!1369686 (= lt!602532 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369687 () Bool)

(declare-fun res!912409 () Bool)

(assert (=> b!1369687 (=> (not res!912409) (not e!776160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369687 (= res!912409 (not (validKeyInArray!0 (select (arr!44932 a!3861) from!3239))))))

(assert (= (and start!115942 res!912408) b!1369684))

(assert (= (and b!1369684 res!912410) b!1369683))

(assert (= (and b!1369683 res!912405) b!1369681))

(assert (= (and b!1369681 res!912413) b!1369685))

(assert (= (and b!1369685 res!912414) b!1369680))

(assert (= (and b!1369680 res!912404) b!1369679))

(assert (= (and b!1369679 res!912406) b!1369678))

(assert (= (and b!1369678 res!912407) b!1369682))

(assert (= (and b!1369682 res!912411) b!1369687))

(assert (= (and b!1369687 res!912409) b!1369677))

(assert (= (and b!1369677 res!912412) b!1369686))

(declare-fun m!1253959 () Bool)

(assert (=> b!1369680 m!1253959))

(declare-fun m!1253961 () Bool)

(assert (=> b!1369681 m!1253961))

(declare-fun m!1253963 () Bool)

(assert (=> b!1369687 m!1253963))

(assert (=> b!1369687 m!1253963))

(declare-fun m!1253965 () Bool)

(assert (=> b!1369687 m!1253965))

(declare-fun m!1253967 () Bool)

(assert (=> b!1369685 m!1253967))

(declare-fun m!1253969 () Bool)

(assert (=> start!115942 m!1253969))

(declare-fun m!1253971 () Bool)

(assert (=> b!1369686 m!1253971))

(declare-fun m!1253973 () Bool)

(assert (=> b!1369678 m!1253973))

(declare-fun m!1253975 () Bool)

(assert (=> b!1369678 m!1253975))

(declare-fun m!1253977 () Bool)

(assert (=> b!1369683 m!1253977))

(declare-fun m!1253979 () Bool)

(assert (=> b!1369684 m!1253979))

(declare-fun m!1253981 () Bool)

(assert (=> b!1369679 m!1253981))

(check-sat (not b!1369679) (not b!1369678) (not start!115942) (not b!1369681) (not b!1369684) (not b!1369685) (not b!1369687) (not b!1369686) (not b!1369680) (not b!1369683))
(check-sat)
