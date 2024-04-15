; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102872 () Bool)

(assert start!102872)

(declare-fun b!1236373 () Bool)

(declare-fun res!824391 () Bool)

(declare-fun e!700799 () Bool)

(assert (=> b!1236373 (=> (not res!824391) (not e!700799))))

(declare-datatypes ((array!79640 0))(
  ( (array!79641 (arr!38428 (Array (_ BitVec 32) (_ BitVec 64))) (size!38966 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79640)

(declare-datatypes ((List!27302 0))(
  ( (Nil!27299) (Cons!27298 (h!28507 (_ BitVec 64)) (t!40756 List!27302)) )
))
(declare-fun acc!846 () List!27302)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79640 (_ BitVec 32) List!27302) Bool)

(assert (=> b!1236373 (= res!824391 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236374 () Bool)

(declare-fun res!824393 () Bool)

(assert (=> b!1236374 (=> (not res!824393) (not e!700799))))

(declare-fun contains!7274 (List!27302 (_ BitVec 64)) Bool)

(assert (=> b!1236374 (= res!824393 (not (contains!7274 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824392 () Bool)

(assert (=> start!102872 (=> (not res!824392) (not e!700799))))

(assert (=> start!102872 (= res!824392 (and (bvslt (size!38966 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38966 a!3835))))))

(assert (=> start!102872 e!700799))

(declare-fun array_inv!29411 (array!79640) Bool)

(assert (=> start!102872 (array_inv!29411 a!3835)))

(assert (=> start!102872 true))

(declare-fun b!1236375 () Bool)

(assert (=> b!1236375 (= e!700799 (bvslt (bvsub (size!38966 a!3835) from!3213) #b00000000000000000000000000000000))))

(declare-fun b!1236376 () Bool)

(declare-fun res!824396 () Bool)

(assert (=> b!1236376 (=> (not res!824396) (not e!700799))))

(declare-fun noDuplicate!1917 (List!27302) Bool)

(assert (=> b!1236376 (= res!824396 (noDuplicate!1917 acc!846))))

(declare-fun b!1236377 () Bool)

(declare-fun res!824395 () Bool)

(assert (=> b!1236377 (=> (not res!824395) (not e!700799))))

(assert (=> b!1236377 (= res!824395 (not (contains!7274 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236378 () Bool)

(declare-fun res!824394 () Bool)

(assert (=> b!1236378 (=> (not res!824394) (not e!700799))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236378 (= res!824394 (contains!7274 acc!846 k!2925))))

(assert (= (and start!102872 res!824392) b!1236376))

(assert (= (and b!1236376 res!824396) b!1236374))

(assert (= (and b!1236374 res!824393) b!1236377))

(assert (= (and b!1236377 res!824395) b!1236373))

(assert (= (and b!1236373 res!824391) b!1236378))

(assert (= (and b!1236378 res!824394) b!1236375))

(declare-fun m!1139751 () Bool)

(assert (=> b!1236373 m!1139751))

(declare-fun m!1139753 () Bool)

(assert (=> b!1236376 m!1139753))

(declare-fun m!1139755 () Bool)

(assert (=> start!102872 m!1139755))

(declare-fun m!1139757 () Bool)

(assert (=> b!1236374 m!1139757))

(declare-fun m!1139759 () Bool)

(assert (=> b!1236378 m!1139759))

(declare-fun m!1139761 () Bool)

(assert (=> b!1236377 m!1139761))

(push 1)

(assert (not b!1236376))

(assert (not b!1236373))

(assert (not b!1236377))

(assert (not b!1236374))

(assert (not start!102872))

(assert (not b!1236378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

