; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59910 () Bool)

(assert start!59910)

(declare-fun b!663462 () Bool)

(declare-fun res!431361 () Bool)

(declare-fun e!380685 () Bool)

(assert (=> b!663462 (=> (not res!431361) (not e!380685))))

(declare-datatypes ((array!38957 0))(
  ( (array!38958 (arr!18671 (Array (_ BitVec 32) (_ BitVec 64))) (size!19035 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38957)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12712 0))(
  ( (Nil!12709) (Cons!12708 (h!13753 (_ BitVec 64)) (t!18940 List!12712)) )
))
(declare-fun acc!681 () List!12712)

(declare-fun arrayNoDuplicates!0 (array!38957 (_ BitVec 32) List!12712) Bool)

(assert (=> b!663462 (= res!431361 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663464 () Bool)

(declare-fun res!431355 () Bool)

(assert (=> b!663464 (=> (not res!431355) (not e!380685))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663464 (= res!431355 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19035 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663465 () Bool)

(declare-datatypes ((Unit!23080 0))(
  ( (Unit!23081) )
))
(declare-fun e!380682 () Unit!23080)

(declare-fun Unit!23082 () Unit!23080)

(assert (=> b!663465 (= e!380682 Unit!23082)))

(declare-fun b!663466 () Bool)

(declare-fun res!431357 () Bool)

(assert (=> b!663466 (=> (not res!431357) (not e!380685))))

(declare-fun e!380683 () Bool)

(assert (=> b!663466 (= res!431357 e!380683)))

(declare-fun res!431354 () Bool)

(assert (=> b!663466 (=> res!431354 e!380683)))

(declare-fun e!380681 () Bool)

(assert (=> b!663466 (= res!431354 e!380681)))

(declare-fun res!431363 () Bool)

(assert (=> b!663466 (=> (not res!431363) (not e!380681))))

(assert (=> b!663466 (= res!431363 (bvsgt from!3004 i!1382))))

(declare-fun b!663467 () Bool)

(declare-fun res!431353 () Bool)

(assert (=> b!663467 (=> (not res!431353) (not e!380685))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663467 (= res!431353 (validKeyInArray!0 k!2843))))

(declare-fun b!663468 () Bool)

(declare-fun lt!309295 () Unit!23080)

(assert (=> b!663468 (= e!380682 lt!309295)))

(declare-fun lt!309293 () Unit!23080)

(declare-fun lemmaListSubSeqRefl!0 (List!12712) Unit!23080)

(assert (=> b!663468 (= lt!309293 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!28 (List!12712 List!12712) Bool)

(assert (=> b!663468 (subseq!28 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38957 List!12712 List!12712 (_ BitVec 32)) Unit!23080)

(declare-fun $colon$colon!160 (List!12712 (_ BitVec 64)) List!12712)

(assert (=> b!663468 (= lt!309295 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!160 acc!681 (select (arr!18671 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663468 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663469 () Bool)

(declare-fun e!380684 () Bool)

(assert (=> b!663469 (= e!380683 e!380684)))

(declare-fun res!431356 () Bool)

(assert (=> b!663469 (=> (not res!431356) (not e!380684))))

(assert (=> b!663469 (= res!431356 (bvsle from!3004 i!1382))))

(declare-fun b!663470 () Bool)

(declare-fun res!431359 () Bool)

(assert (=> b!663470 (=> (not res!431359) (not e!380685))))

(declare-fun contains!3289 (List!12712 (_ BitVec 64)) Bool)

(assert (=> b!663470 (= res!431359 (not (contains!3289 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663471 () Bool)

(declare-fun res!431358 () Bool)

(assert (=> b!663471 (=> (not res!431358) (not e!380685))))

(declare-fun arrayContainsKey!0 (array!38957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663471 (= res!431358 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663472 () Bool)

(declare-fun res!431362 () Bool)

(assert (=> b!663472 (=> (not res!431362) (not e!380685))))

(assert (=> b!663472 (= res!431362 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19035 a!3626))))))

(declare-fun b!663473 () Bool)

(declare-fun res!431352 () Bool)

(assert (=> b!663473 (=> (not res!431352) (not e!380685))))

(assert (=> b!663473 (= res!431352 (not (contains!3289 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663474 () Bool)

(declare-fun res!431360 () Bool)

(assert (=> b!663474 (=> (not res!431360) (not e!380685))))

(declare-fun noDuplicate!536 (List!12712) Bool)

(assert (=> b!663474 (= res!431360 (noDuplicate!536 acc!681))))

(declare-fun b!663475 () Bool)

(assert (=> b!663475 (= e!380684 (not (contains!3289 acc!681 k!2843)))))

(declare-fun res!431350 () Bool)

(assert (=> start!59910 (=> (not res!431350) (not e!380685))))

(assert (=> start!59910 (= res!431350 (and (bvslt (size!19035 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19035 a!3626))))))

(assert (=> start!59910 e!380685))

(assert (=> start!59910 true))

(declare-fun array_inv!14467 (array!38957) Bool)

(assert (=> start!59910 (array_inv!14467 a!3626)))

(declare-fun b!663463 () Bool)

(assert (=> b!663463 (= e!380685 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!309292 () Unit!23080)

(assert (=> b!663463 (= lt!309292 e!380682)))

(declare-fun c!76423 () Bool)

(assert (=> b!663463 (= c!76423 (validKeyInArray!0 (select (arr!18671 a!3626) from!3004)))))

(declare-fun lt!309294 () Unit!23080)

(declare-fun e!380680 () Unit!23080)

(assert (=> b!663463 (= lt!309294 e!380680)))

(declare-fun c!76424 () Bool)

(assert (=> b!663463 (= c!76424 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663463 (arrayContainsKey!0 (array!38958 (store (arr!18671 a!3626) i!1382 k!2843) (size!19035 a!3626)) k!2843 from!3004)))

(declare-fun b!663476 () Bool)

(declare-fun Unit!23083 () Unit!23080)

(assert (=> b!663476 (= e!380680 Unit!23083)))

(declare-fun lt!309291 () Unit!23080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38957 (_ BitVec 64) (_ BitVec 32)) Unit!23080)

(assert (=> b!663476 (= lt!309291 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663476 false))

(declare-fun b!663477 () Bool)

(declare-fun Unit!23084 () Unit!23080)

(assert (=> b!663477 (= e!380680 Unit!23084)))

(declare-fun b!663478 () Bool)

(assert (=> b!663478 (= e!380681 (contains!3289 acc!681 k!2843))))

(declare-fun b!663479 () Bool)

(declare-fun res!431351 () Bool)

(assert (=> b!663479 (=> (not res!431351) (not e!380685))))

(assert (=> b!663479 (= res!431351 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12709))))

(assert (= (and start!59910 res!431350) b!663474))

(assert (= (and b!663474 res!431360) b!663473))

(assert (= (and b!663473 res!431352) b!663470))

(assert (= (and b!663470 res!431359) b!663466))

(assert (= (and b!663466 res!431363) b!663478))

(assert (= (and b!663466 (not res!431354)) b!663469))

(assert (= (and b!663469 res!431356) b!663475))

(assert (= (and b!663466 res!431357) b!663479))

(assert (= (and b!663479 res!431351) b!663462))

(assert (= (and b!663462 res!431361) b!663472))

(assert (= (and b!663472 res!431362) b!663467))

(assert (= (and b!663467 res!431353) b!663471))

(assert (= (and b!663471 res!431358) b!663464))

(assert (= (and b!663464 res!431355) b!663463))

(assert (= (and b!663463 c!76424) b!663476))

(assert (= (and b!663463 (not c!76424)) b!663477))

(assert (= (and b!663463 c!76423) b!663468))

(assert (= (and b!663463 (not c!76423)) b!663465))

(declare-fun m!635029 () Bool)

(assert (=> start!59910 m!635029))

(declare-fun m!635031 () Bool)

(assert (=> b!663467 m!635031))

(declare-fun m!635033 () Bool)

(assert (=> b!663476 m!635033))

(declare-fun m!635035 () Bool)

(assert (=> b!663473 m!635035))

(declare-fun m!635037 () Bool)

(assert (=> b!663471 m!635037))

(declare-fun m!635039 () Bool)

(assert (=> b!663462 m!635039))

(declare-fun m!635041 () Bool)

(assert (=> b!663478 m!635041))

(assert (=> b!663475 m!635041))

(declare-fun m!635043 () Bool)

(assert (=> b!663474 m!635043))

(declare-fun m!635045 () Bool)

(assert (=> b!663463 m!635045))

(declare-fun m!635047 () Bool)

(assert (=> b!663463 m!635047))

(declare-fun m!635049 () Bool)

(assert (=> b!663463 m!635049))

(assert (=> b!663463 m!635045))

(declare-fun m!635051 () Bool)

(assert (=> b!663463 m!635051))

(declare-fun m!635053 () Bool)

(assert (=> b!663463 m!635053))

(declare-fun m!635055 () Bool)

(assert (=> b!663468 m!635055))

(assert (=> b!663468 m!635045))

(declare-fun m!635057 () Bool)

(assert (=> b!663468 m!635057))

(declare-fun m!635059 () Bool)

(assert (=> b!663468 m!635059))

(assert (=> b!663468 m!635045))

(assert (=> b!663468 m!635057))

(declare-fun m!635061 () Bool)

(assert (=> b!663468 m!635061))

(declare-fun m!635063 () Bool)

(assert (=> b!663468 m!635063))

(declare-fun m!635065 () Bool)

(assert (=> b!663470 m!635065))

(declare-fun m!635067 () Bool)

(assert (=> b!663479 m!635067))

(push 1)

