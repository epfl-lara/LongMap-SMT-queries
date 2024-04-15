; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102884 () Bool)

(assert start!102884)

(declare-fun b!1236464 () Bool)

(declare-fun e!700834 () Bool)

(assert (=> b!1236464 (= e!700834 false)))

(declare-fun lt!560636 () Bool)

(declare-datatypes ((List!27308 0))(
  ( (Nil!27305) (Cons!27304 (h!28513 (_ BitVec 64)) (t!40762 List!27308)) )
))
(declare-fun acc!846 () List!27308)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7280 (List!27308 (_ BitVec 64)) Bool)

(assert (=> b!1236464 (= lt!560636 (contains!7280 acc!846 k!2925))))

(declare-fun b!1236465 () Bool)

(declare-fun res!824482 () Bool)

(assert (=> b!1236465 (=> (not res!824482) (not e!700834))))

(declare-datatypes ((array!79652 0))(
  ( (array!79653 (arr!38434 (Array (_ BitVec 32) (_ BitVec 64))) (size!38972 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79652)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79652 (_ BitVec 32) List!27308) Bool)

(assert (=> b!1236465 (= res!824482 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236466 () Bool)

(declare-fun res!824485 () Bool)

(assert (=> b!1236466 (=> (not res!824485) (not e!700834))))

(assert (=> b!1236466 (= res!824485 (not (contains!7280 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824486 () Bool)

(assert (=> start!102884 (=> (not res!824486) (not e!700834))))

(assert (=> start!102884 (= res!824486 (and (bvslt (size!38972 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38972 a!3835))))))

(assert (=> start!102884 e!700834))

(declare-fun array_inv!29417 (array!79652) Bool)

(assert (=> start!102884 (array_inv!29417 a!3835)))

(assert (=> start!102884 true))

(declare-fun b!1236467 () Bool)

(declare-fun res!824484 () Bool)

(assert (=> b!1236467 (=> (not res!824484) (not e!700834))))

(assert (=> b!1236467 (= res!824484 (not (contains!7280 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236468 () Bool)

(declare-fun res!824483 () Bool)

(assert (=> b!1236468 (=> (not res!824483) (not e!700834))))

(declare-fun noDuplicate!1923 (List!27308) Bool)

(assert (=> b!1236468 (= res!824483 (noDuplicate!1923 acc!846))))

(assert (= (and start!102884 res!824486) b!1236468))

(assert (= (and b!1236468 res!824483) b!1236467))

(assert (= (and b!1236467 res!824484) b!1236466))

(assert (= (and b!1236466 res!824485) b!1236465))

(assert (= (and b!1236465 res!824482) b!1236464))

(declare-fun m!1139823 () Bool)

(assert (=> b!1236468 m!1139823))

(declare-fun m!1139825 () Bool)

(assert (=> b!1236464 m!1139825))

(declare-fun m!1139827 () Bool)

(assert (=> b!1236466 m!1139827))

(declare-fun m!1139829 () Bool)

(assert (=> b!1236467 m!1139829))

(declare-fun m!1139831 () Bool)

(assert (=> start!102884 m!1139831))

(declare-fun m!1139833 () Bool)

(assert (=> b!1236465 m!1139833))

(push 1)

(assert (not b!1236464))

(assert (not b!1236466))

(assert (not b!1236465))

(assert (not b!1236467))

(assert (not start!102884))

(assert (not b!1236468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

