; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61734 () Bool)

(assert start!61734)

(declare-fun b!690402 () Bool)

(declare-fun res!454955 () Bool)

(declare-fun e!393085 () Bool)

(assert (=> b!690402 (=> (not res!454955) (not e!393085))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690402 (= res!454955 (validKeyInArray!0 k!2843))))

(declare-fun b!690403 () Bool)

(assert (=> b!690403 (= e!393085 (not true))))

(declare-datatypes ((array!39766 0))(
  ( (array!39767 (arr!19051 (Array (_ BitVec 32) (_ BitVec 64))) (size!19433 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39766)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690403 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!690404 () Bool)

(declare-fun res!454950 () Bool)

(assert (=> b!690404 (=> (not res!454950) (not e!393085))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690404 (= res!454950 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19433 a!3626))))))

(declare-fun b!690405 () Bool)

(declare-fun res!454948 () Bool)

(assert (=> b!690405 (=> (not res!454948) (not e!393085))))

(declare-datatypes ((List!13131 0))(
  ( (Nil!13128) (Cons!13127 (h!14172 (_ BitVec 64)) (t!19389 List!13131)) )
))
(declare-fun acc!681 () List!13131)

(declare-fun noDuplicate!922 (List!13131) Bool)

(assert (=> b!690405 (= res!454948 (noDuplicate!922 acc!681))))

(declare-fun b!690407 () Bool)

(declare-fun e!393086 () Bool)

(declare-fun e!393083 () Bool)

(assert (=> b!690407 (= e!393086 e!393083)))

(declare-fun res!454945 () Bool)

(assert (=> b!690407 (=> (not res!454945) (not e!393083))))

(assert (=> b!690407 (= res!454945 (bvsle from!3004 i!1382))))

(declare-fun b!690408 () Bool)

(declare-fun res!454956 () Bool)

(assert (=> b!690408 (=> (not res!454956) (not e!393085))))

(assert (=> b!690408 (= res!454956 (= (select (arr!19051 a!3626) from!3004) k!2843))))

(declare-fun b!690409 () Bool)

(declare-fun res!454947 () Bool)

(assert (=> b!690409 (=> (not res!454947) (not e!393085))))

(assert (=> b!690409 (= res!454947 (validKeyInArray!0 (select (arr!19051 a!3626) from!3004)))))

(declare-fun b!690410 () Bool)

(declare-fun res!454951 () Bool)

(assert (=> b!690410 (=> (not res!454951) (not e!393085))))

(declare-fun contains!3653 (List!13131 (_ BitVec 64)) Bool)

(assert (=> b!690410 (= res!454951 (not (contains!3653 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690411 () Bool)

(declare-fun res!454953 () Bool)

(assert (=> b!690411 (=> (not res!454953) (not e!393085))))

(assert (=> b!690411 (= res!454953 (not (contains!3653 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690412 () Bool)

(declare-fun res!454952 () Bool)

(assert (=> b!690412 (=> (not res!454952) (not e!393085))))

(declare-fun arrayNoDuplicates!0 (array!39766 (_ BitVec 32) List!13131) Bool)

(assert (=> b!690412 (= res!454952 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690413 () Bool)

(assert (=> b!690413 (= e!393083 (not (contains!3653 acc!681 k!2843)))))

(declare-fun b!690414 () Bool)

(declare-fun res!454944 () Bool)

(assert (=> b!690414 (=> (not res!454944) (not e!393085))))

(assert (=> b!690414 (= res!454944 e!393086)))

(declare-fun res!454946 () Bool)

(assert (=> b!690414 (=> res!454946 e!393086)))

(declare-fun e!393082 () Bool)

(assert (=> b!690414 (= res!454946 e!393082)))

(declare-fun res!454954 () Bool)

(assert (=> b!690414 (=> (not res!454954) (not e!393082))))

(assert (=> b!690414 (= res!454954 (bvsgt from!3004 i!1382))))

(declare-fun b!690415 () Bool)

(declare-fun res!454957 () Bool)

(assert (=> b!690415 (=> (not res!454957) (not e!393085))))

(assert (=> b!690415 (= res!454957 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13128))))

(declare-fun b!690416 () Bool)

(declare-fun res!454949 () Bool)

(assert (=> b!690416 (=> (not res!454949) (not e!393085))))

(assert (=> b!690416 (= res!454949 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19433 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690417 () Bool)

(assert (=> b!690417 (= e!393082 (contains!3653 acc!681 k!2843))))

(declare-fun res!454942 () Bool)

(assert (=> start!61734 (=> (not res!454942) (not e!393085))))

(assert (=> start!61734 (= res!454942 (and (bvslt (size!19433 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19433 a!3626))))))

(assert (=> start!61734 e!393085))

(assert (=> start!61734 true))

(declare-fun array_inv!14934 (array!39766) Bool)

(assert (=> start!61734 (array_inv!14934 a!3626)))

(declare-fun b!690406 () Bool)

(declare-fun res!454943 () Bool)

(assert (=> b!690406 (=> (not res!454943) (not e!393085))))

(assert (=> b!690406 (= res!454943 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!61734 res!454942) b!690405))

(assert (= (and b!690405 res!454948) b!690410))

(assert (= (and b!690410 res!454951) b!690411))

(assert (= (and b!690411 res!454953) b!690414))

(assert (= (and b!690414 res!454954) b!690417))

(assert (= (and b!690414 (not res!454946)) b!690407))

(assert (= (and b!690407 res!454945) b!690413))

(assert (= (and b!690414 res!454944) b!690415))

(assert (= (and b!690415 res!454957) b!690412))

(assert (= (and b!690412 res!454952) b!690404))

(assert (= (and b!690404 res!454950) b!690402))

(assert (= (and b!690402 res!454955) b!690406))

(assert (= (and b!690406 res!454943) b!690416))

(assert (= (and b!690416 res!454949) b!690409))

(assert (= (and b!690409 res!454947) b!690408))

(assert (= (and b!690408 res!454956) b!690403))

(declare-fun m!653307 () Bool)

(assert (=> b!690403 m!653307))

(declare-fun m!653309 () Bool)

(assert (=> b!690413 m!653309))

(declare-fun m!653311 () Bool)

(assert (=> b!690406 m!653311))

(assert (=> b!690417 m!653309))

(declare-fun m!653313 () Bool)

(assert (=> b!690408 m!653313))

(assert (=> b!690409 m!653313))

(assert (=> b!690409 m!653313))

(declare-fun m!653315 () Bool)

(assert (=> b!690409 m!653315))

(declare-fun m!653317 () Bool)

(assert (=> b!690405 m!653317))

(declare-fun m!653319 () Bool)

(assert (=> b!690411 m!653319))

(declare-fun m!653321 () Bool)

(assert (=> start!61734 m!653321))

(declare-fun m!653323 () Bool)

(assert (=> b!690402 m!653323))

(declare-fun m!653325 () Bool)

(assert (=> b!690410 m!653325))

(declare-fun m!653327 () Bool)

(assert (=> b!690415 m!653327))

(declare-fun m!653329 () Bool)

(assert (=> b!690412 m!653329))

(push 1)

(assert (not b!690405))

(assert (not b!690409))

(assert (not b!690402))

(assert (not b!690411))

(assert (not b!690415))

(assert (not b!690410))

(assert (not b!690412))

(assert (not b!690417))

(assert (not start!61734))

(assert (not b!690413))

(assert (not b!690406))

(assert (not b!690403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

