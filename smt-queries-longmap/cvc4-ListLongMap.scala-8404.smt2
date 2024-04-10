; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102208 () Bool)

(assert start!102208)

(declare-fun b!1230462 () Bool)

(declare-fun res!818955 () Bool)

(declare-fun e!698105 () Bool)

(assert (=> b!1230462 (=> (not res!818955) (not e!698105))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79383 0))(
  ( (array!79384 (arr!38311 (Array (_ BitVec 32) (_ BitVec 64))) (size!38847 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79383)

(assert (=> b!1230462 (= res!818955 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38847 a!3806)) (bvslt from!3184 (size!38847 a!3806))))))

(declare-fun b!1230463 () Bool)

(declare-fun res!818952 () Bool)

(assert (=> b!1230463 (=> (not res!818952) (not e!698105))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230463 (= res!818952 (validKeyInArray!0 k!2913))))

(declare-fun res!818954 () Bool)

(assert (=> start!102208 (=> (not res!818954) (not e!698105))))

(assert (=> start!102208 (= res!818954 (bvslt (size!38847 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102208 e!698105))

(declare-fun array_inv!29159 (array!79383) Bool)

(assert (=> start!102208 (array_inv!29159 a!3806)))

(assert (=> start!102208 true))

(declare-fun b!1230464 () Bool)

(declare-fun res!818948 () Bool)

(assert (=> b!1230464 (=> (not res!818948) (not e!698105))))

(declare-fun arrayContainsKey!0 (array!79383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230464 (= res!818948 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230465 () Bool)

(declare-fun res!818950 () Bool)

(assert (=> b!1230465 (=> (not res!818950) (not e!698105))))

(declare-datatypes ((List!27084 0))(
  ( (Nil!27081) (Cons!27080 (h!28289 (_ BitVec 64)) (t!40547 List!27084)) )
))
(declare-fun acc!823 () List!27084)

(declare-fun arrayNoDuplicates!0 (array!79383 (_ BitVec 32) List!27084) Bool)

(assert (=> b!1230465 (= res!818950 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230466 () Bool)

(declare-fun res!818953 () Bool)

(assert (=> b!1230466 (=> (not res!818953) (not e!698105))))

(declare-fun contains!7146 (List!27084 (_ BitVec 64)) Bool)

(assert (=> b!1230466 (= res!818953 (not (contains!7146 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230467 () Bool)

(declare-fun res!818956 () Bool)

(assert (=> b!1230467 (=> (not res!818956) (not e!698105))))

(declare-fun noDuplicate!1743 (List!27084) Bool)

(assert (=> b!1230467 (= res!818956 (noDuplicate!1743 acc!823))))

(declare-fun b!1230468 () Bool)

(declare-fun res!818949 () Bool)

(assert (=> b!1230468 (=> (not res!818949) (not e!698105))))

(assert (=> b!1230468 (= res!818949 (validKeyInArray!0 (select (arr!38311 a!3806) from!3184)))))

(declare-fun b!1230469 () Bool)

(declare-fun res!818951 () Bool)

(assert (=> b!1230469 (=> (not res!818951) (not e!698105))))

(assert (=> b!1230469 (= res!818951 (not (contains!7146 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230470 () Bool)

(assert (=> b!1230470 (= e!698105 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27080 (select (arr!38311 a!3806) from!3184) acc!823))))))

(assert (= (and start!102208 res!818954) b!1230463))

(assert (= (and b!1230463 res!818952) b!1230462))

(assert (= (and b!1230462 res!818955) b!1230467))

(assert (= (and b!1230467 res!818956) b!1230466))

(assert (= (and b!1230466 res!818953) b!1230469))

(assert (= (and b!1230469 res!818951) b!1230464))

(assert (= (and b!1230464 res!818948) b!1230465))

(assert (= (and b!1230465 res!818950) b!1230468))

(assert (= (and b!1230468 res!818949) b!1230470))

(declare-fun m!1134863 () Bool)

(assert (=> b!1230468 m!1134863))

(assert (=> b!1230468 m!1134863))

(declare-fun m!1134865 () Bool)

(assert (=> b!1230468 m!1134865))

(assert (=> b!1230470 m!1134863))

(declare-fun m!1134867 () Bool)

(assert (=> b!1230470 m!1134867))

(declare-fun m!1134869 () Bool)

(assert (=> b!1230464 m!1134869))

(declare-fun m!1134871 () Bool)

(assert (=> b!1230463 m!1134871))

(declare-fun m!1134873 () Bool)

(assert (=> b!1230469 m!1134873))

(declare-fun m!1134875 () Bool)

(assert (=> b!1230465 m!1134875))

(declare-fun m!1134877 () Bool)

(assert (=> b!1230467 m!1134877))

(declare-fun m!1134879 () Bool)

(assert (=> start!102208 m!1134879))

(declare-fun m!1134881 () Bool)

(assert (=> b!1230466 m!1134881))

(push 1)

(assert (not start!102208))

(assert (not b!1230464))

(assert (not b!1230465))

(assert (not b!1230469))

(assert (not b!1230468))

(assert (not b!1230463))

(assert (not b!1230470))

(assert (not b!1230466))

(assert (not b!1230467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134571 () Bool)

(declare-fun res!818982 () Bool)

(declare-fun e!698135 () Bool)

(assert (=> d!134571 (=> res!818982 e!698135)))

(assert (=> d!134571 (= res!818982 (= (select (arr!38311 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134571 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698135)))

(declare-fun b!1230502 () Bool)

(declare-fun e!698136 () Bool)

(assert (=> b!1230502 (= e!698135 e!698136)))

(declare-fun res!818983 () Bool)

(assert (=> b!1230502 (=> (not res!818983) (not e!698136))))

(assert (=> b!1230502 (= res!818983 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38847 a!3806)))))

(declare-fun b!1230503 () Bool)

(assert (=> b!1230503 (= e!698136 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134571 (not res!818982)) b!1230502))

(assert (= (and b!1230502 res!818983) b!1230503))

(declare-fun m!1134899 () Bool)

(assert (=> d!134571 m!1134899))

(declare-fun m!1134901 () Bool)

(assert (=> b!1230503 m!1134901))

(assert (=> b!1230464 d!134571))

(declare-fun b!1230542 () Bool)

(declare-fun e!698169 () Bool)

(declare-fun call!60863 () Bool)

(assert (=> b!1230542 (= e!698169 call!60863)))

(declare-fun d!134579 () Bool)

(declare-fun res!819012 () Bool)

(declare-fun e!698172 () Bool)

(assert (=> d!134579 (=> res!819012 e!698172)))

(assert (=> d!134579 (= res!819012 (bvsge from!3184 (size!38847 a!3806)))))

(assert (=> d!134579 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698172)))

(declare-fun bm!60860 () Bool)

(declare-fun c!120626 () Bool)

(assert (=> bm!60860 (= call!60863 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120626 (Cons!27080 (select (arr!38311 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1230543 () Bool)

(declare-fun e!698171 () Bool)

(assert (=> b!1230543 (= e!698172 e!698171)))

(declare-fun res!819010 () Bool)

(assert (=> b!1230543 (=> (not res!819010) (not e!698171))))

(declare-fun e!698170 () Bool)

(assert (=> b!1230543 (= res!819010 (not e!698170))))

(declare-fun res!819011 () Bool)

(assert (=> b!1230543 (=> (not res!819011) (not e!698170))))

(assert (=> b!1230543 (= res!819011 (validKeyInArray!0 (select (arr!38311 a!3806) from!3184)))))

(declare-fun b!1230544 () Bool)

(assert (=> b!1230544 (= e!698170 (contains!7146 acc!823 (select (arr!38311 a!3806) from!3184)))))

(declare-fun b!1230545 () Bool)

(assert (=> b!1230545 (= e!698169 call!60863)))

(declare-fun b!1230546 () Bool)

(assert (=> b!1230546 (= e!698171 e!698169)))

(assert (=> b!1230546 (= c!120626 (validKeyInArray!0 (select (arr!38311 a!3806) from!3184)))))

(assert (= (and d!134579 (not res!819012)) b!1230543))

(assert (= (and b!1230543 res!819011) b!1230544))

(assert (= (and b!1230543 res!819010) b!1230546))

(assert (= (and b!1230546 c!120626) b!1230542))

(assert (= (and b!1230546 (not c!120626)) b!1230545))

(assert (= (or b!1230542 b!1230545) bm!60860))

(assert (=> bm!60860 m!1134863))

(declare-fun m!1134921 () Bool)

(assert (=> bm!60860 m!1134921))

(assert (=> b!1230543 m!1134863))

(assert (=> b!1230543 m!1134863))

(assert (=> b!1230543 m!1134865))

(assert (=> b!1230544 m!1134863))

(assert (=> b!1230544 m!1134863))

(declare-fun m!1134925 () Bool)

(assert (=> b!1230544 m!1134925))

(assert (=> b!1230546 m!1134863))

(assert (=> b!1230546 m!1134863))

(assert (=> b!1230546 m!1134865))

(assert (=> b!1230465 d!134579))

(declare-fun b!1230556 () Bool)

(declare-fun e!698181 () Bool)

(declare-fun call!60865 () Bool)

(assert (=> b!1230556 (= e!698181 call!60865)))

(declare-fun d!134593 () Bool)

(declare-fun res!819022 () Bool)

(declare-fun e!698184 () Bool)

(assert (=> d!134593 (=> res!819022 e!698184)))

(assert (=> d!134593 (= res!819022 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38847 a!3806)))))

(assert (=> d!134593 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27080 (select (arr!38311 a!3806) from!3184) acc!823)) e!698184)))

(declare-fun c!120628 () Bool)

(declare-fun bm!60862 () Bool)

(assert (=> bm!60862 (= call!60865 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120628 (Cons!27080 (select (arr!38311 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27080 (select (arr!38311 a!3806) from!3184) acc!823)) (Cons!27080 (select (arr!38311 a!3806) from!3184) acc!823))))))

(declare-fun b!1230557 () Bool)

(declare-fun e!698183 () Bool)

(assert (=> b!1230557 (= e!698184 e!698183)))

(declare-fun res!819020 () Bool)

(assert (=> b!1230557 (=> (not res!819020) (not e!698183))))

(declare-fun e!698182 () Bool)

(assert (=> b!1230557 (= res!819020 (not e!698182))))

(declare-fun res!819021 () Bool)

(assert (=> b!1230557 (=> (not res!819021) (not e!698182))))

(assert (=> b!1230557 (= res!819021 (validKeyInArray!0 (select (arr!38311 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1230558 () Bool)

