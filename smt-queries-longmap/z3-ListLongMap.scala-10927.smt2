; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127826 () Bool)

(assert start!127826)

(declare-fun b!1502161 () Bool)

(declare-fun res!1023238 () Bool)

(declare-fun e!840181 () Bool)

(assert (=> b!1502161 (=> (not res!1023238) (not e!840181))))

(declare-datatypes ((array!100207 0))(
  ( (array!100208 (arr!48363 (Array (_ BitVec 32) (_ BitVec 64))) (size!48913 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100207)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100207 (_ BitVec 32)) Bool)

(assert (=> b!1502161 (= res!1023238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502162 () Bool)

(declare-fun res!1023242 () Bool)

(assert (=> b!1502162 (=> (not res!1023242) (not e!840181))))

(declare-datatypes ((List!34855 0))(
  ( (Nil!34852) (Cons!34851 (h!36248 (_ BitVec 64)) (t!49549 List!34855)) )
))
(declare-fun arrayNoDuplicates!0 (array!100207 (_ BitVec 32) List!34855) Bool)

(assert (=> b!1502162 (= res!1023242 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34852))))

(declare-fun b!1502163 () Bool)

(declare-fun res!1023240 () Bool)

(assert (=> b!1502163 (=> (not res!1023240) (not e!840181))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12561 0))(
  ( (MissingZero!12561 (index!52636 (_ BitVec 32))) (Found!12561 (index!52637 (_ BitVec 32))) (Intermediate!12561 (undefined!13373 Bool) (index!52638 (_ BitVec 32)) (x!134323 (_ BitVec 32))) (Undefined!12561) (MissingVacant!12561 (index!52639 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100207 (_ BitVec 32)) SeekEntryResult!12561)

(assert (=> b!1502163 (= res!1023240 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48363 a!2850) j!87) a!2850 mask!2661) (Found!12561 j!87)))))

(declare-fun b!1502164 () Bool)

(declare-fun res!1023243 () Bool)

(assert (=> b!1502164 (=> (not res!1023243) (not e!840181))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502164 (= res!1023243 (and (= (size!48913 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48913 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48913 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502165 () Bool)

(declare-fun res!1023241 () Bool)

(assert (=> b!1502165 (=> (not res!1023241) (not e!840181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502165 (= res!1023241 (validKeyInArray!0 (select (arr!48363 a!2850) i!996)))))

(declare-fun res!1023239 () Bool)

(assert (=> start!127826 (=> (not res!1023239) (not e!840181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127826 (= res!1023239 (validMask!0 mask!2661))))

(assert (=> start!127826 e!840181))

(assert (=> start!127826 true))

(declare-fun array_inv!37391 (array!100207) Bool)

(assert (=> start!127826 (array_inv!37391 a!2850)))

(declare-fun b!1502166 () Bool)

(declare-fun res!1023237 () Bool)

(assert (=> b!1502166 (=> (not res!1023237) (not e!840181))))

(assert (=> b!1502166 (= res!1023237 (validKeyInArray!0 (select (arr!48363 a!2850) j!87)))))

(declare-fun b!1502167 () Bool)

(declare-fun res!1023244 () Bool)

(assert (=> b!1502167 (=> (not res!1023244) (not e!840181))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502167 (= res!1023244 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48913 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48913 a!2850)) (= (select (arr!48363 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48363 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48913 a!2850))))))

(declare-fun b!1502168 () Bool)

(assert (=> b!1502168 (= e!840181 (and (= (select (arr!48363 a!2850) index!625) (select (arr!48363 a!2850) j!87)) (not (= j!87 index!625))))))

(assert (= (and start!127826 res!1023239) b!1502164))

(assert (= (and b!1502164 res!1023243) b!1502165))

(assert (= (and b!1502165 res!1023241) b!1502166))

(assert (= (and b!1502166 res!1023237) b!1502161))

(assert (= (and b!1502161 res!1023238) b!1502162))

(assert (= (and b!1502162 res!1023242) b!1502167))

(assert (= (and b!1502167 res!1023244) b!1502163))

(assert (= (and b!1502163 res!1023240) b!1502168))

(declare-fun m!1385469 () Bool)

(assert (=> b!1502162 m!1385469))

(declare-fun m!1385471 () Bool)

(assert (=> b!1502163 m!1385471))

(assert (=> b!1502163 m!1385471))

(declare-fun m!1385473 () Bool)

(assert (=> b!1502163 m!1385473))

(declare-fun m!1385475 () Bool)

(assert (=> b!1502161 m!1385475))

(assert (=> b!1502166 m!1385471))

(assert (=> b!1502166 m!1385471))

(declare-fun m!1385477 () Bool)

(assert (=> b!1502166 m!1385477))

(declare-fun m!1385479 () Bool)

(assert (=> b!1502165 m!1385479))

(assert (=> b!1502165 m!1385479))

(declare-fun m!1385481 () Bool)

(assert (=> b!1502165 m!1385481))

(declare-fun m!1385483 () Bool)

(assert (=> b!1502168 m!1385483))

(assert (=> b!1502168 m!1385471))

(declare-fun m!1385485 () Bool)

(assert (=> b!1502167 m!1385485))

(declare-fun m!1385487 () Bool)

(assert (=> b!1502167 m!1385487))

(declare-fun m!1385489 () Bool)

(assert (=> b!1502167 m!1385489))

(declare-fun m!1385491 () Bool)

(assert (=> start!127826 m!1385491))

(declare-fun m!1385493 () Bool)

(assert (=> start!127826 m!1385493))

(check-sat (not b!1502162) (not b!1502163) (not b!1502165) (not start!127826) (not b!1502166) (not b!1502161))
(check-sat)
(get-model)

(declare-fun d!157657 () Bool)

(assert (=> d!157657 (= (validKeyInArray!0 (select (arr!48363 a!2850) i!996)) (and (not (= (select (arr!48363 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48363 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502165 d!157657))

(declare-fun d!157659 () Bool)

(assert (=> d!157659 (= (validKeyInArray!0 (select (arr!48363 a!2850) j!87)) (and (not (= (select (arr!48363 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48363 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502166 d!157659))

(declare-fun d!157661 () Bool)

(declare-fun res!1023274 () Bool)

(declare-fun e!840195 () Bool)

(assert (=> d!157661 (=> res!1023274 e!840195)))

(assert (=> d!157661 (= res!1023274 (bvsge #b00000000000000000000000000000000 (size!48913 a!2850)))))

(assert (=> d!157661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!840195)))

(declare-fun b!1502201 () Bool)

(declare-fun e!840196 () Bool)

(assert (=> b!1502201 (= e!840195 e!840196)))

(declare-fun c!138998 () Bool)

(assert (=> b!1502201 (= c!138998 (validKeyInArray!0 (select (arr!48363 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68067 () Bool)

(declare-fun call!68070 () Bool)

(assert (=> bm!68067 (= call!68070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1502202 () Bool)

(declare-fun e!840194 () Bool)

(assert (=> b!1502202 (= e!840196 e!840194)))

(declare-fun lt!653326 () (_ BitVec 64))

(assert (=> b!1502202 (= lt!653326 (select (arr!48363 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50256 0))(
  ( (Unit!50257) )
))
(declare-fun lt!653325 () Unit!50256)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100207 (_ BitVec 64) (_ BitVec 32)) Unit!50256)

(assert (=> b!1502202 (= lt!653325 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653326 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1502202 (arrayContainsKey!0 a!2850 lt!653326 #b00000000000000000000000000000000)))

(declare-fun lt!653324 () Unit!50256)

(assert (=> b!1502202 (= lt!653324 lt!653325)))

(declare-fun res!1023273 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100207 (_ BitVec 32)) SeekEntryResult!12561)

(assert (=> b!1502202 (= res!1023273 (= (seekEntryOrOpen!0 (select (arr!48363 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12561 #b00000000000000000000000000000000)))))

(assert (=> b!1502202 (=> (not res!1023273) (not e!840194))))

(declare-fun b!1502203 () Bool)

(assert (=> b!1502203 (= e!840194 call!68070)))

(declare-fun b!1502204 () Bool)

(assert (=> b!1502204 (= e!840196 call!68070)))

(assert (= (and d!157661 (not res!1023274)) b!1502201))

(assert (= (and b!1502201 c!138998) b!1502202))

(assert (= (and b!1502201 (not c!138998)) b!1502204))

(assert (= (and b!1502202 res!1023273) b!1502203))

(assert (= (or b!1502203 b!1502204) bm!68067))

(declare-fun m!1385521 () Bool)

(assert (=> b!1502201 m!1385521))

(assert (=> b!1502201 m!1385521))

(declare-fun m!1385523 () Bool)

(assert (=> b!1502201 m!1385523))

(declare-fun m!1385525 () Bool)

(assert (=> bm!68067 m!1385525))

(assert (=> b!1502202 m!1385521))

(declare-fun m!1385527 () Bool)

(assert (=> b!1502202 m!1385527))

(declare-fun m!1385529 () Bool)

(assert (=> b!1502202 m!1385529))

(assert (=> b!1502202 m!1385521))

(declare-fun m!1385531 () Bool)

(assert (=> b!1502202 m!1385531))

(assert (=> b!1502161 d!157661))

(declare-fun b!1502215 () Bool)

(declare-fun e!840206 () Bool)

(declare-fun call!68073 () Bool)

(assert (=> b!1502215 (= e!840206 call!68073)))

(declare-fun d!157663 () Bool)

(declare-fun res!1023282 () Bool)

(declare-fun e!840205 () Bool)

(assert (=> d!157663 (=> res!1023282 e!840205)))

(assert (=> d!157663 (= res!1023282 (bvsge #b00000000000000000000000000000000 (size!48913 a!2850)))))

(assert (=> d!157663 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34852) e!840205)))

(declare-fun b!1502216 () Bool)

(assert (=> b!1502216 (= e!840206 call!68073)))

(declare-fun b!1502217 () Bool)

(declare-fun e!840208 () Bool)

(assert (=> b!1502217 (= e!840205 e!840208)))

(declare-fun res!1023281 () Bool)

(assert (=> b!1502217 (=> (not res!1023281) (not e!840208))))

(declare-fun e!840207 () Bool)

(assert (=> b!1502217 (= res!1023281 (not e!840207))))

(declare-fun res!1023283 () Bool)

(assert (=> b!1502217 (=> (not res!1023283) (not e!840207))))

(assert (=> b!1502217 (= res!1023283 (validKeyInArray!0 (select (arr!48363 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502218 () Bool)

(assert (=> b!1502218 (= e!840208 e!840206)))

(declare-fun c!139001 () Bool)

(assert (=> b!1502218 (= c!139001 (validKeyInArray!0 (select (arr!48363 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502219 () Bool)

(declare-fun contains!9941 (List!34855 (_ BitVec 64)) Bool)

(assert (=> b!1502219 (= e!840207 (contains!9941 Nil!34852 (select (arr!48363 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68070 () Bool)

(assert (=> bm!68070 (= call!68073 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139001 (Cons!34851 (select (arr!48363 a!2850) #b00000000000000000000000000000000) Nil!34852) Nil!34852)))))

(assert (= (and d!157663 (not res!1023282)) b!1502217))

(assert (= (and b!1502217 res!1023283) b!1502219))

(assert (= (and b!1502217 res!1023281) b!1502218))

(assert (= (and b!1502218 c!139001) b!1502216))

(assert (= (and b!1502218 (not c!139001)) b!1502215))

(assert (= (or b!1502216 b!1502215) bm!68070))

(assert (=> b!1502217 m!1385521))

(assert (=> b!1502217 m!1385521))

(assert (=> b!1502217 m!1385523))

(assert (=> b!1502218 m!1385521))

(assert (=> b!1502218 m!1385521))

(assert (=> b!1502218 m!1385523))

(assert (=> b!1502219 m!1385521))

(assert (=> b!1502219 m!1385521))

(declare-fun m!1385533 () Bool)

(assert (=> b!1502219 m!1385533))

(assert (=> bm!68070 m!1385521))

(declare-fun m!1385535 () Bool)

(assert (=> bm!68070 m!1385535))

(assert (=> b!1502162 d!157663))

(declare-fun d!157667 () Bool)

(assert (=> d!157667 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127826 d!157667))

(declare-fun d!157675 () Bool)

(assert (=> d!157675 (= (array_inv!37391 a!2850) (bvsge (size!48913 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127826 d!157675))

(declare-fun b!1502280 () Bool)

(declare-fun e!840248 () SeekEntryResult!12561)

(declare-fun e!840250 () SeekEntryResult!12561)

(assert (=> b!1502280 (= e!840248 e!840250)))

(declare-fun c!139024 () Bool)

(declare-fun lt!653338 () (_ BitVec 64))

(assert (=> b!1502280 (= c!139024 (= lt!653338 (select (arr!48363 a!2850) j!87)))))

(declare-fun b!1502281 () Bool)

(declare-fun e!840249 () SeekEntryResult!12561)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502281 (= e!840249 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48363 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502282 () Bool)

(declare-fun c!139023 () Bool)

(assert (=> b!1502282 (= c!139023 (= lt!653338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1502282 (= e!840250 e!840249)))

(declare-fun b!1502283 () Bool)

(assert (=> b!1502283 (= e!840250 (Found!12561 index!625))))

(declare-fun b!1502284 () Bool)

(assert (=> b!1502284 (= e!840249 (MissingVacant!12561 vacantBefore!10))))

(declare-fun d!157677 () Bool)

(declare-fun lt!653337 () SeekEntryResult!12561)

(get-info :version)

(assert (=> d!157677 (and (or ((_ is Undefined!12561) lt!653337) (not ((_ is Found!12561) lt!653337)) (and (bvsge (index!52637 lt!653337) #b00000000000000000000000000000000) (bvslt (index!52637 lt!653337) (size!48913 a!2850)))) (or ((_ is Undefined!12561) lt!653337) ((_ is Found!12561) lt!653337) (not ((_ is MissingVacant!12561) lt!653337)) (not (= (index!52639 lt!653337) vacantBefore!10)) (and (bvsge (index!52639 lt!653337) #b00000000000000000000000000000000) (bvslt (index!52639 lt!653337) (size!48913 a!2850)))) (or ((_ is Undefined!12561) lt!653337) (ite ((_ is Found!12561) lt!653337) (= (select (arr!48363 a!2850) (index!52637 lt!653337)) (select (arr!48363 a!2850) j!87)) (and ((_ is MissingVacant!12561) lt!653337) (= (index!52639 lt!653337) vacantBefore!10) (= (select (arr!48363 a!2850) (index!52639 lt!653337)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157677 (= lt!653337 e!840248)))

(declare-fun c!139025 () Bool)

(assert (=> d!157677 (= c!139025 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157677 (= lt!653338 (select (arr!48363 a!2850) index!625))))

(assert (=> d!157677 (validMask!0 mask!2661)))

(assert (=> d!157677 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48363 a!2850) j!87) a!2850 mask!2661) lt!653337)))

(declare-fun b!1502285 () Bool)

(assert (=> b!1502285 (= e!840248 Undefined!12561)))

(assert (= (and d!157677 c!139025) b!1502285))

(assert (= (and d!157677 (not c!139025)) b!1502280))

(assert (= (and b!1502280 c!139024) b!1502283))

(assert (= (and b!1502280 (not c!139024)) b!1502282))

(assert (= (and b!1502282 c!139023) b!1502284))

(assert (= (and b!1502282 (not c!139023)) b!1502281))

(declare-fun m!1385561 () Bool)

(assert (=> b!1502281 m!1385561))

(assert (=> b!1502281 m!1385561))

(assert (=> b!1502281 m!1385471))

(declare-fun m!1385563 () Bool)

(assert (=> b!1502281 m!1385563))

(declare-fun m!1385565 () Bool)

(assert (=> d!157677 m!1385565))

(declare-fun m!1385567 () Bool)

(assert (=> d!157677 m!1385567))

(assert (=> d!157677 m!1385483))

(assert (=> d!157677 m!1385491))

(assert (=> b!1502163 d!157677))

(check-sat (not b!1502202) (not b!1502219) (not b!1502218) (not b!1502217) (not d!157677) (not bm!68067) (not b!1502201) (not bm!68070) (not b!1502281))
(check-sat)
