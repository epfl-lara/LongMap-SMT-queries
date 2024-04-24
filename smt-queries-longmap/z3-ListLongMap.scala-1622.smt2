; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30444 () Bool)

(assert start!30444)

(declare-fun b!304945 () Bool)

(declare-fun e!191550 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150596 () (_ BitVec 32))

(assert (=> b!304945 (= e!191550 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!150596 #b00000000000000000000000000000000) (bvslt lt!150596 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(declare-datatypes ((array!15512 0))(
  ( (array!15513 (arr!7342 (Array (_ BitVec 32) (_ BitVec 64))) (size!7694 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15512)

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2447 0))(
  ( (MissingZero!2447 (index!11964 (_ BitVec 32))) (Found!2447 (index!11965 (_ BitVec 32))) (Intermediate!2447 (undefined!3259 Bool) (index!11966 (_ BitVec 32)) (x!30326 (_ BitVec 32))) (Undefined!2447) (MissingVacant!2447 (index!11967 (_ BitVec 32))) )
))
(declare-fun lt!150595 () SeekEntryResult!2447)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15512 (_ BitVec 32)) SeekEntryResult!2447)

(assert (=> b!304945 (= lt!150595 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150596 k0!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304945 (= lt!150596 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!304946 () Bool)

(declare-fun res!162348 () Bool)

(declare-fun e!191551 () Bool)

(assert (=> b!304946 (=> (not res!162348) (not e!191551))))

(declare-fun arrayContainsKey!0 (array!15512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304946 (= res!162348 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304947 () Bool)

(declare-fun res!162347 () Bool)

(assert (=> b!304947 (=> (not res!162347) (not e!191551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15512 (_ BitVec 32)) Bool)

(assert (=> b!304947 (= res!162347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!162342 () Bool)

(assert (=> start!30444 (=> (not res!162342) (not e!191551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30444 (= res!162342 (validMask!0 mask!3709))))

(assert (=> start!30444 e!191551))

(declare-fun array_inv!5292 (array!15512) Bool)

(assert (=> start!30444 (array_inv!5292 a!3293)))

(assert (=> start!30444 true))

(declare-fun b!304948 () Bool)

(declare-fun res!162345 () Bool)

(assert (=> b!304948 (=> (not res!162345) (not e!191551))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304948 (= res!162345 (and (= (size!7694 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7694 a!3293))))))

(declare-fun b!304949 () Bool)

(declare-fun e!191552 () Bool)

(assert (=> b!304949 (= e!191552 e!191550)))

(declare-fun res!162341 () Bool)

(assert (=> b!304949 (=> (not res!162341) (not e!191550))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!150597 () SeekEntryResult!2447)

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!304949 (= res!162341 (and (= lt!150595 lt!150597) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7342 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7342 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7342 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304949 (= lt!150595 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304950 () Bool)

(declare-fun res!162344 () Bool)

(assert (=> b!304950 (=> (not res!162344) (not e!191551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304950 (= res!162344 (validKeyInArray!0 k0!2441))))

(declare-fun b!304951 () Bool)

(declare-fun res!162346 () Bool)

(assert (=> b!304951 (=> (not res!162346) (not e!191552))))

(assert (=> b!304951 (= res!162346 (and (= (select (arr!7342 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7694 a!3293))))))

(declare-fun b!304952 () Bool)

(declare-fun res!162343 () Bool)

(assert (=> b!304952 (=> (not res!162343) (not e!191551))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15512 (_ BitVec 32)) SeekEntryResult!2447)

(assert (=> b!304952 (= res!162343 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2447 i!1240)))))

(declare-fun b!304953 () Bool)

(assert (=> b!304953 (= e!191551 e!191552)))

(declare-fun res!162340 () Bool)

(assert (=> b!304953 (=> (not res!162340) (not e!191552))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304953 (= res!162340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150597))))

(assert (=> b!304953 (= lt!150597 (Intermediate!2447 false resIndex!52 resX!52))))

(assert (= (and start!30444 res!162342) b!304948))

(assert (= (and b!304948 res!162345) b!304950))

(assert (= (and b!304950 res!162344) b!304946))

(assert (= (and b!304946 res!162348) b!304952))

(assert (= (and b!304952 res!162343) b!304947))

(assert (= (and b!304947 res!162347) b!304953))

(assert (= (and b!304953 res!162340) b!304951))

(assert (= (and b!304951 res!162346) b!304949))

(assert (= (and b!304949 res!162341) b!304945))

(declare-fun m!316189 () Bool)

(assert (=> b!304945 m!316189))

(declare-fun m!316191 () Bool)

(assert (=> b!304945 m!316191))

(declare-fun m!316193 () Bool)

(assert (=> b!304950 m!316193))

(declare-fun m!316195 () Bool)

(assert (=> b!304953 m!316195))

(assert (=> b!304953 m!316195))

(declare-fun m!316197 () Bool)

(assert (=> b!304953 m!316197))

(declare-fun m!316199 () Bool)

(assert (=> b!304949 m!316199))

(declare-fun m!316201 () Bool)

(assert (=> b!304949 m!316201))

(declare-fun m!316203 () Bool)

(assert (=> start!30444 m!316203))

(declare-fun m!316205 () Bool)

(assert (=> start!30444 m!316205))

(declare-fun m!316207 () Bool)

(assert (=> b!304951 m!316207))

(declare-fun m!316209 () Bool)

(assert (=> b!304952 m!316209))

(declare-fun m!316211 () Bool)

(assert (=> b!304946 m!316211))

(declare-fun m!316213 () Bool)

(assert (=> b!304947 m!316213))

(check-sat (not b!304946) (not b!304947) (not b!304949) (not b!304950) (not b!304953) (not b!304945) (not b!304952) (not start!30444))
(check-sat)
(get-model)

(declare-fun b!305026 () Bool)

(declare-fun e!191590 () SeekEntryResult!2447)

(assert (=> b!305026 (= e!191590 (Intermediate!2447 true index!1781 x!1427))))

(declare-fun b!305027 () Bool)

(declare-fun e!191592 () SeekEntryResult!2447)

(assert (=> b!305027 (= e!191592 (Intermediate!2447 false index!1781 x!1427))))

(declare-fun d!68159 () Bool)

(declare-fun e!191588 () Bool)

(assert (=> d!68159 e!191588))

(declare-fun c!48909 () Bool)

(declare-fun lt!150620 () SeekEntryResult!2447)

(get-info :version)

(assert (=> d!68159 (= c!48909 (and ((_ is Intermediate!2447) lt!150620) (undefined!3259 lt!150620)))))

(assert (=> d!68159 (= lt!150620 e!191590)))

(declare-fun c!48910 () Bool)

(assert (=> d!68159 (= c!48910 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!150621 () (_ BitVec 64))

(assert (=> d!68159 (= lt!150621 (select (arr!7342 a!3293) index!1781))))

(assert (=> d!68159 (validMask!0 mask!3709)))

(assert (=> d!68159 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150620)))

(declare-fun b!305028 () Bool)

(assert (=> b!305028 (= e!191592 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!305029 () Bool)

(assert (=> b!305029 (and (bvsge (index!11966 lt!150620) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150620) (size!7694 a!3293)))))

(declare-fun res!162409 () Bool)

(assert (=> b!305029 (= res!162409 (= (select (arr!7342 a!3293) (index!11966 lt!150620)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!191589 () Bool)

(assert (=> b!305029 (=> res!162409 e!191589)))

(declare-fun b!305030 () Bool)

(declare-fun e!191591 () Bool)

(assert (=> b!305030 (= e!191588 e!191591)))

(declare-fun res!162410 () Bool)

(assert (=> b!305030 (= res!162410 (and ((_ is Intermediate!2447) lt!150620) (not (undefined!3259 lt!150620)) (bvslt (x!30326 lt!150620) #b01111111111111111111111111111110) (bvsge (x!30326 lt!150620) #b00000000000000000000000000000000) (bvsge (x!30326 lt!150620) x!1427)))))

(assert (=> b!305030 (=> (not res!162410) (not e!191591))))

(declare-fun b!305031 () Bool)

(assert (=> b!305031 (= e!191588 (bvsge (x!30326 lt!150620) #b01111111111111111111111111111110))))

(declare-fun b!305032 () Bool)

(assert (=> b!305032 (= e!191590 e!191592)))

(declare-fun c!48911 () Bool)

(assert (=> b!305032 (= c!48911 (or (= lt!150621 k0!2441) (= (bvadd lt!150621 lt!150621) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305033 () Bool)

(assert (=> b!305033 (and (bvsge (index!11966 lt!150620) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150620) (size!7694 a!3293)))))

(declare-fun res!162411 () Bool)

(assert (=> b!305033 (= res!162411 (= (select (arr!7342 a!3293) (index!11966 lt!150620)) k0!2441))))

(assert (=> b!305033 (=> res!162411 e!191589)))

(assert (=> b!305033 (= e!191591 e!191589)))

(declare-fun b!305034 () Bool)

(assert (=> b!305034 (and (bvsge (index!11966 lt!150620) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150620) (size!7694 a!3293)))))

(assert (=> b!305034 (= e!191589 (= (select (arr!7342 a!3293) (index!11966 lt!150620)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68159 c!48910) b!305026))

(assert (= (and d!68159 (not c!48910)) b!305032))

(assert (= (and b!305032 c!48911) b!305027))

(assert (= (and b!305032 (not c!48911)) b!305028))

(assert (= (and d!68159 c!48909) b!305031))

(assert (= (and d!68159 (not c!48909)) b!305030))

(assert (= (and b!305030 res!162410) b!305033))

(assert (= (and b!305033 (not res!162411)) b!305029))

(assert (= (and b!305029 (not res!162409)) b!305034))

(assert (=> d!68159 m!316199))

(assert (=> d!68159 m!316203))

(declare-fun m!316267 () Bool)

(assert (=> b!305033 m!316267))

(assert (=> b!305034 m!316267))

(assert (=> b!305029 m!316267))

(declare-fun m!316269 () Bool)

(assert (=> b!305028 m!316269))

(assert (=> b!305028 m!316269))

(declare-fun m!316271 () Bool)

(assert (=> b!305028 m!316271))

(assert (=> b!304949 d!68159))

(declare-fun b!305035 () Bool)

(declare-fun e!191595 () SeekEntryResult!2447)

(assert (=> b!305035 (= e!191595 (Intermediate!2447 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!305036 () Bool)

(declare-fun e!191597 () SeekEntryResult!2447)

(assert (=> b!305036 (= e!191597 (Intermediate!2447 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68161 () Bool)

(declare-fun e!191593 () Bool)

(assert (=> d!68161 e!191593))

(declare-fun c!48912 () Bool)

(declare-fun lt!150622 () SeekEntryResult!2447)

(assert (=> d!68161 (= c!48912 (and ((_ is Intermediate!2447) lt!150622) (undefined!3259 lt!150622)))))

(assert (=> d!68161 (= lt!150622 e!191595)))

(declare-fun c!48913 () Bool)

(assert (=> d!68161 (= c!48913 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!150623 () (_ BitVec 64))

(assert (=> d!68161 (= lt!150623 (select (arr!7342 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68161 (validMask!0 mask!3709)))

(assert (=> d!68161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150622)))

(declare-fun b!305037 () Bool)

(assert (=> b!305037 (= e!191597 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!305038 () Bool)

(assert (=> b!305038 (and (bvsge (index!11966 lt!150622) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150622) (size!7694 a!3293)))))

(declare-fun res!162412 () Bool)

(assert (=> b!305038 (= res!162412 (= (select (arr!7342 a!3293) (index!11966 lt!150622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!191594 () Bool)

(assert (=> b!305038 (=> res!162412 e!191594)))

(declare-fun b!305039 () Bool)

(declare-fun e!191596 () Bool)

(assert (=> b!305039 (= e!191593 e!191596)))

(declare-fun res!162413 () Bool)

(assert (=> b!305039 (= res!162413 (and ((_ is Intermediate!2447) lt!150622) (not (undefined!3259 lt!150622)) (bvslt (x!30326 lt!150622) #b01111111111111111111111111111110) (bvsge (x!30326 lt!150622) #b00000000000000000000000000000000) (bvsge (x!30326 lt!150622) #b00000000000000000000000000000000)))))

(assert (=> b!305039 (=> (not res!162413) (not e!191596))))

(declare-fun b!305040 () Bool)

(assert (=> b!305040 (= e!191593 (bvsge (x!30326 lt!150622) #b01111111111111111111111111111110))))

(declare-fun b!305041 () Bool)

(assert (=> b!305041 (= e!191595 e!191597)))

(declare-fun c!48914 () Bool)

(assert (=> b!305041 (= c!48914 (or (= lt!150623 k0!2441) (= (bvadd lt!150623 lt!150623) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305042 () Bool)

(assert (=> b!305042 (and (bvsge (index!11966 lt!150622) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150622) (size!7694 a!3293)))))

(declare-fun res!162414 () Bool)

(assert (=> b!305042 (= res!162414 (= (select (arr!7342 a!3293) (index!11966 lt!150622)) k0!2441))))

(assert (=> b!305042 (=> res!162414 e!191594)))

(assert (=> b!305042 (= e!191596 e!191594)))

(declare-fun b!305043 () Bool)

(assert (=> b!305043 (and (bvsge (index!11966 lt!150622) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150622) (size!7694 a!3293)))))

(assert (=> b!305043 (= e!191594 (= (select (arr!7342 a!3293) (index!11966 lt!150622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68161 c!48913) b!305035))

(assert (= (and d!68161 (not c!48913)) b!305041))

(assert (= (and b!305041 c!48914) b!305036))

(assert (= (and b!305041 (not c!48914)) b!305037))

(assert (= (and d!68161 c!48912) b!305040))

(assert (= (and d!68161 (not c!48912)) b!305039))

(assert (= (and b!305039 res!162413) b!305042))

(assert (= (and b!305042 (not res!162414)) b!305038))

(assert (= (and b!305038 (not res!162412)) b!305043))

(assert (=> d!68161 m!316195))

(declare-fun m!316273 () Bool)

(assert (=> d!68161 m!316273))

(assert (=> d!68161 m!316203))

(declare-fun m!316275 () Bool)

(assert (=> b!305042 m!316275))

(assert (=> b!305043 m!316275))

(assert (=> b!305038 m!316275))

(assert (=> b!305037 m!316195))

(declare-fun m!316277 () Bool)

(assert (=> b!305037 m!316277))

(assert (=> b!305037 m!316277))

(declare-fun m!316279 () Bool)

(assert (=> b!305037 m!316279))

(assert (=> b!304953 d!68161))

(declare-fun d!68163 () Bool)

(declare-fun lt!150629 () (_ BitVec 32))

(declare-fun lt!150628 () (_ BitVec 32))

(assert (=> d!68163 (= lt!150629 (bvmul (bvxor lt!150628 (bvlshr lt!150628 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68163 (= lt!150628 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68163 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!162415 (let ((h!5249 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30330 (bvmul (bvxor h!5249 (bvlshr h!5249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30330 (bvlshr x!30330 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!162415 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!162415 #b00000000000000000000000000000000))))))

(assert (=> d!68163 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!150629 (bvlshr lt!150629 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!304953 d!68163))

(declare-fun d!68169 () Bool)

(assert (=> d!68169 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30444 d!68169))

(declare-fun d!68171 () Bool)

(assert (=> d!68171 (= (array_inv!5292 a!3293) (bvsge (size!7694 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30444 d!68171))

(declare-fun b!305082 () Bool)

(declare-fun e!191623 () Bool)

(declare-fun call!25892 () Bool)

(assert (=> b!305082 (= e!191623 call!25892)))

(declare-fun bm!25889 () Bool)

(assert (=> bm!25889 (= call!25892 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!305083 () Bool)

(declare-fun e!191624 () Bool)

(assert (=> b!305083 (= e!191624 e!191623)))

(declare-fun lt!150656 () (_ BitVec 64))

(assert (=> b!305083 (= lt!150656 (select (arr!7342 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9357 0))(
  ( (Unit!9358) )
))
(declare-fun lt!150654 () Unit!9357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15512 (_ BitVec 64) (_ BitVec 32)) Unit!9357)

(assert (=> b!305083 (= lt!150654 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150656 #b00000000000000000000000000000000))))

(assert (=> b!305083 (arrayContainsKey!0 a!3293 lt!150656 #b00000000000000000000000000000000)))

(declare-fun lt!150655 () Unit!9357)

(assert (=> b!305083 (= lt!150655 lt!150654)))

(declare-fun res!162426 () Bool)

(assert (=> b!305083 (= res!162426 (= (seekEntryOrOpen!0 (select (arr!7342 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2447 #b00000000000000000000000000000000)))))

(assert (=> b!305083 (=> (not res!162426) (not e!191623))))

(declare-fun b!305084 () Bool)

(assert (=> b!305084 (= e!191624 call!25892)))

(declare-fun d!68175 () Bool)

(declare-fun res!162427 () Bool)

(declare-fun e!191622 () Bool)

(assert (=> d!68175 (=> res!162427 e!191622)))

(assert (=> d!68175 (= res!162427 (bvsge #b00000000000000000000000000000000 (size!7694 a!3293)))))

(assert (=> d!68175 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191622)))

(declare-fun b!305085 () Bool)

(assert (=> b!305085 (= e!191622 e!191624)))

(declare-fun c!48929 () Bool)

(assert (=> b!305085 (= c!48929 (validKeyInArray!0 (select (arr!7342 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68175 (not res!162427)) b!305085))

(assert (= (and b!305085 c!48929) b!305083))

(assert (= (and b!305085 (not c!48929)) b!305084))

(assert (= (and b!305083 res!162426) b!305082))

(assert (= (or b!305082 b!305084) bm!25889))

(declare-fun m!316303 () Bool)

(assert (=> bm!25889 m!316303))

(declare-fun m!316305 () Bool)

(assert (=> b!305083 m!316305))

(declare-fun m!316307 () Bool)

(assert (=> b!305083 m!316307))

(declare-fun m!316309 () Bool)

(assert (=> b!305083 m!316309))

(assert (=> b!305083 m!316305))

(declare-fun m!316311 () Bool)

(assert (=> b!305083 m!316311))

(assert (=> b!305085 m!316305))

(assert (=> b!305085 m!316305))

(declare-fun m!316313 () Bool)

(assert (=> b!305085 m!316313))

(assert (=> b!304947 d!68175))

(declare-fun e!191645 () SeekEntryResult!2447)

(declare-fun lt!150668 () SeekEntryResult!2447)

(declare-fun b!305114 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15512 (_ BitVec 32)) SeekEntryResult!2447)

(assert (=> b!305114 (= e!191645 (seekKeyOrZeroReturnVacant!0 (x!30326 lt!150668) (index!11966 lt!150668) (index!11966 lt!150668) k0!2441 a!3293 mask!3709))))

(declare-fun d!68181 () Bool)

(declare-fun lt!150669 () SeekEntryResult!2447)

(assert (=> d!68181 (and (or ((_ is Undefined!2447) lt!150669) (not ((_ is Found!2447) lt!150669)) (and (bvsge (index!11965 lt!150669) #b00000000000000000000000000000000) (bvslt (index!11965 lt!150669) (size!7694 a!3293)))) (or ((_ is Undefined!2447) lt!150669) ((_ is Found!2447) lt!150669) (not ((_ is MissingZero!2447) lt!150669)) (and (bvsge (index!11964 lt!150669) #b00000000000000000000000000000000) (bvslt (index!11964 lt!150669) (size!7694 a!3293)))) (or ((_ is Undefined!2447) lt!150669) ((_ is Found!2447) lt!150669) ((_ is MissingZero!2447) lt!150669) (not ((_ is MissingVacant!2447) lt!150669)) (and (bvsge (index!11967 lt!150669) #b00000000000000000000000000000000) (bvslt (index!11967 lt!150669) (size!7694 a!3293)))) (or ((_ is Undefined!2447) lt!150669) (ite ((_ is Found!2447) lt!150669) (= (select (arr!7342 a!3293) (index!11965 lt!150669)) k0!2441) (ite ((_ is MissingZero!2447) lt!150669) (= (select (arr!7342 a!3293) (index!11964 lt!150669)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2447) lt!150669) (= (select (arr!7342 a!3293) (index!11967 lt!150669)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!191647 () SeekEntryResult!2447)

(assert (=> d!68181 (= lt!150669 e!191647)))

(declare-fun c!48939 () Bool)

(assert (=> d!68181 (= c!48939 (and ((_ is Intermediate!2447) lt!150668) (undefined!3259 lt!150668)))))

(assert (=> d!68181 (= lt!150668 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68181 (validMask!0 mask!3709)))

(assert (=> d!68181 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!150669)))

(declare-fun b!305115 () Bool)

(assert (=> b!305115 (= e!191647 Undefined!2447)))

(declare-fun b!305116 () Bool)

(declare-fun c!48938 () Bool)

(declare-fun lt!150667 () (_ BitVec 64))

(assert (=> b!305116 (= c!48938 (= lt!150667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!191646 () SeekEntryResult!2447)

(assert (=> b!305116 (= e!191646 e!191645)))

(declare-fun b!305117 () Bool)

(assert (=> b!305117 (= e!191646 (Found!2447 (index!11966 lt!150668)))))

(declare-fun b!305118 () Bool)

(assert (=> b!305118 (= e!191647 e!191646)))

(assert (=> b!305118 (= lt!150667 (select (arr!7342 a!3293) (index!11966 lt!150668)))))

(declare-fun c!48940 () Bool)

(assert (=> b!305118 (= c!48940 (= lt!150667 k0!2441))))

(declare-fun b!305119 () Bool)

(assert (=> b!305119 (= e!191645 (MissingZero!2447 (index!11966 lt!150668)))))

(assert (= (and d!68181 c!48939) b!305115))

(assert (= (and d!68181 (not c!48939)) b!305118))

(assert (= (and b!305118 c!48940) b!305117))

(assert (= (and b!305118 (not c!48940)) b!305116))

(assert (= (and b!305116 c!48938) b!305119))

(assert (= (and b!305116 (not c!48938)) b!305114))

(declare-fun m!316321 () Bool)

(assert (=> b!305114 m!316321))

(assert (=> d!68181 m!316195))

(declare-fun m!316323 () Bool)

(assert (=> d!68181 m!316323))

(assert (=> d!68181 m!316195))

(assert (=> d!68181 m!316197))

(assert (=> d!68181 m!316203))

(declare-fun m!316325 () Bool)

(assert (=> d!68181 m!316325))

(declare-fun m!316327 () Bool)

(assert (=> d!68181 m!316327))

(declare-fun m!316329 () Bool)

(assert (=> b!305118 m!316329))

(assert (=> b!304952 d!68181))

(declare-fun d!68193 () Bool)

(declare-fun res!162450 () Bool)

(declare-fun e!191664 () Bool)

(assert (=> d!68193 (=> res!162450 e!191664)))

(assert (=> d!68193 (= res!162450 (= (select (arr!7342 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68193 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!191664)))

(declare-fun b!305146 () Bool)

(declare-fun e!191665 () Bool)

(assert (=> b!305146 (= e!191664 e!191665)))

(declare-fun res!162451 () Bool)

(assert (=> b!305146 (=> (not res!162451) (not e!191665))))

(assert (=> b!305146 (= res!162451 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7694 a!3293)))))

(declare-fun b!305147 () Bool)

(assert (=> b!305147 (= e!191665 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68193 (not res!162450)) b!305146))

(assert (= (and b!305146 res!162451) b!305147))

(assert (=> d!68193 m!316305))

(declare-fun m!316331 () Bool)

(assert (=> b!305147 m!316331))

(assert (=> b!304946 d!68193))

(declare-fun b!305148 () Bool)

(declare-fun e!191668 () SeekEntryResult!2447)

(assert (=> b!305148 (= e!191668 (Intermediate!2447 true lt!150596 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!305149 () Bool)

(declare-fun e!191670 () SeekEntryResult!2447)

(assert (=> b!305149 (= e!191670 (Intermediate!2447 false lt!150596 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun d!68195 () Bool)

(declare-fun e!191666 () Bool)

(assert (=> d!68195 e!191666))

(declare-fun c!48949 () Bool)

(declare-fun lt!150674 () SeekEntryResult!2447)

(assert (=> d!68195 (= c!48949 (and ((_ is Intermediate!2447) lt!150674) (undefined!3259 lt!150674)))))

(assert (=> d!68195 (= lt!150674 e!191668)))

(declare-fun c!48950 () Bool)

(assert (=> d!68195 (= c!48950 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!150675 () (_ BitVec 64))

(assert (=> d!68195 (= lt!150675 (select (arr!7342 a!3293) lt!150596))))

(assert (=> d!68195 (validMask!0 mask!3709)))

(assert (=> d!68195 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150596 k0!2441 a!3293 mask!3709) lt!150674)))

(declare-fun b!305150 () Bool)

(assert (=> b!305150 (= e!191670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!150596 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!305151 () Bool)

(assert (=> b!305151 (and (bvsge (index!11966 lt!150674) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150674) (size!7694 a!3293)))))

(declare-fun res!162452 () Bool)

(assert (=> b!305151 (= res!162452 (= (select (arr!7342 a!3293) (index!11966 lt!150674)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!191667 () Bool)

(assert (=> b!305151 (=> res!162452 e!191667)))

(declare-fun b!305152 () Bool)

(declare-fun e!191669 () Bool)

(assert (=> b!305152 (= e!191666 e!191669)))

(declare-fun res!162453 () Bool)

(assert (=> b!305152 (= res!162453 (and ((_ is Intermediate!2447) lt!150674) (not (undefined!3259 lt!150674)) (bvslt (x!30326 lt!150674) #b01111111111111111111111111111110) (bvsge (x!30326 lt!150674) #b00000000000000000000000000000000) (bvsge (x!30326 lt!150674) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!305152 (=> (not res!162453) (not e!191669))))

(declare-fun b!305153 () Bool)

(assert (=> b!305153 (= e!191666 (bvsge (x!30326 lt!150674) #b01111111111111111111111111111110))))

(declare-fun b!305154 () Bool)

(assert (=> b!305154 (= e!191668 e!191670)))

(declare-fun c!48951 () Bool)

(assert (=> b!305154 (= c!48951 (or (= lt!150675 k0!2441) (= (bvadd lt!150675 lt!150675) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305155 () Bool)

(assert (=> b!305155 (and (bvsge (index!11966 lt!150674) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150674) (size!7694 a!3293)))))

(declare-fun res!162454 () Bool)

(assert (=> b!305155 (= res!162454 (= (select (arr!7342 a!3293) (index!11966 lt!150674)) k0!2441))))

(assert (=> b!305155 (=> res!162454 e!191667)))

(assert (=> b!305155 (= e!191669 e!191667)))

(declare-fun b!305156 () Bool)

(assert (=> b!305156 (and (bvsge (index!11966 lt!150674) #b00000000000000000000000000000000) (bvslt (index!11966 lt!150674) (size!7694 a!3293)))))

(assert (=> b!305156 (= e!191667 (= (select (arr!7342 a!3293) (index!11966 lt!150674)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68195 c!48950) b!305148))

(assert (= (and d!68195 (not c!48950)) b!305154))

(assert (= (and b!305154 c!48951) b!305149))

(assert (= (and b!305154 (not c!48951)) b!305150))

(assert (= (and d!68195 c!48949) b!305153))

(assert (= (and d!68195 (not c!48949)) b!305152))

(assert (= (and b!305152 res!162453) b!305155))

(assert (= (and b!305155 (not res!162454)) b!305151))

(assert (= (and b!305151 (not res!162452)) b!305156))

(declare-fun m!316333 () Bool)

(assert (=> d!68195 m!316333))

(assert (=> d!68195 m!316203))

(declare-fun m!316335 () Bool)

(assert (=> b!305155 m!316335))

(assert (=> b!305156 m!316335))

(assert (=> b!305151 m!316335))

(declare-fun m!316337 () Bool)

(assert (=> b!305150 m!316337))

(assert (=> b!305150 m!316337))

(declare-fun m!316339 () Bool)

(assert (=> b!305150 m!316339))

(assert (=> b!304945 d!68195))

(declare-fun d!68197 () Bool)

(declare-fun lt!150680 () (_ BitVec 32))

(assert (=> d!68197 (and (bvsge lt!150680 #b00000000000000000000000000000000) (bvslt lt!150680 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68197 (= lt!150680 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!68197 (validMask!0 mask!3709)))

(assert (=> d!68197 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!150680)))

(declare-fun bs!10758 () Bool)

(assert (= bs!10758 d!68197))

(declare-fun m!316347 () Bool)

(assert (=> bs!10758 m!316347))

(assert (=> bs!10758 m!316203))

(assert (=> b!304945 d!68197))

(declare-fun d!68199 () Bool)

(assert (=> d!68199 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304950 d!68199))

(check-sat (not b!305150) (not d!68159) (not b!305083) (not bm!25889) (not b!305114) (not d!68195) (not b!305085) (not d!68181) (not d!68197) (not b!305147) (not d!68161) (not b!305037) (not b!305028))
(check-sat)
