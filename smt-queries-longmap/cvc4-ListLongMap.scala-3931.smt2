; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53600 () Bool)

(assert start!53600)

(declare-fun b!583710 () Bool)

(declare-fun res!371526 () Bool)

(declare-fun e!334410 () Bool)

(assert (=> b!583710 (=> (not res!371526) (not e!334410))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36501 0))(
  ( (array!36502 (arr!17525 (Array (_ BitVec 32) (_ BitVec 64))) (size!17889 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36501)

(assert (=> b!583710 (= res!371526 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17525 a!2986) index!984) (select (arr!17525 a!2986) j!136))) (not (= (select (arr!17525 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583711 () Bool)

(declare-fun res!371531 () Bool)

(assert (=> b!583711 (=> (not res!371531) (not e!334410))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!583711 (= res!371531 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17525 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17525 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!371528 () Bool)

(declare-fun e!334409 () Bool)

(assert (=> start!53600 (=> (not res!371528) (not e!334409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53600 (= res!371528 (validMask!0 mask!3053))))

(assert (=> start!53600 e!334409))

(assert (=> start!53600 true))

(declare-fun array_inv!13321 (array!36501) Bool)

(assert (=> start!53600 (array_inv!13321 a!2986)))

(declare-fun b!583712 () Bool)

(declare-fun e!334407 () Bool)

(assert (=> b!583712 (= e!334410 e!334407)))

(declare-fun res!371532 () Bool)

(assert (=> b!583712 (=> (not res!371532) (not e!334407))))

(declare-fun lt!265393 () (_ BitVec 32))

(assert (=> b!583712 (= res!371532 (and (bvsge lt!265393 #b00000000000000000000000000000000) (bvslt lt!265393 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583712 (= lt!265393 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583713 () Bool)

(declare-fun res!371529 () Bool)

(assert (=> b!583713 (=> (not res!371529) (not e!334409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583713 (= res!371529 (validKeyInArray!0 k!1786))))

(declare-fun b!583714 () Bool)

(declare-fun res!371527 () Bool)

(assert (=> b!583714 (=> (not res!371527) (not e!334409))))

(declare-fun arrayContainsKey!0 (array!36501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583714 (= res!371527 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583715 () Bool)

(declare-fun res!371530 () Bool)

(assert (=> b!583715 (=> (not res!371530) (not e!334409))))

(assert (=> b!583715 (= res!371530 (and (= (size!17889 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17889 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17889 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583716 () Bool)

(assert (=> b!583716 (= e!334409 e!334410)))

(declare-fun res!371537 () Bool)

(assert (=> b!583716 (=> (not res!371537) (not e!334410))))

(declare-datatypes ((SeekEntryResult!5965 0))(
  ( (MissingZero!5965 (index!26087 (_ BitVec 32))) (Found!5965 (index!26088 (_ BitVec 32))) (Intermediate!5965 (undefined!6777 Bool) (index!26089 (_ BitVec 32)) (x!54922 (_ BitVec 32))) (Undefined!5965) (MissingVacant!5965 (index!26090 (_ BitVec 32))) )
))
(declare-fun lt!265391 () SeekEntryResult!5965)

(assert (=> b!583716 (= res!371537 (or (= lt!265391 (MissingZero!5965 i!1108)) (= lt!265391 (MissingVacant!5965 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36501 (_ BitVec 32)) SeekEntryResult!5965)

(assert (=> b!583716 (= lt!265391 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583717 () Bool)

(assert (=> b!583717 (= e!334407 false)))

(declare-fun lt!265392 () SeekEntryResult!5965)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36501 (_ BitVec 32)) SeekEntryResult!5965)

(assert (=> b!583717 (= lt!265392 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265393 vacantSpotIndex!68 (select (arr!17525 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583718 () Bool)

(declare-fun res!371536 () Bool)

(assert (=> b!583718 (=> (not res!371536) (not e!334410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36501 (_ BitVec 32)) Bool)

(assert (=> b!583718 (= res!371536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583719 () Bool)

(declare-fun res!371534 () Bool)

(assert (=> b!583719 (=> (not res!371534) (not e!334409))))

(assert (=> b!583719 (= res!371534 (validKeyInArray!0 (select (arr!17525 a!2986) j!136)))))

(declare-fun b!583720 () Bool)

(declare-fun res!371535 () Bool)

(assert (=> b!583720 (=> (not res!371535) (not e!334410))))

(assert (=> b!583720 (= res!371535 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17525 a!2986) j!136) a!2986 mask!3053) (Found!5965 j!136)))))

(declare-fun b!583721 () Bool)

(declare-fun res!371533 () Bool)

(assert (=> b!583721 (=> (not res!371533) (not e!334410))))

(declare-datatypes ((List!11566 0))(
  ( (Nil!11563) (Cons!11562 (h!12607 (_ BitVec 64)) (t!17794 List!11566)) )
))
(declare-fun arrayNoDuplicates!0 (array!36501 (_ BitVec 32) List!11566) Bool)

(assert (=> b!583721 (= res!371533 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11563))))

(assert (= (and start!53600 res!371528) b!583715))

(assert (= (and b!583715 res!371530) b!583719))

(assert (= (and b!583719 res!371534) b!583713))

(assert (= (and b!583713 res!371529) b!583714))

(assert (= (and b!583714 res!371527) b!583716))

(assert (= (and b!583716 res!371537) b!583718))

(assert (= (and b!583718 res!371536) b!583721))

(assert (= (and b!583721 res!371533) b!583711))

(assert (= (and b!583711 res!371531) b!583720))

(assert (= (and b!583720 res!371535) b!583710))

(assert (= (and b!583710 res!371526) b!583712))

(assert (= (and b!583712 res!371532) b!583717))

(declare-fun m!562145 () Bool)

(assert (=> b!583716 m!562145))

(declare-fun m!562147 () Bool)

(assert (=> b!583721 m!562147))

(declare-fun m!562149 () Bool)

(assert (=> b!583720 m!562149))

(assert (=> b!583720 m!562149))

(declare-fun m!562151 () Bool)

(assert (=> b!583720 m!562151))

(declare-fun m!562153 () Bool)

(assert (=> b!583710 m!562153))

(assert (=> b!583710 m!562149))

(declare-fun m!562155 () Bool)

(assert (=> b!583711 m!562155))

(declare-fun m!562157 () Bool)

(assert (=> b!583711 m!562157))

(declare-fun m!562159 () Bool)

(assert (=> b!583711 m!562159))

(declare-fun m!562161 () Bool)

(assert (=> b!583718 m!562161))

(declare-fun m!562163 () Bool)

(assert (=> b!583713 m!562163))

(declare-fun m!562165 () Bool)

(assert (=> b!583712 m!562165))

(assert (=> b!583719 m!562149))

(assert (=> b!583719 m!562149))

(declare-fun m!562167 () Bool)

(assert (=> b!583719 m!562167))

(declare-fun m!562169 () Bool)

(assert (=> start!53600 m!562169))

(declare-fun m!562171 () Bool)

(assert (=> start!53600 m!562171))

(assert (=> b!583717 m!562149))

(assert (=> b!583717 m!562149))

(declare-fun m!562173 () Bool)

(assert (=> b!583717 m!562173))

(declare-fun m!562175 () Bool)

(assert (=> b!583714 m!562175))

(push 1)

(assert (not start!53600))

(assert (not b!583719))

(assert (not b!583714))

(assert (not b!583720))

(assert (not b!583716))

(assert (not b!583717))

(assert (not b!583718))

