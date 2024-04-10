; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128074 () Bool)

(assert start!128074)

(declare-fun b!1504335 () Bool)

(declare-fun res!1025130 () Bool)

(declare-fun e!840870 () Bool)

(assert (=> b!1504335 (=> (not res!1025130) (not e!840870))))

(declare-datatypes ((array!100350 0))(
  ( (array!100351 (arr!48430 (Array (_ BitVec 32) (_ BitVec 64))) (size!48980 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100350)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504335 (= res!1025130 (validKeyInArray!0 (select (arr!48430 a!2850) i!996)))))

(declare-fun b!1504336 () Bool)

(declare-fun res!1025124 () Bool)

(assert (=> b!1504336 (=> (not res!1025124) (not e!840870))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1504336 (= res!1025124 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48980 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48980 a!2850)) (= (select (arr!48430 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48430 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48980 a!2850))))))

(declare-fun b!1504337 () Bool)

(declare-fun lt!653665 () (_ BitVec 32))

(assert (=> b!1504337 (= e!840870 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (or (bvslt lt!653665 #b00000000000000000000000000000000) (bvsge lt!653665 (size!48980 a!2850)))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504337 (= lt!653665 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504339 () Bool)

(declare-fun res!1025125 () Bool)

(assert (=> b!1504339 (=> (not res!1025125) (not e!840870))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12628 0))(
  ( (MissingZero!12628 (index!52904 (_ BitVec 32))) (Found!12628 (index!52905 (_ BitVec 32))) (Intermediate!12628 (undefined!13440 Bool) (index!52906 (_ BitVec 32)) (x!134578 (_ BitVec 32))) (Undefined!12628) (MissingVacant!12628 (index!52907 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100350 (_ BitVec 32)) SeekEntryResult!12628)

(assert (=> b!1504339 (= res!1025125 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48430 a!2850) j!87) a!2850 mask!2661) (Found!12628 j!87)))))

(declare-fun b!1504340 () Bool)

(declare-fun res!1025123 () Bool)

(assert (=> b!1504340 (=> (not res!1025123) (not e!840870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100350 (_ BitVec 32)) Bool)

(assert (=> b!1504340 (= res!1025123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504341 () Bool)

(declare-fun res!1025128 () Bool)

(assert (=> b!1504341 (=> (not res!1025128) (not e!840870))))

(declare-datatypes ((List!34922 0))(
  ( (Nil!34919) (Cons!34918 (h!36315 (_ BitVec 64)) (t!49616 List!34922)) )
))
(declare-fun arrayNoDuplicates!0 (array!100350 (_ BitVec 32) List!34922) Bool)

(assert (=> b!1504341 (= res!1025128 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34919))))

(declare-fun b!1504342 () Bool)

(declare-fun res!1025131 () Bool)

(assert (=> b!1504342 (=> (not res!1025131) (not e!840870))))

(assert (=> b!1504342 (= res!1025131 (not (= (select (arr!48430 a!2850) index!625) (select (arr!48430 a!2850) j!87))))))

(declare-fun b!1504343 () Bool)

(declare-fun res!1025129 () Bool)

(assert (=> b!1504343 (=> (not res!1025129) (not e!840870))))

(assert (=> b!1504343 (= res!1025129 (and (= (size!48980 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48980 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48980 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1025126 () Bool)

(assert (=> start!128074 (=> (not res!1025126) (not e!840870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128074 (= res!1025126 (validMask!0 mask!2661))))

(assert (=> start!128074 e!840870))

(assert (=> start!128074 true))

(declare-fun array_inv!37458 (array!100350) Bool)

(assert (=> start!128074 (array_inv!37458 a!2850)))

(declare-fun b!1504338 () Bool)

(declare-fun res!1025127 () Bool)

(assert (=> b!1504338 (=> (not res!1025127) (not e!840870))))

(assert (=> b!1504338 (= res!1025127 (validKeyInArray!0 (select (arr!48430 a!2850) j!87)))))

(assert (= (and start!128074 res!1025126) b!1504343))

(assert (= (and b!1504343 res!1025129) b!1504335))

(assert (= (and b!1504335 res!1025130) b!1504338))

(assert (= (and b!1504338 res!1025127) b!1504340))

(assert (= (and b!1504340 res!1025123) b!1504341))

(assert (= (and b!1504341 res!1025128) b!1504336))

(assert (= (and b!1504336 res!1025124) b!1504339))

(assert (= (and b!1504339 res!1025125) b!1504342))

(assert (= (and b!1504342 res!1025131) b!1504337))

(declare-fun m!1387551 () Bool)

(assert (=> b!1504337 m!1387551))

(declare-fun m!1387553 () Bool)

(assert (=> b!1504339 m!1387553))

(assert (=> b!1504339 m!1387553))

(declare-fun m!1387555 () Bool)

(assert (=> b!1504339 m!1387555))

(declare-fun m!1387557 () Bool)

(assert (=> b!1504341 m!1387557))

(declare-fun m!1387559 () Bool)

(assert (=> b!1504342 m!1387559))

(assert (=> b!1504342 m!1387553))

(declare-fun m!1387561 () Bool)

(assert (=> b!1504336 m!1387561))

(declare-fun m!1387563 () Bool)

(assert (=> b!1504336 m!1387563))

(declare-fun m!1387565 () Bool)

(assert (=> b!1504336 m!1387565))

(declare-fun m!1387567 () Bool)

(assert (=> b!1504340 m!1387567))

(declare-fun m!1387569 () Bool)

(assert (=> start!128074 m!1387569))

(declare-fun m!1387571 () Bool)

(assert (=> start!128074 m!1387571))

(assert (=> b!1504338 m!1387553))

(assert (=> b!1504338 m!1387553))

(declare-fun m!1387573 () Bool)

(assert (=> b!1504338 m!1387573))

(declare-fun m!1387575 () Bool)

(assert (=> b!1504335 m!1387575))

(assert (=> b!1504335 m!1387575))

(declare-fun m!1387577 () Bool)

(assert (=> b!1504335 m!1387577))

(push 1)

(assert (not b!1504341))

(assert (not b!1504338))

(assert (not b!1504340))

(assert (not b!1504335))

(assert (not b!1504337))

(assert (not start!128074))

(assert (not b!1504339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157847 () Bool)

(declare-fun lt!653674 () (_ BitVec 32))

(assert (=> d!157847 (and (bvsge lt!653674 #b00000000000000000000000000000000) (bvslt lt!653674 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157847 (= lt!653674 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157847 (validMask!0 mask!2661)))

(assert (=> d!157847 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653674)))

(declare-fun bs!43195 () Bool)

(assert (= bs!43195 d!157847))

(declare-fun m!1387585 () Bool)

(assert (=> bs!43195 m!1387585))

(assert (=> bs!43195 m!1387569))

(assert (=> b!1504337 d!157847))

(declare-fun d!157849 () Bool)

(assert (=> d!157849 (= (validKeyInArray!0 (select (arr!48430 a!2850) j!87)) (and (not (= (select (arr!48430 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48430 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504338 d!157849))

(declare-fun d!157851 () Bool)

(declare-fun res!1025146 () Bool)

(declare-fun e!840898 () Bool)

(assert (=> d!157851 (=> res!1025146 e!840898)))

(assert (=> d!157851 (= res!1025146 (bvsge #b00000000000000000000000000000000 (size!48980 a!2850)))))

(assert (=> d!157851 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34919) e!840898)))

(declare-fun b!1504384 () Bool)

(declare-fun e!840900 () Bool)

(declare-fun e!840901 () Bool)

(assert (=> b!1504384 (= e!840900 e!840901)))

(declare-fun c!139154 () Bool)

(assert (=> b!1504384 (= c!139154 (validKeyInArray!0 (select (arr!48430 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504385 () Bool)

(declare-fun e!840899 () Bool)

(declare-fun contains!9950 (List!34922 (_ BitVec 64)) Bool)

(assert (=> b!1504385 (= e!840899 (contains!9950 Nil!34919 (select (arr!48430 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504386 () Bool)

(assert (=> b!1504386 (= e!840898 e!840900)))

(declare-fun res!1025144 () Bool)

(assert (=> b!1504386 (=> (not res!1025144) (not e!840900))))

(assert (=> b!1504386 (= res!1025144 (not e!840899))))

(declare-fun res!1025145 () Bool)

(assert (=> b!1504386 (=> (not res!1025145) (not e!840899))))

(assert (=> b!1504386 (= res!1025145 (validKeyInArray!0 (select (arr!48430 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504387 () Bool)

(declare-fun call!68127 () Bool)

(assert (=> b!1504387 (= e!840901 call!68127)))

(declare-fun bm!68124 () Bool)

(assert (=> bm!68124 (= call!68127 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139154 (Cons!34918 (select (arr!48430 a!2850) #b00000000000000000000000000000000) Nil!34919) Nil!34919)))))

(declare-fun b!1504388 () Bool)

(assert (=> b!1504388 (= e!840901 call!68127)))

(assert (= (and d!157851 (not res!1025146)) b!1504386))

(assert (= (and b!1504386 res!1025145) b!1504385))

(assert (= (and b!1504386 res!1025144) b!1504384))

(assert (= (and b!1504384 c!139154) b!1504388))

(assert (= (and b!1504384 (not c!139154)) b!1504387))

(assert (= (or b!1504388 b!1504387) bm!68124))

(declare-fun m!1387599 () Bool)

(assert (=> b!1504384 m!1387599))

(assert (=> b!1504384 m!1387599))

(declare-fun m!1387601 () Bool)

(assert (=> b!1504384 m!1387601))

(assert (=> b!1504385 m!1387599))

(assert (=> b!1504385 m!1387599))

(declare-fun m!1387603 () Bool)

(assert (=> b!1504385 m!1387603))

(assert (=> b!1504386 m!1387599))

(assert (=> b!1504386 m!1387599))

(assert (=> b!1504386 m!1387601))

(assert (=> bm!68124 m!1387599))

(declare-fun m!1387605 () Bool)

(assert (=> bm!68124 m!1387605))

(assert (=> b!1504341 d!157851))

(declare-fun b!1504412 () Bool)

(declare-fun e!840921 () Bool)

(declare-fun e!840922 () Bool)

(assert (=> b!1504412 (= e!840921 e!840922)))

(declare-fun c!139160 () Bool)

(assert (=> b!1504412 (= c!139160 (validKeyInArray!0 (select (arr!48430 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!157861 () Bool)

(declare-fun res!1025161 () Bool)

(assert (=> d!157861 (=> res!1025161 e!840921)))

(assert (=> d!157861 (= res!1025161 (bvsge #b00000000000000000000000000000000 (size!48980 a!2850)))))

(assert (=> d!157861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840921)))

(declare-fun b!1504413 () Bool)

(declare-fun e!840920 () Bool)

(declare-fun call!68133 () Bool)

(assert (=> b!1504413 (= e!840920 call!68133)))

(declare-fun b!1504414 () Bool)

(assert (=> b!1504414 (= e!840922 e!840920)))

(declare-fun lt!653691 () (_ BitVec 64))

(assert (=> b!1504414 (= lt!653691 (select (arr!48430 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50270 0))(
  ( (Unit!50271) )
))
(declare-fun lt!653692 () Unit!50270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100350 (_ BitVec 64) (_ BitVec 32)) Unit!50270)

(assert (=> b!1504414 (= lt!653692 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653691 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504414 (arrayContainsKey!0 a!2850 lt!653691 #b00000000000000000000000000000000)))

(declare-fun lt!653690 () Unit!50270)

(assert (=> b!1504414 (= lt!653690 lt!653692)))

(declare-fun res!1025160 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100350 (_ BitVec 32)) SeekEntryResult!12628)

(assert (=> b!1504414 (= res!1025160 (= (seekEntryOrOpen!0 (select (arr!48430 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12628 #b00000000000000000000000000000000)))))

(assert (=> b!1504414 (=> (not res!1025160) (not e!840920))))

(declare-fun b!1504415 () Bool)

(assert (=> b!1504415 (= e!840922 call!68133)))

(declare-fun bm!68130 () Bool)

(assert (=> bm!68130 (= call!68133 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(assert (= (and d!157861 (not res!1025161)) b!1504412))

(assert (= (and b!1504412 c!139160) b!1504414))

(assert (= (and b!1504412 (not c!139160)) b!1504415))

(assert (= (and b!1504414 res!1025160) b!1504413))

(assert (= (or b!1504413 b!1504415) bm!68130))

(assert (=> b!1504412 m!1387599))

(assert (=> b!1504412 m!1387599))

(assert (=> b!1504412 m!1387601))

(assert (=> b!1504414 m!1387599))

(declare-fun m!1387615 () Bool)

(assert (=> b!1504414 m!1387615))

(declare-fun m!1387617 () Bool)

(assert (=> b!1504414 m!1387617))

(assert (=> b!1504414 m!1387599))

(declare-fun m!1387619 () Bool)

(assert (=> b!1504414 m!1387619))

(declare-fun m!1387621 () Bool)

(assert (=> bm!68130 m!1387621))

(assert (=> b!1504340 d!157861))

(declare-fun d!157871 () Bool)

(assert (=> d!157871 (= (validKeyInArray!0 (select (arr!48430 a!2850) i!996)) (and (not (= (select (arr!48430 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48430 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504335 d!157871))

(declare-fun d!157873 () Bool)

(assert (=> d!157873 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128074 d!157873))

(declare-fun d!157877 () Bool)

(assert (=> d!157877 (= (array_inv!37458 a!2850) (bvsge (size!48980 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128074 d!157877))

(declare-fun b!1504473 () Bool)

(declare-fun e!840961 () SeekEntryResult!12628)

(assert (=> b!1504473 (= e!840961 (MissingVacant!12628 vacantBefore!10))))

(declare-fun b!1504474 () Bool)

(declare-fun e!840959 () SeekEntryResult!12628)

(assert (=> b!1504474 (= e!840959 (Found!12628 index!625))))

(declare-fun b!1504475 () Bool)

(declare-fun e!840960 () SeekEntryResult!12628)

