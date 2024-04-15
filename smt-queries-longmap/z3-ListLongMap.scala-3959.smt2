; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53748 () Bool)

(assert start!53748)

(declare-fun b!586299 () Bool)

(declare-fun res!374266 () Bool)

(declare-fun e!335127 () Bool)

(assert (=> b!586299 (=> (not res!374266) (not e!335127))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36663 0))(
  ( (array!36664 (arr!17606 (Array (_ BitVec 32) (_ BitVec 64))) (size!17971 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36663)

(assert (=> b!586299 (= res!374266 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17606 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17606 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586300 () Bool)

(assert (=> b!586300 (= e!335127 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!265895 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6043 0))(
  ( (MissingZero!6043 (index!26399 (_ BitVec 32))) (Found!6043 (index!26400 (_ BitVec 32))) (Intermediate!6043 (undefined!6855 Bool) (index!26401 (_ BitVec 32)) (x!55219 (_ BitVec 32))) (Undefined!6043) (MissingVacant!6043 (index!26402 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36663 (_ BitVec 32)) SeekEntryResult!6043)

(assert (=> b!586300 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265895 vacantSpotIndex!68 (select (arr!17606 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265895 vacantSpotIndex!68 (select (store (arr!17606 a!2986) i!1108 k0!1786) j!136) (array!36664 (store (arr!17606 a!2986) i!1108 k0!1786) (size!17971 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18192 0))(
  ( (Unit!18193) )
))
(declare-fun lt!265897 () Unit!18192)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36663 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18192)

(assert (=> b!586300 (= lt!265897 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265895 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586300 (= lt!265895 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586301 () Bool)

(declare-fun res!374257 () Bool)

(declare-fun e!335126 () Bool)

(assert (=> b!586301 (=> (not res!374257) (not e!335126))))

(assert (=> b!586301 (= res!374257 (and (= (size!17971 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17971 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17971 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586302 () Bool)

(declare-fun res!374265 () Bool)

(assert (=> b!586302 (=> (not res!374265) (not e!335127))))

(declare-datatypes ((List!11686 0))(
  ( (Nil!11683) (Cons!11682 (h!12727 (_ BitVec 64)) (t!17905 List!11686)) )
))
(declare-fun arrayNoDuplicates!0 (array!36663 (_ BitVec 32) List!11686) Bool)

(assert (=> b!586302 (= res!374265 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11683))))

(declare-fun b!586303 () Bool)

(declare-fun res!374260 () Bool)

(assert (=> b!586303 (=> (not res!374260) (not e!335127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36663 (_ BitVec 32)) Bool)

(assert (=> b!586303 (= res!374260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586304 () Bool)

(assert (=> b!586304 (= e!335126 e!335127)))

(declare-fun res!374262 () Bool)

(assert (=> b!586304 (=> (not res!374262) (not e!335127))))

(declare-fun lt!265896 () SeekEntryResult!6043)

(assert (=> b!586304 (= res!374262 (or (= lt!265896 (MissingZero!6043 i!1108)) (= lt!265896 (MissingVacant!6043 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36663 (_ BitVec 32)) SeekEntryResult!6043)

(assert (=> b!586304 (= lt!265896 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!374264 () Bool)

(assert (=> start!53748 (=> (not res!374264) (not e!335126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53748 (= res!374264 (validMask!0 mask!3053))))

(assert (=> start!53748 e!335126))

(assert (=> start!53748 true))

(declare-fun array_inv!13489 (array!36663) Bool)

(assert (=> start!53748 (array_inv!13489 a!2986)))

(declare-fun b!586305 () Bool)

(declare-fun res!374258 () Bool)

(assert (=> b!586305 (=> (not res!374258) (not e!335126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586305 (= res!374258 (validKeyInArray!0 (select (arr!17606 a!2986) j!136)))))

(declare-fun b!586306 () Bool)

(declare-fun res!374267 () Bool)

(assert (=> b!586306 (=> (not res!374267) (not e!335126))))

(declare-fun arrayContainsKey!0 (array!36663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586306 (= res!374267 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586307 () Bool)

(declare-fun res!374261 () Bool)

(assert (=> b!586307 (=> (not res!374261) (not e!335127))))

(assert (=> b!586307 (= res!374261 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17606 a!2986) j!136) a!2986 mask!3053) (Found!6043 j!136)))))

(declare-fun b!586308 () Bool)

(declare-fun res!374259 () Bool)

(assert (=> b!586308 (=> (not res!374259) (not e!335127))))

(assert (=> b!586308 (= res!374259 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17606 a!2986) index!984) (select (arr!17606 a!2986) j!136))) (not (= (select (arr!17606 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586309 () Bool)

(declare-fun res!374263 () Bool)

(assert (=> b!586309 (=> (not res!374263) (not e!335126))))

(assert (=> b!586309 (= res!374263 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53748 res!374264) b!586301))

(assert (= (and b!586301 res!374257) b!586305))

(assert (= (and b!586305 res!374258) b!586309))

(assert (= (and b!586309 res!374263) b!586306))

(assert (= (and b!586306 res!374267) b!586304))

(assert (= (and b!586304 res!374262) b!586303))

(assert (= (and b!586303 res!374260) b!586302))

(assert (= (and b!586302 res!374265) b!586299))

(assert (= (and b!586299 res!374266) b!586307))

(assert (= (and b!586307 res!374261) b!586308))

(assert (= (and b!586308 res!374259) b!586300))

(declare-fun m!564163 () Bool)

(assert (=> b!586309 m!564163))

(declare-fun m!564165 () Bool)

(assert (=> b!586303 m!564165))

(declare-fun m!564167 () Bool)

(assert (=> b!586308 m!564167))

(declare-fun m!564169 () Bool)

(assert (=> b!586308 m!564169))

(declare-fun m!564171 () Bool)

(assert (=> b!586299 m!564171))

(declare-fun m!564173 () Bool)

(assert (=> b!586299 m!564173))

(declare-fun m!564175 () Bool)

(assert (=> b!586299 m!564175))

(assert (=> b!586307 m!564169))

(assert (=> b!586307 m!564169))

(declare-fun m!564177 () Bool)

(assert (=> b!586307 m!564177))

(declare-fun m!564179 () Bool)

(assert (=> start!53748 m!564179))

(declare-fun m!564181 () Bool)

(assert (=> start!53748 m!564181))

(assert (=> b!586305 m!564169))

(assert (=> b!586305 m!564169))

(declare-fun m!564183 () Bool)

(assert (=> b!586305 m!564183))

(declare-fun m!564185 () Bool)

(assert (=> b!586306 m!564185))

(declare-fun m!564187 () Bool)

(assert (=> b!586302 m!564187))

(declare-fun m!564189 () Bool)

(assert (=> b!586304 m!564189))

(declare-fun m!564191 () Bool)

(assert (=> b!586300 m!564191))

(declare-fun m!564193 () Bool)

(assert (=> b!586300 m!564193))

(assert (=> b!586300 m!564169))

(assert (=> b!586300 m!564173))

(declare-fun m!564195 () Bool)

(assert (=> b!586300 m!564195))

(assert (=> b!586300 m!564193))

(declare-fun m!564197 () Bool)

(assert (=> b!586300 m!564197))

(assert (=> b!586300 m!564169))

(declare-fun m!564199 () Bool)

(assert (=> b!586300 m!564199))

(check-sat (not b!586303) (not b!586306) (not b!586300) (not b!586305) (not start!53748) (not b!586302) (not b!586304) (not b!586307) (not b!586309))
(check-sat)
