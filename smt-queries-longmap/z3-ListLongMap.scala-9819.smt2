; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116788 () Bool)

(assert start!116788)

(declare-fun b!1375946 () Bool)

(declare-fun res!918349 () Bool)

(declare-fun e!779596 () Bool)

(assert (=> b!1375946 (=> (not res!918349) (not e!779596))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375946 (= res!918349 (not (validKeyInArray!0 k0!2959)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun b!1375948 () Bool)

(declare-datatypes ((array!93379 0))(
  ( (array!93380 (arr!45091 (Array (_ BitVec 32) (_ BitVec 64))) (size!45642 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93379)

(declare-fun arrayCountValidKeys!0 (array!93379 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375948 (= e!779596 (not (= (arrayCountValidKeys!0 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))))

(declare-fun b!1375947 () Bool)

(declare-fun res!918348 () Bool)

(assert (=> b!1375947 (=> (not res!918348) (not e!779596))))

(assert (=> b!1375947 (= res!918348 (and (bvslt (size!45642 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45642 a!4142))))))

(declare-fun b!1375945 () Bool)

(declare-fun res!918351 () Bool)

(assert (=> b!1375945 (=> (not res!918351) (not e!779596))))

(assert (=> b!1375945 (= res!918351 (validKeyInArray!0 (select (arr!45091 a!4142) i!1457)))))

(declare-fun res!918350 () Bool)

(assert (=> start!116788 (=> (not res!918350) (not e!779596))))

(assert (=> start!116788 (= res!918350 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45642 a!4142))))))

(assert (=> start!116788 e!779596))

(assert (=> start!116788 true))

(declare-fun array_inv!34372 (array!93379) Bool)

(assert (=> start!116788 (array_inv!34372 a!4142)))

(assert (= (and start!116788 res!918350) b!1375945))

(assert (= (and b!1375945 res!918351) b!1375946))

(assert (= (and b!1375946 res!918349) b!1375947))

(assert (= (and b!1375947 res!918348) b!1375948))

(declare-fun m!1259797 () Bool)

(assert (=> b!1375946 m!1259797))

(declare-fun m!1259799 () Bool)

(assert (=> b!1375948 m!1259799))

(declare-fun m!1259801 () Bool)

(assert (=> b!1375948 m!1259801))

(declare-fun m!1259803 () Bool)

(assert (=> b!1375948 m!1259803))

(declare-fun m!1259805 () Bool)

(assert (=> b!1375945 m!1259805))

(assert (=> b!1375945 m!1259805))

(declare-fun m!1259807 () Bool)

(assert (=> b!1375945 m!1259807))

(declare-fun m!1259809 () Bool)

(assert (=> start!116788 m!1259809))

(check-sat (not start!116788) (not b!1375945) (not b!1375946) (not b!1375948))
(check-sat)
(get-model)

(declare-fun d!148585 () Bool)

(assert (=> d!148585 (= (array_inv!34372 a!4142) (bvsge (size!45642 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116788 d!148585))

(declare-fun d!148587 () Bool)

(assert (=> d!148587 (= (validKeyInArray!0 (select (arr!45091 a!4142) i!1457)) (and (not (= (select (arr!45091 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45091 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1375945 d!148587))

(declare-fun d!148589 () Bool)

(assert (=> d!148589 (= (validKeyInArray!0 k0!2959) (and (not (= k0!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1375946 d!148589))

(declare-fun b!1375981 () Bool)

(declare-fun e!779614 () (_ BitVec 32))

(declare-fun call!65710 () (_ BitVec 32))

(assert (=> b!1375981 (= e!779614 (bvadd #b00000000000000000000000000000001 call!65710))))

(declare-fun b!1375982 () Bool)

(declare-fun e!779613 () (_ BitVec 32))

(assert (=> b!1375982 (= e!779613 e!779614)))

(declare-fun c!128250 () Bool)

(assert (=> b!1375982 (= c!128250 (validKeyInArray!0 (select (arr!45091 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142))) i!1457)))))

(declare-fun b!1375983 () Bool)

(assert (=> b!1375983 (= e!779614 call!65710)))

(declare-fun lt!604341 () (_ BitVec 32))

(declare-fun d!148591 () Bool)

(assert (=> d!148591 (and (bvsge lt!604341 #b00000000000000000000000000000000) (bvsle lt!604341 (bvsub (size!45642 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142))) i!1457)))))

(assert (=> d!148591 (= lt!604341 e!779613)))

(declare-fun c!128251 () Bool)

(assert (=> d!148591 (= c!128251 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148591 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45642 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142)))))))

(assert (=> d!148591 (= (arrayCountValidKeys!0 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!604341)))

(declare-fun bm!65707 () Bool)

(assert (=> bm!65707 (= call!65710 (arrayCountValidKeys!0 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375984 () Bool)

(assert (=> b!1375984 (= e!779613 #b00000000000000000000000000000000)))

(assert (= (and d!148591 c!128251) b!1375984))

(assert (= (and d!148591 (not c!128251)) b!1375982))

(assert (= (and b!1375982 c!128250) b!1375981))

(assert (= (and b!1375982 (not c!128250)) b!1375983))

(assert (= (or b!1375981 b!1375983) bm!65707))

(declare-fun m!1259839 () Bool)

(assert (=> b!1375982 m!1259839))

(assert (=> b!1375982 m!1259839))

(declare-fun m!1259841 () Bool)

(assert (=> b!1375982 m!1259841))

(declare-fun m!1259843 () Bool)

(assert (=> bm!65707 m!1259843))

(assert (=> b!1375948 d!148591))

(declare-fun b!1375985 () Bool)

(declare-fun e!779616 () (_ BitVec 32))

(declare-fun call!65711 () (_ BitVec 32))

(assert (=> b!1375985 (= e!779616 (bvadd #b00000000000000000000000000000001 call!65711))))

(declare-fun b!1375986 () Bool)

(declare-fun e!779615 () (_ BitVec 32))

(assert (=> b!1375986 (= e!779615 e!779616)))

(declare-fun c!128252 () Bool)

(assert (=> b!1375986 (= c!128252 (validKeyInArray!0 (select (arr!45091 a!4142) i!1457)))))

(declare-fun b!1375987 () Bool)

(assert (=> b!1375987 (= e!779616 call!65711)))

(declare-fun d!148603 () Bool)

(declare-fun lt!604342 () (_ BitVec 32))

(assert (=> d!148603 (and (bvsge lt!604342 #b00000000000000000000000000000000) (bvsle lt!604342 (bvsub (size!45642 a!4142) i!1457)))))

(assert (=> d!148603 (= lt!604342 e!779615)))

(declare-fun c!128253 () Bool)

(assert (=> d!148603 (= c!128253 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148603 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45642 a!4142)))))

(assert (=> d!148603 (= (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!604342)))

(declare-fun bm!65708 () Bool)

(assert (=> bm!65708 (= call!65711 (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375988 () Bool)

(assert (=> b!1375988 (= e!779615 #b00000000000000000000000000000000)))

(assert (= (and d!148603 c!128253) b!1375988))

(assert (= (and d!148603 (not c!128253)) b!1375986))

(assert (= (and b!1375986 c!128252) b!1375985))

(assert (= (and b!1375986 (not c!128252)) b!1375987))

(assert (= (or b!1375985 b!1375987) bm!65708))

(assert (=> b!1375986 m!1259805))

(assert (=> b!1375986 m!1259805))

(assert (=> b!1375986 m!1259807))

(declare-fun m!1259845 () Bool)

(assert (=> bm!65708 m!1259845))

(assert (=> b!1375948 d!148603))

(check-sat (not b!1375986) (not b!1375982) (not bm!65708) (not bm!65707))
(check-sat)
(get-model)

(assert (=> b!1375986 d!148587))

(declare-fun d!148615 () Bool)

(assert (=> d!148615 (= (validKeyInArray!0 (select (arr!45091 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142))) i!1457)) (and (not (= (select (arr!45091 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142))) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45091 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142))) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1375982 d!148615))

(declare-fun b!1376021 () Bool)

(declare-fun e!779634 () (_ BitVec 32))

(declare-fun call!65720 () (_ BitVec 32))

(assert (=> b!1376021 (= e!779634 (bvadd #b00000000000000000000000000000001 call!65720))))

(declare-fun b!1376022 () Bool)

(declare-fun e!779633 () (_ BitVec 32))

(assert (=> b!1376022 (= e!779633 e!779634)))

(declare-fun c!128270 () Bool)

(assert (=> b!1376022 (= c!128270 (validKeyInArray!0 (select (arr!45091 a!4142) (bvadd i!1457 #b00000000000000000000000000000001))))))

(declare-fun b!1376023 () Bool)

(assert (=> b!1376023 (= e!779634 call!65720)))

(declare-fun d!148617 () Bool)

(declare-fun lt!604351 () (_ BitVec 32))

(assert (=> d!148617 (and (bvsge lt!604351 #b00000000000000000000000000000000) (bvsle lt!604351 (bvsub (size!45642 a!4142) (bvadd i!1457 #b00000000000000000000000000000001))))))

(assert (=> d!148617 (= lt!604351 e!779633)))

(declare-fun c!128271 () Bool)

(assert (=> d!148617 (= c!128271 (bvsge (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148617 (and (bvsle (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd i!1457 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45642 a!4142)))))

(assert (=> d!148617 (= (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) lt!604351)))

(declare-fun bm!65717 () Bool)

(assert (=> bm!65717 (= call!65720 (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1376024 () Bool)

(assert (=> b!1376024 (= e!779633 #b00000000000000000000000000000000)))

(assert (= (and d!148617 c!128271) b!1376024))

(assert (= (and d!148617 (not c!128271)) b!1376022))

(assert (= (and b!1376022 c!128270) b!1376021))

(assert (= (and b!1376022 (not c!128270)) b!1376023))

(assert (= (or b!1376021 b!1376023) bm!65717))

(declare-fun m!1259863 () Bool)

(assert (=> b!1376022 m!1259863))

(assert (=> b!1376022 m!1259863))

(declare-fun m!1259865 () Bool)

(assert (=> b!1376022 m!1259865))

(declare-fun m!1259867 () Bool)

(assert (=> bm!65717 m!1259867))

(assert (=> bm!65708 d!148617))

(declare-fun b!1376025 () Bool)

(declare-fun e!779636 () (_ BitVec 32))

(declare-fun call!65721 () (_ BitVec 32))

(assert (=> b!1376025 (= e!779636 (bvadd #b00000000000000000000000000000001 call!65721))))

(declare-fun b!1376026 () Bool)

(declare-fun e!779635 () (_ BitVec 32))

(assert (=> b!1376026 (= e!779635 e!779636)))

(declare-fun c!128272 () Bool)

(assert (=> b!1376026 (= c!128272 (validKeyInArray!0 (select (arr!45091 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142))) (bvadd i!1457 #b00000000000000000000000000000001))))))

(declare-fun b!1376027 () Bool)

(assert (=> b!1376027 (= e!779636 call!65721)))

(declare-fun d!148619 () Bool)

(declare-fun lt!604352 () (_ BitVec 32))

(assert (=> d!148619 (and (bvsge lt!604352 #b00000000000000000000000000000000) (bvsle lt!604352 (bvsub (size!45642 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142))) (bvadd i!1457 #b00000000000000000000000000000001))))))

(assert (=> d!148619 (= lt!604352 e!779635)))

(declare-fun c!128273 () Bool)

(assert (=> d!148619 (= c!128273 (bvsge (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148619 (and (bvsle (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd i!1457 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45642 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142)))))))

(assert (=> d!148619 (= (arrayCountValidKeys!0 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) lt!604352)))

(declare-fun bm!65718 () Bool)

(assert (=> bm!65718 (= call!65721 (arrayCountValidKeys!0 (array!93380 (store (arr!45091 a!4142) i!1457 k0!2959) (size!45642 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1376028 () Bool)

(assert (=> b!1376028 (= e!779635 #b00000000000000000000000000000000)))

(assert (= (and d!148619 c!128273) b!1376028))

(assert (= (and d!148619 (not c!128273)) b!1376026))

(assert (= (and b!1376026 c!128272) b!1376025))

(assert (= (and b!1376026 (not c!128272)) b!1376027))

(assert (= (or b!1376025 b!1376027) bm!65718))

(declare-fun m!1259869 () Bool)

(assert (=> b!1376026 m!1259869))

(assert (=> b!1376026 m!1259869))

(declare-fun m!1259871 () Bool)

(assert (=> b!1376026 m!1259871))

(declare-fun m!1259873 () Bool)

(assert (=> bm!65718 m!1259873))

(assert (=> bm!65707 d!148619))

(check-sat (not bm!65717) (not b!1376026) (not bm!65718) (not b!1376022))
(check-sat)
