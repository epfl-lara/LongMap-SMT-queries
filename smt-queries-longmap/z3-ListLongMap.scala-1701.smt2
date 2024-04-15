; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31128 () Bool)

(assert start!31128)

(declare-fun b!312877 () Bool)

(declare-fun res!169343 () Bool)

(declare-fun e!195008 () Bool)

(assert (=> b!312877 (=> (not res!169343) (not e!195008))))

(declare-datatypes ((array!15989 0))(
  ( (array!15990 (arr!7575 (Array (_ BitVec 32) (_ BitVec 64))) (size!7928 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15989)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2714 0))(
  ( (MissingZero!2714 (index!13032 (_ BitVec 32))) (Found!2714 (index!13033 (_ BitVec 32))) (Intermediate!2714 (undefined!3526 Bool) (index!13034 (_ BitVec 32)) (x!31256 (_ BitVec 32))) (Undefined!2714) (MissingVacant!2714 (index!13035 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15989 (_ BitVec 32)) SeekEntryResult!2714)

(assert (=> b!312877 (= res!169343 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2714 i!1240)))))

(declare-fun res!169341 () Bool)

(assert (=> start!31128 (=> (not res!169341) (not e!195008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31128 (= res!169341 (validMask!0 mask!3709))))

(assert (=> start!31128 e!195008))

(declare-fun array_inv!5547 (array!15989) Bool)

(assert (=> start!31128 (array_inv!5547 a!3293)))

(assert (=> start!31128 true))

(declare-fun b!312878 () Bool)

(declare-fun e!195006 () Bool)

(assert (=> b!312878 (= e!195008 e!195006)))

(declare-fun res!169342 () Bool)

(assert (=> b!312878 (=> (not res!169342) (not e!195006))))

(declare-fun lt!153218 () SeekEntryResult!2714)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15989 (_ BitVec 32)) SeekEntryResult!2714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312878 (= res!169342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153218))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!312878 (= lt!153218 (Intermediate!2714 false resIndex!52 resX!52))))

(declare-fun b!312879 () Bool)

(declare-fun res!169340 () Bool)

(assert (=> b!312879 (=> (not res!169340) (not e!195008))))

