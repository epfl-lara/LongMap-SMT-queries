; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53502 () Bool)

(assert start!53502)

(declare-fun b!582273 () Bool)

(declare-fun res!370235 () Bool)

(declare-fun e!333847 () Bool)

(assert (=> b!582273 (=> (not res!370235) (not e!333847))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36417 0))(
  ( (array!36418 (arr!17483 (Array (_ BitVec 32) (_ BitVec 64))) (size!17848 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36417)

(assert (=> b!582273 (= res!370235 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17483 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17483 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582274 () Bool)

(declare-fun res!370237 () Bool)

(assert (=> b!582274 (=> (not res!370237) (not e!333847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36417 (_ BitVec 32)) Bool)

(assert (=> b!582274 (= res!370237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582275 () Bool)

(declare-fun e!333849 () Bool)

(assert (=> b!582275 (= e!333849 e!333847)))

(declare-fun res!370233 () Bool)

(assert (=> b!582275 (=> (not res!370233) (not e!333847))))

(declare-datatypes ((SeekEntryResult!5920 0))(
  ( (MissingZero!5920 (index!25907 (_ BitVec 32))) (Found!5920 (index!25908 (_ BitVec 32))) (Intermediate!5920 (undefined!6732 Bool) (index!25909 (_ BitVec 32)) (x!54768 (_ BitVec 32))) (Undefined!5920) (MissingVacant!5920 (index!25910 (_ BitVec 32))) )
))
(declare-fun lt!264904 () SeekEntryResult!5920)

(assert (=> b!582275 (= res!370233 (or (= lt!264904 (MissingZero!5920 i!1108)) (= lt!264904 (MissingVacant!5920 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36417 (_ BitVec 32)) SeekEntryResult!5920)

(assert (=> b!582275 (= lt!264904 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582276 () Bool)

(declare-fun res!370234 () Bool)

(assert (=> b!582276 (=> (not res!370234) (not e!333849))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582276 (= res!370234 (and (= (size!17848 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17848 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17848 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582277 () Bool)

(declare-fun res!370231 () Bool)

(assert (=> b!582277 (=> (not res!370231) (not e!333849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582277 (= res!370231 (validKeyInArray!0 k0!1786))))

(declare-fun b!582278 () Bool)

(assert (=> b!582278 (= e!333847 false)))

(declare-fun lt!264903 () SeekEntryResult!5920)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36417 (_ BitVec 32)) SeekEntryResult!5920)

(assert (=> b!582278 (= lt!264903 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17483 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582279 () Bool)

(declare-fun res!370232 () Bool)

(assert (=> b!582279 (=> (not res!370232) (not e!333849))))

(assert (=> b!582279 (= res!370232 (validKeyInArray!0 (select (arr!17483 a!2986) j!136)))))

(declare-fun b!582280 () Bool)

(declare-fun res!370238 () Bool)

(assert (=> b!582280 (=> (not res!370238) (not e!333847))))

(declare-datatypes ((List!11563 0))(
  ( (Nil!11560) (Cons!11559 (h!12604 (_ BitVec 64)) (t!17782 List!11563)) )
))
(declare-fun arrayNoDuplicates!0 (array!36417 (_ BitVec 32) List!11563) Bool)

(assert (=> b!582280 (= res!370238 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11560))))

(declare-fun b!582272 () Bool)

(declare-fun res!370230 () Bool)

(assert (=> b!582272 (=> (not res!370230) (not e!333849))))

(declare-fun arrayContainsKey!0 (array!36417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582272 (= res!370230 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!370236 () Bool)

(assert (=> start!53502 (=> (not res!370236) (not e!333849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53502 (= res!370236 (validMask!0 mask!3053))))

(assert (=> start!53502 e!333849))

(assert (=> start!53502 true))

(declare-fun array_inv!13366 (array!36417) Bool)

(assert (=> start!53502 (array_inv!13366 a!2986)))

(assert (= (and start!53502 res!370236) b!582276))

(assert (= (and b!582276 res!370234) b!582279))

(assert (= (and b!582279 res!370232) b!582277))

(assert (= (and b!582277 res!370231) b!582272))

(assert (= (and b!582272 res!370230) b!582275))

(assert (= (and b!582275 res!370233) b!582274))

(assert (= (and b!582274 res!370237) b!582280))

(assert (= (and b!582280 res!370238) b!582273))

(assert (= (and b!582273 res!370235) b!582278))

(declare-fun m!560257 () Bool)

(assert (=> b!582279 m!560257))

(assert (=> b!582279 m!560257))

(declare-fun m!560259 () Bool)

(assert (=> b!582279 m!560259))

(declare-fun m!560261 () Bool)

(assert (=> start!53502 m!560261))

(declare-fun m!560263 () Bool)

(assert (=> start!53502 m!560263))

(assert (=> b!582278 m!560257))

(assert (=> b!582278 m!560257))

(declare-fun m!560265 () Bool)

(assert (=> b!582278 m!560265))

(declare-fun m!560267 () Bool)

(assert (=> b!582274 m!560267))

(declare-fun m!560269 () Bool)

(assert (=> b!582280 m!560269))

(declare-fun m!560271 () Bool)

(assert (=> b!582275 m!560271))

(declare-fun m!560273 () Bool)

(assert (=> b!582272 m!560273))

(declare-fun m!560275 () Bool)

(assert (=> b!582273 m!560275))

(declare-fun m!560277 () Bool)

(assert (=> b!582273 m!560277))

(declare-fun m!560279 () Bool)

(assert (=> b!582273 m!560279))

(declare-fun m!560281 () Bool)

(assert (=> b!582277 m!560281))

(check-sat (not b!582275) (not start!53502) (not b!582280) (not b!582274) (not b!582277) (not b!582278) (not b!582279) (not b!582272))
(check-sat)
