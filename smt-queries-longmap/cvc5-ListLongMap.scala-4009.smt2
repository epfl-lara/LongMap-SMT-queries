; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54526 () Bool)

(assert start!54526)

(declare-fun b!595516 () Bool)

(declare-datatypes ((Unit!18706 0))(
  ( (Unit!18707) )
))
(declare-fun e!340249 () Unit!18706)

(declare-fun Unit!18708 () Unit!18706)

(assert (=> b!595516 (= e!340249 Unit!18708)))

(declare-fun b!595517 () Bool)

(declare-fun res!381399 () Bool)

(declare-fun e!340256 () Bool)

(assert (=> b!595517 (=> res!381399 e!340256)))

(declare-datatypes ((List!11798 0))(
  ( (Nil!11795) (Cons!11794 (h!12839 (_ BitVec 64)) (t!18026 List!11798)) )
))
(declare-fun noDuplicate!252 (List!11798) Bool)

(assert (=> b!595517 (= res!381399 (not (noDuplicate!252 Nil!11795)))))

(declare-fun b!595518 () Bool)

(declare-fun res!381390 () Bool)

(assert (=> b!595518 (=> res!381390 e!340256)))

(declare-fun contains!2933 (List!11798 (_ BitVec 64)) Bool)

(assert (=> b!595518 (= res!381390 (contains!2933 Nil!11795 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595519 () Bool)

(declare-fun e!340257 () Bool)

(declare-fun e!340248 () Bool)

(assert (=> b!595519 (= e!340257 e!340248)))

(declare-fun res!381389 () Bool)

(assert (=> b!595519 (=> (not res!381389) (not e!340248))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36986 0))(
  ( (array!36987 (arr!17757 (Array (_ BitVec 32) (_ BitVec 64))) (size!18121 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36986)

(assert (=> b!595519 (= res!381389 (= (select (store (arr!17757 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270420 () array!36986)

(assert (=> b!595519 (= lt!270420 (array!36987 (store (arr!17757 a!2986) i!1108 k!1786) (size!18121 a!2986)))))

(declare-fun b!595520 () Bool)

(declare-fun res!381395 () Bool)

(assert (=> b!595520 (=> (not res!381395) (not e!340257))))

(declare-fun arrayNoDuplicates!0 (array!36986 (_ BitVec 32) List!11798) Bool)

(assert (=> b!595520 (= res!381395 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11795))))

(declare-fun b!595521 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!340254 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595521 (= e!340254 (arrayContainsKey!0 lt!270420 (select (arr!17757 a!2986) j!136) index!984))))

(declare-fun b!595522 () Bool)

(declare-fun res!381387 () Bool)

(assert (=> b!595522 (=> res!381387 e!340256)))

(assert (=> b!595522 (= res!381387 (contains!2933 Nil!11795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595523 () Bool)

(declare-fun e!340251 () Bool)

(assert (=> b!595523 (= e!340248 e!340251)))

(declare-fun res!381404 () Bool)

(assert (=> b!595523 (=> (not res!381404) (not e!340251))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6197 0))(
  ( (MissingZero!6197 (index!27036 (_ BitVec 32))) (Found!6197 (index!27037 (_ BitVec 32))) (Intermediate!6197 (undefined!7009 Bool) (index!27038 (_ BitVec 32)) (x!55841 (_ BitVec 32))) (Undefined!6197) (MissingVacant!6197 (index!27039 (_ BitVec 32))) )
))
(declare-fun lt!270415 () SeekEntryResult!6197)

(assert (=> b!595523 (= res!381404 (and (= lt!270415 (Found!6197 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17757 a!2986) index!984) (select (arr!17757 a!2986) j!136))) (not (= (select (arr!17757 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36986 (_ BitVec 32)) SeekEntryResult!6197)

(assert (=> b!595523 (= lt!270415 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17757 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595525 () Bool)

(declare-fun res!381391 () Bool)

(declare-fun e!340252 () Bool)

(assert (=> b!595525 (=> (not res!381391) (not e!340252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595525 (= res!381391 (validKeyInArray!0 (select (arr!17757 a!2986) j!136)))))

(declare-fun b!595526 () Bool)

(declare-fun e!340255 () Bool)

(declare-fun e!340253 () Bool)

(assert (=> b!595526 (= e!340255 e!340253)))

(declare-fun res!381403 () Bool)

(assert (=> b!595526 (=> res!381403 e!340253)))

(declare-fun lt!270418 () (_ BitVec 64))

(declare-fun lt!270419 () (_ BitVec 64))

(assert (=> b!595526 (= res!381403 (or (not (= (select (arr!17757 a!2986) j!136) lt!270418)) (not (= (select (arr!17757 a!2986) j!136) lt!270419)) (bvsge j!136 index!984)))))

(declare-fun e!340245 () Bool)

(assert (=> b!595526 e!340245))

(declare-fun res!381393 () Bool)

(assert (=> b!595526 (=> (not res!381393) (not e!340245))))

(assert (=> b!595526 (= res!381393 (= lt!270419 (select (arr!17757 a!2986) j!136)))))

(assert (=> b!595526 (= lt!270419 (select (store (arr!17757 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595527 () Bool)

(declare-fun res!381396 () Bool)

(assert (=> b!595527 (=> (not res!381396) (not e!340252))))

(assert (=> b!595527 (= res!381396 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595528 () Bool)

(assert (=> b!595528 (= e!340252 e!340257)))

(declare-fun res!381402 () Bool)

(assert (=> b!595528 (=> (not res!381402) (not e!340257))))

(declare-fun lt!270412 () SeekEntryResult!6197)

(assert (=> b!595528 (= res!381402 (or (= lt!270412 (MissingZero!6197 i!1108)) (= lt!270412 (MissingVacant!6197 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36986 (_ BitVec 32)) SeekEntryResult!6197)

(assert (=> b!595528 (= lt!270412 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595529 () Bool)

(declare-fun Unit!18709 () Unit!18706)

(assert (=> b!595529 (= e!340249 Unit!18709)))

(assert (=> b!595529 false))

(declare-fun b!595530 () Bool)

(declare-fun res!381400 () Bool)

(assert (=> b!595530 (=> (not res!381400) (not e!340257))))

(assert (=> b!595530 (= res!381400 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17757 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595531 () Bool)

(assert (=> b!595531 (= e!340253 e!340256)))

(declare-fun res!381388 () Bool)

(assert (=> b!595531 (=> res!381388 e!340256)))

(assert (=> b!595531 (= res!381388 (or (bvsge (size!18121 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18121 a!2986))))))

(assert (=> b!595531 (arrayContainsKey!0 lt!270420 (select (arr!17757 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270416 () Unit!18706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36986 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18706)

(assert (=> b!595531 (= lt!270416 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270420 (select (arr!17757 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595532 () Bool)

(assert (=> b!595532 (= e!340256 true)))

(declare-fun lt!270410 () Bool)

(assert (=> b!595532 (= lt!270410 (contains!2933 Nil!11795 k!1786))))

(declare-fun b!595533 () Bool)

(declare-fun e!340247 () Bool)

(declare-fun lt!270414 () SeekEntryResult!6197)

(assert (=> b!595533 (= e!340247 (= lt!270415 lt!270414))))

(declare-fun b!595534 () Bool)

(declare-fun e!340250 () Bool)

(assert (=> b!595534 (= e!340245 e!340250)))

(declare-fun res!381398 () Bool)

(assert (=> b!595534 (=> res!381398 e!340250)))

(assert (=> b!595534 (= res!381398 (or (not (= (select (arr!17757 a!2986) j!136) lt!270418)) (not (= (select (arr!17757 a!2986) j!136) lt!270419)) (bvsge j!136 index!984)))))

(declare-fun b!595535 () Bool)

(declare-fun res!381394 () Bool)

(assert (=> b!595535 (=> (not res!381394) (not e!340252))))

(assert (=> b!595535 (= res!381394 (and (= (size!18121 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18121 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18121 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595536 () Bool)

(assert (=> b!595536 (= e!340250 e!340254)))

(declare-fun res!381397 () Bool)

(assert (=> b!595536 (=> (not res!381397) (not e!340254))))

(assert (=> b!595536 (= res!381397 (arrayContainsKey!0 lt!270420 (select (arr!17757 a!2986) j!136) j!136))))

(declare-fun res!381401 () Bool)

(assert (=> start!54526 (=> (not res!381401) (not e!340252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54526 (= res!381401 (validMask!0 mask!3053))))

(assert (=> start!54526 e!340252))

(assert (=> start!54526 true))

(declare-fun array_inv!13553 (array!36986) Bool)

(assert (=> start!54526 (array_inv!13553 a!2986)))

(declare-fun b!595524 () Bool)

(declare-fun res!381386 () Bool)

(assert (=> b!595524 (=> (not res!381386) (not e!340257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36986 (_ BitVec 32)) Bool)

(assert (=> b!595524 (= res!381386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595537 () Bool)

(declare-fun res!381392 () Bool)

(assert (=> b!595537 (=> (not res!381392) (not e!340252))))

(assert (=> b!595537 (= res!381392 (validKeyInArray!0 k!1786))))

(declare-fun b!595538 () Bool)

(assert (=> b!595538 (= e!340251 (not e!340255))))

(declare-fun res!381384 () Bool)

(assert (=> b!595538 (=> res!381384 e!340255)))

(declare-fun lt!270417 () SeekEntryResult!6197)

(assert (=> b!595538 (= res!381384 (not (= lt!270417 (Found!6197 index!984))))))

(declare-fun lt!270411 () Unit!18706)

(assert (=> b!595538 (= lt!270411 e!340249)))

(declare-fun c!67433 () Bool)

(assert (=> b!595538 (= c!67433 (= lt!270417 Undefined!6197))))

(assert (=> b!595538 (= lt!270417 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270418 lt!270420 mask!3053))))

(assert (=> b!595538 e!340247))

(declare-fun res!381385 () Bool)

(assert (=> b!595538 (=> (not res!381385) (not e!340247))))

(declare-fun lt!270421 () (_ BitVec 32))

(assert (=> b!595538 (= res!381385 (= lt!270414 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270421 vacantSpotIndex!68 lt!270418 lt!270420 mask!3053)))))

(assert (=> b!595538 (= lt!270414 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270421 vacantSpotIndex!68 (select (arr!17757 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595538 (= lt!270418 (select (store (arr!17757 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270413 () Unit!18706)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36986 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18706)

(assert (=> b!595538 (= lt!270413 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270421 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595538 (= lt!270421 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54526 res!381401) b!595535))

(assert (= (and b!595535 res!381394) b!595525))

(assert (= (and b!595525 res!381391) b!595537))

(assert (= (and b!595537 res!381392) b!595527))

(assert (= (and b!595527 res!381396) b!595528))

(assert (= (and b!595528 res!381402) b!595524))

(assert (= (and b!595524 res!381386) b!595520))

(assert (= (and b!595520 res!381395) b!595530))

(assert (= (and b!595530 res!381400) b!595519))

(assert (= (and b!595519 res!381389) b!595523))

(assert (= (and b!595523 res!381404) b!595538))

(assert (= (and b!595538 res!381385) b!595533))

(assert (= (and b!595538 c!67433) b!595529))

(assert (= (and b!595538 (not c!67433)) b!595516))

(assert (= (and b!595538 (not res!381384)) b!595526))

(assert (= (and b!595526 res!381393) b!595534))

(assert (= (and b!595534 (not res!381398)) b!595536))

(assert (= (and b!595536 res!381397) b!595521))

(assert (= (and b!595526 (not res!381403)) b!595531))

(assert (= (and b!595531 (not res!381388)) b!595517))

(assert (= (and b!595517 (not res!381399)) b!595522))

(assert (= (and b!595522 (not res!381387)) b!595518))

(assert (= (and b!595518 (not res!381390)) b!595532))

(declare-fun m!573155 () Bool)

(assert (=> b!595528 m!573155))

(declare-fun m!573157 () Bool)

(assert (=> b!595519 m!573157))

(declare-fun m!573159 () Bool)

(assert (=> b!595519 m!573159))

(declare-fun m!573161 () Bool)

(assert (=> b!595523 m!573161))

(declare-fun m!573163 () Bool)

(assert (=> b!595523 m!573163))

(assert (=> b!595523 m!573163))

(declare-fun m!573165 () Bool)

(assert (=> b!595523 m!573165))

(assert (=> b!595525 m!573163))

(assert (=> b!595525 m!573163))

(declare-fun m!573167 () Bool)

(assert (=> b!595525 m!573167))

(assert (=> b!595521 m!573163))

(assert (=> b!595521 m!573163))

(declare-fun m!573169 () Bool)

(assert (=> b!595521 m!573169))

(assert (=> b!595531 m!573163))

(assert (=> b!595531 m!573163))

(declare-fun m!573171 () Bool)

(assert (=> b!595531 m!573171))

(assert (=> b!595531 m!573163))

(declare-fun m!573173 () Bool)

(assert (=> b!595531 m!573173))

(declare-fun m!573175 () Bool)

(assert (=> b!595520 m!573175))

(declare-fun m!573177 () Bool)

(assert (=> b!595524 m!573177))

(declare-fun m!573179 () Bool)

(assert (=> b!595532 m!573179))

(declare-fun m!573181 () Bool)

(assert (=> b!595522 m!573181))

(assert (=> b!595536 m!573163))

(assert (=> b!595536 m!573163))

(declare-fun m!573183 () Bool)

(assert (=> b!595536 m!573183))

(assert (=> b!595534 m!573163))

(declare-fun m!573185 () Bool)

(assert (=> b!595518 m!573185))

(declare-fun m!573187 () Bool)

(assert (=> b!595527 m!573187))

(declare-fun m!573189 () Bool)

(assert (=> b!595538 m!573189))

(assert (=> b!595538 m!573163))

(assert (=> b!595538 m!573157))

(assert (=> b!595538 m!573163))

(declare-fun m!573191 () Bool)

(assert (=> b!595538 m!573191))

(declare-fun m!573193 () Bool)

(assert (=> b!595538 m!573193))

(declare-fun m!573195 () Bool)

(assert (=> b!595538 m!573195))

(declare-fun m!573197 () Bool)

(assert (=> b!595538 m!573197))

(declare-fun m!573199 () Bool)

(assert (=> b!595538 m!573199))

(declare-fun m!573201 () Bool)

(assert (=> start!54526 m!573201))

(declare-fun m!573203 () Bool)

(assert (=> start!54526 m!573203))

(declare-fun m!573205 () Bool)

(assert (=> b!595517 m!573205))

(assert (=> b!595526 m!573163))

(assert (=> b!595526 m!573157))

(declare-fun m!573207 () Bool)

(assert (=> b!595526 m!573207))

(declare-fun m!573209 () Bool)

(assert (=> b!595537 m!573209))

(declare-fun m!573211 () Bool)

(assert (=> b!595530 m!573211))

(push 1)

