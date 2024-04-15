; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53694 () Bool)

(assert start!53694)

(declare-fun b!585408 () Bool)

(declare-fun res!373376 () Bool)

(declare-fun e!334883 () Bool)

(assert (=> b!585408 (=> (not res!373376) (not e!334883))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585408 (= res!373376 (validKeyInArray!0 k0!1786))))

(declare-fun res!373368 () Bool)

(assert (=> start!53694 (=> (not res!373368) (not e!334883))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53694 (= res!373368 (validMask!0 mask!3053))))

(assert (=> start!53694 e!334883))

(assert (=> start!53694 true))

(declare-datatypes ((array!36609 0))(
  ( (array!36610 (arr!17579 (Array (_ BitVec 32) (_ BitVec 64))) (size!17944 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36609)

(declare-fun array_inv!13462 (array!36609) Bool)

(assert (=> start!53694 (array_inv!13462 a!2986)))

(declare-fun b!585409 () Bool)

(declare-fun res!373375 () Bool)

(assert (=> b!585409 (=> (not res!373375) (not e!334883))))

(declare-fun arrayContainsKey!0 (array!36609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585409 (= res!373375 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585410 () Bool)

(declare-fun e!334882 () Bool)

(assert (=> b!585410 (= e!334883 e!334882)))

(declare-fun res!373374 () Bool)

(assert (=> b!585410 (=> (not res!373374) (not e!334882))))

(declare-datatypes ((SeekEntryResult!6016 0))(
  ( (MissingZero!6016 (index!26291 (_ BitVec 32))) (Found!6016 (index!26292 (_ BitVec 32))) (Intermediate!6016 (undefined!6828 Bool) (index!26293 (_ BitVec 32)) (x!55120 (_ BitVec 32))) (Undefined!6016) (MissingVacant!6016 (index!26294 (_ BitVec 32))) )
))
(declare-fun lt!265654 () SeekEntryResult!6016)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585410 (= res!373374 (or (= lt!265654 (MissingZero!6016 i!1108)) (= lt!265654 (MissingVacant!6016 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36609 (_ BitVec 32)) SeekEntryResult!6016)

(assert (=> b!585410 (= lt!265654 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585411 () Bool)

(declare-fun res!373370 () Bool)

(assert (=> b!585411 (=> (not res!373370) (not e!334882))))

(declare-datatypes ((List!11659 0))(
  ( (Nil!11656) (Cons!11655 (h!12700 (_ BitVec 64)) (t!17878 List!11659)) )
))
(declare-fun arrayNoDuplicates!0 (array!36609 (_ BitVec 32) List!11659) Bool)

(assert (=> b!585411 (= res!373370 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11656))))

(declare-fun b!585412 () Bool)

(declare-fun res!373372 () Bool)

(assert (=> b!585412 (=> (not res!373372) (not e!334883))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!585412 (= res!373372 (and (= (size!17944 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17944 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17944 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585413 () Bool)

(declare-fun res!373366 () Bool)

(assert (=> b!585413 (=> (not res!373366) (not e!334882))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36609 (_ BitVec 32)) SeekEntryResult!6016)

(assert (=> b!585413 (= res!373366 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17579 a!2986) j!136) a!2986 mask!3053) (Found!6016 j!136)))))

(declare-fun b!585414 () Bool)

(declare-fun res!373371 () Bool)

(assert (=> b!585414 (=> (not res!373371) (not e!334882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36609 (_ BitVec 32)) Bool)

(assert (=> b!585414 (= res!373371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585415 () Bool)

(declare-fun res!373373 () Bool)

(assert (=> b!585415 (=> (not res!373373) (not e!334882))))

(assert (=> b!585415 (= res!373373 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17579 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17579 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585416 () Bool)

(assert (=> b!585416 (= e!334882 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!265652 () (_ BitVec 32))

(assert (=> b!585416 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265652 vacantSpotIndex!68 (select (arr!17579 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265652 vacantSpotIndex!68 (select (store (arr!17579 a!2986) i!1108 k0!1786) j!136) (array!36610 (store (arr!17579 a!2986) i!1108 k0!1786) (size!17944 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18138 0))(
  ( (Unit!18139) )
))
(declare-fun lt!265653 () Unit!18138)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18138)

(assert (=> b!585416 (= lt!265653 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265652 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585416 (= lt!265652 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585417 () Bool)

(declare-fun res!373369 () Bool)

(assert (=> b!585417 (=> (not res!373369) (not e!334882))))

(assert (=> b!585417 (= res!373369 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17579 a!2986) index!984) (select (arr!17579 a!2986) j!136))) (not (= (select (arr!17579 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585418 () Bool)

(declare-fun res!373367 () Bool)

(assert (=> b!585418 (=> (not res!373367) (not e!334883))))

(assert (=> b!585418 (= res!373367 (validKeyInArray!0 (select (arr!17579 a!2986) j!136)))))

(assert (= (and start!53694 res!373368) b!585412))

(assert (= (and b!585412 res!373372) b!585418))

(assert (= (and b!585418 res!373367) b!585408))

(assert (= (and b!585408 res!373376) b!585409))

(assert (= (and b!585409 res!373375) b!585410))

(assert (= (and b!585410 res!373374) b!585414))

(assert (= (and b!585414 res!373371) b!585411))

(assert (= (and b!585411 res!373370) b!585415))

(assert (= (and b!585415 res!373373) b!585413))

(assert (= (and b!585413 res!373366) b!585417))

(assert (= (and b!585417 res!373369) b!585416))

(declare-fun m!563137 () Bool)

(assert (=> b!585418 m!563137))

(assert (=> b!585418 m!563137))

(declare-fun m!563139 () Bool)

(assert (=> b!585418 m!563139))

(declare-fun m!563141 () Bool)

(assert (=> b!585414 m!563141))

(declare-fun m!563143 () Bool)

(assert (=> b!585410 m!563143))

(declare-fun m!563145 () Bool)

(assert (=> b!585408 m!563145))

(declare-fun m!563147 () Bool)

(assert (=> b!585411 m!563147))

(declare-fun m!563149 () Bool)

(assert (=> b!585409 m!563149))

(assert (=> b!585413 m!563137))

(assert (=> b!585413 m!563137))

(declare-fun m!563151 () Bool)

(assert (=> b!585413 m!563151))

(declare-fun m!563153 () Bool)

(assert (=> b!585416 m!563153))

(declare-fun m!563155 () Bool)

(assert (=> b!585416 m!563155))

(assert (=> b!585416 m!563137))

(assert (=> b!585416 m!563155))

(declare-fun m!563157 () Bool)

(assert (=> b!585416 m!563157))

(declare-fun m!563159 () Bool)

(assert (=> b!585416 m!563159))

(assert (=> b!585416 m!563137))

(declare-fun m!563161 () Bool)

(assert (=> b!585416 m!563161))

(declare-fun m!563163 () Bool)

(assert (=> b!585416 m!563163))

(declare-fun m!563165 () Bool)

(assert (=> b!585417 m!563165))

(assert (=> b!585417 m!563137))

(declare-fun m!563167 () Bool)

(assert (=> b!585415 m!563167))

(assert (=> b!585415 m!563159))

(declare-fun m!563169 () Bool)

(assert (=> b!585415 m!563169))

(declare-fun m!563171 () Bool)

(assert (=> start!53694 m!563171))

(declare-fun m!563173 () Bool)

(assert (=> start!53694 m!563173))

(check-sat (not b!585410) (not b!585414) (not start!53694) (not b!585411) (not b!585408) (not b!585413) (not b!585418) (not b!585416) (not b!585409))
(check-sat)
