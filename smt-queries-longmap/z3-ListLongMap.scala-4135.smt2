; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56406 () Bool)

(assert start!56406)

(declare-fun b!625212 () Bool)

(declare-fun e!358411 () Bool)

(assert (=> b!625212 (= e!358411 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6576 0))(
  ( (MissingZero!6576 (index!28588 (_ BitVec 32))) (Found!6576 (index!28589 (_ BitVec 32))) (Intermediate!6576 (undefined!7388 Bool) (index!28590 (_ BitVec 32)) (x!57342 (_ BitVec 32))) (Undefined!6576) (MissingVacant!6576 (index!28591 (_ BitVec 32))) )
))
(declare-fun lt!289785 () SeekEntryResult!6576)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37786 0))(
  ( (array!37787 (arr!18136 (Array (_ BitVec 32) (_ BitVec 64))) (size!18500 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37786)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37786 (_ BitVec 32)) SeekEntryResult!6576)

(assert (=> b!625212 (= lt!289785 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18136 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625213 () Bool)

(declare-fun res!403221 () Bool)

(assert (=> b!625213 (=> (not res!403221) (not e!358411))))

(declare-datatypes ((List!12177 0))(
  ( (Nil!12174) (Cons!12173 (h!13218 (_ BitVec 64)) (t!18405 List!12177)) )
))
(declare-fun arrayNoDuplicates!0 (array!37786 (_ BitVec 32) List!12177) Bool)

(assert (=> b!625213 (= res!403221 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12174))))

(declare-fun b!625214 () Bool)

(declare-fun res!403220 () Bool)

(declare-fun e!358412 () Bool)

(assert (=> b!625214 (=> (not res!403220) (not e!358412))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625214 (= res!403220 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625215 () Bool)

(declare-fun res!403223 () Bool)

(assert (=> b!625215 (=> (not res!403223) (not e!358411))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625215 (= res!403223 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18136 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18136 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625216 () Bool)

(declare-fun res!403219 () Bool)

(assert (=> b!625216 (=> (not res!403219) (not e!358412))))

(assert (=> b!625216 (= res!403219 (and (= (size!18500 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18500 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18500 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625217 () Bool)

(declare-fun res!403218 () Bool)

(assert (=> b!625217 (=> (not res!403218) (not e!358412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625217 (= res!403218 (validKeyInArray!0 k0!1786))))

(declare-fun b!625218 () Bool)

(declare-fun res!403226 () Bool)

(assert (=> b!625218 (=> (not res!403226) (not e!358411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37786 (_ BitVec 32)) Bool)

(assert (=> b!625218 (= res!403226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!403225 () Bool)

(assert (=> start!56406 (=> (not res!403225) (not e!358412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56406 (= res!403225 (validMask!0 mask!3053))))

(assert (=> start!56406 e!358412))

(assert (=> start!56406 true))

(declare-fun array_inv!13932 (array!37786) Bool)

(assert (=> start!56406 (array_inv!13932 a!2986)))

(declare-fun b!625219 () Bool)

(declare-fun res!403224 () Bool)

(assert (=> b!625219 (=> (not res!403224) (not e!358412))))

(assert (=> b!625219 (= res!403224 (validKeyInArray!0 (select (arr!18136 a!2986) j!136)))))

(declare-fun b!625220 () Bool)

(assert (=> b!625220 (= e!358412 e!358411)))

(declare-fun res!403222 () Bool)

(assert (=> b!625220 (=> (not res!403222) (not e!358411))))

(declare-fun lt!289786 () SeekEntryResult!6576)

(assert (=> b!625220 (= res!403222 (or (= lt!289786 (MissingZero!6576 i!1108)) (= lt!289786 (MissingVacant!6576 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37786 (_ BitVec 32)) SeekEntryResult!6576)

(assert (=> b!625220 (= lt!289786 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56406 res!403225) b!625216))

(assert (= (and b!625216 res!403219) b!625219))

(assert (= (and b!625219 res!403224) b!625217))

(assert (= (and b!625217 res!403218) b!625214))

(assert (= (and b!625214 res!403220) b!625220))

(assert (= (and b!625220 res!403222) b!625218))

(assert (= (and b!625218 res!403226) b!625213))

(assert (= (and b!625213 res!403221) b!625215))

(assert (= (and b!625215 res!403223) b!625212))

(declare-fun m!600799 () Bool)

(assert (=> start!56406 m!600799))

(declare-fun m!600801 () Bool)

(assert (=> start!56406 m!600801))

(declare-fun m!600803 () Bool)

(assert (=> b!625214 m!600803))

(declare-fun m!600805 () Bool)

(assert (=> b!625217 m!600805))

(declare-fun m!600807 () Bool)

(assert (=> b!625218 m!600807))

(declare-fun m!600809 () Bool)

(assert (=> b!625219 m!600809))

(assert (=> b!625219 m!600809))

(declare-fun m!600811 () Bool)

(assert (=> b!625219 m!600811))

(assert (=> b!625212 m!600809))

(assert (=> b!625212 m!600809))

(declare-fun m!600813 () Bool)

(assert (=> b!625212 m!600813))

(declare-fun m!600815 () Bool)

(assert (=> b!625215 m!600815))

(declare-fun m!600817 () Bool)

(assert (=> b!625215 m!600817))

(declare-fun m!600819 () Bool)

(assert (=> b!625215 m!600819))

(declare-fun m!600821 () Bool)

(assert (=> b!625220 m!600821))

(declare-fun m!600823 () Bool)

(assert (=> b!625213 m!600823))

(check-sat (not b!625214) (not start!56406) (not b!625220) (not b!625219) (not b!625213) (not b!625218) (not b!625212) (not b!625217))
(check-sat)
