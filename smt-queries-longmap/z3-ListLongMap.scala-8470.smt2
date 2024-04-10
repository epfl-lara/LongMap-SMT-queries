; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103124 () Bool)

(assert start!103124)

(declare-fun b!1238233 () Bool)

(declare-fun res!825958 () Bool)

(declare-fun e!701778 () Bool)

(assert (=> b!1238233 (=> (not res!825958) (not e!701778))))

(declare-datatypes ((List!27281 0))(
  ( (Nil!27278) (Cons!27277 (h!28486 (_ BitVec 64)) (t!40744 List!27281)) )
))
(declare-fun acc!846 () List!27281)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7343 (List!27281 (_ BitVec 64)) Bool)

(assert (=> b!1238233 (= res!825958 (contains!7343 acc!846 k0!2925))))

(declare-fun b!1238234 () Bool)

(declare-fun res!825963 () Bool)

(assert (=> b!1238234 (=> (not res!825963) (not e!701778))))

(declare-fun noDuplicate!1940 (List!27281) Bool)

(assert (=> b!1238234 (= res!825963 (noDuplicate!1940 acc!846))))

(declare-fun b!1238236 () Bool)

(declare-fun res!825960 () Bool)

(assert (=> b!1238236 (=> (not res!825960) (not e!701778))))

(assert (=> b!1238236 (= res!825960 (not (contains!7343 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238237 () Bool)

(declare-fun res!825964 () Bool)

(assert (=> b!1238237 (=> (not res!825964) (not e!701778))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79810 0))(
  ( (array!79811 (arr!38508 (Array (_ BitVec 32) (_ BitVec 64))) (size!39044 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79810)

(assert (=> b!1238237 (= res!825964 (not (= from!3213 (bvsub (size!39044 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238238 () Bool)

(declare-fun res!825962 () Bool)

(assert (=> b!1238238 (=> (not res!825962) (not e!701778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238238 (= res!825962 (validKeyInArray!0 (select (arr!38508 a!3835) from!3213)))))

(declare-fun b!1238239 () Bool)

(declare-fun e!701776 () Bool)

(assert (=> b!1238239 (= e!701778 (not e!701776))))

(declare-fun res!825966 () Bool)

(assert (=> b!1238239 (=> res!825966 e!701776)))

(assert (=> b!1238239 (= res!825966 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!561245 () List!27281)

(declare-fun subseq!597 (List!27281 List!27281) Bool)

(assert (=> b!1238239 (subseq!597 acc!846 lt!561245)))

(declare-datatypes ((Unit!41102 0))(
  ( (Unit!41103) )
))
(declare-fun lt!561243 () Unit!41102)

(declare-fun subseqTail!84 (List!27281 List!27281) Unit!41102)

(assert (=> b!1238239 (= lt!561243 (subseqTail!84 lt!561245 lt!561245))))

(assert (=> b!1238239 (subseq!597 lt!561245 lt!561245)))

(declare-fun lt!561244 () Unit!41102)

(declare-fun lemmaListSubSeqRefl!0 (List!27281) Unit!41102)

(assert (=> b!1238239 (= lt!561244 (lemmaListSubSeqRefl!0 lt!561245))))

(assert (=> b!1238239 (= lt!561245 (Cons!27277 (select (arr!38508 a!3835) from!3213) acc!846))))

(declare-fun b!1238240 () Bool)

(assert (=> b!1238240 (= e!701776 true)))

(declare-fun lt!561242 () Bool)

(assert (=> b!1238240 (= lt!561242 (contains!7343 lt!561245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238241 () Bool)

(declare-fun res!825967 () Bool)

(assert (=> b!1238241 (=> res!825967 e!701776)))

(assert (=> b!1238241 (= res!825967 (not (noDuplicate!1940 lt!561245)))))

(declare-fun b!1238242 () Bool)

(declare-fun res!825957 () Bool)

(assert (=> b!1238242 (=> res!825957 e!701776)))

(assert (=> b!1238242 (= res!825957 (contains!7343 lt!561245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238243 () Bool)

(declare-fun res!825959 () Bool)

(assert (=> b!1238243 (=> (not res!825959) (not e!701778))))

(declare-fun arrayNoDuplicates!0 (array!79810 (_ BitVec 32) List!27281) Bool)

(assert (=> b!1238243 (= res!825959 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238235 () Bool)

(declare-fun res!825965 () Bool)

(assert (=> b!1238235 (=> (not res!825965) (not e!701778))))

(assert (=> b!1238235 (= res!825965 (not (contains!7343 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825961 () Bool)

(assert (=> start!103124 (=> (not res!825961) (not e!701778))))

(assert (=> start!103124 (= res!825961 (and (bvslt (size!39044 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39044 a!3835))))))

(assert (=> start!103124 e!701778))

(declare-fun array_inv!29356 (array!79810) Bool)

(assert (=> start!103124 (array_inv!29356 a!3835)))

(assert (=> start!103124 true))

(assert (= (and start!103124 res!825961) b!1238234))

(assert (= (and b!1238234 res!825963) b!1238235))

(assert (= (and b!1238235 res!825965) b!1238236))

(assert (= (and b!1238236 res!825960) b!1238243))

(assert (= (and b!1238243 res!825959) b!1238233))

(assert (= (and b!1238233 res!825958) b!1238237))

(assert (= (and b!1238237 res!825964) b!1238238))

(assert (= (and b!1238238 res!825962) b!1238239))

(assert (= (and b!1238239 (not res!825966)) b!1238241))

(assert (= (and b!1238241 (not res!825967)) b!1238242))

(assert (= (and b!1238242 (not res!825957)) b!1238240))

(declare-fun m!1141795 () Bool)

(assert (=> b!1238234 m!1141795))

(declare-fun m!1141797 () Bool)

(assert (=> b!1238239 m!1141797))

(declare-fun m!1141799 () Bool)

(assert (=> b!1238239 m!1141799))

(declare-fun m!1141801 () Bool)

(assert (=> b!1238239 m!1141801))

(declare-fun m!1141803 () Bool)

(assert (=> b!1238239 m!1141803))

(declare-fun m!1141805 () Bool)

(assert (=> b!1238239 m!1141805))

(declare-fun m!1141807 () Bool)

(assert (=> b!1238240 m!1141807))

(declare-fun m!1141809 () Bool)

(assert (=> b!1238243 m!1141809))

(declare-fun m!1141811 () Bool)

(assert (=> b!1238242 m!1141811))

(declare-fun m!1141813 () Bool)

(assert (=> b!1238233 m!1141813))

(declare-fun m!1141815 () Bool)

(assert (=> b!1238235 m!1141815))

(assert (=> b!1238238 m!1141805))

(assert (=> b!1238238 m!1141805))

(declare-fun m!1141817 () Bool)

(assert (=> b!1238238 m!1141817))

(declare-fun m!1141819 () Bool)

(assert (=> b!1238236 m!1141819))

(declare-fun m!1141821 () Bool)

(assert (=> b!1238241 m!1141821))

(declare-fun m!1141823 () Bool)

(assert (=> start!103124 m!1141823))

(check-sat (not b!1238239) (not b!1238235) (not b!1238238) (not b!1238234) (not b!1238236) (not b!1238240) (not b!1238241) (not start!103124) (not b!1238243) (not b!1238233) (not b!1238242))
(check-sat)
