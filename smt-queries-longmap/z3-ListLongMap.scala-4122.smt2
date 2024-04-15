; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56262 () Bool)

(assert start!56262)

(declare-fun b!623584 () Bool)

(declare-fun res!401921 () Bool)

(declare-fun e!357654 () Bool)

(assert (=> b!623584 (=> (not res!401921) (not e!357654))))

(declare-datatypes ((array!37701 0))(
  ( (array!37702 (arr!18095 (Array (_ BitVec 32) (_ BitVec 64))) (size!18460 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37701)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37701 (_ BitVec 32)) Bool)

(assert (=> b!623584 (= res!401921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!623585 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623585 (= e!357654 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18095 a!2986) index!984) (select (arr!18095 a!2986) j!136))) (not (= (select (arr!18095 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (= index!984 j!136)))))

(declare-fun b!623586 () Bool)

(declare-fun e!357653 () Bool)

(assert (=> b!623586 (= e!357653 e!357654)))

(declare-fun res!401916 () Bool)

(assert (=> b!623586 (=> (not res!401916) (not e!357654))))

(declare-datatypes ((SeekEntryResult!6532 0))(
  ( (MissingZero!6532 (index!28412 (_ BitVec 32))) (Found!6532 (index!28413 (_ BitVec 32))) (Intermediate!6532 (undefined!7344 Bool) (index!28414 (_ BitVec 32)) (x!57186 (_ BitVec 32))) (Undefined!6532) (MissingVacant!6532 (index!28415 (_ BitVec 32))) )
))
(declare-fun lt!289147 () SeekEntryResult!6532)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623586 (= res!401916 (or (= lt!289147 (MissingZero!6532 i!1108)) (= lt!289147 (MissingVacant!6532 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37701 (_ BitVec 32)) SeekEntryResult!6532)

(assert (=> b!623586 (= lt!289147 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623587 () Bool)

(declare-fun res!401919 () Bool)

(assert (=> b!623587 (=> (not res!401919) (not e!357653))))

(assert (=> b!623587 (= res!401919 (and (= (size!18460 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18460 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18460 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623588 () Bool)

(declare-fun res!401912 () Bool)

(assert (=> b!623588 (=> (not res!401912) (not e!357654))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!623588 (= res!401912 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18095 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18095 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623589 () Bool)

(declare-fun res!401914 () Bool)

(assert (=> b!623589 (=> (not res!401914) (not e!357654))))

(declare-datatypes ((List!12175 0))(
  ( (Nil!12172) (Cons!12171 (h!13216 (_ BitVec 64)) (t!18394 List!12175)) )
))
(declare-fun arrayNoDuplicates!0 (array!37701 (_ BitVec 32) List!12175) Bool)

(assert (=> b!623589 (= res!401914 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12172))))

(declare-fun b!623590 () Bool)

(declare-fun res!401920 () Bool)

(assert (=> b!623590 (=> (not res!401920) (not e!357653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623590 (= res!401920 (validKeyInArray!0 k0!1786))))

(declare-fun b!623591 () Bool)

(declare-fun res!401915 () Bool)

(assert (=> b!623591 (=> (not res!401915) (not e!357653))))

(assert (=> b!623591 (= res!401915 (validKeyInArray!0 (select (arr!18095 a!2986) j!136)))))

(declare-fun b!623592 () Bool)

(declare-fun res!401913 () Bool)

(assert (=> b!623592 (=> (not res!401913) (not e!357653))))

(declare-fun arrayContainsKey!0 (array!37701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623592 (= res!401913 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!401918 () Bool)

(assert (=> start!56262 (=> (not res!401918) (not e!357653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56262 (= res!401918 (validMask!0 mask!3053))))

(assert (=> start!56262 e!357653))

(assert (=> start!56262 true))

(declare-fun array_inv!13978 (array!37701) Bool)

(assert (=> start!56262 (array_inv!13978 a!2986)))

(declare-fun b!623593 () Bool)

(declare-fun res!401917 () Bool)

(assert (=> b!623593 (=> (not res!401917) (not e!357654))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37701 (_ BitVec 32)) SeekEntryResult!6532)

(assert (=> b!623593 (= res!401917 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18095 a!2986) j!136) a!2986 mask!3053) (Found!6532 j!136)))))

(assert (= (and start!56262 res!401918) b!623587))

(assert (= (and b!623587 res!401919) b!623591))

(assert (= (and b!623591 res!401915) b!623590))

(assert (= (and b!623590 res!401920) b!623592))

(assert (= (and b!623592 res!401913) b!623586))

(assert (= (and b!623586 res!401916) b!623584))

(assert (= (and b!623584 res!401921) b!623589))

(assert (= (and b!623589 res!401914) b!623588))

(assert (= (and b!623588 res!401912) b!623593))

(assert (= (and b!623593 res!401917) b!623585))

(declare-fun m!598849 () Bool)

(assert (=> b!623590 m!598849))

(declare-fun m!598851 () Bool)

(assert (=> b!623589 m!598851))

(declare-fun m!598853 () Bool)

(assert (=> b!623592 m!598853))

(declare-fun m!598855 () Bool)

(assert (=> b!623586 m!598855))

(declare-fun m!598857 () Bool)

(assert (=> b!623584 m!598857))

(declare-fun m!598859 () Bool)

(assert (=> b!623591 m!598859))

(assert (=> b!623591 m!598859))

(declare-fun m!598861 () Bool)

(assert (=> b!623591 m!598861))

(declare-fun m!598863 () Bool)

(assert (=> b!623588 m!598863))

(declare-fun m!598865 () Bool)

(assert (=> b!623588 m!598865))

(declare-fun m!598867 () Bool)

(assert (=> b!623588 m!598867))

(declare-fun m!598869 () Bool)

(assert (=> start!56262 m!598869))

(declare-fun m!598871 () Bool)

(assert (=> start!56262 m!598871))

(assert (=> b!623593 m!598859))

(assert (=> b!623593 m!598859))

(declare-fun m!598873 () Bool)

(assert (=> b!623593 m!598873))

(declare-fun m!598875 () Bool)

(assert (=> b!623585 m!598875))

(assert (=> b!623585 m!598859))

(check-sat (not b!623584) (not b!623586) (not b!623591) (not b!623593) (not b!623590) (not b!623592) (not b!623589) (not start!56262))
(check-sat)
