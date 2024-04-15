; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60282 () Bool)

(assert start!60282)

(declare-fun b!676358 () Bool)

(declare-fun e!385688 () Bool)

(declare-fun e!385685 () Bool)

(assert (=> b!676358 (= e!385688 e!385685)))

(declare-fun res!442950 () Bool)

(assert (=> b!676358 (=> (not res!442950) (not e!385685))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676358 (= res!442950 (bvsle from!3004 i!1382))))

(declare-fun b!676359 () Bool)

(declare-datatypes ((List!12942 0))(
  ( (Nil!12939) (Cons!12938 (h!13983 (_ BitVec 64)) (t!19161 List!12942)) )
))
(declare-fun acc!681 () List!12942)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3464 (List!12942 (_ BitVec 64)) Bool)

(assert (=> b!676359 (= e!385685 (not (contains!3464 acc!681 k!2843)))))

(declare-fun b!676360 () Bool)

(declare-fun res!442953 () Bool)

(declare-fun e!385682 () Bool)

(assert (=> b!676360 (=> (not res!442953) (not e!385682))))

(declare-datatypes ((array!39340 0))(
  ( (array!39341 (arr!18862 (Array (_ BitVec 32) (_ BitVec 64))) (size!19227 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39340)

(assert (=> b!676360 (= res!442953 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19227 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676361 () Bool)

(declare-fun e!385686 () Bool)

(assert (=> b!676361 (= e!385686 (contains!3464 acc!681 k!2843))))

(declare-fun res!442958 () Bool)

(assert (=> start!60282 (=> (not res!442958) (not e!385682))))

(assert (=> start!60282 (= res!442958 (and (bvslt (size!19227 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19227 a!3626))))))

(assert (=> start!60282 e!385682))

(assert (=> start!60282 true))

(declare-fun array_inv!14745 (array!39340) Bool)

(assert (=> start!60282 (array_inv!14745 a!3626)))

(declare-fun b!676362 () Bool)

(declare-fun res!442948 () Bool)

(assert (=> b!676362 (=> (not res!442948) (not e!385682))))

(assert (=> b!676362 (= res!442948 e!385688)))

(declare-fun res!442957 () Bool)

(assert (=> b!676362 (=> res!442957 e!385688)))

(assert (=> b!676362 (= res!442957 e!385686)))

(declare-fun res!442956 () Bool)

(assert (=> b!676362 (=> (not res!442956) (not e!385686))))

(assert (=> b!676362 (= res!442956 (bvsgt from!3004 i!1382))))

(declare-fun b!676363 () Bool)

(declare-fun e!385683 () Bool)

(assert (=> b!676363 (= e!385683 (not (contains!3464 acc!681 k!2843)))))

(declare-fun b!676364 () Bool)

(declare-fun res!442959 () Bool)

(assert (=> b!676364 (=> (not res!442959) (not e!385682))))

(assert (=> b!676364 (= res!442959 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19227 a!3626))))))

(declare-fun b!676365 () Bool)

(declare-fun e!385687 () Bool)

(assert (=> b!676365 (= e!385687 (contains!3464 acc!681 k!2843))))

(declare-fun b!676366 () Bool)

(declare-fun res!442949 () Bool)

(assert (=> b!676366 (=> (not res!442949) (not e!385682))))

(declare-fun arrayNoDuplicates!0 (array!39340 (_ BitVec 32) List!12942) Bool)

(assert (=> b!676366 (= res!442949 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676367 () Bool)

(declare-fun res!442945 () Bool)

(assert (=> b!676367 (=> (not res!442945) (not e!385682))))

(assert (=> b!676367 (= res!442945 (not (contains!3464 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676368 () Bool)

(declare-fun res!442962 () Bool)

(assert (=> b!676368 (=> (not res!442962) (not e!385682))))

(declare-fun noDuplicate!733 (List!12942) Bool)

(assert (=> b!676368 (= res!442962 (noDuplicate!733 acc!681))))

(declare-fun b!676369 () Bool)

(declare-fun res!442946 () Bool)

(assert (=> b!676369 (=> (not res!442946) (not e!385682))))

(assert (=> b!676369 (= res!442946 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12939))))

(declare-fun b!676370 () Bool)

(assert (=> b!676370 (= e!385682 false)))

(declare-fun lt!312531 () Bool)

(assert (=> b!676370 (= lt!312531 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676371 () Bool)

(declare-fun e!385684 () Bool)

(assert (=> b!676371 (= e!385684 e!385683)))

(declare-fun res!442952 () Bool)

(assert (=> b!676371 (=> (not res!442952) (not e!385683))))

(assert (=> b!676371 (= res!442952 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676372 () Bool)

(declare-fun res!442944 () Bool)

(assert (=> b!676372 (=> (not res!442944) (not e!385682))))

(assert (=> b!676372 (= res!442944 (not (contains!3464 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676373 () Bool)

(declare-fun res!442947 () Bool)

(assert (=> b!676373 (=> (not res!442947) (not e!385682))))

(assert (=> b!676373 (= res!442947 e!385684)))

(declare-fun res!442963 () Bool)

(assert (=> b!676373 (=> res!442963 e!385684)))

(assert (=> b!676373 (= res!442963 e!385687)))

(declare-fun res!442951 () Bool)

(assert (=> b!676373 (=> (not res!442951) (not e!385687))))

(assert (=> b!676373 (= res!442951 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676374 () Bool)

(declare-fun res!442961 () Bool)

(assert (=> b!676374 (=> (not res!442961) (not e!385682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676374 (= res!442961 (not (validKeyInArray!0 (select (arr!18862 a!3626) from!3004))))))

(declare-fun b!676375 () Bool)

(declare-fun res!442960 () Bool)

(assert (=> b!676375 (=> (not res!442960) (not e!385682))))

(assert (=> b!676375 (= res!442960 (validKeyInArray!0 k!2843))))

(declare-fun b!676376 () Bool)

(declare-fun res!442955 () Bool)

(assert (=> b!676376 (=> (not res!442955) (not e!385682))))

(assert (=> b!676376 (= res!442955 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676377 () Bool)

(declare-fun res!442954 () Bool)

(assert (=> b!676377 (=> (not res!442954) (not e!385682))))

(declare-fun arrayContainsKey!0 (array!39340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676377 (= res!442954 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60282 res!442958) b!676368))

(assert (= (and b!676368 res!442962) b!676367))

(assert (= (and b!676367 res!442945) b!676372))

(assert (= (and b!676372 res!442944) b!676362))

(assert (= (and b!676362 res!442956) b!676361))

(assert (= (and b!676362 (not res!442957)) b!676358))

(assert (= (and b!676358 res!442950) b!676359))

(assert (= (and b!676362 res!442948) b!676369))

(assert (= (and b!676369 res!442946) b!676366))

(assert (= (and b!676366 res!442949) b!676364))

(assert (= (and b!676364 res!442959) b!676375))

(assert (= (and b!676375 res!442960) b!676377))

(assert (= (and b!676377 res!442954) b!676360))

(assert (= (and b!676360 res!442953) b!676374))

(assert (= (and b!676374 res!442961) b!676376))

(assert (= (and b!676376 res!442955) b!676373))

(assert (= (and b!676373 res!442951) b!676365))

(assert (= (and b!676373 (not res!442963)) b!676371))

(assert (= (and b!676371 res!442952) b!676363))

(assert (= (and b!676373 res!442947) b!676370))

(declare-fun m!642597 () Bool)

(assert (=> b!676366 m!642597))

(declare-fun m!642599 () Bool)

(assert (=> b!676372 m!642599))

(declare-fun m!642601 () Bool)

(assert (=> b!676375 m!642601))

(declare-fun m!642603 () Bool)

(assert (=> b!676365 m!642603))

(declare-fun m!642605 () Bool)

(assert (=> b!676374 m!642605))

(assert (=> b!676374 m!642605))

(declare-fun m!642607 () Bool)

(assert (=> b!676374 m!642607))

(assert (=> b!676363 m!642603))

(declare-fun m!642609 () Bool)

(assert (=> start!60282 m!642609))

(declare-fun m!642611 () Bool)

(assert (=> b!676368 m!642611))

(declare-fun m!642613 () Bool)

(assert (=> b!676367 m!642613))

(assert (=> b!676361 m!642603))

(declare-fun m!642615 () Bool)

(assert (=> b!676369 m!642615))

(declare-fun m!642617 () Bool)

(assert (=> b!676370 m!642617))

(assert (=> b!676359 m!642603))

(declare-fun m!642619 () Bool)

(assert (=> b!676377 m!642619))

(push 1)

(assert (not b!676369))

(assert (not b!676366))

(assert (not b!676365))

(assert (not b!676377))

(assert (not b!676370))

(assert (not b!676359))

(assert (not b!676363))

(assert (not start!60282))

(assert (not b!676367))

(assert (not b!676368))

(assert (not b!676372))

(assert (not b!676375))

(assert (not b!676374))

(assert (not b!676361))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

