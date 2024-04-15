; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102860 () Bool)

(assert start!102860)

(declare-fun b!1236275 () Bool)

(declare-fun res!824293 () Bool)

(declare-fun e!700763 () Bool)

(assert (=> b!1236275 (=> (not res!824293) (not e!700763))))

(declare-datatypes ((List!27296 0))(
  ( (Nil!27293) (Cons!27292 (h!28501 (_ BitVec 64)) (t!40750 List!27296)) )
))
(declare-fun acc!846 () List!27296)

(declare-fun contains!7268 (List!27296 (_ BitVec 64)) Bool)

(assert (=> b!1236275 (= res!824293 (not (contains!7268 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236276 () Bool)

(assert (=> b!1236276 (= e!700763 false)))

(declare-fun lt!560609 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236276 (= lt!560609 (contains!7268 acc!846 k!2925))))

(declare-fun b!1236277 () Bool)

(declare-fun res!824297 () Bool)

(assert (=> b!1236277 (=> (not res!824297) (not e!700763))))

(declare-fun noDuplicate!1911 (List!27296) Bool)

(assert (=> b!1236277 (= res!824297 (noDuplicate!1911 acc!846))))

(declare-fun b!1236278 () Bool)

(declare-fun res!824296 () Bool)

(assert (=> b!1236278 (=> (not res!824296) (not e!700763))))

(assert (=> b!1236278 (= res!824296 (not (contains!7268 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824294 () Bool)

(assert (=> start!102860 (=> (not res!824294) (not e!700763))))

(declare-datatypes ((array!79628 0))(
  ( (array!79629 (arr!38422 (Array (_ BitVec 32) (_ BitVec 64))) (size!38960 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79628)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102860 (= res!824294 (and (bvslt (size!38960 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38960 a!3835))))))

(assert (=> start!102860 e!700763))

(declare-fun array_inv!29405 (array!79628) Bool)

(assert (=> start!102860 (array_inv!29405 a!3835)))

(assert (=> start!102860 true))

(declare-fun b!1236279 () Bool)

(declare-fun res!824295 () Bool)

(assert (=> b!1236279 (=> (not res!824295) (not e!700763))))

(declare-fun arrayNoDuplicates!0 (array!79628 (_ BitVec 32) List!27296) Bool)

(assert (=> b!1236279 (= res!824295 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102860 res!824294) b!1236277))

(assert (= (and b!1236277 res!824297) b!1236278))

(assert (= (and b!1236278 res!824296) b!1236275))

(assert (= (and b!1236275 res!824293) b!1236279))

(assert (= (and b!1236279 res!824295) b!1236276))

(declare-fun m!1139679 () Bool)

(assert (=> b!1236277 m!1139679))

(declare-fun m!1139681 () Bool)

(assert (=> b!1236279 m!1139681))

(declare-fun m!1139683 () Bool)

(assert (=> b!1236276 m!1139683))

(declare-fun m!1139685 () Bool)

(assert (=> b!1236275 m!1139685))

(declare-fun m!1139687 () Bool)

(assert (=> b!1236278 m!1139687))

(declare-fun m!1139689 () Bool)

(assert (=> start!102860 m!1139689))

(push 1)

(assert (not b!1236276))

(assert (not b!1236277))

(assert (not b!1236275))

(assert (not b!1236278))

(assert (not start!102860))

(assert (not b!1236279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

