; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102618 () Bool)

(assert start!102618)

(declare-fun b!1233047 () Bool)

(declare-fun res!820670 () Bool)

(declare-fun e!699560 () Bool)

(assert (=> b!1233047 (=> (not res!820670) (not e!699560))))

(declare-datatypes ((array!79484 0))(
  ( (array!79485 (arr!38351 (Array (_ BitVec 32) (_ BitVec 64))) (size!38888 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79484)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233047 (= res!820670 (validKeyInArray!0 (select (arr!38351 a!3806) from!3184)))))

(declare-fun b!1233048 () Bool)

(declare-fun res!820671 () Bool)

(assert (=> b!1233048 (=> (not res!820671) (not e!699560))))

(declare-datatypes ((List!27137 0))(
  ( (Nil!27134) (Cons!27133 (h!28351 (_ BitVec 64)) (t!40592 List!27137)) )
))
(declare-fun acc!823 () List!27137)

(declare-fun contains!7208 (List!27137 (_ BitVec 64)) Bool)

(assert (=> b!1233048 (= res!820671 (not (contains!7208 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!820669 () Bool)

(assert (=> start!102618 (=> (not res!820669) (not e!699560))))

(assert (=> start!102618 (= res!820669 (bvslt (size!38888 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102618 e!699560))

(declare-fun array_inv!29289 (array!79484) Bool)

(assert (=> start!102618 (array_inv!29289 a!3806)))

(assert (=> start!102618 true))

(declare-fun b!1233049 () Bool)

(declare-fun res!820674 () Bool)

(assert (=> b!1233049 (=> (not res!820674) (not e!699560))))

(declare-fun arrayNoDuplicates!0 (array!79484 (_ BitVec 32) List!27137) Bool)

(assert (=> b!1233049 (= res!820674 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233050 () Bool)

(declare-fun res!820675 () Bool)

(assert (=> b!1233050 (=> (not res!820675) (not e!699560))))

(assert (=> b!1233050 (= res!820675 (not (contains!7208 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233051 () Bool)

(declare-fun res!820673 () Bool)

(assert (=> b!1233051 (=> (not res!820673) (not e!699560))))

(assert (=> b!1233051 (= res!820673 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38888 a!3806)) (bvslt from!3184 (size!38888 a!3806))))))

(declare-fun b!1233052 () Bool)

(declare-fun res!820668 () Bool)

(assert (=> b!1233052 (=> (not res!820668) (not e!699560))))

(declare-fun noDuplicate!1789 (List!27137) Bool)

(assert (=> b!1233052 (= res!820668 (noDuplicate!1789 acc!823))))

(declare-fun b!1233053 () Bool)

(declare-fun res!820676 () Bool)

(assert (=> b!1233053 (=> (not res!820676) (not e!699560))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1233053 (= res!820676 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233054 () Bool)

(assert (=> b!1233054 (= e!699560 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27133 (select (arr!38351 a!3806) from!3184) Nil!27134))))))

(assert (=> b!1233054 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27134)))

(declare-datatypes ((Unit!40757 0))(
  ( (Unit!40758) )
))
(declare-fun lt!559926 () Unit!40757)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79484 List!27137 List!27137 (_ BitVec 32)) Unit!40757)

(assert (=> b!1233054 (= lt!559926 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27134 from!3184))))

(assert (=> b!1233054 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27133 (select (arr!38351 a!3806) from!3184) acc!823))))

(declare-fun b!1233055 () Bool)

(declare-fun res!820672 () Bool)

(assert (=> b!1233055 (=> (not res!820672) (not e!699560))))

(declare-fun arrayContainsKey!0 (array!79484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233055 (= res!820672 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102618 res!820669) b!1233053))

(assert (= (and b!1233053 res!820676) b!1233051))

(assert (= (and b!1233051 res!820673) b!1233052))

(assert (= (and b!1233052 res!820668) b!1233050))

(assert (= (and b!1233050 res!820675) b!1233048))

(assert (= (and b!1233048 res!820671) b!1233055))

(assert (= (and b!1233055 res!820672) b!1233049))

(assert (= (and b!1233049 res!820674) b!1233047))

(assert (= (and b!1233047 res!820670) b!1233054))

(declare-fun m!1137471 () Bool)

(assert (=> b!1233048 m!1137471))

(declare-fun m!1137473 () Bool)

(assert (=> b!1233047 m!1137473))

(assert (=> b!1233047 m!1137473))

(declare-fun m!1137475 () Bool)

(assert (=> b!1233047 m!1137475))

(declare-fun m!1137477 () Bool)

(assert (=> b!1233053 m!1137477))

(declare-fun m!1137479 () Bool)

(assert (=> b!1233049 m!1137479))

(declare-fun m!1137481 () Bool)

(assert (=> b!1233050 m!1137481))

(declare-fun m!1137483 () Bool)

(assert (=> b!1233055 m!1137483))

(declare-fun m!1137485 () Bool)

(assert (=> b!1233054 m!1137485))

(declare-fun m!1137487 () Bool)

(assert (=> b!1233054 m!1137487))

(assert (=> b!1233054 m!1137473))

(declare-fun m!1137489 () Bool)

(assert (=> b!1233054 m!1137489))

(declare-fun m!1137491 () Bool)

(assert (=> b!1233054 m!1137491))

(declare-fun m!1137493 () Bool)

(assert (=> start!102618 m!1137493))

(declare-fun m!1137495 () Bool)

(assert (=> b!1233052 m!1137495))

(check-sat (not b!1233055) (not b!1233048) (not start!102618) (not b!1233047) (not b!1233054) (not b!1233050) (not b!1233053) (not b!1233049) (not b!1233052))
(check-sat)
(get-model)

(declare-fun d!135249 () Bool)

(declare-fun res!820735 () Bool)

(declare-fun e!699577 () Bool)

(assert (=> d!135249 (=> res!820735 e!699577)))

(get-info :version)

(assert (=> d!135249 (= res!820735 ((_ is Nil!27134) acc!823))))

(assert (=> d!135249 (= (noDuplicate!1789 acc!823) e!699577)))

(declare-fun b!1233114 () Bool)

(declare-fun e!699578 () Bool)

(assert (=> b!1233114 (= e!699577 e!699578)))

(declare-fun res!820736 () Bool)

(assert (=> b!1233114 (=> (not res!820736) (not e!699578))))

(assert (=> b!1233114 (= res!820736 (not (contains!7208 (t!40592 acc!823) (h!28351 acc!823))))))

(declare-fun b!1233115 () Bool)

(assert (=> b!1233115 (= e!699578 (noDuplicate!1789 (t!40592 acc!823)))))

(assert (= (and d!135249 (not res!820735)) b!1233114))

(assert (= (and b!1233114 res!820736) b!1233115))

(declare-fun m!1137549 () Bool)

(assert (=> b!1233114 m!1137549))

(declare-fun m!1137551 () Bool)

(assert (=> b!1233115 m!1137551))

(assert (=> b!1233052 d!135249))

(declare-fun d!135251 () Bool)

(assert (=> d!135251 (= (validKeyInArray!0 (select (arr!38351 a!3806) from!3184)) (and (not (= (select (arr!38351 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38351 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233047 d!135251))

(declare-fun d!135253 () Bool)

(declare-fun lt!559935 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!569 (List!27137) (InoxSet (_ BitVec 64)))

(assert (=> d!135253 (= lt!559935 (select (content!569 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699587 () Bool)

(assert (=> d!135253 (= lt!559935 e!699587)))

(declare-fun res!820745 () Bool)

(assert (=> d!135253 (=> (not res!820745) (not e!699587))))

(assert (=> d!135253 (= res!820745 ((_ is Cons!27133) acc!823))))

(assert (=> d!135253 (= (contains!7208 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559935)))

(declare-fun b!1233124 () Bool)

(declare-fun e!699588 () Bool)

(assert (=> b!1233124 (= e!699587 e!699588)))

(declare-fun res!820746 () Bool)

(assert (=> b!1233124 (=> res!820746 e!699588)))

(assert (=> b!1233124 (= res!820746 (= (h!28351 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233125 () Bool)

(assert (=> b!1233125 (= e!699588 (contains!7208 (t!40592 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135253 res!820745) b!1233124))

(assert (= (and b!1233124 (not res!820746)) b!1233125))

(declare-fun m!1137553 () Bool)

(assert (=> d!135253 m!1137553))

(declare-fun m!1137555 () Bool)

(assert (=> d!135253 m!1137555))

(declare-fun m!1137557 () Bool)

(assert (=> b!1233125 m!1137557))

(assert (=> b!1233048 d!135253))

(declare-fun d!135257 () Bool)

(assert (=> d!135257 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1233053 d!135257))

(declare-fun d!135259 () Bool)

(declare-fun res!820753 () Bool)

(declare-fun e!699595 () Bool)

(assert (=> d!135259 (=> res!820753 e!699595)))

(assert (=> d!135259 (= res!820753 (= (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!135259 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699595)))

(declare-fun b!1233132 () Bool)

(declare-fun e!699596 () Bool)

(assert (=> b!1233132 (= e!699595 e!699596)))

(declare-fun res!820754 () Bool)

(assert (=> b!1233132 (=> (not res!820754) (not e!699596))))

(assert (=> b!1233132 (= res!820754 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38888 a!3806)))))

(declare-fun b!1233133 () Bool)

(assert (=> b!1233133 (= e!699596 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135259 (not res!820753)) b!1233132))

(assert (= (and b!1233132 res!820754) b!1233133))

(declare-fun m!1137563 () Bool)

(assert (=> d!135259 m!1137563))

(declare-fun m!1137565 () Bool)

(assert (=> b!1233133 m!1137565))

(assert (=> b!1233055 d!135259))

(declare-fun c!121062 () Bool)

(declare-fun call!60964 () Bool)

(declare-fun bm!60960 () Bool)

(assert (=> bm!60960 (= call!60964 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121062 (Cons!27133 (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27133 (select (arr!38351 a!3806) from!3184) Nil!27134)) (Cons!27133 (select (arr!38351 a!3806) from!3184) Nil!27134))))))

(declare-fun b!1233161 () Bool)

(declare-fun e!699624 () Bool)

(assert (=> b!1233161 (= e!699624 call!60964)))

(declare-fun b!1233162 () Bool)

(declare-fun e!699621 () Bool)

(assert (=> b!1233162 (= e!699621 e!699624)))

(assert (=> b!1233162 (= c!121062 (validKeyInArray!0 (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233164 () Bool)

(assert (=> b!1233164 (= e!699624 call!60964)))

(declare-fun b!1233166 () Bool)

(declare-fun e!699618 () Bool)

(assert (=> b!1233166 (= e!699618 (contains!7208 (Cons!27133 (select (arr!38351 a!3806) from!3184) Nil!27134) (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!135265 () Bool)

(declare-fun res!820771 () Bool)

(declare-fun e!699620 () Bool)

(assert (=> d!135265 (=> res!820771 e!699620)))

(assert (=> d!135265 (= res!820771 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38888 a!3806)))))

(assert (=> d!135265 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27133 (select (arr!38351 a!3806) from!3184) Nil!27134)) e!699620)))

(declare-fun b!1233168 () Bool)

(assert (=> b!1233168 (= e!699620 e!699621)))

(declare-fun res!820774 () Bool)

(assert (=> b!1233168 (=> (not res!820774) (not e!699621))))

(assert (=> b!1233168 (= res!820774 (not e!699618))))

(declare-fun res!820773 () Bool)

(assert (=> b!1233168 (=> (not res!820773) (not e!699618))))

(assert (=> b!1233168 (= res!820773 (validKeyInArray!0 (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135265 (not res!820771)) b!1233168))

(assert (= (and b!1233168 res!820773) b!1233166))

(assert (= (and b!1233168 res!820774) b!1233162))

(assert (= (and b!1233162 c!121062) b!1233164))

(assert (= (and b!1233162 (not c!121062)) b!1233161))

(assert (= (or b!1233164 b!1233161) bm!60960))

(assert (=> bm!60960 m!1137563))

(declare-fun m!1137577 () Bool)

(assert (=> bm!60960 m!1137577))

(assert (=> b!1233162 m!1137563))

(assert (=> b!1233162 m!1137563))

(declare-fun m!1137581 () Bool)

(assert (=> b!1233162 m!1137581))

(assert (=> b!1233166 m!1137563))

(assert (=> b!1233166 m!1137563))

(declare-fun m!1137583 () Bool)

(assert (=> b!1233166 m!1137583))

(assert (=> b!1233168 m!1137563))

(assert (=> b!1233168 m!1137563))

(assert (=> b!1233168 m!1137581))

(assert (=> b!1233054 d!135265))

(declare-fun c!121064 () Bool)

(declare-fun call!60965 () Bool)

(declare-fun bm!60962 () Bool)

(assert (=> bm!60962 (= call!60965 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121064 (Cons!27133 (select (arr!38351 a!3806) from!3184) Nil!27134) Nil!27134)))))

(declare-fun b!1233169 () Bool)

(declare-fun e!699628 () Bool)

(assert (=> b!1233169 (= e!699628 call!60965)))

(declare-fun b!1233170 () Bool)

(declare-fun e!699627 () Bool)

(assert (=> b!1233170 (= e!699627 e!699628)))

(assert (=> b!1233170 (= c!121064 (validKeyInArray!0 (select (arr!38351 a!3806) from!3184)))))

(declare-fun b!1233171 () Bool)

(assert (=> b!1233171 (= e!699628 call!60965)))

(declare-fun b!1233172 () Bool)

(declare-fun e!699625 () Bool)

(assert (=> b!1233172 (= e!699625 (contains!7208 Nil!27134 (select (arr!38351 a!3806) from!3184)))))

(declare-fun d!135275 () Bool)

(declare-fun res!820776 () Bool)

(declare-fun e!699626 () Bool)

(assert (=> d!135275 (=> res!820776 e!699626)))

(assert (=> d!135275 (= res!820776 (bvsge from!3184 (size!38888 a!3806)))))

(assert (=> d!135275 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27134) e!699626)))

(declare-fun b!1233173 () Bool)

(assert (=> b!1233173 (= e!699626 e!699627)))

(declare-fun res!820778 () Bool)

(assert (=> b!1233173 (=> (not res!820778) (not e!699627))))

(assert (=> b!1233173 (= res!820778 (not e!699625))))

(declare-fun res!820777 () Bool)

(assert (=> b!1233173 (=> (not res!820777) (not e!699625))))

(assert (=> b!1233173 (= res!820777 (validKeyInArray!0 (select (arr!38351 a!3806) from!3184)))))

(assert (= (and d!135275 (not res!820776)) b!1233173))

(assert (= (and b!1233173 res!820777) b!1233172))

(assert (= (and b!1233173 res!820778) b!1233170))

(assert (= (and b!1233170 c!121064) b!1233171))

(assert (= (and b!1233170 (not c!121064)) b!1233169))

(assert (= (or b!1233171 b!1233169) bm!60962))

(assert (=> bm!60962 m!1137473))

(declare-fun m!1137585 () Bool)

(assert (=> bm!60962 m!1137585))

(assert (=> b!1233170 m!1137473))

(assert (=> b!1233170 m!1137473))

(assert (=> b!1233170 m!1137475))

(assert (=> b!1233172 m!1137473))

(assert (=> b!1233172 m!1137473))

(declare-fun m!1137587 () Bool)

(assert (=> b!1233172 m!1137587))

(assert (=> b!1233173 m!1137473))

(assert (=> b!1233173 m!1137473))

(assert (=> b!1233173 m!1137475))

(assert (=> b!1233054 d!135275))

(declare-fun d!135277 () Bool)

(assert (=> d!135277 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27134)))

(declare-fun lt!559941 () Unit!40757)

(declare-fun choose!80 (array!79484 List!27137 List!27137 (_ BitVec 32)) Unit!40757)

(assert (=> d!135277 (= lt!559941 (choose!80 a!3806 acc!823 Nil!27134 from!3184))))

(assert (=> d!135277 (bvslt (size!38888 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!135277 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27134 from!3184) lt!559941)))

(declare-fun bs!34636 () Bool)

(assert (= bs!34636 d!135277))

(assert (=> bs!34636 m!1137487))

(declare-fun m!1137595 () Bool)

(assert (=> bs!34636 m!1137595))

(assert (=> b!1233054 d!135277))

(declare-fun c!121068 () Bool)

(declare-fun bm!60966 () Bool)

(declare-fun call!60969 () Bool)

(assert (=> bm!60966 (= call!60969 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121068 (Cons!27133 (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27133 (select (arr!38351 a!3806) from!3184) acc!823)) (Cons!27133 (select (arr!38351 a!3806) from!3184) acc!823))))))

(declare-fun b!1233189 () Bool)

(declare-fun e!699644 () Bool)

(assert (=> b!1233189 (= e!699644 call!60969)))

(declare-fun b!1233190 () Bool)

(declare-fun e!699643 () Bool)

(assert (=> b!1233190 (= e!699643 e!699644)))

(assert (=> b!1233190 (= c!121068 (validKeyInArray!0 (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1233191 () Bool)

(assert (=> b!1233191 (= e!699644 call!60969)))

(declare-fun b!1233192 () Bool)

(declare-fun e!699641 () Bool)

(assert (=> b!1233192 (= e!699641 (contains!7208 (Cons!27133 (select (arr!38351 a!3806) from!3184) acc!823) (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!135281 () Bool)

(declare-fun res!820788 () Bool)

(declare-fun e!699642 () Bool)

(assert (=> d!135281 (=> res!820788 e!699642)))

(assert (=> d!135281 (= res!820788 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38888 a!3806)))))

(assert (=> d!135281 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27133 (select (arr!38351 a!3806) from!3184) acc!823)) e!699642)))

(declare-fun b!1233193 () Bool)

(assert (=> b!1233193 (= e!699642 e!699643)))

(declare-fun res!820790 () Bool)

(assert (=> b!1233193 (=> (not res!820790) (not e!699643))))

(assert (=> b!1233193 (= res!820790 (not e!699641))))

(declare-fun res!820789 () Bool)

(assert (=> b!1233193 (=> (not res!820789) (not e!699641))))

(assert (=> b!1233193 (= res!820789 (validKeyInArray!0 (select (arr!38351 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!135281 (not res!820788)) b!1233193))

(assert (= (and b!1233193 res!820789) b!1233192))

(assert (= (and b!1233193 res!820790) b!1233190))

(assert (= (and b!1233190 c!121068) b!1233191))

(assert (= (and b!1233190 (not c!121068)) b!1233189))

(assert (= (or b!1233191 b!1233189) bm!60966))

(assert (=> bm!60966 m!1137563))

(declare-fun m!1137597 () Bool)

(assert (=> bm!60966 m!1137597))

(assert (=> b!1233190 m!1137563))

(assert (=> b!1233190 m!1137563))

(assert (=> b!1233190 m!1137581))

(assert (=> b!1233192 m!1137563))

(assert (=> b!1233192 m!1137563))

(declare-fun m!1137599 () Bool)

(assert (=> b!1233192 m!1137599))

(assert (=> b!1233193 m!1137563))

(assert (=> b!1233193 m!1137563))

(assert (=> b!1233193 m!1137581))

(assert (=> b!1233054 d!135281))

(declare-fun call!60970 () Bool)

(declare-fun bm!60967 () Bool)

(declare-fun c!121069 () Bool)

(assert (=> bm!60967 (= call!60970 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121069 (Cons!27133 (select (arr!38351 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1233194 () Bool)

(declare-fun e!699648 () Bool)

(assert (=> b!1233194 (= e!699648 call!60970)))

(declare-fun b!1233195 () Bool)

(declare-fun e!699647 () Bool)

(assert (=> b!1233195 (= e!699647 e!699648)))

(assert (=> b!1233195 (= c!121069 (validKeyInArray!0 (select (arr!38351 a!3806) from!3184)))))

(declare-fun b!1233196 () Bool)

(assert (=> b!1233196 (= e!699648 call!60970)))

(declare-fun b!1233197 () Bool)

(declare-fun e!699645 () Bool)

(assert (=> b!1233197 (= e!699645 (contains!7208 acc!823 (select (arr!38351 a!3806) from!3184)))))

(declare-fun d!135285 () Bool)

(declare-fun res!820791 () Bool)

(declare-fun e!699646 () Bool)

(assert (=> d!135285 (=> res!820791 e!699646)))

(assert (=> d!135285 (= res!820791 (bvsge from!3184 (size!38888 a!3806)))))

(assert (=> d!135285 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699646)))

(declare-fun b!1233198 () Bool)

(assert (=> b!1233198 (= e!699646 e!699647)))

(declare-fun res!820793 () Bool)

(assert (=> b!1233198 (=> (not res!820793) (not e!699647))))

(assert (=> b!1233198 (= res!820793 (not e!699645))))

(declare-fun res!820792 () Bool)

(assert (=> b!1233198 (=> (not res!820792) (not e!699645))))

(assert (=> b!1233198 (= res!820792 (validKeyInArray!0 (select (arr!38351 a!3806) from!3184)))))

(assert (= (and d!135285 (not res!820791)) b!1233198))

(assert (= (and b!1233198 res!820792) b!1233197))

(assert (= (and b!1233198 res!820793) b!1233195))

(assert (= (and b!1233195 c!121069) b!1233196))

(assert (= (and b!1233195 (not c!121069)) b!1233194))

(assert (= (or b!1233196 b!1233194) bm!60967))

(assert (=> bm!60967 m!1137473))

(declare-fun m!1137601 () Bool)

(assert (=> bm!60967 m!1137601))

(assert (=> b!1233195 m!1137473))

(assert (=> b!1233195 m!1137473))

(assert (=> b!1233195 m!1137475))

(assert (=> b!1233197 m!1137473))

(assert (=> b!1233197 m!1137473))

(declare-fun m!1137603 () Bool)

(assert (=> b!1233197 m!1137603))

(assert (=> b!1233198 m!1137473))

(assert (=> b!1233198 m!1137473))

(assert (=> b!1233198 m!1137475))

(assert (=> b!1233049 d!135285))

(declare-fun d!135287 () Bool)

(assert (=> d!135287 (= (array_inv!29289 a!3806) (bvsge (size!38888 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102618 d!135287))

(declare-fun d!135289 () Bool)

(declare-fun lt!559942 () Bool)

(assert (=> d!135289 (= lt!559942 (select (content!569 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699655 () Bool)

(assert (=> d!135289 (= lt!559942 e!699655)))

(declare-fun res!820800 () Bool)

(assert (=> d!135289 (=> (not res!820800) (not e!699655))))

(assert (=> d!135289 (= res!820800 ((_ is Cons!27133) acc!823))))

(assert (=> d!135289 (= (contains!7208 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559942)))

(declare-fun b!1233205 () Bool)

(declare-fun e!699656 () Bool)

(assert (=> b!1233205 (= e!699655 e!699656)))

(declare-fun res!820801 () Bool)

(assert (=> b!1233205 (=> res!820801 e!699656)))

(assert (=> b!1233205 (= res!820801 (= (h!28351 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233206 () Bool)

(assert (=> b!1233206 (= e!699656 (contains!7208 (t!40592 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135289 res!820800) b!1233205))

(assert (= (and b!1233205 (not res!820801)) b!1233206))

(assert (=> d!135289 m!1137553))

(declare-fun m!1137607 () Bool)

(assert (=> d!135289 m!1137607))

(declare-fun m!1137609 () Bool)

(assert (=> b!1233206 m!1137609))

(assert (=> b!1233050 d!135289))

(check-sat (not b!1233133) (not b!1233166) (not d!135277) (not b!1233173) (not b!1233198) (not b!1233172) (not bm!60967) (not b!1233192) (not b!1233162) (not b!1233125) (not b!1233114) (not b!1233197) (not b!1233170) (not b!1233195) (not bm!60966) (not d!135289) (not b!1233206) (not d!135253) (not bm!60962) (not b!1233168) (not b!1233115) (not b!1233193) (not b!1233190) (not bm!60960))
(check-sat)
