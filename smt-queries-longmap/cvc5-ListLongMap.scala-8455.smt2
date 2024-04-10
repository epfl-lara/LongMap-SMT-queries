; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102864 () Bool)

(assert start!102864)

(declare-fun b!1236358 () Bool)

(declare-fun res!824343 () Bool)

(declare-fun e!700803 () Bool)

(assert (=> b!1236358 (=> (not res!824343) (not e!700803))))

(declare-datatypes ((List!27235 0))(
  ( (Nil!27232) (Cons!27231 (h!28440 (_ BitVec 64)) (t!40698 List!27235)) )
))
(declare-fun acc!846 () List!27235)

(declare-fun contains!7297 (List!27235 (_ BitVec 64)) Bool)

(assert (=> b!1236358 (= res!824343 (not (contains!7297 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824344 () Bool)

(assert (=> start!102864 (=> (not res!824344) (not e!700803))))

(declare-datatypes ((array!79709 0))(
  ( (array!79710 (arr!38462 (Array (_ BitVec 32) (_ BitVec 64))) (size!38998 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79709)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102864 (= res!824344 (and (bvslt (size!38998 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38998 a!3835))))))

(assert (=> start!102864 e!700803))

(declare-fun array_inv!29310 (array!79709) Bool)

(assert (=> start!102864 (array_inv!29310 a!3835)))

(assert (=> start!102864 true))

(declare-fun b!1236359 () Bool)

(assert (=> b!1236359 (= e!700803 false)))

(declare-fun lt!560786 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236359 (= lt!560786 (contains!7297 acc!846 k!2925))))

(declare-fun b!1236360 () Bool)

(declare-fun res!824342 () Bool)

(assert (=> b!1236360 (=> (not res!824342) (not e!700803))))

(assert (=> b!1236360 (= res!824342 (not (contains!7297 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236361 () Bool)

(declare-fun res!824341 () Bool)

(assert (=> b!1236361 (=> (not res!824341) (not e!700803))))

(declare-fun noDuplicate!1894 (List!27235) Bool)

(assert (=> b!1236361 (= res!824341 (noDuplicate!1894 acc!846))))

(declare-fun b!1236362 () Bool)

(declare-fun res!824340 () Bool)

(assert (=> b!1236362 (=> (not res!824340) (not e!700803))))

(declare-fun arrayNoDuplicates!0 (array!79709 (_ BitVec 32) List!27235) Bool)

(assert (=> b!1236362 (= res!824340 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102864 res!824344) b!1236361))

(assert (= (and b!1236361 res!824341) b!1236358))

(assert (= (and b!1236358 res!824343) b!1236360))

(assert (= (and b!1236360 res!824342) b!1236362))

(assert (= (and b!1236362 res!824340) b!1236359))

(declare-fun m!1140187 () Bool)

(assert (=> start!102864 m!1140187))

(declare-fun m!1140189 () Bool)

(assert (=> b!1236361 m!1140189))

(declare-fun m!1140191 () Bool)

(assert (=> b!1236362 m!1140191))

(declare-fun m!1140193 () Bool)

(assert (=> b!1236360 m!1140193))

(declare-fun m!1140195 () Bool)

(assert (=> b!1236358 m!1140195))

(declare-fun m!1140197 () Bool)

(assert (=> b!1236359 m!1140197))

(push 1)

(assert (not start!102864))

(assert (not b!1236361))

(assert (not b!1236358))

(assert (not b!1236359))

(assert (not b!1236362))

(assert (not b!1236360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

