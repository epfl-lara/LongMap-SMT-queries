; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62226 () Bool)

(assert start!62226)

(declare-fun b!697365 () Bool)

(declare-fun e!396420 () Bool)

(declare-datatypes ((List!13192 0))(
  ( (Nil!13189) (Cons!13188 (h!14233 (_ BitVec 64)) (t!19474 List!13192)) )
))
(declare-fun acc!681 () List!13192)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3769 (List!13192 (_ BitVec 64)) Bool)

(assert (=> b!697365 (= e!396420 (not (contains!3769 acc!681 k!2843)))))

(declare-fun b!697366 () Bool)

(declare-fun res!461287 () Bool)

(declare-fun e!396417 () Bool)

(assert (=> b!697366 (=> (not res!461287) (not e!396417))))

(declare-datatypes ((array!39983 0))(
  ( (array!39984 (arr!19151 (Array (_ BitVec 32) (_ BitVec 64))) (size!19536 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39983)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697366 (= res!461287 (not (validKeyInArray!0 (select (arr!19151 a!3626) from!3004))))))

(declare-fun b!697367 () Bool)

(declare-fun res!461296 () Bool)

(assert (=> b!697367 (=> (not res!461296) (not e!396417))))

(declare-fun arrayContainsKey!0 (array!39983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697367 (= res!461296 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697368 () Bool)

(declare-fun res!461301 () Bool)

(assert (=> b!697368 (=> (not res!461301) (not e!396417))))

(assert (=> b!697368 (= res!461301 (not (contains!3769 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697369 () Bool)

(declare-fun e!396423 () Bool)

(assert (=> b!697369 (= e!396423 e!396420)))

(declare-fun res!461283 () Bool)

(assert (=> b!697369 (=> (not res!461283) (not e!396420))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697369 (= res!461283 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697370 () Bool)

(declare-fun e!396421 () Bool)

(assert (=> b!697370 (= e!396421 (not (contains!3769 acc!681 k!2843)))))

(declare-fun b!697371 () Bool)

(declare-fun e!396419 () Bool)

(assert (=> b!697371 (= e!396419 (contains!3769 acc!681 k!2843))))

(declare-fun b!697372 () Bool)

(declare-fun res!461292 () Bool)

(assert (=> b!697372 (=> (not res!461292) (not e!396417))))

(assert (=> b!697372 (= res!461292 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19536 a!3626))))))

(declare-fun b!697373 () Bool)

(declare-fun res!461302 () Bool)

(assert (=> b!697373 (=> (not res!461302) (not e!396417))))

(assert (=> b!697373 (= res!461302 (validKeyInArray!0 k!2843))))

(declare-fun b!697374 () Bool)

(declare-fun res!461289 () Bool)

(assert (=> b!697374 (=> (not res!461289) (not e!396417))))

(declare-fun arrayNoDuplicates!0 (array!39983 (_ BitVec 32) List!13192) Bool)

(assert (=> b!697374 (= res!461289 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13189))))

(declare-fun b!697375 () Bool)

(declare-fun res!461290 () Bool)

(assert (=> b!697375 (=> (not res!461290) (not e!396417))))

(assert (=> b!697375 (= res!461290 e!396423)))

(declare-fun res!461297 () Bool)

(assert (=> b!697375 (=> res!461297 e!396423)))

(assert (=> b!697375 (= res!461297 e!396419)))

(declare-fun res!461293 () Bool)

(assert (=> b!697375 (=> (not res!461293) (not e!396419))))

(assert (=> b!697375 (= res!461293 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!461285 () Bool)

(assert (=> start!62226 (=> (not res!461285) (not e!396417))))

(assert (=> start!62226 (= res!461285 (and (bvslt (size!19536 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19536 a!3626))))))

(assert (=> start!62226 e!396417))

(assert (=> start!62226 true))

(declare-fun array_inv!14947 (array!39983) Bool)

(assert (=> start!62226 (array_inv!14947 a!3626)))

(declare-fun b!697376 () Bool)

(declare-fun res!461288 () Bool)

(assert (=> b!697376 (=> (not res!461288) (not e!396417))))

(declare-fun noDuplicate!1016 (List!13192) Bool)

(assert (=> b!697376 (= res!461288 (noDuplicate!1016 acc!681))))

(declare-fun b!697377 () Bool)

(declare-fun res!461295 () Bool)

(assert (=> b!697377 (=> (not res!461295) (not e!396417))))

(assert (=> b!697377 (= res!461295 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697378 () Bool)

(declare-fun res!461299 () Bool)

(assert (=> b!697378 (=> (not res!461299) (not e!396417))))

(assert (=> b!697378 (= res!461299 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19536 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697379 () Bool)

(assert (=> b!697379 (= e!396417 (not true))))

(assert (=> b!697379 (arrayNoDuplicates!0 (array!39984 (store (arr!19151 a!3626) i!1382 k!2843) (size!19536 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!24574 0))(
  ( (Unit!24575) )
))
(declare-fun lt!317146 () Unit!24574)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39983 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13192) Unit!24574)

(assert (=> b!697379 (= lt!317146 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697380 () Bool)

(declare-fun res!461294 () Bool)

(assert (=> b!697380 (=> (not res!461294) (not e!396417))))

(assert (=> b!697380 (= res!461294 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697381 () Bool)

(declare-fun e!396416 () Bool)

(assert (=> b!697381 (= e!396416 e!396421)))

(declare-fun res!461300 () Bool)

(assert (=> b!697381 (=> (not res!461300) (not e!396421))))

(assert (=> b!697381 (= res!461300 (bvsle from!3004 i!1382))))

(declare-fun b!697382 () Bool)

(declare-fun res!461286 () Bool)

(assert (=> b!697382 (=> (not res!461286) (not e!396417))))

(assert (=> b!697382 (= res!461286 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697383 () Bool)

(declare-fun res!461303 () Bool)

(assert (=> b!697383 (=> (not res!461303) (not e!396417))))

(assert (=> b!697383 (= res!461303 e!396416)))

(declare-fun res!461298 () Bool)

(assert (=> b!697383 (=> res!461298 e!396416)))

(declare-fun e!396418 () Bool)

(assert (=> b!697383 (= res!461298 e!396418)))

(declare-fun res!461291 () Bool)

(assert (=> b!697383 (=> (not res!461291) (not e!396418))))

(assert (=> b!697383 (= res!461291 (bvsgt from!3004 i!1382))))

(declare-fun b!697384 () Bool)

(assert (=> b!697384 (= e!396418 (contains!3769 acc!681 k!2843))))

(declare-fun b!697385 () Bool)

(declare-fun res!461284 () Bool)

(assert (=> b!697385 (=> (not res!461284) (not e!396417))))

(assert (=> b!697385 (= res!461284 (not (contains!3769 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62226 res!461285) b!697376))

(assert (= (and b!697376 res!461288) b!697368))

(assert (= (and b!697368 res!461301) b!697385))

(assert (= (and b!697385 res!461284) b!697383))

(assert (= (and b!697383 res!461291) b!697384))

(assert (= (and b!697383 (not res!461298)) b!697381))

(assert (= (and b!697381 res!461300) b!697370))

(assert (= (and b!697383 res!461303) b!697374))

(assert (= (and b!697374 res!461289) b!697382))

(assert (= (and b!697382 res!461286) b!697372))

(assert (= (and b!697372 res!461292) b!697373))

(assert (= (and b!697373 res!461302) b!697367))

(assert (= (and b!697367 res!461296) b!697378))

(assert (= (and b!697378 res!461299) b!697366))

(assert (= (and b!697366 res!461287) b!697380))

(assert (= (and b!697380 res!461294) b!697375))

(assert (= (and b!697375 res!461293) b!697371))

(assert (= (and b!697375 (not res!461297)) b!697369))

(assert (= (and b!697369 res!461283) b!697365))

(assert (= (and b!697375 res!461290) b!697377))

(assert (= (and b!697377 res!461295) b!697379))

(declare-fun m!657815 () Bool)

(assert (=> b!697376 m!657815))

(declare-fun m!657817 () Bool)

(assert (=> start!62226 m!657817))

(declare-fun m!657819 () Bool)

(assert (=> b!697370 m!657819))

(declare-fun m!657821 () Bool)

(assert (=> b!697368 m!657821))

(declare-fun m!657823 () Bool)

(assert (=> b!697382 m!657823))

(declare-fun m!657825 () Bool)

(assert (=> b!697366 m!657825))

(assert (=> b!697366 m!657825))

(declare-fun m!657827 () Bool)

(assert (=> b!697366 m!657827))

(declare-fun m!657829 () Bool)

(assert (=> b!697373 m!657829))

(declare-fun m!657831 () Bool)

(assert (=> b!697379 m!657831))

(declare-fun m!657833 () Bool)

(assert (=> b!697379 m!657833))

(declare-fun m!657835 () Bool)

(assert (=> b!697379 m!657835))

(declare-fun m!657837 () Bool)

(assert (=> b!697367 m!657837))

(declare-fun m!657839 () Bool)

(assert (=> b!697385 m!657839))

(assert (=> b!697384 m!657819))

(declare-fun m!657841 () Bool)

(assert (=> b!697374 m!657841))

(declare-fun m!657843 () Bool)

(assert (=> b!697377 m!657843))

(assert (=> b!697371 m!657819))

(assert (=> b!697365 m!657819))

(push 1)

(assert (not b!697373))

(assert (not b!697382))

(assert (not b!697377))

(assert (not b!697379))

(assert (not b!697365))

(assert (not b!697371))

(assert (not b!697376))

(assert (not b!697367))

(assert (not b!697384))

(assert (not b!697370))

(assert (not start!62226))

(assert (not b!697385))

(assert (not b!697374))

(assert (not b!697368))

(assert (not b!697366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

