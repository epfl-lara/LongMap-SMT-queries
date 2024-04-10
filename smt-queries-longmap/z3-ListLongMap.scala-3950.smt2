; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53712 () Bool)

(assert start!53712)

(declare-fun b!585712 () Bool)

(declare-fun e!335065 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!585712 (= e!335065 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!265897 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36613 0))(
  ( (array!36614 (arr!17581 (Array (_ BitVec 32) (_ BitVec 64))) (size!17945 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36613)

(declare-datatypes ((SeekEntryResult!6021 0))(
  ( (MissingZero!6021 (index!26311 (_ BitVec 32))) (Found!6021 (index!26312 (_ BitVec 32))) (Intermediate!6021 (undefined!6833 Bool) (index!26313 (_ BitVec 32)) (x!55130 (_ BitVec 32))) (Undefined!6021) (MissingVacant!6021 (index!26314 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36613 (_ BitVec 32)) SeekEntryResult!6021)

(assert (=> b!585712 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265897 vacantSpotIndex!68 (select (arr!17581 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265897 vacantSpotIndex!68 (select (store (arr!17581 a!2986) i!1108 k0!1786) j!136) (array!36614 (store (arr!17581 a!2986) i!1108 k0!1786) (size!17945 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18162 0))(
  ( (Unit!18163) )
))
(declare-fun lt!265896 () Unit!18162)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36613 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18162)

(assert (=> b!585712 (= lt!265896 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265897 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585712 (= lt!265897 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585713 () Bool)

(declare-fun e!335067 () Bool)

(assert (=> b!585713 (= e!335067 e!335065)))

(declare-fun res!373538 () Bool)

(assert (=> b!585713 (=> (not res!373538) (not e!335065))))

(declare-fun lt!265895 () SeekEntryResult!6021)

(assert (=> b!585713 (= res!373538 (or (= lt!265895 (MissingZero!6021 i!1108)) (= lt!265895 (MissingVacant!6021 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36613 (_ BitVec 32)) SeekEntryResult!6021)

(assert (=> b!585713 (= lt!265895 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585714 () Bool)

(declare-fun res!373535 () Bool)

(assert (=> b!585714 (=> (not res!373535) (not e!335065))))

(assert (=> b!585714 (= res!373535 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17581 a!2986) index!984) (select (arr!17581 a!2986) j!136))) (not (= (select (arr!17581 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373533 () Bool)

(assert (=> start!53712 (=> (not res!373533) (not e!335067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53712 (= res!373533 (validMask!0 mask!3053))))

(assert (=> start!53712 e!335067))

(assert (=> start!53712 true))

(declare-fun array_inv!13377 (array!36613) Bool)

(assert (=> start!53712 (array_inv!13377 a!2986)))

(declare-fun b!585715 () Bool)

(declare-fun res!373536 () Bool)

(assert (=> b!585715 (=> (not res!373536) (not e!335067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585715 (= res!373536 (validKeyInArray!0 k0!1786))))

(declare-fun b!585716 () Bool)

(declare-fun res!373528 () Bool)

(assert (=> b!585716 (=> (not res!373528) (not e!335065))))

(assert (=> b!585716 (= res!373528 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17581 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17581 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585717 () Bool)

(declare-fun res!373537 () Bool)

(assert (=> b!585717 (=> (not res!373537) (not e!335067))))

(declare-fun arrayContainsKey!0 (array!36613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585717 (= res!373537 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585718 () Bool)

(declare-fun res!373532 () Bool)

(assert (=> b!585718 (=> (not res!373532) (not e!335065))))

(declare-datatypes ((List!11622 0))(
  ( (Nil!11619) (Cons!11618 (h!12663 (_ BitVec 64)) (t!17850 List!11622)) )
))
(declare-fun arrayNoDuplicates!0 (array!36613 (_ BitVec 32) List!11622) Bool)

(assert (=> b!585718 (= res!373532 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11619))))

(declare-fun b!585719 () Bool)

(declare-fun res!373530 () Bool)

(assert (=> b!585719 (=> (not res!373530) (not e!335067))))

(assert (=> b!585719 (= res!373530 (validKeyInArray!0 (select (arr!17581 a!2986) j!136)))))

(declare-fun b!585720 () Bool)

(declare-fun res!373531 () Bool)

(assert (=> b!585720 (=> (not res!373531) (not e!335067))))

(assert (=> b!585720 (= res!373531 (and (= (size!17945 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17945 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17945 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585721 () Bool)

(declare-fun res!373534 () Bool)

(assert (=> b!585721 (=> (not res!373534) (not e!335065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36613 (_ BitVec 32)) Bool)

(assert (=> b!585721 (= res!373534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585722 () Bool)

(declare-fun res!373529 () Bool)

(assert (=> b!585722 (=> (not res!373529) (not e!335065))))

(assert (=> b!585722 (= res!373529 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17581 a!2986) j!136) a!2986 mask!3053) (Found!6021 j!136)))))

(assert (= (and start!53712 res!373533) b!585720))

(assert (= (and b!585720 res!373531) b!585719))

(assert (= (and b!585719 res!373530) b!585715))

(assert (= (and b!585715 res!373536) b!585717))

(assert (= (and b!585717 res!373537) b!585713))

(assert (= (and b!585713 res!373538) b!585721))

(assert (= (and b!585721 res!373534) b!585718))

(assert (= (and b!585718 res!373532) b!585716))

(assert (= (and b!585716 res!373528) b!585722))

(assert (= (and b!585722 res!373529) b!585714))

(assert (= (and b!585714 res!373535) b!585712))

(declare-fun m!563961 () Bool)

(assert (=> b!585717 m!563961))

(declare-fun m!563963 () Bool)

(assert (=> b!585713 m!563963))

(declare-fun m!563965 () Bool)

(assert (=> b!585712 m!563965))

(declare-fun m!563967 () Bool)

(assert (=> b!585712 m!563967))

(declare-fun m!563969 () Bool)

(assert (=> b!585712 m!563969))

(declare-fun m!563971 () Bool)

(assert (=> b!585712 m!563971))

(assert (=> b!585712 m!563969))

(declare-fun m!563973 () Bool)

(assert (=> b!585712 m!563973))

(declare-fun m!563975 () Bool)

(assert (=> b!585712 m!563975))

(assert (=> b!585712 m!563967))

(declare-fun m!563977 () Bool)

(assert (=> b!585712 m!563977))

(assert (=> b!585719 m!563969))

(assert (=> b!585719 m!563969))

(declare-fun m!563979 () Bool)

(assert (=> b!585719 m!563979))

(declare-fun m!563981 () Bool)

(assert (=> b!585721 m!563981))

(declare-fun m!563983 () Bool)

(assert (=> b!585715 m!563983))

(declare-fun m!563985 () Bool)

(assert (=> start!53712 m!563985))

(declare-fun m!563987 () Bool)

(assert (=> start!53712 m!563987))

(declare-fun m!563989 () Bool)

(assert (=> b!585714 m!563989))

(assert (=> b!585714 m!563969))

(declare-fun m!563991 () Bool)

(assert (=> b!585718 m!563991))

(assert (=> b!585722 m!563969))

(assert (=> b!585722 m!563969))

(declare-fun m!563993 () Bool)

(assert (=> b!585722 m!563993))

(declare-fun m!563995 () Bool)

(assert (=> b!585716 m!563995))

(assert (=> b!585716 m!563971))

(declare-fun m!563997 () Bool)

(assert (=> b!585716 m!563997))

(check-sat (not b!585717) (not b!585721) (not b!585715) (not b!585722) (not b!585712) (not start!53712) (not b!585718) (not b!585713) (not b!585719))
(check-sat)
