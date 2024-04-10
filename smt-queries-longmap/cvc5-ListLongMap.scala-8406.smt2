; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102252 () Bool)

(assert start!102252)

(declare-fun b!1230690 () Bool)

(declare-fun res!819159 () Bool)

(declare-fun e!698238 () Bool)

(assert (=> b!1230690 (=> (not res!819159) (not e!698238))))

(declare-datatypes ((array!79394 0))(
  ( (array!79395 (arr!38315 (Array (_ BitVec 32) (_ BitVec 64))) (size!38851 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79394)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230690 (= res!819159 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230691 () Bool)

(assert (=> b!1230691 (= e!698238 (not true))))

(declare-datatypes ((List!27088 0))(
  ( (Nil!27085) (Cons!27084 (h!28293 (_ BitVec 64)) (t!40551 List!27088)) )
))
(declare-fun acc!823 () List!27088)

(declare-fun arrayNoDuplicates!0 (array!79394 (_ BitVec 32) List!27088) Bool)

(assert (=> b!1230691 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27084 (select (arr!38315 a!3806) from!3184) acc!823))))

(declare-fun b!1230692 () Bool)

(declare-fun res!819160 () Bool)

(assert (=> b!1230692 (=> (not res!819160) (not e!698238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230692 (= res!819160 (validKeyInArray!0 k!2913))))

(declare-fun res!819156 () Bool)

(assert (=> start!102252 (=> (not res!819156) (not e!698238))))

(assert (=> start!102252 (= res!819156 (bvslt (size!38851 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102252 e!698238))

(declare-fun array_inv!29163 (array!79394) Bool)

(assert (=> start!102252 (array_inv!29163 a!3806)))

(assert (=> start!102252 true))

(declare-fun b!1230693 () Bool)

(declare-fun res!819154 () Bool)

(assert (=> b!1230693 (=> (not res!819154) (not e!698238))))

(assert (=> b!1230693 (= res!819154 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230694 () Bool)

(declare-fun res!819155 () Bool)

(assert (=> b!1230694 (=> (not res!819155) (not e!698238))))

(assert (=> b!1230694 (= res!819155 (validKeyInArray!0 (select (arr!38315 a!3806) from!3184)))))

(declare-fun b!1230695 () Bool)

(declare-fun res!819158 () Bool)

(assert (=> b!1230695 (=> (not res!819158) (not e!698238))))

(declare-fun contains!7150 (List!27088 (_ BitVec 64)) Bool)

(assert (=> b!1230695 (= res!819158 (not (contains!7150 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230696 () Bool)

(declare-fun res!819157 () Bool)

(assert (=> b!1230696 (=> (not res!819157) (not e!698238))))

(assert (=> b!1230696 (= res!819157 (not (contains!7150 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230697 () Bool)

(declare-fun res!819153 () Bool)

(assert (=> b!1230697 (=> (not res!819153) (not e!698238))))

(declare-fun noDuplicate!1747 (List!27088) Bool)

(assert (=> b!1230697 (= res!819153 (noDuplicate!1747 acc!823))))

(declare-fun b!1230698 () Bool)

(declare-fun res!819152 () Bool)

(assert (=> b!1230698 (=> (not res!819152) (not e!698238))))

(assert (=> b!1230698 (= res!819152 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38851 a!3806)) (bvslt from!3184 (size!38851 a!3806))))))

(assert (= (and start!102252 res!819156) b!1230692))

(assert (= (and b!1230692 res!819160) b!1230698))

(assert (= (and b!1230698 res!819152) b!1230697))

(assert (= (and b!1230697 res!819153) b!1230695))

(assert (= (and b!1230695 res!819158) b!1230696))

(assert (= (and b!1230696 res!819157) b!1230690))

(assert (= (and b!1230690 res!819159) b!1230693))

(assert (= (and b!1230693 res!819154) b!1230694))

(assert (= (and b!1230694 res!819155) b!1230691))

(declare-fun m!1135027 () Bool)

(assert (=> b!1230696 m!1135027))

(declare-fun m!1135029 () Bool)

(assert (=> b!1230697 m!1135029))

(declare-fun m!1135031 () Bool)

(assert (=> b!1230690 m!1135031))

(declare-fun m!1135033 () Bool)

(assert (=> b!1230695 m!1135033))

(declare-fun m!1135035 () Bool)

(assert (=> b!1230694 m!1135035))

(assert (=> b!1230694 m!1135035))

(declare-fun m!1135037 () Bool)

(assert (=> b!1230694 m!1135037))

(declare-fun m!1135039 () Bool)

(assert (=> b!1230693 m!1135039))

(declare-fun m!1135041 () Bool)

(assert (=> start!102252 m!1135041))

(assert (=> b!1230691 m!1135035))

(declare-fun m!1135043 () Bool)

(assert (=> b!1230691 m!1135043))

(declare-fun m!1135045 () Bool)

(assert (=> b!1230692 m!1135045))

(push 1)

(assert (not b!1230697))

(assert (not b!1230691))

(assert (not b!1230692))

(assert (not b!1230694))

(assert (not b!1230693))

(assert (not b!1230696))

(assert (not b!1230695))

(assert (not start!102252))

(assert (not b!1230690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

