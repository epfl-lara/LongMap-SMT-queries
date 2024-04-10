; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59930 () Bool)

(assert start!59930)

(declare-fun b!664002 () Bool)

(declare-fun e!380895 () Bool)

(declare-datatypes ((List!12722 0))(
  ( (Nil!12719) (Cons!12718 (h!13763 (_ BitVec 64)) (t!18950 List!12722)) )
))
(declare-fun acc!681 () List!12722)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3299 (List!12722 (_ BitVec 64)) Bool)

(assert (=> b!664002 (= e!380895 (contains!3299 acc!681 k!2843))))

(declare-fun b!664003 () Bool)

(declare-fun res!431777 () Bool)

(declare-fun e!380892 () Bool)

(assert (=> b!664003 (=> (not res!431777) (not e!380892))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38977 0))(
  ( (array!38978 (arr!18681 (Array (_ BitVec 32) (_ BitVec 64))) (size!19045 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38977)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664003 (= res!431777 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19045 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664004 () Bool)

(declare-datatypes ((Unit!23130 0))(
  ( (Unit!23131) )
))
(declare-fun e!380891 () Unit!23130)

(declare-fun Unit!23132 () Unit!23130)

(assert (=> b!664004 (= e!380891 Unit!23132)))

(declare-fun b!664005 () Bool)

(declare-fun res!431778 () Bool)

(assert (=> b!664005 (=> (not res!431778) (not e!380892))))

(assert (=> b!664005 (= res!431778 (not (contains!3299 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664006 () Bool)

(declare-fun e!380890 () Bool)

(assert (=> b!664006 (= e!380890 (not (contains!3299 acc!681 k!2843)))))

(declare-fun b!664007 () Bool)

(declare-fun e!380894 () Bool)

(assert (=> b!664007 (= e!380894 e!380890)))

(declare-fun res!431783 () Bool)

(assert (=> b!664007 (=> (not res!431783) (not e!380890))))

(assert (=> b!664007 (= res!431783 (bvsle from!3004 i!1382))))

(declare-fun b!664008 () Bool)

(declare-fun res!431782 () Bool)

(assert (=> b!664008 (=> (not res!431782) (not e!380892))))

(declare-fun arrayContainsKey!0 (array!38977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664008 (= res!431782 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!431779 () Bool)

(assert (=> start!59930 (=> (not res!431779) (not e!380892))))

(assert (=> start!59930 (= res!431779 (and (bvslt (size!19045 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19045 a!3626))))))

(assert (=> start!59930 e!380892))

(assert (=> start!59930 true))

(declare-fun array_inv!14477 (array!38977) Bool)

(assert (=> start!59930 (array_inv!14477 a!3626)))

(declare-fun b!664009 () Bool)

(declare-fun res!431776 () Bool)

(assert (=> b!664009 (=> (not res!431776) (not e!380892))))

(assert (=> b!664009 (= res!431776 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19045 a!3626))))))

(declare-fun b!664010 () Bool)

(declare-fun e!380893 () Unit!23130)

(declare-fun Unit!23133 () Unit!23130)

(assert (=> b!664010 (= e!380893 Unit!23133)))

(declare-fun lt!309448 () Unit!23130)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38977 (_ BitVec 64) (_ BitVec 32)) Unit!23130)

(assert (=> b!664010 (= lt!309448 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664010 false))

(declare-fun b!664011 () Bool)

(declare-fun res!431772 () Bool)

(assert (=> b!664011 (=> (not res!431772) (not e!380892))))

(declare-fun arrayNoDuplicates!0 (array!38977 (_ BitVec 32) List!12722) Bool)

(assert (=> b!664011 (= res!431772 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12719))))

(declare-fun b!664012 () Bool)

(declare-fun res!431770 () Bool)

(assert (=> b!664012 (=> (not res!431770) (not e!380892))))

(declare-fun noDuplicate!546 (List!12722) Bool)

(assert (=> b!664012 (= res!431770 (noDuplicate!546 acc!681))))

(declare-fun b!664013 () Bool)

(declare-fun Unit!23134 () Unit!23130)

(assert (=> b!664013 (= e!380893 Unit!23134)))

(declare-fun b!664014 () Bool)

(declare-fun lt!309446 () Unit!23130)

(assert (=> b!664014 (= e!380891 lt!309446)))

(declare-fun lt!309447 () Unit!23130)

(declare-fun lemmaListSubSeqRefl!0 (List!12722) Unit!23130)

(assert (=> b!664014 (= lt!309447 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!38 (List!12722 List!12722) Bool)

(assert (=> b!664014 (subseq!38 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38977 List!12722 List!12722 (_ BitVec 32)) Unit!23130)

(declare-fun $colon$colon!170 (List!12722 (_ BitVec 64)) List!12722)

(assert (=> b!664014 (= lt!309446 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!170 acc!681 (select (arr!18681 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664014 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664015 () Bool)

(declare-fun res!431780 () Bool)

(assert (=> b!664015 (=> (not res!431780) (not e!380892))))

(assert (=> b!664015 (= res!431780 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664016 () Bool)

(declare-fun res!431774 () Bool)

(assert (=> b!664016 (=> (not res!431774) (not e!380892))))

(assert (=> b!664016 (= res!431774 e!380894)))

(declare-fun res!431771 () Bool)

(assert (=> b!664016 (=> res!431771 e!380894)))

(assert (=> b!664016 (= res!431771 e!380895)))

(declare-fun res!431773 () Bool)

(assert (=> b!664016 (=> (not res!431773) (not e!380895))))

(assert (=> b!664016 (= res!431773 (bvsgt from!3004 i!1382))))

(declare-fun b!664017 () Bool)

(declare-fun res!431781 () Bool)

(assert (=> b!664017 (=> (not res!431781) (not e!380892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664017 (= res!431781 (validKeyInArray!0 k!2843))))

(declare-fun b!664018 () Bool)

(declare-fun res!431775 () Bool)

(assert (=> b!664018 (=> (not res!431775) (not e!380892))))

(assert (=> b!664018 (= res!431775 (not (contains!3299 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664019 () Bool)

(assert (=> b!664019 (= e!380892 (not true))))

(declare-fun lt!309449 () Bool)

(assert (=> b!664019 (= lt!309449 (contains!3299 acc!681 k!2843))))

(assert (=> b!664019 (subseq!38 acc!681 acc!681)))

(declare-fun lt!309445 () Unit!23130)

(assert (=> b!664019 (= lt!309445 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664019 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309450 () Unit!23130)

(assert (=> b!664019 (= lt!309450 e!380891)))

(declare-fun c!76483 () Bool)

(assert (=> b!664019 (= c!76483 (validKeyInArray!0 (select (arr!18681 a!3626) from!3004)))))

(declare-fun lt!309451 () Unit!23130)

(assert (=> b!664019 (= lt!309451 e!380893)))

(declare-fun c!76484 () Bool)

(assert (=> b!664019 (= c!76484 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664019 (arrayContainsKey!0 (array!38978 (store (arr!18681 a!3626) i!1382 k!2843) (size!19045 a!3626)) k!2843 from!3004)))

(assert (= (and start!59930 res!431779) b!664012))

(assert (= (and b!664012 res!431770) b!664018))

(assert (= (and b!664018 res!431775) b!664005))

(assert (= (and b!664005 res!431778) b!664016))

(assert (= (and b!664016 res!431773) b!664002))

(assert (= (and b!664016 (not res!431771)) b!664007))

(assert (= (and b!664007 res!431783) b!664006))

(assert (= (and b!664016 res!431774) b!664011))

(assert (= (and b!664011 res!431772) b!664015))

(assert (= (and b!664015 res!431780) b!664009))

(assert (= (and b!664009 res!431776) b!664017))

(assert (= (and b!664017 res!431781) b!664008))

(assert (= (and b!664008 res!431782) b!664003))

(assert (= (and b!664003 res!431777) b!664019))

(assert (= (and b!664019 c!76484) b!664010))

(assert (= (and b!664019 (not c!76484)) b!664013))

(assert (= (and b!664019 c!76483) b!664014))

(assert (= (and b!664019 (not c!76483)) b!664004))

(declare-fun m!635429 () Bool)

(assert (=> b!664006 m!635429))

(declare-fun m!635431 () Bool)

(assert (=> b!664018 m!635431))

(declare-fun m!635433 () Bool)

(assert (=> b!664015 m!635433))

(declare-fun m!635435 () Bool)

(assert (=> b!664017 m!635435))

(declare-fun m!635437 () Bool)

(assert (=> b!664019 m!635437))

(declare-fun m!635439 () Bool)

(assert (=> b!664019 m!635439))

(assert (=> b!664019 m!635429))

(declare-fun m!635441 () Bool)

(assert (=> b!664019 m!635441))

(declare-fun m!635443 () Bool)

(assert (=> b!664019 m!635443))

(declare-fun m!635445 () Bool)

(assert (=> b!664019 m!635445))

(assert (=> b!664019 m!635439))

(declare-fun m!635447 () Bool)

(assert (=> b!664019 m!635447))

(declare-fun m!635449 () Bool)

(assert (=> b!664019 m!635449))

(declare-fun m!635451 () Bool)

(assert (=> b!664019 m!635451))

(assert (=> b!664002 m!635429))

(declare-fun m!635453 () Bool)

(assert (=> b!664011 m!635453))

(assert (=> b!664014 m!635437))

(assert (=> b!664014 m!635439))

(declare-fun m!635455 () Bool)

(assert (=> b!664014 m!635455))

(declare-fun m!635457 () Bool)

(assert (=> b!664014 m!635457))

(assert (=> b!664014 m!635439))

(assert (=> b!664014 m!635455))

(assert (=> b!664014 m!635443))

(assert (=> b!664014 m!635451))

(declare-fun m!635459 () Bool)

(assert (=> b!664012 m!635459))

(declare-fun m!635461 () Bool)

(assert (=> start!59930 m!635461))

(declare-fun m!635463 () Bool)

(assert (=> b!664005 m!635463))

(declare-fun m!635465 () Bool)

(assert (=> b!664008 m!635465))

(declare-fun m!635467 () Bool)

(assert (=> b!664010 m!635467))

(push 1)

(assert (not start!59930))

(assert (not b!664008))

(assert (not b!664018))

(assert (not b!664012))

(assert (not b!664014))

(assert (not b!664005))

(assert (not b!664017))

(assert (not b!664015))

(assert (not b!664006))

(assert (not b!664010))

(assert (not b!664011))

(assert (not b!664019))

(assert (not b!664002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

