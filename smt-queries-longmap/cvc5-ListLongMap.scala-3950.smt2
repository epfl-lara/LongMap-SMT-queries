; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53710 () Bool)

(assert start!53710)

(declare-fun b!585679 () Bool)

(declare-fun e!335057 () Bool)

(declare-fun e!335058 () Bool)

(assert (=> b!585679 (= e!335057 e!335058)))

(declare-fun res!373495 () Bool)

(assert (=> b!585679 (=> (not res!373495) (not e!335058))))

(declare-datatypes ((SeekEntryResult!6020 0))(
  ( (MissingZero!6020 (index!26307 (_ BitVec 32))) (Found!6020 (index!26308 (_ BitVec 32))) (Intermediate!6020 (undefined!6832 Bool) (index!26309 (_ BitVec 32)) (x!55129 (_ BitVec 32))) (Undefined!6020) (MissingVacant!6020 (index!26310 (_ BitVec 32))) )
))
(declare-fun lt!265886 () SeekEntryResult!6020)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585679 (= res!373495 (or (= lt!265886 (MissingZero!6020 i!1108)) (= lt!265886 (MissingVacant!6020 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36611 0))(
  ( (array!36612 (arr!17580 (Array (_ BitVec 32) (_ BitVec 64))) (size!17944 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36611)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36611 (_ BitVec 32)) SeekEntryResult!6020)

(assert (=> b!585679 (= lt!265886 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585680 () Bool)

(declare-fun res!373505 () Bool)

(assert (=> b!585680 (=> (not res!373505) (not e!335058))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585680 (= res!373505 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17580 a!2986) index!984) (select (arr!17580 a!2986) j!136))) (not (= (select (arr!17580 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585681 () Bool)

(declare-fun res!373503 () Bool)

(assert (=> b!585681 (=> (not res!373503) (not e!335058))))

(declare-datatypes ((List!11621 0))(
  ( (Nil!11618) (Cons!11617 (h!12662 (_ BitVec 64)) (t!17849 List!11621)) )
))
(declare-fun arrayNoDuplicates!0 (array!36611 (_ BitVec 32) List!11621) Bool)

(assert (=> b!585681 (= res!373503 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11618))))

(declare-fun b!585682 () Bool)

(declare-fun res!373499 () Bool)

(assert (=> b!585682 (=> (not res!373499) (not e!335057))))

(declare-fun arrayContainsKey!0 (array!36611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585682 (= res!373499 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585683 () Bool)

(declare-fun res!373502 () Bool)

(assert (=> b!585683 (=> (not res!373502) (not e!335057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585683 (= res!373502 (validKeyInArray!0 (select (arr!17580 a!2986) j!136)))))

(declare-fun b!585684 () Bool)

(declare-fun res!373498 () Bool)

(assert (=> b!585684 (=> (not res!373498) (not e!335058))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!585684 (= res!373498 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17580 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17580 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585685 () Bool)

(assert (=> b!585685 (= e!335058 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!265888 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36611 (_ BitVec 32)) SeekEntryResult!6020)

(assert (=> b!585685 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265888 vacantSpotIndex!68 (select (arr!17580 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265888 vacantSpotIndex!68 (select (store (arr!17580 a!2986) i!1108 k!1786) j!136) (array!36612 (store (arr!17580 a!2986) i!1108 k!1786) (size!17944 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18160 0))(
  ( (Unit!18161) )
))
(declare-fun lt!265887 () Unit!18160)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36611 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18160)

(assert (=> b!585685 (= lt!265887 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265888 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585685 (= lt!265888 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!373500 () Bool)

(assert (=> start!53710 (=> (not res!373500) (not e!335057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53710 (= res!373500 (validMask!0 mask!3053))))

(assert (=> start!53710 e!335057))

(assert (=> start!53710 true))

(declare-fun array_inv!13376 (array!36611) Bool)

(assert (=> start!53710 (array_inv!13376 a!2986)))

(declare-fun b!585686 () Bool)

(declare-fun res!373497 () Bool)

(assert (=> b!585686 (=> (not res!373497) (not e!335057))))

(assert (=> b!585686 (= res!373497 (and (= (size!17944 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17944 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17944 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585687 () Bool)

(declare-fun res!373504 () Bool)

(assert (=> b!585687 (=> (not res!373504) (not e!335058))))

(assert (=> b!585687 (= res!373504 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17580 a!2986) j!136) a!2986 mask!3053) (Found!6020 j!136)))))

(declare-fun b!585688 () Bool)

(declare-fun res!373496 () Bool)

(assert (=> b!585688 (=> (not res!373496) (not e!335058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36611 (_ BitVec 32)) Bool)

(assert (=> b!585688 (= res!373496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585689 () Bool)

(declare-fun res!373501 () Bool)

(assert (=> b!585689 (=> (not res!373501) (not e!335057))))

(assert (=> b!585689 (= res!373501 (validKeyInArray!0 k!1786))))

(assert (= (and start!53710 res!373500) b!585686))

(assert (= (and b!585686 res!373497) b!585683))

(assert (= (and b!585683 res!373502) b!585689))

(assert (= (and b!585689 res!373501) b!585682))

(assert (= (and b!585682 res!373499) b!585679))

(assert (= (and b!585679 res!373495) b!585688))

(assert (= (and b!585688 res!373496) b!585681))

(assert (= (and b!585681 res!373503) b!585684))

(assert (= (and b!585684 res!373498) b!585687))

(assert (= (and b!585687 res!373504) b!585680))

(assert (= (and b!585680 res!373505) b!585685))

(declare-fun m!563923 () Bool)

(assert (=> b!585682 m!563923))

(declare-fun m!563925 () Bool)

(assert (=> b!585681 m!563925))

(declare-fun m!563927 () Bool)

(assert (=> start!53710 m!563927))

(declare-fun m!563929 () Bool)

(assert (=> start!53710 m!563929))

(declare-fun m!563931 () Bool)

(assert (=> b!585689 m!563931))

(declare-fun m!563933 () Bool)

(assert (=> b!585687 m!563933))

(assert (=> b!585687 m!563933))

(declare-fun m!563935 () Bool)

(assert (=> b!585687 m!563935))

(declare-fun m!563937 () Bool)

(assert (=> b!585684 m!563937))

(declare-fun m!563939 () Bool)

(assert (=> b!585684 m!563939))

(declare-fun m!563941 () Bool)

(assert (=> b!585684 m!563941))

(declare-fun m!563943 () Bool)

(assert (=> b!585685 m!563943))

(declare-fun m!563945 () Bool)

(assert (=> b!585685 m!563945))

(assert (=> b!585685 m!563933))

(assert (=> b!585685 m!563939))

(assert (=> b!585685 m!563945))

(declare-fun m!563947 () Bool)

(assert (=> b!585685 m!563947))

(declare-fun m!563949 () Bool)

(assert (=> b!585685 m!563949))

(assert (=> b!585685 m!563933))

(declare-fun m!563951 () Bool)

(assert (=> b!585685 m!563951))

(declare-fun m!563953 () Bool)

(assert (=> b!585688 m!563953))

(declare-fun m!563955 () Bool)

(assert (=> b!585679 m!563955))

(declare-fun m!563957 () Bool)

(assert (=> b!585680 m!563957))

(assert (=> b!585680 m!563933))

(assert (=> b!585683 m!563933))

(assert (=> b!585683 m!563933))

(declare-fun m!563959 () Bool)

(assert (=> b!585683 m!563959))

(push 1)

