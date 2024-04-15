; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31638 () Bool)

(assert start!31638)

(declare-fun b!316261 () Bool)

(declare-fun res!171348 () Bool)

(declare-fun e!196703 () Bool)

(assert (=> b!316261 (=> (not res!171348) (not e!196703))))

(declare-datatypes ((array!16115 0))(
  ( (array!16116 (arr!7626 (Array (_ BitVec 32) (_ BitVec 64))) (size!7979 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16115)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16115 (_ BitVec 32)) Bool)

(assert (=> b!316261 (= res!171348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!171342 () Bool)

(assert (=> start!31638 (=> (not res!171342) (not e!196703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31638 (= res!171342 (validMask!0 mask!3709))))

(assert (=> start!31638 e!196703))

(declare-fun array_inv!5598 (array!16115) Bool)

(assert (=> start!31638 (array_inv!5598 a!3293)))

(assert (=> start!31638 true))

(declare-fun b!316262 () Bool)

(declare-fun e!196702 () Bool)

(declare-fun e!196700 () Bool)

(assert (=> b!316262 (= e!196702 e!196700)))

(declare-fun res!171340 () Bool)

(assert (=> b!316262 (=> (not res!171340) (not e!196700))))

(declare-datatypes ((SeekEntryResult!2765 0))(
  ( (MissingZero!2765 (index!13236 (_ BitVec 32))) (Found!2765 (index!13237 (_ BitVec 32))) (Intermediate!2765 (undefined!3577 Bool) (index!13238 (_ BitVec 32)) (x!31503 (_ BitVec 32))) (Undefined!2765) (MissingVacant!2765 (index!13239 (_ BitVec 32))) )
))
(declare-fun lt!154373 () SeekEntryResult!2765)

(declare-fun lt!154372 () SeekEntryResult!2765)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316262 (= res!171340 (and (= lt!154373 lt!154372) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7626 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16115 (_ BitVec 32)) SeekEntryResult!2765)

(assert (=> b!316262 (= lt!154373 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!316263 () Bool)

(declare-fun res!171345 () Bool)

(assert (=> b!316263 (=> (not res!171345) (not e!196703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316263 (= res!171345 (validKeyInArray!0 k0!2441))))

(declare-fun b!316264 () Bool)

(declare-fun res!171344 () Bool)

(assert (=> b!316264 (=> (not res!171344) (not e!196703))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16115 (_ BitVec 32)) SeekEntryResult!2765)

(assert (=> b!316264 (= res!171344 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2765 i!1240)))))

(declare-fun b!316265 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316265 (= e!196700 (not (= lt!154373 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))))

(declare-fun b!316266 () Bool)

(declare-fun res!171347 () Bool)

(assert (=> b!316266 (=> (not res!171347) (not e!196703))))

(assert (=> b!316266 (= res!171347 (and (= (size!7979 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7979 a!3293))))))

(declare-fun b!316267 () Bool)

(declare-fun res!171346 () Bool)

(assert (=> b!316267 (=> (not res!171346) (not e!196702))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316267 (= res!171346 (and (= (select (arr!7626 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7979 a!3293))))))

(declare-fun b!316268 () Bool)

(assert (=> b!316268 (= e!196703 e!196702)))

(declare-fun res!171343 () Bool)

(assert (=> b!316268 (=> (not res!171343) (not e!196702))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316268 (= res!171343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154372))))

(assert (=> b!316268 (= lt!154372 (Intermediate!2765 false resIndex!52 resX!52))))

(declare-fun b!316269 () Bool)

(declare-fun res!171341 () Bool)

(assert (=> b!316269 (=> (not res!171341) (not e!196703))))

(declare-fun arrayContainsKey!0 (array!16115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316269 (= res!171341 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31638 res!171342) b!316266))

(assert (= (and b!316266 res!171347) b!316263))

(assert (= (and b!316263 res!171345) b!316269))

(assert (= (and b!316269 res!171341) b!316264))

(assert (= (and b!316264 res!171344) b!316261))

(assert (= (and b!316261 res!171348) b!316268))

(assert (= (and b!316268 res!171343) b!316267))

(assert (= (and b!316267 res!171346) b!316262))

(assert (= (and b!316262 res!171340) b!316265))

(declare-fun m!324661 () Bool)

(assert (=> b!316267 m!324661))

(declare-fun m!324663 () Bool)

(assert (=> b!316261 m!324663))

(declare-fun m!324665 () Bool)

(assert (=> b!316268 m!324665))

(assert (=> b!316268 m!324665))

(declare-fun m!324667 () Bool)

(assert (=> b!316268 m!324667))

(declare-fun m!324669 () Bool)

(assert (=> start!31638 m!324669))

(declare-fun m!324671 () Bool)

(assert (=> start!31638 m!324671))

(declare-fun m!324673 () Bool)

(assert (=> b!316264 m!324673))

(declare-fun m!324675 () Bool)

(assert (=> b!316263 m!324675))

(declare-fun m!324677 () Bool)

(assert (=> b!316269 m!324677))

(declare-fun m!324679 () Bool)

(assert (=> b!316262 m!324679))

(declare-fun m!324681 () Bool)

(assert (=> b!316262 m!324681))

(declare-fun m!324683 () Bool)

(assert (=> b!316265 m!324683))

(assert (=> b!316265 m!324683))

(declare-fun m!324685 () Bool)

(assert (=> b!316265 m!324685))

(check-sat (not b!316269) (not b!316262) (not start!31638) (not b!316265) (not b!316264) (not b!316261) (not b!316263) (not b!316268))
(check-sat)
(get-model)

(declare-fun b!316342 () Bool)

(declare-fun lt!154391 () SeekEntryResult!2765)

(assert (=> b!316342 (and (bvsge (index!13238 lt!154391) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154391) (size!7979 a!3293)))))

(declare-fun res!171410 () Bool)

(assert (=> b!316342 (= res!171410 (= (select (arr!7626 a!3293) (index!13238 lt!154391)) k0!2441))))

(declare-fun e!196741 () Bool)

(assert (=> b!316342 (=> res!171410 e!196741)))

(declare-fun e!196740 () Bool)

(assert (=> b!316342 (= e!196740 e!196741)))

(declare-fun b!316343 () Bool)

(declare-fun e!196738 () SeekEntryResult!2765)

(assert (=> b!316343 (= e!196738 (Intermediate!2765 true index!1781 x!1427))))

(declare-fun b!316344 () Bool)

(declare-fun e!196739 () SeekEntryResult!2765)

(assert (=> b!316344 (= e!196739 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316345 () Bool)

(declare-fun e!196742 () Bool)

(assert (=> b!316345 (= e!196742 e!196740)))

(declare-fun res!171411 () Bool)

(get-info :version)

(assert (=> b!316345 (= res!171411 (and ((_ is Intermediate!2765) lt!154391) (not (undefined!3577 lt!154391)) (bvslt (x!31503 lt!154391) #b01111111111111111111111111111110) (bvsge (x!31503 lt!154391) #b00000000000000000000000000000000) (bvsge (x!31503 lt!154391) x!1427)))))

(assert (=> b!316345 (=> (not res!171411) (not e!196740))))

(declare-fun b!316347 () Bool)

(assert (=> b!316347 (and (bvsge (index!13238 lt!154391) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154391) (size!7979 a!3293)))))

(assert (=> b!316347 (= e!196741 (= (select (arr!7626 a!3293) (index!13238 lt!154391)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316348 () Bool)

(assert (=> b!316348 (= e!196739 (Intermediate!2765 false index!1781 x!1427))))

(declare-fun b!316349 () Bool)

(assert (=> b!316349 (= e!196738 e!196739)))

(declare-fun c!50085 () Bool)

(declare-fun lt!154390 () (_ BitVec 64))

(assert (=> b!316349 (= c!50085 (or (= lt!154390 k0!2441) (= (bvadd lt!154390 lt!154390) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316350 () Bool)

(assert (=> b!316350 (= e!196742 (bvsge (x!31503 lt!154391) #b01111111111111111111111111111110))))

(declare-fun d!68843 () Bool)

(assert (=> d!68843 e!196742))

(declare-fun c!50086 () Bool)

(assert (=> d!68843 (= c!50086 (and ((_ is Intermediate!2765) lt!154391) (undefined!3577 lt!154391)))))

(assert (=> d!68843 (= lt!154391 e!196738)))

(declare-fun c!50087 () Bool)

(assert (=> d!68843 (= c!50087 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68843 (= lt!154390 (select (arr!7626 a!3293) index!1781))))

(assert (=> d!68843 (validMask!0 mask!3709)))

(assert (=> d!68843 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154391)))

(declare-fun b!316346 () Bool)

(assert (=> b!316346 (and (bvsge (index!13238 lt!154391) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154391) (size!7979 a!3293)))))

(declare-fun res!171409 () Bool)

(assert (=> b!316346 (= res!171409 (= (select (arr!7626 a!3293) (index!13238 lt!154391)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316346 (=> res!171409 e!196741)))

(assert (= (and d!68843 c!50087) b!316343))

(assert (= (and d!68843 (not c!50087)) b!316349))

(assert (= (and b!316349 c!50085) b!316348))

(assert (= (and b!316349 (not c!50085)) b!316344))

(assert (= (and d!68843 c!50086) b!316350))

(assert (= (and d!68843 (not c!50086)) b!316345))

(assert (= (and b!316345 res!171411) b!316342))

(assert (= (and b!316342 (not res!171410)) b!316346))

(assert (= (and b!316346 (not res!171409)) b!316347))

(declare-fun m!324739 () Bool)

(assert (=> b!316347 m!324739))

(assert (=> b!316342 m!324739))

(assert (=> d!68843 m!324679))

(assert (=> d!68843 m!324669))

(assert (=> b!316344 m!324683))

(assert (=> b!316344 m!324683))

(declare-fun m!324741 () Bool)

(assert (=> b!316344 m!324741))

(assert (=> b!316346 m!324739))

(assert (=> b!316262 d!68843))

(declare-fun d!68851 () Bool)

(assert (=> d!68851 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31638 d!68851))

(declare-fun d!68853 () Bool)

(assert (=> d!68853 (= (array_inv!5598 a!3293) (bvsge (size!7979 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31638 d!68853))

(declare-fun bm!25982 () Bool)

(declare-fun call!25985 () Bool)

(assert (=> bm!25982 (= call!25985 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68855 () Bool)

(declare-fun res!171423 () Bool)

(declare-fun e!196775 () Bool)

(assert (=> d!68855 (=> res!171423 e!196775)))

(assert (=> d!68855 (= res!171423 (bvsge #b00000000000000000000000000000000 (size!7979 a!3293)))))

(assert (=> d!68855 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196775)))

(declare-fun b!316401 () Bool)

(declare-fun e!196773 () Bool)

(declare-fun e!196774 () Bool)

(assert (=> b!316401 (= e!196773 e!196774)))

(declare-fun lt!154416 () (_ BitVec 64))

(assert (=> b!316401 (= lt!154416 (select (arr!7626 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9746 0))(
  ( (Unit!9747) )
))
(declare-fun lt!154418 () Unit!9746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16115 (_ BitVec 64) (_ BitVec 32)) Unit!9746)

(assert (=> b!316401 (= lt!154418 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154416 #b00000000000000000000000000000000))))

(assert (=> b!316401 (arrayContainsKey!0 a!3293 lt!154416 #b00000000000000000000000000000000)))

(declare-fun lt!154417 () Unit!9746)

(assert (=> b!316401 (= lt!154417 lt!154418)))

(declare-fun res!171422 () Bool)

(assert (=> b!316401 (= res!171422 (= (seekEntryOrOpen!0 (select (arr!7626 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2765 #b00000000000000000000000000000000)))))

(assert (=> b!316401 (=> (not res!171422) (not e!196774))))

(declare-fun b!316402 () Bool)

(assert (=> b!316402 (= e!196775 e!196773)))

(declare-fun c!50108 () Bool)

(assert (=> b!316402 (= c!50108 (validKeyInArray!0 (select (arr!7626 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!316403 () Bool)

(assert (=> b!316403 (= e!196774 call!25985)))

(declare-fun b!316404 () Bool)

(assert (=> b!316404 (= e!196773 call!25985)))

(assert (= (and d!68855 (not res!171423)) b!316402))

(assert (= (and b!316402 c!50108) b!316401))

(assert (= (and b!316402 (not c!50108)) b!316404))

(assert (= (and b!316401 res!171422) b!316403))

(assert (= (or b!316403 b!316404) bm!25982))

(declare-fun m!324767 () Bool)

(assert (=> bm!25982 m!324767))

(declare-fun m!324769 () Bool)

(assert (=> b!316401 m!324769))

(declare-fun m!324771 () Bool)

(assert (=> b!316401 m!324771))

(declare-fun m!324773 () Bool)

(assert (=> b!316401 m!324773))

(assert (=> b!316401 m!324769))

(declare-fun m!324775 () Bool)

(assert (=> b!316401 m!324775))

(assert (=> b!316402 m!324769))

(assert (=> b!316402 m!324769))

(declare-fun m!324777 () Bool)

(assert (=> b!316402 m!324777))

(assert (=> b!316261 d!68855))

(declare-fun b!316405 () Bool)

(declare-fun lt!154420 () SeekEntryResult!2765)

(assert (=> b!316405 (and (bvsge (index!13238 lt!154420) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154420) (size!7979 a!3293)))))

(declare-fun res!171425 () Bool)

(assert (=> b!316405 (= res!171425 (= (select (arr!7626 a!3293) (index!13238 lt!154420)) k0!2441))))

(declare-fun e!196779 () Bool)

(assert (=> b!316405 (=> res!171425 e!196779)))

(declare-fun e!196778 () Bool)

(assert (=> b!316405 (= e!196778 e!196779)))

(declare-fun e!196776 () SeekEntryResult!2765)

(declare-fun b!316406 () Bool)

(assert (=> b!316406 (= e!196776 (Intermediate!2765 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun e!196777 () SeekEntryResult!2765)

(declare-fun b!316407 () Bool)

(assert (=> b!316407 (= e!196777 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316408 () Bool)

(declare-fun e!196780 () Bool)

(assert (=> b!316408 (= e!196780 e!196778)))

(declare-fun res!171426 () Bool)

(assert (=> b!316408 (= res!171426 (and ((_ is Intermediate!2765) lt!154420) (not (undefined!3577 lt!154420)) (bvslt (x!31503 lt!154420) #b01111111111111111111111111111110) (bvsge (x!31503 lt!154420) #b00000000000000000000000000000000) (bvsge (x!31503 lt!154420) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!316408 (=> (not res!171426) (not e!196778))))

(declare-fun b!316410 () Bool)

(assert (=> b!316410 (and (bvsge (index!13238 lt!154420) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154420) (size!7979 a!3293)))))

(assert (=> b!316410 (= e!196779 (= (select (arr!7626 a!3293) (index!13238 lt!154420)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316411 () Bool)

(assert (=> b!316411 (= e!196777 (Intermediate!2765 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!316412 () Bool)

(assert (=> b!316412 (= e!196776 e!196777)))

(declare-fun c!50109 () Bool)

(declare-fun lt!154419 () (_ BitVec 64))

(assert (=> b!316412 (= c!50109 (or (= lt!154419 k0!2441) (= (bvadd lt!154419 lt!154419) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316413 () Bool)

(assert (=> b!316413 (= e!196780 (bvsge (x!31503 lt!154420) #b01111111111111111111111111111110))))

(declare-fun d!68863 () Bool)

(assert (=> d!68863 e!196780))

(declare-fun c!50110 () Bool)

(assert (=> d!68863 (= c!50110 (and ((_ is Intermediate!2765) lt!154420) (undefined!3577 lt!154420)))))

(assert (=> d!68863 (= lt!154420 e!196776)))

(declare-fun c!50111 () Bool)

(assert (=> d!68863 (= c!50111 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68863 (= lt!154419 (select (arr!7626 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68863 (validMask!0 mask!3709)))

(assert (=> d!68863 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!154420)))

(declare-fun b!316409 () Bool)

(assert (=> b!316409 (and (bvsge (index!13238 lt!154420) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154420) (size!7979 a!3293)))))

(declare-fun res!171424 () Bool)

(assert (=> b!316409 (= res!171424 (= (select (arr!7626 a!3293) (index!13238 lt!154420)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316409 (=> res!171424 e!196779)))

(assert (= (and d!68863 c!50111) b!316406))

(assert (= (and d!68863 (not c!50111)) b!316412))

(assert (= (and b!316412 c!50109) b!316411))

(assert (= (and b!316412 (not c!50109)) b!316407))

(assert (= (and d!68863 c!50110) b!316413))

(assert (= (and d!68863 (not c!50110)) b!316408))

(assert (= (and b!316408 res!171426) b!316405))

(assert (= (and b!316405 (not res!171425)) b!316409))

(assert (= (and b!316409 (not res!171424)) b!316410))

(declare-fun m!324779 () Bool)

(assert (=> b!316410 m!324779))

(assert (=> b!316405 m!324779))

(assert (=> d!68863 m!324683))

(declare-fun m!324781 () Bool)

(assert (=> d!68863 m!324781))

(assert (=> d!68863 m!324669))

(assert (=> b!316407 m!324683))

(declare-fun m!324783 () Bool)

(assert (=> b!316407 m!324783))

(assert (=> b!316407 m!324783))

(declare-fun m!324785 () Bool)

(assert (=> b!316407 m!324785))

(assert (=> b!316409 m!324779))

(assert (=> b!316265 d!68863))

(declare-fun d!68865 () Bool)

(declare-fun lt!154423 () (_ BitVec 32))

(assert (=> d!68865 (and (bvsge lt!154423 #b00000000000000000000000000000000) (bvslt lt!154423 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68865 (= lt!154423 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68865 (validMask!0 mask!3709)))

(assert (=> d!68865 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154423)))

(declare-fun bs!11021 () Bool)

(assert (= bs!11021 d!68865))

(declare-fun m!324787 () Bool)

(assert (=> bs!11021 m!324787))

(assert (=> bs!11021 m!324669))

(assert (=> b!316265 d!68865))

(declare-fun d!68871 () Bool)

(declare-fun res!171431 () Bool)

(declare-fun e!196785 () Bool)

(assert (=> d!68871 (=> res!171431 e!196785)))

(assert (=> d!68871 (= res!171431 (= (select (arr!7626 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68871 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196785)))

(declare-fun b!316418 () Bool)

(declare-fun e!196786 () Bool)

(assert (=> b!316418 (= e!196785 e!196786)))

(declare-fun res!171432 () Bool)

(assert (=> b!316418 (=> (not res!171432) (not e!196786))))

(assert (=> b!316418 (= res!171432 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7979 a!3293)))))

(declare-fun b!316419 () Bool)

(assert (=> b!316419 (= e!196786 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68871 (not res!171431)) b!316418))

(assert (= (and b!316418 res!171432) b!316419))

(assert (=> d!68871 m!324769))

(declare-fun m!324789 () Bool)

(assert (=> b!316419 m!324789))

(assert (=> b!316269 d!68871))

(declare-fun b!316471 () Bool)

(declare-fun e!196817 () SeekEntryResult!2765)

(declare-fun lt!154452 () SeekEntryResult!2765)

(assert (=> b!316471 (= e!196817 (Found!2765 (index!13238 lt!154452)))))

(declare-fun b!316472 () Bool)

(declare-fun c!50131 () Bool)

(declare-fun lt!154453 () (_ BitVec 64))

(assert (=> b!316472 (= c!50131 (= lt!154453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196819 () SeekEntryResult!2765)

(assert (=> b!316472 (= e!196817 e!196819)))

(declare-fun b!316473 () Bool)

(declare-fun e!196818 () SeekEntryResult!2765)

(assert (=> b!316473 (= e!196818 e!196817)))

(assert (=> b!316473 (= lt!154453 (select (arr!7626 a!3293) (index!13238 lt!154452)))))

(declare-fun c!50132 () Bool)

(assert (=> b!316473 (= c!50132 (= lt!154453 k0!2441))))

(declare-fun d!68873 () Bool)

(declare-fun lt!154451 () SeekEntryResult!2765)

(assert (=> d!68873 (and (or ((_ is Undefined!2765) lt!154451) (not ((_ is Found!2765) lt!154451)) (and (bvsge (index!13237 lt!154451) #b00000000000000000000000000000000) (bvslt (index!13237 lt!154451) (size!7979 a!3293)))) (or ((_ is Undefined!2765) lt!154451) ((_ is Found!2765) lt!154451) (not ((_ is MissingZero!2765) lt!154451)) (and (bvsge (index!13236 lt!154451) #b00000000000000000000000000000000) (bvslt (index!13236 lt!154451) (size!7979 a!3293)))) (or ((_ is Undefined!2765) lt!154451) ((_ is Found!2765) lt!154451) ((_ is MissingZero!2765) lt!154451) (not ((_ is MissingVacant!2765) lt!154451)) (and (bvsge (index!13239 lt!154451) #b00000000000000000000000000000000) (bvslt (index!13239 lt!154451) (size!7979 a!3293)))) (or ((_ is Undefined!2765) lt!154451) (ite ((_ is Found!2765) lt!154451) (= (select (arr!7626 a!3293) (index!13237 lt!154451)) k0!2441) (ite ((_ is MissingZero!2765) lt!154451) (= (select (arr!7626 a!3293) (index!13236 lt!154451)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2765) lt!154451) (= (select (arr!7626 a!3293) (index!13239 lt!154451)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68873 (= lt!154451 e!196818)))

(declare-fun c!50130 () Bool)

(assert (=> d!68873 (= c!50130 (and ((_ is Intermediate!2765) lt!154452) (undefined!3577 lt!154452)))))

(assert (=> d!68873 (= lt!154452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68873 (validMask!0 mask!3709)))

(assert (=> d!68873 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154451)))

(declare-fun b!316474 () Bool)

(assert (=> b!316474 (= e!196818 Undefined!2765)))

(declare-fun b!316475 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16115 (_ BitVec 32)) SeekEntryResult!2765)

(assert (=> b!316475 (= e!196819 (seekKeyOrZeroReturnVacant!0 (x!31503 lt!154452) (index!13238 lt!154452) (index!13238 lt!154452) k0!2441 a!3293 mask!3709))))

(declare-fun b!316476 () Bool)

(assert (=> b!316476 (= e!196819 (MissingZero!2765 (index!13238 lt!154452)))))

(assert (= (and d!68873 c!50130) b!316474))

(assert (= (and d!68873 (not c!50130)) b!316473))

(assert (= (and b!316473 c!50132) b!316471))

(assert (= (and b!316473 (not c!50132)) b!316472))

(assert (= (and b!316472 c!50131) b!316476))

(assert (= (and b!316472 (not c!50131)) b!316475))

(declare-fun m!324809 () Bool)

(assert (=> b!316473 m!324809))

(declare-fun m!324811 () Bool)

(assert (=> d!68873 m!324811))

(declare-fun m!324813 () Bool)

(assert (=> d!68873 m!324813))

(assert (=> d!68873 m!324665))

(assert (=> d!68873 m!324667))

(assert (=> d!68873 m!324669))

(assert (=> d!68873 m!324665))

(declare-fun m!324815 () Bool)

(assert (=> d!68873 m!324815))

(declare-fun m!324817 () Bool)

(assert (=> b!316475 m!324817))

(assert (=> b!316264 d!68873))

(declare-fun d!68881 () Bool)

(assert (=> d!68881 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!316263 d!68881))

(declare-fun b!316489 () Bool)

(declare-fun lt!154459 () SeekEntryResult!2765)

(assert (=> b!316489 (and (bvsge (index!13238 lt!154459) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154459) (size!7979 a!3293)))))

(declare-fun res!171450 () Bool)

(assert (=> b!316489 (= res!171450 (= (select (arr!7626 a!3293) (index!13238 lt!154459)) k0!2441))))

(declare-fun e!196829 () Bool)

(assert (=> b!316489 (=> res!171450 e!196829)))

(declare-fun e!196828 () Bool)

(assert (=> b!316489 (= e!196828 e!196829)))

(declare-fun b!316490 () Bool)

(declare-fun e!196826 () SeekEntryResult!2765)

(assert (=> b!316490 (= e!196826 (Intermediate!2765 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316491 () Bool)

(declare-fun e!196827 () SeekEntryResult!2765)

(assert (=> b!316491 (= e!196827 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!316492 () Bool)

(declare-fun e!196830 () Bool)

(assert (=> b!316492 (= e!196830 e!196828)))

(declare-fun res!171451 () Bool)

(assert (=> b!316492 (= res!171451 (and ((_ is Intermediate!2765) lt!154459) (not (undefined!3577 lt!154459)) (bvslt (x!31503 lt!154459) #b01111111111111111111111111111110) (bvsge (x!31503 lt!154459) #b00000000000000000000000000000000) (bvsge (x!31503 lt!154459) #b00000000000000000000000000000000)))))

(assert (=> b!316492 (=> (not res!171451) (not e!196828))))

(declare-fun b!316494 () Bool)

(assert (=> b!316494 (and (bvsge (index!13238 lt!154459) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154459) (size!7979 a!3293)))))

(assert (=> b!316494 (= e!196829 (= (select (arr!7626 a!3293) (index!13238 lt!154459)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!316495 () Bool)

(assert (=> b!316495 (= e!196827 (Intermediate!2765 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!316496 () Bool)

(assert (=> b!316496 (= e!196826 e!196827)))

(declare-fun c!50138 () Bool)

(declare-fun lt!154458 () (_ BitVec 64))

(assert (=> b!316496 (= c!50138 (or (= lt!154458 k0!2441) (= (bvadd lt!154458 lt!154458) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316497 () Bool)

(assert (=> b!316497 (= e!196830 (bvsge (x!31503 lt!154459) #b01111111111111111111111111111110))))

(declare-fun d!68883 () Bool)

(assert (=> d!68883 e!196830))

(declare-fun c!50140 () Bool)

(assert (=> d!68883 (= c!50140 (and ((_ is Intermediate!2765) lt!154459) (undefined!3577 lt!154459)))))

(assert (=> d!68883 (= lt!154459 e!196826)))

(declare-fun c!50141 () Bool)

(assert (=> d!68883 (= c!50141 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68883 (= lt!154458 (select (arr!7626 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68883 (validMask!0 mask!3709)))

(assert (=> d!68883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154459)))

(declare-fun b!316493 () Bool)

(assert (=> b!316493 (and (bvsge (index!13238 lt!154459) #b00000000000000000000000000000000) (bvslt (index!13238 lt!154459) (size!7979 a!3293)))))

(declare-fun res!171449 () Bool)

(assert (=> b!316493 (= res!171449 (= (select (arr!7626 a!3293) (index!13238 lt!154459)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!316493 (=> res!171449 e!196829)))

(assert (= (and d!68883 c!50141) b!316490))

(assert (= (and d!68883 (not c!50141)) b!316496))

(assert (= (and b!316496 c!50138) b!316495))

(assert (= (and b!316496 (not c!50138)) b!316491))

(assert (= (and d!68883 c!50140) b!316497))

(assert (= (and d!68883 (not c!50140)) b!316492))

(assert (= (and b!316492 res!171451) b!316489))

(assert (= (and b!316489 (not res!171450)) b!316493))

(assert (= (and b!316493 (not res!171449)) b!316494))

(declare-fun m!324819 () Bool)

(assert (=> b!316494 m!324819))

(assert (=> b!316489 m!324819))

(assert (=> d!68883 m!324665))

(declare-fun m!324821 () Bool)

(assert (=> d!68883 m!324821))

(assert (=> d!68883 m!324669))

(assert (=> b!316491 m!324665))

(declare-fun m!324823 () Bool)

(assert (=> b!316491 m!324823))

(assert (=> b!316491 m!324823))

(declare-fun m!324825 () Bool)

(assert (=> b!316491 m!324825))

(assert (=> b!316493 m!324819))

(assert (=> b!316268 d!68883))

(declare-fun d!68885 () Bool)

(declare-fun lt!154471 () (_ BitVec 32))

(declare-fun lt!154470 () (_ BitVec 32))

(assert (=> d!68885 (= lt!154471 (bvmul (bvxor lt!154470 (bvlshr lt!154470 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68885 (= lt!154470 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68885 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171458 (let ((h!5342 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31511 (bvmul (bvxor h!5342 (bvlshr h!5342 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31511 (bvlshr x!31511 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171458 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171458 #b00000000000000000000000000000000))))))

(assert (=> d!68885 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154471 (bvlshr lt!154471 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!316268 d!68885))

(check-sat (not b!316407) (not d!68873) (not d!68863) (not d!68843) (not b!316344) (not b!316475) (not bm!25982) (not d!68883) (not b!316401) (not b!316419) (not b!316402) (not b!316491) (not d!68865))
(check-sat)
