; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115858 () Bool)

(assert start!115858)

(declare-fun b!1369610 () Bool)

(declare-fun res!913118 () Bool)

(declare-fun e!775857 () Bool)

(assert (=> b!1369610 (=> (not res!913118) (not e!775857))))

(declare-datatypes ((List!32033 0))(
  ( (Nil!32030) (Cons!32029 (h!33238 (_ BitVec 64)) (t!46719 List!32033)) )
))
(declare-fun acc!866 () List!32033)

(declare-fun contains!9626 (List!32033 (_ BitVec 64)) Bool)

(assert (=> b!1369610 (= res!913118 (not (contains!9626 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369611 () Bool)

(assert (=> b!1369611 (= e!775857 false)))

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602130 () Bool)

(declare-datatypes ((array!92931 0))(
  ( (array!92932 (arr!44887 (Array (_ BitVec 32) (_ BitVec 64))) (size!45439 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92931)

(declare-fun arrayNoDuplicates!0 (array!92931 (_ BitVec 32) List!32033) Bool)

(assert (=> b!1369611 (= lt!602130 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45102 0))(
  ( (Unit!45103) )
))
(declare-fun lt!602129 () Unit!45102)

(declare-fun newAcc!98 () List!32033)

(declare-fun noDuplicateSubseq!251 (List!32033 List!32033) Unit!45102)

(assert (=> b!1369611 (= lt!602129 (noDuplicateSubseq!251 newAcc!98 acc!866))))

(declare-fun b!1369612 () Bool)

(declare-fun res!913115 () Bool)

(assert (=> b!1369612 (=> (not res!913115) (not e!775857))))

(assert (=> b!1369612 (= res!913115 (not (contains!9626 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913117 () Bool)

(assert (=> start!115858 (=> (not res!913117) (not e!775857))))

(assert (=> start!115858 (= res!913117 (and (bvslt (size!45439 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45439 a!3861))))))

(assert (=> start!115858 e!775857))

(declare-fun array_inv!34120 (array!92931) Bool)

(assert (=> start!115858 (array_inv!34120 a!3861)))

(assert (=> start!115858 true))

(declare-fun b!1369609 () Bool)

(declare-fun res!913112 () Bool)

(assert (=> b!1369609 (=> (not res!913112) (not e!775857))))

(assert (=> b!1369609 (= res!913112 (not (contains!9626 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369613 () Bool)

(declare-fun res!913113 () Bool)

(assert (=> b!1369613 (=> (not res!913113) (not e!775857))))

(assert (=> b!1369613 (= res!913113 (not (contains!9626 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369614 () Bool)

(declare-fun res!913116 () Bool)

(assert (=> b!1369614 (=> (not res!913116) (not e!775857))))

(declare-fun noDuplicate!2541 (List!32033) Bool)

(assert (=> b!1369614 (= res!913116 (noDuplicate!2541 acc!866))))

(declare-fun b!1369615 () Bool)

(declare-fun res!913114 () Bool)

(assert (=> b!1369615 (=> (not res!913114) (not e!775857))))

(declare-fun subseq!1064 (List!32033 List!32033) Bool)

(assert (=> b!1369615 (= res!913114 (subseq!1064 newAcc!98 acc!866))))

(assert (= (and start!115858 res!913117) b!1369614))

(assert (= (and b!1369614 res!913116) b!1369610))

(assert (= (and b!1369610 res!913118) b!1369612))

(assert (= (and b!1369612 res!913115) b!1369609))

(assert (= (and b!1369609 res!913112) b!1369613))

(assert (= (and b!1369613 res!913113) b!1369615))

(assert (= (and b!1369615 res!913114) b!1369611))

(declare-fun m!1252893 () Bool)

(assert (=> b!1369615 m!1252893))

(declare-fun m!1252895 () Bool)

(assert (=> b!1369611 m!1252895))

(declare-fun m!1252897 () Bool)

(assert (=> b!1369611 m!1252897))

(declare-fun m!1252899 () Bool)

(assert (=> b!1369609 m!1252899))

(declare-fun m!1252901 () Bool)

(assert (=> b!1369610 m!1252901))

(declare-fun m!1252903 () Bool)

(assert (=> b!1369613 m!1252903))

(declare-fun m!1252905 () Bool)

(assert (=> b!1369612 m!1252905))

(declare-fun m!1252907 () Bool)

(assert (=> b!1369614 m!1252907))

(declare-fun m!1252909 () Bool)

(assert (=> start!115858 m!1252909))

(check-sat (not start!115858) (not b!1369612) (not b!1369615) (not b!1369614) (not b!1369613) (not b!1369610) (not b!1369611) (not b!1369609))
(check-sat)
