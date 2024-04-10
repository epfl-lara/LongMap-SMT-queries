; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53400 () Bool)

(assert start!53400)

(declare-fun b!580923 () Bool)

(declare-fun res!368746 () Bool)

(declare-fun e!333491 () Bool)

(assert (=> b!580923 (=> (not res!368746) (not e!333491))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36301 0))(
  ( (array!36302 (arr!17425 (Array (_ BitVec 32) (_ BitVec 64))) (size!17789 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36301)

(assert (=> b!580923 (= res!368746 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17425 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17425 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580924 () Bool)

(declare-fun res!368747 () Bool)

(declare-fun e!333492 () Bool)

(assert (=> b!580924 (=> (not res!368747) (not e!333492))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580924 (= res!368747 (and (= (size!17789 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17789 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17789 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580925 () Bool)

(declare-fun res!368741 () Bool)

(assert (=> b!580925 (=> (not res!368741) (not e!333492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580925 (= res!368741 (validKeyInArray!0 k0!1786))))

(declare-fun b!580926 () Bool)

(declare-fun res!368743 () Bool)

(assert (=> b!580926 (=> (not res!368743) (not e!333491))))

(declare-datatypes ((List!11466 0))(
  ( (Nil!11463) (Cons!11462 (h!12507 (_ BitVec 64)) (t!17694 List!11466)) )
))
(declare-fun arrayNoDuplicates!0 (array!36301 (_ BitVec 32) List!11466) Bool)

(assert (=> b!580926 (= res!368743 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11463))))

(declare-fun b!580927 () Bool)

(assert (=> b!580927 (= e!333492 e!333491)))

(declare-fun res!368744 () Bool)

(assert (=> b!580927 (=> (not res!368744) (not e!333491))))

(declare-datatypes ((SeekEntryResult!5865 0))(
  ( (MissingZero!5865 (index!25687 (_ BitVec 32))) (Found!5865 (index!25688 (_ BitVec 32))) (Intermediate!5865 (undefined!6677 Bool) (index!25689 (_ BitVec 32)) (x!54558 (_ BitVec 32))) (Undefined!5865) (MissingVacant!5865 (index!25690 (_ BitVec 32))) )
))
(declare-fun lt!264801 () SeekEntryResult!5865)

(assert (=> b!580927 (= res!368744 (or (= lt!264801 (MissingZero!5865 i!1108)) (= lt!264801 (MissingVacant!5865 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36301 (_ BitVec 32)) SeekEntryResult!5865)

(assert (=> b!580927 (= lt!264801 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580928 () Bool)

(assert (=> b!580928 (= e!333491 false)))

(declare-fun lt!264802 () SeekEntryResult!5865)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36301 (_ BitVec 32)) SeekEntryResult!5865)

(assert (=> b!580928 (= lt!264802 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17425 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580930 () Bool)

(declare-fun res!368740 () Bool)

(assert (=> b!580930 (=> (not res!368740) (not e!333492))))

(declare-fun arrayContainsKey!0 (array!36301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580930 (= res!368740 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580931 () Bool)

(declare-fun res!368739 () Bool)

(assert (=> b!580931 (=> (not res!368739) (not e!333492))))

(assert (=> b!580931 (= res!368739 (validKeyInArray!0 (select (arr!17425 a!2986) j!136)))))

(declare-fun b!580929 () Bool)

(declare-fun res!368742 () Bool)

(assert (=> b!580929 (=> (not res!368742) (not e!333491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36301 (_ BitVec 32)) Bool)

(assert (=> b!580929 (= res!368742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!368745 () Bool)

(assert (=> start!53400 (=> (not res!368745) (not e!333492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53400 (= res!368745 (validMask!0 mask!3053))))

(assert (=> start!53400 e!333492))

(assert (=> start!53400 true))

(declare-fun array_inv!13221 (array!36301) Bool)

(assert (=> start!53400 (array_inv!13221 a!2986)))

(assert (= (and start!53400 res!368745) b!580924))

(assert (= (and b!580924 res!368747) b!580931))

(assert (= (and b!580931 res!368739) b!580925))

(assert (= (and b!580925 res!368741) b!580930))

(assert (= (and b!580930 res!368740) b!580927))

(assert (= (and b!580927 res!368744) b!580929))

(assert (= (and b!580929 res!368742) b!580926))

(assert (= (and b!580926 res!368743) b!580923))

(assert (= (and b!580923 res!368746) b!580928))

(declare-fun m!559485 () Bool)

(assert (=> start!53400 m!559485))

(declare-fun m!559487 () Bool)

(assert (=> start!53400 m!559487))

(declare-fun m!559489 () Bool)

(assert (=> b!580931 m!559489))

(assert (=> b!580931 m!559489))

(declare-fun m!559491 () Bool)

(assert (=> b!580931 m!559491))

(declare-fun m!559493 () Bool)

(assert (=> b!580923 m!559493))

(declare-fun m!559495 () Bool)

(assert (=> b!580923 m!559495))

(declare-fun m!559497 () Bool)

(assert (=> b!580923 m!559497))

(declare-fun m!559499 () Bool)

(assert (=> b!580930 m!559499))

(assert (=> b!580928 m!559489))

(assert (=> b!580928 m!559489))

(declare-fun m!559501 () Bool)

(assert (=> b!580928 m!559501))

(declare-fun m!559503 () Bool)

(assert (=> b!580929 m!559503))

(declare-fun m!559505 () Bool)

(assert (=> b!580925 m!559505))

(declare-fun m!559507 () Bool)

(assert (=> b!580927 m!559507))

(declare-fun m!559509 () Bool)

(assert (=> b!580926 m!559509))

(check-sat (not b!580929) (not start!53400) (not b!580927) (not b!580931) (not b!580926) (not b!580925) (not b!580928) (not b!580930))
(check-sat)
