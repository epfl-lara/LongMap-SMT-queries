; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62154 () Bool)

(assert start!62154)

(declare-fun b!696128 () Bool)

(declare-fun e!395864 () Bool)

(declare-datatypes ((List!13174 0))(
  ( (Nil!13171) (Cons!13170 (h!14215 (_ BitVec 64)) (t!19456 List!13174)) )
))
(declare-fun acc!681 () List!13174)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3751 (List!13174 (_ BitVec 64)) Bool)

(assert (=> b!696128 (= e!395864 (contains!3751 acc!681 k!2843))))

(declare-fun b!696129 () Bool)

(declare-fun res!460088 () Bool)

(declare-fun e!395861 () Bool)

(assert (=> b!696129 (=> (not res!460088) (not e!395861))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39944 0))(
  ( (array!39945 (arr!19133 (Array (_ BitVec 32) (_ BitVec 64))) (size!19518 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39944)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!696129 (= res!460088 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19518 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696130 () Bool)

(declare-fun res!460086 () Bool)

(assert (=> b!696130 (=> (not res!460086) (not e!395861))))

(assert (=> b!696130 (= res!460086 (not (contains!3751 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696131 () Bool)

(declare-fun res!460090 () Bool)

(assert (=> b!696131 (=> (not res!460090) (not e!395861))))

(declare-fun e!395862 () Bool)

(assert (=> b!696131 (= res!460090 e!395862)))

(declare-fun res!460092 () Bool)

(assert (=> b!696131 (=> res!460092 e!395862)))

(assert (=> b!696131 (= res!460092 e!395864)))

(declare-fun res!460080 () Bool)

(assert (=> b!696131 (=> (not res!460080) (not e!395864))))

(assert (=> b!696131 (= res!460080 (bvsgt from!3004 i!1382))))

(declare-fun b!696132 () Bool)

(assert (=> b!696132 (= e!395861 false)))

(declare-fun lt!317095 () Bool)

(declare-fun e!395858 () Bool)

(assert (=> b!696132 (= lt!317095 e!395858)))

(declare-fun res!460093 () Bool)

(assert (=> b!696132 (=> res!460093 e!395858)))

(declare-fun e!395863 () Bool)

(assert (=> b!696132 (= res!460093 e!395863)))

(declare-fun res!460091 () Bool)

(assert (=> b!696132 (=> (not res!460091) (not e!395863))))

(assert (=> b!696132 (= res!460091 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!460085 () Bool)

(assert (=> start!62154 (=> (not res!460085) (not e!395861))))

(assert (=> start!62154 (= res!460085 (and (bvslt (size!19518 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19518 a!3626))))))

(assert (=> start!62154 e!395861))

(assert (=> start!62154 true))

(declare-fun array_inv!14929 (array!39944) Bool)

(assert (=> start!62154 (array_inv!14929 a!3626)))

(declare-fun b!696133 () Bool)

(declare-fun res!460084 () Bool)

(assert (=> b!696133 (=> (not res!460084) (not e!395861))))

(assert (=> b!696133 (= res!460084 (not (contains!3751 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696134 () Bool)

(declare-fun e!395860 () Bool)

(assert (=> b!696134 (= e!395860 (not (contains!3751 acc!681 k!2843)))))

(declare-fun b!696135 () Bool)

(declare-fun res!460078 () Bool)

(assert (=> b!696135 (=> (not res!460078) (not e!395861))))

(declare-fun arrayNoDuplicates!0 (array!39944 (_ BitVec 32) List!13174) Bool)

(assert (=> b!696135 (= res!460078 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696136 () Bool)

(declare-fun res!460076 () Bool)

(assert (=> b!696136 (=> (not res!460076) (not e!395861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696136 (= res!460076 (not (validKeyInArray!0 (select (arr!19133 a!3626) from!3004))))))

(declare-fun b!696137 () Bool)

(declare-fun e!395859 () Bool)

(assert (=> b!696137 (= e!395862 e!395859)))

(declare-fun res!460089 () Bool)

(assert (=> b!696137 (=> (not res!460089) (not e!395859))))

(assert (=> b!696137 (= res!460089 (bvsle from!3004 i!1382))))

(declare-fun b!696138 () Bool)

(declare-fun res!460081 () Bool)

(assert (=> b!696138 (=> (not res!460081) (not e!395861))))

(assert (=> b!696138 (= res!460081 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19518 a!3626))))))

(declare-fun b!696139 () Bool)

(declare-fun res!460077 () Bool)

(assert (=> b!696139 (=> (not res!460077) (not e!395861))))

(assert (=> b!696139 (= res!460077 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13171))))

(declare-fun b!696140 () Bool)

(declare-fun res!460083 () Bool)

(assert (=> b!696140 (=> (not res!460083) (not e!395861))))

(declare-fun noDuplicate!998 (List!13174) Bool)

(assert (=> b!696140 (= res!460083 (noDuplicate!998 acc!681))))

(declare-fun b!696141 () Bool)

(assert (=> b!696141 (= e!395859 (not (contains!3751 acc!681 k!2843)))))

(declare-fun b!696142 () Bool)

(declare-fun res!460079 () Bool)

(assert (=> b!696142 (=> (not res!460079) (not e!395861))))

(assert (=> b!696142 (= res!460079 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696143 () Bool)

(declare-fun res!460087 () Bool)

(assert (=> b!696143 (=> (not res!460087) (not e!395861))))

(declare-fun arrayContainsKey!0 (array!39944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696143 (= res!460087 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696144 () Bool)

(assert (=> b!696144 (= e!395858 e!395860)))

(declare-fun res!460082 () Bool)

(assert (=> b!696144 (=> (not res!460082) (not e!395860))))

(assert (=> b!696144 (= res!460082 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696145 () Bool)

(assert (=> b!696145 (= e!395863 (contains!3751 acc!681 k!2843))))

(declare-fun b!696146 () Bool)

(declare-fun res!460094 () Bool)

(assert (=> b!696146 (=> (not res!460094) (not e!395861))))

(assert (=> b!696146 (= res!460094 (validKeyInArray!0 k!2843))))

(assert (= (and start!62154 res!460085) b!696140))

(assert (= (and b!696140 res!460083) b!696130))

(assert (= (and b!696130 res!460086) b!696133))

(assert (= (and b!696133 res!460084) b!696131))

(assert (= (and b!696131 res!460080) b!696128))

(assert (= (and b!696131 (not res!460092)) b!696137))

(assert (= (and b!696137 res!460089) b!696141))

(assert (= (and b!696131 res!460090) b!696139))

(assert (= (and b!696139 res!460077) b!696135))

(assert (= (and b!696135 res!460078) b!696138))

(assert (= (and b!696138 res!460081) b!696146))

(assert (= (and b!696146 res!460094) b!696143))

(assert (= (and b!696143 res!460087) b!696129))

(assert (= (and b!696129 res!460088) b!696136))

(assert (= (and b!696136 res!460076) b!696142))

(assert (= (and b!696142 res!460079) b!696132))

(assert (= (and b!696132 res!460091) b!696145))

(assert (= (and b!696132 (not res!460093)) b!696144))

(assert (= (and b!696144 res!460082) b!696134))

(declare-fun m!657253 () Bool)

(assert (=> start!62154 m!657253))

(declare-fun m!657255 () Bool)

(assert (=> b!696136 m!657255))

(assert (=> b!696136 m!657255))

(declare-fun m!657257 () Bool)

(assert (=> b!696136 m!657257))

(declare-fun m!657259 () Bool)

(assert (=> b!696133 m!657259))

(declare-fun m!657261 () Bool)

(assert (=> b!696145 m!657261))

(assert (=> b!696141 m!657261))

(declare-fun m!657263 () Bool)

(assert (=> b!696146 m!657263))

(declare-fun m!657265 () Bool)

(assert (=> b!696140 m!657265))

(assert (=> b!696128 m!657261))

(declare-fun m!657267 () Bool)

(assert (=> b!696139 m!657267))

(assert (=> b!696134 m!657261))

(declare-fun m!657269 () Bool)

(assert (=> b!696135 m!657269))

(declare-fun m!657271 () Bool)

(assert (=> b!696130 m!657271))

(declare-fun m!657273 () Bool)

(assert (=> b!696143 m!657273))

(push 1)

(assert (not b!696145))

(assert (not b!696136))

(assert (not b!696130))

(assert (not b!696128))

(assert (not b!696143))

(assert (not b!696146))

(assert (not b!696140))

(assert (not b!696135))

(assert (not b!696134))

(assert (not b!696141))

(assert (not b!696133))

(assert (not start!62154))

(assert (not b!696139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

