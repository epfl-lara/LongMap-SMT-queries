; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102378 () Bool)

(assert start!102378)

(declare-fun b!1231719 () Bool)

(declare-fun e!698693 () Bool)

(declare-datatypes ((array!79448 0))(
  ( (array!79449 (arr!38339 (Array (_ BitVec 32) (_ BitVec 64))) (size!38875 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79448)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27112 0))(
  ( (Nil!27109) (Cons!27108 (h!28317 (_ BitVec 64)) (t!40575 List!27112)) )
))
(declare-fun arrayNoDuplicates!0 (array!79448 (_ BitVec 32) List!27112) Bool)

(assert (=> b!1231719 (= e!698693 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27108 (select (arr!38339 a!3806) from!3184) Nil!27109))))))

(assert (=> b!1231719 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27109)))

(declare-fun acc!823 () List!27112)

(declare-datatypes ((Unit!40784 0))(
  ( (Unit!40785) )
))
(declare-fun lt!559439 () Unit!40784)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79448 List!27112 List!27112 (_ BitVec 32)) Unit!40784)

(assert (=> b!1231719 (= lt!559439 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27109 from!3184))))

(assert (=> b!1231719 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27108 (select (arr!38339 a!3806) from!3184) acc!823))))

(declare-fun b!1231720 () Bool)

(declare-fun res!820141 () Bool)

(assert (=> b!1231720 (=> (not res!820141) (not e!698693))))

(declare-fun contains!7174 (List!27112 (_ BitVec 64)) Bool)

