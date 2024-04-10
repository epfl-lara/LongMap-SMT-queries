; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62198 () Bool)

(assert start!62198)

(declare-fun b!696508 () Bool)

(declare-fun res!460441 () Bool)

(declare-fun e!396086 () Bool)

(assert (=> b!696508 (=> (not res!460441) (not e!396086))))

(declare-datatypes ((array!39955 0))(
  ( (array!39956 (arr!19137 (Array (_ BitVec 32) (_ BitVec 64))) (size!19522 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39955)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696508 (= res!460441 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696509 () Bool)

(declare-fun res!460444 () Bool)

(assert (=> b!696509 (=> (not res!460444) (not e!396086))))

(declare-datatypes ((List!13178 0))(
  ( (Nil!13175) (Cons!13174 (h!14219 (_ BitVec 64)) (t!19460 List!13178)) )
))
(declare-fun arrayNoDuplicates!0 (array!39955 (_ BitVec 32) List!13178) Bool)

(assert (=> b!696509 (= res!460444 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13175))))

(declare-fun b!696510 () Bool)

(declare-fun res!460442 () Bool)

(assert (=> b!696510 (=> (not res!460442) (not e!396086))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696510 (= res!460442 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19522 a!3626))))))

(declare-fun b!696511 () Bool)

(declare-fun res!460436 () Bool)

