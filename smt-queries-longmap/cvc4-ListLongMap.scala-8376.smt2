; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101864 () Bool)

(assert start!101864)

(declare-fun b!1226795 () Bool)

(declare-fun res!815449 () Bool)

(declare-fun e!696661 () Bool)

(assert (=> b!1226795 (=> (not res!815449) (not e!696661))))

(declare-datatypes ((List!27000 0))(
  ( (Nil!26997) (Cons!26996 (h!28205 (_ BitVec 64)) (t!40463 List!27000)) )
))
(declare-fun acc!823 () List!27000)

(declare-fun contains!7062 (List!27000 (_ BitVec 64)) Bool)

(assert (=> b!1226795 (= res!815449 (not (contains!7062 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226797 () Bool)

(declare-fun res!815451 () Bool)

(assert (=> b!1226797 (=> (not res!815451) (not e!696661))))

(declare-datatypes ((array!79203 0))(
  ( (array!79204 (arr!38227 (Array (_ BitVec 32) (_ BitVec 64))) (size!38763 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79203)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226797 (= res!815451 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226798 () Bool)

(declare-fun res!815447 () Bool)

(assert (=> b!1226798 (=> (not res!815447) (not e!696661))))

(assert (=> b!1226798 (= res!815447 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38763 a!3806)) (bvslt from!3184 (size!38763 a!3806))))))

(declare-fun b!1226799 () Bool)

(assert (=> b!1226799 (= e!696661 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun b!1226800 () Bool)

(declare-fun res!815445 () Bool)

(assert (=> b!1226800 (=> (not res!815445) (not e!696661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226800 (= res!815445 (validKeyInArray!0 k!2913))))

(declare-fun b!1226801 () Bool)

(declare-fun res!815448 () Bool)

(assert (=> b!1226801 (=> (not res!815448) (not e!696661))))

(assert (=> b!1226801 (= res!815448 (validKeyInArray!0 (select (arr!38227 a!3806) from!3184)))))

(declare-fun b!1226802 () Bool)

(declare-fun res!815450 () Bool)

(assert (=> b!1226802 (=> (not res!815450) (not e!696661))))

(assert (=> b!1226802 (= res!815450 (not (contains!7062 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226803 () Bool)

(declare-fun res!815444 () Bool)

(assert (=> b!1226803 (=> (not res!815444) (not e!696661))))

(declare-fun arrayNoDuplicates!0 (array!79203 (_ BitVec 32) List!27000) Bool)

(assert (=> b!1226803 (= res!815444 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1226796 () Bool)

(declare-fun res!815443 () Bool)

(assert (=> b!1226796 (=> (not res!815443) (not e!696661))))

(declare-fun noDuplicate!1659 (List!27000) Bool)

(assert (=> b!1226796 (= res!815443 (noDuplicate!1659 acc!823))))

(declare-fun res!815446 () Bool)

(assert (=> start!101864 (=> (not res!815446) (not e!696661))))

(assert (=> start!101864 (= res!815446 (bvslt (size!38763 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101864 e!696661))

(declare-fun array_inv!29075 (array!79203) Bool)

(assert (=> start!101864 (array_inv!29075 a!3806)))

(assert (=> start!101864 true))

(assert (= (and start!101864 res!815446) b!1226800))

(assert (= (and b!1226800 res!815445) b!1226798))

(assert (= (and b!1226798 res!815447) b!1226796))

(assert (= (and b!1226796 res!815443) b!1226802))

(assert (= (and b!1226802 res!815450) b!1226795))

(assert (= (and b!1226795 res!815449) b!1226797))

(assert (= (and b!1226797 res!815451) b!1226803))

(assert (= (and b!1226803 res!815444) b!1226801))

(assert (= (and b!1226801 res!815448) b!1226799))

(declare-fun m!1131765 () Bool)

(assert (=> b!1226796 m!1131765))

(declare-fun m!1131767 () Bool)

(assert (=> b!1226795 m!1131767))

(declare-fun m!1131769 () Bool)

(assert (=> b!1226803 m!1131769))

(declare-fun m!1131771 () Bool)

(assert (=> b!1226800 m!1131771))

(declare-fun m!1131773 () Bool)

(assert (=> b!1226801 m!1131773))

(assert (=> b!1226801 m!1131773))

(declare-fun m!1131775 () Bool)

(assert (=> b!1226801 m!1131775))

(declare-fun m!1131777 () Bool)

(assert (=> start!101864 m!1131777))

(declare-fun m!1131779 () Bool)

(assert (=> b!1226802 m!1131779))

(declare-fun m!1131781 () Bool)

(assert (=> b!1226797 m!1131781))

(push 1)

(assert (not b!1226803))

(assert (not b!1226796))

(assert (not b!1226795))

(assert (not b!1226800))

(assert (not b!1226801))

(assert (not start!101864))

(assert (not b!1226797))