(declare-fun arrayContainsKey!0 (array!15989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312879 (= res!169340 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312880 () Bool)

(declare-fun res!169344 () Bool)

(assert (=> b!312880 (=> (not res!169344) (not e!195006))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312880 (= res!169344 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153218))))

(declare-fun b!312881 () Bool)

(assert (=> b!312881 (= e!195006 (and (bvslt resX!52 #b01111111111111111111111111111110) (= (select (arr!7575 a!3293) index!1781) k0!2441)))))

(declare-fun b!312882 () Bool)

(declare-fun res!169338 () Bool)

(assert (=> b!312882 (=> (not res!169338) (not e!195008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15989 (_ BitVec 32)) Bool)

(assert (=> b!312882 (= res!169338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312883 () Bool)

(declare-fun res!169336 () Bool)

(assert (=> b!312883 (=> (not res!169336) (not e!195008))))

(assert (=> b!312883 (= res!169336 (and (= (size!7928 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7928 a!3293))))))

(declare-fun b!312884 () Bool)

(declare-fun res!169337 () Bool)

(assert (=> b!312884 (=> (not res!169337) (not e!195008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312884 (= res!169337 (validKeyInArray!0 k0!2441))))

(declare-fun b!312885 () Bool)

(declare-fun res!169339 () Bool)

(assert (=> b!312885 (=> (not res!169339) (not e!195006))))

(assert (=> b!312885 (= res!169339 (and (= (select (arr!7575 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7928 a!3293))))))

(assert (= (and start!31128 res!169341) b!312883))

(assert (= (and b!312883 res!169336) b!312884))

(assert (= (and b!312884 res!169337) b!312879))

(assert (= (and b!312879 res!169340) b!312877))

(assert (= (and b!312877 res!169343) b!312882))

(assert (= (and b!312882 res!169338) b!312878))

(assert (= (and b!312878 res!169342) b!312885))

(assert (= (and b!312885 res!169339) b!312880))

(assert (= (and b!312880 res!169344) b!312881))

(declare-fun m!322447 () Bool)

(assert (=> b!312881 m!322447))

(declare-fun m!322449 () Bool)

(assert (=> b!312877 m!322449))

(declare-fun m!322451 () Bool)

(assert (=> b!312882 m!322451))

(declare-fun m!322453 () Bool)

(assert (=> start!31128 m!322453))

(declare-fun m!322455 () Bool)

(assert (=> start!31128 m!322455))

(declare-fun m!322457 () Bool)

(assert (=> b!312878 m!322457))

(assert (=> b!312878 m!322457))

(declare-fun m!322459 () Bool)

(assert (=> b!312878 m!322459))

(declare-fun m!322461 () Bool)

(assert (=> b!312885 m!322461))

(declare-fun m!322463 () Bool)

(assert (=> b!312879 m!322463))

(declare-fun m!322465 () Bool)

(assert (=> b!312880 m!322465))

(declare-fun m!322467 () Bool)

(assert (=> b!312884 m!322467))

(check-sat (not b!312877) (not b!312882) (not b!312884) (not b!312880) (not b!312878) (not b!312879) (not start!31128))
(check-sat)
(get-model)

(declare-fun b!312980 () Bool)

(declare-fun e!195060 () Bool)

(declare-fun e!195058 () Bool)

(assert (=> b!312980 (= e!195060 e!195058)))

(declare-fun res!169421 () Bool)

(declare-fun lt!153238 () SeekEntryResult!2714)

(get-info :version)

(assert (=> b!312980 (= res!169421 (and ((_ is Intermediate!2714) lt!153238) (not (undefined!3526 lt!153238)) (bvslt (x!31256 lt!153238) #b01111111111111111111111111111110) (bvsge (x!31256 lt!153238) #b00000000000000000000000000000000) (bvsge (x!31256 lt!153238) x!1427)))))

(assert (=> b!312980 (=> (not res!169421) (not e!195058))))

(declare-fun b!312981 () Bool)

(assert (=> b!312981 (and (bvsge (index!13034 lt!153238) #b00000000000000000000000000000000) (bvslt (index!13034 lt!153238) (size!7928 a!3293)))))

(declare-fun e!195059 () Bool)

(assert (=> b!312981 (= e!195059 (= (select (arr!7575 a!3293) (index!13034 lt!153238)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!312982 () Bool)

(assert (=> b!312982 (and (bvsge (index!13034 lt!153238) #b00000000000000000000000000000000) (bvslt (index!13034 lt!153238) (size!7928 a!3293)))))

(declare-fun res!169422 () Bool)

(assert (=> b!312982 (= res!169422 (= (select (arr!7575 a!3293) (index!13034 lt!153238)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312982 (=> res!169422 e!195059)))

(declare-fun b!312983 () Bool)

(declare-fun e!195057 () SeekEntryResult!2714)

(assert (=> b!312983 (= e!195057 (Intermediate!2714 true index!1781 x!1427))))

(declare-fun e!195056 () SeekEntryResult!2714)

(declare-fun b!312984 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312984 (= e!195056 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!312985 () Bool)

(assert (=> b!312985 (= e!195060 (bvsge (x!31256 lt!153238) #b01111111111111111111111111111110))))

(declare-fun b!312986 () Bool)

(assert (=> b!312986 (and (bvsge (index!13034 lt!153238) #b00000000000000000000000000000000) (bvslt (index!13034 lt!153238) (size!7928 a!3293)))))

(declare-fun res!169423 () Bool)

(assert (=> b!312986 (= res!169423 (= (select (arr!7575 a!3293) (index!13034 lt!153238)) k0!2441))))

(assert (=> b!312986 (=> res!169423 e!195059)))

(assert (=> b!312986 (= e!195058 e!195059)))

(declare-fun d!68329 () Bool)

(assert (=> d!68329 e!195060))

(declare-fun c!49386 () Bool)

(assert (=> d!68329 (= c!49386 (and ((_ is Intermediate!2714) lt!153238) (undefined!3526 lt!153238)))))

(assert (=> d!68329 (= lt!153238 e!195057)))

(declare-fun c!49388 () Bool)

(assert (=> d!68329 (= c!49388 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153239 () (_ BitVec 64))

(assert (=> d!68329 (= lt!153239 (select (arr!7575 a!3293) index!1781))))

(assert (=> d!68329 (validMask!0 mask!3709)))

(assert (=> d!68329 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153238)))

(declare-fun b!312987 () Bool)

(assert (=> b!312987 (= e!195057 e!195056)))

(declare-fun c!49387 () Bool)

(assert (=> b!312987 (= c!49387 (or (= lt!153239 k0!2441) (= (bvadd lt!153239 lt!153239) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!312988 () Bool)

(assert (=> b!312988 (= e!195056 (Intermediate!2714 false index!1781 x!1427))))

(assert (= (and d!68329 c!49388) b!312983))

(assert (= (and d!68329 (not c!49388)) b!312987))

(assert (= (and b!312987 c!49387) b!312988))

(assert (= (and b!312987 (not c!49387)) b!312984))

(assert (= (and d!68329 c!49386) b!312985))

(assert (= (and d!68329 (not c!49386)) b!312980))

(assert (= (and b!312980 res!169421) b!312986))

(assert (= (and b!312986 (not res!169423)) b!312982))

(assert (= (and b!312982 (not res!169422)) b!312981))

(declare-fun m!322531 () Bool)

(assert (=> b!312982 m!322531))

(declare-fun m!322533 () Bool)

(assert (=> b!312984 m!322533))

(assert (=> b!312984 m!322533))

(declare-fun m!322535 () Bool)

(assert (=> b!312984 m!322535))

(assert (=> b!312981 m!322531))

(assert (=> d!68329 m!322447))

(assert (=> d!68329 m!322453))

(assert (=> b!312986 m!322531))

(assert (=> b!312880 d!68329))

(declare-fun d!68343 () Bool)

(declare-fun res!169430 () Bool)

(declare-fun e!195067 () Bool)

(assert (=> d!68343 (=> res!169430 e!195067)))

(assert (=> d!68343 (= res!169430 (= (select (arr!7575 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68343 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195067)))

(declare-fun b!312995 () Bool)

(declare-fun e!195068 () Bool)

(assert (=> b!312995 (= e!195067 e!195068)))

(declare-fun res!169431 () Bool)

(assert (=> b!312995 (=> (not res!169431) (not e!195068))))

(assert (=> b!312995 (= res!169431 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7928 a!3293)))))

(declare-fun b!312996 () Bool)

(assert (=> b!312996 (= e!195068 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68343 (not res!169430)) b!312995))

(assert (= (and b!312995 res!169431) b!312996))

(declare-fun m!322537 () Bool)

(assert (=> d!68343 m!322537))

(declare-fun m!322539 () Bool)

(assert (=> b!312996 m!322539))

(assert (=> b!312879 d!68343))

(declare-fun d!68347 () Bool)

(assert (=> d!68347 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!312884 d!68347))

(declare-fun d!68349 () Bool)

(assert (=> d!68349 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31128 d!68349))

(declare-fun d!68351 () Bool)

(assert (=> d!68351 (= (array_inv!5547 a!3293) (bvsge (size!7928 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31128 d!68351))

(declare-fun b!312997 () Bool)

(declare-fun e!195073 () Bool)

(declare-fun e!195071 () Bool)

(assert (=> b!312997 (= e!195073 e!195071)))

(declare-fun res!169432 () Bool)

(declare-fun lt!153240 () SeekEntryResult!2714)

(assert (=> b!312997 (= res!169432 (and ((_ is Intermediate!2714) lt!153240) (not (undefined!3526 lt!153240)) (bvslt (x!31256 lt!153240) #b01111111111111111111111111111110) (bvsge (x!31256 lt!153240) #b00000000000000000000000000000000) (bvsge (x!31256 lt!153240) #b00000000000000000000000000000000)))))

(assert (=> b!312997 (=> (not res!169432) (not e!195071))))

(declare-fun b!312998 () Bool)

(assert (=> b!312998 (and (bvsge (index!13034 lt!153240) #b00000000000000000000000000000000) (bvslt (index!13034 lt!153240) (size!7928 a!3293)))))

(declare-fun e!195072 () Bool)

(assert (=> b!312998 (= e!195072 (= (select (arr!7575 a!3293) (index!13034 lt!153240)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!312999 () Bool)

(assert (=> b!312999 (and (bvsge (index!13034 lt!153240) #b00000000000000000000000000000000) (bvslt (index!13034 lt!153240) (size!7928 a!3293)))))

(declare-fun res!169433 () Bool)

(assert (=> b!312999 (= res!169433 (= (select (arr!7575 a!3293) (index!13034 lt!153240)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312999 (=> res!169433 e!195072)))

(declare-fun b!313000 () Bool)

(declare-fun e!195070 () SeekEntryResult!2714)

(assert (=> b!313000 (= e!195070 (Intermediate!2714 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun e!195069 () SeekEntryResult!2714)

(declare-fun b!313001 () Bool)

(assert (=> b!313001 (= e!195069 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313002 () Bool)

(assert (=> b!313002 (= e!195073 (bvsge (x!31256 lt!153240) #b01111111111111111111111111111110))))

(declare-fun b!313003 () Bool)

(assert (=> b!313003 (and (bvsge (index!13034 lt!153240) #b00000000000000000000000000000000) (bvslt (index!13034 lt!153240) (size!7928 a!3293)))))

(declare-fun res!169434 () Bool)

(assert (=> b!313003 (= res!169434 (= (select (arr!7575 a!3293) (index!13034 lt!153240)) k0!2441))))

(assert (=> b!313003 (=> res!169434 e!195072)))

(assert (=> b!313003 (= e!195071 e!195072)))

(declare-fun d!68353 () Bool)

(assert (=> d!68353 e!195073))

(declare-fun c!49389 () Bool)

(assert (=> d!68353 (= c!49389 (and ((_ is Intermediate!2714) lt!153240) (undefined!3526 lt!153240)))))

(assert (=> d!68353 (= lt!153240 e!195070)))

(declare-fun c!49391 () Bool)

(assert (=> d!68353 (= c!49391 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153241 () (_ BitVec 64))

(assert (=> d!68353 (= lt!153241 (select (arr!7575 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68353 (validMask!0 mask!3709)))

(assert (=> d!68353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153240)))

(declare-fun b!313004 () Bool)

(assert (=> b!313004 (= e!195070 e!195069)))

(declare-fun c!49390 () Bool)

(assert (=> b!313004 (= c!49390 (or (= lt!153241 k0!2441) (= (bvadd lt!153241 lt!153241) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!313005 () Bool)

(assert (=> b!313005 (= e!195069 (Intermediate!2714 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68353 c!49391) b!313000))

(assert (= (and d!68353 (not c!49391)) b!313004))

(assert (= (and b!313004 c!49390) b!313005))

(assert (= (and b!313004 (not c!49390)) b!313001))

(assert (= (and d!68353 c!49389) b!313002))

(assert (= (and d!68353 (not c!49389)) b!312997))

(assert (= (and b!312997 res!169432) b!313003))

(assert (= (and b!313003 (not res!169434)) b!312999))

(assert (= (and b!312999 (not res!169433)) b!312998))

(declare-fun m!322541 () Bool)

(assert (=> b!312999 m!322541))

(assert (=> b!313001 m!322457))

(declare-fun m!322543 () Bool)

(assert (=> b!313001 m!322543))

(assert (=> b!313001 m!322543))

(declare-fun m!322545 () Bool)

(assert (=> b!313001 m!322545))

(assert (=> b!312998 m!322541))

(assert (=> d!68353 m!322457))

(declare-fun m!322547 () Bool)

(assert (=> d!68353 m!322547))

(assert (=> d!68353 m!322453))

(assert (=> b!313003 m!322541))

(assert (=> b!312878 d!68353))

(declare-fun d!68355 () Bool)

(declare-fun lt!153251 () (_ BitVec 32))

(declare-fun lt!153250 () (_ BitVec 32))

(assert (=> d!68355 (= lt!153251 (bvmul (bvxor lt!153250 (bvlshr lt!153250 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68355 (= lt!153250 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68355 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169435 (let ((h!5317 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31260 (bvmul (bvxor h!5317 (bvlshr h!5317 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31260 (bvlshr x!31260 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169435 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169435 #b00000000000000000000000000000000))))))

(assert (=> d!68355 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153251 (bvlshr lt!153251 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!312878 d!68355))

(declare-fun d!68357 () Bool)

(declare-fun lt!153269 () SeekEntryResult!2714)

(assert (=> d!68357 (and (or ((_ is Undefined!2714) lt!153269) (not ((_ is Found!2714) lt!153269)) (and (bvsge (index!13033 lt!153269) #b00000000000000000000000000000000) (bvslt (index!13033 lt!153269) (size!7928 a!3293)))) (or ((_ is Undefined!2714) lt!153269) ((_ is Found!2714) lt!153269) (not ((_ is MissingZero!2714) lt!153269)) (and (bvsge (index!13032 lt!153269) #b00000000000000000000000000000000) (bvslt (index!13032 lt!153269) (size!7928 a!3293)))) (or ((_ is Undefined!2714) lt!153269) ((_ is Found!2714) lt!153269) ((_ is MissingZero!2714) lt!153269) (not ((_ is MissingVacant!2714) lt!153269)) (and (bvsge (index!13035 lt!153269) #b00000000000000000000000000000000) (bvslt (index!13035 lt!153269) (size!7928 a!3293)))) (or ((_ is Undefined!2714) lt!153269) (ite ((_ is Found!2714) lt!153269) (= (select (arr!7575 a!3293) (index!13033 lt!153269)) k0!2441) (ite ((_ is MissingZero!2714) lt!153269) (= (select (arr!7575 a!3293) (index!13032 lt!153269)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2714) lt!153269) (= (select (arr!7575 a!3293) (index!13035 lt!153269)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195116 () SeekEntryResult!2714)

(assert (=> d!68357 (= lt!153269 e!195116)))

(declare-fun c!49421 () Bool)

(declare-fun lt!153270 () SeekEntryResult!2714)

(assert (=> d!68357 (= c!49421 (and ((_ is Intermediate!2714) lt!153270) (undefined!3526 lt!153270)))))

(assert (=> d!68357 (= lt!153270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68357 (validMask!0 mask!3709)))

(assert (=> d!68357 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153269)))

(declare-fun b!313081 () Bool)

(declare-fun e!195115 () SeekEntryResult!2714)

(assert (=> b!313081 (= e!195116 e!195115)))

(declare-fun lt!153268 () (_ BitVec 64))

(assert (=> b!313081 (= lt!153268 (select (arr!7575 a!3293) (index!13034 lt!153270)))))

(declare-fun c!49420 () Bool)

(assert (=> b!313081 (= c!49420 (= lt!153268 k0!2441))))

(declare-fun e!195117 () SeekEntryResult!2714)

(declare-fun b!313082 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15989 (_ BitVec 32)) SeekEntryResult!2714)

(assert (=> b!313082 (= e!195117 (seekKeyOrZeroReturnVacant!0 (x!31256 lt!153270) (index!13034 lt!153270) (index!13034 lt!153270) k0!2441 a!3293 mask!3709))))

(declare-fun b!313083 () Bool)

(assert (=> b!313083 (= e!195116 Undefined!2714)))

(declare-fun b!313084 () Bool)

(declare-fun c!49419 () Bool)

(assert (=> b!313084 (= c!49419 (= lt!153268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313084 (= e!195115 e!195117)))

(declare-fun b!313085 () Bool)

(assert (=> b!313085 (= e!195115 (Found!2714 (index!13034 lt!153270)))))

(declare-fun b!313086 () Bool)

(assert (=> b!313086 (= e!195117 (MissingZero!2714 (index!13034 lt!153270)))))

(assert (= (and d!68357 c!49421) b!313083))

(assert (= (and d!68357 (not c!49421)) b!313081))

(assert (= (and b!313081 c!49420) b!313085))

(assert (= (and b!313081 (not c!49420)) b!313084))

(assert (= (and b!313084 c!49419) b!313086))

(assert (= (and b!313084 (not c!49419)) b!313082))

(assert (=> d!68357 m!322457))

(assert (=> d!68357 m!322459))

(assert (=> d!68357 m!322457))

(declare-fun m!322569 () Bool)

(assert (=> d!68357 m!322569))

(assert (=> d!68357 m!322453))

(declare-fun m!322571 () Bool)

(assert (=> d!68357 m!322571))

(declare-fun m!322573 () Bool)

(assert (=> d!68357 m!322573))

(declare-fun m!322575 () Bool)

(assert (=> b!313081 m!322575))

(declare-fun m!322577 () Bool)

(assert (=> b!313082 m!322577))

(assert (=> b!312877 d!68357))

(declare-fun b!313095 () Bool)

(declare-fun e!195124 () Bool)

(declare-fun call!25916 () Bool)

(assert (=> b!313095 (= e!195124 call!25916)))

(declare-fun d!68365 () Bool)

(declare-fun res!169463 () Bool)

(declare-fun e!195126 () Bool)

(assert (=> d!68365 (=> res!169463 e!195126)))

(assert (=> d!68365 (= res!169463 (bvsge #b00000000000000000000000000000000 (size!7928 a!3293)))))

(assert (=> d!68365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195126)))

(declare-fun bm!25913 () Bool)

(assert (=> bm!25913 (= call!25916 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313096 () Bool)

(declare-fun e!195125 () Bool)

(assert (=> b!313096 (= e!195126 e!195125)))

(declare-fun c!49424 () Bool)

(assert (=> b!313096 (= c!49424 (validKeyInArray!0 (select (arr!7575 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!313097 () Bool)

(assert (=> b!313097 (= e!195125 call!25916)))

(declare-fun b!313098 () Bool)

(assert (=> b!313098 (= e!195125 e!195124)))

(declare-fun lt!153283 () (_ BitVec 64))

(assert (=> b!313098 (= lt!153283 (select (arr!7575 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9631 0))(
  ( (Unit!9632) )
))
(declare-fun lt!153284 () Unit!9631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15989 (_ BitVec 64) (_ BitVec 32)) Unit!9631)

(assert (=> b!313098 (= lt!153284 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153283 #b00000000000000000000000000000000))))

(assert (=> b!313098 (arrayContainsKey!0 a!3293 lt!153283 #b00000000000000000000000000000000)))

(declare-fun lt!153285 () Unit!9631)

(assert (=> b!313098 (= lt!153285 lt!153284)))

(declare-fun res!169462 () Bool)

(assert (=> b!313098 (= res!169462 (= (seekEntryOrOpen!0 (select (arr!7575 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2714 #b00000000000000000000000000000000)))))

(assert (=> b!313098 (=> (not res!169462) (not e!195124))))

(assert (= (and d!68365 (not res!169463)) b!313096))

(assert (= (and b!313096 c!49424) b!313098))

(assert (= (and b!313096 (not c!49424)) b!313097))

(assert (= (and b!313098 res!169462) b!313095))

(assert (= (or b!313095 b!313097) bm!25913))

(declare-fun m!322579 () Bool)

(assert (=> bm!25913 m!322579))

(assert (=> b!313096 m!322537))

(assert (=> b!313096 m!322537))

(declare-fun m!322581 () Bool)

(assert (=> b!313096 m!322581))

(assert (=> b!313098 m!322537))

(declare-fun m!322583 () Bool)

(assert (=> b!313098 m!322583))

(declare-fun m!322585 () Bool)

(assert (=> b!313098 m!322585))

(assert (=> b!313098 m!322537))

(declare-fun m!322587 () Bool)

(assert (=> b!313098 m!322587))

(assert (=> b!312882 d!68365))

(check-sat (not b!313096) (not d!68353) (not b!313001) (not bm!25913) (not d!68357) (not b!313098) (not b!313082) (not d!68329) (not b!312984) (not b!312996))
(check-sat)
