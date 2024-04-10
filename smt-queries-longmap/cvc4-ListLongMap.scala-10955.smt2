; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128194 () Bool)

(assert start!128194)

(declare-fun b!1505214 () Bool)

(declare-fun res!1025815 () Bool)

(declare-fun e!841284 () Bool)

(assert (=> b!1505214 (=> (not res!1025815) (not e!841284))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100392 0))(
  ( (array!100393 (arr!48448 (Array (_ BitVec 32) (_ BitVec 64))) (size!48998 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100392)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505214 (= res!1025815 (and (= (size!48998 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48998 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48998 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505215 () Bool)

(declare-fun res!1025806 () Bool)

(declare-fun e!841281 () Bool)

(assert (=> b!1505215 (=> (not res!1025806) (not e!841281))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12646 0))(
  ( (MissingZero!12646 (index!52976 (_ BitVec 32))) (Found!12646 (index!52977 (_ BitVec 32))) (Intermediate!12646 (undefined!13458 Bool) (index!52978 (_ BitVec 32)) (x!134656 (_ BitVec 32))) (Undefined!12646) (MissingVacant!12646 (index!52979 (_ BitVec 32))) )
))
(declare-fun lt!653939 () SeekEntryResult!12646)

(declare-fun lt!653937 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100392 (_ BitVec 32)) SeekEntryResult!12646)

(assert (=> b!1505215 (= res!1025806 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653937 vacantBefore!10 (select (arr!48448 a!2850) j!87) a!2850 mask!2661) lt!653939))))

(declare-fun b!1505216 () Bool)

(declare-fun res!1025805 () Bool)

(assert (=> b!1505216 (=> (not res!1025805) (not e!841284))))

(declare-datatypes ((List!34940 0))(
  ( (Nil!34937) (Cons!34936 (h!36333 (_ BitVec 64)) (t!49634 List!34940)) )
))
(declare-fun arrayNoDuplicates!0 (array!100392 (_ BitVec 32) List!34940) Bool)

(assert (=> b!1505216 (= res!1025805 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34937))))

(declare-fun b!1505217 () Bool)

(declare-fun e!841285 () Bool)

(declare-fun e!841282 () Bool)

(assert (=> b!1505217 (= e!841285 e!841282)))

(declare-fun res!1025814 () Bool)

(assert (=> b!1505217 (=> (not res!1025814) (not e!841282))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1505217 (= res!1025814 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48448 a!2850) j!87) a!2850 mask!2661) lt!653939))))

(assert (=> b!1505217 (= lt!653939 (Found!12646 j!87))))

(declare-fun b!1505218 () Bool)

(declare-fun res!1025809 () Bool)

