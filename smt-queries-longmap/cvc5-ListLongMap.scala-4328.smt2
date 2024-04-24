; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60058 () Bool)

(assert start!60058)

(declare-fun b!666802 () Bool)

(declare-fun e!381864 () Bool)

(declare-datatypes ((List!12659 0))(
  ( (Nil!12656) (Cons!12655 (h!13703 (_ BitVec 64)) (t!18879 List!12659)) )
))
(declare-fun acc!681 () List!12659)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3311 (List!12659 (_ BitVec 64)) Bool)

(assert (=> b!666802 (= e!381864 (contains!3311 acc!681 k!2843))))

(declare-fun b!666803 () Bool)

(declare-fun res!434041 () Bool)

(declare-fun e!381867 () Bool)

(assert (=> b!666803 (=> (not res!434041) (not e!381867))))

(declare-datatypes ((array!39043 0))(
  ( (array!39044 (arr!18711 (Array (_ BitVec 32) (_ BitVec 64))) (size!19075 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39043)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39043 (_ BitVec 32) List!12659) Bool)

(assert (=> b!666803 (= res!434041 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666804 () Bool)

(declare-fun res!434046 () Bool)

(assert (=> b!666804 (=> (not res!434046) (not e!381867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666804 (= res!434046 (validKeyInArray!0 k!2843))))

(declare-fun b!666805 () Bool)

(declare-datatypes ((Unit!23284 0))(
  ( (Unit!23285) )
))
(declare-fun e!381868 () Unit!23284)

(declare-fun Unit!23286 () Unit!23284)

(assert (=> b!666805 (= e!381868 Unit!23286)))

(declare-fun lt!310578 () Unit!23284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39043 (_ BitVec 64) (_ BitVec 32)) Unit!23284)

(assert (=> b!666805 (= lt!310578 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666805 false))

(declare-fun b!666806 () Bool)

(declare-fun res!434053 () Bool)

(declare-fun e!381863 () Bool)

(assert (=> b!666806 (=> res!434053 e!381863)))

(declare-fun lt!310583 () Bool)

(assert (=> b!666806 (= res!434053 lt!310583)))

(declare-fun b!666807 () Bool)

(declare-fun res!434042 () Bool)

(assert (=> b!666807 (=> (not res!434042) (not e!381867))))

(declare-fun noDuplicate!585 (List!12659) Bool)

(assert (=> b!666807 (= res!434042 (noDuplicate!585 acc!681))))

(declare-fun b!666808 () Bool)

(declare-fun e!381869 () Bool)

(declare-fun e!381870 () Bool)

(assert (=> b!666808 (= e!381869 e!381870)))

(declare-fun res!434051 () Bool)

(assert (=> b!666808 (=> (not res!434051) (not e!381870))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666808 (= res!434051 (bvsle from!3004 i!1382))))

(declare-fun b!666809 () Bool)

(declare-fun res!434050 () Bool)

(assert (=> b!666809 (=> (not res!434050) (not e!381867))))

(assert (=> b!666809 (= res!434050 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12656))))

(declare-fun res!434039 () Bool)

(assert (=> start!60058 (=> (not res!434039) (not e!381867))))

(assert (=> start!60058 (= res!434039 (and (bvslt (size!19075 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19075 a!3626))))))

(assert (=> start!60058 e!381867))

(assert (=> start!60058 true))

(declare-fun array_inv!14570 (array!39043) Bool)

(assert (=> start!60058 (array_inv!14570 a!3626)))

(declare-fun b!666810 () Bool)

(declare-fun res!434059 () Bool)

(assert (=> b!666810 (=> (not res!434059) (not e!381867))))

(declare-fun arrayContainsKey!0 (array!39043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666810 (= res!434059 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666811 () Bool)

(assert (=> b!666811 (= e!381863 true)))

(declare-fun lt!310579 () Bool)

(declare-fun lt!310582 () List!12659)

(assert (=> b!666811 (= lt!310579 (contains!3311 lt!310582 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666812 () Bool)

(declare-fun res!434058 () Bool)

(assert (=> b!666812 (=> res!434058 e!381863)))

(assert (=> b!666812 (= res!434058 (contains!3311 acc!681 k!2843))))

(declare-fun b!666813 () Bool)

(declare-fun res!434040 () Bool)

(assert (=> b!666813 (=> res!434040 e!381863)))

(declare-fun subseq!73 (List!12659 List!12659) Bool)

(assert (=> b!666813 (= res!434040 (not (subseq!73 acc!681 lt!310582)))))

(declare-fun b!666814 () Bool)

(declare-fun Unit!23287 () Unit!23284)

(assert (=> b!666814 (= e!381868 Unit!23287)))

(declare-fun b!666815 () Bool)

(declare-fun res!434049 () Bool)

(assert (=> b!666815 (=> res!434049 e!381863)))

(assert (=> b!666815 (= res!434049 (not (noDuplicate!585 lt!310582)))))

(declare-fun b!666816 () Bool)

(assert (=> b!666816 (= e!381870 (not (contains!3311 acc!681 k!2843)))))

(declare-fun b!666817 () Bool)

(declare-fun res!434057 () Bool)

(assert (=> b!666817 (=> res!434057 e!381863)))

(assert (=> b!666817 (= res!434057 (contains!3311 lt!310582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666818 () Bool)

(declare-fun res!434048 () Bool)

(assert (=> b!666818 (=> (not res!434048) (not e!381867))))

(assert (=> b!666818 (= res!434048 (not (contains!3311 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666819 () Bool)

(declare-fun e!381866 () Unit!23284)

(declare-fun Unit!23288 () Unit!23284)

(assert (=> b!666819 (= e!381866 Unit!23288)))

(declare-fun b!666820 () Bool)

(declare-fun res!434047 () Bool)

(assert (=> b!666820 (=> (not res!434047) (not e!381867))))

(assert (=> b!666820 (= res!434047 e!381869)))

(declare-fun res!434056 () Bool)

(assert (=> b!666820 (=> res!434056 e!381869)))

(assert (=> b!666820 (= res!434056 e!381864)))

(declare-fun res!434055 () Bool)

(assert (=> b!666820 (=> (not res!434055) (not e!381864))))

(assert (=> b!666820 (= res!434055 (bvsgt from!3004 i!1382))))

(declare-fun b!666821 () Bool)

(declare-fun res!434054 () Bool)

(assert (=> b!666821 (=> (not res!434054) (not e!381867))))

(assert (=> b!666821 (= res!434054 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19075 a!3626))))))

(declare-fun b!666822 () Bool)

(declare-fun lt!310584 () Unit!23284)

(assert (=> b!666822 (= e!381866 lt!310584)))

(declare-fun lt!310580 () Unit!23284)

(declare-fun lemmaListSubSeqRefl!0 (List!12659) Unit!23284)

(assert (=> b!666822 (= lt!310580 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666822 (subseq!73 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39043 List!12659 List!12659 (_ BitVec 32)) Unit!23284)

(declare-fun $colon$colon!202 (List!12659 (_ BitVec 64)) List!12659)

(assert (=> b!666822 (= lt!310584 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!202 acc!681 (select (arr!18711 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666822 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666823 () Bool)

(assert (=> b!666823 (= e!381867 (not e!381863))))

(declare-fun res!434043 () Bool)

(assert (=> b!666823 (=> res!434043 e!381863)))

(assert (=> b!666823 (= res!434043 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!70 (List!12659 (_ BitVec 64)) List!12659)

(assert (=> b!666823 (= (-!70 lt!310582 k!2843) acc!681)))

(assert (=> b!666823 (= lt!310582 ($colon$colon!202 acc!681 k!2843))))

(declare-fun lt!310585 () Unit!23284)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12659) Unit!23284)

(assert (=> b!666823 (= lt!310585 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666823 (subseq!73 acc!681 acc!681)))

(declare-fun lt!310576 () Unit!23284)

(assert (=> b!666823 (= lt!310576 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666823 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310577 () Unit!23284)

(assert (=> b!666823 (= lt!310577 e!381866)))

(declare-fun c!76750 () Bool)

(assert (=> b!666823 (= c!76750 (validKeyInArray!0 (select (arr!18711 a!3626) from!3004)))))

(declare-fun lt!310581 () Unit!23284)

(assert (=> b!666823 (= lt!310581 e!381868)))

(declare-fun c!76751 () Bool)

(assert (=> b!666823 (= c!76751 lt!310583)))

(assert (=> b!666823 (= lt!310583 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666823 (arrayContainsKey!0 (array!39044 (store (arr!18711 a!3626) i!1382 k!2843) (size!19075 a!3626)) k!2843 from!3004)))

(declare-fun b!666824 () Bool)

(declare-fun res!434045 () Bool)

(assert (=> b!666824 (=> res!434045 e!381863)))

(assert (=> b!666824 (= res!434045 (not (contains!3311 lt!310582 k!2843)))))

(declare-fun b!666825 () Bool)

(declare-fun res!434052 () Bool)

(assert (=> b!666825 (=> (not res!434052) (not e!381867))))

(assert (=> b!666825 (= res!434052 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19075 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666826 () Bool)

(declare-fun res!434044 () Bool)

(assert (=> b!666826 (=> (not res!434044) (not e!381867))))

(assert (=> b!666826 (= res!434044 (not (contains!3311 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60058 res!434039) b!666807))

(assert (= (and b!666807 res!434042) b!666818))

(assert (= (and b!666818 res!434048) b!666826))

(assert (= (and b!666826 res!434044) b!666820))

(assert (= (and b!666820 res!434055) b!666802))

(assert (= (and b!666820 (not res!434056)) b!666808))

(assert (= (and b!666808 res!434051) b!666816))

(assert (= (and b!666820 res!434047) b!666809))

(assert (= (and b!666809 res!434050) b!666803))

(assert (= (and b!666803 res!434041) b!666821))

(assert (= (and b!666821 res!434054) b!666804))

(assert (= (and b!666804 res!434046) b!666810))

(assert (= (and b!666810 res!434059) b!666825))

(assert (= (and b!666825 res!434052) b!666823))

(assert (= (and b!666823 c!76751) b!666805))

(assert (= (and b!666823 (not c!76751)) b!666814))

(assert (= (and b!666823 c!76750) b!666822))

(assert (= (and b!666823 (not c!76750)) b!666819))

(assert (= (and b!666823 (not res!434043)) b!666815))

(assert (= (and b!666815 (not res!434049)) b!666806))

(assert (= (and b!666806 (not res!434053)) b!666812))

(assert (= (and b!666812 (not res!434058)) b!666813))

(assert (= (and b!666813 (not res!434040)) b!666824))

(assert (= (and b!666824 (not res!434045)) b!666817))

(assert (= (and b!666817 (not res!434057)) b!666811))

(declare-fun m!638039 () Bool)

(assert (=> b!666818 m!638039))

(declare-fun m!638041 () Bool)

(assert (=> b!666803 m!638041))

(declare-fun m!638043 () Bool)

(assert (=> b!666823 m!638043))

(declare-fun m!638045 () Bool)

(assert (=> b!666823 m!638045))

(declare-fun m!638047 () Bool)

(assert (=> b!666823 m!638047))

(declare-fun m!638049 () Bool)

(assert (=> b!666823 m!638049))

(declare-fun m!638051 () Bool)

(assert (=> b!666823 m!638051))

(declare-fun m!638053 () Bool)

(assert (=> b!666823 m!638053))

(declare-fun m!638055 () Bool)

(assert (=> b!666823 m!638055))

(assert (=> b!666823 m!638045))

(declare-fun m!638057 () Bool)

(assert (=> b!666823 m!638057))

(declare-fun m!638059 () Bool)

(assert (=> b!666823 m!638059))

(declare-fun m!638061 () Bool)

(assert (=> b!666823 m!638061))

(declare-fun m!638063 () Bool)

(assert (=> b!666823 m!638063))

(declare-fun m!638065 () Bool)

(assert (=> b!666811 m!638065))

(declare-fun m!638067 () Bool)

(assert (=> b!666809 m!638067))

(declare-fun m!638069 () Bool)

(assert (=> b!666815 m!638069))

(declare-fun m!638071 () Bool)

(assert (=> start!60058 m!638071))

(declare-fun m!638073 () Bool)

(assert (=> b!666810 m!638073))

(declare-fun m!638075 () Bool)

(assert (=> b!666812 m!638075))

(declare-fun m!638077 () Bool)

(assert (=> b!666807 m!638077))

(declare-fun m!638079 () Bool)

(assert (=> b!666826 m!638079))

(assert (=> b!666816 m!638075))

(declare-fun m!638081 () Bool)

(assert (=> b!666804 m!638081))

(declare-fun m!638083 () Bool)

(assert (=> b!666824 m!638083))

(declare-fun m!638085 () Bool)

(assert (=> b!666813 m!638085))

(declare-fun m!638087 () Bool)

(assert (=> b!666817 m!638087))

(assert (=> b!666802 m!638075))

(declare-fun m!638089 () Bool)

(assert (=> b!666805 m!638089))

(assert (=> b!666822 m!638043))

(assert (=> b!666822 m!638045))

(declare-fun m!638091 () Bool)

(assert (=> b!666822 m!638091))

(declare-fun m!638093 () Bool)

(assert (=> b!666822 m!638093))

(assert (=> b!666822 m!638045))

(assert (=> b!666822 m!638091))

(assert (=> b!666822 m!638051))

(assert (=> b!666822 m!638063))

(push 1)

(assert (not b!666816))

(assert (not b!666815))

(assert (not b!666807))

(assert (not b!666805))

(assert (not b!666824))

(assert (not b!666823))

(assert (not b!666826))

(assert (not b!666804))

(assert (not b!666810))

(assert (not b!666818))

(assert (not start!60058))

(assert (not b!666802))

(assert (not b!666809))

(assert (not b!666817))

(assert (not b!666822))

(assert (not b!666803))

(assert (not b!666812))

(assert (not b!666813))

(assert (not b!666811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

