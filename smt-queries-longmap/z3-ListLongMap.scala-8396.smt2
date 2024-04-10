; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102158 () Bool)

(assert start!102158)

(declare-fun b!1229686 () Bool)

(declare-fun e!697885 () Bool)

(declare-fun e!697884 () Bool)

(assert (=> b!1229686 (= e!697885 (not e!697884))))

(declare-fun res!818176 () Bool)

(assert (=> b!1229686 (=> res!818176 e!697884)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229686 (= res!818176 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27059 0))(
  ( (Nil!27056) (Cons!27055 (h!28264 (_ BitVec 64)) (t!40522 List!27059)) )
))
(declare-fun lt!559234 () List!27059)

(declare-datatypes ((array!79333 0))(
  ( (array!79334 (arr!38286 (Array (_ BitVec 32) (_ BitVec 64))) (size!38822 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79333)

(assert (=> b!1229686 (= lt!559234 (Cons!27055 (select (arr!38286 a!3806) from!3184) Nil!27056))))

(declare-fun e!697887 () Bool)

(assert (=> b!1229686 e!697887))

(declare-fun res!818178 () Bool)

(assert (=> b!1229686 (=> (not res!818178) (not e!697887))))

(declare-fun arrayNoDuplicates!0 (array!79333 (_ BitVec 32) List!27059) Bool)

(assert (=> b!1229686 (= res!818178 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27056))))

(declare-fun acc!823 () List!27059)

(declare-datatypes ((Unit!40738 0))(
  ( (Unit!40739) )
))
(declare-fun lt!559235 () Unit!40738)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79333 List!27059 List!27059 (_ BitVec 32)) Unit!40738)

(assert (=> b!1229686 (= lt!559235 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27056 from!3184))))

(assert (=> b!1229686 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27055 (select (arr!38286 a!3806) from!3184) acc!823))))

(declare-fun b!1229687 () Bool)

(declare-fun res!818180 () Bool)

