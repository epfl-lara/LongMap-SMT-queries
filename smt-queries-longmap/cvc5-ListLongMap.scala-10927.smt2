; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127824 () Bool)

(assert start!127824)

(declare-fun res!1023215 () Bool)

(declare-fun e!840174 () Bool)

(assert (=> start!127824 (=> (not res!1023215) (not e!840174))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127824 (= res!1023215 (validMask!0 mask!2661))))

(assert (=> start!127824 e!840174))

(assert (=> start!127824 true))

(declare-datatypes ((array!100205 0))(
  ( (array!100206 (arr!48362 (Array (_ BitVec 32) (_ BitVec 64))) (size!48912 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100205)

(declare-fun array_inv!37390 (array!100205) Bool)

(assert (=> start!127824 (array_inv!37390 a!2850)))

(declare-fun b!1502137 () Bool)

(declare-fun res!1023218 () Bool)

(assert (=> b!1502137 (=> (not res!1023218) (not e!840174))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502137 (= res!1023218 (validKeyInArray!0 (select (arr!48362 a!2850) i!996)))))

(declare-fun b!1502138 () Bool)

(declare-fun res!1023219 () Bool)

(assert (=> b!1502138 (=> (not res!1023219) (not e!840174))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1502138 (= res!1023219 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48912 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48912 a!2850)) (= (select (arr!48362 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48362 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48912 a!2850))))))

(declare-fun b!1502139 () Bool)

(declare-fun res!1023213 () Bool)

(assert (=> b!1502139 (=> (not res!1023213) (not e!840174))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12560 0))(
  ( (MissingZero!12560 (index!52632 (_ BitVec 32))) (Found!12560 (index!52633 (_ BitVec 32))) (Intermediate!12560 (undefined!13372 Bool) (index!52634 (_ BitVec 32)) (x!134322 (_ BitVec 32))) (Undefined!12560) (MissingVacant!12560 (index!52635 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100205 (_ BitVec 32)) SeekEntryResult!12560)

(assert (=> b!1502139 (= res!1023213 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48362 a!2850) j!87) a!2850 mask!2661) (Found!12560 j!87)))))

(declare-fun b!1502140 () Bool)

(declare-fun res!1023220 () Bool)

(assert (=> b!1502140 (=> (not res!1023220) (not e!840174))))

