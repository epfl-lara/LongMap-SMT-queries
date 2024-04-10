; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53418 () Bool)

(assert start!53418)

(declare-fun b!581166 () Bool)

(declare-fun res!368987 () Bool)

(declare-fun e!333571 () Bool)

(assert (=> b!581166 (=> (not res!368987) (not e!333571))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36319 0))(
  ( (array!36320 (arr!17434 (Array (_ BitVec 32) (_ BitVec 64))) (size!17798 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36319)

(assert (=> b!581166 (= res!368987 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17434 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17434 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581167 () Bool)

(declare-fun e!333573 () Bool)

(assert (=> b!581167 (= e!333573 e!333571)))

(declare-fun res!368986 () Bool)

(assert (=> b!581167 (=> (not res!368986) (not e!333571))))

(declare-datatypes ((SeekEntryResult!5874 0))(
  ( (MissingZero!5874 (index!25723 (_ BitVec 32))) (Found!5874 (index!25724 (_ BitVec 32))) (Intermediate!5874 (undefined!6686 Bool) (index!25725 (_ BitVec 32)) (x!54591 (_ BitVec 32))) (Undefined!5874) (MissingVacant!5874 (index!25726 (_ BitVec 32))) )
))
(declare-fun lt!264856 () SeekEntryResult!5874)

(assert (=> b!581167 (= res!368986 (or (= lt!264856 (MissingZero!5874 i!1108)) (= lt!264856 (MissingVacant!5874 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36319 (_ BitVec 32)) SeekEntryResult!5874)

(assert (=> b!581167 (= lt!264856 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581168 () Bool)

(declare-fun res!368982 () Bool)

(assert (=> b!581168 (=> (not res!368982) (not e!333571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36319 (_ BitVec 32)) Bool)

(assert (=> b!581168 (= res!368982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581169 () Bool)

(declare-fun res!368990 () Bool)

(assert (=> b!581169 (=> (not res!368990) (not e!333571))))

(declare-datatypes ((List!11475 0))(
  ( (Nil!11472) (Cons!11471 (h!12516 (_ BitVec 64)) (t!17703 List!11475)) )
))
(declare-fun arrayNoDuplicates!0 (array!36319 (_ BitVec 32) List!11475) Bool)

(assert (=> b!581169 (= res!368990 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11472))))

(declare-fun b!581170 () Bool)

(assert (=> b!581170 (= e!333571 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264855 () SeekEntryResult!5874)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36319 (_ BitVec 32)) SeekEntryResult!5874)

(assert (=> b!581170 (= lt!264855 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17434 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581171 () Bool)

(declare-fun res!368989 () Bool)

(assert (=> b!581171 (=> (not res!368989) (not e!333573))))

(assert (=> b!581171 (= res!368989 (and (= (size!17798 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17798 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17798 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!368984 () Bool)

(assert (=> start!53418 (=> (not res!368984) (not e!333573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53418 (= res!368984 (validMask!0 mask!3053))))

(assert (=> start!53418 e!333573))

(assert (=> start!53418 true))

(declare-fun array_inv!13230 (array!36319) Bool)

(assert (=> start!53418 (array_inv!13230 a!2986)))

(declare-fun b!581172 () Bool)

(declare-fun res!368983 () Bool)

(assert (=> b!581172 (=> (not res!368983) (not e!333573))))

(declare-fun arrayContainsKey!0 (array!36319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581172 (= res!368983 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581173 () Bool)

(declare-fun res!368985 () Bool)

(assert (=> b!581173 (=> (not res!368985) (not e!333573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581173 (= res!368985 (validKeyInArray!0 (select (arr!17434 a!2986) j!136)))))

(declare-fun b!581174 () Bool)

(declare-fun res!368988 () Bool)

(assert (=> b!581174 (=> (not res!368988) (not e!333573))))

(assert (=> b!581174 (= res!368988 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53418 res!368984) b!581171))

(assert (= (and b!581171 res!368989) b!581173))

(assert (= (and b!581173 res!368985) b!581174))

(assert (= (and b!581174 res!368988) b!581172))

(assert (= (and b!581172 res!368983) b!581167))

(assert (= (and b!581167 res!368986) b!581168))

(assert (= (and b!581168 res!368982) b!581169))

(assert (= (and b!581169 res!368990) b!581166))

(assert (= (and b!581166 res!368987) b!581170))

(declare-fun m!559719 () Bool)

(assert (=> b!581172 m!559719))

(declare-fun m!559721 () Bool)

(assert (=> b!581166 m!559721))

(declare-fun m!559723 () Bool)

(assert (=> b!581166 m!559723))

(declare-fun m!559725 () Bool)

(assert (=> b!581166 m!559725))

(declare-fun m!559727 () Bool)

(assert (=> b!581170 m!559727))

(assert (=> b!581170 m!559727))

(declare-fun m!559729 () Bool)

(assert (=> b!581170 m!559729))

(declare-fun m!559731 () Bool)

(assert (=> start!53418 m!559731))

(declare-fun m!559733 () Bool)

(assert (=> start!53418 m!559733))

(declare-fun m!559735 () Bool)

(assert (=> b!581168 m!559735))

(declare-fun m!559737 () Bool)

(assert (=> b!581167 m!559737))

(declare-fun m!559739 () Bool)

(assert (=> b!581174 m!559739))

(declare-fun m!559741 () Bool)

(assert (=> b!581169 m!559741))

(assert (=> b!581173 m!559727))

(assert (=> b!581173 m!559727))

(declare-fun m!559743 () Bool)

(assert (=> b!581173 m!559743))

(check-sat (not b!581174) (not b!581173) (not start!53418) (not b!581169) (not b!581168) (not b!581167) (not b!581172) (not b!581170))
(check-sat)
