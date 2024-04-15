; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102272 () Bool)

(assert start!102272)

(declare-fun b!1230919 () Bool)

(declare-fun res!819425 () Bool)

(declare-fun e!698270 () Bool)

(assert (=> b!1230919 (=> (not res!819425) (not e!698270))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79337 0))(
  ( (array!79338 (arr!38287 (Array (_ BitVec 32) (_ BitVec 64))) (size!38825 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79337)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230919 (= res!819425 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!819421 () Bool)

(assert (=> start!102272 (=> (not res!819421) (not e!698270))))

(assert (=> start!102272 (= res!819421 (bvslt (size!38825 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102272 e!698270))

(declare-fun array_inv!29270 (array!79337) Bool)

(assert (=> start!102272 (array_inv!29270 a!3806)))

(assert (=> start!102272 true))

(declare-fun b!1230920 () Bool)

(assert (=> b!1230920 (= e!698270 (not true))))

(declare-datatypes ((List!27161 0))(
  ( (Nil!27158) (Cons!27157 (h!28366 (_ BitVec 64)) (t!40615 List!27161)) )
))
(declare-fun acc!823 () List!27161)

(declare-fun arrayNoDuplicates!0 (array!79337 (_ BitVec 32) List!27161) Bool)

(assert (=> b!1230920 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27157 (select (arr!38287 a!3806) from!3184) acc!823))))

(declare-fun b!1230921 () Bool)

(declare-fun res!819423 () Bool)

(assert (=> b!1230921 (=> (not res!819423) (not e!698270))))

(assert (=> b!1230921 (= res!819423 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38825 a!3806)) (bvslt from!3184 (size!38825 a!3806))))))

(declare-fun b!1230922 () Bool)

(declare-fun res!819419 () Bool)

(assert (=> b!1230922 (=> (not res!819419) (not e!698270))))

(declare-fun noDuplicate!1776 (List!27161) Bool)

(assert (=> b!1230922 (= res!819419 (noDuplicate!1776 acc!823))))

(declare-fun b!1230923 () Bool)

(declare-fun res!819420 () Bool)

(assert (=> b!1230923 (=> (not res!819420) (not e!698270))))

(declare-fun contains!7133 (List!27161 (_ BitVec 64)) Bool)

(assert (=> b!1230923 (= res!819420 (not (contains!7133 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230924 () Bool)

(declare-fun res!819424 () Bool)

(assert (=> b!1230924 (=> (not res!819424) (not e!698270))))

(assert (=> b!1230924 (= res!819424 (not (contains!7133 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230925 () Bool)

(declare-fun res!819417 () Bool)

(assert (=> b!1230925 (=> (not res!819417) (not e!698270))))

(assert (=> b!1230925 (= res!819417 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230926 () Bool)

(declare-fun res!819418 () Bool)

(assert (=> b!1230926 (=> (not res!819418) (not e!698270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230926 (= res!819418 (validKeyInArray!0 k!2913))))

(declare-fun b!1230927 () Bool)

(declare-fun res!819422 () Bool)

(assert (=> b!1230927 (=> (not res!819422) (not e!698270))))

(assert (=> b!1230927 (= res!819422 (validKeyInArray!0 (select (arr!38287 a!3806) from!3184)))))

(assert (= (and start!102272 res!819421) b!1230926))

(assert (= (and b!1230926 res!819418) b!1230921))

(assert (= (and b!1230921 res!819423) b!1230922))

(assert (= (and b!1230922 res!819419) b!1230923))

(assert (= (and b!1230923 res!819420) b!1230924))

(assert (= (and b!1230924 res!819424) b!1230919))

(assert (= (and b!1230919 res!819425) b!1230925))

(assert (= (and b!1230925 res!819417) b!1230927))

(assert (= (and b!1230927 res!819422) b!1230920))

(declare-fun m!1134751 () Bool)

(assert (=> b!1230925 m!1134751))

(declare-fun m!1134753 () Bool)

(assert (=> b!1230924 m!1134753))

(declare-fun m!1134755 () Bool)

(assert (=> start!102272 m!1134755))

(declare-fun m!1134757 () Bool)

(assert (=> b!1230920 m!1134757))

(declare-fun m!1134759 () Bool)

(assert (=> b!1230920 m!1134759))

(assert (=> b!1230927 m!1134757))

(assert (=> b!1230927 m!1134757))

(declare-fun m!1134761 () Bool)

(assert (=> b!1230927 m!1134761))

(declare-fun m!1134763 () Bool)

(assert (=> b!1230926 m!1134763))

(declare-fun m!1134765 () Bool)

(assert (=> b!1230923 m!1134765))

(declare-fun m!1134767 () Bool)

(assert (=> b!1230919 m!1134767))

(declare-fun m!1134769 () Bool)

(assert (=> b!1230922 m!1134769))

(push 1)

(assert (not b!1230923))

(assert (not b!1230924))

(assert (not b!1230926))

(assert (not b!1230920))

(assert (not b!1230927))

(assert (not b!1230925))

(assert (not b!1230922))

(assert (not start!102272))

(assert (not b!1230919))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

