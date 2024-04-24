; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60364 () Bool)

(assert start!60364)

(declare-fun b!677238 () Bool)

(declare-fun e!386159 () Bool)

(declare-fun e!386158 () Bool)

(assert (=> b!677238 (= e!386159 e!386158)))

(declare-fun res!443569 () Bool)

(assert (=> b!677238 (=> (not res!443569) (not e!386158))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677238 (= res!443569 (bvsle from!3004 i!1382))))

(declare-fun b!677239 () Bool)

(declare-fun res!443563 () Bool)

(declare-fun e!386163 () Bool)

(assert (=> b!677239 (=> (not res!443563) (not e!386163))))

(declare-datatypes ((array!39349 0))(
  ( (array!39350 (arr!18864 (Array (_ BitVec 32) (_ BitVec 64))) (size!19228 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39349)

(assert (=> b!677239 (= res!443563 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19228 a!3626))))))

(declare-fun b!677240 () Bool)

(declare-fun res!443556 () Bool)

(assert (=> b!677240 (=> (not res!443556) (not e!386163))))

(declare-datatypes ((List!12812 0))(
  ( (Nil!12809) (Cons!12808 (h!13856 (_ BitVec 64)) (t!19032 List!12812)) )
))
(declare-fun acc!681 () List!12812)

(declare-fun contains!3464 (List!12812 (_ BitVec 64)) Bool)

(assert (=> b!677240 (= res!443556 (not (contains!3464 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677241 () Bool)

(declare-fun e!386157 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!677241 (= e!386157 (contains!3464 acc!681 k!2843))))

(declare-fun res!443571 () Bool)

(assert (=> start!60364 (=> (not res!443571) (not e!386163))))

(assert (=> start!60364 (= res!443571 (and (bvslt (size!19228 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19228 a!3626))))))

(assert (=> start!60364 e!386163))

(assert (=> start!60364 true))

(declare-fun array_inv!14723 (array!39349) Bool)

(assert (=> start!60364 (array_inv!14723 a!3626)))

(declare-fun b!677242 () Bool)

(declare-fun res!443561 () Bool)

(assert (=> b!677242 (=> (not res!443561) (not e!386163))))

(declare-fun arrayNoDuplicates!0 (array!39349 (_ BitVec 32) List!12812) Bool)

(assert (=> b!677242 (= res!443561 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677243 () Bool)

(declare-fun res!443555 () Bool)

(assert (=> b!677243 (=> (not res!443555) (not e!386163))))

(assert (=> b!677243 (= res!443555 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12809))))

(declare-fun b!677244 () Bool)

(declare-fun res!443564 () Bool)

(assert (=> b!677244 (=> (not res!443564) (not e!386163))))

(declare-fun noDuplicate!738 (List!12812) Bool)

(assert (=> b!677244 (= res!443564 (noDuplicate!738 acc!681))))

(declare-fun b!677245 () Bool)

(declare-fun res!443557 () Bool)

(assert (=> b!677245 (=> (not res!443557) (not e!386163))))

(declare-fun arrayContainsKey!0 (array!39349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677245 (= res!443557 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677246 () Bool)

(declare-fun res!443567 () Bool)

(assert (=> b!677246 (=> (not res!443567) (not e!386163))))

(assert (=> b!677246 (= res!443567 e!386159)))

(declare-fun res!443566 () Bool)

(assert (=> b!677246 (=> res!443566 e!386159)))

(declare-fun e!386156 () Bool)

(assert (=> b!677246 (= res!443566 e!386156)))

(declare-fun res!443570 () Bool)

(assert (=> b!677246 (=> (not res!443570) (not e!386156))))

(assert (=> b!677246 (= res!443570 (bvsgt from!3004 i!1382))))

(declare-fun b!677247 () Bool)

(declare-fun res!443572 () Bool)

(assert (=> b!677247 (=> (not res!443572) (not e!386163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677247 (= res!443572 (not (validKeyInArray!0 (select (arr!18864 a!3626) from!3004))))))

(declare-fun b!677248 () Bool)

(declare-fun res!443565 () Bool)

(assert (=> b!677248 (=> (not res!443565) (not e!386163))))

(declare-fun e!386161 () Bool)

(assert (=> b!677248 (= res!443565 e!386161)))

(declare-fun res!443562 () Bool)

(assert (=> b!677248 (=> res!443562 e!386161)))

(assert (=> b!677248 (= res!443562 e!386157)))

(declare-fun res!443559 () Bool)

(assert (=> b!677248 (=> (not res!443559) (not e!386157))))

(assert (=> b!677248 (= res!443559 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677249 () Bool)

(declare-fun res!443568 () Bool)

(assert (=> b!677249 (=> (not res!443568) (not e!386163))))

(assert (=> b!677249 (= res!443568 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19228 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677250 () Bool)

(declare-fun e!386160 () Bool)

(assert (=> b!677250 (= e!386161 e!386160)))

(declare-fun res!443554 () Bool)

(assert (=> b!677250 (=> (not res!443554) (not e!386160))))

(assert (=> b!677250 (= res!443554 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677251 () Bool)

(declare-fun res!443560 () Bool)

(assert (=> b!677251 (=> (not res!443560) (not e!386163))))

(assert (=> b!677251 (= res!443560 (not (contains!3464 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677252 () Bool)

(assert (=> b!677252 (= e!386156 (contains!3464 acc!681 k!2843))))

(declare-fun b!677253 () Bool)

(assert (=> b!677253 (= e!386158 (not (contains!3464 acc!681 k!2843)))))

(declare-fun b!677254 () Bool)

(declare-fun res!443558 () Bool)

(assert (=> b!677254 (=> (not res!443558) (not e!386163))))

(assert (=> b!677254 (= res!443558 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677255 () Bool)

(declare-fun res!443553 () Bool)

(assert (=> b!677255 (=> (not res!443553) (not e!386163))))

(assert (=> b!677255 (= res!443553 (validKeyInArray!0 k!2843))))

(declare-fun b!677256 () Bool)

(assert (=> b!677256 (= e!386163 false)))

(declare-fun lt!312907 () Bool)

(assert (=> b!677256 (= lt!312907 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677257 () Bool)

(assert (=> b!677257 (= e!386160 (not (contains!3464 acc!681 k!2843)))))

(assert (= (and start!60364 res!443571) b!677244))

(assert (= (and b!677244 res!443564) b!677251))

(assert (= (and b!677251 res!443560) b!677240))

(assert (= (and b!677240 res!443556) b!677246))

(assert (= (and b!677246 res!443570) b!677252))

(assert (= (and b!677246 (not res!443566)) b!677238))

(assert (= (and b!677238 res!443569) b!677253))

(assert (= (and b!677246 res!443567) b!677243))

(assert (= (and b!677243 res!443555) b!677242))

(assert (= (and b!677242 res!443561) b!677239))

(assert (= (and b!677239 res!443563) b!677255))

(assert (= (and b!677255 res!443553) b!677245))

(assert (= (and b!677245 res!443557) b!677249))

(assert (= (and b!677249 res!443568) b!677247))

(assert (= (and b!677247 res!443572) b!677254))

(assert (= (and b!677254 res!443558) b!677248))

(assert (= (and b!677248 res!443559) b!677241))

(assert (= (and b!677248 (not res!443562)) b!677250))

(assert (= (and b!677250 res!443554) b!677257))

(assert (= (and b!677248 res!443565) b!677256))

(declare-fun m!644221 () Bool)

(assert (=> b!677240 m!644221))

(declare-fun m!644223 () Bool)

(assert (=> b!677255 m!644223))

(declare-fun m!644225 () Bool)

(assert (=> start!60364 m!644225))

(declare-fun m!644227 () Bool)

(assert (=> b!677242 m!644227))

(declare-fun m!644229 () Bool)

(assert (=> b!677252 m!644229))

(assert (=> b!677241 m!644229))

(declare-fun m!644231 () Bool)

(assert (=> b!677256 m!644231))

(declare-fun m!644233 () Bool)

(assert (=> b!677243 m!644233))

(declare-fun m!644235 () Bool)

(assert (=> b!677244 m!644235))

(assert (=> b!677253 m!644229))

(declare-fun m!644237 () Bool)

(assert (=> b!677251 m!644237))

(declare-fun m!644239 () Bool)

(assert (=> b!677247 m!644239))

(assert (=> b!677247 m!644239))

(declare-fun m!644241 () Bool)

(assert (=> b!677247 m!644241))

(assert (=> b!677257 m!644229))

(declare-fun m!644243 () Bool)

(assert (=> b!677245 m!644243))

(push 1)

(assert (not b!677251))

(assert (not b!677255))

(assert (not start!60364))

(assert (not b!677247))

(assert (not b!677241))

(assert (not b!677252))

(assert (not b!677257))

(assert (not b!677256))

(assert (not b!677244))

(assert (not b!677242))

(assert (not b!677245))

(assert (not b!677243))

(assert (not b!677253))

(assert (not b!677240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

