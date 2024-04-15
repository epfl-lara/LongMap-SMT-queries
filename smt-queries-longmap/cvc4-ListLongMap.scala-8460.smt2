; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102894 () Bool)

(assert start!102894)

(declare-fun b!1236581 () Bool)

(declare-fun e!700865 () Bool)

(assert (=> b!1236581 (= e!700865 (not true))))

(declare-datatypes ((List!27313 0))(
  ( (Nil!27310) (Cons!27309 (h!28518 (_ BitVec 64)) (t!40767 List!27313)) )
))
(declare-fun lt!560666 () List!27313)

(declare-fun subseq!567 (List!27313 List!27313) Bool)

(assert (=> b!1236581 (subseq!567 lt!560666 lt!560666)))

(declare-datatypes ((Unit!40867 0))(
  ( (Unit!40868) )
))
(declare-fun lt!560665 () Unit!40867)

(declare-fun lemmaListSubSeqRefl!0 (List!27313) Unit!40867)

(assert (=> b!1236581 (= lt!560665 (lemmaListSubSeqRefl!0 lt!560666))))

(declare-datatypes ((array!79662 0))(
  ( (array!79663 (arr!38439 (Array (_ BitVec 32) (_ BitVec 64))) (size!38977 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79662)

(declare-fun acc!846 () List!27313)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1236581 (= lt!560666 (Cons!27309 (select (arr!38439 a!3835) from!3213) acc!846))))

(declare-fun b!1236582 () Bool)

(declare-fun res!824602 () Bool)

(assert (=> b!1236582 (=> (not res!824602) (not e!700865))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7285 (List!27313 (_ BitVec 64)) Bool)

(assert (=> b!1236582 (= res!824602 (contains!7285 acc!846 k!2925))))

(declare-fun b!1236584 () Bool)

(declare-fun res!824606 () Bool)

(assert (=> b!1236584 (=> (not res!824606) (not e!700865))))

(assert (=> b!1236584 (= res!824606 (not (contains!7285 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236585 () Bool)

(declare-fun res!824599 () Bool)

(assert (=> b!1236585 (=> (not res!824599) (not e!700865))))

(assert (=> b!1236585 (= res!824599 (not (contains!7285 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236586 () Bool)

(declare-fun res!824603 () Bool)

(assert (=> b!1236586 (=> (not res!824603) (not e!700865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236586 (= res!824603 (validKeyInArray!0 (select (arr!38439 a!3835) from!3213)))))

(declare-fun b!1236587 () Bool)

(declare-fun res!824605 () Bool)

(assert (=> b!1236587 (=> (not res!824605) (not e!700865))))

(assert (=> b!1236587 (= res!824605 (not (= from!3213 (bvsub (size!38977 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236588 () Bool)

(declare-fun res!824601 () Bool)

(assert (=> b!1236588 (=> (not res!824601) (not e!700865))))

(declare-fun arrayNoDuplicates!0 (array!79662 (_ BitVec 32) List!27313) Bool)

(assert (=> b!1236588 (= res!824601 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!824604 () Bool)

(assert (=> start!102894 (=> (not res!824604) (not e!700865))))

(assert (=> start!102894 (= res!824604 (and (bvslt (size!38977 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38977 a!3835))))))

(assert (=> start!102894 e!700865))

(declare-fun array_inv!29422 (array!79662) Bool)

(assert (=> start!102894 (array_inv!29422 a!3835)))

(assert (=> start!102894 true))

(declare-fun b!1236583 () Bool)

(declare-fun res!824600 () Bool)

(assert (=> b!1236583 (=> (not res!824600) (not e!700865))))

(declare-fun noDuplicate!1928 (List!27313) Bool)

(assert (=> b!1236583 (= res!824600 (noDuplicate!1928 acc!846))))

(assert (= (and start!102894 res!824604) b!1236583))

(assert (= (and b!1236583 res!824600) b!1236584))

(assert (= (and b!1236584 res!824606) b!1236585))

(assert (= (and b!1236585 res!824599) b!1236588))

(assert (= (and b!1236588 res!824601) b!1236582))

(assert (= (and b!1236582 res!824602) b!1236587))

(assert (= (and b!1236587 res!824605) b!1236586))

(assert (= (and b!1236586 res!824603) b!1236581))

(declare-fun m!1139915 () Bool)

(assert (=> b!1236584 m!1139915))

(declare-fun m!1139917 () Bool)

(assert (=> b!1236582 m!1139917))

(declare-fun m!1139919 () Bool)

(assert (=> b!1236585 m!1139919))

(declare-fun m!1139921 () Bool)

(assert (=> b!1236588 m!1139921))

(declare-fun m!1139923 () Bool)

(assert (=> b!1236586 m!1139923))

(assert (=> b!1236586 m!1139923))

(declare-fun m!1139925 () Bool)

(assert (=> b!1236586 m!1139925))

(declare-fun m!1139927 () Bool)

(assert (=> start!102894 m!1139927))

(declare-fun m!1139929 () Bool)

(assert (=> b!1236581 m!1139929))

(declare-fun m!1139931 () Bool)

(assert (=> b!1236581 m!1139931))

(assert (=> b!1236581 m!1139923))

(declare-fun m!1139933 () Bool)

(assert (=> b!1236583 m!1139933))

(push 1)

(assert (not b!1236581))

(assert (not b!1236588))

(assert (not b!1236582))

(assert (not b!1236586))

(assert (not b!1236585))

(assert (not b!1236584))

(assert (not b!1236583))

(assert (not start!102894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

