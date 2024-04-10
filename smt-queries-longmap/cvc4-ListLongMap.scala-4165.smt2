; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56736 () Bool)

(assert start!56736)

(declare-fun b!628612 () Bool)

(declare-fun res!406173 () Bool)

(declare-fun e!359654 () Bool)

(assert (=> b!628612 (=> (not res!406173) (not e!359654))))

(declare-datatypes ((array!37977 0))(
  ( (array!37978 (arr!18227 (Array (_ BitVec 32) (_ BitVec 64))) (size!18591 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37977)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37977 (_ BitVec 32)) Bool)

(assert (=> b!628612 (= res!406173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628614 () Bool)

(declare-fun res!406176 () Bool)

(declare-fun e!359655 () Bool)

(assert (=> b!628614 (=> (not res!406176) (not e!359655))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628614 (= res!406176 (validKeyInArray!0 (select (arr!18227 a!2986) j!136)))))

(declare-fun b!628615 () Bool)

(declare-fun res!406175 () Bool)

(assert (=> b!628615 (=> (not res!406175) (not e!359654))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!628615 (= res!406175 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18227 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18227 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628616 () Bool)

(declare-fun res!406171 () Bool)

(assert (=> b!628616 (=> (not res!406171) (not e!359654))))

(assert (=> b!628616 (= res!406171 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18227 a!2986) index!984) (select (arr!18227 a!2986) j!136))) (not (= (select (arr!18227 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628617 () Bool)

(declare-fun res!406169 () Bool)

(assert (=> b!628617 (=> (not res!406169) (not e!359655))))

(assert (=> b!628617 (= res!406169 (and (= (size!18591 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18591 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18591 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628618 () Bool)

(declare-fun res!406174 () Bool)

(assert (=> b!628618 (=> (not res!406174) (not e!359654))))

(declare-datatypes ((List!12268 0))(
  ( (Nil!12265) (Cons!12264 (h!13309 (_ BitVec 64)) (t!18496 List!12268)) )
))
(declare-fun arrayNoDuplicates!0 (array!37977 (_ BitVec 32) List!12268) Bool)

(assert (=> b!628618 (= res!406174 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12265))))

(declare-fun b!628613 () Bool)

(declare-fun res!406178 () Bool)

(assert (=> b!628613 (=> (not res!406178) (not e!359655))))

(assert (=> b!628613 (= res!406178 (validKeyInArray!0 k!1786))))

(declare-fun res!406172 () Bool)

(assert (=> start!56736 (=> (not res!406172) (not e!359655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56736 (= res!406172 (validMask!0 mask!3053))))

(assert (=> start!56736 e!359655))

(assert (=> start!56736 true))

(declare-fun array_inv!14023 (array!37977) Bool)

(assert (=> start!56736 (array_inv!14023 a!2986)))

(declare-fun b!628619 () Bool)

(declare-fun res!406168 () Bool)

(assert (=> b!628619 (=> (not res!406168) (not e!359654))))

(declare-datatypes ((SeekEntryResult!6667 0))(
  ( (MissingZero!6667 (index!28952 (_ BitVec 32))) (Found!6667 (index!28953 (_ BitVec 32))) (Intermediate!6667 (undefined!7479 Bool) (index!28954 (_ BitVec 32)) (x!57685 (_ BitVec 32))) (Undefined!6667) (MissingVacant!6667 (index!28955 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37977 (_ BitVec 32)) SeekEntryResult!6667)

(assert (=> b!628619 (= res!406168 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18227 a!2986) j!136) a!2986 mask!3053) (Found!6667 j!136)))))

(declare-fun b!628620 () Bool)

(assert (=> b!628620 (= e!359655 e!359654)))

(declare-fun res!406170 () Bool)

(assert (=> b!628620 (=> (not res!406170) (not e!359654))))

(declare-fun lt!290536 () SeekEntryResult!6667)

(assert (=> b!628620 (= res!406170 (or (= lt!290536 (MissingZero!6667 i!1108)) (= lt!290536 (MissingVacant!6667 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37977 (_ BitVec 32)) SeekEntryResult!6667)

(assert (=> b!628620 (= lt!290536 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628621 () Bool)

(declare-fun res!406177 () Bool)

(assert (=> b!628621 (=> (not res!406177) (not e!359655))))

(declare-fun arrayContainsKey!0 (array!37977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628621 (= res!406177 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628622 () Bool)

(declare-fun lt!290535 () (_ BitVec 32))

(assert (=> b!628622 (= e!359654 (and (bvsge lt!290535 #b00000000000000000000000000000000) (bvslt lt!290535 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628622 (= lt!290535 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56736 res!406172) b!628617))

(assert (= (and b!628617 res!406169) b!628614))

(assert (= (and b!628614 res!406176) b!628613))

(assert (= (and b!628613 res!406178) b!628621))

(assert (= (and b!628621 res!406177) b!628620))

(assert (= (and b!628620 res!406170) b!628612))

(assert (= (and b!628612 res!406173) b!628618))

(assert (= (and b!628618 res!406174) b!628615))

(assert (= (and b!628615 res!406175) b!628619))

(assert (= (and b!628619 res!406168) b!628616))

(assert (= (and b!628616 res!406171) b!628622))

(declare-fun m!603747 () Bool)

(assert (=> b!628620 m!603747))

(declare-fun m!603749 () Bool)

(assert (=> b!628612 m!603749))

(declare-fun m!603751 () Bool)

(assert (=> b!628622 m!603751))

(declare-fun m!603753 () Bool)

(assert (=> b!628621 m!603753))

(declare-fun m!603755 () Bool)

(assert (=> b!628614 m!603755))

(assert (=> b!628614 m!603755))

(declare-fun m!603757 () Bool)

(assert (=> b!628614 m!603757))

(declare-fun m!603759 () Bool)

(assert (=> start!56736 m!603759))

(declare-fun m!603761 () Bool)

(assert (=> start!56736 m!603761))

(declare-fun m!603763 () Bool)

(assert (=> b!628615 m!603763))

(declare-fun m!603765 () Bool)

(assert (=> b!628615 m!603765))

(declare-fun m!603767 () Bool)

(assert (=> b!628615 m!603767))

(assert (=> b!628619 m!603755))

(assert (=> b!628619 m!603755))

(declare-fun m!603769 () Bool)

(assert (=> b!628619 m!603769))

(declare-fun m!603771 () Bool)

(assert (=> b!628616 m!603771))

(assert (=> b!628616 m!603755))

(declare-fun m!603773 () Bool)

(assert (=> b!628618 m!603773))

(declare-fun m!603775 () Bool)

(assert (=> b!628613 m!603775))

(push 1)

(assert (not b!628622))

(assert (not b!628621))

(assert (not b!628613))

(assert (not b!628612))

(assert (not b!628620))

(assert (not b!628618))

(assert (not b!628614))

(assert (not start!56736))

(assert (not b!628619))

