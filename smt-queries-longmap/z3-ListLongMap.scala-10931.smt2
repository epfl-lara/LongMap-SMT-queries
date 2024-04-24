; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128186 () Bool)

(assert start!128186)

(declare-fun b!1504373 () Bool)

(declare-fun res!1024178 () Bool)

(declare-fun e!841478 () Bool)

(assert (=> b!1504373 (=> (not res!1024178) (not e!841478))))

(declare-datatypes ((array!100348 0))(
  ( (array!100349 (arr!48427 (Array (_ BitVec 32) (_ BitVec 64))) (size!48978 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100348)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504373 (= res!1024178 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48978 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48978 a!2850)) (= (select (arr!48427 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48978 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12518 0))(
  ( (MissingZero!12518 (index!52464 (_ BitVec 32))) (Found!12518 (index!52465 (_ BitVec 32))) (Intermediate!12518 (undefined!13330 Bool) (index!52466 (_ BitVec 32)) (x!134352 (_ BitVec 32))) (Undefined!12518) (MissingVacant!12518 (index!52467 (_ BitVec 32))) )
))
(declare-fun lt!654057 () SeekEntryResult!12518)

(declare-fun e!841479 () Bool)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun b!1504374 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100348 (_ BitVec 32)) SeekEntryResult!12518)

(assert (=> b!1504374 (= e!841479 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100349 (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48978 a!2850)) mask!2661) lt!654057)))))

(declare-fun b!1504375 () Bool)

(declare-fun res!1024180 () Bool)

(assert (=> b!1504375 (=> (not res!1024180) (not e!841478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504375 (= res!1024180 (validKeyInArray!0 (select (arr!48427 a!2850) i!996)))))

(declare-fun b!1504376 () Bool)

(declare-fun res!1024181 () Bool)

(assert (=> b!1504376 (=> (not res!1024181) (not e!841478))))

(declare-datatypes ((List!34906 0))(
  ( (Nil!34903) (Cons!34902 (h!36314 (_ BitVec 64)) (t!49592 List!34906)) )
))
(declare-fun arrayNoDuplicates!0 (array!100348 (_ BitVec 32) List!34906) Bool)

(assert (=> b!1504376 (= res!1024181 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34903))))

(declare-fun b!1504377 () Bool)

(assert (=> b!1504377 (= e!841478 e!841479)))

(declare-fun res!1024177 () Bool)

(assert (=> b!1504377 (=> (not res!1024177) (not e!841479))))

(assert (=> b!1504377 (= res!1024177 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48427 a!2850) j!87) a!2850 mask!2661) lt!654057))))

(assert (=> b!1504377 (= lt!654057 (Found!12518 j!87))))

(declare-fun b!1504379 () Bool)

(declare-fun res!1024182 () Bool)

(assert (=> b!1504379 (=> (not res!1024182) (not e!841478))))

(assert (=> b!1504379 (= res!1024182 (validKeyInArray!0 (select (arr!48427 a!2850) j!87)))))

(declare-fun res!1024184 () Bool)

