; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53040 () Bool)

(assert start!53040)

(declare-fun b!577505 () Bool)

(declare-fun res!365543 () Bool)

(declare-fun e!332153 () Bool)

(assert (=> b!577505 (=> (not res!365543) (not e!332153))))

(declare-datatypes ((array!36058 0))(
  ( (array!36059 (arr!17308 (Array (_ BitVec 32) (_ BitVec 64))) (size!17672 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36058)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577505 (= res!365543 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577506 () Bool)

(declare-fun res!365539 () Bool)

(assert (=> b!577506 (=> (not res!365539) (not e!332153))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577506 (= res!365539 (validKeyInArray!0 (select (arr!17308 a!2986) j!136)))))

(declare-fun b!577507 () Bool)

(declare-fun res!365542 () Bool)

(declare-fun e!332152 () Bool)

(assert (=> b!577507 (=> (not res!365542) (not e!332152))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36058 (_ BitVec 32)) Bool)

(assert (=> b!577507 (= res!365542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!365538 () Bool)

(assert (=> start!53040 (=> (not res!365538) (not e!332153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53040 (= res!365538 (validMask!0 mask!3053))))

(assert (=> start!53040 e!332153))

(assert (=> start!53040 true))

(declare-fun array_inv!13104 (array!36058) Bool)

(assert (=> start!53040 (array_inv!13104 a!2986)))

(declare-fun b!577508 () Bool)

(assert (=> b!577508 (= e!332153 e!332152)))

(declare-fun res!365537 () Bool)

(assert (=> b!577508 (=> (not res!365537) (not e!332152))))

(declare-datatypes ((SeekEntryResult!5748 0))(
  ( (MissingZero!5748 (index!25219 (_ BitVec 32))) (Found!5748 (index!25220 (_ BitVec 32))) (Intermediate!5748 (undefined!6560 Bool) (index!25221 (_ BitVec 32)) (x!54129 (_ BitVec 32))) (Undefined!5748) (MissingVacant!5748 (index!25222 (_ BitVec 32))) )
))
(declare-fun lt!263974 () SeekEntryResult!5748)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577508 (= res!365537 (or (= lt!263974 (MissingZero!5748 i!1108)) (= lt!263974 (MissingVacant!5748 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36058 (_ BitVec 32)) SeekEntryResult!5748)

(assert (=> b!577508 (= lt!263974 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577509 () Bool)

(declare-fun res!365540 () Bool)

(assert (=> b!577509 (=> (not res!365540) (not e!332153))))

(assert (=> b!577509 (= res!365540 (and (= (size!17672 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17672 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17672 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577510 () Bool)

(assert (=> b!577510 (= e!332152 (and (bvsle #b00000000000000000000000000000000 (size!17672 a!2986)) (bvsge (size!17672 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577511 () Bool)

(declare-fun res!365541 () Bool)

(assert (=> b!577511 (=> (not res!365541) (not e!332153))))

(assert (=> b!577511 (= res!365541 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53040 res!365538) b!577509))

(assert (= (and b!577509 res!365540) b!577506))

(assert (= (and b!577506 res!365539) b!577511))

(assert (= (and b!577511 res!365541) b!577505))

(assert (= (and b!577505 res!365543) b!577508))

(assert (= (and b!577508 res!365537) b!577507))

(assert (= (and b!577507 res!365542) b!577510))

(declare-fun m!556375 () Bool)

(assert (=> b!577507 m!556375))

(declare-fun m!556377 () Bool)

(assert (=> start!53040 m!556377))

(declare-fun m!556379 () Bool)

(assert (=> start!53040 m!556379))

(declare-fun m!556381 () Bool)

(assert (=> b!577508 m!556381))

(declare-fun m!556383 () Bool)

(assert (=> b!577505 m!556383))

(declare-fun m!556385 () Bool)

(assert (=> b!577506 m!556385))

(assert (=> b!577506 m!556385))

(declare-fun m!556387 () Bool)

(assert (=> b!577506 m!556387))

(declare-fun m!556389 () Bool)

(assert (=> b!577511 m!556389))

(check-sat (not b!577505) (not b!577507) (not b!577508) (not b!577506) (not b!577511) (not start!53040))
(check-sat)
(get-model)

(declare-fun b!577549 () Bool)

(declare-fun e!332177 () Bool)

(declare-fun e!332178 () Bool)

(assert (=> b!577549 (= e!332177 e!332178)))

(declare-fun c!66355 () Bool)

(assert (=> b!577549 (= c!66355 (validKeyInArray!0 (select (arr!17308 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!85543 () Bool)

(declare-fun res!365573 () Bool)

(assert (=> d!85543 (=> res!365573 e!332177)))

(assert (=> d!85543 (= res!365573 (bvsge #b00000000000000000000000000000000 (size!17672 a!2986)))))

(assert (=> d!85543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!332177)))

(declare-fun b!577550 () Bool)

(declare-fun call!32755 () Bool)

(assert (=> b!577550 (= e!332178 call!32755)))

(declare-fun bm!32752 () Bool)

(assert (=> bm!32752 (= call!32755 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!577551 () Bool)

(declare-fun e!332176 () Bool)

(assert (=> b!577551 (= e!332178 e!332176)))

(declare-fun lt!263991 () (_ BitVec 64))

(assert (=> b!577551 (= lt!263991 (select (arr!17308 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18142 0))(
  ( (Unit!18143) )
))
(declare-fun lt!263992 () Unit!18142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36058 (_ BitVec 64) (_ BitVec 32)) Unit!18142)

(assert (=> b!577551 (= lt!263992 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!263991 #b00000000000000000000000000000000))))

(assert (=> b!577551 (arrayContainsKey!0 a!2986 lt!263991 #b00000000000000000000000000000000)))

(declare-fun lt!263990 () Unit!18142)

(assert (=> b!577551 (= lt!263990 lt!263992)))

(declare-fun res!365574 () Bool)

(assert (=> b!577551 (= res!365574 (= (seekEntryOrOpen!0 (select (arr!17308 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5748 #b00000000000000000000000000000000)))))

(assert (=> b!577551 (=> (not res!365574) (not e!332176))))

(declare-fun b!577552 () Bool)

(assert (=> b!577552 (= e!332176 call!32755)))

(assert (= (and d!85543 (not res!365573)) b!577549))

(assert (= (and b!577549 c!66355) b!577551))

(assert (= (and b!577549 (not c!66355)) b!577550))

(assert (= (and b!577551 res!365574) b!577552))

(assert (= (or b!577552 b!577550) bm!32752))

(declare-fun m!556407 () Bool)

(assert (=> b!577549 m!556407))

(assert (=> b!577549 m!556407))

(declare-fun m!556409 () Bool)

(assert (=> b!577549 m!556409))

(declare-fun m!556411 () Bool)

(assert (=> bm!32752 m!556411))

(assert (=> b!577551 m!556407))

(declare-fun m!556413 () Bool)

(assert (=> b!577551 m!556413))

(declare-fun m!556415 () Bool)

(assert (=> b!577551 m!556415))

(assert (=> b!577551 m!556407))

(declare-fun m!556417 () Bool)

(assert (=> b!577551 m!556417))

(assert (=> b!577507 d!85543))

(declare-fun b!577581 () Bool)

(declare-fun e!332201 () SeekEntryResult!5748)

(assert (=> b!577581 (= e!332201 Undefined!5748)))

(declare-fun b!577582 () Bool)

(declare-fun c!66363 () Bool)

(declare-fun lt!264003 () (_ BitVec 64))

(assert (=> b!577582 (= c!66363 (= lt!264003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!332200 () SeekEntryResult!5748)

(declare-fun e!332202 () SeekEntryResult!5748)

(assert (=> b!577582 (= e!332200 e!332202)))

(declare-fun b!577583 () Bool)

(declare-fun lt!264002 () SeekEntryResult!5748)

(assert (=> b!577583 (= e!332200 (Found!5748 (index!25221 lt!264002)))))

(declare-fun b!577584 () Bool)

(assert (=> b!577584 (= e!332201 e!332200)))

(assert (=> b!577584 (= lt!264003 (select (arr!17308 a!2986) (index!25221 lt!264002)))))

(declare-fun c!66364 () Bool)

(assert (=> b!577584 (= c!66364 (= lt!264003 k0!1786))))

(declare-fun b!577585 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36058 (_ BitVec 32)) SeekEntryResult!5748)

(assert (=> b!577585 (= e!332202 (seekKeyOrZeroReturnVacant!0 (x!54129 lt!264002) (index!25221 lt!264002) (index!25221 lt!264002) k0!1786 a!2986 mask!3053))))

(declare-fun b!577586 () Bool)

(assert (=> b!577586 (= e!332202 (MissingZero!5748 (index!25221 lt!264002)))))

(declare-fun d!85547 () Bool)

(declare-fun lt!264004 () SeekEntryResult!5748)

(get-info :version)

(assert (=> d!85547 (and (or ((_ is Undefined!5748) lt!264004) (not ((_ is Found!5748) lt!264004)) (and (bvsge (index!25220 lt!264004) #b00000000000000000000000000000000) (bvslt (index!25220 lt!264004) (size!17672 a!2986)))) (or ((_ is Undefined!5748) lt!264004) ((_ is Found!5748) lt!264004) (not ((_ is MissingZero!5748) lt!264004)) (and (bvsge (index!25219 lt!264004) #b00000000000000000000000000000000) (bvslt (index!25219 lt!264004) (size!17672 a!2986)))) (or ((_ is Undefined!5748) lt!264004) ((_ is Found!5748) lt!264004) ((_ is MissingZero!5748) lt!264004) (not ((_ is MissingVacant!5748) lt!264004)) (and (bvsge (index!25222 lt!264004) #b00000000000000000000000000000000) (bvslt (index!25222 lt!264004) (size!17672 a!2986)))) (or ((_ is Undefined!5748) lt!264004) (ite ((_ is Found!5748) lt!264004) (= (select (arr!17308 a!2986) (index!25220 lt!264004)) k0!1786) (ite ((_ is MissingZero!5748) lt!264004) (= (select (arr!17308 a!2986) (index!25219 lt!264004)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5748) lt!264004) (= (select (arr!17308 a!2986) (index!25222 lt!264004)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85547 (= lt!264004 e!332201)))

(declare-fun c!66365 () Bool)

(assert (=> d!85547 (= c!66365 (and ((_ is Intermediate!5748) lt!264002) (undefined!6560 lt!264002)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36058 (_ BitVec 32)) SeekEntryResult!5748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85547 (= lt!264002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85547 (validMask!0 mask!3053)))

(assert (=> d!85547 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!264004)))

(assert (= (and d!85547 c!66365) b!577581))

(assert (= (and d!85547 (not c!66365)) b!577584))

(assert (= (and b!577584 c!66364) b!577583))

(assert (= (and b!577584 (not c!66364)) b!577582))

(assert (= (and b!577582 c!66363) b!577586))

(assert (= (and b!577582 (not c!66363)) b!577585))

(declare-fun m!556437 () Bool)

(assert (=> b!577584 m!556437))

(declare-fun m!556439 () Bool)

(assert (=> b!577585 m!556439))

(declare-fun m!556441 () Bool)

(assert (=> d!85547 m!556441))

(declare-fun m!556443 () Bool)

(assert (=> d!85547 m!556443))

(declare-fun m!556445 () Bool)

(assert (=> d!85547 m!556445))

(declare-fun m!556447 () Bool)

(assert (=> d!85547 m!556447))

(assert (=> d!85547 m!556377))

(assert (=> d!85547 m!556447))

(declare-fun m!556449 () Bool)

(assert (=> d!85547 m!556449))

(assert (=> b!577508 d!85547))

(declare-fun d!85561 () Bool)

(assert (=> d!85561 (= (validKeyInArray!0 (select (arr!17308 a!2986) j!136)) (and (not (= (select (arr!17308 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17308 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577506 d!85561))

(declare-fun d!85567 () Bool)

(assert (=> d!85567 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577511 d!85567))

(declare-fun d!85569 () Bool)

(assert (=> d!85569 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53040 d!85569))

(declare-fun d!85577 () Bool)

(assert (=> d!85577 (= (array_inv!13104 a!2986) (bvsge (size!17672 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53040 d!85577))

(declare-fun d!85579 () Bool)

(declare-fun res!365597 () Bool)

(declare-fun e!332213 () Bool)

(assert (=> d!85579 (=> res!365597 e!332213)))

(assert (=> d!85579 (= res!365597 (= (select (arr!17308 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85579 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!332213)))

(declare-fun b!577599 () Bool)

(declare-fun e!332214 () Bool)

(assert (=> b!577599 (= e!332213 e!332214)))

(declare-fun res!365598 () Bool)

(assert (=> b!577599 (=> (not res!365598) (not e!332214))))

(assert (=> b!577599 (= res!365598 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17672 a!2986)))))

(declare-fun b!577600 () Bool)

(assert (=> b!577600 (= e!332214 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85579 (not res!365597)) b!577599))

(assert (= (and b!577599 res!365598) b!577600))

(assert (=> d!85579 m!556407))

(declare-fun m!556451 () Bool)

(assert (=> b!577600 m!556451))

(assert (=> b!577505 d!85579))

(check-sat (not bm!32752) (not b!577585) (not b!577549) (not b!577551) (not b!577600) (not d!85547))
(check-sat)
