; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56616 () Bool)

(assert start!56616)

(declare-fun b!627276 () Bool)

(declare-fun res!405119 () Bool)

(declare-fun e!359111 () Bool)

(assert (=> b!627276 (=> (not res!405119) (not e!359111))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37920 0))(
  ( (array!37921 (arr!18200 (Array (_ BitVec 32) (_ BitVec 64))) (size!18565 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37920)

(assert (=> b!627276 (= res!405119 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18200 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18200 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!405127 () Bool)

(declare-fun e!359110 () Bool)

(assert (=> start!56616 (=> (not res!405127) (not e!359110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56616 (= res!405127 (validMask!0 mask!3053))))

(assert (=> start!56616 e!359110))

(assert (=> start!56616 true))

(declare-fun array_inv!14083 (array!37920) Bool)

(assert (=> start!56616 (array_inv!14083 a!2986)))

(declare-fun b!627277 () Bool)

(declare-fun res!405128 () Bool)

(assert (=> b!627277 (=> (not res!405128) (not e!359111))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6637 0))(
  ( (MissingZero!6637 (index!28832 (_ BitVec 32))) (Found!6637 (index!28833 (_ BitVec 32))) (Intermediate!6637 (undefined!7449 Bool) (index!28834 (_ BitVec 32)) (x!57580 (_ BitVec 32))) (Undefined!6637) (MissingVacant!6637 (index!28835 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37920 (_ BitVec 32)) SeekEntryResult!6637)

(assert (=> b!627277 (= res!405128 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18200 a!2986) j!136) a!2986 mask!3053) (Found!6637 j!136)))))

(declare-fun b!627278 () Bool)

(declare-fun res!405125 () Bool)

(assert (=> b!627278 (=> (not res!405125) (not e!359110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627278 (= res!405125 (validKeyInArray!0 (select (arr!18200 a!2986) j!136)))))

(declare-fun b!627279 () Bool)

(declare-fun res!405123 () Bool)

(assert (=> b!627279 (=> (not res!405123) (not e!359110))))

(declare-fun arrayContainsKey!0 (array!37920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627279 (= res!405123 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627280 () Bool)

(assert (=> b!627280 (= e!359111 false)))

(declare-fun lt!290064 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627280 (= lt!290064 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627281 () Bool)

(declare-fun res!405124 () Bool)

(assert (=> b!627281 (=> (not res!405124) (not e!359110))))

(assert (=> b!627281 (= res!405124 (validKeyInArray!0 k0!1786))))

(declare-fun b!627282 () Bool)

(declare-fun res!405126 () Bool)

(assert (=> b!627282 (=> (not res!405126) (not e!359111))))

(assert (=> b!627282 (= res!405126 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18200 a!2986) index!984) (select (arr!18200 a!2986) j!136))) (not (= (select (arr!18200 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627283 () Bool)

(assert (=> b!627283 (= e!359110 e!359111)))

(declare-fun res!405122 () Bool)

(assert (=> b!627283 (=> (not res!405122) (not e!359111))))

(declare-fun lt!290065 () SeekEntryResult!6637)

(assert (=> b!627283 (= res!405122 (or (= lt!290065 (MissingZero!6637 i!1108)) (= lt!290065 (MissingVacant!6637 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37920 (_ BitVec 32)) SeekEntryResult!6637)

(assert (=> b!627283 (= lt!290065 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627284 () Bool)

(declare-fun res!405121 () Bool)

(assert (=> b!627284 (=> (not res!405121) (not e!359110))))

(assert (=> b!627284 (= res!405121 (and (= (size!18565 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18565 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18565 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627285 () Bool)

(declare-fun res!405118 () Bool)

(assert (=> b!627285 (=> (not res!405118) (not e!359111))))

(declare-datatypes ((List!12280 0))(
  ( (Nil!12277) (Cons!12276 (h!13321 (_ BitVec 64)) (t!18499 List!12280)) )
))
(declare-fun arrayNoDuplicates!0 (array!37920 (_ BitVec 32) List!12280) Bool)

(assert (=> b!627285 (= res!405118 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12277))))

(declare-fun b!627286 () Bool)

(declare-fun res!405120 () Bool)

(assert (=> b!627286 (=> (not res!405120) (not e!359111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37920 (_ BitVec 32)) Bool)

(assert (=> b!627286 (= res!405120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56616 res!405127) b!627284))

(assert (= (and b!627284 res!405121) b!627278))

(assert (= (and b!627278 res!405125) b!627281))

(assert (= (and b!627281 res!405124) b!627279))

(assert (= (and b!627279 res!405123) b!627283))

(assert (= (and b!627283 res!405122) b!627286))

(assert (= (and b!627286 res!405120) b!627285))

(assert (= (and b!627285 res!405118) b!627276))

(assert (= (and b!627276 res!405119) b!627277))

(assert (= (and b!627277 res!405128) b!627282))

(assert (= (and b!627282 res!405126) b!627280))

(declare-fun m!602083 () Bool)

(assert (=> b!627283 m!602083))

(declare-fun m!602085 () Bool)

(assert (=> b!627280 m!602085))

(declare-fun m!602087 () Bool)

(assert (=> b!627279 m!602087))

(declare-fun m!602089 () Bool)

(assert (=> b!627285 m!602089))

(declare-fun m!602091 () Bool)

(assert (=> b!627286 m!602091))

(declare-fun m!602093 () Bool)

(assert (=> b!627276 m!602093))

(declare-fun m!602095 () Bool)

(assert (=> b!627276 m!602095))

(declare-fun m!602097 () Bool)

(assert (=> b!627276 m!602097))

(declare-fun m!602099 () Bool)

(assert (=> b!627277 m!602099))

(assert (=> b!627277 m!602099))

(declare-fun m!602101 () Bool)

(assert (=> b!627277 m!602101))

(declare-fun m!602103 () Bool)

(assert (=> b!627281 m!602103))

(declare-fun m!602105 () Bool)

(assert (=> b!627282 m!602105))

(assert (=> b!627282 m!602099))

(declare-fun m!602107 () Bool)

(assert (=> start!56616 m!602107))

(declare-fun m!602109 () Bool)

(assert (=> start!56616 m!602109))

(assert (=> b!627278 m!602099))

(assert (=> b!627278 m!602099))

(declare-fun m!602111 () Bool)

(assert (=> b!627278 m!602111))

(check-sat (not b!627285) (not b!627281) (not b!627280) (not start!56616) (not b!627286) (not b!627283) (not b!627279) (not b!627278) (not b!627277))
(check-sat)
