; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32950 () Bool)

(assert start!32950)

(declare-fun b!328398 () Bool)

(declare-fun res!180871 () Bool)

(declare-fun e!201887 () Bool)

(assert (=> b!328398 (=> (not res!180871) (not e!201887))))

(declare-datatypes ((array!16801 0))(
  ( (array!16802 (arr!7949 (Array (_ BitVec 32) (_ BitVec 64))) (size!8301 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16801)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16801 (_ BitVec 32)) Bool)

(assert (=> b!328398 (= res!180871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!180865 () Bool)

(assert (=> start!32950 (=> (not res!180865) (not e!201887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32950 (= res!180865 (validMask!0 mask!3777))))

(assert (=> start!32950 e!201887))

(declare-fun array_inv!5912 (array!16801) Bool)

(assert (=> start!32950 (array_inv!5912 a!3305)))

(assert (=> start!32950 true))

(declare-fun b!328399 () Bool)

(declare-fun res!180869 () Bool)

(assert (=> b!328399 (=> (not res!180869) (not e!201887))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328399 (= res!180869 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328400 () Bool)

(declare-fun e!201889 () Bool)

(assert (=> b!328400 (= e!201887 e!201889)))

(declare-fun res!180870 () Bool)

(assert (=> b!328400 (=> (not res!180870) (not e!201889))))

(declare-datatypes ((SeekEntryResult!3080 0))(
  ( (MissingZero!3080 (index!14496 (_ BitVec 32))) (Found!3080 (index!14497 (_ BitVec 32))) (Intermediate!3080 (undefined!3892 Bool) (index!14498 (_ BitVec 32)) (x!32761 (_ BitVec 32))) (Undefined!3080) (MissingVacant!3080 (index!14499 (_ BitVec 32))) )
))
(declare-fun lt!157908 () SeekEntryResult!3080)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16801 (_ BitVec 32)) SeekEntryResult!3080)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328400 (= res!180870 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157908))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!328400 (= lt!157908 (Intermediate!3080 false resIndex!58 resX!58))))

(declare-fun b!328401 () Bool)

(declare-fun res!180868 () Bool)

(assert (=> b!328401 (=> (not res!180868) (not e!201887))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328401 (= res!180868 (and (= (size!8301 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8301 a!3305))))))

(declare-fun b!328402 () Bool)

(declare-fun res!180867 () Bool)

(assert (=> b!328402 (=> (not res!180867) (not e!201887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328402 (= res!180867 (validKeyInArray!0 k!2497))))

(declare-fun b!328403 () Bool)

(declare-fun res!180873 () Bool)

(assert (=> b!328403 (=> (not res!180873) (not e!201889))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328403 (= res!180873 (and (= (select (arr!7949 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8301 a!3305))))))

(declare-fun b!328404 () Bool)

(declare-fun res!180872 () Bool)

(assert (=> b!328404 (=> (not res!180872) (not e!201889))))

(assert (=> b!328404 (= res!180872 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157908))))

(declare-fun b!328405 () Bool)

(assert (=> b!328405 (= e!201889 (bvslt (bvsub #b01111111111111111111111111111110 x!1490) #b00000000000000000000000000000000))))

(declare-fun b!328406 () Bool)

(declare-fun res!180866 () Bool)

(assert (=> b!328406 (=> (not res!180866) (not e!201887))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16801 (_ BitVec 32)) SeekEntryResult!3080)

(assert (=> b!328406 (= res!180866 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3080 i!1250)))))

(assert (= (and start!32950 res!180865) b!328401))

(assert (= (and b!328401 res!180868) b!328402))

(assert (= (and b!328402 res!180867) b!328399))

(assert (= (and b!328399 res!180869) b!328406))

(assert (= (and b!328406 res!180866) b!328398))

(assert (= (and b!328398 res!180871) b!328400))

(assert (= (and b!328400 res!180870) b!328403))

(assert (= (and b!328403 res!180873) b!328404))

(assert (= (and b!328404 res!180872) b!328405))

(declare-fun m!334385 () Bool)

(assert (=> b!328400 m!334385))

(assert (=> b!328400 m!334385))

(declare-fun m!334387 () Bool)

(assert (=> b!328400 m!334387))

(declare-fun m!334389 () Bool)

(assert (=> b!328402 m!334389))

(declare-fun m!334391 () Bool)

(assert (=> b!328399 m!334391))

(declare-fun m!334393 () Bool)

(assert (=> b!328398 m!334393))

(declare-fun m!334395 () Bool)

(assert (=> start!32950 m!334395))

(declare-fun m!334397 () Bool)

(assert (=> start!32950 m!334397))

(declare-fun m!334399 () Bool)

(assert (=> b!328404 m!334399))

(declare-fun m!334401 () Bool)

(assert (=> b!328406 m!334401))

(declare-fun m!334403 () Bool)

(assert (=> b!328403 m!334403))

(push 1)

(assert (not start!32950))

(assert (not b!328400))

(assert (not b!328406))

(assert (not b!328398))

(assert (not b!328399))

(assert (not b!328402))

(assert (not b!328404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70033 () Bool)

(assert (=> d!70033 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328402 d!70033))

(declare-fun b!328475 () Bool)

(declare-fun e!201920 () Bool)

(declare-fun e!201921 () Bool)

(assert (=> b!328475 (= e!201920 e!201921)))

(declare-fun lt!157923 () (_ BitVec 64))

(assert (=> b!328475 (= lt!157923 (select (arr!7949 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10194 0))(
  ( (Unit!10195) )
))
(declare-fun lt!157921 () Unit!10194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16801 (_ BitVec 64) (_ BitVec 32)) Unit!10194)

(assert (=> b!328475 (= lt!157921 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157923 #b00000000000000000000000000000000))))

(assert (=> b!328475 (arrayContainsKey!0 a!3305 lt!157923 #b00000000000000000000000000000000)))

(declare-fun lt!157922 () Unit!10194)

(assert (=> b!328475 (= lt!157922 lt!157921)))

(declare-fun res!180938 () Bool)

(assert (=> b!328475 (= res!180938 (= (seekEntryOrOpen!0 (select (arr!7949 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3080 #b00000000000000000000000000000000)))))

(assert (=> b!328475 (=> (not res!180938) (not e!201921))))

(declare-fun b!328476 () Bool)

(declare-fun call!26128 () Bool)

(assert (=> b!328476 (= e!201921 call!26128)))

(declare-fun b!328477 () Bool)

(declare-fun e!201922 () Bool)

(assert (=> b!328477 (= e!201922 e!201920)))

(declare-fun c!51405 () Bool)

(assert (=> b!328477 (= c!51405 (validKeyInArray!0 (select (arr!7949 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!70035 () Bool)

(declare-fun res!180939 () Bool)

(assert (=> d!70035 (=> res!180939 e!201922)))

(assert (=> d!70035 (= res!180939 (bvsge #b00000000000000000000000000000000 (size!8301 a!3305)))))

(assert (=> d!70035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201922)))

(declare-fun bm!26125 () Bool)

(assert (=> bm!26125 (= call!26128 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328478 () Bool)

(assert (=> b!328478 (= e!201920 call!26128)))

(assert (= (and d!70035 (not res!180939)) b!328477))

(assert (= (and b!328477 c!51405) b!328475))

(assert (= (and b!328477 (not c!51405)) b!328478))

(assert (= (and b!328475 res!180938) b!328476))

(assert (= (or b!328476 b!328478) bm!26125))

(declare-fun m!334449 () Bool)

(assert (=> b!328475 m!334449))

(declare-fun m!334451 () Bool)

(assert (=> b!328475 m!334451))

(declare-fun m!334453 () Bool)

(assert (=> b!328475 m!334453))

(assert (=> b!328475 m!334449))

(declare-fun m!334455 () Bool)

(assert (=> b!328475 m!334455))

(assert (=> b!328477 m!334449))

(assert (=> b!328477 m!334449))

(declare-fun m!334457 () Bool)

(assert (=> b!328477 m!334457))

(declare-fun m!334459 () Bool)

(assert (=> bm!26125 m!334459))

(assert (=> b!328398 d!70035))

(declare-fun e!201965 () SeekEntryResult!3080)

(declare-fun b!328551 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328551 (= e!201965 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!328552 () Bool)

(declare-fun lt!157940 () SeekEntryResult!3080)

(assert (=> b!328552 (and (bvsge (index!14498 lt!157940) #b00000000000000000000000000000000) (bvslt (index!14498 lt!157940) (size!8301 a!3305)))))

(declare-fun e!201966 () Bool)

(assert (=> b!328552 (= e!201966 (= (select (arr!7949 a!3305) (index!14498 lt!157940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328553 () Bool)

(declare-fun e!201963 () SeekEntryResult!3080)

(assert (=> b!328553 (= e!201963 e!201965)))

(declare-fun c!51432 () Bool)

(declare-fun lt!157941 () (_ BitVec 64))

(assert (=> b!328553 (= c!51432 (or (= lt!157941 k!2497) (= (bvadd lt!157941 lt!157941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!70049 () Bool)

(declare-fun e!201967 () Bool)

(assert (=> d!70049 e!201967))

(declare-fun c!51430 () Bool)

(assert (=> d!70049 (= c!51430 (and (is-Intermediate!3080 lt!157940) (undefined!3892 lt!157940)))))

(assert (=> d!70049 (= lt!157940 e!201963)))

(declare-fun c!51431 () Bool)

(assert (=> d!70049 (= c!51431 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70049 (= lt!157941 (select (arr!7949 a!3305) index!1840))))

(assert (=> d!70049 (validMask!0 mask!3777)))

(assert (=> d!70049 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157940)))

(declare-fun b!328554 () Bool)

(assert (=> b!328554 (= e!201965 (Intermediate!3080 false index!1840 x!1490))))

(declare-fun b!328555 () Bool)

(assert (=> b!328555 (and (bvsge (index!14498 lt!157940) #b00000000000000000000000000000000) (bvslt (index!14498 lt!157940) (size!8301 a!3305)))))

(declare-fun res!180967 () Bool)

(assert (=> b!328555 (= res!180967 (= (select (arr!7949 a!3305) (index!14498 lt!157940)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328555 (=> res!180967 e!201966)))

(declare-fun b!328556 () Bool)

(assert (=> b!328556 (and (bvsge (index!14498 lt!157940) #b00000000000000000000000000000000) (bvslt (index!14498 lt!157940) (size!8301 a!3305)))))

(declare-fun res!180965 () Bool)

(assert (=> b!328556 (= res!180965 (= (select (arr!7949 a!3305) (index!14498 lt!157940)) k!2497))))

(assert (=> b!328556 (=> res!180965 e!201966)))

(declare-fun e!201964 () Bool)

(assert (=> b!328556 (= e!201964 e!201966)))

(declare-fun b!328557 () Bool)

(assert (=> b!328557 (= e!201963 (Intermediate!3080 true index!1840 x!1490))))

(declare-fun b!328558 () Bool)

(assert (=> b!328558 (= e!201967 (bvsge (x!32761 lt!157940) #b01111111111111111111111111111110))))

(declare-fun b!328559 () Bool)

(assert (=> b!328559 (= e!201967 e!201964)))

(declare-fun res!180966 () Bool)

(assert (=> b!328559 (= res!180966 (and (is-Intermediate!3080 lt!157940) (not (undefined!3892 lt!157940)) (bvslt (x!32761 lt!157940) #b01111111111111111111111111111110) (bvsge (x!32761 lt!157940) #b00000000000000000000000000000000) (bvsge (x!32761 lt!157940) x!1490)))))

(assert (=> b!328559 (=> (not res!180966) (not e!201964))))

(assert (= (and d!70049 c!51431) b!328557))

(assert (= (and d!70049 (not c!51431)) b!328553))

(assert (= (and b!328553 c!51432) b!328554))

(assert (= (and b!328553 (not c!51432)) b!328551))

(assert (= (and d!70049 c!51430) b!328558))

(assert (= (and d!70049 (not c!51430)) b!328559))

(assert (= (and b!328559 res!180966) b!328556))

(assert (= (and b!328556 (not res!180965)) b!328555))

(assert (= (and b!328555 (not res!180967)) b!328552))

(declare-fun m!334477 () Bool)

(assert (=> b!328555 m!334477))

(assert (=> b!328552 m!334477))

(declare-fun m!334479 () Bool)

(assert (=> d!70049 m!334479))

(assert (=> d!70049 m!334395))

(assert (=> b!328556 m!334477))

(declare-fun m!334481 () Bool)

(assert (=> b!328551 m!334481))

(assert (=> b!328551 m!334481))

(declare-fun m!334483 () Bool)

(assert (=> b!328551 m!334483))

(assert (=> b!328404 d!70049))

(declare-fun d!70055 () Bool)

(assert (=> d!70055 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32950 d!70055))

(declare-fun d!70065 () Bool)

(assert (=> d!70065 (= (array_inv!5912 a!3305) (bvsge (size!8301 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32950 d!70065))

(declare-fun d!70067 () Bool)

(declare-fun res!180985 () Bool)

(declare-fun e!201991 () Bool)

(assert (=> d!70067 (=> res!180985 e!201991)))

(assert (=> d!70067 (= res!180985 (= (select (arr!7949 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70067 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!201991)))

(declare-fun b!328594 () Bool)

(declare-fun e!201992 () Bool)

(assert (=> b!328594 (= e!201991 e!201992)))

(declare-fun res!180986 () Bool)

(assert (=> b!328594 (=> (not res!180986) (not e!201992))))

(assert (=> b!328594 (= res!180986 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8301 a!3305)))))

(declare-fun b!328595 () Bool)

(assert (=> b!328595 (= e!201992 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70067 (not res!180985)) b!328594))

(assert (= (and b!328594 res!180986) b!328595))

(assert (=> d!70067 m!334449))

(declare-fun m!334511 () Bool)

(assert (=> b!328595 m!334511))

(assert (=> b!328399 d!70067))

(declare-fun b!328600 () Bool)

(declare-fun e!201999 () SeekEntryResult!3080)

(assert (=> b!328600 (= e!201999 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!328601 () Bool)

(declare-fun lt!157967 () SeekEntryResult!3080)

(assert (=> b!328601 (and (bvsge (index!14498 lt!157967) #b00000000000000000000000000000000) (bvslt (index!14498 lt!157967) (size!8301 a!3305)))))

(declare-fun e!202000 () Bool)

(assert (=> b!328601 (= e!202000 (= (select (arr!7949 a!3305) (index!14498 lt!157967)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328602 () Bool)

(declare-fun e!201997 () SeekEntryResult!3080)

(assert (=> b!328602 (= e!201997 e!201999)))

(declare-fun c!51444 () Bool)

(declare-fun lt!157968 () (_ BitVec 64))

(assert (=> b!328602 (= c!51444 (or (= lt!157968 k!2497) (= (bvadd lt!157968 lt!157968) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!70075 () Bool)

(declare-fun e!202001 () Bool)

(assert (=> d!70075 e!202001))

(declare-fun c!51442 () Bool)

(assert (=> d!70075 (= c!51442 (and (is-Intermediate!3080 lt!157967) (undefined!3892 lt!157967)))))

(assert (=> d!70075 (= lt!157967 e!201997)))

(declare-fun c!51443 () Bool)

(assert (=> d!70075 (= c!51443 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70075 (= lt!157968 (select (arr!7949 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70075 (validMask!0 mask!3777)))

(assert (=> d!70075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157967)))

(declare-fun b!328603 () Bool)

(assert (=> b!328603 (= e!201999 (Intermediate!3080 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328604 () Bool)

(assert (=> b!328604 (and (bvsge (index!14498 lt!157967) #b00000000000000000000000000000000) (bvslt (index!14498 lt!157967) (size!8301 a!3305)))))

(declare-fun res!180993 () Bool)

(assert (=> b!328604 (= res!180993 (= (select (arr!7949 a!3305) (index!14498 lt!157967)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328604 (=> res!180993 e!202000)))

(declare-fun b!328605 () Bool)

(assert (=> b!328605 (and (bvsge (index!14498 lt!157967) #b00000000000000000000000000000000) (bvslt (index!14498 lt!157967) (size!8301 a!3305)))))

(declare-fun res!180991 () Bool)

(assert (=> b!328605 (= res!180991 (= (select (arr!7949 a!3305) (index!14498 lt!157967)) k!2497))))

(assert (=> b!328605 (=> res!180991 e!202000)))

(declare-fun e!201998 () Bool)

(assert (=> b!328605 (= e!201998 e!202000)))

(declare-fun b!328606 () Bool)

(assert (=> b!328606 (= e!201997 (Intermediate!3080 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328607 () Bool)

(assert (=> b!328607 (= e!202001 (bvsge (x!32761 lt!157967) #b01111111111111111111111111111110))))

(declare-fun b!328608 () Bool)

(assert (=> b!328608 (= e!202001 e!201998)))

(declare-fun res!180992 () Bool)

(assert (=> b!328608 (= res!180992 (and (is-Intermediate!3080 lt!157967) (not (undefined!3892 lt!157967)) (bvslt (x!32761 lt!157967) #b01111111111111111111111111111110) (bvsge (x!32761 lt!157967) #b00000000000000000000000000000000) (bvsge (x!32761 lt!157967) #b00000000000000000000000000000000)))))

(assert (=> b!328608 (=> (not res!180992) (not e!201998))))

(assert (= (and d!70075 c!51443) b!328606))

(assert (= (and d!70075 (not c!51443)) b!328602))

(assert (= (and b!328602 c!51444) b!328603))

(assert (= (and b!328602 (not c!51444)) b!328600))

(assert (= (and d!70075 c!51442) b!328607))

(assert (= (and d!70075 (not c!51442)) b!328608))

(assert (= (and b!328608 res!180992) b!328605))

(assert (= (and b!328605 (not res!180991)) b!328604))

(assert (= (and b!328604 (not res!180993)) b!328601))

(declare-fun m!334513 () Bool)

(assert (=> b!328604 m!334513))

(assert (=> b!328601 m!334513))

(assert (=> d!70075 m!334385))

(declare-fun m!334515 () Bool)

(assert (=> d!70075 m!334515))

(assert (=> d!70075 m!334395))

(assert (=> b!328605 m!334513))

(assert (=> b!328600 m!334385))

(declare-fun m!334517 () Bool)

(assert (=> b!328600 m!334517))

(assert (=> b!328600 m!334517))

(declare-fun m!334519 () Bool)

(assert (=> b!328600 m!334519))

(assert (=> b!328400 d!70075))

(declare-fun d!70077 () Bool)

(declare-fun lt!157974 () (_ BitVec 32))

(declare-fun lt!157973 () (_ BitVec 32))

(assert (=> d!70077 (= lt!157974 (bvmul (bvxor lt!157973 (bvlshr lt!157973 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70077 (= lt!157973 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70077 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180996 (let ((h!5411 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32769 (bvmul (bvxor h!5411 (bvlshr h!5411 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32769 (bvlshr x!32769 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180996 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180996 #b00000000000000000000000000000000))))))

(assert (=> d!70077 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157974 (bvlshr lt!157974 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328400 d!70077))

(declare-fun b!328653 () Bool)

(declare-fun e!202029 () SeekEntryResult!3080)

(assert (=> b!328653 (= e!202029 Undefined!3080)))

(declare-fun b!328654 () Bool)

(declare-fun e!202030 () SeekEntryResult!3080)

(declare-fun lt!158000 () SeekEntryResult!3080)

(assert (=> b!328654 (= e!202030 (MissingZero!3080 (index!14498 lt!158000)))))

(declare-fun d!70081 () Bool)

(declare-fun lt!157999 () SeekEntryResult!3080)

(assert (=> d!70081 (and (or (is-Undefined!3080 lt!157999) (not (is-Found!3080 lt!157999)) (and (bvsge (index!14497 lt!157999) #b00000000000000000000000000000000) (bvslt (index!14497 lt!157999) (size!8301 a!3305)))) (or (is-Undefined!3080 lt!157999) (is-Found!3080 lt!157999) (not (is-MissingZero!3080 lt!157999)) (and (bvsge (index!14496 lt!157999) #b00000000000000000000000000000000) (bvslt (index!14496 lt!157999) (size!8301 a!3305)))) (or (is-Undefined!3080 lt!157999) (is-Found!3080 lt!157999) (is-MissingZero!3080 lt!157999) (not (is-MissingVacant!3080 lt!157999)) (and (bvsge (index!14499 lt!157999) #b00000000000000000000000000000000) (bvslt (index!14499 lt!157999) (size!8301 a!3305)))) (or (is-Undefined!3080 lt!157999) (ite (is-Found!3080 lt!157999) (= (select (arr!7949 a!3305) (index!14497 lt!157999)) k!2497) (ite (is-MissingZero!3080 lt!157999) (= (select (arr!7949 a!3305) (index!14496 lt!157999)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3080 lt!157999) (= (select (arr!7949 a!3305) (index!14499 lt!157999)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70081 (= lt!157999 e!202029)))

(declare-fun c!51465 () Bool)

(assert (=> d!70081 (= c!51465 (and (is-Intermediate!3080 lt!158000) (undefined!3892 lt!158000)))))

(assert (=> d!70081 (= lt!158000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70081 (validMask!0 mask!3777)))

(assert (=> d!70081 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157999)))

(declare-fun b!328655 () Bool)

(declare-fun e!202028 () SeekEntryResult!3080)

(assert (=> b!328655 (= e!202028 (Found!3080 (index!14498 lt!158000)))))

(declare-fun b!328656 () Bool)

(declare-fun c!51464 () Bool)

(declare-fun lt!158001 () (_ BitVec 64))

(assert (=> b!328656 (= c!51464 (= lt!158001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328656 (= e!202028 e!202030)))

(declare-fun b!328657 () Bool)

(assert (=> b!328657 (= e!202029 e!202028)))

(assert (=> b!328657 (= lt!158001 (select (arr!7949 a!3305) (index!14498 lt!158000)))))

(declare-fun c!51463 () Bool)

(assert (=> b!328657 (= c!51463 (= lt!158001 k!2497))))

(declare-fun b!328658 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16801 (_ BitVec 32)) SeekEntryResult!3080)

(assert (=> b!328658 (= e!202030 (seekKeyOrZeroReturnVacant!0 (x!32761 lt!158000) (index!14498 lt!158000) (index!14498 lt!158000) k!2497 a!3305 mask!3777))))

(assert (= (and d!70081 c!51465) b!328653))

(assert (= (and d!70081 (not c!51465)) b!328657))

(assert (= (and b!328657 c!51463) b!328655))

(assert (= (and b!328657 (not c!51463)) b!328656))

(assert (= (and b!328656 c!51464) b!328654))

(assert (= (and b!328656 (not c!51464)) b!328658))

(assert (=> d!70081 m!334395))

(assert (=> d!70081 m!334385))

(declare-fun m!334545 () Bool)

(assert (=> d!70081 m!334545))

(assert (=> d!70081 m!334385))

(assert (=> d!70081 m!334387))

(declare-fun m!334547 () Bool)

(assert (=> d!70081 m!334547))

(declare-fun m!334549 () Bool)

(assert (=> d!70081 m!334549))

(declare-fun m!334551 () Bool)

(assert (=> b!328657 m!334551))

(declare-fun m!334553 () Bool)

(assert (=> b!328658 m!334553))

(assert (=> b!328406 d!70081))

(push 1)

