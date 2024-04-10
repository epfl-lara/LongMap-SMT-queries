; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57126 () Bool)

(assert start!57126)

(declare-fun b!632675 () Bool)

(declare-fun e!361703 () Bool)

(declare-fun e!361704 () Bool)

(assert (=> b!632675 (= e!361703 e!361704)))

(declare-fun res!409249 () Bool)

(assert (=> b!632675 (=> res!409249 e!361704)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!292427 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38145 0))(
  ( (array!38146 (arr!18305 (Array (_ BitVec 32) (_ BitVec 64))) (size!18669 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38145)

(assert (=> b!632675 (= res!409249 (or (not (= (select (arr!18305 a!2986) j!136) lt!292427)) (not (= (select (arr!18305 a!2986) j!136) (select (store (arr!18305 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984)))))

(assert (=> b!632675 (= (select (store (arr!18305 a!2986) i!1108 k!1786) index!984) (select (arr!18305 a!2986) j!136))))

(declare-fun b!632676 () Bool)

(declare-fun res!409255 () Bool)

(declare-fun e!361702 () Bool)

(assert (=> b!632676 (=> (not res!409255) (not e!361702))))

(declare-datatypes ((List!12346 0))(
  ( (Nil!12343) (Cons!12342 (h!13387 (_ BitVec 64)) (t!18574 List!12346)) )
))
(declare-fun arrayNoDuplicates!0 (array!38145 (_ BitVec 32) List!12346) Bool)

(assert (=> b!632676 (= res!409255 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12343))))

(declare-fun b!632677 () Bool)

(declare-fun e!361707 () Bool)

(assert (=> b!632677 (= e!361702 e!361707)))

(declare-fun res!409256 () Bool)

(assert (=> b!632677 (=> (not res!409256) (not e!361707))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!632677 (= res!409256 (= (select (store (arr!18305 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292430 () array!38145)

(assert (=> b!632677 (= lt!292430 (array!38146 (store (arr!18305 a!2986) i!1108 k!1786) (size!18669 a!2986)))))

(declare-fun b!632678 () Bool)

(declare-fun arrayContainsKey!0 (array!38145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632678 (= e!361704 (arrayContainsKey!0 lt!292430 (select (arr!18305 a!2986) j!136) j!136))))

(declare-fun b!632679 () Bool)

(declare-fun res!409243 () Bool)

(declare-fun e!361706 () Bool)

(assert (=> b!632679 (=> (not res!409243) (not e!361706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632679 (= res!409243 (validKeyInArray!0 k!1786))))

(declare-fun b!632680 () Bool)

(declare-fun res!409254 () Bool)

(assert (=> b!632680 (=> (not res!409254) (not e!361702))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38145 (_ BitVec 32)) Bool)

(assert (=> b!632680 (= res!409254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632681 () Bool)

(declare-datatypes ((Unit!21314 0))(
  ( (Unit!21315) )
))
(declare-fun e!361699 () Unit!21314)

(declare-fun Unit!21316 () Unit!21314)

(assert (=> b!632681 (= e!361699 Unit!21316)))

(assert (=> b!632681 false))

(declare-fun b!632682 () Bool)

(declare-fun e!361705 () Bool)

(declare-datatypes ((SeekEntryResult!6745 0))(
  ( (MissingZero!6745 (index!29273 (_ BitVec 32))) (Found!6745 (index!29274 (_ BitVec 32))) (Intermediate!6745 (undefined!7557 Bool) (index!29275 (_ BitVec 32)) (x!58004 (_ BitVec 32))) (Undefined!6745) (MissingVacant!6745 (index!29276 (_ BitVec 32))) )
))
(declare-fun lt!292434 () SeekEntryResult!6745)

(declare-fun lt!292433 () SeekEntryResult!6745)

(assert (=> b!632682 (= e!361705 (= lt!292434 lt!292433))))

(declare-fun b!632683 () Bool)

(declare-fun Unit!21317 () Unit!21314)

(assert (=> b!632683 (= e!361699 Unit!21317)))

(declare-fun res!409252 () Bool)

(assert (=> start!57126 (=> (not res!409252) (not e!361706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57126 (= res!409252 (validMask!0 mask!3053))))

(assert (=> start!57126 e!361706))

(assert (=> start!57126 true))

(declare-fun array_inv!14101 (array!38145) Bool)

(assert (=> start!57126 (array_inv!14101 a!2986)))

(declare-fun b!632684 () Bool)

(declare-fun res!409253 () Bool)

(assert (=> b!632684 (=> (not res!409253) (not e!361706))))

(assert (=> b!632684 (= res!409253 (and (= (size!18669 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18669 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18669 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632685 () Bool)

(declare-fun e!361701 () Bool)

(assert (=> b!632685 (= e!361707 e!361701)))

(declare-fun res!409250 () Bool)

(assert (=> b!632685 (=> (not res!409250) (not e!361701))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!632685 (= res!409250 (and (= lt!292434 (Found!6745 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18305 a!2986) index!984) (select (arr!18305 a!2986) j!136))) (not (= (select (arr!18305 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38145 (_ BitVec 32)) SeekEntryResult!6745)

(assert (=> b!632685 (= lt!292434 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632686 () Bool)

(declare-fun res!409248 () Bool)

(assert (=> b!632686 (=> (not res!409248) (not e!361702))))

(assert (=> b!632686 (= res!409248 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18305 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632687 () Bool)

(declare-fun res!409244 () Bool)

(assert (=> b!632687 (=> (not res!409244) (not e!361706))))

(assert (=> b!632687 (= res!409244 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632688 () Bool)

(declare-fun res!409245 () Bool)

(assert (=> b!632688 (=> (not res!409245) (not e!361706))))

(assert (=> b!632688 (= res!409245 (validKeyInArray!0 (select (arr!18305 a!2986) j!136)))))

(declare-fun b!632689 () Bool)

(assert (=> b!632689 (= e!361706 e!361702)))

(declare-fun res!409247 () Bool)

(assert (=> b!632689 (=> (not res!409247) (not e!361702))))

(declare-fun lt!292429 () SeekEntryResult!6745)

(assert (=> b!632689 (= res!409247 (or (= lt!292429 (MissingZero!6745 i!1108)) (= lt!292429 (MissingVacant!6745 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38145 (_ BitVec 32)) SeekEntryResult!6745)

(assert (=> b!632689 (= lt!292429 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632690 () Bool)

(assert (=> b!632690 (= e!361701 (not e!361703))))

(declare-fun res!409246 () Bool)

(assert (=> b!632690 (=> res!409246 e!361703)))

(declare-fun lt!292428 () SeekEntryResult!6745)

(assert (=> b!632690 (= res!409246 (not (= lt!292428 (Found!6745 index!984))))))

(declare-fun lt!292431 () Unit!21314)

(assert (=> b!632690 (= lt!292431 e!361699)))

(declare-fun c!72083 () Bool)

(assert (=> b!632690 (= c!72083 (= lt!292428 Undefined!6745))))

(assert (=> b!632690 (= lt!292428 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292427 lt!292430 mask!3053))))

(assert (=> b!632690 e!361705))

(declare-fun res!409251 () Bool)

(assert (=> b!632690 (=> (not res!409251) (not e!361705))))

(declare-fun lt!292435 () (_ BitVec 32))

(assert (=> b!632690 (= res!409251 (= lt!292433 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292435 vacantSpotIndex!68 lt!292427 lt!292430 mask!3053)))))

(assert (=> b!632690 (= lt!292433 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292435 vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632690 (= lt!292427 (select (store (arr!18305 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292432 () Unit!21314)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21314)

(assert (=> b!632690 (= lt!292432 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292435 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632690 (= lt!292435 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57126 res!409252) b!632684))

(assert (= (and b!632684 res!409253) b!632688))

(assert (= (and b!632688 res!409245) b!632679))

(assert (= (and b!632679 res!409243) b!632687))

(assert (= (and b!632687 res!409244) b!632689))

(assert (= (and b!632689 res!409247) b!632680))

(assert (= (and b!632680 res!409254) b!632676))

(assert (= (and b!632676 res!409255) b!632686))

(assert (= (and b!632686 res!409248) b!632677))

(assert (= (and b!632677 res!409256) b!632685))

(assert (= (and b!632685 res!409250) b!632690))

(assert (= (and b!632690 res!409251) b!632682))

(assert (= (and b!632690 c!72083) b!632681))

(assert (= (and b!632690 (not c!72083)) b!632683))

(assert (= (and b!632690 (not res!409246)) b!632675))

(assert (= (and b!632675 (not res!409249)) b!632678))

(declare-fun m!607483 () Bool)

(assert (=> start!57126 m!607483))

(declare-fun m!607485 () Bool)

(assert (=> start!57126 m!607485))

(declare-fun m!607487 () Bool)

(assert (=> b!632686 m!607487))

(declare-fun m!607489 () Bool)

(assert (=> b!632680 m!607489))

(declare-fun m!607491 () Bool)

(assert (=> b!632677 m!607491))

(declare-fun m!607493 () Bool)

(assert (=> b!632677 m!607493))

(declare-fun m!607495 () Bool)

(assert (=> b!632675 m!607495))

(assert (=> b!632675 m!607491))

(declare-fun m!607497 () Bool)

(assert (=> b!632675 m!607497))

(assert (=> b!632678 m!607495))

(assert (=> b!632678 m!607495))

(declare-fun m!607499 () Bool)

(assert (=> b!632678 m!607499))

(declare-fun m!607501 () Bool)

(assert (=> b!632690 m!607501))

(declare-fun m!607503 () Bool)

(assert (=> b!632690 m!607503))

(assert (=> b!632690 m!607495))

(declare-fun m!607505 () Bool)

(assert (=> b!632690 m!607505))

(declare-fun m!607507 () Bool)

(assert (=> b!632690 m!607507))

(declare-fun m!607509 () Bool)

(assert (=> b!632690 m!607509))

(assert (=> b!632690 m!607495))

(declare-fun m!607511 () Bool)

(assert (=> b!632690 m!607511))

(assert (=> b!632690 m!607491))

(declare-fun m!607513 () Bool)

(assert (=> b!632676 m!607513))

(assert (=> b!632688 m!607495))

(assert (=> b!632688 m!607495))

(declare-fun m!607515 () Bool)

(assert (=> b!632688 m!607515))

(declare-fun m!607517 () Bool)

(assert (=> b!632679 m!607517))

(declare-fun m!607519 () Bool)

(assert (=> b!632685 m!607519))

(assert (=> b!632685 m!607495))

(assert (=> b!632685 m!607495))

(declare-fun m!607521 () Bool)

(assert (=> b!632685 m!607521))

(declare-fun m!607523 () Bool)

(assert (=> b!632689 m!607523))

(declare-fun m!607525 () Bool)

(assert (=> b!632687 m!607525))

(push 1)

(assert (not b!632689))

(assert (not b!632690))

(assert (not b!632688))

(assert (not b!632687))

(assert (not b!632679))

(assert (not start!57126))

(assert (not b!632685))

(assert (not b!632678))

(assert (not b!632676))

(assert (not b!632680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!292479 () SeekEntryResult!6745)

(declare-fun d!89431 () Bool)

(assert (=> d!89431 (and (or (is-Undefined!6745 lt!292479) (not (is-Found!6745 lt!292479)) (and (bvsge (index!29274 lt!292479) #b00000000000000000000000000000000) (bvslt (index!29274 lt!292479) (size!18669 lt!292430)))) (or (is-Undefined!6745 lt!292479) (is-Found!6745 lt!292479) (not (is-MissingVacant!6745 lt!292479)) (not (= (index!29276 lt!292479) vacantSpotIndex!68)) (and (bvsge (index!29276 lt!292479) #b00000000000000000000000000000000) (bvslt (index!29276 lt!292479) (size!18669 lt!292430)))) (or (is-Undefined!6745 lt!292479) (ite (is-Found!6745 lt!292479) (= (select (arr!18305 lt!292430) (index!29274 lt!292479)) lt!292427) (and (is-MissingVacant!6745 lt!292479) (= (index!29276 lt!292479) vacantSpotIndex!68) (= (select (arr!18305 lt!292430) (index!29276 lt!292479)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361764 () SeekEntryResult!6745)

(assert (=> d!89431 (= lt!292479 e!361764)))

(declare-fun c!72129 () Bool)

(assert (=> d!89431 (= c!72129 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!292478 () (_ BitVec 64))

(assert (=> d!89431 (= lt!292478 (select (arr!18305 lt!292430) lt!292435))))

(assert (=> d!89431 (validMask!0 mask!3053)))

(assert (=> d!89431 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292435 vacantSpotIndex!68 lt!292427 lt!292430 mask!3053) lt!292479)))

(declare-fun b!632790 () Bool)

(declare-fun e!361763 () SeekEntryResult!6745)

(assert (=> b!632790 (= e!361763 (MissingVacant!6745 vacantSpotIndex!68))))

(declare-fun b!632791 () Bool)

(assert (=> b!632791 (= e!361764 Undefined!6745)))

(declare-fun b!632792 () Bool)

(declare-fun c!72130 () Bool)

(assert (=> b!632792 (= c!72130 (= lt!292478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361762 () SeekEntryResult!6745)

(assert (=> b!632792 (= e!361762 e!361763)))

(declare-fun b!632793 () Bool)

(assert (=> b!632793 (= e!361763 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292435 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!292427 lt!292430 mask!3053))))

(declare-fun b!632794 () Bool)

(assert (=> b!632794 (= e!361764 e!361762)))

(declare-fun c!72131 () Bool)

(assert (=> b!632794 (= c!72131 (= lt!292478 lt!292427))))

(declare-fun b!632795 () Bool)

(assert (=> b!632795 (= e!361762 (Found!6745 lt!292435))))

(assert (= (and d!89431 c!72129) b!632791))

(assert (= (and d!89431 (not c!72129)) b!632794))

(assert (= (and b!632794 c!72131) b!632795))

(assert (= (and b!632794 (not c!72131)) b!632792))

(assert (= (and b!632792 c!72130) b!632790))

(assert (= (and b!632792 (not c!72130)) b!632793))

(declare-fun m!607603 () Bool)

(assert (=> d!89431 m!607603))

(declare-fun m!607605 () Bool)

(assert (=> d!89431 m!607605))

(declare-fun m!607607 () Bool)

(assert (=> d!89431 m!607607))

(assert (=> d!89431 m!607483))

(declare-fun m!607609 () Bool)

(assert (=> b!632793 m!607609))

(assert (=> b!632793 m!607609))

(declare-fun m!607611 () Bool)

(assert (=> b!632793 m!607611))

(assert (=> b!632690 d!89431))

(declare-fun d!89443 () Bool)

(declare-fun lt!292484 () (_ BitVec 32))

(assert (=> d!89443 (and (bvsge lt!292484 #b00000000000000000000000000000000) (bvslt lt!292484 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89443 (= lt!292484 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89443 (validMask!0 mask!3053)))

(assert (=> d!89443 (= (nextIndex!0 index!984 x!910 mask!3053) lt!292484)))

(declare-fun bs!19053 () Bool)

(assert (= bs!19053 d!89443))

(declare-fun m!607621 () Bool)

(assert (=> bs!19053 m!607621))

(assert (=> bs!19053 m!607483))

(assert (=> b!632690 d!89443))

(declare-fun d!89447 () Bool)

(declare-fun e!361785 () Bool)

(assert (=> d!89447 e!361785))

(declare-fun res!409280 () Bool)

(assert (=> d!89447 (=> (not res!409280) (not e!361785))))

(assert (=> d!89447 (= res!409280 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18669 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18669 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18669 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18669 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18669 a!2986))))))

(declare-fun lt!292490 () Unit!21314)

(declare-fun choose!9 (array!38145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21314)

(assert (=> d!89447 (= lt!292490 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292435 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89447 (validMask!0 mask!3053)))

(assert (=> d!89447 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292435 vacantSpotIndex!68 mask!3053) lt!292490)))

(declare-fun b!632822 () Bool)

(assert (=> b!632822 (= e!361785 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292435 vacantSpotIndex!68 (select (arr!18305 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292435 vacantSpotIndex!68 (select (store (arr!18305 a!2986) i!1108 k!1786) j!136) (array!38146 (store (arr!18305 a!2986) i!1108 k!1786) (size!18669 a!2986)) mask!3053)))))

(assert (= (and d!89447 res!409280) b!632822))

(declare-fun m!607633 () Bool)

(assert (=> d!89447 m!607633))

(assert (=> d!89447 m!607483))

(assert (=> b!632822 m!607495))

(assert (=> b!632822 m!607495))

(assert (=> b!632822 m!607511))

(assert (=> b!632822 m!607491))

(assert (=> b!632822 m!607503))

(declare-fun m!607635 () Bool)

(assert (=> b!632822 m!607635))

(assert (=> b!632822 m!607503))

(assert (=> b!632690 d!89447))

(declare-fun d!89457 () Bool)

(declare-fun lt!292492 () SeekEntryResult!6745)

(assert (=> d!89457 (and (or (is-Undefined!6745 lt!292492) (not (is-Found!6745 lt!292492)) (and (bvsge (index!29274 lt!292492) #b00000000000000000000000000000000) (bvslt (index!29274 lt!292492) (size!18669 lt!292430)))) (or (is-Undefined!6745 lt!292492) (is-Found!6745 lt!292492) (not (is-MissingVacant!6745 lt!292492)) (not (= (index!29276 lt!292492) vacantSpotIndex!68)) (and (bvsge (index!29276 lt!292492) #b00000000000000000000000000000000) (bvslt (index!29276 lt!292492) (size!18669 lt!292430)))) (or (is-Undefined!6745 lt!292492) (ite (is-Found!6745 lt!292492) (= (select (arr!18305 lt!292430) (index!29274 lt!292492)) lt!292427) (and (is-MissingVacant!6745 lt!292492) (= (index!29276 lt!292492) vacantSpotIndex!68) (= (select (arr!18305 lt!292430) (index!29276 lt!292492)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361790 () SeekEntryResult!6745)

(assert (=> d!89457 (= lt!292492 e!361790)))

(declare-fun c!72138 () Bool)

(assert (=> d!89457 (= c!72138 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!292491 () (_ BitVec 64))

(assert (=> d!89457 (= lt!292491 (select (arr!18305 lt!292430) index!984))))

(assert (=> d!89457 (validMask!0 mask!3053)))

(assert (=> d!89457 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292427 lt!292430 mask!3053) lt!292492)))

(declare-fun b!632825 () Bool)

(declare-fun e!361789 () SeekEntryResult!6745)

(assert (=> b!632825 (= e!361789 (MissingVacant!6745 vacantSpotIndex!68))))

(declare-fun b!632826 () Bool)

(assert (=> b!632826 (= e!361790 Undefined!6745)))

(declare-fun b!632827 () Bool)

(declare-fun c!72139 () Bool)

(assert (=> b!632827 (= c!72139 (= lt!292491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361788 () SeekEntryResult!6745)

(assert (=> b!632827 (= e!361788 e!361789)))

(declare-fun b!632828 () Bool)

(assert (=> b!632828 (= e!361789 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!292427 lt!292430 mask!3053))))

(declare-fun b!632829 () Bool)

(assert (=> b!632829 (= e!361790 e!361788)))

(declare-fun c!72140 () Bool)

(assert (=> b!632829 (= c!72140 (= lt!292491 lt!292427))))

(declare-fun b!632830 () Bool)

(assert (=> b!632830 (= e!361788 (Found!6745 index!984))))

(assert (= (and d!89457 c!72138) b!632826))

(assert (= (and d!89457 (not c!72138)) b!632829))

(assert (= (and b!632829 c!72140) b!632830))

(assert (= (and b!632829 (not c!72140)) b!632827))

(assert (= (and b!632827 c!72139) b!632825))

(assert (= (and b!632827 (not c!72139)) b!632828))

(declare-fun m!607641 () Bool)

(assert (=> d!89457 m!607641))

(declare-fun m!607643 () Bool)

(assert (=> d!89457 m!607643))

(declare-fun m!607645 () Bool)

(assert (=> d!89457 m!607645))

(assert (=> d!89457 m!607483))

(assert (=> b!632828 m!607501))

(assert (=> b!632828 m!607501))

(declare-fun m!607647 () Bool)

(assert (=> b!632828 m!607647))

(assert (=> b!632690 d!89457))

(declare-fun d!89463 () Bool)

(declare-fun lt!292494 () SeekEntryResult!6745)

(assert (=> d!89463 (and (or (is-Undefined!6745 lt!292494) (not (is-Found!6745 lt!292494)) (and (bvsge (index!29274 lt!292494) #b00000000000000000000000000000000) (bvslt (index!29274 lt!292494) (size!18669 a!2986)))) (or (is-Undefined!6745 lt!292494) (is-Found!6745 lt!292494) (not (is-MissingVacant!6745 lt!292494)) (not (= (index!29276 lt!292494) vacantSpotIndex!68)) (and (bvsge (index!29276 lt!292494) #b00000000000000000000000000000000) (bvslt (index!29276 lt!292494) (size!18669 a!2986)))) (or (is-Undefined!6745 lt!292494) (ite (is-Found!6745 lt!292494) (= (select (arr!18305 a!2986) (index!29274 lt!292494)) (select (arr!18305 a!2986) j!136)) (and (is-MissingVacant!6745 lt!292494) (= (index!29276 lt!292494) vacantSpotIndex!68) (= (select (arr!18305 a!2986) (index!29276 lt!292494)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

