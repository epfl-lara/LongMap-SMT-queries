; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31090 () Bool)

(assert start!31090)

(declare-fun b!312882 () Bool)

(declare-fun e!195032 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!312882 (= e!195032 (bvsge resX!52 #b01111111111111111111111111111110))))

(declare-fun b!312883 () Bool)

(declare-fun res!169339 () Bool)

(declare-fun e!195034 () Bool)

(assert (=> b!312883 (=> (not res!169339) (not e!195034))))

(declare-datatypes ((array!15992 0))(
  ( (array!15993 (arr!7578 (Array (_ BitVec 32) (_ BitVec 64))) (size!7930 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15992)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312883 (= res!169339 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312884 () Bool)

(declare-fun res!169344 () Bool)

(assert (=> b!312884 (=> (not res!169344) (not e!195034))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15992 (_ BitVec 32)) Bool)

(assert (=> b!312884 (= res!169344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!169343 () Bool)

(assert (=> start!31090 (=> (not res!169343) (not e!195034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31090 (= res!169343 (validMask!0 mask!3709))))

(assert (=> start!31090 e!195034))

(declare-fun array_inv!5541 (array!15992) Bool)

(assert (=> start!31090 (array_inv!5541 a!3293)))

(assert (=> start!31090 true))

(declare-fun b!312885 () Bool)

(assert (=> b!312885 (= e!195034 e!195032)))

(declare-fun res!169338 () Bool)

(assert (=> b!312885 (=> (not res!169338) (not e!195032))))

(declare-datatypes ((SeekEntryResult!2718 0))(
  ( (MissingZero!2718 (index!13048 (_ BitVec 32))) (Found!2718 (index!13049 (_ BitVec 32))) (Intermediate!2718 (undefined!3530 Bool) (index!13050 (_ BitVec 32)) (x!31251 (_ BitVec 32))) (Undefined!2718) (MissingVacant!2718 (index!13051 (_ BitVec 32))) )
))
(declare-fun lt!153351 () SeekEntryResult!2718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15992 (_ BitVec 32)) SeekEntryResult!2718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312885 (= res!169338 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153351))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312885 (= lt!153351 (Intermediate!2718 false resIndex!52 resX!52))))

(declare-fun b!312886 () Bool)

(declare-fun res!169341 () Bool)

(assert (=> b!312886 (=> (not res!169341) (not e!195032))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!312886 (= res!169341 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153351))))

(declare-fun b!312887 () Bool)

(declare-fun res!169336 () Bool)

(assert (=> b!312887 (=> (not res!169336) (not e!195034))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312887 (= res!169336 (and (= (size!7930 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7930 a!3293))))))

(declare-fun b!312888 () Bool)

(declare-fun res!169342 () Bool)

(assert (=> b!312888 (=> (not res!169342) (not e!195032))))

(assert (=> b!312888 (= res!169342 (and (= (select (arr!7578 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7930 a!3293))))))

(declare-fun b!312889 () Bool)

(declare-fun res!169337 () Bool)

(assert (=> b!312889 (=> (not res!169337) (not e!195034))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15992 (_ BitVec 32)) SeekEntryResult!2718)

(assert (=> b!312889 (= res!169337 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2718 i!1240)))))

(declare-fun b!312890 () Bool)

(declare-fun res!169340 () Bool)

(assert (=> b!312890 (=> (not res!169340) (not e!195034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312890 (= res!169340 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31090 res!169343) b!312887))

(assert (= (and b!312887 res!169336) b!312890))

(assert (= (and b!312890 res!169340) b!312883))

(assert (= (and b!312883 res!169339) b!312889))

(assert (= (and b!312889 res!169337) b!312884))

(assert (= (and b!312884 res!169344) b!312885))

(assert (= (and b!312885 res!169338) b!312888))

(assert (= (and b!312888 res!169342) b!312886))

(assert (= (and b!312886 res!169341) b!312882))

(declare-fun m!323017 () Bool)

(assert (=> b!312885 m!323017))

(assert (=> b!312885 m!323017))

(declare-fun m!323019 () Bool)

(assert (=> b!312885 m!323019))

(declare-fun m!323021 () Bool)

(assert (=> b!312884 m!323021))

(declare-fun m!323023 () Bool)

(assert (=> b!312888 m!323023))

(declare-fun m!323025 () Bool)

(assert (=> b!312890 m!323025))

(declare-fun m!323027 () Bool)

(assert (=> b!312889 m!323027))

(declare-fun m!323029 () Bool)

(assert (=> b!312886 m!323029))

(declare-fun m!323031 () Bool)

(assert (=> start!31090 m!323031))

(declare-fun m!323033 () Bool)

(assert (=> start!31090 m!323033))

(declare-fun m!323035 () Bool)

(assert (=> b!312883 m!323035))

(check-sat (not b!312884) (not b!312883) (not b!312890) (not b!312885) (not start!31090) (not b!312889) (not b!312886))
(check-sat)
(get-model)

(declare-fun b!312926 () Bool)

(declare-fun e!195052 () Bool)

(declare-fun call!25930 () Bool)

(assert (=> b!312926 (= e!195052 call!25930)))

(declare-fun bm!25927 () Bool)

(assert (=> bm!25927 (= call!25930 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!312927 () Bool)

(declare-fun e!195050 () Bool)

(assert (=> b!312927 (= e!195050 call!25930)))

(declare-fun b!312928 () Bool)

(assert (=> b!312928 (= e!195052 e!195050)))

(declare-fun lt!153362 () (_ BitVec 64))

(assert (=> b!312928 (= lt!153362 (select (arr!7578 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9665 0))(
  ( (Unit!9666) )
))
(declare-fun lt!153363 () Unit!9665)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15992 (_ BitVec 64) (_ BitVec 32)) Unit!9665)

(assert (=> b!312928 (= lt!153363 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153362 #b00000000000000000000000000000000))))

(assert (=> b!312928 (arrayContainsKey!0 a!3293 lt!153362 #b00000000000000000000000000000000)))

(declare-fun lt!153361 () Unit!9665)

(assert (=> b!312928 (= lt!153361 lt!153363)))

(declare-fun res!169376 () Bool)

(assert (=> b!312928 (= res!169376 (= (seekEntryOrOpen!0 (select (arr!7578 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2718 #b00000000000000000000000000000000)))))

(assert (=> b!312928 (=> (not res!169376) (not e!195050))))

(declare-fun b!312929 () Bool)

(declare-fun e!195051 () Bool)

(assert (=> b!312929 (= e!195051 e!195052)))

(declare-fun c!49380 () Bool)

(assert (=> b!312929 (= c!49380 (validKeyInArray!0 (select (arr!7578 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!68479 () Bool)

(declare-fun res!169377 () Bool)

(assert (=> d!68479 (=> res!169377 e!195051)))

(assert (=> d!68479 (= res!169377 (bvsge #b00000000000000000000000000000000 (size!7930 a!3293)))))

(assert (=> d!68479 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195051)))

(assert (= (and d!68479 (not res!169377)) b!312929))

(assert (= (and b!312929 c!49380) b!312928))

(assert (= (and b!312929 (not c!49380)) b!312926))

(assert (= (and b!312928 res!169376) b!312927))

(assert (= (or b!312927 b!312926) bm!25927))

(declare-fun m!323057 () Bool)

(assert (=> bm!25927 m!323057))

(declare-fun m!323059 () Bool)

(assert (=> b!312928 m!323059))

(declare-fun m!323061 () Bool)

(assert (=> b!312928 m!323061))

(declare-fun m!323063 () Bool)

(assert (=> b!312928 m!323063))

(assert (=> b!312928 m!323059))

(declare-fun m!323065 () Bool)

(assert (=> b!312928 m!323065))

(assert (=> b!312929 m!323059))

(assert (=> b!312929 m!323059))

(declare-fun m!323067 () Bool)

(assert (=> b!312929 m!323067))

(assert (=> b!312884 d!68479))

(declare-fun d!68483 () Bool)

(assert (=> d!68483 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!312890 d!68483))

(declare-fun d!68485 () Bool)

(declare-fun e!195084 () Bool)

(assert (=> d!68485 e!195084))

(declare-fun c!49398 () Bool)

(declare-fun lt!153383 () SeekEntryResult!2718)

(get-info :version)

(assert (=> d!68485 (= c!49398 (and ((_ is Intermediate!2718) lt!153383) (undefined!3530 lt!153383)))))

(declare-fun e!195086 () SeekEntryResult!2718)

(assert (=> d!68485 (= lt!153383 e!195086)))

(declare-fun c!49397 () Bool)

(assert (=> d!68485 (= c!49397 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153384 () (_ BitVec 64))

(assert (=> d!68485 (= lt!153384 (select (arr!7578 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68485 (validMask!0 mask!3709)))

(assert (=> d!68485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153383)))

(declare-fun b!312978 () Bool)

(assert (=> b!312978 (and (bvsge (index!13050 lt!153383) #b00000000000000000000000000000000) (bvslt (index!13050 lt!153383) (size!7930 a!3293)))))

(declare-fun res!169398 () Bool)

(assert (=> b!312978 (= res!169398 (= (select (arr!7578 a!3293) (index!13050 lt!153383)) k0!2441))))

(declare-fun e!195088 () Bool)

(assert (=> b!312978 (=> res!169398 e!195088)))

(declare-fun e!195085 () Bool)

(assert (=> b!312978 (= e!195085 e!195088)))

(declare-fun b!312979 () Bool)

(declare-fun e!195087 () SeekEntryResult!2718)

(assert (=> b!312979 (= e!195086 e!195087)))

(declare-fun c!49396 () Bool)

(assert (=> b!312979 (= c!49396 (or (= lt!153384 k0!2441) (= (bvadd lt!153384 lt!153384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!312980 () Bool)

(assert (=> b!312980 (and (bvsge (index!13050 lt!153383) #b00000000000000000000000000000000) (bvslt (index!13050 lt!153383) (size!7930 a!3293)))))

(assert (=> b!312980 (= e!195088 (= (select (arr!7578 a!3293) (index!13050 lt!153383)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!312981 () Bool)

(assert (=> b!312981 (and (bvsge (index!13050 lt!153383) #b00000000000000000000000000000000) (bvslt (index!13050 lt!153383) (size!7930 a!3293)))))

(declare-fun res!169396 () Bool)

(assert (=> b!312981 (= res!169396 (= (select (arr!7578 a!3293) (index!13050 lt!153383)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312981 (=> res!169396 e!195088)))

(declare-fun b!312982 () Bool)

(assert (=> b!312982 (= e!195087 (Intermediate!2718 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!312983 () Bool)

(assert (=> b!312983 (= e!195084 e!195085)))

(declare-fun res!169397 () Bool)

(assert (=> b!312983 (= res!169397 (and ((_ is Intermediate!2718) lt!153383) (not (undefined!3530 lt!153383)) (bvslt (x!31251 lt!153383) #b01111111111111111111111111111110) (bvsge (x!31251 lt!153383) #b00000000000000000000000000000000) (bvsge (x!31251 lt!153383) #b00000000000000000000000000000000)))))

(assert (=> b!312983 (=> (not res!169397) (not e!195085))))

(declare-fun b!312984 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312984 (= e!195087 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!312985 () Bool)

(assert (=> b!312985 (= e!195084 (bvsge (x!31251 lt!153383) #b01111111111111111111111111111110))))

(declare-fun b!312986 () Bool)

(assert (=> b!312986 (= e!195086 (Intermediate!2718 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68485 c!49397) b!312986))

(assert (= (and d!68485 (not c!49397)) b!312979))

(assert (= (and b!312979 c!49396) b!312982))

(assert (= (and b!312979 (not c!49396)) b!312984))

(assert (= (and d!68485 c!49398) b!312985))

(assert (= (and d!68485 (not c!49398)) b!312983))

(assert (= (and b!312983 res!169397) b!312978))

(assert (= (and b!312978 (not res!169398)) b!312981))

(assert (= (and b!312981 (not res!169396)) b!312980))

(declare-fun m!323083 () Bool)

(assert (=> b!312978 m!323083))

(assert (=> b!312984 m!323017))

(declare-fun m!323085 () Bool)

(assert (=> b!312984 m!323085))

(assert (=> b!312984 m!323085))

(declare-fun m!323087 () Bool)

(assert (=> b!312984 m!323087))

(assert (=> b!312981 m!323083))

(assert (=> d!68485 m!323017))

(declare-fun m!323089 () Bool)

(assert (=> d!68485 m!323089))

(assert (=> d!68485 m!323031))

(assert (=> b!312980 m!323083))

(assert (=> b!312885 d!68485))

(declare-fun d!68499 () Bool)

(declare-fun lt!153393 () (_ BitVec 32))

(declare-fun lt!153392 () (_ BitVec 32))

(assert (=> d!68499 (= lt!153393 (bvmul (bvxor lt!153392 (bvlshr lt!153392 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68499 (= lt!153392 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68499 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169399 (let ((h!5346 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31254 (bvmul (bvxor h!5346 (bvlshr h!5346 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31254 (bvlshr x!31254 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169399 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169399 #b00000000000000000000000000000000))))))

(assert (=> d!68499 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153393 (bvlshr lt!153393 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!312885 d!68499))

(declare-fun d!68503 () Bool)

(assert (=> d!68503 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31090 d!68503))

(declare-fun d!68507 () Bool)

(assert (=> d!68507 (= (array_inv!5541 a!3293) (bvsge (size!7930 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31090 d!68507))

(declare-fun d!68509 () Bool)

(declare-fun res!169410 () Bool)

(declare-fun e!195115 () Bool)

(assert (=> d!68509 (=> res!169410 e!195115)))

(assert (=> d!68509 (= res!169410 (= (select (arr!7578 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68509 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195115)))

(declare-fun b!313033 () Bool)

(declare-fun e!195116 () Bool)

(assert (=> b!313033 (= e!195115 e!195116)))

(declare-fun res!169411 () Bool)

(assert (=> b!313033 (=> (not res!169411) (not e!195116))))

(assert (=> b!313033 (= res!169411 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7930 a!3293)))))

(declare-fun b!313034 () Bool)

(assert (=> b!313034 (= e!195116 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68509 (not res!169410)) b!313033))

(assert (= (and b!313033 res!169411) b!313034))

(assert (=> d!68509 m!323059))

(declare-fun m!323111 () Bool)

(assert (=> b!313034 m!323111))

(assert (=> b!312883 d!68509))

(declare-fun b!313113 () Bool)

(declare-fun e!195162 () SeekEntryResult!2718)

(declare-fun lt!153435 () SeekEntryResult!2718)

(assert (=> b!313113 (= e!195162 (MissingZero!2718 (index!13050 lt!153435)))))

(declare-fun b!313114 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15992 (_ BitVec 32)) SeekEntryResult!2718)

(assert (=> b!313114 (= e!195162 (seekKeyOrZeroReturnVacant!0 (x!31251 lt!153435) (index!13050 lt!153435) (index!13050 lt!153435) k0!2441 a!3293 mask!3709))))

(declare-fun b!313115 () Bool)

(declare-fun e!195164 () SeekEntryResult!2718)

(assert (=> b!313115 (= e!195164 Undefined!2718)))

(declare-fun d!68511 () Bool)

(declare-fun lt!153436 () SeekEntryResult!2718)

(assert (=> d!68511 (and (or ((_ is Undefined!2718) lt!153436) (not ((_ is Found!2718) lt!153436)) (and (bvsge (index!13049 lt!153436) #b00000000000000000000000000000000) (bvslt (index!13049 lt!153436) (size!7930 a!3293)))) (or ((_ is Undefined!2718) lt!153436) ((_ is Found!2718) lt!153436) (not ((_ is MissingZero!2718) lt!153436)) (and (bvsge (index!13048 lt!153436) #b00000000000000000000000000000000) (bvslt (index!13048 lt!153436) (size!7930 a!3293)))) (or ((_ is Undefined!2718) lt!153436) ((_ is Found!2718) lt!153436) ((_ is MissingZero!2718) lt!153436) (not ((_ is MissingVacant!2718) lt!153436)) (and (bvsge (index!13051 lt!153436) #b00000000000000000000000000000000) (bvslt (index!13051 lt!153436) (size!7930 a!3293)))) (or ((_ is Undefined!2718) lt!153436) (ite ((_ is Found!2718) lt!153436) (= (select (arr!7578 a!3293) (index!13049 lt!153436)) k0!2441) (ite ((_ is MissingZero!2718) lt!153436) (= (select (arr!7578 a!3293) (index!13048 lt!153436)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2718) lt!153436) (= (select (arr!7578 a!3293) (index!13051 lt!153436)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68511 (= lt!153436 e!195164)))

(declare-fun c!49446 () Bool)

(assert (=> d!68511 (= c!49446 (and ((_ is Intermediate!2718) lt!153435) (undefined!3530 lt!153435)))))

(assert (=> d!68511 (= lt!153435 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68511 (validMask!0 mask!3709)))

(assert (=> d!68511 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153436)))

(declare-fun b!313116 () Bool)

(declare-fun e!195163 () SeekEntryResult!2718)

(assert (=> b!313116 (= e!195164 e!195163)))

(declare-fun lt!153434 () (_ BitVec 64))

(assert (=> b!313116 (= lt!153434 (select (arr!7578 a!3293) (index!13050 lt!153435)))))

(declare-fun c!49445 () Bool)

(assert (=> b!313116 (= c!49445 (= lt!153434 k0!2441))))

(declare-fun b!313117 () Bool)

(assert (=> b!313117 (= e!195163 (Found!2718 (index!13050 lt!153435)))))

(declare-fun b!313118 () Bool)

(declare-fun c!49444 () Bool)

(assert (=> b!313118 (= c!49444 (= lt!153434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313118 (= e!195163 e!195162)))

(assert (= (and d!68511 c!49446) b!313115))

(assert (= (and d!68511 (not c!49446)) b!313116))

(assert (= (and b!313116 c!49445) b!313117))

(assert (= (and b!313116 (not c!49445)) b!313118))

(assert (= (and b!313118 c!49444) b!313113))

(assert (= (and b!313118 (not c!49444)) b!313114))

(declare-fun m!323157 () Bool)

(assert (=> b!313114 m!323157))

(declare-fun m!323159 () Bool)

(assert (=> d!68511 m!323159))

(declare-fun m!323161 () Bool)

(assert (=> d!68511 m!323161))

(assert (=> d!68511 m!323031))

(declare-fun m!323163 () Bool)

(assert (=> d!68511 m!323163))

(assert (=> d!68511 m!323017))

(assert (=> d!68511 m!323019))

(assert (=> d!68511 m!323017))

(declare-fun m!323165 () Bool)

(assert (=> b!313116 m!323165))

(assert (=> b!312889 d!68511))

(declare-fun d!68525 () Bool)

(declare-fun e!195165 () Bool)

(assert (=> d!68525 e!195165))

(declare-fun c!49449 () Bool)

(declare-fun lt!153447 () SeekEntryResult!2718)

(assert (=> d!68525 (= c!49449 (and ((_ is Intermediate!2718) lt!153447) (undefined!3530 lt!153447)))))

(declare-fun e!195167 () SeekEntryResult!2718)

(assert (=> d!68525 (= lt!153447 e!195167)))

(declare-fun c!49448 () Bool)

(assert (=> d!68525 (= c!49448 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153448 () (_ BitVec 64))

(assert (=> d!68525 (= lt!153448 (select (arr!7578 a!3293) index!1781))))

(assert (=> d!68525 (validMask!0 mask!3709)))

(assert (=> d!68525 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153447)))

(declare-fun b!313119 () Bool)

(assert (=> b!313119 (and (bvsge (index!13050 lt!153447) #b00000000000000000000000000000000) (bvslt (index!13050 lt!153447) (size!7930 a!3293)))))

(declare-fun res!169440 () Bool)

(assert (=> b!313119 (= res!169440 (= (select (arr!7578 a!3293) (index!13050 lt!153447)) k0!2441))))

(declare-fun e!195169 () Bool)

(assert (=> b!313119 (=> res!169440 e!195169)))

(declare-fun e!195166 () Bool)

(assert (=> b!313119 (= e!195166 e!195169)))

(declare-fun b!313120 () Bool)

(declare-fun e!195168 () SeekEntryResult!2718)

(assert (=> b!313120 (= e!195167 e!195168)))

(declare-fun c!49447 () Bool)

(assert (=> b!313120 (= c!49447 (or (= lt!153448 k0!2441) (= (bvadd lt!153448 lt!153448) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313121 () Bool)

(assert (=> b!313121 (and (bvsge (index!13050 lt!153447) #b00000000000000000000000000000000) (bvslt (index!13050 lt!153447) (size!7930 a!3293)))))

(assert (=> b!313121 (= e!195169 (= (select (arr!7578 a!3293) (index!13050 lt!153447)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313122 () Bool)

(assert (=> b!313122 (and (bvsge (index!13050 lt!153447) #b00000000000000000000000000000000) (bvslt (index!13050 lt!153447) (size!7930 a!3293)))))

(declare-fun res!169438 () Bool)

(assert (=> b!313122 (= res!169438 (= (select (arr!7578 a!3293) (index!13050 lt!153447)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313122 (=> res!169438 e!195169)))

(declare-fun b!313123 () Bool)

(assert (=> b!313123 (= e!195168 (Intermediate!2718 false index!1781 x!1427))))

(declare-fun b!313124 () Bool)

(assert (=> b!313124 (= e!195165 e!195166)))

(declare-fun res!169439 () Bool)

(assert (=> b!313124 (= res!169439 (and ((_ is Intermediate!2718) lt!153447) (not (undefined!3530 lt!153447)) (bvslt (x!31251 lt!153447) #b01111111111111111111111111111110) (bvsge (x!31251 lt!153447) #b00000000000000000000000000000000) (bvsge (x!31251 lt!153447) x!1427)))))

(assert (=> b!313124 (=> (not res!169439) (not e!195166))))

(declare-fun b!313125 () Bool)

(assert (=> b!313125 (= e!195168 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313126 () Bool)

(assert (=> b!313126 (= e!195165 (bvsge (x!31251 lt!153447) #b01111111111111111111111111111110))))

(declare-fun b!313127 () Bool)

(assert (=> b!313127 (= e!195167 (Intermediate!2718 true index!1781 x!1427))))

(assert (= (and d!68525 c!49448) b!313127))

(assert (= (and d!68525 (not c!49448)) b!313120))

(assert (= (and b!313120 c!49447) b!313123))

(assert (= (and b!313120 (not c!49447)) b!313125))

(assert (= (and d!68525 c!49449) b!313126))

(assert (= (and d!68525 (not c!49449)) b!313124))

(assert (= (and b!313124 res!169439) b!313119))

(assert (= (and b!313119 (not res!169440)) b!313122))

(assert (= (and b!313122 (not res!169438)) b!313121))

(declare-fun m!323167 () Bool)

(assert (=> b!313119 m!323167))

(declare-fun m!323169 () Bool)

(assert (=> b!313125 m!323169))

(assert (=> b!313125 m!323169))

(declare-fun m!323171 () Bool)

(assert (=> b!313125 m!323171))

(assert (=> b!313122 m!323167))

(declare-fun m!323173 () Bool)

(assert (=> d!68525 m!323173))

(assert (=> d!68525 m!323031))

(assert (=> b!313121 m!323167))

(assert (=> b!312886 d!68525))

(check-sat (not d!68525) (not bm!25927) (not b!312929) (not d!68485) (not d!68511) (not b!313125) (not b!312928) (not b!313114) (not b!312984) (not b!313034))
(check-sat)
