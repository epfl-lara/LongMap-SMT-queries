; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62214 () Bool)

(assert start!62214)

(declare-fun b!697069 () Bool)

(declare-fun e!396227 () Bool)

(declare-fun e!396233 () Bool)

(assert (=> b!697069 (= e!396227 e!396233)))

(declare-fun res!461164 () Bool)

(assert (=> b!697069 (=> (not res!461164) (not e!396233))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697069 (= res!461164 (bvsle from!3004 i!1382))))

(declare-fun b!697070 () Bool)

(declare-fun e!396232 () Bool)

(declare-datatypes ((List!13230 0))(
  ( (Nil!13227) (Cons!13226 (h!14271 (_ BitVec 64)) (t!19503 List!13230)) )
))
(declare-fun acc!681 () List!13230)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3752 (List!13230 (_ BitVec 64)) Bool)

(assert (=> b!697070 (= e!396232 (contains!3752 acc!681 k!2843))))

(declare-fun b!697071 () Bool)

(declare-fun res!461163 () Bool)

(declare-fun e!396229 () Bool)

(assert (=> b!697071 (=> (not res!461163) (not e!396229))))

(declare-datatypes ((array!39982 0))(
  ( (array!39983 (arr!19150 (Array (_ BitVec 32) (_ BitVec 64))) (size!19532 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39982)

(declare-fun arrayNoDuplicates!0 (array!39982 (_ BitVec 32) List!13230) Bool)

(assert (=> b!697071 (= res!461163 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697072 () Bool)

(declare-fun res!461165 () Bool)

(assert (=> b!697072 (=> (not res!461165) (not e!396229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697072 (= res!461165 (validKeyInArray!0 k!2843))))

(declare-fun b!697073 () Bool)

(assert (=> b!697073 (= e!396229 (not true))))

(assert (=> b!697073 (arrayNoDuplicates!0 (array!39983 (store (arr!19150 a!3626) i!1382 k!2843) (size!19532 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!24552 0))(
  ( (Unit!24553) )
))
(declare-fun lt!316890 () Unit!24552)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39982 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13230) Unit!24552)

(assert (=> b!697073 (= lt!316890 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697074 () Bool)

(declare-fun res!461151 () Bool)

(assert (=> b!697074 (=> (not res!461151) (not e!396229))))

(assert (=> b!697074 (= res!461151 (not (contains!3752 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697075 () Bool)

(declare-fun res!461166 () Bool)

(assert (=> b!697075 (=> (not res!461166) (not e!396229))))

(declare-fun arrayContainsKey!0 (array!39982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697075 (= res!461166 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697076 () Bool)

(declare-fun res!461154 () Bool)

(assert (=> b!697076 (=> (not res!461154) (not e!396229))))

(declare-fun e!396230 () Bool)

(assert (=> b!697076 (= res!461154 e!396230)))

(declare-fun res!461160 () Bool)

(assert (=> b!697076 (=> res!461160 e!396230)))

(declare-fun e!396231 () Bool)

(assert (=> b!697076 (= res!461160 e!396231)))

(declare-fun res!461148 () Bool)

(assert (=> b!697076 (=> (not res!461148) (not e!396231))))

(assert (=> b!697076 (= res!461148 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697077 () Bool)

(declare-fun e!396226 () Bool)

(assert (=> b!697077 (= e!396226 (not (contains!3752 acc!681 k!2843)))))

(declare-fun b!697078 () Bool)

(declare-fun res!461161 () Bool)

(assert (=> b!697078 (=> (not res!461161) (not e!396229))))

(assert (=> b!697078 (= res!461161 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19532 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697079 () Bool)

(declare-fun res!461156 () Bool)

(assert (=> b!697079 (=> (not res!461156) (not e!396229))))

(assert (=> b!697079 (= res!461156 e!396227)))

(declare-fun res!461162 () Bool)

(assert (=> b!697079 (=> res!461162 e!396227)))

(assert (=> b!697079 (= res!461162 e!396232)))

(declare-fun res!461147 () Bool)

(assert (=> b!697079 (=> (not res!461147) (not e!396232))))

(assert (=> b!697079 (= res!461147 (bvsgt from!3004 i!1382))))

(declare-fun res!461159 () Bool)

(assert (=> start!62214 (=> (not res!461159) (not e!396229))))

(assert (=> start!62214 (= res!461159 (and (bvslt (size!19532 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19532 a!3626))))))

(assert (=> start!62214 e!396229))

(assert (=> start!62214 true))

(declare-fun array_inv!15033 (array!39982) Bool)

(assert (=> start!62214 (array_inv!15033 a!3626)))

(declare-fun b!697080 () Bool)

(declare-fun res!461155 () Bool)

(assert (=> b!697080 (=> (not res!461155) (not e!396229))))

(assert (=> b!697080 (= res!461155 (not (validKeyInArray!0 (select (arr!19150 a!3626) from!3004))))))

(declare-fun b!697081 () Bool)

(declare-fun res!461158 () Bool)

(assert (=> b!697081 (=> (not res!461158) (not e!396229))))

(assert (=> b!697081 (= res!461158 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697082 () Bool)

(declare-fun res!461149 () Bool)

(assert (=> b!697082 (=> (not res!461149) (not e!396229))))

(declare-fun noDuplicate!1021 (List!13230) Bool)

(assert (=> b!697082 (= res!461149 (noDuplicate!1021 acc!681))))

(declare-fun b!697083 () Bool)

(assert (=> b!697083 (= e!396233 (not (contains!3752 acc!681 k!2843)))))

(declare-fun b!697084 () Bool)

(declare-fun res!461157 () Bool)

(assert (=> b!697084 (=> (not res!461157) (not e!396229))))

(assert (=> b!697084 (= res!461157 (not (contains!3752 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697085 () Bool)

(declare-fun res!461167 () Bool)

(assert (=> b!697085 (=> (not res!461167) (not e!396229))))

(assert (=> b!697085 (= res!461167 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13227))))

(declare-fun b!697086 () Bool)

(declare-fun res!461152 () Bool)

(assert (=> b!697086 (=> (not res!461152) (not e!396229))))

(assert (=> b!697086 (= res!461152 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!697087 () Bool)

(declare-fun res!461153 () Bool)

(assert (=> b!697087 (=> (not res!461153) (not e!396229))))

(assert (=> b!697087 (= res!461153 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19532 a!3626))))))

(declare-fun b!697088 () Bool)

(assert (=> b!697088 (= e!396231 (contains!3752 acc!681 k!2843))))

(declare-fun b!697089 () Bool)

(assert (=> b!697089 (= e!396230 e!396226)))

(declare-fun res!461150 () Bool)

(assert (=> b!697089 (=> (not res!461150) (not e!396226))))

(assert (=> b!697089 (= res!461150 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!62214 res!461159) b!697082))

(assert (= (and b!697082 res!461149) b!697074))

(assert (= (and b!697074 res!461151) b!697084))

(assert (= (and b!697084 res!461157) b!697079))

(assert (= (and b!697079 res!461147) b!697070))

(assert (= (and b!697079 (not res!461162)) b!697069))

(assert (= (and b!697069 res!461164) b!697083))

(assert (= (and b!697079 res!461156) b!697085))

(assert (= (and b!697085 res!461167) b!697071))

(assert (= (and b!697071 res!461163) b!697087))

(assert (= (and b!697087 res!461153) b!697072))

(assert (= (and b!697072 res!461165) b!697075))

(assert (= (and b!697075 res!461166) b!697078))

(assert (= (and b!697078 res!461161) b!697080))

(assert (= (and b!697080 res!461155) b!697086))

(assert (= (and b!697086 res!461152) b!697076))

(assert (= (and b!697076 res!461148) b!697088))

(assert (= (and b!697076 (not res!461160)) b!697089))

(assert (= (and b!697089 res!461150) b!697077))

(assert (= (and b!697076 res!461154) b!697081))

(assert (= (and b!697081 res!461158) b!697073))

(declare-fun m!657033 () Bool)

(assert (=> b!697073 m!657033))

(declare-fun m!657035 () Bool)

(assert (=> b!697073 m!657035))

(declare-fun m!657037 () Bool)

(assert (=> b!697073 m!657037))

(declare-fun m!657039 () Bool)

(assert (=> b!697075 m!657039))

(declare-fun m!657041 () Bool)

(assert (=> b!697071 m!657041))

(declare-fun m!657043 () Bool)

(assert (=> b!697081 m!657043))

(declare-fun m!657045 () Bool)

(assert (=> b!697082 m!657045))

(declare-fun m!657047 () Bool)

(assert (=> b!697080 m!657047))

(assert (=> b!697080 m!657047))

(declare-fun m!657049 () Bool)

(assert (=> b!697080 m!657049))

(declare-fun m!657051 () Bool)

(assert (=> b!697083 m!657051))

(declare-fun m!657053 () Bool)

(assert (=> b!697072 m!657053))

(declare-fun m!657055 () Bool)

(assert (=> start!62214 m!657055))

(declare-fun m!657057 () Bool)

(assert (=> b!697084 m!657057))

(assert (=> b!697070 m!657051))

(assert (=> b!697088 m!657051))

(assert (=> b!697077 m!657051))

(declare-fun m!657059 () Bool)

(assert (=> b!697074 m!657059))

(declare-fun m!657061 () Bool)

(assert (=> b!697085 m!657061))

(push 1)

(assert (not b!697074))

(assert (not b!697085))

(assert (not b!697082))

(assert (not start!62214))

(assert (not b!697071))

(assert (not b!697075))

(assert (not b!697083))

(assert (not b!697081))

(assert (not b!697084))

(assert (not b!697088))

(assert (not b!697072))

(assert (not b!697070))

(assert (not b!697073))

(assert (not b!697080))

(assert (not b!697077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

