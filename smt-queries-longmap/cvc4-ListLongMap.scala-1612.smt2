; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30348 () Bool)

(assert start!30348)

(declare-fun b!304007 () Bool)

(declare-fun res!161495 () Bool)

(declare-fun e!191137 () Bool)

(assert (=> b!304007 (=> (not res!161495) (not e!191137))))

(declare-datatypes ((array!15454 0))(
  ( (array!15455 (arr!7315 (Array (_ BitVec 32) (_ BitVec 64))) (size!7667 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15454)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2455 0))(
  ( (MissingZero!2455 (index!11996 (_ BitVec 32))) (Found!2455 (index!11997 (_ BitVec 32))) (Intermediate!2455 (undefined!3267 Bool) (index!11998 (_ BitVec 32)) (x!30248 (_ BitVec 32))) (Undefined!2455) (MissingVacant!2455 (index!11999 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15454 (_ BitVec 32)) SeekEntryResult!2455)

(assert (=> b!304007 (= res!161495 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2455 i!1240)))))

(declare-fun b!304008 () Bool)

(declare-fun res!161497 () Bool)

(assert (=> b!304008 (=> (not res!161497) (not e!191137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304008 (= res!161497 (validKeyInArray!0 k!2441))))

(declare-fun b!304009 () Bool)

(declare-fun res!161498 () Bool)

(assert (=> b!304009 (=> (not res!161498) (not e!191137))))

(declare-fun arrayContainsKey!0 (array!15454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304009 (= res!161498 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304010 () Bool)

(declare-fun e!191135 () Bool)

(declare-fun lt!150302 () (_ BitVec 32))

(assert (=> b!304010 (= e!191135 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!150302 #b00000000000000000000000000000000) (bvsge lt!150302 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304010 (= lt!150302 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!304011 () Bool)

(assert (=> b!304011 (= e!191137 e!191135)))

(declare-fun res!161502 () Bool)

(assert (=> b!304011 (=> (not res!161502) (not e!191135))))

(declare-fun lt!150303 () SeekEntryResult!2455)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15454 (_ BitVec 32)) SeekEntryResult!2455)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304011 (= res!161502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150303))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304011 (= lt!150303 (Intermediate!2455 false resIndex!52 resX!52))))

(declare-fun b!304012 () Bool)

(declare-fun res!161494 () Bool)

(assert (=> b!304012 (=> (not res!161494) (not e!191137))))

(assert (=> b!304012 (= res!161494 (and (= (size!7667 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7667 a!3293))))))

(declare-fun b!304013 () Bool)

(declare-fun res!161501 () Bool)

(assert (=> b!304013 (=> (not res!161501) (not e!191135))))

(assert (=> b!304013 (= res!161501 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150303))))

(declare-fun res!161496 () Bool)

(assert (=> start!30348 (=> (not res!161496) (not e!191137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30348 (= res!161496 (validMask!0 mask!3709))))

(assert (=> start!30348 e!191137))

(declare-fun array_inv!5278 (array!15454) Bool)

(assert (=> start!30348 (array_inv!5278 a!3293)))

(assert (=> start!30348 true))

(declare-fun b!304014 () Bool)

(declare-fun res!161499 () Bool)

(assert (=> b!304014 (=> (not res!161499) (not e!191137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15454 (_ BitVec 32)) Bool)

(assert (=> b!304014 (= res!161499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304015 () Bool)

(declare-fun res!161493 () Bool)

(assert (=> b!304015 (=> (not res!161493) (not e!191135))))

(assert (=> b!304015 (= res!161493 (and (= (select (arr!7315 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7667 a!3293))))))

(declare-fun b!304016 () Bool)

(declare-fun res!161500 () Bool)

(assert (=> b!304016 (=> (not res!161500) (not e!191135))))

(assert (=> b!304016 (= res!161500 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7315 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7315 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7315 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!30348 res!161496) b!304012))

(assert (= (and b!304012 res!161494) b!304008))

(assert (= (and b!304008 res!161497) b!304009))

(assert (= (and b!304009 res!161498) b!304007))

(assert (= (and b!304007 res!161495) b!304014))

(assert (= (and b!304014 res!161499) b!304011))

(assert (= (and b!304011 res!161502) b!304015))

(assert (= (and b!304015 res!161493) b!304013))

(assert (= (and b!304013 res!161501) b!304016))

(assert (= (and b!304016 res!161500) b!304010))

(declare-fun m!315245 () Bool)

(assert (=> b!304016 m!315245))

(declare-fun m!315247 () Bool)

(assert (=> b!304015 m!315247))

(declare-fun m!315249 () Bool)

(assert (=> b!304007 m!315249))

(declare-fun m!315251 () Bool)

(assert (=> b!304008 m!315251))

(declare-fun m!315253 () Bool)

(assert (=> b!304010 m!315253))

(declare-fun m!315255 () Bool)

(assert (=> b!304014 m!315255))

(declare-fun m!315257 () Bool)

(assert (=> b!304013 m!315257))

(declare-fun m!315259 () Bool)

(assert (=> b!304011 m!315259))

(assert (=> b!304011 m!315259))

(declare-fun m!315261 () Bool)

(assert (=> b!304011 m!315261))

(declare-fun m!315263 () Bool)

(assert (=> b!304009 m!315263))

(declare-fun m!315265 () Bool)

(assert (=> start!30348 m!315265))

(declare-fun m!315267 () Bool)

(assert (=> start!30348 m!315267))

(push 1)

(assert (not b!304013))

(assert (not b!304010))

(assert (not b!304007))

(assert (not b!304009))

(assert (not b!304011))

(assert (not start!30348))

(assert (not b!304014))

(assert (not b!304008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68055 () Bool)

(declare-fun res!161509 () Bool)

(declare-fun e!191150 () Bool)

(assert (=> d!68055 (=> res!161509 e!191150)))

(assert (=> d!68055 (= res!161509 (= (select (arr!7315 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68055 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!191150)))

(declare-fun b!304035 () Bool)

(declare-fun e!191151 () Bool)

(assert (=> b!304035 (= e!191150 e!191151)))

(declare-fun res!161510 () Bool)

(assert (=> b!304035 (=> (not res!161510) (not e!191151))))

(assert (=> b!304035 (= res!161510 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7667 a!3293)))))

(declare-fun b!304036 () Bool)

(assert (=> b!304036 (= e!191151 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68055 (not res!161509)) b!304035))

(assert (= (and b!304035 res!161510) b!304036))

(declare-fun m!315269 () Bool)

(assert (=> d!68055 m!315269))

(declare-fun m!315271 () Bool)

(assert (=> b!304036 m!315271))

(assert (=> b!304009 d!68055))

(declare-fun d!68061 () Bool)

(declare-fun res!161524 () Bool)

(declare-fun e!191165 () Bool)

(assert (=> d!68061 (=> res!161524 e!191165)))

(assert (=> d!68061 (= res!161524 (bvsge #b00000000000000000000000000000000 (size!7667 a!3293)))))

(assert (=> d!68061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191165)))

(declare-fun bm!25891 () Bool)

(declare-fun call!25894 () Bool)

(assert (=> bm!25891 (= call!25894 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!304058 () Bool)

(declare-fun e!191167 () Bool)

(assert (=> b!304058 (= e!191165 e!191167)))

(declare-fun c!48867 () Bool)

(assert (=> b!304058 (= c!48867 (validKeyInArray!0 (select (arr!7315 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!304059 () Bool)

(assert (=> b!304059 (= e!191167 call!25894)))

(declare-fun b!304060 () Bool)

(declare-fun e!191166 () Bool)

(assert (=> b!304060 (= e!191166 call!25894)))

(declare-fun b!304061 () Bool)

(assert (=> b!304061 (= e!191167 e!191166)))

(declare-fun lt!150326 () (_ BitVec 64))

(assert (=> b!304061 (= lt!150326 (select (arr!7315 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9391 0))(
  ( (Unit!9392) )
))
(declare-fun lt!150325 () Unit!9391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15454 (_ BitVec 64) (_ BitVec 32)) Unit!9391)

(assert (=> b!304061 (= lt!150325 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150326 #b00000000000000000000000000000000))))

(assert (=> b!304061 (arrayContainsKey!0 a!3293 lt!150326 #b00000000000000000000000000000000)))

(declare-fun lt!150327 () Unit!9391)

(assert (=> b!304061 (= lt!150327 lt!150325)))

(declare-fun res!161523 () Bool)

(assert (=> b!304061 (= res!161523 (= (seekEntryOrOpen!0 (select (arr!7315 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2455 #b00000000000000000000000000000000)))))

(assert (=> b!304061 (=> (not res!161523) (not e!191166))))

(assert (= (and d!68061 (not res!161524)) b!304058))

(assert (= (and b!304058 c!48867) b!304061))

(assert (= (and b!304058 (not c!48867)) b!304059))

(assert (= (and b!304061 res!161523) b!304060))

(assert (= (or b!304060 b!304059) bm!25891))

(declare-fun m!315283 () Bool)

(assert (=> bm!25891 m!315283))

(assert (=> b!304058 m!315269))

(assert (=> b!304058 m!315269))

(declare-fun m!315285 () Bool)

(assert (=> b!304058 m!315285))

(assert (=> b!304061 m!315269))

(declare-fun m!315287 () Bool)

(assert (=> b!304061 m!315287))

(declare-fun m!315289 () Bool)

(assert (=> b!304061 m!315289))

(assert (=> b!304061 m!315269))

(declare-fun m!315291 () Bool)

(assert (=> b!304061 m!315291))

(assert (=> b!304014 d!68061))

(declare-fun b!304116 () Bool)

(declare-fun lt!150348 () SeekEntryResult!2455)

(assert (=> b!304116 (and (bvsge (index!11998 lt!150348) #b00000000000000000000000000000000) (bvslt (index!11998 lt!150348) (size!7667 a!3293)))))

(declare-fun res!161549 () Bool)

(assert (=> b!304116 (= res!161549 (= (select (arr!7315 a!3293) (index!11998 lt!150348)) k!2441))))

(declare-fun e!191203 () Bool)

(assert (=> b!304116 (=> res!161549 e!191203)))

(declare-fun e!191206 () Bool)

(assert (=> b!304116 (= e!191206 e!191203)))

(declare-fun b!304117 () Bool)

(declare-fun e!191207 () Bool)

(assert (=> b!304117 (= e!191207 (bvsge (x!30248 lt!150348) #b01111111111111111111111111111110))))

(declare-fun b!304118 () Bool)

(declare-fun e!191204 () SeekEntryResult!2455)

(declare-fun e!191205 () SeekEntryResult!2455)

(assert (=> b!304118 (= e!191204 e!191205)))

(declare-fun c!48883 () Bool)

(declare-fun lt!150349 () (_ BitVec 64))

(assert (=> b!304118 (= c!48883 (or (= lt!150349 k!2441) (= (bvadd lt!150349 lt!150349) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304119 () Bool)

(assert (=> b!304119 (and (bvsge (index!11998 lt!150348) #b00000000000000000000000000000000) (bvslt (index!11998 lt!150348) (size!7667 a!3293)))))

(assert (=> b!304119 (= e!191203 (= (select (arr!7315 a!3293) (index!11998 lt!150348)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!304120 () Bool)

(assert (=> b!304120 (= e!191204 (Intermediate!2455 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!304121 () Bool)

(assert (=> b!304121 (and (bvsge (index!11998 lt!150348) #b00000000000000000000000000000000) (bvslt (index!11998 lt!150348) (size!7667 a!3293)))))

(declare-fun res!161550 () Bool)

(assert (=> b!304121 (= res!161550 (= (select (arr!7315 a!3293) (index!11998 lt!150348)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304121 (=> res!161550 e!191203)))

(declare-fun b!304122 () Bool)

(assert (=> b!304122 (= e!191205 (Intermediate!2455 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68069 () Bool)

(assert (=> d!68069 e!191207))

(declare-fun c!48885 () Bool)

(assert (=> d!68069 (= c!48885 (and (is-Intermediate!2455 lt!150348) (undefined!3267 lt!150348)))))

(assert (=> d!68069 (= lt!150348 e!191204)))

(declare-fun c!48884 () Bool)

(assert (=> d!68069 (= c!48884 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68069 (= lt!150349 (select (arr!7315 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68069 (validMask!0 mask!3709)))

(assert (=> d!68069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150348)))

(declare-fun b!304123 () Bool)

(assert (=> b!304123 (= e!191205 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304124 () Bool)

(assert (=> b!304124 (= e!191207 e!191206)))

(declare-fun res!161551 () Bool)

(assert (=> b!304124 (= res!161551 (and (is-Intermediate!2455 lt!150348) (not (undefined!3267 lt!150348)) (bvslt (x!30248 lt!150348) #b01111111111111111111111111111110) (bvsge (x!30248 lt!150348) #b00000000000000000000000000000000) (bvsge (x!30248 lt!150348) #b00000000000000000000000000000000)))))

(assert (=> b!304124 (=> (not res!161551) (not e!191206))))

(assert (= (and d!68069 c!48884) b!304120))

(assert (= (and d!68069 (not c!48884)) b!304118))

(assert (= (and b!304118 c!48883) b!304122))

(assert (= (and b!304118 (not c!48883)) b!304123))

(assert (= (and d!68069 c!48885) b!304117))

(assert (= (and d!68069 (not c!48885)) b!304124))

(assert (= (and b!304124 res!161551) b!304116))

(assert (= (and b!304116 (not res!161549)) b!304121))

(assert (= (and b!304121 (not res!161550)) b!304119))

(assert (=> b!304123 m!315259))

(declare-fun m!315309 () Bool)

(assert (=> b!304123 m!315309))

(assert (=> b!304123 m!315309))

(declare-fun m!315311 () Bool)

(assert (=> b!304123 m!315311))

(declare-fun m!315313 () Bool)

(assert (=> b!304116 m!315313))

(assert (=> b!304121 m!315313))

(assert (=> b!304119 m!315313))

(assert (=> d!68069 m!315259))

(declare-fun m!315315 () Bool)

(assert (=> d!68069 m!315315))

(assert (=> d!68069 m!315265))

(assert (=> b!304011 d!68069))

(declare-fun d!68085 () Bool)

(declare-fun lt!150368 () (_ BitVec 32))

(declare-fun lt!150367 () (_ BitVec 32))

(assert (=> d!68085 (= lt!150368 (bvmul (bvxor lt!150367 (bvlshr lt!150367 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68085 (= lt!150367 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68085 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!161552 (let ((h!5335 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30255 (bvmul (bvxor h!5335 (bvlshr h!5335 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30255 (bvlshr x!30255 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!161552 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!161552 #b00000000000000000000000000000000))))))

(assert (=> d!68085 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!150368 (bvlshr lt!150368 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!304011 d!68085))

(declare-fun d!68091 () Bool)

(assert (=> d!68091 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30348 d!68091))

(declare-fun d!68095 () Bool)

(assert (=> d!68095 (= (array_inv!5278 a!3293) (bvsge (size!7667 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30348 d!68095))

(declare-fun d!68097 () Bool)

(declare-fun lt!150388 () (_ BitVec 32))

(assert (=> d!68097 (and (bvsge lt!150388 #b00000000000000000000000000000000) (bvslt lt!150388 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68097 (= lt!150388 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68097 (validMask!0 mask!3709)))

(assert (=> d!68097 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!150388)))

(declare-fun bs!10711 () Bool)

(assert (= bs!10711 d!68097))

(declare-fun m!315355 () Bool)

(assert (=> bs!10711 m!315355))

(assert (=> bs!10711 m!315265))

(assert (=> b!304010 d!68097))

(declare-fun lt!150404 () SeekEntryResult!2455)

(declare-fun b!304212 () Bool)

(declare-fun e!191256 () SeekEntryResult!2455)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15454 (_ BitVec 32)) SeekEntryResult!2455)

(assert (=> b!304212 (= e!191256 (seekKeyOrZeroReturnVacant!0 (x!30248 lt!150404) (index!11998 lt!150404) (index!11998 lt!150404) k!2441 a!3293 mask!3709))))

(declare-fun b!304213 () Bool)

(declare-fun e!191257 () SeekEntryResult!2455)

(declare-fun e!191258 () SeekEntryResult!2455)

(assert (=> b!304213 (= e!191257 e!191258)))

(declare-fun lt!150406 () (_ BitVec 64))

(assert (=> b!304213 (= lt!150406 (select (arr!7315 a!3293) (index!11998 lt!150404)))))

(declare-fun c!48923 () Bool)

(assert (=> b!304213 (= c!48923 (= lt!150406 k!2441))))

(declare-fun d!68103 () Bool)

(declare-fun lt!150405 () SeekEntryResult!2455)

(assert (=> d!68103 (and (or (is-Undefined!2455 lt!150405) (not (is-Found!2455 lt!150405)) (and (bvsge (index!11997 lt!150405) #b00000000000000000000000000000000) (bvslt (index!11997 lt!150405) (size!7667 a!3293)))) (or (is-Undefined!2455 lt!150405) (is-Found!2455 lt!150405) (not (is-MissingZero!2455 lt!150405)) (and (bvsge (index!11996 lt!150405) #b00000000000000000000000000000000) (bvslt (index!11996 lt!150405) (size!7667 a!3293)))) (or (is-Undefined!2455 lt!150405) (is-Found!2455 lt!150405) (is-MissingZero!2455 lt!150405) (not (is-MissingVacant!2455 lt!150405)) (and (bvsge (index!11999 lt!150405) #b00000000000000000000000000000000) (bvslt (index!11999 lt!150405) (size!7667 a!3293)))) (or (is-Undefined!2455 lt!150405) (ite (is-Found!2455 lt!150405) (= (select (arr!7315 a!3293) (index!11997 lt!150405)) k!2441) (ite (is-MissingZero!2455 lt!150405) (= (select (arr!7315 a!3293) (index!11996 lt!150405)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2455 lt!150405) (= (select (arr!7315 a!3293) (index!11999 lt!150405)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68103 (= lt!150405 e!191257)))

(declare-fun c!48924 () Bool)

(assert (=> d!68103 (= c!48924 (and (is-Intermediate!2455 lt!150404) (undefined!3267 lt!150404)))))

(assert (=> d!68103 (= lt!150404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68103 (validMask!0 mask!3709)))

(assert (=> d!68103 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!150405)))

(declare-fun b!304214 () Bool)

(assert (=> b!304214 (= e!191257 Undefined!2455)))

(declare-fun b!304215 () Bool)

(assert (=> b!304215 (= e!191256 (MissingZero!2455 (index!11998 lt!150404)))))

(declare-fun b!304216 () Bool)

(declare-fun c!48922 () Bool)

(assert (=> b!304216 (= c!48922 (= lt!150406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304216 (= e!191258 e!191256)))

(declare-fun b!304217 () Bool)

(assert (=> b!304217 (= e!191258 (Found!2455 (index!11998 lt!150404)))))

(assert (= (and d!68103 c!48924) b!304214))

(assert (= (and d!68103 (not c!48924)) b!304213))

(assert (= (and b!304213 c!48923) b!304217))

(assert (= (and b!304213 (not c!48923)) b!304216))

(assert (= (and b!304216 c!48922) b!304215))

(assert (= (and b!304216 (not c!48922)) b!304212))

(declare-fun m!315361 () Bool)

(assert (=> b!304212 m!315361))

(declare-fun m!315363 () Bool)

(assert (=> b!304213 m!315363))

(declare-fun m!315365 () Bool)

(assert (=> d!68103 m!315365))

(assert (=> d!68103 m!315259))

(assert (=> d!68103 m!315261))

(declare-fun m!315373 () Bool)

(assert (=> d!68103 m!315373))

(declare-fun m!315375 () Bool)

(assert (=> d!68103 m!315375))

(assert (=> d!68103 m!315259))

(assert (=> d!68103 m!315265))

(assert (=> b!304007 d!68103))

(declare-fun d!68107 () Bool)

(assert (=> d!68107 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304008 d!68107))

(declare-fun b!304218 () Bool)

(declare-fun lt!150407 () SeekEntryResult!2455)

(assert (=> b!304218 (and (bvsge (index!11998 lt!150407) #b00000000000000000000000000000000) (bvslt (index!11998 lt!150407) (size!7667 a!3293)))))

(declare-fun res!161569 () Bool)

(assert (=> b!304218 (= res!161569 (= (select (arr!7315 a!3293) (index!11998 lt!150407)) k!2441))))

(declare-fun e!191259 () Bool)

(assert (=> b!304218 (=> res!161569 e!191259)))

(declare-fun e!191262 () Bool)

(assert (=> b!304218 (= e!191262 e!191259)))

(declare-fun b!304219 () Bool)

(declare-fun e!191263 () Bool)

(assert (=> b!304219 (= e!191263 (bvsge (x!30248 lt!150407) #b01111111111111111111111111111110))))

(declare-fun b!304220 () Bool)

(declare-fun e!191260 () SeekEntryResult!2455)

(declare-fun e!191261 () SeekEntryResult!2455)

(assert (=> b!304220 (= e!191260 e!191261)))

(declare-fun c!48925 () Bool)

(declare-fun lt!150408 () (_ BitVec 64))

(assert (=> b!304220 (= c!48925 (or (= lt!150408 k!2441) (= (bvadd lt!150408 lt!150408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304221 () Bool)

(assert (=> b!304221 (and (bvsge (index!11998 lt!150407) #b00000000000000000000000000000000) (bvslt (index!11998 lt!150407) (size!7667 a!3293)))))

(assert (=> b!304221 (= e!191259 (= (select (arr!7315 a!3293) (index!11998 lt!150407)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!304222 () Bool)

(assert (=> b!304222 (= e!191260 (Intermediate!2455 true index!1781 x!1427))))

(declare-fun b!304223 () Bool)

(assert (=> b!304223 (and (bvsge (index!11998 lt!150407) #b00000000000000000000000000000000) (bvslt (index!11998 lt!150407) (size!7667 a!3293)))))

(declare-fun res!161570 () Bool)

(assert (=> b!304223 (= res!161570 (= (select (arr!7315 a!3293) (index!11998 lt!150407)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304223 (=> res!161570 e!191259)))

(declare-fun b!304224 () Bool)

(assert (=> b!304224 (= e!191261 (Intermediate!2455 false index!1781 x!1427))))

(declare-fun d!68109 () Bool)

(assert (=> d!68109 e!191263))

(declare-fun c!48927 () Bool)

(assert (=> d!68109 (= c!48927 (and (is-Intermediate!2455 lt!150407) (undefined!3267 lt!150407)))))

(assert (=> d!68109 (= lt!150407 e!191260)))

(declare-fun c!48926 () Bool)

(assert (=> d!68109 (= c!48926 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68109 (= lt!150408 (select (arr!7315 a!3293) index!1781))))

(assert (=> d!68109 (validMask!0 mask!3709)))

(assert (=> d!68109 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150407)))

(declare-fun b!304225 () Bool)

(assert (=> b!304225 (= e!191261 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304226 () Bool)

(assert (=> b!304226 (= e!191263 e!191262)))

(declare-fun res!161571 () Bool)

(assert (=> b!304226 (= res!161571 (and (is-Intermediate!2455 lt!150407) (not (undefined!3267 lt!150407)) (bvslt (x!30248 lt!150407) #b01111111111111111111111111111110) (bvsge (x!30248 lt!150407) #b00000000000000000000000000000000) (bvsge (x!30248 lt!150407) x!1427)))))

(assert (=> b!304226 (=> (not res!161571) (not e!191262))))

(assert (= (and d!68109 c!48926) b!304222))

(assert (= (and d!68109 (not c!48926)) b!304220))

(assert (= (and b!304220 c!48925) b!304224))

(assert (= (and b!304220 (not c!48925)) b!304225))

(assert (= (and d!68109 c!48927) b!304219))

(assert (= (and d!68109 (not c!48927)) b!304226))

(assert (= (and b!304226 res!161571) b!304218))

(assert (= (and b!304218 (not res!161569)) b!304223))

(assert (= (and b!304223 (not res!161570)) b!304221))

(assert (=> b!304225 m!315253))

(assert (=> b!304225 m!315253))

(declare-fun m!315377 () Bool)

(assert (=> b!304225 m!315377))

(declare-fun m!315379 () Bool)

(assert (=> b!304218 m!315379))

(assert (=> b!304223 m!315379))

(assert (=> b!304221 m!315379))

(assert (=> d!68109 m!315245))

(assert (=> d!68109 m!315265))

(assert (=> b!304013 d!68109))

(push 1)

(assert (not b!304058))

(assert (not b!304061))

(assert (not bm!25891))

(assert (not b!304036))

(assert (not b!304123))

(assert (not b!304212))

(assert (not d!68103))

(assert (not d!68097))

(assert (not d!68069))

(assert (not d!68109))

(assert (not b!304225))

(check-sat)

(pop 1)

(push 1)

(check-sat)

