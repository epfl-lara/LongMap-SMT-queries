; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102266 () Bool)

(assert start!102266)

(declare-fun b!1230838 () Bool)

(declare-fun res!819337 () Bool)

(declare-fun e!698251 () Bool)

(assert (=> b!1230838 (=> (not res!819337) (not e!698251))))

(declare-datatypes ((array!79331 0))(
  ( (array!79332 (arr!38284 (Array (_ BitVec 32) (_ BitVec 64))) (size!38822 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79331)

(declare-datatypes ((List!27158 0))(
  ( (Nil!27155) (Cons!27154 (h!28363 (_ BitVec 64)) (t!40612 List!27158)) )
))
(declare-fun acc!823 () List!27158)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79331 (_ BitVec 32) List!27158) Bool)

(assert (=> b!1230838 (= res!819337 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230839 () Bool)

(declare-fun res!819342 () Bool)

(assert (=> b!1230839 (=> (not res!819342) (not e!698251))))

(declare-fun contains!7130 (List!27158 (_ BitVec 64)) Bool)

(assert (=> b!1230839 (= res!819342 (not (contains!7130 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230840 () Bool)

(declare-fun res!819336 () Bool)

(assert (=> b!1230840 (=> (not res!819336) (not e!698251))))

(assert (=> b!1230840 (= res!819336 (not (contains!7130 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!819340 () Bool)

(assert (=> start!102266 (=> (not res!819340) (not e!698251))))

(assert (=> start!102266 (= res!819340 (bvslt (size!38822 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102266 e!698251))

(declare-fun array_inv!29267 (array!79331) Bool)

(assert (=> start!102266 (array_inv!29267 a!3806)))

(assert (=> start!102266 true))

(declare-fun b!1230841 () Bool)

(declare-fun res!819339 () Bool)

(assert (=> b!1230841 (=> (not res!819339) (not e!698251))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230841 (= res!819339 (validKeyInArray!0 k!2913))))

(declare-fun b!1230842 () Bool)

(declare-fun res!819344 () Bool)

(assert (=> b!1230842 (=> (not res!819344) (not e!698251))))

(declare-fun arrayContainsKey!0 (array!79331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230842 (= res!819344 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230843 () Bool)

(declare-fun res!819341 () Bool)

(assert (=> b!1230843 (=> (not res!819341) (not e!698251))))

(declare-fun noDuplicate!1773 (List!27158) Bool)

(assert (=> b!1230843 (= res!819341 (noDuplicate!1773 acc!823))))

(declare-fun b!1230844 () Bool)

(assert (=> b!1230844 (= e!698251 (not true))))

(assert (=> b!1230844 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27154 (select (arr!38284 a!3806) from!3184) acc!823))))

(declare-fun b!1230845 () Bool)

(declare-fun res!819343 () Bool)

(assert (=> b!1230845 (=> (not res!819343) (not e!698251))))

(assert (=> b!1230845 (= res!819343 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38822 a!3806)) (bvslt from!3184 (size!38822 a!3806))))))

(declare-fun b!1230846 () Bool)

(declare-fun res!819338 () Bool)

(assert (=> b!1230846 (=> (not res!819338) (not e!698251))))

(assert (=> b!1230846 (= res!819338 (validKeyInArray!0 (select (arr!38284 a!3806) from!3184)))))

(assert (= (and start!102266 res!819340) b!1230841))

(assert (= (and b!1230841 res!819339) b!1230845))

(assert (= (and b!1230845 res!819343) b!1230843))

(assert (= (and b!1230843 res!819341) b!1230839))

(assert (= (and b!1230839 res!819342) b!1230840))

(assert (= (and b!1230840 res!819336) b!1230842))

(assert (= (and b!1230842 res!819344) b!1230838))

(assert (= (and b!1230838 res!819337) b!1230846))

(assert (= (and b!1230846 res!819338) b!1230844))

(declare-fun m!1134691 () Bool)

(assert (=> start!102266 m!1134691))

(declare-fun m!1134693 () Bool)

(assert (=> b!1230842 m!1134693))

(declare-fun m!1134695 () Bool)

(assert (=> b!1230846 m!1134695))

(assert (=> b!1230846 m!1134695))

(declare-fun m!1134697 () Bool)

(assert (=> b!1230846 m!1134697))

(assert (=> b!1230844 m!1134695))

(declare-fun m!1134699 () Bool)

(assert (=> b!1230844 m!1134699))

(declare-fun m!1134701 () Bool)

(assert (=> b!1230841 m!1134701))

(declare-fun m!1134703 () Bool)

(assert (=> b!1230839 m!1134703))

(declare-fun m!1134705 () Bool)

(assert (=> b!1230840 m!1134705))

(declare-fun m!1134707 () Bool)

(assert (=> b!1230843 m!1134707))

(declare-fun m!1134709 () Bool)

(assert (=> b!1230838 m!1134709))

(push 1)

(assert (not b!1230844))

(assert (not b!1230840))

(assert (not b!1230838))

(assert (not start!102266))

(assert (not b!1230839))

(assert (not b!1230842))

(assert (not b!1230843))

(assert (not b!1230841))

(assert (not b!1230846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

