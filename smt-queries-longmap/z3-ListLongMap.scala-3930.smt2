; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53574 () Bool)

(assert start!53574)

(declare-fun b!583259 () Bool)

(declare-fun res!371223 () Bool)

(declare-fun e!334175 () Bool)

(assert (=> b!583259 (=> (not res!371223) (not e!334175))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36489 0))(
  ( (array!36490 (arr!17519 (Array (_ BitVec 32) (_ BitVec 64))) (size!17884 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36489)

(assert (=> b!583259 (= res!371223 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17519 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17519 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583260 () Bool)

(declare-fun res!371225 () Bool)

(assert (=> b!583260 (=> (not res!371225) (not e!334175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36489 (_ BitVec 32)) Bool)

(assert (=> b!583260 (= res!371225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583261 () Bool)

(declare-fun res!371220 () Bool)

(declare-fun e!334173 () Bool)

(assert (=> b!583261 (=> (not res!371220) (not e!334173))))

(declare-fun arrayContainsKey!0 (array!36489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583261 (= res!371220 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583262 () Bool)

(declare-fun res!371224 () Bool)

(assert (=> b!583262 (=> (not res!371224) (not e!334173))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583262 (= res!371224 (validKeyInArray!0 (select (arr!17519 a!2986) j!136)))))

(declare-fun b!583263 () Bool)

(declare-fun res!371218 () Bool)

(assert (=> b!583263 (=> (not res!371218) (not e!334175))))

(declare-datatypes ((SeekEntryResult!5956 0))(
  ( (MissingZero!5956 (index!26051 (_ BitVec 32))) (Found!5956 (index!26052 (_ BitVec 32))) (Intermediate!5956 (undefined!6768 Bool) (index!26053 (_ BitVec 32)) (x!54900 (_ BitVec 32))) (Undefined!5956) (MissingVacant!5956 (index!26054 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36489 (_ BitVec 32)) SeekEntryResult!5956)

(assert (=> b!583263 (= res!371218 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17519 a!2986) j!136) a!2986 mask!3053) (Found!5956 j!136)))))

(declare-fun b!583264 () Bool)

(declare-fun e!334176 () Bool)

(assert (=> b!583264 (= e!334176 false)))

(declare-fun lt!265113 () (_ BitVec 32))

(declare-fun lt!265112 () SeekEntryResult!5956)

(assert (=> b!583264 (= lt!265112 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265113 vacantSpotIndex!68 (select (arr!17519 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583265 () Bool)

(assert (=> b!583265 (= e!334173 e!334175)))

(declare-fun res!371222 () Bool)

(assert (=> b!583265 (=> (not res!371222) (not e!334175))))

(declare-fun lt!265114 () SeekEntryResult!5956)

(assert (=> b!583265 (= res!371222 (or (= lt!265114 (MissingZero!5956 i!1108)) (= lt!265114 (MissingVacant!5956 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36489 (_ BitVec 32)) SeekEntryResult!5956)

(assert (=> b!583265 (= lt!265114 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583266 () Bool)

(declare-fun res!371221 () Bool)

(assert (=> b!583266 (=> (not res!371221) (not e!334173))))

(assert (=> b!583266 (= res!371221 (validKeyInArray!0 k0!1786))))

(declare-fun b!583267 () Bool)

(declare-fun res!371227 () Bool)

(assert (=> b!583267 (=> (not res!371227) (not e!334173))))

(assert (=> b!583267 (= res!371227 (and (= (size!17884 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17884 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17884 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583269 () Bool)

(declare-fun res!371217 () Bool)

(assert (=> b!583269 (=> (not res!371217) (not e!334175))))

(assert (=> b!583269 (= res!371217 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17519 a!2986) index!984) (select (arr!17519 a!2986) j!136))) (not (= (select (arr!17519 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583270 () Bool)

(assert (=> b!583270 (= e!334175 e!334176)))

(declare-fun res!371228 () Bool)

(assert (=> b!583270 (=> (not res!371228) (not e!334176))))

(assert (=> b!583270 (= res!371228 (and (bvsge lt!265113 #b00000000000000000000000000000000) (bvslt lt!265113 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583270 (= lt!265113 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!371219 () Bool)

(assert (=> start!53574 (=> (not res!371219) (not e!334173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53574 (= res!371219 (validMask!0 mask!3053))))

(assert (=> start!53574 e!334173))

(assert (=> start!53574 true))

(declare-fun array_inv!13402 (array!36489) Bool)

(assert (=> start!53574 (array_inv!13402 a!2986)))

(declare-fun b!583268 () Bool)

(declare-fun res!371226 () Bool)

(assert (=> b!583268 (=> (not res!371226) (not e!334175))))

(declare-datatypes ((List!11599 0))(
  ( (Nil!11596) (Cons!11595 (h!12640 (_ BitVec 64)) (t!17818 List!11599)) )
))
(declare-fun arrayNoDuplicates!0 (array!36489 (_ BitVec 32) List!11599) Bool)

(assert (=> b!583268 (= res!371226 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11596))))

(assert (= (and start!53574 res!371219) b!583267))

(assert (= (and b!583267 res!371227) b!583262))

(assert (= (and b!583262 res!371224) b!583266))

(assert (= (and b!583266 res!371221) b!583261))

(assert (= (and b!583261 res!371220) b!583265))

(assert (= (and b!583265 res!371222) b!583260))

(assert (= (and b!583260 res!371225) b!583268))

(assert (= (and b!583268 res!371226) b!583259))

(assert (= (and b!583259 res!371223) b!583263))

(assert (= (and b!583263 res!371218) b!583269))

(assert (= (and b!583269 res!371217) b!583270))

(assert (= (and b!583270 res!371228) b!583264))

(declare-fun m!561199 () Bool)

(assert (=> b!583265 m!561199))

(declare-fun m!561201 () Bool)

(assert (=> b!583259 m!561201))

(declare-fun m!561203 () Bool)

(assert (=> b!583259 m!561203))

(declare-fun m!561205 () Bool)

(assert (=> b!583259 m!561205))

(declare-fun m!561207 () Bool)

(assert (=> b!583266 m!561207))

(declare-fun m!561209 () Bool)

(assert (=> start!53574 m!561209))

(declare-fun m!561211 () Bool)

(assert (=> start!53574 m!561211))

(declare-fun m!561213 () Bool)

(assert (=> b!583264 m!561213))

(assert (=> b!583264 m!561213))

(declare-fun m!561215 () Bool)

(assert (=> b!583264 m!561215))

(declare-fun m!561217 () Bool)

(assert (=> b!583268 m!561217))

(declare-fun m!561219 () Bool)

(assert (=> b!583269 m!561219))

(assert (=> b!583269 m!561213))

(declare-fun m!561221 () Bool)

(assert (=> b!583270 m!561221))

(assert (=> b!583262 m!561213))

(assert (=> b!583262 m!561213))

(declare-fun m!561223 () Bool)

(assert (=> b!583262 m!561223))

(assert (=> b!583263 m!561213))

(assert (=> b!583263 m!561213))

(declare-fun m!561225 () Bool)

(assert (=> b!583263 m!561225))

(declare-fun m!561227 () Bool)

(assert (=> b!583261 m!561227))

(declare-fun m!561229 () Bool)

(assert (=> b!583260 m!561229))

(check-sat (not b!583261) (not b!583270) (not b!583263) (not b!583264) (not b!583260) (not b!583262) (not b!583266) (not b!583268) (not b!583265) (not start!53574))
(check-sat)
