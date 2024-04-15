; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102578 () Bool)

(assert start!102578)

(declare-fun b!1233264 () Bool)

(declare-fun res!821527 () Bool)

(declare-fun e!699604 () Bool)

(assert (=> b!1233264 (=> (not res!821527) (not e!699604))))

(declare-datatypes ((List!27200 0))(
  ( (Nil!27197) (Cons!27196 (h!28405 (_ BitVec 64)) (t!40654 List!27200)) )
))
(declare-fun acc!823 () List!27200)

(declare-fun contains!7172 (List!27200 (_ BitVec 64)) Bool)

(assert (=> b!1233264 (= res!821527 (not (contains!7172 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233265 () Bool)

(declare-fun res!821520 () Bool)

(assert (=> b!1233265 (=> (not res!821520) (not e!699604))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79430 0))(
  ( (array!79431 (arr!38326 (Array (_ BitVec 32) (_ BitVec 64))) (size!38864 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79430)

(assert (=> b!1233265 (= res!821520 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38864 a!3806)) (bvslt from!3184 (size!38864 a!3806))))))

(declare-fun b!1233266 () Bool)

(declare-fun e!699605 () Bool)

(assert (=> b!1233266 (= e!699604 (not e!699605))))

(declare-fun res!821522 () Bool)

(assert (=> b!1233266 (=> res!821522 e!699605)))

(assert (=> b!1233266 (= res!821522 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun lt!559493 () List!27200)

(assert (=> b!1233266 (= lt!559493 (Cons!27196 (select (arr!38326 a!3806) from!3184) Nil!27197))))

(declare-fun e!699603 () Bool)

(assert (=> b!1233266 e!699603))

(declare-fun res!821518 () Bool)

(assert (=> b!1233266 (=> (not res!821518) (not e!699603))))

(declare-fun arrayNoDuplicates!0 (array!79430 (_ BitVec 32) List!27200) Bool)

(assert (=> b!1233266 (= res!821518 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27197))))

(declare-datatypes ((Unit!40683 0))(
  ( (Unit!40684) )
))
(declare-fun lt!559491 () Unit!40683)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79430 List!27200 List!27200 (_ BitVec 32)) Unit!40683)

(assert (=> b!1233266 (= lt!559491 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27197 from!3184))))

(assert (=> b!1233266 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27196 (select (arr!38326 a!3806) from!3184) acc!823))))

(declare-fun b!1233267 () Bool)

(declare-fun res!821516 () Bool)

(assert (=> b!1233267 (=> res!821516 e!699605)))

