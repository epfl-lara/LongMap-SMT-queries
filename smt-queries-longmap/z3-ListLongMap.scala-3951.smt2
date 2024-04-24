; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53766 () Bool)

(assert start!53766)

(declare-fun b!585987 () Bool)

(declare-fun res!373702 () Bool)

(declare-fun e!335214 () Bool)

(assert (=> b!585987 (=> (not res!373702) (not e!335214))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36612 0))(
  ( (array!36613 (arr!17578 (Array (_ BitVec 32) (_ BitVec 64))) (size!17942 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36612)

(assert (=> b!585987 (= res!373702 (and (= (size!17942 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17942 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17942 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585988 () Bool)

(declare-fun res!373706 () Bool)

(declare-fun e!335212 () Bool)

(assert (=> b!585988 (=> (not res!373706) (not e!335212))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5974 0))(
  ( (MissingZero!5974 (index!26123 (_ BitVec 32))) (Found!5974 (index!26124 (_ BitVec 32))) (Intermediate!5974 (undefined!6786 Bool) (index!26125 (_ BitVec 32)) (x!55094 (_ BitVec 32))) (Undefined!5974) (MissingVacant!5974 (index!26126 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36612 (_ BitVec 32)) SeekEntryResult!5974)

(assert (=> b!585988 (= res!373706 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17578 a!2986) j!136) a!2986 mask!3053) (Found!5974 j!136)))))

(declare-fun b!585989 () Bool)

(declare-fun res!373701 () Bool)

(assert (=> b!585989 (=> (not res!373701) (not e!335212))))

(assert (=> b!585989 (= res!373701 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17578 a!2986) index!984) (select (arr!17578 a!2986) j!136))) (not (= (select (arr!17578 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585990 () Bool)

(declare-fun res!373708 () Bool)

(assert (=> b!585990 (=> (not res!373708) (not e!335214))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585990 (= res!373708 (validKeyInArray!0 k0!1786))))

(declare-fun b!585991 () Bool)

(declare-fun res!373705 () Bool)

(assert (=> b!585991 (=> (not res!373705) (not e!335212))))

(assert (=> b!585991 (= res!373705 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17578 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17578 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585992 () Bool)

(assert (=> b!585992 (= e!335212 (not true))))

(declare-fun lt!266017 () (_ BitVec 32))

(assert (=> b!585992 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266017 vacantSpotIndex!68 (select (arr!17578 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266017 vacantSpotIndex!68 (select (store (arr!17578 a!2986) i!1108 k0!1786) j!136) (array!36613 (store (arr!17578 a!2986) i!1108 k0!1786) (size!17942 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18145 0))(
  ( (Unit!18146) )
))
(declare-fun lt!266016 () Unit!18145)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36612 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18145)

(assert (=> b!585992 (= lt!266016 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266017 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585992 (= lt!266017 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585993 () Bool)

(declare-fun res!373698 () Bool)

(assert (=> b!585993 (=> (not res!373698) (not e!335212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36612 (_ BitVec 32)) Bool)

(assert (=> b!585993 (= res!373698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585994 () Bool)

(declare-fun res!373699 () Bool)

(assert (=> b!585994 (=> (not res!373699) (not e!335214))))

(declare-fun arrayContainsKey!0 (array!36612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585994 (= res!373699 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!373707 () Bool)

(assert (=> start!53766 (=> (not res!373707) (not e!335214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53766 (= res!373707 (validMask!0 mask!3053))))

(assert (=> start!53766 e!335214))

(assert (=> start!53766 true))

(declare-fun array_inv!13437 (array!36612) Bool)

(assert (=> start!53766 (array_inv!13437 a!2986)))

(declare-fun b!585995 () Bool)

(declare-fun res!373704 () Bool)

(assert (=> b!585995 (=> (not res!373704) (not e!335212))))

(declare-datatypes ((List!11526 0))(
  ( (Nil!11523) (Cons!11522 (h!12570 (_ BitVec 64)) (t!17746 List!11526)) )
))
(declare-fun arrayNoDuplicates!0 (array!36612 (_ BitVec 32) List!11526) Bool)

(assert (=> b!585995 (= res!373704 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11523))))

(declare-fun b!585996 () Bool)

(declare-fun res!373703 () Bool)

(assert (=> b!585996 (=> (not res!373703) (not e!335214))))

(assert (=> b!585996 (= res!373703 (validKeyInArray!0 (select (arr!17578 a!2986) j!136)))))

(declare-fun b!585997 () Bool)

(assert (=> b!585997 (= e!335214 e!335212)))

(declare-fun res!373700 () Bool)

(assert (=> b!585997 (=> (not res!373700) (not e!335212))))

(declare-fun lt!266015 () SeekEntryResult!5974)

(assert (=> b!585997 (= res!373700 (or (= lt!266015 (MissingZero!5974 i!1108)) (= lt!266015 (MissingVacant!5974 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36612 (_ BitVec 32)) SeekEntryResult!5974)

(assert (=> b!585997 (= lt!266015 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53766 res!373707) b!585987))

(assert (= (and b!585987 res!373702) b!585996))

(assert (= (and b!585996 res!373703) b!585990))

(assert (= (and b!585990 res!373708) b!585994))

(assert (= (and b!585994 res!373699) b!585997))

(assert (= (and b!585997 res!373700) b!585993))

(assert (= (and b!585993 res!373698) b!585995))

(assert (= (and b!585995 res!373704) b!585991))

(assert (= (and b!585991 res!373705) b!585988))

(assert (= (and b!585988 res!373706) b!585989))

(assert (= (and b!585989 res!373701) b!585992))

(declare-fun m!564395 () Bool)

(assert (=> b!585996 m!564395))

(assert (=> b!585996 m!564395))

(declare-fun m!564397 () Bool)

(assert (=> b!585996 m!564397))

(declare-fun m!564399 () Bool)

(assert (=> b!585997 m!564399))

(declare-fun m!564401 () Bool)

(assert (=> b!585990 m!564401))

(declare-fun m!564403 () Bool)

(assert (=> b!585989 m!564403))

(assert (=> b!585989 m!564395))

(declare-fun m!564405 () Bool)

(assert (=> b!585995 m!564405))

(assert (=> b!585992 m!564395))

(declare-fun m!564407 () Bool)

(assert (=> b!585992 m!564407))

(declare-fun m!564409 () Bool)

(assert (=> b!585992 m!564409))

(declare-fun m!564411 () Bool)

(assert (=> b!585992 m!564411))

(assert (=> b!585992 m!564395))

(declare-fun m!564413 () Bool)

(assert (=> b!585992 m!564413))

(declare-fun m!564415 () Bool)

(assert (=> b!585992 m!564415))

(assert (=> b!585992 m!564411))

(declare-fun m!564417 () Bool)

(assert (=> b!585992 m!564417))

(declare-fun m!564419 () Bool)

(assert (=> start!53766 m!564419))

(declare-fun m!564421 () Bool)

(assert (=> start!53766 m!564421))

(declare-fun m!564423 () Bool)

(assert (=> b!585994 m!564423))

(declare-fun m!564425 () Bool)

(assert (=> b!585991 m!564425))

(assert (=> b!585991 m!564413))

(declare-fun m!564427 () Bool)

(assert (=> b!585991 m!564427))

(declare-fun m!564429 () Bool)

(assert (=> b!585993 m!564429))

(assert (=> b!585988 m!564395))

(assert (=> b!585988 m!564395))

(declare-fun m!564431 () Bool)

(assert (=> b!585988 m!564431))

(check-sat (not start!53766) (not b!585997) (not b!585996) (not b!585993) (not b!585992) (not b!585994) (not b!585988) (not b!585995) (not b!585990))
(check-sat)
