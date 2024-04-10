; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115798 () Bool)

(assert start!115798)

(declare-fun b!1369118 () Bool)

(declare-fun res!912603 () Bool)

(declare-fun e!775625 () Bool)

(assert (=> b!1369118 (=> (not res!912603) (not e!775625))))

(declare-datatypes ((List!31963 0))(
  ( (Nil!31960) (Cons!31959 (h!33168 (_ BitVec 64)) (t!46657 List!31963)) )
))
(declare-fun newAcc!98 () List!31963)

(declare-fun acc!866 () List!31963)

(declare-fun subseq!1047 (List!31963 List!31963) Bool)

(assert (=> b!1369118 (= res!912603 (subseq!1047 newAcc!98 acc!866))))

(declare-fun b!1369119 () Bool)

(declare-fun res!912602 () Bool)

(assert (=> b!1369119 (=> (not res!912602) (not e!775625))))

(declare-fun contains!9645 (List!31963 (_ BitVec 64)) Bool)

(assert (=> b!1369119 (= res!912602 (not (contains!9645 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369120 () Bool)

(declare-fun res!912606 () Bool)

(declare-fun e!775626 () Bool)

(assert (=> b!1369120 (=> (not res!912606) (not e!775626))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1369120 (= res!912606 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369121 () Bool)

(declare-fun res!912605 () Bool)

(assert (=> b!1369121 (=> (not res!912605) (not e!775626))))

(declare-datatypes ((array!92945 0))(
  ( (array!92946 (arr!44895 (Array (_ BitVec 32) (_ BitVec 64))) (size!45445 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92945)

(assert (=> b!1369121 (= res!912605 (bvslt from!3239 (size!45445 a!3861)))))

(declare-fun b!1369122 () Bool)

(declare-fun res!912600 () Bool)

(assert (=> b!1369122 (=> (not res!912600) (not e!775625))))

(declare-fun noDuplicate!2502 (List!31963) Bool)

(assert (=> b!1369122 (= res!912600 (noDuplicate!2502 acc!866))))

(declare-fun res!912596 () Bool)

(assert (=> start!115798 (=> (not res!912596) (not e!775625))))

(assert (=> start!115798 (= res!912596 (and (bvslt (size!45445 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45445 a!3861))))))

(assert (=> start!115798 e!775625))

(declare-fun array_inv!33923 (array!92945) Bool)

(assert (=> start!115798 (array_inv!33923 a!3861)))

(assert (=> start!115798 true))

(declare-fun b!1369123 () Bool)

(assert (=> b!1369123 (= e!775626 (not true))))

(declare-fun lt!602194 () Bool)

(assert (=> b!1369123 (= lt!602194 (noDuplicate!2502 newAcc!98))))

(declare-fun arrayNoDuplicates!0 (array!92945 (_ BitVec 32) List!31963) Bool)

(assert (=> b!1369123 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45227 0))(
  ( (Unit!45228) )
))
(declare-fun lt!602192 () Unit!45227)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92945 List!31963 List!31963 (_ BitVec 32)) Unit!45227)

(assert (=> b!1369123 (= lt!602192 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1369124 () Bool)

(declare-fun res!912599 () Bool)

(assert (=> b!1369124 (=> (not res!912599) (not e!775625))))

(assert (=> b!1369124 (= res!912599 (not (contains!9645 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369125 () Bool)

(declare-fun res!912601 () Bool)

(assert (=> b!1369125 (=> (not res!912601) (not e!775625))))

(assert (=> b!1369125 (= res!912601 (not (contains!9645 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369126 () Bool)

(assert (=> b!1369126 (= e!775625 e!775626)))

(declare-fun res!912607 () Bool)

(assert (=> b!1369126 (=> (not res!912607) (not e!775626))))

(assert (=> b!1369126 (= res!912607 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602193 () Unit!45227)

(declare-fun noDuplicateSubseq!234 (List!31963 List!31963) Unit!45227)

(assert (=> b!1369126 (= lt!602193 (noDuplicateSubseq!234 newAcc!98 acc!866))))

(declare-fun b!1369127 () Bool)

(declare-fun res!912597 () Bool)

(assert (=> b!1369127 (=> (not res!912597) (not e!775626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369127 (= res!912597 (not (validKeyInArray!0 (select (arr!44895 a!3861) from!3239))))))

(declare-fun b!1369128 () Bool)

(declare-fun res!912598 () Bool)

(assert (=> b!1369128 (=> (not res!912598) (not e!775626))))

(assert (=> b!1369128 (= res!912598 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369129 () Bool)

(declare-fun res!912604 () Bool)

(assert (=> b!1369129 (=> (not res!912604) (not e!775625))))

(assert (=> b!1369129 (= res!912604 (not (contains!9645 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115798 res!912596) b!1369122))

(assert (= (and b!1369122 res!912600) b!1369129))

(assert (= (and b!1369129 res!912604) b!1369119))

(assert (= (and b!1369119 res!912602) b!1369124))

(assert (= (and b!1369124 res!912599) b!1369125))

(assert (= (and b!1369125 res!912601) b!1369118))

(assert (= (and b!1369118 res!912603) b!1369126))

(assert (= (and b!1369126 res!912607) b!1369121))

(assert (= (and b!1369121 res!912605) b!1369127))

(assert (= (and b!1369127 res!912597) b!1369120))

(assert (= (and b!1369120 res!912606) b!1369128))

(assert (= (and b!1369128 res!912598) b!1369123))

(declare-fun m!1252951 () Bool)

(assert (=> b!1369128 m!1252951))

(declare-fun m!1252953 () Bool)

(assert (=> b!1369125 m!1252953))

(declare-fun m!1252955 () Bool)

(assert (=> b!1369124 m!1252955))

(declare-fun m!1252957 () Bool)

(assert (=> b!1369123 m!1252957))

(declare-fun m!1252959 () Bool)

(assert (=> b!1369123 m!1252959))

(declare-fun m!1252961 () Bool)

(assert (=> b!1369123 m!1252961))

(declare-fun m!1252963 () Bool)

(assert (=> b!1369129 m!1252963))

(declare-fun m!1252965 () Bool)

(assert (=> b!1369118 m!1252965))

(declare-fun m!1252967 () Bool)

(assert (=> b!1369126 m!1252967))

(declare-fun m!1252969 () Bool)

(assert (=> b!1369126 m!1252969))

(declare-fun m!1252971 () Bool)

(assert (=> start!115798 m!1252971))

(declare-fun m!1252973 () Bool)

(assert (=> b!1369119 m!1252973))

(declare-fun m!1252975 () Bool)

(assert (=> b!1369127 m!1252975))

(assert (=> b!1369127 m!1252975))

(declare-fun m!1252977 () Bool)

(assert (=> b!1369127 m!1252977))

(declare-fun m!1252979 () Bool)

(assert (=> b!1369122 m!1252979))

(check-sat (not b!1369124) (not b!1369123) (not b!1369128) (not b!1369127) (not b!1369122) (not b!1369129) (not start!115798) (not b!1369119) (not b!1369125) (not b!1369126) (not b!1369118))
(check-sat)
