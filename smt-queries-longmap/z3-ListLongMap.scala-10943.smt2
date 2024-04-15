; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127946 () Bool)

(assert start!127946)

(declare-fun b!1503344 () Bool)

(declare-fun res!1024417 () Bool)

(declare-fun e!840462 () Bool)

(assert (=> b!1503344 (=> (not res!1024417) (not e!840462))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100255 0))(
  ( (array!100256 (arr!48385 (Array (_ BitVec 32) (_ BitVec 64))) (size!48937 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100255)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503344 (= res!1024417 (and (= (size!48937 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48937 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48937 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503345 () Bool)

(declare-fun res!1024418 () Bool)

(assert (=> b!1503345 (=> (not res!1024418) (not e!840462))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12604 0))(
  ( (MissingZero!12604 (index!52808 (_ BitVec 32))) (Found!12604 (index!52809 (_ BitVec 32))) (Intermediate!12604 (undefined!13416 Bool) (index!52810 (_ BitVec 32)) (x!134495 (_ BitVec 32))) (Undefined!12604) (MissingVacant!12604 (index!52811 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100255 (_ BitVec 32)) SeekEntryResult!12604)

(assert (=> b!1503345 (= res!1024418 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48385 a!2850) j!87) a!2850 mask!2661) (Found!12604 j!87)))))

(declare-fun b!1503346 () Bool)

(declare-fun res!1024412 () Bool)

(assert (=> b!1503346 (=> (not res!1024412) (not e!840462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503346 (= res!1024412 (validKeyInArray!0 (select (arr!48385 a!2850) j!87)))))

(declare-fun b!1503347 () Bool)

(declare-fun res!1024413 () Bool)

(assert (=> b!1503347 (=> (not res!1024413) (not e!840462))))

(declare-datatypes ((List!34955 0))(
  ( (Nil!34952) (Cons!34951 (h!36349 (_ BitVec 64)) (t!49641 List!34955)) )
))
(declare-fun arrayNoDuplicates!0 (array!100255 (_ BitVec 32) List!34955) Bool)

(assert (=> b!1503347 (= res!1024413 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34952))))

(declare-fun res!1024416 () Bool)

(assert (=> start!127946 (=> (not res!1024416) (not e!840462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127946 (= res!1024416 (validMask!0 mask!2661))))

(assert (=> start!127946 e!840462))

(assert (=> start!127946 true))

(declare-fun array_inv!37618 (array!100255) Bool)

(assert (=> start!127946 (array_inv!37618 a!2850)))

(declare-fun b!1503348 () Bool)

(assert (=> b!1503348 (= e!840462 (or (bvslt (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110)))))

(declare-fun lt!653272 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503348 (= lt!653272 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503349 () Bool)

(declare-fun res!1024414 () Bool)

(assert (=> b!1503349 (=> (not res!1024414) (not e!840462))))

(assert (=> b!1503349 (= res!1024414 (validKeyInArray!0 (select (arr!48385 a!2850) i!996)))))

(declare-fun b!1503350 () Bool)

(declare-fun res!1024411 () Bool)

(assert (=> b!1503350 (=> (not res!1024411) (not e!840462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100255 (_ BitVec 32)) Bool)

(assert (=> b!1503350 (= res!1024411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503351 () Bool)

(declare-fun res!1024410 () Bool)

(assert (=> b!1503351 (=> (not res!1024410) (not e!840462))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503351 (= res!1024410 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48937 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48937 a!2850)) (= (select (arr!48385 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48385 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48937 a!2850))))))

(declare-fun b!1503352 () Bool)

(declare-fun res!1024415 () Bool)

(assert (=> b!1503352 (=> (not res!1024415) (not e!840462))))

(assert (=> b!1503352 (= res!1024415 (not (= (select (arr!48385 a!2850) index!625) (select (arr!48385 a!2850) j!87))))))

(assert (= (and start!127946 res!1024416) b!1503344))

(assert (= (and b!1503344 res!1024417) b!1503349))

(assert (= (and b!1503349 res!1024414) b!1503346))

(assert (= (and b!1503346 res!1024412) b!1503350))

(assert (= (and b!1503350 res!1024411) b!1503347))

(assert (= (and b!1503347 res!1024413) b!1503351))

(assert (= (and b!1503351 res!1024410) b!1503345))

(assert (= (and b!1503345 res!1024418) b!1503352))

(assert (= (and b!1503352 res!1024415) b!1503348))

(declare-fun m!1386049 () Bool)

(assert (=> b!1503349 m!1386049))

(assert (=> b!1503349 m!1386049))

(declare-fun m!1386051 () Bool)

(assert (=> b!1503349 m!1386051))

(declare-fun m!1386053 () Bool)

(assert (=> b!1503352 m!1386053))

(declare-fun m!1386055 () Bool)

(assert (=> b!1503352 m!1386055))

(declare-fun m!1386057 () Bool)

(assert (=> b!1503348 m!1386057))

(assert (=> b!1503346 m!1386055))

(assert (=> b!1503346 m!1386055))

(declare-fun m!1386059 () Bool)

(assert (=> b!1503346 m!1386059))

(declare-fun m!1386061 () Bool)

(assert (=> start!127946 m!1386061))

(declare-fun m!1386063 () Bool)

(assert (=> start!127946 m!1386063))

(declare-fun m!1386065 () Bool)

(assert (=> b!1503350 m!1386065))

(declare-fun m!1386067 () Bool)

(assert (=> b!1503351 m!1386067))

(declare-fun m!1386069 () Bool)

(assert (=> b!1503351 m!1386069))

(declare-fun m!1386071 () Bool)

(assert (=> b!1503351 m!1386071))

(assert (=> b!1503345 m!1386055))

(assert (=> b!1503345 m!1386055))

(declare-fun m!1386073 () Bool)

(assert (=> b!1503345 m!1386073))

(declare-fun m!1386075 () Bool)

(assert (=> b!1503347 m!1386075))

(check-sat (not b!1503345) (not b!1503348) (not b!1503350) (not b!1503349) (not start!127946) (not b!1503346) (not b!1503347))
(check-sat)
(get-model)

(declare-fun b!1503419 () Bool)

(declare-fun c!139012 () Bool)

(declare-fun lt!653284 () (_ BitVec 64))

(assert (=> b!1503419 (= c!139012 (= lt!653284 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840483 () SeekEntryResult!12604)

(declare-fun e!840482 () SeekEntryResult!12604)

(assert (=> b!1503419 (= e!840483 e!840482)))

(declare-fun b!1503420 () Bool)

(declare-fun e!840481 () SeekEntryResult!12604)

(assert (=> b!1503420 (= e!840481 Undefined!12604)))

(declare-fun b!1503422 () Bool)

(assert (=> b!1503422 (= e!840482 (MissingVacant!12604 vacantBefore!10))))

(declare-fun b!1503423 () Bool)

(assert (=> b!1503423 (= e!840482 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48385 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1503424 () Bool)

(assert (=> b!1503424 (= e!840481 e!840483)))

(declare-fun c!139010 () Bool)

(assert (=> b!1503424 (= c!139010 (= lt!653284 (select (arr!48385 a!2850) j!87)))))

(declare-fun b!1503421 () Bool)

(assert (=> b!1503421 (= e!840483 (Found!12604 index!625))))

(declare-fun d!157531 () Bool)

(declare-fun lt!653283 () SeekEntryResult!12604)

(get-info :version)

(assert (=> d!157531 (and (or ((_ is Undefined!12604) lt!653283) (not ((_ is Found!12604) lt!653283)) (and (bvsge (index!52809 lt!653283) #b00000000000000000000000000000000) (bvslt (index!52809 lt!653283) (size!48937 a!2850)))) (or ((_ is Undefined!12604) lt!653283) ((_ is Found!12604) lt!653283) (not ((_ is MissingVacant!12604) lt!653283)) (not (= (index!52811 lt!653283) vacantBefore!10)) (and (bvsge (index!52811 lt!653283) #b00000000000000000000000000000000) (bvslt (index!52811 lt!653283) (size!48937 a!2850)))) (or ((_ is Undefined!12604) lt!653283) (ite ((_ is Found!12604) lt!653283) (= (select (arr!48385 a!2850) (index!52809 lt!653283)) (select (arr!48385 a!2850) j!87)) (and ((_ is MissingVacant!12604) lt!653283) (= (index!52811 lt!653283) vacantBefore!10) (= (select (arr!48385 a!2850) (index!52811 lt!653283)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157531 (= lt!653283 e!840481)))

(declare-fun c!139011 () Bool)

(assert (=> d!157531 (= c!139011 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157531 (= lt!653284 (select (arr!48385 a!2850) index!625))))

(assert (=> d!157531 (validMask!0 mask!2661)))

(assert (=> d!157531 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48385 a!2850) j!87) a!2850 mask!2661) lt!653283)))

(assert (= (and d!157531 c!139011) b!1503420))

(assert (= (and d!157531 (not c!139011)) b!1503424))

(assert (= (and b!1503424 c!139010) b!1503421))

(assert (= (and b!1503424 (not c!139010)) b!1503419))

(assert (= (and b!1503419 c!139012) b!1503422))

(assert (= (and b!1503419 (not c!139012)) b!1503423))

(assert (=> b!1503423 m!1386057))

(assert (=> b!1503423 m!1386057))

(assert (=> b!1503423 m!1386055))

(declare-fun m!1386133 () Bool)

(assert (=> b!1503423 m!1386133))

(declare-fun m!1386135 () Bool)

(assert (=> d!157531 m!1386135))

(declare-fun m!1386137 () Bool)

(assert (=> d!157531 m!1386137))

(assert (=> d!157531 m!1386053))

(assert (=> d!157531 m!1386061))

(assert (=> b!1503345 d!157531))

(declare-fun bm!68069 () Bool)

(declare-fun call!68072 () Bool)

(assert (=> bm!68069 (= call!68072 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1503433 () Bool)

(declare-fun e!840490 () Bool)

(assert (=> b!1503433 (= e!840490 call!68072)))

(declare-fun b!1503434 () Bool)

(declare-fun e!840491 () Bool)

(assert (=> b!1503434 (= e!840491 call!68072)))

(declare-fun d!157535 () Bool)

(declare-fun res!1024478 () Bool)

(declare-fun e!840492 () Bool)

(assert (=> d!157535 (=> res!1024478 e!840492)))

(assert (=> d!157535 (= res!1024478 (bvsge #b00000000000000000000000000000000 (size!48937 a!2850)))))

(assert (=> d!157535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840492)))

(declare-fun b!1503435 () Bool)

(assert (=> b!1503435 (= e!840491 e!840490)))

(declare-fun lt!653291 () (_ BitVec 64))

(assert (=> b!1503435 (= lt!653291 (select (arr!48385 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50101 0))(
  ( (Unit!50102) )
))
(declare-fun lt!653293 () Unit!50101)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100255 (_ BitVec 64) (_ BitVec 32)) Unit!50101)

(assert (=> b!1503435 (= lt!653293 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653291 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1503435 (arrayContainsKey!0 a!2850 lt!653291 #b00000000000000000000000000000000)))

(declare-fun lt!653292 () Unit!50101)

(assert (=> b!1503435 (= lt!653292 lt!653293)))

(declare-fun res!1024477 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100255 (_ BitVec 32)) SeekEntryResult!12604)

(assert (=> b!1503435 (= res!1024477 (= (seekEntryOrOpen!0 (select (arr!48385 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12604 #b00000000000000000000000000000000)))))

(assert (=> b!1503435 (=> (not res!1024477) (not e!840490))))

(declare-fun b!1503436 () Bool)

(assert (=> b!1503436 (= e!840492 e!840491)))

(declare-fun c!139015 () Bool)

(assert (=> b!1503436 (= c!139015 (validKeyInArray!0 (select (arr!48385 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157535 (not res!1024478)) b!1503436))

(assert (= (and b!1503436 c!139015) b!1503435))

(assert (= (and b!1503436 (not c!139015)) b!1503434))

(assert (= (and b!1503435 res!1024477) b!1503433))

(assert (= (or b!1503433 b!1503434) bm!68069))

(declare-fun m!1386139 () Bool)

(assert (=> bm!68069 m!1386139))

(declare-fun m!1386141 () Bool)

(assert (=> b!1503435 m!1386141))

(declare-fun m!1386143 () Bool)

(assert (=> b!1503435 m!1386143))

(declare-fun m!1386145 () Bool)

(assert (=> b!1503435 m!1386145))

(assert (=> b!1503435 m!1386141))

(declare-fun m!1386147 () Bool)

(assert (=> b!1503435 m!1386147))

(assert (=> b!1503436 m!1386141))

(assert (=> b!1503436 m!1386141))

(declare-fun m!1386149 () Bool)

(assert (=> b!1503436 m!1386149))

(assert (=> b!1503350 d!157535))

(declare-fun d!157539 () Bool)

(assert (=> d!157539 (= (validKeyInArray!0 (select (arr!48385 a!2850) j!87)) (and (not (= (select (arr!48385 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48385 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503346 d!157539))

(declare-fun d!157541 () Bool)

(assert (=> d!157541 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127946 d!157541))

(declare-fun d!157553 () Bool)

(assert (=> d!157553 (= (array_inv!37618 a!2850) (bvsge (size!48937 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127946 d!157553))

(declare-fun d!157555 () Bool)

(declare-fun lt!653311 () (_ BitVec 32))

(assert (=> d!157555 (and (bvsge lt!653311 #b00000000000000000000000000000000) (bvslt lt!653311 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157555 (= lt!653311 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157555 (validMask!0 mask!2661)))

(assert (=> d!157555 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653311)))

(declare-fun bs!43129 () Bool)

(assert (= bs!43129 d!157555))

(declare-fun m!1386169 () Bool)

(assert (=> bs!43129 m!1386169))

(assert (=> bs!43129 m!1386061))

(assert (=> b!1503348 d!157555))

(declare-fun d!157559 () Bool)

(declare-fun res!1024513 () Bool)

(declare-fun e!840546 () Bool)

(assert (=> d!157559 (=> res!1024513 e!840546)))

(assert (=> d!157559 (= res!1024513 (bvsge #b00000000000000000000000000000000 (size!48937 a!2850)))))

(assert (=> d!157559 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34952) e!840546)))

(declare-fun b!1503509 () Bool)

(declare-fun e!840545 () Bool)

(declare-fun call!68084 () Bool)

(assert (=> b!1503509 (= e!840545 call!68084)))

(declare-fun b!1503510 () Bool)

(declare-fun e!840547 () Bool)

(declare-fun contains!9912 (List!34955 (_ BitVec 64)) Bool)

(assert (=> b!1503510 (= e!840547 (contains!9912 Nil!34952 (select (arr!48385 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1503511 () Bool)

(declare-fun e!840548 () Bool)

(assert (=> b!1503511 (= e!840546 e!840548)))

(declare-fun res!1024512 () Bool)

(assert (=> b!1503511 (=> (not res!1024512) (not e!840548))))

(assert (=> b!1503511 (= res!1024512 (not e!840547))))

(declare-fun res!1024511 () Bool)

(assert (=> b!1503511 (=> (not res!1024511) (not e!840547))))

(assert (=> b!1503511 (= res!1024511 (validKeyInArray!0 (select (arr!48385 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1503512 () Bool)

(assert (=> b!1503512 (= e!840545 call!68084)))

(declare-fun b!1503513 () Bool)

(assert (=> b!1503513 (= e!840548 e!840545)))

(declare-fun c!139036 () Bool)

(assert (=> b!1503513 (= c!139036 (validKeyInArray!0 (select (arr!48385 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68081 () Bool)

(assert (=> bm!68081 (= call!68084 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139036 (Cons!34951 (select (arr!48385 a!2850) #b00000000000000000000000000000000) Nil!34952) Nil!34952)))))

(assert (= (and d!157559 (not res!1024513)) b!1503511))

(assert (= (and b!1503511 res!1024511) b!1503510))

(assert (= (and b!1503511 res!1024512) b!1503513))

(assert (= (and b!1503513 c!139036) b!1503509))

(assert (= (and b!1503513 (not c!139036)) b!1503512))

(assert (= (or b!1503509 b!1503512) bm!68081))

(assert (=> b!1503510 m!1386141))

(assert (=> b!1503510 m!1386141))

(declare-fun m!1386183 () Bool)

(assert (=> b!1503510 m!1386183))

(assert (=> b!1503511 m!1386141))

(assert (=> b!1503511 m!1386141))

(assert (=> b!1503511 m!1386149))

(assert (=> b!1503513 m!1386141))

(assert (=> b!1503513 m!1386141))

(assert (=> b!1503513 m!1386149))

(assert (=> bm!68081 m!1386141))

(declare-fun m!1386185 () Bool)

(assert (=> bm!68081 m!1386185))

(assert (=> b!1503347 d!157559))

(declare-fun d!157567 () Bool)

(assert (=> d!157567 (= (validKeyInArray!0 (select (arr!48385 a!2850) i!996)) (and (not (= (select (arr!48385 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48385 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1503349 d!157567))

(check-sat (not b!1503513) (not b!1503435) (not d!157555) (not d!157531) (not b!1503510) (not b!1503423) (not b!1503436) (not bm!68069) (not b!1503511) (not bm!68081))
(check-sat)
