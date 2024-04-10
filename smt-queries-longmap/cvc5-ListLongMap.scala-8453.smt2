; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102852 () Bool)

(assert start!102852)

(declare-fun b!1236268 () Bool)

(declare-fun res!824254 () Bool)

(declare-fun e!700767 () Bool)

(assert (=> b!1236268 (=> (not res!824254) (not e!700767))))

(declare-datatypes ((List!27229 0))(
  ( (Nil!27226) (Cons!27225 (h!28434 (_ BitVec 64)) (t!40692 List!27229)) )
))
(declare-fun acc!846 () List!27229)

(declare-fun noDuplicate!1888 (List!27229) Bool)

(assert (=> b!1236268 (= res!824254 (noDuplicate!1888 acc!846))))

(declare-fun res!824253 () Bool)

(assert (=> start!102852 (=> (not res!824253) (not e!700767))))

(declare-datatypes ((array!79697 0))(
  ( (array!79698 (arr!38456 (Array (_ BitVec 32) (_ BitVec 64))) (size!38992 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79697)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102852 (= res!824253 (and (bvslt (size!38992 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38992 a!3835))))))

(assert (=> start!102852 e!700767))

(declare-fun array_inv!29304 (array!79697) Bool)

(assert (=> start!102852 (array_inv!29304 a!3835)))

(assert (=> start!102852 true))

(declare-fun b!1236269 () Bool)

(declare-fun res!824251 () Bool)

(assert (=> b!1236269 (=> (not res!824251) (not e!700767))))

(declare-fun contains!7291 (List!27229 (_ BitVec 64)) Bool)

(assert (=> b!1236269 (= res!824251 (not (contains!7291 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236270 () Bool)

(declare-fun res!824250 () Bool)

(assert (=> b!1236270 (=> (not res!824250) (not e!700767))))

(declare-fun arrayNoDuplicates!0 (array!79697 (_ BitVec 32) List!27229) Bool)

(assert (=> b!1236270 (= res!824250 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236271 () Bool)

(declare-fun res!824252 () Bool)

(assert (=> b!1236271 (=> (not res!824252) (not e!700767))))

(assert (=> b!1236271 (= res!824252 (not (contains!7291 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236272 () Bool)

(assert (=> b!1236272 (= e!700767 false)))

(declare-fun lt!560768 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236272 (= lt!560768 (contains!7291 acc!846 k!2925))))

(assert (= (and start!102852 res!824253) b!1236268))

(assert (= (and b!1236268 res!824254) b!1236269))

(assert (= (and b!1236269 res!824251) b!1236271))

(assert (= (and b!1236271 res!824252) b!1236270))

(assert (= (and b!1236270 res!824250) b!1236272))

(declare-fun m!1140115 () Bool)

(assert (=> start!102852 m!1140115))

(declare-fun m!1140117 () Bool)

(assert (=> b!1236269 m!1140117))

(declare-fun m!1140119 () Bool)

(assert (=> b!1236271 m!1140119))

(declare-fun m!1140121 () Bool)

(assert (=> b!1236270 m!1140121))

(declare-fun m!1140123 () Bool)

(assert (=> b!1236268 m!1140123))

(declare-fun m!1140125 () Bool)

(assert (=> b!1236272 m!1140125))

(push 1)

(assert (not b!1236272))

(assert (not b!1236268))

(assert (not b!1236270))

(assert (not b!1236269))

(assert (not start!102852))

(assert (not b!1236271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

