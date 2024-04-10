; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116568 () Bool)

(assert start!116568)

(declare-fun b!1374670 () Bool)

(declare-fun res!917855 () Bool)

(declare-fun e!778765 () Bool)

(assert (=> b!1374670 (=> (not res!917855) (not e!778765))))

(declare-datatypes ((array!93268 0))(
  ( (array!93269 (arr!45040 (Array (_ BitVec 32) (_ BitVec 64))) (size!45590 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93268)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374670 (= res!917855 (validKeyInArray!0 (select (arr!45040 a!4142) i!1457)))))

(declare-fun b!1374673 () Bool)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93268 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374673 (= e!778765 (not (= (arrayCountValidKeys!0 (array!93269 (store (arr!45040 a!4142) i!1457 k!2959) (size!45590 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))))

(declare-fun res!917857 () Bool)

(assert (=> start!116568 (=> (not res!917857) (not e!778765))))

(assert (=> start!116568 (= res!917857 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45590 a!4142))))))

(assert (=> start!116568 e!778765))

(assert (=> start!116568 true))

(declare-fun array_inv!34068 (array!93268) Bool)

(assert (=> start!116568 (array_inv!34068 a!4142)))

(declare-fun b!1374671 () Bool)

(declare-fun res!917854 () Bool)

(assert (=> b!1374671 (=> (not res!917854) (not e!778765))))

(assert (=> b!1374671 (= res!917854 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374672 () Bool)

(declare-fun res!917856 () Bool)

(assert (=> b!1374672 (=> (not res!917856) (not e!778765))))

(assert (=> b!1374672 (= res!917856 (and (bvslt (size!45590 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45590 a!4142))))))

(assert (= (and start!116568 res!917857) b!1374670))

(assert (= (and b!1374670 res!917855) b!1374671))

(assert (= (and b!1374671 res!917854) b!1374672))

(assert (= (and b!1374672 res!917856) b!1374673))

(declare-fun m!1258229 () Bool)

(assert (=> b!1374670 m!1258229))

(assert (=> b!1374670 m!1258229))

(declare-fun m!1258231 () Bool)

(assert (=> b!1374670 m!1258231))

(declare-fun m!1258233 () Bool)

(assert (=> b!1374673 m!1258233))

(declare-fun m!1258235 () Bool)

(assert (=> b!1374673 m!1258235))

(declare-fun m!1258237 () Bool)

(assert (=> b!1374673 m!1258237))

(declare-fun m!1258239 () Bool)

(assert (=> start!116568 m!1258239))

(declare-fun m!1258241 () Bool)

(assert (=> b!1374671 m!1258241))

(push 1)

(assert (not start!116568))

(assert (not b!1374670))

(assert (not b!1374673))

(assert (not b!1374671))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148155 () Bool)

(assert (=> d!148155 (= (array_inv!34068 a!4142) (bvsge (size!45590 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116568 d!148155))

(declare-fun d!148161 () Bool)

(assert (=> d!148161 (= (validKeyInArray!0 (select (arr!45040 a!4142) i!1457)) (and (not (= (select (arr!45040 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45040 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374670 d!148161))

(declare-fun call!65653 () (_ BitVec 32))

(declare-fun bm!65650 () Bool)

(assert (=> bm!65650 (= call!65653 (arrayCountValidKeys!0 (array!93269 (store (arr!45040 a!4142) i!1457 k!2959) (size!45590 a!4142)) (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374714 () Bool)

(declare-fun e!778787 () (_ BitVec 32))

(declare-fun e!778786 () (_ BitVec 32))

(assert (=> b!1374714 (= e!778787 e!778786)))

(declare-fun c!127868 () Bool)

(assert (=> b!1374714 (= c!127868 (validKeyInArray!0 (select (arr!45040 (array!93269 (store (arr!45040 a!4142) i!1457 k!2959) (size!45590 a!4142))) i!1457)))))

(declare-fun b!1374715 () Bool)

(assert (=> b!1374715 (= e!778786 call!65653)))

(declare-fun b!1374716 () Bool)

(assert (=> b!1374716 (= e!778786 (bvadd #b00000000000000000000000000000001 call!65653))))

(declare-fun d!148163 () Bool)

(declare-fun lt!603873 () (_ BitVec 32))

(assert (=> d!148163 (and (bvsge lt!603873 #b00000000000000000000000000000000) (bvsle lt!603873 (bvsub (size!45590 (array!93269 (store (arr!45040 a!4142) i!1457 k!2959) (size!45590 a!4142))) i!1457)))))

(assert (=> d!148163 (= lt!603873 e!778787)))

(declare-fun c!127869 () Bool)

(assert (=> d!148163 (= c!127869 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148163 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45590 (array!93269 (store (arr!45040 a!4142) i!1457 k!2959) (size!45590 a!4142)))))))

(assert (=> d!148163 (= (arrayCountValidKeys!0 (array!93269 (store (arr!45040 a!4142) i!1457 k!2959) (size!45590 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603873)))

(declare-fun b!1374717 () Bool)

(assert (=> b!1374717 (= e!778787 #b00000000000000000000000000000000)))

(assert (= (and d!148163 c!127869) b!1374717))

(assert (= (and d!148163 (not c!127869)) b!1374714))

(assert (= (and b!1374714 c!127868) b!1374716))

(assert (= (and b!1374714 (not c!127868)) b!1374715))

(assert (= (or b!1374716 b!1374715) bm!65650))

(declare-fun m!1258259 () Bool)

(assert (=> bm!65650 m!1258259))

(declare-fun m!1258261 () Bool)

(assert (=> b!1374714 m!1258261))

(assert (=> b!1374714 m!1258261))

(declare-fun m!1258263 () Bool)

(assert (=> b!1374714 m!1258263))

(assert (=> b!1374673 d!148163))

(declare-fun bm!65651 () Bool)

(declare-fun call!65654 () (_ BitVec 32))

(assert (=> bm!65651 (= call!65654 (arrayCountValidKeys!0 a!4142 (bvadd i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374718 () Bool)

(declare-fun e!778789 () (_ BitVec 32))

(declare-fun e!778788 () (_ BitVec 32))

(assert (=> b!1374718 (= e!778789 e!778788)))

(declare-fun c!127870 () Bool)

(assert (=> b!1374718 (= c!127870 (validKeyInArray!0 (select (arr!45040 a!4142) i!1457)))))

(declare-fun b!1374719 () Bool)

(assert (=> b!1374719 (= e!778788 call!65654)))

(declare-fun b!1374720 () Bool)

(assert (=> b!1374720 (= e!778788 (bvadd #b00000000000000000000000000000001 call!65654))))

(declare-fun d!148167 () Bool)

(declare-fun lt!603874 () (_ BitVec 32))

(assert (=> d!148167 (and (bvsge lt!603874 #b00000000000000000000000000000000) (bvsle lt!603874 (bvsub (size!45590 a!4142) i!1457)))))

(assert (=> d!148167 (= lt!603874 e!778789)))

(declare-fun c!127871 () Bool)

(assert (=> d!148167 (= c!127871 (bvsge i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148167 (and (bvsle i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge i!1457 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45590 a!4142)))))

(assert (=> d!148167 (= (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603874)))

(declare-fun b!1374721 () Bool)

(assert (=> b!1374721 (= e!778789 #b00000000000000000000000000000000)))

(assert (= (and d!148167 c!127871) b!1374721))

(assert (= (and d!148167 (not c!127871)) b!1374718))

(assert (= (and b!1374718 c!127870) b!1374720))

(assert (= (and b!1374718 (not c!127870)) b!1374719))

(assert (= (or b!1374720 b!1374719) bm!65651))

(declare-fun m!1258265 () Bool)

(assert (=> bm!65651 m!1258265))

(assert (=> b!1374718 m!1258229))

(assert (=> b!1374718 m!1258229))

(assert (=> b!1374718 m!1258231))

(assert (=> b!1374673 d!148167))

(declare-fun d!148169 () Bool)

(assert (=> d!148169 (= (validKeyInArray!0 k!2959) (and (not (= k!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374671 d!148169))

(push 1)

(assert (not bm!65650))

(assert (not b!1374718))

(assert (not bm!65651))

(assert (not b!1374714))

(check-sat)

