; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102908 () Bool)

(assert start!102908)

(declare-fun res!822895 () Bool)

(declare-fun e!700856 () Bool)

(assert (=> start!102908 (=> (not res!822895) (not e!700856))))

(declare-datatypes ((array!79596 0))(
  ( (array!79597 (arr!38401 (Array (_ BitVec 32) (_ BitVec 64))) (size!38938 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79596)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102908 (= res!822895 (and (bvslt (size!38938 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38938 a!3835))))))

(assert (=> start!102908 e!700856))

(declare-fun array_inv!29339 (array!79596) Bool)

(assert (=> start!102908 (array_inv!29339 a!3835)))

(assert (=> start!102908 true))

(declare-fun b!1235507 () Bool)

(declare-fun res!822897 () Bool)

(assert (=> b!1235507 (=> (not res!822897) (not e!700856))))

(declare-datatypes ((List!27187 0))(
  ( (Nil!27184) (Cons!27183 (h!28401 (_ BitVec 64)) (t!40642 List!27187)) )
))
(declare-fun acc!846 () List!27187)

(declare-fun contains!7258 (List!27187 (_ BitVec 64)) Bool)

(assert (=> b!1235507 (= res!822897 (not (contains!7258 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235506 () Bool)

(declare-fun res!822896 () Bool)

(assert (=> b!1235506 (=> (not res!822896) (not e!700856))))

(assert (=> b!1235506 (= res!822896 (not (contains!7258 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235505 () Bool)

(declare-fun res!822894 () Bool)

(assert (=> b!1235505 (=> (not res!822894) (not e!700856))))

(declare-fun noDuplicate!1839 (List!27187) Bool)

(assert (=> b!1235505 (= res!822894 (noDuplicate!1839 acc!846))))

(declare-fun b!1235508 () Bool)

(assert (=> b!1235508 (= e!700856 (bvsgt from!3213 (size!38938 a!3835)))))

(assert (= (and start!102908 res!822895) b!1235505))

(assert (= (and b!1235505 res!822894) b!1235506))

(assert (= (and b!1235506 res!822896) b!1235507))

(assert (= (and b!1235507 res!822897) b!1235508))

(declare-fun m!1139841 () Bool)

(assert (=> start!102908 m!1139841))

(declare-fun m!1139843 () Bool)

(assert (=> b!1235507 m!1139843))

(declare-fun m!1139845 () Bool)

(assert (=> b!1235506 m!1139845))

(declare-fun m!1139847 () Bool)

(assert (=> b!1235505 m!1139847))

(push 1)

(assert (not b!1235506))

(assert (not b!1235507))

(assert (not b!1235505))

(assert (not start!102908))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

