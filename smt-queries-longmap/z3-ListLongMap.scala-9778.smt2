; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115864 () Bool)

(assert start!115864)

(declare-fun b!1369678 () Bool)

(declare-fun res!913185 () Bool)

(declare-fun e!775877 () Bool)

(assert (=> b!1369678 (=> (not res!913185) (not e!775877))))

(declare-datatypes ((List!32036 0))(
  ( (Nil!32033) (Cons!32032 (h!33241 (_ BitVec 64)) (t!46722 List!32036)) )
))
(declare-fun acc!866 () List!32036)

(declare-fun contains!9629 (List!32036 (_ BitVec 64)) Bool)

(assert (=> b!1369678 (= res!913185 (not (contains!9629 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369680 () Bool)

(declare-fun res!913186 () Bool)

(assert (=> b!1369680 (=> (not res!913186) (not e!775877))))

(declare-fun newAcc!98 () List!32036)

(declare-fun subseq!1067 (List!32036 List!32036) Bool)

(assert (=> b!1369680 (= res!913186 (subseq!1067 newAcc!98 acc!866))))

(declare-fun b!1369681 () Bool)

(declare-fun res!913187 () Bool)

(assert (=> b!1369681 (=> (not res!913187) (not e!775877))))

(assert (=> b!1369681 (= res!913187 (not (contains!9629 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369682 () Bool)

(declare-fun res!913188 () Bool)

(declare-fun e!775876 () Bool)

(assert (=> b!1369682 (=> (not res!913188) (not e!775876))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92937 0))(
  ( (array!92938 (arr!44890 (Array (_ BitVec 32) (_ BitVec 64))) (size!45442 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92937)

(assert (=> b!1369682 (= res!913188 (bvslt from!3239 (size!45442 a!3861)))))

(declare-fun b!1369683 () Bool)

(declare-fun res!913182 () Bool)

(assert (=> b!1369683 (=> (not res!913182) (not e!775877))))

(declare-fun noDuplicate!2544 (List!32036) Bool)

(assert (=> b!1369683 (= res!913182 (noDuplicate!2544 acc!866))))

(declare-fun b!1369684 () Bool)

(declare-fun res!913181 () Bool)

(assert (=> b!1369684 (=> (not res!913181) (not e!775877))))

(assert (=> b!1369684 (= res!913181 (not (contains!9629 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369685 () Bool)

(declare-fun res!913184 () Bool)

(assert (=> b!1369685 (=> (not res!913184) (not e!775877))))

(assert (=> b!1369685 (= res!913184 (not (contains!9629 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369686 () Bool)

(assert (=> b!1369686 (= e!775877 e!775876)))

(declare-fun res!913189 () Bool)

(assert (=> b!1369686 (=> (not res!913189) (not e!775876))))

(declare-fun arrayNoDuplicates!0 (array!92937 (_ BitVec 32) List!32036) Bool)

(assert (=> b!1369686 (= res!913189 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45108 0))(
  ( (Unit!45109) )
))
(declare-fun lt!602148 () Unit!45108)

(declare-fun noDuplicateSubseq!254 (List!32036 List!32036) Unit!45108)

(assert (=> b!1369686 (= lt!602148 (noDuplicateSubseq!254 newAcc!98 acc!866))))

(declare-fun b!1369687 () Bool)

(declare-fun res!913190 () Bool)

(assert (=> b!1369687 (=> (not res!913190) (not e!775876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369687 (= res!913190 (validKeyInArray!0 (select (arr!44890 a!3861) from!3239)))))

(declare-fun res!913183 () Bool)

(assert (=> start!115864 (=> (not res!913183) (not e!775877))))

(assert (=> start!115864 (= res!913183 (and (bvslt (size!45442 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45442 a!3861))))))

(assert (=> start!115864 e!775877))

(declare-fun array_inv!34123 (array!92937) Bool)

(assert (=> start!115864 (array_inv!34123 a!3861)))

(assert (=> start!115864 true))

(declare-fun b!1369679 () Bool)

(assert (=> b!1369679 (= e!775876 false)))

(declare-fun lt!602147 () Bool)

(assert (=> b!1369679 (= lt!602147 (contains!9629 acc!866 (select (arr!44890 a!3861) from!3239)))))

(assert (= (and start!115864 res!913183) b!1369683))

(assert (= (and b!1369683 res!913182) b!1369685))

(assert (= (and b!1369685 res!913184) b!1369678))

(assert (= (and b!1369678 res!913185) b!1369681))

(assert (= (and b!1369681 res!913187) b!1369684))

(assert (= (and b!1369684 res!913181) b!1369680))

(assert (= (and b!1369680 res!913186) b!1369686))

(assert (= (and b!1369686 res!913189) b!1369682))

(assert (= (and b!1369682 res!913188) b!1369687))

(assert (= (and b!1369687 res!913190) b!1369679))

(declare-fun m!1252947 () Bool)

(assert (=> b!1369683 m!1252947))

(declare-fun m!1252949 () Bool)

(assert (=> b!1369687 m!1252949))

(assert (=> b!1369687 m!1252949))

(declare-fun m!1252951 () Bool)

(assert (=> b!1369687 m!1252951))

(declare-fun m!1252953 () Bool)

(assert (=> b!1369685 m!1252953))

(declare-fun m!1252955 () Bool)

(assert (=> b!1369686 m!1252955))

(declare-fun m!1252957 () Bool)

(assert (=> b!1369686 m!1252957))

(declare-fun m!1252959 () Bool)

(assert (=> b!1369680 m!1252959))

(assert (=> b!1369679 m!1252949))

(assert (=> b!1369679 m!1252949))

(declare-fun m!1252961 () Bool)

(assert (=> b!1369679 m!1252961))

(declare-fun m!1252963 () Bool)

(assert (=> b!1369678 m!1252963))

(declare-fun m!1252965 () Bool)

(assert (=> b!1369684 m!1252965))

(declare-fun m!1252967 () Bool)

(assert (=> b!1369681 m!1252967))

(declare-fun m!1252969 () Bool)

(assert (=> start!115864 m!1252969))

(check-sat (not b!1369685) (not b!1369679) (not b!1369687) (not b!1369680) (not b!1369683) (not b!1369681) (not b!1369686) (not b!1369678) (not start!115864) (not b!1369684))
(check-sat)
