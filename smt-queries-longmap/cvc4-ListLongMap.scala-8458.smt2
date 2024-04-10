; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102886 () Bool)

(assert start!102886)

(declare-fun b!1236532 () Bool)

(declare-fun res!824515 () Bool)

(declare-fun e!700868 () Bool)

(assert (=> b!1236532 (=> (not res!824515) (not e!700868))))

(declare-datatypes ((array!79731 0))(
  ( (array!79732 (arr!38473 (Array (_ BitVec 32) (_ BitVec 64))) (size!39009 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79731)

(declare-datatypes ((List!27246 0))(
  ( (Nil!27243) (Cons!27242 (h!28451 (_ BitVec 64)) (t!40709 List!27246)) )
))
(declare-fun acc!846 () List!27246)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79731 (_ BitVec 32) List!27246) Bool)

(assert (=> b!1236532 (= res!824515 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236533 () Bool)

(declare-fun res!824517 () Bool)

(assert (=> b!1236533 (=> (not res!824517) (not e!700868))))

(declare-fun contains!7308 (List!27246 (_ BitVec 64)) Bool)

(assert (=> b!1236533 (= res!824517 (not (contains!7308 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236534 () Bool)

(declare-fun res!824514 () Bool)

(assert (=> b!1236534 (=> (not res!824514) (not e!700868))))

(declare-fun noDuplicate!1905 (List!27246) Bool)

(assert (=> b!1236534 (= res!824514 (noDuplicate!1905 acc!846))))

(declare-fun b!1236535 () Bool)

(assert (=> b!1236535 (= e!700868 false)))

(declare-fun lt!560810 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236535 (= lt!560810 (contains!7308 acc!846 k!2925))))

(declare-fun b!1236536 () Bool)

(declare-fun res!824516 () Bool)

(assert (=> b!1236536 (=> (not res!824516) (not e!700868))))

(assert (=> b!1236536 (= res!824516 (not (contains!7308 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824518 () Bool)

(assert (=> start!102886 (=> (not res!824518) (not e!700868))))

(assert (=> start!102886 (= res!824518 (and (bvslt (size!39009 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39009 a!3835))))))

(assert (=> start!102886 e!700868))

(declare-fun array_inv!29321 (array!79731) Bool)

(assert (=> start!102886 (array_inv!29321 a!3835)))

(assert (=> start!102886 true))

(assert (= (and start!102886 res!824518) b!1236534))

(assert (= (and b!1236534 res!824514) b!1236536))

(assert (= (and b!1236536 res!824516) b!1236533))

(assert (= (and b!1236533 res!824517) b!1236532))

(assert (= (and b!1236532 res!824515) b!1236535))

(declare-fun m!1140319 () Bool)

(assert (=> b!1236536 m!1140319))

(declare-fun m!1140321 () Bool)

(assert (=> b!1236535 m!1140321))

(declare-fun m!1140323 () Bool)

(assert (=> b!1236532 m!1140323))

(declare-fun m!1140325 () Bool)

(assert (=> start!102886 m!1140325))

(declare-fun m!1140327 () Bool)

(assert (=> b!1236533 m!1140327))

(declare-fun m!1140329 () Bool)

(assert (=> b!1236534 m!1140329))

(push 1)

(assert (not b!1236534))

(assert (not b!1236532))

(assert (not start!102886))

(assert (not b!1236536))

(assert (not b!1236535))

(assert (not b!1236533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

