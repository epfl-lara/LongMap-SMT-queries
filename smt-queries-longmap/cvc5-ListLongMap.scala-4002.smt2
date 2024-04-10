; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54334 () Bool)

(assert start!54334)

(declare-fun b!593461 () Bool)

(declare-fun e!338986 () Bool)

(declare-fun e!338979 () Bool)

(assert (=> b!593461 (= e!338986 e!338979)))

(declare-fun res!379868 () Bool)

(assert (=> b!593461 (=> (not res!379868) (not e!338979))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!36938 0))(
  ( (array!36939 (arr!17736 (Array (_ BitVec 32) (_ BitVec 64))) (size!18100 (_ BitVec 32))) )
))
(declare-fun lt!269432 () array!36938)

(declare-fun a!2986 () array!36938)

(declare-fun arrayContainsKey!0 (array!36938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593461 (= res!379868 (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) j!136))))

(declare-fun b!593462 () Bool)

(declare-fun e!338991 () Bool)

(declare-fun e!338989 () Bool)

(assert (=> b!593462 (= e!338991 (not e!338989))))

(declare-fun res!379856 () Bool)

(assert (=> b!593462 (=> res!379856 e!338989)))

(declare-datatypes ((SeekEntryResult!6176 0))(
  ( (MissingZero!6176 (index!26946 (_ BitVec 32))) (Found!6176 (index!26947 (_ BitVec 32))) (Intermediate!6176 (undefined!6988 Bool) (index!26948 (_ BitVec 32)) (x!55746 (_ BitVec 32))) (Undefined!6176) (MissingVacant!6176 (index!26949 (_ BitVec 32))) )
))
(declare-fun lt!269424 () SeekEntryResult!6176)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!593462 (= res!379856 (not (= lt!269424 (Found!6176 index!984))))))

(declare-datatypes ((Unit!18622 0))(
  ( (Unit!18623) )
))
(declare-fun lt!269428 () Unit!18622)

(declare-fun e!338982 () Unit!18622)

(assert (=> b!593462 (= lt!269428 e!338982)))

(declare-fun c!67172 () Bool)

(assert (=> b!593462 (= c!67172 (= lt!269424 Undefined!6176))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!269426 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36938 (_ BitVec 32)) SeekEntryResult!6176)

(assert (=> b!593462 (= lt!269424 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269426 lt!269432 mask!3053))))

(declare-fun e!338984 () Bool)

(assert (=> b!593462 e!338984))

(declare-fun res!379853 () Bool)

(assert (=> b!593462 (=> (not res!379853) (not e!338984))))

(declare-fun lt!269434 () (_ BitVec 32))

(declare-fun lt!269429 () SeekEntryResult!6176)

(assert (=> b!593462 (= res!379853 (= lt!269429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269434 vacantSpotIndex!68 lt!269426 lt!269432 mask!3053)))))

