; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54876 () Bool)

(assert start!54876)

(declare-fun b!600442 () Bool)

(declare-fun e!343286 () Bool)

(declare-fun e!343285 () Bool)

(assert (=> b!600442 (= e!343286 e!343285)))

(declare-fun res!385444 () Bool)

(assert (=> b!600442 (=> (not res!385444) (not e!343285))))

(declare-datatypes ((SeekEntryResult!6259 0))(
  ( (MissingZero!6259 (index!27293 (_ BitVec 32))) (Found!6259 (index!27294 (_ BitVec 32))) (Intermediate!6259 (undefined!7071 Bool) (index!27295 (_ BitVec 32)) (x!56101 (_ BitVec 32))) (Undefined!6259) (MissingVacant!6259 (index!27296 (_ BitVec 32))) )
))
(declare-fun lt!273085 () SeekEntryResult!6259)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!600442 (= res!385444 (or (= lt!273085 (MissingZero!6259 i!1108)) (= lt!273085 (MissingVacant!6259 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37125 0))(
  ( (array!37126 (arr!17822 (Array (_ BitVec 32) (_ BitVec 64))) (size!18187 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37125)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37125 (_ BitVec 32)) SeekEntryResult!6259)

(assert (=> b!600442 (= lt!273085 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600443 () Bool)

(declare-fun res!385456 () Bool)

(assert (=> b!600443 (=> (not res!385456) (not e!343285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37125 (_ BitVec 32)) Bool)

(assert (=> b!600443 (= res!385456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600444 () Bool)

(declare-fun res!385450 () Bool)

(assert (=> b!600444 (=> (not res!385450) (not e!343286))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600444 (= res!385450 (validKeyInArray!0 (select (arr!17822 a!2986) j!136)))))

(declare-fun b!600445 () Bool)

(declare-fun e!343287 () Bool)

(declare-fun e!343293 () Bool)

(assert (=> b!600445 (= e!343287 e!343293)))

(declare-fun res!385451 () Bool)

(assert (=> b!600445 (=> res!385451 e!343293)))

(declare-fun lt!273083 () (_ BitVec 64))

(declare-fun lt!273079 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600445 (= res!385451 (or (not (= (select (arr!17822 a!2986) j!136) lt!273079)) (not (= (select (arr!17822 a!2986) j!136) lt!273083)) (bvsge j!136 index!984)))))

(declare-fun e!343292 () Bool)

(assert (=> b!600445 e!343292))

(declare-fun res!385454 () Bool)

(assert (=> b!600445 (=> (not res!385454) (not e!343292))))

(assert (=> b!600445 (= res!385454 (= lt!273083 (select (arr!17822 a!2986) j!136)))))

(assert (=> b!600445 (= lt!273083 (select (store (arr!17822 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600446 () Bool)

(declare-fun e!343282 () Bool)

(assert (=> b!600446 (= e!343293 e!343282)))

(declare-fun res!385461 () Bool)

(assert (=> b!600446 (=> res!385461 e!343282)))

(assert (=> b!600446 (= res!385461 (or (bvsge (size!18187 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18187 a!2986))))))

(declare-fun lt!273072 () array!37125)

(declare-datatypes ((List!11902 0))(
  ( (Nil!11899) (Cons!11898 (h!12943 (_ BitVec 64)) (t!18121 List!11902)) )
))
(declare-fun arrayNoDuplicates!0 (array!37125 (_ BitVec 32) List!11902) Bool)

(assert (=> b!600446 (arrayNoDuplicates!0 lt!273072 j!136 Nil!11899)))

(declare-datatypes ((Unit!18948 0))(
  ( (Unit!18949) )
))
(declare-fun lt!273078 () Unit!18948)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37125 (_ BitVec 32) (_ BitVec 32)) Unit!18948)

(assert (=> b!600446 (= lt!273078 (lemmaNoDuplicateFromThenFromBigger!0 lt!273072 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600446 (arrayNoDuplicates!0 lt!273072 #b00000000000000000000000000000000 Nil!11899)))

(declare-fun lt!273084 () Unit!18948)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37125 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11902) Unit!18948)

(assert (=> b!600446 (= lt!273084 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11899))))

(declare-fun arrayContainsKey!0 (array!37125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600446 (arrayContainsKey!0 lt!273072 (select (arr!17822 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273081 () Unit!18948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37125 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18948)

(assert (=> b!600446 (= lt!273081 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273072 (select (arr!17822 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600447 () Bool)

(declare-fun e!343288 () Bool)

(assert (=> b!600447 (= e!343288 (arrayContainsKey!0 lt!273072 (select (arr!17822 a!2986) j!136) index!984))))

(declare-fun b!600448 () Bool)

(declare-fun e!343289 () Unit!18948)

(declare-fun Unit!18950 () Unit!18948)

(assert (=> b!600448 (= e!343289 Unit!18950)))

(declare-fun b!600449 () Bool)

(declare-fun e!343283 () Bool)

(declare-fun e!343291 () Bool)

(assert (=> b!600449 (= e!343283 e!343291)))

(declare-fun res!385447 () Bool)

(assert (=> b!600449 (=> (not res!385447) (not e!343291))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!273076 () SeekEntryResult!6259)

(assert (=> b!600449 (= res!385447 (and (= lt!273076 (Found!6259 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17822 a!2986) index!984) (select (arr!17822 a!2986) j!136))) (not (= (select (arr!17822 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37125 (_ BitVec 32)) SeekEntryResult!6259)

(assert (=> b!600449 (= lt!273076 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17822 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!385448 () Bool)

(assert (=> start!54876 (=> (not res!385448) (not e!343286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54876 (= res!385448 (validMask!0 mask!3053))))

(assert (=> start!54876 e!343286))

(assert (=> start!54876 true))

(declare-fun array_inv!13705 (array!37125) Bool)

(assert (=> start!54876 (array_inv!13705 a!2986)))

(declare-fun b!600450 () Bool)

(declare-fun res!385457 () Bool)

(assert (=> b!600450 (=> res!385457 e!343282)))

(declare-fun contains!2967 (List!11902 (_ BitVec 64)) Bool)

(assert (=> b!600450 (= res!385457 (contains!2967 Nil!11899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600451 () Bool)

(declare-fun res!385455 () Bool)

(assert (=> b!600451 (=> (not res!385455) (not e!343286))))

(assert (=> b!600451 (= res!385455 (and (= (size!18187 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18187 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18187 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600452 () Bool)

(declare-fun e!343281 () Bool)

(assert (=> b!600452 (= e!343292 e!343281)))

(declare-fun res!385449 () Bool)

(assert (=> b!600452 (=> res!385449 e!343281)))

(assert (=> b!600452 (= res!385449 (or (not (= (select (arr!17822 a!2986) j!136) lt!273079)) (not (= (select (arr!17822 a!2986) j!136) lt!273083)) (bvsge j!136 index!984)))))

(declare-fun b!600453 () Bool)

(declare-fun Unit!18951 () Unit!18948)

(assert (=> b!600453 (= e!343289 Unit!18951)))

(assert (=> b!600453 false))

(declare-fun b!600454 () Bool)

(assert (=> b!600454 (= e!343285 e!343283)))

(declare-fun res!385463 () Bool)

(assert (=> b!600454 (=> (not res!385463) (not e!343283))))

(assert (=> b!600454 (= res!385463 (= (select (store (arr!17822 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600454 (= lt!273072 (array!37126 (store (arr!17822 a!2986) i!1108 k0!1786) (size!18187 a!2986)))))

(declare-fun b!600455 () Bool)

(declare-fun res!385459 () Bool)

(assert (=> b!600455 (=> (not res!385459) (not e!343286))))

(assert (=> b!600455 (= res!385459 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600456 () Bool)

(assert (=> b!600456 (= e!343282 true)))

(declare-fun lt!273075 () Bool)

(assert (=> b!600456 (= lt!273075 (contains!2967 Nil!11899 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600457 () Bool)

(assert (=> b!600457 (= e!343291 (not e!343287))))

(declare-fun res!385445 () Bool)

(assert (=> b!600457 (=> res!385445 e!343287)))

(declare-fun lt!273082 () SeekEntryResult!6259)

(assert (=> b!600457 (= res!385445 (not (= lt!273082 (Found!6259 index!984))))))

(declare-fun lt!273073 () Unit!18948)

(assert (=> b!600457 (= lt!273073 e!343289)))

(declare-fun c!67866 () Bool)

(assert (=> b!600457 (= c!67866 (= lt!273082 Undefined!6259))))

(assert (=> b!600457 (= lt!273082 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273079 lt!273072 mask!3053))))

(declare-fun e!343284 () Bool)

(assert (=> b!600457 e!343284))

(declare-fun res!385452 () Bool)

(assert (=> b!600457 (=> (not res!385452) (not e!343284))))

(declare-fun lt!273077 () (_ BitVec 32))

(declare-fun lt!273074 () SeekEntryResult!6259)

(assert (=> b!600457 (= res!385452 (= lt!273074 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273077 vacantSpotIndex!68 lt!273079 lt!273072 mask!3053)))))

(assert (=> b!600457 (= lt!273074 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273077 vacantSpotIndex!68 (select (arr!17822 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600457 (= lt!273079 (select (store (arr!17822 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273080 () Unit!18948)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37125 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18948)

(assert (=> b!600457 (= lt!273080 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273077 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600457 (= lt!273077 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600458 () Bool)

(declare-fun res!385462 () Bool)

(assert (=> b!600458 (=> res!385462 e!343282)))

(declare-fun noDuplicate!302 (List!11902) Bool)

(assert (=> b!600458 (= res!385462 (not (noDuplicate!302 Nil!11899)))))

(declare-fun b!600459 () Bool)

(declare-fun res!385446 () Bool)

(assert (=> b!600459 (=> (not res!385446) (not e!343286))))

(assert (=> b!600459 (= res!385446 (validKeyInArray!0 k0!1786))))

(declare-fun b!600460 () Bool)

(declare-fun res!385453 () Bool)

(assert (=> b!600460 (=> (not res!385453) (not e!343285))))

(assert (=> b!600460 (= res!385453 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11899))))

(declare-fun b!600461 () Bool)

(assert (=> b!600461 (= e!343281 e!343288)))

(declare-fun res!385460 () Bool)

(assert (=> b!600461 (=> (not res!385460) (not e!343288))))

(assert (=> b!600461 (= res!385460 (arrayContainsKey!0 lt!273072 (select (arr!17822 a!2986) j!136) j!136))))

(declare-fun b!600462 () Bool)

(declare-fun res!385458 () Bool)

(assert (=> b!600462 (=> (not res!385458) (not e!343285))))

(assert (=> b!600462 (= res!385458 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17822 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600463 () Bool)

(assert (=> b!600463 (= e!343284 (= lt!273076 lt!273074))))

(assert (= (and start!54876 res!385448) b!600451))

(assert (= (and b!600451 res!385455) b!600444))

(assert (= (and b!600444 res!385450) b!600459))

(assert (= (and b!600459 res!385446) b!600455))

(assert (= (and b!600455 res!385459) b!600442))

(assert (= (and b!600442 res!385444) b!600443))

(assert (= (and b!600443 res!385456) b!600460))

(assert (= (and b!600460 res!385453) b!600462))

(assert (= (and b!600462 res!385458) b!600454))

(assert (= (and b!600454 res!385463) b!600449))

(assert (= (and b!600449 res!385447) b!600457))

(assert (= (and b!600457 res!385452) b!600463))

(assert (= (and b!600457 c!67866) b!600453))

(assert (= (and b!600457 (not c!67866)) b!600448))

(assert (= (and b!600457 (not res!385445)) b!600445))

(assert (= (and b!600445 res!385454) b!600452))

(assert (= (and b!600452 (not res!385449)) b!600461))

(assert (= (and b!600461 res!385460) b!600447))

(assert (= (and b!600445 (not res!385451)) b!600446))

(assert (= (and b!600446 (not res!385461)) b!600458))

(assert (= (and b!600458 (not res!385462)) b!600450))

(assert (= (and b!600450 (not res!385457)) b!600456))

(declare-fun m!577153 () Bool)

(assert (=> b!600457 m!577153))

(declare-fun m!577155 () Bool)

(assert (=> b!600457 m!577155))

(declare-fun m!577157 () Bool)

(assert (=> b!600457 m!577157))

(assert (=> b!600457 m!577155))

(declare-fun m!577159 () Bool)

(assert (=> b!600457 m!577159))

(declare-fun m!577161 () Bool)

(assert (=> b!600457 m!577161))

(declare-fun m!577163 () Bool)

(assert (=> b!600457 m!577163))

(declare-fun m!577165 () Bool)

(assert (=> b!600457 m!577165))

(declare-fun m!577167 () Bool)

(assert (=> b!600457 m!577167))

(declare-fun m!577169 () Bool)

(assert (=> b!600446 m!577169))

(declare-fun m!577171 () Bool)

(assert (=> b!600446 m!577171))

(assert (=> b!600446 m!577155))

(declare-fun m!577173 () Bool)

(assert (=> b!600446 m!577173))

(declare-fun m!577175 () Bool)

(assert (=> b!600446 m!577175))

(declare-fun m!577177 () Bool)

(assert (=> b!600446 m!577177))

(assert (=> b!600446 m!577155))

(assert (=> b!600446 m!577155))

(declare-fun m!577179 () Bool)

(assert (=> b!600446 m!577179))

(assert (=> b!600454 m!577157))

(declare-fun m!577181 () Bool)

(assert (=> b!600454 m!577181))

(declare-fun m!577183 () Bool)

(assert (=> b!600450 m!577183))

(declare-fun m!577185 () Bool)

(assert (=> b!600442 m!577185))

(declare-fun m!577187 () Bool)

(assert (=> b!600455 m!577187))

(declare-fun m!577189 () Bool)

(assert (=> b!600460 m!577189))

(declare-fun m!577191 () Bool)

(assert (=> b!600456 m!577191))

(declare-fun m!577193 () Bool)

(assert (=> start!54876 m!577193))

(declare-fun m!577195 () Bool)

(assert (=> start!54876 m!577195))

(assert (=> b!600445 m!577155))

(assert (=> b!600445 m!577157))

(declare-fun m!577197 () Bool)

(assert (=> b!600445 m!577197))

(assert (=> b!600461 m!577155))

(assert (=> b!600461 m!577155))

(declare-fun m!577199 () Bool)

(assert (=> b!600461 m!577199))

(assert (=> b!600444 m!577155))

(assert (=> b!600444 m!577155))

(declare-fun m!577201 () Bool)

(assert (=> b!600444 m!577201))

(declare-fun m!577203 () Bool)

(assert (=> b!600462 m!577203))

(assert (=> b!600452 m!577155))

(declare-fun m!577205 () Bool)

(assert (=> b!600449 m!577205))

(assert (=> b!600449 m!577155))

(assert (=> b!600449 m!577155))

(declare-fun m!577207 () Bool)

(assert (=> b!600449 m!577207))

(declare-fun m!577209 () Bool)

(assert (=> b!600459 m!577209))

(declare-fun m!577211 () Bool)

(assert (=> b!600458 m!577211))

(assert (=> b!600447 m!577155))

(assert (=> b!600447 m!577155))

(declare-fun m!577213 () Bool)

(assert (=> b!600447 m!577213))

(declare-fun m!577215 () Bool)

(assert (=> b!600443 m!577215))

(check-sat (not b!600442) (not b!600455) (not b!600458) (not b!600446) (not b!600461) (not start!54876) (not b!600457) (not b!600456) (not b!600444) (not b!600449) (not b!600443) (not b!600459) (not b!600450) (not b!600447) (not b!600460))
(check-sat)
