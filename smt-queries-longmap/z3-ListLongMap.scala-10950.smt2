; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128420 () Bool)

(assert start!128420)

(declare-fun b!1506332 () Bool)

(declare-fun res!1025861 () Bool)

(declare-fun e!842107 () Bool)

(assert (=> b!1506332 (=> (not res!1025861) (not e!842107))))

(declare-datatypes ((array!100471 0))(
  ( (array!100472 (arr!48484 (Array (_ BitVec 32) (_ BitVec 64))) (size!49035 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100471)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1506332 (= res!1025861 (not (= (select (arr!48484 a!2850) index!625) (select (arr!48484 a!2850) j!87))))))

(declare-fun b!1506333 () Bool)

(declare-fun res!1025853 () Bool)

(declare-fun e!842109 () Bool)

(assert (=> b!1506333 (=> (not res!1025853) (not e!842109))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1506333 (= res!1025853 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49035 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49035 a!2850)) (= (select (arr!48484 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48484 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49035 a!2850))))))

(declare-fun b!1506334 () Bool)

(declare-fun res!1025860 () Bool)

(assert (=> b!1506334 (=> (not res!1025860) (not e!842109))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1506334 (= res!1025860 (and (= (size!49035 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49035 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49035 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1506335 () Bool)

(assert (=> b!1506335 (= e!842109 e!842107)))

(declare-fun res!1025856 () Bool)

(assert (=> b!1506335 (=> (not res!1025856) (not e!842107))))

(declare-datatypes ((SeekEntryResult!12575 0))(
  ( (MissingZero!12575 (index!52692 (_ BitVec 32))) (Found!12575 (index!52693 (_ BitVec 32))) (Intermediate!12575 (undefined!13387 Bool) (index!52694 (_ BitVec 32)) (x!134576 (_ BitVec 32))) (Undefined!12575) (MissingVacant!12575 (index!52695 (_ BitVec 32))) )
))
(declare-fun lt!654387 () SeekEntryResult!12575)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100471 (_ BitVec 32)) SeekEntryResult!12575)

(assert (=> b!1506335 (= res!1025856 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48484 a!2850) j!87) a!2850 mask!2661) lt!654387))))

(assert (=> b!1506335 (= lt!654387 (Found!12575 j!87))))

(declare-fun b!1506336 () Bool)

(declare-fun e!842108 () Bool)

(assert (=> b!1506336 (= e!842107 e!842108)))

(declare-fun res!1025857 () Bool)

(assert (=> b!1506336 (=> (not res!1025857) (not e!842108))))

(declare-fun lt!654388 () (_ BitVec 32))

