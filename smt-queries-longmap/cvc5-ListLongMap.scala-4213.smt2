; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57722 () Bool)

(assert start!57722)

(declare-fun b!638594 () Bool)

(declare-fun res!413404 () Bool)

(declare-fun e!365416 () Bool)

(assert (=> b!638594 (=> (not res!413404) (not e!365416))))

(declare-datatypes ((array!38293 0))(
  ( (array!38294 (arr!18369 (Array (_ BitVec 32) (_ BitVec 64))) (size!18733 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38293)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638594 (= res!413404 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!413405 () Bool)

(assert (=> start!57722 (=> (not res!413405) (not e!365416))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57722 (= res!413405 (validMask!0 mask!3053))))

(assert (=> start!57722 e!365416))

(assert (=> start!57722 true))

(declare-fun array_inv!14165 (array!38293) Bool)

(assert (=> start!57722 (array_inv!14165 a!2986)))

(declare-fun b!638595 () Bool)

(declare-fun e!365419 () Bool)

(declare-fun e!365417 () Bool)

(assert (=> b!638595 (= e!365419 e!365417)))

(declare-fun res!413413 () Bool)

(assert (=> b!638595 (=> res!413413 e!365417)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295356 () (_ BitVec 64))

(declare-fun lt!295360 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638595 (= res!413413 (or (not (= (select (arr!18369 a!2986) j!136) lt!295360)) (not (= (select (arr!18369 a!2986) j!136) lt!295356)) (bvsge j!136 index!984)))))

(declare-fun b!638596 () Bool)

(declare-fun e!365424 () Bool)

(assert (=> b!638596 (= e!365424 (bvslt (size!18733 a!2986) #b01111111111111111111111111111111))))

(declare-fun lt!295355 () array!38293)

(declare-datatypes ((List!12410 0))(
  ( (Nil!12407) (Cons!12406 (h!13451 (_ BitVec 64)) (t!18638 List!12410)) )
))
(declare-fun arrayNoDuplicates!0 (array!38293 (_ BitVec 32) List!12410) Bool)

(assert (=> b!638596 (arrayNoDuplicates!0 lt!295355 #b00000000000000000000000000000000 Nil!12407)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((Unit!21570 0))(
  ( (Unit!21571) )
))
(declare-fun lt!295352 () Unit!21570)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12410) Unit!21570)

(assert (=> b!638596 (= lt!295352 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12407))))

(assert (=> b!638596 (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295350 () Unit!21570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21570)

(assert (=> b!638596 (= lt!295350 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295355 (select (arr!18369 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638597 () Bool)

(declare-fun res!413410 () Bool)

(declare-fun e!365421 () Bool)

(assert (=> b!638597 (=> (not res!413410) (not e!365421))))

(assert (=> b!638597 (= res!413410 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12407))))

(declare-fun b!638598 () Bool)

(declare-fun res!413401 () Bool)

(assert (=> b!638598 (=> (not res!413401) (not e!365416))))

(assert (=> b!638598 (= res!413401 (and (= (size!18733 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18733 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18733 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638599 () Bool)

(assert (=> b!638599 (= e!365416 e!365421)))

(declare-fun res!413398 () Bool)

(assert (=> b!638599 (=> (not res!413398) (not e!365421))))

(declare-datatypes ((SeekEntryResult!6809 0))(
  ( (MissingZero!6809 (index!29550 (_ BitVec 32))) (Found!6809 (index!29551 (_ BitVec 32))) (Intermediate!6809 (undefined!7621 Bool) (index!29552 (_ BitVec 32)) (x!58307 (_ BitVec 32))) (Undefined!6809) (MissingVacant!6809 (index!29553 (_ BitVec 32))) )
))
(declare-fun lt!295359 () SeekEntryResult!6809)

(assert (=> b!638599 (= res!413398 (or (= lt!295359 (MissingZero!6809 i!1108)) (= lt!295359 (MissingVacant!6809 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38293 (_ BitVec 32)) SeekEntryResult!6809)

(assert (=> b!638599 (= lt!295359 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!638600 () Bool)

(declare-fun e!365415 () Bool)

(declare-fun e!365420 () Bool)

(assert (=> b!638600 (= e!365415 (not e!365420))))

(declare-fun res!413400 () Bool)

(assert (=> b!638600 (=> res!413400 e!365420)))

(declare-fun lt!295358 () SeekEntryResult!6809)

(assert (=> b!638600 (= res!413400 (not (= lt!295358 (Found!6809 index!984))))))

(declare-fun lt!295353 () Unit!21570)

(declare-fun e!365422 () Unit!21570)

(assert (=> b!638600 (= lt!295353 e!365422)))

(declare-fun c!72965 () Bool)

(assert (=> b!638600 (= c!72965 (= lt!295358 Undefined!6809))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38293 (_ BitVec 32)) SeekEntryResult!6809)

(assert (=> b!638600 (= lt!295358 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295360 lt!295355 mask!3053))))

(declare-fun e!365418 () Bool)

(assert (=> b!638600 e!365418))

(declare-fun res!413406 () Bool)

(assert (=> b!638600 (=> (not res!413406) (not e!365418))))

(declare-fun lt!295349 () SeekEntryResult!6809)

(declare-fun lt!295357 () (_ BitVec 32))

(assert (=> b!638600 (= res!413406 (= lt!295349 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295357 vacantSpotIndex!68 lt!295360 lt!295355 mask!3053)))))

(assert (=> b!638600 (= lt!295349 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295357 vacantSpotIndex!68 (select (arr!18369 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638600 (= lt!295360 (select (store (arr!18369 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295354 () Unit!21570)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21570)

(assert (=> b!638600 (= lt!295354 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295357 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638600 (= lt!295357 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638601 () Bool)

(declare-fun res!413403 () Bool)

(assert (=> b!638601 (=> (not res!413403) (not e!365416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638601 (= res!413403 (validKeyInArray!0 k!1786))))

(declare-fun b!638602 () Bool)

(declare-fun e!365414 () Bool)

(assert (=> b!638602 (= e!365414 e!365415)))

(declare-fun res!413409 () Bool)

(assert (=> b!638602 (=> (not res!413409) (not e!365415))))

(declare-fun lt!295351 () SeekEntryResult!6809)

(assert (=> b!638602 (= res!413409 (and (= lt!295351 (Found!6809 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18369 a!2986) index!984) (select (arr!18369 a!2986) j!136))) (not (= (select (arr!18369 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638602 (= lt!295351 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18369 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638603 () Bool)

(declare-fun Unit!21572 () Unit!21570)

(assert (=> b!638603 (= e!365422 Unit!21572)))

(declare-fun b!638604 () Bool)

(declare-fun Unit!21573 () Unit!21570)

(assert (=> b!638604 (= e!365422 Unit!21573)))

(assert (=> b!638604 false))

(declare-fun b!638605 () Bool)

(assert (=> b!638605 (= e!365421 e!365414)))

(declare-fun res!413408 () Bool)

(assert (=> b!638605 (=> (not res!413408) (not e!365414))))

(assert (=> b!638605 (= res!413408 (= (select (store (arr!18369 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638605 (= lt!295355 (array!38294 (store (arr!18369 a!2986) i!1108 k!1786) (size!18733 a!2986)))))

(declare-fun e!365423 () Bool)

(declare-fun b!638606 () Bool)

(assert (=> b!638606 (= e!365423 (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) index!984))))

(declare-fun b!638607 () Bool)

(assert (=> b!638607 (= e!365420 e!365424)))

(declare-fun res!413407 () Bool)

(assert (=> b!638607 (=> res!413407 e!365424)))

(assert (=> b!638607 (= res!413407 (or (not (= (select (arr!18369 a!2986) j!136) lt!295360)) (not (= (select (arr!18369 a!2986) j!136) lt!295356)) (bvsge j!136 index!984)))))

(assert (=> b!638607 e!365419))

(declare-fun res!413412 () Bool)

(assert (=> b!638607 (=> (not res!413412) (not e!365419))))

(assert (=> b!638607 (= res!413412 (= lt!295356 (select (arr!18369 a!2986) j!136)))))

(assert (=> b!638607 (= lt!295356 (select (store (arr!18369 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!638608 () Bool)

(assert (=> b!638608 (= e!365417 e!365423)))

(declare-fun res!413414 () Bool)

(assert (=> b!638608 (=> (not res!413414) (not e!365423))))

(assert (=> b!638608 (= res!413414 (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) j!136))))

(declare-fun b!638609 () Bool)

(assert (=> b!638609 (= e!365418 (= lt!295351 lt!295349))))

(declare-fun b!638610 () Bool)

(declare-fun res!413402 () Bool)

(assert (=> b!638610 (=> (not res!413402) (not e!365421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38293 (_ BitVec 32)) Bool)

(assert (=> b!638610 (= res!413402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638611 () Bool)

(declare-fun res!413399 () Bool)

(assert (=> b!638611 (=> (not res!413399) (not e!365416))))

(assert (=> b!638611 (= res!413399 (validKeyInArray!0 (select (arr!18369 a!2986) j!136)))))

(declare-fun b!638612 () Bool)

(declare-fun res!413411 () Bool)

(assert (=> b!638612 (=> (not res!413411) (not e!365421))))

(assert (=> b!638612 (= res!413411 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18369 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57722 res!413405) b!638598))

(assert (= (and b!638598 res!413401) b!638611))

(assert (= (and b!638611 res!413399) b!638601))

(assert (= (and b!638601 res!413403) b!638594))

(assert (= (and b!638594 res!413404) b!638599))

(assert (= (and b!638599 res!413398) b!638610))

(assert (= (and b!638610 res!413402) b!638597))

(assert (= (and b!638597 res!413410) b!638612))

(assert (= (and b!638612 res!413411) b!638605))

(assert (= (and b!638605 res!413408) b!638602))

(assert (= (and b!638602 res!413409) b!638600))

(assert (= (and b!638600 res!413406) b!638609))

(assert (= (and b!638600 c!72965) b!638604))

(assert (= (and b!638600 (not c!72965)) b!638603))

(assert (= (and b!638600 (not res!413400)) b!638607))

(assert (= (and b!638607 res!413412) b!638595))

(assert (= (and b!638595 (not res!413413)) b!638608))

(assert (= (and b!638608 res!413414) b!638606))

(assert (= (and b!638607 (not res!413407)) b!638596))

(declare-fun m!612515 () Bool)

(assert (=> b!638595 m!612515))

(declare-fun m!612517 () Bool)

(assert (=> b!638599 m!612517))

(declare-fun m!612519 () Bool)

(assert (=> b!638597 m!612519))

(declare-fun m!612521 () Bool)

(assert (=> b!638602 m!612521))

(assert (=> b!638602 m!612515))

(assert (=> b!638602 m!612515))

(declare-fun m!612523 () Bool)

(assert (=> b!638602 m!612523))

(assert (=> b!638606 m!612515))

(assert (=> b!638606 m!612515))

(declare-fun m!612525 () Bool)

(assert (=> b!638606 m!612525))

(assert (=> b!638607 m!612515))

(declare-fun m!612527 () Bool)

(assert (=> b!638607 m!612527))

(declare-fun m!612529 () Bool)

(assert (=> b!638607 m!612529))

(assert (=> b!638605 m!612527))

(declare-fun m!612531 () Bool)

(assert (=> b!638605 m!612531))

(declare-fun m!612533 () Bool)

(assert (=> b!638612 m!612533))

(assert (=> b!638611 m!612515))

(assert (=> b!638611 m!612515))

(declare-fun m!612535 () Bool)

(assert (=> b!638611 m!612535))

(assert (=> b!638596 m!612515))

(declare-fun m!612537 () Bool)

(assert (=> b!638596 m!612537))

(assert (=> b!638596 m!612515))

(declare-fun m!612539 () Bool)

(assert (=> b!638596 m!612539))

(assert (=> b!638596 m!612515))

(declare-fun m!612541 () Bool)

(assert (=> b!638596 m!612541))

(declare-fun m!612543 () Bool)

(assert (=> b!638596 m!612543))

(assert (=> b!638608 m!612515))

(assert (=> b!638608 m!612515))

(declare-fun m!612545 () Bool)

(assert (=> b!638608 m!612545))

(declare-fun m!612547 () Bool)

(assert (=> b!638600 m!612547))

(declare-fun m!612549 () Bool)

(assert (=> b!638600 m!612549))

(assert (=> b!638600 m!612515))

(assert (=> b!638600 m!612527))

(declare-fun m!612551 () Bool)

(assert (=> b!638600 m!612551))

(declare-fun m!612553 () Bool)

(assert (=> b!638600 m!612553))

(assert (=> b!638600 m!612515))

(declare-fun m!612555 () Bool)

(assert (=> b!638600 m!612555))

(declare-fun m!612557 () Bool)

(assert (=> b!638600 m!612557))

(declare-fun m!612559 () Bool)

(assert (=> start!57722 m!612559))

(declare-fun m!612561 () Bool)

(assert (=> start!57722 m!612561))

(declare-fun m!612563 () Bool)

(assert (=> b!638594 m!612563))

(declare-fun m!612565 () Bool)

(assert (=> b!638610 m!612565))

(declare-fun m!612567 () Bool)

(assert (=> b!638601 m!612567))

(push 1)

(assert (not b!638599))

(assert (not b!638602))

(assert (not b!638610))

(assert (not b!638597))

(assert (not b!638608))

(assert (not b!638600))

(assert (not b!638611))

(assert (not b!638606))

(assert (not b!638596))

(assert (not start!57722))

(assert (not b!638594))

(assert (not b!638601))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90229 () Bool)

(assert (=> d!90229 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!638601 d!90229))

(declare-fun b!638835 () Bool)

(declare-fun e!365574 () SeekEntryResult!6809)

(assert (=> b!638835 (= e!365574 Undefined!6809)))

(declare-fun b!638836 () Bool)

(declare-fun e!365576 () SeekEntryResult!6809)

(assert (=> b!638836 (= e!365576 (Found!6809 index!984))))

(declare-fun lt!295466 () SeekEntryResult!6809)

(declare-fun d!90235 () Bool)

(assert (=> d!90235 (and (or (is-Undefined!6809 lt!295466) (not (is-Found!6809 lt!295466)) (and (bvsge (index!29551 lt!295466) #b00000000000000000000000000000000) (bvslt (index!29551 lt!295466) (size!18733 a!2986)))) (or (is-Undefined!6809 lt!295466) (is-Found!6809 lt!295466) (not (is-MissingVacant!6809 lt!295466)) (not (= (index!29553 lt!295466) vacantSpotIndex!68)) (and (bvsge (index!29553 lt!295466) #b00000000000000000000000000000000) (bvslt (index!29553 lt!295466) (size!18733 a!2986)))) (or (is-Undefined!6809 lt!295466) (ite (is-Found!6809 lt!295466) (= (select (arr!18369 a!2986) (index!29551 lt!295466)) (select (arr!18369 a!2986) j!136)) (and (is-MissingVacant!6809 lt!295466) (= (index!29553 lt!295466) vacantSpotIndex!68) (= (select (arr!18369 a!2986) (index!29553 lt!295466)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90235 (= lt!295466 e!365574)))

(declare-fun c!73004 () Bool)

(assert (=> d!90235 (= c!73004 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!295465 () (_ BitVec 64))

(assert (=> d!90235 (= lt!295465 (select (arr!18369 a!2986) index!984))))

(assert (=> d!90235 (validMask!0 mask!3053)))

(assert (=> d!90235 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18369 a!2986) j!136) a!2986 mask!3053) lt!295466)))

(declare-fun b!638837 () Bool)

(assert (=> b!638837 (= e!365574 e!365576)))

(declare-fun c!73003 () Bool)

(assert (=> b!638837 (= c!73003 (= lt!295465 (select (arr!18369 a!2986) j!136)))))

(declare-fun b!638838 () Bool)

(declare-fun e!365575 () SeekEntryResult!6809)

(assert (=> b!638838 (= e!365575 (MissingVacant!6809 vacantSpotIndex!68))))

(declare-fun b!638839 () Bool)

(declare-fun c!73005 () Bool)

(assert (=> b!638839 (= c!73005 (= lt!295465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638839 (= e!365576 e!365575)))

(declare-fun b!638840 () Bool)

(assert (=> b!638840 (= e!365575 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18369 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90235 c!73004) b!638835))

(assert (= (and d!90235 (not c!73004)) b!638837))

(assert (= (and b!638837 c!73003) b!638836))

(assert (= (and b!638837 (not c!73003)) b!638839))

(assert (= (and b!638839 c!73005) b!638838))

(assert (= (and b!638839 (not c!73005)) b!638840))

(declare-fun m!612743 () Bool)

(assert (=> d!90235 m!612743))

(declare-fun m!612745 () Bool)

(assert (=> d!90235 m!612745))

(assert (=> d!90235 m!612521))

(assert (=> d!90235 m!612559))

(assert (=> b!638840 m!612547))

(assert (=> b!638840 m!612547))

(assert (=> b!638840 m!612515))

(declare-fun m!612747 () Bool)

(assert (=> b!638840 m!612747))

(assert (=> b!638602 d!90235))

(declare-fun d!90247 () Bool)

(declare-fun res!413567 () Bool)

(declare-fun e!365584 () Bool)

(assert (=> d!90247 (=> res!413567 e!365584)))

(assert (=> d!90247 (= res!413567 (= (select (arr!18369 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!90247 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!365584)))

(declare-fun b!638851 () Bool)

(declare-fun e!365585 () Bool)

(assert (=> b!638851 (= e!365584 e!365585)))

(declare-fun res!413568 () Bool)

(assert (=> b!638851 (=> (not res!413568) (not e!365585))))

(assert (=> b!638851 (= res!413568 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18733 a!2986)))))

(declare-fun b!638852 () Bool)

(assert (=> b!638852 (= e!365585 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90247 (not res!413567)) b!638851))

(assert (= (and b!638851 res!413568) b!638852))

(declare-fun m!612755 () Bool)

(assert (=> d!90247 m!612755))

(declare-fun m!612757 () Bool)

(assert (=> b!638852 m!612757))

(assert (=> b!638594 d!90247))

(declare-fun d!90251 () Bool)

(declare-fun res!413576 () Bool)

(declare-fun e!365601 () Bool)

(assert (=> d!90251 (=> res!413576 e!365601)))

(assert (=> d!90251 (= res!413576 (bvsge #b00000000000000000000000000000000 (size!18733 lt!295355)))))

(assert (=> d!90251 (= (arrayNoDuplicates!0 lt!295355 #b00000000000000000000000000000000 Nil!12407) e!365601)))

(declare-fun b!638875 () Bool)

(declare-fun e!365603 () Bool)

(declare-fun call!33480 () Bool)

(assert (=> b!638875 (= e!365603 call!33480)))

(declare-fun b!638876 () Bool)

(declare-fun e!365600 () Bool)

(assert (=> b!638876 (= e!365600 e!365603)))

(declare-fun c!73017 () Bool)

(assert (=> b!638876 (= c!73017 (validKeyInArray!0 (select (arr!18369 lt!295355) #b00000000000000000000000000000000)))))

(declare-fun b!638877 () Bool)

(assert (=> b!638877 (= e!365603 call!33480)))

(declare-fun bm!33477 () Bool)

(assert (=> bm!33477 (= call!33480 (arrayNoDuplicates!0 lt!295355 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73017 (Cons!12406 (select (arr!18369 lt!295355) #b00000000000000000000000000000000) Nil!12407) Nil!12407)))))

(declare-fun b!638878 () Bool)

(assert (=> b!638878 (= e!365601 e!365600)))

(declare-fun res!413577 () Bool)

(assert (=> b!638878 (=> (not res!413577) (not e!365600))))

(declare-fun e!365602 () Bool)

(assert (=> b!638878 (= res!413577 (not e!365602))))

(declare-fun res!413575 () Bool)

(assert (=> b!638878 (=> (not res!413575) (not e!365602))))

(assert (=> b!638878 (= res!413575 (validKeyInArray!0 (select (arr!18369 lt!295355) #b00000000000000000000000000000000)))))

(declare-fun b!638879 () Bool)

(declare-fun contains!3123 (List!12410 (_ BitVec 64)) Bool)

(assert (=> b!638879 (= e!365602 (contains!3123 Nil!12407 (select (arr!18369 lt!295355) #b00000000000000000000000000000000)))))

(assert (= (and d!90251 (not res!413576)) b!638878))

(assert (= (and b!638878 res!413575) b!638879))

(assert (= (and b!638878 res!413577) b!638876))

(assert (= (and b!638876 c!73017) b!638877))

(assert (= (and b!638876 (not c!73017)) b!638875))

(assert (= (or b!638877 b!638875) bm!33477))

(declare-fun m!612759 () Bool)

(assert (=> b!638876 m!612759))

(assert (=> b!638876 m!612759))

(declare-fun m!612761 () Bool)

(assert (=> b!638876 m!612761))

(assert (=> bm!33477 m!612759))

(declare-fun m!612763 () Bool)

(assert (=> bm!33477 m!612763))

(assert (=> b!638878 m!612759))

(assert (=> b!638878 m!612759))

(assert (=> b!638878 m!612761))

(assert (=> b!638879 m!612759))

(assert (=> b!638879 m!612759))

(declare-fun m!612765 () Bool)

(assert (=> b!638879 m!612765))

(assert (=> b!638596 d!90251))

(declare-fun d!90253 () Bool)

(declare-fun e!365619 () Bool)

(assert (=> d!90253 e!365619))

(declare-fun res!413584 () Bool)

(assert (=> d!90253 (=> (not res!413584) (not e!365619))))

(assert (=> d!90253 (= res!413584 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18733 a!2986))))))

(declare-fun lt!295484 () Unit!21570)

(declare-fun choose!41 (array!38293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12410) Unit!21570)

(assert (=> d!90253 (= lt!295484 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12407))))

(assert (=> d!90253 (bvslt (size!18733 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90253 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12407) lt!295484)))

(declare-fun b!638904 () Bool)

(assert (=> b!638904 (= e!365619 (arrayNoDuplicates!0 (array!38294 (store (arr!18369 a!2986) i!1108 k!1786) (size!18733 a!2986)) #b00000000000000000000000000000000 Nil!12407))))

(assert (= (and d!90253 res!413584) b!638904))

(declare-fun m!612795 () Bool)

(assert (=> d!90253 m!612795))

(assert (=> b!638904 m!612527))

(declare-fun m!612799 () Bool)

(assert (=> b!638904 m!612799))

(assert (=> b!638596 d!90253))

(declare-fun d!90273 () Bool)

(declare-fun res!413585 () Bool)

(declare-fun e!365623 () Bool)

(assert (=> d!90273 (=> res!413585 e!365623)))

(assert (=> d!90273 (= res!413585 (= (select (arr!18369 lt!295355) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18369 a!2986) j!136)))))

(assert (=> d!90273 (= (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!365623)))

(declare-fun b!638911 () Bool)

(declare-fun e!365624 () Bool)

(assert (=> b!638911 (= e!365623 e!365624)))

(declare-fun res!413586 () Bool)

(assert (=> b!638911 (=> (not res!413586) (not e!365624))))

(assert (=> b!638911 (= res!413586 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18733 lt!295355)))))

(declare-fun b!638912 () Bool)

(assert (=> b!638912 (= e!365624 (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90273 (not res!413585)) b!638911))

(assert (= (and b!638911 res!413586) b!638912))

(declare-fun m!612801 () Bool)

(assert (=> d!90273 m!612801))

(assert (=> b!638912 m!612515))

(declare-fun m!612803 () Bool)

(assert (=> b!638912 m!612803))

(assert (=> b!638596 d!90273))

(declare-fun d!90275 () Bool)

(assert (=> d!90275 (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295492 () Unit!21570)

(declare-fun choose!114 (array!38293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21570)

(assert (=> d!90275 (= lt!295492 (choose!114 lt!295355 (select (arr!18369 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90275 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90275 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295355 (select (arr!18369 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!295492)))

(declare-fun bs!19153 () Bool)

(assert (= bs!19153 d!90275))

(assert (=> bs!19153 m!612515))

(assert (=> bs!19153 m!612541))

(assert (=> bs!19153 m!612515))

(declare-fun m!612813 () Bool)

(assert (=> bs!19153 m!612813))

(assert (=> b!638596 d!90275))

(declare-fun d!90281 () Bool)

(declare-fun res!413587 () Bool)

(declare-fun e!365625 () Bool)

(assert (=> d!90281 (=> res!413587 e!365625)))

(assert (=> d!90281 (= res!413587 (= (select (arr!18369 lt!295355) index!984) (select (arr!18369 a!2986) j!136)))))

(assert (=> d!90281 (= (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) index!984) e!365625)))

(declare-fun b!638913 () Bool)

(declare-fun e!365626 () Bool)

(assert (=> b!638913 (= e!365625 e!365626)))

(declare-fun res!413588 () Bool)

(assert (=> b!638913 (=> (not res!413588) (not e!365626))))

(assert (=> b!638913 (= res!413588 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18733 lt!295355)))))

(declare-fun b!638914 () Bool)

(assert (=> b!638914 (= e!365626 (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90281 (not res!413587)) b!638913))

(assert (= (and b!638913 res!413588) b!638914))

(declare-fun m!612815 () Bool)

(assert (=> d!90281 m!612815))

(assert (=> b!638914 m!612515))

(declare-fun m!612817 () Bool)

(assert (=> b!638914 m!612817))

(assert (=> b!638606 d!90281))

(declare-fun d!90283 () Bool)

(declare-fun res!413589 () Bool)

(declare-fun e!365627 () Bool)

(assert (=> d!90283 (=> res!413589 e!365627)))

(assert (=> d!90283 (= res!413589 (= (select (arr!18369 lt!295355) j!136) (select (arr!18369 a!2986) j!136)))))

(assert (=> d!90283 (= (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) j!136) e!365627)))

(declare-fun b!638915 () Bool)

(declare-fun e!365628 () Bool)

(assert (=> b!638915 (= e!365627 e!365628)))

(declare-fun res!413590 () Bool)

(assert (=> b!638915 (=> (not res!413590) (not e!365628))))

(assert (=> b!638915 (= res!413590 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18733 lt!295355)))))

(declare-fun b!638916 () Bool)

(assert (=> b!638916 (= e!365628 (arrayContainsKey!0 lt!295355 (select (arr!18369 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90283 (not res!413589)) b!638915))

(assert (= (and b!638915 res!413590) b!638916))

(declare-fun m!612819 () Bool)

(assert (=> d!90283 m!612819))

(assert (=> b!638916 m!612515))

(declare-fun m!612821 () Bool)

(assert (=> b!638916 m!612821))

(assert (=> b!638608 d!90283))

(declare-fun d!90285 () Bool)

(declare-fun res!413592 () Bool)

(declare-fun e!365630 () Bool)

(assert (=> d!90285 (=> res!413592 e!365630)))

(assert (=> d!90285 (= res!413592 (bvsge #b00000000000000000000000000000000 (size!18733 a!2986)))))

(assert (=> d!90285 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12407) e!365630)))

(declare-fun b!638917 () Bool)

(declare-fun e!365632 () Bool)

(declare-fun call!33481 () Bool)

(assert (=> b!638917 (= e!365632 call!33481)))

(declare-fun b!638918 () Bool)

(declare-fun e!365629 () Bool)

(assert (=> b!638918 (= e!365629 e!365632)))

(declare-fun c!73030 () Bool)

(assert (=> b!638918 (= c!73030 (validKeyInArray!0 (select (arr!18369 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!638919 () Bool)

(assert (=> b!638919 (= e!365632 call!33481)))

(declare-fun bm!33478 () Bool)

(assert (=> bm!33478 (= call!33481 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73030 (Cons!12406 (select (arr!18369 a!2986) #b00000000000000000000000000000000) Nil!12407) Nil!12407)))))

(declare-fun b!638920 () Bool)

(assert (=> b!638920 (= e!365630 e!365629)))

(declare-fun res!413593 () Bool)

(assert (=> b!638920 (=> (not res!413593) (not e!365629))))

(declare-fun e!365631 () Bool)

(assert (=> b!638920 (= res!413593 (not e!365631))))

(declare-fun res!413591 () Bool)

(assert (=> b!638920 (=> (not res!413591) (not e!365631))))

(assert (=> b!638920 (= res!413591 (validKeyInArray!0 (select (arr!18369 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!638921 () Bool)

(assert (=> b!638921 (= e!365631 (contains!3123 Nil!12407 (select (arr!18369 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90285 (not res!413592)) b!638920))

(assert (= (and b!638920 res!413591) b!638921))

(assert (= (and b!638920 res!413593) b!638918))

(assert (= (and b!638918 c!73030) b!638919))

(assert (= (and b!638918 (not c!73030)) b!638917))

(assert (= (or b!638919 b!638917) bm!33478))

(assert (=> b!638918 m!612755))

(assert (=> b!638918 m!612755))

(declare-fun m!612823 () Bool)

(assert (=> b!638918 m!612823))

(assert (=> bm!33478 m!612755))

(declare-fun m!612825 () Bool)

(assert (=> bm!33478 m!612825))

(assert (=> b!638920 m!612755))

(assert (=> b!638920 m!612755))

(assert (=> b!638920 m!612823))

(assert (=> b!638921 m!612755))

(assert (=> b!638921 m!612755))

(declare-fun m!612827 () Bool)

(assert (=> b!638921 m!612827))

(assert (=> b!638597 d!90285))

(declare-fun d!90287 () Bool)

(declare-fun lt!295517 () SeekEntryResult!6809)

(assert (=> d!90287 (and (or (is-Undefined!6809 lt!295517) (not (is-Found!6809 lt!295517)) (and (bvsge (index!29551 lt!295517) #b00000000000000000000000000000000) (bvslt (index!29551 lt!295517) (size!18733 a!2986)))) (or (is-Undefined!6809 lt!295517) (is-Found!6809 lt!295517) (not (is-MissingZero!6809 lt!295517)) (and (bvsge (index!29550 lt!295517) #b00000000000000000000000000000000) (bvslt (index!29550 lt!295517) (size!18733 a!2986)))) (or (is-Undefined!6809 lt!295517) (is-Found!6809 lt!295517) (is-MissingZero!6809 lt!295517) (not (is-MissingVacant!6809 lt!295517)) (and (bvsge (index!29553 lt!295517) #b00000000000000000000000000000000) (bvslt (index!29553 lt!295517) (size!18733 a!2986)))) (or (is-Undefined!6809 lt!295517) (ite (is-Found!6809 lt!295517) (= (select (arr!18369 a!2986) (index!29551 lt!295517)) k!1786) (ite (is-MissingZero!6809 lt!295517) (= (select (arr!18369 a!2986) (index!29550 lt!295517)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6809 lt!295517) (= (select (arr!18369 a!2986) (index!29553 lt!295517)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!365664 () SeekEntryResult!6809)

(assert (=> d!90287 (= lt!295517 e!365664)))

(declare-fun c!73047 () Bool)

(declare-fun lt!295519 () SeekEntryResult!6809)

(assert (=> d!90287 (= c!73047 (and (is-Intermediate!6809 lt!295519) (undefined!7621 lt!295519)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38293 (_ BitVec 32)) SeekEntryResult!6809)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90287 (= lt!295519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90287 (validMask!0 mask!3053)))

(assert (=> d!90287 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!295517)))

(declare-fun b!638968 () Bool)

(declare-fun e!365663 () SeekEntryResult!6809)

(assert (=> b!638968 (= e!365663 (Found!6809 (index!29552 lt!295519)))))

(declare-fun b!638969 () Bool)

(declare-fun c!73048 () Bool)

(declare-fun lt!295518 () (_ BitVec 64))

(assert (=> b!638969 (= c!73048 (= lt!295518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!365665 () SeekEntryResult!6809)

(assert (=> b!638969 (= e!365663 e!365665)))

(declare-fun b!638970 () Bool)

(assert (=> b!638970 (= e!365664 e!365663)))

(assert (=> b!638970 (= lt!295518 (select (arr!18369 a!2986) (index!29552 lt!295519)))))

(declare-fun c!73049 () Bool)

(assert (=> b!638970 (= c!73049 (= lt!295518 k!1786))))

(declare-fun b!638971 () Bool)

(assert (=> 