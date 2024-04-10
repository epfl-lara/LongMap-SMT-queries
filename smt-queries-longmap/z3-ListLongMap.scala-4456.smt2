; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62032 () Bool)

(assert start!62032)

(declare-fun b!694069 () Bool)

(declare-fun e!394886 () Bool)

(declare-datatypes ((List!13140 0))(
  ( (Nil!13137) (Cons!13136 (h!14181 (_ BitVec 64)) (t!19419 List!13140)) )
))
(declare-fun lt!316852 () List!13140)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3717 (List!13140 (_ BitVec 64)) Bool)

(assert (=> b!694069 (= e!394886 (contains!3717 lt!316852 k0!2843))))

(declare-fun b!694070 () Bool)

(declare-fun res!458159 () Bool)

(declare-fun e!394885 () Bool)

(assert (=> b!694070 (=> (not res!458159) (not e!394885))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39873 0))(
  ( (array!39874 (arr!19099 (Array (_ BitVec 32) (_ BitVec 64))) (size!19484 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39873)

(assert (=> b!694070 (= res!458159 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19484 a!3626))))))

(declare-fun b!694071 () Bool)

(declare-fun e!394879 () Bool)

(declare-fun e!394880 () Bool)

(assert (=> b!694071 (= e!394879 e!394880)))

(declare-fun res!458156 () Bool)

(assert (=> b!694071 (=> (not res!458156) (not e!394880))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!694071 (= res!458156 (bvsle from!3004 i!1382))))

(declare-fun b!694072 () Bool)

(declare-fun e!394884 () Bool)

(assert (=> b!694072 (= e!394884 (not (contains!3717 lt!316852 k0!2843)))))

(declare-fun b!694073 () Bool)

(declare-fun res!458139 () Bool)

(assert (=> b!694073 (=> (not res!458139) (not e!394885))))

