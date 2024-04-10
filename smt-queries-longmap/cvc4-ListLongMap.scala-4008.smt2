; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54524 () Bool)

(assert start!54524)

(declare-fun b!595447 () Bool)

(declare-fun res!381337 () Bool)

(declare-fun e!340216 () Bool)

(assert (=> b!595447 (=> (not res!381337) (not e!340216))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36984 0))(
  ( (array!36985 (arr!17756 (Array (_ BitVec 32) (_ BitVec 64))) (size!18120 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36984)

(assert (=> b!595447 (= res!381337 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17756 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595448 () Bool)

(declare-fun res!381326 () Bool)

(assert (=> b!595448 (=> (not res!381326) (not e!340216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36984 (_ BitVec 32)) Bool)

(assert (=> b!595448 (= res!381326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!381323 () Bool)

(declare-fun e!340218 () Bool)

(assert (=> start!54524 (=> (not res!381323) (not e!340218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54524 (= res!381323 (validMask!0 mask!3053))))

(assert (=> start!54524 e!340218))

(assert (=> start!54524 true))

(declare-fun array_inv!13552 (array!36984) Bool)

(assert (=> start!54524 (array_inv!13552 a!2986)))

(declare-fun b!595449 () Bool)

(declare-fun res!381321 () Bool)

(assert (=> b!595449 (=> (not res!381321) (not e!340218))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!595449 (= res!381321 (and (= (size!18120 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18120 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18120 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595450 () Bool)

(declare-fun res!381322 () Bool)

(declare-fun e!340215 () Bool)

(assert (=> b!595450 (=> res!381322 e!340215)))

(declare-datatypes ((List!11797 0))(
  ( (Nil!11794) (Cons!11793 (h!12838 (_ BitVec 64)) (t!18025 List!11797)) )
))
(declare-fun contains!2932 (List!11797 (_ BitVec 64)) Bool)

(assert (=> b!595450 (= res!381322 (contains!2932 Nil!11794 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595451 () Bool)

(declare-fun res!381333 () Bool)

(assert (=> b!595451 (=> (not res!381333) (not e!340216))))

(declare-fun arrayNoDuplicates!0 (array!36984 (_ BitVec 32) List!11797) Bool)

(assert (=> b!595451 (= res!381333 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11794))))

(declare-fun b!595452 () Bool)

(declare-fun res!381334 () Bool)

(assert (=> b!595452 (=> (not res!381334) (not e!340218))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595452 (= res!381334 (validKeyInArray!0 k!1786))))

(declare-fun b!595453 () Bool)

(declare-fun e!340208 () Bool)

(declare-fun e!340212 () Bool)

(assert (=> b!595453 (= e!340208 (not e!340212))))

(declare-fun res!381340 () Bool)

(assert (=> b!595453 (=> res!381340 e!340212)))

(declare-datatypes ((SeekEntryResult!6196 0))(
  ( (MissingZero!6196 (index!27032 (_ BitVec 32))) (Found!6196 (index!27033 (_ BitVec 32))) (Intermediate!6196 (undefined!7008 Bool) (index!27034 (_ BitVec 32)) (x!55832 (_ BitVec 32))) (Undefined!6196) (MissingVacant!6196 (index!27035 (_ BitVec 32))) )
))
(declare-fun lt!270380 () SeekEntryResult!6196)

(assert (=> b!595453 (= res!381340 (not (= lt!270380 (Found!6196 index!984))))))

(declare-datatypes ((Unit!18702 0))(
  ( (Unit!18703) )
))
(declare-fun lt!270381 () Unit!18702)

(declare-fun e!340209 () Unit!18702)

(assert (=> b!595453 (= lt!270381 e!340209)))

(declare-fun c!67430 () Bool)

(assert (=> b!595453 (= c!67430 (= lt!270380 Undefined!6196))))

(declare-fun lt!270379 () array!36984)

(declare-fun lt!270377 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36984 (_ BitVec 32)) SeekEntryResult!6196)

(assert (=> b!595453 (= lt!270380 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270377 lt!270379 mask!3053))))

(declare-fun e!340207 () Bool)

(assert (=> b!595453 e!340207))

(declare-fun res!381331 () Bool)

(assert (=> b!595453 (=> (not res!381331) (not e!340207))))

(declare-fun lt!270385 () (_ BitVec 32))

(declare-fun lt!270375 () SeekEntryResult!6196)

(assert (=> b!595453 (= res!381331 (= lt!270375 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270385 vacantSpotIndex!68 lt!270377 lt!270379 mask!3053)))))

(assert (=> b!595453 (= lt!270375 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270385 vacantSpotIndex!68 (select (arr!17756 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595453 (= lt!270377 (select (store (arr!17756 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270378 () Unit!18702)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36984 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18702)

(assert (=> b!595453 (= lt!270378 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270385 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595453 (= lt!270385 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!340217 () Bool)

(declare-fun b!595454 () Bool)

(declare-fun arrayContainsKey!0 (array!36984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595454 (= e!340217 (arrayContainsKey!0 lt!270379 (select (arr!17756 a!2986) j!136) index!984))))

(declare-fun b!595455 () Bool)

(declare-fun e!340210 () Bool)

(assert (=> b!595455 (= e!340210 e!340215)))

(declare-fun res!381332 () Bool)

(assert (=> b!595455 (=> res!381332 e!340215)))

(assert (=> b!595455 (= res!381332 (or (bvsge (size!18120 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18120 a!2986))))))

(assert (=> b!595455 (arrayContainsKey!0 lt!270379 (select (arr!17756 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270383 () Unit!18702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36984 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18702)

(assert (=> b!595455 (= lt!270383 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270379 (select (arr!17756 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595456 () Bool)

(assert (=> b!595456 (= e!340212 e!340210)))

(declare-fun res!381330 () Bool)

(assert (=> b!595456 (=> res!381330 e!340210)))

(declare-fun lt!270382 () (_ BitVec 64))

(assert (=> b!595456 (= res!381330 (or (not (= (select (arr!17756 a!2986) j!136) lt!270377)) (not (= (select (arr!17756 a!2986) j!136) lt!270382)) (bvsge j!136 index!984)))))

(declare-fun e!340213 () Bool)

(assert (=> b!595456 e!340213))

(declare-fun res!381325 () Bool)

(assert (=> b!595456 (=> (not res!381325) (not e!340213))))

(assert (=> b!595456 (= res!381325 (= lt!270382 (select (arr!17756 a!2986) j!136)))))

(assert (=> b!595456 (= lt!270382 (select (store (arr!17756 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595457 () Bool)

(assert (=> b!595457 (= e!340218 e!340216)))

(declare-fun res!381336 () Bool)

(assert (=> b!595457 (=> (not res!381336) (not e!340216))))

(declare-fun lt!270376 () SeekEntryResult!6196)

(assert (=> b!595457 (= res!381336 (or (= lt!270376 (MissingZero!6196 i!1108)) (= lt!270376 (MissingVacant!6196 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36984 (_ BitVec 32)) SeekEntryResult!6196)

(assert (=> b!595457 (= lt!270376 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595458 () Bool)

(declare-fun Unit!18704 () Unit!18702)

(assert (=> b!595458 (= e!340209 Unit!18704)))

(declare-fun b!595459 () Bool)

(declare-fun e!340214 () Bool)

(assert (=> b!595459 (= e!340214 e!340208)))

(declare-fun res!381338 () Bool)

(assert (=> b!595459 (=> (not res!381338) (not e!340208))))

(declare-fun lt!270384 () SeekEntryResult!6196)

(assert (=> b!595459 (= res!381338 (and (= lt!270384 (Found!6196 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17756 a!2986) index!984) (select (arr!17756 a!2986) j!136))) (not (= (select (arr!17756 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595459 (= lt!270384 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17756 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595460 () Bool)

(declare-fun res!381327 () Bool)

(assert (=> b!595460 (=> (not res!381327) (not e!340218))))

(assert (=> b!595460 (= res!381327 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595461 () Bool)

(declare-fun res!381341 () Bool)

(assert (=> b!595461 (=> (not res!381341) (not e!340218))))

(assert (=> b!595461 (= res!381341 (validKeyInArray!0 (select (arr!17756 a!2986) j!136)))))

(declare-fun b!595462 () Bool)

(declare-fun e!340206 () Bool)

(assert (=> b!595462 (= e!340213 e!340206)))

(declare-fun res!381324 () Bool)

(assert (=> b!595462 (=> res!381324 e!340206)))

(assert (=> b!595462 (= res!381324 (or (not (= (select (arr!17756 a!2986) j!136) lt!270377)) (not (= (select (arr!17756 a!2986) j!136) lt!270382)) (bvsge j!136 index!984)))))

(declare-fun b!595463 () Bool)

(declare-fun res!381329 () Bool)

(assert (=> b!595463 (=> res!381329 e!340215)))

(declare-fun noDuplicate!251 (List!11797) Bool)

(assert (=> b!595463 (= res!381329 (not (noDuplicate!251 Nil!11794)))))

(declare-fun b!595464 () Bool)

(assert (=> b!595464 (= e!340216 e!340214)))

(declare-fun res!381335 () Bool)

(assert (=> b!595464 (=> (not res!381335) (not e!340214))))

(assert (=> b!595464 (= res!381335 (= (select (store (arr!17756 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595464 (= lt!270379 (array!36985 (store (arr!17756 a!2986) i!1108 k!1786) (size!18120 a!2986)))))

(declare-fun b!595465 () Bool)

(assert (=> b!595465 (= e!340215 true)))

(declare-fun lt!270374 () Bool)

(assert (=> b!595465 (= lt!270374 (contains!2932 Nil!11794 k!1786))))

(declare-fun b!595466 () Bool)

(assert (=> b!595466 (= e!340206 e!340217)))

(declare-fun res!381339 () Bool)

(assert (=> b!595466 (=> (not res!381339) (not e!340217))))

(assert (=> b!595466 (= res!381339 (arrayContainsKey!0 lt!270379 (select (arr!17756 a!2986) j!136) j!136))))

(declare-fun b!595467 () Bool)

(declare-fun Unit!18705 () Unit!18702)

(assert (=> b!595467 (= e!340209 Unit!18705)))

(assert (=> b!595467 false))

(declare-fun b!595468 () Bool)

(declare-fun res!381328 () Bool)

(assert (=> b!595468 (=> res!381328 e!340215)))

(assert (=> b!595468 (= res!381328 (contains!2932 Nil!11794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595469 () Bool)

(assert (=> b!595469 (= e!340207 (= lt!270384 lt!270375))))

(assert (= (and start!54524 res!381323) b!595449))

(assert (= (and b!595449 res!381321) b!595461))

(assert (= (and b!595461 res!381341) b!595452))

(assert (= (and b!595452 res!381334) b!595460))

(assert (= (and b!595460 res!381327) b!595457))

(assert (= (and b!595457 res!381336) b!595448))

(assert (= (and b!595448 res!381326) b!595451))

(assert (= (and b!595451 res!381333) b!595447))

(assert (= (and b!595447 res!381337) b!595464))

(assert (= (and b!595464 res!381335) b!595459))

(assert (= (and b!595459 res!381338) b!595453))

(assert (= (and b!595453 res!381331) b!595469))

(assert (= (and b!595453 c!67430) b!595467))

(assert (= (and b!595453 (not c!67430)) b!595458))

(assert (= (and b!595453 (not res!381340)) b!595456))

(assert (= (and b!595456 res!381325) b!595462))

(assert (= (and b!595462 (not res!381324)) b!595466))

(assert (= (and b!595466 res!381339) b!595454))

(assert (= (and b!595456 (not res!381330)) b!595455))

(assert (= (and b!595455 (not res!381332)) b!595463))

(assert (= (and b!595463 (not res!381329)) b!595468))

(assert (= (and b!595468 (not res!381328)) b!595450))

(assert (= (and b!595450 (not res!381322)) b!595465))

(declare-fun m!573097 () Bool)

(assert (=> start!54524 m!573097))

(declare-fun m!573099 () Bool)

(assert (=> start!54524 m!573099))

(declare-fun m!573101 () Bool)

(assert (=> b!595455 m!573101))

(assert (=> b!595455 m!573101))

(declare-fun m!573103 () Bool)

(assert (=> b!595455 m!573103))

(assert (=> b!595455 m!573101))

(declare-fun m!573105 () Bool)

(assert (=> b!595455 m!573105))

(declare-fun m!573107 () Bool)

(assert (=> b!595451 m!573107))

(assert (=> b!595454 m!573101))

(assert (=> b!595454 m!573101))

(declare-fun m!573109 () Bool)

(assert (=> b!595454 m!573109))

(assert (=> b!595466 m!573101))

(assert (=> b!595466 m!573101))

(declare-fun m!573111 () Bool)

(assert (=> b!595466 m!573111))

(declare-fun m!573113 () Bool)

(assert (=> b!595460 m!573113))

(declare-fun m!573115 () Bool)

(assert (=> b!595468 m!573115))

(declare-fun m!573117 () Bool)

(assert (=> b!595447 m!573117))

(declare-fun m!573119 () Bool)

(assert (=> b!595464 m!573119))

(declare-fun m!573121 () Bool)

(assert (=> b!595464 m!573121))

(declare-fun m!573123 () Bool)

(assert (=> b!595457 m!573123))

(assert (=> b!595461 m!573101))

(assert (=> b!595461 m!573101))

(declare-fun m!573125 () Bool)

(assert (=> b!595461 m!573125))

(declare-fun m!573127 () Bool)

(assert (=> b!595448 m!573127))

(assert (=> b!595456 m!573101))

(assert (=> b!595456 m!573119))

(declare-fun m!573129 () Bool)

(assert (=> b!595456 m!573129))

(declare-fun m!573131 () Bool)

(assert (=> b!595459 m!573131))

(assert (=> b!595459 m!573101))

(assert (=> b!595459 m!573101))

(declare-fun m!573133 () Bool)

(assert (=> b!595459 m!573133))

(declare-fun m!573135 () Bool)

(assert (=> b!595465 m!573135))

(declare-fun m!573137 () Bool)

(assert (=> b!595450 m!573137))

(assert (=> b!595462 m!573101))

(declare-fun m!573139 () Bool)

(assert (=> b!595463 m!573139))

(assert (=> b!595453 m!573101))

(declare-fun m!573141 () Bool)

(assert (=> b!595453 m!573141))

(declare-fun m!573143 () Bool)

(assert (=> b!595453 m!573143))

(declare-fun m!573145 () Bool)

(assert (=> b!595453 m!573145))

(declare-fun m!573147 () Bool)

(assert (=> b!595453 m!573147))

(assert (=> b!595453 m!573101))

(assert (=> b!595453 m!573119))

(declare-fun m!573149 () Bool)

(assert (=> b!595453 m!573149))

(declare-fun m!573151 () Bool)

(assert (=> b!595453 m!573151))

(declare-fun m!573153 () Bool)

(assert (=> b!595452 m!573153))

(push 1)

