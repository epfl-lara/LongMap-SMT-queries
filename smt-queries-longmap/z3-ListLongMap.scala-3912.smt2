; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53484 () Bool)

(assert start!53484)

(declare-fun b!582084 () Bool)

(declare-fun res!369904 () Bool)

(declare-fun e!333870 () Bool)

(assert (=> b!582084 (=> (not res!369904) (not e!333870))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36385 0))(
  ( (array!36386 (arr!17467 (Array (_ BitVec 32) (_ BitVec 64))) (size!17831 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36385)

(assert (=> b!582084 (= res!369904 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17467 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17467 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582085 () Bool)

(declare-fun res!369907 () Bool)

(declare-fun e!333868 () Bool)

(assert (=> b!582085 (=> (not res!369907) (not e!333868))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582085 (= res!369907 (validKeyInArray!0 (select (arr!17467 a!2986) j!136)))))

(declare-fun res!369905 () Bool)

(assert (=> start!53484 (=> (not res!369905) (not e!333868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53484 (= res!369905 (validMask!0 mask!3053))))

(assert (=> start!53484 e!333868))

(assert (=> start!53484 true))

(declare-fun array_inv!13263 (array!36385) Bool)

(assert (=> start!53484 (array_inv!13263 a!2986)))

(declare-fun b!582086 () Bool)

(assert (=> b!582086 (= e!333868 e!333870)))

(declare-fun res!369900 () Bool)

(assert (=> b!582086 (=> (not res!369900) (not e!333870))))

(declare-datatypes ((SeekEntryResult!5907 0))(
  ( (MissingZero!5907 (index!25855 (_ BitVec 32))) (Found!5907 (index!25856 (_ BitVec 32))) (Intermediate!5907 (undefined!6719 Bool) (index!25857 (_ BitVec 32)) (x!54712 (_ BitVec 32))) (Undefined!5907) (MissingVacant!5907 (index!25858 (_ BitVec 32))) )
))
(declare-fun lt!265035 () SeekEntryResult!5907)

(assert (=> b!582086 (= res!369900 (or (= lt!265035 (MissingZero!5907 i!1108)) (= lt!265035 (MissingVacant!5907 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36385 (_ BitVec 32)) SeekEntryResult!5907)

(assert (=> b!582086 (= lt!265035 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582087 () Bool)

(declare-fun res!369906 () Bool)

(assert (=> b!582087 (=> (not res!369906) (not e!333868))))

(assert (=> b!582087 (= res!369906 (validKeyInArray!0 k0!1786))))

(declare-fun b!582088 () Bool)

(declare-fun res!369901 () Bool)

(assert (=> b!582088 (=> (not res!369901) (not e!333870))))

(declare-datatypes ((List!11508 0))(
  ( (Nil!11505) (Cons!11504 (h!12549 (_ BitVec 64)) (t!17736 List!11508)) )
))
(declare-fun arrayNoDuplicates!0 (array!36385 (_ BitVec 32) List!11508) Bool)

(assert (=> b!582088 (= res!369901 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11505))))

(declare-fun b!582089 () Bool)

(declare-fun res!369903 () Bool)

(assert (=> b!582089 (=> (not res!369903) (not e!333868))))

(assert (=> b!582089 (= res!369903 (and (= (size!17831 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17831 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17831 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582090 () Bool)

(declare-fun res!369908 () Bool)

(assert (=> b!582090 (=> (not res!369908) (not e!333868))))

(declare-fun arrayContainsKey!0 (array!36385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582090 (= res!369908 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582091 () Bool)

(declare-fun res!369902 () Bool)

(assert (=> b!582091 (=> (not res!369902) (not e!333870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36385 (_ BitVec 32)) Bool)

(assert (=> b!582091 (= res!369902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582092 () Bool)

(assert (=> b!582092 (= e!333870 false)))

(declare-fun lt!265036 () SeekEntryResult!5907)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36385 (_ BitVec 32)) SeekEntryResult!5907)

(assert (=> b!582092 (= lt!265036 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17467 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53484 res!369905) b!582089))

(assert (= (and b!582089 res!369903) b!582085))

(assert (= (and b!582085 res!369907) b!582087))

(assert (= (and b!582087 res!369906) b!582090))

(assert (= (and b!582090 res!369908) b!582086))

(assert (= (and b!582086 res!369900) b!582091))

(assert (= (and b!582091 res!369902) b!582088))

(assert (= (and b!582088 res!369901) b!582084))

(assert (= (and b!582084 res!369904) b!582092))

(declare-fun m!560601 () Bool)

(assert (=> b!582084 m!560601))

(declare-fun m!560603 () Bool)

(assert (=> b!582084 m!560603))

(declare-fun m!560605 () Bool)

(assert (=> b!582084 m!560605))

(declare-fun m!560607 () Bool)

(assert (=> b!582085 m!560607))

(assert (=> b!582085 m!560607))

(declare-fun m!560609 () Bool)

(assert (=> b!582085 m!560609))

(declare-fun m!560611 () Bool)

(assert (=> b!582087 m!560611))

(declare-fun m!560613 () Bool)

(assert (=> b!582086 m!560613))

(declare-fun m!560615 () Bool)

(assert (=> b!582088 m!560615))

(declare-fun m!560617 () Bool)

(assert (=> start!53484 m!560617))

(declare-fun m!560619 () Bool)

(assert (=> start!53484 m!560619))

(assert (=> b!582092 m!560607))

(assert (=> b!582092 m!560607))

(declare-fun m!560621 () Bool)

(assert (=> b!582092 m!560621))

(declare-fun m!560623 () Bool)

(assert (=> b!582090 m!560623))

(declare-fun m!560625 () Bool)

(assert (=> b!582091 m!560625))

(check-sat (not b!582092) (not start!53484) (not b!582086) (not b!582091) (not b!582090) (not b!582088) (not b!582087) (not b!582085))
(check-sat)
