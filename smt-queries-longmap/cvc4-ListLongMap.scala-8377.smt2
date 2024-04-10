; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101870 () Bool)

(assert start!101870)

(declare-fun b!1226860 () Bool)

(declare-fun res!815509 () Bool)

(declare-fun e!696680 () Bool)

(assert (=> b!1226860 (=> (not res!815509) (not e!696680))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226860 (= res!815509 (validKeyInArray!0 k!2913))))

(declare-fun b!1226861 () Bool)

(declare-fun res!815513 () Bool)

(assert (=> b!1226861 (=> (not res!815513) (not e!696680))))

(declare-datatypes ((array!79209 0))(
  ( (array!79210 (arr!38230 (Array (_ BitVec 32) (_ BitVec 64))) (size!38766 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79209)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226861 (= res!815513 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226862 () Bool)

(declare-fun res!815510 () Bool)

(assert (=> b!1226862 (=> (not res!815510) (not e!696680))))

(assert (=> b!1226862 (= res!815510 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38766 a!3806)) (bvslt from!3184 (size!38766 a!3806))))))

(declare-fun b!1226863 () Bool)

(declare-fun res!815514 () Bool)

(assert (=> b!1226863 (=> (not res!815514) (not e!696680))))

(declare-datatypes ((List!27003 0))(
  ( (Nil!27000) (Cons!26999 (h!28208 (_ BitVec 64)) (t!40466 List!27003)) )
))
(declare-fun acc!823 () List!27003)

(declare-fun noDuplicate!1662 (List!27003) Bool)

(assert (=> b!1226863 (= res!815514 (noDuplicate!1662 acc!823))))

(declare-fun b!1226864 () Bool)

(declare-fun res!815511 () Bool)

(assert (=> b!1226864 (=> (not res!815511) (not e!696680))))

(declare-fun contains!7065 (List!27003 (_ BitVec 64)) Bool)

(assert (=> b!1226864 (= res!815511 (not (contains!7065 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226865 () Bool)

(declare-fun res!815508 () Bool)

(assert (=> b!1226865 (=> (not res!815508) (not e!696680))))

(assert (=> b!1226865 (= res!815508 (not (contains!7065 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!815512 () Bool)

(assert (=> start!101870 (=> (not res!815512) (not e!696680))))

(assert (=> start!101870 (= res!815512 (bvslt (size!38766 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101870 e!696680))

(declare-fun array_inv!29078 (array!79209) Bool)

(assert (=> start!101870 (array_inv!29078 a!3806)))

(assert (=> start!101870 true))

(declare-fun b!1226866 () Bool)

(assert (=> b!1226866 (= e!696680 false)))

(declare-fun lt!558864 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79209 (_ BitVec 32) List!27003) Bool)

(assert (=> b!1226866 (= lt!558864 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!101870 res!815512) b!1226860))

(assert (= (and b!1226860 res!815509) b!1226862))

(assert (= (and b!1226862 res!815510) b!1226863))

(assert (= (and b!1226863 res!815514) b!1226864))

(assert (= (and b!1226864 res!815511) b!1226865))

(assert (= (and b!1226865 res!815508) b!1226861))

(assert (= (and b!1226861 res!815513) b!1226866))

(declare-fun m!1131811 () Bool)

(assert (=> start!101870 m!1131811))

(declare-fun m!1131813 () Bool)

(assert (=> b!1226865 m!1131813))

(declare-fun m!1131815 () Bool)

(assert (=> b!1226866 m!1131815))

(declare-fun m!1131817 () Bool)

(assert (=> b!1226863 m!1131817))

(declare-fun m!1131819 () Bool)

(assert (=> b!1226860 m!1131819))

(declare-fun m!1131821 () Bool)

(assert (=> b!1226864 m!1131821))

(declare-fun m!1131823 () Bool)

(assert (=> b!1226861 m!1131823))

(push 1)

(assert (not b!1226861))

(assert (not b!1226865))

(assert (not start!101870))

(assert (not b!1226866))

(assert (not b!1226864))

(assert (not b!1226860))

(assert (not b!1226863))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

