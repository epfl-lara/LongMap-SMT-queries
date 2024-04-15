; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102134 () Bool)

(assert start!102134)

(declare-fun b!1229156 () Bool)

(declare-fun res!817689 () Bool)

(declare-fun e!697721 () Bool)

(assert (=> b!1229156 (=> (not res!817689) (not e!697721))))

(declare-datatypes ((List!27110 0))(
  ( (Nil!27107) (Cons!27106 (h!28315 (_ BitVec 64)) (t!40564 List!27110)) )
))
(declare-fun acc!823 () List!27110)

(declare-fun contains!7082 (List!27110 (_ BitVec 64)) Bool)

(assert (=> b!1229156 (= res!817689 (not (contains!7082 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229157 () Bool)

(declare-fun res!817691 () Bool)

(assert (=> b!1229157 (=> (not res!817691) (not e!697721))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229157 (= res!817691 (validKeyInArray!0 k!2913))))

(declare-fun b!1229158 () Bool)

(declare-fun e!697718 () Bool)

(assert (=> b!1229158 (= e!697721 (not e!697718))))

(declare-fun res!817690 () Bool)

(assert (=> b!1229158 (=> res!817690 e!697718)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229158 (= res!817690 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun lt!558960 () List!27110)

(declare-datatypes ((array!79232 0))(
  ( (array!79233 (arr!38236 (Array (_ BitVec 32) (_ BitVec 64))) (size!38774 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79232)

(assert (=> b!1229158 (= lt!558960 (Cons!27106 (select (arr!38236 a!3806) from!3184) Nil!27107))))

(declare-fun e!697720 () Bool)

(assert (=> b!1229158 e!697720))

(declare-fun res!817678 () Bool)

(assert (=> b!1229158 (=> (not res!817678) (not e!697720))))

(declare-fun arrayNoDuplicates!0 (array!79232 (_ BitVec 32) List!27110) Bool)

(assert (=> b!1229158 (= res!817678 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27107))))

(declare-datatypes ((Unit!40563 0))(
  ( (Unit!40564) )
))
(declare-fun lt!558961 () Unit!40563)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79232 List!27110 List!27110 (_ BitVec 32)) Unit!40563)

(assert (=> b!1229158 (= lt!558961 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27107 from!3184))))

(assert (=> b!1229158 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27106 (select (arr!38236 a!3806) from!3184) acc!823))))

(declare-fun b!1229159 () Bool)

(declare-fun res!817683 () Bool)

(assert (=> b!1229159 (=> (not res!817683) (not e!697721))))

(assert (=> b!1229159 (= res!817683 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38774 a!3806)) (bvslt from!3184 (size!38774 a!3806))))))

(declare-fun b!1229160 () Bool)

(assert (=> b!1229160 (= e!697718 true)))

(declare-fun lt!558962 () Bool)

(assert (=> b!1229160 (= lt!558962 (contains!7082 lt!558960 (select (arr!38236 a!3806) from!3184)))))

(declare-fun b!1229161 () Bool)

(declare-fun res!817684 () Bool)

(assert (=> b!1229161 (=> res!817684 e!697718)))

(assert (=> b!1229161 (= res!817684 (contains!7082 lt!558960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!817685 () Bool)

(assert (=> start!102134 (=> (not res!817685) (not e!697721))))

(assert (=> start!102134 (= res!817685 (bvslt (size!38774 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102134 e!697721))

(declare-fun array_inv!29219 (array!79232) Bool)

(assert (=> start!102134 (array_inv!29219 a!3806)))

(assert (=> start!102134 true))

(declare-fun b!1229162 () Bool)

(declare-fun res!817686 () Bool)

(assert (=> b!1229162 (=> (not res!817686) (not e!697721))))

(assert (=> b!1229162 (= res!817686 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229163 () Bool)

(assert (=> b!1229163 (= e!697720 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27106 (select (arr!38236 a!3806) from!3184) Nil!27107)))))

(declare-fun b!1229164 () Bool)

(declare-fun res!817680 () Bool)

(assert (=> b!1229164 (=> (not res!817680) (not e!697721))))

(assert (=> b!1229164 (= res!817680 (validKeyInArray!0 (select (arr!38236 a!3806) from!3184)))))

(declare-fun b!1229165 () Bool)

(declare-fun res!817687 () Bool)

(assert (=> b!1229165 (=> res!817687 e!697718)))

(declare-fun noDuplicate!1725 (List!27110) Bool)

(assert (=> b!1229165 (= res!817687 (not (noDuplicate!1725 lt!558960)))))

(declare-fun b!1229166 () Bool)

(declare-fun res!817679 () Bool)

(assert (=> b!1229166 (=> (not res!817679) (not e!697721))))

(declare-fun arrayContainsKey!0 (array!79232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229166 (= res!817679 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229167 () Bool)

(declare-fun res!817681 () Bool)

(assert (=> b!1229167 (=> (not res!817681) (not e!697721))))

(assert (=> b!1229167 (= res!817681 (noDuplicate!1725 acc!823))))

(declare-fun b!1229168 () Bool)

(declare-fun res!817688 () Bool)

(assert (=> b!1229168 (=> (not res!817688) (not e!697721))))

(assert (=> b!1229168 (= res!817688 (not (contains!7082 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229169 () Bool)

(declare-fun res!817682 () Bool)

(assert (=> b!1229169 (=> res!817682 e!697718)))

(assert (=> b!1229169 (= res!817682 (contains!7082 lt!558960 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102134 res!817685) b!1229157))

(assert (= (and b!1229157 res!817691) b!1229159))

(assert (= (and b!1229159 res!817683) b!1229167))

(assert (= (and b!1229167 res!817681) b!1229168))

(assert (= (and b!1229168 res!817688) b!1229156))

(assert (= (and b!1229156 res!817689) b!1229166))

(assert (= (and b!1229166 res!817679) b!1229162))

(assert (= (and b!1229162 res!817686) b!1229164))

(assert (= (and b!1229164 res!817680) b!1229158))

(assert (= (and b!1229158 res!817678) b!1229163))

(assert (= (and b!1229158 (not res!817690)) b!1229165))

(assert (= (and b!1229165 (not res!817687)) b!1229161))

(assert (= (and b!1229161 (not res!817684)) b!1229169))

(assert (= (and b!1229169 (not res!817682)) b!1229160))

(declare-fun m!1133327 () Bool)

(assert (=> b!1229157 m!1133327))

(declare-fun m!1133329 () Bool)

(assert (=> b!1229167 m!1133329))

(declare-fun m!1133331 () Bool)

(assert (=> b!1229168 m!1133331))

(declare-fun m!1133333 () Bool)

(assert (=> b!1229165 m!1133333))

(declare-fun m!1133335 () Bool)

(assert (=> start!102134 m!1133335))

(declare-fun m!1133337 () Bool)

(assert (=> b!1229163 m!1133337))

(declare-fun m!1133339 () Bool)

(assert (=> b!1229163 m!1133339))

(assert (=> b!1229158 m!1133337))

(declare-fun m!1133341 () Bool)

(assert (=> b!1229158 m!1133341))

(declare-fun m!1133343 () Bool)

(assert (=> b!1229158 m!1133343))

(declare-fun m!1133345 () Bool)

(assert (=> b!1229158 m!1133345))

(declare-fun m!1133347 () Bool)

(assert (=> b!1229169 m!1133347))

(declare-fun m!1133349 () Bool)

(assert (=> b!1229166 m!1133349))

(assert (=> b!1229164 m!1133337))

(assert (=> b!1229164 m!1133337))

(declare-fun m!1133351 () Bool)

(assert (=> b!1229164 m!1133351))

(assert (=> b!1229160 m!1133337))

(assert (=> b!1229160 m!1133337))

(declare-fun m!1133353 () Bool)

(assert (=> b!1229160 m!1133353))

(declare-fun m!1133355 () Bool)

(assert (=> b!1229161 m!1133355))

(declare-fun m!1133357 () Bool)

(assert (=> b!1229156 m!1133357))

(declare-fun m!1133359 () Bool)

(assert (=> b!1229162 m!1133359))

(push 1)

(assert (not b!1229161))

(assert (not b!1229163))

(assert (not b!1229164))

(assert (not b!1229166))

(assert (not b!1229169))

(assert (not b!1229156))

(assert (not b!1229160))

(assert (not b!1229162))

(assert (not b!1229158))

(assert (not b!1229167))

(assert (not b!1229157))

(assert (not b!1229165))

(assert (not b!1229168))

(assert (not start!102134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

