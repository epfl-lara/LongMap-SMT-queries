; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62034 () Bool)

(assert start!62034)

(declare-fun b!694147 () Bool)

(declare-datatypes ((Unit!24518 0))(
  ( (Unit!24519) )
))
(declare-fun e!394916 () Unit!24518)

(declare-fun Unit!24520 () Unit!24518)

(assert (=> b!694147 (= e!394916 Unit!24520)))

(declare-fun b!694148 () Bool)

(declare-fun e!394915 () Bool)

(declare-datatypes ((List!13141 0))(
  ( (Nil!13138) (Cons!13137 (h!14182 (_ BitVec 64)) (t!19420 List!13141)) )
))
(declare-fun lt!316863 () List!13141)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3718 (List!13141 (_ BitVec 64)) Bool)

(assert (=> b!694148 (= e!394915 (contains!3718 lt!316863 k!2843))))

(declare-fun b!694149 () Bool)

(declare-fun res!458217 () Bool)

(declare-fun e!394913 () Bool)

(assert (=> b!694149 (=> (not res!458217) (not e!394913))))

(assert (=> b!694149 (= res!458217 (not (contains!3718 lt!316863 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694150 () Bool)

(declare-fun res!458213 () Bool)

(declare-fun e!394914 () Bool)

(assert (=> b!694150 (=> (not res!458213) (not e!394914))))

(declare-datatypes ((array!39875 0))(
  ( (array!39876 (arr!19100 (Array (_ BitVec 32) (_ BitVec 64))) (size!19485 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39875)

(declare-fun arrayContainsKey!0 (array!39875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694150 (= res!458213 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694151 () Bool)

(declare-fun Unit!24521 () Unit!24518)

(assert (=> b!694151 (= e!394916 Unit!24521)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!694151 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316861 () Unit!24518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39875 (_ BitVec 64) (_ BitVec 32)) Unit!24518)

(assert (=> b!694151 (= lt!316861 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!694151 false))

(declare-fun b!694152 () Bool)

(declare-fun res!458224 () Bool)

(assert (=> b!694152 (=> (not res!458224) (not e!394914))))

(declare-fun acc!681 () List!13141)

(assert (=> b!694152 (= res!458224 (not (contains!3718 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694153 () Bool)

(declare-fun e!394910 () Bool)

(assert (=> b!694153 (= e!394910 (not (contains!3718 lt!316863 k!2843)))))

(declare-fun b!694154 () Bool)

(declare-fun res!458227 () Bool)

(assert (=> b!694154 (=> (not res!458227) (not e!394913))))

(declare-fun e!394911 () Bool)

(assert (=> b!694154 (= res!458227 e!394911)))

(declare-fun res!458231 () Bool)

(assert (=> b!694154 (=> res!458231 e!394911)))

(assert (=> b!694154 (= res!458231 e!394915)))

(declare-fun res!458211 () Bool)

(assert (=> b!694154 (=> (not res!458211) (not e!394915))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694154 (= res!458211 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694155 () Bool)

(declare-fun e!394918 () Bool)

(assert (=> b!694155 (= e!394918 e!394913)))

(declare-fun res!458214 () Bool)

(assert (=> b!694155 (=> (not res!458214) (not e!394913))))

(assert (=> b!694155 (= res!458214 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!430 (List!13141 (_ BitVec 64)) List!13141)

(assert (=> b!694155 (= lt!316863 ($colon$colon!430 acc!681 (select (arr!19100 a!3626) from!3004)))))

(declare-fun b!694156 () Bool)

(declare-fun e!394919 () Bool)

(assert (=> b!694156 (= e!394919 (not (contains!3718 acc!681 k!2843)))))

(declare-fun b!694157 () Bool)

(declare-fun res!458212 () Bool)

(assert (=> b!694157 (=> (not res!458212) (not e!394914))))

(declare-fun e!394917 () Bool)

(assert (=> b!694157 (= res!458212 e!394917)))

(declare-fun res!458226 () Bool)

(assert (=> b!694157 (=> res!458226 e!394917)))

(declare-fun e!394920 () Bool)

(assert (=> b!694157 (= res!458226 e!394920)))

(declare-fun res!458219 () Bool)

(assert (=> b!694157 (=> (not res!458219) (not e!394920))))

(assert (=> b!694157 (= res!458219 (bvsgt from!3004 i!1382))))

(declare-fun b!694158 () Bool)

(declare-fun res!458225 () Bool)

(assert (=> b!694158 (=> (not res!458225) (not e!394914))))

(declare-fun noDuplicate!965 (List!13141) Bool)

(assert (=> b!694158 (= res!458225 (noDuplicate!965 acc!681))))

(declare-fun b!694159 () Bool)

(assert (=> b!694159 (= e!394911 e!394910)))

(declare-fun res!458230 () Bool)

(assert (=> b!694159 (=> (not res!458230) (not e!394910))))

(assert (=> b!694159 (= res!458230 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694160 () Bool)

(assert (=> b!694160 (= e!394913 false)))

(declare-fun lt!316864 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39875 (_ BitVec 32) List!13141) Bool)

(assert (=> b!694160 (= lt!316864 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316863))))

(declare-fun b!694161 () Bool)

(assert (=> b!694161 (= e!394914 e!394918)))

(declare-fun res!458233 () Bool)

(assert (=> b!694161 (=> (not res!458233) (not e!394918))))

(assert (=> b!694161 (= res!458233 (not (= (select (arr!19100 a!3626) from!3004) k!2843)))))

(declare-fun lt!316862 () Unit!24518)

(assert (=> b!694161 (= lt!316862 e!394916)))

(declare-fun c!78335 () Bool)

(assert (=> b!694161 (= c!78335 (= (select (arr!19100 a!3626) from!3004) k!2843))))

(declare-fun res!458234 () Bool)

(assert (=> start!62034 (=> (not res!458234) (not e!394914))))

(assert (=> start!62034 (= res!458234 (and (bvslt (size!19485 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19485 a!3626))))))

(assert (=> start!62034 e!394914))

(assert (=> start!62034 true))

(declare-fun array_inv!14896 (array!39875) Bool)

(assert (=> start!62034 (array_inv!14896 a!3626)))

(declare-fun b!694162 () Bool)

(declare-fun res!458222 () Bool)

(assert (=> b!694162 (=> (not res!458222) (not e!394914))))

(assert (=> b!694162 (= res!458222 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13138))))

(declare-fun b!694163 () Bool)

(declare-fun res!458229 () Bool)

(assert (=> b!694163 (=> (not res!458229) (not e!394914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694163 (= res!458229 (validKeyInArray!0 (select (arr!19100 a!3626) from!3004)))))

(declare-fun b!694164 () Bool)

(assert (=> b!694164 (= e!394920 (contains!3718 acc!681 k!2843))))

(declare-fun b!694165 () Bool)

(declare-fun res!458221 () Bool)

(assert (=> b!694165 (=> (not res!458221) (not e!394914))))

(assert (=> b!694165 (= res!458221 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694166 () Bool)

(declare-fun res!458220 () Bool)

(assert (=> b!694166 (=> (not res!458220) (not e!394913))))

(assert (=> b!694166 (= res!458220 (not (contains!3718 lt!316863 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694167 () Bool)

(declare-fun res!458232 () Bool)

(assert (=> b!694167 (=> (not res!458232) (not e!394914))))

(assert (=> b!694167 (= res!458232 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19485 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694168 () Bool)

(assert (=> b!694168 (= e!394917 e!394919)))

(declare-fun res!458215 () Bool)

(assert (=> b!694168 (=> (not res!458215) (not e!394919))))

(assert (=> b!694168 (= res!458215 (bvsle from!3004 i!1382))))

(declare-fun b!694169 () Bool)

(declare-fun res!458228 () Bool)

(assert (=> b!694169 (=> (not res!458228) (not e!394914))))

(assert (=> b!694169 (= res!458228 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19485 a!3626))))))

(declare-fun b!694170 () Bool)

(declare-fun res!458216 () Bool)

(assert (=> b!694170 (=> (not res!458216) (not e!394914))))

(assert (=> b!694170 (= res!458216 (not (contains!3718 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694171 () Bool)

(declare-fun res!458218 () Bool)

(assert (=> b!694171 (=> (not res!458218) (not e!394913))))

(assert (=> b!694171 (= res!458218 (noDuplicate!965 lt!316863))))

(declare-fun b!694172 () Bool)

(declare-fun res!458223 () Bool)

(assert (=> b!694172 (=> (not res!458223) (not e!394914))))

(assert (=> b!694172 (= res!458223 (validKeyInArray!0 k!2843))))

(assert (= (and start!62034 res!458234) b!694158))

(assert (= (and b!694158 res!458225) b!694170))

(assert (= (and b!694170 res!458216) b!694152))

(assert (= (and b!694152 res!458224) b!694157))

(assert (= (and b!694157 res!458219) b!694164))

(assert (= (and b!694157 (not res!458226)) b!694168))

(assert (= (and b!694168 res!458215) b!694156))

(assert (= (and b!694157 res!458212) b!694162))

(assert (= (and b!694162 res!458222) b!694165))

(assert (= (and b!694165 res!458221) b!694169))

(assert (= (and b!694169 res!458228) b!694172))

(assert (= (and b!694172 res!458223) b!694150))

(assert (= (and b!694150 res!458213) b!694167))

(assert (= (and b!694167 res!458232) b!694163))

(assert (= (and b!694163 res!458229) b!694161))

(assert (= (and b!694161 c!78335) b!694151))

(assert (= (and b!694161 (not c!78335)) b!694147))

(assert (= (and b!694161 res!458233) b!694155))

(assert (= (and b!694155 res!458214) b!694171))

(assert (= (and b!694171 res!458218) b!694149))

(assert (= (and b!694149 res!458217) b!694166))

(assert (= (and b!694166 res!458220) b!694154))

(assert (= (and b!694154 res!458211) b!694148))

(assert (= (and b!694154 (not res!458231)) b!694159))

(assert (= (and b!694159 res!458230) b!694153))

(assert (= (and b!694154 res!458227) b!694160))

(declare-fun m!656127 () Bool)

(assert (=> b!694153 m!656127))

(declare-fun m!656129 () Bool)

(assert (=> b!694163 m!656129))

(assert (=> b!694163 m!656129))

(declare-fun m!656131 () Bool)

(assert (=> b!694163 m!656131))

(declare-fun m!656133 () Bool)

(assert (=> b!694170 m!656133))

(declare-fun m!656135 () Bool)

(assert (=> b!694165 m!656135))

(declare-fun m!656137 () Bool)

(assert (=> b!694149 m!656137))

(assert (=> b!694148 m!656127))

(declare-fun m!656139 () Bool)

(assert (=> b!694166 m!656139))

(declare-fun m!656141 () Bool)

(assert (=> b!694172 m!656141))

(declare-fun m!656143 () Bool)

(assert (=> b!694152 m!656143))

(declare-fun m!656145 () Bool)

(assert (=> b!694164 m!656145))

(declare-fun m!656147 () Bool)

(assert (=> b!694151 m!656147))

(declare-fun m!656149 () Bool)

(assert (=> b!694151 m!656149))

(declare-fun m!656151 () Bool)

(assert (=> b!694162 m!656151))

(declare-fun m!656153 () Bool)

(assert (=> start!62034 m!656153))

(declare-fun m!656155 () Bool)

(assert (=> b!694158 m!656155))

(assert (=> b!694156 m!656145))

(assert (=> b!694161 m!656129))

(declare-fun m!656157 () Bool)

(assert (=> b!694150 m!656157))

(declare-fun m!656159 () Bool)

(assert (=> b!694160 m!656159))

(assert (=> b!694155 m!656129))

(assert (=> b!694155 m!656129))

(declare-fun m!656161 () Bool)

(assert (=> b!694155 m!656161))

(declare-fun m!656163 () Bool)

(assert (=> b!694171 m!656163))

(push 1)

