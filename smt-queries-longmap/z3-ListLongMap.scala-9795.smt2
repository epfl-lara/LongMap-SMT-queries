; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116284 () Bool)

(assert start!116284)

(declare-fun b!1372849 () Bool)

(declare-fun res!916166 () Bool)

(declare-fun e!777695 () Bool)

(assert (=> b!1372849 (=> (not res!916166) (not e!777695))))

(declare-datatypes ((List!32087 0))(
  ( (Nil!32084) (Cons!32083 (h!33292 (_ BitVec 64)) (t!46773 List!32087)) )
))
(declare-fun acc!866 () List!32087)

(declare-fun noDuplicate!2595 (List!32087) Bool)

(assert (=> b!1372849 (= res!916166 (noDuplicate!2595 acc!866))))

(declare-fun res!916161 () Bool)

(assert (=> start!116284 (=> (not res!916161) (not e!777695))))

(declare-datatypes ((array!93060 0))(
  ( (array!93061 (arr!44941 (Array (_ BitVec 32) (_ BitVec 64))) (size!45493 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93060)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116284 (= res!916161 (and (bvslt (size!45493 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45493 a!3861))))))

(assert (=> start!116284 e!777695))

(declare-fun array_inv!34174 (array!93060) Bool)

(assert (=> start!116284 (array_inv!34174 a!3861)))

(assert (=> start!116284 true))

(declare-fun b!1372850 () Bool)

(assert (=> b!1372850 (= e!777695 false)))

(declare-fun lt!602790 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93060 (_ BitVec 32) List!32087) Bool)

(assert (=> b!1372850 (= lt!602790 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45210 0))(
  ( (Unit!45211) )
))
(declare-fun lt!602789 () Unit!45210)

(declare-fun newAcc!98 () List!32087)

(declare-fun noDuplicateSubseq!305 (List!32087 List!32087) Unit!45210)

(assert (=> b!1372850 (= lt!602789 (noDuplicateSubseq!305 newAcc!98 acc!866))))

(declare-fun b!1372851 () Bool)

(declare-fun res!916162 () Bool)

(assert (=> b!1372851 (=> (not res!916162) (not e!777695))))

(declare-fun contains!9680 (List!32087 (_ BitVec 64)) Bool)

(assert (=> b!1372851 (= res!916162 (not (contains!9680 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372852 () Bool)

(declare-fun res!916165 () Bool)

(assert (=> b!1372852 (=> (not res!916165) (not e!777695))))

(assert (=> b!1372852 (= res!916165 (not (contains!9680 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372853 () Bool)

(declare-fun res!916164 () Bool)

(assert (=> b!1372853 (=> (not res!916164) (not e!777695))))

(assert (=> b!1372853 (= res!916164 (not (contains!9680 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372854 () Bool)

(declare-fun res!916160 () Bool)

(assert (=> b!1372854 (=> (not res!916160) (not e!777695))))

(declare-fun subseq!1118 (List!32087 List!32087) Bool)

(assert (=> b!1372854 (= res!916160 (subseq!1118 newAcc!98 acc!866))))

(declare-fun b!1372855 () Bool)

(declare-fun res!916163 () Bool)

(assert (=> b!1372855 (=> (not res!916163) (not e!777695))))

(assert (=> b!1372855 (= res!916163 (not (contains!9680 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116284 res!916161) b!1372849))

(assert (= (and b!1372849 res!916166) b!1372851))

(assert (= (and b!1372851 res!916162) b!1372855))

(assert (= (and b!1372855 res!916163) b!1372852))

(assert (= (and b!1372852 res!916165) b!1372853))

(assert (= (and b!1372853 res!916164) b!1372854))

(assert (= (and b!1372854 res!916160) b!1372850))

(declare-fun m!1255761 () Bool)

(assert (=> b!1372854 m!1255761))

(declare-fun m!1255763 () Bool)

(assert (=> start!116284 m!1255763))

(declare-fun m!1255765 () Bool)

(assert (=> b!1372850 m!1255765))

(declare-fun m!1255767 () Bool)

(assert (=> b!1372850 m!1255767))

(declare-fun m!1255769 () Bool)

(assert (=> b!1372852 m!1255769))

(declare-fun m!1255771 () Bool)

(assert (=> b!1372849 m!1255771))

(declare-fun m!1255773 () Bool)

(assert (=> b!1372853 m!1255773))

(declare-fun m!1255775 () Bool)

(assert (=> b!1372851 m!1255775))

(declare-fun m!1255777 () Bool)

(assert (=> b!1372855 m!1255777))

(check-sat (not b!1372849) (not b!1372850) (not b!1372852) (not start!116284) (not b!1372853) (not b!1372851) (not b!1372855) (not b!1372854))
(check-sat)
