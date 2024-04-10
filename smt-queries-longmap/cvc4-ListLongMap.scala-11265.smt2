; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131388 () Bool)

(assert start!131388)

(declare-fun b!1540565 () Bool)

(declare-fun e!856797 () Bool)

(declare-fun e!856801 () Bool)

(assert (=> b!1540565 (= e!856797 e!856801)))

(declare-fun res!1057258 () Bool)

(assert (=> b!1540565 (=> (not res!1057258) (not e!856801))))

(declare-datatypes ((SeekEntryResult!13504 0))(
  ( (MissingZero!13504 (index!56411 (_ BitVec 32))) (Found!13504 (index!56412 (_ BitVec 32))) (Intermediate!13504 (undefined!14316 Bool) (index!56413 (_ BitVec 32)) (x!138143 (_ BitVec 32))) (Undefined!13504) (MissingVacant!13504 (index!56414 (_ BitVec 32))) )
))
(declare-fun lt!665420 () SeekEntryResult!13504)

(declare-fun lt!665425 () SeekEntryResult!13504)

(assert (=> b!1540565 (= res!1057258 (= lt!665420 lt!665425))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102336 0))(
  ( (array!102337 (arr!49378 (Array (_ BitVec 32) (_ BitVec 64))) (size!49928 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102336)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!665424 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102336 (_ BitVec 32)) SeekEntryResult!13504)

(assert (=> b!1540565 (= lt!665420 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665424 vacantIndex!5 (select (arr!49378 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540566 () Bool)

(declare-fun res!1057264 () Bool)

(declare-fun e!856798 () Bool)

(assert (=> b!1540566 (=> (not res!1057264) (not e!856798))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540566 (= res!1057264 (validKeyInArray!0 (select (arr!49378 a!2792) i!951)))))

(declare-fun res!1057260 () Bool)

(assert (=> start!131388 (=> (not res!1057260) (not e!856798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131388 (= res!1057260 (validMask!0 mask!2480))))

(assert (=> start!131388 e!856798))

(assert (=> start!131388 true))

(declare-fun array_inv!38406 (array!102336) Bool)

(assert (=> start!131388 (array_inv!38406 a!2792)))

(declare-fun b!1540567 () Bool)

(declare-fun e!856800 () Bool)

(assert (=> b!1540567 (= e!856800 e!856797)))

(declare-fun res!1057263 () Bool)

(assert (=> b!1540567 (=> (not res!1057263) (not e!856797))))

(assert (=> b!1540567 (= res!1057263 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665424 #b00000000000000000000000000000000) (bvslt lt!665424 (size!49928 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540567 (= lt!665424 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540568 () Bool)

(assert (=> b!1540568 (= e!856798 e!856800)))

(declare-fun res!1057261 () Bool)

(assert (=> b!1540568 (=> (not res!1057261) (not e!856800))))

(declare-fun lt!665421 () SeekEntryResult!13504)

(assert (=> b!1540568 (= res!1057261 (and (= lt!665421 lt!665425) (not (= (select (arr!49378 a!2792) index!463) (select (arr!49378 a!2792) j!64)))))))

(assert (=> b!1540568 (= lt!665425 (Found!13504 j!64))))

(assert (=> b!1540568 (= lt!665421 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49378 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540569 () Bool)

(declare-fun res!1057259 () Bool)

(assert (=> b!1540569 (=> (not res!1057259) (not e!856798))))

(declare-datatypes ((List!35852 0))(
  ( (Nil!35849) (Cons!35848 (h!37293 (_ BitVec 64)) (t!50546 List!35852)) )
))
(declare-fun arrayNoDuplicates!0 (array!102336 (_ BitVec 32) List!35852) Bool)

(assert (=> b!1540569 (= res!1057259 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35849))))

(declare-fun b!1540570 () Bool)

(declare-fun res!1057256 () Bool)

(assert (=> b!1540570 (=> (not res!1057256) (not e!856798))))

(assert (=> b!1540570 (= res!1057256 (validKeyInArray!0 (select (arr!49378 a!2792) j!64)))))

(declare-fun b!1540571 () Bool)

(declare-fun res!1057255 () Bool)

(assert (=> b!1540571 (=> (not res!1057255) (not e!856798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102336 (_ BitVec 32)) Bool)

(assert (=> b!1540571 (= res!1057255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540572 () Bool)

(declare-fun res!1057257 () Bool)

(assert (=> b!1540572 (=> (not res!1057257) (not e!856798))))

(assert (=> b!1540572 (= res!1057257 (and (= (size!49928 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49928 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49928 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540573 () Bool)

(declare-fun res!1057262 () Bool)

(assert (=> b!1540573 (=> (not res!1057262) (not e!856798))))

(assert (=> b!1540573 (= res!1057262 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49928 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49928 a!2792)) (= (select (arr!49378 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540574 () Bool)

(declare-fun lt!665419 () array!102336)

(declare-fun lt!665422 () (_ BitVec 64))

(assert (=> b!1540574 (= e!856801 (not (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 lt!665422 lt!665419 mask!2480) lt!665421)))))

(assert (=> b!1540574 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665424 vacantIndex!5 lt!665422 lt!665419 mask!2480) lt!665420)))

(assert (=> b!1540574 (= lt!665422 (select (store (arr!49378 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(assert (=> b!1540574 (= lt!665419 (array!102337 (store (arr!49378 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49928 a!2792)))))

(declare-datatypes ((Unit!51448 0))(
  ( (Unit!51449) )
))
(declare-fun lt!665423 () Unit!51448)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51448)

(assert (=> b!1540574 (= lt!665423 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665424 vacantIndex!5 mask!2480))))

(assert (= (and start!131388 res!1057260) b!1540572))

(assert (= (and b!1540572 res!1057257) b!1540566))

(assert (= (and b!1540566 res!1057264) b!1540570))

(assert (= (and b!1540570 res!1057256) b!1540571))

(assert (= (and b!1540571 res!1057255) b!1540569))

(assert (= (and b!1540569 res!1057259) b!1540573))

(assert (= (and b!1540573 res!1057262) b!1540568))

(assert (= (and b!1540568 res!1057261) b!1540567))

(assert (= (and b!1540567 res!1057263) b!1540565))

(assert (= (and b!1540565 res!1057258) b!1540574))

(declare-fun m!1422693 () Bool)

(assert (=> start!131388 m!1422693))

(declare-fun m!1422695 () Bool)

(assert (=> start!131388 m!1422695))

(declare-fun m!1422697 () Bool)

(assert (=> b!1540569 m!1422697))

(declare-fun m!1422699 () Bool)

(assert (=> b!1540574 m!1422699))

(declare-fun m!1422701 () Bool)

(assert (=> b!1540574 m!1422701))

(declare-fun m!1422703 () Bool)

(assert (=> b!1540574 m!1422703))

(declare-fun m!1422705 () Bool)

(assert (=> b!1540574 m!1422705))

(declare-fun m!1422707 () Bool)

(assert (=> b!1540574 m!1422707))

(declare-fun m!1422709 () Bool)

(assert (=> b!1540568 m!1422709))

(declare-fun m!1422711 () Bool)

(assert (=> b!1540568 m!1422711))

(assert (=> b!1540568 m!1422711))

(declare-fun m!1422713 () Bool)

(assert (=> b!1540568 m!1422713))

(declare-fun m!1422715 () Bool)

(assert (=> b!1540566 m!1422715))

(assert (=> b!1540566 m!1422715))

(declare-fun m!1422717 () Bool)

(assert (=> b!1540566 m!1422717))

(declare-fun m!1422719 () Bool)

(assert (=> b!1540571 m!1422719))

(declare-fun m!1422721 () Bool)

(assert (=> b!1540573 m!1422721))

(declare-fun m!1422723 () Bool)

(assert (=> b!1540567 m!1422723))

(assert (=> b!1540570 m!1422711))

(assert (=> b!1540570 m!1422711))

(declare-fun m!1422725 () Bool)

(assert (=> b!1540570 m!1422725))

(assert (=> b!1540565 m!1422711))

(assert (=> b!1540565 m!1422711))

(declare-fun m!1422727 () Bool)

(assert (=> b!1540565 m!1422727))

(push 1)

(assert (not b!1540570))

(assert (not b!1540571))

(assert (not b!1540566))

(assert (not b!1540569))

(assert (not b!1540574))

(assert (not b!1540565))

(assert (not b!1540568))

(assert (not b!1540567))

(assert (not start!131388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160555 () Bool)

(assert (=> d!160555 (= (validKeyInArray!0 (select (arr!49378 a!2792) i!951)) (and (not (= (select (arr!49378 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49378 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1540566 d!160555))

(declare-fun b!1540655 () Bool)

(declare-fun e!856852 () Bool)

(declare-fun call!68661 () Bool)

(assert (=> b!1540655 (= e!856852 call!68661)))

(declare-fun b!1540657 () Bool)

(declare-fun e!856854 () Bool)

(declare-fun e!856853 () Bool)

(assert (=> b!1540657 (= e!856854 e!856853)))

(declare-fun c!141241 () Bool)

(assert (=> b!1540657 (= c!141241 (validKeyInArray!0 (select (arr!49378 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540659 () Bool)

(assert (=> b!1540659 (= e!856853 e!856852)))

(declare-fun lt!665462 () (_ BitVec 64))

(assert (=> b!1540659 (= lt!665462 (select (arr!49378 a!2792) #b00000000000000000000000000000000))))

(declare-fun lt!665461 () Unit!51448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102336 (_ BitVec 64) (_ BitVec 32)) Unit!51448)

(assert (=> b!1540659 (= lt!665461 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!665462 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1540659 (arrayContainsKey!0 a!2792 lt!665462 #b00000000000000000000000000000000)))

(declare-fun lt!665460 () Unit!51448)

(assert (=> b!1540659 (= lt!665460 lt!665461)))

(declare-fun res!1057287 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102336 (_ BitVec 32)) SeekEntryResult!13504)

(assert (=> b!1540659 (= res!1057287 (= (seekEntryOrOpen!0 (select (arr!49378 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13504 #b00000000000000000000000000000000)))))

(assert (=> b!1540659 (=> (not res!1057287) (not e!856852))))

(declare-fun b!1540660 () Bool)

(assert (=> b!1540660 (= e!856853 call!68661)))

(declare-fun d!160557 () Bool)

(declare-fun res!1057288 () Bool)

(assert (=> d!160557 (=> res!1057288 e!856854)))

(assert (=> d!160557 (= res!1057288 (bvsge #b00000000000000000000000000000000 (size!49928 a!2792)))))

(assert (=> d!160557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!856854)))

(declare-fun bm!68658 () Bool)

(assert (=> bm!68658 (= call!68661 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(assert (= (and d!160557 (not res!1057288)) b!1540657))

(assert (= (and b!1540657 c!141241) b!1540659))

(assert (= (and b!1540657 (not c!141241)) b!1540660))

(assert (= (and b!1540659 res!1057287) b!1540655))

(assert (= (or b!1540655 b!1540660) bm!68658))

(declare-fun m!1422781 () Bool)

(assert (=> b!1540657 m!1422781))

(assert (=> b!1540657 m!1422781))

(declare-fun m!1422783 () Bool)

(assert (=> b!1540657 m!1422783))

(assert (=> b!1540659 m!1422781))

(declare-fun m!1422785 () Bool)

(assert (=> b!1540659 m!1422785))

(declare-fun m!1422787 () Bool)

(assert (=> b!1540659 m!1422787))

(assert (=> b!1540659 m!1422781))

(declare-fun m!1422789 () Bool)

(assert (=> b!1540659 m!1422789))

(declare-fun m!1422791 () Bool)

(assert (=> bm!68658 m!1422791))

(assert (=> b!1540571 d!160557))

(declare-fun b!1540704 () Bool)

(declare-fun e!856883 () SeekEntryResult!13504)

(assert (=> b!1540704 (= e!856883 (seekKeyOrZeroReturnVacant!0 (bvadd x!510 #b00000000000000000000000000000001) (nextIndex!0 index!463 x!510 mask!2480) vacantIndex!5 (select (arr!49378 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540705 () Bool)

(declare-fun e!856884 () SeekEntryResult!13504)

(declare-fun e!856885 () SeekEntryResult!13504)

(assert (=> b!1540705 (= e!856884 e!856885)))

(declare-fun lt!665474 () (_ BitVec 64))

(declare-fun c!141261 () Bool)

(assert (=> b!1540705 (= c!141261 (= lt!665474 (select (arr!49378 a!2792) j!64)))))

(declare-fun lt!665475 () SeekEntryResult!13504)

(declare-fun d!160567 () Bool)

(assert (=> d!160567 (and (or (is-Undefined!13504 lt!665475) (not (is-Found!13504 lt!665475)) (and (bvsge (index!56412 lt!665475) #b00000000000000000000000000000000) (bvslt (index!56412 lt!665475) (size!49928 a!2792)))) (or (is-Undefined!13504 lt!665475) (is-Found!13504 lt!665475) (not (is-MissingVacant!13504 lt!665475)) (not (= (index!56414 lt!665475) vacantIndex!5)) (and (bvsge (index!56414 lt!665475) #b00000000000000000000000000000000) (bvslt (index!56414 lt!665475) (size!49928 a!2792)))) (or (is-Undefined!13504 lt!665475) (ite (is-Found!13504 lt!665475) (= (select (arr!49378 a!2792) (index!56412 lt!665475)) (select (arr!49378 a!2792) j!64)) (and (is-MissingVacant!13504 lt!665475) (= (index!56414 lt!665475) vacantIndex!5) (= (select (arr!49378 a!2792) (index!56414 lt!665475)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!160567 (= lt!665475 e!856884)))

(declare-fun c!141263 () Bool)

(assert (=> d!160567 (= c!141263 (bvsge x!510 #b01111111111111111111111111111110))))

(assert (=> d!160567 (= lt!665474 (select (arr!49378 a!2792) index!463))))

(assert (=> d!160567 (validMask!0 mask!2480)))

(assert (=> d!160567 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49378 a!2792) j!64) a!2792 mask!2480) lt!665475)))

(declare-fun b!1540706 () Bool)

(assert (=> b!1540706 (= e!856885 (Found!13504 index!463))))

(declare-fun b!1540707 () Bool)

(assert (=> b!1540707 (= e!856883 (MissingVacant!13504 vacantIndex!5))))

(declare-fun b!1540708 () Bool)

(declare-fun c!141262 () Bool)

(assert (=> b!1540708 (= c!141262 (= lt!665474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1540708 (= e!856885 e!856883)))

(declare-fun b!1540709 () Bool)

(assert (=> b!1540709 (= e!856884 Undefined!13504)))

(assert (= (and d!160567 c!141263) b!1540709))

(assert (= (and d!160567 (not c!141263)) b!1540705))

(assert (= (and b!1540705 c!141261) b!1540706))

(assert (= (and b!1540705 (not c!141261)) b!1540708))

(assert (= (and b!1540708 c!141262) b!1540707))

(assert (= (and b!1540708 (not c!141262)) b!1540704))

(assert (=> b!1540704 m!1422723))

(assert (=> b!1540704 m!1422723))

(assert (=> b!1540704 m!1422711))

(declare-fun m!1422819 () Bool)

(assert (=> b!1540704 m!1422819))

(declare-fun m!1422821 () Bool)

(assert (=> d!160567 m!1422821))

(declare-fun m!1422823 () Bool)

(assert (=> d!160567 m!1422823))

(assert (=> d!160567 m!1422709))

(assert (=> d!160567 m!1422693))

(assert (=> b!1540568 d!160567))

(declare-fun d!160583 () Bool)

(declare-fun lt!665478 () (_ BitVec 32))

(assert (=> d!160583 (and (bvsge lt!665478 #b00000000000000000000000000000000) (bvslt lt!665478 (bvadd mask!2480 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!160583 (= lt!665478 (choose!52 index!463 x!510 mask!2480))))

(assert (=> d!160583 (validMask!0 mask!2480)))

(assert (=> d!160583 (= (nextIndex!0 index!463 x!510 mask!2480) lt!665478)))

(declare-fun bs!44228 () Bool)

(assert (= bs!44228 d!160583))

(declare-fun m!1422825 () Bool)

(assert (=> bs!44228 m!1422825))

(assert (=> bs!44228 m!1422693))

(assert (=> b!1540567 d!160583))

(declare-fun b!1540720 () Bool)

(declare-fun e!856896 () Bool)

(declare-fun contains!10021 (List!35852 (_ BitVec 64)) Bool)

(assert (=> b!1540720 (= e!856896 (contains!10021 Nil!35849 (select (arr!49378 a!2792) #b00000000000000000000000000000000)))))

(declare-fun d!160585 () Bool)

(declare-fun res!1057304 () Bool)

(declare-fun e!856895 () Bool)

(assert (=> d!160585 (=> res!1057304 e!856895)))

(assert (=> d!160585 (= res!1057304 (bvsge #b00000000000000000000000000000000 (size!49928 a!2792)))))

(assert (=> d!160585 (= (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35849) e!856895)))

(declare-fun b!1540721 () Bool)

(declare-fun e!856897 () Bool)

(declare-fun e!856894 () Bool)

(assert (=> b!1540721 (= e!856897 e!856894)))

(declare-fun c!141266 () Bool)

(assert (=> b!1540721 (= c!141266 (validKeyInArray!0 (select (arr!49378 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1540722 () Bool)

(declare-fun call!68667 () Bool)

(assert (=> b!1540722 (= e!856894 call!68667)))

(declare-fun bm!68664 () Bool)

(assert (=> bm!68664 (= call!68667 (arrayNoDuplicates!0 a!2792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!141266 (Cons!35848 (select (arr!49378 a!2792) #b00000000000000000000000000000000) Nil!35849) Nil!35849)))))

(declare-fun b!1540723 () Bool)

(assert (=> b!1540723 (= e!856894 call!68667)))

(declare-fun b!1540724 () Bool)

(assert (=> b!1540724 (= e!856895 e!856897)))

(declare-fun res!1057305 () Bool)

(assert (=> b!1540724 (=> (not res!1057305) (not e!856897))))

(assert (=> b!1540724 (= res!1057305 (not e!856896))))

(declare-fun res!1057306 () Bool)

(assert (=> b!1540724 (=> (not res!1057306) (not e!856896))))

(assert (=> b!1540724 (= res!1057306 (validKeyInArray!0 (select (arr!49378 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160585 (not res!1057304)) b!1540724))

(assert (= (and b!1540724 res!1057306) b!1540720))

(assert (= (and b!1540724 res!1057305) b!1540721))

(assert (= (and b!1540721 c!141266) b!1540722))

(assert (= (and b!1540721 (not c!141266)) b!1540723))

(assert (= (or b!1540722 b!1540723) bm!68664))

(assert (=> b!1540720 m!1422781))

(assert (=> b!1540720 m!1422781))

(declare-fun m!1422829 () Bool)

(assert (=> b!1540720 m!1422829))

(assert (=> b!1540721 m!1422781))

(assert (=> b!1540721 m!1422781))

(assert (=> b!1540721 m!1422783))

(assert (=> bm!68664 m!1422781))

(declare-fun m!1422831 () Bool)

(assert (=> bm!68664 m!1422831))

(assert (=> b!1540724 m!1422781))

(assert (=> b!1540724 m!1422781))

(assert (=> b!1540724 m!1422783))

(assert (=> b!1540569 d!160585))

(declare-fun d!160595 () Bool)

(assert (=> d!160595 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!131388 d!160595))

(declare-fun d!160603 () Bool)

(assert (=> d!160603 (= (array_inv!38406 a!2792) (bvsge (size!49928 a!2792) #b00000000000000000000000000000000))))

