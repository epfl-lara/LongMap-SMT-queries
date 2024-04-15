; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53496 () Bool)

(assert start!53496)

(declare-fun b!582191 () Bool)

(declare-fun res!370151 () Bool)

(declare-fun e!333820 () Bool)

(assert (=> b!582191 (=> (not res!370151) (not e!333820))))

(declare-datatypes ((array!36411 0))(
  ( (array!36412 (arr!17480 (Array (_ BitVec 32) (_ BitVec 64))) (size!17845 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36411)

(declare-datatypes ((List!11560 0))(
  ( (Nil!11557) (Cons!11556 (h!12601 (_ BitVec 64)) (t!17779 List!11560)) )
))
(declare-fun arrayNoDuplicates!0 (array!36411 (_ BitVec 32) List!11560) Bool)

(assert (=> b!582191 (= res!370151 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11557))))

(declare-fun b!582192 () Bool)

(declare-fun res!370157 () Bool)

(declare-fun e!333821 () Bool)

(assert (=> b!582192 (=> (not res!370157) (not e!333821))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582192 (= res!370157 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582193 () Bool)

(declare-fun res!370154 () Bool)

(assert (=> b!582193 (=> (not res!370154) (not e!333821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582193 (= res!370154 (validKeyInArray!0 k0!1786))))

(declare-fun b!582195 () Bool)

(declare-fun res!370152 () Bool)

(assert (=> b!582195 (=> (not res!370152) (not e!333820))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36411 (_ BitVec 32)) Bool)

(assert (=> b!582195 (= res!370152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582196 () Bool)

(declare-fun res!370155 () Bool)

(assert (=> b!582196 (=> (not res!370155) (not e!333821))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582196 (= res!370155 (validKeyInArray!0 (select (arr!17480 a!2986) j!136)))))

(declare-fun b!582197 () Bool)

(declare-fun res!370153 () Bool)

(assert (=> b!582197 (=> (not res!370153) (not e!333821))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582197 (= res!370153 (and (= (size!17845 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17845 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17845 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582194 () Bool)

(declare-fun res!370149 () Bool)

(assert (=> b!582194 (=> (not res!370149) (not e!333820))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582194 (= res!370149 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17480 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17480 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370156 () Bool)

(assert (=> start!53496 (=> (not res!370156) (not e!333821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53496 (= res!370156 (validMask!0 mask!3053))))

(assert (=> start!53496 e!333821))

(assert (=> start!53496 true))

(declare-fun array_inv!13363 (array!36411) Bool)

(assert (=> start!53496 (array_inv!13363 a!2986)))

(declare-fun b!582198 () Bool)

(assert (=> b!582198 (= e!333820 false)))

(declare-datatypes ((SeekEntryResult!5917 0))(
  ( (MissingZero!5917 (index!25895 (_ BitVec 32))) (Found!5917 (index!25896 (_ BitVec 32))) (Intermediate!5917 (undefined!6729 Bool) (index!25897 (_ BitVec 32)) (x!54757 (_ BitVec 32))) (Undefined!5917) (MissingVacant!5917 (index!25898 (_ BitVec 32))) )
))
(declare-fun lt!264886 () SeekEntryResult!5917)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36411 (_ BitVec 32)) SeekEntryResult!5917)

(assert (=> b!582198 (= lt!264886 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17480 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582199 () Bool)

(assert (=> b!582199 (= e!333821 e!333820)))

(declare-fun res!370150 () Bool)

(assert (=> b!582199 (=> (not res!370150) (not e!333820))))

(declare-fun lt!264885 () SeekEntryResult!5917)

(assert (=> b!582199 (= res!370150 (or (= lt!264885 (MissingZero!5917 i!1108)) (= lt!264885 (MissingVacant!5917 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36411 (_ BitVec 32)) SeekEntryResult!5917)

(assert (=> b!582199 (= lt!264885 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53496 res!370156) b!582197))

(assert (= (and b!582197 res!370153) b!582196))

(assert (= (and b!582196 res!370155) b!582193))

(assert (= (and b!582193 res!370154) b!582192))

(assert (= (and b!582192 res!370157) b!582199))

(assert (= (and b!582199 res!370150) b!582195))

(assert (= (and b!582195 res!370152) b!582191))

(assert (= (and b!582191 res!370151) b!582194))

(assert (= (and b!582194 res!370149) b!582198))

(declare-fun m!560179 () Bool)

(assert (=> start!53496 m!560179))

(declare-fun m!560181 () Bool)

(assert (=> start!53496 m!560181))

(declare-fun m!560183 () Bool)

(assert (=> b!582196 m!560183))

(assert (=> b!582196 m!560183))

(declare-fun m!560185 () Bool)

(assert (=> b!582196 m!560185))

(declare-fun m!560187 () Bool)

(assert (=> b!582193 m!560187))

(assert (=> b!582198 m!560183))

(assert (=> b!582198 m!560183))

(declare-fun m!560189 () Bool)

(assert (=> b!582198 m!560189))

(declare-fun m!560191 () Bool)

(assert (=> b!582195 m!560191))

(declare-fun m!560193 () Bool)

(assert (=> b!582192 m!560193))

(declare-fun m!560195 () Bool)

(assert (=> b!582194 m!560195))

(declare-fun m!560197 () Bool)

(assert (=> b!582194 m!560197))

(declare-fun m!560199 () Bool)

(assert (=> b!582194 m!560199))

(declare-fun m!560201 () Bool)

(assert (=> b!582191 m!560201))

(declare-fun m!560203 () Bool)

(assert (=> b!582199 m!560203))

(check-sat (not b!582196) (not start!53496) (not b!582198) (not b!582192) (not b!582199) (not b!582193) (not b!582195) (not b!582191))
(check-sat)
