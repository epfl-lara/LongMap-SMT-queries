; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53610 () Bool)

(assert start!53610)

(declare-fun b!583310 () Bool)

(declare-fun res!371029 () Bool)

(declare-fun e!334341 () Bool)

(assert (=> b!583310 (=> (not res!371029) (not e!334341))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36456 0))(
  ( (array!36457 (arr!17500 (Array (_ BitVec 32) (_ BitVec 64))) (size!17864 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36456)

(assert (=> b!583310 (= res!371029 (and (= (size!17864 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17864 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17864 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583311 () Bool)

(declare-fun e!334340 () Bool)

(assert (=> b!583311 (= e!334341 e!334340)))

(declare-fun res!371028 () Bool)

(assert (=> b!583311 (=> (not res!371028) (not e!334340))))

(declare-datatypes ((SeekEntryResult!5896 0))(
  ( (MissingZero!5896 (index!25811 (_ BitVec 32))) (Found!5896 (index!25812 (_ BitVec 32))) (Intermediate!5896 (undefined!6708 Bool) (index!25813 (_ BitVec 32)) (x!54808 (_ BitVec 32))) (Undefined!5896) (MissingVacant!5896 (index!25814 (_ BitVec 32))) )
))
(declare-fun lt!265374 () SeekEntryResult!5896)

(assert (=> b!583311 (= res!371028 (or (= lt!265374 (MissingZero!5896 i!1108)) (= lt!265374 (MissingVacant!5896 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36456 (_ BitVec 32)) SeekEntryResult!5896)

(assert (=> b!583311 (= lt!265374 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583312 () Bool)

(declare-fun res!371025 () Bool)

(assert (=> b!583312 (=> (not res!371025) (not e!334341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583312 (= res!371025 (validKeyInArray!0 k0!1786))))

(declare-fun b!583313 () Bool)

(declare-fun res!371022 () Bool)

(assert (=> b!583313 (=> (not res!371022) (not e!334340))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583313 (= res!371022 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17500 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17500 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583314 () Bool)

(declare-fun res!371027 () Bool)

(assert (=> b!583314 (=> (not res!371027) (not e!334340))))

(declare-datatypes ((List!11448 0))(
  ( (Nil!11445) (Cons!11444 (h!12492 (_ BitVec 64)) (t!17668 List!11448)) )
))
(declare-fun arrayNoDuplicates!0 (array!36456 (_ BitVec 32) List!11448) Bool)

(assert (=> b!583314 (= res!371027 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11445))))

(declare-fun res!371024 () Bool)

(assert (=> start!53610 (=> (not res!371024) (not e!334341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53610 (= res!371024 (validMask!0 mask!3053))))

(assert (=> start!53610 e!334341))

(assert (=> start!53610 true))

(declare-fun array_inv!13359 (array!36456) Bool)

(assert (=> start!53610 (array_inv!13359 a!2986)))

(declare-fun b!583315 () Bool)

(declare-fun res!371023 () Bool)

(assert (=> b!583315 (=> (not res!371023) (not e!334341))))

(assert (=> b!583315 (= res!371023 (validKeyInArray!0 (select (arr!17500 a!2986) j!136)))))

(declare-fun b!583316 () Bool)

(assert (=> b!583316 (= e!334340 false)))

(declare-fun lt!265375 () SeekEntryResult!5896)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36456 (_ BitVec 32)) SeekEntryResult!5896)

(assert (=> b!583316 (= lt!265375 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17500 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583317 () Bool)

(declare-fun res!371021 () Bool)

(assert (=> b!583317 (=> (not res!371021) (not e!334340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36456 (_ BitVec 32)) Bool)

(assert (=> b!583317 (= res!371021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583318 () Bool)

(declare-fun res!371026 () Bool)

(assert (=> b!583318 (=> (not res!371026) (not e!334341))))

(declare-fun arrayContainsKey!0 (array!36456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583318 (= res!371026 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53610 res!371024) b!583310))

(assert (= (and b!583310 res!371029) b!583315))

(assert (= (and b!583315 res!371023) b!583312))

(assert (= (and b!583312 res!371025) b!583318))

(assert (= (and b!583318 res!371026) b!583311))

(assert (= (and b!583311 res!371028) b!583317))

(assert (= (and b!583317 res!371021) b!583314))

(assert (= (and b!583314 res!371027) b!583313))

(assert (= (and b!583313 res!371022) b!583316))

(declare-fun m!561941 () Bool)

(assert (=> b!583313 m!561941))

(declare-fun m!561943 () Bool)

(assert (=> b!583313 m!561943))

(declare-fun m!561945 () Bool)

(assert (=> b!583313 m!561945))

(declare-fun m!561947 () Bool)

(assert (=> b!583314 m!561947))

(declare-fun m!561949 () Bool)

(assert (=> b!583315 m!561949))

(assert (=> b!583315 m!561949))

(declare-fun m!561951 () Bool)

(assert (=> b!583315 m!561951))

(declare-fun m!561953 () Bool)

(assert (=> b!583318 m!561953))

(declare-fun m!561955 () Bool)

(assert (=> b!583312 m!561955))

(declare-fun m!561957 () Bool)

(assert (=> b!583317 m!561957))

(declare-fun m!561959 () Bool)

(assert (=> start!53610 m!561959))

(declare-fun m!561961 () Bool)

(assert (=> start!53610 m!561961))

(declare-fun m!561963 () Bool)

(assert (=> b!583311 m!561963))

(assert (=> b!583316 m!561949))

(assert (=> b!583316 m!561949))

(declare-fun m!561965 () Bool)

(assert (=> b!583316 m!561965))

(check-sat (not b!583317) (not b!583312) (not b!583314) (not start!53610) (not b!583311) (not b!583315) (not b!583316) (not b!583318))
(check-sat)
