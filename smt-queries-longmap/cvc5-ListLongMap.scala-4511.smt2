; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62534 () Bool)

(assert start!62534)

(declare-fun b!704621 () Bool)

(declare-fun res!468437 () Bool)

(declare-fun e!397741 () Bool)

(assert (=> b!704621 (=> (not res!468437) (not e!397741))))

(declare-datatypes ((List!13304 0))(
  ( (Nil!13301) (Cons!13300 (h!14345 (_ BitVec 64)) (t!19586 List!13304)) )
))
(declare-fun acc!652 () List!13304)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3881 (List!13304 (_ BitVec 64)) Bool)

(assert (=> b!704621 (= res!468437 (not (contains!3881 acc!652 k!2824)))))

(declare-fun b!704622 () Bool)

(declare-fun res!468441 () Bool)

(assert (=> b!704622 (=> (not res!468441) (not e!397741))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40213 0))(
  ( (array!40214 (arr!19263 (Array (_ BitVec 32) (_ BitVec 64))) (size!19648 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40213)

(declare-fun arrayNoDuplicates!0 (array!40213 (_ BitVec 32) List!13304) Bool)

(assert (=> b!704622 (= res!468441 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704623 () Bool)

(declare-fun res!468447 () Bool)

(assert (=> b!704623 (=> (not res!468447) (not e!397741))))

(declare-fun newAcc!49 () List!13304)

(assert (=> b!704623 (= res!468447 (not (contains!3881 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704624 () Bool)

(declare-fun res!468439 () Bool)

(assert (=> b!704624 (=> (not res!468439) (not e!397741))))

(assert (=> b!704624 (= res!468439 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19648 a!3591)))))

(declare-fun b!704625 () Bool)

(declare-fun res!468446 () Bool)

(assert (=> b!704625 (=> (not res!468446) (not e!397741))))

(declare-fun -!291 (List!13304 (_ BitVec 64)) List!13304)

(assert (=> b!704625 (= res!468446 (= (-!291 newAcc!49 k!2824) acc!652))))

(declare-fun b!704626 () Bool)

(declare-fun res!468438 () Bool)

(assert (=> b!704626 (=> (not res!468438) (not e!397741))))

(assert (=> b!704626 (= res!468438 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704627 () Bool)

(declare-fun res!468440 () Bool)

(assert (=> b!704627 (=> (not res!468440) (not e!397741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704627 (= res!468440 (validKeyInArray!0 k!2824))))

(declare-fun b!704628 () Bool)

(assert (=> b!704628 (= e!397741 false)))

(declare-fun lt!317853 () Bool)

(assert (=> b!704628 (= lt!317853 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704629 () Bool)

(declare-fun res!468431 () Bool)

(assert (=> b!704629 (=> (not res!468431) (not e!397741))))

(assert (=> b!704629 (= res!468431 (not (validKeyInArray!0 (select (arr!19263 a!3591) from!2969))))))

(declare-fun b!704630 () Bool)

(declare-fun res!468444 () Bool)

(assert (=> b!704630 (=> (not res!468444) (not e!397741))))

(declare-fun arrayContainsKey!0 (array!40213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704630 (= res!468444 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704631 () Bool)

(declare-fun res!468433 () Bool)

(assert (=> b!704631 (=> (not res!468433) (not e!397741))))

(assert (=> b!704631 (= res!468433 (not (contains!3881 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!468436 () Bool)

(assert (=> start!62534 (=> (not res!468436) (not e!397741))))

(assert (=> start!62534 (= res!468436 (and (bvslt (size!19648 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19648 a!3591))))))

(assert (=> start!62534 e!397741))

(assert (=> start!62534 true))

(declare-fun array_inv!15059 (array!40213) Bool)

(assert (=> start!62534 (array_inv!15059 a!3591)))

(declare-fun b!704620 () Bool)

(declare-fun res!468445 () Bool)

(assert (=> b!704620 (=> (not res!468445) (not e!397741))))

(declare-fun subseq!326 (List!13304 List!13304) Bool)

(assert (=> b!704620 (= res!468445 (subseq!326 acc!652 newAcc!49))))

(declare-fun b!704632 () Bool)

(declare-fun res!468443 () Bool)

(assert (=> b!704632 (=> (not res!468443) (not e!397741))))

(assert (=> b!704632 (= res!468443 (not (contains!3881 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704633 () Bool)

(declare-fun res!468430 () Bool)

(assert (=> b!704633 (=> (not res!468430) (not e!397741))))

(assert (=> b!704633 (= res!468430 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704634 () Bool)

(declare-fun res!468442 () Bool)

(assert (=> b!704634 (=> (not res!468442) (not e!397741))))

(assert (=> b!704634 (= res!468442 (not (contains!3881 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704635 () Bool)

(declare-fun res!468432 () Bool)

(assert (=> b!704635 (=> (not res!468432) (not e!397741))))

(declare-fun noDuplicate!1128 (List!13304) Bool)

(assert (=> b!704635 (= res!468432 (noDuplicate!1128 acc!652))))

(declare-fun b!704636 () Bool)

(declare-fun res!468435 () Bool)

(assert (=> b!704636 (=> (not res!468435) (not e!397741))))

(assert (=> b!704636 (= res!468435 (contains!3881 newAcc!49 k!2824))))

(declare-fun b!704637 () Bool)

(declare-fun res!468434 () Bool)

(assert (=> b!704637 (=> (not res!468434) (not e!397741))))

(assert (=> b!704637 (= res!468434 (noDuplicate!1128 newAcc!49))))

(assert (= (and start!62534 res!468436) b!704635))

(assert (= (and b!704635 res!468432) b!704637))

(assert (= (and b!704637 res!468434) b!704634))

(assert (= (and b!704634 res!468442) b!704632))

(assert (= (and b!704632 res!468443) b!704630))

(assert (= (and b!704630 res!468444) b!704621))

(assert (= (and b!704621 res!468437) b!704627))

(assert (= (and b!704627 res!468440) b!704622))

(assert (= (and b!704622 res!468441) b!704620))

(assert (= (and b!704620 res!468445) b!704636))

(assert (= (and b!704636 res!468435) b!704625))

(assert (= (and b!704625 res!468446) b!704631))

(assert (= (and b!704631 res!468433) b!704623))

(assert (= (and b!704623 res!468447) b!704624))

(assert (= (and b!704624 res!468439) b!704629))

(assert (= (and b!704629 res!468431) b!704626))

(assert (= (and b!704626 res!468438) b!704633))

(assert (= (and b!704633 res!468430) b!704628))

(declare-fun m!663055 () Bool)

(assert (=> b!704629 m!663055))

(assert (=> b!704629 m!663055))

(declare-fun m!663057 () Bool)

(assert (=> b!704629 m!663057))

(declare-fun m!663059 () Bool)

(assert (=> b!704628 m!663059))

(declare-fun m!663061 () Bool)

(assert (=> b!704636 m!663061))

(declare-fun m!663063 () Bool)

(assert (=> b!704631 m!663063))

(declare-fun m!663065 () Bool)

(assert (=> b!704621 m!663065))

(declare-fun m!663067 () Bool)

(assert (=> b!704622 m!663067))

(declare-fun m!663069 () Bool)

(assert (=> b!704623 m!663069))

(declare-fun m!663071 () Bool)

(assert (=> b!704637 m!663071))

(declare-fun m!663073 () Bool)

(assert (=> b!704632 m!663073))

(declare-fun m!663075 () Bool)

(assert (=> b!704630 m!663075))

(declare-fun m!663077 () Bool)

(assert (=> start!62534 m!663077))

(declare-fun m!663079 () Bool)

(assert (=> b!704633 m!663079))

(declare-fun m!663081 () Bool)

(assert (=> b!704634 m!663081))

(declare-fun m!663083 () Bool)

(assert (=> b!704627 m!663083))

(declare-fun m!663085 () Bool)

(assert (=> b!704625 m!663085))

(declare-fun m!663087 () Bool)

(assert (=> b!704620 m!663087))

(declare-fun m!663089 () Bool)

(assert (=> b!704635 m!663089))

(push 1)

(assert (not b!704631))

(assert (not b!704630))

(assert (not b!704622))

(assert (not b!704621))

(assert (not b!704625))

(assert (not b!704628))

(assert (not b!704635))

(assert (not b!704634))

(assert (not b!704623))

(assert (not b!704627))

(assert (not b!704633))

(assert (not b!704637))

(assert (not b!704632))

(assert (not b!704636))

(assert (not start!62534))

(assert (not b!704620))

(assert (not b!704629))

(check-sat)

