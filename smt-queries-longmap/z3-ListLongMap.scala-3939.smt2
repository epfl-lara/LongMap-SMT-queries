; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53628 () Bool)

(assert start!53628)

(declare-fun b!584231 () Bool)

(declare-fun res!372200 () Bool)

(declare-fun e!334500 () Bool)

(assert (=> b!584231 (=> (not res!372200) (not e!334500))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36543 0))(
  ( (array!36544 (arr!17546 (Array (_ BitVec 32) (_ BitVec 64))) (size!17911 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36543)

(assert (=> b!584231 (= res!372200 (and (= (size!17911 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17911 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17911 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584232 () Bool)

(declare-fun res!372190 () Bool)

(assert (=> b!584232 (=> (not res!372190) (not e!334500))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584232 (= res!372190 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584233 () Bool)

(declare-fun e!334499 () Bool)

(declare-fun e!334497 () Bool)

(assert (=> b!584233 (= e!334499 e!334497)))

(declare-fun res!372199 () Bool)

(assert (=> b!584233 (=> (not res!372199) (not e!334497))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265357 () (_ BitVec 32))

(assert (=> b!584233 (= res!372199 (and (bvsge lt!265357 #b00000000000000000000000000000000) (bvslt lt!265357 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584233 (= lt!265357 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!372189 () Bool)

(assert (=> start!53628 (=> (not res!372189) (not e!334500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53628 (= res!372189 (validMask!0 mask!3053))))

(assert (=> start!53628 e!334500))

(assert (=> start!53628 true))

(declare-fun array_inv!13429 (array!36543) Bool)

(assert (=> start!53628 (array_inv!13429 a!2986)))

(declare-fun b!584234 () Bool)

(assert (=> b!584234 (= e!334497 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5983 0))(
  ( (MissingZero!5983 (index!26159 (_ BitVec 32))) (Found!5983 (index!26160 (_ BitVec 32))) (Intermediate!5983 (undefined!6795 Bool) (index!26161 (_ BitVec 32)) (x!54999 (_ BitVec 32))) (Undefined!5983) (MissingVacant!5983 (index!26162 (_ BitVec 32))) )
))
(declare-fun lt!265356 () SeekEntryResult!5983)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36543 (_ BitVec 32)) SeekEntryResult!5983)

(assert (=> b!584234 (= lt!265356 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265357 vacantSpotIndex!68 (select (arr!17546 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584235 () Bool)

(declare-fun res!372192 () Bool)

(assert (=> b!584235 (=> (not res!372192) (not e!334499))))

(assert (=> b!584235 (= res!372192 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17546 a!2986) index!984) (select (arr!17546 a!2986) j!136))) (not (= (select (arr!17546 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584236 () Bool)

(declare-fun res!372191 () Bool)

(assert (=> b!584236 (=> (not res!372191) (not e!334499))))

(assert (=> b!584236 (= res!372191 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17546 a!2986) j!136) a!2986 mask!3053) (Found!5983 j!136)))))

(declare-fun b!584237 () Bool)

(declare-fun res!372196 () Bool)

(assert (=> b!584237 (=> (not res!372196) (not e!334499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36543 (_ BitVec 32)) Bool)

(assert (=> b!584237 (= res!372196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584238 () Bool)

(declare-fun res!372198 () Bool)

(assert (=> b!584238 (=> (not res!372198) (not e!334499))))

(assert (=> b!584238 (= res!372198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17546 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17546 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584239 () Bool)

(declare-fun res!372195 () Bool)

(assert (=> b!584239 (=> (not res!372195) (not e!334500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584239 (= res!372195 (validKeyInArray!0 k0!1786))))

(declare-fun b!584240 () Bool)

(declare-fun res!372193 () Bool)

(assert (=> b!584240 (=> (not res!372193) (not e!334500))))

(assert (=> b!584240 (= res!372193 (validKeyInArray!0 (select (arr!17546 a!2986) j!136)))))

(declare-fun b!584241 () Bool)

(assert (=> b!584241 (= e!334500 e!334499)))

(declare-fun res!372197 () Bool)

(assert (=> b!584241 (=> (not res!372197) (not e!334499))))

(declare-fun lt!265355 () SeekEntryResult!5983)

(assert (=> b!584241 (= res!372197 (or (= lt!265355 (MissingZero!5983 i!1108)) (= lt!265355 (MissingVacant!5983 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36543 (_ BitVec 32)) SeekEntryResult!5983)

(assert (=> b!584241 (= lt!265355 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584242 () Bool)

(declare-fun res!372194 () Bool)

(assert (=> b!584242 (=> (not res!372194) (not e!334499))))

(declare-datatypes ((List!11626 0))(
  ( (Nil!11623) (Cons!11622 (h!12667 (_ BitVec 64)) (t!17845 List!11626)) )
))
(declare-fun arrayNoDuplicates!0 (array!36543 (_ BitVec 32) List!11626) Bool)

(assert (=> b!584242 (= res!372194 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11623))))

(assert (= (and start!53628 res!372189) b!584231))

(assert (= (and b!584231 res!372200) b!584240))

(assert (= (and b!584240 res!372193) b!584239))

(assert (= (and b!584239 res!372195) b!584232))

(assert (= (and b!584232 res!372190) b!584241))

(assert (= (and b!584241 res!372197) b!584237))

(assert (= (and b!584237 res!372196) b!584242))

(assert (= (and b!584242 res!372194) b!584238))

(assert (= (and b!584238 res!372198) b!584236))

(assert (= (and b!584236 res!372191) b!584235))

(assert (= (and b!584235 res!372192) b!584233))

(assert (= (and b!584233 res!372199) b!584234))

(declare-fun m!562063 () Bool)

(assert (=> start!53628 m!562063))

(declare-fun m!562065 () Bool)

(assert (=> start!53628 m!562065))

(declare-fun m!562067 () Bool)

(assert (=> b!584232 m!562067))

(declare-fun m!562069 () Bool)

(assert (=> b!584240 m!562069))

(assert (=> b!584240 m!562069))

(declare-fun m!562071 () Bool)

(assert (=> b!584240 m!562071))

(declare-fun m!562073 () Bool)

(assert (=> b!584242 m!562073))

(declare-fun m!562075 () Bool)

(assert (=> b!584241 m!562075))

(assert (=> b!584234 m!562069))

(assert (=> b!584234 m!562069))

(declare-fun m!562077 () Bool)

(assert (=> b!584234 m!562077))

(declare-fun m!562079 () Bool)

(assert (=> b!584235 m!562079))

(assert (=> b!584235 m!562069))

(declare-fun m!562081 () Bool)

(assert (=> b!584238 m!562081))

(declare-fun m!562083 () Bool)

(assert (=> b!584238 m!562083))

(declare-fun m!562085 () Bool)

(assert (=> b!584238 m!562085))

(declare-fun m!562087 () Bool)

(assert (=> b!584237 m!562087))

(assert (=> b!584236 m!562069))

(assert (=> b!584236 m!562069))

(declare-fun m!562089 () Bool)

(assert (=> b!584236 m!562089))

(declare-fun m!562091 () Bool)

(assert (=> b!584233 m!562091))

(declare-fun m!562093 () Bool)

(assert (=> b!584239 m!562093))

(check-sat (not b!584240) (not b!584239) (not start!53628) (not b!584236) (not b!584233) (not b!584237) (not b!584241) (not b!584234) (not b!584232) (not b!584242))
(check-sat)
