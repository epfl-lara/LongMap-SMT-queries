; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60318 () Bool)

(assert start!60318)

(declare-fun b!677473 () Bool)

(declare-fun res!444063 () Bool)

(declare-fun e!386113 () Bool)

(assert (=> b!677473 (=> (not res!444063) (not e!386113))))

(declare-datatypes ((List!12960 0))(
  ( (Nil!12957) (Cons!12956 (h!14001 (_ BitVec 64)) (t!19179 List!12960)) )
))
(declare-fun acc!681 () List!12960)

(declare-fun contains!3482 (List!12960 (_ BitVec 64)) Bool)

(assert (=> b!677473 (= res!444063 (not (contains!3482 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677474 () Bool)

(declare-fun e!386118 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!677474 (= e!386118 (contains!3482 acc!681 k!2843))))

(declare-fun b!677475 () Bool)

(declare-fun res!444076 () Bool)

(assert (=> b!677475 (=> (not res!444076) (not e!386113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677475 (= res!444076 (validKeyInArray!0 k!2843))))

(declare-fun b!677476 () Bool)

(declare-fun e!386120 () Bool)

(declare-fun e!386117 () Bool)

(assert (=> b!677476 (= e!386120 e!386117)))

(declare-fun res!444067 () Bool)

(assert (=> b!677476 (=> (not res!444067) (not e!386117))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677476 (= res!444067 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677477 () Bool)

(declare-fun res!444072 () Bool)

(assert (=> b!677477 (=> (not res!444072) (not e!386113))))

(declare-fun e!386116 () Bool)

(assert (=> b!677477 (= res!444072 e!386116)))

(declare-fun res!444075 () Bool)

(assert (=> b!677477 (=> res!444075 e!386116)))

(declare-fun e!386114 () Bool)

(assert (=> b!677477 (= res!444075 e!386114)))

(declare-fun res!444061 () Bool)

(assert (=> b!677477 (=> (not res!444061) (not e!386114))))

(assert (=> b!677477 (= res!444061 (bvsgt from!3004 i!1382))))

(declare-fun res!444059 () Bool)

(assert (=> start!60318 (=> (not res!444059) (not e!386113))))

(declare-datatypes ((array!39376 0))(
  ( (array!39377 (arr!18880 (Array (_ BitVec 32) (_ BitVec 64))) (size!19245 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39376)

(assert (=> start!60318 (= res!444059 (and (bvslt (size!19245 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19245 a!3626))))))

(assert (=> start!60318 e!386113))

(assert (=> start!60318 true))

(declare-fun array_inv!14763 (array!39376) Bool)

(assert (=> start!60318 (array_inv!14763 a!3626)))

(declare-fun b!677478 () Bool)

(declare-fun res!444065 () Bool)

(assert (=> b!677478 (=> (not res!444065) (not e!386113))))

(declare-fun arrayNoDuplicates!0 (array!39376 (_ BitVec 32) List!12960) Bool)

(assert (=> b!677478 (= res!444065 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677479 () Bool)

(declare-fun res!444078 () Bool)

(assert (=> b!677479 (=> (not res!444078) (not e!386113))))

(assert (=> b!677479 (= res!444078 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19245 a!3626))))))

(declare-fun b!677480 () Bool)

(assert (=> b!677480 (= e!386114 (contains!3482 acc!681 k!2843))))

(declare-fun b!677481 () Bool)

(assert (=> b!677481 (= e!386113 (not true))))

(assert (=> b!677481 (arrayNoDuplicates!0 (array!39377 (store (arr!18880 a!3626) i!1382 k!2843) (size!19245 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23760 0))(
  ( (Unit!23761) )
))
(declare-fun lt!312585 () Unit!23760)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12960) Unit!23760)

(assert (=> b!677481 (= lt!312585 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677482 () Bool)

(declare-fun res!444060 () Bool)

(assert (=> b!677482 (=> (not res!444060) (not e!386113))))

(assert (=> b!677482 (= res!444060 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12957))))

(declare-fun b!677483 () Bool)

(declare-fun e!386119 () Bool)

(assert (=> b!677483 (= e!386119 (not (contains!3482 acc!681 k!2843)))))

(declare-fun b!677484 () Bool)

(declare-fun res!444079 () Bool)

(assert (=> b!677484 (=> (not res!444079) (not e!386113))))

(assert (=> b!677484 (= res!444079 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677485 () Bool)

(declare-fun res!444073 () Bool)

(assert (=> b!677485 (=> (not res!444073) (not e!386113))))

(assert (=> b!677485 (= res!444073 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19245 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677486 () Bool)

(declare-fun res!444064 () Bool)

(assert (=> b!677486 (=> (not res!444064) (not e!386113))))

(assert (=> b!677486 (= res!444064 (not (contains!3482 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677487 () Bool)

(declare-fun res!444062 () Bool)

(assert (=> b!677487 (=> (not res!444062) (not e!386113))))

(declare-fun noDuplicate!751 (List!12960) Bool)

(assert (=> b!677487 (= res!444062 (noDuplicate!751 acc!681))))

(declare-fun b!677488 () Bool)

(assert (=> b!677488 (= e!386117 (not (contains!3482 acc!681 k!2843)))))

(declare-fun b!677489 () Bool)

(declare-fun res!444077 () Bool)

(assert (=> b!677489 (=> (not res!444077) (not e!386113))))

(assert (=> b!677489 (= res!444077 (not (validKeyInArray!0 (select (arr!18880 a!3626) from!3004))))))

(declare-fun b!677490 () Bool)

(declare-fun res!444066 () Bool)

(assert (=> b!677490 (=> (not res!444066) (not e!386113))))

(assert (=> b!677490 (= res!444066 e!386120)))

(declare-fun res!444071 () Bool)

(assert (=> b!677490 (=> res!444071 e!386120)))

(assert (=> b!677490 (= res!444071 e!386118)))

(declare-fun res!444069 () Bool)

(assert (=> b!677490 (=> (not res!444069) (not e!386118))))

(assert (=> b!677490 (= res!444069 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677491 () Bool)

(declare-fun res!444070 () Bool)

(assert (=> b!677491 (=> (not res!444070) (not e!386113))))

(assert (=> b!677491 (= res!444070 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677492 () Bool)

(assert (=> b!677492 (= e!386116 e!386119)))

(declare-fun res!444068 () Bool)

(assert (=> b!677492 (=> (not res!444068) (not e!386119))))

(assert (=> b!677492 (= res!444068 (bvsle from!3004 i!1382))))

(declare-fun b!677493 () Bool)

(declare-fun res!444074 () Bool)

(assert (=> b!677493 (=> (not res!444074) (not e!386113))))

(declare-fun arrayContainsKey!0 (array!39376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677493 (= res!444074 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60318 res!444059) b!677487))

(assert (= (and b!677487 res!444062) b!677473))

(assert (= (and b!677473 res!444063) b!677486))

(assert (= (and b!677486 res!444064) b!677477))

(assert (= (and b!677477 res!444061) b!677480))

(assert (= (and b!677477 (not res!444075)) b!677492))

(assert (= (and b!677492 res!444068) b!677483))

(assert (= (and b!677477 res!444072) b!677482))

(assert (= (and b!677482 res!444060) b!677478))

(assert (= (and b!677478 res!444065) b!677479))

(assert (= (and b!677479 res!444078) b!677475))

(assert (= (and b!677475 res!444076) b!677493))

(assert (= (and b!677493 res!444074) b!677485))

(assert (= (and b!677485 res!444073) b!677489))

(assert (= (and b!677489 res!444077) b!677484))

(assert (= (and b!677484 res!444079) b!677490))

(assert (= (and b!677490 res!444069) b!677474))

(assert (= (and b!677490 (not res!444071)) b!677476))

(assert (= (and b!677476 res!444067) b!677488))

(assert (= (and b!677490 res!444066) b!677491))

(assert (= (and b!677491 res!444070) b!677481))

(declare-fun m!643095 () Bool)

(assert (=> b!677489 m!643095))

(assert (=> b!677489 m!643095))

(declare-fun m!643097 () Bool)

(assert (=> b!677489 m!643097))

(declare-fun m!643099 () Bool)

(assert (=> b!677482 m!643099))

(declare-fun m!643101 () Bool)

(assert (=> b!677480 m!643101))

(declare-fun m!643103 () Bool)

(assert (=> b!677491 m!643103))

(assert (=> b!677474 m!643101))

(declare-fun m!643105 () Bool)

(assert (=> start!60318 m!643105))

(assert (=> b!677488 m!643101))

(assert (=> b!677483 m!643101))

(declare-fun m!643107 () Bool)

(assert (=> b!677473 m!643107))

(declare-fun m!643109 () Bool)

(assert (=> b!677487 m!643109))

(declare-fun m!643111 () Bool)

(assert (=> b!677478 m!643111))

(declare-fun m!643113 () Bool)

(assert (=> b!677481 m!643113))

(declare-fun m!643115 () Bool)

(assert (=> b!677481 m!643115))

(declare-fun m!643117 () Bool)

(assert (=> b!677481 m!643117))

(declare-fun m!643119 () Bool)

(assert (=> b!677486 m!643119))

(declare-fun m!643121 () Bool)

(assert (=> b!677493 m!643121))

(declare-fun m!643123 () Bool)

(assert (=> b!677475 m!643123))

(push 1)

(assert (not b!677489))

(assert (not b!677481))

(assert (not b!677482))

(assert (not b!677478))

(assert (not b!677493))

(assert (not b!677475))

(assert (not b!677473))

(assert (not b!677491))

(assert (not b!677487))

(assert (not b!677488))

(assert (not b!677474))

(assert (not b!677486))

(assert (not b!677483))

(assert (not b!677480))

(assert (not start!60318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

