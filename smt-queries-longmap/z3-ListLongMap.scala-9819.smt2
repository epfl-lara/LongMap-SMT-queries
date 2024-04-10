; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116566 () Bool)

(assert start!116566)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun e!778758 () Bool)

(declare-datatypes ((array!93266 0))(
  ( (array!93267 (arr!45039 (Array (_ BitVec 32) (_ BitVec 64))) (size!45589 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93266)

(declare-fun b!1374661 () Bool)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93266 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374661 (= e!778758 (not (= (arrayCountValidKeys!0 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))))

(declare-fun b!1374658 () Bool)

(declare-fun res!917844 () Bool)

(assert (=> b!1374658 (=> (not res!917844) (not e!778758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374658 (= res!917844 (validKeyInArray!0 (select (arr!45039 a!4142) i!1457)))))

(declare-fun b!1374659 () Bool)

(declare-fun res!917842 () Bool)

(assert (=> b!1374659 (=> (not res!917842) (not e!778758))))

(assert (=> b!1374659 (= res!917842 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!917845 () Bool)

(assert (=> start!116566 (=> (not res!917845) (not e!778758))))

(assert (=> start!116566 (= res!917845 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45589 a!4142))))))

(assert (=> start!116566 e!778758))

(assert (=> start!116566 true))

(declare-fun array_inv!34067 (array!93266) Bool)

(assert (=> start!116566 (array_inv!34067 a!4142)))

(declare-fun b!1374660 () Bool)

(declare-fun res!917843 () Bool)

(assert (=> b!1374660 (=> (not res!917843) (not e!778758))))

(assert (=> b!1374660 (= res!917843 (and (bvslt (size!45589 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45589 a!4142))))))

(assert (= (and start!116566 res!917845) b!1374658))

(assert (= (and b!1374658 res!917844) b!1374659))

(assert (= (and b!1374659 res!917842) b!1374660))

(assert (= (and b!1374660 res!917843) b!1374661))

(declare-fun m!1258215 () Bool)

(assert (=> b!1374661 m!1258215))

(declare-fun m!1258217 () Bool)

(assert (=> b!1374661 m!1258217))

(declare-fun m!1258219 () Bool)

(assert (=> b!1374661 m!1258219))

(declare-fun m!1258221 () Bool)

(assert (=> b!1374658 m!1258221))

(assert (=> b!1374658 m!1258221))

(declare-fun m!1258223 () Bool)

(assert (=> b!1374658 m!1258223))

(declare-fun m!1258225 () Bool)

(assert (=> b!1374659 m!1258225))

(declare-fun m!1258227 () Bool)

(assert (=> start!116566 m!1258227))

(check-sat (not b!1374661) (not b!1374659) (not b!1374658) (not start!116566))
(check-sat)
(get-model)

(declare-fun b!1374683 () Bool)

(declare-fun e!778770 () (_ BitVec 32))

(declare-fun e!778771 () (_ BitVec 32))

(assert (=> b!1374683 (= e!778770 e!778771)))

(declare-fun c!127852 () Bool)

(assert (=> b!1374683 (= c!127852 (validKeyInArray!0 (select (arr!45039 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142))) i!1457)))))

(declare-fun call!65645 () (_ BitVec 32))

(declare-fun bm!65642 () Bool)

(assert (=> bm!65642 (= call!65645 (arrayCountValidKeys!0 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374684 () Bool)

(assert (=> b!1374684 (= e!778771 call!65645)))

(declare-fun b!1374685 () Bool)

(assert (=> b!1374685 (= e!778771 (bvadd #b00000000000000000000000000000001 call!65645))))

(declare-fun d!148141 () Bool)

(declare-fun lt!603865 () (_ BitVec 32))

(assert (=> d!148141 (and (bvsge lt!603865 #b00000000000000000000000000000000) (bvsle lt!603865 (bvsub (size!45589 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142))) i!1457)))))

(assert (=> d!148141 (= lt!603865 e!778770)))

(declare-fun c!127853 () Bool)

(assert (=> d!148141 (= c!127853 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148141 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45589 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142)))))))

(assert (=> d!148141 (= (arrayCountValidKeys!0 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603865)))

(declare-fun b!1374682 () Bool)

(assert (=> b!1374682 (= e!778770 #b00000000000000000000000000000000)))

(assert (= (and d!148141 c!127853) b!1374682))

(assert (= (and d!148141 (not c!127853)) b!1374683))

(assert (= (and b!1374683 c!127852) b!1374685))

(assert (= (and b!1374683 (not c!127852)) b!1374684))

(assert (= (or b!1374685 b!1374684) bm!65642))

(declare-fun m!1258243 () Bool)

(assert (=> b!1374683 m!1258243))

(assert (=> b!1374683 m!1258243))

(declare-fun m!1258245 () Bool)

(assert (=> b!1374683 m!1258245))

(declare-fun m!1258247 () Bool)

(assert (=> bm!65642 m!1258247))

(assert (=> b!1374661 d!148141))

(declare-fun b!1374687 () Bool)

(declare-fun e!778772 () (_ BitVec 32))

(declare-fun e!778773 () (_ BitVec 32))

(assert (=> b!1374687 (= e!778772 e!778773)))

(declare-fun c!127854 () Bool)

(assert (=> b!1374687 (= c!127854 (validKeyInArray!0 (select (arr!45039 a!4142) i!1457)))))

(declare-fun bm!65643 () Bool)

(declare-fun call!65646 () (_ BitVec 32))

(assert (=> bm!65643 (= call!65646 (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374688 () Bool)

(assert (=> b!1374688 (= e!778773 call!65646)))

(declare-fun b!1374689 () Bool)

(assert (=> b!1374689 (= e!778773 (bvadd #b00000000000000000000000000000001 call!65646))))

(declare-fun d!148143 () Bool)

(declare-fun lt!603866 () (_ BitVec 32))

(assert (=> d!148143 (and (bvsge lt!603866 #b00000000000000000000000000000000) (bvsle lt!603866 (bvsub (size!45589 a!4142) i!1457)))))

(assert (=> d!148143 (= lt!603866 e!778772)))

(declare-fun c!127855 () Bool)

(assert (=> d!148143 (= c!127855 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148143 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45589 a!4142)))))

(assert (=> d!148143 (= (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603866)))

(declare-fun b!1374686 () Bool)

(assert (=> b!1374686 (= e!778772 #b00000000000000000000000000000000)))

(assert (= (and d!148143 c!127855) b!1374686))

(assert (= (and d!148143 (not c!127855)) b!1374687))

(assert (= (and b!1374687 c!127854) b!1374689))

(assert (= (and b!1374687 (not c!127854)) b!1374688))

(assert (= (or b!1374689 b!1374688) bm!65643))

(assert (=> b!1374687 m!1258221))

(assert (=> b!1374687 m!1258221))

(assert (=> b!1374687 m!1258223))

(declare-fun m!1258249 () Bool)

(assert (=> bm!65643 m!1258249))

(assert (=> b!1374661 d!148143))

(declare-fun d!148147 () Bool)

(assert (=> d!148147 (= (validKeyInArray!0 k0!2959) (and (not (= k0!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374659 d!148147))

(declare-fun d!148151 () Bool)

(assert (=> d!148151 (= (validKeyInArray!0 (select (arr!45039 a!4142) i!1457)) (and (not (= (select (arr!45039 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45039 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374658 d!148151))

(declare-fun d!148153 () Bool)

(assert (=> d!148153 (= (array_inv!34067 a!4142) (bvsge (size!45589 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116566 d!148153))

(check-sat (not b!1374683) (not bm!65643) (not b!1374687) (not bm!65642))
(check-sat)
(get-model)

(declare-fun d!148171 () Bool)

(assert (=> d!148171 (= (validKeyInArray!0 (select (arr!45039 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142))) i!1457)) (and (not (= (select (arr!45039 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142))) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45039 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142))) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374683 d!148171))

(declare-fun b!1374723 () Bool)

(declare-fun e!778790 () (_ BitVec 32))

(declare-fun e!778791 () (_ BitVec 32))

(assert (=> b!1374723 (= e!778790 e!778791)))

(declare-fun c!127872 () Bool)

(assert (=> b!1374723 (= c!127872 (validKeyInArray!0 (select (arr!45039 a!4142) (bvadd i!1457 #b00000000000000000000000000000001))))))

(declare-fun bm!65652 () Bool)

(declare-fun call!65655 () (_ BitVec 32))

(assert (=> bm!65652 (= call!65655 (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374724 () Bool)

(assert (=> b!1374724 (= e!778791 call!65655)))

(declare-fun b!1374725 () Bool)

(assert (=> b!1374725 (= e!778791 (bvadd #b00000000000000000000000000000001 call!65655))))

(declare-fun d!148173 () Bool)

(declare-fun lt!603875 () (_ BitVec 32))

(assert (=> d!148173 (and (bvsge lt!603875 #b00000000000000000000000000000000) (bvsle lt!603875 (bvsub (size!45589 a!4142) (bvadd i!1457 #b00000000000000000000000000000001))))))

(assert (=> d!148173 (= lt!603875 e!778790)))

(declare-fun c!127873 () Bool)

(assert (=> d!148173 (= c!127873 (bvsge (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148173 (and (bvsle (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd i!1457 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45589 a!4142)))))

(assert (=> d!148173 (= (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603875)))

(declare-fun b!1374722 () Bool)

(assert (=> b!1374722 (= e!778790 #b00000000000000000000000000000000)))

(assert (= (and d!148173 c!127873) b!1374722))

(assert (= (and d!148173 (not c!127873)) b!1374723))

(assert (= (and b!1374723 c!127872) b!1374725))

(assert (= (and b!1374723 (not c!127872)) b!1374724))

(assert (= (or b!1374725 b!1374724) bm!65652))

(declare-fun m!1258267 () Bool)

(assert (=> b!1374723 m!1258267))

(assert (=> b!1374723 m!1258267))

(declare-fun m!1258269 () Bool)

(assert (=> b!1374723 m!1258269))

(declare-fun m!1258271 () Bool)

(assert (=> bm!65652 m!1258271))

(assert (=> bm!65643 d!148173))

(assert (=> b!1374687 d!148151))

(declare-fun b!1374727 () Bool)

(declare-fun e!778792 () (_ BitVec 32))

(declare-fun e!778793 () (_ BitVec 32))

(assert (=> b!1374727 (= e!778792 e!778793)))

(declare-fun c!127874 () Bool)

(assert (=> b!1374727 (= c!127874 (validKeyInArray!0 (select (arr!45039 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142))) (bvadd i!1457 #b00000000000000000000000000000001))))))

(declare-fun call!65656 () (_ BitVec 32))

(declare-fun bm!65653 () Bool)

(assert (=> bm!65653 (= call!65656 (arrayCountValidKeys!0 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374728 () Bool)

(assert (=> b!1374728 (= e!778793 call!65656)))

(declare-fun b!1374729 () Bool)

(assert (=> b!1374729 (= e!778793 (bvadd #b00000000000000000000000000000001 call!65656))))

(declare-fun lt!603876 () (_ BitVec 32))

(declare-fun d!148175 () Bool)

(assert (=> d!148175 (and (bvsge lt!603876 #b00000000000000000000000000000000) (bvsle lt!603876 (bvsub (size!45589 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142))) (bvadd i!1457 #b00000000000000000000000000000001))))))

(assert (=> d!148175 (= lt!603876 e!778792)))

(declare-fun c!127875 () Bool)

(assert (=> d!148175 (= c!127875 (bvsge (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148175 (and (bvsle (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd i!1457 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45589 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142)))))))

(assert (=> d!148175 (= (arrayCountValidKeys!0 (array!93267 (store (arr!45039 a!4142) i!1457 k0!2959) (size!45589 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603876)))

(declare-fun b!1374726 () Bool)

(assert (=> b!1374726 (= e!778792 #b00000000000000000000000000000000)))

(assert (= (and d!148175 c!127875) b!1374726))

(assert (= (and d!148175 (not c!127875)) b!1374727))

(assert (= (and b!1374727 c!127874) b!1374729))

(assert (= (and b!1374727 (not c!127874)) b!1374728))

(assert (= (or b!1374729 b!1374728) bm!65653))

(declare-fun m!1258273 () Bool)

(assert (=> b!1374727 m!1258273))

(assert (=> b!1374727 m!1258273))

(declare-fun m!1258275 () Bool)

(assert (=> b!1374727 m!1258275))

(declare-fun m!1258277 () Bool)

(assert (=> bm!65653 m!1258277))

(assert (=> bm!65642 d!148175))

(check-sat (not b!1374727) (not bm!65652) (not b!1374723) (not bm!65653))
(check-sat)
