; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60290 () Bool)

(assert start!60290)

(declare-fun b!676534 () Bool)

(declare-fun res!442962 () Bool)

(declare-fun e!385824 () Bool)

(assert (=> b!676534 (=> (not res!442962) (not e!385824))))

(declare-datatypes ((array!39337 0))(
  ( (array!39338 (arr!18861 (Array (_ BitVec 32) (_ BitVec 64))) (size!19225 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39337)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12902 0))(
  ( (Nil!12899) (Cons!12898 (h!13943 (_ BitVec 64)) (t!19130 List!12902)) )
))
(declare-fun acc!681 () List!12902)

(declare-fun arrayNoDuplicates!0 (array!39337 (_ BitVec 32) List!12902) Bool)

(assert (=> b!676534 (= res!442962 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676535 () Bool)

(declare-fun e!385823 () Bool)

(declare-fun e!385826 () Bool)

(assert (=> b!676535 (= e!385823 e!385826)))

(declare-fun res!442973 () Bool)

(assert (=> b!676535 (=> (not res!442973) (not e!385826))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676535 (= res!442973 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676536 () Bool)

(declare-fun res!442979 () Bool)

(assert (=> b!676536 (=> (not res!442979) (not e!385824))))

(assert (=> b!676536 (= res!442979 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12899))))

(declare-fun b!676537 () Bool)

(assert (=> b!676537 (= e!385824 false)))

(declare-fun lt!312781 () Bool)

(assert (=> b!676537 (= lt!312781 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676538 () Bool)

(declare-fun res!442969 () Bool)

(assert (=> b!676538 (=> (not res!442969) (not e!385824))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676538 (= res!442969 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676539 () Bool)

(declare-fun res!442971 () Bool)

(assert (=> b!676539 (=> (not res!442971) (not e!385824))))

(declare-fun contains!3479 (List!12902 (_ BitVec 64)) Bool)

(assert (=> b!676539 (= res!442971 (not (contains!3479 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676540 () Bool)

(declare-fun res!442960 () Bool)

(assert (=> b!676540 (=> (not res!442960) (not e!385824))))

(declare-fun e!385830 () Bool)

(assert (=> b!676540 (= res!442960 e!385830)))

(declare-fun res!442965 () Bool)

(assert (=> b!676540 (=> res!442965 e!385830)))

(declare-fun e!385827 () Bool)

(assert (=> b!676540 (= res!442965 e!385827)))

(declare-fun res!442963 () Bool)

(assert (=> b!676540 (=> (not res!442963) (not e!385827))))

(assert (=> b!676540 (= res!442963 (bvsgt from!3004 i!1382))))

(declare-fun b!676541 () Bool)

(declare-fun e!385829 () Bool)

(assert (=> b!676541 (= e!385829 (contains!3479 acc!681 k!2843))))

(declare-fun b!676542 () Bool)

(declare-fun res!442974 () Bool)

(assert (=> b!676542 (=> (not res!442974) (not e!385824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676542 (= res!442974 (not (validKeyInArray!0 (select (arr!18861 a!3626) from!3004))))))

(declare-fun b!676543 () Bool)

(declare-fun e!385828 () Bool)

(assert (=> b!676543 (= e!385830 e!385828)))

(declare-fun res!442968 () Bool)

(assert (=> b!676543 (=> (not res!442968) (not e!385828))))

(assert (=> b!676543 (= res!442968 (bvsle from!3004 i!1382))))

(declare-fun b!676544 () Bool)

(declare-fun res!442966 () Bool)

(assert (=> b!676544 (=> (not res!442966) (not e!385824))))

(assert (=> b!676544 (= res!442966 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun res!442977 () Bool)

(assert (=> start!60290 (=> (not res!442977) (not e!385824))))

(assert (=> start!60290 (= res!442977 (and (bvslt (size!19225 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19225 a!3626))))))

(assert (=> start!60290 e!385824))

(assert (=> start!60290 true))

(declare-fun array_inv!14657 (array!39337) Bool)

(assert (=> start!60290 (array_inv!14657 a!3626)))

(declare-fun b!676545 () Bool)

(declare-fun res!442967 () Bool)

(assert (=> b!676545 (=> (not res!442967) (not e!385824))))

(declare-fun noDuplicate!726 (List!12902) Bool)

(assert (=> b!676545 (= res!442967 (noDuplicate!726 acc!681))))

(declare-fun b!676546 () Bool)

(assert (=> b!676546 (= e!385828 (not (contains!3479 acc!681 k!2843)))))

(declare-fun b!676547 () Bool)

(assert (=> b!676547 (= e!385826 (not (contains!3479 acc!681 k!2843)))))

(declare-fun b!676548 () Bool)

(declare-fun res!442972 () Bool)

(assert (=> b!676548 (=> (not res!442972) (not e!385824))))

(assert (=> b!676548 (= res!442972 e!385823)))

(declare-fun res!442975 () Bool)

(assert (=> b!676548 (=> res!442975 e!385823)))

(assert (=> b!676548 (= res!442975 e!385829)))

(declare-fun res!442978 () Bool)

(assert (=> b!676548 (=> (not res!442978) (not e!385829))))

(assert (=> b!676548 (= res!442978 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676549 () Bool)

(declare-fun res!442961 () Bool)

(assert (=> b!676549 (=> (not res!442961) (not e!385824))))

(assert (=> b!676549 (= res!442961 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19225 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676550 () Bool)

(declare-fun res!442964 () Bool)

(assert (=> b!676550 (=> (not res!442964) (not e!385824))))

(assert (=> b!676550 (= res!442964 (not (contains!3479 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676551 () Bool)

(declare-fun res!442976 () Bool)

(assert (=> b!676551 (=> (not res!442976) (not e!385824))))

(assert (=> b!676551 (= res!442976 (validKeyInArray!0 k!2843))))

(declare-fun b!676552 () Bool)

(declare-fun res!442970 () Bool)

(assert (=> b!676552 (=> (not res!442970) (not e!385824))))

(assert (=> b!676552 (= res!442970 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19225 a!3626))))))

(declare-fun b!676553 () Bool)

(assert (=> b!676553 (= e!385827 (contains!3479 acc!681 k!2843))))

(assert (= (and start!60290 res!442977) b!676545))

(assert (= (and b!676545 res!442967) b!676539))

(assert (= (and b!676539 res!442971) b!676550))

(assert (= (and b!676550 res!442964) b!676540))

(assert (= (and b!676540 res!442963) b!676553))

(assert (= (and b!676540 (not res!442965)) b!676543))

(assert (= (and b!676543 res!442968) b!676546))

(assert (= (and b!676540 res!442960) b!676536))

(assert (= (and b!676536 res!442979) b!676534))

(assert (= (and b!676534 res!442962) b!676552))

(assert (= (and b!676552 res!442970) b!676551))

(assert (= (and b!676551 res!442976) b!676538))

(assert (= (and b!676538 res!442969) b!676549))

(assert (= (and b!676549 res!442961) b!676542))

(assert (= (and b!676542 res!442974) b!676544))

(assert (= (and b!676544 res!442966) b!676548))

(assert (= (and b!676548 res!442978) b!676541))

(assert (= (and b!676548 (not res!442975)) b!676535))

(assert (= (and b!676535 res!442973) b!676547))

(assert (= (and b!676548 res!442972) b!676537))

(declare-fun m!643331 () Bool)

(assert (=> b!676545 m!643331))

(declare-fun m!643333 () Bool)

(assert (=> b!676553 m!643333))

(declare-fun m!643335 () Bool)

(assert (=> b!676542 m!643335))

(assert (=> b!676542 m!643335))

(declare-fun m!643337 () Bool)

(assert (=> b!676542 m!643337))

(declare-fun m!643339 () Bool)

(assert (=> b!676538 m!643339))

(assert (=> b!676546 m!643333))

(declare-fun m!643341 () Bool)

(assert (=> start!60290 m!643341))

(declare-fun m!643343 () Bool)

(assert (=> b!676551 m!643343))

(declare-fun m!643345 () Bool)

(assert (=> b!676550 m!643345))

(declare-fun m!643347 () Bool)

(assert (=> b!676534 m!643347))

(declare-fun m!643349 () Bool)

(assert (=> b!676536 m!643349))

(assert (=> b!676541 m!643333))

(declare-fun m!643351 () Bool)

(assert (=> b!676539 m!643351))

(declare-fun m!643353 () Bool)

(assert (=> b!676537 m!643353))

(assert (=> b!676547 m!643333))

(push 1)

(assert (not b!676553))

(assert (not b!676542))

(assert (not b!676536))

(assert (not b!676550))

(assert (not b!676546))

(assert (not b!676537))

(assert (not b!676547))

(assert (not b!676538))

(assert (not start!60290))

(assert (not b!676539))

(assert (not b!676534))

(assert (not b!676551))

(assert (not b!676541))

(assert (not b!676545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

