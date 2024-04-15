; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102866 () Bool)

(assert start!102866)

(declare-fun b!1236320 () Bool)

(declare-fun e!700780 () Bool)

(assert (=> b!1236320 (= e!700780 false)))

(declare-fun lt!560618 () Bool)

(declare-datatypes ((List!27299 0))(
  ( (Nil!27296) (Cons!27295 (h!28504 (_ BitVec 64)) (t!40753 List!27299)) )
))
(declare-fun acc!846 () List!27299)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7271 (List!27299 (_ BitVec 64)) Bool)

(assert (=> b!1236320 (= lt!560618 (contains!7271 acc!846 k!2925))))

(declare-fun b!1236321 () Bool)

(declare-fun res!824339 () Bool)

(assert (=> b!1236321 (=> (not res!824339) (not e!700780))))

(assert (=> b!1236321 (= res!824339 (not (contains!7271 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824342 () Bool)

(assert (=> start!102866 (=> (not res!824342) (not e!700780))))

(declare-datatypes ((array!79634 0))(
  ( (array!79635 (arr!38425 (Array (_ BitVec 32) (_ BitVec 64))) (size!38963 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79634)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102866 (= res!824342 (and (bvslt (size!38963 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38963 a!3835))))))

(assert (=> start!102866 e!700780))

(declare-fun array_inv!29408 (array!79634) Bool)

(assert (=> start!102866 (array_inv!29408 a!3835)))

(assert (=> start!102866 true))

(declare-fun b!1236322 () Bool)

(declare-fun res!824340 () Bool)

(assert (=> b!1236322 (=> (not res!824340) (not e!700780))))

(assert (=> b!1236322 (= res!824340 (not (contains!7271 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236323 () Bool)

(declare-fun res!824338 () Bool)

(assert (=> b!1236323 (=> (not res!824338) (not e!700780))))

(declare-fun arrayNoDuplicates!0 (array!79634 (_ BitVec 32) List!27299) Bool)

(assert (=> b!1236323 (= res!824338 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236324 () Bool)

(declare-fun res!824341 () Bool)

(assert (=> b!1236324 (=> (not res!824341) (not e!700780))))

(declare-fun noDuplicate!1914 (List!27299) Bool)

(assert (=> b!1236324 (= res!824341 (noDuplicate!1914 acc!846))))

(assert (= (and start!102866 res!824342) b!1236324))

(assert (= (and b!1236324 res!824341) b!1236322))

(assert (= (and b!1236322 res!824340) b!1236321))

(assert (= (and b!1236321 res!824339) b!1236323))

(assert (= (and b!1236323 res!824338) b!1236320))

(declare-fun m!1139715 () Bool)

(assert (=> b!1236322 m!1139715))

(declare-fun m!1139717 () Bool)

(assert (=> start!102866 m!1139717))

(declare-fun m!1139719 () Bool)

(assert (=> b!1236324 m!1139719))

(declare-fun m!1139721 () Bool)

(assert (=> b!1236323 m!1139721))

(declare-fun m!1139723 () Bool)

(assert (=> b!1236320 m!1139723))

(declare-fun m!1139725 () Bool)

(assert (=> b!1236321 m!1139725))

(push 1)

(assert (not b!1236320))

(assert (not b!1236322))

(assert (not start!102866))

(assert (not b!1236323))

(assert (not b!1236324))

(assert (not b!1236321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

