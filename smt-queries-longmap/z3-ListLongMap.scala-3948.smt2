; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53748 () Bool)

(assert start!53748)

(declare-fun b!585683 () Bool)

(declare-fun e!335125 () Bool)

(assert (=> b!585683 (= e!335125 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5965 0))(
  ( (MissingZero!5965 (index!26087 (_ BitVec 32))) (Found!5965 (index!26088 (_ BitVec 32))) (Intermediate!5965 (undefined!6777 Bool) (index!26089 (_ BitVec 32)) (x!55061 (_ BitVec 32))) (Undefined!5965) (MissingVacant!5965 (index!26090 (_ BitVec 32))) )
))
(declare-fun lt!265936 () SeekEntryResult!5965)

(declare-fun lt!265934 () (_ BitVec 32))

(declare-datatypes ((array!36594 0))(
  ( (array!36595 (arr!17569 (Array (_ BitVec 32) (_ BitVec 64))) (size!17933 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36594)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36594 (_ BitVec 32)) SeekEntryResult!5965)

(assert (=> b!585683 (= lt!265936 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265934 vacantSpotIndex!68 (select (arr!17569 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585684 () Bool)

(declare-fun res!373399 () Bool)

(declare-fun e!335126 () Bool)

(assert (=> b!585684 (=> (not res!373399) (not e!335126))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585684 (= res!373399 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17569 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17569 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585685 () Bool)

(declare-fun res!373403 () Bool)

(assert (=> b!585685 (=> (not res!373403) (not e!335126))))

(assert (=> b!585685 (= res!373403 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17569 a!2986) index!984) (select (arr!17569 a!2986) j!136))) (not (= (select (arr!17569 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585686 () Bool)

(declare-fun res!373401 () Bool)

(declare-fun e!335127 () Bool)

(assert (=> b!585686 (=> (not res!373401) (not e!335127))))

(assert (=> b!585686 (= res!373401 (and (= (size!17933 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17933 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17933 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!373397 () Bool)

(assert (=> start!53748 (=> (not res!373397) (not e!335127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53748 (= res!373397 (validMask!0 mask!3053))))

(assert (=> start!53748 e!335127))

(assert (=> start!53748 true))

(declare-fun array_inv!13428 (array!36594) Bool)

(assert (=> start!53748 (array_inv!13428 a!2986)))

(declare-fun b!585687 () Bool)

(declare-fun res!373395 () Bool)

(assert (=> b!585687 (=> (not res!373395) (not e!335126))))

(assert (=> b!585687 (= res!373395 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17569 a!2986) j!136) a!2986 mask!3053) (Found!5965 j!136)))))

(declare-fun b!585688 () Bool)

(assert (=> b!585688 (= e!335126 e!335125)))

(declare-fun res!373404 () Bool)

(assert (=> b!585688 (=> (not res!373404) (not e!335125))))

(assert (=> b!585688 (= res!373404 (and (bvsge lt!265934 #b00000000000000000000000000000000) (bvslt lt!265934 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585688 (= lt!265934 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585689 () Bool)

(declare-fun res!373394 () Bool)

(assert (=> b!585689 (=> (not res!373394) (not e!335126))))

(declare-datatypes ((List!11517 0))(
  ( (Nil!11514) (Cons!11513 (h!12561 (_ BitVec 64)) (t!17737 List!11517)) )
))
(declare-fun arrayNoDuplicates!0 (array!36594 (_ BitVec 32) List!11517) Bool)

(assert (=> b!585689 (= res!373394 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11514))))

(declare-fun b!585690 () Bool)

(declare-fun res!373402 () Bool)

(assert (=> b!585690 (=> (not res!373402) (not e!335127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585690 (= res!373402 (validKeyInArray!0 (select (arr!17569 a!2986) j!136)))))

(declare-fun b!585691 () Bool)

(declare-fun res!373396 () Bool)

(assert (=> b!585691 (=> (not res!373396) (not e!335126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36594 (_ BitVec 32)) Bool)

(assert (=> b!585691 (= res!373396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585692 () Bool)

(declare-fun res!373398 () Bool)

(assert (=> b!585692 (=> (not res!373398) (not e!335127))))

(declare-fun arrayContainsKey!0 (array!36594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585692 (= res!373398 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585693 () Bool)

(declare-fun res!373400 () Bool)

(assert (=> b!585693 (=> (not res!373400) (not e!335127))))

(assert (=> b!585693 (= res!373400 (validKeyInArray!0 k0!1786))))

(declare-fun b!585694 () Bool)

(assert (=> b!585694 (= e!335127 e!335126)))

(declare-fun res!373405 () Bool)

(assert (=> b!585694 (=> (not res!373405) (not e!335126))))

(declare-fun lt!265935 () SeekEntryResult!5965)

(assert (=> b!585694 (= res!373405 (or (= lt!265935 (MissingZero!5965 i!1108)) (= lt!265935 (MissingVacant!5965 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36594 (_ BitVec 32)) SeekEntryResult!5965)

(assert (=> b!585694 (= lt!265935 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53748 res!373397) b!585686))

(assert (= (and b!585686 res!373401) b!585690))

(assert (= (and b!585690 res!373402) b!585693))

(assert (= (and b!585693 res!373400) b!585692))

(assert (= (and b!585692 res!373398) b!585694))

(assert (= (and b!585694 res!373405) b!585691))

(assert (= (and b!585691 res!373396) b!585689))

(assert (= (and b!585689 res!373394) b!585684))

(assert (= (and b!585684 res!373399) b!585687))

(assert (= (and b!585687 res!373395) b!585685))

(assert (= (and b!585685 res!373403) b!585688))

(assert (= (and b!585688 res!373404) b!585683))

(declare-fun m!564071 () Bool)

(assert (=> b!585684 m!564071))

(declare-fun m!564073 () Bool)

(assert (=> b!585684 m!564073))

(declare-fun m!564075 () Bool)

(assert (=> b!585684 m!564075))

(declare-fun m!564077 () Bool)

(assert (=> b!585685 m!564077))

(declare-fun m!564079 () Bool)

(assert (=> b!585685 m!564079))

(declare-fun m!564081 () Bool)

(assert (=> b!585689 m!564081))

(declare-fun m!564083 () Bool)

(assert (=> b!585688 m!564083))

(declare-fun m!564085 () Bool)

(assert (=> start!53748 m!564085))

(declare-fun m!564087 () Bool)

(assert (=> start!53748 m!564087))

(declare-fun m!564089 () Bool)

(assert (=> b!585692 m!564089))

(assert (=> b!585687 m!564079))

(assert (=> b!585687 m!564079))

(declare-fun m!564091 () Bool)

(assert (=> b!585687 m!564091))

(assert (=> b!585683 m!564079))

(assert (=> b!585683 m!564079))

(declare-fun m!564093 () Bool)

(assert (=> b!585683 m!564093))

(assert (=> b!585690 m!564079))

(assert (=> b!585690 m!564079))

(declare-fun m!564095 () Bool)

(assert (=> b!585690 m!564095))

(declare-fun m!564097 () Bool)

(assert (=> b!585694 m!564097))

(declare-fun m!564099 () Bool)

(assert (=> b!585693 m!564099))

(declare-fun m!564101 () Bool)

(assert (=> b!585691 m!564101))

(check-sat (not b!585694) (not b!585683) (not b!585688) (not start!53748) (not b!585693) (not b!585689) (not b!585690) (not b!585691) (not b!585692) (not b!585687))
(check-sat)