(assert (=> b!593462 (= lt!269429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269434 vacantSpotIndex!68 (select (arr!17736 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!593462 (= lt!269426 (select (store (arr!17736 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269427 () Unit!18622)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36938 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18622)

(assert (=> b!593462 (= lt!269427 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269434 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593462 (= lt!269434 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593463 () Bool)

(declare-fun e!338987 () Bool)

(declare-datatypes ((List!11777 0))(
  ( (Nil!11774) (Cons!11773 (h!12818 (_ BitVec 64)) (t!18005 List!11777)) )
))
(declare-fun noDuplicate!231 (List!11777) Bool)

(assert (=> b!593463 (= e!338987 (noDuplicate!231 Nil!11774))))

(declare-fun b!593464 () Bool)

(declare-fun res!379860 () Bool)

(declare-fun e!338983 () Bool)

(assert (=> b!593464 (=> (not res!379860) (not e!338983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593464 (= res!379860 (validKeyInArray!0 (select (arr!17736 a!2986) j!136)))))

(declare-fun b!593465 () Bool)

(declare-fun res!379863 () Bool)

(declare-fun e!338980 () Bool)

(assert (=> b!593465 (=> (not res!379863) (not e!338980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36938 (_ BitVec 32)) Bool)

(assert (=> b!593465 (= res!379863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593466 () Bool)

(declare-fun e!338988 () Bool)

(assert (=> b!593466 (= e!338988 e!338986)))

(declare-fun res!379864 () Bool)

(assert (=> b!593466 (=> res!379864 e!338986)))

(declare-fun lt!269431 () (_ BitVec 64))

(assert (=> b!593466 (= res!379864 (or (not (= (select (arr!17736 a!2986) j!136) lt!269426)) (not (= (select (arr!17736 a!2986) j!136) lt!269431)) (bvsge j!136 index!984)))))

(declare-fun b!593467 () Bool)

(declare-fun res!379861 () Bool)

(assert (=> b!593467 (=> (not res!379861) (not e!338983))))

(assert (=> b!593467 (= res!379861 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593468 () Bool)

(assert (=> b!593468 (= e!338979 (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) index!984))))

(declare-fun b!593469 () Bool)

(declare-fun res!379859 () Bool)

(assert (=> b!593469 (=> (not res!379859) (not e!338983))))

(assert (=> b!593469 (= res!379859 (validKeyInArray!0 k!1786))))

(declare-fun b!593470 () Bool)

(declare-fun e!338981 () Bool)

(assert (=> b!593470 (= e!338981 e!338991)))

(declare-fun res!379851 () Bool)

(assert (=> b!593470 (=> (not res!379851) (not e!338991))))

(declare-fun lt!269433 () SeekEntryResult!6176)

(assert (=> b!593470 (= res!379851 (and (= lt!269433 (Found!6176 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17736 a!2986) index!984) (select (arr!17736 a!2986) j!136))) (not (= (select (arr!17736 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593470 (= lt!269433 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17736 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593471 () Bool)

(declare-fun e!338990 () Bool)

(assert (=> b!593471 (= e!338989 e!338990)))

(declare-fun res!379854 () Bool)

(assert (=> b!593471 (=> res!379854 e!338990)))

(assert (=> b!593471 (= res!379854 (or (not (= (select (arr!17736 a!2986) j!136) lt!269426)) (not (= (select (arr!17736 a!2986) j!136) lt!269431)) (bvsge j!136 index!984)))))

(assert (=> b!593471 e!338988))

(declare-fun res!379855 () Bool)

(assert (=> b!593471 (=> (not res!379855) (not e!338988))))

(assert (=> b!593471 (= res!379855 (= lt!269431 (select (arr!17736 a!2986) j!136)))))

(assert (=> b!593471 (= lt!269431 (select (store (arr!17736 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!593472 () Bool)

(declare-fun res!379858 () Bool)

(assert (=> b!593472 (=> (not res!379858) (not e!338980))))

(declare-fun arrayNoDuplicates!0 (array!36938 (_ BitVec 32) List!11777) Bool)

(assert (=> b!593472 (= res!379858 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11774))))

(declare-fun b!593474 () Bool)

(assert (=> b!593474 (= e!338983 e!338980)))

(declare-fun res!379852 () Bool)

(assert (=> b!593474 (=> (not res!379852) (not e!338980))))

(declare-fun lt!269425 () SeekEntryResult!6176)

(assert (=> b!593474 (= res!379852 (or (= lt!269425 (MissingZero!6176 i!1108)) (= lt!269425 (MissingVacant!6176 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36938 (_ BitVec 32)) SeekEntryResult!6176)

(assert (=> b!593474 (= lt!269425 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!593475 () Bool)

(assert (=> b!593475 (= e!338984 (= lt!269433 lt!269429))))

(declare-fun b!593476 () Bool)

(declare-fun Unit!18624 () Unit!18622)

(assert (=> b!593476 (= e!338982 Unit!18624)))

(declare-fun b!593477 () Bool)

(assert (=> b!593477 (= e!338980 e!338981)))

(declare-fun res!379867 () Bool)

(assert (=> b!593477 (=> (not res!379867) (not e!338981))))

(assert (=> b!593477 (= res!379867 (= (select (store (arr!17736 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593477 (= lt!269432 (array!36939 (store (arr!17736 a!2986) i!1108 k!1786) (size!18100 a!2986)))))

(declare-fun b!593478 () Bool)

(declare-fun res!379866 () Bool)

(assert (=> b!593478 (=> (not res!379866) (not e!338980))))

(assert (=> b!593478 (= res!379866 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17736 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593479 () Bool)

(assert (=> b!593479 (= e!338990 e!338987)))

(declare-fun res!379865 () Bool)

(assert (=> b!593479 (=> res!379865 e!338987)))

(assert (=> b!593479 (= res!379865 (or (bvsgt #b00000000000000000000000000000000 (size!18100 a!2986)) (bvsge (size!18100 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!593479 (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269430 () Unit!18622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36938 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18622)

(assert (=> b!593479 (= lt!269430 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269432 (select (arr!17736 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593480 () Bool)

(declare-fun res!379862 () Bool)

(assert (=> b!593480 (=> (not res!379862) (not e!338983))))

(assert (=> b!593480 (= res!379862 (and (= (size!18100 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18100 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18100 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!379857 () Bool)

(assert (=> start!54334 (=> (not res!379857) (not e!338983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54334 (= res!379857 (validMask!0 mask!3053))))

(assert (=> start!54334 e!338983))

(assert (=> start!54334 true))

(declare-fun array_inv!13532 (array!36938) Bool)

(assert (=> start!54334 (array_inv!13532 a!2986)))

(declare-fun b!593473 () Bool)

(declare-fun Unit!18625 () Unit!18622)

(assert (=> b!593473 (= e!338982 Unit!18625)))

(assert (=> b!593473 false))

(assert (= (and start!54334 res!379857) b!593480))

(assert (= (and b!593480 res!379862) b!593464))

(assert (= (and b!593464 res!379860) b!593469))

(assert (= (and b!593469 res!379859) b!593467))

(assert (= (and b!593467 res!379861) b!593474))

(assert (= (and b!593474 res!379852) b!593465))

(assert (= (and b!593465 res!379863) b!593472))

(assert (= (and b!593472 res!379858) b!593478))

(assert (= (and b!593478 res!379866) b!593477))

(assert (= (and b!593477 res!379867) b!593470))

(assert (= (and b!593470 res!379851) b!593462))

(assert (= (and b!593462 res!379853) b!593475))

(assert (= (and b!593462 c!67172) b!593473))

(assert (= (and b!593462 (not c!67172)) b!593476))

(assert (= (and b!593462 (not res!379856)) b!593471))

(assert (= (and b!593471 res!379855) b!593466))

(assert (= (and b!593466 (not res!379864)) b!593461))

(assert (= (and b!593461 res!379868) b!593468))

(assert (= (and b!593471 (not res!379854)) b!593479))

(assert (= (and b!593479 (not res!379865)) b!593463))

(declare-fun m!571415 () Bool)

(assert (=> b!593465 m!571415))

(declare-fun m!571417 () Bool)

(assert (=> b!593472 m!571417))

(declare-fun m!571419 () Bool)

(assert (=> b!593471 m!571419))

(declare-fun m!571421 () Bool)

(assert (=> b!593471 m!571421))

(declare-fun m!571423 () Bool)

(assert (=> b!593471 m!571423))

(declare-fun m!571425 () Bool)

(assert (=> b!593470 m!571425))

(assert (=> b!593470 m!571419))

(assert (=> b!593470 m!571419))

(declare-fun m!571427 () Bool)

(assert (=> b!593470 m!571427))

(assert (=> b!593461 m!571419))

(assert (=> b!593461 m!571419))

(declare-fun m!571429 () Bool)

(assert (=> b!593461 m!571429))

(assert (=> b!593464 m!571419))

(assert (=> b!593464 m!571419))

(declare-fun m!571431 () Bool)

(assert (=> b!593464 m!571431))

(declare-fun m!571433 () Bool)

(assert (=> b!593462 m!571433))

(declare-fun m!571435 () Bool)

(assert (=> b!593462 m!571435))

(declare-fun m!571437 () Bool)

(assert (=> b!593462 m!571437))

(assert (=> b!593462 m!571419))

(assert (=> b!593462 m!571421))

(declare-fun m!571439 () Bool)

(assert (=> b!593462 m!571439))

(declare-fun m!571441 () Bool)

(assert (=> b!593462 m!571441))

(assert (=> b!593462 m!571419))

(declare-fun m!571443 () Bool)

(assert (=> b!593462 m!571443))

(declare-fun m!571445 () Bool)

(assert (=> b!593474 m!571445))

(declare-fun m!571447 () Bool)

(assert (=> b!593469 m!571447))

(assert (=> b!593468 m!571419))

(assert (=> b!593468 m!571419))

(declare-fun m!571449 () Bool)

(assert (=> b!593468 m!571449))

(assert (=> b!593466 m!571419))

(declare-fun m!571451 () Bool)

(assert (=> b!593478 m!571451))

(declare-fun m!571453 () Bool)

(assert (=> b!593463 m!571453))

(assert (=> b!593477 m!571421))

(declare-fun m!571455 () Bool)

(assert (=> b!593477 m!571455))

(declare-fun m!571457 () Bool)

(assert (=> b!593467 m!571457))

(assert (=> b!593479 m!571419))

(assert (=> b!593479 m!571419))

(declare-fun m!571459 () Bool)

(assert (=> b!593479 m!571459))

(assert (=> b!593479 m!571419))

(declare-fun m!571461 () Bool)

(assert (=> b!593479 m!571461))

(declare-fun m!571463 () Bool)

(assert (=> start!54334 m!571463))

(declare-fun m!571465 () Bool)

(assert (=> start!54334 m!571465))

(push 1)

(assert (not b!593463))

(assert (not start!54334))

(assert (not b!593461))

(assert (not b!593470))

(assert (not b!593468))

(assert (not b!593474))

(assert (not b!593467))

(assert (not b!593462))

(assert (not b!593472))

(assert (not b!593469))

(assert (not b!593464))

(assert (not b!593465))

(assert (not b!593479))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86457 () Bool)

(declare-fun res!380006 () Bool)

(declare-fun e!339114 () Bool)

(assert (=> d!86457 (=> res!380006 e!339114)))

(assert (=> d!86457 (= res!380006 (= (select (arr!17736 lt!269432) index!984) (select (arr!17736 a!2986) j!136)))))

(assert (=> d!86457 (= (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) index!984) e!339114)))

(declare-fun b!593660 () Bool)

(declare-fun e!339116 () Bool)

(assert (=> b!593660 (= e!339114 e!339116)))

(declare-fun res!380008 () Bool)

(assert (=> b!593660 (=> (not res!380008) (not e!339116))))

(assert (=> b!593660 (= res!380008 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18100 lt!269432)))))

(declare-fun b!593662 () Bool)

(assert (=> b!593662 (= e!339116 (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86457 (not res!380006)) b!593660))

(assert (= (and b!593660 res!380008) b!593662))

(declare-fun m!571606 () Bool)

(assert (=> d!86457 m!571606))

(assert (=> b!593662 m!571419))

(declare-fun m!571610 () Bool)

(assert (=> b!593662 m!571610))

(assert (=> b!593468 d!86457))

(declare-fun d!86463 () Bool)

(declare-fun res!380010 () Bool)

(declare-fun e!339124 () Bool)

(assert (=> d!86463 (=> res!380010 e!339124)))

(assert (=> d!86463 (= res!380010 (= (select (arr!17736 lt!269432) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17736 a!2986) j!136)))))

(assert (=> d!86463 (= (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!339124)))

(declare-fun b!593676 () Bool)

(declare-fun e!339125 () Bool)

(assert (=> b!593676 (= e!339124 e!339125)))

(declare-fun res!380011 () Bool)

(assert (=> b!593676 (=> (not res!380011) (not e!339125))))

(assert (=> b!593676 (= res!380011 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18100 lt!269432)))))

(declare-fun b!593677 () Bool)

(assert (=> b!593677 (= e!339125 (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86463 (not res!380010)) b!593676))

(assert (= (and b!593676 res!380011) b!593677))

(declare-fun m!571613 () Bool)

(assert (=> d!86463 m!571613))

(assert (=> b!593677 m!571419))

(declare-fun m!571615 () Bool)

(assert (=> b!593677 m!571615))

(assert (=> b!593479 d!86463))

(declare-fun d!86465 () Bool)

(assert (=> d!86465 (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269530 () Unit!18622)

(declare-fun choose!114 (array!36938 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18622)

(assert (=> d!86465 (= lt!269530 (choose!114 lt!269432 (select (arr!17736 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86465 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86465 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269432 (select (arr!17736 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269530)))

(declare-fun bs!18311 () Bool)

(assert (= bs!18311 d!86465))

(assert (=> bs!18311 m!571419))

(assert (=> bs!18311 m!571459))

(assert (=> bs!18311 m!571419))

(declare-fun m!571625 () Bool)

(assert (=> bs!18311 m!571625))

(assert (=> b!593479 d!86465))

(declare-fun d!86473 () Bool)

(assert (=> d!86473 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593469 d!86473))

(declare-fun b!593719 () Bool)

(declare-fun e!339150 () SeekEntryResult!6176)

(declare-fun e!339151 () SeekEntryResult!6176)

(assert (=> b!593719 (= e!339150 e!339151)))

(declare-fun c!67219 () Bool)

(declare-fun lt!269547 () (_ BitVec 64))

(assert (=> b!593719 (= c!67219 (= lt!269547 (select (arr!17736 a!2986) j!136)))))

(declare-fun lt!269548 () SeekEntryResult!6176)

(declare-fun d!86477 () Bool)

(assert (=> d!86477 (and (or (is-Undefined!6176 lt!269548) (not (is-Found!6176 lt!269548)) (and (bvsge (index!26947 lt!269548) #b00000000000000000000000000000000) (bvslt (index!26947 lt!269548) (size!18100 a!2986)))) (or (is-Undefined!6176 lt!269548) (is-Found!6176 lt!269548) (not (is-MissingVacant!6176 lt!269548)) (not (= (index!26949 lt!269548) vacantSpotIndex!68)) (and (bvsge (index!26949 lt!269548) #b00000000000000000000000000000000) (bvslt (index!26949 lt!269548) (size!18100 a!2986)))) (or (is-Undefined!6176 lt!269548) (ite (is-Found!6176 lt!269548) (= (select (arr!17736 a!2986) (index!26947 lt!269548)) (select (arr!17736 a!2986) j!136)) (and (is-MissingVacant!6176 lt!269548) (= (index!26949 lt!269548) vacantSpotIndex!68) (= (select (arr!17736 a!2986) (index!26949 lt!269548)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86477 (= lt!269548 e!339150)))

(declare-fun c!67220 () Bool)

(assert (=> d!86477 (= c!67220 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86477 (= lt!269547 (select (arr!17736 a!2986) index!984))))

(assert (=> d!86477 (validMask!0 mask!3053)))

(assert (=> d!86477 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17736 a!2986) j!136) a!2986 mask!3053) lt!269548)))

(declare-fun b!593720 () Bool)

(declare-fun e!339149 () SeekEntryResult!6176)

(assert (=> b!593720 (= e!339149 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17736 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593721 () Bool)

(assert (=> b!593721 (= e!339151 (Found!6176 index!984))))

(declare-fun b!593722 () Bool)

(assert (=> b!593722 (= e!339149 (MissingVacant!6176 vacantSpotIndex!68))))

(declare-fun b!593723 () Bool)

(assert (=> b!593723 (= e!339150 Undefined!6176)))

(declare-fun b!593724 () Bool)

(declare-fun c!67218 () Bool)

(assert (=> b!593724 (= c!67218 (= lt!269547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593724 (= e!339151 e!339149)))

(assert (= (and d!86477 c!67220) b!593723))

(assert (= (and d!86477 (not c!67220)) b!593719))

(assert (= (and b!593719 c!67219) b!593721))

(assert (= (and b!593719 (not c!67219)) b!593724))

(assert (= (and b!593724 c!67218) b!593722))

(assert (= (and b!593724 (not c!67218)) b!593720))

(declare-fun m!571661 () Bool)

(assert (=> d!86477 m!571661))

(declare-fun m!571663 () Bool)

(assert (=> d!86477 m!571663))

(assert (=> d!86477 m!571425))

(assert (=> d!86477 m!571463))

(assert (=> b!593720 m!571433))

(assert (=> b!593720 m!571433))

(assert (=> b!593720 m!571419))

(declare-fun m!571665 () Bool)

(assert (=> b!593720 m!571665))

(assert (=> b!593470 d!86477))

(declare-fun d!86497 () Bool)

(declare-fun res!380019 () Bool)

(declare-fun e!339154 () Bool)

(assert (=> d!86497 (=> res!380019 e!339154)))

(assert (=> d!86497 (= res!380019 (= (select (arr!17736 lt!269432) j!136) (select (arr!17736 a!2986) j!136)))))

(assert (=> d!86497 (= (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) j!136) e!339154)))

(declare-fun b!593727 () Bool)

(declare-fun e!339155 () Bool)

(assert (=> b!593727 (= e!339154 e!339155)))

(declare-fun res!380020 () Bool)

(assert (=> b!593727 (=> (not res!380020) (not e!339155))))

(assert (=> b!593727 (= res!380020 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18100 lt!269432)))))

(declare-fun b!593728 () Bool)

(assert (=> b!593728 (= e!339155 (arrayContainsKey!0 lt!269432 (select (arr!17736 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86497 (not res!380019)) b!593727))

(assert (= (and b!593727 res!380020) b!593728))

(declare-fun m!571671 () Bool)

(assert (=> d!86497 m!571671))

(assert (=> b!593728 m!571419))

(declare-fun m!571673 () Bool)

(assert (=> b!593728 m!571673))

(assert (=> b!593461 d!86497))

(declare-fun b!593743 () Bool)

(declare-fun e!339171 () Bool)

(declare-fun e!339170 () Bool)

(assert (=> b!593743 (= e!339171 e!339170)))

(declare-fun c!67223 () Bool)

(assert (=> b!593743 (= c!67223 (validKeyInArray!0 (select (arr!17736 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593744 () Bool)

(declare-fun call!32876 () Bool)

(assert (=> b!593744 (= e!339170 call!32876)))

(declare-fun b!593745 () Bool)

(declare-fun e!339169 () Bool)

(declare-fun contains!2914 (List!11777 (_ BitVec 64)) Bool)

(assert (=> b!593745 (= e!339169 (contains!2914 Nil!11774 (select (arr!17736 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86501 () Bool)

(declare-fun res!380033 () Bool)

(declare-fun e!339168 () Bool)

(assert (=> d!86501 (=> res!380033 e!339168)))

(assert (=> d!86501 (= res!380033 (bvsge #b00000000000000000000000000000000 (size!18100 a!2986)))))

(assert (=> d!86501 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11774) e!339168)))

(declare-fun b!593746 () Bool)

(assert (=> b!593746 (= e!339170 call!32876)))

(declare-fun bm!32873 () Bool)

(assert (=> bm!32873 (= call!32876 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67223 (Cons!11773 (select (arr!17736 a!2986) #b00000000000000000000000000000000) Nil!11774) Nil!11774)))))

(declare-fun b!593747 () Bool)

(assert (=> b!593747 (= e!339168 e!339171)))

(declare-fun res!380032 () Bool)

(assert (=> b!593747 (=> (not res!380032) (not e!339171))))

(assert (=> b!593747 (= res!380032 (not e!339169))))

(declare-fun res!380031 () Bool)

(assert (=> b!593747 (=> (not res!380031) (not e!339169))))

(assert (=> b!593747 (= res!380031 (validKeyInArray!0 (select (arr!17736 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86501 (not res!380033)) b!593747))

(assert (= (and b!593747 res!380031) b!593745))

(assert (= (and b!593747 res!380032) b!593743))

(assert (= (and b!593743 c!67223) b!593744))

(assert (= (and b!593743 (not c!67223)) b!593746))

(assert (= (or b!593744 b!593746) bm!32873))

(declare-fun m!571679 () Bool)

(assert (=> b!593743 m!571679))

(assert (=> b!593743 m!571679))

(declare-fun m!571681 () Bool)

(assert (=> b!593743 m!571681))

(assert (=> b!593745 m!571679))

(assert (=> b!593745 m!571679))

(declare-fun m!571683 () Bool)

(assert (=> b!593745 m!571683))

(assert (=> bm!32873 m!571679))

(declare-fun m!571685 () Bool)

(assert (=> bm!32873 m!571685))

(assert (=> b!593747 m!571679))

(assert (=> b!593747 m!571679))

(assert (=> b!593747 m!571681))

(assert (=> b!593472 d!86501))

(declare-fun d!86507 () Bool)

(assert (=> d!86507 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54334 d!86507))

(declare-fun d!86519 () Bool)

(assert (=> d!86519 (= (array_inv!13532 a!2986) (bvsge (size!18100 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54334 d!86519))

(declare-fun b!593757 () Bool)

(declare-fun e!339182 () SeekEntryResult!6176)

(declare-fun e!339183 () SeekEntryResult!6176)

(assert (=> b!593757 (= e!339182 e!339183)))

(declare-fun lt!269555 () (_ BitVec 64))

(declare-fun c!67225 () Bool)

(assert (=> b!593757 (= c!67225 (= lt!269555 (select (arr!17736 a!2986) j!136)))))

(declare-fun d!86521 () Bool)

(declare-fun lt!269556 () SeekEntryResult!6176)

(assert (=> d!86521 (and (or (is-Undefined!6176 lt!269556) (not (is-Found!6176 lt!269556)) (and (bvsge (index!26947 lt!269556) #b00000000000000000000000000000000) (bvslt (index!26947 lt!269556) (size!18100 a!2986)))) (or (is-Undefined!6176 lt!269556) (is-Found!6176 lt!269556) (not (is-MissingVacant!6176 lt!269556)) (not (= (index!26949 lt!269556) vacantSpotIndex!68)) (and (bvsge (index!26949 lt!269556) #b00000000000000000000000000000000) (bvslt (index!26949 lt!269556) (size!18100 a!2986)))) (or (is-Undefined!6176 lt!269556) (ite (is-Found!6176 lt!269556) (= (select (arr!17736 a!2986) (index!26947 lt!269556)) (select (arr!17736 a!2986) j!136)) (and (is-MissingVacant!6176 lt!269556) (= (index!26949 lt!269556) vacantSpotIndex!68) (= (select (arr!17736 a!2986) (index!26949 lt!269556)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86521 (= lt!269556 e!339182)))

(declare-fun c!67226 () Bool)

(assert (=> d!86521 (= c!67226 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86521 (= lt!269555 (select (arr!17736 a!2986) lt!269434))))

(assert (=> d!86521 (validMask!0 mask!3053)))

(assert (=> d!86521 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269434 vacantSpotIndex!68 (select (arr!17736 a!2986) j!136) a!2986 mask!3053) lt!269556)))

(declare-fun e!339181 () SeekEntryResult!6176)

(declare-fun b!593758 () Bool)

(assert (=> b!593758 (= e!339181 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269434 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17736 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593759 () Bool)

(assert (=> b!593759 (= e!339183 (Found!6176 lt!269434))))

(declare-fun b!593760 () Bool)

(assert (=> b!593760 (= e!339181 (MissingVacant!6176 vacantSpotIndex!68))))

(declare-fun b!593761 () Bool)

(assert (=> b!593761 (= e!339182 Undefined!6176)))

(declare-fun b!593762 () Bool)

(declare-fun c!67224 () Bool)

(assert (=> b!593762 (= c!67224 (= lt!269555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593762 (= e!339183 e!339181)))

(assert (= (and d!86521 c!67226) b!593761))

(assert (= (and d!86521 (not c!67226)) b!593757))

(assert (= (and b!593757 c!67225) b!593759))

(assert (= (and b!593757 (not c!67225)) b!593762))

(assert (= (and b!593762 c!67224) b!593760))

(assert (= (and b!593762 (not c!67224)) b!593758))

(declare-fun m!571699 () Bool)

(assert (=> d!86521 m!571699))

(declare-fun m!571701 () Bool)

(assert (=> d!86521 m!571701))

(declare-fun m!571703 () Bool)

(assert (=> d!86521 m!571703))

(assert (=> d!86521 m!571463))

(declare-fun m!571705 () Bool)

(assert (=> b!593758 m!571705))

(assert (=> b!593758 m!571705))

(assert (=> b!593758 m!571419))

(declare-fun m!571707 () Bool)

(assert (=> b!593758 m!571707))

(assert (=> b!593462 d!86521))

(declare-fun d!86523 () Bool)

(declare-fun e!339208 () Bool)

(assert (=> d!86523 e!339208))

(declare-fun res!380049 () Bool)

(assert (=> d!86523 (=> (not res!380049) (not e!339208))))

(assert (=> d!86523 (= res!380049 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18100 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18100 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18100 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18100 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18100 a!2986))))))

(declare-fun lt!269574 () Unit!18622)

(declare-fun choose!9 (array!36938 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18622)

(assert (=> d!86523 (= lt!269574 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269434 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86523 (validMask!0 mask!3053)))

(assert (=> d!86523 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269434 vacantSpotIndex!68 mask!3053) lt!269574)))

(declare-fun b!593805 () Bool)

(assert (=> b!593805 (= e!339208 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269434 vacantSpotIndex!68 (select (arr!17736 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269434 vacantSpotIndex!68 (select (store (arr!17736 a!2986) i!1108 k!1786) j!136) (array!36939 (store (arr!17736 a!2986) i!1108 k!1786) (size!18100 a!2986)) mask!3053)))))

(assert (= (and d!86523 res!380049) b!593805))

(declare-fun m!571749 () Bool)

(assert (=> d!86523 m!571749))

(assert (=> d!86523 m!571463))

(assert (=> b!593805 m!571435))

(declare-fun m!571751 () Bool)

(assert (=> b!593805 m!571751))

(assert (=> b!593805 m!571435))

(assert (=> b!593805 m!571419))

(assert (=> b!593805 m!571421))

(assert (=> b!593805 m!571419))

(assert (=> b!593805 m!571443))

(assert (=> b!593462 d!86523))

(declare-fun b!593806 () Bool)

(declare-fun e!339210 () SeekEntryResult!6176)

(declare-fun e!339211 () SeekEntryResult!6176)

(assert (=> b!593806 (= e!339210 e!339211)))

(declare-fun c!67246 () Bool)

(declare-fun lt!269575 () (_ BitVec 64))

(assert (=> b!593806 (= c!67246 (= lt!269575 lt!269426))))

(declare-fun d!86539 () Bool)

(declare-fun lt!269576 () SeekEntryResult!6176)

(assert (=> d!86539 (and (or (is-Undefined!6176 lt!269576) (not (is-Found!6176 lt!269576)) (and (bvsge (index!26947 lt!269576) #b00000000000000000000000000000000) (bvslt (index!26947 lt!269576) (size!18100 lt!269432)))) (or (is-Undefined!6176 lt!269576) (is-Found!6176 lt!269576) (not (is-MissingVacant!6176 lt!269576)) (not (= (index!26949 lt!269576) vacantSpotIndex!68)) (and (bvsge (index!26949 lt!269576) #b00000000000000000000000000000000) (bvslt (index!26949 lt!269576) (size!18100 lt!269432)))) (or (is-Undefined!6176 lt!269576) (ite (is-Found!6176 lt!269576) (= (select (arr!17736 lt!269432) (index!26947 lt!269576)) lt!269426) (and (is-MissingVacant!6176 lt!269576) (= (index!26949 lt!269576) vacantSpotIndex!68) (= (select (arr!17736 lt!269432) (index!26949 lt!269576)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86539 (= lt!269576 e!339210)))

(declare-fun c!67247 () Bool)

(assert (=> d!86539 (= c!67247 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86539 (= lt!269575 (select (arr!17736 lt!269432) lt!269434))))

