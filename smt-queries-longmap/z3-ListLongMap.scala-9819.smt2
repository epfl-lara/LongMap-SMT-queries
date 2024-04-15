; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116554 () Bool)

(assert start!116554)

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93213 0))(
  ( (array!93214 (arr!45013 (Array (_ BitVec 32) (_ BitVec 64))) (size!45565 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93213)

(declare-fun e!778718 () Bool)

(declare-fun b!1374577 () Bool)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93213 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374577 (= e!778718 (not (= (arrayCountValidKeys!0 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))))

(declare-fun b!1374575 () Bool)

(declare-fun res!917803 () Bool)

(assert (=> b!1374575 (=> (not res!917803) (not e!778718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374575 (= res!917803 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!917804 () Bool)

(assert (=> start!116554 (=> (not res!917804) (not e!778718))))

(assert (=> start!116554 (= res!917804 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45565 a!4142))))))

(assert (=> start!116554 e!778718))

(assert (=> start!116554 true))

(declare-fun array_inv!34246 (array!93213) Bool)

(assert (=> start!116554 (array_inv!34246 a!4142)))

(declare-fun b!1374576 () Bool)

(declare-fun res!917801 () Bool)

(assert (=> b!1374576 (=> (not res!917801) (not e!778718))))

(assert (=> b!1374576 (= res!917801 (and (bvslt (size!45565 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45565 a!4142))))))

(declare-fun b!1374574 () Bool)

(declare-fun res!917802 () Bool)

(assert (=> b!1374574 (=> (not res!917802) (not e!778718))))

(assert (=> b!1374574 (= res!917802 (validKeyInArray!0 (select (arr!45013 a!4142) i!1457)))))

(assert (= (and start!116554 res!917804) b!1374574))

(assert (= (and b!1374574 res!917802) b!1374575))

(assert (= (and b!1374575 res!917803) b!1374576))

(assert (= (and b!1374576 res!917801) b!1374577))

(declare-fun m!1257675 () Bool)

(assert (=> b!1374577 m!1257675))

(declare-fun m!1257677 () Bool)

(assert (=> b!1374577 m!1257677))

(declare-fun m!1257679 () Bool)

(assert (=> b!1374577 m!1257679))

(declare-fun m!1257681 () Bool)

(assert (=> b!1374575 m!1257681))

(declare-fun m!1257683 () Bool)

(assert (=> start!116554 m!1257683))

(declare-fun m!1257685 () Bool)

(assert (=> b!1374574 m!1257685))

(assert (=> b!1374574 m!1257685))

(declare-fun m!1257687 () Bool)

(assert (=> b!1374574 m!1257687))

(check-sat (not start!116554) (not b!1374577) (not b!1374575) (not b!1374574))
(check-sat)
(get-model)

(declare-fun d!148013 () Bool)

(assert (=> d!148013 (= (array_inv!34246 a!4142) (bvsge (size!45565 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116554 d!148013))

(declare-fun call!65626 () (_ BitVec 32))

(declare-fun bm!65623 () Bool)

(assert (=> bm!65623 (= call!65626 (arrayCountValidKeys!0 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374610 () Bool)

(declare-fun e!778737 () (_ BitVec 32))

(declare-fun e!778736 () (_ BitVec 32))

(assert (=> b!1374610 (= e!778737 e!778736)))

(declare-fun c!127833 () Bool)

(assert (=> b!1374610 (= c!127833 (validKeyInArray!0 (select (arr!45013 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142))) i!1457)))))

(declare-fun d!148015 () Bool)

(declare-fun lt!603678 () (_ BitVec 32))

(assert (=> d!148015 (and (bvsge lt!603678 #b00000000000000000000000000000000) (bvsle lt!603678 (bvsub (size!45565 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142))) i!1457)))))

(assert (=> d!148015 (= lt!603678 e!778737)))

(declare-fun c!127834 () Bool)

(assert (=> d!148015 (= c!127834 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148015 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45565 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142)))))))

(assert (=> d!148015 (= (arrayCountValidKeys!0 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603678)))

(declare-fun b!1374611 () Bool)

(assert (=> b!1374611 (= e!778737 #b00000000000000000000000000000000)))

(declare-fun b!1374612 () Bool)

(assert (=> b!1374612 (= e!778736 (bvadd #b00000000000000000000000000000001 call!65626))))

(declare-fun b!1374613 () Bool)

(assert (=> b!1374613 (= e!778736 call!65626)))

(assert (= (and d!148015 c!127834) b!1374611))

(assert (= (and d!148015 (not c!127834)) b!1374610))

(assert (= (and b!1374610 c!127833) b!1374612))

(assert (= (and b!1374610 (not c!127833)) b!1374613))

(assert (= (or b!1374612 b!1374613) bm!65623))

(declare-fun m!1257717 () Bool)

(assert (=> bm!65623 m!1257717))

(declare-fun m!1257719 () Bool)

(assert (=> b!1374610 m!1257719))

(assert (=> b!1374610 m!1257719))

(declare-fun m!1257721 () Bool)

(assert (=> b!1374610 m!1257721))

(assert (=> b!1374577 d!148015))

(declare-fun bm!65624 () Bool)

(declare-fun call!65627 () (_ BitVec 32))

(assert (=> bm!65624 (= call!65627 (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374614 () Bool)

(declare-fun e!778739 () (_ BitVec 32))

(declare-fun e!778738 () (_ BitVec 32))

(assert (=> b!1374614 (= e!778739 e!778738)))

(declare-fun c!127835 () Bool)

(assert (=> b!1374614 (= c!127835 (validKeyInArray!0 (select (arr!45013 a!4142) i!1457)))))

(declare-fun d!148019 () Bool)

(declare-fun lt!603679 () (_ BitVec 32))

(assert (=> d!148019 (and (bvsge lt!603679 #b00000000000000000000000000000000) (bvsle lt!603679 (bvsub (size!45565 a!4142) i!1457)))))

(assert (=> d!148019 (= lt!603679 e!778739)))

(declare-fun c!127836 () Bool)

(assert (=> d!148019 (= c!127836 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148019 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45565 a!4142)))))

(assert (=> d!148019 (= (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603679)))

(declare-fun b!1374615 () Bool)

(assert (=> b!1374615 (= e!778739 #b00000000000000000000000000000000)))

(declare-fun b!1374616 () Bool)

(assert (=> b!1374616 (= e!778738 (bvadd #b00000000000000000000000000000001 call!65627))))

(declare-fun b!1374617 () Bool)

(assert (=> b!1374617 (= e!778738 call!65627)))

(assert (= (and d!148019 c!127836) b!1374615))

(assert (= (and d!148019 (not c!127836)) b!1374614))

(assert (= (and b!1374614 c!127835) b!1374616))

(assert (= (and b!1374614 (not c!127835)) b!1374617))

(assert (= (or b!1374616 b!1374617) bm!65624))

(declare-fun m!1257723 () Bool)

(assert (=> bm!65624 m!1257723))

(assert (=> b!1374614 m!1257685))

(assert (=> b!1374614 m!1257685))

(assert (=> b!1374614 m!1257687))

(assert (=> b!1374577 d!148019))

(declare-fun d!148021 () Bool)

(assert (=> d!148021 (= (validKeyInArray!0 k0!2959) (and (not (= k0!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374575 d!148021))

(declare-fun d!148025 () Bool)

(assert (=> d!148025 (= (validKeyInArray!0 (select (arr!45013 a!4142) i!1457)) (and (not (= (select (arr!45013 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45013 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374574 d!148025))

(check-sat (not bm!65623) (not bm!65624) (not b!1374610) (not b!1374614))
(check-sat)
(get-model)

(declare-fun bm!65633 () Bool)

(declare-fun call!65636 () (_ BitVec 32))

(assert (=> bm!65633 (= call!65636 (arrayCountValidKeys!0 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374650 () Bool)

(declare-fun e!778757 () (_ BitVec 32))

(declare-fun e!778756 () (_ BitVec 32))

(assert (=> b!1374650 (= e!778757 e!778756)))

(declare-fun c!127853 () Bool)

(assert (=> b!1374650 (= c!127853 (validKeyInArray!0 (select (arr!45013 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142))) (bvadd i!1457 #b00000000000000000000000000000001))))))

(declare-fun d!148043 () Bool)

(declare-fun lt!603688 () (_ BitVec 32))

(assert (=> d!148043 (and (bvsge lt!603688 #b00000000000000000000000000000000) (bvsle lt!603688 (bvsub (size!45565 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142))) (bvadd i!1457 #b00000000000000000000000000000001))))))

(assert (=> d!148043 (= lt!603688 e!778757)))

(declare-fun c!127854 () Bool)

(assert (=> d!148043 (= c!127854 (bvsge (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148043 (and (bvsle (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd i!1457 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45565 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142)))))))

(assert (=> d!148043 (= (arrayCountValidKeys!0 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603688)))

(declare-fun b!1374651 () Bool)

(assert (=> b!1374651 (= e!778757 #b00000000000000000000000000000000)))

(declare-fun b!1374652 () Bool)

(assert (=> b!1374652 (= e!778756 (bvadd #b00000000000000000000000000000001 call!65636))))

(declare-fun b!1374653 () Bool)

(assert (=> b!1374653 (= e!778756 call!65636)))

(assert (= (and d!148043 c!127854) b!1374651))

(assert (= (and d!148043 (not c!127854)) b!1374650))

(assert (= (and b!1374650 c!127853) b!1374652))

(assert (= (and b!1374650 (not c!127853)) b!1374653))

(assert (= (or b!1374652 b!1374653) bm!65633))

(declare-fun m!1257741 () Bool)

(assert (=> bm!65633 m!1257741))

(declare-fun m!1257743 () Bool)

(assert (=> b!1374650 m!1257743))

(assert (=> b!1374650 m!1257743))

(declare-fun m!1257745 () Bool)

(assert (=> b!1374650 m!1257745))

(assert (=> bm!65623 d!148043))

(declare-fun bm!65634 () Bool)

(declare-fun call!65637 () (_ BitVec 32))

(assert (=> bm!65634 (= call!65637 (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374654 () Bool)

(declare-fun e!778759 () (_ BitVec 32))

(declare-fun e!778758 () (_ BitVec 32))

(assert (=> b!1374654 (= e!778759 e!778758)))

(declare-fun c!127855 () Bool)

(assert (=> b!1374654 (= c!127855 (validKeyInArray!0 (select (arr!45013 a!4142) (bvadd i!1457 #b00000000000000000000000000000001))))))

(declare-fun d!148045 () Bool)

(declare-fun lt!603689 () (_ BitVec 32))

(assert (=> d!148045 (and (bvsge lt!603689 #b00000000000000000000000000000000) (bvsle lt!603689 (bvsub (size!45565 a!4142) (bvadd i!1457 #b00000000000000000000000000000001))))))

(assert (=> d!148045 (= lt!603689 e!778759)))

(declare-fun c!127856 () Bool)

(assert (=> d!148045 (= c!127856 (bvsge (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148045 (and (bvsle (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd i!1457 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45565 a!4142)))))

(assert (=> d!148045 (= (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603689)))

(declare-fun b!1374655 () Bool)

(assert (=> b!1374655 (= e!778759 #b00000000000000000000000000000000)))

(declare-fun b!1374656 () Bool)

(assert (=> b!1374656 (= e!778758 (bvadd #b00000000000000000000000000000001 call!65637))))

(declare-fun b!1374657 () Bool)

(assert (=> b!1374657 (= e!778758 call!65637)))

(assert (= (and d!148045 c!127856) b!1374655))

(assert (= (and d!148045 (not c!127856)) b!1374654))

(assert (= (and b!1374654 c!127855) b!1374656))

(assert (= (and b!1374654 (not c!127855)) b!1374657))

(assert (= (or b!1374656 b!1374657) bm!65634))

(declare-fun m!1257747 () Bool)

(assert (=> bm!65634 m!1257747))

(declare-fun m!1257749 () Bool)

(assert (=> b!1374654 m!1257749))

(assert (=> b!1374654 m!1257749))

(declare-fun m!1257751 () Bool)

(assert (=> b!1374654 m!1257751))

(assert (=> bm!65624 d!148045))

(declare-fun d!148047 () Bool)

(assert (=> d!148047 (= (validKeyInArray!0 (select (arr!45013 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142))) i!1457)) (and (not (= (select (arr!45013 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142))) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45013 (array!93214 (store (arr!45013 a!4142) i!1457 k0!2959) (size!45565 a!4142))) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374610 d!148047))

(assert (=> b!1374614 d!148025))

(check-sat (not b!1374654) (not bm!65634) (not b!1374650) (not bm!65633))
(check-sat)
