; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53322 () Bool)

(assert start!53322)

(declare-fun b!579386 () Bool)

(declare-fun res!367098 () Bool)

(declare-fun e!333043 () Bool)

(assert (=> b!579386 (=> (not res!367098) (not e!333043))))

(declare-datatypes ((array!36168 0))(
  ( (array!36169 (arr!17356 (Array (_ BitVec 32) (_ BitVec 64))) (size!17720 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36168)

(declare-datatypes ((List!11304 0))(
  ( (Nil!11301) (Cons!11300 (h!12348 (_ BitVec 64)) (t!17524 List!11304)) )
))
(declare-fun arrayNoDuplicates!0 (array!36168 (_ BitVec 32) List!11304) Bool)

(assert (=> b!579386 (= res!367098 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11301))))

(declare-fun b!579387 () Bool)

(declare-fun res!367103 () Bool)

(declare-fun e!333044 () Bool)

(assert (=> b!579387 (=> (not res!367103) (not e!333044))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579387 (= res!367103 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579388 () Bool)

(declare-fun res!367105 () Bool)

(assert (=> b!579388 (=> (not res!367105) (not e!333044))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579388 (= res!367105 (validKeyInArray!0 (select (arr!17356 a!2986) j!136)))))

(declare-fun b!579389 () Bool)

(declare-fun res!367101 () Bool)

(assert (=> b!579389 (=> (not res!367101) (not e!333044))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579389 (= res!367101 (and (= (size!17720 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17720 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17720 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579391 () Bool)

(assert (=> b!579391 (= e!333043 false)))

(declare-datatypes ((SeekEntryResult!5752 0))(
  ( (MissingZero!5752 (index!25235 (_ BitVec 32))) (Found!5752 (index!25236 (_ BitVec 32))) (Intermediate!5752 (undefined!6564 Bool) (index!25237 (_ BitVec 32)) (x!54280 (_ BitVec 32))) (Undefined!5752) (MissingVacant!5752 (index!25238 (_ BitVec 32))) )
))
(declare-fun lt!264537 () SeekEntryResult!5752)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36168 (_ BitVec 32)) SeekEntryResult!5752)

(assert (=> b!579391 (= lt!264537 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17356 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579392 () Bool)

(declare-fun res!367099 () Bool)

(assert (=> b!579392 (=> (not res!367099) (not e!333044))))

(assert (=> b!579392 (= res!367099 (validKeyInArray!0 k0!1786))))

(declare-fun b!579393 () Bool)

(declare-fun res!367102 () Bool)

(assert (=> b!579393 (=> (not res!367102) (not e!333043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36168 (_ BitVec 32)) Bool)

(assert (=> b!579393 (= res!367102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579394 () Bool)

(assert (=> b!579394 (= e!333044 e!333043)))

(declare-fun res!367100 () Bool)

(assert (=> b!579394 (=> (not res!367100) (not e!333043))))

(declare-fun lt!264538 () SeekEntryResult!5752)

(assert (=> b!579394 (= res!367100 (or (= lt!264538 (MissingZero!5752 i!1108)) (= lt!264538 (MissingVacant!5752 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36168 (_ BitVec 32)) SeekEntryResult!5752)

(assert (=> b!579394 (= lt!264538 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!367097 () Bool)

(assert (=> start!53322 (=> (not res!367097) (not e!333044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53322 (= res!367097 (validMask!0 mask!3053))))

(assert (=> start!53322 e!333044))

(assert (=> start!53322 true))

(declare-fun array_inv!13215 (array!36168) Bool)

(assert (=> start!53322 (array_inv!13215 a!2986)))

(declare-fun b!579390 () Bool)

(declare-fun res!367104 () Bool)

(assert (=> b!579390 (=> (not res!367104) (not e!333043))))

(assert (=> b!579390 (= res!367104 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17356 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17356 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53322 res!367097) b!579389))

(assert (= (and b!579389 res!367101) b!579388))

(assert (= (and b!579388 res!367105) b!579392))

(assert (= (and b!579392 res!367099) b!579387))

(assert (= (and b!579387 res!367103) b!579394))

(assert (= (and b!579394 res!367100) b!579393))

(assert (= (and b!579393 res!367102) b!579386))

(assert (= (and b!579386 res!367098) b!579390))

(assert (= (and b!579390 res!367104) b!579391))

(declare-fun m!558167 () Bool)

(assert (=> b!579391 m!558167))

(assert (=> b!579391 m!558167))

(declare-fun m!558169 () Bool)

(assert (=> b!579391 m!558169))

(declare-fun m!558171 () Bool)

(assert (=> b!579394 m!558171))

(assert (=> b!579388 m!558167))

(assert (=> b!579388 m!558167))

(declare-fun m!558173 () Bool)

(assert (=> b!579388 m!558173))

(declare-fun m!558175 () Bool)

(assert (=> start!53322 m!558175))

(declare-fun m!558177 () Bool)

(assert (=> start!53322 m!558177))

(declare-fun m!558179 () Bool)

(assert (=> b!579392 m!558179))

(declare-fun m!558181 () Bool)

(assert (=> b!579386 m!558181))

(declare-fun m!558183 () Bool)

(assert (=> b!579390 m!558183))

(declare-fun m!558185 () Bool)

(assert (=> b!579390 m!558185))

(declare-fun m!558187 () Bool)

(assert (=> b!579390 m!558187))

(declare-fun m!558189 () Bool)

(assert (=> b!579387 m!558189))

(declare-fun m!558191 () Bool)

(assert (=> b!579393 m!558191))

(check-sat (not b!579387) (not b!579391) (not b!579388) (not b!579393) (not b!579386) (not start!53322) (not b!579392) (not b!579394))
(check-sat)
