; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101868 () Bool)

(assert start!101868)

(declare-fun b!1226839 () Bool)

(declare-fun res!815489 () Bool)

(declare-fun e!696674 () Bool)

(assert (=> b!1226839 (=> (not res!815489) (not e!696674))))

(declare-datatypes ((List!27002 0))(
  ( (Nil!26999) (Cons!26998 (h!28207 (_ BitVec 64)) (t!40465 List!27002)) )
))
(declare-fun acc!823 () List!27002)

(declare-fun contains!7064 (List!27002 (_ BitVec 64)) Bool)

(assert (=> b!1226839 (= res!815489 (not (contains!7064 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226840 () Bool)

(declare-fun res!815490 () Bool)

(assert (=> b!1226840 (=> (not res!815490) (not e!696674))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79207 0))(
  ( (array!79208 (arr!38229 (Array (_ BitVec 32) (_ BitVec 64))) (size!38765 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79207)

(assert (=> b!1226840 (= res!815490 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38765 a!3806)) (bvslt from!3184 (size!38765 a!3806))))))

(declare-fun res!815492 () Bool)

(assert (=> start!101868 (=> (not res!815492) (not e!696674))))

(assert (=> start!101868 (= res!815492 (bvslt (size!38765 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101868 e!696674))

(declare-fun array_inv!29077 (array!79207) Bool)

(assert (=> start!101868 (array_inv!29077 a!3806)))

(assert (=> start!101868 true))

(declare-fun b!1226841 () Bool)

(declare-fun res!815487 () Bool)

(assert (=> b!1226841 (=> (not res!815487) (not e!696674))))

(declare-fun noDuplicate!1661 (List!27002) Bool)

(assert (=> b!1226841 (= res!815487 (noDuplicate!1661 acc!823))))

(declare-fun b!1226842 () Bool)

(declare-fun res!815491 () Bool)

(assert (=> b!1226842 (=> (not res!815491) (not e!696674))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226842 (= res!815491 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226843 () Bool)

(declare-fun res!815488 () Bool)

(assert (=> b!1226843 (=> (not res!815488) (not e!696674))))

(assert (=> b!1226843 (= res!815488 (not (contains!7064 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226844 () Bool)

(assert (=> b!1226844 (= e!696674 false)))

(declare-fun lt!558861 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79207 (_ BitVec 32) List!27002) Bool)

(assert (=> b!1226844 (= lt!558861 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1226845 () Bool)

(declare-fun res!815493 () Bool)

(assert (=> b!1226845 (=> (not res!815493) (not e!696674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226845 (= res!815493 (validKeyInArray!0 k0!2913))))

(assert (= (and start!101868 res!815492) b!1226845))

(assert (= (and b!1226845 res!815493) b!1226840))

(assert (= (and b!1226840 res!815490) b!1226841))

(assert (= (and b!1226841 res!815487) b!1226839))

(assert (= (and b!1226839 res!815489) b!1226843))

(assert (= (and b!1226843 res!815488) b!1226842))

(assert (= (and b!1226842 res!815491) b!1226844))

(declare-fun m!1131797 () Bool)

(assert (=> start!101868 m!1131797))

(declare-fun m!1131799 () Bool)

(assert (=> b!1226839 m!1131799))

(declare-fun m!1131801 () Bool)

(assert (=> b!1226845 m!1131801))

(declare-fun m!1131803 () Bool)

(assert (=> b!1226842 m!1131803))

(declare-fun m!1131805 () Bool)

(assert (=> b!1226844 m!1131805))

(declare-fun m!1131807 () Bool)

(assert (=> b!1226843 m!1131807))

(declare-fun m!1131809 () Bool)

(assert (=> b!1226841 m!1131809))

(check-sat (not b!1226843) (not start!101868) (not b!1226839) (not b!1226844) (not b!1226842) (not b!1226845) (not b!1226841))
