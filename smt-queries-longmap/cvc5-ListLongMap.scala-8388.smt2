; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102004 () Bool)

(assert start!102004)

(declare-fun b!1228253 () Bool)

(declare-fun res!816867 () Bool)

(declare-fun e!697171 () Bool)

(assert (=> b!1228253 (=> (not res!816867) (not e!697171))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79277 0))(
  ( (array!79278 (arr!38261 (Array (_ BitVec 32) (_ BitVec 64))) (size!38797 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79277)

(assert (=> b!1228253 (= res!816867 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38797 a!3806)) (bvslt from!3184 (size!38797 a!3806))))))

(declare-fun b!1228254 () Bool)

(declare-fun res!816872 () Bool)

(assert (=> b!1228254 (=> (not res!816872) (not e!697171))))

(declare-datatypes ((List!27034 0))(
  ( (Nil!27031) (Cons!27030 (h!28239 (_ BitVec 64)) (t!40497 List!27034)) )
))
(declare-fun acc!823 () List!27034)

(declare-fun arrayNoDuplicates!0 (array!79277 (_ BitVec 32) List!27034) Bool)

(assert (=> b!1228254 (= res!816872 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228255 () Bool)

(assert (=> b!1228255 (= e!697171 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1228255 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27031)))

(declare-datatypes ((Unit!40688 0))(
  ( (Unit!40689) )
))
(declare-fun lt!558978 () Unit!40688)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79277 List!27034 List!27034 (_ BitVec 32)) Unit!40688)

(assert (=> b!1228255 (= lt!558978 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27031 from!3184))))

(assert (=> b!1228255 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27030 (select (arr!38261 a!3806) from!3184) acc!823))))

(declare-fun b!1228256 () Bool)

(declare-fun res!816868 () Bool)

(assert (=> b!1228256 (=> (not res!816868) (not e!697171))))

(declare-fun contains!7096 (List!27034 (_ BitVec 64)) Bool)

(assert (=> b!1228256 (= res!816868 (not (contains!7096 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228257 () Bool)

(declare-fun res!816871 () Bool)

(assert (=> b!1228257 (=> (not res!816871) (not e!697171))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228257 (= res!816871 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228258 () Bool)

(declare-fun res!816873 () Bool)

(assert (=> b!1228258 (=> (not res!816873) (not e!697171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228258 (= res!816873 (validKeyInArray!0 (select (arr!38261 a!3806) from!3184)))))

(declare-fun b!1228259 () Bool)

(declare-fun res!816869 () Bool)

(assert (=> b!1228259 (=> (not res!816869) (not e!697171))))

(assert (=> b!1228259 (= res!816869 (validKeyInArray!0 k!2913))))

(declare-fun b!1228261 () Bool)

(declare-fun res!816866 () Bool)

(assert (=> b!1228261 (=> (not res!816866) (not e!697171))))

(declare-fun noDuplicate!1693 (List!27034) Bool)

(assert (=> b!1228261 (= res!816866 (noDuplicate!1693 acc!823))))

(declare-fun res!816870 () Bool)

(assert (=> start!102004 (=> (not res!816870) (not e!697171))))

(assert (=> start!102004 (= res!816870 (bvslt (size!38797 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102004 e!697171))

(declare-fun array_inv!29109 (array!79277) Bool)

(assert (=> start!102004 (array_inv!29109 a!3806)))

(assert (=> start!102004 true))

(declare-fun b!1228260 () Bool)

(declare-fun res!816865 () Bool)

(assert (=> b!1228260 (=> (not res!816865) (not e!697171))))

(assert (=> b!1228260 (= res!816865 (not (contains!7096 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102004 res!816870) b!1228259))

(assert (= (and b!1228259 res!816869) b!1228253))

(assert (= (and b!1228253 res!816867) b!1228261))

(assert (= (and b!1228261 res!816866) b!1228260))

(assert (= (and b!1228260 res!816865) b!1228256))

(assert (= (and b!1228256 res!816868) b!1228257))

(assert (= (and b!1228257 res!816871) b!1228254))

(assert (= (and b!1228254 res!816872) b!1228258))

(assert (= (and b!1228258 res!816873) b!1228255))

(declare-fun m!1132815 () Bool)

(assert (=> start!102004 m!1132815))

(declare-fun m!1132817 () Bool)

(assert (=> b!1228258 m!1132817))

(assert (=> b!1228258 m!1132817))

(declare-fun m!1132819 () Bool)

(assert (=> b!1228258 m!1132819))

(declare-fun m!1132821 () Bool)

(assert (=> b!1228256 m!1132821))

(declare-fun m!1132823 () Bool)

(assert (=> b!1228257 m!1132823))

(declare-fun m!1132825 () Bool)

(assert (=> b!1228255 m!1132825))

(declare-fun m!1132827 () Bool)

(assert (=> b!1228255 m!1132827))

(assert (=> b!1228255 m!1132817))

(declare-fun m!1132829 () Bool)

(assert (=> b!1228255 m!1132829))

(declare-fun m!1132831 () Bool)

(assert (=> b!1228260 m!1132831))

(declare-fun m!1132833 () Bool)

(assert (=> b!1228254 m!1132833))

(declare-fun m!1132835 () Bool)

(assert (=> b!1228261 m!1132835))

(declare-fun m!1132837 () Bool)

(assert (=> b!1228259 m!1132837))

(push 1)

