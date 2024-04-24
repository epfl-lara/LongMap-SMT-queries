; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53310 () Bool)

(assert start!53310)

(declare-fun b!579224 () Bool)

(declare-fun res!366942 () Bool)

(declare-fun e!332989 () Bool)

(assert (=> b!579224 (=> (not res!366942) (not e!332989))))

(declare-datatypes ((array!36156 0))(
  ( (array!36157 (arr!17350 (Array (_ BitVec 32) (_ BitVec 64))) (size!17714 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36156)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36156 (_ BitVec 32)) Bool)

(assert (=> b!579224 (= res!366942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579225 () Bool)

(declare-fun res!366940 () Bool)

(declare-fun e!332991 () Bool)

(assert (=> b!579225 (=> (not res!366940) (not e!332991))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579225 (= res!366940 (validKeyInArray!0 (select (arr!17350 a!2986) j!136)))))

(declare-fun b!579226 () Bool)

(assert (=> b!579226 (= e!332991 e!332989)))

(declare-fun res!366935 () Bool)

(assert (=> b!579226 (=> (not res!366935) (not e!332989))))

(declare-datatypes ((SeekEntryResult!5746 0))(
  ( (MissingZero!5746 (index!25211 (_ BitVec 32))) (Found!5746 (index!25212 (_ BitVec 32))) (Intermediate!5746 (undefined!6558 Bool) (index!25213 (_ BitVec 32)) (x!54258 (_ BitVec 32))) (Undefined!5746) (MissingVacant!5746 (index!25214 (_ BitVec 32))) )
))
(declare-fun lt!264501 () SeekEntryResult!5746)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579226 (= res!366935 (or (= lt!264501 (MissingZero!5746 i!1108)) (= lt!264501 (MissingVacant!5746 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36156 (_ BitVec 32)) SeekEntryResult!5746)

(assert (=> b!579226 (= lt!264501 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579227 () Bool)

(declare-fun res!366938 () Bool)

(assert (=> b!579227 (=> (not res!366938) (not e!332991))))

(assert (=> b!579227 (= res!366938 (and (= (size!17714 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17714 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17714 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579228 () Bool)

(declare-fun res!366943 () Bool)

(assert (=> b!579228 (=> (not res!366943) (not e!332989))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579228 (= res!366943 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17350 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17350 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579230 () Bool)

(declare-fun res!366937 () Bool)

(assert (=> b!579230 (=> (not res!366937) (not e!332991))))

(declare-fun arrayContainsKey!0 (array!36156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579230 (= res!366937 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579231 () Bool)

(assert (=> b!579231 (= e!332989 false)))

(declare-fun lt!264502 () SeekEntryResult!5746)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36156 (_ BitVec 32)) SeekEntryResult!5746)

(assert (=> b!579231 (= lt!264502 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17350 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579232 () Bool)

(declare-fun res!366936 () Bool)

(assert (=> b!579232 (=> (not res!366936) (not e!332991))))

(assert (=> b!579232 (= res!366936 (validKeyInArray!0 k0!1786))))

(declare-fun res!366939 () Bool)

(assert (=> start!53310 (=> (not res!366939) (not e!332991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53310 (= res!366939 (validMask!0 mask!3053))))

(assert (=> start!53310 e!332991))

(assert (=> start!53310 true))

(declare-fun array_inv!13209 (array!36156) Bool)

(assert (=> start!53310 (array_inv!13209 a!2986)))

(declare-fun b!579229 () Bool)

(declare-fun res!366941 () Bool)

(assert (=> b!579229 (=> (not res!366941) (not e!332989))))

(declare-datatypes ((List!11298 0))(
  ( (Nil!11295) (Cons!11294 (h!12342 (_ BitVec 64)) (t!17518 List!11298)) )
))
(declare-fun arrayNoDuplicates!0 (array!36156 (_ BitVec 32) List!11298) Bool)

(assert (=> b!579229 (= res!366941 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11295))))

(assert (= (and start!53310 res!366939) b!579227))

(assert (= (and b!579227 res!366938) b!579225))

(assert (= (and b!579225 res!366940) b!579232))

(assert (= (and b!579232 res!366936) b!579230))

(assert (= (and b!579230 res!366937) b!579226))

(assert (= (and b!579226 res!366935) b!579224))

(assert (= (and b!579224 res!366942) b!579229))

(assert (= (and b!579229 res!366941) b!579228))

(assert (= (and b!579228 res!366943) b!579231))

(declare-fun m!558011 () Bool)

(assert (=> b!579228 m!558011))

(declare-fun m!558013 () Bool)

(assert (=> b!579228 m!558013))

(declare-fun m!558015 () Bool)

(assert (=> b!579228 m!558015))

(declare-fun m!558017 () Bool)

(assert (=> b!579224 m!558017))

(declare-fun m!558019 () Bool)

(assert (=> b!579232 m!558019))

(declare-fun m!558021 () Bool)

(assert (=> b!579229 m!558021))

(declare-fun m!558023 () Bool)

(assert (=> b!579226 m!558023))

(declare-fun m!558025 () Bool)

(assert (=> b!579230 m!558025))

(declare-fun m!558027 () Bool)

(assert (=> b!579225 m!558027))

(assert (=> b!579225 m!558027))

(declare-fun m!558029 () Bool)

(assert (=> b!579225 m!558029))

(declare-fun m!558031 () Bool)

(assert (=> start!53310 m!558031))

(declare-fun m!558033 () Bool)

(assert (=> start!53310 m!558033))

(assert (=> b!579231 m!558027))

(assert (=> b!579231 m!558027))

(declare-fun m!558035 () Bool)

(assert (=> b!579231 m!558035))

(check-sat (not b!579226) (not b!579224) (not b!579229) (not b!579225) (not b!579232) (not start!53310) (not b!579231) (not b!579230))
(check-sat)
