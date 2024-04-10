; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102382 () Bool)

(assert start!102382)

(declare-fun b!1231773 () Bool)

(declare-fun res!820195 () Bool)

(declare-fun e!698705 () Bool)

(assert (=> b!1231773 (=> (not res!820195) (not e!698705))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79452 0))(
  ( (array!79453 (arr!38341 (Array (_ BitVec 32) (_ BitVec 64))) (size!38877 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79452)

(assert (=> b!1231773 (= res!820195 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38877 a!3806)) (bvslt from!3184 (size!38877 a!3806))))))

(declare-fun res!820193 () Bool)

(assert (=> start!102382 (=> (not res!820193) (not e!698705))))

(assert (=> start!102382 (= res!820193 (bvslt (size!38877 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102382 e!698705))

(declare-fun array_inv!29189 (array!79452) Bool)

(assert (=> start!102382 (array_inv!29189 a!3806)))

(assert (=> start!102382 true))

(declare-fun b!1231774 () Bool)

(declare-fun res!820194 () Bool)

(assert (=> b!1231774 (=> (not res!820194) (not e!698705))))

(declare-datatypes ((List!27114 0))(
  ( (Nil!27111) (Cons!27110 (h!28319 (_ BitVec 64)) (t!40577 List!27114)) )
))
(declare-fun acc!823 () List!27114)

(declare-fun noDuplicate!1773 (List!27114) Bool)

(assert (=> b!1231774 (= res!820194 (noDuplicate!1773 acc!823))))

(declare-fun b!1231775 () Bool)

(declare-fun res!820192 () Bool)

(assert (=> b!1231775 (=> (not res!820192) (not e!698705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231775 (= res!820192 (validKeyInArray!0 (select (arr!38341 a!3806) from!3184)))))

(declare-fun b!1231776 () Bool)

(declare-fun res!820191 () Bool)

(assert (=> b!1231776 (=> (not res!820191) (not e!698705))))

(declare-fun contains!7176 (List!27114 (_ BitVec 64)) Bool)

(assert (=> b!1231776 (= res!820191 (not (contains!7176 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231777 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79452 (_ BitVec 32) List!27114) Bool)

(assert (=> b!1231777 (= e!698705 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27110 (select (arr!38341 a!3806) from!3184) Nil!27111))))))

(assert (=> b!1231777 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27111)))

(declare-datatypes ((Unit!40788 0))(
  ( (Unit!40789) )
))
(declare-fun lt!559445 () Unit!40788)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79452 List!27114 List!27114 (_ BitVec 32)) Unit!40788)

(assert (=> b!1231777 (= lt!559445 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27111 from!3184))))

(assert (=> b!1231777 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27110 (select (arr!38341 a!3806) from!3184) acc!823))))

(declare-fun b!1231778 () Bool)

(declare-fun res!820189 () Bool)

(assert (=> b!1231778 (=> (not res!820189) (not e!698705))))

