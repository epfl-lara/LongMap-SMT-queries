; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102882 () Bool)

(assert start!102882)

(declare-fun res!824488 () Bool)

(declare-fun e!700856 () Bool)

(assert (=> start!102882 (=> (not res!824488) (not e!700856))))

(declare-datatypes ((array!79727 0))(
  ( (array!79728 (arr!38471 (Array (_ BitVec 32) (_ BitVec 64))) (size!39007 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79727)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102882 (= res!824488 (and (bvslt (size!39007 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39007 a!3835))))))

(assert (=> start!102882 e!700856))

(declare-fun array_inv!29319 (array!79727) Bool)

(assert (=> start!102882 (array_inv!29319 a!3835)))

(assert (=> start!102882 true))

(declare-fun b!1236502 () Bool)

(declare-fun res!824485 () Bool)

(assert (=> b!1236502 (=> (not res!824485) (not e!700856))))

(declare-datatypes ((List!27244 0))(
  ( (Nil!27241) (Cons!27240 (h!28449 (_ BitVec 64)) (t!40707 List!27244)) )
))
(declare-fun acc!846 () List!27244)

(declare-fun noDuplicate!1903 (List!27244) Bool)

(assert (=> b!1236502 (= res!824485 (noDuplicate!1903 acc!846))))

(declare-fun b!1236503 () Bool)

(assert (=> b!1236503 (= e!700856 false)))

(declare-fun lt!560804 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7306 (List!27244 (_ BitVec 64)) Bool)

(assert (=> b!1236503 (= lt!560804 (contains!7306 acc!846 k!2925))))

(declare-fun b!1236504 () Bool)

(declare-fun res!824484 () Bool)

(assert (=> b!1236504 (=> (not res!824484) (not e!700856))))

(assert (=> b!1236504 (= res!824484 (not (contains!7306 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236505 () Bool)

(declare-fun res!824486 () Bool)

(assert (=> b!1236505 (=> (not res!824486) (not e!700856))))

(assert (=> b!1236505 (= res!824486 (not (contains!7306 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236506 () Bool)

(declare-fun res!824487 () Bool)

(assert (=> b!1236506 (=> (not res!824487) (not e!700856))))

(declare-fun arrayNoDuplicates!0 (array!79727 (_ BitVec 32) List!27244) Bool)

(assert (=> b!1236506 (= res!824487 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102882 res!824488) b!1236502))

(assert (= (and b!1236502 res!824485) b!1236505))

(assert (= (and b!1236505 res!824486) b!1236504))

(assert (= (and b!1236504 res!824484) b!1236506))

(assert (= (and b!1236506 res!824487) b!1236503))

(declare-fun m!1140295 () Bool)

(assert (=> b!1236502 m!1140295))

(declare-fun m!1140297 () Bool)

(assert (=> b!1236503 m!1140297))

(declare-fun m!1140299 () Bool)

(assert (=> b!1236504 m!1140299))

(declare-fun m!1140301 () Bool)

(assert (=> start!102882 m!1140301))

(declare-fun m!1140303 () Bool)

(assert (=> b!1236505 m!1140303))

(declare-fun m!1140305 () Bool)

(assert (=> b!1236506 m!1140305))

(push 1)

(assert (not b!1236506))

(assert (not b!1236503))

(assert (not b!1236505))

(assert (not b!1236504))

(assert (not start!102882))

(assert (not b!1236502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

