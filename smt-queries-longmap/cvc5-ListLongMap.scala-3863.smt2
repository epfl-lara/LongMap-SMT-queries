; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53188 () Bool)

(assert start!53188)

(declare-fun b!578158 () Bool)

(declare-fun res!365974 () Bool)

(declare-fun e!332536 () Bool)

(assert (=> b!578158 (=> (not res!365974) (not e!332536))))

(declare-datatypes ((array!36089 0))(
  ( (array!36090 (arr!17319 (Array (_ BitVec 32) (_ BitVec 64))) (size!17683 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36089)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36089 (_ BitVec 32)) Bool)

(assert (=> b!578158 (= res!365974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578159 () Bool)

(declare-fun res!365975 () Bool)

(declare-fun e!332538 () Bool)

(assert (=> b!578159 (=> (not res!365975) (not e!332538))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578159 (= res!365975 (validKeyInArray!0 k!1786))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!578160 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578160 (= e!332536 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17319 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17319 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun res!365978 () Bool)

(assert (=> start!53188 (=> (not res!365978) (not e!332538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53188 (= res!365978 (validMask!0 mask!3053))))

(assert (=> start!53188 e!332538))

(assert (=> start!53188 true))

(declare-fun array_inv!13115 (array!36089) Bool)

(assert (=> start!53188 (array_inv!13115 a!2986)))

(declare-fun b!578161 () Bool)

(declare-fun res!365981 () Bool)

(assert (=> b!578161 (=> (not res!365981) (not e!332538))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578161 (= res!365981 (validKeyInArray!0 (select (arr!17319 a!2986) j!136)))))

(declare-fun b!578162 () Bool)

(assert (=> b!578162 (= e!332538 e!332536)))

(declare-fun res!365976 () Bool)

(assert (=> b!578162 (=> (not res!365976) (not e!332536))))

(declare-datatypes ((SeekEntryResult!5759 0))(
  ( (MissingZero!5759 (index!25263 (_ BitVec 32))) (Found!5759 (index!25264 (_ BitVec 32))) (Intermediate!5759 (undefined!6571 Bool) (index!25265 (_ BitVec 32)) (x!54172 (_ BitVec 32))) (Undefined!5759) (MissingVacant!5759 (index!25266 (_ BitVec 32))) )
))
(declare-fun lt!264190 () SeekEntryResult!5759)

(assert (=> b!578162 (= res!365976 (or (= lt!264190 (MissingZero!5759 i!1108)) (= lt!264190 (MissingVacant!5759 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36089 (_ BitVec 32)) SeekEntryResult!5759)

(assert (=> b!578162 (= lt!264190 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578163 () Bool)

(declare-fun res!365977 () Bool)

(assert (=> b!578163 (=> (not res!365977) (not e!332536))))

(declare-datatypes ((List!11360 0))(
  ( (Nil!11357) (Cons!11356 (h!12401 (_ BitVec 64)) (t!17588 List!11360)) )
))
(declare-fun arrayNoDuplicates!0 (array!36089 (_ BitVec 32) List!11360) Bool)

(assert (=> b!578163 (= res!365977 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11357))))

(declare-fun b!578164 () Bool)

(declare-fun res!365979 () Bool)

(assert (=> b!578164 (=> (not res!365979) (not e!332538))))

(declare-fun arrayContainsKey!0 (array!36089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578164 (= res!365979 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578165 () Bool)

(declare-fun res!365980 () Bool)

(assert (=> b!578165 (=> (not res!365980) (not e!332538))))

(assert (=> b!578165 (= res!365980 (and (= (size!17683 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17683 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17683 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53188 res!365978) b!578165))

(assert (= (and b!578165 res!365980) b!578161))

(assert (= (and b!578161 res!365981) b!578159))

(assert (= (and b!578159 res!365975) b!578164))

(assert (= (and b!578164 res!365979) b!578162))

(assert (= (and b!578162 res!365976) b!578158))

(assert (= (and b!578158 res!365974) b!578163))

(assert (= (and b!578163 res!365977) b!578160))

(declare-fun m!556873 () Bool)

(assert (=> b!578158 m!556873))

(declare-fun m!556875 () Bool)

(assert (=> b!578162 m!556875))

(declare-fun m!556877 () Bool)

(assert (=> b!578163 m!556877))

(declare-fun m!556879 () Bool)

(assert (=> b!578160 m!556879))

(declare-fun m!556881 () Bool)

(assert (=> b!578160 m!556881))

(declare-fun m!556883 () Bool)

(assert (=> b!578160 m!556883))

(declare-fun m!556885 () Bool)

(assert (=> b!578161 m!556885))

(assert (=> b!578161 m!556885))

(declare-fun m!556887 () Bool)

(assert (=> b!578161 m!556887))

(declare-fun m!556889 () Bool)

(assert (=> b!578164 m!556889))

(declare-fun m!556891 () Bool)

(assert (=> b!578159 m!556891))

(declare-fun m!556893 () Bool)

(assert (=> start!53188 m!556893))

(declare-fun m!556895 () Bool)

(assert (=> start!53188 m!556895))

(push 1)

(assert (not b!578162))

(assert (not b!578159))

(assert (not b!578158))

(assert (not b!578163))

(assert (not b!578161))

(assert (not b!578164))

(assert (not start!53188))

(check-sat)

(pop 1)

