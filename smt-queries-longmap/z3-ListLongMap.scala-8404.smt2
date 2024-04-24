; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102444 () Bool)

(assert start!102444)

(declare-fun b!1231736 () Bool)

(declare-fun res!819437 () Bool)

(declare-fun e!698960 () Bool)

(assert (=> b!1231736 (=> (not res!819437) (not e!698960))))

(declare-datatypes ((List!27107 0))(
  ( (Nil!27104) (Cons!27103 (h!28321 (_ BitVec 64)) (t!40562 List!27107)) )
))
(declare-fun acc!823 () List!27107)

(declare-fun contains!7178 (List!27107 (_ BitVec 64)) Bool)

(assert (=> b!1231736 (= res!819437 (not (contains!7178 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231737 () Bool)

(declare-fun res!819436 () Bool)

(assert (=> b!1231737 (=> (not res!819436) (not e!698960))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231737 (= res!819436 (validKeyInArray!0 k0!2913))))

(declare-fun res!819435 () Bool)

(assert (=> start!102444 (=> (not res!819435) (not e!698960))))

(declare-datatypes ((array!79415 0))(
  ( (array!79416 (arr!38321 (Array (_ BitVec 32) (_ BitVec 64))) (size!38858 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79415)

(assert (=> start!102444 (= res!819435 (bvslt (size!38858 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102444 e!698960))

(declare-fun array_inv!29259 (array!79415) Bool)

(assert (=> start!102444 (array_inv!29259 a!3806)))

(assert (=> start!102444 true))

(declare-fun b!1231738 () Bool)

(declare-fun res!819434 () Bool)

(assert (=> b!1231738 (=> (not res!819434) (not e!698960))))

(declare-fun noDuplicate!1759 (List!27107) Bool)

(assert (=> b!1231738 (= res!819434 (noDuplicate!1759 acc!823))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun b!1231739 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79415 (_ BitVec 32) List!27107) Bool)

(assert (=> b!1231739 (= e!698960 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27103 (select (arr!38321 a!3806) from!3184) acc!823))))))

(declare-fun b!1231740 () Bool)

(declare-fun res!819431 () Bool)

(assert (=> b!1231740 (=> (not res!819431) (not e!698960))))

(assert (=> b!1231740 (= res!819431 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231741 () Bool)

(declare-fun res!819432 () Bool)

(assert (=> b!1231741 (=> (not res!819432) (not e!698960))))

(assert (=> b!1231741 (= res!819432 (validKeyInArray!0 (select (arr!38321 a!3806) from!3184)))))

(declare-fun b!1231742 () Bool)

(declare-fun res!819429 () Bool)

(assert (=> b!1231742 (=> (not res!819429) (not e!698960))))

(assert (=> b!1231742 (= res!819429 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38858 a!3806)) (bvslt from!3184 (size!38858 a!3806))))))

(declare-fun b!1231743 () Bool)

(declare-fun res!819430 () Bool)

(assert (=> b!1231743 (=> (not res!819430) (not e!698960))))

(declare-fun arrayContainsKey!0 (array!79415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231743 (= res!819430 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231744 () Bool)

(declare-fun res!819433 () Bool)

(assert (=> b!1231744 (=> (not res!819433) (not e!698960))))

(assert (=> b!1231744 (= res!819433 (not (contains!7178 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102444 res!819435) b!1231737))

(assert (= (and b!1231737 res!819436) b!1231742))

(assert (= (and b!1231742 res!819429) b!1231738))

(assert (= (and b!1231738 res!819434) b!1231744))

(assert (= (and b!1231744 res!819433) b!1231736))

(assert (= (and b!1231736 res!819437) b!1231743))

(assert (= (and b!1231743 res!819430) b!1231740))

(assert (= (and b!1231740 res!819431) b!1231741))

(assert (= (and b!1231741 res!819432) b!1231739))

(declare-fun m!1136481 () Bool)

(assert (=> b!1231743 m!1136481))

(declare-fun m!1136483 () Bool)

(assert (=> b!1231739 m!1136483))

(declare-fun m!1136485 () Bool)

(assert (=> b!1231739 m!1136485))

(declare-fun m!1136487 () Bool)

(assert (=> b!1231738 m!1136487))

(declare-fun m!1136489 () Bool)

(assert (=> b!1231737 m!1136489))

(declare-fun m!1136491 () Bool)

(assert (=> b!1231744 m!1136491))

(declare-fun m!1136493 () Bool)

(assert (=> b!1231740 m!1136493))

(assert (=> b!1231741 m!1136483))

(assert (=> b!1231741 m!1136483))

(declare-fun m!1136495 () Bool)

(assert (=> b!1231741 m!1136495))

(declare-fun m!1136497 () Bool)

(assert (=> start!102444 m!1136497))

(declare-fun m!1136499 () Bool)

(assert (=> b!1231736 m!1136499))

(check-sat (not b!1231744) (not b!1231738) (not b!1231737) (not b!1231736) (not start!102444) (not b!1231739) (not b!1231743) (not b!1231741) (not b!1231740))
(check-sat)
(get-model)

(declare-fun d!135037 () Bool)

(assert (=> d!135037 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231737 d!135037))

(declare-fun d!135039 () Bool)

(assert (=> d!135039 (= (array_inv!29259 a!3806) (bvsge (size!38858 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102444 d!135039))

(declare-fun d!135041 () Bool)

(declare-fun res!819496 () Bool)

(declare-fun e!698977 () Bool)

(assert (=> d!135041 (=> res!819496 e!698977)))

(assert (=> d!135041 (= res!819496 (= (select (arr!38321 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!135041 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698977)))

(declare-fun b!1231803 () Bool)

(declare-fun e!698978 () Bool)

(assert (=> b!1231803 (= e!698977 e!698978)))

(declare-fun res!819497 () Bool)

(assert (=> b!1231803 (=> (not res!819497) (not e!698978))))

(assert (=> b!1231803 (= res!819497 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38858 a!3806)))))

(declare-fun b!1231804 () Bool)

(assert (=> b!1231804 (= e!698978 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135041 (not res!819496)) b!1231803))

(assert (= (and b!1231803 res!819497) b!1231804))

(declare-fun m!1136541 () Bool)

(assert (=> d!135041 m!1136541))

(declare-fun m!1136543 () Bool)

(assert (=> b!1231804 m!1136543))

(assert (=> b!1231743 d!135041))

(declare-fun d!135043 () Bool)

(declare-fun res!819502 () Bool)

(declare-fun e!698983 () Bool)

(assert (=> d!135043 (=> res!819502 e!698983)))

(get-info :version)

(assert (=> d!135043 (= res!819502 ((_ is Nil!27104) acc!823))))

(assert (=> d!135043 (= (noDuplicate!1759 acc!823) e!698983)))

(declare-fun b!1231809 () Bool)

(declare-fun e!698984 () Bool)

(assert (=> b!1231809 (= e!698983 e!698984)))

(declare-fun res!819503 () Bool)

(assert (=> b!1231809 (=> (not res!819503) (not e!698984))))

(assert (=> b!1231809 (= res!819503 (not (contains!7178 (t!40562 acc!823) (h!28321 acc!823))))))

(declare-fun b!1231810 () Bool)

(assert (=> b!1231810 (= e!698984 (noDuplicate!1759 (t!40562 acc!823)))))

(assert (= (and d!135043 (not res!819502)) b!1231809))

(assert (= (and b!1231809 res!819503) b!1231810))

(declare-fun m!1136545 () Bool)

(assert (=> b!1231809 m!1136545))

(declare-fun m!1136547 () Bool)

(assert (=> b!1231810 m!1136547))

(assert (=> b!1231738 d!135043))

(declare-fun d!135047 () Bool)

(declare-fun lt!559860 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!562 (List!27107) (InoxSet (_ BitVec 64)))

(assert (=> d!135047 (= lt!559860 (select (content!562 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698998 () Bool)

(assert (=> d!135047 (= lt!559860 e!698998)))

(declare-fun res!819514 () Bool)

(assert (=> d!135047 (=> (not res!819514) (not e!698998))))

(assert (=> d!135047 (= res!819514 ((_ is Cons!27103) acc!823))))

(assert (=> d!135047 (= (contains!7178 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559860)))

(declare-fun b!1231825 () Bool)

(declare-fun e!698997 () Bool)

(assert (=> b!1231825 (= e!698998 e!698997)))

(declare-fun res!819515 () Bool)

(assert (=> b!1231825 (=> res!819515 e!698997)))

(assert (=> b!1231825 (= res!819515 (= (h!28321 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231826 () Bool)

(assert (=> b!1231826 (= e!698997 (contains!7178 (t!40562 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135047 res!819514) b!1231825))

(assert (= (and b!1231825 (not res!819515)) b!1231826))

(declare-fun m!1136549 () Bool)

(assert (=> d!135047 m!1136549))

(declare-fun m!1136551 () Bool)

(assert (=> d!135047 m!1136551))

(declare-fun m!1136553 () Bool)

(assert (=> b!1231826 m!1136553))

(assert (=> b!1231744 d!135047))

(declare-fun b!1231848 () Bool)

(declare-fun e!699019 () Bool)

(declare-fun call!60927 () Bool)

(assert (=> b!1231848 (= e!699019 call!60927)))

(declare-fun b!1231849 () Bool)

(declare-fun e!699018 () Bool)

(declare-fun e!699020 () Bool)

(assert (=> b!1231849 (= e!699018 e!699020)))

(declare-fun res!819533 () Bool)

(assert (=> b!1231849 (=> (not res!819533) (not e!699020))))

(declare-fun e!699017 () Bool)

(assert (=> b!1231849 (= res!819533 (not e!699017))))

(declare-fun res!819532 () Bool)

(assert (=> b!1231849 (=> (not res!819532) (not e!699017))))

(assert (=> b!1231849 (= res!819532 (validKeyInArray!0 (select (arr!38321 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60924 () Bool)

(declare-fun c!121026 () Bool)

(assert (=> bm!60924 (= call!60927 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121026 (Cons!27103 (select (arr!38321 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27103 (select (arr!38321 a!3806) from!3184) acc!823)) (Cons!27103 (select (arr!38321 a!3806) from!3184) acc!823))))))

(declare-fun b!1231851 () Bool)

(assert (=> b!1231851 (= e!699019 call!60927)))

(declare-fun b!1231852 () Bool)

(assert (=> b!1231852 (= e!699020 e!699019)))

(assert (=> b!1231852 (= c!121026 (validKeyInArray!0 (select (arr!38321 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231850 () Bool)

(assert (=> b!1231850 (= e!699017 (contains!7178 (Cons!27103 (select (arr!38321 a!3806) from!3184) acc!823) (select (arr!38321 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!135049 () Bool)

(declare-fun res!819531 () Bool)

(assert (=> d!135049 (=> res!819531 e!699018)))

(assert (=> d!135049 (= res!819531 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38858 a!3806)))))

(assert (=> d!135049 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27103 (select (arr!38321 a!3806) from!3184) acc!823)) e!699018)))

(assert (= (and d!135049 (not res!819531)) b!1231849))

(assert (= (and b!1231849 res!819532) b!1231850))

(assert (= (and b!1231849 res!819533) b!1231852))

(assert (= (and b!1231852 c!121026) b!1231848))

(assert (= (and b!1231852 (not c!121026)) b!1231851))

(assert (= (or b!1231848 b!1231851) bm!60924))

(assert (=> b!1231849 m!1136541))

(assert (=> b!1231849 m!1136541))

(declare-fun m!1136565 () Bool)

(assert (=> b!1231849 m!1136565))

(assert (=> bm!60924 m!1136541))

(declare-fun m!1136567 () Bool)

(assert (=> bm!60924 m!1136567))

(assert (=> b!1231852 m!1136541))

(assert (=> b!1231852 m!1136541))

(assert (=> b!1231852 m!1136565))

(assert (=> b!1231850 m!1136541))

(assert (=> b!1231850 m!1136541))

(declare-fun m!1136569 () Bool)

(assert (=> b!1231850 m!1136569))

(assert (=> b!1231739 d!135049))

(declare-fun b!1231853 () Bool)

(declare-fun e!699025 () Bool)

(declare-fun call!60928 () Bool)

(assert (=> b!1231853 (= e!699025 call!60928)))

(declare-fun b!1231854 () Bool)

(declare-fun e!699024 () Bool)

(declare-fun e!699026 () Bool)

(assert (=> b!1231854 (= e!699024 e!699026)))

(declare-fun res!819538 () Bool)

(assert (=> b!1231854 (=> (not res!819538) (not e!699026))))

(declare-fun e!699023 () Bool)

(assert (=> b!1231854 (= res!819538 (not e!699023))))

(declare-fun res!819537 () Bool)

(assert (=> b!1231854 (=> (not res!819537) (not e!699023))))

(assert (=> b!1231854 (= res!819537 (validKeyInArray!0 (select (arr!38321 a!3806) from!3184)))))

(declare-fun bm!60925 () Bool)

(declare-fun c!121027 () Bool)

(assert (=> bm!60925 (= call!60928 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121027 (Cons!27103 (select (arr!38321 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1231858 () Bool)

(assert (=> b!1231858 (= e!699025 call!60928)))

(declare-fun b!1231859 () Bool)

(assert (=> b!1231859 (= e!699026 e!699025)))

(assert (=> b!1231859 (= c!121027 (validKeyInArray!0 (select (arr!38321 a!3806) from!3184)))))

(declare-fun b!1231857 () Bool)

(assert (=> b!1231857 (= e!699023 (contains!7178 acc!823 (select (arr!38321 a!3806) from!3184)))))

(declare-fun d!135057 () Bool)

(declare-fun res!819534 () Bool)

(assert (=> d!135057 (=> res!819534 e!699024)))

(assert (=> d!135057 (= res!819534 (bvsge from!3184 (size!38858 a!3806)))))

(assert (=> d!135057 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699024)))

(assert (= (and d!135057 (not res!819534)) b!1231854))

(assert (= (and b!1231854 res!819537) b!1231857))

(assert (= (and b!1231854 res!819538) b!1231859))

(assert (= (and b!1231859 c!121027) b!1231853))

(assert (= (and b!1231859 (not c!121027)) b!1231858))

(assert (= (or b!1231853 b!1231858) bm!60925))

(assert (=> b!1231854 m!1136483))

(assert (=> b!1231854 m!1136483))

(assert (=> b!1231854 m!1136495))

(assert (=> bm!60925 m!1136483))

(declare-fun m!1136571 () Bool)

(assert (=> bm!60925 m!1136571))

(assert (=> b!1231859 m!1136483))

(assert (=> b!1231859 m!1136483))

(assert (=> b!1231859 m!1136495))

(assert (=> b!1231857 m!1136483))

(assert (=> b!1231857 m!1136483))

(declare-fun m!1136573 () Bool)

(assert (=> b!1231857 m!1136573))

(assert (=> b!1231740 d!135057))

(declare-fun d!135061 () Bool)

(assert (=> d!135061 (= (validKeyInArray!0 (select (arr!38321 a!3806) from!3184)) (and (not (= (select (arr!38321 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38321 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231741 d!135061))

(declare-fun d!135063 () Bool)

(declare-fun lt!559861 () Bool)

(assert (=> d!135063 (= lt!559861 (select (content!562 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699030 () Bool)

(assert (=> d!135063 (= lt!559861 e!699030)))

(declare-fun res!819541 () Bool)

(assert (=> d!135063 (=> (not res!819541) (not e!699030))))

(assert (=> d!135063 (= res!819541 ((_ is Cons!27103) acc!823))))

(assert (=> d!135063 (= (contains!7178 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559861)))

(declare-fun b!1231862 () Bool)

(declare-fun e!699029 () Bool)

(assert (=> b!1231862 (= e!699030 e!699029)))

(declare-fun res!819542 () Bool)

(assert (=> b!1231862 (=> res!819542 e!699029)))

(assert (=> b!1231862 (= res!819542 (= (h!28321 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231863 () Bool)

(assert (=> b!1231863 (= e!699029 (contains!7178 (t!40562 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135063 res!819541) b!1231862))

(assert (= (and b!1231862 (not res!819542)) b!1231863))

(assert (=> d!135063 m!1136549))

(declare-fun m!1136577 () Bool)

(assert (=> d!135063 m!1136577))

(declare-fun m!1136581 () Bool)

(assert (=> b!1231863 m!1136581))

(assert (=> b!1231736 d!135063))

(check-sat (not b!1231857) (not b!1231826) (not b!1231863) (not bm!60925) (not b!1231810) (not d!135047) (not b!1231859) (not b!1231809) (not b!1231852) (not b!1231804) (not b!1231849) (not b!1231854) (not d!135063) (not bm!60924) (not b!1231850))
(check-sat)