(assert (=> b!1231778 (= res!820189 (not (contains!7176 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231779 () Bool)

(declare-fun res!820190 () Bool)

(assert (=> b!1231779 (=> (not res!820190) (not e!698705))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231779 (= res!820190 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231780 () Bool)

(declare-fun res!820188 () Bool)

(assert (=> b!1231780 (=> (not res!820188) (not e!698705))))

(assert (=> b!1231780 (= res!820188 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231781 () Bool)

(declare-fun res!820187 () Bool)

(assert (=> b!1231781 (=> (not res!820187) (not e!698705))))

(assert (=> b!1231781 (= res!820187 (validKeyInArray!0 k!2913))))

(assert (= (and start!102382 res!820193) b!1231781))

(assert (= (and b!1231781 res!820187) b!1231773))

(assert (= (and b!1231773 res!820195) b!1231774))

(assert (= (and b!1231774 res!820194) b!1231776))

(assert (= (and b!1231776 res!820191) b!1231778))

(assert (= (and b!1231778 res!820189) b!1231779))

(assert (= (and b!1231779 res!820190) b!1231780))

(assert (= (and b!1231780 res!820188) b!1231775))

(assert (= (and b!1231775 res!820192) b!1231777))

(declare-fun m!1135865 () Bool)

(assert (=> b!1231781 m!1135865))

(declare-fun m!1135867 () Bool)

(assert (=> b!1231777 m!1135867))

(declare-fun m!1135869 () Bool)

(assert (=> b!1231777 m!1135869))

(declare-fun m!1135871 () Bool)

(assert (=> b!1231777 m!1135871))

(declare-fun m!1135873 () Bool)

(assert (=> b!1231777 m!1135873))

(declare-fun m!1135875 () Bool)

(assert (=> b!1231777 m!1135875))

(declare-fun m!1135877 () Bool)

(assert (=> b!1231776 m!1135877))

(declare-fun m!1135879 () Bool)

(assert (=> b!1231780 m!1135879))

(declare-fun m!1135881 () Bool)

(assert (=> b!1231774 m!1135881))

(declare-fun m!1135883 () Bool)

(assert (=> b!1231779 m!1135883))

(declare-fun m!1135885 () Bool)

(assert (=> start!102382 m!1135885))

(assert (=> b!1231775 m!1135871))

(assert (=> b!1231775 m!1135871))

(declare-fun m!1135887 () Bool)

(assert (=> b!1231775 m!1135887))

(declare-fun m!1135889 () Bool)

(assert (=> b!1231778 m!1135889))

(push 1)

(assert (not b!1231777))

(assert (not b!1231781))

(assert (not b!1231774))

(assert (not b!1231779))

(assert (not b!1231778))

(assert (not b!1231776))

(assert (not b!1231775))

(assert (not b!1231780))

(assert (not start!102382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134783 () Bool)

(declare-fun res!820218 () Bool)

(declare-fun e!698731 () Bool)

(assert (=> d!134783 (=> res!820218 e!698731)))

(assert (=> d!134783 (= res!820218 (= (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134783 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698731)))

(declare-fun b!1231808 () Bool)

(declare-fun e!698732 () Bool)

(assert (=> b!1231808 (= e!698731 e!698732)))

(declare-fun res!820219 () Bool)

(assert (=> b!1231808 (=> (not res!820219) (not e!698732))))

(assert (=> b!1231808 (= res!820219 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38877 a!3806)))))

(declare-fun b!1231809 () Bool)

(assert (=> b!1231809 (= e!698732 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134783 (not res!820218)) b!1231808))

(assert (= (and b!1231808 res!820219) b!1231809))

(declare-fun m!1135901 () Bool)

(assert (=> d!134783 m!1135901))

(declare-fun m!1135903 () Bool)

(assert (=> b!1231809 m!1135903))

(assert (=> b!1231779 d!134783))

(declare-fun d!134789 () Bool)

(declare-fun lt!559451 () Bool)

(declare-fun content!567 (List!27114) (Set (_ BitVec 64)))

(assert (=> d!134789 (= lt!559451 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!567 acc!823)))))

(declare-fun e!698750 () Bool)

(assert (=> d!134789 (= lt!559451 e!698750)))

(declare-fun res!820234 () Bool)

(assert (=> d!134789 (=> (not res!820234) (not e!698750))))

(assert (=> d!134789 (= res!820234 (is-Cons!27110 acc!823))))

(assert (=> d!134789 (= (contains!7176 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559451)))

(declare-fun b!1231829 () Bool)

(declare-fun e!698749 () Bool)

(assert (=> b!1231829 (= e!698750 e!698749)))

(declare-fun res!820233 () Bool)

(assert (=> b!1231829 (=> res!820233 e!698749)))

(assert (=> b!1231829 (= res!820233 (= (h!28319 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231830 () Bool)

(assert (=> b!1231830 (= e!698749 (contains!7176 (t!40577 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134789 res!820234) b!1231829))

(assert (= (and b!1231829 (not res!820233)) b!1231830))

(declare-fun m!1135909 () Bool)

(assert (=> d!134789 m!1135909))

(declare-fun m!1135911 () Bool)

(assert (=> d!134789 m!1135911))

(declare-fun m!1135913 () Bool)

(assert (=> b!1231830 m!1135913))

(assert (=> b!1231778 d!134789))

(declare-fun c!120665 () Bool)

(declare-fun bm!60899 () Bool)

(declare-fun call!60902 () Bool)

(assert (=> bm!60899 (= call!60902 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120665 (Cons!27110 (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27110 (select (arr!38341 a!3806) from!3184) Nil!27111)) (Cons!27110 (select (arr!38341 a!3806) from!3184) Nil!27111))))))

(declare-fun b!1231866 () Bool)

(declare-fun e!698782 () Bool)

(declare-fun e!698780 () Bool)

(assert (=> b!1231866 (= e!698782 e!698780)))

(declare-fun res!820257 () Bool)

(assert (=> b!1231866 (=> (not res!820257) (not e!698780))))

(declare-fun e!698779 () Bool)

(assert (=> b!1231866 (= res!820257 (not e!698779))))

(declare-fun res!820258 () Bool)

(assert (=> b!1231866 (=> (not res!820258) (not e!698779))))

(assert (=> b!1231866 (= res!820258 (validKeyInArray!0 (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231867 () Bool)

(declare-fun e!698781 () Bool)

(assert (=> b!1231867 (= e!698780 e!698781)))

(assert (=> b!1231867 (= c!120665 (validKeyInArray!0 (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231868 () Bool)

(assert (=> b!1231868 (= e!698779 (contains!7176 (Cons!27110 (select (arr!38341 a!3806) from!3184) Nil!27111) (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231869 () Bool)

(assert (=> b!1231869 (= e!698781 call!60902)))

(declare-fun d!134793 () Bool)

(declare-fun res!820256 () Bool)

(assert (=> d!134793 (=> res!820256 e!698782)))

(assert (=> d!134793 (= res!820256 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38877 a!3806)))))

(assert (=> d!134793 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27110 (select (arr!38341 a!3806) from!3184) Nil!27111)) e!698782)))

(declare-fun b!1231870 () Bool)

(assert (=> b!1231870 (= e!698781 call!60902)))

(assert (= (and d!134793 (not res!820256)) b!1231866))

(assert (= (and b!1231866 res!820258) b!1231868))

(assert (= (and b!1231866 res!820257) b!1231867))

(assert (= (and b!1231867 c!120665) b!1231869))

(assert (= (and b!1231867 (not c!120665)) b!1231870))

(assert (= (or b!1231869 b!1231870) bm!60899))

(assert (=> bm!60899 m!1135901))

(declare-fun m!1135943 () Bool)

(assert (=> bm!60899 m!1135943))

(assert (=> b!1231866 m!1135901))

(assert (=> b!1231866 m!1135901))

(declare-fun m!1135945 () Bool)

(assert (=> b!1231866 m!1135945))

(assert (=> b!1231867 m!1135901))

(assert (=> b!1231867 m!1135901))

(assert (=> b!1231867 m!1135945))

(assert (=> b!1231868 m!1135901))

(assert (=> b!1231868 m!1135901))

(declare-fun m!1135949 () Bool)

(assert (=> b!1231868 m!1135949))

(assert (=> b!1231777 d!134793))

(declare-fun call!60904 () Bool)

(declare-fun c!120667 () Bool)

(declare-fun bm!60901 () Bool)

(assert (=> bm!60901 (= call!60904 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120667 (Cons!27110 (select (arr!38341 a!3806) from!3184) Nil!27111) Nil!27111)))))

(declare-fun b!1231876 () Bool)

(declare-fun e!698790 () Bool)

(declare-fun e!698788 () Bool)

(assert (=> b!1231876 (= e!698790 e!698788)))

(declare-fun res!820263 () Bool)

(assert (=> b!1231876 (=> (not res!820263) (not e!698788))))

(declare-fun e!698787 () Bool)

(assert (=> b!1231876 (= res!820263 (not e!698787))))

(declare-fun res!820264 () Bool)

(assert (=> b!1231876 (=> (not res!820264) (not e!698787))))

(assert (=> b!1231876 (= res!820264 (validKeyInArray!0 (select (arr!38341 a!3806) from!3184)))))

(declare-fun b!1231877 () Bool)

(declare-fun e!698789 () Bool)

(assert (=> b!1231877 (= e!698788 e!698789)))

(assert (=> b!1231877 (= c!120667 (validKeyInArray!0 (select (arr!38341 a!3806) from!3184)))))

(declare-fun b!1231878 () Bool)

(assert (=> b!1231878 (= e!698787 (contains!7176 Nil!27111 (select (arr!38341 a!3806) from!3184)))))

(declare-fun b!1231879 () Bool)

(assert (=> b!1231879 (= e!698789 call!60904)))

(declare-fun d!134815 () Bool)

(declare-fun res!820262 () Bool)

(assert (=> d!134815 (=> res!820262 e!698790)))

(assert (=> d!134815 (= res!820262 (bvsge from!3184 (size!38877 a!3806)))))

(assert (=> d!134815 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27111) e!698790)))

(declare-fun b!1231880 () Bool)

(assert (=> b!1231880 (= e!698789 call!60904)))

(assert (= (and d!134815 (not res!820262)) b!1231876))

(assert (= (and b!1231876 res!820264) b!1231878))

(assert (= (and b!1231876 res!820263) b!1231877))

(assert (= (and b!1231877 c!120667) b!1231879))

(assert (= (and b!1231877 (not c!120667)) b!1231880))

(assert (= (or b!1231879 b!1231880) bm!60901))

(assert (=> bm!60901 m!1135871))

(declare-fun m!1135955 () Bool)

(assert (=> bm!60901 m!1135955))

(assert (=> b!1231876 m!1135871))

(assert (=> b!1231876 m!1135871))

(assert (=> b!1231876 m!1135887))

(assert (=> b!1231877 m!1135871))

(assert (=> b!1231877 m!1135871))

(assert (=> b!1231877 m!1135887))

(assert (=> b!1231878 m!1135871))

(assert (=> b!1231878 m!1135871))

(declare-fun m!1135957 () Bool)

(assert (=> b!1231878 m!1135957))

(assert (=> b!1231777 d!134815))

(declare-fun d!134821 () Bool)

(assert (=> d!134821 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27111)))

(declare-fun lt!559460 () Unit!40788)

(declare-fun choose!80 (array!79452 List!27114 List!27114 (_ BitVec 32)) Unit!40788)

(assert (=> d!134821 (= lt!559460 (choose!80 a!3806 acc!823 Nil!27111 from!3184))))

(assert (=> d!134821 (bvslt (size!38877 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134821 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27111 from!3184) lt!559460)))

(declare-fun bs!34618 () Bool)

(assert (= bs!34618 d!134821))

(assert (=> bs!34618 m!1135869))

(declare-fun m!1135967 () Bool)

(assert (=> bs!34618 m!1135967))

(assert (=> b!1231777 d!134821))

(declare-fun c!120669 () Bool)

(declare-fun call!60906 () Bool)

(declare-fun bm!60903 () Bool)

(assert (=> bm!60903 (= call!60906 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120669 (Cons!27110 (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27110 (select (arr!38341 a!3806) from!3184) acc!823)) (Cons!27110 (select (arr!38341 a!3806) from!3184) acc!823))))))

(declare-fun b!1231898 () Bool)

(declare-fun e!698810 () Bool)

(declare-fun e!698808 () Bool)

(assert (=> b!1231898 (= e!698810 e!698808)))

(declare-fun res!820281 () Bool)

(assert (=> b!1231898 (=> (not res!820281) (not e!698808))))

(declare-fun e!698807 () Bool)

(assert (=> b!1231898 (= res!820281 (not e!698807))))

(declare-fun res!820282 () Bool)

(assert (=> b!1231898 (=> (not res!820282) (not e!698807))))

(assert (=> b!1231898 (= res!820282 (validKeyInArray!0 (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231899 () Bool)

(declare-fun e!698809 () Bool)

(assert (=> b!1231899 (= e!698808 e!698809)))

(assert (=> b!1231899 (= c!120669 (validKeyInArray!0 (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231900 () Bool)

(assert (=> b!1231900 (= e!698807 (contains!7176 (Cons!27110 (select (arr!38341 a!3806) from!3184) acc!823) (select (arr!38341 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

