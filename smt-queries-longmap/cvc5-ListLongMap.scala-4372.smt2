; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60252 () Bool)

(assert start!60252)

(declare-fun b!675458 () Bool)

(declare-fun res!442061 () Bool)

(declare-fun e!385327 () Bool)

(assert (=> b!675458 (=> (not res!442061) (not e!385327))))

(declare-datatypes ((array!39310 0))(
  ( (array!39311 (arr!18847 (Array (_ BitVec 32) (_ BitVec 64))) (size!19212 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39310)

(declare-datatypes ((List!12927 0))(
  ( (Nil!12924) (Cons!12923 (h!13968 (_ BitVec 64)) (t!19146 List!12927)) )
))
(declare-fun arrayNoDuplicates!0 (array!39310 (_ BitVec 32) List!12927) Bool)

(assert (=> b!675458 (= res!442061 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12924))))

(declare-fun b!675459 () Bool)

(declare-fun e!385324 () Bool)

(declare-fun acc!681 () List!12927)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3449 (List!12927 (_ BitVec 64)) Bool)

(assert (=> b!675459 (= e!385324 (contains!3449 acc!681 k!2843))))

(declare-fun b!675460 () Bool)

(declare-fun res!442050 () Bool)

(assert (=> b!675460 (=> (not res!442050) (not e!385327))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675460 (= res!442050 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19212 a!3626))))))

(declare-fun b!675461 () Bool)

(declare-fun e!385328 () Bool)

(declare-fun e!385321 () Bool)

(assert (=> b!675461 (= e!385328 e!385321)))

(declare-fun res!442044 () Bool)

