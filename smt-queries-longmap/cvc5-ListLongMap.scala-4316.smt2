; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59986 () Bool)

(assert start!59986)

(declare-fun b!664172 () Bool)

(declare-fun res!431849 () Bool)

(declare-fun e!381009 () Bool)

(assert (=> b!664172 (=> (not res!431849) (not e!381009))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38971 0))(
  ( (array!38972 (arr!18675 (Array (_ BitVec 32) (_ BitVec 64))) (size!19039 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38971)

(assert (=> b!664172 (= res!431849 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19039 a!3626))))))

(declare-fun b!664173 () Bool)

(declare-fun e!381013 () Bool)

(declare-datatypes ((List!12623 0))(
  ( (Nil!12620) (Cons!12619 (h!13667 (_ BitVec 64)) (t!18843 List!12623)) )
))
(declare-fun acc!681 () List!12623)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3275 (List!12623 (_ BitVec 64)) Bool)

(assert (=> b!664173 (= e!381013 (contains!3275 acc!681 k!2843))))

(declare-fun b!664174 () Bool)

(assert (=> b!664174 (= e!381009 (not true))))

(declare-datatypes ((Unit!23104 0))(
  ( (Unit!23105) )
))
(declare-fun lt!309530 () Unit!23104)

(declare-fun e!381011 () Unit!23104)

(assert (=> b!664174 (= lt!309530 e!381011)))

(declare-fun c!76535 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664174 (= c!76535 (validKeyInArray!0 (select (arr!18675 a!3626) from!3004)))))

(declare-fun lt!309528 () Unit!23104)

(declare-fun e!381014 () Unit!23104)

(assert (=> b!664174 (= lt!309528 e!381014)))

(declare-fun c!76534 () Bool)

