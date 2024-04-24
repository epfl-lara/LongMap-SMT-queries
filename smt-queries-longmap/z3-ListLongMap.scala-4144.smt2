; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56556 () Bool)

(assert start!56556)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!358927 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!626368 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37836 0))(
  ( (array!37837 (arr!18157 (Array (_ BitVec 32) (_ BitVec 64))) (size!18521 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37836)

(assert (=> b!626368 (= e!358927 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18157 a!2986) index!984) (select (arr!18157 a!2986) j!136))) (bvsge index!984 (size!18521 a!2986))))))

(declare-fun res!404112 () Bool)

(declare-fun e!358928 () Bool)

(assert (=> start!56556 (=> (not res!404112) (not e!358928))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56556 (= res!404112 (validMask!0 mask!3053))))

(assert (=> start!56556 e!358928))

(assert (=> start!56556 true))

(declare-fun array_inv!14016 (array!37836) Bool)

(assert (=> start!56556 (array_inv!14016 a!2986)))

(declare-fun b!626369 () Bool)

(declare-fun res!404108 () Bool)

(assert (=> b!626369 (=> (not res!404108) (not e!358927))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6553 0))(
  ( (MissingZero!6553 (index!28496 (_ BitVec 32))) (Found!6553 (index!28497 (_ BitVec 32))) (Intermediate!6553 (undefined!7365 Bool) (index!28498 (_ BitVec 32)) (x!57397 (_ BitVec 32))) (Undefined!6553) (MissingVacant!6553 (index!28499 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37836 (_ BitVec 32)) SeekEntryResult!6553)

(assert (=> b!626369 (= res!404108 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18157 a!2986) j!136) a!2986 mask!3053) (Found!6553 j!136)))))

(declare-fun b!626370 () Bool)

(assert (=> b!626370 (= e!358928 e!358927)))

(declare-fun res!404110 () Bool)

(assert (=> b!626370 (=> (not res!404110) (not e!358927))))

(declare-fun lt!290110 () SeekEntryResult!6553)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626370 (= res!404110 (or (= lt!290110 (MissingZero!6553 i!1108)) (= lt!290110 (MissingVacant!6553 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37836 (_ BitVec 32)) SeekEntryResult!6553)

(assert (=> b!626370 (= lt!290110 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626371 () Bool)

(declare-fun res!404107 () Bool)

(assert (=> b!626371 (=> (not res!404107) (not e!358928))))

(declare-fun arrayContainsKey!0 (array!37836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626371 (= res!404107 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626372 () Bool)

(declare-fun res!404116 () Bool)

(assert (=> b!626372 (=> (not res!404116) (not e!358927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37836 (_ BitVec 32)) Bool)

(assert (=> b!626372 (= res!404116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626373 () Bool)

(declare-fun res!404111 () Bool)

(assert (=> b!626373 (=> (not res!404111) (not e!358928))))

(assert (=> b!626373 (= res!404111 (and (= (size!18521 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18521 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18521 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626374 () Bool)

(declare-fun res!404113 () Bool)

(assert (=> b!626374 (=> (not res!404113) (not e!358928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626374 (= res!404113 (validKeyInArray!0 k0!1786))))

(declare-fun b!626375 () Bool)

(declare-fun res!404109 () Bool)

(assert (=> b!626375 (=> (not res!404109) (not e!358927))))

(declare-datatypes ((List!12105 0))(
  ( (Nil!12102) (Cons!12101 (h!13149 (_ BitVec 64)) (t!18325 List!12105)) )
))
(declare-fun arrayNoDuplicates!0 (array!37836 (_ BitVec 32) List!12105) Bool)

(assert (=> b!626375 (= res!404109 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12102))))

(declare-fun b!626376 () Bool)

(declare-fun res!404114 () Bool)

(assert (=> b!626376 (=> (not res!404114) (not e!358928))))

(assert (=> b!626376 (= res!404114 (validKeyInArray!0 (select (arr!18157 a!2986) j!136)))))

(declare-fun b!626377 () Bool)

(declare-fun res!404115 () Bool)

(assert (=> b!626377 (=> (not res!404115) (not e!358927))))

(assert (=> b!626377 (= res!404115 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18157 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18157 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56556 res!404112) b!626373))

(assert (= (and b!626373 res!404111) b!626376))

(assert (= (and b!626376 res!404114) b!626374))

(assert (= (and b!626374 res!404113) b!626371))

(assert (= (and b!626371 res!404107) b!626370))

(assert (= (and b!626370 res!404110) b!626372))

(assert (= (and b!626372 res!404116) b!626375))

(assert (= (and b!626375 res!404109) b!626377))

(assert (= (and b!626377 res!404115) b!626369))

(assert (= (and b!626369 res!404108) b!626368))

(declare-fun m!602119 () Bool)

(assert (=> b!626369 m!602119))

(assert (=> b!626369 m!602119))

(declare-fun m!602121 () Bool)

(assert (=> b!626369 m!602121))

(declare-fun m!602123 () Bool)

(assert (=> b!626371 m!602123))

(declare-fun m!602125 () Bool)

(assert (=> b!626372 m!602125))

(assert (=> b!626376 m!602119))

(assert (=> b!626376 m!602119))

(declare-fun m!602127 () Bool)

(assert (=> b!626376 m!602127))

(declare-fun m!602129 () Bool)

(assert (=> b!626370 m!602129))

(declare-fun m!602131 () Bool)

(assert (=> b!626375 m!602131))

(declare-fun m!602133 () Bool)

(assert (=> b!626377 m!602133))

(declare-fun m!602135 () Bool)

(assert (=> b!626377 m!602135))

(declare-fun m!602137 () Bool)

(assert (=> b!626377 m!602137))

(declare-fun m!602139 () Bool)

(assert (=> b!626368 m!602139))

(assert (=> b!626368 m!602119))

(declare-fun m!602141 () Bool)

(assert (=> start!56556 m!602141))

(declare-fun m!602143 () Bool)

(assert (=> start!56556 m!602143))

(declare-fun m!602145 () Bool)

(assert (=> b!626374 m!602145))

(check-sat (not b!626371) (not b!626372) (not b!626370) (not start!56556) (not b!626375) (not b!626374) (not b!626369) (not b!626376))
(check-sat)