(declare-fun arrayContainsKey!0 (array!39873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694073 (= res!458139 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694074 () Bool)

(declare-fun res!458160 () Bool)

(declare-fun e!394882 () Bool)

(assert (=> b!694074 (=> (not res!458160) (not e!394882))))

(declare-fun e!394881 () Bool)

(assert (=> b!694074 (= res!458160 e!394881)))

(declare-fun res!458141 () Bool)

(assert (=> b!694074 (=> res!458141 e!394881)))

(assert (=> b!694074 (= res!458141 e!394886)))

(declare-fun res!458145 () Bool)

(assert (=> b!694074 (=> (not res!458145) (not e!394886))))

(assert (=> b!694074 (= res!458145 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694075 () Bool)

(assert (=> b!694075 (= e!394882 false)))

(declare-fun lt!316849 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39873 (_ BitVec 32) List!13140) Bool)

(assert (=> b!694075 (= lt!316849 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316852))))

(declare-fun b!694076 () Bool)

(declare-fun res!458149 () Bool)

(assert (=> b!694076 (=> (not res!458149) (not e!394885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694076 (= res!458149 (validKeyInArray!0 k0!2843))))

(declare-fun b!694077 () Bool)

(declare-fun res!458155 () Bool)

(assert (=> b!694077 (=> (not res!458155) (not e!394882))))

(declare-fun noDuplicate!964 (List!13140) Bool)

(assert (=> b!694077 (= res!458155 (noDuplicate!964 lt!316852))))

(declare-fun b!694078 () Bool)

(declare-fun res!458150 () Bool)

(assert (=> b!694078 (=> (not res!458150) (not e!394885))))

(declare-fun acc!681 () List!13140)

(assert (=> b!694078 (= res!458150 (not (contains!3717 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694079 () Bool)

(declare-fun res!458154 () Bool)

(assert (=> b!694079 (=> (not res!458154) (not e!394885))))

(assert (=> b!694079 (= res!458154 (not (contains!3717 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694080 () Bool)

(declare-fun res!458162 () Bool)

(assert (=> b!694080 (=> (not res!458162) (not e!394882))))

(assert (=> b!694080 (= res!458162 (not (contains!3717 lt!316852 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694081 () Bool)

(declare-fun res!458153 () Bool)

(assert (=> b!694081 (=> (not res!458153) (not e!394885))))

(assert (=> b!694081 (= res!458153 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19484 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694082 () Bool)

(declare-fun e!394883 () Bool)

(assert (=> b!694082 (= e!394883 e!394882)))

(declare-fun res!458146 () Bool)

(assert (=> b!694082 (=> (not res!458146) (not e!394882))))

(assert (=> b!694082 (= res!458146 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!429 (List!13140 (_ BitVec 64)) List!13140)

(assert (=> b!694082 (= lt!316852 ($colon$colon!429 acc!681 (select (arr!19099 a!3626) from!3004)))))

(declare-fun b!694083 () Bool)

(declare-fun res!458152 () Bool)

(assert (=> b!694083 (=> (not res!458152) (not e!394885))))

(assert (=> b!694083 (= res!458152 (validKeyInArray!0 (select (arr!19099 a!3626) from!3004)))))

(declare-fun b!694084 () Bool)

(declare-datatypes ((Unit!24514 0))(
  ( (Unit!24515) )
))
(declare-fun e!394877 () Unit!24514)

(declare-fun Unit!24516 () Unit!24514)

(assert (=> b!694084 (= e!394877 Unit!24516)))

(declare-fun res!458161 () Bool)

(assert (=> start!62032 (=> (not res!458161) (not e!394885))))

(assert (=> start!62032 (= res!458161 (and (bvslt (size!19484 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19484 a!3626))))))

(assert (=> start!62032 e!394885))

(assert (=> start!62032 true))

(declare-fun array_inv!14895 (array!39873) Bool)

(assert (=> start!62032 (array_inv!14895 a!3626)))

(declare-fun b!694085 () Bool)

(declare-fun e!394878 () Bool)

(assert (=> b!694085 (= e!394878 (contains!3717 acc!681 k0!2843))))

(declare-fun b!694086 () Bool)

(declare-fun res!458143 () Bool)

(assert (=> b!694086 (=> (not res!458143) (not e!394885))))

(assert (=> b!694086 (= res!458143 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694087 () Bool)

(declare-fun res!458157 () Bool)

(assert (=> b!694087 (=> (not res!458157) (not e!394885))))

(assert (=> b!694087 (= res!458157 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13137))))

(declare-fun b!694088 () Bool)

(declare-fun res!458158 () Bool)

(assert (=> b!694088 (=> (not res!458158) (not e!394882))))

(assert (=> b!694088 (= res!458158 (not (contains!3717 lt!316852 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694089 () Bool)

(declare-fun res!458140 () Bool)

(assert (=> b!694089 (=> (not res!458140) (not e!394885))))

(assert (=> b!694089 (= res!458140 (noDuplicate!964 acc!681))))

(declare-fun b!694090 () Bool)

(assert (=> b!694090 (= e!394881 e!394884)))

(declare-fun res!458142 () Bool)

(assert (=> b!694090 (=> (not res!458142) (not e!394884))))

(assert (=> b!694090 (= res!458142 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694091 () Bool)

(declare-fun res!458147 () Bool)

(assert (=> b!694091 (=> (not res!458147) (not e!394885))))

(assert (=> b!694091 (= res!458147 e!394879)))

(declare-fun res!458144 () Bool)

(assert (=> b!694091 (=> res!458144 e!394879)))

(assert (=> b!694091 (= res!458144 e!394878)))

(declare-fun res!458151 () Bool)

(assert (=> b!694091 (=> (not res!458151) (not e!394878))))

(assert (=> b!694091 (= res!458151 (bvsgt from!3004 i!1382))))

(declare-fun b!694092 () Bool)

(assert (=> b!694092 (= e!394880 (not (contains!3717 acc!681 k0!2843)))))

(declare-fun b!694093 () Bool)

(assert (=> b!694093 (= e!394885 e!394883)))

(declare-fun res!458148 () Bool)

(assert (=> b!694093 (=> (not res!458148) (not e!394883))))

(assert (=> b!694093 (= res!458148 (not (= (select (arr!19099 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316851 () Unit!24514)

(assert (=> b!694093 (= lt!316851 e!394877)))

(declare-fun c!78332 () Bool)

(assert (=> b!694093 (= c!78332 (= (select (arr!19099 a!3626) from!3004) k0!2843))))

(declare-fun b!694094 () Bool)

(declare-fun Unit!24517 () Unit!24514)

(assert (=> b!694094 (= e!394877 Unit!24517)))

(assert (=> b!694094 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316850 () Unit!24514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39873 (_ BitVec 64) (_ BitVec 32)) Unit!24514)

(assert (=> b!694094 (= lt!316850 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694094 false))

(assert (= (and start!62032 res!458161) b!694089))

(assert (= (and b!694089 res!458140) b!694079))

(assert (= (and b!694079 res!458154) b!694078))

(assert (= (and b!694078 res!458150) b!694091))

(assert (= (and b!694091 res!458151) b!694085))

(assert (= (and b!694091 (not res!458144)) b!694071))

(assert (= (and b!694071 res!458156) b!694092))

(assert (= (and b!694091 res!458147) b!694087))

(assert (= (and b!694087 res!458157) b!694086))

(assert (= (and b!694086 res!458143) b!694070))

(assert (= (and b!694070 res!458159) b!694076))

(assert (= (and b!694076 res!458149) b!694073))

(assert (= (and b!694073 res!458139) b!694081))

(assert (= (and b!694081 res!458153) b!694083))

(assert (= (and b!694083 res!458152) b!694093))

(assert (= (and b!694093 c!78332) b!694094))

(assert (= (and b!694093 (not c!78332)) b!694084))

(assert (= (and b!694093 res!458148) b!694082))

(assert (= (and b!694082 res!458146) b!694077))

(assert (= (and b!694077 res!458155) b!694080))

(assert (= (and b!694080 res!458162) b!694088))

(assert (= (and b!694088 res!458158) b!694074))

(assert (= (and b!694074 res!458145) b!694069))

(assert (= (and b!694074 (not res!458141)) b!694090))

(assert (= (and b!694090 res!458142) b!694072))

(assert (= (and b!694074 res!458160) b!694075))

(declare-fun m!656089 () Bool)

(assert (=> b!694078 m!656089))

(declare-fun m!656091 () Bool)

(assert (=> b!694094 m!656091))

(declare-fun m!656093 () Bool)

(assert (=> b!694094 m!656093))

(declare-fun m!656095 () Bool)

(assert (=> b!694069 m!656095))

(declare-fun m!656097 () Bool)

(assert (=> b!694089 m!656097))

(declare-fun m!656099 () Bool)

(assert (=> b!694093 m!656099))

(assert (=> b!694083 m!656099))

(assert (=> b!694083 m!656099))

(declare-fun m!656101 () Bool)

(assert (=> b!694083 m!656101))

(assert (=> b!694082 m!656099))

(assert (=> b!694082 m!656099))

(declare-fun m!656103 () Bool)

(assert (=> b!694082 m!656103))

(declare-fun m!656105 () Bool)

(assert (=> b!694080 m!656105))

(declare-fun m!656107 () Bool)

(assert (=> b!694076 m!656107))

(declare-fun m!656109 () Bool)

(assert (=> start!62032 m!656109))

(declare-fun m!656111 () Bool)

(assert (=> b!694092 m!656111))

(declare-fun m!656113 () Bool)

(assert (=> b!694088 m!656113))

(declare-fun m!656115 () Bool)

(assert (=> b!694077 m!656115))

(declare-fun m!656117 () Bool)

(assert (=> b!694087 m!656117))

(declare-fun m!656119 () Bool)

(assert (=> b!694075 m!656119))

(assert (=> b!694085 m!656111))

(declare-fun m!656121 () Bool)

(assert (=> b!694086 m!656121))

(assert (=> b!694072 m!656095))

(declare-fun m!656123 () Bool)

(assert (=> b!694079 m!656123))

(declare-fun m!656125 () Bool)

(assert (=> b!694073 m!656125))

(check-sat (not b!694075) (not start!62032) (not b!694082) (not b!694089) (not b!694083) (not b!694078) (not b!694087) (not b!694080) (not b!694076) (not b!694072) (not b!694092) (not b!694085) (not b!694073) (not b!694069) (not b!694079) (not b!694094) (not b!694088) (not b!694077) (not b!694086))
(check-sat)
