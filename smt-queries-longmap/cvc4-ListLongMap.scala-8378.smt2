; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101876 () Bool)

(assert start!101876)

(declare-fun res!815600 () Bool)

(declare-fun e!696697 () Bool)

(assert (=> start!101876 (=> (not res!815600) (not e!696697))))

(declare-datatypes ((array!79215 0))(
  ( (array!79216 (arr!38233 (Array (_ BitVec 32) (_ BitVec 64))) (size!38769 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79215)

(assert (=> start!101876 (= res!815600 (bvslt (size!38769 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101876 e!696697))

(declare-fun array_inv!29081 (array!79215) Bool)

(assert (=> start!101876 (array_inv!29081 a!3806)))

(assert (=> start!101876 true))

(declare-fun b!1226947 () Bool)

(declare-datatypes ((List!27006 0))(
  ( (Nil!27003) (Cons!27002 (h!28211 (_ BitVec 64)) (t!40469 List!27006)) )
))
(declare-fun acc!823 () List!27006)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun noDuplicate!1665 (List!27006) Bool)

(assert (=> b!1226947 (= e!696697 (not (noDuplicate!1665 (Cons!27002 (select (arr!38233 a!3806) from!3184) acc!823))))))

(declare-fun b!1226948 () Bool)

(declare-fun res!815603 () Bool)

(assert (=> b!1226948 (=> (not res!815603) (not e!696697))))

(assert (=> b!1226948 (= res!815603 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun b!1226949 () Bool)

(declare-fun res!815602 () Bool)

(assert (=> b!1226949 (=> (not res!815602) (not e!696697))))

(assert (=> b!1226949 (= res!815602 (noDuplicate!1665 acc!823))))

(declare-fun b!1226950 () Bool)

(declare-fun res!815599 () Bool)

(assert (=> b!1226950 (=> (not res!815599) (not e!696697))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226950 (= res!815599 (validKeyInArray!0 k!2913))))

(declare-fun b!1226951 () Bool)

(declare-fun res!815604 () Bool)

(assert (=> b!1226951 (=> (not res!815604) (not e!696697))))

(assert (=> b!1226951 (= res!815604 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38769 a!3806)) (bvslt from!3184 (size!38769 a!3806))))))

(declare-fun b!1226952 () Bool)

(declare-fun res!815598 () Bool)

(assert (=> b!1226952 (=> (not res!815598) (not e!696697))))

(declare-fun contains!7068 (List!27006 (_ BitVec 64)) Bool)

(assert (=> b!1226952 (= res!815598 (not (contains!7068 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226953 () Bool)

(declare-fun res!815595 () Bool)

(assert (=> b!1226953 (=> (not res!815595) (not e!696697))))

(assert (=> b!1226953 (= res!815595 (not (contains!7068 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226954 () Bool)

(declare-fun res!815601 () Bool)

(assert (=> b!1226954 (=> (not res!815601) (not e!696697))))

(assert (=> b!1226954 (= res!815601 (validKeyInArray!0 (select (arr!38233 a!3806) from!3184)))))

(declare-fun b!1226955 () Bool)

(declare-fun res!815596 () Bool)

(assert (=> b!1226955 (=> (not res!815596) (not e!696697))))

(declare-fun arrayNoDuplicates!0 (array!79215 (_ BitVec 32) List!27006) Bool)

(assert (=> b!1226955 (= res!815596 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1226956 () Bool)

(declare-fun res!815597 () Bool)

(assert (=> b!1226956 (=> (not res!815597) (not e!696697))))

(declare-fun arrayContainsKey!0 (array!79215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226956 (= res!815597 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!101876 res!815600) b!1226950))

(assert (= (and b!1226950 res!815599) b!1226951))

(assert (= (and b!1226951 res!815604) b!1226949))

(assert (= (and b!1226949 res!815602) b!1226952))

(assert (= (and b!1226952 res!815598) b!1226953))

(assert (= (and b!1226953 res!815595) b!1226956))

(assert (= (and b!1226956 res!815597) b!1226955))

(assert (= (and b!1226955 res!815596) b!1226954))

(assert (= (and b!1226954 res!815601) b!1226948))

(assert (= (and b!1226948 res!815603) b!1226947))

(declare-fun m!1131865 () Bool)

(assert (=> b!1226953 m!1131865))

(declare-fun m!1131867 () Bool)

(assert (=> b!1226954 m!1131867))

(assert (=> b!1226954 m!1131867))

(declare-fun m!1131869 () Bool)

(assert (=> b!1226954 m!1131869))

(declare-fun m!1131871 () Bool)

(assert (=> b!1226955 m!1131871))

(declare-fun m!1131873 () Bool)

(assert (=> start!101876 m!1131873))

(declare-fun m!1131875 () Bool)

(assert (=> b!1226952 m!1131875))

(assert (=> b!1226947 m!1131867))

(declare-fun m!1131877 () Bool)

(assert (=> b!1226947 m!1131877))

(declare-fun m!1131879 () Bool)

(assert (=> b!1226950 m!1131879))

(declare-fun m!1131881 () Bool)

(assert (=> b!1226949 m!1131881))

(declare-fun m!1131883 () Bool)

(assert (=> b!1226956 m!1131883))

(push 1)

(assert (not b!1226955))

(assert (not b!1226947))

(assert (not b!1226950))

(assert (not b!1226956))

(assert (not start!101876))

(assert (not b!1226953))

(assert (not b!1226949))

(assert (not b!1226952))

(assert (not b!1226954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134069 () Bool)

(assert (=> d!134069 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226950 d!134069))

(declare-fun b!1227008 () Bool)

(declare-fun e!696747 () Bool)

(declare-fun e!696748 () Bool)

(assert (=> b!1227008 (= e!696747 e!696748)))

(declare-fun res!815646 () Bool)

(assert (=> b!1227008 (=> (not res!815646) (not e!696748))))

(declare-fun e!696745 () Bool)

(assert (=> b!1227008 (= res!815646 (not e!696745))))

(declare-fun res!815648 () Bool)

(assert (=> b!1227008 (=> (not res!815648) (not e!696745))))

(assert (=> b!1227008 (= res!815648 (validKeyInArray!0 (select (arr!38233 a!3806) from!3184)))))

(declare-fun b!1227010 () Bool)

(assert (=> b!1227010 (= e!696745 (contains!7068 acc!823 (select (arr!38233 a!3806) from!3184)))))

(declare-fun b!1227011 () Bool)

(declare-fun e!696746 () Bool)

(declare-fun call!60796 () Bool)

(assert (=> b!1227011 (= e!696746 call!60796)))

(declare-fun c!120541 () Bool)

(declare-fun bm!60793 () Bool)

(assert (=> bm!60793 (= call!60796 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120541 (Cons!27002 (select (arr!38233 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1227012 () Bool)

(assert (=> b!1227012 (= e!696746 call!60796)))

(declare-fun d!134071 () Bool)

(declare-fun res!815647 () Bool)

(assert (=> d!134071 (=> res!815647 e!696747)))

(assert (=> d!134071 (= res!815647 (bvsge from!3184 (size!38769 a!3806)))))

(assert (=> d!134071 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!696747)))

(declare-fun b!1227009 () Bool)

(assert (=> b!1227009 (= e!696748 e!696746)))

(assert (=> b!1227009 (= c!120541 (validKeyInArray!0 (select (arr!38233 a!3806) from!3184)))))

(assert (= (and d!134071 (not res!815647)) b!1227008))

(assert (= (and b!1227008 res!815648) b!1227010))

(assert (= (and b!1227008 res!815646) b!1227009))

(assert (= (and b!1227009 c!120541) b!1227011))

(assert (= (and b!1227009 (not c!120541)) b!1227012))

(assert (= (or b!1227011 b!1227012) bm!60793))

(assert (=> b!1227008 m!1131867))

(assert (=> b!1227008 m!1131867))

(assert (=> b!1227008 m!1131869))

(assert (=> b!1227010 m!1131867))

(assert (=> b!1227010 m!1131867))

(declare-fun m!1131913 () Bool)

(assert (=> b!1227010 m!1131913))

(assert (=> bm!60793 m!1131867))

(declare-fun m!1131915 () Bool)

(assert (=> bm!60793 m!1131915))

(assert (=> b!1227009 m!1131867))

(assert (=> b!1227009 m!1131867))

(assert (=> b!1227009 m!1131869))

(assert (=> b!1226955 d!134071))

(declare-fun d!134083 () Bool)

(assert (=> d!134083 (= (array_inv!29081 a!3806) (bvsge (size!38769 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!101876 d!134083))

(declare-fun d!134085 () Bool)

(assert (=> d!134085 (= (validKeyInArray!0 (select (arr!38233 a!3806) from!3184)) (and (not (= (select (arr!38233 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38233 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226954 d!134085))

(declare-fun d!134087 () Bool)

(declare-fun res!815669 () Bool)

(declare-fun e!696769 () Bool)

(assert (=> d!134087 (=> res!815669 e!696769)))

(assert (=> d!134087 (= res!815669 (is-Nil!27003 acc!823))))

(assert (=> d!134087 (= (noDuplicate!1665 acc!823) e!696769)))

(declare-fun b!1227033 () Bool)

(declare-fun e!696770 () Bool)

(assert (=> b!1227033 (= e!696769 e!696770)))

(declare-fun res!815670 () Bool)

(assert (=> b!1227033 (=> (not res!815670) (not e!696770))))

(assert (=> b!1227033 (= res!815670 (not (contains!7068 (t!40469 acc!823) (h!28211 acc!823))))))

(declare-fun b!1227034 () Bool)

(assert (=> b!1227034 (= e!696770 (noDuplicate!1665 (t!40469 acc!823)))))

(assert (= (and d!134087 (not res!815669)) b!1227033))

(assert (= (and b!1227033 res!815670) b!1227034))

(declare-fun m!1131933 () Bool)

(assert (=> b!1227033 m!1131933))

(declare-fun m!1131935 () Bool)

(assert (=> b!1227034 m!1131935))

(assert (=> b!1226949 d!134087))

(declare-fun d!134097 () Bool)

(declare-fun lt!558874 () Bool)

(declare-fun content!549 (List!27006) (Set (_ BitVec 64)))

