; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59918 () Bool)

(assert start!59918)

(declare-fun b!663678 () Bool)

(declare-datatypes ((Unit!23100 0))(
  ( (Unit!23101) )
))
(declare-fun e!380763 () Unit!23100)

(declare-fun Unit!23102 () Unit!23100)

(assert (=> b!663678 (= e!380763 Unit!23102)))

(declare-fun lt!309353 () Unit!23100)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!38965 0))(
  ( (array!38966 (arr!18675 (Array (_ BitVec 32) (_ BitVec 64))) (size!19039 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38965 (_ BitVec 64) (_ BitVec 32)) Unit!23100)

(assert (=> b!663678 (= lt!309353 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663678 false))

(declare-fun b!663679 () Bool)

(declare-fun res!431526 () Bool)

(declare-fun e!380765 () Bool)

(assert (=> b!663679 (=> (not res!431526) (not e!380765))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663679 (= res!431526 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19039 a!3626))))))

(declare-fun b!663680 () Bool)

(declare-fun res!431530 () Bool)

(assert (=> b!663680 (=> (not res!431530) (not e!380765))))

(declare-fun arrayContainsKey!0 (array!38965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663680 (= res!431530 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663681 () Bool)

(declare-fun e!380764 () Unit!23100)

(declare-fun lt!309351 () Unit!23100)

(assert (=> b!663681 (= e!380764 lt!309351)))

(declare-fun lt!309352 () Unit!23100)

(declare-datatypes ((List!12716 0))(
  ( (Nil!12713) (Cons!12712 (h!13757 (_ BitVec 64)) (t!18944 List!12716)) )
))
(declare-fun acc!681 () List!12716)

(declare-fun lemmaListSubSeqRefl!0 (List!12716) Unit!23100)

(assert (=> b!663681 (= lt!309352 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!32 (List!12716 List!12716) Bool)

(assert (=> b!663681 (subseq!32 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38965 List!12716 List!12716 (_ BitVec 32)) Unit!23100)

(declare-fun $colon$colon!164 (List!12716 (_ BitVec 64)) List!12716)

(assert (=> b!663681 (= lt!309351 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!164 acc!681 (select (arr!18675 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38965 (_ BitVec 32) List!12716) Bool)

(assert (=> b!663681 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663682 () Bool)

(declare-fun res!431524 () Bool)

(assert (=> b!663682 (=> (not res!431524) (not e!380765))))

(assert (=> b!663682 (= res!431524 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19039 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663683 () Bool)

(declare-fun res!431525 () Bool)

(assert (=> b!663683 (=> (not res!431525) (not e!380765))))

(declare-fun noDuplicate!540 (List!12716) Bool)

(assert (=> b!663683 (= res!431525 (noDuplicate!540 acc!681))))

(declare-fun b!663684 () Bool)

(declare-fun Unit!23103 () Unit!23100)

(assert (=> b!663684 (= e!380763 Unit!23103)))

(declare-fun b!663685 () Bool)

(declare-fun e!380766 () Bool)

(declare-fun e!380767 () Bool)

(assert (=> b!663685 (= e!380766 e!380767)))

(declare-fun res!431519 () Bool)

(assert (=> b!663685 (=> (not res!431519) (not e!380767))))

(assert (=> b!663685 (= res!431519 (bvsle from!3004 i!1382))))

(declare-fun b!663686 () Bool)

(assert (=> b!663686 (= e!380765 (not true))))

(declare-fun lt!309355 () Unit!23100)

(assert (=> b!663686 (= lt!309355 e!380764)))

(declare-fun c!76447 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663686 (= c!76447 (validKeyInArray!0 (select (arr!18675 a!3626) from!3004)))))

(declare-fun lt!309354 () Unit!23100)

(assert (=> b!663686 (= lt!309354 e!380763)))

(declare-fun c!76448 () Bool)

(assert (=> b!663686 (= c!76448 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663686 (arrayContainsKey!0 (array!38966 (store (arr!18675 a!3626) i!1382 k!2843) (size!19039 a!3626)) k!2843 from!3004)))

(declare-fun b!663687 () Bool)

(declare-fun Unit!23104 () Unit!23100)

(assert (=> b!663687 (= e!380764 Unit!23104)))

(declare-fun b!663688 () Bool)

(declare-fun contains!3293 (List!12716 (_ BitVec 64)) Bool)

(assert (=> b!663688 (= e!380767 (not (contains!3293 acc!681 k!2843)))))

(declare-fun b!663689 () Bool)

(declare-fun res!431518 () Bool)

(assert (=> b!663689 (=> (not res!431518) (not e!380765))))

(assert (=> b!663689 (= res!431518 e!380766)))

(declare-fun res!431527 () Bool)

(assert (=> b!663689 (=> res!431527 e!380766)))

(declare-fun e!380768 () Bool)

(assert (=> b!663689 (= res!431527 e!380768)))

(declare-fun res!431528 () Bool)

(assert (=> b!663689 (=> (not res!431528) (not e!380768))))

(assert (=> b!663689 (= res!431528 (bvsgt from!3004 i!1382))))

(declare-fun b!663690 () Bool)

(declare-fun res!431521 () Bool)

(assert (=> b!663690 (=> (not res!431521) (not e!380765))))

(assert (=> b!663690 (= res!431521 (not (contains!3293 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663691 () Bool)

(declare-fun res!431531 () Bool)

(assert (=> b!663691 (=> (not res!431531) (not e!380765))))

(assert (=> b!663691 (= res!431531 (validKeyInArray!0 k!2843))))

(declare-fun b!663692 () Bool)

(declare-fun res!431523 () Bool)

(assert (=> b!663692 (=> (not res!431523) (not e!380765))))

(assert (=> b!663692 (= res!431523 (not (contains!3293 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663693 () Bool)

(declare-fun res!431520 () Bool)

(assert (=> b!663693 (=> (not res!431520) (not e!380765))))

(assert (=> b!663693 (= res!431520 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!431529 () Bool)

(assert (=> start!59918 (=> (not res!431529) (not e!380765))))

(assert (=> start!59918 (= res!431529 (and (bvslt (size!19039 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19039 a!3626))))))

(assert (=> start!59918 e!380765))

(assert (=> start!59918 true))

(declare-fun array_inv!14471 (array!38965) Bool)

(assert (=> start!59918 (array_inv!14471 a!3626)))

(declare-fun b!663694 () Bool)

(declare-fun res!431522 () Bool)

(assert (=> b!663694 (=> (not res!431522) (not e!380765))))

(assert (=> b!663694 (= res!431522 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12713))))

(declare-fun b!663695 () Bool)

(assert (=> b!663695 (= e!380768 (contains!3293 acc!681 k!2843))))

(assert (= (and start!59918 res!431529) b!663683))

(assert (= (and b!663683 res!431525) b!663690))

(assert (= (and b!663690 res!431521) b!663692))

(assert (= (and b!663692 res!431523) b!663689))

(assert (= (and b!663689 res!431528) b!663695))

(assert (= (and b!663689 (not res!431527)) b!663685))

(assert (= (and b!663685 res!431519) b!663688))

(assert (= (and b!663689 res!431518) b!663694))

(assert (= (and b!663694 res!431522) b!663693))

(assert (= (and b!663693 res!431520) b!663679))

(assert (= (and b!663679 res!431526) b!663691))

(assert (= (and b!663691 res!431531) b!663680))

(assert (= (and b!663680 res!431530) b!663682))

(assert (= (and b!663682 res!431524) b!663686))

(assert (= (and b!663686 c!76448) b!663678))

(assert (= (and b!663686 (not c!76448)) b!663684))

(assert (= (and b!663686 c!76447) b!663681))

(assert (= (and b!663686 (not c!76447)) b!663687))

(declare-fun m!635189 () Bool)

(assert (=> b!663680 m!635189))

(declare-fun m!635191 () Bool)

(assert (=> b!663695 m!635191))

(declare-fun m!635193 () Bool)

(assert (=> b!663692 m!635193))

(assert (=> b!663688 m!635191))

(declare-fun m!635195 () Bool)

(assert (=> b!663686 m!635195))

(declare-fun m!635197 () Bool)

(assert (=> b!663686 m!635197))

(declare-fun m!635199 () Bool)

(assert (=> b!663686 m!635199))

(assert (=> b!663686 m!635195))

(declare-fun m!635201 () Bool)

(assert (=> b!663686 m!635201))

(declare-fun m!635203 () Bool)

(assert (=> b!663686 m!635203))

(declare-fun m!635205 () Bool)

(assert (=> b!663693 m!635205))

(declare-fun m!635207 () Bool)

(assert (=> b!663681 m!635207))

(assert (=> b!663681 m!635195))

(declare-fun m!635209 () Bool)

(assert (=> b!663681 m!635209))

(declare-fun m!635211 () Bool)

(assert (=> b!663681 m!635211))

(assert (=> b!663681 m!635195))

(assert (=> b!663681 m!635209))

(declare-fun m!635213 () Bool)

(assert (=> b!663681 m!635213))

(declare-fun m!635215 () Bool)

(assert (=> b!663681 m!635215))

(declare-fun m!635217 () Bool)

(assert (=> b!663691 m!635217))

(declare-fun m!635219 () Bool)

(assert (=> b!663678 m!635219))

(declare-fun m!635221 () Bool)

(assert (=> b!663694 m!635221))

(declare-fun m!635223 () Bool)

(assert (=> start!59918 m!635223))

(declare-fun m!635225 () Bool)

(assert (=> b!663690 m!635225))

(declare-fun m!635227 () Bool)

(assert (=> b!663683 m!635227))

(push 1)

(assert (not b!663695))

(assert (not b!663693))

(assert (not b!663683))

(assert (not b!663692))

(assert (not b!663678))

(assert (not b!663690))

(assert (not b!663680))

(assert (not b!663688))

(assert (not b!663691))

(assert (not b!663681))

(assert (not start!59918))

(assert (not b!663694))

(assert (not b!663686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

