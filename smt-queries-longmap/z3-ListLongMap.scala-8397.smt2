; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102402 () Bool)

(assert start!102402)

(declare-fun b!1231098 () Bool)

(declare-fun e!698777 () Bool)

(declare-datatypes ((array!79373 0))(
  ( (array!79374 (arr!38300 (Array (_ BitVec 32) (_ BitVec 64))) (size!38837 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79373)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27086 0))(
  ( (Nil!27083) (Cons!27082 (h!28300 (_ BitVec 64)) (t!40541 List!27086)) )
))
(declare-fun arrayNoDuplicates!0 (array!79373 (_ BitVec 32) List!27086) Bool)

(assert (=> b!1231098 (= e!698777 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27082 (select (arr!38300 a!3806) from!3184) Nil!27083)))))

(declare-fun res!818801 () Bool)

(declare-fun e!698776 () Bool)

(assert (=> start!102402 (=> (not res!818801) (not e!698776))))

(assert (=> start!102402 (= res!818801 (bvslt (size!38837 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102402 e!698776))

(declare-fun array_inv!29238 (array!79373) Bool)

(assert (=> start!102402 (array_inv!29238 a!3806)))

(assert (=> start!102402 true))

(declare-fun b!1231099 () Bool)

(declare-fun res!818800 () Bool)

(assert (=> b!1231099 (=> (not res!818800) (not e!698776))))

(declare-fun acc!823 () List!27086)

(declare-fun noDuplicate!1738 (List!27086) Bool)

(assert (=> b!1231099 (= res!818800 (noDuplicate!1738 acc!823))))

(declare-fun b!1231100 () Bool)

(declare-fun res!818791 () Bool)

(assert (=> b!1231100 (=> (not res!818791) (not e!698776))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231100 (= res!818791 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231101 () Bool)

(declare-fun res!818793 () Bool)

(declare-fun e!698775 () Bool)

(assert (=> b!1231101 (=> res!818793 e!698775)))

(declare-fun lt!559738 () List!27086)

(declare-fun contains!7157 (List!27086 (_ BitVec 64)) Bool)

(assert (=> b!1231101 (= res!818793 (contains!7157 lt!559738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231102 () Bool)

(declare-fun res!818795 () Bool)

(assert (=> b!1231102 (=> (not res!818795) (not e!698776))))

(assert (=> b!1231102 (= res!818795 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231103 () Bool)

(declare-fun res!818802 () Bool)

(assert (=> b!1231103 (=> (not res!818802) (not e!698776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231103 (= res!818802 (validKeyInArray!0 (select (arr!38300 a!3806) from!3184)))))

(declare-fun b!1231104 () Bool)

(declare-fun res!818798 () Bool)

(assert (=> b!1231104 (=> res!818798 e!698775)))

(assert (=> b!1231104 (= res!818798 (contains!7157 lt!559738 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231105 () Bool)

(declare-fun res!818792 () Bool)

(assert (=> b!1231105 (=> (not res!818792) (not e!698776))))

(assert (=> b!1231105 (= res!818792 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38837 a!3806)) (bvslt from!3184 (size!38837 a!3806))))))

(declare-fun b!1231106 () Bool)

(declare-fun res!818799 () Bool)

(assert (=> b!1231106 (=> (not res!818799) (not e!698776))))

(assert (=> b!1231106 (= res!818799 (not (contains!7157 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231107 () Bool)

(assert (=> b!1231107 (= e!698775 true)))

(declare-fun lt!559739 () Bool)

(assert (=> b!1231107 (= lt!559739 (contains!7157 lt!559738 (select (arr!38300 a!3806) from!3184)))))

(declare-fun b!1231108 () Bool)

(declare-fun res!818804 () Bool)

(assert (=> b!1231108 (=> (not res!818804) (not e!698776))))

(assert (=> b!1231108 (= res!818804 (not (contains!7157 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231109 () Bool)

(declare-fun res!818794 () Bool)

(assert (=> b!1231109 (=> res!818794 e!698775)))

(assert (=> b!1231109 (= res!818794 (not (noDuplicate!1738 lt!559738)))))

(declare-fun b!1231110 () Bool)

(declare-fun res!818803 () Bool)

(assert (=> b!1231110 (=> (not res!818803) (not e!698776))))

(assert (=> b!1231110 (= res!818803 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231111 () Bool)

(assert (=> b!1231111 (= e!698776 (not e!698775))))

(declare-fun res!818796 () Bool)

(assert (=> b!1231111 (=> res!818796 e!698775)))

(assert (=> b!1231111 (= res!818796 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1231111 (= lt!559738 (Cons!27082 (select (arr!38300 a!3806) from!3184) Nil!27083))))

(assert (=> b!1231111 e!698777))

(declare-fun res!818797 () Bool)

(assert (=> b!1231111 (=> (not res!818797) (not e!698777))))

(assert (=> b!1231111 (= res!818797 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27083))))

(declare-datatypes ((Unit!40715 0))(
  ( (Unit!40716) )
))
(declare-fun lt!559740 () Unit!40715)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79373 List!27086 List!27086 (_ BitVec 32)) Unit!40715)

(assert (=> b!1231111 (= lt!559740 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27083 from!3184))))

(assert (=> b!1231111 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27082 (select (arr!38300 a!3806) from!3184) acc!823))))

(assert (= (and start!102402 res!818801) b!1231110))

(assert (= (and b!1231110 res!818803) b!1231105))

(assert (= (and b!1231105 res!818792) b!1231099))

(assert (= (and b!1231099 res!818800) b!1231106))

(assert (= (and b!1231106 res!818799) b!1231108))

(assert (= (and b!1231108 res!818804) b!1231100))

(assert (= (and b!1231100 res!818791) b!1231102))

(assert (= (and b!1231102 res!818795) b!1231103))

(assert (= (and b!1231103 res!818802) b!1231111))

(assert (= (and b!1231111 res!818797) b!1231098))

(assert (= (and b!1231111 (not res!818796)) b!1231109))

(assert (= (and b!1231109 (not res!818794)) b!1231101))

(assert (= (and b!1231101 (not res!818793)) b!1231104))

(assert (= (and b!1231104 (not res!818798)) b!1231107))

(declare-fun m!1135923 () Bool)

(assert (=> b!1231108 m!1135923))

(declare-fun m!1135925 () Bool)

(assert (=> b!1231110 m!1135925))

(declare-fun m!1135927 () Bool)

(assert (=> b!1231103 m!1135927))

(assert (=> b!1231103 m!1135927))

(declare-fun m!1135929 () Bool)

(assert (=> b!1231103 m!1135929))

(assert (=> b!1231111 m!1135927))

(declare-fun m!1135931 () Bool)

(assert (=> b!1231111 m!1135931))

(declare-fun m!1135933 () Bool)

(assert (=> b!1231111 m!1135933))

(declare-fun m!1135935 () Bool)

(assert (=> b!1231111 m!1135935))

(assert (=> b!1231098 m!1135927))

(declare-fun m!1135937 () Bool)

(assert (=> b!1231098 m!1135937))

(declare-fun m!1135939 () Bool)

(assert (=> b!1231099 m!1135939))

(assert (=> b!1231107 m!1135927))

(assert (=> b!1231107 m!1135927))

(declare-fun m!1135941 () Bool)

(assert (=> b!1231107 m!1135941))

(declare-fun m!1135943 () Bool)

(assert (=> b!1231100 m!1135943))

(declare-fun m!1135945 () Bool)

(assert (=> start!102402 m!1135945))

(declare-fun m!1135947 () Bool)

(assert (=> b!1231102 m!1135947))

(declare-fun m!1135949 () Bool)

(assert (=> b!1231101 m!1135949))

(declare-fun m!1135951 () Bool)

(assert (=> b!1231104 m!1135951))

(declare-fun m!1135953 () Bool)

(assert (=> b!1231109 m!1135953))

(declare-fun m!1135955 () Bool)

(assert (=> b!1231106 m!1135955))

(check-sat (not b!1231106) (not b!1231109) (not b!1231103) (not b!1231111) (not start!102402) (not b!1231104) (not b!1231100) (not b!1231099) (not b!1231101) (not b!1231102) (not b!1231098) (not b!1231107) (not b!1231108) (not b!1231110))
(check-sat)
