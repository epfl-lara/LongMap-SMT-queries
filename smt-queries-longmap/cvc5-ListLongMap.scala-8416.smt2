; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102432 () Bool)

(assert start!102432)

(declare-fun b!1232042 () Bool)

(declare-fun res!820422 () Bool)

(declare-fun e!698873 () Bool)

(assert (=> b!1232042 (=> (not res!820422) (not e!698873))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79463 0))(
  ( (array!79464 (arr!38345 (Array (_ BitVec 32) (_ BitVec 64))) (size!38881 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79463)

(assert (=> b!1232042 (= res!820422 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38881 a!3806)) (bvslt from!3184 (size!38881 a!3806))))))

(declare-fun b!1232043 () Bool)

(declare-fun res!820421 () Bool)

(assert (=> b!1232043 (=> (not res!820421) (not e!698873))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232043 (= res!820421 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!820424 () Bool)

(assert (=> start!102432 (=> (not res!820424) (not e!698873))))

(assert (=> start!102432 (= res!820424 (bvslt (size!38881 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102432 e!698873))

(declare-fun array_inv!29193 (array!79463) Bool)

(assert (=> start!102432 (array_inv!29193 a!3806)))

(assert (=> start!102432 true))

(declare-fun b!1232044 () Bool)

(assert (=> b!1232044 (= e!698873 (not true))))

(declare-fun e!698872 () Bool)

(assert (=> b!1232044 e!698872))

(declare-fun res!820423 () Bool)

(assert (=> b!1232044 (=> (not res!820423) (not e!698872))))

(declare-datatypes ((List!27118 0))(
  ( (Nil!27115) (Cons!27114 (h!28323 (_ BitVec 64)) (t!40581 List!27118)) )
))
(declare-fun arrayNoDuplicates!0 (array!79463 (_ BitVec 32) List!27118) Bool)

(assert (=> b!1232044 (= res!820423 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27115))))

(declare-datatypes ((Unit!40796 0))(
  ( (Unit!40797) )
))
(declare-fun lt!559478 () Unit!40796)

(declare-fun acc!823 () List!27118)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79463 List!27118 List!27118 (_ BitVec 32)) Unit!40796)

(assert (=> b!1232044 (= lt!559478 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27115 from!3184))))

(assert (=> b!1232044 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27114 (select (arr!38345 a!3806) from!3184) acc!823))))

(declare-fun b!1232045 () Bool)

(declare-fun res!820427 () Bool)

(assert (=> b!1232045 (=> (not res!820427) (not e!698873))))

(declare-fun contains!7180 (List!27118 (_ BitVec 64)) Bool)

(assert (=> b!1232045 (= res!820427 (not (contains!7180 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232046 () Bool)

(declare-fun res!820429 () Bool)

(assert (=> b!1232046 (=> (not res!820429) (not e!698873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232046 (= res!820429 (validKeyInArray!0 (select (arr!38345 a!3806) from!3184)))))

(declare-fun b!1232047 () Bool)

(declare-fun res!820428 () Bool)

(assert (=> b!1232047 (=> (not res!820428) (not e!698873))))

(declare-fun noDuplicate!1777 (List!27118) Bool)

(assert (=> b!1232047 (= res!820428 (noDuplicate!1777 acc!823))))

(declare-fun b!1232048 () Bool)

(declare-fun res!820426 () Bool)

(assert (=> b!1232048 (=> (not res!820426) (not e!698873))))

(assert (=> b!1232048 (= res!820426 (not (contains!7180 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232049 () Bool)

(declare-fun res!820420 () Bool)

(assert (=> b!1232049 (=> (not res!820420) (not e!698873))))

(assert (=> b!1232049 (= res!820420 (validKeyInArray!0 k!2913))))

(declare-fun b!1232050 () Bool)

(declare-fun res!820425 () Bool)

(assert (=> b!1232050 (=> (not res!820425) (not e!698873))))

(assert (=> b!1232050 (= res!820425 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232051 () Bool)

(assert (=> b!1232051 (= e!698872 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27114 (select (arr!38345 a!3806) from!3184) Nil!27115)))))

(assert (= (and start!102432 res!820424) b!1232049))

(assert (= (and b!1232049 res!820420) b!1232042))

(assert (= (and b!1232042 res!820422) b!1232047))

(assert (= (and b!1232047 res!820428) b!1232048))

(assert (= (and b!1232048 res!820426) b!1232045))

(assert (= (and b!1232045 res!820427) b!1232043))

(assert (= (and b!1232043 res!820421) b!1232050))

(assert (= (and b!1232050 res!820425) b!1232046))

(assert (= (and b!1232046 res!820429) b!1232044))

(assert (= (and b!1232044 res!820423) b!1232051))

(declare-fun m!1136083 () Bool)

(assert (=> b!1232046 m!1136083))

(assert (=> b!1232046 m!1136083))

(declare-fun m!1136085 () Bool)

(assert (=> b!1232046 m!1136085))

(declare-fun m!1136087 () Bool)

(assert (=> b!1232049 m!1136087))

(declare-fun m!1136089 () Bool)

(assert (=> b!1232048 m!1136089))

(declare-fun m!1136091 () Bool)

(assert (=> b!1232044 m!1136091))

(declare-fun m!1136093 () Bool)

(assert (=> b!1232044 m!1136093))

(assert (=> b!1232044 m!1136083))

(declare-fun m!1136095 () Bool)

(assert (=> b!1232044 m!1136095))

(declare-fun m!1136097 () Bool)

(assert (=> start!102432 m!1136097))

(declare-fun m!1136099 () Bool)

(assert (=> b!1232045 m!1136099))

(declare-fun m!1136101 () Bool)

(assert (=> b!1232043 m!1136101))

(declare-fun m!1136103 () Bool)

(assert (=> b!1232050 m!1136103))

(declare-fun m!1136105 () Bool)

(assert (=> b!1232047 m!1136105))

(assert (=> b!1232051 m!1136083))

(declare-fun m!1136107 () Bool)

(assert (=> b!1232051 m!1136107))

(push 1)

(assert (not b!1232043))

(assert (not start!102432))

(assert (not b!1232050))

(assert (not b!1232049))

(assert (not b!1232048))

(assert (not b!1232047))

(assert (not b!1232046))

(assert (not b!1232045))

(assert (not b!1232044))

(assert (not b!1232051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