(assert (=> b!1505218 (=> (not res!1025809) (not e!841284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100392 (_ BitVec 32)) Bool)

(assert (=> b!1505218 (= res!1025809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505219 () Bool)

(assert (=> b!1505219 (= e!841282 e!841281)))

(declare-fun res!1025807 () Bool)

(assert (=> b!1505219 (=> (not res!1025807) (not e!841281))))

(assert (=> b!1505219 (= res!1025807 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653937 #b00000000000000000000000000000000) (bvslt lt!653937 (size!48998 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505219 (= lt!653937 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun lt!653941 () array!100392)

(declare-fun b!1505221 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun lt!653940 () (_ BitVec 64))

(assert (=> b!1505221 (= e!841281 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!653940 lt!653941 mask!2661) lt!653939)))))

(assert (=> b!1505221 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653937 vacantAfter!10 lt!653940 lt!653941 mask!2661) lt!653939)))

(assert (=> b!1505221 (= lt!653940 (select (store (arr!48448 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))

(declare-datatypes ((Unit!50298 0))(
  ( (Unit!50299) )
))
(declare-fun lt!653938 () Unit!50298)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50298)

(assert (=> b!1505221 (= lt!653938 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653937 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1505222 () Bool)

(declare-fun res!1025813 () Bool)

(assert (=> b!1505222 (=> (not res!1025813) (not e!841284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505222 (= res!1025813 (validKeyInArray!0 (select (arr!48448 a!2850) i!996)))))

(declare-fun b!1505223 () Bool)

(assert (=> b!1505223 (= e!841284 e!841285)))

(declare-fun res!1025811 () Bool)

(assert (=> b!1505223 (=> (not res!1025811) (not e!841285))))

(assert (=> b!1505223 (= res!1025811 (and (= (select (store (arr!48448 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48998 a!2850))))))

(assert (=> b!1505223 (= lt!653941 (array!100393 (store (arr!48448 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48998 a!2850)))))

(declare-fun b!1505224 () Bool)

(declare-fun res!1025808 () Bool)

(assert (=> b!1505224 (=> (not res!1025808) (not e!841284))))

(assert (=> b!1505224 (= res!1025808 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48998 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48998 a!2850)) (= (select (arr!48448 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1505225 () Bool)

(declare-fun res!1025804 () Bool)

(assert (=> b!1505225 (=> (not res!1025804) (not e!841282))))

(assert (=> b!1505225 (= res!1025804 (not (= (select (arr!48448 a!2850) index!625) (select (arr!48448 a!2850) j!87))))))

(declare-fun res!1025810 () Bool)

(assert (=> start!128194 (=> (not res!1025810) (not e!841284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128194 (= res!1025810 (validMask!0 mask!2661))))

(assert (=> start!128194 e!841284))

(assert (=> start!128194 true))

(declare-fun array_inv!37476 (array!100392) Bool)

(assert (=> start!128194 (array_inv!37476 a!2850)))

(declare-fun b!1505220 () Bool)

(declare-fun res!1025812 () Bool)

(assert (=> b!1505220 (=> (not res!1025812) (not e!841284))))

(assert (=> b!1505220 (= res!1025812 (validKeyInArray!0 (select (arr!48448 a!2850) j!87)))))

(assert (= (and start!128194 res!1025810) b!1505214))

(assert (= (and b!1505214 res!1025815) b!1505222))

(assert (= (and b!1505222 res!1025813) b!1505220))

(assert (= (and b!1505220 res!1025812) b!1505218))

(assert (= (and b!1505218 res!1025809) b!1505216))

(assert (= (and b!1505216 res!1025805) b!1505224))

(assert (= (and b!1505224 res!1025808) b!1505223))

(assert (= (and b!1505223 res!1025811) b!1505217))

(assert (= (and b!1505217 res!1025814) b!1505225))

(assert (= (and b!1505225 res!1025804) b!1505219))

(assert (= (and b!1505219 res!1025807) b!1505215))

(assert (= (and b!1505215 res!1025806) b!1505221))

(declare-fun m!1388333 () Bool)

(assert (=> start!128194 m!1388333))

(declare-fun m!1388335 () Bool)

(assert (=> start!128194 m!1388335))

(declare-fun m!1388337 () Bool)

(assert (=> b!1505221 m!1388337))

(declare-fun m!1388339 () Bool)

(assert (=> b!1505221 m!1388339))

(declare-fun m!1388341 () Bool)

(assert (=> b!1505221 m!1388341))

(declare-fun m!1388343 () Bool)

(assert (=> b!1505221 m!1388343))

(declare-fun m!1388345 () Bool)

(assert (=> b!1505221 m!1388345))

(declare-fun m!1388347 () Bool)

(assert (=> b!1505222 m!1388347))

(assert (=> b!1505222 m!1388347))

(declare-fun m!1388349 () Bool)

(assert (=> b!1505222 m!1388349))

(declare-fun m!1388351 () Bool)

(assert (=> b!1505224 m!1388351))

(declare-fun m!1388353 () Bool)

(assert (=> b!1505215 m!1388353))

(assert (=> b!1505215 m!1388353))

(declare-fun m!1388355 () Bool)

(assert (=> b!1505215 m!1388355))

(assert (=> b!1505223 m!1388339))

(declare-fun m!1388357 () Bool)

(assert (=> b!1505223 m!1388357))

(declare-fun m!1388359 () Bool)

(assert (=> b!1505219 m!1388359))

(assert (=> b!1505220 m!1388353))

(assert (=> b!1505220 m!1388353))

(declare-fun m!1388361 () Bool)

(assert (=> b!1505220 m!1388361))

(declare-fun m!1388363 () Bool)

(assert (=> b!1505225 m!1388363))

(assert (=> b!1505225 m!1388353))

(declare-fun m!1388365 () Bool)

(assert (=> b!1505216 m!1388365))

(assert (=> b!1505217 m!1388353))

(assert (=> b!1505217 m!1388353))

(declare-fun m!1388367 () Bool)

(assert (=> b!1505217 m!1388367))

(declare-fun m!1388369 () Bool)

(assert (=> b!1505218 m!1388369))

(push 1)

(assert (not b!1505221))

(assert (not b!1505222))

(assert (not b!1505219))

(assert (not b!1505218))

(assert (not start!128194))

(assert (not b!1505217))

(assert (not b!1505215))

(assert (not b!1505216))

(assert (not b!1505220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1505278 () Bool)

(declare-fun e!841319 () Bool)

(declare-fun call!68163 () Bool)

(assert (=> b!1505278 (= e!841319 call!68163)))

(declare-fun bm!68160 () Bool)

(declare-fun c!139259 () Bool)

(assert (=> bm!68160 (= call!68163 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139259 (Cons!34936 (select (arr!48448 a!2850) #b00000000000000000000000000000000) Nil!34937) Nil!34937)))))

(declare-fun b!1505279 () Bool)

(declare-fun e!841318 () Bool)

(declare-fun contains!9954 (List!34940 (_ BitVec 64)) Bool)

(assert (=> b!1505279 (= e!841318 (contains!9954 Nil!34937 (select (arr!48448 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505280 () Bool)

(assert (=> b!1505280 (= e!841319 call!68163)))

(declare-fun d!157963 () Bool)

(declare-fun res!1025828 () Bool)

(declare-fun e!841320 () Bool)

(assert (=> d!157963 (=> res!1025828 e!841320)))

(assert (=> d!157963 (= res!1025828 (bvsge #b00000000000000000000000000000000 (size!48998 a!2850)))))

(assert (=> d!157963 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34937) e!841320)))

(declare-fun b!1505281 () Bool)

(declare-fun e!841321 () Bool)

(assert (=> b!1505281 (= e!841321 e!841319)))

(assert (=> b!1505281 (= c!139259 (validKeyInArray!0 (select (arr!48448 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505282 () Bool)

(assert (=> b!1505282 (= e!841320 e!841321)))

(declare-fun res!1025830 () Bool)

(assert (=> b!1505282 (=> (not res!1025830) (not e!841321))))

(assert (=> b!1505282 (= res!1025830 (not e!841318))))

(declare-fun res!1025829 () Bool)

(assert (=> b!1505282 (=> (not res!1025829) (not e!841318))))

(assert (=> b!1505282 (= res!1025829 (validKeyInArray!0 (select (arr!48448 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157963 (not res!1025828)) b!1505282))

(assert (= (and b!1505282 res!1025829) b!1505279))

(assert (= (and b!1505282 res!1025830) b!1505281))

(assert (= (and b!1505281 c!139259) b!1505278))

(assert (= (and b!1505281 (not c!139259)) b!1505280))

(assert (= (or b!1505278 b!1505280) bm!68160))

(declare-fun m!1388409 () Bool)

(assert (=> bm!68160 m!1388409))

(declare-fun m!1388411 () Bool)

(assert (=> bm!68160 m!1388411))

(assert (=> b!1505279 m!1388409))

(assert (=> b!1505279 m!1388409))

(declare-fun m!1388413 () Bool)

(assert (=> b!1505279 m!1388413))

(assert (=> b!1505281 m!1388409))

(assert (=> b!1505281 m!1388409))

(declare-fun m!1388415 () Bool)

(assert (=> b!1505281 m!1388415))

(assert (=> b!1505282 m!1388409))

(assert (=> b!1505282 m!1388409))

(assert (=> b!1505282 m!1388415))

(assert (=> b!1505216 d!157963))

(declare-fun d!157973 () Bool)

(assert (=> d!157973 (= (validKeyInArray!0 (select (arr!48448 a!2850) i!996)) (and (not (= (select (arr!48448 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48448 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505222 d!157973))

(declare-fun b!1505319 () Bool)

(declare-fun e!841346 () SeekEntryResult!12646)

(assert (=> b!1505319 (= e!841346 Undefined!12646)))

(declare-fun b!1505320 () Bool)

(declare-fun e!841347 () SeekEntryResult!12646)

(assert (=> b!1505320 (= e!841346 e!841347)))

(declare-fun c!139273 () Bool)

(declare-fun lt!653974 () (_ BitVec 64))

(assert (=> b!1505320 (= c!139273 (= lt!653974 (select (arr!48448 a!2850) j!87)))))

(declare-fun b!1505321 () Bool)

(declare-fun c!139274 () Bool)

(assert (=> b!1505321 (= c!139274 (= lt!653974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841348 () SeekEntryResult!12646)

(assert (=> b!1505321 (= e!841347 e!841348)))

(declare-fun b!1505323 () Bool)

(assert (=> b!1505323 (= e!841348 (MissingVacant!12646 vacantBefore!10))))

(declare-fun b!1505324 () Bool)

(assert (=> b!1505324 (= e!841347 (Found!12646 index!625))))

(declare-fun d!157975 () Bool)

(declare-fun lt!653973 () SeekEntryResult!12646)

(assert (=> d!157975 (and (or (is-Undefined!12646 lt!653973) (not (is-Found!12646 lt!653973)) (and (bvsge (index!52977 lt!653973) #b00000000000000000000000000000000) (bvslt (index!52977 lt!653973) (size!48998 a!2850)))) (or (is-Undefined!12646 lt!653973) (is-Found!12646 lt!653973) (not (is-MissingVacant!12646 lt!653973)) (not (= (index!52979 lt!653973) vacantBefore!10)) (and (bvsge (index!52979 lt!653973) #b00000000000000000000000000000000) (bvslt (index!52979 lt!653973) (size!48998 a!2850)))) (or (is-Undefined!12646 lt!653973) (ite (is-Found!12646 lt!653973) (= (select (arr!48448 a!2850) (index!52977 lt!653973)) (select (arr!48448 a!2850) j!87)) (and (is-MissingVacant!12646 lt!653973) (= (index!52979 lt!653973) vacantBefore!10) (= (select (arr!48448 a!2850) (index!52979 lt!653973)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157975 (= lt!653973 e!841346)))

(declare-fun c!139272 () Bool)

(assert (=> d!157975 (= c!139272 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157975 (= lt!653974 (select (arr!48448 a!2850) index!625))))

(assert (=> d!157975 (validMask!0 mask!2661)))

(assert (=> d!157975 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48448 a!2850) j!87) a!2850 mask!2661) lt!653973)))

(declare-fun b!1505322 () Bool)

(assert (=> b!1505322 (= e!841348 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48448 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and d!157975 c!139272) b!1505319))

(assert (= (and d!157975 (not c!139272)) b!1505320))

(assert (= (and b!1505320 c!139273) b!1505324))

(assert (= (and b!1505320 (not c!139273)) b!1505321))

(assert (= (and b!1505321 c!139274) b!1505323))

(assert (= (and b!1505321 (not c!139274)) b!1505322))

(declare-fun m!1388433 () Bool)

(assert (=> d!157975 m!1388433))

(declare-fun m!1388435 () Bool)

(assert (=> d!157975 m!1388435))

(assert (=> d!157975 m!1388363))

(assert (=> d!157975 m!1388333))

(assert (=> b!1505322 m!1388359))

(assert (=> b!1505322 m!1388359))

(assert (=> b!1505322 m!1388353))

(declare-fun m!1388437 () Bool)

(assert (=> b!1505322 m!1388437))

(assert (=> b!1505217 d!157975))

(declare-fun bm!68166 () Bool)

(declare-fun call!68169 () Bool)

(assert (=> bm!68166 (= call!68169 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1505334 () Bool)

(declare-fun e!841357 () Bool)

(assert (=> b!1505334 (= e!841357 call!68169)))

(declare-fun b!1505335 () Bool)

(declare-fun e!841356 () Bool)

(assert (=> b!1505335 (= e!841356 e!841357)))

(declare-fun lt!653981 () (_ BitVec 64))

(assert (=> b!1505335 (= lt!653981 (select (arr!48448 a!2850) #b00000000000000000000000000000000))))

(declare-fun lt!653982 () Unit!50298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100392 (_ BitVec 64) (_ BitVec 32)) Unit!50298)

(assert (=> b!1505335 (= lt!653982 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!653981 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505335 (arrayContainsKey!0 a!2850 lt!653981 #b00000000000000000000000000000000)))

(declare-fun lt!653983 () Unit!50298)

(assert (=> b!1505335 (= lt!653983 lt!653982)))

(declare-fun res!1025848 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100392 (_ BitVec 32)) SeekEntryResult!12646)

(assert (=> b!1505335 (= res!1025848 (= (seekEntryOrOpen!0 (select (arr!48448 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12646 #b00000000000000000000000000000000)))))

(assert (=> b!1505335 (=> (not res!1025848) (not e!841357))))

(declare-fun b!1505336 () Bool)

(declare-fun e!841355 () Bool)

(assert (=> b!1505336 (= e!841355 e!841356)))

(declare-fun c!139277 () Bool)

(assert (=> b!1505336 (= c!139277 (validKeyInArray!0 (select (arr!48448 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505333 () Bool)

(assert (=> b!1505333 (= e!841356 call!68169)))

(declare-fun d!157983 () Bool)

(declare-fun res!1025847 () Bool)

(assert (=> d!157983 (=> res!1025847 e!841355)))

(assert (=> d!157983 (= res!1025847 (bvsge #b00000000000000000000000000000000 (size!48998 a!2850)))))

(assert (=> d!157983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841355)))

(assert (= (and d!157983 (not res!1025847)) b!1505336))

(assert (= (and b!1505336 c!139277) b!1505335))

(assert (= (and b!1505336 (not c!139277)) b!1505333))

(assert (= (and b!1505335 res!1025848) b!1505334))

(assert (= (or b!1505334 b!1505333) bm!68166))

(declare-fun m!1388439 () Bool)

(assert (=> bm!68166 m!1388439))

(assert (=> b!1505335 m!1388409))

(declare-fun m!1388441 () Bool)

(assert (=> b!1505335 m!1388441))

(declare-fun m!1388443 () Bool)

(assert (=> b!1505335 m!1388443))

(assert (=> b!1505335 m!1388409))

(declare-fun m!1388445 () Bool)

(assert (=> b!1505335 m!1388445))

(assert (=> b!1505336 m!1388409))

(assert (=> b!1505336 m!1388409))

(assert (=> b!1505336 m!1388415))

(assert (=> b!1505218 d!157983))

(declare-fun d!157985 () Bool)

(assert (=> d!157985 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128194 d!157985))

(declare-fun d!157987 () Bool)

(assert (=> d!157987 (= (array_inv!37476 a!2850) (bvsge (size!48998 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128194 d!157987))

(declare-fun d!157989 () Bool)

(declare-fun lt!653986 () (_ BitVec 32))

(assert (=> d!157989 (and (bvsge lt!653986 #b00000000000000000000000000000000) (bvslt lt!653986 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157989 (= lt!653986 (choose!52 index!625 x!647 mask!2661))))

(assert (=> d!157989 (validMask!0 mask!2661)))

(assert (=> d!157989 (= (nextIndex!0 index!625 x!647 mask!2661) lt!653986)))

(declare-fun bs!43220 () Bool)

(assert (= bs!43220 d!157989))

(declare-fun m!1388447 () Bool)

(assert (=> bs!43220 m!1388447))

(assert (=> bs!43220 m!1388333))

(assert (=> b!1505219 d!157989))

(declare-fun d!157991 () Bool)

(assert (=> d!157991 (= (validKeyInArray!0 (select (arr!48448 a!2850) j!87)) (and (not (= (select (arr!48448 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48448 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505220 d!157991))

(declare-fun b!1505337 () Bool)

(declare-fun e!841358 () SeekEntryResult!12646)

(assert (=> b!1505337 (= e!841358 Undefined!12646)))

(declare-fun b!1505338 () Bool)

(declare-fun e!841359 () SeekEntryResult!12646)

(assert (=> b!1505338 (= e!841358 e!841359)))

(declare-fun lt!653988 () (_ BitVec 64))

(declare-fun c!139279 () Bool)

(assert (=> b!1505338 (= c!139279 (= lt!653988 (select (arr!48448 a!2850) j!87)))))

(declare-fun b!1505339 () Bool)

(declare-fun c!139280 () Bool)

(assert (=> b!1505339 (= c!139280 (= lt!653988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841360 () SeekEntryResult!12646)

(assert (=> b!1505339 (= e!841359 e!841360)))

(declare-fun b!1505341 () Bool)

(assert (=> b!1505341 (= e!841360 (MissingVacant!12646 vacantBefore!10))))

(declare-fun b!1505342 () Bool)

(assert (=> b!1505342 (= e!841359 (Found!12646 lt!653937))))

(declare-fun d!157993 () Bool)

(declare-fun lt!653987 () SeekEntryResult!12646)

(assert (=> d!157993 (and (or (is-Undefined!12646 lt!653987) (not (is-Found!12646 lt!653987)) (and (bvsge (index!52977 lt!653987) #b00000000000000000000000000000000) (bvslt (index!52977 lt!653987) (size!48998 a!2850)))) (or (is-Undefined!12646 lt!653987) (is-Found!12646 lt!653987) (not (is-MissingVacant!12646 lt!653987)) (not (= (index!52979 lt!653987) vacantBefore!10)) (and (bvsge (index!52979 lt!653987) #b00000000000000000000000000000000) (bvslt (index!52979 lt!653987) (size!48998 a!2850)))) (or (is-Undefined!12646 lt!653987) (ite (is-Found!12646 lt!653987) (= (select (arr!48448 a!2850) (index!52977 lt!653987)) (select (arr!48448 a!2850) j!87)) (and (is-MissingVacant!12646 lt!653987) (= (index!52979 lt!653987) vacantBefore!10) (= (select (arr!48448 a!2850) (index!52979 lt!653987)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157993 (= lt!653987 e!841358)))

(declare-fun c!139278 () Bool)

(assert (=> d!157993 (= c!139278 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!157993 (= lt!653988 (select (arr!48448 a!2850) lt!653937))))

(assert (=> d!157993 (validMask!0 mask!2661)))

(assert (=> d!157993 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653937 vacantBefore!10 (select (arr!48448 a!2850) j!87) a!2850 mask!2661) lt!653987)))

(declare-fun b!1505340 () Bool)

(assert (=> b!1505340 (= e!841360 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653937 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantBefore!10 (select (arr!48448 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and d!157993 c!139278) b!1505337))

(assert (= (and d!157993 (not c!139278)) b!1505338))

(assert (= (and b!1505338 c!139279) b!1505342))

(assert (= (and b!1505338 (not c!139279)) b!1505339))

(assert (= (and b!1505339 c!139280) b!1505341))

(assert (= (and b!1505339 (not c!139280)) b!1505340))

(declare-fun m!1388449 () Bool)

(assert (=> d!157993 m!1388449))

(declare-fun m!1388451 () Bool)

(assert (=> d!157993 m!1388451))

(declare-fun m!1388453 () Bool)

(assert (=> d!157993 m!1388453))

(assert (=> d!157993 m!1388333))

(declare-fun m!1388455 () Bool)

(assert (=> b!1505340 m!1388455))

(assert (=> b!1505340 m!1388455))

(assert (=> b!1505340 m!1388353))

(declare-fun m!1388457 () Bool)

(assert (=> b!1505340 m!1388457))

(assert (=> b!1505215 d!157993))

(declare-fun b!1505343 () Bool)

(declare-fun e!841361 () SeekEntryResult!12646)

(assert (=> b!1505343 (= e!841361 Undefined!12646)))

(declare-fun b!1505344 () Bool)

(declare-fun e!841362 () SeekEntryResult!12646)

(assert (=> b!1505344 (= e!841361 e!841362)))

(declare-fun c!139282 () Bool)

(declare-fun lt!653990 () (_ BitVec 64))

(assert (=> b!1505344 (= c!139282 (= lt!653990 lt!653940))))

(declare-fun b!1505345 () Bool)

(declare-fun c!139283 () Bool)

(assert (=> b!1505345 (= c!139283 (= lt!653990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841363 () SeekEntryResult!12646)

(assert (=> b!1505345 (= e!841362 e!841363)))

(declare-fun b!1505347 () Bool)

(assert (=> b!1505347 (= e!841363 (MissingVacant!12646 vacantAfter!10))))

(declare-fun b!1505348 () Bool)

(assert (=> b!1505348 (= e!841362 (Found!12646 index!625))))

(declare-fun d!157995 () Bool)

(declare-fun lt!653989 () SeekEntryResult!12646)

(assert (=> d!157995 (and (or (is-Undefined!12646 lt!653989) (not (is-Found!12646 lt!653989)) (and (bvsge (index!52977 lt!653989) #b00000000000000000000000000000000) (bvslt (index!52977 lt!653989) (size!48998 lt!653941)))) (or (is-Undefined!12646 lt!653989) (is-Found!12646 lt!653989) (not (is-MissingVacant!12646 lt!653989)) (not (= (index!52979 lt!653989) vacantAfter!10)) (and (bvsge (index!52979 lt!653989) #b00000000000000000000000000000000) (bvslt (index!52979 lt!653989) (size!48998 lt!653941)))) (or (is-Undefined!12646 lt!653989) (ite (is-Found!12646 lt!653989) (= (select (arr!48448 lt!653941) (index!52977 lt!653989)) lt!653940) (and (is-MissingVacant!12646 lt!653989) (= (index!52979 lt!653989) vacantAfter!10) (= (select (arr!48448 lt!653941) (index!52979 lt!653989)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157995 (= lt!653989 e!841361)))

(declare-fun c!139281 () Bool)

(assert (=> d!157995 (= c!139281 (bvsge x!647 #b01111111111111111111111111111110))))

(assert (=> d!157995 (= lt!653990 (select (arr!48448 lt!653941) index!625))))

(assert (=> d!157995 (validMask!0 mask!2661)))

(assert (=> d!157995 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 lt!653940 lt!653941 mask!2661) lt!653989)))

(declare-fun b!1505346 () Bool)

(assert (=> b!1505346 (= e!841363 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantAfter!10 lt!653940 lt!653941 mask!2661))))

(assert (= (and d!157995 c!139281) b!1505343))

(assert (= (and d!157995 (not c!139281)) b!1505344))

(assert (= (and b!1505344 c!139282) b!1505348))

(assert (= (and b!1505344 (not c!139282)) b!1505345))

(assert (= (and b!1505345 c!139283) b!1505347))

(assert (= (and b!1505345 (not c!139283)) b!1505346))

(declare-fun m!1388459 () Bool)

(assert (=> d!157995 m!1388459))

(declare-fun m!1388461 () Bool)

(assert (=> d!157995 m!1388461))

(declare-fun m!1388463 () Bool)

(assert (=> d!157995 m!1388463))

(assert (=> d!157995 m!1388333))

(assert (=> b!1505346 m!1388359))

(assert (=> b!1505346 m!1388359))

(declare-fun m!1388465 () Bool)

(assert (=> b!1505346 m!1388465))

(assert (=> b!1505221 d!157995))

(declare-fun b!1505349 () Bool)

(declare-fun e!841364 () SeekEntryResult!12646)

(assert (=> b!1505349 (= e!841364 Undefined!12646)))

(declare-fun b!1505350 () Bool)

(declare-fun e!841365 () SeekEntryResult!12646)

(assert (=> b!1505350 (= e!841364 e!841365)))

(declare-fun c!139285 () Bool)

(declare-fun lt!653992 () (_ BitVec 64))

(assert (=> b!1505350 (= c!139285 (= lt!653992 lt!653940))))

(declare-fun b!1505351 () Bool)

(declare-fun c!139286 () Bool)

(assert (=> b!1505351 (= c!139286 (= lt!653992 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841366 () SeekEntryResult!12646)

(assert (=> b!1505351 (= e!841365 e!841366)))

(declare-fun b!1505353 () Bool)

(assert (=> b!1505353 (= e!841366 (MissingVacant!12646 vacantAfter!10))))

(declare-fun b!1505354 () Bool)

(assert (=> b!1505354 (= e!841365 (Found!12646 lt!653937))))

(declare-fun d!157997 () Bool)

(declare-fun lt!653991 () SeekEntryResult!12646)

(assert (=> d!157997 (and (or (is-Undefined!12646 lt!653991) (not (is-Found!12646 lt!653991)) (and (bvsge (index!52977 lt!653991) #b00000000000000000000000000000000) (bvslt (index!52977 lt!653991) (size!48998 lt!653941)))) (or (is-Undefined!12646 lt!653991) (is-Found!12646 lt!653991) (not (is-MissingVacant!12646 lt!653991)) (not (= (index!52979 lt!653991) vacantAfter!10)) (and (bvsge (index!52979 lt!653991) #b00000000000000000000000000000000) (bvslt (index!52979 lt!653991) (size!48998 lt!653941)))) (or (is-Undefined!12646 lt!653991) (ite (is-Found!12646 lt!653991) (= (select (arr!48448 lt!653941) (index!52977 lt!653991)) lt!653940) (and (is-MissingVacant!12646 lt!653991) (= (index!52979 lt!653991) vacantAfter!10) (= (select (arr!48448 lt!653941) (index!52979 lt!653991)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157997 (= lt!653991 e!841364)))

(declare-fun c!139284 () Bool)

(assert (=> d!157997 (= c!139284 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(assert (=> d!157997 (= lt!653992 (select (arr!48448 lt!653941) lt!653937))))

(assert (=> d!157997 (validMask!0 mask!2661)))

(assert (=> d!157997 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653937 vacantAfter!10 lt!653940 lt!653941 mask!2661) lt!653991)))

(declare-fun b!1505352 () Bool)

(assert (=> b!1505352 (= e!841366 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!653937 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) vacantAfter!10 lt!653940 lt!653941 mask!2661))))

(assert (= (and d!157997 c!139284) b!1505349))

(assert (= (and d!157997 (not c!139284)) b!1505350))

(assert (= (and b!1505350 c!139285) b!1505354))

(assert (= (and b!1505350 (not c!139285)) b!1505351))

(assert (= (and b!1505351 c!139286) b!1505353))

(assert (= (and b!1505351 (not c!139286)) b!1505352))

(declare-fun m!1388467 () Bool)

(assert (=> d!157997 m!1388467))

(declare-fun m!1388469 () Bool)

(assert (=> d!157997 m!1388469))

(declare-fun m!1388471 () Bool)

(assert (=> d!157997 m!1388471))

(assert (=> d!157997 m!1388333))

(assert (=> b!1505352 m!1388455))

(assert (=> b!1505352 m!1388455))

(declare-fun m!1388473 () Bool)

(assert (=> b!1505352 m!1388473))

(assert (=> b!1505221 d!157997))

(declare-fun d!157999 () Bool)

(declare-fun e!841369 () Bool)

(assert (=> d!157999 e!841369))

(declare-fun res!1025851 () Bool)

(assert (=> d!157999 (=> (not res!1025851) (not e!841369))))

(assert (=> d!157999 (= res!1025851 (and (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!48998 a!2850)) (and (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48998 a!2850)))) (or (bvslt i!996 #b00000000000000000000000000000000) (bvsge i!996 (size!48998 a!2850)) (and (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48998 a!2850)))) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48998 a!2850))))))

(declare-fun lt!653995 () Unit!50298)

(declare-fun choose!27 (array!100392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50298)

(assert (=> d!157999 (= lt!653995 (choose!27 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653937 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (=> d!157999 (validMask!0 mask!2661)))

(assert (=> d!157999 (= (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653937 vacantBefore!10 vacantAfter!10 mask!2661) lt!653995)))

(declare-fun b!1505357 () Bool)

(assert (=> b!1505357 (= e!841369 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653937 vacantAfter!10 (select (store (arr!48448 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100393 (store (arr!48448 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48998 a!2850)) mask!2661) (Found!12646 j!87)))))

(assert (= (and d!157999 res!1025851) b!1505357))

(declare-fun m!1388475 () Bool)

(assert (=> d!157999 m!1388475))

(assert (=> d!157999 m!1388333))

(assert (=> b!1505357 m!1388339))

(assert (=> b!1505357 m!1388337))

(assert (=> b!1505357 m!1388337))

(declare-fun m!1388477 () Bool)

(assert (=> b!1505357 m!1388477))

(assert (=> b!1505221 d!157999))

(push 1)

(assert (not b!1505335))

(assert (not b!1505281))

(assert (not d!157999))

(assert (not b!1505336))

(assert (not b!1505340))

(assert (not d!157975))

(assert (not b!1505322))

(assert (not b!1505279))

(assert (not b!1505357))

(assert (not d!157993))

(assert (not bm!68160))

(assert (not d!157997))

(assert (not d!157989))

(assert (not b!1505346))

(assert (not bm!68166))

(assert (not d!157995))

(assert (not b!1505352))

(assert (not b!1505282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

