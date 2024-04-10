; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61754 () Bool)

(assert start!61754)

(declare-fun b!690890 () Bool)

(declare-fun res!455279 () Bool)

(declare-fun e!393334 () Bool)

(assert (=> b!690890 (=> (not res!455279) (not e!393334))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39775 0))(
  ( (array!39776 (arr!19056 (Array (_ BitVec 32) (_ BitVec 64))) (size!19441 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39775)

(assert (=> b!690890 (= res!455279 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19441 a!3626))))))

(declare-fun b!690891 () Bool)

(declare-fun res!455273 () Bool)

(assert (=> b!690891 (=> (not res!455273) (not e!393334))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!690891 (= res!455273 (= (select (arr!19056 a!3626) from!3004) k!2843))))

(declare-fun b!690892 () Bool)

(declare-fun res!455284 () Bool)

(assert (=> b!690892 (=> (not res!455284) (not e!393334))))

(declare-datatypes ((List!13097 0))(
  ( (Nil!13094) (Cons!13093 (h!14138 (_ BitVec 64)) (t!19364 List!13097)) )
))
(declare-fun acc!681 () List!13097)

(declare-fun contains!3674 (List!13097 (_ BitVec 64)) Bool)

(assert (=> b!690892 (= res!455284 (not (contains!3674 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690893 () Bool)

(declare-fun e!393333 () Bool)

(assert (=> b!690893 (= e!393333 (not (contains!3674 acc!681 k!2843)))))

(declare-fun b!690894 () Bool)

(declare-fun res!455280 () Bool)

(assert (=> b!690894 (=> (not res!455280) (not e!393334))))

(declare-fun e!393335 () Bool)

(assert (=> b!690894 (= res!455280 e!393335)))

(declare-fun res!455285 () Bool)

(assert (=> b!690894 (=> res!455285 e!393335)))

(declare-fun e!393332 () Bool)

(assert (=> b!690894 (= res!455285 e!393332)))

(declare-fun res!455276 () Bool)

(assert (=> b!690894 (=> (not res!455276) (not e!393332))))

(assert (=> b!690894 (= res!455276 (bvsgt from!3004 i!1382))))

(declare-fun b!690895 () Bool)

(declare-fun res!455283 () Bool)

(assert (=> b!690895 (=> (not res!455283) (not e!393334))))

(assert (=> b!690895 (= res!455283 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19441 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690896 () Bool)

(assert (=> b!690896 (= e!393332 (contains!3674 acc!681 k!2843))))

(declare-fun b!690897 () Bool)

(declare-fun res!455274 () Bool)

(assert (=> b!690897 (=> (not res!455274) (not e!393334))))

(declare-fun arrayContainsKey!0 (array!39775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690897 (= res!455274 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690898 () Bool)

(assert (=> b!690898 (= e!393335 e!393333)))

(declare-fun res!455270 () Bool)

(assert (=> b!690898 (=> (not res!455270) (not e!393333))))

(assert (=> b!690898 (= res!455270 (bvsle from!3004 i!1382))))

(declare-fun b!690900 () Bool)

(declare-fun res!455281 () Bool)

(assert (=> b!690900 (=> (not res!455281) (not e!393334))))

(assert (=> b!690900 (= res!455281 (not (contains!3674 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690901 () Bool)

(declare-fun res!455275 () Bool)

(assert (=> b!690901 (=> (not res!455275) (not e!393334))))

(declare-fun arrayNoDuplicates!0 (array!39775 (_ BitVec 32) List!13097) Bool)

(assert (=> b!690901 (= res!455275 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690902 () Bool)

(assert (=> b!690902 (= e!393334 (not true))))

(assert (=> b!690902 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!690903 () Bool)

(declare-fun res!455271 () Bool)

(assert (=> b!690903 (=> (not res!455271) (not e!393334))))

(assert (=> b!690903 (= res!455271 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13094))))

(declare-fun b!690904 () Bool)

(declare-fun res!455272 () Bool)

(assert (=> b!690904 (=> (not res!455272) (not e!393334))))

(declare-fun noDuplicate!921 (List!13097) Bool)

(assert (=> b!690904 (= res!455272 (noDuplicate!921 acc!681))))

(declare-fun b!690905 () Bool)

(declare-fun res!455282 () Bool)

(assert (=> b!690905 (=> (not res!455282) (not e!393334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690905 (= res!455282 (validKeyInArray!0 (select (arr!19056 a!3626) from!3004)))))

(declare-fun b!690899 () Bool)

(declare-fun res!455277 () Bool)

(assert (=> b!690899 (=> (not res!455277) (not e!393334))))

(assert (=> b!690899 (= res!455277 (validKeyInArray!0 k!2843))))

(declare-fun res!455278 () Bool)

(assert (=> start!61754 (=> (not res!455278) (not e!393334))))

(assert (=> start!61754 (= res!455278 (and (bvslt (size!19441 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19441 a!3626))))))

(assert (=> start!61754 e!393334))

(assert (=> start!61754 true))

(declare-fun array_inv!14852 (array!39775) Bool)

(assert (=> start!61754 (array_inv!14852 a!3626)))

(assert (= (and start!61754 res!455278) b!690904))

(assert (= (and b!690904 res!455272) b!690892))

(assert (= (and b!690892 res!455284) b!690900))

(assert (= (and b!690900 res!455281) b!690894))

(assert (= (and b!690894 res!455276) b!690896))

(assert (= (and b!690894 (not res!455285)) b!690898))

(assert (= (and b!690898 res!455270) b!690893))

(assert (= (and b!690894 res!455280) b!690903))

(assert (= (and b!690903 res!455271) b!690901))

(assert (= (and b!690901 res!455275) b!690890))

(assert (= (and b!690890 res!455279) b!690899))

(assert (= (and b!690899 res!455277) b!690897))

(assert (= (and b!690897 res!455274) b!690895))

(assert (= (and b!690895 res!455283) b!690905))

(assert (= (and b!690905 res!455282) b!690891))

(assert (= (and b!690891 res!455273) b!690902))

(declare-fun m!654185 () Bool)

(assert (=> b!690891 m!654185))

(declare-fun m!654187 () Bool)

(assert (=> b!690900 m!654187))

(declare-fun m!654189 () Bool)

(assert (=> b!690896 m!654189))

(declare-fun m!654191 () Bool)

(assert (=> b!690899 m!654191))

(declare-fun m!654193 () Bool)

(assert (=> start!61754 m!654193))

(declare-fun m!654195 () Bool)

(assert (=> b!690901 m!654195))

(declare-fun m!654197 () Bool)

(assert (=> b!690892 m!654197))

(assert (=> b!690893 m!654189))

(assert (=> b!690905 m!654185))

(assert (=> b!690905 m!654185))

(declare-fun m!654199 () Bool)

(assert (=> b!690905 m!654199))

(declare-fun m!654201 () Bool)

(assert (=> b!690902 m!654201))

(declare-fun m!654203 () Bool)

(assert (=> b!690904 m!654203))

(declare-fun m!654205 () Bool)

(assert (=> b!690897 m!654205))

(declare-fun m!654207 () Bool)

(assert (=> b!690903 m!654207))

(push 1)

(assert (not b!690903))

(assert (not b!690902))

(assert (not b!690897))

(assert (not start!61754))

(assert (not b!690892))

(assert (not b!690900))

(assert (not b!690896))

(assert (not b!690899))

(assert (not b!690901))

(assert (not b!690905))

(assert (not b!690893))

(assert (not b!690904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