(assert (=> b!696511 (=> (not res!460436) (not e!396086))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!696511 (= res!460436 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19522 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696512 () Bool)

(assert (=> b!696512 (= e!396086 false)))

(declare-fun lt!317113 () Bool)

(declare-fun acc!681 () List!13178)

(assert (=> b!696512 (= lt!317113 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!696513 () Bool)

(declare-fun res!460434 () Bool)

(assert (=> b!696513 (=> (not res!460434) (not e!396086))))

(declare-fun e!396081 () Bool)

(assert (=> b!696513 (= res!460434 e!396081)))

(declare-fun res!460439 () Bool)

(assert (=> b!696513 (=> res!460439 e!396081)))

(declare-fun e!396083 () Bool)

(assert (=> b!696513 (= res!460439 e!396083)))

(declare-fun res!460440 () Bool)

(assert (=> b!696513 (=> (not res!460440) (not e!396083))))

(assert (=> b!696513 (= res!460440 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696514 () Bool)

(declare-fun contains!3755 (List!13178 (_ BitVec 64)) Bool)

(assert (=> b!696514 (= e!396083 (contains!3755 acc!681 k!2843))))

(declare-fun b!696515 () Bool)

(declare-fun res!460432 () Bool)

(assert (=> b!696515 (=> (not res!460432) (not e!396086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696515 (= res!460432 (not (validKeyInArray!0 (select (arr!19137 a!3626) from!3004))))))

(declare-fun b!696517 () Bool)

(declare-fun e!396085 () Bool)

(assert (=> b!696517 (= e!396085 (not (contains!3755 acc!681 k!2843)))))

(declare-fun b!696518 () Bool)

(assert (=> b!696518 (= e!396081 e!396085)))

(declare-fun res!460445 () Bool)

(assert (=> b!696518 (=> (not res!460445) (not e!396085))))

(assert (=> b!696518 (= res!460445 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696519 () Bool)

(declare-fun res!460433 () Bool)

(assert (=> b!696519 (=> (not res!460433) (not e!396086))))

(declare-fun e!396082 () Bool)

(assert (=> b!696519 (= res!460433 e!396082)))

(declare-fun res!460443 () Bool)

(assert (=> b!696519 (=> res!460443 e!396082)))

(declare-fun e!396080 () Bool)

(assert (=> b!696519 (= res!460443 e!396080)))

(declare-fun res!460429 () Bool)

(assert (=> b!696519 (=> (not res!460429) (not e!396080))))

(assert (=> b!696519 (= res!460429 (bvsgt from!3004 i!1382))))

(declare-fun b!696520 () Bool)

(declare-fun res!460427 () Bool)

(assert (=> b!696520 (=> (not res!460427) (not e!396086))))

(assert (=> b!696520 (= res!460427 (validKeyInArray!0 k!2843))))

(declare-fun b!696521 () Bool)

(assert (=> b!696521 (= e!396080 (contains!3755 acc!681 k!2843))))

(declare-fun b!696522 () Bool)

(declare-fun res!460431 () Bool)

(assert (=> b!696522 (=> (not res!460431) (not e!396086))))

(assert (=> b!696522 (= res!460431 (not (contains!3755 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696523 () Bool)

(declare-fun res!460438 () Bool)

(assert (=> b!696523 (=> (not res!460438) (not e!396086))))

(assert (=> b!696523 (= res!460438 (not (contains!3755 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696524 () Bool)

(declare-fun e!396087 () Bool)

(assert (=> b!696524 (= e!396082 e!396087)))

(declare-fun res!460435 () Bool)

(assert (=> b!696524 (=> (not res!460435) (not e!396087))))

(assert (=> b!696524 (= res!460435 (bvsle from!3004 i!1382))))

(declare-fun b!696525 () Bool)

(declare-fun res!460428 () Bool)

(assert (=> b!696525 (=> (not res!460428) (not e!396086))))

(assert (=> b!696525 (= res!460428 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696516 () Bool)

(assert (=> b!696516 (= e!396087 (not (contains!3755 acc!681 k!2843)))))

(declare-fun res!460430 () Bool)

(assert (=> start!62198 (=> (not res!460430) (not e!396086))))

(assert (=> start!62198 (= res!460430 (and (bvslt (size!19522 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19522 a!3626))))))

(assert (=> start!62198 e!396086))

(assert (=> start!62198 true))

(declare-fun array_inv!14933 (array!39955) Bool)

(assert (=> start!62198 (array_inv!14933 a!3626)))

(declare-fun b!696526 () Bool)

(declare-fun res!460426 () Bool)

(assert (=> b!696526 (=> (not res!460426) (not e!396086))))

(declare-fun noDuplicate!1002 (List!13178) Bool)

(assert (=> b!696526 (= res!460426 (noDuplicate!1002 acc!681))))

(declare-fun b!696527 () Bool)

(declare-fun res!460437 () Bool)

(assert (=> b!696527 (=> (not res!460437) (not e!396086))))

(assert (=> b!696527 (= res!460437 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (= (and start!62198 res!460430) b!696526))

(assert (= (and b!696526 res!460426) b!696523))

(assert (= (and b!696523 res!460438) b!696522))

(assert (= (and b!696522 res!460431) b!696519))

(assert (= (and b!696519 res!460429) b!696521))

(assert (= (and b!696519 (not res!460443)) b!696524))

(assert (= (and b!696524 res!460435) b!696516))

(assert (= (and b!696519 res!460433) b!696509))

(assert (= (and b!696509 res!460444) b!696525))

(assert (= (and b!696525 res!460428) b!696510))

(assert (= (and b!696510 res!460442) b!696520))

(assert (= (and b!696520 res!460427) b!696508))

(assert (= (and b!696508 res!460441) b!696511))

(assert (= (and b!696511 res!460436) b!696515))

(assert (= (and b!696515 res!460432) b!696527))

(assert (= (and b!696527 res!460437) b!696513))

(assert (= (and b!696513 res!460440) b!696514))

(assert (= (and b!696513 (not res!460439)) b!696518))

(assert (= (and b!696518 res!460445) b!696517))

(assert (= (and b!696513 res!460434) b!696512))

(declare-fun m!657467 () Bool)

(assert (=> b!696526 m!657467))

(declare-fun m!657469 () Bool)

(assert (=> b!696520 m!657469))

(declare-fun m!657471 () Bool)

(assert (=> b!696516 m!657471))

(declare-fun m!657473 () Bool)

(assert (=> start!62198 m!657473))

(assert (=> b!696521 m!657471))

(declare-fun m!657475 () Bool)

(assert (=> b!696525 m!657475))

(assert (=> b!696517 m!657471))

(declare-fun m!657477 () Bool)

(assert (=> b!696509 m!657477))

(assert (=> b!696514 m!657471))

(declare-fun m!657479 () Bool)

(assert (=> b!696522 m!657479))

(declare-fun m!657481 () Bool)

(assert (=> b!696515 m!657481))

(assert (=> b!696515 m!657481))

(declare-fun m!657483 () Bool)

(assert (=> b!696515 m!657483))

(declare-fun m!657485 () Bool)

(assert (=> b!696512 m!657485))

(declare-fun m!657487 () Bool)

(assert (=> b!696508 m!657487))

(declare-fun m!657489 () Bool)

(assert (=> b!696523 m!657489))

(push 1)

(assert (not b!696514))

(assert (not b!696523))

(assert (not b!696508))

(assert (not b!696517))

(assert (not b!696512))

(assert (not b!696526))

(assert (not start!62198))

(assert (not b!696516))

(assert (not b!696525))

(assert (not b!696521))

(assert (not b!696520))

(assert (not b!696515))

(assert (not b!696509))

(assert (not b!696522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

