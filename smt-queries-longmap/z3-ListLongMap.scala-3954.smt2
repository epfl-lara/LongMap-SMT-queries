; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53736 () Bool)

(assert start!53736)

(declare-fun b!586108 () Bool)

(declare-fun res!373926 () Bool)

(declare-fun e!335175 () Bool)

(assert (=> b!586108 (=> (not res!373926) (not e!335175))))

(declare-datatypes ((array!36637 0))(
  ( (array!36638 (arr!17593 (Array (_ BitVec 32) (_ BitVec 64))) (size!17957 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36637)

(declare-datatypes ((List!11634 0))(
  ( (Nil!11631) (Cons!11630 (h!12675 (_ BitVec 64)) (t!17862 List!11634)) )
))
(declare-fun arrayNoDuplicates!0 (array!36637 (_ BitVec 32) List!11634) Bool)

(assert (=> b!586108 (= res!373926 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11631))))

(declare-fun b!586109 () Bool)

(declare-fun res!373931 () Bool)

(assert (=> b!586109 (=> (not res!373931) (not e!335175))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586109 (= res!373931 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17593 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17593 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586110 () Bool)

(declare-fun res!373928 () Bool)

(declare-fun e!335173 () Bool)

(assert (=> b!586110 (=> (not res!373928) (not e!335173))))

(declare-fun arrayContainsKey!0 (array!36637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586110 (= res!373928 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586111 () Bool)

(declare-fun res!373924 () Bool)

(assert (=> b!586111 (=> (not res!373924) (not e!335175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36637 (_ BitVec 32)) Bool)

(assert (=> b!586111 (= res!373924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586112 () Bool)

(declare-fun res!373927 () Bool)

(assert (=> b!586112 (=> (not res!373927) (not e!335173))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!586112 (= res!373927 (and (= (size!17957 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17957 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17957 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586113 () Bool)

(assert (=> b!586113 (= e!335173 e!335175)))

(declare-fun res!373932 () Bool)

(assert (=> b!586113 (=> (not res!373932) (not e!335175))))

(declare-datatypes ((SeekEntryResult!6033 0))(
  ( (MissingZero!6033 (index!26359 (_ BitVec 32))) (Found!6033 (index!26360 (_ BitVec 32))) (Intermediate!6033 (undefined!6845 Bool) (index!26361 (_ BitVec 32)) (x!55174 (_ BitVec 32))) (Undefined!6033) (MissingVacant!6033 (index!26362 (_ BitVec 32))) )
))
(declare-fun lt!266005 () SeekEntryResult!6033)

(assert (=> b!586113 (= res!373932 (or (= lt!266005 (MissingZero!6033 i!1108)) (= lt!266005 (MissingVacant!6033 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36637 (_ BitVec 32)) SeekEntryResult!6033)

(assert (=> b!586113 (= lt!266005 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586114 () Bool)

(assert (=> b!586114 (= e!335175 (not true))))

(declare-fun lt!266004 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36637 (_ BitVec 32)) SeekEntryResult!6033)

(assert (=> b!586114 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266004 vacantSpotIndex!68 (select (arr!17593 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266004 vacantSpotIndex!68 (select (store (arr!17593 a!2986) i!1108 k0!1786) j!136) (array!36638 (store (arr!17593 a!2986) i!1108 k0!1786) (size!17957 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18186 0))(
  ( (Unit!18187) )
))
(declare-fun lt!266003 () Unit!18186)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36637 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18186)

(assert (=> b!586114 (= lt!266003 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266004 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586114 (= lt!266004 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586116 () Bool)

(declare-fun res!373933 () Bool)

(assert (=> b!586116 (=> (not res!373933) (not e!335173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586116 (= res!373933 (validKeyInArray!0 (select (arr!17593 a!2986) j!136)))))

(declare-fun b!586117 () Bool)

(declare-fun res!373925 () Bool)

(assert (=> b!586117 (=> (not res!373925) (not e!335175))))

(assert (=> b!586117 (= res!373925 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17593 a!2986) index!984) (select (arr!17593 a!2986) j!136))) (not (= (select (arr!17593 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586118 () Bool)

(declare-fun res!373930 () Bool)

(assert (=> b!586118 (=> (not res!373930) (not e!335173))))

(assert (=> b!586118 (= res!373930 (validKeyInArray!0 k0!1786))))

(declare-fun b!586115 () Bool)

(declare-fun res!373929 () Bool)

(assert (=> b!586115 (=> (not res!373929) (not e!335175))))

(assert (=> b!586115 (= res!373929 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17593 a!2986) j!136) a!2986 mask!3053) (Found!6033 j!136)))))

(declare-fun res!373934 () Bool)

(assert (=> start!53736 (=> (not res!373934) (not e!335173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53736 (= res!373934 (validMask!0 mask!3053))))

(assert (=> start!53736 e!335173))

(assert (=> start!53736 true))

(declare-fun array_inv!13389 (array!36637) Bool)

(assert (=> start!53736 (array_inv!13389 a!2986)))

(assert (= (and start!53736 res!373934) b!586112))

(assert (= (and b!586112 res!373927) b!586116))

(assert (= (and b!586116 res!373933) b!586118))

(assert (= (and b!586118 res!373930) b!586110))

(assert (= (and b!586110 res!373928) b!586113))

(assert (= (and b!586113 res!373932) b!586111))

(assert (= (and b!586111 res!373924) b!586108))

(assert (= (and b!586108 res!373926) b!586109))

(assert (= (and b!586109 res!373931) b!586115))

(assert (= (and b!586115 res!373929) b!586117))

(assert (= (and b!586117 res!373925) b!586114))

(declare-fun m!564417 () Bool)

(assert (=> b!586113 m!564417))

(declare-fun m!564419 () Bool)

(assert (=> start!53736 m!564419))

(declare-fun m!564421 () Bool)

(assert (=> start!53736 m!564421))

(declare-fun m!564423 () Bool)

(assert (=> b!586111 m!564423))

(declare-fun m!564425 () Bool)

(assert (=> b!586117 m!564425))

(declare-fun m!564427 () Bool)

(assert (=> b!586117 m!564427))

(declare-fun m!564429 () Bool)

(assert (=> b!586114 m!564429))

(declare-fun m!564431 () Bool)

(assert (=> b!586114 m!564431))

(assert (=> b!586114 m!564427))

(assert (=> b!586114 m!564431))

(declare-fun m!564433 () Bool)

(assert (=> b!586114 m!564433))

(declare-fun m!564435 () Bool)

(assert (=> b!586114 m!564435))

(assert (=> b!586114 m!564427))

(declare-fun m!564437 () Bool)

(assert (=> b!586114 m!564437))

(declare-fun m!564439 () Bool)

(assert (=> b!586114 m!564439))

(assert (=> b!586116 m!564427))

(assert (=> b!586116 m!564427))

(declare-fun m!564441 () Bool)

(assert (=> b!586116 m!564441))

(declare-fun m!564443 () Bool)

(assert (=> b!586110 m!564443))

(assert (=> b!586115 m!564427))

(assert (=> b!586115 m!564427))

(declare-fun m!564445 () Bool)

(assert (=> b!586115 m!564445))

(declare-fun m!564447 () Bool)

(assert (=> b!586108 m!564447))

(declare-fun m!564449 () Bool)

(assert (=> b!586109 m!564449))

(assert (=> b!586109 m!564435))

(declare-fun m!564451 () Bool)

(assert (=> b!586109 m!564451))

(declare-fun m!564453 () Bool)

(assert (=> b!586118 m!564453))

(check-sat (not b!586118) (not b!586113) (not b!586116) (not b!586114) (not start!53736) (not b!586110) (not b!586111) (not b!586115) (not b!586108))
(check-sat)
