; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128070 () Bool)

(assert start!128070)

(declare-fun b!1504281 () Bool)

(declare-fun res!1025072 () Bool)

(declare-fun e!840859 () Bool)

(assert (=> b!1504281 (=> (not res!1025072) (not e!840859))))

(declare-datatypes ((array!100346 0))(
  ( (array!100347 (arr!48428 (Array (_ BitVec 32) (_ BitVec 64))) (size!48978 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100346)

(declare-datatypes ((List!34920 0))(
  ( (Nil!34917) (Cons!34916 (h!36313 (_ BitVec 64)) (t!49614 List!34920)) )
))
(declare-fun arrayNoDuplicates!0 (array!100346 (_ BitVec 32) List!34920) Bool)

(assert (=> b!1504281 (= res!1025072 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34917))))

(declare-fun b!1504282 () Bool)

(declare-fun res!1025071 () Bool)

(assert (=> b!1504282 (=> (not res!1025071) (not e!840859))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504282 (= res!1025071 (validKeyInArray!0 (select (arr!48428 a!2850) j!87)))))

(declare-fun b!1504283 () Bool)

(declare-fun res!1025073 () Bool)

(assert (=> b!1504283 (=> (not res!1025073) (not e!840859))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12626 0))(
  ( (MissingZero!12626 (index!52896 (_ BitVec 32))) (Found!12626 (index!52897 (_ BitVec 32))) (Intermediate!12626 (undefined!13438 Bool) (index!52898 (_ BitVec 32)) (x!134576 (_ BitVec 32))) (Undefined!12626) (MissingVacant!12626 (index!52899 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100346 (_ BitVec 32)) SeekEntryResult!12626)

(assert (=> b!1504283 (= res!1025073 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48428 a!2850) j!87) a!2850 mask!2661) (Found!12626 j!87)))))

(declare-fun b!1504284 () Bool)

(declare-fun res!1025076 () Bool)

(assert (=> b!1504284 (=> (not res!1025076) (not e!840859))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1504284 (= res!1025076 (validKeyInArray!0 (select (arr!48428 a!2850) i!996)))))

(declare-fun res!1025074 () Bool)

(assert (=> start!128070 (=> (not res!1025074) (not e!840859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128070 (= res!1025074 (validMask!0 mask!2661))))

(assert (=> start!128070 e!840859))

(assert (=> start!128070 true))

(declare-fun array_inv!37456 (array!100346) Bool)

(assert (=> start!128070 (array_inv!37456 a!2850)))

(declare-fun b!1504285 () Bool)

(declare-fun res!1025070 () Bool)

(assert (=> b!1504285 (=> (not res!1025070) (not e!840859))))

(assert (=> b!1504285 (= res!1025070 (not (= (select (arr!48428 a!2850) index!625) (select (arr!48428 a!2850) j!87))))))

(declare-fun b!1504286 () Bool)

(declare-fun lt!653659 () (_ BitVec 32))

(assert (=> b!1504286 (= e!840859 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (or (bvslt lt!653659 #b00000000000000000000000000000000) (bvsge lt!653659 (size!48978 a!2850)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504286 (= lt!653659 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504287 () Bool)

(declare-fun res!1025069 () Bool)

(assert (=> b!1504287 (=> (not res!1025069) (not e!840859))))

(assert (=> b!1504287 (= res!1025069 (and (= (size!48978 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48978 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48978 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504288 () Bool)

(declare-fun res!1025077 () Bool)

(assert (=> b!1504288 (=> (not res!1025077) (not e!840859))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504288 (= res!1025077 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48978 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48978 a!2850)) (= (select (arr!48428 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48428 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48978 a!2850))))))

(declare-fun b!1504289 () Bool)

(declare-fun res!1025075 () Bool)

(assert (=> b!1504289 (=> (not res!1025075) (not e!840859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100346 (_ BitVec 32)) Bool)

(assert (=> b!1504289 (= res!1025075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128070 res!1025074) b!1504287))

(assert (= (and b!1504287 res!1025069) b!1504284))

(assert (= (and b!1504284 res!1025076) b!1504282))

(assert (= (and b!1504282 res!1025071) b!1504289))

(assert (= (and b!1504289 res!1025075) b!1504281))

(assert (= (and b!1504281 res!1025072) b!1504288))

(assert (= (and b!1504288 res!1025077) b!1504283))

(assert (= (and b!1504283 res!1025073) b!1504285))

(assert (= (and b!1504285 res!1025070) b!1504286))

(declare-fun m!1387495 () Bool)

(assert (=> b!1504285 m!1387495))

(declare-fun m!1387497 () Bool)

(assert (=> b!1504285 m!1387497))

(declare-fun m!1387499 () Bool)

(assert (=> b!1504288 m!1387499))

(declare-fun m!1387501 () Bool)

(assert (=> b!1504288 m!1387501))

(declare-fun m!1387503 () Bool)

(assert (=> b!1504288 m!1387503))

(declare-fun m!1387505 () Bool)

(assert (=> start!128070 m!1387505))

(declare-fun m!1387507 () Bool)

(assert (=> start!128070 m!1387507))

(declare-fun m!1387509 () Bool)

(assert (=> b!1504284 m!1387509))

(assert (=> b!1504284 m!1387509))

(declare-fun m!1387511 () Bool)

(assert (=> b!1504284 m!1387511))

(assert (=> b!1504283 m!1387497))

(assert (=> b!1504283 m!1387497))

(declare-fun m!1387513 () Bool)

(assert (=> b!1504283 m!1387513))

(assert (=> b!1504282 m!1387497))

(assert (=> b!1504282 m!1387497))

(declare-fun m!1387515 () Bool)

(assert (=> b!1504282 m!1387515))

(declare-fun m!1387517 () Bool)

(assert (=> b!1504286 m!1387517))

(declare-fun m!1387519 () Bool)

(assert (=> b!1504281 m!1387519))

(declare-fun m!1387521 () Bool)

(assert (=> b!1504289 m!1387521))

(push 1)

(assert (not b!1504283))

(assert (not b!1504284))

(assert (not b!1504282))

(assert (not b!1504281))

(assert (not b!1504286))

(assert (not b!1504289))

(assert (not start!128070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157843 () Bool)

(assert (=> d!157843 (= (validKeyInArray!0 (select (arr!48428 a!2850) i!996)) (and (not (= (select (arr!48428 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48428 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504284 d!157843))

(declare-fun bm!68123 () Bool)

(declare-fun call!68126 () Bool)

(assert (=> bm!68123 (= call!68126 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1504381 () Bool)

(declare-fun e!840897 () Bool)

(declare-fun e!840896 () Bool)

(assert (=> b!1504381 (= e!840897 e!840896)))

(declare-fun lt!653682 () (_ BitVec 64))

(assert (=> b!1504381 (= lt!653682 (select (arr!48428 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50268 0))(
  ( (Unit!50269) )
))
(declare-fun lt!653683 () Unit!50268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100346 (_ BitVec 64) (_ BitVec 32)) Unit!50268)

(assert (=> b!1504381 (= lt!653683 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653682 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1504381 (arrayContainsKey!0 a!2850 lt!653682 #b00000000000000000000000000000000)))

(declare-fun lt!653681 () Unit!50268)

(assert (=> b!1504381 (= lt!653681 lt!653683)))

(declare-fun res!1025143 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100346 (_ BitVec 32)) SeekEntryResult!12626)

(assert (=> b!1504381 (= res!1025143 (= (seekEntryOrOpen!0 (select (arr!48428 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12626 #b00000000000000000000000000000000)))))

(assert (=> b!1504381 (=> (not res!1025143) (not e!840896))))

(declare-fun b!1504382 () Bool)

(assert (=> b!1504382 (= e!840896 call!68126)))

(declare-fun b!1504383 () Bool)

(declare-fun e!840895 () Bool)

(assert (=> b!1504383 (= e!840895 e!840897)))

(declare-fun c!139153 () Bool)

(assert (=> b!1504383 (= c!139153 (validKeyInArray!0 (select (arr!48428 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504380 () Bool)

(assert (=> b!1504380 (= e!840897 call!68126)))

(declare-fun d!157845 () Bool)

(declare-fun res!1025142 () Bool)

(assert (=> d!157845 (=> res!1025142 e!840895)))

(assert (=> d!157845 (= res!1025142 (bvsge #b00000000000000000000000000000000 (size!48978 a!2850)))))

(assert (=> d!157845 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840895)))

(assert (= (and d!157845 (not res!1025142)) b!1504383))

(assert (= (and b!1504383 c!139153) b!1504381))

(assert (= (and b!1504383 (not c!139153)) b!1504380))

(assert (= (and b!1504381 res!1025143) b!1504382))

(assert (= (or b!1504382 b!1504380) bm!68123))

(declare-fun m!1387587 () Bool)

(assert (=> bm!68123 m!1387587))

(declare-fun m!1387589 () Bool)

(assert (=> b!1504381 m!1387589))

(declare-fun m!1387591 () Bool)

(assert (=> b!1504381 m!1387591))

(declare-fun m!1387593 () Bool)

(assert (=> b!1504381 m!1387593))

(assert (=> b!1504381 m!1387589))

(declare-fun m!1387595 () Bool)

(assert (=> b!1504381 m!1387595))

(assert (=> b!1504383 m!1387589))

(assert (=> b!1504383 m!1387589))

(declare-fun m!1387597 () Bool)

(assert (=> b!1504383 m!1387597))

(assert (=> b!1504289 d!157845))

(declare-fun d!157859 () Bool)

(assert (=> d!157859 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128070 d!157859))

(declare-fun d!157867 () Bool)

(assert (=> d!157867 (= (array_inv!37456 a!2850) (bvsge (size!48978 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128070 d!157867))

(declare-fun b!1504440 () Bool)

(declare-fun e!840938 () SeekEntryResult!12626)

(assert (=> b!1504440 (= e!840938 (Found!12626 index!625))))

(declare-fun b!1504441 () Bool)

(declare-fun e!840940 () SeekEntryResult!12626)

(assert (=> b!1504441 (= e!840940 Undefined!12626)))

(declare-fun b!1504442 () Bool)

(declare-fun c!139171 () Bool)

(declare-fun lt!653710 () (_ BitVec 64))

(assert (=> b!1504442 (= c!139171 (= lt!653710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840939 () SeekEntryResult!12626)

(assert (=> b!1504442 (= e!840938 e!840939)))

(declare-fun lt!653709 () SeekEntryResult!12626)

(declare-fun d!157869 () Bool)

(assert (=> d!157869 (and (or (is-Undefined!12626 lt!653709) (not (is-Found!12626 lt!653709)) (and (bvsge (index!52897 lt!653709) #b00000000000000000000000000000000) (bvslt (index!52897 lt!653709) (size!48978 a!2850)))) (or (is-Undefined!12626 lt!653709) (is-Found!12626 lt!653709) (not (is-MissingVacant!12626 lt!653709)) (not (= (index!52899 lt!653709) vacantBefore!10)) (and (bvsge (index!52899 lt!653709) #b00000000000000000000000000000000) (bvslt (index!52899 lt!653709) (size!48978 a!2850)))) (or (is-Undefined!12626 lt!653709) (ite (is-Found!12626 lt!653709) (= (select (arr!48428 a!2850) (index!52897 lt!653709)) (select (arr!48428 a!2850) j!87)) (and (is-MissingVacant!12626 lt!653709) (= (index!52899 lt!653709) vacantBefore!10) (= (select (arr!48428 a!2850) (index!52899 lt!653709)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157869 (= lt!653709 e!840940)))

(declare-fun c!139172 () Bool)

(assert (=> d!157869 (= c!139172 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157869 (= lt!653710 (select (arr!48428 a!2850) index!625))))

(assert (=> d!157869 (validMask!0 mask!2661)))

(assert (=> d!157869 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48428 a!2850) j!87) a!2850 mask!2661) lt!653709)))

(declare-fun b!1504443 () Bool)

(assert (=> b!1504443 (= e!840939 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48428 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1504444 () Bool)

(assert (=> b!1504444 (= e!840940 e!840938)))

(declare-fun c!139170 () Bool)

(assert (=> b!1504444 (= c!139170 (= lt!653710 (select (arr!48428 a!2850) j!87)))))

(declare-fun b!1504445 () Bool)

(assert (=> b!1504445 (= e!840939 (MissingVacant!12626 vacantBefore!10))))

(assert (= (and d!157869 c!139172) b!1504441))

(assert (= (and d!157869 (not c!139172)) b!1504444))

(assert (= (and b!1504444 c!139170) b!1504440))

(assert (= (and b!1504444 (not c!139170)) b!1504442))

(assert (= (and b!1504442 c!139171) b!1504445))

(assert (= (and b!1504442 (not c!139171)) b!1504443))

(declare-fun m!1387633 () Bool)

(assert (=> d!157869 m!1387633))

(declare-fun m!1387635 () Bool)

(assert (=> d!157869 m!1387635))

(assert (=> d!157869 m!1387495))

(assert (=> d!157869 m!1387505))

(assert (=> b!1504443 m!1387517))

(assert (=> b!1504443 m!1387517))

(assert (=> b!1504443 m!1387497))

(declare-fun m!1387637 () Bool)

(assert (=> b!1504443 m!1387637))

(assert (=> b!1504283 d!157869))

(declare-fun d!157881 () Bool)

(declare-fun res!1025176 () Bool)

(declare-fun e!840949 () Bool)

(assert (=> d!157881 (=> res!1025176 e!840949)))

(assert (=> d!157881 (= res!1025176 (bvsge #b00000000000000000000000000000000 (size!48978 a!2850)))))

(assert (=> d!157881 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34917) e!840949)))

(declare-fun b!1504456 () Bool)

(declare-fun e!840952 () Bool)

(declare-fun call!68139 () Bool)

(assert (=> b!1504456 (= e!840952 call!68139)))

(declare-fun b!1504457 () Bool)

(declare-fun e!840950 () Bool)

(assert (=> b!1504457 (= e!840950 e!840952)))

(declare-fun c!139175 () Bool)

(assert (=> b!1504457 (= c!139175 (validKeyInArray!0 (select (arr!48428 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1504458 () Bool)

(assert (=> b!1504458 (= e!840949 e!840950)))

(declare-fun res!1025174 () Bool)

(assert (=> b!1504458 (=> (not res!1025174) (not e!840950))))

(declare-fun e!840951 () Bool)

(assert (=> b!1504458 (= res!1025174 (not e!840951))))

(declare-fun res!1025175 () Bool)

(assert (=> b!1504458 (=> (not res!1025175) (not e!840951))))

(assert (=> b!1504458 (= res!1025175 (validKeyInArray!0 (select (arr!48428 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68136 () Bool)

(assert (=> bm!68136 (= call!68139 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139175 (Cons!34916 (select (arr!48428 a!2850) #b00000000000000000000000000000000) Nil!34917) Nil!34917)))))

(declare-fun b!1504459 () Bool)

(assert (=> b!1504459 (= e!840952 call!68139)))

(declare-fun b!1504460 () Bool)

(declare-fun contains!9951 (List!34920 (_ BitVec 64)) Bool)

(assert (=> b!1504460 (= e!840951 (contains!9951 Nil!34917 (select (arr!48428 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157881 (not res!1025176)) b!1504458))

(assert (= (and b!1504458 res!1025175) b!1504460))

(assert (= (and b!1504458 res!1025174) b!1504457))

(assert (= (and b!1504457 c!139175) b!1504459))

(assert (= (and b!1504457 (not c!139175)) b!1504456))

(assert (= (or b!1504459 b!1504456) bm!68136))

(assert (=> b!1504457 m!1387589))

(assert (=> b!1504457 m!1387589))

(assert (=> b!1504457 m!1387597))

(assert (=> b!1504458 m!1387589))

(assert (=> b!1504458 m!1387589))

(assert (=> b!1504458 m!1387597))

(assert (=> bm!68136 m!1387589))

(declare-fun m!1387639 () Bool)

(assert (=> bm!68136 m!1387639))

(assert (=> b!1504460 m!1387589))

(assert (=> b!1504460 m!1387589))

(declare-fun m!1387641 () Bool)

(assert (=> b!1504460 m!1387641))

(assert (=> b!1504281 d!157881))

(declare-fun d!157883 () Bool)

(assert (=> d!157883 (= (validKeyInArray!0 (select (arr!48428 a!2850) j!87)) (and (not (= (select (arr!48428 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48428 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1504282 d!157883))

(declare-fun d!157885 () Bool)

(declare-fun lt!653717 () (_ BitVec 32))

(assert (=> d!157885 (and (bvsge lt!653717 #b00000000000000000000000000000000) (bvslt lt!653717 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157885 (= lt!653717 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157885 (validMask!0 mask!2661)))

(assert (=> d!157885 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653717)))

(declare-fun bs!43197 () Bool)

(assert (= bs!43197 d!157885))

(declare-fun m!1387643 () Bool)

(assert (=> bs!43197 m!1387643))

(assert (=> bs!43197 m!1387505))

(assert (=> b!1504286 d!157885))

