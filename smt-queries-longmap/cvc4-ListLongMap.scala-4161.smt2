; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56658 () Bool)

(assert start!56658)

(declare-fun b!628009 () Bool)

(declare-fun res!405717 () Bool)

(declare-fun e!359411 () Bool)

(assert (=> b!628009 (=> (not res!405717) (not e!359411))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37950 0))(
  ( (array!37951 (arr!18215 (Array (_ BitVec 32) (_ BitVec 64))) (size!18579 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37950)

(declare-datatypes ((SeekEntryResult!6655 0))(
  ( (MissingZero!6655 (index!28904 (_ BitVec 32))) (Found!6655 (index!28905 (_ BitVec 32))) (Intermediate!6655 (undefined!7467 Bool) (index!28906 (_ BitVec 32)) (x!57635 (_ BitVec 32))) (Undefined!6655) (MissingVacant!6655 (index!28907 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37950 (_ BitVec 32)) SeekEntryResult!6655)

(assert (=> b!628009 (= res!405717 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18215 a!2986) j!136) a!2986 mask!3053) (Found!6655 j!136)))))

(declare-fun b!628010 () Bool)

(declare-fun res!405715 () Bool)

(assert (=> b!628010 (=> (not res!405715) (not e!359411))))

(assert (=> b!628010 (= res!405715 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18215 a!2986) index!984) (select (arr!18215 a!2986) j!136))) (not (= (select (arr!18215 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628011 () Bool)

(declare-fun res!405711 () Bool)

(assert (=> b!628011 (=> (not res!405711) (not e!359411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37950 (_ BitVec 32)) Bool)

(assert (=> b!628011 (= res!405711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!405716 () Bool)

(declare-fun e!359410 () Bool)

(assert (=> start!56658 (=> (not res!405716) (not e!359410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56658 (= res!405716 (validMask!0 mask!3053))))

(assert (=> start!56658 e!359410))

(assert (=> start!56658 true))

(declare-fun array_inv!14011 (array!37950) Bool)

(assert (=> start!56658 (array_inv!14011 a!2986)))

(declare-fun b!628012 () Bool)

(declare-fun res!405712 () Bool)

(assert (=> b!628012 (=> (not res!405712) (not e!359410))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628012 (= res!405712 (validKeyInArray!0 k!1786))))

(declare-fun b!628013 () Bool)

(declare-fun res!405709 () Bool)

(assert (=> b!628013 (=> (not res!405709) (not e!359410))))

(declare-fun arrayContainsKey!0 (array!37950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628013 (= res!405709 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628014 () Bool)

(assert (=> b!628014 (= e!359411 false)))

(declare-fun lt!290383 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628014 (= lt!290383 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628015 () Bool)

(declare-fun res!405719 () Bool)

(assert (=> b!628015 (=> (not res!405719) (not e!359411))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628015 (= res!405719 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18215 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18215 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628016 () Bool)

(declare-fun res!405718 () Bool)

(assert (=> b!628016 (=> (not res!405718) (not e!359410))))

(assert (=> b!628016 (= res!405718 (validKeyInArray!0 (select (arr!18215 a!2986) j!136)))))

(declare-fun b!628017 () Bool)

(declare-fun res!405713 () Bool)

(assert (=> b!628017 (=> (not res!405713) (not e!359411))))

(declare-datatypes ((List!12256 0))(
  ( (Nil!12253) (Cons!12252 (h!13297 (_ BitVec 64)) (t!18484 List!12256)) )
))
(declare-fun arrayNoDuplicates!0 (array!37950 (_ BitVec 32) List!12256) Bool)

(assert (=> b!628017 (= res!405713 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12253))))

(declare-fun b!628018 () Bool)

(assert (=> b!628018 (= e!359410 e!359411)))

(declare-fun res!405710 () Bool)

(assert (=> b!628018 (=> (not res!405710) (not e!359411))))

(declare-fun lt!290382 () SeekEntryResult!6655)

(assert (=> b!628018 (= res!405710 (or (= lt!290382 (MissingZero!6655 i!1108)) (= lt!290382 (MissingVacant!6655 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37950 (_ BitVec 32)) SeekEntryResult!6655)

(assert (=> b!628018 (= lt!290382 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628019 () Bool)

(declare-fun res!405714 () Bool)

(assert (=> b!628019 (=> (not res!405714) (not e!359410))))

(assert (=> b!628019 (= res!405714 (and (= (size!18579 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18579 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18579 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56658 res!405716) b!628019))

(assert (= (and b!628019 res!405714) b!628016))

(assert (= (and b!628016 res!405718) b!628012))

(assert (= (and b!628012 res!405712) b!628013))

(assert (= (and b!628013 res!405709) b!628018))

(assert (= (and b!628018 res!405710) b!628011))

(assert (= (and b!628011 res!405711) b!628017))

(assert (= (and b!628017 res!405713) b!628015))

(assert (= (and b!628015 res!405719) b!628009))

(assert (= (and b!628009 res!405717) b!628010))

(assert (= (and b!628010 res!405715) b!628014))

(declare-fun m!603267 () Bool)

(assert (=> b!628018 m!603267))

(declare-fun m!603269 () Bool)

(assert (=> start!56658 m!603269))

(declare-fun m!603271 () Bool)

(assert (=> start!56658 m!603271))

(declare-fun m!603273 () Bool)

(assert (=> b!628010 m!603273))

(declare-fun m!603275 () Bool)

(assert (=> b!628010 m!603275))

(declare-fun m!603277 () Bool)

(assert (=> b!628012 m!603277))

(declare-fun m!603279 () Bool)

(assert (=> b!628017 m!603279))

(declare-fun m!603281 () Bool)

(assert (=> b!628014 m!603281))

(assert (=> b!628009 m!603275))

(assert (=> b!628009 m!603275))

(declare-fun m!603283 () Bool)

(assert (=> b!628009 m!603283))

(declare-fun m!603285 () Bool)

(assert (=> b!628015 m!603285))

(declare-fun m!603287 () Bool)

(assert (=> b!628015 m!603287))

(declare-fun m!603289 () Bool)

(assert (=> b!628015 m!603289))

(assert (=> b!628016 m!603275))

(assert (=> b!628016 m!603275))

(declare-fun m!603291 () Bool)

(assert (=> b!628016 m!603291))

(declare-fun m!603293 () Bool)

(assert (=> b!628013 m!603293))

(declare-fun m!603295 () Bool)

(assert (=> b!628011 m!603295))

(push 1)