(assert (=> start!128186 (=> (not res!1024184) (not e!841478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128186 (= res!1024184 (validMask!0 mask!2661))))

(assert (=> start!128186 e!841478))

(assert (=> start!128186 true))

(declare-fun array_inv!37708 (array!100348) Bool)

(assert (=> start!128186 (array_inv!37708 a!2850)))

(declare-fun b!1504378 () Bool)

(declare-fun res!1024176 () Bool)

(assert (=> b!1504378 (=> (not res!1024176) (not e!841478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100348 (_ BitVec 32)) Bool)

(assert (=> b!1504378 (= res!1024176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504380 () Bool)

(declare-fun res!1024183 () Bool)

(assert (=> b!1504380 (=> (not res!1024183) (not e!841478))))

(assert (=> b!1504380 (= res!1024183 (and (= (size!48978 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48978 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48978 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504381 () Bool)

(declare-fun res!1024179 () Bool)

(assert (=> b!1504381 (=> (not res!1024179) (not e!841479))))

(assert (=> b!1504381 (= res!1024179 (and (= (select (arr!48427 a!2850) index!625) (select (arr!48427 a!2850) j!87)) (= j!87 index!625)))))

(assert (= (and start!128186 res!1024184) b!1504380))

(assert (= (and b!1504380 res!1024183) b!1504375))

(assert (= (and b!1504375 res!1024180) b!1504379))

(assert (= (and b!1504379 res!1024182) b!1504378))

(assert (= (and b!1504378 res!1024176) b!1504376))

(assert (= (and b!1504376 res!1024181) b!1504373))

(assert (= (and b!1504373 res!1024178) b!1504377))

(assert (= (and b!1504377 res!1024177) b!1504381))

(assert (= (and b!1504381 res!1024179) b!1504374))

(declare-fun m!1387593 () Bool)

(assert (=> b!1504379 m!1387593))

(assert (=> b!1504379 m!1387593))

(declare-fun m!1387595 () Bool)

(assert (=> b!1504379 m!1387595))

(declare-fun m!1387597 () Bool)

(assert (=> b!1504378 m!1387597))

(assert (=> b!1504377 m!1387593))

(assert (=> b!1504377 m!1387593))

(declare-fun m!1387599 () Bool)

(assert (=> b!1504377 m!1387599))

(declare-fun m!1387601 () Bool)

(assert (=> b!1504373 m!1387601))

(declare-fun m!1387603 () Bool)

(assert (=> b!1504373 m!1387603))

(declare-fun m!1387605 () Bool)

(assert (=> b!1504373 m!1387605))

(declare-fun m!1387607 () Bool)

(assert (=> b!1504375 m!1387607))

(assert (=> b!1504375 m!1387607))

(declare-fun m!1387609 () Bool)

(assert (=> b!1504375 m!1387609))

(declare-fun m!1387611 () Bool)

(assert (=> start!128186 m!1387611))

(declare-fun m!1387613 () Bool)

(assert (=> start!128186 m!1387613))

(declare-fun m!1387615 () Bool)

(assert (=> b!1504376 m!1387615))

(declare-fun m!1387617 () Bool)

(assert (=> b!1504381 m!1387617))

(assert (=> b!1504381 m!1387593))

(assert (=> b!1504374 m!1387603))

(declare-fun m!1387619 () Bool)

(assert (=> b!1504374 m!1387619))

(assert (=> b!1504374 m!1387619))

(declare-fun m!1387621 () Bool)

(assert (=> b!1504374 m!1387621))

(check-sat (not b!1504378) (not b!1504376) (not start!128186) (not b!1504375) (not b!1504379) (not b!1504374) (not b!1504377))
(check-sat)
(get-model)

(declare-fun d!158223 () Bool)

(assert (=> d!158223 (= (validKeyInArray!0 (select (arr!48427 a!2850) i!996)) (and (not (= (select (arr!48427 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48427 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504375 d!158223))

(declare-fun d!158225 () Bool)

(assert (=> d!158225 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128186 d!158225))

(declare-fun d!158227 () Bool)

(assert (=> d!158227 (= (array_inv!37708 a!2850) (bvsge (size!48978 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128186 d!158227))

(declare-fun d!158229 () Bool)

(assert (=> d!158229 (= (validKeyInArray!0 (select (arr!48427 a!2850) j!87)) (and (not (= (select (arr!48427 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48427 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504379 d!158229))

(declare-fun lt!654069 () SeekEntryResult!12518)

(declare-fun d!158231 () Bool)

(get-info :version)

(assert (=> d!158231 (and (or ((_ is Undefined!12518) lt!654069) (not ((_ is Found!12518) lt!654069)) (and (bvsge (index!52465 lt!654069) #b00000000000000000000000000000000) (bvslt (index!52465 lt!654069) (size!48978 (array!100349 (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48978 a!2850)))))) (or ((_ is Undefined!12518) lt!654069) ((_ is Found!12518) lt!654069) (not ((_ is MissingVacant!12518) lt!654069)) (not (= (index!52467 lt!654069) vacantAfter!10)) (and (bvsge (index!52467 lt!654069) #b00000000000000000000000000000000) (bvslt (index!52467 lt!654069) (size!48978 (array!100349 (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48978 a!2850)))))) (or ((_ is Undefined!12518) lt!654069) (ite ((_ is Found!12518) lt!654069) (= (select (arr!48427 (array!100349 (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48978 a!2850))) (index!52465 lt!654069)) (select (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)) (and ((_ is MissingVacant!12518) lt!654069) (= (index!52467 lt!654069) vacantAfter!10) (= (select (arr!48427 (array!100349 (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48978 a!2850))) (index!52467 lt!654069)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841506 () SeekEntryResult!12518)

(assert (=> d!158231 (= lt!654069 e!841506)))

(declare-fun c!139650 () Bool)

(assert (=> d!158231 (= c!139650 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!654068 () (_ BitVec 64))

(assert (=> d!158231 (= lt!654068 (select (arr!48427 (array!100349 (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48978 a!2850))) index!625))))

(assert (=> d!158231 (validMask!0 mask!2661)))

(assert (=> d!158231 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100349 (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48978 a!2850)) mask!2661) lt!654069)))

(declare-fun b!1504448 () Bool)

(declare-fun e!841505 () SeekEntryResult!12518)

(assert (=> b!1504448 (= e!841505 (Found!12518 index!625))))

(declare-fun b!1504449 () Bool)

(assert (=> b!1504449 (= e!841506 Undefined!12518)))

(declare-fun b!1504450 () Bool)

(assert (=> b!1504450 (= e!841506 e!841505)))

(declare-fun c!139651 () Bool)

(assert (=> b!1504450 (= c!139651 (= lt!654068 (select (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)))))

(declare-fun b!1504451 () Bool)

(declare-fun e!841504 () SeekEntryResult!12518)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504451 (= e!841504 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantAfter!10 (select (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100349 (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48978 a!2850)) mask!2661))))

(declare-fun b!1504452 () Bool)

(declare-fun c!139649 () Bool)

(assert (=> b!1504452 (= c!139649 (= lt!654068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504452 (= e!841505 e!841504)))

(declare-fun b!1504453 () Bool)

(assert (=> b!1504453 (= e!841504 (MissingVacant!12518 vacantAfter!10))))

(assert (= (and d!158231 c!139650) b!1504449))

(assert (= (and d!158231 (not c!139650)) b!1504450))

(assert (= (and b!1504450 c!139651) b!1504448))

(assert (= (and b!1504450 (not c!139651)) b!1504452))

(assert (= (and b!1504452 c!139649) b!1504453))

(assert (= (and b!1504452 (not c!139649)) b!1504451))

(declare-fun m!1387683 () Bool)

(assert (=> d!158231 m!1387683))

(declare-fun m!1387685 () Bool)

(assert (=> d!158231 m!1387685))

(declare-fun m!1387687 () Bool)

(assert (=> d!158231 m!1387687))

(assert (=> d!158231 m!1387611))

(declare-fun m!1387689 () Bool)

(assert (=> b!1504451 m!1387689))

(assert (=> b!1504451 m!1387689))

(assert (=> b!1504451 m!1387619))

(declare-fun m!1387691 () Bool)

(assert (=> b!1504451 m!1387691))

(assert (=> b!1504374 d!158231))

(declare-fun b!1504472 () Bool)

(declare-fun e!841522 () Bool)

(declare-fun call!68195 () Bool)

(assert (=> b!1504472 (= e!841522 call!68195)))

(declare-fun b!1504473 () Bool)

(declare-fun e!841523 () Bool)

(assert (=> b!1504473 (= e!841523 e!841522)))

(declare-fun c!139656 () Bool)

(assert (=> b!1504473 (= c!139656 (validKeyInArray!0 (select (arr!48427 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!158233 () Bool)

(declare-fun res!1024250 () Bool)

(assert (=> d!158233 (=> res!1024250 e!841523)))

(assert (=> d!158233 (= res!1024250 (bvsge #b00000000000000000000000000000000 (size!48978 a!2850)))))

(assert (=> d!158233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841523)))

(declare-fun bm!68192 () Bool)

(assert (=> bm!68192 (= call!68195 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1504474 () Bool)

(declare-fun e!841521 () Bool)

(assert (=> b!1504474 (= e!841521 call!68195)))

(declare-fun b!1504475 () Bool)

(assert (=> b!1504475 (= e!841522 e!841521)))

(declare-fun lt!654076 () (_ BitVec 64))

(assert (=> b!1504475 (= lt!654076 (select (arr!48427 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50189 0))(
  ( (Unit!50190) )
))
(declare-fun lt!654077 () Unit!50189)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100348 (_ BitVec 64) (_ BitVec 32)) Unit!50189)

(assert (=> b!1504475 (= lt!654077 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!654076 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504475 (arrayContainsKey!0 a!2850 lt!654076 #b00000000000000000000000000000000)))

(declare-fun lt!654078 () Unit!50189)

(assert (=> b!1504475 (= lt!654078 lt!654077)))

(declare-fun res!1024249 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100348 (_ BitVec 32)) SeekEntryResult!12518)

(assert (=> b!1504475 (= res!1024249 (= (seekEntryOrOpen!0 (select (arr!48427 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12518 #b00000000000000000000000000000000)))))

(assert (=> b!1504475 (=> (not res!1024249) (not e!841521))))

(assert (= (and d!158233 (not res!1024250)) b!1504473))

(assert (= (and b!1504473 c!139656) b!1504475))

(assert (= (and b!1504473 (not c!139656)) b!1504472))

(assert (= (and b!1504475 res!1024249) b!1504474))

(assert (= (or b!1504474 b!1504472) bm!68192))

(declare-fun m!1387693 () Bool)

(assert (=> b!1504473 m!1387693))

(assert (=> b!1504473 m!1387693))

(declare-fun m!1387695 () Bool)

(assert (=> b!1504473 m!1387695))

(declare-fun m!1387697 () Bool)

(assert (=> bm!68192 m!1387697))

(assert (=> b!1504475 m!1387693))

(declare-fun m!1387699 () Bool)

(assert (=> b!1504475 m!1387699))

(declare-fun m!1387701 () Bool)

(assert (=> b!1504475 m!1387701))

(assert (=> b!1504475 m!1387693))

(declare-fun m!1387703 () Bool)

(assert (=> b!1504475 m!1387703))

(assert (=> b!1504378 d!158233))

(declare-fun d!158239 () Bool)

(declare-fun lt!654080 () SeekEntryResult!12518)

(assert (=> d!158239 (and (or ((_ is Undefined!12518) lt!654080) (not ((_ is Found!12518) lt!654080)) (and (bvsge (index!52465 lt!654080) #b00000000000000000000000000000000) (bvslt (index!52465 lt!654080) (size!48978 a!2850)))) (or ((_ is Undefined!12518) lt!654080) ((_ is Found!12518) lt!654080) (not ((_ is MissingVacant!12518) lt!654080)) (not (= (index!52467 lt!654080) vacantBefore!10)) (and (bvsge (index!52467 lt!654080) #b00000000000000000000000000000000) (bvslt (index!52467 lt!654080) (size!48978 a!2850)))) (or ((_ is Undefined!12518) lt!654080) (ite ((_ is Found!12518) lt!654080) (= (select (arr!48427 a!2850) (index!52465 lt!654080)) (select (arr!48427 a!2850) j!87)) (and ((_ is MissingVacant!12518) lt!654080) (= (index!52467 lt!654080) vacantBefore!10) (= (select (arr!48427 a!2850) (index!52467 lt!654080)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!841530 () SeekEntryResult!12518)

(assert (=> d!158239 (= lt!654080 e!841530)))

(declare-fun c!139659 () Bool)

(assert (=> d!158239 (= c!139659 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!654079 () (_ BitVec 64))

(assert (=> d!158239 (= lt!654079 (select (arr!48427 a!2850) index!625))))

(assert (=> d!158239 (validMask!0 mask!2661)))

(assert (=> d!158239 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48427 a!2850) j!87) a!2850 mask!2661) lt!654080)))

(declare-fun b!1504481 () Bool)

(declare-fun e!841529 () SeekEntryResult!12518)

(assert (=> b!1504481 (= e!841529 (Found!12518 index!625))))

(declare-fun b!1504482 () Bool)

(assert (=> b!1504482 (= e!841530 Undefined!12518)))

(declare-fun b!1504483 () Bool)

(assert (=> b!1504483 (= e!841530 e!841529)))

(declare-fun c!139660 () Bool)

(assert (=> b!1504483 (= c!139660 (= lt!654079 (select (arr!48427 a!2850) j!87)))))

(declare-fun e!841528 () SeekEntryResult!12518)

(declare-fun b!1504484 () Bool)

(assert (=> b!1504484 (= e!841528 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48427 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504485 () Bool)

(declare-fun c!139658 () Bool)

(assert (=> b!1504485 (= c!139658 (= lt!654079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1504485 (= e!841529 e!841528)))

(declare-fun b!1504486 () Bool)

(assert (=> b!1504486 (= e!841528 (MissingVacant!12518 vacantBefore!10))))

(assert (= (and d!158239 c!139659) b!1504482))

(assert (= (and d!158239 (not c!139659)) b!1504483))

(assert (= (and b!1504483 c!139660) b!1504481))

(assert (= (and b!1504483 (not c!139660)) b!1504485))

(assert (= (and b!1504485 c!139658) b!1504486))

(assert (= (and b!1504485 (not c!139658)) b!1504484))

(declare-fun m!1387713 () Bool)

(assert (=> d!158239 m!1387713))

(declare-fun m!1387715 () Bool)

(assert (=> d!158239 m!1387715))

(assert (=> d!158239 m!1387617))

(assert (=> d!158239 m!1387611))

(assert (=> b!1504484 m!1387689))

(assert (=> b!1504484 m!1387689))

(assert (=> b!1504484 m!1387593))

(declare-fun m!1387717 () Bool)

(assert (=> b!1504484 m!1387717))

(assert (=> b!1504377 d!158239))

(declare-fun b!1504517 () Bool)

(declare-fun e!841556 () Bool)

(declare-fun contains!9990 (List!34906 (_ BitVec 64)) Bool)

(assert (=> b!1504517 (= e!841556 (contains!9990 Nil!34903 (select (arr!48427 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504518 () Bool)

(declare-fun e!841554 () Bool)

(declare-fun e!841557 () Bool)

(assert (=> b!1504518 (= e!841554 e!841557)))

(declare-fun c!139668 () Bool)

(assert (=> b!1504518 (= c!139668 (validKeyInArray!0 (select (arr!48427 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!158243 () Bool)

(declare-fun res!1024271 () Bool)

(declare-fun e!841555 () Bool)

(assert (=> d!158243 (=> res!1024271 e!841555)))

(assert (=> d!158243 (= res!1024271 (bvsge #b00000000000000000000000000000000 (size!48978 a!2850)))))

(assert (=> d!158243 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34903) e!841555)))

(declare-fun bm!68199 () Bool)

(declare-fun call!68202 () Bool)

(assert (=> bm!68199 (= call!68202 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139668 (Cons!34902 (select (arr!48427 a!2850) #b00000000000000000000000000000000) Nil!34903) Nil!34903)))))

(declare-fun b!1504519 () Bool)

(assert (=> b!1504519 (= e!841557 call!68202)))

(declare-fun b!1504520 () Bool)

(assert (=> b!1504520 (= e!841555 e!841554)))

(declare-fun res!1024270 () Bool)

(assert (=> b!1504520 (=> (not res!1024270) (not e!841554))))

(assert (=> b!1504520 (= res!1024270 (not e!841556))))

(declare-fun res!1024272 () Bool)

(assert (=> b!1504520 (=> (not res!1024272) (not e!841556))))

(assert (=> b!1504520 (= res!1024272 (validKeyInArray!0 (select (arr!48427 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504521 () Bool)

(assert (=> b!1504521 (= e!841557 call!68202)))

(assert (= (and d!158243 (not res!1024271)) b!1504520))

(assert (= (and b!1504520 res!1024272) b!1504517))

(assert (= (and b!1504520 res!1024270) b!1504518))

(assert (= (and b!1504518 c!139668) b!1504521))

(assert (= (and b!1504518 (not c!139668)) b!1504519))

(assert (= (or b!1504521 b!1504519) bm!68199))

(assert (=> b!1504517 m!1387693))

(assert (=> b!1504517 m!1387693))

(declare-fun m!1387721 () Bool)

(assert (=> b!1504517 m!1387721))

(assert (=> b!1504518 m!1387693))

(assert (=> b!1504518 m!1387693))

(assert (=> b!1504518 m!1387695))

(assert (=> bm!68199 m!1387693))

(declare-fun m!1387729 () Bool)

(assert (=> bm!68199 m!1387729))

(assert (=> b!1504520 m!1387693))

(assert (=> b!1504520 m!1387693))

(assert (=> b!1504520 m!1387695))

(assert (=> b!1504376 d!158243))

(check-sat (not b!1504484) (not bm!68199) (not b!1504475) (not b!1504520) (not d!158239) (not b!1504517) (not d!158231) (not bm!68192) (not b!1504473) (not b!1504451) (not b!1504518))
(check-sat)
