; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102272 () Bool)

(assert start!102272)

(declare-fun b!1230960 () Bool)

(declare-fun res!819426 () Bool)

(declare-fun e!698298 () Bool)

(assert (=> b!1230960 (=> (not res!819426) (not e!698298))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79414 0))(
  ( (array!79415 (arr!38325 (Array (_ BitVec 32) (_ BitVec 64))) (size!38861 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79414)

(assert (=> b!1230960 (= res!819426 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38861 a!3806)) (bvslt from!3184 (size!38861 a!3806))))))

(declare-fun b!1230961 () Bool)

(declare-fun res!819425 () Bool)

(assert (=> b!1230961 (=> (not res!819425) (not e!698298))))

(declare-datatypes ((List!27098 0))(
  ( (Nil!27095) (Cons!27094 (h!28303 (_ BitVec 64)) (t!40561 List!27098)) )
))
(declare-fun acc!823 () List!27098)

(declare-fun noDuplicate!1757 (List!27098) Bool)

(assert (=> b!1230961 (= res!819425 (noDuplicate!1757 acc!823))))

(declare-fun b!1230962 () Bool)

(declare-fun res!819422 () Bool)

(assert (=> b!1230962 (=> (not res!819422) (not e!698298))))

(declare-fun contains!7160 (List!27098 (_ BitVec 64)) Bool)

(assert (=> b!1230962 (= res!819422 (not (contains!7160 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230963 () Bool)

(assert (=> b!1230963 (= e!698298 (not true))))

(declare-fun arrayNoDuplicates!0 (array!79414 (_ BitVec 32) List!27098) Bool)

(assert (=> b!1230963 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27094 (select (arr!38325 a!3806) from!3184) acc!823))))

(declare-fun b!1230964 () Bool)

(declare-fun res!819428 () Bool)

(assert (=> b!1230964 (=> (not res!819428) (not e!698298))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230964 (= res!819428 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230965 () Bool)

(declare-fun res!819430 () Bool)

(assert (=> b!1230965 (=> (not res!819430) (not e!698298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230965 (= res!819430 (validKeyInArray!0 k0!2913))))

(declare-fun b!1230966 () Bool)

(declare-fun res!819424 () Bool)

(assert (=> b!1230966 (=> (not res!819424) (not e!698298))))

(assert (=> b!1230966 (= res!819424 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230967 () Bool)

(declare-fun res!819427 () Bool)

(assert (=> b!1230967 (=> (not res!819427) (not e!698298))))

(assert (=> b!1230967 (= res!819427 (validKeyInArray!0 (select (arr!38325 a!3806) from!3184)))))

(declare-fun res!819429 () Bool)

(assert (=> start!102272 (=> (not res!819429) (not e!698298))))

(assert (=> start!102272 (= res!819429 (bvslt (size!38861 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102272 e!698298))

(declare-fun array_inv!29173 (array!79414) Bool)

(assert (=> start!102272 (array_inv!29173 a!3806)))

(assert (=> start!102272 true))

(declare-fun b!1230968 () Bool)

(declare-fun res!819423 () Bool)

(assert (=> b!1230968 (=> (not res!819423) (not e!698298))))

(assert (=> b!1230968 (= res!819423 (not (contains!7160 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102272 res!819429) b!1230965))

(assert (= (and b!1230965 res!819430) b!1230960))

(assert (= (and b!1230960 res!819426) b!1230961))

(assert (= (and b!1230961 res!819425) b!1230968))

(assert (= (and b!1230968 res!819423) b!1230962))

(assert (= (and b!1230962 res!819422) b!1230964))

(assert (= (and b!1230964 res!819428) b!1230966))

(assert (= (and b!1230966 res!819424) b!1230967))

(assert (= (and b!1230967 res!819427) b!1230963))

(declare-fun m!1135227 () Bool)

(assert (=> b!1230964 m!1135227))

(declare-fun m!1135229 () Bool)

(assert (=> b!1230965 m!1135229))

(declare-fun m!1135231 () Bool)

(assert (=> b!1230967 m!1135231))

(assert (=> b!1230967 m!1135231))

(declare-fun m!1135233 () Bool)

(assert (=> b!1230967 m!1135233))

(declare-fun m!1135235 () Bool)

(assert (=> b!1230961 m!1135235))

(declare-fun m!1135237 () Bool)

(assert (=> b!1230968 m!1135237))

(declare-fun m!1135239 () Bool)

(assert (=> b!1230962 m!1135239))

(assert (=> b!1230963 m!1135231))

(declare-fun m!1135241 () Bool)

(assert (=> b!1230963 m!1135241))

(declare-fun m!1135243 () Bool)

(assert (=> start!102272 m!1135243))

(declare-fun m!1135245 () Bool)

(assert (=> b!1230966 m!1135245))

(check-sat (not b!1230968) (not b!1230962) (not b!1230967) (not start!102272) (not b!1230966) (not b!1230964) (not b!1230961) (not b!1230965) (not b!1230963))
