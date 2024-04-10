; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31444 () Bool)

(assert start!31444)

(declare-fun b!314934 () Bool)

(declare-fun res!170542 () Bool)

(declare-fun e!196083 () Bool)

(assert (=> b!314934 (=> (not res!170542) (not e!196083))))

(declare-datatypes ((array!16070 0))(
  ( (array!16071 (arr!7608 (Array (_ BitVec 32) (_ BitVec 64))) (size!7960 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16070)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314934 (= res!170542 (and (= (select (arr!7608 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7960 a!3293))))))

(declare-fun b!314935 () Bool)

(declare-fun e!196082 () Bool)

(assert (=> b!314935 (= e!196082 e!196083)))

(declare-fun res!170547 () Bool)

(assert (=> b!314935 (=> (not res!170547) (not e!196083))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2748 0))(
  ( (MissingZero!2748 (index!13168 (_ BitVec 32))) (Found!2748 (index!13169 (_ BitVec 32))) (Intermediate!2748 (undefined!3560 Bool) (index!13170 (_ BitVec 32)) (x!31400 (_ BitVec 32))) (Undefined!2748) (MissingVacant!2748 (index!13171 (_ BitVec 32))) )
))
(declare-fun lt!154059 () SeekEntryResult!2748)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16070 (_ BitVec 32)) SeekEntryResult!2748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314935 (= res!170547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154059))))

(assert (=> b!314935 (= lt!154059 (Intermediate!2748 false resIndex!52 resX!52))))

(declare-fun b!314936 () Bool)

(declare-fun res!170549 () Bool)

