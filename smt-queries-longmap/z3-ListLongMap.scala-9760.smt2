; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115684 () Bool)

(assert start!115684)

(declare-fun b!1367817 () Bool)

(declare-fun res!911326 () Bool)

(declare-fun e!775163 () Bool)

(assert (=> b!1367817 (=> (not res!911326) (not e!775163))))

(declare-datatypes ((List!31930 0))(
  ( (Nil!31927) (Cons!31926 (h!33135 (_ BitVec 64)) (t!46624 List!31930)) )
))
(declare-fun acc!866 () List!31930)

(declare-fun noDuplicate!2469 (List!31930) Bool)

(assert (=> b!1367817 (= res!911326 (noDuplicate!2469 acc!866))))

(declare-fun b!1367818 () Bool)

(declare-fun e!775165 () Bool)

(assert (=> b!1367818 (= e!775163 e!775165)))

(declare-fun res!911325 () Bool)

(assert (=> b!1367818 (=> (not res!911325) (not e!775165))))

(declare-datatypes ((array!92876 0))(
  ( (array!92877 (arr!44862 (Array (_ BitVec 32) (_ BitVec 64))) (size!45412 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92876)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92876 (_ BitVec 32) List!31930) Bool)

(assert (=> b!1367818 (= res!911325 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45161 0))(
  ( (Unit!45162) )
))
(declare-fun lt!601954 () Unit!45161)

(declare-fun newAcc!98 () List!31930)

(declare-fun noDuplicateSubseq!201 (List!31930 List!31930) Unit!45161)

(assert (=> b!1367818 (= lt!601954 (noDuplicateSubseq!201 newAcc!98 acc!866))))

(declare-fun b!1367819 () Bool)

(declare-fun res!911335 () Bool)

(assert (=> b!1367819 (=> (not res!911335) (not e!775165))))

(assert (=> b!1367819 (= res!911335 (bvslt from!3239 (size!45412 a!3861)))))

(declare-fun b!1367820 () Bool)

(declare-fun res!911334 () Bool)

(assert (=> b!1367820 (=> (not res!911334) (not e!775163))))

(declare-fun contains!9612 (List!31930 (_ BitVec 64)) Bool)

(assert (=> b!1367820 (= res!911334 (not (contains!9612 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367821 () Bool)

(declare-fun res!911332 () Bool)

(assert (=> b!1367821 (=> (not res!911332) (not e!775163))))

(assert (=> b!1367821 (= res!911332 (not (contains!9612 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367823 () Bool)

(assert (=> b!1367823 (= e!775165 false)))

(declare-fun lt!601953 () Bool)

(assert (=> b!1367823 (= lt!601953 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367824 () Bool)

(declare-fun res!911327 () Bool)

(assert (=> b!1367824 (=> (not res!911327) (not e!775163))))

(assert (=> b!1367824 (= res!911327 (not (contains!9612 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367825 () Bool)

(declare-fun res!911330 () Bool)

(assert (=> b!1367825 (=> (not res!911330) (not e!775165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367825 (= res!911330 (not (validKeyInArray!0 (select (arr!44862 a!3861) from!3239))))))

(declare-fun b!1367826 () Bool)

(declare-fun res!911333 () Bool)

(assert (=> b!1367826 (=> (not res!911333) (not e!775163))))

(declare-fun subseq!1014 (List!31930 List!31930) Bool)

(assert (=> b!1367826 (= res!911333 (subseq!1014 newAcc!98 acc!866))))

(declare-fun b!1367827 () Bool)

(declare-fun res!911328 () Bool)

(assert (=> b!1367827 (=> (not res!911328) (not e!775165))))

(assert (=> b!1367827 (= res!911328 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun res!911331 () Bool)

(assert (=> start!115684 (=> (not res!911331) (not e!775163))))

(assert (=> start!115684 (= res!911331 (and (bvslt (size!45412 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45412 a!3861))))))

(assert (=> start!115684 e!775163))

(declare-fun array_inv!33890 (array!92876) Bool)

(assert (=> start!115684 (array_inv!33890 a!3861)))

(assert (=> start!115684 true))

(declare-fun b!1367822 () Bool)

(declare-fun res!911329 () Bool)

(assert (=> b!1367822 (=> (not res!911329) (not e!775163))))

(assert (=> b!1367822 (= res!911329 (not (contains!9612 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115684 res!911331) b!1367817))

(assert (= (and b!1367817 res!911326) b!1367820))

(assert (= (and b!1367820 res!911334) b!1367824))

(assert (= (and b!1367824 res!911327) b!1367822))

(assert (= (and b!1367822 res!911329) b!1367821))

(assert (= (and b!1367821 res!911332) b!1367826))

(assert (= (and b!1367826 res!911333) b!1367818))

(assert (= (and b!1367818 res!911325) b!1367819))

(assert (= (and b!1367819 res!911335) b!1367825))

(assert (= (and b!1367825 res!911330) b!1367827))

(assert (= (and b!1367827 res!911328) b!1367823))

(declare-fun m!1251955 () Bool)

(assert (=> b!1367823 m!1251955))

(declare-fun m!1251957 () Bool)

(assert (=> b!1367817 m!1251957))

(declare-fun m!1251959 () Bool)

(assert (=> b!1367818 m!1251959))

(declare-fun m!1251961 () Bool)

(assert (=> b!1367818 m!1251961))

(declare-fun m!1251963 () Bool)

(assert (=> b!1367820 m!1251963))

(declare-fun m!1251965 () Bool)

(assert (=> start!115684 m!1251965))

(declare-fun m!1251967 () Bool)

(assert (=> b!1367826 m!1251967))

(declare-fun m!1251969 () Bool)

(assert (=> b!1367824 m!1251969))

(declare-fun m!1251971 () Bool)

(assert (=> b!1367825 m!1251971))

(assert (=> b!1367825 m!1251971))

(declare-fun m!1251973 () Bool)

(assert (=> b!1367825 m!1251973))

(declare-fun m!1251975 () Bool)

(assert (=> b!1367822 m!1251975))

(declare-fun m!1251977 () Bool)

(assert (=> b!1367821 m!1251977))

(check-sat (not b!1367826) (not b!1367818) (not start!115684) (not b!1367823) (not b!1367825) (not b!1367822) (not b!1367817) (not b!1367820) (not b!1367824) (not b!1367821))
(check-sat)
