; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102878 () Bool)

(assert start!102878)

(declare-fun res!824457 () Bool)

(declare-fun e!700845 () Bool)

(assert (=> start!102878 (=> (not res!824457) (not e!700845))))

(declare-datatypes ((array!79723 0))(
  ( (array!79724 (arr!38469 (Array (_ BitVec 32) (_ BitVec 64))) (size!39005 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79723)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102878 (= res!824457 (and (bvslt (size!39005 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39005 a!3835))))))

(assert (=> start!102878 e!700845))

(declare-fun array_inv!29317 (array!79723) Bool)

(assert (=> start!102878 (array_inv!29317 a!3835)))

(assert (=> start!102878 true))

(declare-fun b!1236472 () Bool)

(assert (=> b!1236472 (= e!700845 false)))

(declare-fun lt!560798 () Bool)

(declare-datatypes ((List!27242 0))(
  ( (Nil!27239) (Cons!27238 (h!28447 (_ BitVec 64)) (t!40705 List!27242)) )
))
(declare-fun acc!846 () List!27242)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7304 (List!27242 (_ BitVec 64)) Bool)

(assert (=> b!1236472 (= lt!560798 (contains!7304 acc!846 k0!2925))))

(declare-fun b!1236473 () Bool)

(declare-fun res!824455 () Bool)

(assert (=> b!1236473 (=> (not res!824455) (not e!700845))))

(assert (=> b!1236473 (= res!824455 (not (contains!7304 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236474 () Bool)

(declare-fun res!824458 () Bool)

(assert (=> b!1236474 (=> (not res!824458) (not e!700845))))

(declare-fun arrayNoDuplicates!0 (array!79723 (_ BitVec 32) List!27242) Bool)

(assert (=> b!1236474 (= res!824458 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236475 () Bool)

(declare-fun res!824456 () Bool)

(assert (=> b!1236475 (=> (not res!824456) (not e!700845))))

(declare-fun noDuplicate!1901 (List!27242) Bool)

(assert (=> b!1236475 (= res!824456 (noDuplicate!1901 acc!846))))

(declare-fun b!1236476 () Bool)

(declare-fun res!824454 () Bool)

(assert (=> b!1236476 (=> (not res!824454) (not e!700845))))

(assert (=> b!1236476 (= res!824454 (not (contains!7304 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102878 res!824457) b!1236475))

(assert (= (and b!1236475 res!824456) b!1236473))

(assert (= (and b!1236473 res!824455) b!1236476))

(assert (= (and b!1236476 res!824454) b!1236474))

(assert (= (and b!1236474 res!824458) b!1236472))

(declare-fun m!1140271 () Bool)

(assert (=> start!102878 m!1140271))

(declare-fun m!1140273 () Bool)

(assert (=> b!1236474 m!1140273))

(declare-fun m!1140275 () Bool)

(assert (=> b!1236476 m!1140275))

(declare-fun m!1140277 () Bool)

(assert (=> b!1236475 m!1140277))

(declare-fun m!1140279 () Bool)

(assert (=> b!1236472 m!1140279))

(declare-fun m!1140281 () Bool)

(assert (=> b!1236473 m!1140281))

(check-sat (not b!1236476) (not b!1236474) (not start!102878) (not b!1236472) (not b!1236475) (not b!1236473))
