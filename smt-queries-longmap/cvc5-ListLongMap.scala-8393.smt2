; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102140 () Bool)

(assert start!102140)

(declare-fun b!1229282 () Bool)

(declare-fun res!817808 () Bool)

(declare-fun e!697756 () Bool)

(assert (=> b!1229282 (=> (not res!817808) (not e!697756))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229282 (= res!817808 (validKeyInArray!0 k!2913))))

(declare-fun res!817809 () Bool)

(assert (=> start!102140 (=> (not res!817809) (not e!697756))))

(declare-datatypes ((array!79238 0))(
  ( (array!79239 (arr!38239 (Array (_ BitVec 32) (_ BitVec 64))) (size!38777 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79238)

(assert (=> start!102140 (= res!817809 (bvslt (size!38777 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102140 e!697756))

(declare-fun array_inv!29222 (array!79238) Bool)

(assert (=> start!102140 (array_inv!29222 a!3806)))

(assert (=> start!102140 true))

(declare-fun b!1229283 () Bool)

(declare-fun res!817813 () Bool)

(assert (=> b!1229283 (=> (not res!817813) (not e!697756))))

(declare-datatypes ((List!27113 0))(
  ( (Nil!27110) (Cons!27109 (h!28318 (_ BitVec 64)) (t!40567 List!27113)) )
))
(declare-fun acc!823 () List!27113)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79238 (_ BitVec 32) List!27113) Bool)

(assert (=> b!1229283 (= res!817813 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229284 () Bool)

(declare-fun res!817805 () Bool)

(assert (=> b!1229284 (=> (not res!817805) (not e!697756))))

(assert (=> b!1229284 (= res!817805 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38777 a!3806)) (bvslt from!3184 (size!38777 a!3806))))))

(declare-fun b!1229285 () Bool)

(declare-fun res!817811 () Bool)

(assert (=> b!1229285 (=> (not res!817811) (not e!697756))))

(declare-fun contains!7085 (List!27113 (_ BitVec 64)) Bool)

(assert (=> b!1229285 (= res!817811 (not (contains!7085 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229286 () Bool)

(declare-fun res!817812 () Bool)

(declare-fun e!697757 () Bool)

(assert (=> b!1229286 (=> res!817812 e!697757)))

(declare-fun lt!558988 () List!27113)

(declare-fun noDuplicate!1728 (List!27113) Bool)

(assert (=> b!1229286 (= res!817812 (not (noDuplicate!1728 lt!558988)))))

(declare-fun b!1229287 () Bool)

(declare-fun res!817806 () Bool)

(assert (=> b!1229287 (=> res!817806 e!697757)))

(assert (=> b!1229287 (= res!817806 (contains!7085 lt!558988 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229288 () Bool)

(declare-fun res!817804 () Bool)

(assert (=> b!1229288 (=> (not res!817804) (not e!697756))))

(declare-fun arrayContainsKey!0 (array!79238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229288 (= res!817804 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229289 () Bool)

(declare-fun res!817817 () Bool)

(assert (=> b!1229289 (=> (not res!817817) (not e!697756))))

(assert (=> b!1229289 (= res!817817 (not (contains!7085 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229290 () Bool)

(assert (=> b!1229290 (= e!697756 (not e!697757))))

(declare-fun res!817815 () Bool)

(assert (=> b!1229290 (=> res!817815 e!697757)))

(assert (=> b!1229290 (= res!817815 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229290 (= lt!558988 (Cons!27109 (select (arr!38239 a!3806) from!3184) Nil!27110))))

(declare-fun e!697754 () Bool)

(assert (=> b!1229290 e!697754))

(declare-fun res!817810 () Bool)

(assert (=> b!1229290 (=> (not res!817810) (not e!697754))))

(assert (=> b!1229290 (= res!817810 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27110))))

(declare-datatypes ((Unit!40569 0))(
  ( (Unit!40570) )
))
(declare-fun lt!558989 () Unit!40569)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79238 List!27113 List!27113 (_ BitVec 32)) Unit!40569)

(assert (=> b!1229290 (= lt!558989 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27110 from!3184))))

(assert (=> b!1229290 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27109 (select (arr!38239 a!3806) from!3184) acc!823))))

(declare-fun b!1229291 () Bool)

(assert (=> b!1229291 (= e!697757 true)))

(declare-fun lt!558987 () Bool)

(assert (=> b!1229291 (= lt!558987 (contains!7085 lt!558988 (select (arr!38239 a!3806) from!3184)))))

(declare-fun b!1229292 () Bool)

(declare-fun res!817816 () Bool)

(assert (=> b!1229292 (=> (not res!817816) (not e!697756))))

(assert (=> b!1229292 (= res!817816 (noDuplicate!1728 acc!823))))

(declare-fun b!1229293 () Bool)

(assert (=> b!1229293 (= e!697754 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27109 (select (arr!38239 a!3806) from!3184) Nil!27110)))))

(declare-fun b!1229294 () Bool)

(declare-fun res!817814 () Bool)

(assert (=> b!1229294 (=> res!817814 e!697757)))

(assert (=> b!1229294 (= res!817814 (contains!7085 lt!558988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229295 () Bool)

(declare-fun res!817807 () Bool)

(assert (=> b!1229295 (=> (not res!817807) (not e!697756))))

(assert (=> b!1229295 (= res!817807 (validKeyInArray!0 (select (arr!38239 a!3806) from!3184)))))

(assert (= (and start!102140 res!817809) b!1229282))

(assert (= (and b!1229282 res!817808) b!1229284))

(assert (= (and b!1229284 res!817805) b!1229292))

(assert (= (and b!1229292 res!817816) b!1229285))

(assert (= (and b!1229285 res!817811) b!1229289))

(assert (= (and b!1229289 res!817817) b!1229288))

(assert (= (and b!1229288 res!817804) b!1229283))

(assert (= (and b!1229283 res!817813) b!1229295))

(assert (= (and b!1229295 res!817807) b!1229290))

(assert (= (and b!1229290 res!817810) b!1229293))

(assert (= (and b!1229290 (not res!817815)) b!1229286))

(assert (= (and b!1229286 (not res!817812)) b!1229294))

(assert (= (and b!1229294 (not res!817814)) b!1229287))

(assert (= (and b!1229287 (not res!817806)) b!1229291))

(declare-fun m!1133429 () Bool)

(assert (=> start!102140 m!1133429))

(declare-fun m!1133431 () Bool)

(assert (=> b!1229291 m!1133431))

(assert (=> b!1229291 m!1133431))

(declare-fun m!1133433 () Bool)

(assert (=> b!1229291 m!1133433))

(declare-fun m!1133435 () Bool)

(assert (=> b!1229287 m!1133435))

(declare-fun m!1133437 () Bool)

(assert (=> b!1229292 m!1133437))

(declare-fun m!1133439 () Bool)

(assert (=> b!1229288 m!1133439))

(declare-fun m!1133441 () Bool)

(assert (=> b!1229286 m!1133441))

(declare-fun m!1133443 () Bool)

(assert (=> b!1229283 m!1133443))

(assert (=> b!1229295 m!1133431))

(assert (=> b!1229295 m!1133431))

(declare-fun m!1133445 () Bool)

(assert (=> b!1229295 m!1133445))

(assert (=> b!1229290 m!1133431))

(declare-fun m!1133447 () Bool)

(assert (=> b!1229290 m!1133447))

(declare-fun m!1133449 () Bool)

(assert (=> b!1229290 m!1133449))

(declare-fun m!1133451 () Bool)

(assert (=> b!1229290 m!1133451))

(declare-fun m!1133453 () Bool)

(assert (=> b!1229282 m!1133453))

(declare-fun m!1133455 () Bool)

(assert (=> b!1229285 m!1133455))

(assert (=> b!1229293 m!1133431))

(declare-fun m!1133457 () Bool)

(assert (=> b!1229293 m!1133457))

(declare-fun m!1133459 () Bool)

(assert (=> b!1229289 m!1133459))

(declare-fun m!1133461 () Bool)

(assert (=> b!1229294 m!1133461))

(push 1)

(assert (not b!1229286))

(assert (not b!1229287))

(assert (not b!1229285))

(assert (not b!1229294))

(assert (not b!1229292))

(assert (not b!1229295))

(assert (not b!1229291))

(assert (not b!1229289))

(assert (not start!102140))

(assert (not b!1229288))

(assert (not b!1229293))

(assert (not b!1229290))

(assert (not b!1229283))

(assert (not b!1229282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

