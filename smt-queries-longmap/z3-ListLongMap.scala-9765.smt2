; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115702 () Bool)

(assert start!115702)

(declare-fun res!911763 () Bool)

(declare-fun e!775255 () Bool)

(assert (=> start!115702 (=> (not res!911763) (not e!775255))))

(declare-datatypes ((array!92853 0))(
  ( (array!92854 (arr!44851 (Array (_ BitVec 32) (_ BitVec 64))) (size!45403 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92853)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115702 (= res!911763 (and (bvslt (size!45403 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45403 a!3861))))))

(assert (=> start!115702 e!775255))

(declare-fun array_inv!34084 (array!92853) Bool)

(assert (=> start!115702 (array_inv!34084 a!3861)))

(assert (=> start!115702 true))

(declare-fun b!1368207 () Bool)

(declare-fun res!911759 () Bool)

(declare-fun e!775257 () Bool)

(assert (=> b!1368207 (=> (not res!911759) (not e!775257))))

(assert (=> b!1368207 (= res!911759 (bvslt from!3239 (size!45403 a!3861)))))

(declare-fun b!1368208 () Bool)

(declare-fun res!911760 () Bool)

(assert (=> b!1368208 (=> (not res!911760) (not e!775255))))

(declare-datatypes ((List!31997 0))(
  ( (Nil!31994) (Cons!31993 (h!33202 (_ BitVec 64)) (t!46683 List!31997)) )
))
(declare-fun newAcc!98 () List!31997)

(declare-fun acc!866 () List!31997)

(declare-fun subseq!1028 (List!31997 List!31997) Bool)

(assert (=> b!1368208 (= res!911760 (subseq!1028 newAcc!98 acc!866))))

(declare-fun b!1368209 () Bool)

(declare-fun res!911768 () Bool)

(assert (=> b!1368209 (=> (not res!911768) (not e!775257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368209 (= res!911768 (not (validKeyInArray!0 (select (arr!44851 a!3861) from!3239))))))

(declare-fun b!1368210 () Bool)

(declare-fun res!911766 () Bool)

(assert (=> b!1368210 (=> (not res!911766) (not e!775255))))

(declare-fun contains!9590 (List!31997 (_ BitVec 64)) Bool)

(assert (=> b!1368210 (= res!911766 (not (contains!9590 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368211 () Bool)

(declare-fun res!911762 () Bool)

(assert (=> b!1368211 (=> (not res!911762) (not e!775255))))

(declare-fun noDuplicate!2505 (List!31997) Bool)

(assert (=> b!1368211 (= res!911762 (noDuplicate!2505 acc!866))))

(declare-fun b!1368212 () Bool)

(declare-fun res!911765 () Bool)

(assert (=> b!1368212 (=> (not res!911765) (not e!775255))))

(assert (=> b!1368212 (= res!911765 (not (contains!9590 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368213 () Bool)

(assert (=> b!1368213 (= e!775257 false)))

(declare-fun lt!601851 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92853 (_ BitVec 32) List!31997) Bool)

(assert (=> b!1368213 (= lt!601851 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368214 () Bool)

(declare-fun res!911761 () Bool)

(assert (=> b!1368214 (=> (not res!911761) (not e!775255))))

(assert (=> b!1368214 (= res!911761 (not (contains!9590 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368215 () Bool)

(assert (=> b!1368215 (= e!775255 e!775257)))

(declare-fun res!911758 () Bool)

(assert (=> b!1368215 (=> (not res!911758) (not e!775257))))

(assert (=> b!1368215 (= res!911758 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45030 0))(
  ( (Unit!45031) )
))
(declare-fun lt!601850 () Unit!45030)

(declare-fun noDuplicateSubseq!215 (List!31997 List!31997) Unit!45030)

(assert (=> b!1368215 (= lt!601850 (noDuplicateSubseq!215 newAcc!98 acc!866))))

(declare-fun b!1368216 () Bool)

(declare-fun res!911764 () Bool)

(assert (=> b!1368216 (=> (not res!911764) (not e!775257))))

(assert (=> b!1368216 (= res!911764 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368217 () Bool)

(declare-fun res!911767 () Bool)

(assert (=> b!1368217 (=> (not res!911767) (not e!775255))))

(assert (=> b!1368217 (= res!911767 (not (contains!9590 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115702 res!911763) b!1368211))

(assert (= (and b!1368211 res!911762) b!1368212))

(assert (= (and b!1368212 res!911765) b!1368214))

(assert (= (and b!1368214 res!911761) b!1368210))

(assert (= (and b!1368210 res!911766) b!1368217))

(assert (= (and b!1368217 res!911767) b!1368208))

(assert (= (and b!1368208 res!911760) b!1368215))

(assert (= (and b!1368215 res!911758) b!1368207))

(assert (= (and b!1368207 res!911759) b!1368209))

(assert (= (and b!1368209 res!911768) b!1368216))

(assert (= (and b!1368216 res!911764) b!1368213))

(declare-fun m!1251765 () Bool)

(assert (=> b!1368208 m!1251765))

(declare-fun m!1251767 () Bool)

(assert (=> b!1368213 m!1251767))

(declare-fun m!1251769 () Bool)

(assert (=> b!1368215 m!1251769))

(declare-fun m!1251771 () Bool)

(assert (=> b!1368215 m!1251771))

(declare-fun m!1251773 () Bool)

(assert (=> b!1368209 m!1251773))

(assert (=> b!1368209 m!1251773))

(declare-fun m!1251775 () Bool)

(assert (=> b!1368209 m!1251775))

(declare-fun m!1251777 () Bool)

(assert (=> b!1368210 m!1251777))

(declare-fun m!1251779 () Bool)

(assert (=> b!1368217 m!1251779))

(declare-fun m!1251781 () Bool)

(assert (=> b!1368214 m!1251781))

(declare-fun m!1251783 () Bool)

(assert (=> b!1368212 m!1251783))

(declare-fun m!1251785 () Bool)

(assert (=> start!115702 m!1251785))

(declare-fun m!1251787 () Bool)

(assert (=> b!1368211 m!1251787))

(check-sat (not b!1368211) (not b!1368208) (not b!1368213) (not b!1368212) (not b!1368215) (not b!1368214) (not b!1368217) (not b!1368209) (not start!115702) (not b!1368210))
(check-sat)
