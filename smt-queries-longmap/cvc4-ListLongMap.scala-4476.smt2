; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62286 () Bool)

(assert start!62286)

(declare-fun b!697948 () Bool)

(declare-fun res!461837 () Bool)

(declare-fun e!396744 () Bool)

(assert (=> b!697948 (=> (not res!461837) (not e!396744))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!40004 0))(
  ( (array!40005 (arr!19160 (Array (_ BitVec 32) (_ BitVec 64))) (size!19545 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!40004)

(assert (=> b!697948 (= res!461837 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19545 a!3626)))))

(declare-fun b!697949 () Bool)

(declare-fun res!461827 () Bool)

(assert (=> b!697949 (=> (not res!461827) (not e!396744))))

(declare-datatypes ((List!13201 0))(
  ( (Nil!13198) (Cons!13197 (h!14242 (_ BitVec 64)) (t!19483 List!13201)) )
))
(declare-fun acc!681 () List!13201)

(declare-fun contains!3778 (List!13201 (_ BitVec 64)) Bool)

(assert (=> b!697949 (= res!461827 (not (contains!3778 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!461832 () Bool)

(assert (=> start!62286 (=> (not res!461832) (not e!396744))))

(assert (=> start!62286 (= res!461832 (and (bvslt (size!19545 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19545 a!3626))))))

(assert (=> start!62286 e!396744))

(assert (=> start!62286 true))

(declare-fun array_inv!14956 (array!40004) Bool)

(assert (=> start!62286 (array_inv!14956 a!3626)))

(declare-fun b!697950 () Bool)

(declare-fun res!461836 () Bool)

(assert (=> b!697950 (=> (not res!461836) (not e!396744))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697950 (= res!461836 (validKeyInArray!0 k!2843))))

(declare-fun b!697951 () Bool)

(declare-fun e!396743 () Bool)

(assert (=> b!697951 (= e!396743 (not (contains!3778 acc!681 k!2843)))))

(declare-fun b!697952 () Bool)

(declare-fun res!461834 () Bool)

(assert (=> b!697952 (=> (not res!461834) (not e!396744))))

(declare-fun e!396741 () Bool)

(assert (=> b!697952 (= res!461834 e!396741)))

(declare-fun res!461831 () Bool)

(assert (=> b!697952 (=> res!461831 e!396741)))

(declare-fun e!396742 () Bool)

(assert (=> b!697952 (= res!461831 e!396742)))

(declare-fun res!461829 () Bool)

(assert (=> b!697952 (=> (not res!461829) (not e!396742))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697952 (= res!461829 (bvsgt from!3004 i!1382))))

(declare-fun b!697953 () Bool)

(declare-fun res!461825 () Bool)

(assert (=> b!697953 (=> (not res!461825) (not e!396744))))

(assert (=> b!697953 (= res!461825 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19545 a!3626))))))

(declare-fun b!697954 () Bool)

(declare-fun res!461833 () Bool)

(assert (=> b!697954 (=> (not res!461833) (not e!396744))))

(declare-fun arrayNoDuplicates!0 (array!40004 (_ BitVec 32) List!13201) Bool)

(assert (=> b!697954 (= res!461833 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697955 () Bool)

(declare-fun res!461824 () Bool)

(assert (=> b!697955 (=> (not res!461824) (not e!396744))))

(declare-fun arrayContainsKey!0 (array!40004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697955 (= res!461824 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697956 () Bool)

(assert (=> b!697956 (= e!396744 (not (arrayNoDuplicates!0 (array!40005 (store (arr!19160 a!3626) i!1382 k!2843) (size!19545 a!3626)) from!3004 acc!681)))))

(declare-fun b!697957 () Bool)

(assert (=> b!697957 (= e!396741 e!396743)))

(declare-fun res!461828 () Bool)

(assert (=> b!697957 (=> (not res!461828) (not e!396743))))

(assert (=> b!697957 (= res!461828 (bvsle from!3004 i!1382))))

(declare-fun b!697958 () Bool)

(assert (=> b!697958 (= e!396742 (contains!3778 acc!681 k!2843))))

(declare-fun b!697959 () Bool)

(declare-fun res!461826 () Bool)

(assert (=> b!697959 (=> (not res!461826) (not e!396744))))

(declare-fun noDuplicate!1025 (List!13201) Bool)

(assert (=> b!697959 (= res!461826 (noDuplicate!1025 acc!681))))

(declare-fun b!697960 () Bool)

(declare-fun res!461835 () Bool)

(assert (=> b!697960 (=> (not res!461835) (not e!396744))))

(assert (=> b!697960 (= res!461835 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13198))))

(declare-fun b!697961 () Bool)

(declare-fun res!461830 () Bool)

(assert (=> b!697961 (=> (not res!461830) (not e!396744))))

(assert (=> b!697961 (= res!461830 (not (contains!3778 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62286 res!461832) b!697959))

(assert (= (and b!697959 res!461826) b!697949))

(assert (= (and b!697949 res!461827) b!697961))

(assert (= (and b!697961 res!461830) b!697952))

(assert (= (and b!697952 res!461829) b!697958))

(assert (= (and b!697952 (not res!461831)) b!697957))

(assert (= (and b!697957 res!461828) b!697951))

(assert (= (and b!697952 res!461834) b!697960))

(assert (= (and b!697960 res!461835) b!697954))

(assert (= (and b!697954 res!461833) b!697953))

(assert (= (and b!697953 res!461825) b!697950))

(assert (= (and b!697950 res!461836) b!697955))

(assert (= (and b!697955 res!461824) b!697948))

(assert (= (and b!697948 res!461837) b!697956))

(declare-fun m!658207 () Bool)

(assert (=> b!697961 m!658207))

(declare-fun m!658209 () Bool)

(assert (=> b!697956 m!658209))

(declare-fun m!658211 () Bool)

(assert (=> b!697956 m!658211))

(declare-fun m!658213 () Bool)

(assert (=> b!697958 m!658213))

(declare-fun m!658215 () Bool)

(assert (=> b!697950 m!658215))

(declare-fun m!658217 () Bool)

(assert (=> b!697954 m!658217))

(declare-fun m!658219 () Bool)

(assert (=> start!62286 m!658219))

(declare-fun m!658221 () Bool)

(assert (=> b!697960 m!658221))

(declare-fun m!658223 () Bool)

(assert (=> b!697959 m!658223))

(declare-fun m!658225 () Bool)

(assert (=> b!697955 m!658225))

(assert (=> b!697951 m!658213))

(declare-fun m!658227 () Bool)

(assert (=> b!697949 m!658227))

(push 1)

(assert (not b!697960))

(assert (not b!697956))

(assert (not b!697959))

(assert (not b!697950))

(assert (not b!697949))

(assert (not b!697961))

(assert (not b!697951))

(assert (not b!697958))

(assert (not b!697955))

(assert (not start!62286))

(assert (not b!697954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!698025 () Bool)

(declare-fun e!396802 () Bool)

(declare-fun e!396803 () Bool)

(assert (=> b!698025 (= e!396802 e!396803)))

(declare-fun c!78436 () Bool)

(assert (=> b!698025 (= c!78436 (validKeyInArray!0 (select (arr!19160 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34339 () Bool)

(declare-fun call!34342 () Bool)

(assert (=> bm!34339 (= call!34342 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78436 (Cons!13197 (select (arr!19160 a!3626) #b00000000000000000000000000000000) Nil!13198) Nil!13198)))))

(declare-fun d!96255 () Bool)

(declare-fun res!461889 () Bool)

(declare-fun e!396801 () Bool)

(assert (=> d!96255 (=> res!461889 e!396801)))

(assert (=> d!96255 (= res!461889 (bvsge #b00000000000000000000000000000000 (size!19545 a!3626)))))

(assert (=> d!96255 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13198) e!396801)))

(declare-fun b!698026 () Bool)

(assert (=> b!698026 (= e!396801 e!396802)))

(declare-fun res!461887 () Bool)

(assert (=> b!698026 (=> (not res!461887) (not e!396802))))

(declare-fun e!396804 () Bool)

(assert (=> b!698026 (= res!461887 (not e!396804))))

(declare-fun res!461888 () Bool)

(assert (=> b!698026 (=> (not res!461888) (not e!396804))))

(assert (=> b!698026 (= res!461888 (validKeyInArray!0 (select (arr!19160 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!698027 () Bool)

(assert (=> b!698027 (= e!396803 call!34342)))

(declare-fun b!698028 () Bool)

(assert (=> b!698028 (= e!396804 (contains!3778 Nil!13198 (select (arr!19160 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!698029 () Bool)

(assert (=> b!698029 (= e!396803 call!34342)))

(assert (= (and d!96255 (not res!461889)) b!698026))

(assert (= (and b!698026 res!461888) b!698028))

(assert (= (and b!698026 res!461887) b!698025))

(assert (= (and b!698025 c!78436) b!698029))

(assert (= (and b!698025 (not c!78436)) b!698027))

(assert (= (or b!698029 b!698027) bm!34339))

(declare-fun m!658279 () Bool)

(assert (=> b!698025 m!658279))

(assert (=> b!698025 m!658279))

(declare-fun m!658281 () Bool)

(assert (=> b!698025 m!658281))

(assert (=> bm!34339 m!658279))

(declare-fun m!658283 () Bool)

(assert (=> bm!34339 m!658283))

(assert (=> b!698026 m!658279))

(assert (=> b!698026 m!658279))

(assert (=> b!698026 m!658281))

(assert (=> b!698028 m!658279))

(assert (=> b!698028 m!658279))

(declare-fun m!658285 () Bool)

(assert (=> b!698028 m!658285))

(assert (=> b!697960 d!96255))

(declare-fun d!96269 () Bool)

(declare-fun lt!317208 () Bool)

(declare-fun content!331 (List!13201) (Set (_ BitVec 64)))

(assert (=> d!96269 (= lt!317208 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!331 acc!681)))))

(declare-fun e!396822 () Bool)

(assert (=> d!96269 (= lt!317208 e!396822)))

(declare-fun res!461904 () Bool)

(assert (=> d!96269 (=> (not res!461904) (not e!396822))))

(assert (=> d!96269 (= res!461904 (is-Cons!13197 acc!681))))

(assert (=> d!96269 (= (contains!3778 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317208)))

(declare-fun b!698049 () Bool)

(declare-fun e!396821 () Bool)

(assert (=> b!698049 (= e!396822 e!396821)))

(declare-fun res!461903 () Bool)

(assert (=> b!698049 (=> res!461903 e!396821)))

(assert (=> b!698049 (= res!461903 (= (h!14242 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698050 () Bool)

(assert (=> b!698050 (= e!396821 (contains!3778 (t!19483 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96269 res!461904) b!698049))

(assert (= (and b!698049 (not res!461903)) b!698050))

(declare-fun m!658295 () Bool)

(assert (=> d!96269 m!658295))

(declare-fun m!658297 () Bool)

(assert (=> d!96269 m!658297))

(declare-fun m!658299 () Bool)

(assert (=> b!698050 m!658299))

(assert (=> b!697949 d!96269))

(declare-fun b!698056 () Bool)

(declare-fun e!396828 () Bool)

(declare-fun e!396829 () Bool)

(assert (=> b!698056 (= e!396828 e!396829)))

(declare-fun c!78441 () Bool)

(assert (=> b!698056 (= c!78441 (validKeyInArray!0 (select (arr!19160 a!3626) from!3004)))))

(declare-fun bm!34344 () Bool)

(declare-fun call!34347 () Bool)

(assert (=> bm!34344 (= call!34347 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78441 (Cons!13197 (select (arr!19160 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!96275 () Bool)

(declare-fun res!461910 () Bool)

(declare-fun e!396827 () Bool)

(assert (=> d!96275 (=> res!461910 e!396827)))

(assert (=> d!96275 (= res!461910 (bvsge from!3004 (size!19545 a!3626)))))

(assert (=> d!96275 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!396827)))

(declare-fun b!698057 () Bool)

(assert (=> b!698057 (= e!396827 e!396828)))

(declare-fun res!461908 () Bool)

(assert (=> b!698057 (=> (not res!461908) (not e!396828))))

(declare-fun e!396830 () Bool)

(assert (=> b!698057 (= res!461908 (not e!396830))))

(declare-fun res!461909 () Bool)

(assert (=> b!698057 (=> (not res!461909) (not e!396830))))

(assert (=> b!698057 (= res!461909 (validKeyInArray!0 (select (arr!19160 a!3626) from!3004)))))

(declare-fun b!698058 () Bool)

(assert (=> b!698058 (= e!396829 call!34347)))

(declare-fun b!698059 () Bool)

(assert (=> b!698059 (= e!396830 (contains!3778 acc!681 (select (arr!19160 a!3626) from!3004)))))

(declare-fun b!698060 () Bool)

(assert (=> b!698060 (= e!396829 call!34347)))

(assert (= (and d!96275 (not res!461910)) b!698057))

(assert (= (and b!698057 res!461909) b!698059))

(assert (= (and b!698057 res!461908) b!698056))

(assert (= (and b!698056 c!78441) b!698060))

(assert (= (and b!698056 (not c!78441)) b!698058))

(assert (= (or b!698060 b!698058) bm!34344))

(declare-fun m!658313 () Bool)

(assert (=> b!698056 m!658313))

(assert (=> b!698056 m!658313))

(declare-fun m!658315 () Bool)

(assert (=> b!698056 m!658315))

(assert (=> bm!34344 m!658313))

(declare-fun m!658317 () Bool)

(assert (=> bm!34344 m!658317))

(assert (=> b!698057 m!658313))

(assert (=> b!698057 m!658313))

(assert (=> b!698057 m!658315))

(assert (=> b!698059 m!658313))

(assert (=> b!698059 m!658313))

(declare-fun m!658319 () Bool)

(assert (=> b!698059 m!658319))

(assert (=> b!697954 d!96275))

(declare-fun d!96281 () Bool)

(declare-fun res!461927 () Bool)

(declare-fun e!396847 () Bool)

(assert (=> d!96281 (=> res!461927 e!396847)))

(assert (=> d!96281 (= res!461927 (is-Nil!13198 acc!681))))

(assert (=> d!96281 (= (noDuplicate!1025 acc!681) e!396847)))

(declare-fun b!698077 () Bool)

(declare-fun e!396848 () Bool)

(assert (=> b!698077 (= e!396847 e!396848)))

(declare-fun res!461928 () Bool)

(assert (=> b!698077 (=> (not res!461928) (not e!396848))))

(assert (=> b!698077 (= res!461928 (not (contains!3778 (t!19483 acc!681) (h!14242 acc!681))))))

(declare-fun b!698078 () Bool)

(assert (=> b!698078 (= e!396848 (noDuplicate!1025 (t!19483 acc!681)))))

(assert (= (and d!96281 (not res!461927)) b!698077))

(assert (= (and b!698077 res!461928) b!698078))

(declare-fun m!658325 () Bool)

(assert (=> b!698077 m!658325))

(declare-fun m!658327 () Bool)

(assert (=> b!698078 m!658327))

(assert (=> b!697959 d!96281))

(declare-fun b!698081 () Bool)

(declare-fun e!396852 () Bool)

(declare-fun e!396853 () Bool)

(assert (=> b!698081 (= e!396852 e!396853)))

(declare-fun c!78442 () Bool)

(assert (=> b!698081 (= c!78442 (validKeyInArray!0 (select (arr!19160 (array!40005 (store (arr!19160 a!3626) i!1382 k!2843) (size!19545 a!3626))) from!3004)))))

(declare-fun bm!34345 () Bool)

(declare-fun call!34348 () Bool)

(assert (=> bm!34345 (= call!34348 (arrayNoDuplicates!0 (array!40005 (store (arr!19160 a!3626) i!1382 k!2843) (size!19545 a!3626)) (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78442 (Cons!13197 (select (arr!19160 (array!40005 (store (arr!19160 a!3626) i!1382 k!2843) (size!19545 a!3626))) from!3004) acc!681) acc!681)))))

(declare-fun d!96285 () Bool)

(declare-fun res!461933 () Bool)

(declare-fun e!396851 () Bool)

(assert (=> d!96285 (=> res!461933 e!396851)))

(assert (=> d!96285 (= res!461933 (bvsge from!3004 (size!19545 (array!40005 (store (arr!19160 a!3626) i!1382 k!2843) (size!19545 a!3626)))))))

(assert (=> d!96285 (= (arrayNoDuplicates!0 (array!40005 (store (arr!19160 a!3626) i!1382 k!2843) (size!19545 a!3626)) from!3004 acc!681) e!396851)))

(declare-fun b!698082 () Bool)

(assert (=> b!698082 (= e!396851 e!396852)))

(declare-fun res!461931 () Bool)

(assert (=> b!698082 (=> (not res!461931) (not e!396852))))

(declare-fun e!396854 () Bool)

(assert (=> b!698082 (= res!461931 (not e!396854))))

(declare-fun res!461932 () Bool)

(assert (=> b!698082 (=> (not res!461932) (not e!396854))))

(assert (=> b!698082 (= res!461932 (validKeyInArray!0 (select (arr!19160 (array!40005 (store (arr!19160 a!3626) i!1382 k!2843) (size!19545 a!3626))) from!3004)))))

(declare-fun b!698083 () Bool)

(assert (=> b!698083 (= e!396853 call!34348)))

(declare-fun b!698084 () Bool)

(assert (=> b!698084 (= e!396854 (contains!3778 acc!681 (select (arr!19160 (array!40005 (store (arr!19160 a!3626) i!1382 k!2843) (size!19545 a!3626))) from!3004)))))

(declare-fun b!698085 () Bool)

(assert (=> b!698085 (= e!396853 call!34348)))

(assert (= (and d!96285 (not res!461933)) b!698082))

(assert (= (and b!698082 res!461932) b!698084))

(assert (= (and b!698082 res!461931) b!698081))

(assert (= (and b!698081 c!78442) b!698085))

(assert (= (and b!698081 (not c!78442)) b!698083))

(assert (= (or b!698085 b!698083) bm!34345))

(declare-fun m!658335 () Bool)

(assert (=> b!698081 m!658335))

(assert (=> b!698081 m!658335))

(declare-fun m!658337 () Bool)

(assert (=> b!698081 m!658337))

(assert (=> bm!34345 m!658335))

(declare-fun m!658343 () Bool)

(assert (=> bm!34345 m!658343))

(assert (=> b!698082 m!658335))

(assert (=> b!698082 m!658335))

(assert (=> b!698082 m!658337))

(assert (=> b!698084 m!658335))

(assert (=> b!698084 m!658335))

(declare-fun m!658349 () Bool)

(assert (=> b!698084 m!658349))

(assert (=> b!697956 d!96285))

(declare-fun d!96291 () Bool)

(declare-fun lt!317211 () Bool)

(assert (=> d!96291 (= lt!317211 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!331 acc!681)))))

(declare-fun e!396862 () Bool)

(assert (=> d!96291 (= lt!317211 e!396862)))

(declare-fun res!461940 () Bool)

(assert (=> d!96291 (=> (not res!461940) (not e!396862))))

(assert (=> d!96291 (= res!461940 (is-Cons!13197 acc!681))))

(assert (=> d!96291 (= (contains!3778 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317211)))

(declare-fun b!698093 () Bool)

(declare-fun e!396861 () Bool)

(assert (=> b!698093 (= e!396862 e!396861)))

(declare-fun res!461939 () Bool)

(assert (=> b!698093 (=> res!461939 e!396861)))

(assert (=> b!698093 (= res!461939 (= (h!14242 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698094 () Bool)

(assert (=> b!698094 (= e!396861 (contains!3778 (t!19483 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96291 res!461940) b!698093))

(assert (= (and b!698093 (not res!461939)) b!698094))

(assert (=> d!96291 m!658295))

(declare-fun m!658351 () Bool)

(assert (=> d!96291 m!658351))

(declare-fun m!658353 () Bool)

(assert (=> b!698094 m!658353))

(assert (=> b!697961 d!96291))

(declare-fun d!96293 () Bool)

(assert (=> d!96293 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697950 d!96293))

(declare-fun d!96295 () Bool)

(declare-fun res!461945 () Bool)

(declare-fun e!396867 () Bool)

(assert (=> d!96295 (=> res!461945 e!396867)))

(assert (=> d!96295 (= res!461945 (= (select (arr!19160 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!96295 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!396867)))

(declare-fun b!698099 () Bool)

(declare-fun e!396868 () Bool)

(assert (=> b!698099 (= e!396867 e!396868)))

(declare-fun res!461946 () Bool)

(assert (=> b!698099 (=> (not res!461946) (not e!396868))))

(assert (=> b!698099 (= res!461946 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19545 a!3626)))))

(declare-fun b!698100 () Bool)

(assert (=> b!698100 (= e!396868 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!96295 (not res!461945)) b!698099))

(assert (= (and b!698099 res!461946) b!698100))

(assert (=> d!96295 m!658279))

(declare-fun m!658355 () Bool)

(assert (=> b!698100 m!658355))

(assert (=> b!697955 d!96295))

(declare-fun d!96297 () Bool)

(declare-fun lt!317212 () Bool)

(assert (=> d!96297 (= lt!317212 (member k!2843 (content!331 acc!681)))))

(declare-fun e!396870 () Bool)

(assert (=> d!96297 (= lt!317212 e!396870)))

(declare-fun res!461948 () Bool)

(assert (=> d!96297 (=> (not res!461948) (not e!396870))))

(assert (=> d!96297 (= res!461948 (is-Cons!13197 acc!681))))

(assert (=> d!96297 (= (contains!3778 acc!681 k!2843) lt!317212)))

(declare-fun b!698101 () Bool)

(declare-fun e!396869 () Bool)

(assert (=> b!698101 (= e!396870 e!396869)))

(declare-fun res!461947 () Bool)

(assert (=> b!698101 (=> res!461947 e!396869)))

(assert (=> b!698101 (= res!461947 (= (h!14242 acc!681) k!2843))))

(declare-fun b!698102 () Bool)

(assert (=> b!698102 (= e!396869 (contains!3778 (t!19483 acc!681) k!2843))))

(assert (= (and d!96297 res!461948) b!698101))

(assert (= (and b!698101 (not res!461947)) b!698102))

(assert (=> d!96297 m!658295))

(declare-fun m!658357 () Bool)

(assert (=> d!96297 m!658357))

(declare-fun m!658359 () Bool)

(assert (=> b!698102 m!658359))

(assert (=> b!697951 d!96297))

(assert (=> b!697958 d!96297))

(declare-fun d!96299 () Bool)

(assert (=> d!96299 (= (array_inv!14956 a!3626) (bvsge (size!19545 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62286 d!96299))

(push 1)

(assert (not b!698025))

(assert (not b!698081))

(assert (not bm!34345))

(assert (not b!698026))

(assert (not bm!34339))

(assert (not b!698094))

(assert (not b!698084))

(assert (not d!96269))

(assert (not b!698057))

(assert (not b!698059))

(assert (not b!698050))

(assert (not b!698078))

(assert (not b!698100))

(assert (not b!698102))

(assert (not b!698077))

(assert (not b!698082))

(assert (not b!698056))

(assert (not d!96297))

(assert (not bm!34344))

(assert (not b!698028))

(assert (not d!96291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96365 () Bool)

