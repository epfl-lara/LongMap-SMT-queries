; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53760 () Bool)

(assert start!53760)

(declare-fun b!585888 () Bool)

(declare-fun res!373600 () Bool)

(declare-fun e!335186 () Bool)

(assert (=> b!585888 (=> (not res!373600) (not e!335186))))

(declare-datatypes ((array!36606 0))(
  ( (array!36607 (arr!17575 (Array (_ BitVec 32) (_ BitVec 64))) (size!17939 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36606)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36606 (_ BitVec 32)) Bool)

(assert (=> b!585888 (= res!373600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!373602 () Bool)

(declare-fun e!335185 () Bool)

(assert (=> start!53760 (=> (not res!373602) (not e!335185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53760 (= res!373602 (validMask!0 mask!3053))))

(assert (=> start!53760 e!335185))

(assert (=> start!53760 true))

(declare-fun array_inv!13434 (array!36606) Bool)

(assert (=> start!53760 (array_inv!13434 a!2986)))

(declare-fun b!585889 () Bool)

(declare-fun res!373603 () Bool)

(assert (=> b!585889 (=> (not res!373603) (not e!335185))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585889 (= res!373603 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585890 () Bool)

(assert (=> b!585890 (= e!335186 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265989 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5971 0))(
  ( (MissingZero!5971 (index!26111 (_ BitVec 32))) (Found!5971 (index!26112 (_ BitVec 32))) (Intermediate!5971 (undefined!6783 Bool) (index!26113 (_ BitVec 32)) (x!55083 (_ BitVec 32))) (Undefined!5971) (MissingVacant!5971 (index!26114 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36606 (_ BitVec 32)) SeekEntryResult!5971)

(assert (=> b!585890 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265989 vacantSpotIndex!68 (select (arr!17575 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265989 vacantSpotIndex!68 (select (store (arr!17575 a!2986) i!1108 k0!1786) j!136) (array!36607 (store (arr!17575 a!2986) i!1108 k0!1786) (size!17939 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18139 0))(
  ( (Unit!18140) )
))
(declare-fun lt!265988 () Unit!18139)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36606 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18139)

(assert (=> b!585890 (= lt!265988 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265989 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585890 (= lt!265989 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585891 () Bool)

(declare-fun res!373604 () Bool)

(assert (=> b!585891 (=> (not res!373604) (not e!335185))))

(assert (=> b!585891 (= res!373604 (and (= (size!17939 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17939 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17939 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585892 () Bool)

(declare-fun res!373609 () Bool)

(assert (=> b!585892 (=> (not res!373609) (not e!335186))))

(declare-datatypes ((List!11523 0))(
  ( (Nil!11520) (Cons!11519 (h!12567 (_ BitVec 64)) (t!17743 List!11523)) )
))
(declare-fun arrayNoDuplicates!0 (array!36606 (_ BitVec 32) List!11523) Bool)

(assert (=> b!585892 (= res!373609 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11520))))

(declare-fun b!585893 () Bool)

(declare-fun res!373606 () Bool)

(assert (=> b!585893 (=> (not res!373606) (not e!335186))))

(assert (=> b!585893 (= res!373606 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17575 a!2986) index!984) (select (arr!17575 a!2986) j!136))) (not (= (select (arr!17575 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585894 () Bool)

(declare-fun res!373607 () Bool)

(assert (=> b!585894 (=> (not res!373607) (not e!335186))))

(assert (=> b!585894 (= res!373607 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17575 a!2986) j!136) a!2986 mask!3053) (Found!5971 j!136)))))

(declare-fun b!585895 () Bool)

(assert (=> b!585895 (= e!335185 e!335186)))

(declare-fun res!373605 () Bool)

(assert (=> b!585895 (=> (not res!373605) (not e!335186))))

(declare-fun lt!265990 () SeekEntryResult!5971)

(assert (=> b!585895 (= res!373605 (or (= lt!265990 (MissingZero!5971 i!1108)) (= lt!265990 (MissingVacant!5971 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36606 (_ BitVec 32)) SeekEntryResult!5971)

(assert (=> b!585895 (= lt!265990 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585896 () Bool)

(declare-fun res!373608 () Bool)

(assert (=> b!585896 (=> (not res!373608) (not e!335185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585896 (= res!373608 (validKeyInArray!0 (select (arr!17575 a!2986) j!136)))))

(declare-fun b!585897 () Bool)

(declare-fun res!373599 () Bool)

(assert (=> b!585897 (=> (not res!373599) (not e!335186))))

(assert (=> b!585897 (= res!373599 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17575 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17575 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585898 () Bool)

(declare-fun res!373601 () Bool)

(assert (=> b!585898 (=> (not res!373601) (not e!335185))))

(assert (=> b!585898 (= res!373601 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53760 res!373602) b!585891))

(assert (= (and b!585891 res!373604) b!585896))

(assert (= (and b!585896 res!373608) b!585898))

(assert (= (and b!585898 res!373601) b!585889))

(assert (= (and b!585889 res!373603) b!585895))

(assert (= (and b!585895 res!373605) b!585888))

(assert (= (and b!585888 res!373600) b!585892))

(assert (= (and b!585892 res!373609) b!585897))

(assert (= (and b!585897 res!373599) b!585894))

(assert (= (and b!585894 res!373607) b!585893))

(assert (= (and b!585893 res!373606) b!585890))

(declare-fun m!564281 () Bool)

(assert (=> b!585894 m!564281))

(assert (=> b!585894 m!564281))

(declare-fun m!564283 () Bool)

(assert (=> b!585894 m!564283))

(declare-fun m!564285 () Bool)

(assert (=> b!585889 m!564285))

(declare-fun m!564287 () Bool)

(assert (=> b!585888 m!564287))

(assert (=> b!585896 m!564281))

(assert (=> b!585896 m!564281))

(declare-fun m!564289 () Bool)

(assert (=> b!585896 m!564289))

(declare-fun m!564291 () Bool)

(assert (=> b!585895 m!564291))

(declare-fun m!564293 () Bool)

(assert (=> b!585893 m!564293))

(assert (=> b!585893 m!564281))

(assert (=> b!585890 m!564281))

(declare-fun m!564295 () Bool)

(assert (=> b!585890 m!564295))

(declare-fun m!564297 () Bool)

(assert (=> b!585890 m!564297))

(assert (=> b!585890 m!564281))

(declare-fun m!564299 () Bool)

(assert (=> b!585890 m!564299))

(declare-fun m!564301 () Bool)

(assert (=> b!585890 m!564301))

(declare-fun m!564303 () Bool)

(assert (=> b!585890 m!564303))

(assert (=> b!585890 m!564297))

(declare-fun m!564305 () Bool)

(assert (=> b!585890 m!564305))

(declare-fun m!564307 () Bool)

(assert (=> start!53760 m!564307))

(declare-fun m!564309 () Bool)

(assert (=> start!53760 m!564309))

(declare-fun m!564311 () Bool)

(assert (=> b!585898 m!564311))

(declare-fun m!564313 () Bool)

(assert (=> b!585897 m!564313))

(assert (=> b!585897 m!564299))

(declare-fun m!564315 () Bool)

(assert (=> b!585897 m!564315))

(declare-fun m!564317 () Bool)

(assert (=> b!585892 m!564317))

(check-sat (not b!585895) (not b!585894) (not b!585888) (not b!585892) (not b!585890) (not b!585889) (not start!53760) (not b!585898) (not b!585896))
(check-sat)