(assert (=> b!675461 (=> (not res!442044) (not e!385321))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!675461 (= res!442044 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675462 () Bool)

(declare-fun res!442058 () Bool)

(assert (=> b!675462 (=> (not res!442058) (not e!385327))))

(assert (=> b!675462 (= res!442058 (not (contains!3449 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675463 () Bool)

(declare-fun res!442046 () Bool)

(assert (=> b!675463 (=> (not res!442046) (not e!385327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675463 (= res!442046 (not (validKeyInArray!0 (select (arr!18847 a!3626) from!3004))))))

(declare-fun b!675464 () Bool)

(declare-fun res!442054 () Bool)

(assert (=> b!675464 (=> (not res!442054) (not e!385327))))

(declare-fun noDuplicate!718 (List!12927) Bool)

(assert (=> b!675464 (= res!442054 (noDuplicate!718 acc!681))))

(declare-fun b!675465 () Bool)

(assert (=> b!675465 (= e!385327 false)))

(declare-fun lt!312486 () Bool)

(assert (=> b!675465 (= lt!312486 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675466 () Bool)

(declare-fun e!385325 () Bool)

(declare-fun e!385326 () Bool)

(assert (=> b!675466 (= e!385325 e!385326)))

(declare-fun res!442055 () Bool)

(assert (=> b!675466 (=> (not res!442055) (not e!385326))))

(assert (=> b!675466 (= res!442055 (bvsle from!3004 i!1382))))

(declare-fun b!675467 () Bool)

(declare-fun res!442052 () Bool)

(assert (=> b!675467 (=> (not res!442052) (not e!385327))))

(assert (=> b!675467 (= res!442052 e!385328)))

(declare-fun res!442053 () Bool)

(assert (=> b!675467 (=> res!442053 e!385328)))

(assert (=> b!675467 (= res!442053 e!385324)))

(declare-fun res!442051 () Bool)

(assert (=> b!675467 (=> (not res!442051) (not e!385324))))

(assert (=> b!675467 (= res!442051 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675468 () Bool)

(declare-fun res!442063 () Bool)

(assert (=> b!675468 (=> (not res!442063) (not e!385327))))

(assert (=> b!675468 (= res!442063 (not (contains!3449 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675469 () Bool)

(declare-fun res!442048 () Bool)

(assert (=> b!675469 (=> (not res!442048) (not e!385327))))

(assert (=> b!675469 (= res!442048 e!385325)))

(declare-fun res!442060 () Bool)

(assert (=> b!675469 (=> res!442060 e!385325)))

(declare-fun e!385323 () Bool)

(assert (=> b!675469 (= res!442060 e!385323)))

(declare-fun res!442057 () Bool)

(assert (=> b!675469 (=> (not res!442057) (not e!385323))))

(assert (=> b!675469 (= res!442057 (bvsgt from!3004 i!1382))))

(declare-fun b!675470 () Bool)

(declare-fun res!442056 () Bool)

(assert (=> b!675470 (=> (not res!442056) (not e!385327))))

(assert (=> b!675470 (= res!442056 (validKeyInArray!0 k!2843))))

(declare-fun b!675471 () Bool)

(assert (=> b!675471 (= e!385326 (not (contains!3449 acc!681 k!2843)))))

(declare-fun b!675472 () Bool)

(declare-fun res!442059 () Bool)

(assert (=> b!675472 (=> (not res!442059) (not e!385327))))

(assert (=> b!675472 (= res!442059 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19212 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675473 () Bool)

(assert (=> b!675473 (= e!385323 (contains!3449 acc!681 k!2843))))

(declare-fun b!675474 () Bool)

(declare-fun res!442045 () Bool)

(assert (=> b!675474 (=> (not res!442045) (not e!385327))))

(assert (=> b!675474 (= res!442045 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675475 () Bool)

(assert (=> b!675475 (= e!385321 (not (contains!3449 acc!681 k!2843)))))

(declare-fun res!442049 () Bool)

(assert (=> start!60252 (=> (not res!442049) (not e!385327))))

(assert (=> start!60252 (= res!442049 (and (bvslt (size!19212 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19212 a!3626))))))

(assert (=> start!60252 e!385327))

(assert (=> start!60252 true))

(declare-fun array_inv!14730 (array!39310) Bool)

(assert (=> start!60252 (array_inv!14730 a!3626)))

(declare-fun b!675476 () Bool)

(declare-fun res!442047 () Bool)

(assert (=> b!675476 (=> (not res!442047) (not e!385327))))

(declare-fun arrayContainsKey!0 (array!39310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675476 (= res!442047 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!675477 () Bool)

(declare-fun res!442062 () Bool)

(assert (=> b!675477 (=> (not res!442062) (not e!385327))))

(assert (=> b!675477 (= res!442062 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60252 res!442049) b!675464))

(assert (= (and b!675464 res!442054) b!675462))

(assert (= (and b!675462 res!442058) b!675468))

(assert (= (and b!675468 res!442063) b!675469))

(assert (= (and b!675469 res!442057) b!675473))

(assert (= (and b!675469 (not res!442060)) b!675466))

(assert (= (and b!675466 res!442055) b!675471))

(assert (= (and b!675469 res!442048) b!675458))

(assert (= (and b!675458 res!442061) b!675477))

(assert (= (and b!675477 res!442062) b!675460))

(assert (= (and b!675460 res!442050) b!675470))

(assert (= (and b!675470 res!442056) b!675476))

(assert (= (and b!675476 res!442047) b!675472))

(assert (= (and b!675472 res!442059) b!675463))

(assert (= (and b!675463 res!442046) b!675474))

(assert (= (and b!675474 res!442045) b!675467))

(assert (= (and b!675467 res!442051) b!675459))

(assert (= (and b!675467 (not res!442053)) b!675461))

(assert (= (and b!675461 res!442044) b!675475))

(assert (= (and b!675467 res!442052) b!675465))

(declare-fun m!642237 () Bool)

(assert (=> b!675462 m!642237))

(declare-fun m!642239 () Bool)

(assert (=> b!675459 m!642239))

(declare-fun m!642241 () Bool)

(assert (=> b!675468 m!642241))

(assert (=> b!675473 m!642239))

(declare-fun m!642243 () Bool)

(assert (=> b!675476 m!642243))

(declare-fun m!642245 () Bool)

(assert (=> b!675458 m!642245))

(declare-fun m!642247 () Bool)

(assert (=> b!675464 m!642247))

(declare-fun m!642249 () Bool)

(assert (=> b!675477 m!642249))

(assert (=> b!675471 m!642239))

(assert (=> b!675475 m!642239))

(declare-fun m!642251 () Bool)

(assert (=> b!675463 m!642251))

(assert (=> b!675463 m!642251))

(declare-fun m!642253 () Bool)

(assert (=> b!675463 m!642253))

(declare-fun m!642255 () Bool)

(assert (=> start!60252 m!642255))

(declare-fun m!642257 () Bool)

(assert (=> b!675470 m!642257))

(declare-fun m!642259 () Bool)

(assert (=> b!675465 m!642259))

(push 1)

(assert (not b!675464))

(assert (not b!675459))

(assert (not b!675471))

(assert (not b!675477))

(assert (not b!675473))

(assert (not b!675465))

(assert (not b!675470))

(assert (not b!675476))

(assert (not b!675462))

(assert (not b!675463))

(assert (not b!675458))

(assert (not b!675468))

(assert (not b!675475))

(assert (not start!60252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

