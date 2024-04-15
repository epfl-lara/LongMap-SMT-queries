; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103124 () Bool)

(assert start!103124)

(declare-fun b!1238198 () Bool)

(declare-fun e!701751 () Bool)

(assert (=> b!1238198 (= e!701751 true)))

(declare-fun lt!561081 () Bool)

(declare-datatypes ((List!27344 0))(
  ( (Nil!27341) (Cons!27340 (h!28549 (_ BitVec 64)) (t!40798 List!27344)) )
))
(declare-fun lt!561080 () List!27344)

(declare-fun contains!7316 (List!27344 (_ BitVec 64)) Bool)

(assert (=> b!1238198 (= lt!561081 (contains!7316 lt!561080 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238199 () Bool)

(declare-fun res!825967 () Bool)

(declare-fun e!701753 () Bool)

(assert (=> b!1238199 (=> (not res!825967) (not e!701753))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79733 0))(
  ( (array!79734 (arr!38470 (Array (_ BitVec 32) (_ BitVec 64))) (size!39008 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79733)

(assert (=> b!1238199 (= res!825967 (not (= from!3213 (bvsub (size!39008 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238200 () Bool)

(declare-fun res!825960 () Bool)

(assert (=> b!1238200 (=> res!825960 e!701751)))

(assert (=> b!1238200 (= res!825960 (contains!7316 lt!561080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238201 () Bool)

(declare-fun res!825961 () Bool)

(assert (=> b!1238201 (=> (not res!825961) (not e!701753))))

(declare-fun acc!846 () List!27344)

(declare-fun arrayNoDuplicates!0 (array!79733 (_ BitVec 32) List!27344) Bool)

(assert (=> b!1238201 (= res!825961 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238202 () Bool)

(declare-fun res!825962 () Bool)

(assert (=> b!1238202 (=> (not res!825962) (not e!701753))))

(declare-fun noDuplicate!1959 (List!27344) Bool)

(assert (=> b!1238202 (= res!825962 (noDuplicate!1959 acc!846))))

(declare-fun b!1238203 () Bool)

(declare-fun res!825964 () Bool)

(assert (=> b!1238203 (=> (not res!825964) (not e!701753))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238203 (= res!825964 (contains!7316 acc!846 k!2925))))

(declare-fun b!1238204 () Bool)

(declare-fun res!825958 () Bool)

(assert (=> b!1238204 (=> res!825958 e!701751)))

(assert (=> b!1238204 (= res!825958 (not (noDuplicate!1959 lt!561080)))))

(declare-fun b!1238205 () Bool)

(declare-fun res!825959 () Bool)

(assert (=> b!1238205 (=> (not res!825959) (not e!701753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238205 (= res!825959 (validKeyInArray!0 (select (arr!38470 a!3835) from!3213)))))

(declare-fun b!1238206 () Bool)

(declare-fun res!825965 () Bool)

(assert (=> b!1238206 (=> (not res!825965) (not e!701753))))

(assert (=> b!1238206 (= res!825965 (not (contains!7316 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238207 () Bool)

(declare-fun res!825966 () Bool)

(assert (=> b!1238207 (=> (not res!825966) (not e!701753))))

(assert (=> b!1238207 (= res!825966 (not (contains!7316 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825968 () Bool)

(assert (=> start!103124 (=> (not res!825968) (not e!701753))))

(assert (=> start!103124 (= res!825968 (and (bvslt (size!39008 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39008 a!3835))))))

(assert (=> start!103124 e!701753))

(declare-fun array_inv!29453 (array!79733) Bool)

(assert (=> start!103124 (array_inv!29453 a!3835)))

(assert (=> start!103124 true))

(declare-fun b!1238208 () Bool)

(assert (=> b!1238208 (= e!701753 (not e!701751))))

(declare-fun res!825963 () Bool)

(assert (=> b!1238208 (=> res!825963 e!701751)))

(assert (=> b!1238208 (= res!825963 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!598 (List!27344 List!27344) Bool)

(assert (=> b!1238208 (subseq!598 acc!846 lt!561080)))

(declare-datatypes ((Unit!40949 0))(
  ( (Unit!40950) )
))
(declare-fun lt!561082 () Unit!40949)

(declare-fun subseqTail!85 (List!27344 List!27344) Unit!40949)

(assert (=> b!1238208 (= lt!561082 (subseqTail!85 lt!561080 lt!561080))))

(assert (=> b!1238208 (subseq!598 lt!561080 lt!561080)))

(declare-fun lt!561083 () Unit!40949)

(declare-fun lemmaListSubSeqRefl!0 (List!27344) Unit!40949)

(assert (=> b!1238208 (= lt!561083 (lemmaListSubSeqRefl!0 lt!561080))))

(assert (=> b!1238208 (= lt!561080 (Cons!27340 (select (arr!38470 a!3835) from!3213) acc!846))))

(assert (= (and start!103124 res!825968) b!1238202))

(assert (= (and b!1238202 res!825962) b!1238206))

(assert (= (and b!1238206 res!825965) b!1238207))

(assert (= (and b!1238207 res!825966) b!1238201))

(assert (= (and b!1238201 res!825961) b!1238203))

(assert (= (and b!1238203 res!825964) b!1238199))

(assert (= (and b!1238199 res!825967) b!1238205))

(assert (= (and b!1238205 res!825959) b!1238208))

(assert (= (and b!1238208 (not res!825963)) b!1238204))

(assert (= (and b!1238204 (not res!825958)) b!1238200))

(assert (= (and b!1238200 (not res!825960)) b!1238198))

(declare-fun m!1141329 () Bool)

(assert (=> b!1238205 m!1141329))

(assert (=> b!1238205 m!1141329))

(declare-fun m!1141331 () Bool)

(assert (=> b!1238205 m!1141331))

(declare-fun m!1141333 () Bool)

(assert (=> start!103124 m!1141333))

(declare-fun m!1141335 () Bool)

(assert (=> b!1238203 m!1141335))

(declare-fun m!1141337 () Bool)

(assert (=> b!1238206 m!1141337))

(declare-fun m!1141339 () Bool)

(assert (=> b!1238201 m!1141339))

(declare-fun m!1141341 () Bool)

(assert (=> b!1238200 m!1141341))

(declare-fun m!1141343 () Bool)

(assert (=> b!1238207 m!1141343))

(declare-fun m!1141345 () Bool)

(assert (=> b!1238204 m!1141345))

(declare-fun m!1141347 () Bool)

(assert (=> b!1238202 m!1141347))

(declare-fun m!1141349 () Bool)

(assert (=> b!1238198 m!1141349))

(declare-fun m!1141351 () Bool)

(assert (=> b!1238208 m!1141351))

(declare-fun m!1141353 () Bool)

(assert (=> b!1238208 m!1141353))

(declare-fun m!1141355 () Bool)

(assert (=> b!1238208 m!1141355))

(declare-fun m!1141357 () Bool)

(assert (=> b!1238208 m!1141357))

(assert (=> b!1238208 m!1141329))

(push 1)

(assert (not b!1238200))

(assert (not b!1238203))

(assert (not b!1238204))

(assert (not b!1238206))

(assert (not b!1238198))

(assert (not b!1238205))

(assert (not b!1238202))

(assert (not start!103124))

(assert (not b!1238208))

(assert (not b!1238207))

(assert (not b!1238201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

