; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56388 () Bool)

(assert start!56388)

(declare-fun b!624914 () Bool)

(declare-fun res!403067 () Bool)

(declare-fun e!358230 () Bool)

(assert (=> b!624914 (=> (not res!403067) (not e!358230))))

(declare-datatypes ((array!37782 0))(
  ( (array!37783 (arr!18134 (Array (_ BitVec 32) (_ BitVec 64))) (size!18499 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37782)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37782 (_ BitVec 32)) Bool)

(assert (=> b!624914 (= res!403067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624915 () Bool)

(assert (=> b!624915 (= e!358230 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6571 0))(
  ( (MissingZero!6571 (index!28568 (_ BitVec 32))) (Found!6571 (index!28569 (_ BitVec 32))) (Intermediate!6571 (undefined!7383 Bool) (index!28570 (_ BitVec 32)) (x!57332 (_ BitVec 32))) (Undefined!6571) (MissingVacant!6571 (index!28571 (_ BitVec 32))) )
))
(declare-fun lt!289546 () SeekEntryResult!6571)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37782 (_ BitVec 32)) SeekEntryResult!6571)

(assert (=> b!624915 (= lt!289546 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18134 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624916 () Bool)

(declare-fun res!403064 () Bool)

(declare-fun e!358229 () Bool)

(assert (=> b!624916 (=> (not res!403064) (not e!358229))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624916 (= res!403064 (and (= (size!18499 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18499 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18499 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624917 () Bool)

(declare-fun res!403069 () Bool)

(assert (=> b!624917 (=> (not res!403069) (not e!358229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624917 (= res!403069 (validKeyInArray!0 (select (arr!18134 a!2986) j!136)))))

(declare-fun b!624919 () Bool)

(declare-fun res!403063 () Bool)

(assert (=> b!624919 (=> (not res!403063) (not e!358229))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!624919 (= res!403063 (validKeyInArray!0 k0!1786))))

(declare-fun b!624920 () Bool)

(assert (=> b!624920 (= e!358229 e!358230)))

(declare-fun res!403065 () Bool)

(assert (=> b!624920 (=> (not res!403065) (not e!358230))))

(declare-fun lt!289545 () SeekEntryResult!6571)

(assert (=> b!624920 (= res!403065 (or (= lt!289545 (MissingZero!6571 i!1108)) (= lt!289545 (MissingVacant!6571 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37782 (_ BitVec 32)) SeekEntryResult!6571)

(assert (=> b!624920 (= lt!289545 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624921 () Bool)

(declare-fun res!403066 () Bool)

(assert (=> b!624921 (=> (not res!403066) (not e!358230))))

(assert (=> b!624921 (= res!403066 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18134 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18134 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624922 () Bool)

(declare-fun res!403068 () Bool)

(assert (=> b!624922 (=> (not res!403068) (not e!358230))))

(declare-datatypes ((List!12214 0))(
  ( (Nil!12211) (Cons!12210 (h!13255 (_ BitVec 64)) (t!18433 List!12214)) )
))
(declare-fun arrayNoDuplicates!0 (array!37782 (_ BitVec 32) List!12214) Bool)

(assert (=> b!624922 (= res!403068 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12211))))

(declare-fun res!403062 () Bool)

(assert (=> start!56388 (=> (not res!403062) (not e!358229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56388 (= res!403062 (validMask!0 mask!3053))))

(assert (=> start!56388 e!358229))

(assert (=> start!56388 true))

(declare-fun array_inv!14017 (array!37782) Bool)

(assert (=> start!56388 (array_inv!14017 a!2986)))

(declare-fun b!624918 () Bool)

(declare-fun res!403070 () Bool)

(assert (=> b!624918 (=> (not res!403070) (not e!358229))))

(declare-fun arrayContainsKey!0 (array!37782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624918 (= res!403070 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56388 res!403062) b!624916))

(assert (= (and b!624916 res!403064) b!624917))

(assert (= (and b!624917 res!403069) b!624919))

(assert (= (and b!624919 res!403063) b!624918))

(assert (= (and b!624918 res!403070) b!624920))

(assert (= (and b!624920 res!403065) b!624914))

(assert (= (and b!624914 res!403067) b!624922))

(assert (= (and b!624922 res!403068) b!624921))

(assert (= (and b!624921 res!403066) b!624915))

(declare-fun m!600001 () Bool)

(assert (=> b!624917 m!600001))

(assert (=> b!624917 m!600001))

(declare-fun m!600003 () Bool)

(assert (=> b!624917 m!600003))

(declare-fun m!600005 () Bool)

(assert (=> b!624914 m!600005))

(declare-fun m!600007 () Bool)

(assert (=> b!624921 m!600007))

(declare-fun m!600009 () Bool)

(assert (=> b!624921 m!600009))

(declare-fun m!600011 () Bool)

(assert (=> b!624921 m!600011))

(declare-fun m!600013 () Bool)

(assert (=> b!624922 m!600013))

(assert (=> b!624915 m!600001))

(assert (=> b!624915 m!600001))

(declare-fun m!600015 () Bool)

(assert (=> b!624915 m!600015))

(declare-fun m!600017 () Bool)

(assert (=> start!56388 m!600017))

(declare-fun m!600019 () Bool)

(assert (=> start!56388 m!600019))

(declare-fun m!600021 () Bool)

(assert (=> b!624920 m!600021))

(declare-fun m!600023 () Bool)

(assert (=> b!624918 m!600023))

(declare-fun m!600025 () Bool)

(assert (=> b!624919 m!600025))

(check-sat (not b!624919) (not b!624917) (not start!56388) (not b!624914) (not b!624920) (not b!624918) (not b!624922) (not b!624915))
(check-sat)
