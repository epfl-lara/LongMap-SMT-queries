; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56610 () Bool)

(assert start!56610)

(declare-fun b!627177 () Bool)

(declare-fun res!405022 () Bool)

(declare-fun e!359083 () Bool)

(assert (=> b!627177 (=> (not res!405022) (not e!359083))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37914 0))(
  ( (array!37915 (arr!18197 (Array (_ BitVec 32) (_ BitVec 64))) (size!18562 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37914)

(declare-datatypes ((SeekEntryResult!6634 0))(
  ( (MissingZero!6634 (index!28820 (_ BitVec 32))) (Found!6634 (index!28821 (_ BitVec 32))) (Intermediate!6634 (undefined!7446 Bool) (index!28822 (_ BitVec 32)) (x!57569 (_ BitVec 32))) (Undefined!6634) (MissingVacant!6634 (index!28823 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37914 (_ BitVec 32)) SeekEntryResult!6634)

(assert (=> b!627177 (= res!405022 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18197 a!2986) j!136) a!2986 mask!3053) (Found!6634 j!136)))))

(declare-fun b!627178 () Bool)

(declare-fun res!405025 () Bool)

(assert (=> b!627178 (=> (not res!405025) (not e!359083))))

(declare-datatypes ((List!12277 0))(
  ( (Nil!12274) (Cons!12273 (h!13318 (_ BitVec 64)) (t!18496 List!12277)) )
))
(declare-fun arrayNoDuplicates!0 (array!37914 (_ BitVec 32) List!12277) Bool)

(assert (=> b!627178 (= res!405025 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12274))))

(declare-fun res!405019 () Bool)

(declare-fun e!359084 () Bool)

(assert (=> start!56610 (=> (not res!405019) (not e!359084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56610 (= res!405019 (validMask!0 mask!3053))))

(assert (=> start!56610 e!359084))

(assert (=> start!56610 true))

(declare-fun array_inv!14080 (array!37914) Bool)

(assert (=> start!56610 (array_inv!14080 a!2986)))

(declare-fun b!627179 () Bool)

(declare-fun res!405026 () Bool)

(assert (=> b!627179 (=> (not res!405026) (not e!359083))))

(assert (=> b!627179 (= res!405026 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18197 a!2986) index!984) (select (arr!18197 a!2986) j!136))) (not (= (select (arr!18197 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627180 () Bool)

(declare-fun res!405023 () Bool)

(assert (=> b!627180 (=> (not res!405023) (not e!359083))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!627180 (= res!405023 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18197 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18197 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627181 () Bool)

(declare-fun res!405024 () Bool)

(assert (=> b!627181 (=> (not res!405024) (not e!359084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627181 (= res!405024 (validKeyInArray!0 (select (arr!18197 a!2986) j!136)))))

(declare-fun b!627182 () Bool)

(declare-fun res!405021 () Bool)

(assert (=> b!627182 (=> (not res!405021) (not e!359084))))

(assert (=> b!627182 (= res!405021 (validKeyInArray!0 k0!1786))))

(declare-fun b!627183 () Bool)

(declare-fun res!405027 () Bool)

(assert (=> b!627183 (=> (not res!405027) (not e!359084))))

(assert (=> b!627183 (= res!405027 (and (= (size!18562 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18562 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18562 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627184 () Bool)

(declare-fun res!405028 () Bool)

(assert (=> b!627184 (=> (not res!405028) (not e!359084))))

(declare-fun arrayContainsKey!0 (array!37914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627184 (= res!405028 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627185 () Bool)

(assert (=> b!627185 (= e!359083 false)))

(declare-fun lt!290047 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627185 (= lt!290047 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627186 () Bool)

(declare-fun res!405020 () Bool)

(assert (=> b!627186 (=> (not res!405020) (not e!359083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37914 (_ BitVec 32)) Bool)

(assert (=> b!627186 (= res!405020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627187 () Bool)

(assert (=> b!627187 (= e!359084 e!359083)))

(declare-fun res!405029 () Bool)

(assert (=> b!627187 (=> (not res!405029) (not e!359083))))

(declare-fun lt!290046 () SeekEntryResult!6634)

(assert (=> b!627187 (= res!405029 (or (= lt!290046 (MissingZero!6634 i!1108)) (= lt!290046 (MissingVacant!6634 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37914 (_ BitVec 32)) SeekEntryResult!6634)

(assert (=> b!627187 (= lt!290046 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56610 res!405019) b!627183))

(assert (= (and b!627183 res!405027) b!627181))

(assert (= (and b!627181 res!405024) b!627182))

(assert (= (and b!627182 res!405021) b!627184))

(assert (= (and b!627184 res!405028) b!627187))

(assert (= (and b!627187 res!405029) b!627186))

(assert (= (and b!627186 res!405020) b!627178))

(assert (= (and b!627178 res!405025) b!627180))

(assert (= (and b!627180 res!405023) b!627177))

(assert (= (and b!627177 res!405022) b!627179))

(assert (= (and b!627179 res!405026) b!627185))

(declare-fun m!601993 () Bool)

(assert (=> b!627185 m!601993))

(declare-fun m!601995 () Bool)

(assert (=> start!56610 m!601995))

(declare-fun m!601997 () Bool)

(assert (=> start!56610 m!601997))

(declare-fun m!601999 () Bool)

(assert (=> b!627181 m!601999))

(assert (=> b!627181 m!601999))

(declare-fun m!602001 () Bool)

(assert (=> b!627181 m!602001))

(declare-fun m!602003 () Bool)

(assert (=> b!627180 m!602003))

(declare-fun m!602005 () Bool)

(assert (=> b!627180 m!602005))

(declare-fun m!602007 () Bool)

(assert (=> b!627180 m!602007))

(declare-fun m!602009 () Bool)

(assert (=> b!627182 m!602009))

(assert (=> b!627177 m!601999))

(assert (=> b!627177 m!601999))

(declare-fun m!602011 () Bool)

(assert (=> b!627177 m!602011))

(declare-fun m!602013 () Bool)

(assert (=> b!627184 m!602013))

(declare-fun m!602015 () Bool)

(assert (=> b!627186 m!602015))

(declare-fun m!602017 () Bool)

(assert (=> b!627179 m!602017))

(assert (=> b!627179 m!601999))

(declare-fun m!602019 () Bool)

(assert (=> b!627178 m!602019))

(declare-fun m!602021 () Bool)

(assert (=> b!627187 m!602021))

(check-sat (not b!627184) (not b!627182) (not b!627186) (not b!627187) (not start!56610) (not b!627178) (not b!627177) (not b!627181) (not b!627185))
(check-sat)
