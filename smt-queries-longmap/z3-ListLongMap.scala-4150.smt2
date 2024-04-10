; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56590 () Bool)

(assert start!56590)

(declare-fun b!626895 () Bool)

(declare-fun res!404595 () Bool)

(declare-fun e!359106 () Bool)

(assert (=> b!626895 (=> (not res!404595) (not e!359106))))

(declare-datatypes ((array!37882 0))(
  ( (array!37883 (arr!18181 (Array (_ BitVec 32) (_ BitVec 64))) (size!18545 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37882)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37882 (_ BitVec 32)) Bool)

(assert (=> b!626895 (= res!404595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626896 () Bool)

(declare-fun res!404596 () Bool)

(declare-fun e!359105 () Bool)

(assert (=> b!626896 (=> (not res!404596) (not e!359105))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626896 (= res!404596 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626897 () Bool)

(declare-fun res!404601 () Bool)

(assert (=> b!626897 (=> (not res!404601) (not e!359105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626897 (= res!404601 (validKeyInArray!0 k0!1786))))

(declare-fun b!626898 () Bool)

(declare-fun res!404599 () Bool)

(assert (=> b!626898 (=> (not res!404599) (not e!359106))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626898 (= res!404599 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18181 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18181 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626899 () Bool)

(declare-fun res!404600 () Bool)

(assert (=> b!626899 (=> (not res!404600) (not e!359106))))

(declare-datatypes ((List!12222 0))(
  ( (Nil!12219) (Cons!12218 (h!13263 (_ BitVec 64)) (t!18450 List!12222)) )
))
(declare-fun arrayNoDuplicates!0 (array!37882 (_ BitVec 32) List!12222) Bool)

(assert (=> b!626899 (= res!404600 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12219))))

(declare-fun b!626900 () Bool)

(declare-fun res!404597 () Bool)

(assert (=> b!626900 (=> (not res!404597) (not e!359105))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626900 (= res!404597 (and (= (size!18545 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18545 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18545 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626901 () Bool)

(assert (=> b!626901 (= e!359105 e!359106)))

(declare-fun res!404603 () Bool)

(assert (=> b!626901 (=> (not res!404603) (not e!359106))))

(declare-datatypes ((SeekEntryResult!6621 0))(
  ( (MissingZero!6621 (index!28768 (_ BitVec 32))) (Found!6621 (index!28769 (_ BitVec 32))) (Intermediate!6621 (undefined!7433 Bool) (index!28770 (_ BitVec 32)) (x!57513 (_ BitVec 32))) (Undefined!6621) (MissingVacant!6621 (index!28771 (_ BitVec 32))) )
))
(declare-fun lt!290179 () SeekEntryResult!6621)

(assert (=> b!626901 (= res!404603 (or (= lt!290179 (MissingZero!6621 i!1108)) (= lt!290179 (MissingVacant!6621 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37882 (_ BitVec 32)) SeekEntryResult!6621)

(assert (=> b!626901 (= lt!290179 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!404598 () Bool)

(assert (=> start!56590 (=> (not res!404598) (not e!359105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56590 (= res!404598 (validMask!0 mask!3053))))

(assert (=> start!56590 e!359105))

(assert (=> start!56590 true))

(declare-fun array_inv!13977 (array!37882) Bool)

(assert (=> start!56590 (array_inv!13977 a!2986)))

(declare-fun b!626902 () Bool)

(declare-fun res!404602 () Bool)

(assert (=> b!626902 (=> (not res!404602) (not e!359105))))

(assert (=> b!626902 (= res!404602 (validKeyInArray!0 (select (arr!18181 a!2986) j!136)))))

(declare-fun b!626903 () Bool)

(assert (=> b!626903 (= e!359106 false)))

(declare-fun lt!290178 () SeekEntryResult!6621)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37882 (_ BitVec 32)) SeekEntryResult!6621)

(assert (=> b!626903 (= lt!290178 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18181 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56590 res!404598) b!626900))

(assert (= (and b!626900 res!404597) b!626902))

(assert (= (and b!626902 res!404602) b!626897))

(assert (= (and b!626897 res!404601) b!626896))

(assert (= (and b!626896 res!404596) b!626901))

(assert (= (and b!626901 res!404603) b!626895))

(assert (= (and b!626895 res!404595) b!626899))

(assert (= (and b!626899 res!404600) b!626898))

(assert (= (and b!626898 res!404599) b!626903))

(declare-fun m!602255 () Bool)

(assert (=> b!626902 m!602255))

(assert (=> b!626902 m!602255))

(declare-fun m!602257 () Bool)

(assert (=> b!626902 m!602257))

(declare-fun m!602259 () Bool)

(assert (=> start!56590 m!602259))

(declare-fun m!602261 () Bool)

(assert (=> start!56590 m!602261))

(declare-fun m!602263 () Bool)

(assert (=> b!626895 m!602263))

(declare-fun m!602265 () Bool)

(assert (=> b!626899 m!602265))

(declare-fun m!602267 () Bool)

(assert (=> b!626896 m!602267))

(declare-fun m!602269 () Bool)

(assert (=> b!626898 m!602269))

(declare-fun m!602271 () Bool)

(assert (=> b!626898 m!602271))

(declare-fun m!602273 () Bool)

(assert (=> b!626898 m!602273))

(declare-fun m!602275 () Bool)

(assert (=> b!626897 m!602275))

(declare-fun m!602277 () Bool)

(assert (=> b!626901 m!602277))

(assert (=> b!626903 m!602255))

(assert (=> b!626903 m!602255))

(declare-fun m!602279 () Bool)

(assert (=> b!626903 m!602279))

(check-sat (not b!626896) (not b!626903) (not b!626897) (not b!626895) (not b!626899) (not b!626901) (not b!626902) (not start!56590))
(check-sat)
