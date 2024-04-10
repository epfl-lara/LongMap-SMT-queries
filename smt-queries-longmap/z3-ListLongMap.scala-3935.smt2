; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53622 () Bool)

(assert start!53622)

(declare-fun b!584106 () Bool)

(declare-fun res!371930 () Bool)

(declare-fun e!334539 () Bool)

(assert (=> b!584106 (=> (not res!371930) (not e!334539))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36523 0))(
  ( (array!36524 (arr!17536 (Array (_ BitVec 32) (_ BitVec 64))) (size!17900 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36523)

(assert (=> b!584106 (= res!371930 (and (= (size!17900 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17900 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17900 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584107 () Bool)

(declare-fun res!371933 () Bool)

(assert (=> b!584107 (=> (not res!371933) (not e!334539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584107 (= res!371933 (validKeyInArray!0 (select (arr!17536 a!2986) j!136)))))

(declare-fun b!584108 () Bool)

(declare-fun res!371923 () Bool)

(assert (=> b!584108 (=> (not res!371923) (not e!334539))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584108 (= res!371923 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584109 () Bool)

(declare-fun e!334541 () Bool)

(assert (=> b!584109 (= e!334539 e!334541)))

(declare-fun res!371927 () Bool)

(assert (=> b!584109 (=> (not res!371927) (not e!334541))))

(declare-datatypes ((SeekEntryResult!5976 0))(
  ( (MissingZero!5976 (index!26131 (_ BitVec 32))) (Found!5976 (index!26132 (_ BitVec 32))) (Intermediate!5976 (undefined!6788 Bool) (index!26133 (_ BitVec 32)) (x!54965 (_ BitVec 32))) (Undefined!5976) (MissingVacant!5976 (index!26134 (_ BitVec 32))) )
))
(declare-fun lt!265490 () SeekEntryResult!5976)

(assert (=> b!584109 (= res!371927 (or (= lt!265490 (MissingZero!5976 i!1108)) (= lt!265490 (MissingVacant!5976 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36523 (_ BitVec 32)) SeekEntryResult!5976)

(assert (=> b!584109 (= lt!265490 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584110 () Bool)

(declare-fun res!371931 () Bool)

(assert (=> b!584110 (=> (not res!371931) (not e!334541))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584110 (= res!371931 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17536 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17536 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584111 () Bool)

(declare-fun res!371924 () Bool)

(assert (=> b!584111 (=> (not res!371924) (not e!334539))))

(assert (=> b!584111 (= res!371924 (validKeyInArray!0 k0!1786))))

(declare-fun b!584112 () Bool)

(declare-fun res!371922 () Bool)

(assert (=> b!584112 (=> (not res!371922) (not e!334541))))

(assert (=> b!584112 (= res!371922 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17536 a!2986) index!984) (select (arr!17536 a!2986) j!136))) (not (= (select (arr!17536 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!371925 () Bool)

(assert (=> start!53622 (=> (not res!371925) (not e!334539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53622 (= res!371925 (validMask!0 mask!3053))))

(assert (=> start!53622 e!334539))

(assert (=> start!53622 true))

(declare-fun array_inv!13332 (array!36523) Bool)

(assert (=> start!53622 (array_inv!13332 a!2986)))

(declare-fun b!584113 () Bool)

(declare-fun e!334540 () Bool)

(assert (=> b!584113 (= e!334541 e!334540)))

(declare-fun res!371932 () Bool)

(assert (=> b!584113 (=> (not res!371932) (not e!334540))))

(declare-fun lt!265491 () (_ BitVec 32))

(assert (=> b!584113 (= res!371932 (and (bvsge lt!265491 #b00000000000000000000000000000000) (bvslt lt!265491 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584113 (= lt!265491 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584114 () Bool)

(assert (=> b!584114 (= e!334540 false)))

(declare-fun lt!265492 () SeekEntryResult!5976)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36523 (_ BitVec 32)) SeekEntryResult!5976)

(assert (=> b!584114 (= lt!265492 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265491 vacantSpotIndex!68 (select (arr!17536 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584115 () Bool)

(declare-fun res!371926 () Bool)

(assert (=> b!584115 (=> (not res!371926) (not e!334541))))

(declare-datatypes ((List!11577 0))(
  ( (Nil!11574) (Cons!11573 (h!12618 (_ BitVec 64)) (t!17805 List!11577)) )
))
(declare-fun arrayNoDuplicates!0 (array!36523 (_ BitVec 32) List!11577) Bool)

(assert (=> b!584115 (= res!371926 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11574))))

(declare-fun b!584116 () Bool)

(declare-fun res!371928 () Bool)

(assert (=> b!584116 (=> (not res!371928) (not e!334541))))

(assert (=> b!584116 (= res!371928 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17536 a!2986) j!136) a!2986 mask!3053) (Found!5976 j!136)))))

(declare-fun b!584117 () Bool)

(declare-fun res!371929 () Bool)

(assert (=> b!584117 (=> (not res!371929) (not e!334541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36523 (_ BitVec 32)) Bool)

(assert (=> b!584117 (= res!371929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53622 res!371925) b!584106))

(assert (= (and b!584106 res!371930) b!584107))

(assert (= (and b!584107 res!371933) b!584111))

(assert (= (and b!584111 res!371924) b!584108))

(assert (= (and b!584108 res!371923) b!584109))

(assert (= (and b!584109 res!371927) b!584117))

(assert (= (and b!584117 res!371929) b!584115))

(assert (= (and b!584115 res!371926) b!584110))

(assert (= (and b!584110 res!371931) b!584116))

(assert (= (and b!584116 res!371928) b!584112))

(assert (= (and b!584112 res!371922) b!584113))

(assert (= (and b!584113 res!371932) b!584114))

(declare-fun m!562497 () Bool)

(assert (=> b!584114 m!562497))

(assert (=> b!584114 m!562497))

(declare-fun m!562499 () Bool)

(assert (=> b!584114 m!562499))

(declare-fun m!562501 () Bool)

(assert (=> b!584112 m!562501))

(assert (=> b!584112 m!562497))

(assert (=> b!584116 m!562497))

(assert (=> b!584116 m!562497))

(declare-fun m!562503 () Bool)

(assert (=> b!584116 m!562503))

(declare-fun m!562505 () Bool)

(assert (=> start!53622 m!562505))

(declare-fun m!562507 () Bool)

(assert (=> start!53622 m!562507))

(declare-fun m!562509 () Bool)

(assert (=> b!584109 m!562509))

(declare-fun m!562511 () Bool)

(assert (=> b!584110 m!562511))

(declare-fun m!562513 () Bool)

(assert (=> b!584110 m!562513))

(declare-fun m!562515 () Bool)

(assert (=> b!584110 m!562515))

(declare-fun m!562517 () Bool)

(assert (=> b!584108 m!562517))

(declare-fun m!562519 () Bool)

(assert (=> b!584111 m!562519))

(declare-fun m!562521 () Bool)

(assert (=> b!584113 m!562521))

(declare-fun m!562523 () Bool)

(assert (=> b!584117 m!562523))

(declare-fun m!562525 () Bool)

(assert (=> b!584115 m!562525))

(assert (=> b!584107 m!562497))

(assert (=> b!584107 m!562497))

(declare-fun m!562527 () Bool)

(assert (=> b!584107 m!562527))

(check-sat (not b!584108) (not b!584113) (not b!584107) (not b!584115) (not start!53622) (not b!584117) (not b!584111) (not b!584109) (not b!584114) (not b!584116))
(check-sat)
