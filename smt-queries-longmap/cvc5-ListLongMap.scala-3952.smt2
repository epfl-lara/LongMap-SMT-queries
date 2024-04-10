; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53722 () Bool)

(assert start!53722)

(declare-fun b!585877 () Bool)

(declare-fun e!335111 () Bool)

(declare-fun e!335110 () Bool)

(assert (=> b!585877 (= e!335111 e!335110)))

(declare-fun res!373703 () Bool)

(assert (=> b!585877 (=> (not res!373703) (not e!335110))))

(declare-datatypes ((SeekEntryResult!6026 0))(
  ( (MissingZero!6026 (index!26331 (_ BitVec 32))) (Found!6026 (index!26332 (_ BitVec 32))) (Intermediate!6026 (undefined!6838 Bool) (index!26333 (_ BitVec 32)) (x!55151 (_ BitVec 32))) (Undefined!6026) (MissingVacant!6026 (index!26334 (_ BitVec 32))) )
))
(declare-fun lt!265942 () SeekEntryResult!6026)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585877 (= res!373703 (or (= lt!265942 (MissingZero!6026 i!1108)) (= lt!265942 (MissingVacant!6026 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36623 0))(
  ( (array!36624 (arr!17586 (Array (_ BitVec 32) (_ BitVec 64))) (size!17950 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36623)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36623 (_ BitVec 32)) SeekEntryResult!6026)

(assert (=> b!585877 (= lt!265942 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!373701 () Bool)

(assert (=> start!53722 (=> (not res!373701) (not e!335111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53722 (= res!373701 (validMask!0 mask!3053))))

(assert (=> start!53722 e!335111))

(assert (=> start!53722 true))

(declare-fun array_inv!13382 (array!36623) Bool)

(assert (=> start!53722 (array_inv!13382 a!2986)))

(declare-fun b!585878 () Bool)

(assert (=> b!585878 (= e!335110 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!265941 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36623 (_ BitVec 32)) SeekEntryResult!6026)

(assert (=> b!585878 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265941 vacantSpotIndex!68 (select (arr!17586 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265941 vacantSpotIndex!68 (select (store (arr!17586 a!2986) i!1108 k!1786) j!136) (array!36624 (store (arr!17586 a!2986) i!1108 k!1786) (size!17950 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18172 0))(
  ( (Unit!18173) )
))
(declare-fun lt!265940 () Unit!18172)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36623 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18172)

(assert (=> b!585878 (= lt!265940 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265941 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585878 (= lt!265941 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585879 () Bool)

(declare-fun res!373697 () Bool)

(assert (=> b!585879 (=> (not res!373697) (not e!335110))))

(assert (=> b!585879 (= res!373697 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17586 a!2986) j!136) a!2986 mask!3053) (Found!6026 j!136)))))

(declare-fun b!585880 () Bool)

(declare-fun res!373695 () Bool)

(assert (=> b!585880 (=> (not res!373695) (not e!335110))))

(assert (=> b!585880 (= res!373695 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17586 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17586 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585881 () Bool)

(declare-fun res!373702 () Bool)

(assert (=> b!585881 (=> (not res!373702) (not e!335111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585881 (= res!373702 (validKeyInArray!0 k!1786))))

(declare-fun b!585882 () Bool)

(declare-fun res!373699 () Bool)

(assert (=> b!585882 (=> (not res!373699) (not e!335111))))

(assert (=> b!585882 (= res!373699 (and (= (size!17950 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17950 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17950 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585883 () Bool)

(declare-fun res!373698 () Bool)

(assert (=> b!585883 (=> (not res!373698) (not e!335111))))

(declare-fun arrayContainsKey!0 (array!36623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585883 (= res!373698 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585884 () Bool)

(declare-fun res!373694 () Bool)

(assert (=> b!585884 (=> (not res!373694) (not e!335110))))

(assert (=> b!585884 (= res!373694 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17586 a!2986) index!984) (select (arr!17586 a!2986) j!136))) (not (= (select (arr!17586 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585885 () Bool)

(declare-fun res!373696 () Bool)

(assert (=> b!585885 (=> (not res!373696) (not e!335110))))

(declare-datatypes ((List!11627 0))(
  ( (Nil!11624) (Cons!11623 (h!12668 (_ BitVec 64)) (t!17855 List!11627)) )
))
(declare-fun arrayNoDuplicates!0 (array!36623 (_ BitVec 32) List!11627) Bool)

(assert (=> b!585885 (= res!373696 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11624))))

(declare-fun b!585886 () Bool)

(declare-fun res!373693 () Bool)

(assert (=> b!585886 (=> (not res!373693) (not e!335110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36623 (_ BitVec 32)) Bool)

(assert (=> b!585886 (= res!373693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585887 () Bool)

(declare-fun res!373700 () Bool)

(assert (=> b!585887 (=> (not res!373700) (not e!335111))))

(assert (=> b!585887 (= res!373700 (validKeyInArray!0 (select (arr!17586 a!2986) j!136)))))

(assert (= (and start!53722 res!373701) b!585882))

(assert (= (and b!585882 res!373699) b!585887))

(assert (= (and b!585887 res!373700) b!585881))

(assert (= (and b!585881 res!373702) b!585883))

(assert (= (and b!585883 res!373698) b!585877))

(assert (= (and b!585877 res!373703) b!585886))

(assert (= (and b!585886 res!373693) b!585885))

(assert (= (and b!585885 res!373696) b!585880))

(assert (= (and b!585880 res!373695) b!585879))

(assert (= (and b!585879 res!373697) b!585884))

(assert (= (and b!585884 res!373694) b!585878))

(declare-fun m!564151 () Bool)

(assert (=> b!585887 m!564151))

(assert (=> b!585887 m!564151))

(declare-fun m!564153 () Bool)

(assert (=> b!585887 m!564153))

(declare-fun m!564155 () Bool)

(assert (=> b!585886 m!564155))

(declare-fun m!564157 () Bool)

(assert (=> b!585885 m!564157))

(assert (=> b!585879 m!564151))

(assert (=> b!585879 m!564151))

(declare-fun m!564159 () Bool)

(assert (=> b!585879 m!564159))

(declare-fun m!564161 () Bool)

(assert (=> b!585884 m!564161))

(assert (=> b!585884 m!564151))

(declare-fun m!564163 () Bool)

(assert (=> b!585880 m!564163))

(declare-fun m!564165 () Bool)

(assert (=> b!585880 m!564165))

(declare-fun m!564167 () Bool)

(assert (=> b!585880 m!564167))

(declare-fun m!564169 () Bool)

(assert (=> b!585878 m!564169))

(declare-fun m!564171 () Bool)

(assert (=> b!585878 m!564171))

(assert (=> b!585878 m!564151))

(assert (=> b!585878 m!564151))

(declare-fun m!564173 () Bool)

(assert (=> b!585878 m!564173))

(assert (=> b!585878 m!564165))

(assert (=> b!585878 m!564171))

(declare-fun m!564175 () Bool)

(assert (=> b!585878 m!564175))

(declare-fun m!564177 () Bool)

(assert (=> b!585878 m!564177))

(declare-fun m!564179 () Bool)

(assert (=> b!585883 m!564179))

(declare-fun m!564181 () Bool)

(assert (=> b!585881 m!564181))

(declare-fun m!564183 () Bool)

(assert (=> b!585877 m!564183))

(declare-fun m!564185 () Bool)

(assert (=> start!53722 m!564185))

(declare-fun m!564187 () Bool)

(assert (=> start!53722 m!564187))

(push 1)

