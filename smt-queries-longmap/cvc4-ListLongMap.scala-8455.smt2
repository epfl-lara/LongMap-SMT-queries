; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102868 () Bool)

(assert start!102868)

(declare-fun b!1236388 () Bool)

(declare-fun res!824371 () Bool)

(declare-fun e!700815 () Bool)

(assert (=> b!1236388 (=> (not res!824371) (not e!700815))))

(declare-datatypes ((List!27237 0))(
  ( (Nil!27234) (Cons!27233 (h!28442 (_ BitVec 64)) (t!40700 List!27237)) )
))
(declare-fun acc!846 () List!27237)

(declare-fun contains!7299 (List!27237 (_ BitVec 64)) Bool)

(assert (=> b!1236388 (= res!824371 (not (contains!7299 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236389 () Bool)

(declare-fun res!824370 () Bool)

(assert (=> b!1236389 (=> (not res!824370) (not e!700815))))

(declare-fun noDuplicate!1896 (List!27237) Bool)

(assert (=> b!1236389 (= res!824370 (noDuplicate!1896 acc!846))))

(declare-fun b!1236390 () Bool)

(assert (=> b!1236390 (= e!700815 false)))

(declare-fun lt!560792 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236390 (= lt!560792 (contains!7299 acc!846 k!2925))))

(declare-fun b!1236391 () Bool)

(declare-fun res!824373 () Bool)

(assert (=> b!1236391 (=> (not res!824373) (not e!700815))))

(assert (=> b!1236391 (= res!824373 (not (contains!7299 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236392 () Bool)

(declare-fun res!824372 () Bool)

(assert (=> b!1236392 (=> (not res!824372) (not e!700815))))

(declare-datatypes ((array!79713 0))(
  ( (array!79714 (arr!38464 (Array (_ BitVec 32) (_ BitVec 64))) (size!39000 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79713)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79713 (_ BitVec 32) List!27237) Bool)

(assert (=> b!1236392 (= res!824372 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!824374 () Bool)

(assert (=> start!102868 (=> (not res!824374) (not e!700815))))

(assert (=> start!102868 (= res!824374 (and (bvslt (size!39000 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39000 a!3835))))))

(assert (=> start!102868 e!700815))

(declare-fun array_inv!29312 (array!79713) Bool)

(assert (=> start!102868 (array_inv!29312 a!3835)))

(assert (=> start!102868 true))

(assert (= (and start!102868 res!824374) b!1236389))

(assert (= (and b!1236389 res!824370) b!1236391))

(assert (= (and b!1236391 res!824373) b!1236388))

(assert (= (and b!1236388 res!824371) b!1236392))

(assert (= (and b!1236392 res!824372) b!1236390))

(declare-fun m!1140211 () Bool)

(assert (=> b!1236391 m!1140211))

(declare-fun m!1140213 () Bool)

(assert (=> b!1236392 m!1140213))

(declare-fun m!1140215 () Bool)

(assert (=> b!1236388 m!1140215))

(declare-fun m!1140217 () Bool)

(assert (=> b!1236389 m!1140217))

(declare-fun m!1140219 () Bool)

(assert (=> start!102868 m!1140219))

(declare-fun m!1140221 () Bool)

(assert (=> b!1236390 m!1140221))

(push 1)

(assert (not b!1236392))

(assert (not b!1236388))

(assert (not b!1236390))

(assert (not b!1236389))

(assert (not start!102868))

(assert (not b!1236391))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

