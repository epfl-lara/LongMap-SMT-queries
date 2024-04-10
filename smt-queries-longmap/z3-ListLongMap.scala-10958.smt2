; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128258 () Bool)

(assert start!128258)

(declare-fun b!1505530 () Bool)

(declare-fun res!1025979 () Bool)

(declare-fun e!841459 () Bool)

(assert (=> b!1505530 (=> (not res!1025979) (not e!841459))))

(declare-datatypes ((array!100411 0))(
  ( (array!100412 (arr!48456 (Array (_ BitVec 32) (_ BitVec 64))) (size!49006 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100411)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505530 (= res!1025979 (validKeyInArray!0 (select (arr!48456 a!2804) i!961)))))

(declare-fun b!1505531 () Bool)

(assert (=> b!1505531 (= e!841459 (and (bvsle #b00000000000000000000000000000000 (size!49006 a!2804)) (bvsge (size!49006 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505532 () Bool)

(declare-fun res!1025976 () Bool)

(assert (=> b!1505532 (=> (not res!1025976) (not e!841459))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100411 (_ BitVec 32)) Bool)

(assert (=> b!1505532 (= res!1025976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1025980 () Bool)

(assert (=> start!128258 (=> (not res!1025980) (not e!841459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128258 (= res!1025980 (validMask!0 mask!2512))))

(assert (=> start!128258 e!841459))

(assert (=> start!128258 true))

(declare-fun array_inv!37484 (array!100411) Bool)

(assert (=> start!128258 (array_inv!37484 a!2804)))

(declare-fun b!1505533 () Bool)

(declare-fun res!1025978 () Bool)

(assert (=> b!1505533 (=> (not res!1025978) (not e!841459))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505533 (= res!1025978 (validKeyInArray!0 (select (arr!48456 a!2804) j!70)))))

(declare-fun b!1505534 () Bool)

(declare-fun res!1025977 () Bool)

(assert (=> b!1505534 (=> (not res!1025977) (not e!841459))))

(assert (=> b!1505534 (= res!1025977 (and (= (size!49006 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49006 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49006 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128258 res!1025980) b!1505534))

(assert (= (and b!1505534 res!1025977) b!1505530))

(assert (= (and b!1505530 res!1025979) b!1505533))

(assert (= (and b!1505533 res!1025978) b!1505532))

(assert (= (and b!1505532 res!1025976) b!1505531))

(declare-fun m!1388625 () Bool)

(assert (=> b!1505530 m!1388625))

(assert (=> b!1505530 m!1388625))

(declare-fun m!1388627 () Bool)

(assert (=> b!1505530 m!1388627))

(declare-fun m!1388629 () Bool)

(assert (=> b!1505532 m!1388629))

(declare-fun m!1388631 () Bool)

(assert (=> start!128258 m!1388631))

(declare-fun m!1388633 () Bool)

(assert (=> start!128258 m!1388633))

(declare-fun m!1388635 () Bool)

(assert (=> b!1505533 m!1388635))

(assert (=> b!1505533 m!1388635))

(declare-fun m!1388637 () Bool)

(assert (=> b!1505533 m!1388637))

(check-sat (not start!128258) (not b!1505530) (not b!1505533) (not b!1505532))
(check-sat)
(get-model)

(declare-fun d!158031 () Bool)

(assert (=> d!158031 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128258 d!158031))

(declare-fun d!158039 () Bool)

(assert (=> d!158039 (= (array_inv!37484 a!2804) (bvsge (size!49006 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128258 d!158039))

(declare-fun d!158041 () Bool)

(assert (=> d!158041 (= (validKeyInArray!0 (select (arr!48456 a!2804) i!961)) (and (not (= (select (arr!48456 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48456 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505530 d!158041))

(declare-fun d!158043 () Bool)

(assert (=> d!158043 (= (validKeyInArray!0 (select (arr!48456 a!2804) j!70)) (and (not (= (select (arr!48456 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48456 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505533 d!158043))

(declare-fun d!158045 () Bool)

(declare-fun res!1026012 () Bool)

(declare-fun e!841491 () Bool)

(assert (=> d!158045 (=> res!1026012 e!841491)))

(assert (=> d!158045 (= res!1026012 (bvsge #b00000000000000000000000000000000 (size!49006 a!2804)))))

(assert (=> d!158045 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841491)))

(declare-fun b!1505582 () Bool)

(declare-fun e!841490 () Bool)

(assert (=> b!1505582 (= e!841491 e!841490)))

(declare-fun c!139319 () Bool)

(assert (=> b!1505582 (= c!139319 (validKeyInArray!0 (select (arr!48456 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505583 () Bool)

(declare-fun e!841492 () Bool)

(declare-fun call!68184 () Bool)

(assert (=> b!1505583 (= e!841492 call!68184)))

(declare-fun bm!68181 () Bool)

(assert (=> bm!68181 (= call!68184 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505584 () Bool)

(assert (=> b!1505584 (= e!841490 call!68184)))

(declare-fun b!1505585 () Bool)

(assert (=> b!1505585 (= e!841490 e!841492)))

(declare-fun lt!654048 () (_ BitVec 64))

(assert (=> b!1505585 (= lt!654048 (select (arr!48456 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50300 0))(
  ( (Unit!50301) )
))
(declare-fun lt!654047 () Unit!50300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100411 (_ BitVec 64) (_ BitVec 32)) Unit!50300)

(assert (=> b!1505585 (= lt!654047 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654048 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505585 (arrayContainsKey!0 a!2804 lt!654048 #b00000000000000000000000000000000)))

(declare-fun lt!654049 () Unit!50300)

(assert (=> b!1505585 (= lt!654049 lt!654047)))

(declare-fun res!1026013 () Bool)

(declare-datatypes ((SeekEntryResult!12647 0))(
  ( (MissingZero!12647 (index!52983 (_ BitVec 32))) (Found!12647 (index!52984 (_ BitVec 32))) (Intermediate!12647 (undefined!13459 Bool) (index!52985 (_ BitVec 32)) (x!134690 (_ BitVec 32))) (Undefined!12647) (MissingVacant!12647 (index!52986 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100411 (_ BitVec 32)) SeekEntryResult!12647)

(assert (=> b!1505585 (= res!1026013 (= (seekEntryOrOpen!0 (select (arr!48456 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12647 #b00000000000000000000000000000000)))))

(assert (=> b!1505585 (=> (not res!1026013) (not e!841492))))

(assert (= (and d!158045 (not res!1026012)) b!1505582))

(assert (= (and b!1505582 c!139319) b!1505585))

(assert (= (and b!1505582 (not c!139319)) b!1505584))

(assert (= (and b!1505585 res!1026013) b!1505583))

(assert (= (or b!1505583 b!1505584) bm!68181))

(declare-fun m!1388677 () Bool)

(assert (=> b!1505582 m!1388677))

(assert (=> b!1505582 m!1388677))

(declare-fun m!1388679 () Bool)

(assert (=> b!1505582 m!1388679))

(declare-fun m!1388681 () Bool)

(assert (=> bm!68181 m!1388681))

(assert (=> b!1505585 m!1388677))

(declare-fun m!1388683 () Bool)

(assert (=> b!1505585 m!1388683))

(declare-fun m!1388685 () Bool)

(assert (=> b!1505585 m!1388685))

(assert (=> b!1505585 m!1388677))

(declare-fun m!1388687 () Bool)

(assert (=> b!1505585 m!1388687))

(assert (=> b!1505532 d!158045))

(check-sat (not b!1505585) (not bm!68181) (not b!1505582))
(check-sat)
