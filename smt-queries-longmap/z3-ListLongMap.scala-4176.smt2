; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56914 () Bool)

(assert start!56914)

(declare-fun b!630163 () Bool)

(declare-fun res!407381 () Bool)

(declare-fun e!360338 () Bool)

(assert (=> b!630163 (=> (not res!407381) (not e!360338))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38047 0))(
  ( (array!38048 (arr!18259 (Array (_ BitVec 32) (_ BitVec 64))) (size!18623 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38047)

(assert (=> b!630163 (= res!407381 (and (= (size!18623 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18623 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18623 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630164 () Bool)

(declare-fun res!407386 () Bool)

(assert (=> b!630164 (=> (not res!407386) (not e!360338))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630164 (= res!407386 (validKeyInArray!0 k0!1786))))

(declare-fun b!630165 () Bool)

(declare-fun e!360341 () Bool)

(declare-datatypes ((SeekEntryResult!6699 0))(
  ( (MissingZero!6699 (index!29083 (_ BitVec 32))) (Found!6699 (index!29084 (_ BitVec 32))) (Intermediate!6699 (undefined!7511 Bool) (index!29085 (_ BitVec 32)) (x!57820 (_ BitVec 32))) (Undefined!6699) (MissingVacant!6699 (index!29086 (_ BitVec 32))) )
))
(declare-fun lt!291051 () SeekEntryResult!6699)

(declare-fun lt!291049 () SeekEntryResult!6699)

(assert (=> b!630165 (= e!360341 (= lt!291051 lt!291049))))

(declare-fun b!630166 () Bool)

(declare-fun res!407387 () Bool)

(declare-fun e!360342 () Bool)

(assert (=> b!630166 (=> (not res!407387) (not e!360342))))

(declare-datatypes ((List!12300 0))(
  ( (Nil!12297) (Cons!12296 (h!13341 (_ BitVec 64)) (t!18528 List!12300)) )
))
(declare-fun arrayNoDuplicates!0 (array!38047 (_ BitVec 32) List!12300) Bool)

(assert (=> b!630166 (= res!407387 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12297))))

(declare-fun b!630167 () Bool)

(declare-fun res!407382 () Bool)

(assert (=> b!630167 (=> (not res!407382) (not e!360342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38047 (_ BitVec 32)) Bool)

(assert (=> b!630167 (= res!407382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630168 () Bool)

(declare-fun e!360340 () Bool)

(assert (=> b!630168 (= e!360340 (not true))))

(assert (=> b!630168 e!360341))

(declare-fun res!407377 () Bool)

(assert (=> b!630168 (=> (not res!407377) (not e!360341))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!291052 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38047 (_ BitVec 32)) SeekEntryResult!6699)

(assert (=> b!630168 (= res!407377 (= lt!291049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291052 vacantSpotIndex!68 (select (store (arr!18259 a!2986) i!1108 k0!1786) j!136) (array!38048 (store (arr!18259 a!2986) i!1108 k0!1786) (size!18623 a!2986)) mask!3053)))))

(assert (=> b!630168 (= lt!291049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291052 vacantSpotIndex!68 (select (arr!18259 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21140 0))(
  ( (Unit!21141) )
))
(declare-fun lt!291048 () Unit!21140)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38047 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21140)

(assert (=> b!630168 (= lt!291048 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291052 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630168 (= lt!291052 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630169 () Bool)

(assert (=> b!630169 (= e!360338 e!360342)))

(declare-fun res!407385 () Bool)

(assert (=> b!630169 (=> (not res!407385) (not e!360342))))

(declare-fun lt!291050 () SeekEntryResult!6699)

(assert (=> b!630169 (= res!407385 (or (= lt!291050 (MissingZero!6699 i!1108)) (= lt!291050 (MissingVacant!6699 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38047 (_ BitVec 32)) SeekEntryResult!6699)

(assert (=> b!630169 (= lt!291050 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!407384 () Bool)

(assert (=> start!56914 (=> (not res!407384) (not e!360338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56914 (= res!407384 (validMask!0 mask!3053))))

(assert (=> start!56914 e!360338))

(assert (=> start!56914 true))

(declare-fun array_inv!14055 (array!38047) Bool)

(assert (=> start!56914 (array_inv!14055 a!2986)))

(declare-fun b!630170 () Bool)

(declare-fun res!407378 () Bool)

(assert (=> b!630170 (=> (not res!407378) (not e!360338))))

(declare-fun arrayContainsKey!0 (array!38047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630170 (= res!407378 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630171 () Bool)

(declare-fun res!407380 () Bool)

(assert (=> b!630171 (=> (not res!407380) (not e!360342))))

(assert (=> b!630171 (= res!407380 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18259 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18259 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630172 () Bool)

(assert (=> b!630172 (= e!360342 e!360340)))

(declare-fun res!407379 () Bool)

(assert (=> b!630172 (=> (not res!407379) (not e!360340))))

(assert (=> b!630172 (= res!407379 (and (= lt!291051 (Found!6699 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18259 a!2986) index!984) (select (arr!18259 a!2986) j!136))) (not (= (select (arr!18259 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630172 (= lt!291051 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18259 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630173 () Bool)

(declare-fun res!407383 () Bool)

(assert (=> b!630173 (=> (not res!407383) (not e!360338))))

(assert (=> b!630173 (= res!407383 (validKeyInArray!0 (select (arr!18259 a!2986) j!136)))))

(assert (= (and start!56914 res!407384) b!630163))

(assert (= (and b!630163 res!407381) b!630173))

(assert (= (and b!630173 res!407383) b!630164))

(assert (= (and b!630164 res!407386) b!630170))

(assert (= (and b!630170 res!407378) b!630169))

(assert (= (and b!630169 res!407385) b!630167))

(assert (= (and b!630167 res!407382) b!630166))

(assert (= (and b!630166 res!407387) b!630171))

(assert (= (and b!630171 res!407380) b!630172))

(assert (= (and b!630172 res!407379) b!630168))

(assert (= (and b!630168 res!407377) b!630165))

(declare-fun m!605177 () Bool)

(assert (=> b!630168 m!605177))

(declare-fun m!605179 () Bool)

(assert (=> b!630168 m!605179))

(declare-fun m!605181 () Bool)

(assert (=> b!630168 m!605181))

(declare-fun m!605183 () Bool)

(assert (=> b!630168 m!605183))

(assert (=> b!630168 m!605181))

(declare-fun m!605185 () Bool)

(assert (=> b!630168 m!605185))

(declare-fun m!605187 () Bool)

(assert (=> b!630168 m!605187))

(assert (=> b!630168 m!605179))

(declare-fun m!605189 () Bool)

(assert (=> b!630168 m!605189))

(declare-fun m!605191 () Bool)

(assert (=> b!630171 m!605191))

(assert (=> b!630171 m!605183))

(declare-fun m!605193 () Bool)

(assert (=> b!630171 m!605193))

(assert (=> b!630173 m!605181))

(assert (=> b!630173 m!605181))

(declare-fun m!605195 () Bool)

(assert (=> b!630173 m!605195))

(declare-fun m!605197 () Bool)

(assert (=> b!630170 m!605197))

(declare-fun m!605199 () Bool)

(assert (=> b!630172 m!605199))

(assert (=> b!630172 m!605181))

(assert (=> b!630172 m!605181))

(declare-fun m!605201 () Bool)

(assert (=> b!630172 m!605201))

(declare-fun m!605203 () Bool)

(assert (=> b!630166 m!605203))

(declare-fun m!605205 () Bool)

(assert (=> b!630164 m!605205))

(declare-fun m!605207 () Bool)

(assert (=> start!56914 m!605207))

(declare-fun m!605209 () Bool)

(assert (=> start!56914 m!605209))

(declare-fun m!605211 () Bool)

(assert (=> b!630167 m!605211))

(declare-fun m!605213 () Bool)

(assert (=> b!630169 m!605213))

(check-sat (not b!630164) (not b!630169) (not b!630173) (not b!630167) (not b!630172) (not start!56914) (not b!630166) (not b!630168) (not b!630170))
(check-sat)
