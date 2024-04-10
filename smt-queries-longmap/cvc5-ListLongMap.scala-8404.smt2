; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102204 () Bool)

(assert start!102204)

(declare-fun res!818894 () Bool)

(declare-fun e!698094 () Bool)

(assert (=> start!102204 (=> (not res!818894) (not e!698094))))

(declare-datatypes ((array!79379 0))(
  ( (array!79380 (arr!38309 (Array (_ BitVec 32) (_ BitVec 64))) (size!38845 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79379)

(assert (=> start!102204 (= res!818894 (bvslt (size!38845 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102204 e!698094))

(declare-fun array_inv!29157 (array!79379) Bool)

(assert (=> start!102204 (array_inv!29157 a!3806)))

(assert (=> start!102204 true))

(declare-fun b!1230408 () Bool)

(declare-fun res!818895 () Bool)

(assert (=> b!1230408 (=> (not res!818895) (not e!698094))))

(declare-datatypes ((List!27082 0))(
  ( (Nil!27079) (Cons!27078 (h!28287 (_ BitVec 64)) (t!40545 List!27082)) )
))
(declare-fun acc!823 () List!27082)

(declare-fun contains!7144 (List!27082 (_ BitVec 64)) Bool)

(assert (=> b!1230408 (= res!818895 (not (contains!7144 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230409 () Bool)

(declare-fun res!818897 () Bool)

(assert (=> b!1230409 (=> (not res!818897) (not e!698094))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230409 (= res!818897 (validKeyInArray!0 (select (arr!38309 a!3806) from!3184)))))

(declare-fun b!1230410 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79379 (_ BitVec 32) List!27082) Bool)

(assert (=> b!1230410 (= e!698094 (not (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27078 (select (arr!38309 a!3806) from!3184) acc!823))))))

(declare-fun b!1230411 () Bool)

(declare-fun res!818900 () Bool)

(assert (=> b!1230411 (=> (not res!818900) (not e!698094))))

(assert (=> b!1230411 (= res!818900 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38845 a!3806)) (bvslt from!3184 (size!38845 a!3806))))))

(declare-fun b!1230412 () Bool)

(declare-fun res!818896 () Bool)

(assert (=> b!1230412 (=> (not res!818896) (not e!698094))))

(declare-fun noDuplicate!1741 (List!27082) Bool)

(assert (=> b!1230412 (= res!818896 (noDuplicate!1741 acc!823))))

(declare-fun b!1230413 () Bool)

(declare-fun res!818898 () Bool)

(assert (=> b!1230413 (=> (not res!818898) (not e!698094))))

(assert (=> b!1230413 (= res!818898 (not (contains!7144 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230414 () Bool)

(declare-fun res!818902 () Bool)

(assert (=> b!1230414 (=> (not res!818902) (not e!698094))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1230414 (= res!818902 (validKeyInArray!0 k!2913))))

(declare-fun b!1230415 () Bool)

(declare-fun res!818899 () Bool)

(assert (=> b!1230415 (=> (not res!818899) (not e!698094))))

(declare-fun arrayContainsKey!0 (array!79379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230415 (= res!818899 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230416 () Bool)

(declare-fun res!818901 () Bool)

(assert (=> b!1230416 (=> (not res!818901) (not e!698094))))

(assert (=> b!1230416 (= res!818901 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102204 res!818894) b!1230414))

(assert (= (and b!1230414 res!818902) b!1230411))

(assert (= (and b!1230411 res!818900) b!1230412))

(assert (= (and b!1230412 res!818896) b!1230408))

(assert (= (and b!1230408 res!818895) b!1230413))

(assert (= (and b!1230413 res!818898) b!1230415))

(assert (= (and b!1230415 res!818899) b!1230416))

(assert (= (and b!1230416 res!818901) b!1230409))

(assert (= (and b!1230409 res!818897) b!1230410))

(declare-fun m!1134823 () Bool)

(assert (=> b!1230415 m!1134823))

(declare-fun m!1134825 () Bool)

(assert (=> b!1230412 m!1134825))

(declare-fun m!1134827 () Bool)

(assert (=> start!102204 m!1134827))

(declare-fun m!1134829 () Bool)

(assert (=> b!1230416 m!1134829))

(declare-fun m!1134831 () Bool)

(assert (=> b!1230410 m!1134831))

(declare-fun m!1134833 () Bool)

(assert (=> b!1230410 m!1134833))

(declare-fun m!1134835 () Bool)

(assert (=> b!1230414 m!1134835))

(declare-fun m!1134837 () Bool)

(assert (=> b!1230408 m!1134837))

(assert (=> b!1230409 m!1134831))

(assert (=> b!1230409 m!1134831))

(declare-fun m!1134839 () Bool)

(assert (=> b!1230409 m!1134839))

(declare-fun m!1134841 () Bool)

(assert (=> b!1230413 m!1134841))

(push 1)

(assert (not start!102204))

(assert (not b!1230410))

(assert (not b!1230413))

(assert (not b!1230409))

(assert (not b!1230412))

(assert (not b!1230415))

(assert (not b!1230408))

(assert (not b!1230414))

(assert (not b!1230416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134569 () Bool)

(declare-fun res!818980 () Bool)

(declare-fun e!698133 () Bool)

(assert (=> d!134569 (=> res!818980 e!698133)))

(assert (=> d!134569 (= res!818980 (is-Nil!27079 acc!823))))

(assert (=> d!134569 (= (noDuplicate!1741 acc!823) e!698133)))

(declare-fun b!1230500 () Bool)

(declare-fun e!698134 () Bool)

(assert (=> b!1230500 (= e!698133 e!698134)))

(declare-fun res!818981 () Bool)

(assert (=> b!1230500 (=> (not res!818981) (not e!698134))))

(assert (=> b!1230500 (= res!818981 (not (contains!7144 (t!40545 acc!823) (h!28287 acc!823))))))

(declare-fun b!1230501 () Bool)

(assert (=> b!1230501 (= e!698134 (noDuplicate!1741 (t!40545 acc!823)))))

(assert (= (and d!134569 (not res!818980)) b!1230500))

(assert (= (and b!1230500 res!818981) b!1230501))

(declare-fun m!1134895 () Bool)

(assert (=> b!1230500 m!1134895))

(declare-fun m!1134897 () Bool)

(assert (=> b!1230501 m!1134897))

(assert (=> b!1230412 d!134569))

(declare-fun c!120625 () Bool)

(declare-fun bm!60859 () Bool)

(declare-fun call!60862 () Bool)

(assert (=> bm!60859 (= call!60862 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120625 (Cons!27078 (select (arr!38309 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1230537 () Bool)

(declare-fun e!698166 () Bool)

(declare-fun e!698168 () Bool)

(assert (=> b!1230537 (= e!698166 e!698168)))

(declare-fun res!819007 () Bool)

(assert (=> b!1230537 (=> (not res!819007) (not e!698168))))

(declare-fun e!698167 () Bool)

(assert (=> b!1230537 (= res!819007 (not e!698167))))

(declare-fun res!819009 () Bool)

(assert (=> b!1230537 (=> (not res!819009) (not e!698167))))

(assert (=> b!1230537 (= res!819009 (validKeyInArray!0 (select (arr!38309 a!3806) from!3184)))))

(declare-fun b!1230538 () Bool)

(declare-fun e!698165 () Bool)

(assert (=> b!1230538 (= e!698165 call!60862)))

(declare-fun b!1230539 () Bool)

(assert (=> b!1230539 (= e!698167 (contains!7144 acc!823 (select (arr!38309 a!3806) from!3184)))))

(declare-fun d!134575 () Bool)

(declare-fun res!819008 () Bool)

(assert (=> d!134575 (=> res!819008 e!698166)))

(assert (=> d!134575 (= res!819008 (bvsge from!3184 (size!38845 a!3806)))))

(assert (=> d!134575 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698166)))

(declare-fun b!1230540 () Bool)

(assert (=> b!1230540 (= e!698165 call!60862)))

(declare-fun b!1230541 () Bool)

(assert (=> b!1230541 (= e!698168 e!698165)))

(assert (=> b!1230541 (= c!120625 (validKeyInArray!0 (select (arr!38309 a!3806) from!3184)))))

(assert (= (and d!134575 (not res!819008)) b!1230537))

(assert (= (and b!1230537 res!819009) b!1230539))

(assert (= (and b!1230537 res!819007) b!1230541))

(assert (= (and b!1230541 c!120625) b!1230540))

(assert (= (and b!1230541 (not c!120625)) b!1230538))

(assert (= (or b!1230540 b!1230538) bm!60859))

(assert (=> bm!60859 m!1134831))

(declare-fun m!1134917 () Bool)

(assert (=> bm!60859 m!1134917))

(assert (=> b!1230537 m!1134831))

(assert (=> b!1230537 m!1134831))

(assert (=> b!1230537 m!1134839))

(assert (=> b!1230539 m!1134831))

(assert (=> b!1230539 m!1134831))

(declare-fun m!1134919 () Bool)

(assert (=> b!1230539 m!1134919))

(assert (=> b!1230541 m!1134831))

(assert (=> b!1230541 m!1134831))

(assert (=> b!1230541 m!1134839))

(assert (=> b!1230416 d!134575))

(declare-fun c!120627 () Bool)

(declare-fun call!60864 () Bool)

(declare-fun bm!60861 () Bool)

(assert (=> bm!60861 (= call!60864 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120627 (Cons!27078 (select (arr!38309 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27078 (select (arr!38309 a!3806) from!3184) acc!823)) (Cons!27078 (select (arr!38309 a!3806) from!3184) acc!823))))))

(declare-fun b!1230547 () Bool)

(declare-fun e!698174 () Bool)

(declare-fun e!698176 () Bool)

(assert (=> b!1230547 (= e!698174 e!698176)))

(declare-fun res!819013 () Bool)

(assert (=> b!1230547 (=> (not res!819013) (not e!698176))))

(declare-fun e!698175 () Bool)

(assert (=> b!1230547 (= res!819013 (not e!698175))))

(declare-fun res!819015 () Bool)

(assert (=> b!1230547 (=> (not res!819015) (not e!698175))))

(assert (=> b!1230547 (= res!819015 (validKeyInArray!0 (select (arr!38309 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1230548 () Bool)

(declare-fun e!698173 () Bool)

(assert (=> b!1230548 (= e!698173 call!60864)))

(declare-fun b!1230549 () Bool)

(assert (=> b!1230549 (= e!698175 (contains!7144 (Cons!27078 (select (arr!38309 a!3806) from!3184) acc!823) (select (arr!38309 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134591 () Bool)

(declare-fun res!819014 () Bool)

(assert (=> d!134591 (=> res!819014 e!698174)))

(assert (=> d!134591 (= res!819014 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38845 a!3806)))))

(assert (=> d!134591 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27078 (select (arr!38309 a!3806) from!3184) acc!823)) e!698174)))

(declare-fun b!1230550 () Bool)

(assert (=> b!1230550 (= e!698173 call!60864)))

(declare-fun b!1230551 () Bool)

(assert (=> b!1230551 (= e!698176 e!698173)))

(assert (=> b!1230551 (= c!120627 (validKeyInArray!0 (select (arr!38309 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134591 (not res!819014)) b!1230547))

(assert (= (and b!1230547 res!819015) b!1230549))

(assert (= (and b!1230547 res!819013) b!1230551))

(assert (= (and b!1230551 c!120627) b!1230550))

(assert (= (and b!1230551 (not c!120627)) b!1230548))

(assert (= (or b!1230550 b!1230548) bm!60861))

(declare-fun m!1134923 () Bool)

(assert (=> bm!60861 m!1134923))

(declare-fun m!1134927 () Bool)

(assert (=> bm!60861 m!1134927))

(assert (=> b!1230547 m!1134923))

(assert (=> b!1230547 m!1134923))

(declare-fun m!1134929 () Bool)

(assert (=> b!1230547 m!1134929))

(assert (=> b!1230549 m!1134923))

(assert (=> b!1230549 m!1134923))

(declare-fun m!1134931 () Bool)

(assert (=> b!1230549 m!1134931))

(assert (=> b!1230551 m!1134923))

(assert (=> b!1230551 m!1134923))

(assert (=> b!1230551 m!1134929))

(assert (=> b!1230410 d!134591))

(declare-fun d!134595 () Bool)

(assert (=> d!134595 (= (array_inv!29157 a!3806) (bvsge (size!38845 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102204 d!134595))

(declare-fun d!134597 () Bool)

(declare-fun res!819029 () Bool)

(declare-fun e!698191 () Bool)

(assert (=> d!134597 (=> res!819029 e!698191)))

(assert (=> d!134597 (= res!819029 (= (select (arr!38309 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

