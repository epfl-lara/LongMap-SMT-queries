; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60270 () Bool)

(assert start!60270)

(declare-fun b!675934 () Bool)

(declare-fun res!442367 () Bool)

(declare-fun e!385583 () Bool)

(assert (=> b!675934 (=> (not res!442367) (not e!385583))))

(declare-datatypes ((List!12892 0))(
  ( (Nil!12889) (Cons!12888 (h!13933 (_ BitVec 64)) (t!19120 List!12892)) )
))
(declare-fun acc!681 () List!12892)

(declare-fun contains!3469 (List!12892 (_ BitVec 64)) Bool)

(assert (=> b!675934 (= res!442367 (not (contains!3469 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675935 () Bool)

(declare-fun res!442362 () Bool)

(assert (=> b!675935 (=> (not res!442362) (not e!385583))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39317 0))(
  ( (array!39318 (arr!18851 (Array (_ BitVec 32) (_ BitVec 64))) (size!19215 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39317)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!675935 (= res!442362 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19215 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun res!442379 () Bool)

(assert (=> start!60270 (=> (not res!442379) (not e!385583))))

(assert (=> start!60270 (= res!442379 (and (bvslt (size!19215 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19215 a!3626))))))

(assert (=> start!60270 e!385583))

(assert (=> start!60270 true))

(declare-fun array_inv!14647 (array!39317) Bool)

(assert (=> start!60270 (array_inv!14647 a!3626)))

(declare-fun b!675936 () Bool)

(declare-fun res!442361 () Bool)

(assert (=> b!675936 (=> (not res!442361) (not e!385583))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675936 (= res!442361 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675937 () Bool)

(declare-fun e!385585 () Bool)

(assert (=> b!675937 (= e!385585 (not (contains!3469 acc!681 k!2843)))))

(declare-fun b!675938 () Bool)

(declare-fun res!442376 () Bool)

(assert (=> b!675938 (=> (not res!442376) (not e!385583))))

(assert (=> b!675938 (= res!442376 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19215 a!3626))))))

(declare-fun b!675939 () Bool)

(declare-fun res!442374 () Bool)

(assert (=> b!675939 (=> (not res!442374) (not e!385583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675939 (= res!442374 (not (validKeyInArray!0 (select (arr!18851 a!3626) from!3004))))))

(declare-fun b!675940 () Bool)

(declare-fun res!442375 () Bool)

(assert (=> b!675940 (=> (not res!442375) (not e!385583))))

(assert (=> b!675940 (= res!442375 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675941 () Bool)

(declare-fun e!385588 () Bool)

(declare-fun e!385584 () Bool)

(assert (=> b!675941 (= e!385588 e!385584)))

(declare-fun res!442363 () Bool)

(assert (=> b!675941 (=> (not res!442363) (not e!385584))))

(assert (=> b!675941 (= res!442363 (bvsle from!3004 i!1382))))

(declare-fun b!675942 () Bool)

(declare-fun res!442371 () Bool)

(assert (=> b!675942 (=> (not res!442371) (not e!385583))))

(declare-fun noDuplicate!716 (List!12892) Bool)

(assert (=> b!675942 (= res!442371 (noDuplicate!716 acc!681))))

(declare-fun b!675943 () Bool)

(declare-fun res!442366 () Bool)

(assert (=> b!675943 (=> (not res!442366) (not e!385583))))

(declare-fun arrayNoDuplicates!0 (array!39317 (_ BitVec 32) List!12892) Bool)

(assert (=> b!675943 (= res!442366 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675944 () Bool)

(declare-fun res!442369 () Bool)

(assert (=> b!675944 (=> (not res!442369) (not e!385583))))

(assert (=> b!675944 (= res!442369 e!385588)))

(declare-fun res!442370 () Bool)

(assert (=> b!675944 (=> res!442370 e!385588)))

(declare-fun e!385586 () Bool)

(assert (=> b!675944 (= res!442370 e!385586)))

(declare-fun res!442372 () Bool)

(assert (=> b!675944 (=> (not res!442372) (not e!385586))))

(assert (=> b!675944 (= res!442372 (bvsgt from!3004 i!1382))))

(declare-fun b!675945 () Bool)

(assert (=> b!675945 (= e!385586 (contains!3469 acc!681 k!2843))))

(declare-fun b!675946 () Bool)

(declare-fun e!385587 () Bool)

(assert (=> b!675946 (= e!385587 (contains!3469 acc!681 k!2843))))

(declare-fun b!675947 () Bool)

(declare-fun res!442378 () Bool)

(assert (=> b!675947 (=> (not res!442378) (not e!385583))))

(assert (=> b!675947 (= res!442378 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12889))))

(declare-fun b!675948 () Bool)

(assert (=> b!675948 (= e!385583 false)))

(declare-fun lt!312751 () Bool)

(assert (=> b!675948 (= lt!312751 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675949 () Bool)

(assert (=> b!675949 (= e!385584 (not (contains!3469 acc!681 k!2843)))))

(declare-fun b!675950 () Bool)

(declare-fun res!442373 () Bool)

(assert (=> b!675950 (=> (not res!442373) (not e!385583))))

(assert (=> b!675950 (= res!442373 (validKeyInArray!0 k!2843))))

(declare-fun b!675951 () Bool)

(declare-fun res!442360 () Bool)

(assert (=> b!675951 (=> (not res!442360) (not e!385583))))

(declare-fun e!385589 () Bool)

(assert (=> b!675951 (= res!442360 e!385589)))

(declare-fun res!442368 () Bool)

(assert (=> b!675951 (=> res!442368 e!385589)))

(assert (=> b!675951 (= res!442368 e!385587)))

(declare-fun res!442364 () Bool)

(assert (=> b!675951 (=> (not res!442364) (not e!385587))))

(assert (=> b!675951 (= res!442364 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675952 () Bool)

(assert (=> b!675952 (= e!385589 e!385585)))

(declare-fun res!442365 () Bool)

(assert (=> b!675952 (=> (not res!442365) (not e!385585))))

(assert (=> b!675952 (= res!442365 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675953 () Bool)

(declare-fun res!442377 () Bool)

(assert (=> b!675953 (=> (not res!442377) (not e!385583))))

(assert (=> b!675953 (= res!442377 (not (contains!3469 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60270 res!442379) b!675942))

(assert (= (and b!675942 res!442371) b!675953))

(assert (= (and b!675953 res!442377) b!675934))

(assert (= (and b!675934 res!442367) b!675944))

(assert (= (and b!675944 res!442372) b!675945))

(assert (= (and b!675944 (not res!442370)) b!675941))

(assert (= (and b!675941 res!442363) b!675949))

(assert (= (and b!675944 res!442369) b!675947))

(assert (= (and b!675947 res!442378) b!675943))

(assert (= (and b!675943 res!442366) b!675938))

(assert (= (and b!675938 res!442376) b!675950))

(assert (= (and b!675950 res!442373) b!675936))

(assert (= (and b!675936 res!442361) b!675935))

(assert (= (and b!675935 res!442362) b!675939))

(assert (= (and b!675939 res!442374) b!675940))

(assert (= (and b!675940 res!442375) b!675951))

(assert (= (and b!675951 res!442364) b!675946))

(assert (= (and b!675951 (not res!442368)) b!675952))

(assert (= (and b!675952 res!442365) b!675937))

(assert (= (and b!675951 res!442360) b!675948))

(declare-fun m!643091 () Bool)

(assert (=> b!675945 m!643091))

(assert (=> b!675949 m!643091))

(declare-fun m!643093 () Bool)

(assert (=> b!675939 m!643093))

(assert (=> b!675939 m!643093))

(declare-fun m!643095 () Bool)

(assert (=> b!675939 m!643095))

(declare-fun m!643097 () Bool)

(assert (=> b!675950 m!643097))

(declare-fun m!643099 () Bool)

(assert (=> b!675948 m!643099))

(declare-fun m!643101 () Bool)

(assert (=> b!675947 m!643101))

(declare-fun m!643103 () Bool)

(assert (=> b!675942 m!643103))

(declare-fun m!643105 () Bool)

(assert (=> b!675936 m!643105))

(declare-fun m!643107 () Bool)

(assert (=> start!60270 m!643107))

(declare-fun m!643109 () Bool)

(assert (=> b!675953 m!643109))

(assert (=> b!675946 m!643091))

(declare-fun m!643111 () Bool)

(assert (=> b!675943 m!643111))

(assert (=> b!675937 m!643091))

(declare-fun m!643113 () Bool)

(assert (=> b!675934 m!643113))

(push 1)

(assert (not b!675934))

(assert (not b!675936))

(assert (not start!60270))

(assert (not b!675950))

(assert (not b!675939))

(assert (not b!675942))

(assert (not b!675948))

(assert (not b!675946))

(assert (not b!675949))

(assert (not b!675945))

(assert (not b!675953))

(assert (not b!675937))

(assert (not b!675947))

(assert (not b!675943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

