; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102274 () Bool)

(assert start!102274)

(declare-fun b!1230987 () Bool)

(declare-fun res!819456 () Bool)

(declare-fun e!698304 () Bool)

(assert (=> b!1230987 (=> (not res!819456) (not e!698304))))

(declare-datatypes ((List!27099 0))(
  ( (Nil!27096) (Cons!27095 (h!28304 (_ BitVec 64)) (t!40562 List!27099)) )
))
(declare-fun acc!823 () List!27099)

(declare-fun contains!7161 (List!27099 (_ BitVec 64)) Bool)

(assert (=> b!1230987 (= res!819456 (not (contains!7161 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230988 () Bool)

(declare-fun res!819449 () Bool)

(assert (=> b!1230988 (=> (not res!819449) (not e!698304))))

(declare-datatypes ((array!79416 0))(
  ( (array!79417 (arr!38326 (Array (_ BitVec 32) (_ BitVec 64))) (size!38862 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79416)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230988 (= res!819449 (validKeyInArray!0 (select (arr!38326 a!3806) from!3184)))))

(declare-fun b!1230989 () Bool)

(declare-fun res!819457 () Bool)

(assert (=> b!1230989 (=> (not res!819457) (not e!698304))))

(assert (=> b!1230989 (= res!819457 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38862 a!3806)) (bvslt from!3184 (size!38862 a!3806))))))

(declare-fun b!1230990 () Bool)

(declare-fun res!819452 () Bool)

(assert (=> b!1230990 (=> (not res!819452) (not e!698304))))

(assert (=> b!1230990 (= res!819452 (not (contains!7161 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230991 () Bool)

(declare-fun res!819451 () Bool)

(assert (=> b!1230991 (=> (not res!819451) (not e!698304))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1230991 (= res!819451 (validKeyInArray!0 k!2913))))

(declare-fun b!1230992 () Bool)

(declare-fun res!819455 () Bool)

(assert (=> b!1230992 (=> (not res!819455) (not e!698304))))

(declare-fun arrayContainsKey!0 (array!79416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230992 (= res!819455 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!819450 () Bool)

(assert (=> start!102274 (=> (not res!819450) (not e!698304))))

(assert (=> start!102274 (= res!819450 (bvslt (size!38862 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102274 e!698304))

(declare-fun array_inv!29174 (array!79416) Bool)

(assert (=> start!102274 (array_inv!29174 a!3806)))

(assert (=> start!102274 true))

(declare-fun b!1230993 () Bool)

(declare-fun res!819453 () Bool)

(assert (=> b!1230993 (=> (not res!819453) (not e!698304))))

(declare-fun arrayNoDuplicates!0 (array!79416 (_ BitVec 32) List!27099) Bool)

(assert (=> b!1230993 (= res!819453 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230994 () Bool)

(declare-fun res!819454 () Bool)

(assert (=> b!1230994 (=> (not res!819454) (not e!698304))))

(declare-fun noDuplicate!1758 (List!27099) Bool)

(assert (=> b!1230994 (= res!819454 (noDuplicate!1758 acc!823))))

(declare-fun b!1230995 () Bool)

(assert (=> b!1230995 (= e!698304 (not true))))

(assert (=> b!1230995 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27095 (select (arr!38326 a!3806) from!3184) acc!823))))

(assert (= (and start!102274 res!819450) b!1230991))

(assert (= (and b!1230991 res!819451) b!1230989))

(assert (= (and b!1230989 res!819457) b!1230994))

(assert (= (and b!1230994 res!819454) b!1230987))

(assert (= (and b!1230987 res!819456) b!1230990))

(assert (= (and b!1230990 res!819452) b!1230992))

(assert (= (and b!1230992 res!819455) b!1230993))

(assert (= (and b!1230993 res!819453) b!1230988))

(assert (= (and b!1230988 res!819449) b!1230995))

(declare-fun m!1135247 () Bool)

(assert (=> b!1230993 m!1135247))

(declare-fun m!1135249 () Bool)

(assert (=> b!1230990 m!1135249))

(declare-fun m!1135251 () Bool)

(assert (=> b!1230991 m!1135251))

(declare-fun m!1135253 () Bool)

(assert (=> b!1230994 m!1135253))

(declare-fun m!1135255 () Bool)

(assert (=> b!1230995 m!1135255))

(declare-fun m!1135257 () Bool)

(assert (=> b!1230995 m!1135257))

(declare-fun m!1135259 () Bool)

(assert (=> b!1230987 m!1135259))

(assert (=> b!1230988 m!1135255))

(assert (=> b!1230988 m!1135255))

(declare-fun m!1135261 () Bool)

(assert (=> b!1230988 m!1135261))

(declare-fun m!1135263 () Bool)

(assert (=> b!1230992 m!1135263))

(declare-fun m!1135265 () Bool)

(assert (=> start!102274 m!1135265))

(push 1)

(assert (not b!1230992))

(assert (not b!1230993))

(assert (not start!102274))

(assert (not b!1230990))

(assert (not b!1230994))

(assert (not b!1230988))

(assert (not b!1230991))

(assert (not b!1230995))

(assert (not b!1230987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