(assert (=> b!1502140 (= res!1023220 (and (= (size!48912 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48912 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48912 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502141 () Bool)

(declare-fun res!1023217 () Bool)

(assert (=> b!1502141 (=> (not res!1023217) (not e!840174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100205 (_ BitVec 32)) Bool)

(assert (=> b!1502141 (= res!1023217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502142 () Bool)

(declare-fun res!1023216 () Bool)

(assert (=> b!1502142 (=> (not res!1023216) (not e!840174))))

(declare-datatypes ((List!34854 0))(
  ( (Nil!34851) (Cons!34850 (h!36247 (_ BitVec 64)) (t!49548 List!34854)) )
))
(declare-fun arrayNoDuplicates!0 (array!100205 (_ BitVec 32) List!34854) Bool)

(assert (=> b!1502142 (= res!1023216 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34851))))

(declare-fun b!1502143 () Bool)

(assert (=> b!1502143 (= e!840174 (and (= (select (arr!48362 a!2850) index!625) (select (arr!48362 a!2850) j!87)) (not (= j!87 index!625))))))

(declare-fun b!1502144 () Bool)

(declare-fun res!1023214 () Bool)

(assert (=> b!1502144 (=> (not res!1023214) (not e!840174))))

(assert (=> b!1502144 (= res!1023214 (validKeyInArray!0 (select (arr!48362 a!2850) j!87)))))

(assert (= (and start!127824 res!1023215) b!1502140))

(assert (= (and b!1502140 res!1023220) b!1502137))

(assert (= (and b!1502137 res!1023218) b!1502144))

(assert (= (and b!1502144 res!1023214) b!1502141))

(assert (= (and b!1502141 res!1023217) b!1502142))

(assert (= (and b!1502142 res!1023216) b!1502138))

(assert (= (and b!1502138 res!1023219) b!1502139))

(assert (= (and b!1502139 res!1023213) b!1502143))

(declare-fun m!1385443 () Bool)

(assert (=> b!1502139 m!1385443))

(assert (=> b!1502139 m!1385443))

(declare-fun m!1385445 () Bool)

(assert (=> b!1502139 m!1385445))

(declare-fun m!1385447 () Bool)

(assert (=> b!1502137 m!1385447))

(assert (=> b!1502137 m!1385447))

(declare-fun m!1385449 () Bool)

(assert (=> b!1502137 m!1385449))

(declare-fun m!1385451 () Bool)

(assert (=> b!1502141 m!1385451))

(declare-fun m!1385453 () Bool)

(assert (=> b!1502142 m!1385453))

(assert (=> b!1502144 m!1385443))

(assert (=> b!1502144 m!1385443))

(declare-fun m!1385455 () Bool)

(assert (=> b!1502144 m!1385455))

(declare-fun m!1385457 () Bool)

(assert (=> b!1502138 m!1385457))

(declare-fun m!1385459 () Bool)

(assert (=> b!1502138 m!1385459))

(declare-fun m!1385461 () Bool)

(assert (=> b!1502138 m!1385461))

(declare-fun m!1385463 () Bool)

(assert (=> start!127824 m!1385463))

(declare-fun m!1385465 () Bool)

(assert (=> start!127824 m!1385465))

(declare-fun m!1385467 () Bool)

(assert (=> b!1502143 m!1385467))

(assert (=> b!1502143 m!1385443))

(push 1)

(assert (not start!127824))

(assert (not b!1502137))

(assert (not b!1502141))

(assert (not b!1502142))

(assert (not b!1502139))

(assert (not b!1502144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157665 () Bool)

(declare-fun res!1023292 () Bool)

(declare-fun e!840219 () Bool)

(assert (=> d!157665 (=> res!1023292 e!840219)))

(assert (=> d!157665 (= res!1023292 (bvsge #b00000000000000000000000000000000 (size!48912 a!2850)))))

(assert (=> d!157665 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34851) e!840219)))

(declare-fun b!1502230 () Bool)

(declare-fun e!840217 () Bool)

(declare-fun e!840220 () Bool)

(assert (=> b!1502230 (= e!840217 e!840220)))

(declare-fun c!139004 () Bool)

(assert (=> b!1502230 (= c!139004 (validKeyInArray!0 (select (arr!48362 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502231 () Bool)

(declare-fun call!68076 () Bool)

(assert (=> b!1502231 (= e!840220 call!68076)))

(declare-fun b!1502232 () Bool)

(assert (=> b!1502232 (= e!840220 call!68076)))

(declare-fun b!1502233 () Bool)

(declare-fun e!840218 () Bool)

(declare-fun contains!9942 (List!34854 (_ BitVec 64)) Bool)

(assert (=> b!1502233 (= e!840218 (contains!9942 Nil!34851 (select (arr!48362 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502234 () Bool)

(assert (=> b!1502234 (= e!840219 e!840217)))

(declare-fun res!1023290 () Bool)

(assert (=> b!1502234 (=> (not res!1023290) (not e!840217))))

(assert (=> b!1502234 (= res!1023290 (not e!840218))))

(declare-fun res!1023291 () Bool)

(assert (=> b!1502234 (=> (not res!1023291) (not e!840218))))

(assert (=> b!1502234 (= res!1023291 (validKeyInArray!0 (select (arr!48362 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68073 () Bool)

(assert (=> bm!68073 (= call!68076 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139004 (Cons!34850 (select (arr!48362 a!2850) #b00000000000000000000000000000000) Nil!34851) Nil!34851)))))

(assert (= (and d!157665 (not res!1023292)) b!1502234))

(assert (= (and b!1502234 res!1023291) b!1502233))

(assert (= (and b!1502234 res!1023290) b!1502230))

(assert (= (and b!1502230 c!139004) b!1502232))

(assert (= (and b!1502230 (not c!139004)) b!1502231))

(assert (= (or b!1502232 b!1502231) bm!68073))

(declare-fun m!1385537 () Bool)

(assert (=> b!1502230 m!1385537))

(assert (=> b!1502230 m!1385537))

(declare-fun m!1385539 () Bool)

(assert (=> b!1502230 m!1385539))

(assert (=> b!1502233 m!1385537))

(assert (=> b!1502233 m!1385537))

(declare-fun m!1385541 () Bool)

(assert (=> b!1502233 m!1385541))

(assert (=> b!1502234 m!1385537))

(assert (=> b!1502234 m!1385537))

(assert (=> b!1502234 m!1385539))

(assert (=> bm!68073 m!1385537))

(declare-fun m!1385543 () Bool)

(assert (=> bm!68073 m!1385543))

(assert (=> b!1502142 d!157665))

(declare-fun d!157671 () Bool)

(assert (=> d!157671 (= (validKeyInArray!0 (select (arr!48362 a!2850) i!996)) (and (not (= (select (arr!48362 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48362 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502137 d!157671))

(declare-fun d!157673 () Bool)

(assert (=> d!157673 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127824 d!157673))

(declare-fun d!157679 () Bool)

(assert (=> d!157679 (= (array_inv!37390 a!2850) (bvsge (size!48912 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127824 d!157679))

(declare-fun d!157681 () Bool)

(assert (=> d!157681 (= (validKeyInArray!0 (select (arr!48362 a!2850) j!87)) (and (not (= (select (arr!48362 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48362 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502144 d!157681))

(declare-fun b!1502298 () Bool)

(declare-fun e!840258 () SeekEntryResult!12560)

(assert (=> b!1502298 (= e!840258 (Found!12560 index!625))))

(declare-fun lt!653343 () SeekEntryResult!12560)

(declare-fun d!157683 () Bool)

(assert (=> d!157683 (and (or (is-Undefined!12560 lt!653343) (not (is-Found!12560 lt!653343)) (and (bvsge (index!52633 lt!653343) #b00000000000000000000000000000000) (bvslt (index!52633 lt!653343) (size!48912 a!2850)))) (or (is-Undefined!12560 lt!653343) (is-Found!12560 lt!653343) (not (is-MissingVacant!12560 lt!653343)) (not (= (index!52635 lt!653343) vacantBefore!10)) (and (bvsge (index!52635 lt!653343) #b00000000000000000000000000000000) (bvslt (index!52635 lt!653343) (size!48912 a!2850)))) (or (is-Undefined!12560 lt!653343) (ite (is-Found!12560 lt!653343) (= (select (arr!48362 a!2850) (index!52633 lt!653343)) (select (arr!48362 a!2850) j!87)) (and (is-MissingVacant!12560 lt!653343) (= (index!52635 lt!653343) vacantBefore!10) (= (select (arr!48362 a!2850) (index!52635 lt!653343)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!840259 () SeekEntryResult!12560)

(assert (=> d!157683 (= lt!653343 e!840259)))

(declare-fun c!139032 () Bool)

(assert (=> d!157683 (= c!139032 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!653344 () (_ BitVec 64))

(assert (=> d!157683 (= lt!653344 (select (arr!48362 a!2850) index!625))))

(assert (=> d!157683 (validMask!0 mask!2661)))

(assert (=> d!157683 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48362 a!2850) j!87) a!2850 mask!2661) lt!653343)))

(declare-fun b!1502299 () Bool)

(declare-fun c!139034 () Bool)

(assert (=> b!1502299 (= c!139034 (= lt!653344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840257 () SeekEntryResult!12560)

(assert (=> b!1502299 (= e!840258 e!840257)))

(declare-fun b!1502300 () Bool)

(assert (=> b!1502300 (= e!840259 Undefined!12560)))

(declare-fun b!1502301 () Bool)

(assert (=> b!1502301 (= e!840259 e!840258)))

(declare-fun c!139033 () Bool)

(assert (=> b!1502301 (= c!139033 (= lt!653344 (select (arr!48362 a!2850) j!87)))))

(declare-fun b!1502302 () Bool)

(assert (=> b!1502302 (= e!840257 (MissingVacant!12560 vacantBefore!10))))

(declare-fun b!1502303 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502303 (= e!840257 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48362 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and d!157683 c!139032) b!1502300))

(assert (= (and d!157683 (not c!139032)) b!1502301))

(assert (= (and b!1502301 c!139033) b!1502298))

(assert (= (and b!1502301 (not c!139033)) b!1502299))

(assert (= (and b!1502299 c!139034) b!1502302))

(assert (= (and b!1502299 (not c!139034)) b!1502303))

(declare-fun m!1385569 () Bool)

(assert (=> d!157683 m!1385569))

(declare-fun m!1385571 () Bool)

(assert (=> d!157683 m!1385571))

(assert (=> d!157683 m!1385467))

(assert (=> d!157683 m!1385463))

(declare-fun m!1385573 () Bool)

(assert (=> b!1502303 m!1385573))

(assert (=> b!1502303 m!1385573))