(assert (=> b!1229687 (=> (not res!818180) (not e!697885))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229687 (= res!818180 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229688 () Bool)

(declare-fun res!818175 () Bool)

(assert (=> b!1229688 (=> (not res!818175) (not e!697885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229688 (= res!818175 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229689 () Bool)

(declare-fun res!818177 () Bool)

(assert (=> b!1229689 (=> res!818177 e!697884)))

(declare-fun contains!7121 (List!27059 (_ BitVec 64)) Bool)

(assert (=> b!1229689 (= res!818177 (contains!7121 lt!559234 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!818182 () Bool)

(assert (=> start!102158 (=> (not res!818182) (not e!697885))))

(assert (=> start!102158 (= res!818182 (bvslt (size!38822 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102158 e!697885))

(declare-fun array_inv!29134 (array!79333) Bool)

(assert (=> start!102158 (array_inv!29134 a!3806)))

(assert (=> start!102158 true))

(declare-fun b!1229690 () Bool)

(declare-fun res!818172 () Bool)

(assert (=> b!1229690 (=> res!818172 e!697884)))

(declare-fun noDuplicate!1718 (List!27059) Bool)

(assert (=> b!1229690 (= res!818172 (not (noDuplicate!1718 lt!559234)))))

(declare-fun b!1229691 () Bool)

(declare-fun res!818184 () Bool)

(assert (=> b!1229691 (=> (not res!818184) (not e!697885))))

(assert (=> b!1229691 (= res!818184 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229692 () Bool)

(declare-fun res!818173 () Bool)

(assert (=> b!1229692 (=> res!818173 e!697884)))

(assert (=> b!1229692 (= res!818173 (contains!7121 lt!559234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229693 () Bool)

(declare-fun res!818179 () Bool)

(assert (=> b!1229693 (=> (not res!818179) (not e!697885))))

(assert (=> b!1229693 (= res!818179 (not (contains!7121 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229694 () Bool)

(declare-fun res!818174 () Bool)

(assert (=> b!1229694 (=> (not res!818174) (not e!697885))))

(assert (=> b!1229694 (= res!818174 (noDuplicate!1718 acc!823))))

(declare-fun b!1229695 () Bool)

(declare-fun res!818183 () Bool)

(assert (=> b!1229695 (=> (not res!818183) (not e!697885))))

(assert (=> b!1229695 (= res!818183 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38822 a!3806)) (bvslt from!3184 (size!38822 a!3806))))))

(declare-fun b!1229696 () Bool)

(assert (=> b!1229696 (= e!697887 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27055 (select (arr!38286 a!3806) from!3184) Nil!27056)))))

(declare-fun b!1229697 () Bool)

(declare-fun res!818181 () Bool)

(assert (=> b!1229697 (=> (not res!818181) (not e!697885))))

(assert (=> b!1229697 (= res!818181 (not (contains!7121 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229698 () Bool)

(declare-fun res!818185 () Bool)

(assert (=> b!1229698 (=> (not res!818185) (not e!697885))))

(assert (=> b!1229698 (= res!818185 (validKeyInArray!0 (select (arr!38286 a!3806) from!3184)))))

(declare-fun b!1229699 () Bool)

(assert (=> b!1229699 (= e!697884 true)))

(declare-fun lt!559233 () Bool)

(assert (=> b!1229699 (= lt!559233 (contains!7121 lt!559234 (select (arr!38286 a!3806) from!3184)))))

(assert (= (and start!102158 res!818182) b!1229688))

(assert (= (and b!1229688 res!818175) b!1229695))

(assert (= (and b!1229695 res!818183) b!1229694))

(assert (= (and b!1229694 res!818174) b!1229693))

(assert (= (and b!1229693 res!818179) b!1229697))

(assert (= (and b!1229697 res!818181) b!1229687))

(assert (= (and b!1229687 res!818180) b!1229691))

(assert (= (and b!1229691 res!818184) b!1229698))

(assert (= (and b!1229698 res!818185) b!1229686))

(assert (= (and b!1229686 res!818178) b!1229696))

(assert (= (and b!1229686 (not res!818176)) b!1229690))

(assert (= (and b!1229690 (not res!818172)) b!1229692))

(assert (= (and b!1229692 (not res!818173)) b!1229689))

(assert (= (and b!1229689 (not res!818177)) b!1229699))

(declare-fun m!1134197 () Bool)

(assert (=> b!1229691 m!1134197))

(declare-fun m!1134199 () Bool)

(assert (=> b!1229696 m!1134199))

(declare-fun m!1134201 () Bool)

(assert (=> b!1229696 m!1134201))

(declare-fun m!1134203 () Bool)

(assert (=> b!1229690 m!1134203))

(declare-fun m!1134205 () Bool)

(assert (=> b!1229692 m!1134205))

(declare-fun m!1134207 () Bool)

(assert (=> b!1229697 m!1134207))

(declare-fun m!1134209 () Bool)

(assert (=> b!1229688 m!1134209))

(declare-fun m!1134211 () Bool)

(assert (=> b!1229687 m!1134211))

(declare-fun m!1134213 () Bool)

(assert (=> b!1229693 m!1134213))

(assert (=> b!1229699 m!1134199))

(assert (=> b!1229699 m!1134199))

(declare-fun m!1134215 () Bool)

(assert (=> b!1229699 m!1134215))

(declare-fun m!1134217 () Bool)

(assert (=> b!1229689 m!1134217))

(declare-fun m!1134219 () Bool)

(assert (=> start!102158 m!1134219))

(assert (=> b!1229686 m!1134199))

(declare-fun m!1134221 () Bool)

(assert (=> b!1229686 m!1134221))

(declare-fun m!1134223 () Bool)

(assert (=> b!1229686 m!1134223))

(declare-fun m!1134225 () Bool)

(assert (=> b!1229686 m!1134225))

(assert (=> b!1229698 m!1134199))

(assert (=> b!1229698 m!1134199))

(declare-fun m!1134227 () Bool)

(assert (=> b!1229698 m!1134227))

(declare-fun m!1134229 () Bool)

(assert (=> b!1229694 m!1134229))

(check-sat (not b!1229690) (not start!102158) (not b!1229699) (not b!1229698) (not b!1229697) (not b!1229694) (not b!1229686) (not b!1229691) (not b!1229696) (not b!1229688) (not b!1229693) (not b!1229687) (not b!1229692) (not b!1229689))
(check-sat)
