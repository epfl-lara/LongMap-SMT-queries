; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54906 () Bool)

(assert start!54906)

(declare-fun b!601170 () Bool)

(declare-fun e!343732 () Bool)

(declare-fun e!343739 () Bool)

(assert (=> b!601170 (= e!343732 e!343739)))

(declare-fun res!385988 () Bool)

(assert (=> b!601170 (=> (not res!385988) (not e!343739))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37141 0))(
  ( (array!37142 (arr!17830 (Array (_ BitVec 32) (_ BitVec 64))) (size!18194 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37141)

(assert (=> b!601170 (= res!385988 (= (select (store (arr!17830 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!273611 () array!37141)

(assert (=> b!601170 (= lt!273611 (array!37142 (store (arr!17830 a!2986) i!1108 k0!1786) (size!18194 a!2986)))))

(declare-fun b!601171 () Bool)

(declare-fun res!385993 () Bool)

(assert (=> b!601171 (=> (not res!385993) (not e!343732))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37141 (_ BitVec 32)) Bool)

(assert (=> b!601171 (= res!385993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601172 () Bool)

(declare-datatypes ((Unit!19000 0))(
  ( (Unit!19001) )
))
(declare-fun e!343731 () Unit!19000)

(declare-fun Unit!19002 () Unit!19000)

(assert (=> b!601172 (= e!343731 Unit!19002)))

(assert (=> b!601172 false))

(declare-fun b!601173 () Bool)

(declare-fun res!385992 () Bool)

(declare-fun e!343733 () Bool)

(assert (=> b!601173 (=> (not res!385992) (not e!343733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601173 (= res!385992 (validKeyInArray!0 k0!1786))))

(declare-fun b!601174 () Bool)

(declare-fun res!385990 () Bool)

(assert (=> b!601174 (=> (not res!385990) (not e!343733))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!601174 (= res!385990 (validKeyInArray!0 (select (arr!17830 a!2986) j!136)))))

(declare-fun b!601175 () Bool)

(declare-fun e!343738 () Unit!19000)

(declare-fun Unit!19003 () Unit!19000)

(assert (=> b!601175 (= e!343738 Unit!19003)))

(declare-fun lt!273618 () Unit!19000)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37141 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19000)

(assert (=> b!601175 (= lt!273618 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273611 (select (arr!17830 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601175 (arrayContainsKey!0 lt!273611 (select (arr!17830 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273615 () Unit!19000)

(declare-datatypes ((List!11871 0))(
  ( (Nil!11868) (Cons!11867 (h!12912 (_ BitVec 64)) (t!18099 List!11871)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37141 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11871) Unit!19000)

(assert (=> b!601175 (= lt!273615 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11868))))

(declare-fun arrayNoDuplicates!0 (array!37141 (_ BitVec 32) List!11871) Bool)

(assert (=> b!601175 (arrayNoDuplicates!0 lt!273611 #b00000000000000000000000000000000 Nil!11868)))

(declare-fun lt!273616 () Unit!19000)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37141 (_ BitVec 32) (_ BitVec 32)) Unit!19000)

(assert (=> b!601175 (= lt!273616 (lemmaNoDuplicateFromThenFromBigger!0 lt!273611 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601175 (arrayNoDuplicates!0 lt!273611 j!136 Nil!11868)))

(declare-fun lt!273614 () Unit!19000)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37141 (_ BitVec 64) (_ BitVec 32) List!11871) Unit!19000)

(assert (=> b!601175 (= lt!273614 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273611 (select (arr!17830 a!2986) j!136) j!136 Nil!11868))))

(assert (=> b!601175 false))

(declare-fun b!601177 () Bool)

(declare-fun e!343737 () Bool)

(declare-datatypes ((SeekEntryResult!6270 0))(
  ( (MissingZero!6270 (index!27337 (_ BitVec 32))) (Found!6270 (index!27338 (_ BitVec 32))) (Intermediate!6270 (undefined!7082 Bool) (index!27339 (_ BitVec 32)) (x!56133 (_ BitVec 32))) (Undefined!6270) (MissingVacant!6270 (index!27340 (_ BitVec 32))) )
))
(declare-fun lt!273619 () SeekEntryResult!6270)

(declare-fun lt!273612 () SeekEntryResult!6270)

(assert (=> b!601177 (= e!343737 (= lt!273619 lt!273612))))

(declare-fun b!601178 () Bool)

(declare-fun Unit!19004 () Unit!19000)

(assert (=> b!601178 (= e!343738 Unit!19004)))

(declare-fun b!601179 () Bool)

(declare-fun e!343736 () Bool)

(declare-fun e!343729 () Bool)

(assert (=> b!601179 (= e!343736 e!343729)))

(declare-fun res!385981 () Bool)

(assert (=> b!601179 (=> res!385981 e!343729)))

(declare-fun lt!273608 () (_ BitVec 64))

(declare-fun lt!273617 () (_ BitVec 64))

(assert (=> b!601179 (= res!385981 (or (not (= (select (arr!17830 a!2986) j!136) lt!273617)) (not (= (select (arr!17830 a!2986) j!136) lt!273608)) (bvsge j!136 index!984)))))

(declare-fun b!601180 () Bool)

(declare-fun res!385982 () Bool)

(assert (=> b!601180 (=> (not res!385982) (not e!343732))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!601180 (= res!385982 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17830 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601181 () Bool)

(assert (=> b!601181 (= e!343733 e!343732)))

(declare-fun res!385978 () Bool)

(assert (=> b!601181 (=> (not res!385978) (not e!343732))))

(declare-fun lt!273607 () SeekEntryResult!6270)

(assert (=> b!601181 (= res!385978 (or (= lt!273607 (MissingZero!6270 i!1108)) (= lt!273607 (MissingVacant!6270 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37141 (_ BitVec 32)) SeekEntryResult!6270)

(assert (=> b!601181 (= lt!273607 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!601182 () Bool)

(declare-fun e!343735 () Bool)

(declare-fun e!343740 () Bool)

(assert (=> b!601182 (= e!343735 e!343740)))

(declare-fun res!385991 () Bool)

(assert (=> b!601182 (=> res!385991 e!343740)))

(assert (=> b!601182 (= res!385991 (or (not (= (select (arr!17830 a!2986) j!136) lt!273617)) (not (= (select (arr!17830 a!2986) j!136) lt!273608))))))

(assert (=> b!601182 e!343736))

(declare-fun res!385989 () Bool)

(assert (=> b!601182 (=> (not res!385989) (not e!343736))))

(assert (=> b!601182 (= res!385989 (= lt!273608 (select (arr!17830 a!2986) j!136)))))

(assert (=> b!601182 (= lt!273608 (select (store (arr!17830 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!385984 () Bool)

(assert (=> start!54906 (=> (not res!385984) (not e!343733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54906 (= res!385984 (validMask!0 mask!3053))))

(assert (=> start!54906 e!343733))

(assert (=> start!54906 true))

(declare-fun array_inv!13626 (array!37141) Bool)

(assert (=> start!54906 (array_inv!13626 a!2986)))

(declare-fun b!601176 () Bool)

(declare-fun res!385980 () Bool)

(assert (=> b!601176 (=> (not res!385980) (not e!343732))))

(assert (=> b!601176 (= res!385980 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11868))))

(declare-fun b!601183 () Bool)

(declare-fun res!385979 () Bool)

(assert (=> b!601183 (=> (not res!385979) (not e!343733))))

(assert (=> b!601183 (= res!385979 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601184 () Bool)

(declare-fun e!343728 () Bool)

(assert (=> b!601184 (= e!343729 e!343728)))

(declare-fun res!385986 () Bool)

(assert (=> b!601184 (=> (not res!385986) (not e!343728))))

(assert (=> b!601184 (= res!385986 (arrayContainsKey!0 lt!273611 (select (arr!17830 a!2986) j!136) j!136))))

(declare-fun b!601185 () Bool)

(assert (=> b!601185 (= e!343728 (arrayContainsKey!0 lt!273611 (select (arr!17830 a!2986) j!136) index!984))))

(declare-fun b!601186 () Bool)

(declare-fun res!385985 () Bool)

(assert (=> b!601186 (=> (not res!385985) (not e!343733))))

(assert (=> b!601186 (= res!385985 (and (= (size!18194 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18194 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18194 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601187 () Bool)

(declare-fun e!343730 () Bool)

(assert (=> b!601187 (= e!343739 e!343730)))

(declare-fun res!385994 () Bool)

(assert (=> b!601187 (=> (not res!385994) (not e!343730))))

(assert (=> b!601187 (= res!385994 (and (= lt!273619 (Found!6270 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17830 a!2986) index!984) (select (arr!17830 a!2986) j!136))) (not (= (select (arr!17830 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37141 (_ BitVec 32)) SeekEntryResult!6270)

(assert (=> b!601187 (= lt!273619 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601188 () Bool)

(declare-fun Unit!19005 () Unit!19000)

(assert (=> b!601188 (= e!343731 Unit!19005)))

(declare-fun b!601189 () Bool)

(assert (=> b!601189 (= e!343740 true)))

(declare-fun lt!273613 () Unit!19000)

(assert (=> b!601189 (= lt!273613 e!343738)))

(declare-fun c!67963 () Bool)

(assert (=> b!601189 (= c!67963 (bvslt j!136 index!984))))

(declare-fun b!601190 () Bool)

(assert (=> b!601190 (= e!343730 (not e!343735))))

(declare-fun res!385987 () Bool)

(assert (=> b!601190 (=> res!385987 e!343735)))

(declare-fun lt!273605 () SeekEntryResult!6270)

(assert (=> b!601190 (= res!385987 (not (= lt!273605 (Found!6270 index!984))))))

(declare-fun lt!273610 () Unit!19000)

(assert (=> b!601190 (= lt!273610 e!343731)))

(declare-fun c!67964 () Bool)

(assert (=> b!601190 (= c!67964 (= lt!273605 Undefined!6270))))

(assert (=> b!601190 (= lt!273605 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273617 lt!273611 mask!3053))))

(assert (=> b!601190 e!343737))

(declare-fun res!385983 () Bool)

(assert (=> b!601190 (=> (not res!385983) (not e!343737))))

(declare-fun lt!273606 () (_ BitVec 32))

(assert (=> b!601190 (= res!385983 (= lt!273612 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273606 vacantSpotIndex!68 lt!273617 lt!273611 mask!3053)))))

(assert (=> b!601190 (= lt!273612 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273606 vacantSpotIndex!68 (select (arr!17830 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601190 (= lt!273617 (select (store (arr!17830 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273609 () Unit!19000)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37141 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19000)

(assert (=> b!601190 (= lt!273609 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273606 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601190 (= lt!273606 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54906 res!385984) b!601186))

(assert (= (and b!601186 res!385985) b!601174))

(assert (= (and b!601174 res!385990) b!601173))

(assert (= (and b!601173 res!385992) b!601183))

(assert (= (and b!601183 res!385979) b!601181))

(assert (= (and b!601181 res!385978) b!601171))

(assert (= (and b!601171 res!385993) b!601176))

(assert (= (and b!601176 res!385980) b!601180))

(assert (= (and b!601180 res!385982) b!601170))

(assert (= (and b!601170 res!385988) b!601187))

(assert (= (and b!601187 res!385994) b!601190))

(assert (= (and b!601190 res!385983) b!601177))

(assert (= (and b!601190 c!67964) b!601172))

(assert (= (and b!601190 (not c!67964)) b!601188))

(assert (= (and b!601190 (not res!385987)) b!601182))

(assert (= (and b!601182 res!385989) b!601179))

(assert (= (and b!601179 (not res!385981)) b!601184))

(assert (= (and b!601184 res!385986) b!601185))

(assert (= (and b!601182 (not res!385991)) b!601189))

(assert (= (and b!601189 c!67963) b!601175))

(assert (= (and b!601189 (not c!67963)) b!601178))

(declare-fun m!578369 () Bool)

(assert (=> b!601181 m!578369))

(declare-fun m!578371 () Bool)

(assert (=> b!601187 m!578371))

(declare-fun m!578373 () Bool)

(assert (=> b!601187 m!578373))

(assert (=> b!601187 m!578373))

(declare-fun m!578375 () Bool)

(assert (=> b!601187 m!578375))

(declare-fun m!578377 () Bool)

(assert (=> b!601176 m!578377))

(declare-fun m!578379 () Bool)

(assert (=> b!601190 m!578379))

(declare-fun m!578381 () Bool)

(assert (=> b!601190 m!578381))

(assert (=> b!601190 m!578373))

(declare-fun m!578383 () Bool)

(assert (=> b!601190 m!578383))

(declare-fun m!578385 () Bool)

(assert (=> b!601190 m!578385))

(declare-fun m!578387 () Bool)

(assert (=> b!601190 m!578387))

(assert (=> b!601190 m!578373))

(declare-fun m!578389 () Bool)

(assert (=> b!601190 m!578389))

(declare-fun m!578391 () Bool)

(assert (=> b!601190 m!578391))

(declare-fun m!578393 () Bool)

(assert (=> b!601180 m!578393))

(assert (=> b!601182 m!578373))

(assert (=> b!601182 m!578385))

(declare-fun m!578395 () Bool)

(assert (=> b!601182 m!578395))

(declare-fun m!578397 () Bool)

(assert (=> b!601183 m!578397))

(assert (=> b!601179 m!578373))

(declare-fun m!578399 () Bool)

(assert (=> start!54906 m!578399))

(declare-fun m!578401 () Bool)

(assert (=> start!54906 m!578401))

(assert (=> b!601184 m!578373))

(assert (=> b!601184 m!578373))

(declare-fun m!578403 () Bool)

(assert (=> b!601184 m!578403))

(assert (=> b!601185 m!578373))

(assert (=> b!601185 m!578373))

(declare-fun m!578405 () Bool)

(assert (=> b!601185 m!578405))

(declare-fun m!578407 () Bool)

(assert (=> b!601171 m!578407))

(declare-fun m!578409 () Bool)

(assert (=> b!601173 m!578409))

(assert (=> b!601174 m!578373))

(assert (=> b!601174 m!578373))

(declare-fun m!578411 () Bool)

(assert (=> b!601174 m!578411))

(assert (=> b!601170 m!578385))

(declare-fun m!578413 () Bool)

(assert (=> b!601170 m!578413))

(assert (=> b!601175 m!578373))

(declare-fun m!578415 () Bool)

(assert (=> b!601175 m!578415))

(assert (=> b!601175 m!578373))

(declare-fun m!578417 () Bool)

(assert (=> b!601175 m!578417))

(assert (=> b!601175 m!578373))

(assert (=> b!601175 m!578373))

(declare-fun m!578419 () Bool)

(assert (=> b!601175 m!578419))

(declare-fun m!578421 () Bool)

(assert (=> b!601175 m!578421))

(declare-fun m!578423 () Bool)

(assert (=> b!601175 m!578423))

(declare-fun m!578425 () Bool)

(assert (=> b!601175 m!578425))

(declare-fun m!578427 () Bool)

(assert (=> b!601175 m!578427))

(check-sat (not b!601174) (not b!601190) (not b!601176) (not b!601183) (not b!601171) (not b!601184) (not b!601181) (not b!601175) (not b!601185) (not b!601173) (not b!601187) (not start!54906))
(check-sat)