(assert (=> b!314936 (=> (not res!170549) (not e!196082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16070 (_ BitVec 32)) Bool)

(assert (=> b!314936 (= res!170549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314937 () Bool)

(declare-fun res!170548 () Bool)

(assert (=> b!314937 (=> (not res!170548) (not e!196082))))

(declare-fun arrayContainsKey!0 (array!16070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314937 (= res!170548 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun e!196084 () Bool)

(declare-fun lt!154058 () SeekEntryResult!2748)

(declare-fun b!314938 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314938 (= e!196084 (not (= lt!154058 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))))

(declare-fun b!314939 () Bool)

(declare-fun res!170544 () Bool)

(assert (=> b!314939 (=> (not res!170544) (not e!196082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314939 (= res!170544 (validKeyInArray!0 k0!2441))))

(declare-fun b!314940 () Bool)

(declare-fun res!170545 () Bool)

(assert (=> b!314940 (=> (not res!170545) (not e!196082))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16070 (_ BitVec 32)) SeekEntryResult!2748)

(assert (=> b!314940 (= res!170545 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2748 i!1240)))))

(declare-fun res!170546 () Bool)

(assert (=> start!31444 (=> (not res!170546) (not e!196082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31444 (= res!170546 (validMask!0 mask!3709))))

(assert (=> start!31444 e!196082))

(declare-fun array_inv!5571 (array!16070) Bool)

(assert (=> start!31444 (array_inv!5571 a!3293)))

(assert (=> start!31444 true))

(declare-fun b!314941 () Bool)

(declare-fun res!170543 () Bool)

(assert (=> b!314941 (=> (not res!170543) (not e!196082))))

(assert (=> b!314941 (= res!170543 (and (= (size!7960 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7960 a!3293))))))

(declare-fun b!314942 () Bool)

(assert (=> b!314942 (= e!196083 e!196084)))

(declare-fun res!170550 () Bool)

(assert (=> b!314942 (=> (not res!170550) (not e!196084))))

(assert (=> b!314942 (= res!170550 (and (= lt!154058 lt!154059) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7608 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7608 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7608 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314942 (= lt!154058 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!31444 res!170546) b!314941))

(assert (= (and b!314941 res!170543) b!314939))

(assert (= (and b!314939 res!170544) b!314937))

(assert (= (and b!314937 res!170548) b!314940))

(assert (= (and b!314940 res!170545) b!314936))

(assert (= (and b!314936 res!170549) b!314935))

(assert (= (and b!314935 res!170547) b!314934))

(assert (= (and b!314934 res!170542) b!314942))

(assert (= (and b!314942 res!170550) b!314938))

(declare-fun m!324349 () Bool)

(assert (=> b!314940 m!324349))

(declare-fun m!324351 () Bool)

(assert (=> b!314937 m!324351))

(declare-fun m!324353 () Bool)

(assert (=> b!314935 m!324353))

(assert (=> b!314935 m!324353))

(declare-fun m!324355 () Bool)

(assert (=> b!314935 m!324355))

(declare-fun m!324357 () Bool)

(assert (=> start!31444 m!324357))

(declare-fun m!324359 () Bool)

(assert (=> start!31444 m!324359))

(declare-fun m!324361 () Bool)

(assert (=> b!314942 m!324361))

(declare-fun m!324363 () Bool)

(assert (=> b!314942 m!324363))

(declare-fun m!324365 () Bool)

(assert (=> b!314938 m!324365))

(assert (=> b!314938 m!324365))

(declare-fun m!324367 () Bool)

(assert (=> b!314938 m!324367))

(declare-fun m!324369 () Bool)

(assert (=> b!314939 m!324369))

(declare-fun m!324371 () Bool)

(assert (=> b!314934 m!324371))

(declare-fun m!324373 () Bool)

(assert (=> b!314936 m!324373))

(check-sat (not b!314935) (not b!314939) (not b!314940) (not b!314936) (not b!314938) (not b!314942) (not b!314937) (not start!31444))
(check-sat)
(get-model)

(declare-fun b!314988 () Bool)

(declare-fun lt!154070 () SeekEntryResult!2748)

(assert (=> b!314988 (and (bvsge (index!13170 lt!154070) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154070) (size!7960 a!3293)))))

(declare-fun res!170584 () Bool)

(assert (=> b!314988 (= res!170584 (= (select (arr!7608 a!3293) (index!13170 lt!154070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196107 () Bool)

(assert (=> b!314988 (=> res!170584 e!196107)))

(declare-fun b!314989 () Bool)

(declare-fun e!196108 () SeekEntryResult!2748)

(assert (=> b!314989 (= e!196108 (Intermediate!2748 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!314990 () Bool)

(declare-fun e!196110 () Bool)

(declare-fun e!196111 () Bool)

(assert (=> b!314990 (= e!196110 e!196111)))

(declare-fun res!170585 () Bool)

(get-info :version)

(assert (=> b!314990 (= res!170585 (and ((_ is Intermediate!2748) lt!154070) (not (undefined!3560 lt!154070)) (bvslt (x!31400 lt!154070) #b01111111111111111111111111111110) (bvsge (x!31400 lt!154070) #b00000000000000000000000000000000) (bvsge (x!31400 lt!154070) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!314990 (=> (not res!170585) (not e!196111))))

(declare-fun b!314991 () Bool)

(declare-fun e!196109 () SeekEntryResult!2748)

(assert (=> b!314991 (= e!196109 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314992 () Bool)

(assert (=> b!314992 (= e!196109 (Intermediate!2748 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!314993 () Bool)

(assert (=> b!314993 (= e!196110 (bvsge (x!31400 lt!154070) #b01111111111111111111111111111110))))

(declare-fun b!314994 () Bool)

(assert (=> b!314994 (and (bvsge (index!13170 lt!154070) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154070) (size!7960 a!3293)))))

(assert (=> b!314994 (= e!196107 (= (select (arr!7608 a!3293) (index!13170 lt!154070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314996 () Bool)

(assert (=> b!314996 (and (bvsge (index!13170 lt!154070) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154070) (size!7960 a!3293)))))

(declare-fun res!170586 () Bool)

(assert (=> b!314996 (= res!170586 (= (select (arr!7608 a!3293) (index!13170 lt!154070)) k0!2441))))

(assert (=> b!314996 (=> res!170586 e!196107)))

(assert (=> b!314996 (= e!196111 e!196107)))

(declare-fun b!314995 () Bool)

(assert (=> b!314995 (= e!196108 e!196109)))

(declare-fun c!49817 () Bool)

(declare-fun lt!154071 () (_ BitVec 64))

(assert (=> b!314995 (= c!49817 (or (= lt!154071 k0!2441) (= (bvadd lt!154071 lt!154071) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68829 () Bool)

(assert (=> d!68829 e!196110))

(declare-fun c!49818 () Bool)

(assert (=> d!68829 (= c!49818 (and ((_ is Intermediate!2748) lt!154070) (undefined!3560 lt!154070)))))

(assert (=> d!68829 (= lt!154070 e!196108)))

(declare-fun c!49816 () Bool)

(assert (=> d!68829 (= c!49816 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68829 (= lt!154071 (select (arr!7608 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68829 (validMask!0 mask!3709)))

(assert (=> d!68829 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!154070)))

(assert (= (and d!68829 c!49816) b!314989))

(assert (= (and d!68829 (not c!49816)) b!314995))

(assert (= (and b!314995 c!49817) b!314992))

(assert (= (and b!314995 (not c!49817)) b!314991))

(assert (= (and d!68829 c!49818) b!314993))

(assert (= (and d!68829 (not c!49818)) b!314990))

(assert (= (and b!314990 res!170585) b!314996))

(assert (= (and b!314996 (not res!170586)) b!314988))

(assert (= (and b!314988 (not res!170584)) b!314994))

(declare-fun m!324401 () Bool)

(assert (=> b!314996 m!324401))

(assert (=> b!314988 m!324401))

(assert (=> b!314994 m!324401))

(assert (=> b!314991 m!324365))

(declare-fun m!324403 () Bool)

(assert (=> b!314991 m!324403))

(assert (=> b!314991 m!324403))

(declare-fun m!324405 () Bool)

(assert (=> b!314991 m!324405))

(assert (=> d!68829 m!324365))

(declare-fun m!324407 () Bool)

(assert (=> d!68829 m!324407))

(assert (=> d!68829 m!324357))

(assert (=> b!314938 d!68829))

(declare-fun d!68835 () Bool)

(declare-fun lt!154074 () (_ BitVec 32))

(assert (=> d!68835 (and (bvsge lt!154074 #b00000000000000000000000000000000) (bvslt lt!154074 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68835 (= lt!154074 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68835 (validMask!0 mask!3709)))

(assert (=> d!68835 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154074)))

(declare-fun bs!11018 () Bool)

(assert (= bs!11018 d!68835))

(declare-fun m!324409 () Bool)

(assert (=> bs!11018 m!324409))

(assert (=> bs!11018 m!324357))

(assert (=> b!314938 d!68835))

(declare-fun d!68837 () Bool)

(assert (=> d!68837 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31444 d!68837))

(declare-fun d!68843 () Bool)

(assert (=> d!68843 (= (array_inv!5571 a!3293) (bvsge (size!7960 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31444 d!68843))

(declare-fun d!68845 () Bool)

(assert (=> d!68845 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314939 d!68845))

(declare-fun b!315051 () Bool)

(declare-fun lt!154087 () SeekEntryResult!2748)

(assert (=> b!315051 (and (bvsge (index!13170 lt!154087) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154087) (size!7960 a!3293)))))

(declare-fun res!170605 () Bool)

(assert (=> b!315051 (= res!170605 (= (select (arr!7608 a!3293) (index!13170 lt!154087)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196142 () Bool)

(assert (=> b!315051 (=> res!170605 e!196142)))

(declare-fun b!315052 () Bool)

(declare-fun e!196143 () SeekEntryResult!2748)

(assert (=> b!315052 (= e!196143 (Intermediate!2748 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315053 () Bool)

(declare-fun e!196145 () Bool)

(declare-fun e!196146 () Bool)

(assert (=> b!315053 (= e!196145 e!196146)))

(declare-fun res!170606 () Bool)

(assert (=> b!315053 (= res!170606 (and ((_ is Intermediate!2748) lt!154087) (not (undefined!3560 lt!154087)) (bvslt (x!31400 lt!154087) #b01111111111111111111111111111110) (bvsge (x!31400 lt!154087) #b00000000000000000000000000000000) (bvsge (x!31400 lt!154087) #b00000000000000000000000000000000)))))

(assert (=> b!315053 (=> (not res!170606) (not e!196146))))

(declare-fun e!196144 () SeekEntryResult!2748)

(declare-fun b!315054 () Bool)

(assert (=> b!315054 (= e!196144 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315055 () Bool)

(assert (=> b!315055 (= e!196144 (Intermediate!2748 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315056 () Bool)

(assert (=> b!315056 (= e!196145 (bvsge (x!31400 lt!154087) #b01111111111111111111111111111110))))

(declare-fun b!315057 () Bool)

(assert (=> b!315057 (and (bvsge (index!13170 lt!154087) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154087) (size!7960 a!3293)))))

(assert (=> b!315057 (= e!196142 (= (select (arr!7608 a!3293) (index!13170 lt!154087)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315059 () Bool)

(assert (=> b!315059 (and (bvsge (index!13170 lt!154087) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154087) (size!7960 a!3293)))))

(declare-fun res!170607 () Bool)

(assert (=> b!315059 (= res!170607 (= (select (arr!7608 a!3293) (index!13170 lt!154087)) k0!2441))))

(assert (=> b!315059 (=> res!170607 e!196142)))

(assert (=> b!315059 (= e!196146 e!196142)))

(declare-fun b!315058 () Bool)

(assert (=> b!315058 (= e!196143 e!196144)))

(declare-fun c!49838 () Bool)

(declare-fun lt!154088 () (_ BitVec 64))

(assert (=> b!315058 (= c!49838 (or (= lt!154088 k0!2441) (= (bvadd lt!154088 lt!154088) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68849 () Bool)

(assert (=> d!68849 e!196145))

(declare-fun c!49839 () Bool)

(assert (=> d!68849 (= c!49839 (and ((_ is Intermediate!2748) lt!154087) (undefined!3560 lt!154087)))))

(assert (=> d!68849 (= lt!154087 e!196143)))

(declare-fun c!49837 () Bool)

(assert (=> d!68849 (= c!49837 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68849 (= lt!154088 (select (arr!7608 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68849 (validMask!0 mask!3709)))

(assert (=> d!68849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154087)))

(assert (= (and d!68849 c!49837) b!315052))

(assert (= (and d!68849 (not c!49837)) b!315058))

(assert (= (and b!315058 c!49838) b!315055))

(assert (= (and b!315058 (not c!49838)) b!315054))

(assert (= (and d!68849 c!49839) b!315056))

(assert (= (and d!68849 (not c!49839)) b!315053))

(assert (= (and b!315053 res!170606) b!315059))

(assert (= (and b!315059 (not res!170607)) b!315051))

(assert (= (and b!315051 (not res!170605)) b!315057))

(declare-fun m!324419 () Bool)

(assert (=> b!315059 m!324419))

(assert (=> b!315051 m!324419))

(assert (=> b!315057 m!324419))

(assert (=> b!315054 m!324353))

(declare-fun m!324421 () Bool)

(assert (=> b!315054 m!324421))

(assert (=> b!315054 m!324421))

(declare-fun m!324423 () Bool)

(assert (=> b!315054 m!324423))

(assert (=> d!68849 m!324353))

(declare-fun m!324425 () Bool)

(assert (=> d!68849 m!324425))

(assert (=> d!68849 m!324357))

(assert (=> b!314935 d!68849))

(declare-fun d!68851 () Bool)

(declare-fun lt!154094 () (_ BitVec 32))

(declare-fun lt!154093 () (_ BitVec 32))

(assert (=> d!68851 (= lt!154094 (bvmul (bvxor lt!154093 (bvlshr lt!154093 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68851 (= lt!154093 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68851 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170612 (let ((h!5364 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31406 (bvmul (bvxor h!5364 (bvlshr h!5364 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31406 (bvlshr x!31406 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170612 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170612 #b00000000000000000000000000000000))))))

(assert (=> d!68851 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154094 (bvlshr lt!154094 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314935 d!68851))

(declare-fun b!315120 () Bool)

(declare-fun c!49861 () Bool)

(declare-fun lt!154123 () (_ BitVec 64))

(assert (=> b!315120 (= c!49861 (= lt!154123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196184 () SeekEntryResult!2748)

(declare-fun e!196185 () SeekEntryResult!2748)

(assert (=> b!315120 (= e!196184 e!196185)))

(declare-fun b!315121 () Bool)

(declare-fun lt!154124 () SeekEntryResult!2748)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16070 (_ BitVec 32)) SeekEntryResult!2748)

(assert (=> b!315121 (= e!196185 (seekKeyOrZeroReturnVacant!0 (x!31400 lt!154124) (index!13170 lt!154124) (index!13170 lt!154124) k0!2441 a!3293 mask!3709))))

(declare-fun b!315122 () Bool)

(assert (=> b!315122 (= e!196185 (MissingZero!2748 (index!13170 lt!154124)))))

(declare-fun b!315123 () Bool)

(assert (=> b!315123 (= e!196184 (Found!2748 (index!13170 lt!154124)))))

(declare-fun d!68855 () Bool)

(declare-fun lt!154125 () SeekEntryResult!2748)

(assert (=> d!68855 (and (or ((_ is Undefined!2748) lt!154125) (not ((_ is Found!2748) lt!154125)) (and (bvsge (index!13169 lt!154125) #b00000000000000000000000000000000) (bvslt (index!13169 lt!154125) (size!7960 a!3293)))) (or ((_ is Undefined!2748) lt!154125) ((_ is Found!2748) lt!154125) (not ((_ is MissingZero!2748) lt!154125)) (and (bvsge (index!13168 lt!154125) #b00000000000000000000000000000000) (bvslt (index!13168 lt!154125) (size!7960 a!3293)))) (or ((_ is Undefined!2748) lt!154125) ((_ is Found!2748) lt!154125) ((_ is MissingZero!2748) lt!154125) (not ((_ is MissingVacant!2748) lt!154125)) (and (bvsge (index!13171 lt!154125) #b00000000000000000000000000000000) (bvslt (index!13171 lt!154125) (size!7960 a!3293)))) (or ((_ is Undefined!2748) lt!154125) (ite ((_ is Found!2748) lt!154125) (= (select (arr!7608 a!3293) (index!13169 lt!154125)) k0!2441) (ite ((_ is MissingZero!2748) lt!154125) (= (select (arr!7608 a!3293) (index!13168 lt!154125)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2748) lt!154125) (= (select (arr!7608 a!3293) (index!13171 lt!154125)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!196186 () SeekEntryResult!2748)

(assert (=> d!68855 (= lt!154125 e!196186)))

(declare-fun c!49862 () Bool)

(assert (=> d!68855 (= c!49862 (and ((_ is Intermediate!2748) lt!154124) (undefined!3560 lt!154124)))))

(assert (=> d!68855 (= lt!154124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68855 (validMask!0 mask!3709)))

(assert (=> d!68855 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154125)))

(declare-fun b!315124 () Bool)

(assert (=> b!315124 (= e!196186 e!196184)))

(assert (=> b!315124 (= lt!154123 (select (arr!7608 a!3293) (index!13170 lt!154124)))))

(declare-fun c!49863 () Bool)

(assert (=> b!315124 (= c!49863 (= lt!154123 k0!2441))))

(declare-fun b!315125 () Bool)

(assert (=> b!315125 (= e!196186 Undefined!2748)))

(assert (= (and d!68855 c!49862) b!315125))

(assert (= (and d!68855 (not c!49862)) b!315124))

(assert (= (and b!315124 c!49863) b!315123))

(assert (= (and b!315124 (not c!49863)) b!315120))

(assert (= (and b!315120 c!49861) b!315122))

(assert (= (and b!315120 (not c!49861)) b!315121))

(declare-fun m!324457 () Bool)

(assert (=> b!315121 m!324457))

(assert (=> d!68855 m!324353))

(assert (=> d!68855 m!324355))

(declare-fun m!324461 () Bool)

(assert (=> d!68855 m!324461))

(assert (=> d!68855 m!324357))

(declare-fun m!324463 () Bool)

(assert (=> d!68855 m!324463))

(assert (=> d!68855 m!324353))

(declare-fun m!324465 () Bool)

(assert (=> d!68855 m!324465))

(declare-fun m!324467 () Bool)

(assert (=> b!315124 m!324467))

(assert (=> b!314940 d!68855))

(declare-fun d!68873 () Bool)

(declare-fun res!170635 () Bool)

(declare-fun e!196199 () Bool)

(assert (=> d!68873 (=> res!170635 e!196199)))

(assert (=> d!68873 (= res!170635 (= (select (arr!7608 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68873 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196199)))

(declare-fun b!315145 () Bool)

(declare-fun e!196200 () Bool)

(assert (=> b!315145 (= e!196199 e!196200)))

(declare-fun res!170636 () Bool)

(assert (=> b!315145 (=> (not res!170636) (not e!196200))))

(assert (=> b!315145 (= res!170636 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7960 a!3293)))))

(declare-fun b!315146 () Bool)

(assert (=> b!315146 (= e!196200 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68873 (not res!170635)) b!315145))

(assert (= (and b!315145 res!170636) b!315146))

(declare-fun m!324487 () Bool)

(assert (=> d!68873 m!324487))

(declare-fun m!324489 () Bool)

(assert (=> b!315146 m!324489))

(assert (=> b!314937 d!68873))

(declare-fun b!315147 () Bool)

(declare-fun lt!154131 () SeekEntryResult!2748)

(assert (=> b!315147 (and (bvsge (index!13170 lt!154131) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154131) (size!7960 a!3293)))))

(declare-fun res!170637 () Bool)

(assert (=> b!315147 (= res!170637 (= (select (arr!7608 a!3293) (index!13170 lt!154131)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196201 () Bool)

(assert (=> b!315147 (=> res!170637 e!196201)))

(declare-fun b!315148 () Bool)

(declare-fun e!196202 () SeekEntryResult!2748)

(assert (=> b!315148 (= e!196202 (Intermediate!2748 true index!1781 x!1427))))

(declare-fun b!315149 () Bool)

(declare-fun e!196204 () Bool)

(declare-fun e!196205 () Bool)

(assert (=> b!315149 (= e!196204 e!196205)))

(declare-fun res!170638 () Bool)

(assert (=> b!315149 (= res!170638 (and ((_ is Intermediate!2748) lt!154131) (not (undefined!3560 lt!154131)) (bvslt (x!31400 lt!154131) #b01111111111111111111111111111110) (bvsge (x!31400 lt!154131) #b00000000000000000000000000000000) (bvsge (x!31400 lt!154131) x!1427)))))

(assert (=> b!315149 (=> (not res!170638) (not e!196205))))

(declare-fun e!196203 () SeekEntryResult!2748)

(declare-fun b!315150 () Bool)

(assert (=> b!315150 (= e!196203 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315151 () Bool)

(assert (=> b!315151 (= e!196203 (Intermediate!2748 false index!1781 x!1427))))

(declare-fun b!315152 () Bool)

(assert (=> b!315152 (= e!196204 (bvsge (x!31400 lt!154131) #b01111111111111111111111111111110))))

(declare-fun b!315153 () Bool)

(assert (=> b!315153 (and (bvsge (index!13170 lt!154131) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154131) (size!7960 a!3293)))))

(assert (=> b!315153 (= e!196201 (= (select (arr!7608 a!3293) (index!13170 lt!154131)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!315155 () Bool)

(assert (=> b!315155 (and (bvsge (index!13170 lt!154131) #b00000000000000000000000000000000) (bvslt (index!13170 lt!154131) (size!7960 a!3293)))))

(declare-fun res!170639 () Bool)

(assert (=> b!315155 (= res!170639 (= (select (arr!7608 a!3293) (index!13170 lt!154131)) k0!2441))))

(assert (=> b!315155 (=> res!170639 e!196201)))

(assert (=> b!315155 (= e!196205 e!196201)))

(declare-fun b!315154 () Bool)

(assert (=> b!315154 (= e!196202 e!196203)))

(declare-fun c!49871 () Bool)

(declare-fun lt!154132 () (_ BitVec 64))

(assert (=> b!315154 (= c!49871 (or (= lt!154132 k0!2441) (= (bvadd lt!154132 lt!154132) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68879 () Bool)

(assert (=> d!68879 e!196204))

(declare-fun c!49872 () Bool)

(assert (=> d!68879 (= c!49872 (and ((_ is Intermediate!2748) lt!154131) (undefined!3560 lt!154131)))))

(assert (=> d!68879 (= lt!154131 e!196202)))

(declare-fun c!49870 () Bool)

(assert (=> d!68879 (= c!49870 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68879 (= lt!154132 (select (arr!7608 a!3293) index!1781))))

(assert (=> d!68879 (validMask!0 mask!3709)))

(assert (=> d!68879 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154131)))

(assert (= (and d!68879 c!49870) b!315148))

(assert (= (and d!68879 (not c!49870)) b!315154))

(assert (= (and b!315154 c!49871) b!315151))

(assert (= (and b!315154 (not c!49871)) b!315150))

(assert (= (and d!68879 c!49872) b!315152))

(assert (= (and d!68879 (not c!49872)) b!315149))

(assert (= (and b!315149 res!170638) b!315155))

(assert (= (and b!315155 (not res!170639)) b!315147))

(assert (= (and b!315147 (not res!170637)) b!315153))

(declare-fun m!324491 () Bool)

(assert (=> b!315155 m!324491))

(assert (=> b!315147 m!324491))

(assert (=> b!315153 m!324491))

(assert (=> b!315150 m!324365))

(assert (=> b!315150 m!324365))

(declare-fun m!324493 () Bool)

(assert (=> b!315150 m!324493))

(assert (=> d!68879 m!324361))

(assert (=> d!68879 m!324357))

(assert (=> b!314942 d!68879))

(declare-fun b!315173 () Bool)

(declare-fun e!196217 () Bool)

(declare-fun e!196219 () Bool)

(assert (=> b!315173 (= e!196217 e!196219)))

(declare-fun lt!154158 () (_ BitVec 64))

(assert (=> b!315173 (= lt!154158 (select (arr!7608 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9699 0))(
  ( (Unit!9700) )
))
(declare-fun lt!154157 () Unit!9699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16070 (_ BitVec 64) (_ BitVec 32)) Unit!9699)

(assert (=> b!315173 (= lt!154157 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154158 #b00000000000000000000000000000000))))

(assert (=> b!315173 (arrayContainsKey!0 a!3293 lt!154158 #b00000000000000000000000000000000)))

(declare-fun lt!154156 () Unit!9699)

(assert (=> b!315173 (= lt!154156 lt!154157)))

(declare-fun res!170649 () Bool)

(assert (=> b!315173 (= res!170649 (= (seekEntryOrOpen!0 (select (arr!7608 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2748 #b00000000000000000000000000000000)))))

(assert (=> b!315173 (=> (not res!170649) (not e!196219))))

(declare-fun b!315174 () Bool)

(declare-fun call!25987 () Bool)

(assert (=> b!315174 (= e!196217 call!25987)))

(declare-fun b!315175 () Bool)

(declare-fun e!196218 () Bool)

(assert (=> b!315175 (= e!196218 e!196217)))

(declare-fun c!49878 () Bool)

(assert (=> b!315175 (= c!49878 (validKeyInArray!0 (select (arr!7608 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25984 () Bool)

(assert (=> bm!25984 (= call!25987 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!315176 () Bool)

(assert (=> b!315176 (= e!196219 call!25987)))

(declare-fun d!68881 () Bool)

(declare-fun res!170648 () Bool)

(assert (=> d!68881 (=> res!170648 e!196218)))

(assert (=> d!68881 (= res!170648 (bvsge #b00000000000000000000000000000000 (size!7960 a!3293)))))

(assert (=> d!68881 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196218)))

(assert (= (and d!68881 (not res!170648)) b!315175))

(assert (= (and b!315175 c!49878) b!315173))

(assert (= (and b!315175 (not c!49878)) b!315174))

(assert (= (and b!315173 res!170649) b!315176))

(assert (= (or b!315176 b!315174) bm!25984))

(assert (=> b!315173 m!324487))

(declare-fun m!324505 () Bool)

(assert (=> b!315173 m!324505))

(declare-fun m!324507 () Bool)

(assert (=> b!315173 m!324507))

(assert (=> b!315173 m!324487))

(declare-fun m!324509 () Bool)

(assert (=> b!315173 m!324509))

(assert (=> b!315175 m!324487))

(assert (=> b!315175 m!324487))

(declare-fun m!324511 () Bool)

(assert (=> b!315175 m!324511))

(declare-fun m!324513 () Bool)

(assert (=> bm!25984 m!324513))

(assert (=> b!314936 d!68881))

(check-sat (not d!68829) (not b!315054) (not d!68879) (not d!68855) (not b!315121) (not b!315175) (not b!315146) (not b!315150) (not bm!25984) (not b!315173) (not d!68835) (not d!68849) (not b!314991))
(check-sat)
