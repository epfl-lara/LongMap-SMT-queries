; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53628 () Bool)

(assert start!53628)

(declare-fun res!372037 () Bool)

(declare-fun e!334577 () Bool)

(assert (=> start!53628 (=> (not res!372037) (not e!334577))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53628 (= res!372037 (validMask!0 mask!3053))))

(assert (=> start!53628 e!334577))

(assert (=> start!53628 true))

(declare-datatypes ((array!36529 0))(
  ( (array!36530 (arr!17539 (Array (_ BitVec 32) (_ BitVec 64))) (size!17903 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36529)

(declare-fun array_inv!13335 (array!36529) Bool)

(assert (=> start!53628 (array_inv!13335 a!2986)))

(declare-fun b!584214 () Bool)

(declare-fun res!372035 () Bool)

(declare-fun e!334576 () Bool)

(assert (=> b!584214 (=> (not res!372035) (not e!334576))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584214 (= res!372035 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17539 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17539 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584215 () Bool)

(declare-fun res!372034 () Bool)

(assert (=> b!584215 (=> (not res!372034) (not e!334576))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5979 0))(
  ( (MissingZero!5979 (index!26143 (_ BitVec 32))) (Found!5979 (index!26144 (_ BitVec 32))) (Intermediate!5979 (undefined!6791 Bool) (index!26145 (_ BitVec 32)) (x!54976 (_ BitVec 32))) (Undefined!5979) (MissingVacant!5979 (index!26146 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36529 (_ BitVec 32)) SeekEntryResult!5979)

(assert (=> b!584215 (= res!372034 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17539 a!2986) j!136) a!2986 mask!3053) (Found!5979 j!136)))))

(declare-fun b!584216 () Bool)

(declare-fun res!372030 () Bool)

(assert (=> b!584216 (=> (not res!372030) (not e!334577))))

(declare-fun arrayContainsKey!0 (array!36529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584216 (= res!372030 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584217 () Bool)

(declare-fun res!372031 () Bool)

(assert (=> b!584217 (=> (not res!372031) (not e!334576))))

(declare-datatypes ((List!11580 0))(
  ( (Nil!11577) (Cons!11576 (h!12621 (_ BitVec 64)) (t!17808 List!11580)) )
))
(declare-fun arrayNoDuplicates!0 (array!36529 (_ BitVec 32) List!11580) Bool)

(assert (=> b!584217 (= res!372031 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11577))))

(declare-fun b!584218 () Bool)

(declare-fun e!334575 () Bool)

(assert (=> b!584218 (= e!334575 false)))

(declare-fun lt!265517 () (_ BitVec 32))

(declare-fun lt!265518 () SeekEntryResult!5979)

(assert (=> b!584218 (= lt!265518 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265517 vacantSpotIndex!68 (select (arr!17539 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584219 () Bool)

(assert (=> b!584219 (= e!334576 e!334575)))

(declare-fun res!372039 () Bool)

(assert (=> b!584219 (=> (not res!372039) (not e!334575))))

(assert (=> b!584219 (= res!372039 (and (bvsge lt!265517 #b00000000000000000000000000000000) (bvslt lt!265517 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584219 (= lt!265517 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584220 () Bool)

(declare-fun res!372041 () Bool)

(assert (=> b!584220 (=> (not res!372041) (not e!334577))))

(assert (=> b!584220 (= res!372041 (and (= (size!17903 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17903 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17903 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584221 () Bool)

(assert (=> b!584221 (= e!334577 e!334576)))

(declare-fun res!372032 () Bool)

(assert (=> b!584221 (=> (not res!372032) (not e!334576))))

(declare-fun lt!265519 () SeekEntryResult!5979)

(assert (=> b!584221 (= res!372032 (or (= lt!265519 (MissingZero!5979 i!1108)) (= lt!265519 (MissingVacant!5979 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36529 (_ BitVec 32)) SeekEntryResult!5979)

(assert (=> b!584221 (= lt!265519 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584222 () Bool)

(declare-fun res!372040 () Bool)

(assert (=> b!584222 (=> (not res!372040) (not e!334576))))

(assert (=> b!584222 (= res!372040 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17539 a!2986) index!984) (select (arr!17539 a!2986) j!136))) (not (= (select (arr!17539 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584223 () Bool)

(declare-fun res!372033 () Bool)

(assert (=> b!584223 (=> (not res!372033) (not e!334577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584223 (= res!372033 (validKeyInArray!0 k0!1786))))

(declare-fun b!584224 () Bool)

(declare-fun res!372038 () Bool)

(assert (=> b!584224 (=> (not res!372038) (not e!334576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36529 (_ BitVec 32)) Bool)

(assert (=> b!584224 (= res!372038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584225 () Bool)

(declare-fun res!372036 () Bool)

(assert (=> b!584225 (=> (not res!372036) (not e!334577))))

(assert (=> b!584225 (= res!372036 (validKeyInArray!0 (select (arr!17539 a!2986) j!136)))))

(assert (= (and start!53628 res!372037) b!584220))

(assert (= (and b!584220 res!372041) b!584225))

(assert (= (and b!584225 res!372036) b!584223))

(assert (= (and b!584223 res!372033) b!584216))

(assert (= (and b!584216 res!372030) b!584221))

(assert (= (and b!584221 res!372032) b!584224))

(assert (= (and b!584224 res!372038) b!584217))

(assert (= (and b!584217 res!372031) b!584214))

(assert (= (and b!584214 res!372035) b!584215))

(assert (= (and b!584215 res!372034) b!584222))

(assert (= (and b!584222 res!372040) b!584219))

(assert (= (and b!584219 res!372039) b!584218))

(declare-fun m!562593 () Bool)

(assert (=> b!584222 m!562593))

(declare-fun m!562595 () Bool)

(assert (=> b!584222 m!562595))

(declare-fun m!562597 () Bool)

(assert (=> b!584221 m!562597))

(declare-fun m!562599 () Bool)

(assert (=> start!53628 m!562599))

(declare-fun m!562601 () Bool)

(assert (=> start!53628 m!562601))

(declare-fun m!562603 () Bool)

(assert (=> b!584216 m!562603))

(declare-fun m!562605 () Bool)

(assert (=> b!584214 m!562605))

(declare-fun m!562607 () Bool)

(assert (=> b!584214 m!562607))

(declare-fun m!562609 () Bool)

(assert (=> b!584214 m!562609))

(declare-fun m!562611 () Bool)

(assert (=> b!584217 m!562611))

(declare-fun m!562613 () Bool)

(assert (=> b!584223 m!562613))

(declare-fun m!562615 () Bool)

(assert (=> b!584224 m!562615))

(assert (=> b!584218 m!562595))

(assert (=> b!584218 m!562595))

(declare-fun m!562617 () Bool)

(assert (=> b!584218 m!562617))

(assert (=> b!584215 m!562595))

(assert (=> b!584215 m!562595))

(declare-fun m!562619 () Bool)

(assert (=> b!584215 m!562619))

(declare-fun m!562621 () Bool)

(assert (=> b!584219 m!562621))

(assert (=> b!584225 m!562595))

(assert (=> b!584225 m!562595))

(declare-fun m!562623 () Bool)

(assert (=> b!584225 m!562623))

(check-sat (not b!584225) (not start!53628) (not b!584217) (not b!584221) (not b!584219) (not b!584224) (not b!584215) (not b!584223) (not b!584216) (not b!584218))
