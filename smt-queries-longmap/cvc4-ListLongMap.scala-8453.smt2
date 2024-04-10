; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102856 () Bool)

(assert start!102856)

(declare-fun b!1236298 () Bool)

(declare-fun res!824282 () Bool)

(declare-fun e!700778 () Bool)

(assert (=> b!1236298 (=> (not res!824282) (not e!700778))))

(declare-datatypes ((List!27231 0))(
  ( (Nil!27228) (Cons!27227 (h!28436 (_ BitVec 64)) (t!40694 List!27231)) )
))
(declare-fun acc!846 () List!27231)

(declare-fun contains!7293 (List!27231 (_ BitVec 64)) Bool)

(assert (=> b!1236298 (= res!824282 (not (contains!7293 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236299 () Bool)

(declare-fun res!824281 () Bool)

(assert (=> b!1236299 (=> (not res!824281) (not e!700778))))

(assert (=> b!1236299 (= res!824281 (not (contains!7293 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236300 () Bool)

(declare-fun res!824284 () Bool)

(assert (=> b!1236300 (=> (not res!824284) (not e!700778))))

(declare-fun noDuplicate!1890 (List!27231) Bool)

(assert (=> b!1236300 (= res!824284 (noDuplicate!1890 acc!846))))

(declare-fun res!824283 () Bool)

(assert (=> start!102856 (=> (not res!824283) (not e!700778))))

(declare-datatypes ((array!79701 0))(
  ( (array!79702 (arr!38458 (Array (_ BitVec 32) (_ BitVec 64))) (size!38994 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79701)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102856 (= res!824283 (and (bvslt (size!38994 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38994 a!3835))))))

(assert (=> start!102856 e!700778))

(declare-fun array_inv!29306 (array!79701) Bool)

(assert (=> start!102856 (array_inv!29306 a!3835)))

(assert (=> start!102856 true))

(declare-fun b!1236301 () Bool)

(declare-fun res!824280 () Bool)

(assert (=> b!1236301 (=> (not res!824280) (not e!700778))))

(declare-fun arrayNoDuplicates!0 (array!79701 (_ BitVec 32) List!27231) Bool)

(assert (=> b!1236301 (= res!824280 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236302 () Bool)

(assert (=> b!1236302 (= e!700778 false)))

(declare-fun lt!560774 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236302 (= lt!560774 (contains!7293 acc!846 k!2925))))

(assert (= (and start!102856 res!824283) b!1236300))

(assert (= (and b!1236300 res!824284) b!1236298))

(assert (= (and b!1236298 res!824282) b!1236299))

(assert (= (and b!1236299 res!824281) b!1236301))

(assert (= (and b!1236301 res!824280) b!1236302))

(declare-fun m!1140139 () Bool)

(assert (=> b!1236298 m!1140139))

(declare-fun m!1140141 () Bool)

(assert (=> b!1236300 m!1140141))

(declare-fun m!1140143 () Bool)

(assert (=> b!1236302 m!1140143))

(declare-fun m!1140145 () Bool)

(assert (=> b!1236299 m!1140145))

(declare-fun m!1140147 () Bool)

(assert (=> start!102856 m!1140147))

(declare-fun m!1140149 () Bool)

(assert (=> b!1236301 m!1140149))

(push 1)

(assert (not b!1236302))

(assert (not b!1236301))

(assert (not start!102856))

(assert (not b!1236299))

(assert (not b!1236300))

(assert (not b!1236298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

