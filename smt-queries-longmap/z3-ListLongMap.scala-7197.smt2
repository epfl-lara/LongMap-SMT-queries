; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92212 () Bool)

(assert start!92212)

(declare-fun b!1048124 () Bool)

(declare-fun e!594454 () Bool)

(declare-fun e!594456 () Bool)

(assert (=> b!1048124 (= e!594454 e!594456)))

(declare-fun res!697373 () Bool)

(assert (=> b!1048124 (=> (not res!697373) (not e!594456))))

(declare-fun lt!462961 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048124 (= res!697373 (not (= lt!462961 i!1381)))))

(declare-datatypes ((array!65981 0))(
  ( (array!65982 (arr!31731 (Array (_ BitVec 32) (_ BitVec 64))) (size!32269 (_ BitVec 32))) )
))
(declare-fun lt!462960 () array!65981)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!65981 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048124 (= lt!462961 (arrayScanForKey!0 lt!462960 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!697371 () Bool)

(declare-fun e!594455 () Bool)

(assert (=> start!92212 (=> (not res!697371) (not e!594455))))

(declare-fun a!3488 () array!65981)

(assert (=> start!92212 (= res!697371 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32269 a!3488)) (bvslt (size!32269 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92212 e!594455))

(assert (=> start!92212 true))

(declare-fun array_inv!24514 (array!65981) Bool)

(assert (=> start!92212 (array_inv!24514 a!3488)))

(declare-fun b!1048125 () Bool)

(assert (=> b!1048125 (= e!594456 (not (or (bvsle lt!462961 i!1381) (bvslt lt!462961 #b00000000000000000000000000000000) (bvslt lt!462961 (size!32269 a!3488)))))))

(assert (=> b!1048125 (= (select (store (arr!31731 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!462961) k0!2747)))

(declare-fun b!1048126 () Bool)

(declare-fun res!697374 () Bool)

(assert (=> b!1048126 (=> (not res!697374) (not e!594455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048126 (= res!697374 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048127 () Bool)

(assert (=> b!1048127 (= e!594455 e!594454)))

(declare-fun res!697370 () Bool)

(assert (=> b!1048127 (=> (not res!697370) (not e!594454))))

(declare-fun arrayContainsKey!0 (array!65981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048127 (= res!697370 (arrayContainsKey!0 lt!462960 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048127 (= lt!462960 (array!65982 (store (arr!31731 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32269 a!3488)))))

(declare-fun b!1048128 () Bool)

(declare-fun res!697372 () Bool)

(assert (=> b!1048128 (=> (not res!697372) (not e!594455))))

(declare-datatypes ((List!22102 0))(
  ( (Nil!22099) (Cons!22098 (h!23307 (_ BitVec 64)) (t!31400 List!22102)) )
))
(declare-fun arrayNoDuplicates!0 (array!65981 (_ BitVec 32) List!22102) Bool)

(assert (=> b!1048128 (= res!697372 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22099))))

(declare-fun b!1048129 () Bool)

(declare-fun res!697375 () Bool)

(assert (=> b!1048129 (=> (not res!697375) (not e!594455))))

(assert (=> b!1048129 (= res!697375 (= (select (arr!31731 a!3488) i!1381) k0!2747))))

(assert (= (and start!92212 res!697371) b!1048128))

(assert (= (and b!1048128 res!697372) b!1048126))

(assert (= (and b!1048126 res!697374) b!1048129))

(assert (= (and b!1048129 res!697375) b!1048127))

(assert (= (and b!1048127 res!697370) b!1048124))

(assert (= (and b!1048124 res!697373) b!1048125))

(declare-fun m!968671 () Bool)

(assert (=> b!1048124 m!968671))

(declare-fun m!968673 () Bool)

(assert (=> b!1048129 m!968673))

(declare-fun m!968675 () Bool)

(assert (=> b!1048125 m!968675))

(declare-fun m!968677 () Bool)

(assert (=> b!1048125 m!968677))

(declare-fun m!968679 () Bool)

(assert (=> b!1048127 m!968679))

(assert (=> b!1048127 m!968675))

(declare-fun m!968681 () Bool)

(assert (=> start!92212 m!968681))

(declare-fun m!968683 () Bool)

(assert (=> b!1048126 m!968683))

(declare-fun m!968685 () Bool)

(assert (=> b!1048128 m!968685))

(check-sat (not b!1048124) (not b!1048126) (not b!1048128) (not b!1048127) (not start!92212))
(check-sat)
(get-model)

(declare-fun d!127505 () Bool)

(assert (=> d!127505 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1048126 d!127505))

(declare-fun b!1048180 () Bool)

(declare-fun e!594493 () Bool)

(declare-fun e!594496 () Bool)

(assert (=> b!1048180 (= e!594493 e!594496)))

(declare-fun c!106842 () Bool)

(assert (=> b!1048180 (= c!106842 (validKeyInArray!0 (select (arr!31731 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1048181 () Bool)

(declare-fun e!594495 () Bool)

(declare-fun contains!6076 (List!22102 (_ BitVec 64)) Bool)

(assert (=> b!1048181 (= e!594495 (contains!6076 Nil!22099 (select (arr!31731 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1048182 () Bool)

(declare-fun call!44693 () Bool)

(assert (=> b!1048182 (= e!594496 call!44693)))

(declare-fun b!1048183 () Bool)

(assert (=> b!1048183 (= e!594496 call!44693)))

(declare-fun bm!44690 () Bool)

(assert (=> bm!44690 (= call!44693 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106842 (Cons!22098 (select (arr!31731 a!3488) #b00000000000000000000000000000000) Nil!22099) Nil!22099)))))

(declare-fun d!127507 () Bool)

(declare-fun res!697422 () Bool)

(declare-fun e!594494 () Bool)

(assert (=> d!127507 (=> res!697422 e!594494)))

(assert (=> d!127507 (= res!697422 (bvsge #b00000000000000000000000000000000 (size!32269 a!3488)))))

(assert (=> d!127507 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22099) e!594494)))

(declare-fun b!1048184 () Bool)

(assert (=> b!1048184 (= e!594494 e!594493)))

(declare-fun res!697424 () Bool)

(assert (=> b!1048184 (=> (not res!697424) (not e!594493))))

(assert (=> b!1048184 (= res!697424 (not e!594495))))

(declare-fun res!697423 () Bool)

(assert (=> b!1048184 (=> (not res!697423) (not e!594495))))

(assert (=> b!1048184 (= res!697423 (validKeyInArray!0 (select (arr!31731 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!127507 (not res!697422)) b!1048184))

(assert (= (and b!1048184 res!697423) b!1048181))

(assert (= (and b!1048184 res!697424) b!1048180))

(assert (= (and b!1048180 c!106842) b!1048182))

(assert (= (and b!1048180 (not c!106842)) b!1048183))

(assert (= (or b!1048182 b!1048183) bm!44690))

(declare-fun m!968719 () Bool)

(assert (=> b!1048180 m!968719))

(assert (=> b!1048180 m!968719))

(declare-fun m!968721 () Bool)

(assert (=> b!1048180 m!968721))

(assert (=> b!1048181 m!968719))

(assert (=> b!1048181 m!968719))

(declare-fun m!968723 () Bool)

(assert (=> b!1048181 m!968723))

(assert (=> bm!44690 m!968719))

(declare-fun m!968725 () Bool)

(assert (=> bm!44690 m!968725))

(assert (=> b!1048184 m!968719))

(assert (=> b!1048184 m!968719))

(assert (=> b!1048184 m!968721))

(assert (=> b!1048128 d!127507))

(declare-fun d!127513 () Bool)

(declare-fun res!697431 () Bool)

(declare-fun e!594503 () Bool)

(assert (=> d!127513 (=> res!697431 e!594503)))

(assert (=> d!127513 (= res!697431 (= (select (arr!31731 lt!462960) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127513 (= (arrayContainsKey!0 lt!462960 k0!2747 #b00000000000000000000000000000000) e!594503)))

(declare-fun b!1048191 () Bool)

(declare-fun e!594504 () Bool)

(assert (=> b!1048191 (= e!594503 e!594504)))

(declare-fun res!697432 () Bool)

(assert (=> b!1048191 (=> (not res!697432) (not e!594504))))

(assert (=> b!1048191 (= res!697432 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32269 lt!462960)))))

(declare-fun b!1048192 () Bool)

(assert (=> b!1048192 (= e!594504 (arrayContainsKey!0 lt!462960 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127513 (not res!697431)) b!1048191))

(assert (= (and b!1048191 res!697432) b!1048192))

(declare-fun m!968731 () Bool)

(assert (=> d!127513 m!968731))

(declare-fun m!968733 () Bool)

(assert (=> b!1048192 m!968733))

(assert (=> b!1048127 d!127513))

(declare-fun d!127517 () Bool)

(declare-fun lt!462979 () (_ BitVec 32))

(assert (=> d!127517 (and (or (bvslt lt!462979 #b00000000000000000000000000000000) (bvsge lt!462979 (size!32269 lt!462960)) (and (bvsge lt!462979 #b00000000000000000000000000000000) (bvslt lt!462979 (size!32269 lt!462960)))) (bvsge lt!462979 #b00000000000000000000000000000000) (bvslt lt!462979 (size!32269 lt!462960)) (= (select (arr!31731 lt!462960) lt!462979) k0!2747))))

(declare-fun e!594510 () (_ BitVec 32))

(assert (=> d!127517 (= lt!462979 e!594510)))

(declare-fun c!106848 () Bool)

(assert (=> d!127517 (= c!106848 (= (select (arr!31731 lt!462960) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32269 lt!462960)) (bvslt (size!32269 lt!462960) #b01111111111111111111111111111111))))

(assert (=> d!127517 (= (arrayScanForKey!0 lt!462960 k0!2747 #b00000000000000000000000000000000) lt!462979)))

(declare-fun b!1048203 () Bool)

(assert (=> b!1048203 (= e!594510 #b00000000000000000000000000000000)))

(declare-fun b!1048204 () Bool)

(assert (=> b!1048204 (= e!594510 (arrayScanForKey!0 lt!462960 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127517 c!106848) b!1048203))

(assert (= (and d!127517 (not c!106848)) b!1048204))

(declare-fun m!968739 () Bool)

(assert (=> d!127517 m!968739))

(assert (=> d!127517 m!968731))

(declare-fun m!968741 () Bool)

(assert (=> b!1048204 m!968741))

(assert (=> b!1048124 d!127517))

(declare-fun d!127527 () Bool)

(assert (=> d!127527 (= (array_inv!24514 a!3488) (bvsge (size!32269 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92212 d!127527))

(check-sat (not b!1048184) (not b!1048180) (not b!1048204) (not b!1048192) (not b!1048181) (not bm!44690))
(check-sat)
