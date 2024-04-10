; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56816 () Bool)

(assert start!56816)

(declare-fun b!629279 () Bool)

(declare-fun res!406683 () Bool)

(declare-fun e!359939 () Bool)

(assert (=> b!629279 (=> (not res!406683) (not e!359939))))

(declare-datatypes ((array!38006 0))(
  ( (array!38007 (arr!18240 (Array (_ BitVec 32) (_ BitVec 64))) (size!18604 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38006)

(declare-datatypes ((List!12281 0))(
  ( (Nil!12278) (Cons!12277 (h!13322 (_ BitVec 64)) (t!18509 List!12281)) )
))
(declare-fun arrayNoDuplicates!0 (array!38006 (_ BitVec 32) List!12281) Bool)

(assert (=> b!629279 (= res!406683 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12278))))

(declare-fun b!629280 () Bool)

(declare-fun res!406679 () Bool)

(declare-fun e!359940 () Bool)

(assert (=> b!629280 (=> (not res!406679) (not e!359940))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!629280 (= res!406679 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18240 a!2986) index!984) (select (arr!18240 a!2986) j!136))) (not (= (select (arr!18240 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629281 () Bool)

(declare-fun res!406680 () Bool)

(assert (=> b!629281 (=> (not res!406680) (not e!359939))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38006 (_ BitVec 32)) Bool)

(assert (=> b!629281 (= res!406680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629282 () Bool)

(declare-fun res!406678 () Bool)

(declare-fun e!359937 () Bool)

(assert (=> b!629282 (=> (not res!406678) (not e!359937))))

(declare-datatypes ((SeekEntryResult!6680 0))(
  ( (MissingZero!6680 (index!29004 (_ BitVec 32))) (Found!6680 (index!29005 (_ BitVec 32))) (Intermediate!6680 (undefined!7492 Bool) (index!29006 (_ BitVec 32)) (x!57744 (_ BitVec 32))) (Undefined!6680) (MissingVacant!6680 (index!29007 (_ BitVec 32))) )
))
(declare-fun lt!290713 () SeekEntryResult!6680)

(declare-fun lt!290711 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38006 (_ BitVec 32)) SeekEntryResult!6680)

(assert (=> b!629282 (= res!406678 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290711 vacantSpotIndex!68 (select (arr!18240 a!2986) j!136) a!2986 mask!3053) lt!290713))))

(declare-fun b!629283 () Bool)

(assert (=> b!629283 (= e!359940 e!359937)))

(declare-fun res!406677 () Bool)

(assert (=> b!629283 (=> (not res!406677) (not e!359937))))

(assert (=> b!629283 (= res!406677 (and (bvsge lt!290711 #b00000000000000000000000000000000) (bvslt lt!290711 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629283 (= lt!290711 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!406681 () Bool)

(declare-fun e!359938 () Bool)

(assert (=> start!56816 (=> (not res!406681) (not e!359938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56816 (= res!406681 (validMask!0 mask!3053))))

(assert (=> start!56816 e!359938))

(assert (=> start!56816 true))

(declare-fun array_inv!14036 (array!38006) Bool)

(assert (=> start!56816 (array_inv!14036 a!2986)))

(declare-fun b!629284 () Bool)

(declare-fun res!406674 () Bool)

(assert (=> b!629284 (=> (not res!406674) (not e!359939))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!629284 (= res!406674 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18240 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18240 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629285 () Bool)

(assert (=> b!629285 (= e!359939 e!359940)))

(declare-fun res!406685 () Bool)

(assert (=> b!629285 (=> (not res!406685) (not e!359940))))

(assert (=> b!629285 (= res!406685 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18240 a!2986) j!136) a!2986 mask!3053) lt!290713))))

(assert (=> b!629285 (= lt!290713 (Found!6680 j!136))))

(declare-fun b!629286 () Bool)

(declare-fun res!406682 () Bool)

(assert (=> b!629286 (=> (not res!406682) (not e!359938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629286 (= res!406682 (validKeyInArray!0 k!1786))))

(declare-fun b!629287 () Bool)

(declare-fun res!406684 () Bool)

(assert (=> b!629287 (=> (not res!406684) (not e!359938))))

(assert (=> b!629287 (= res!406684 (and (= (size!18604 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18604 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18604 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629288 () Bool)

(declare-fun res!406675 () Bool)

(assert (=> b!629288 (=> (not res!406675) (not e!359938))))

(assert (=> b!629288 (= res!406675 (validKeyInArray!0 (select (arr!18240 a!2986) j!136)))))

(declare-fun b!629289 () Bool)

(assert (=> b!629289 (= e!359938 e!359939)))

(declare-fun res!406673 () Bool)

(assert (=> b!629289 (=> (not res!406673) (not e!359939))))

(declare-fun lt!290712 () SeekEntryResult!6680)

(assert (=> b!629289 (= res!406673 (or (= lt!290712 (MissingZero!6680 i!1108)) (= lt!290712 (MissingVacant!6680 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38006 (_ BitVec 32)) SeekEntryResult!6680)

(assert (=> b!629289 (= lt!290712 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629290 () Bool)

(assert (=> b!629290 (= e!359937 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!910)) (bvsub #b01111111111111111111111111111110 x!910)))))

(declare-fun b!629291 () Bool)

(declare-fun res!406676 () Bool)

(assert (=> b!629291 (=> (not res!406676) (not e!359938))))

(declare-fun arrayContainsKey!0 (array!38006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629291 (= res!406676 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56816 res!406681) b!629287))

(assert (= (and b!629287 res!406684) b!629288))

(assert (= (and b!629288 res!406675) b!629286))

(assert (= (and b!629286 res!406682) b!629291))

(assert (= (and b!629291 res!406676) b!629289))

(assert (= (and b!629289 res!406673) b!629281))

(assert (= (and b!629281 res!406680) b!629279))

(assert (= (and b!629279 res!406683) b!629284))

(assert (= (and b!629284 res!406674) b!629285))

(assert (= (and b!629285 res!406685) b!629280))

(assert (= (and b!629280 res!406679) b!629283))

(assert (= (and b!629283 res!406677) b!629282))

(assert (= (and b!629282 res!406678) b!629290))

(declare-fun m!604293 () Bool)

(assert (=> b!629283 m!604293))

(declare-fun m!604295 () Bool)

(assert (=> b!629279 m!604295))

(declare-fun m!604297 () Bool)

(assert (=> start!56816 m!604297))

(declare-fun m!604299 () Bool)

(assert (=> start!56816 m!604299))

(declare-fun m!604301 () Bool)

(assert (=> b!629291 m!604301))

(declare-fun m!604303 () Bool)

(assert (=> b!629288 m!604303))

(assert (=> b!629288 m!604303))

(declare-fun m!604305 () Bool)

(assert (=> b!629288 m!604305))

(declare-fun m!604307 () Bool)

(assert (=> b!629289 m!604307))

(declare-fun m!604309 () Bool)

(assert (=> b!629281 m!604309))

(declare-fun m!604311 () Bool)

(assert (=> b!629286 m!604311))

(declare-fun m!604313 () Bool)

(assert (=> b!629280 m!604313))

(assert (=> b!629280 m!604303))

(assert (=> b!629282 m!604303))

(assert (=> b!629282 m!604303))

(declare-fun m!604315 () Bool)

(assert (=> b!629282 m!604315))

(declare-fun m!604317 () Bool)

(assert (=> b!629284 m!604317))

(declare-fun m!604319 () Bool)

(assert (=> b!629284 m!604319))

(declare-fun m!604321 () Bool)

(assert (=> b!629284 m!604321))

(assert (=> b!629285 m!604303))

(assert (=> b!629285 m!604303))

(declare-fun m!604323 () Bool)

(assert (=> b!629285 m!604323))

(push 1)

(assert (not b!629285))

(assert (not b!629282))

(assert (not b!629289))

(assert (not start!56816))

(assert (not b!629283))

(assert (not b!629288))

(assert (not b!629281))

(assert (not b!629291))

(assert (not b!629286))

(assert (not b!629279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

