; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102854 () Bool)

(assert start!102854)

(declare-fun res!824249 () Bool)

(declare-fun e!700744 () Bool)

(assert (=> start!102854 (=> (not res!824249) (not e!700744))))

(declare-datatypes ((array!79622 0))(
  ( (array!79623 (arr!38419 (Array (_ BitVec 32) (_ BitVec 64))) (size!38957 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79622)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102854 (= res!824249 (and (bvslt (size!38957 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38957 a!3835))))))

(assert (=> start!102854 e!700744))

(declare-fun array_inv!29402 (array!79622) Bool)

(assert (=> start!102854 (array_inv!29402 a!3835)))

(assert (=> start!102854 true))

(declare-fun b!1236230 () Bool)

(declare-fun res!824252 () Bool)

(assert (=> b!1236230 (=> (not res!824252) (not e!700744))))

(declare-datatypes ((List!27293 0))(
  ( (Nil!27290) (Cons!27289 (h!28498 (_ BitVec 64)) (t!40747 List!27293)) )
))
(declare-fun acc!846 () List!27293)

(declare-fun arrayNoDuplicates!0 (array!79622 (_ BitVec 32) List!27293) Bool)

(assert (=> b!1236230 (= res!824252 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236231 () Bool)

(declare-fun res!824248 () Bool)

(assert (=> b!1236231 (=> (not res!824248) (not e!700744))))

(declare-fun contains!7265 (List!27293 (_ BitVec 64)) Bool)

(assert (=> b!1236231 (= res!824248 (not (contains!7265 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236232 () Bool)

(declare-fun res!824251 () Bool)

(assert (=> b!1236232 (=> (not res!824251) (not e!700744))))

(declare-fun noDuplicate!1908 (List!27293) Bool)

(assert (=> b!1236232 (= res!824251 (noDuplicate!1908 acc!846))))

(declare-fun b!1236233 () Bool)

(assert (=> b!1236233 (= e!700744 false)))

(declare-fun lt!560600 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236233 (= lt!560600 (contains!7265 acc!846 k!2925))))

(declare-fun b!1236234 () Bool)

(declare-fun res!824250 () Bool)

(assert (=> b!1236234 (=> (not res!824250) (not e!700744))))

(assert (=> b!1236234 (= res!824250 (not (contains!7265 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102854 res!824249) b!1236232))

(assert (= (and b!1236232 res!824251) b!1236234))

(assert (= (and b!1236234 res!824250) b!1236231))

(assert (= (and b!1236231 res!824248) b!1236230))

(assert (= (and b!1236230 res!824252) b!1236233))

(declare-fun m!1139643 () Bool)

(assert (=> b!1236233 m!1139643))

(declare-fun m!1139645 () Bool)

(assert (=> b!1236232 m!1139645))

(declare-fun m!1139647 () Bool)

(assert (=> b!1236234 m!1139647))

(declare-fun m!1139649 () Bool)

(assert (=> start!102854 m!1139649))

(declare-fun m!1139651 () Bool)

(assert (=> b!1236230 m!1139651))

(declare-fun m!1139653 () Bool)

(assert (=> b!1236231 m!1139653))

(push 1)

(assert (not b!1236234))

(assert (not start!102854))

(assert (not b!1236232))

(assert (not b!1236231))

(assert (not b!1236230))

(assert (not b!1236233))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

