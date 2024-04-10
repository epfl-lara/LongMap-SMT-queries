; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57124 () Bool)

(assert start!57124)

(declare-fun b!632627 () Bool)

(declare-fun res!409209 () Bool)

(declare-fun e!361676 () Bool)

(assert (=> b!632627 (=> (not res!409209) (not e!361676))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38143 0))(
  ( (array!38144 (arr!18304 (Array (_ BitVec 32) (_ BitVec 64))) (size!18668 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38143)

(assert (=> b!632627 (= res!409209 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18304 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632629 () Bool)

(declare-fun e!361677 () Bool)

(declare-fun e!361675 () Bool)

(assert (=> b!632629 (= e!361677 e!361675)))

(declare-fun res!409206 () Bool)

(assert (=> b!632629 (=> res!409206 e!361675)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!292405 () (_ BitVec 64))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!632629 (= res!409206 (or (not (= (select (arr!18304 a!2986) j!136) lt!292405)) (not (= (select (arr!18304 a!2986) j!136) (select (store (arr!18304 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(assert (=> b!632629 (= (select (store (arr!18304 a!2986) i!1108 k0!1786) index!984) (select (arr!18304 a!2986) j!136))))

(declare-fun b!632630 () Bool)

(declare-fun e!361678 () Bool)

(assert (=> b!632630 (= e!361678 e!361676)))

(declare-fun res!409210 () Bool)

(assert (=> b!632630 (=> (not res!409210) (not e!361676))))

(declare-datatypes ((SeekEntryResult!6744 0))(
  ( (MissingZero!6744 (index!29269 (_ BitVec 32))) (Found!6744 (index!29270 (_ BitVec 32))) (Intermediate!6744 (undefined!7556 Bool) (index!29271 (_ BitVec 32)) (x!58003 (_ BitVec 32))) (Undefined!6744) (MissingVacant!6744 (index!29272 (_ BitVec 32))) )
))
(declare-fun lt!292403 () SeekEntryResult!6744)

(assert (=> b!632630 (= res!409210 (or (= lt!292403 (MissingZero!6744 i!1108)) (= lt!292403 (MissingVacant!6744 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38143 (_ BitVec 32)) SeekEntryResult!6744)

(assert (=> b!632630 (= lt!292403 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632631 () Bool)

(declare-fun res!409205 () Bool)

(assert (=> b!632631 (=> (not res!409205) (not e!361678))))

(declare-fun arrayContainsKey!0 (array!38143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632631 (= res!409205 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632632 () Bool)

(declare-fun res!409207 () Bool)

(assert (=> b!632632 (=> (not res!409207) (not e!361678))))

(assert (=> b!632632 (= res!409207 (and (= (size!18668 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18668 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18668 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632633 () Bool)

(declare-datatypes ((Unit!21310 0))(
  ( (Unit!21311) )
))
(declare-fun e!361679 () Unit!21310)

(declare-fun Unit!21312 () Unit!21310)

(assert (=> b!632633 (= e!361679 Unit!21312)))

(assert (=> b!632633 false))

(declare-fun lt!292400 () array!38143)

(declare-fun b!632634 () Bool)

(assert (=> b!632634 (= e!361675 (arrayContainsKey!0 lt!292400 (select (arr!18304 a!2986) j!136) j!136))))

(declare-fun b!632635 () Bool)

(declare-fun e!361680 () Bool)

(declare-fun e!361674 () Bool)

(assert (=> b!632635 (= e!361680 e!361674)))

(declare-fun res!409201 () Bool)

(assert (=> b!632635 (=> (not res!409201) (not e!361674))))

(declare-fun lt!292407 () SeekEntryResult!6744)

(assert (=> b!632635 (= res!409201 (and (= lt!292407 (Found!6744 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18304 a!2986) index!984) (select (arr!18304 a!2986) j!136))) (not (= (select (arr!18304 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38143 (_ BitVec 32)) SeekEntryResult!6744)

(assert (=> b!632635 (= lt!292407 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632636 () Bool)

(declare-fun Unit!21313 () Unit!21310)

(assert (=> b!632636 (= e!361679 Unit!21313)))

(declare-fun b!632637 () Bool)

(assert (=> b!632637 (= e!361674 (not e!361677))))

(declare-fun res!409204 () Bool)

(assert (=> b!632637 (=> res!409204 e!361677)))

(declare-fun lt!292404 () SeekEntryResult!6744)

(assert (=> b!632637 (= res!409204 (not (= lt!292404 (Found!6744 index!984))))))

(declare-fun lt!292401 () Unit!21310)

(assert (=> b!632637 (= lt!292401 e!361679)))

(declare-fun c!72080 () Bool)

(assert (=> b!632637 (= c!72080 (= lt!292404 Undefined!6744))))

(assert (=> b!632637 (= lt!292404 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292405 lt!292400 mask!3053))))

(declare-fun e!361673 () Bool)

(assert (=> b!632637 e!361673))

(declare-fun res!409214 () Bool)

(assert (=> b!632637 (=> (not res!409214) (not e!361673))))

(declare-fun lt!292402 () SeekEntryResult!6744)

(declare-fun lt!292406 () (_ BitVec 32))

(assert (=> b!632637 (= res!409214 (= lt!292402 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 lt!292405 lt!292400 mask!3053)))))

(assert (=> b!632637 (= lt!292402 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632637 (= lt!292405 (select (store (arr!18304 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292408 () Unit!21310)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38143 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21310)

(assert (=> b!632637 (= lt!292408 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632637 (= lt!292406 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632638 () Bool)

(declare-fun res!409208 () Bool)

(assert (=> b!632638 (=> (not res!409208) (not e!361676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38143 (_ BitVec 32)) Bool)

(assert (=> b!632638 (= res!409208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632639 () Bool)

(declare-fun res!409211 () Bool)

(assert (=> b!632639 (=> (not res!409211) (not e!361676))))

(declare-datatypes ((List!12345 0))(
  ( (Nil!12342) (Cons!12341 (h!13386 (_ BitVec 64)) (t!18573 List!12345)) )
))
(declare-fun arrayNoDuplicates!0 (array!38143 (_ BitVec 32) List!12345) Bool)

(assert (=> b!632639 (= res!409211 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12342))))

(declare-fun b!632640 () Bool)

(declare-fun res!409202 () Bool)

(assert (=> b!632640 (=> (not res!409202) (not e!361678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632640 (= res!409202 (validKeyInArray!0 (select (arr!18304 a!2986) j!136)))))

(declare-fun b!632628 () Bool)

(declare-fun res!409203 () Bool)

(assert (=> b!632628 (=> (not res!409203) (not e!361678))))

(assert (=> b!632628 (= res!409203 (validKeyInArray!0 k0!1786))))

(declare-fun res!409213 () Bool)

(assert (=> start!57124 (=> (not res!409213) (not e!361678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57124 (= res!409213 (validMask!0 mask!3053))))

(assert (=> start!57124 e!361678))

(assert (=> start!57124 true))

(declare-fun array_inv!14100 (array!38143) Bool)

(assert (=> start!57124 (array_inv!14100 a!2986)))

(declare-fun b!632641 () Bool)

(assert (=> b!632641 (= e!361673 (= lt!292407 lt!292402))))

(declare-fun b!632642 () Bool)

(assert (=> b!632642 (= e!361676 e!361680)))

(declare-fun res!409212 () Bool)

(assert (=> b!632642 (=> (not res!409212) (not e!361680))))

(assert (=> b!632642 (= res!409212 (= (select (store (arr!18304 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632642 (= lt!292400 (array!38144 (store (arr!18304 a!2986) i!1108 k0!1786) (size!18668 a!2986)))))

(assert (= (and start!57124 res!409213) b!632632))

(assert (= (and b!632632 res!409207) b!632640))

(assert (= (and b!632640 res!409202) b!632628))

(assert (= (and b!632628 res!409203) b!632631))

(assert (= (and b!632631 res!409205) b!632630))

(assert (= (and b!632630 res!409210) b!632638))

(assert (= (and b!632638 res!409208) b!632639))

(assert (= (and b!632639 res!409211) b!632627))

(assert (= (and b!632627 res!409209) b!632642))

(assert (= (and b!632642 res!409212) b!632635))

(assert (= (and b!632635 res!409201) b!632637))

(assert (= (and b!632637 res!409214) b!632641))

(assert (= (and b!632637 c!72080) b!632633))

(assert (= (and b!632637 (not c!72080)) b!632636))

(assert (= (and b!632637 (not res!409204)) b!632629))

(assert (= (and b!632629 (not res!409206)) b!632634))

(declare-fun m!607439 () Bool)

(assert (=> b!632637 m!607439))

(declare-fun m!607441 () Bool)

(assert (=> b!632637 m!607441))

(declare-fun m!607443 () Bool)

(assert (=> b!632637 m!607443))

(declare-fun m!607445 () Bool)

(assert (=> b!632637 m!607445))

(declare-fun m!607447 () Bool)

(assert (=> b!632637 m!607447))

(declare-fun m!607449 () Bool)

(assert (=> b!632637 m!607449))

(assert (=> b!632637 m!607445))

(declare-fun m!607451 () Bool)

(assert (=> b!632637 m!607451))

(declare-fun m!607453 () Bool)

(assert (=> b!632637 m!607453))

(declare-fun m!607455 () Bool)

(assert (=> b!632638 m!607455))

(declare-fun m!607457 () Bool)

(assert (=> b!632628 m!607457))

(declare-fun m!607459 () Bool)

(assert (=> b!632630 m!607459))

(declare-fun m!607461 () Bool)

(assert (=> b!632639 m!607461))

(assert (=> b!632629 m!607445))

(assert (=> b!632629 m!607453))

(declare-fun m!607463 () Bool)

(assert (=> b!632629 m!607463))

(assert (=> b!632642 m!607453))

(declare-fun m!607465 () Bool)

(assert (=> b!632642 m!607465))

(declare-fun m!607467 () Bool)

(assert (=> b!632631 m!607467))

(declare-fun m!607469 () Bool)

(assert (=> start!57124 m!607469))

(declare-fun m!607471 () Bool)

(assert (=> start!57124 m!607471))

(assert (=> b!632640 m!607445))

(assert (=> b!632640 m!607445))

(declare-fun m!607473 () Bool)

(assert (=> b!632640 m!607473))

(assert (=> b!632634 m!607445))

(assert (=> b!632634 m!607445))

(declare-fun m!607475 () Bool)

(assert (=> b!632634 m!607475))

(declare-fun m!607477 () Bool)

(assert (=> b!632635 m!607477))

(assert (=> b!632635 m!607445))

(assert (=> b!632635 m!607445))

(declare-fun m!607479 () Bool)

(assert (=> b!632635 m!607479))

(declare-fun m!607481 () Bool)

(assert (=> b!632627 m!607481))

(check-sat (not start!57124) (not b!632638) (not b!632630) (not b!632628) (not b!632631) (not b!632637) (not b!632639) (not b!632640) (not b!632635) (not b!632634))
(check-sat)
(get-model)

(declare-fun d!89413 () Bool)

(declare-fun e!361710 () Bool)

(assert (=> d!89413 e!361710))

(declare-fun res!409259 () Bool)

(assert (=> d!89413 (=> (not res!409259) (not e!361710))))

(assert (=> d!89413 (= res!409259 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18668 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18668 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18668 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18668 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18668 a!2986))))))

(declare-fun lt!292438 () Unit!21310)

(declare-fun choose!9 (array!38143 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21310)

(assert (=> d!89413 (= lt!292438 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89413 (validMask!0 mask!3053)))

(assert (=> d!89413 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 mask!3053) lt!292438)))

(declare-fun b!632693 () Bool)

(assert (=> b!632693 (= e!361710 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 (select (store (arr!18304 a!2986) i!1108 k0!1786) j!136) (array!38144 (store (arr!18304 a!2986) i!1108 k0!1786) (size!18668 a!2986)) mask!3053)))))

(assert (= (and d!89413 res!409259) b!632693))

(declare-fun m!607527 () Bool)

(assert (=> d!89413 m!607527))

(assert (=> d!89413 m!607469))

(assert (=> b!632693 m!607441))

(declare-fun m!607529 () Bool)

(assert (=> b!632693 m!607529))

(assert (=> b!632693 m!607445))

(assert (=> b!632693 m!607451))

(assert (=> b!632693 m!607453))

(assert (=> b!632693 m!607441))

(assert (=> b!632693 m!607445))

(assert (=> b!632637 d!89413))

(declare-fun b!632706 () Bool)

(declare-fun e!361718 () SeekEntryResult!6744)

(assert (=> b!632706 (= e!361718 (MissingVacant!6744 vacantSpotIndex!68))))

(declare-fun b!632707 () Bool)

(declare-fun e!361719 () SeekEntryResult!6744)

(declare-fun e!361717 () SeekEntryResult!6744)

(assert (=> b!632707 (= e!361719 e!361717)))

(declare-fun c!72090 () Bool)

(declare-fun lt!292443 () (_ BitVec 64))

(assert (=> b!632707 (= c!72090 (= lt!292443 lt!292405))))

(declare-fun b!632708 () Bool)

(declare-fun c!72091 () Bool)

(assert (=> b!632708 (= c!72091 (= lt!292443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632708 (= e!361717 e!361718)))

(declare-fun lt!292444 () SeekEntryResult!6744)

(declare-fun d!89415 () Bool)

(get-info :version)

(assert (=> d!89415 (and (or ((_ is Undefined!6744) lt!292444) (not ((_ is Found!6744) lt!292444)) (and (bvsge (index!29270 lt!292444) #b00000000000000000000000000000000) (bvslt (index!29270 lt!292444) (size!18668 lt!292400)))) (or ((_ is Undefined!6744) lt!292444) ((_ is Found!6744) lt!292444) (not ((_ is MissingVacant!6744) lt!292444)) (not (= (index!29272 lt!292444) vacantSpotIndex!68)) (and (bvsge (index!29272 lt!292444) #b00000000000000000000000000000000) (bvslt (index!29272 lt!292444) (size!18668 lt!292400)))) (or ((_ is Undefined!6744) lt!292444) (ite ((_ is Found!6744) lt!292444) (= (select (arr!18304 lt!292400) (index!29270 lt!292444)) lt!292405) (and ((_ is MissingVacant!6744) lt!292444) (= (index!29272 lt!292444) vacantSpotIndex!68) (= (select (arr!18304 lt!292400) (index!29272 lt!292444)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89415 (= lt!292444 e!361719)))

(declare-fun c!72092 () Bool)

(assert (=> d!89415 (= c!72092 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89415 (= lt!292443 (select (arr!18304 lt!292400) lt!292406))))

(assert (=> d!89415 (validMask!0 mask!3053)))

(assert (=> d!89415 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 lt!292405 lt!292400 mask!3053) lt!292444)))

(declare-fun b!632709 () Bool)

(assert (=> b!632709 (= e!361719 Undefined!6744)))

(declare-fun b!632710 () Bool)

(assert (=> b!632710 (= e!361717 (Found!6744 lt!292406))))

(declare-fun b!632711 () Bool)

(assert (=> b!632711 (= e!361718 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292406 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!292405 lt!292400 mask!3053))))

(assert (= (and d!89415 c!72092) b!632709))

(assert (= (and d!89415 (not c!72092)) b!632707))

(assert (= (and b!632707 c!72090) b!632710))

(assert (= (and b!632707 (not c!72090)) b!632708))

(assert (= (and b!632708 c!72091) b!632706))

(assert (= (and b!632708 (not c!72091)) b!632711))

(declare-fun m!607531 () Bool)

(assert (=> d!89415 m!607531))

(declare-fun m!607533 () Bool)

(assert (=> d!89415 m!607533))

(declare-fun m!607535 () Bool)

(assert (=> d!89415 m!607535))

(assert (=> d!89415 m!607469))

(declare-fun m!607537 () Bool)

(assert (=> b!632711 m!607537))

(assert (=> b!632711 m!607537))

(declare-fun m!607539 () Bool)

(assert (=> b!632711 m!607539))

(assert (=> b!632637 d!89415))

(declare-fun d!89417 () Bool)

(declare-fun lt!292447 () (_ BitVec 32))

(assert (=> d!89417 (and (bvsge lt!292447 #b00000000000000000000000000000000) (bvslt lt!292447 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89417 (= lt!292447 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89417 (validMask!0 mask!3053)))

(assert (=> d!89417 (= (nextIndex!0 index!984 x!910 mask!3053) lt!292447)))

(declare-fun bs!19051 () Bool)

(assert (= bs!19051 d!89417))

(declare-fun m!607541 () Bool)

(assert (=> bs!19051 m!607541))

(assert (=> bs!19051 m!607469))

(assert (=> b!632637 d!89417))

(declare-fun b!632712 () Bool)

(declare-fun e!361721 () SeekEntryResult!6744)

(assert (=> b!632712 (= e!361721 (MissingVacant!6744 vacantSpotIndex!68))))

(declare-fun b!632713 () Bool)

(declare-fun e!361722 () SeekEntryResult!6744)

(declare-fun e!361720 () SeekEntryResult!6744)

(assert (=> b!632713 (= e!361722 e!361720)))

(declare-fun c!72093 () Bool)

(declare-fun lt!292448 () (_ BitVec 64))

(assert (=> b!632713 (= c!72093 (= lt!292448 lt!292405))))

(declare-fun b!632714 () Bool)

(declare-fun c!72094 () Bool)

(assert (=> b!632714 (= c!72094 (= lt!292448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632714 (= e!361720 e!361721)))

(declare-fun d!89419 () Bool)

(declare-fun lt!292449 () SeekEntryResult!6744)

(assert (=> d!89419 (and (or ((_ is Undefined!6744) lt!292449) (not ((_ is Found!6744) lt!292449)) (and (bvsge (index!29270 lt!292449) #b00000000000000000000000000000000) (bvslt (index!29270 lt!292449) (size!18668 lt!292400)))) (or ((_ is Undefined!6744) lt!292449) ((_ is Found!6744) lt!292449) (not ((_ is MissingVacant!6744) lt!292449)) (not (= (index!29272 lt!292449) vacantSpotIndex!68)) (and (bvsge (index!29272 lt!292449) #b00000000000000000000000000000000) (bvslt (index!29272 lt!292449) (size!18668 lt!292400)))) (or ((_ is Undefined!6744) lt!292449) (ite ((_ is Found!6744) lt!292449) (= (select (arr!18304 lt!292400) (index!29270 lt!292449)) lt!292405) (and ((_ is MissingVacant!6744) lt!292449) (= (index!29272 lt!292449) vacantSpotIndex!68) (= (select (arr!18304 lt!292400) (index!29272 lt!292449)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89419 (= lt!292449 e!361722)))

(declare-fun c!72095 () Bool)

(assert (=> d!89419 (= c!72095 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89419 (= lt!292448 (select (arr!18304 lt!292400) index!984))))

(assert (=> d!89419 (validMask!0 mask!3053)))

(assert (=> d!89419 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292405 lt!292400 mask!3053) lt!292449)))

(declare-fun b!632715 () Bool)

(assert (=> b!632715 (= e!361722 Undefined!6744)))

(declare-fun b!632716 () Bool)

(assert (=> b!632716 (= e!361720 (Found!6744 index!984))))

(declare-fun b!632717 () Bool)

(assert (=> b!632717 (= e!361721 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!292405 lt!292400 mask!3053))))

(assert (= (and d!89419 c!72095) b!632715))

(assert (= (and d!89419 (not c!72095)) b!632713))

(assert (= (and b!632713 c!72093) b!632716))

(assert (= (and b!632713 (not c!72093)) b!632714))

(assert (= (and b!632714 c!72094) b!632712))

(assert (= (and b!632714 (not c!72094)) b!632717))

(declare-fun m!607543 () Bool)

(assert (=> d!89419 m!607543))

(declare-fun m!607545 () Bool)

(assert (=> d!89419 m!607545))

(declare-fun m!607547 () Bool)

(assert (=> d!89419 m!607547))

(assert (=> d!89419 m!607469))

(assert (=> b!632717 m!607439))

(assert (=> b!632717 m!607439))

(declare-fun m!607549 () Bool)

(assert (=> b!632717 m!607549))

(assert (=> b!632637 d!89419))

(declare-fun b!632718 () Bool)

(declare-fun e!361724 () SeekEntryResult!6744)

(assert (=> b!632718 (= e!361724 (MissingVacant!6744 vacantSpotIndex!68))))

(declare-fun b!632719 () Bool)

(declare-fun e!361725 () SeekEntryResult!6744)

(declare-fun e!361723 () SeekEntryResult!6744)

(assert (=> b!632719 (= e!361725 e!361723)))

(declare-fun lt!292450 () (_ BitVec 64))

(declare-fun c!72096 () Bool)

(assert (=> b!632719 (= c!72096 (= lt!292450 (select (arr!18304 a!2986) j!136)))))

(declare-fun b!632720 () Bool)

(declare-fun c!72097 () Bool)

(assert (=> b!632720 (= c!72097 (= lt!292450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632720 (= e!361723 e!361724)))

(declare-fun d!89421 () Bool)

(declare-fun lt!292451 () SeekEntryResult!6744)

(assert (=> d!89421 (and (or ((_ is Undefined!6744) lt!292451) (not ((_ is Found!6744) lt!292451)) (and (bvsge (index!29270 lt!292451) #b00000000000000000000000000000000) (bvslt (index!29270 lt!292451) (size!18668 a!2986)))) (or ((_ is Undefined!6744) lt!292451) ((_ is Found!6744) lt!292451) (not ((_ is MissingVacant!6744) lt!292451)) (not (= (index!29272 lt!292451) vacantSpotIndex!68)) (and (bvsge (index!29272 lt!292451) #b00000000000000000000000000000000) (bvslt (index!29272 lt!292451) (size!18668 a!2986)))) (or ((_ is Undefined!6744) lt!292451) (ite ((_ is Found!6744) lt!292451) (= (select (arr!18304 a!2986) (index!29270 lt!292451)) (select (arr!18304 a!2986) j!136)) (and ((_ is MissingVacant!6744) lt!292451) (= (index!29272 lt!292451) vacantSpotIndex!68) (= (select (arr!18304 a!2986) (index!29272 lt!292451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89421 (= lt!292451 e!361725)))

(declare-fun c!72098 () Bool)

(assert (=> d!89421 (= c!72098 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89421 (= lt!292450 (select (arr!18304 a!2986) lt!292406))))

(assert (=> d!89421 (validMask!0 mask!3053)))

(assert (=> d!89421 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292406 vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053) lt!292451)))

(declare-fun b!632721 () Bool)

(assert (=> b!632721 (= e!361725 Undefined!6744)))

(declare-fun b!632722 () Bool)

(assert (=> b!632722 (= e!361723 (Found!6744 lt!292406))))

(declare-fun b!632723 () Bool)

(assert (=> b!632723 (= e!361724 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292406 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89421 c!72098) b!632721))

(assert (= (and d!89421 (not c!72098)) b!632719))

(assert (= (and b!632719 c!72096) b!632722))

(assert (= (and b!632719 (not c!72096)) b!632720))

(assert (= (and b!632720 c!72097) b!632718))

(assert (= (and b!632720 (not c!72097)) b!632723))

(declare-fun m!607551 () Bool)

(assert (=> d!89421 m!607551))

(declare-fun m!607553 () Bool)

(assert (=> d!89421 m!607553))

(declare-fun m!607555 () Bool)

(assert (=> d!89421 m!607555))

(assert (=> d!89421 m!607469))

(assert (=> b!632723 m!607537))

(assert (=> b!632723 m!607537))

(assert (=> b!632723 m!607445))

(declare-fun m!607557 () Bool)

(assert (=> b!632723 m!607557))

(assert (=> b!632637 d!89421))

(declare-fun d!89423 () Bool)

(declare-fun res!409264 () Bool)

(declare-fun e!361730 () Bool)

(assert (=> d!89423 (=> res!409264 e!361730)))

(assert (=> d!89423 (= res!409264 (= (select (arr!18304 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89423 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!361730)))

(declare-fun b!632728 () Bool)

(declare-fun e!361731 () Bool)

(assert (=> b!632728 (= e!361730 e!361731)))

(declare-fun res!409265 () Bool)

(assert (=> b!632728 (=> (not res!409265) (not e!361731))))

(assert (=> b!632728 (= res!409265 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18668 a!2986)))))

(declare-fun b!632729 () Bool)

(assert (=> b!632729 (= e!361731 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89423 (not res!409264)) b!632728))

(assert (= (and b!632728 res!409265) b!632729))

(declare-fun m!607559 () Bool)

(assert (=> d!89423 m!607559))

(declare-fun m!607561 () Bool)

(assert (=> b!632729 m!607561))

(assert (=> b!632631 d!89423))

(declare-fun b!632730 () Bool)

(declare-fun e!361733 () SeekEntryResult!6744)

(assert (=> b!632730 (= e!361733 (MissingVacant!6744 vacantSpotIndex!68))))

(declare-fun b!632731 () Bool)

(declare-fun e!361734 () SeekEntryResult!6744)

(declare-fun e!361732 () SeekEntryResult!6744)

(assert (=> b!632731 (= e!361734 e!361732)))

(declare-fun lt!292452 () (_ BitVec 64))

(declare-fun c!72099 () Bool)

(assert (=> b!632731 (= c!72099 (= lt!292452 (select (arr!18304 a!2986) j!136)))))

(declare-fun b!632732 () Bool)

(declare-fun c!72100 () Bool)

(assert (=> b!632732 (= c!72100 (= lt!292452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632732 (= e!361732 e!361733)))

(declare-fun lt!292453 () SeekEntryResult!6744)

(declare-fun d!89425 () Bool)

(assert (=> d!89425 (and (or ((_ is Undefined!6744) lt!292453) (not ((_ is Found!6744) lt!292453)) (and (bvsge (index!29270 lt!292453) #b00000000000000000000000000000000) (bvslt (index!29270 lt!292453) (size!18668 a!2986)))) (or ((_ is Undefined!6744) lt!292453) ((_ is Found!6744) lt!292453) (not ((_ is MissingVacant!6744) lt!292453)) (not (= (index!29272 lt!292453) vacantSpotIndex!68)) (and (bvsge (index!29272 lt!292453) #b00000000000000000000000000000000) (bvslt (index!29272 lt!292453) (size!18668 a!2986)))) (or ((_ is Undefined!6744) lt!292453) (ite ((_ is Found!6744) lt!292453) (= (select (arr!18304 a!2986) (index!29270 lt!292453)) (select (arr!18304 a!2986) j!136)) (and ((_ is MissingVacant!6744) lt!292453) (= (index!29272 lt!292453) vacantSpotIndex!68) (= (select (arr!18304 a!2986) (index!29272 lt!292453)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89425 (= lt!292453 e!361734)))

(declare-fun c!72101 () Bool)

(assert (=> d!89425 (= c!72101 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89425 (= lt!292452 (select (arr!18304 a!2986) index!984))))

(assert (=> d!89425 (validMask!0 mask!3053)))

(assert (=> d!89425 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053) lt!292453)))

(declare-fun b!632733 () Bool)

(assert (=> b!632733 (= e!361734 Undefined!6744)))

(declare-fun b!632734 () Bool)

(assert (=> b!632734 (= e!361732 (Found!6744 index!984))))

(declare-fun b!632735 () Bool)

(assert (=> b!632735 (= e!361733 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18304 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89425 c!72101) b!632733))

(assert (= (and d!89425 (not c!72101)) b!632731))

(assert (= (and b!632731 c!72099) b!632734))

(assert (= (and b!632731 (not c!72099)) b!632732))

(assert (= (and b!632732 c!72100) b!632730))

(assert (= (and b!632732 (not c!72100)) b!632735))

(declare-fun m!607563 () Bool)

(assert (=> d!89425 m!607563))

(declare-fun m!607565 () Bool)

(assert (=> d!89425 m!607565))

(assert (=> d!89425 m!607477))

(assert (=> d!89425 m!607469))

(assert (=> b!632735 m!607439))

(assert (=> b!632735 m!607439))

(assert (=> b!632735 m!607445))

(declare-fun m!607567 () Bool)

(assert (=> b!632735 m!607567))

(assert (=> b!632635 d!89425))

(declare-fun b!632778 () Bool)

(declare-fun lt!292470 () SeekEntryResult!6744)

(declare-fun e!361757 () SeekEntryResult!6744)

(assert (=> b!632778 (= e!361757 (seekKeyOrZeroReturnVacant!0 (x!58003 lt!292470) (index!29271 lt!292470) (index!29271 lt!292470) k0!1786 a!2986 mask!3053))))

(declare-fun d!89427 () Bool)

(declare-fun lt!292471 () SeekEntryResult!6744)

(assert (=> d!89427 (and (or ((_ is Undefined!6744) lt!292471) (not ((_ is Found!6744) lt!292471)) (and (bvsge (index!29270 lt!292471) #b00000000000000000000000000000000) (bvslt (index!29270 lt!292471) (size!18668 a!2986)))) (or ((_ is Undefined!6744) lt!292471) ((_ is Found!6744) lt!292471) (not ((_ is MissingZero!6744) lt!292471)) (and (bvsge (index!29269 lt!292471) #b00000000000000000000000000000000) (bvslt (index!29269 lt!292471) (size!18668 a!2986)))) (or ((_ is Undefined!6744) lt!292471) ((_ is Found!6744) lt!292471) ((_ is MissingZero!6744) lt!292471) (not ((_ is MissingVacant!6744) lt!292471)) (and (bvsge (index!29272 lt!292471) #b00000000000000000000000000000000) (bvslt (index!29272 lt!292471) (size!18668 a!2986)))) (or ((_ is Undefined!6744) lt!292471) (ite ((_ is Found!6744) lt!292471) (= (select (arr!18304 a!2986) (index!29270 lt!292471)) k0!1786) (ite ((_ is MissingZero!6744) lt!292471) (= (select (arr!18304 a!2986) (index!29269 lt!292471)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6744) lt!292471) (= (select (arr!18304 a!2986) (index!29272 lt!292471)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!361756 () SeekEntryResult!6744)

(assert (=> d!89427 (= lt!292471 e!361756)))

(declare-fun c!72123 () Bool)

(assert (=> d!89427 (= c!72123 (and ((_ is Intermediate!6744) lt!292470) (undefined!7556 lt!292470)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38143 (_ BitVec 32)) SeekEntryResult!6744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89427 (= lt!292470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89427 (validMask!0 mask!3053)))

(assert (=> d!89427 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!292471)))

(declare-fun b!632779 () Bool)

(declare-fun c!72125 () Bool)

(declare-fun lt!292472 () (_ BitVec 64))

(assert (=> b!632779 (= c!72125 (= lt!292472 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361758 () SeekEntryResult!6744)

(assert (=> b!632779 (= e!361758 e!361757)))

(declare-fun b!632780 () Bool)

(assert (=> b!632780 (= e!361756 Undefined!6744)))

(declare-fun b!632781 () Bool)

(assert (=> b!632781 (= e!361757 (MissingZero!6744 (index!29271 lt!292470)))))

(declare-fun b!632782 () Bool)

(assert (=> b!632782 (= e!361758 (Found!6744 (index!29271 lt!292470)))))

(declare-fun b!632783 () Bool)

(assert (=> b!632783 (= e!361756 e!361758)))

(assert (=> b!632783 (= lt!292472 (select (arr!18304 a!2986) (index!29271 lt!292470)))))

(declare-fun c!72124 () Bool)

(assert (=> b!632783 (= c!72124 (= lt!292472 k0!1786))))

(assert (= (and d!89427 c!72123) b!632780))

(assert (= (and d!89427 (not c!72123)) b!632783))

(assert (= (and b!632783 c!72124) b!632782))

(assert (= (and b!632783 (not c!72124)) b!632779))

(assert (= (and b!632779 c!72125) b!632781))

(assert (= (and b!632779 (not c!72125)) b!632778))

(declare-fun m!607579 () Bool)

(assert (=> b!632778 m!607579))

(assert (=> d!89427 m!607469))

(declare-fun m!607581 () Bool)

(assert (=> d!89427 m!607581))

(declare-fun m!607583 () Bool)

(assert (=> d!89427 m!607583))

(declare-fun m!607585 () Bool)

(assert (=> d!89427 m!607585))

(declare-fun m!607587 () Bool)

(assert (=> d!89427 m!607587))

(declare-fun m!607589 () Bool)

(assert (=> d!89427 m!607589))

(assert (=> d!89427 m!607581))

(declare-fun m!607593 () Bool)

(assert (=> b!632783 m!607593))

(assert (=> b!632630 d!89427))

(declare-fun d!89435 () Bool)

(assert (=> d!89435 (= (validKeyInArray!0 (select (arr!18304 a!2986) j!136)) (and (not (= (select (arr!18304 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18304 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!632640 d!89435))

(declare-fun b!632812 () Bool)

(declare-fun e!361777 () Bool)

(declare-fun e!361779 () Bool)

(assert (=> b!632812 (= e!361777 e!361779)))

(declare-fun c!72137 () Bool)

(assert (=> b!632812 (= c!72137 (validKeyInArray!0 (select (arr!18304 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!632813 () Bool)

(declare-fun call!33347 () Bool)

(assert (=> b!632813 (= e!361779 call!33347)))

(declare-fun b!632814 () Bool)

(assert (=> b!632814 (= e!361779 call!33347)))

(declare-fun bm!33344 () Bool)

(assert (=> bm!33344 (= call!33347 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72137 (Cons!12341 (select (arr!18304 a!2986) #b00000000000000000000000000000000) Nil!12342) Nil!12342)))))

(declare-fun b!632816 () Bool)

(declare-fun e!361776 () Bool)

(assert (=> b!632816 (= e!361776 e!361777)))

(declare-fun res!409274 () Bool)

(assert (=> b!632816 (=> (not res!409274) (not e!361777))))

(declare-fun e!361778 () Bool)

(assert (=> b!632816 (= res!409274 (not e!361778))))

(declare-fun res!409272 () Bool)

(assert (=> b!632816 (=> (not res!409272) (not e!361778))))

(assert (=> b!632816 (= res!409272 (validKeyInArray!0 (select (arr!18304 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!632815 () Bool)

(declare-fun contains!3091 (List!12345 (_ BitVec 64)) Bool)

(assert (=> b!632815 (= e!361778 (contains!3091 Nil!12342 (select (arr!18304 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89441 () Bool)

(declare-fun res!409273 () Bool)

(assert (=> d!89441 (=> res!409273 e!361776)))

(assert (=> d!89441 (= res!409273 (bvsge #b00000000000000000000000000000000 (size!18668 a!2986)))))

(assert (=> d!89441 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12342) e!361776)))

(assert (= (and d!89441 (not res!409273)) b!632816))

(assert (= (and b!632816 res!409272) b!632815))

(assert (= (and b!632816 res!409274) b!632812))

(assert (= (and b!632812 c!72137) b!632813))

(assert (= (and b!632812 (not c!72137)) b!632814))

(assert (= (or b!632813 b!632814) bm!33344))

(assert (=> b!632812 m!607559))

(assert (=> b!632812 m!607559))

(declare-fun m!607623 () Bool)

(assert (=> b!632812 m!607623))

(assert (=> bm!33344 m!607559))

(declare-fun m!607625 () Bool)

(assert (=> bm!33344 m!607625))

(assert (=> b!632816 m!607559))

(assert (=> b!632816 m!607559))

(assert (=> b!632816 m!607623))

(assert (=> b!632815 m!607559))

(assert (=> b!632815 m!607559))

(declare-fun m!607627 () Bool)

(assert (=> b!632815 m!607627))

(assert (=> b!632639 d!89441))

(declare-fun d!89449 () Bool)

(assert (=> d!89449 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57124 d!89449))

(declare-fun d!89453 () Bool)

(assert (=> d!89453 (= (array_inv!14100 a!2986) (bvsge (size!18668 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57124 d!89453))

(declare-fun d!89455 () Bool)

(declare-fun res!409281 () Bool)

(declare-fun e!361786 () Bool)

(assert (=> d!89455 (=> res!409281 e!361786)))

(assert (=> d!89455 (= res!409281 (= (select (arr!18304 lt!292400) j!136) (select (arr!18304 a!2986) j!136)))))

(assert (=> d!89455 (= (arrayContainsKey!0 lt!292400 (select (arr!18304 a!2986) j!136) j!136) e!361786)))

(declare-fun b!632823 () Bool)

(declare-fun e!361787 () Bool)

(assert (=> b!632823 (= e!361786 e!361787)))

(declare-fun res!409282 () Bool)

(assert (=> b!632823 (=> (not res!409282) (not e!361787))))

(assert (=> b!632823 (= res!409282 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18668 lt!292400)))))

(declare-fun b!632824 () Bool)

(assert (=> b!632824 (= e!361787 (arrayContainsKey!0 lt!292400 (select (arr!18304 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89455 (not res!409281)) b!632823))

(assert (= (and b!632823 res!409282) b!632824))

(declare-fun m!607637 () Bool)

(assert (=> d!89455 m!607637))

(assert (=> b!632824 m!607445))

(declare-fun m!607639 () Bool)

(assert (=> b!632824 m!607639))

(assert (=> b!632634 d!89455))

(declare-fun d!89459 () Bool)

(assert (=> d!89459 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!632628 d!89459))

(declare-fun b!632872 () Bool)

(declare-fun e!361823 () Bool)

(declare-fun e!361821 () Bool)

(assert (=> b!632872 (= e!361823 e!361821)))

(declare-fun lt!292503 () (_ BitVec 64))

(assert (=> b!632872 (= lt!292503 (select (arr!18304 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!292505 () Unit!21310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38143 (_ BitVec 64) (_ BitVec 32)) Unit!21310)

(assert (=> b!632872 (= lt!292505 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!292503 #b00000000000000000000000000000000))))

(assert (=> b!632872 (arrayContainsKey!0 a!2986 lt!292503 #b00000000000000000000000000000000)))

(declare-fun lt!292504 () Unit!21310)

(assert (=> b!632872 (= lt!292504 lt!292505)))

(declare-fun res!409303 () Bool)

(assert (=> b!632872 (= res!409303 (= (seekEntryOrOpen!0 (select (arr!18304 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6744 #b00000000000000000000000000000000)))))

(assert (=> b!632872 (=> (not res!409303) (not e!361821))))

(declare-fun bm!33350 () Bool)

(declare-fun call!33353 () Bool)

(assert (=> bm!33350 (= call!33353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!632873 () Bool)

(declare-fun e!361822 () Bool)

(assert (=> b!632873 (= e!361822 e!361823)))

(declare-fun c!72152 () Bool)

(assert (=> b!632873 (= c!72152 (validKeyInArray!0 (select (arr!18304 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89461 () Bool)

(declare-fun res!409302 () Bool)

(assert (=> d!89461 (=> res!409302 e!361822)))

(assert (=> d!89461 (= res!409302 (bvsge #b00000000000000000000000000000000 (size!18668 a!2986)))))

(assert (=> d!89461 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361822)))

(declare-fun b!632874 () Bool)

(assert (=> b!632874 (= e!361821 call!33353)))

(declare-fun b!632875 () Bool)

(assert (=> b!632875 (= e!361823 call!33353)))

(assert (= (and d!89461 (not res!409302)) b!632873))

(assert (= (and b!632873 c!72152) b!632872))

(assert (= (and b!632873 (not c!72152)) b!632875))

(assert (= (and b!632872 res!409303) b!632874))

(assert (= (or b!632874 b!632875) bm!33350))

(assert (=> b!632872 m!607559))

(declare-fun m!607675 () Bool)

(assert (=> b!632872 m!607675))

(declare-fun m!607677 () Bool)

(assert (=> b!632872 m!607677))

(assert (=> b!632872 m!607559))

(declare-fun m!607679 () Bool)

(assert (=> b!632872 m!607679))

(declare-fun m!607681 () Bool)

(assert (=> bm!33350 m!607681))

(assert (=> b!632873 m!607559))

(assert (=> b!632873 m!607559))

(assert (=> b!632873 m!607623))

(assert (=> b!632638 d!89461))

(check-sat (not d!89427) (not bm!33350) (not b!632816) (not b!632778) (not b!632824) (not d!89425) (not b!632872) (not d!89421) (not bm!33344) (not b!632729) (not b!632717) (not d!89417) (not b!632815) (not b!632735) (not b!632711) (not d!89419) (not b!632873) (not b!632723) (not b!632812) (not b!632693) (not d!89415) (not d!89413))
(check-sat)