(declare-fun arrayContainsKey!0 (array!38971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664174 (= c!76534 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664174 (arrayContainsKey!0 (array!38972 (store (arr!18675 a!3626) i!1382 k!2843) (size!19039 a!3626)) k!2843 from!3004)))

(declare-fun b!664175 () Bool)

(declare-fun e!381012 () Bool)

(assert (=> b!664175 (= e!381012 (not (contains!3275 acc!681 k!2843)))))

(declare-fun b!664176 () Bool)

(declare-fun Unit!23106 () Unit!23104)

(assert (=> b!664176 (= e!381011 Unit!23106)))

(declare-fun b!664177 () Bool)

(declare-fun res!431847 () Bool)

(assert (=> b!664177 (=> (not res!431847) (not e!381009))))

(declare-fun arrayNoDuplicates!0 (array!38971 (_ BitVec 32) List!12623) Bool)

(assert (=> b!664177 (= res!431847 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664178 () Bool)

(declare-fun res!431846 () Bool)

(assert (=> b!664178 (=> (not res!431846) (not e!381009))))

(declare-fun noDuplicate!549 (List!12623) Bool)

(assert (=> b!664178 (= res!431846 (noDuplicate!549 acc!681))))

(declare-fun b!664179 () Bool)

(declare-fun e!381010 () Bool)

(assert (=> b!664179 (= e!381010 e!381012)))

(declare-fun res!431843 () Bool)

(assert (=> b!664179 (=> (not res!431843) (not e!381012))))

(assert (=> b!664179 (= res!431843 (bvsle from!3004 i!1382))))

(declare-fun b!664181 () Bool)

(declare-fun res!431844 () Bool)

(assert (=> b!664181 (=> (not res!431844) (not e!381009))))

(assert (=> b!664181 (= res!431844 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664182 () Bool)

(declare-fun res!431853 () Bool)

(assert (=> b!664182 (=> (not res!431853) (not e!381009))))

(assert (=> b!664182 (= res!431853 (not (contains!3275 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664183 () Bool)

(declare-fun res!431850 () Bool)

(assert (=> b!664183 (=> (not res!431850) (not e!381009))))

(assert (=> b!664183 (= res!431850 (not (contains!3275 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664184 () Bool)

(declare-fun res!431841 () Bool)

(assert (=> b!664184 (=> (not res!431841) (not e!381009))))

(assert (=> b!664184 (= res!431841 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19039 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664185 () Bool)

(declare-fun lt!309529 () Unit!23104)

(assert (=> b!664185 (= e!381011 lt!309529)))

(declare-fun lt!309532 () Unit!23104)

(declare-fun lemmaListSubSeqRefl!0 (List!12623) Unit!23104)

(assert (=> b!664185 (= lt!309532 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!37 (List!12623 List!12623) Bool)

(assert (=> b!664185 (subseq!37 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38971 List!12623 List!12623 (_ BitVec 32)) Unit!23104)

(declare-fun $colon$colon!166 (List!12623 (_ BitVec 64)) List!12623)

(assert (=> b!664185 (= lt!309529 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!166 acc!681 (select (arr!18675 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664185 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664186 () Bool)

(declare-fun Unit!23107 () Unit!23104)

(assert (=> b!664186 (= e!381014 Unit!23107)))

(declare-fun lt!309531 () Unit!23104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38971 (_ BitVec 64) (_ BitVec 32)) Unit!23104)

(assert (=> b!664186 (= lt!309531 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664186 false))

(declare-fun b!664187 () Bool)

(declare-fun Unit!23108 () Unit!23104)

(assert (=> b!664187 (= e!381014 Unit!23108)))

(declare-fun b!664188 () Bool)

(declare-fun res!431845 () Bool)

(assert (=> b!664188 (=> (not res!431845) (not e!381009))))

(assert (=> b!664188 (= res!431845 e!381010)))

(declare-fun res!431852 () Bool)

(assert (=> b!664188 (=> res!431852 e!381010)))

(assert (=> b!664188 (= res!431852 e!381013)))

(declare-fun res!431851 () Bool)

(assert (=> b!664188 (=> (not res!431851) (not e!381013))))

(assert (=> b!664188 (= res!431851 (bvsgt from!3004 i!1382))))

(declare-fun b!664189 () Bool)

(declare-fun res!431842 () Bool)

(assert (=> b!664189 (=> (not res!431842) (not e!381009))))

(assert (=> b!664189 (= res!431842 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12620))))

(declare-fun b!664180 () Bool)

(declare-fun res!431848 () Bool)

(assert (=> b!664180 (=> (not res!431848) (not e!381009))))

(assert (=> b!664180 (= res!431848 (validKeyInArray!0 k!2843))))

(declare-fun res!431854 () Bool)

(assert (=> start!59986 (=> (not res!431854) (not e!381009))))

(assert (=> start!59986 (= res!431854 (and (bvslt (size!19039 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19039 a!3626))))))

(assert (=> start!59986 e!381009))

(assert (=> start!59986 true))

(declare-fun array_inv!14534 (array!38971) Bool)

(assert (=> start!59986 (array_inv!14534 a!3626)))

(assert (= (and start!59986 res!431854) b!664178))

(assert (= (and b!664178 res!431846) b!664182))

(assert (= (and b!664182 res!431853) b!664183))

(assert (= (and b!664183 res!431850) b!664188))

(assert (= (and b!664188 res!431851) b!664173))

(assert (= (and b!664188 (not res!431852)) b!664179))

(assert (= (and b!664179 res!431843) b!664175))

(assert (= (and b!664188 res!431845) b!664189))

(assert (= (and b!664189 res!431842) b!664177))

(assert (= (and b!664177 res!431847) b!664172))

(assert (= (and b!664172 res!431849) b!664180))

(assert (= (and b!664180 res!431848) b!664181))

(assert (= (and b!664181 res!431844) b!664184))

(assert (= (and b!664184 res!431841) b!664174))

(assert (= (and b!664174 c!76534) b!664186))

(assert (= (and b!664174 (not c!76534)) b!664187))

(assert (= (and b!664174 c!76535) b!664185))

(assert (= (and b!664174 (not c!76535)) b!664176))

(declare-fun m!636087 () Bool)

(assert (=> start!59986 m!636087))

(declare-fun m!636089 () Bool)

(assert (=> b!664185 m!636089))

(declare-fun m!636091 () Bool)

(assert (=> b!664185 m!636091))

(declare-fun m!636093 () Bool)

(assert (=> b!664185 m!636093))

(declare-fun m!636095 () Bool)

(assert (=> b!664185 m!636095))

(assert (=> b!664185 m!636091))

(assert (=> b!664185 m!636093))

(declare-fun m!636097 () Bool)

(assert (=> b!664185 m!636097))

(declare-fun m!636099 () Bool)

(assert (=> b!664185 m!636099))

(declare-fun m!636101 () Bool)

(assert (=> b!664182 m!636101))

(declare-fun m!636103 () Bool)

(assert (=> b!664178 m!636103))

(declare-fun m!636105 () Bool)

(assert (=> b!664181 m!636105))

(assert (=> b!664174 m!636091))

(declare-fun m!636107 () Bool)

(assert (=> b!664174 m!636107))

(declare-fun m!636109 () Bool)

(assert (=> b!664174 m!636109))

(assert (=> b!664174 m!636091))

(declare-fun m!636111 () Bool)

(assert (=> b!664174 m!636111))

(declare-fun m!636113 () Bool)

(assert (=> b!664174 m!636113))

(declare-fun m!636115 () Bool)

(assert (=> b!664173 m!636115))

(declare-fun m!636117 () Bool)

(assert (=> b!664177 m!636117))

(declare-fun m!636119 () Bool)

(assert (=> b!664183 m!636119))

(declare-fun m!636121 () Bool)

(assert (=> b!664186 m!636121))

(assert (=> b!664175 m!636115))

(declare-fun m!636123 () Bool)

(assert (=> b!664180 m!636123))

(declare-fun m!636125 () Bool)

(assert (=> b!664189 m!636125))

(push 1)

(assert (not start!59986))

(assert (not b!664189))

(assert (not b!664180))

(assert (not b!664173))

(assert (not b!664178))

(assert (not b!664177))

(assert (not b!664174))

(assert (not b!664175))

(assert (not b!664183))

(assert (not b!664185))

(assert (not b!664182))

(assert (not b!664186))

(assert (not b!664181))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