(assert (=> b!1231720 (= res!820141 (not (contains!7174 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231721 () Bool)

(declare-fun res!820133 () Bool)

(assert (=> b!1231721 (=> (not res!820133) (not e!698693))))

(assert (=> b!1231721 (= res!820133 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38875 a!3806)) (bvslt from!3184 (size!38875 a!3806))))))

(declare-fun b!1231722 () Bool)

(declare-fun res!820134 () Bool)

(assert (=> b!1231722 (=> (not res!820134) (not e!698693))))

(assert (=> b!1231722 (= res!820134 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231723 () Bool)

(declare-fun res!820140 () Bool)

(assert (=> b!1231723 (=> (not res!820140) (not e!698693))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231723 (= res!820140 (validKeyInArray!0 k!2913))))

(declare-fun b!1231725 () Bool)

(declare-fun res!820136 () Bool)

(assert (=> b!1231725 (=> (not res!820136) (not e!698693))))

(declare-fun noDuplicate!1771 (List!27112) Bool)

(assert (=> b!1231725 (= res!820136 (noDuplicate!1771 acc!823))))

(declare-fun b!1231726 () Bool)

(declare-fun res!820135 () Bool)

(assert (=> b!1231726 (=> (not res!820135) (not e!698693))))

(declare-fun arrayContainsKey!0 (array!79448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231726 (= res!820135 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231727 () Bool)

(declare-fun res!820137 () Bool)

(assert (=> b!1231727 (=> (not res!820137) (not e!698693))))

(assert (=> b!1231727 (= res!820137 (not (contains!7174 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231724 () Bool)

(declare-fun res!820138 () Bool)

(assert (=> b!1231724 (=> (not res!820138) (not e!698693))))

(assert (=> b!1231724 (= res!820138 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun res!820139 () Bool)

(assert (=> start!102378 (=> (not res!820139) (not e!698693))))

(assert (=> start!102378 (= res!820139 (bvslt (size!38875 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102378 e!698693))

(declare-fun array_inv!29187 (array!79448) Bool)

(assert (=> start!102378 (array_inv!29187 a!3806)))

(assert (=> start!102378 true))

(assert (= (and start!102378 res!820139) b!1231723))

(assert (= (and b!1231723 res!820140) b!1231721))

(assert (= (and b!1231721 res!820133) b!1231725))

(assert (= (and b!1231725 res!820136) b!1231727))

(assert (= (and b!1231727 res!820137) b!1231720))

(assert (= (and b!1231720 res!820141) b!1231726))

(assert (= (and b!1231726 res!820135) b!1231722))

(assert (= (and b!1231722 res!820134) b!1231724))

(assert (= (and b!1231724 res!820138) b!1231719))

(declare-fun m!1135813 () Bool)

(assert (=> b!1231726 m!1135813))

(declare-fun m!1135815 () Bool)

(assert (=> b!1231725 m!1135815))

(declare-fun m!1135817 () Bool)

(assert (=> b!1231727 m!1135817))

(declare-fun m!1135819 () Bool)

(assert (=> b!1231719 m!1135819))

(declare-fun m!1135821 () Bool)

(assert (=> b!1231719 m!1135821))

(declare-fun m!1135823 () Bool)

(assert (=> b!1231719 m!1135823))

(declare-fun m!1135825 () Bool)

(assert (=> b!1231719 m!1135825))

(declare-fun m!1135827 () Bool)

(assert (=> b!1231719 m!1135827))

(declare-fun m!1135829 () Bool)

(assert (=> b!1231722 m!1135829))

(assert (=> b!1231724 m!1135823))

(assert (=> b!1231724 m!1135823))

(declare-fun m!1135831 () Bool)

(assert (=> b!1231724 m!1135831))

(declare-fun m!1135833 () Bool)

(assert (=> b!1231720 m!1135833))

(declare-fun m!1135835 () Bool)

(assert (=> start!102378 m!1135835))

(declare-fun m!1135837 () Bool)

(assert (=> b!1231723 m!1135837))

(push 1)

(assert (not b!1231725))

(assert (not b!1231724))

(assert (not b!1231723))

(assert (not b!1231722))

(assert (not b!1231726))

(assert (not start!102378))

(assert (not b!1231719))

(assert (not b!1231720))

(assert (not b!1231727))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1231814 () Bool)

(declare-fun e!698737 () Bool)

(declare-fun call!60892 () Bool)

(assert (=> b!1231814 (= e!698737 call!60892)))

(declare-fun b!1231815 () Bool)

(declare-fun e!698740 () Bool)

(assert (=> b!1231815 (= e!698740 (contains!7174 acc!823 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1231816 () Bool)

(declare-fun e!698738 () Bool)

(declare-fun e!698739 () Bool)

(assert (=> b!1231816 (= e!698738 e!698739)))

(declare-fun res!820225 () Bool)

(assert (=> b!1231816 (=> (not res!820225) (not e!698739))))

(assert (=> b!1231816 (= res!820225 (not e!698740))))

(declare-fun res!820226 () Bool)

(assert (=> b!1231816 (=> (not res!820226) (not e!698740))))

(assert (=> b!1231816 (= res!820226 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1231817 () Bool)

(assert (=> b!1231817 (= e!698737 call!60892)))

(declare-fun d!134781 () Bool)

(declare-fun res!820224 () Bool)

(assert (=> d!134781 (=> res!820224 e!698738)))

(assert (=> d!134781 (= res!820224 (bvsge from!3184 (size!38875 a!3806)))))

(assert (=> d!134781 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698738)))

(declare-fun b!1231818 () Bool)

(assert (=> b!1231818 (= e!698739 e!698737)))

(declare-fun c!120655 () Bool)

(assert (=> b!1231818 (= c!120655 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun bm!60889 () Bool)

(assert (=> bm!60889 (= call!60892 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120655 (Cons!27108 (select (arr!38339 a!3806) from!3184) acc!823) acc!823)))))

(assert (= (and d!134781 (not res!820224)) b!1231816))

(assert (= (and b!1231816 res!820226) b!1231815))

(assert (= (and b!1231816 res!820225) b!1231818))

(assert (= (and b!1231818 c!120655) b!1231817))

(assert (= (and b!1231818 (not c!120655)) b!1231814))

(assert (= (or b!1231817 b!1231814) bm!60889))

(assert (=> b!1231815 m!1135823))

(assert (=> b!1231815 m!1135823))

(declare-fun m!1135905 () Bool)

(assert (=> b!1231815 m!1135905))

(assert (=> b!1231816 m!1135823))

(assert (=> b!1231816 m!1135823))

(assert (=> b!1231816 m!1135831))

(assert (=> b!1231818 m!1135823))

(assert (=> b!1231818 m!1135823))

(assert (=> b!1231818 m!1135831))

(assert (=> bm!60889 m!1135823))

(declare-fun m!1135907 () Bool)

(assert (=> bm!60889 m!1135907))

(assert (=> b!1231722 d!134781))

(declare-fun d!134791 () Bool)

(assert (=> d!134791 (= (array_inv!29187 a!3806) (bvsge (size!38875 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102378 d!134791))

(declare-fun d!134795 () Bool)

(assert (=> d!134795 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231723 d!134795))

(declare-fun d!134797 () Bool)

(assert (=> d!134797 (= (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)) (and (not (= (select (arr!38339 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38339 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231724 d!134797))

(declare-fun b!1231831 () Bool)

(declare-fun e!698751 () Bool)

(declare-fun call!60895 () Bool)

(assert (=> b!1231831 (= e!698751 call!60895)))

(declare-fun b!1231832 () Bool)

(declare-fun e!698754 () Bool)

(assert (=> b!1231832 (= e!698754 (contains!7174 (Cons!27108 (select (arr!38339 a!3806) from!3184) Nil!27109) (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231833 () Bool)

(declare-fun e!698752 () Bool)

(declare-fun e!698753 () Bool)

(assert (=> b!1231833 (= e!698752 e!698753)))

(declare-fun res!820236 () Bool)

(assert (=> b!1231833 (=> (not res!820236) (not e!698753))))

(assert (=> b!1231833 (= res!820236 (not e!698754))))

(declare-fun res!820237 () Bool)

(assert (=> b!1231833 (=> (not res!820237) (not e!698754))))

(assert (=> b!1231833 (= res!820237 (validKeyInArray!0 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231834 () Bool)

(assert (=> b!1231834 (= e!698751 call!60895)))

(declare-fun d!134799 () Bool)

(declare-fun res!820235 () Bool)

(assert (=> d!134799 (=> res!820235 e!698752)))

(assert (=> d!134799 (= res!820235 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38875 a!3806)))))

(assert (=> d!134799 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27108 (select (arr!38339 a!3806) from!3184) Nil!27109)) e!698752)))

(declare-fun b!1231835 () Bool)

(assert (=> b!1231835 (= e!698753 e!698751)))

(declare-fun c!120658 () Bool)

(assert (=> b!1231835 (= c!120658 (validKeyInArray!0 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60892 () Bool)

(assert (=> bm!60892 (= call!60895 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120658 (Cons!27108 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27108 (select (arr!38339 a!3806) from!3184) Nil!27109)) (Cons!27108 (select (arr!38339 a!3806) from!3184) Nil!27109))))))

(assert (= (and d!134799 (not res!820235)) b!1231833))

(assert (= (and b!1231833 res!820237) b!1231832))

(assert (= (and b!1231833 res!820236) b!1231835))

(assert (= (and b!1231835 c!120658) b!1231834))

(assert (= (and b!1231835 (not c!120658)) b!1231831))

(assert (= (or b!1231834 b!1231831) bm!60892))

(declare-fun m!1135915 () Bool)

(assert (=> b!1231832 m!1135915))

(assert (=> b!1231832 m!1135915))

(declare-fun m!1135917 () Bool)

(assert (=> b!1231832 m!1135917))

(assert (=> b!1231833 m!1135915))

(assert (=> b!1231833 m!1135915))

(declare-fun m!1135919 () Bool)

(assert (=> b!1231833 m!1135919))

(assert (=> b!1231835 m!1135915))

(assert (=> b!1231835 m!1135915))

(assert (=> b!1231835 m!1135919))

(assert (=> bm!60892 m!1135915))

(declare-fun m!1135921 () Bool)

(assert (=> bm!60892 m!1135921))

(assert (=> b!1231719 d!134799))

(declare-fun b!1231841 () Bool)

(declare-fun e!698759 () Bool)

(declare-fun call!60897 () Bool)

(assert (=> b!1231841 (= e!698759 call!60897)))

(declare-fun b!1231842 () Bool)

(declare-fun e!698762 () Bool)

(assert (=> b!1231842 (= e!698762 (contains!7174 Nil!27109 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1231843 () Bool)

(declare-fun e!698760 () Bool)

(declare-fun e!698761 () Bool)

(assert (=> b!1231843 (= e!698760 e!698761)))

(declare-fun res!820242 () Bool)

(assert (=> b!1231843 (=> (not res!820242) (not e!698761))))

(assert (=> b!1231843 (= res!820242 (not e!698762))))

(declare-fun res!820243 () Bool)

(assert (=> b!1231843 (=> (not res!820243) (not e!698762))))

(assert (=> b!1231843 (= res!820243 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun b!1231844 () Bool)

(assert (=> b!1231844 (= e!698759 call!60897)))

(declare-fun d!134801 () Bool)

(declare-fun res!820241 () Bool)

(assert (=> d!134801 (=> res!820241 e!698760)))

(assert (=> d!134801 (= res!820241 (bvsge from!3184 (size!38875 a!3806)))))

(assert (=> d!134801 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27109) e!698760)))

(declare-fun b!1231845 () Bool)

(assert (=> b!1231845 (= e!698761 e!698759)))

(declare-fun c!120660 () Bool)

(assert (=> b!1231845 (= c!120660 (validKeyInArray!0 (select (arr!38339 a!3806) from!3184)))))

(declare-fun bm!60894 () Bool)

(assert (=> bm!60894 (= call!60897 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120660 (Cons!27108 (select (arr!38339 a!3806) from!3184) Nil!27109) Nil!27109)))))

(assert (= (and d!134801 (not res!820241)) b!1231843))

(assert (= (and b!1231843 res!820243) b!1231842))

(assert (= (and b!1231843 res!820242) b!1231845))

(assert (= (and b!1231845 c!120660) b!1231844))

(assert (= (and b!1231845 (not c!120660)) b!1231841))

(assert (= (or b!1231844 b!1231841) bm!60894))

(assert (=> b!1231842 m!1135823))

(assert (=> b!1231842 m!1135823))

(declare-fun m!1135929 () Bool)

(assert (=> b!1231842 m!1135929))

(assert (=> b!1231843 m!1135823))

(assert (=> b!1231843 m!1135823))

(assert (=> b!1231843 m!1135831))

(assert (=> b!1231845 m!1135823))

(assert (=> b!1231845 m!1135823))

(assert (=> b!1231845 m!1135831))

(assert (=> bm!60894 m!1135823))

(declare-fun m!1135931 () Bool)

(assert (=> bm!60894 m!1135931))

(assert (=> b!1231719 d!134801))

(declare-fun d!134805 () Bool)

(assert (=> d!134805 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27109)))

(declare-fun lt!559456 () Unit!40784)

(declare-fun choose!80 (array!79448 List!27112 List!27112 (_ BitVec 32)) Unit!40784)

(assert (=> d!134805 (= lt!559456 (choose!80 a!3806 acc!823 Nil!27109 from!3184))))

(assert (=> d!134805 (bvslt (size!38875 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134805 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27109 from!3184) lt!559456)))

(declare-fun bs!34616 () Bool)

(assert (= bs!34616 d!134805))

(assert (=> bs!34616 m!1135821))

(declare-fun m!1135937 () Bool)

(assert (=> bs!34616 m!1135937))

(assert (=> b!1231719 d!134805))

(declare-fun b!1231861 () Bool)

(declare-fun e!698775 () Bool)

(declare-fun call!60901 () Bool)

(assert (=> b!1231861 (= e!698775 call!60901)))

(declare-fun b!1231862 () Bool)

(declare-fun e!698778 () Bool)

(assert (=> b!1231862 (= e!698778 (contains!7174 (Cons!27108 (select (arr!38339 a!3806) from!3184) acc!823) (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231863 () Bool)

(declare-fun e!698776 () Bool)

(declare-fun e!698777 () Bool)

(assert (=> b!1231863 (= e!698776 e!698777)))

(declare-fun res!820254 () Bool)

(assert (=> b!1231863 (=> (not res!820254) (not e!698777))))

(assert (=> b!1231863 (= res!820254 (not e!698778))))

(declare-fun res!820255 () Bool)

(assert (=> b!1231863 (=> (not res!820255) (not e!698778))))

(assert (=> b!1231863 (= res!820255 (validKeyInArray!0 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231864 () Bool)

(assert (=> b!1231864 (= e!698775 call!60901)))

(declare-fun d!134809 () Bool)

(declare-fun res!820253 () Bool)

(assert (=> d!134809 (=> res!820253 e!698776)))

(assert (=> d!134809 (= res!820253 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38875 a!3806)))))

(assert (=> d!134809 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27108 (select (arr!38339 a!3806) from!3184) acc!823)) e!698776)))

(declare-fun b!1231865 () Bool)

(assert (=> b!1231865 (= e!698777 e!698775)))

(declare-fun c!120664 () Bool)

(assert (=> b!1231865 (= c!120664 (validKeyInArray!0 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!60898 () Bool)

(assert (=> bm!60898 (= call!60901 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120664 (Cons!27108 (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27108 (select (arr!38339 a!3806) from!3184) acc!823)) (Cons!27108 (select (arr!38339 a!3806) from!3184) acc!823))))))

(assert (= (and d!134809 (not res!820253)) b!1231863))

(assert (= (and b!1231863 res!820255) b!1231862))

(assert (= (and b!1231863 res!820254) b!1231865))

(assert (= (and b!1231865 c!120664) b!1231864))

(assert (= (and b!1231865 (not c!120664)) b!1231861))

(assert (= (or b!1231864 b!1231861) bm!60898))

(assert (=> b!1231862 m!1135915))

(assert (=> b!1231862 m!1135915))

(declare-fun m!1135941 () Bool)

(assert (=> b!1231862 m!1135941))

(assert (=> b!1231863 m!1135915))

(assert (=> b!1231863 m!1135915))

(assert (=> b!1231863 m!1135919))

(assert (=> b!1231865 m!1135915))

(assert (=> b!1231865 m!1135915))

(assert (=> b!1231865 m!1135919))

(assert (=> bm!60898 m!1135915))

(declare-fun m!1135947 () Bool)

(assert (=> bm!60898 m!1135947))

(assert (=> b!1231719 d!134809))

(declare-fun d!134813 () Bool)

(declare-fun res!820273 () Bool)

(declare-fun e!698799 () Bool)

(assert (=> d!134813 (=> res!820273 e!698799)))

(assert (=> d!134813 (= res!820273 (is-Nil!27109 acc!823))))

(assert (=> d!134813 (= (noDuplicate!1771 acc!823) e!698799)))

(declare-fun b!1231889 () Bool)

(declare-fun e!698800 () Bool)

(assert (=> b!1231889 (= e!698799 e!698800)))

(declare-fun res!820274 () Bool)

(assert (=> b!1231889 (=> (not res!820274) (not e!698800))))

(assert (=> b!1231889 (= res!820274 (not (contains!7174 (t!40575 acc!823) (h!28317 acc!823))))))

(declare-fun b!1231890 () Bool)

(assert (=> b!1231890 (= e!698800 (noDuplicate!1771 (t!40575 acc!823)))))

(assert (= (and d!134813 (not res!820273)) b!1231889))

(assert (= (and b!1231889 res!820274) b!1231890))

(declare-fun m!1135959 () Bool)

(assert (=> b!1231889 m!1135959))

(declare-fun m!1135961 () Bool)

(assert (=> b!1231890 m!1135961))

(assert (=> b!1231725 d!134813))

(declare-fun d!134823 () Bool)

(declare-fun lt!559465 () Bool)

(declare-fun content!568 (List!27112) (Set (_ BitVec 64)))

(assert (=> d!134823 (= lt!559465 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!568 acc!823)))))

(declare-fun e!698819 () Bool)

(assert (=> d!134823 (= lt!559465 e!698819)))

(declare-fun res!820291 () Bool)

(assert (=> d!134823 (=> (not res!820291) (not e!698819))))

(assert (=> d!134823 (= res!820291 (is-Cons!27108 acc!823))))

(assert (=> d!134823 (= (contains!7174 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559465)))

(declare-fun b!1231911 () Bool)

(declare-fun e!698820 () Bool)

(assert (=> b!1231911 (= e!698819 e!698820)))

(declare-fun res!820292 () Bool)

(assert (=> b!1231911 (=> res!820292 e!698820)))

(assert (=> b!1231911 (= res!820292 (= (h!28317 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231912 () Bool)

(assert (=> b!1231912 (= e!698820 (contains!7174 (t!40575 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134823 res!820291) b!1231911))

(assert (= (and b!1231911 (not res!820292)) b!1231912))

(declare-fun m!1135981 () Bool)

(assert (=> d!134823 m!1135981))

(declare-fun m!1135984 () Bool)

(assert (=> d!134823 m!1135984))

(declare-fun m!1135987 () Bool)

(assert (=> b!1231912 m!1135987))

(assert (=> b!1231720 d!134823))

(declare-fun d!134837 () Bool)

(declare-fun res!820300 () Bool)

(declare-fun e!698829 () Bool)

(assert (=> d!134837 (=> res!820300 e!698829)))

(assert (=> d!134837 (= res!820300 (= (select (arr!38339 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134837 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698829)))

(declare-fun b!1231922 () Bool)

(declare-fun e!698830 () Bool)

(assert (=> b!1231922 (= e!698829 e!698830)))

(declare-fun res!820301 () Bool)

(assert (=> b!1231922 (=> (not res!820301) (not e!698830))))

(assert (=> b!1231922 (= res!820301 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38875 a!3806)))))

(declare-fun b!1231923 () Bool)

(assert (=> b!1231923 (= e!698830 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134837 (not res!820300)) b!1231922))

(assert (= (and b!1231922 res!820301) b!1231923))

(assert (=> d!134837 m!1135915))

(declare-fun m!1135995 () Bool)

(assert (=> b!1231923 m!1135995))

(assert (=> b!1231726 d!134837))

(declare-fun d!134847 () Bool)

(declare-fun lt!559466 () Bool)

(assert (=> d!134847 (= lt!559466 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!568 acc!823)))))

(declare-fun e!698831 () Bool)

(assert (=> d!134847 (= lt!559466 e!698831)))

(declare-fun res!820302 () Bool)

(assert (=> d!134847 (=> (not res!820302) (not e!698831))))

(assert (=> d!134847 (= res!820302 (is-Cons!27108 acc!823))))

(assert (=> d!134847 (= (contains!7174 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559466)))

(declare-fun b!1231924 () Bool)

(declare-fun e!698832 () Bool)

(assert (=> b!1231924 (= e!698831 e!698832)))

(declare-fun res!820303 () Bool)

(assert (=> b!1231924 (=> res!820303 e!698832)))

(assert (=> b!1231924 (= res!820303 (= (h!28317 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231925 () Bool)

(assert (=> b!1231925 (= e!698832 (contains!7174 (t!40575 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134847 res!820302) b!1231924))

(assert (= (and b!1231924 (not res!820303)) b!1231925))

(assert (=> d!134847 m!1135981))

(declare-fun m!1135997 () Bool)

(assert (=> d!134847 m!1135997))

(declare-fun m!1135999 () Bool)

(assert (=> b!1231925 m!1135999))

(assert (=> b!1231727 d!134847))

(push 1)

