; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102002 () Bool)

(assert start!102002)

(declare-fun b!1228222 () Bool)

(declare-fun res!816842 () Bool)

(declare-fun e!697166 () Bool)

(assert (=> b!1228222 (=> res!816842 e!697166)))

(declare-datatypes ((List!27033 0))(
  ( (Nil!27030) (Cons!27029 (h!28238 (_ BitVec 64)) (t!40496 List!27033)) )
))
(declare-fun acc!823 () List!27033)

(declare-fun subseq!499 (List!27033 List!27033) Bool)

(assert (=> b!1228222 (= res!816842 (not (subseq!499 Nil!27030 acc!823)))))

(declare-fun b!1228223 () Bool)

(declare-fun res!816835 () Bool)

(declare-fun e!697165 () Bool)

(assert (=> b!1228223 (=> (not res!816835) (not e!697165))))

(declare-fun noDuplicate!1692 (List!27033) Bool)

(assert (=> b!1228223 (= res!816835 (noDuplicate!1692 acc!823))))

(declare-fun b!1228224 () Bool)

(declare-fun res!816834 () Bool)

(assert (=> b!1228224 (=> (not res!816834) (not e!697165))))

(declare-fun contains!7095 (List!27033 (_ BitVec 64)) Bool)

(assert (=> b!1228224 (= res!816834 (not (contains!7095 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228225 () Bool)

(assert (=> b!1228225 (= e!697165 (not e!697166))))

(declare-fun res!816845 () Bool)

(assert (=> b!1228225 (=> res!816845 e!697166)))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79275 0))(
  ( (array!79276 (arr!38260 (Array (_ BitVec 32) (_ BitVec 64))) (size!38796 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79275)

(assert (=> b!1228225 (= res!816845 (bvsgt from!3184 (size!38796 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79275 (_ BitVec 32) List!27033) Bool)

(assert (=> b!1228225 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27029 (select (arr!38260 a!3806) from!3184) acc!823))))

(declare-fun b!1228226 () Bool)

(declare-fun res!816838 () Bool)

(assert (=> b!1228226 (=> res!816838 e!697166)))

(assert (=> b!1228226 (= res!816838 (contains!7095 Nil!27030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228227 () Bool)

(declare-fun res!816840 () Bool)

(assert (=> b!1228227 (=> (not res!816840) (not e!697165))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228227 (= res!816840 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228228 () Bool)

(declare-fun res!816844 () Bool)

(assert (=> b!1228228 (=> (not res!816844) (not e!697165))))

(assert (=> b!1228228 (= res!816844 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38796 a!3806)) (bvslt from!3184 (size!38796 a!3806))))))

(declare-fun b!1228229 () Bool)

(declare-fun res!816839 () Bool)

(assert (=> b!1228229 (=> (not res!816839) (not e!697165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228229 (= res!816839 (validKeyInArray!0 (select (arr!38260 a!3806) from!3184)))))

(declare-fun b!1228230 () Bool)

(declare-fun res!816837 () Bool)

(assert (=> b!1228230 (=> (not res!816837) (not e!697165))))

(assert (=> b!1228230 (= res!816837 (validKeyInArray!0 k!2913))))

(declare-fun b!1228231 () Bool)

(declare-fun res!816843 () Bool)

(assert (=> b!1228231 (=> res!816843 e!697166)))

(assert (=> b!1228231 (= res!816843 (contains!7095 Nil!27030 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228232 () Bool)

(declare-fun res!816846 () Bool)

(assert (=> b!1228232 (=> (not res!816846) (not e!697165))))

(assert (=> b!1228232 (= res!816846 (not (contains!7095 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816841 () Bool)

(assert (=> start!102002 (=> (not res!816841) (not e!697165))))

(assert (=> start!102002 (= res!816841 (bvslt (size!38796 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102002 e!697165))

(declare-fun array_inv!29108 (array!79275) Bool)

(assert (=> start!102002 (array_inv!29108 a!3806)))

(assert (=> start!102002 true))

(declare-fun b!1228233 () Bool)

(declare-fun res!816836 () Bool)

(assert (=> b!1228233 (=> (not res!816836) (not e!697165))))

(assert (=> b!1228233 (= res!816836 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228234 () Bool)

(assert (=> b!1228234 (= e!697166 true)))

(declare-datatypes ((Unit!40686 0))(
  ( (Unit!40687) )
))
(declare-fun lt!558975 () Unit!40686)

(declare-fun noDuplicateSubseq!52 (List!27033 List!27033) Unit!40686)

(assert (=> b!1228234 (= lt!558975 (noDuplicateSubseq!52 Nil!27030 acc!823))))

(assert (= (and start!102002 res!816841) b!1228230))

(assert (= (and b!1228230 res!816837) b!1228228))

(assert (= (and b!1228228 res!816844) b!1228223))

(assert (= (and b!1228223 res!816835) b!1228232))

(assert (= (and b!1228232 res!816846) b!1228224))

(assert (= (and b!1228224 res!816834) b!1228227))

(assert (= (and b!1228227 res!816840) b!1228233))

(assert (= (and b!1228233 res!816836) b!1228229))

(assert (= (and b!1228229 res!816839) b!1228225))

(assert (= (and b!1228225 (not res!816845)) b!1228226))

(assert (= (and b!1228226 (not res!816838)) b!1228231))

(assert (= (and b!1228231 (not res!816843)) b!1228222))

(assert (= (and b!1228222 (not res!816842)) b!1228234))

(declare-fun m!1132787 () Bool)

(assert (=> b!1228232 m!1132787))

(declare-fun m!1132789 () Bool)

(assert (=> b!1228223 m!1132789))

(declare-fun m!1132791 () Bool)

(assert (=> b!1228234 m!1132791))

(declare-fun m!1132793 () Bool)

(assert (=> b!1228233 m!1132793))

(declare-fun m!1132795 () Bool)

(assert (=> b!1228230 m!1132795))

(declare-fun m!1132797 () Bool)

(assert (=> b!1228227 m!1132797))

(declare-fun m!1132799 () Bool)

(assert (=> b!1228225 m!1132799))

(declare-fun m!1132801 () Bool)

(assert (=> b!1228225 m!1132801))

(declare-fun m!1132803 () Bool)

(assert (=> b!1228224 m!1132803))

(declare-fun m!1132805 () Bool)

(assert (=> b!1228231 m!1132805))

(assert (=> b!1228229 m!1132799))

(assert (=> b!1228229 m!1132799))

(declare-fun m!1132807 () Bool)

(assert (=> b!1228229 m!1132807))

(declare-fun m!1132809 () Bool)

(assert (=> start!102002 m!1132809))

(declare-fun m!1132811 () Bool)

(assert (=> b!1228222 m!1132811))

(declare-fun m!1132813 () Bool)

(assert (=> b!1228226 m!1132813))

(push 1)

(assert (not b!1228223))

(assert (not b!1228231))

(assert (not b!1228232))

(assert (not b!1228222))

(assert (not b!1228226))

(assert (not b!1228227))

(assert (not b!1228233))

(assert (not b!1228234))

(assert (not start!102002))

(assert (not b!1228224))

(assert (not b!1228225))

(assert (not b!1228229))

(assert (not b!1228230))

(check-sat)

