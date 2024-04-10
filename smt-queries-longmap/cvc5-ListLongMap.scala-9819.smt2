; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116564 () Bool)

(assert start!116564)

(declare-fun b!1374648 () Bool)

(declare-fun res!917830 () Bool)

(declare-fun e!778752 () Bool)

(assert (=> b!1374648 (=> (not res!917830) (not e!778752))))

(declare-datatypes ((array!93264 0))(
  ( (array!93265 (arr!45038 (Array (_ BitVec 32) (_ BitVec 64))) (size!45588 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93264)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374648 (= res!917830 (and (bvslt (size!45588 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45588 a!4142))))))

(declare-fun b!1374646 () Bool)

(declare-fun res!917831 () Bool)

(assert (=> b!1374646 (=> (not res!917831) (not e!778752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374646 (= res!917831 (validKeyInArray!0 (select (arr!45038 a!4142) i!1457)))))

(declare-fun res!917833 () Bool)

(assert (=> start!116564 (=> (not res!917833) (not e!778752))))

(assert (=> start!116564 (= res!917833 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45588 a!4142))))))

(assert (=> start!116564 e!778752))

(assert (=> start!116564 true))

(declare-fun array_inv!34066 (array!93264) Bool)

(assert (=> start!116564 (array_inv!34066 a!4142)))

(declare-fun b!1374649 () Bool)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93264 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374649 (= e!778752 (not (= (arrayCountValidKeys!0 (array!93265 (store (arr!45038 a!4142) i!1457 k!2959) (size!45588 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))))

(declare-fun b!1374647 () Bool)

(declare-fun res!917832 () Bool)

(assert (=> b!1374647 (=> (not res!917832) (not e!778752))))

(assert (=> b!1374647 (= res!917832 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116564 res!917833) b!1374646))

(assert (= (and b!1374646 res!917831) b!1374647))

(assert (= (and b!1374647 res!917832) b!1374648))

(assert (= (and b!1374648 res!917830) b!1374649))

(declare-fun m!1258201 () Bool)

(assert (=> b!1374646 m!1258201))

(assert (=> b!1374646 m!1258201))

(declare-fun m!1258203 () Bool)

(assert (=> b!1374646 m!1258203))

(declare-fun m!1258205 () Bool)

(assert (=> start!116564 m!1258205))

(declare-fun m!1258207 () Bool)

(assert (=> b!1374649 m!1258207))

(declare-fun m!1258209 () Bool)

(assert (=> b!1374649 m!1258209))

(declare-fun m!1258211 () Bool)

(assert (=> b!1374649 m!1258211))

(declare-fun m!1258213 () Bool)

(assert (=> b!1374647 m!1258213))

(push 1)

(assert (not b!1374647))

(assert (not start!116564))

(assert (not b!1374646))

(assert (not b!1374649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148145 () Bool)

(assert (=> d!148145 (= (validKeyInArray!0 k!2959) (and (not (= k!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374647 d!148145))

(declare-fun d!148149 () Bool)

(assert (=> d!148149 (= (array_inv!34066 a!4142) (bvsge (size!45588 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116564 d!148149))

(declare-fun d!148157 () Bool)

(assert (=> d!148157 (= (validKeyInArray!0 (select (arr!45038 a!4142) i!1457)) (and (not (= (select (arr!45038 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45038 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374646 d!148157))

(declare-fun lt!603869 () (_ BitVec 32))

(declare-fun d!148159 () Bool)

(assert (=> d!148159 (and (bvsge lt!603869 #b00000000000000000000000000000000) (bvsle lt!603869 (bvsub (size!45588 (array!93265 (store (arr!45038 a!4142) i!1457 k!2959) (size!45588 a!4142))) i!1457)))))

(declare-fun e!778779 () (_ BitVec 32))

(assert (=> d!148159 (= lt!603869 e!778779)))

(declare-fun c!127861 () Bool)

(assert (=> d!148159 (= c!127861 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148159 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45588 (array!93265 (store (arr!45038 a!4142) i!1457 k!2959) (size!45588 a!4142)))))))

(assert (=> d!148159 (= (arrayCountValidKeys!0 (array!93265 (store (arr!45038 a!4142) i!1457 k!2959) (size!45588 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603869)))

(declare-fun b!1374698 () Bool)

(declare-fun e!778778 () (_ BitVec 32))

(declare-fun call!65649 () (_ BitVec 32))

(assert (=> b!1374698 (= e!778778 (bvadd #b00000000000000000000000000000001 call!65649))))

(declare-fun b!1374699 () Bool)

(assert (=> b!1374699 (= e!778778 call!65649)))

(declare-fun b!1374700 () Bool)

(assert (=> b!1374700 (= e!778779 e!778778)))

(declare-fun c!127860 () Bool)

(assert (=> b!1374700 (= c!127860 (validKeyInArray!0 (select (arr!45038 (array!93265 (store (arr!45038 a!4142) i!1457 k!2959) (size!45588 a!4142))) i!1457)))))

(declare-fun b!1374701 () Bool)

(assert (=> b!1374701 (= e!778779 #b00000000000000000000000000000000)))

(declare-fun bm!65646 () Bool)

(assert (=> bm!65646 (= call!65649 (arrayCountValidKeys!0 (array!93265 (store (arr!45038 a!4142) i!1457 k!2959) (size!45588 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and d!148159 c!127861) b!1374701))

(assert (= (and d!148159 (not c!127861)) b!1374700))

(assert (= (and b!1374700 c!127860) b!1374698))

(assert (= (and b!1374700 (not c!127860)) b!1374699))

(assert (= (or b!1374698 b!1374699) bm!65646))

(declare-fun m!1258251 () Bool)

(assert (=> b!1374700 m!1258251))

(assert (=> b!1374700 m!1258251))

(declare-fun m!1258253 () Bool)

(assert (=> b!1374700 m!1258253))

(declare-fun m!1258255 () Bool)

(assert (=> bm!65646 m!1258255))

(assert (=> b!1374649 d!148159))

(declare-fun d!148165 () Bool)

(declare-fun lt!603872 () (_ BitVec 32))

(assert (=> d!148165 (and (bvsge lt!603872 #b00000000000000000000000000000000) (bvsle lt!603872 (bvsub (size!45588 a!4142) i!1457)))))

(declare-fun e!778785 () (_ BitVec 32))

(assert (=> d!148165 (= lt!603872 e!778785)))

(declare-fun c!127867 () Bool)

(assert (=> d!148165 (= c!127867 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148165 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45588 a!4142)))))

(assert (=> d!148165 (= (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603872)))

(declare-fun b!1374710 () Bool)

(declare-fun e!778784 () (_ BitVec 32))

(declare-fun call!65652 () (_ BitVec 32))

(assert (=> b!1374710 (= e!778784 (bvadd #b00000000000000000000000000000001 call!65652))))

(declare-fun b!1374711 () Bool)

(assert (=> b!1374711 (= e!778784 call!65652)))

(declare-fun b!1374712 () Bool)

(assert (=> b!1374712 (= e!778785 e!778784)))

(declare-fun c!127866 () Bool)

(assert (=> b!1374712 (= c!127866 (validKeyInArray!0 (select (arr!45038 a!4142) i!1457)))))

(declare-fun b!1374713 () Bool)

(assert (=> b!1374713 (= e!778785 #b00000000000000000000000000000000)))

(declare-fun bm!65649 () Bool)

(assert (=> bm!65649 (= call!65652 (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and d!148165 c!127867) b!1374713))

(assert (= (and d!148165 (not c!127867)) b!1374712))

(assert (= (and b!1374712 c!127866) b!1374710))

(assert (= (and b!1374712 (not c!127866)) b!1374711))

(assert (= (or b!1374710 b!1374711) bm!65649))

(assert (=> b!1374712 m!1258201))

(assert (=> b!1374712 m!1258201))

(assert (=> b!1374712 m!1258203))

(declare-fun m!1258257 () Bool)

(assert (=> bm!65649 m!1258257))

(assert (=> b!1374649 d!148165))

(push 1)

(assert (not b!1374712))

(assert (not bm!65646))

(assert (not bm!65649))

(assert (not b!1374700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

