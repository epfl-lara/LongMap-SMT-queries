; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102606 () Bool)

(assert start!102606)

(declare-fun b!1232857 () Bool)

(declare-fun res!820490 () Bool)

(declare-fun e!699517 () Bool)

(assert (=> b!1232857 (=> (not res!820490) (not e!699517))))

(declare-datatypes ((List!27131 0))(
  ( (Nil!27128) (Cons!27127 (h!28345 (_ BitVec 64)) (t!40586 List!27131)) )
))
(declare-fun acc!823 () List!27131)

(declare-fun contains!7202 (List!27131 (_ BitVec 64)) Bool)

(assert (=> b!1232857 (= res!820490 (not (contains!7202 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232858 () Bool)

(declare-fun e!699516 () Bool)

(assert (=> b!1232858 (= e!699517 (not e!699516))))

(declare-fun res!820480 () Bool)

(assert (=> b!1232858 (=> res!820480 e!699516)))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79472 0))(
  ( (array!79473 (arr!38345 (Array (_ BitVec 32) (_ BitVec 64))) (size!38882 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79472)

(assert (=> b!1232858 (= res!820480 (bvsgt from!3184 (size!38882 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79472 (_ BitVec 32) List!27131) Bool)

(assert (=> b!1232858 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27127 (select (arr!38345 a!3806) from!3184) acc!823))))

(declare-fun b!1232860 () Bool)

(declare-fun res!820488 () Bool)

(assert (=> b!1232860 (=> (not res!820488) (not e!699517))))

(declare-fun noDuplicate!1783 (List!27131) Bool)

(assert (=> b!1232860 (= res!820488 (noDuplicate!1783 acc!823))))

(declare-fun b!1232861 () Bool)

(declare-fun res!820483 () Bool)

(assert (=> b!1232861 (=> (not res!820483) (not e!699517))))

(assert (=> b!1232861 (= res!820483 (not (contains!7202 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232862 () Bool)

(assert (=> b!1232862 (= e!699516 true)))

(declare-datatypes ((Unit!40745 0))(
  ( (Unit!40746) )
))
(declare-fun lt!559908 () Unit!40745)

(declare-fun noDuplicateSubseq!53 (List!27131 List!27131) Unit!40745)

(assert (=> b!1232862 (= lt!559908 (noDuplicateSubseq!53 Nil!27128 acc!823))))

(declare-fun b!1232863 () Bool)

(declare-fun res!820481 () Bool)

(assert (=> b!1232863 (=> res!820481 e!699516)))

(declare-fun subseq!503 (List!27131 List!27131) Bool)

(assert (=> b!1232863 (= res!820481 (not (subseq!503 Nil!27128 acc!823)))))

(declare-fun b!1232864 () Bool)

(declare-fun res!820485 () Bool)

(assert (=> b!1232864 (=> (not res!820485) (not e!699517))))

(assert (=> b!1232864 (= res!820485 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232865 () Bool)

(declare-fun res!820478 () Bool)

(assert (=> b!1232865 (=> (not res!820478) (not e!699517))))

(assert (=> b!1232865 (= res!820478 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38882 a!3806)) (bvslt from!3184 (size!38882 a!3806))))))

(declare-fun b!1232866 () Bool)

(declare-fun res!820484 () Bool)

(assert (=> b!1232866 (=> (not res!820484) (not e!699517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232866 (= res!820484 (validKeyInArray!0 (select (arr!38345 a!3806) from!3184)))))

(declare-fun b!1232867 () Bool)

(declare-fun res!820489 () Bool)

(assert (=> b!1232867 (=> (not res!820489) (not e!699517))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1232867 (= res!820489 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232859 () Bool)

(declare-fun res!820486 () Bool)

(assert (=> b!1232859 (=> res!820486 e!699516)))

(assert (=> b!1232859 (= res!820486 (contains!7202 Nil!27128 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!820482 () Bool)

(assert (=> start!102606 (=> (not res!820482) (not e!699517))))

(assert (=> start!102606 (= res!820482 (bvslt (size!38882 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102606 e!699517))

(declare-fun array_inv!29283 (array!79472) Bool)

(assert (=> start!102606 (array_inv!29283 a!3806)))

(assert (=> start!102606 true))

(declare-fun b!1232868 () Bool)

(declare-fun res!820487 () Bool)

(assert (=> b!1232868 (=> (not res!820487) (not e!699517))))

(declare-fun arrayContainsKey!0 (array!79472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232868 (= res!820487 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232869 () Bool)

(declare-fun res!820479 () Bool)

(assert (=> b!1232869 (=> res!820479 e!699516)))

(assert (=> b!1232869 (= res!820479 (contains!7202 Nil!27128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102606 res!820482) b!1232867))

(assert (= (and b!1232867 res!820489) b!1232865))

(assert (= (and b!1232865 res!820478) b!1232860))

(assert (= (and b!1232860 res!820488) b!1232857))

(assert (= (and b!1232857 res!820490) b!1232861))

(assert (= (and b!1232861 res!820483) b!1232868))

(assert (= (and b!1232868 res!820487) b!1232864))

(assert (= (and b!1232864 res!820485) b!1232866))

(assert (= (and b!1232866 res!820484) b!1232858))

(assert (= (and b!1232858 (not res!820480)) b!1232869))

(assert (= (and b!1232869 (not res!820479)) b!1232859))

(assert (= (and b!1232859 (not res!820486)) b!1232863))

(assert (= (and b!1232863 (not res!820481)) b!1232862))

(declare-fun m!1137315 () Bool)

(assert (=> b!1232869 m!1137315))

(declare-fun m!1137317 () Bool)

(assert (=> b!1232860 m!1137317))

(declare-fun m!1137319 () Bool)

(assert (=> b!1232862 m!1137319))

(declare-fun m!1137321 () Bool)

(assert (=> b!1232867 m!1137321))

(declare-fun m!1137323 () Bool)

(assert (=> b!1232861 m!1137323))

(declare-fun m!1137325 () Bool)

(assert (=> b!1232864 m!1137325))

(declare-fun m!1137327 () Bool)

(assert (=> b!1232857 m!1137327))

(declare-fun m!1137329 () Bool)

(assert (=> b!1232863 m!1137329))

(declare-fun m!1137331 () Bool)

(assert (=> start!102606 m!1137331))

(declare-fun m!1137333 () Bool)

(assert (=> b!1232868 m!1137333))

(declare-fun m!1137335 () Bool)

(assert (=> b!1232859 m!1137335))

(declare-fun m!1137337 () Bool)

(assert (=> b!1232858 m!1137337))

(declare-fun m!1137339 () Bool)

(assert (=> b!1232858 m!1137339))

(assert (=> b!1232866 m!1137337))

(assert (=> b!1232866 m!1137337))

(declare-fun m!1137341 () Bool)

(assert (=> b!1232866 m!1137341))

(check-sat (not b!1232863) (not b!1232866) (not b!1232862) (not b!1232869) (not start!102606) (not b!1232857) (not b!1232859) (not b!1232867) (not b!1232868) (not b!1232860) (not b!1232861) (not b!1232858) (not b!1232864))
(check-sat)