(assert (=> b!1506336 (= res!1025857 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!654388 #b00000000000000000000000000000000) (bvslt lt!654388 (size!49035 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506336 (= lt!654388 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1506337 () Bool)

(declare-fun res!1025855 () Bool)

(assert (=> b!1506337 (=> (not res!1025855) (not e!842109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100471 (_ BitVec 32)) Bool)

(assert (=> b!1506337 (= res!1025855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1506338 () Bool)

(declare-fun res!1025859 () Bool)

(assert (=> b!1506338 (=> (not res!1025859) (not e!842109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506338 (= res!1025859 (validKeyInArray!0 (select (arr!48484 a!2850) i!996)))))

(declare-fun b!1506339 () Bool)

(declare-fun res!1025858 () Bool)

(assert (=> b!1506339 (=> (not res!1025858) (not e!842109))))

(assert (=> b!1506339 (= res!1025858 (validKeyInArray!0 (select (arr!48484 a!2850) j!87)))))

(declare-fun b!1506340 () Bool)

(declare-fun res!1025852 () Bool)

(assert (=> b!1506340 (=> (not res!1025852) (not e!842109))))

(declare-datatypes ((List!34963 0))(
  ( (Nil!34960) (Cons!34959 (h!36371 (_ BitVec 64)) (t!49649 List!34963)) )
))
(declare-fun arrayNoDuplicates!0 (array!100471 (_ BitVec 32) List!34963) Bool)

(assert (=> b!1506340 (= res!1025852 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34960))))

(declare-fun res!1025854 () Bool)

(assert (=> start!128420 (=> (not res!1025854) (not e!842109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128420 (= res!1025854 (validMask!0 mask!2661))))

(assert (=> start!128420 e!842109))

(assert (=> start!128420 true))

(declare-fun array_inv!37765 (array!100471) Bool)

(assert (=> start!128420 (array_inv!37765 a!2850)))

(declare-fun b!1506331 () Bool)

(assert (=> b!1506331 (= e!842108 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654388 vacantBefore!10 (select (arr!48484 a!2850) j!87) a!2850 mask!2661) lt!654387)))))

(assert (= (and start!128420 res!1025854) b!1506334))

(assert (= (and b!1506334 res!1025860) b!1506338))

(assert (= (and b!1506338 res!1025859) b!1506339))

(assert (= (and b!1506339 res!1025858) b!1506337))

(assert (= (and b!1506337 res!1025855) b!1506340))

(assert (= (and b!1506340 res!1025852) b!1506333))

(assert (= (and b!1506333 res!1025853) b!1506335))

(assert (= (and b!1506335 res!1025856) b!1506332))

(assert (= (and b!1506332 res!1025861) b!1506336))

(assert (= (and b!1506336 res!1025857) b!1506331))

(declare-fun m!1389435 () Bool)

(assert (=> b!1506339 m!1389435))

(assert (=> b!1506339 m!1389435))

(declare-fun m!1389437 () Bool)

(assert (=> b!1506339 m!1389437))

(declare-fun m!1389439 () Bool)

(assert (=> b!1506333 m!1389439))

(declare-fun m!1389441 () Bool)

(assert (=> b!1506333 m!1389441))

(declare-fun m!1389443 () Bool)

(assert (=> b!1506333 m!1389443))

(declare-fun m!1389445 () Bool)

(assert (=> b!1506332 m!1389445))

(assert (=> b!1506332 m!1389435))

(declare-fun m!1389447 () Bool)

(assert (=> start!128420 m!1389447))

(declare-fun m!1389449 () Bool)

(assert (=> start!128420 m!1389449))

(assert (=> b!1506335 m!1389435))

(assert (=> b!1506335 m!1389435))

(declare-fun m!1389451 () Bool)

(assert (=> b!1506335 m!1389451))

(declare-fun m!1389453 () Bool)

(assert (=> b!1506337 m!1389453))

(assert (=> b!1506331 m!1389435))

(assert (=> b!1506331 m!1389435))

(declare-fun m!1389455 () Bool)

(assert (=> b!1506331 m!1389455))

(declare-fun m!1389457 () Bool)

(assert (=> b!1506336 m!1389457))

(declare-fun m!1389459 () Bool)

(assert (=> b!1506340 m!1389459))

(declare-fun m!1389461 () Bool)

(assert (=> b!1506338 m!1389461))

(assert (=> b!1506338 m!1389461))

(declare-fun m!1389463 () Bool)

(assert (=> b!1506338 m!1389463))

(check-sat (not b!1506336) (not b!1506338) (not b!1506337) (not b!1506339) (not b!1506335) (not b!1506331) (not start!128420) (not b!1506340))
(check-sat)
(get-model)

(declare-fun b!1506411 () Bool)

(declare-fun e!842144 () Bool)

(declare-fun contains!9995 (List!34963 (_ BitVec 64)) Bool)

(assert (=> b!1506411 (= e!842144 (contains!9995 Nil!34960 (select (arr!48484 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1506412 () Bool)

(declare-fun e!842143 () Bool)

(declare-fun call!68247 () Bool)

(assert (=> b!1506412 (= e!842143 call!68247)))

(declare-fun b!1506413 () Bool)

(assert (=> b!1506413 (= e!842143 call!68247)))

(declare-fun d!158403 () Bool)

(declare-fun res!1025928 () Bool)

(declare-fun e!842145 () Bool)

(assert (=> d!158403 (=> res!1025928 e!842145)))

(assert (=> d!158403 (= res!1025928 (bvsge #b00000000000000000000000000000000 (size!49035 a!2850)))))

(assert (=> d!158403 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34960) e!842145)))

(declare-fun bm!68244 () Bool)

(declare-fun c!139786 () Bool)

(assert (=> bm!68244 (= call!68247 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139786 (Cons!34959 (select (arr!48484 a!2850) #b00000000000000000000000000000000) Nil!34960) Nil!34960)))))

(declare-fun b!1506414 () Bool)

(declare-fun e!842142 () Bool)

(assert (=> b!1506414 (= e!842145 e!842142)))

(declare-fun res!1025929 () Bool)

(assert (=> b!1506414 (=> (not res!1025929) (not e!842142))))

(assert (=> b!1506414 (= res!1025929 (not e!842144))))

(declare-fun res!1025930 () Bool)

(assert (=> b!1506414 (=> (not res!1025930) (not e!842144))))

(assert (=> b!1506414 (= res!1025930 (validKeyInArray!0 (select (arr!48484 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1506415 () Bool)

(assert (=> b!1506415 (= e!842142 e!842143)))

(assert (=> b!1506415 (= c!139786 (validKeyInArray!0 (select (arr!48484 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!158403 (not res!1025928)) b!1506414))

(assert (= (and b!1506414 res!1025930) b!1506411))

(assert (= (and b!1506414 res!1025929) b!1506415))

(assert (= (and b!1506415 c!139786) b!1506413))

(assert (= (and b!1506415 (not c!139786)) b!1506412))

(assert (= (or b!1506413 b!1506412) bm!68244))

(declare-fun m!1389525 () Bool)

(assert (=> b!1506411 m!1389525))

(assert (=> b!1506411 m!1389525))

(declare-fun m!1389527 () Bool)

(assert (=> b!1506411 m!1389527))

(assert (=> bm!68244 m!1389525))

(declare-fun m!1389529 () Bool)

(assert (=> bm!68244 m!1389529))

(assert (=> b!1506414 m!1389525))

(assert (=> b!1506414 m!1389525))

(declare-fun m!1389531 () Bool)

(assert (=> b!1506414 m!1389531))

(assert (=> b!1506415 m!1389525))

(assert (=> b!1506415 m!1389525))

(assert (=> b!1506415 m!1389531))

(assert (=> b!1506340 d!158403))

(declare-fun b!1506428 () Bool)

(declare-fun e!842154 () SeekEntryResult!12575)

(assert (=> b!1506428 (= e!842154 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48484 a!2850) j!87) a!2850 mask!2661))))

(declare-fun d!158405 () Bool)

(declare-fun lt!654406 () SeekEntryResult!12575)

(get-info :version)

(assert (=> d!158405 (and (or ((_ is Undefined!12575) lt!654406) (not ((_ is Found!12575) lt!654406)) (and (bvsge (index!52693 lt!654406) #b00000000000000000000000000000000) (bvslt (index!52693 lt!654406) (size!49035 a!2850)))) (or ((_ is Undefined!12575) lt!654406) ((_ is Found!12575) lt!654406) (not ((_ is MissingVacant!12575) lt!654406)) (not (= (index!52695 lt!654406) vacantBefore!10)) (and (bvsge (index!52695 lt!654406) #b00000000000000000000000000000000) (bvslt (index!52695 lt!654406) (size!49035 a!2850)))) (or ((_ is Undefined!12575) lt!654406) (ite ((_ is Found!12575) lt!654406) (= (select (arr!48484 a!2850) (index!52693 lt!654406)) (select (arr!48484 a!2850) j!87)) (and ((_ is MissingVacant!12575) lt!654406) (= (index!52695 lt!654406) vacantBefore!10) (= (select (arr!48484 a!2850) (index!52695 lt!654406)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!842152 () SeekEntryResult!12575)

(assert (=> d!158405 (= lt!654406 e!842152)))

(declare-fun c!139793 () Bool)

(assert (=> d!158405 (= c!139793 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!654405 () (_ BitVec 64))

(assert (=> d!158405 (= lt!654405 (select (arr!48484 a!2850) index!625))))

(assert (=> d!158405 (validMask!0 mask!2661)))

(assert (=> d!158405 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48484 a!2850) j!87) a!2850 mask!2661) lt!654406)))

(declare-fun b!1506429 () Bool)

(declare-fun e!842153 () SeekEntryResult!12575)

(assert (=> b!1506429 (= e!842152 e!842153)))

(declare-fun c!139794 () Bool)

(assert (=> b!1506429 (= c!139794 (= lt!654405 (select (arr!48484 a!2850) j!87)))))

(declare-fun b!1506430 () Bool)

(assert (=> b!1506430 (= e!842154 (MissingVacant!12575 vacantBefore!10))))

(declare-fun b!1506431 () Bool)

(assert (=> b!1506431 (= e!842153 (Found!12575 index!625))))

(declare-fun b!1506432 () Bool)

(assert (=> b!1506432 (= e!842152 Undefined!12575)))

(declare-fun b!1506433 () Bool)

(declare-fun c!139795 () Bool)

(assert (=> b!1506433 (= c!139795 (= lt!654405 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1506433 (= e!842153 e!842154)))

(assert (= (and d!158405 c!139793) b!1506432))

(assert (= (and d!158405 (not c!139793)) b!1506429))

(assert (= (and b!1506429 c!139794) b!1506431))

(assert (= (and b!1506429 (not c!139794)) b!1506433))

(assert (= (and b!1506433 c!139795) b!1506430))

(assert (= (and b!1506433 (not c!139795)) b!1506428))

(declare-fun m!1389533 () Bool)

(assert (=> b!1506428 m!1389533))

(assert (=> b!1506428 m!1389533))

(assert (=> b!1506428 m!1389435))

(declare-fun m!1389535 () Bool)

(assert (=> b!1506428 m!1389535))

(declare-fun m!1389537 () Bool)

(assert (=> d!158405 m!1389537))

(declare-fun m!1389539 () Bool)

(assert (=> d!158405 m!1389539))

(assert (=> d!158405 m!1389445))

(assert (=> d!158405 m!1389447))

(assert (=> b!1506335 d!158405))

(declare-fun d!158411 () Bool)

(assert (=> d!158411 (= (validKeyInArray!0 (select (arr!48484 a!2850) i!996)) (and (not (= (select (arr!48484 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48484 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506338 d!158411))

(declare-fun d!158413 () Bool)

(assert (=> d!158413 (= (validKeyInArray!0 (select (arr!48484 a!2850) j!87)) (and (not (= (select (arr!48484 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48484 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506339 d!158413))

(declare-fun d!158415 () Bool)

(assert (=> d!158415 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128420 d!158415))

(declare-fun d!158421 () Bool)

(assert (=> d!158421 (= (array_inv!37765 a!2850) (bvsge (size!49035 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128420 d!158421))

(declare-fun b!1506477 () Bool)

(declare-fun e!842185 () Bool)

(declare-fun e!842186 () Bool)

(assert (=> b!1506477 (= e!842185 e!842186)))

(declare-fun lt!654425 () (_ BitVec 64))

(assert (=> b!1506477 (= lt!654425 (select (arr!48484 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50201 0))(
  ( (Unit!50202) )
))
(declare-fun lt!654424 () Unit!50201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100471 (_ BitVec 64) (_ BitVec 32)) Unit!50201)

(assert (=> b!1506477 (= lt!654424 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!654425 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1506477 (arrayContainsKey!0 a!2850 lt!654425 #b00000000000000000000000000000000)))

(declare-fun lt!654423 () Unit!50201)

(assert (=> b!1506477 (= lt!654423 lt!654424)))

(declare-fun res!1025948 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100471 (_ BitVec 32)) SeekEntryResult!12575)

(assert (=> b!1506477 (= res!1025948 (= (seekEntryOrOpen!0 (select (arr!48484 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12575 #b00000000000000000000000000000000)))))

(assert (=> b!1506477 (=> (not res!1025948) (not e!842186))))

(declare-fun bm!68250 () Bool)

(declare-fun call!68253 () Bool)

(assert (=> bm!68250 (= call!68253 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1506478 () Bool)

(assert (=> b!1506478 (= e!842186 call!68253)))

(declare-fun d!158423 () Bool)

(declare-fun res!1025949 () Bool)

(declare-fun e!842187 () Bool)

(assert (=> d!158423 (=> res!1025949 e!842187)))

(assert (=> d!158423 (= res!1025949 (bvsge #b00000000000000000000000000000000 (size!49035 a!2850)))))

(assert (=> d!158423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!842187)))

(declare-fun b!1506479 () Bool)

(assert (=> b!1506479 (= e!842185 call!68253)))

(declare-fun b!1506480 () Bool)

(assert (=> b!1506480 (= e!842187 e!842185)))

(declare-fun c!139809 () Bool)

(assert (=> b!1506480 (= c!139809 (validKeyInArray!0 (select (arr!48484 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!158423 (not res!1025949)) b!1506480))

(assert (= (and b!1506480 c!139809) b!1506477))

(assert (= (and b!1506480 (not c!139809)) b!1506479))

(assert (= (and b!1506477 res!1025948) b!1506478))

(assert (= (or b!1506478 b!1506479) bm!68250))

(assert (=> b!1506477 m!1389525))

(declare-fun m!1389549 () Bool)

(assert (=> b!1506477 m!1389549))

(declare-fun m!1389551 () Bool)

(assert (=> b!1506477 m!1389551))

(assert (=> b!1506477 m!1389525))

(declare-fun m!1389553 () Bool)

(assert (=> b!1506477 m!1389553))

(declare-fun m!1389555 () Bool)

(assert (=> bm!68250 m!1389555))

(assert (=> b!1506480 m!1389525))

(assert (=> b!1506480 m!1389525))

(assert (=> b!1506480 m!1389531))

(assert (=> b!1506337 d!158423))

(declare-fun d!158425 () Bool)

(declare-fun lt!654430 () (_ BitVec 32))

(assert (=> d!158425 (and (bvsge lt!654430 #b00000000000000000000000000000000) (bvslt lt!654430 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!158425 (= lt!654430 (choose!52 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(assert (=> d!158425 (validMask!0 mask!2661)))

(assert (=> d!158425 (= (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) lt!654430)))

(declare-fun bs!43206 () Bool)

(assert (= bs!43206 d!158425))

(declare-fun m!1389567 () Bool)

(assert (=> bs!43206 m!1389567))

(assert (=> bs!43206 m!1389447))

(assert (=> b!1506336 d!158425))

(declare-fun b!1506487 () Bool)

(declare-fun e!842193 () SeekEntryResult!12575)

(assert (=> b!1506487 (= e!842193 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) (nextIndex!0 lt!654388 (bvadd #b00000000000000000000000000000001 x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48484 a!2850) j!87) a!2850 mask!2661))))

(declare-fun lt!654432 () SeekEntryResult!12575)

(declare-fun d!158429 () Bool)

(assert (=> d!158429 (and (or ((_ is Undefined!12575) lt!654432) (not ((_ is Found!12575) lt!654432)) (and (bvsge (index!52693 lt!654432) #b00000000000000000000000000000000) (bvslt (index!52693 lt!654432) (size!49035 a!2850)))) (or ((_ is Undefined!12575) lt!654432) ((_ is Found!12575) lt!654432) (not ((_ is MissingVacant!12575) lt!654432)) (not (= (index!52695 lt!654432) vacantBefore!10)) (and (bvsge (index!52695 lt!654432) #b00000000000000000000000000000000) (bvslt (index!52695 lt!654432) (size!49035 a!2850)))) (or ((_ is Undefined!12575) lt!654432) (ite ((_ is Found!12575) lt!654432) (= (select (arr!48484 a!2850) (index!52693 lt!654432)) (select (arr!48484 a!2850) j!87)) (and ((_ is MissingVacant!12575) lt!654432) (= (index!52695 lt!654432) vacantBefore!10) (= (select (arr!48484 a!2850) (index!52695 lt!654432)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!842191 () SeekEntryResult!12575)

(assert (=> d!158429 (= lt!654432 e!842191)))

(declare-fun c!139813 () Bool)

(assert (=> d!158429 (= c!139813 (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110))))

(declare-fun lt!654431 () (_ BitVec 64))

(assert (=> d!158429 (= lt!654431 (select (arr!48484 a!2850) lt!654388))))

(assert (=> d!158429 (validMask!0 mask!2661)))

(assert (=> d!158429 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654388 vacantBefore!10 (select (arr!48484 a!2850) j!87) a!2850 mask!2661) lt!654432)))

(declare-fun b!1506488 () Bool)

(declare-fun e!842192 () SeekEntryResult!12575)

(assert (=> b!1506488 (= e!842191 e!842192)))

(declare-fun c!139814 () Bool)

(assert (=> b!1506488 (= c!139814 (= lt!654431 (select (arr!48484 a!2850) j!87)))))

(declare-fun b!1506489 () Bool)

(assert (=> b!1506489 (= e!842193 (MissingVacant!12575 vacantBefore!10))))

(declare-fun b!1506490 () Bool)

(assert (=> b!1506490 (= e!842192 (Found!12575 lt!654388))))

(declare-fun b!1506491 () Bool)

(assert (=> b!1506491 (= e!842191 Undefined!12575)))

(declare-fun b!1506492 () Bool)

(declare-fun c!139815 () Bool)

(assert (=> b!1506492 (= c!139815 (= lt!654431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1506492 (= e!842192 e!842193)))

(assert (= (and d!158429 c!139813) b!1506491))

(assert (= (and d!158429 (not c!139813)) b!1506488))

(assert (= (and b!1506488 c!139814) b!1506490))

(assert (= (and b!1506488 (not c!139814)) b!1506492))

(assert (= (and b!1506492 c!139815) b!1506489))

(assert (= (and b!1506492 (not c!139815)) b!1506487))

(declare-fun m!1389569 () Bool)

(assert (=> b!1506487 m!1389569))

(assert (=> b!1506487 m!1389569))

(assert (=> b!1506487 m!1389435))

(declare-fun m!1389571 () Bool)

(assert (=> b!1506487 m!1389571))

(declare-fun m!1389573 () Bool)

(assert (=> d!158429 m!1389573))

(declare-fun m!1389575 () Bool)

(assert (=> d!158429 m!1389575))

(declare-fun m!1389577 () Bool)

(assert (=> d!158429 m!1389577))

(assert (=> d!158429 m!1389447))

(assert (=> b!1506331 d!158429))

(check-sat (not b!1506414) (not b!1506480) (not b!1506477) (not d!158425) (not bm!68244) (not bm!68250) (not b!1506415) (not b!1506428) (not b!1506487) (not d!158429) (not d!158405) (not b!1506411))
(check-sat)