(assert (=> b!1233267 (= res!821516 (contains!7172 lt!559493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233268 () Bool)

(declare-fun res!821524 () Bool)

(assert (=> b!1233268 (=> (not res!821524) (not e!699604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233268 (= res!821524 (validKeyInArray!0 (select (arr!38326 a!3806) from!3184)))))

(declare-fun b!1233269 () Bool)

(declare-fun res!821528 () Bool)

(assert (=> b!1233269 (=> res!821528 e!699605)))

(declare-fun noDuplicate!1815 (List!27200) Bool)

(assert (=> b!1233269 (= res!821528 (not (noDuplicate!1815 lt!559493)))))

(declare-fun b!1233270 () Bool)

(declare-fun res!821526 () Bool)

(assert (=> b!1233270 (=> (not res!821526) (not e!699604))))

(assert (=> b!1233270 (= res!821526 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233271 () Bool)

(declare-fun res!821523 () Bool)

(assert (=> b!1233271 (=> (not res!821523) (not e!699604))))

(assert (=> b!1233271 (= res!821523 (noDuplicate!1815 acc!823))))

(declare-fun b!1233272 () Bool)

(declare-fun res!821525 () Bool)

(assert (=> b!1233272 (=> (not res!821525) (not e!699604))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1233272 (= res!821525 (validKeyInArray!0 k!2913))))

(declare-fun res!821521 () Bool)

(assert (=> start!102578 (=> (not res!821521) (not e!699604))))

(assert (=> start!102578 (= res!821521 (bvslt (size!38864 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102578 e!699604))

(declare-fun array_inv!29309 (array!79430) Bool)

(assert (=> start!102578 (array_inv!29309 a!3806)))

(assert (=> start!102578 true))

(declare-fun b!1233273 () Bool)

(assert (=> b!1233273 (= e!699605 true)))

(declare-fun lt!559492 () Bool)

(assert (=> b!1233273 (= lt!559492 (contains!7172 lt!559493 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233274 () Bool)

(declare-fun res!821519 () Bool)

(assert (=> b!1233274 (=> (not res!821519) (not e!699604))))

(assert (=> b!1233274 (= res!821519 (not (contains!7172 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233275 () Bool)

(declare-fun res!821517 () Bool)

(assert (=> b!1233275 (=> (not res!821517) (not e!699604))))

(declare-fun arrayContainsKey!0 (array!79430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233275 (= res!821517 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233276 () Bool)

(assert (=> b!1233276 (= e!699603 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27196 (select (arr!38326 a!3806) from!3184) Nil!27197)))))

(assert (= (and start!102578 res!821521) b!1233272))

(assert (= (and b!1233272 res!821525) b!1233265))

(assert (= (and b!1233265 res!821520) b!1233271))

(assert (= (and b!1233271 res!821523) b!1233274))

(assert (= (and b!1233274 res!821519) b!1233264))

(assert (= (and b!1233264 res!821527) b!1233275))

(assert (= (and b!1233275 res!821517) b!1233270))

(assert (= (and b!1233270 res!821526) b!1233268))

(assert (= (and b!1233268 res!821524) b!1233266))

(assert (= (and b!1233266 res!821518) b!1233276))

(assert (= (and b!1233266 (not res!821522)) b!1233269))

(assert (= (and b!1233269 (not res!821528)) b!1233267))

(assert (= (and b!1233267 (not res!821516)) b!1233273))

(declare-fun m!1136923 () Bool)

(assert (=> b!1233266 m!1136923))

(declare-fun m!1136925 () Bool)

(assert (=> b!1233266 m!1136925))

(declare-fun m!1136927 () Bool)

(assert (=> b!1233266 m!1136927))

(declare-fun m!1136929 () Bool)

(assert (=> b!1233266 m!1136929))

(declare-fun m!1136931 () Bool)

(assert (=> b!1233264 m!1136931))

(assert (=> b!1233268 m!1136923))

(assert (=> b!1233268 m!1136923))

(declare-fun m!1136933 () Bool)

(assert (=> b!1233268 m!1136933))

(assert (=> b!1233276 m!1136923))

(declare-fun m!1136935 () Bool)

(assert (=> b!1233276 m!1136935))

(declare-fun m!1136937 () Bool)

(assert (=> b!1233272 m!1136937))

(declare-fun m!1136939 () Bool)

(assert (=> b!1233267 m!1136939))

(declare-fun m!1136941 () Bool)

(assert (=> b!1233270 m!1136941))

(declare-fun m!1136943 () Bool)

(assert (=> b!1233273 m!1136943))

(declare-fun m!1136945 () Bool)

(assert (=> b!1233269 m!1136945))

(declare-fun m!1136947 () Bool)

(assert (=> b!1233275 m!1136947))

(declare-fun m!1136949 () Bool)

(assert (=> b!1233271 m!1136949))

(declare-fun m!1136951 () Bool)

(assert (=> b!1233274 m!1136951))

(declare-fun m!1136953 () Bool)

(assert (=> start!102578 m!1136953))

(push 1)

(assert (not b!1233270))

(assert (not b!1233264))

(assert (not b!1233273))

(assert (not start!102578))

(assert (not b!1233268))

(assert (not b!1233267))

(assert (not b!1233274))

(assert (not b!1233272))

(assert (not b!1233275))

(assert (not b!1233276))

(assert (not b!1233266))

(assert (not b!1233269))

(assert (not b!1233271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

