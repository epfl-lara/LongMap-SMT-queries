; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61372 () Bool)

(assert start!61372)

(declare-fun b!687144 () Bool)

(declare-fun e!391313 () Bool)

(declare-fun e!391318 () Bool)

(assert (=> b!687144 (= e!391313 e!391318)))

(declare-fun res!452116 () Bool)

(assert (=> b!687144 (=> (not res!452116) (not e!391318))))

(declare-datatypes ((List!13053 0))(
  ( (Nil!13050) (Cons!13049 (h!14094 (_ BitVec 64)) (t!19311 List!13053)) )
))
(declare-fun lt!315320 () List!13053)

(declare-fun contains!3630 (List!13053 (_ BitVec 64)) Bool)

(assert (=> b!687144 (= res!452116 (not (contains!3630 lt!315320 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687146 () Bool)

(declare-datatypes ((Unit!24227 0))(
  ( (Unit!24228) )
))
(declare-fun e!391320 () Unit!24227)

(declare-fun Unit!24229 () Unit!24227)

(assert (=> b!687146 (= e!391320 Unit!24229)))

(declare-fun lt!315321 () Unit!24227)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39675 0))(
  ( (array!39676 (arr!19012 (Array (_ BitVec 32) (_ BitVec 64))) (size!19389 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39675)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39675 (_ BitVec 64) (_ BitVec 32)) Unit!24227)

(assert (=> b!687146 (= lt!315321 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!687146 false))

(declare-fun b!687147 () Bool)

(declare-fun res!452124 () Bool)

(declare-fun e!391315 () Bool)

(assert (=> b!687147 (=> (not res!452124) (not e!391315))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!687147 (= res!452124 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19389 a!3626))))))

(declare-fun b!687148 () Bool)

(declare-fun e!391317 () Bool)

(declare-fun acc!681 () List!13053)

(assert (=> b!687148 (= e!391317 (not (contains!3630 acc!681 k0!2843)))))

(declare-fun b!687149 () Bool)

(declare-fun res!452128 () Bool)

(assert (=> b!687149 (=> (not res!452128) (not e!391315))))

(assert (=> b!687149 (= res!452128 (not (contains!3630 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687150 () Bool)

(declare-fun res!452132 () Bool)

(assert (=> b!687150 (=> (not res!452132) (not e!391315))))

(declare-fun noDuplicate!877 (List!13053) Bool)

(assert (=> b!687150 (= res!452132 (noDuplicate!877 acc!681))))

(declare-fun b!687151 () Bool)

(assert (=> b!687151 (= e!391318 (not (contains!3630 lt!315320 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687152 () Bool)

(declare-fun res!452121 () Bool)

(assert (=> b!687152 (=> (not res!452121) (not e!391315))))

(declare-fun arrayNoDuplicates!0 (array!39675 (_ BitVec 32) List!13053) Bool)

(assert (=> b!687152 (= res!452121 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13050))))

(declare-fun b!687153 () Bool)

(assert (=> b!687153 (= e!391315 (not e!391313))))

(declare-fun res!452127 () Bool)

(assert (=> b!687153 (=> res!452127 e!391313)))

(assert (=> b!687153 (= res!452127 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!687153 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315320)))

(declare-fun lt!315322 () Unit!24227)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39675 (_ BitVec 64) (_ BitVec 32) List!13053 List!13053) Unit!24227)

(assert (=> b!687153 (= lt!315322 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315320))))

(declare-fun -!181 (List!13053 (_ BitVec 64)) List!13053)

(assert (=> b!687153 (= (-!181 lt!315320 k0!2843) acc!681)))

(declare-fun $colon$colon!381 (List!13053 (_ BitVec 64)) List!13053)

(assert (=> b!687153 (= lt!315320 ($colon$colon!381 acc!681 k0!2843))))

(declare-fun lt!315327 () Unit!24227)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13053) Unit!24227)

(assert (=> b!687153 (= lt!315327 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!216 (List!13053 List!13053) Bool)

(assert (=> b!687153 (subseq!216 acc!681 acc!681)))

(declare-fun lt!315323 () Unit!24227)

(declare-fun lemmaListSubSeqRefl!0 (List!13053) Unit!24227)

(assert (=> b!687153 (= lt!315323 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687153 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315324 () Unit!24227)

(declare-fun e!391316 () Unit!24227)

(assert (=> b!687153 (= lt!315324 e!391316)))

(declare-fun c!77882 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687153 (= c!77882 (validKeyInArray!0 (select (arr!19012 a!3626) from!3004)))))

(declare-fun lt!315328 () Unit!24227)

(assert (=> b!687153 (= lt!315328 e!391320)))

(declare-fun c!77881 () Bool)

(declare-fun arrayContainsKey!0 (array!39675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687153 (= c!77881 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687153 (arrayContainsKey!0 (array!39676 (store (arr!19012 a!3626) i!1382 k0!2843) (size!19389 a!3626)) k0!2843 from!3004)))

(declare-fun b!687154 () Bool)

(declare-fun e!391319 () Bool)

(assert (=> b!687154 (= e!391319 e!391317)))

(declare-fun res!452129 () Bool)

(assert (=> b!687154 (=> (not res!452129) (not e!391317))))

(assert (=> b!687154 (= res!452129 (bvsle from!3004 i!1382))))

(declare-fun res!452118 () Bool)

(assert (=> start!61372 (=> (not res!452118) (not e!391315))))

(assert (=> start!61372 (= res!452118 (and (bvslt (size!19389 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19389 a!3626))))))

(assert (=> start!61372 e!391315))

(assert (=> start!61372 true))

(declare-fun array_inv!14808 (array!39675) Bool)

(assert (=> start!61372 (array_inv!14808 a!3626)))

(declare-fun b!687145 () Bool)

(declare-fun Unit!24230 () Unit!24227)

(assert (=> b!687145 (= e!391320 Unit!24230)))

(declare-fun b!687155 () Bool)

(declare-fun res!452122 () Bool)

(assert (=> b!687155 (=> (not res!452122) (not e!391315))))

(assert (=> b!687155 (= res!452122 e!391319)))

(declare-fun res!452130 () Bool)

(assert (=> b!687155 (=> res!452130 e!391319)))

(declare-fun e!391312 () Bool)

(assert (=> b!687155 (= res!452130 e!391312)))

(declare-fun res!452126 () Bool)

(assert (=> b!687155 (=> (not res!452126) (not e!391312))))

(assert (=> b!687155 (= res!452126 (bvsgt from!3004 i!1382))))

(declare-fun b!687156 () Bool)

(declare-fun res!452119 () Bool)

(assert (=> b!687156 (=> (not res!452119) (not e!391315))))

(assert (=> b!687156 (= res!452119 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687157 () Bool)

(declare-fun res!452125 () Bool)

(assert (=> b!687157 (=> (not res!452125) (not e!391315))))

(assert (=> b!687157 (= res!452125 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687158 () Bool)

(declare-fun lt!315326 () Unit!24227)

(assert (=> b!687158 (= e!391316 lt!315326)))

(declare-fun lt!315325 () Unit!24227)

(assert (=> b!687158 (= lt!315325 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687158 (subseq!216 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39675 List!13053 List!13053 (_ BitVec 32)) Unit!24227)

(assert (=> b!687158 (= lt!315326 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!381 acc!681 (select (arr!19012 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687158 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!687159 () Bool)

(declare-fun res!452131 () Bool)

(assert (=> b!687159 (=> (not res!452131) (not e!391315))))

(assert (=> b!687159 (= res!452131 (validKeyInArray!0 k0!2843))))

(declare-fun b!687160 () Bool)

(assert (=> b!687160 (= e!391312 (contains!3630 acc!681 k0!2843))))

(declare-fun b!687161 () Bool)

(declare-fun res!452123 () Bool)

(assert (=> b!687161 (=> (not res!452123) (not e!391315))))

(assert (=> b!687161 (= res!452123 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19389 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!687162 () Bool)

(declare-fun res!452120 () Bool)

(assert (=> b!687162 (=> res!452120 e!391313)))

(assert (=> b!687162 (= res!452120 (not (noDuplicate!877 lt!315320)))))

(declare-fun b!687163 () Bool)

(declare-fun res!452117 () Bool)

(assert (=> b!687163 (=> (not res!452117) (not e!391315))))

(assert (=> b!687163 (= res!452117 (not (contains!3630 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687164 () Bool)

(declare-fun Unit!24231 () Unit!24227)

(assert (=> b!687164 (= e!391316 Unit!24231)))

(assert (= (and start!61372 res!452118) b!687150))

(assert (= (and b!687150 res!452132) b!687149))

(assert (= (and b!687149 res!452128) b!687163))

(assert (= (and b!687163 res!452117) b!687155))

(assert (= (and b!687155 res!452126) b!687160))

(assert (= (and b!687155 (not res!452130)) b!687154))

(assert (= (and b!687154 res!452129) b!687148))

(assert (= (and b!687155 res!452122) b!687152))

(assert (= (and b!687152 res!452121) b!687156))

(assert (= (and b!687156 res!452119) b!687147))

(assert (= (and b!687147 res!452124) b!687159))

(assert (= (and b!687159 res!452131) b!687157))

(assert (= (and b!687157 res!452125) b!687161))

(assert (= (and b!687161 res!452123) b!687153))

(assert (= (and b!687153 c!77881) b!687146))

(assert (= (and b!687153 (not c!77881)) b!687145))

(assert (= (and b!687153 c!77882) b!687158))

(assert (= (and b!687153 (not c!77882)) b!687164))

(assert (= (and b!687153 (not res!452127)) b!687162))

(assert (= (and b!687162 (not res!452120)) b!687144))

(assert (= (and b!687144 res!452116) b!687151))

(declare-fun m!651187 () Bool)

(assert (=> b!687160 m!651187))

(declare-fun m!651189 () Bool)

(assert (=> b!687150 m!651189))

(declare-fun m!651191 () Bool)

(assert (=> b!687151 m!651191))

(declare-fun m!651193 () Bool)

(assert (=> b!687162 m!651193))

(assert (=> b!687148 m!651187))

(declare-fun m!651195 () Bool)

(assert (=> start!61372 m!651195))

(declare-fun m!651197 () Bool)

(assert (=> b!687144 m!651197))

(declare-fun m!651199 () Bool)

(assert (=> b!687153 m!651199))

(declare-fun m!651201 () Bool)

(assert (=> b!687153 m!651201))

(declare-fun m!651203 () Bool)

(assert (=> b!687153 m!651203))

(declare-fun m!651205 () Bool)

(assert (=> b!687153 m!651205))

(declare-fun m!651207 () Bool)

(assert (=> b!687153 m!651207))

(declare-fun m!651209 () Bool)

(assert (=> b!687153 m!651209))

(declare-fun m!651211 () Bool)

(assert (=> b!687153 m!651211))

(declare-fun m!651213 () Bool)

(assert (=> b!687153 m!651213))

(assert (=> b!687153 m!651203))

(declare-fun m!651215 () Bool)

(assert (=> b!687153 m!651215))

(declare-fun m!651217 () Bool)

(assert (=> b!687153 m!651217))

(declare-fun m!651219 () Bool)

(assert (=> b!687153 m!651219))

(declare-fun m!651221 () Bool)

(assert (=> b!687153 m!651221))

(declare-fun m!651223 () Bool)

(assert (=> b!687153 m!651223))

(declare-fun m!651225 () Bool)

(assert (=> b!687152 m!651225))

(declare-fun m!651227 () Bool)

(assert (=> b!687156 m!651227))

(declare-fun m!651229 () Bool)

(assert (=> b!687146 m!651229))

(declare-fun m!651231 () Bool)

(assert (=> b!687157 m!651231))

(declare-fun m!651233 () Bool)

(assert (=> b!687163 m!651233))

(declare-fun m!651235 () Bool)

(assert (=> b!687159 m!651235))

(declare-fun m!651237 () Bool)

(assert (=> b!687149 m!651237))

(assert (=> b!687158 m!651201))

(assert (=> b!687158 m!651203))

(declare-fun m!651239 () Bool)

(assert (=> b!687158 m!651239))

(declare-fun m!651241 () Bool)

(assert (=> b!687158 m!651241))

(assert (=> b!687158 m!651203))

(assert (=> b!687158 m!651239))

(assert (=> b!687158 m!651209))

(assert (=> b!687158 m!651223))

(check-sat (not b!687151) (not b!687150) (not b!687148) (not b!687157) (not b!687149) (not b!687144) (not b!687160) (not b!687159) (not b!687163) (not b!687146) (not b!687152) (not start!61372) (not b!687158) (not b!687156) (not b!687162) (not b!687153))
(check-sat)
(get-model)

(declare-fun d!94913 () Bool)

(declare-fun lt!315358 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!297 (List!13053) (InoxSet (_ BitVec 64)))

(assert (=> d!94913 (= lt!315358 (select (content!297 acc!681) k0!2843))))

(declare-fun e!391353 () Bool)

(assert (=> d!94913 (= lt!315358 e!391353)))

(declare-fun res!452188 () Bool)

(assert (=> d!94913 (=> (not res!452188) (not e!391353))))

(get-info :version)

(assert (=> d!94913 (= res!452188 ((_ is Cons!13049) acc!681))))

(assert (=> d!94913 (= (contains!3630 acc!681 k0!2843) lt!315358)))

(declare-fun b!687232 () Bool)

(declare-fun e!391352 () Bool)

(assert (=> b!687232 (= e!391353 e!391352)))

(declare-fun res!452189 () Bool)

(assert (=> b!687232 (=> res!452189 e!391352)))

(assert (=> b!687232 (= res!452189 (= (h!14094 acc!681) k0!2843))))

(declare-fun b!687233 () Bool)

(assert (=> b!687233 (= e!391352 (contains!3630 (t!19311 acc!681) k0!2843))))

(assert (= (and d!94913 res!452188) b!687232))

(assert (= (and b!687232 (not res!452189)) b!687233))

(declare-fun m!651299 () Bool)

(assert (=> d!94913 m!651299))

(declare-fun m!651301 () Bool)

(assert (=> d!94913 m!651301))

(declare-fun m!651303 () Bool)

(assert (=> b!687233 m!651303))

(assert (=> b!687160 d!94913))

(declare-fun d!94915 () Bool)

(declare-fun lt!315359 () Bool)

(assert (=> d!94915 (= lt!315359 (select (content!297 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391355 () Bool)

(assert (=> d!94915 (= lt!315359 e!391355)))

(declare-fun res!452190 () Bool)

(assert (=> d!94915 (=> (not res!452190) (not e!391355))))

(assert (=> d!94915 (= res!452190 ((_ is Cons!13049) acc!681))))

(assert (=> d!94915 (= (contains!3630 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315359)))

(declare-fun b!687234 () Bool)

(declare-fun e!391354 () Bool)

(assert (=> b!687234 (= e!391355 e!391354)))

(declare-fun res!452191 () Bool)

(assert (=> b!687234 (=> res!452191 e!391354)))

(assert (=> b!687234 (= res!452191 (= (h!14094 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687235 () Bool)

(assert (=> b!687235 (= e!391354 (contains!3630 (t!19311 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94915 res!452190) b!687234))

(assert (= (and b!687234 (not res!452191)) b!687235))

(assert (=> d!94915 m!651299))

(declare-fun m!651305 () Bool)

(assert (=> d!94915 m!651305))

(declare-fun m!651307 () Bool)

(assert (=> b!687235 m!651307))

(assert (=> b!687149 d!94915))

(declare-fun d!94917 () Bool)

(assert (=> d!94917 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687159 d!94917))

(assert (=> b!687148 d!94913))

(declare-fun d!94919 () Bool)

(assert (=> d!94919 (= ($colon$colon!381 acc!681 (select (arr!19012 a!3626) from!3004)) (Cons!13049 (select (arr!19012 a!3626) from!3004) acc!681))))

(assert (=> b!687158 d!94919))

(declare-fun b!687252 () Bool)

(declare-fun e!391373 () Bool)

(declare-fun e!391374 () Bool)

(assert (=> b!687252 (= e!391373 e!391374)))

(declare-fun res!452208 () Bool)

(assert (=> b!687252 (=> (not res!452208) (not e!391374))))

(assert (=> b!687252 (= res!452208 ((_ is Cons!13049) acc!681))))

(declare-fun b!687254 () Bool)

(declare-fun e!391375 () Bool)

(assert (=> b!687254 (= e!391375 (subseq!216 (t!19311 acc!681) (t!19311 acc!681)))))

(declare-fun b!687255 () Bool)

(declare-fun e!391372 () Bool)

(assert (=> b!687255 (= e!391372 (subseq!216 acc!681 (t!19311 acc!681)))))

(declare-fun b!687253 () Bool)

(assert (=> b!687253 (= e!391374 e!391372)))

(declare-fun res!452210 () Bool)

(assert (=> b!687253 (=> res!452210 e!391372)))

(assert (=> b!687253 (= res!452210 e!391375)))

(declare-fun res!452211 () Bool)

(assert (=> b!687253 (=> (not res!452211) (not e!391375))))

(assert (=> b!687253 (= res!452211 (= (h!14094 acc!681) (h!14094 acc!681)))))

(declare-fun d!94923 () Bool)

(declare-fun res!452209 () Bool)

(assert (=> d!94923 (=> res!452209 e!391373)))

(assert (=> d!94923 (= res!452209 ((_ is Nil!13050) acc!681))))

(assert (=> d!94923 (= (subseq!216 acc!681 acc!681) e!391373)))

(assert (= (and d!94923 (not res!452209)) b!687252))

(assert (= (and b!687252 res!452208) b!687253))

(assert (= (and b!687253 res!452211) b!687254))

(assert (= (and b!687253 (not res!452210)) b!687255))

(declare-fun m!651319 () Bool)

(assert (=> b!687254 m!651319))

(declare-fun m!651321 () Bool)

(assert (=> b!687255 m!651321))

(assert (=> b!687158 d!94923))

(declare-fun d!94931 () Bool)

(assert (=> d!94931 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315370 () Unit!24227)

(declare-fun choose!80 (array!39675 List!13053 List!13053 (_ BitVec 32)) Unit!24227)

(assert (=> d!94931 (= lt!315370 (choose!80 a!3626 ($colon$colon!381 acc!681 (select (arr!19012 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94931 (bvslt (size!19389 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94931 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!381 acc!681 (select (arr!19012 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315370)))

(declare-fun bs!20150 () Bool)

(assert (= bs!20150 d!94931))

(assert (=> bs!20150 m!651201))

(assert (=> bs!20150 m!651239))

(declare-fun m!651335 () Bool)

(assert (=> bs!20150 m!651335))

(assert (=> b!687158 d!94931))

(declare-fun d!94939 () Bool)

(assert (=> d!94939 (subseq!216 acc!681 acc!681)))

(declare-fun lt!315373 () Unit!24227)

(declare-fun choose!36 (List!13053) Unit!24227)

(assert (=> d!94939 (= lt!315373 (choose!36 acc!681))))

(assert (=> d!94939 (= (lemmaListSubSeqRefl!0 acc!681) lt!315373)))

(declare-fun bs!20151 () Bool)

(assert (= bs!20151 d!94939))

(assert (=> bs!20151 m!651223))

(declare-fun m!651337 () Bool)

(assert (=> bs!20151 m!651337))

(assert (=> b!687158 d!94939))

(declare-fun b!687304 () Bool)

(declare-fun e!391419 () Bool)

(declare-fun call!34136 () Bool)

(assert (=> b!687304 (= e!391419 call!34136)))

(declare-fun b!687305 () Bool)

(declare-fun e!391417 () Bool)

(declare-fun e!391418 () Bool)

(assert (=> b!687305 (= e!391417 e!391418)))

(declare-fun res!452244 () Bool)

(assert (=> b!687305 (=> (not res!452244) (not e!391418))))

(declare-fun e!391416 () Bool)

(assert (=> b!687305 (= res!452244 (not e!391416))))

(declare-fun res!452246 () Bool)

(assert (=> b!687305 (=> (not res!452246) (not e!391416))))

(assert (=> b!687305 (= res!452246 (validKeyInArray!0 (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687306 () Bool)

(assert (=> b!687306 (= e!391418 e!391419)))

(declare-fun c!77897 () Bool)

(assert (=> b!687306 (= c!77897 (validKeyInArray!0 (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34133 () Bool)

(assert (=> bm!34133 (= call!34136 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77897 (Cons!13049 (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687307 () Bool)

(assert (=> b!687307 (= e!391419 call!34136)))

(declare-fun d!94941 () Bool)

(declare-fun res!452245 () Bool)

(assert (=> d!94941 (=> res!452245 e!391417)))

(assert (=> d!94941 (= res!452245 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19389 a!3626)))))

(assert (=> d!94941 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391417)))

(declare-fun b!687308 () Bool)

(assert (=> b!687308 (= e!391416 (contains!3630 acc!681 (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94941 (not res!452245)) b!687305))

(assert (= (and b!687305 res!452246) b!687308))

(assert (= (and b!687305 res!452244) b!687306))

(assert (= (and b!687306 c!77897) b!687304))

(assert (= (and b!687306 (not c!77897)) b!687307))

(assert (= (or b!687304 b!687307) bm!34133))

(declare-fun m!651347 () Bool)

(assert (=> b!687305 m!651347))

(assert (=> b!687305 m!651347))

(declare-fun m!651349 () Bool)

(assert (=> b!687305 m!651349))

(assert (=> b!687306 m!651347))

(assert (=> b!687306 m!651347))

(assert (=> b!687306 m!651349))

(assert (=> bm!34133 m!651347))

(declare-fun m!651351 () Bool)

(assert (=> bm!34133 m!651351))

(assert (=> b!687308 m!651347))

(assert (=> b!687308 m!651347))

(declare-fun m!651353 () Bool)

(assert (=> b!687308 m!651353))

(assert (=> b!687158 d!94941))

(declare-fun b!687309 () Bool)

(declare-fun e!391423 () Bool)

(declare-fun call!34137 () Bool)

(assert (=> b!687309 (= e!391423 call!34137)))

(declare-fun b!687310 () Bool)

(declare-fun e!391421 () Bool)

(declare-fun e!391422 () Bool)

(assert (=> b!687310 (= e!391421 e!391422)))

(declare-fun res!452247 () Bool)

(assert (=> b!687310 (=> (not res!452247) (not e!391422))))

(declare-fun e!391420 () Bool)

(assert (=> b!687310 (= res!452247 (not e!391420))))

(declare-fun res!452249 () Bool)

(assert (=> b!687310 (=> (not res!452249) (not e!391420))))

(assert (=> b!687310 (= res!452249 (validKeyInArray!0 (select (arr!19012 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687311 () Bool)

(assert (=> b!687311 (= e!391422 e!391423)))

(declare-fun c!77898 () Bool)

(assert (=> b!687311 (= c!77898 (validKeyInArray!0 (select (arr!19012 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34134 () Bool)

(assert (=> bm!34134 (= call!34137 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77898 (Cons!13049 (select (arr!19012 a!3626) #b00000000000000000000000000000000) Nil!13050) Nil!13050)))))

(declare-fun b!687312 () Bool)

(assert (=> b!687312 (= e!391423 call!34137)))

(declare-fun d!94947 () Bool)

(declare-fun res!452248 () Bool)

(assert (=> d!94947 (=> res!452248 e!391421)))

(assert (=> d!94947 (= res!452248 (bvsge #b00000000000000000000000000000000 (size!19389 a!3626)))))

(assert (=> d!94947 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13050) e!391421)))

(declare-fun b!687313 () Bool)

(assert (=> b!687313 (= e!391420 (contains!3630 Nil!13050 (select (arr!19012 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94947 (not res!452248)) b!687310))

(assert (= (and b!687310 res!452249) b!687313))

(assert (= (and b!687310 res!452247) b!687311))

(assert (= (and b!687311 c!77898) b!687309))

(assert (= (and b!687311 (not c!77898)) b!687312))

(assert (= (or b!687309 b!687312) bm!34134))

(declare-fun m!651355 () Bool)

(assert (=> b!687310 m!651355))

(assert (=> b!687310 m!651355))

(declare-fun m!651357 () Bool)

(assert (=> b!687310 m!651357))

(assert (=> b!687311 m!651355))

(assert (=> b!687311 m!651355))

(assert (=> b!687311 m!651357))

(assert (=> bm!34134 m!651355))

(declare-fun m!651359 () Bool)

(assert (=> bm!34134 m!651359))

(assert (=> b!687313 m!651355))

(assert (=> b!687313 m!651355))

(declare-fun m!651361 () Bool)

(assert (=> b!687313 m!651361))

(assert (=> b!687152 d!94947))

(declare-fun d!94949 () Bool)

(declare-fun res!452272 () Bool)

(declare-fun e!391446 () Bool)

(assert (=> d!94949 (=> res!452272 e!391446)))

(assert (=> d!94949 (= res!452272 ((_ is Nil!13050) lt!315320))))

(assert (=> d!94949 (= (noDuplicate!877 lt!315320) e!391446)))

(declare-fun b!687336 () Bool)

(declare-fun e!391447 () Bool)

(assert (=> b!687336 (= e!391446 e!391447)))

(declare-fun res!452273 () Bool)

(assert (=> b!687336 (=> (not res!452273) (not e!391447))))

(assert (=> b!687336 (= res!452273 (not (contains!3630 (t!19311 lt!315320) (h!14094 lt!315320))))))

(declare-fun b!687337 () Bool)

(assert (=> b!687337 (= e!391447 (noDuplicate!877 (t!19311 lt!315320)))))

(assert (= (and d!94949 (not res!452272)) b!687336))

(assert (= (and b!687336 res!452273) b!687337))

(declare-fun m!651371 () Bool)

(assert (=> b!687336 m!651371))

(declare-fun m!651373 () Bool)

(assert (=> b!687337 m!651373))

(assert (=> b!687162 d!94949))

(declare-fun d!94955 () Bool)

(declare-fun lt!315374 () Bool)

(assert (=> d!94955 (= lt!315374 (select (content!297 lt!315320) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391449 () Bool)

(assert (=> d!94955 (= lt!315374 e!391449)))

(declare-fun res!452274 () Bool)

(assert (=> d!94955 (=> (not res!452274) (not e!391449))))

(assert (=> d!94955 (= res!452274 ((_ is Cons!13049) lt!315320))))

(assert (=> d!94955 (= (contains!3630 lt!315320 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315374)))

(declare-fun b!687338 () Bool)

(declare-fun e!391448 () Bool)

(assert (=> b!687338 (= e!391449 e!391448)))

(declare-fun res!452275 () Bool)

(assert (=> b!687338 (=> res!452275 e!391448)))

(assert (=> b!687338 (= res!452275 (= (h!14094 lt!315320) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687339 () Bool)

(assert (=> b!687339 (= e!391448 (contains!3630 (t!19311 lt!315320) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94955 res!452274) b!687338))

(assert (= (and b!687338 (not res!452275)) b!687339))

(declare-fun m!651375 () Bool)

(assert (=> d!94955 m!651375))

(declare-fun m!651377 () Bool)

(assert (=> d!94955 m!651377))

(declare-fun m!651379 () Bool)

(assert (=> b!687339 m!651379))

(assert (=> b!687151 d!94955))

(declare-fun d!94959 () Bool)

(declare-fun res!452276 () Bool)

(declare-fun e!391450 () Bool)

(assert (=> d!94959 (=> res!452276 e!391450)))

(assert (=> d!94959 (= res!452276 ((_ is Nil!13050) acc!681))))

(assert (=> d!94959 (= (noDuplicate!877 acc!681) e!391450)))

(declare-fun b!687340 () Bool)

(declare-fun e!391451 () Bool)

(assert (=> b!687340 (= e!391450 e!391451)))

(declare-fun res!452277 () Bool)

(assert (=> b!687340 (=> (not res!452277) (not e!391451))))

(assert (=> b!687340 (= res!452277 (not (contains!3630 (t!19311 acc!681) (h!14094 acc!681))))))

(declare-fun b!687341 () Bool)

(assert (=> b!687341 (= e!391451 (noDuplicate!877 (t!19311 acc!681)))))

(assert (= (and d!94959 (not res!452276)) b!687340))

(assert (= (and b!687340 res!452277) b!687341))

(declare-fun m!651381 () Bool)

(assert (=> b!687340 m!651381))

(declare-fun m!651383 () Bool)

(assert (=> b!687341 m!651383))

(assert (=> b!687150 d!94959))

(declare-fun d!94961 () Bool)

(assert (=> d!94961 (= (array_inv!14808 a!3626) (bvsge (size!19389 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61372 d!94961))

(declare-fun d!94963 () Bool)

(declare-fun lt!315375 () Bool)

(assert (=> d!94963 (= lt!315375 (select (content!297 lt!315320) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391457 () Bool)

(assert (=> d!94963 (= lt!315375 e!391457)))

(declare-fun res!452282 () Bool)

(assert (=> d!94963 (=> (not res!452282) (not e!391457))))

(assert (=> d!94963 (= res!452282 ((_ is Cons!13049) lt!315320))))

(assert (=> d!94963 (= (contains!3630 lt!315320 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315375)))

(declare-fun b!687346 () Bool)

(declare-fun e!391456 () Bool)

(assert (=> b!687346 (= e!391457 e!391456)))

(declare-fun res!452283 () Bool)

(assert (=> b!687346 (=> res!452283 e!391456)))

(assert (=> b!687346 (= res!452283 (= (h!14094 lt!315320) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687347 () Bool)

(assert (=> b!687347 (= e!391456 (contains!3630 (t!19311 lt!315320) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94963 res!452282) b!687346))

(assert (= (and b!687346 (not res!452283)) b!687347))

(assert (=> d!94963 m!651375))

(declare-fun m!651385 () Bool)

(assert (=> d!94963 m!651385))

(declare-fun m!651387 () Bool)

(assert (=> b!687347 m!651387))

(assert (=> b!687144 d!94963))

(declare-fun b!687374 () Bool)

(declare-fun e!391483 () List!13053)

(assert (=> b!687374 (= e!391483 Nil!13050)))

(declare-fun b!687375 () Bool)

(declare-fun lt!315388 () List!13053)

(declare-fun e!391482 () Bool)

(assert (=> b!687375 (= e!391482 (= (content!297 lt!315388) ((_ map and) (content!297 lt!315320) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!687376 () Bool)

(declare-fun e!391481 () List!13053)

(declare-fun call!34140 () List!13053)

(assert (=> b!687376 (= e!391481 (Cons!13049 (h!14094 lt!315320) call!34140))))

(declare-fun b!687377 () Bool)

(assert (=> b!687377 (= e!391483 e!391481)))

(declare-fun c!77903 () Bool)

(assert (=> b!687377 (= c!77903 (= k0!2843 (h!14094 lt!315320)))))

(declare-fun bm!34137 () Bool)

(assert (=> bm!34137 (= call!34140 (-!181 (t!19311 lt!315320) k0!2843))))

(declare-fun d!94965 () Bool)

(assert (=> d!94965 e!391482))

(declare-fun res!452302 () Bool)

(assert (=> d!94965 (=> (not res!452302) (not e!391482))))

(declare-fun size!19391 (List!13053) Int)

(assert (=> d!94965 (= res!452302 (<= (size!19391 lt!315388) (size!19391 lt!315320)))))

(assert (=> d!94965 (= lt!315388 e!391483)))

(declare-fun c!77904 () Bool)

(assert (=> d!94965 (= c!77904 ((_ is Cons!13049) lt!315320))))

(assert (=> d!94965 (= (-!181 lt!315320 k0!2843) lt!315388)))

(declare-fun b!687378 () Bool)

(assert (=> b!687378 (= e!391481 call!34140)))

(assert (= (and d!94965 c!77904) b!687377))

(assert (= (and d!94965 (not c!77904)) b!687374))

(assert (= (and b!687377 c!77903) b!687378))

(assert (= (and b!687377 (not c!77903)) b!687376))

(assert (= (or b!687378 b!687376) bm!34137))

(assert (= (and d!94965 res!452302) b!687375))

(declare-fun m!651413 () Bool)

(assert (=> b!687375 m!651413))

(assert (=> b!687375 m!651375))

(declare-fun m!651415 () Bool)

(assert (=> b!687375 m!651415))

(declare-fun m!651417 () Bool)

(assert (=> bm!34137 m!651417))

(declare-fun m!651419 () Bool)

(assert (=> d!94965 m!651419))

(declare-fun m!651421 () Bool)

(assert (=> d!94965 m!651421))

(assert (=> b!687153 d!94965))

(declare-fun d!94983 () Bool)

(declare-fun res!452322 () Bool)

(declare-fun e!391504 () Bool)

(assert (=> d!94983 (=> res!452322 e!391504)))

(assert (=> d!94983 (= res!452322 (= (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94983 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391504)))

(declare-fun b!687400 () Bool)

(declare-fun e!391505 () Bool)

(assert (=> b!687400 (= e!391504 e!391505)))

(declare-fun res!452323 () Bool)

(assert (=> b!687400 (=> (not res!452323) (not e!391505))))

(assert (=> b!687400 (= res!452323 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19389 a!3626)))))

(declare-fun b!687401 () Bool)

(assert (=> b!687401 (= e!391505 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94983 (not res!452322)) b!687400))

(assert (= (and b!687400 res!452323) b!687401))

(assert (=> d!94983 m!651347))

(declare-fun m!651435 () Bool)

(assert (=> b!687401 m!651435))

(assert (=> b!687153 d!94983))

(declare-fun b!687402 () Bool)

(declare-fun e!391509 () Bool)

(declare-fun call!34142 () Bool)

(assert (=> b!687402 (= e!391509 call!34142)))

(declare-fun b!687403 () Bool)

(declare-fun e!391507 () Bool)

(declare-fun e!391508 () Bool)

(assert (=> b!687403 (= e!391507 e!391508)))

(declare-fun res!452324 () Bool)

(assert (=> b!687403 (=> (not res!452324) (not e!391508))))

(declare-fun e!391506 () Bool)

(assert (=> b!687403 (= res!452324 (not e!391506))))

(declare-fun res!452326 () Bool)

(assert (=> b!687403 (=> (not res!452326) (not e!391506))))

(assert (=> b!687403 (= res!452326 (validKeyInArray!0 (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687404 () Bool)

(assert (=> b!687404 (= e!391508 e!391509)))

(declare-fun c!77906 () Bool)

(assert (=> b!687404 (= c!77906 (validKeyInArray!0 (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34139 () Bool)

(assert (=> bm!34139 (= call!34142 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77906 (Cons!13049 (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315320) lt!315320)))))

(declare-fun b!687405 () Bool)

(assert (=> b!687405 (= e!391509 call!34142)))

(declare-fun d!94989 () Bool)

(declare-fun res!452325 () Bool)

(assert (=> d!94989 (=> res!452325 e!391507)))

(assert (=> d!94989 (= res!452325 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19389 a!3626)))))

(assert (=> d!94989 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315320) e!391507)))

(declare-fun b!687406 () Bool)

(assert (=> b!687406 (= e!391506 (contains!3630 lt!315320 (select (arr!19012 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94989 (not res!452325)) b!687403))

(assert (= (and b!687403 res!452326) b!687406))

(assert (= (and b!687403 res!452324) b!687404))

(assert (= (and b!687404 c!77906) b!687402))

(assert (= (and b!687404 (not c!77906)) b!687405))

(assert (= (or b!687402 b!687405) bm!34139))

(assert (=> b!687403 m!651347))

(assert (=> b!687403 m!651347))

(assert (=> b!687403 m!651349))

(assert (=> b!687404 m!651347))

(assert (=> b!687404 m!651347))

(assert (=> b!687404 m!651349))

(assert (=> bm!34139 m!651347))

(declare-fun m!651439 () Bool)

(assert (=> bm!34139 m!651439))

(assert (=> b!687406 m!651347))

(assert (=> b!687406 m!651347))

(declare-fun m!651441 () Bool)

(assert (=> b!687406 m!651441))

(assert (=> b!687153 d!94989))

(declare-fun d!94995 () Bool)

(assert (=> d!94995 (= (-!181 ($colon$colon!381 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!315400 () Unit!24227)

(declare-fun choose!16 ((_ BitVec 64) List!13053) Unit!24227)

(assert (=> d!94995 (= lt!315400 (choose!16 k0!2843 acc!681))))

(assert (=> d!94995 (not (contains!3630 acc!681 k0!2843))))

(assert (=> d!94995 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!315400)))

(declare-fun bs!20157 () Bool)

(assert (= bs!20157 d!94995))

(assert (=> bs!20157 m!651213))

(assert (=> bs!20157 m!651213))

(declare-fun m!651455 () Bool)

(assert (=> bs!20157 m!651455))

(declare-fun m!651457 () Bool)

(assert (=> bs!20157 m!651457))

(assert (=> bs!20157 m!651187))

(assert (=> b!687153 d!94995))

(declare-fun d!95005 () Bool)

(declare-fun res!452335 () Bool)

(declare-fun e!391520 () Bool)

(assert (=> d!95005 (=> res!452335 e!391520)))

(assert (=> d!95005 (= res!452335 (= (select (arr!19012 (array!39676 (store (arr!19012 a!3626) i!1382 k0!2843) (size!19389 a!3626))) from!3004) k0!2843))))

(assert (=> d!95005 (= (arrayContainsKey!0 (array!39676 (store (arr!19012 a!3626) i!1382 k0!2843) (size!19389 a!3626)) k0!2843 from!3004) e!391520)))

(declare-fun b!687419 () Bool)

(declare-fun e!391521 () Bool)

(assert (=> b!687419 (= e!391520 e!391521)))

(declare-fun res!452336 () Bool)

(assert (=> b!687419 (=> (not res!452336) (not e!391521))))

(assert (=> b!687419 (= res!452336 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19389 (array!39676 (store (arr!19012 a!3626) i!1382 k0!2843) (size!19389 a!3626)))))))

(declare-fun b!687420 () Bool)

(assert (=> b!687420 (= e!391521 (arrayContainsKey!0 (array!39676 (store (arr!19012 a!3626) i!1382 k0!2843) (size!19389 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95005 (not res!452335)) b!687419))

(assert (= (and b!687419 res!452336) b!687420))

(declare-fun m!651465 () Bool)

(assert (=> d!95005 m!651465))

(declare-fun m!651467 () Bool)

(assert (=> b!687420 m!651467))

(assert (=> b!687153 d!95005))

(declare-fun d!95007 () Bool)

(assert (=> d!95007 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315320)))

(declare-fun lt!315408 () Unit!24227)

(declare-fun choose!66 (array!39675 (_ BitVec 64) (_ BitVec 32) List!13053 List!13053) Unit!24227)

(assert (=> d!95007 (= lt!315408 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315320))))

(assert (=> d!95007 (bvslt (size!19389 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95007 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315320) lt!315408)))

(declare-fun bs!20158 () Bool)

(assert (= bs!20158 d!95007))

(assert (=> bs!20158 m!651199))

(declare-fun m!651487 () Bool)

(assert (=> bs!20158 m!651487))

(assert (=> b!687153 d!95007))

(assert (=> b!687153 d!94923))

(assert (=> b!687153 d!94939))

(declare-fun d!95021 () Bool)

(assert (=> d!95021 (= (validKeyInArray!0 (select (arr!19012 a!3626) from!3004)) (and (not (= (select (arr!19012 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19012 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687153 d!95021))

(declare-fun d!95023 () Bool)

(assert (=> d!95023 (= ($colon$colon!381 acc!681 k0!2843) (Cons!13049 k0!2843 acc!681))))

(assert (=> b!687153 d!95023))

(assert (=> b!687153 d!94941))

(declare-fun d!95025 () Bool)

(declare-fun lt!315409 () Bool)

(assert (=> d!95025 (= lt!315409 (select (content!297 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391542 () Bool)

(assert (=> d!95025 (= lt!315409 e!391542)))

(declare-fun res!452350 () Bool)

(assert (=> d!95025 (=> (not res!452350) (not e!391542))))

(assert (=> d!95025 (= res!452350 ((_ is Cons!13049) acc!681))))

(assert (=> d!95025 (= (contains!3630 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315409)))

(declare-fun b!687444 () Bool)

(declare-fun e!391541 () Bool)

(assert (=> b!687444 (= e!391542 e!391541)))

(declare-fun res!452351 () Bool)

(assert (=> b!687444 (=> res!452351 e!391541)))

(assert (=> b!687444 (= res!452351 (= (h!14094 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687445 () Bool)

(assert (=> b!687445 (= e!391541 (contains!3630 (t!19311 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95025 res!452350) b!687444))

(assert (= (and b!687444 (not res!452351)) b!687445))

(assert (=> d!95025 m!651299))

(declare-fun m!651495 () Bool)

(assert (=> d!95025 m!651495))

(declare-fun m!651497 () Bool)

(assert (=> b!687445 m!651497))

(assert (=> b!687163 d!95025))

(declare-fun d!95029 () Bool)

(declare-fun res!452352 () Bool)

(declare-fun e!391543 () Bool)

(assert (=> d!95029 (=> res!452352 e!391543)))

(assert (=> d!95029 (= res!452352 (= (select (arr!19012 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95029 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!391543)))

(declare-fun b!687446 () Bool)

(declare-fun e!391544 () Bool)

(assert (=> b!687446 (= e!391543 e!391544)))

(declare-fun res!452353 () Bool)

(assert (=> b!687446 (=> (not res!452353) (not e!391544))))

(assert (=> b!687446 (= res!452353 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19389 a!3626)))))

(declare-fun b!687447 () Bool)

(assert (=> b!687447 (= e!391544 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95029 (not res!452352)) b!687446))

(assert (= (and b!687446 res!452353) b!687447))

(assert (=> d!95029 m!651355))

(declare-fun m!651499 () Bool)

(assert (=> b!687447 m!651499))

(assert (=> b!687157 d!95029))

(declare-fun d!95031 () Bool)

(assert (=> d!95031 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315417 () Unit!24227)

(declare-fun choose!13 (array!39675 (_ BitVec 64) (_ BitVec 32)) Unit!24227)

(assert (=> d!95031 (= lt!315417 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95031 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95031 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!315417)))

(declare-fun bs!20160 () Bool)

(assert (= bs!20160 d!95031))

(assert (=> bs!20160 m!651231))

(declare-fun m!651517 () Bool)

(assert (=> bs!20160 m!651517))

(assert (=> b!687146 d!95031))

(declare-fun b!687455 () Bool)

(declare-fun e!391553 () Bool)

(declare-fun call!34149 () Bool)

(assert (=> b!687455 (= e!391553 call!34149)))

(declare-fun b!687456 () Bool)

(declare-fun e!391551 () Bool)

(declare-fun e!391552 () Bool)

(assert (=> b!687456 (= e!391551 e!391552)))

(declare-fun res!452357 () Bool)

(assert (=> b!687456 (=> (not res!452357) (not e!391552))))

(declare-fun e!391550 () Bool)

(assert (=> b!687456 (= res!452357 (not e!391550))))

(declare-fun res!452359 () Bool)

(assert (=> b!687456 (=> (not res!452359) (not e!391550))))

(assert (=> b!687456 (= res!452359 (validKeyInArray!0 (select (arr!19012 a!3626) from!3004)))))

(declare-fun b!687457 () Bool)

(assert (=> b!687457 (= e!391552 e!391553)))

(declare-fun c!77916 () Bool)

(assert (=> b!687457 (= c!77916 (validKeyInArray!0 (select (arr!19012 a!3626) from!3004)))))

(declare-fun bm!34146 () Bool)

(assert (=> bm!34146 (= call!34149 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77916 (Cons!13049 (select (arr!19012 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687458 () Bool)

(assert (=> b!687458 (= e!391553 call!34149)))

(declare-fun d!95039 () Bool)

(declare-fun res!452358 () Bool)

(assert (=> d!95039 (=> res!452358 e!391551)))

(assert (=> d!95039 (= res!452358 (bvsge from!3004 (size!19389 a!3626)))))

(assert (=> d!95039 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391551)))

(declare-fun b!687459 () Bool)

(assert (=> b!687459 (= e!391550 (contains!3630 acc!681 (select (arr!19012 a!3626) from!3004)))))

(assert (= (and d!95039 (not res!452358)) b!687456))

(assert (= (and b!687456 res!452359) b!687459))

(assert (= (and b!687456 res!452357) b!687457))

(assert (= (and b!687457 c!77916) b!687455))

(assert (= (and b!687457 (not c!77916)) b!687458))

(assert (= (or b!687455 b!687458) bm!34146))

(assert (=> b!687456 m!651203))

(assert (=> b!687456 m!651203))

(assert (=> b!687456 m!651215))

(assert (=> b!687457 m!651203))

(assert (=> b!687457 m!651203))

(assert (=> b!687457 m!651215))

(assert (=> bm!34146 m!651203))

(declare-fun m!651519 () Bool)

(assert (=> bm!34146 m!651519))

(assert (=> b!687459 m!651203))

(assert (=> b!687459 m!651203))

(declare-fun m!651521 () Bool)

(assert (=> b!687459 m!651521))

(assert (=> b!687156 d!95039))

(check-sat (not bm!34139) (not b!687403) (not b!687447) (not b!687337) (not d!94939) (not d!95007) (not b!687336) (not b!687456) (not b!687340) (not bm!34146) (not b!687457) (not b!687233) (not b!687375) (not b!687254) (not bm!34137) (not b!687341) (not d!94955) (not d!94915) (not d!94965) (not d!94931) (not d!95031) (not b!687445) (not b!687401) (not b!687255) (not b!687339) (not d!94913) (not b!687306) (not b!687420) (not b!687310) (not b!687313) (not b!687406) (not d!94963) (not b!687347) (not b!687308) (not b!687459) (not b!687235) (not b!687305) (not d!95025) (not bm!34134) (not b!687404) (not bm!34133) (not d!94995) (not b!687311))
(check-sat)
