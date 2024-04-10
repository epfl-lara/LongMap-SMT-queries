; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61370 () Bool)

(assert start!61370)

(declare-fun b!687081 () Bool)

(declare-fun res!452080 () Bool)

(declare-fun e!391288 () Bool)

(assert (=> b!687081 (=> (not res!452080) (not e!391288))))

(declare-fun e!391285 () Bool)

(assert (=> b!687081 (= res!452080 e!391285)))

(declare-fun res!452074 () Bool)

(assert (=> b!687081 (=> res!452074 e!391285)))

(declare-fun e!391286 () Bool)

(assert (=> b!687081 (= res!452074 e!391286)))

(declare-fun res!452070 () Bool)

(assert (=> b!687081 (=> (not res!452070) (not e!391286))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!687081 (= res!452070 (bvsgt from!3004 i!1382))))

(declare-fun b!687082 () Bool)

(declare-fun e!391287 () Bool)

(declare-datatypes ((List!13052 0))(
  ( (Nil!13049) (Cons!13048 (h!14093 (_ BitVec 64)) (t!19310 List!13052)) )
))
(declare-fun lt!315296 () List!13052)

(declare-fun contains!3629 (List!13052 (_ BitVec 64)) Bool)

(assert (=> b!687082 (= e!391287 (not (contains!3629 lt!315296 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!452073 () Bool)

(assert (=> start!61370 (=> (not res!452073) (not e!391288))))

(declare-datatypes ((array!39673 0))(
  ( (array!39674 (arr!19011 (Array (_ BitVec 32) (_ BitVec 64))) (size!19388 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39673)

(assert (=> start!61370 (= res!452073 (and (bvslt (size!19388 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19388 a!3626))))))

(assert (=> start!61370 e!391288))

(assert (=> start!61370 true))

(declare-fun array_inv!14807 (array!39673) Bool)

(assert (=> start!61370 (array_inv!14807 a!3626)))

(declare-fun b!687083 () Bool)

(declare-fun e!391289 () Bool)

(assert (=> b!687083 (= e!391288 (not e!391289))))

(declare-fun res!452075 () Bool)

(assert (=> b!687083 (=> res!452075 e!391289)))

(assert (=> b!687083 (= res!452075 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39673 (_ BitVec 32) List!13052) Bool)

(assert (=> b!687083 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315296)))

(declare-fun acc!681 () List!13052)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((Unit!24222 0))(
  ( (Unit!24223) )
))
(declare-fun lt!315295 () Unit!24222)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39673 (_ BitVec 64) (_ BitVec 32) List!13052 List!13052) Unit!24222)

(assert (=> b!687083 (= lt!315295 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315296))))

(declare-fun -!180 (List!13052 (_ BitVec 64)) List!13052)

(assert (=> b!687083 (= (-!180 lt!315296 k!2843) acc!681)))

(declare-fun $colon$colon!380 (List!13052 (_ BitVec 64)) List!13052)

(assert (=> b!687083 (= lt!315296 ($colon$colon!380 acc!681 k!2843))))

(declare-fun lt!315300 () Unit!24222)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13052) Unit!24222)

(assert (=> b!687083 (= lt!315300 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!215 (List!13052 List!13052) Bool)

(assert (=> b!687083 (subseq!215 acc!681 acc!681)))

(declare-fun lt!315297 () Unit!24222)

(declare-fun lemmaListSubSeqRefl!0 (List!13052) Unit!24222)

(assert (=> b!687083 (= lt!315297 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687083 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315293 () Unit!24222)

(declare-fun e!391292 () Unit!24222)

(assert (=> b!687083 (= lt!315293 e!391292)))

(declare-fun c!77876 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687083 (= c!77876 (validKeyInArray!0 (select (arr!19011 a!3626) from!3004)))))

(declare-fun lt!315294 () Unit!24222)

(declare-fun e!391290 () Unit!24222)

(assert (=> b!687083 (= lt!315294 e!391290)))

(declare-fun c!77875 () Bool)

(declare-fun arrayContainsKey!0 (array!39673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687083 (= c!77875 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687083 (arrayContainsKey!0 (array!39674 (store (arr!19011 a!3626) i!1382 k!2843) (size!19388 a!3626)) k!2843 from!3004)))

(declare-fun b!687084 () Bool)

(declare-fun res!452065 () Bool)

(assert (=> b!687084 (=> (not res!452065) (not e!391288))))

(assert (=> b!687084 (= res!452065 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19388 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!687085 () Bool)

(declare-fun res!452081 () Bool)

(assert (=> b!687085 (=> res!452081 e!391289)))

(declare-fun noDuplicate!876 (List!13052) Bool)

(assert (=> b!687085 (= res!452081 (not (noDuplicate!876 lt!315296)))))

(declare-fun b!687086 () Bool)

(declare-fun res!452067 () Bool)

(assert (=> b!687086 (=> (not res!452067) (not e!391288))))

(assert (=> b!687086 (= res!452067 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13049))))

(declare-fun b!687087 () Bool)

(declare-fun Unit!24224 () Unit!24222)

(assert (=> b!687087 (= e!391290 Unit!24224)))

(declare-fun lt!315299 () Unit!24222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39673 (_ BitVec 64) (_ BitVec 32)) Unit!24222)

(assert (=> b!687087 (= lt!315299 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!687087 false))

(declare-fun b!687088 () Bool)

(declare-fun lt!315298 () Unit!24222)

(assert (=> b!687088 (= e!391292 lt!315298)))

(declare-fun lt!315301 () Unit!24222)

(assert (=> b!687088 (= lt!315301 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687088 (subseq!215 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39673 List!13052 List!13052 (_ BitVec 32)) Unit!24222)

(assert (=> b!687088 (= lt!315298 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!380 acc!681 (select (arr!19011 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687088 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!687089 () Bool)

(declare-fun res!452076 () Bool)

(assert (=> b!687089 (=> (not res!452076) (not e!391288))))

(assert (=> b!687089 (= res!452076 (validKeyInArray!0 k!2843))))

(declare-fun b!687090 () Bool)

(declare-fun e!391291 () Bool)

(assert (=> b!687090 (= e!391285 e!391291)))

(declare-fun res!452077 () Bool)

(assert (=> b!687090 (=> (not res!452077) (not e!391291))))

(assert (=> b!687090 (= res!452077 (bvsle from!3004 i!1382))))

(declare-fun b!687091 () Bool)

(declare-fun Unit!24225 () Unit!24222)

(assert (=> b!687091 (= e!391292 Unit!24225)))

(declare-fun b!687092 () Bool)

(declare-fun Unit!24226 () Unit!24222)

(assert (=> b!687092 (= e!391290 Unit!24226)))

(declare-fun b!687093 () Bool)

(assert (=> b!687093 (= e!391289 e!391287)))

(declare-fun res!452078 () Bool)

(assert (=> b!687093 (=> (not res!452078) (not e!391287))))

(assert (=> b!687093 (= res!452078 (not (contains!3629 lt!315296 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687094 () Bool)

(declare-fun res!452069 () Bool)

(assert (=> b!687094 (=> (not res!452069) (not e!391288))))

(assert (=> b!687094 (= res!452069 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687095 () Bool)

(assert (=> b!687095 (= e!391286 (contains!3629 acc!681 k!2843))))

(declare-fun b!687096 () Bool)

(declare-fun res!452066 () Bool)

(assert (=> b!687096 (=> (not res!452066) (not e!391288))))

(assert (=> b!687096 (= res!452066 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19388 a!3626))))))

(declare-fun b!687097 () Bool)

(declare-fun res!452079 () Bool)

(assert (=> b!687097 (=> (not res!452079) (not e!391288))))

(assert (=> b!687097 (= res!452079 (not (contains!3629 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687098 () Bool)

(declare-fun res!452072 () Bool)

(assert (=> b!687098 (=> (not res!452072) (not e!391288))))

(assert (=> b!687098 (= res!452072 (not (contains!3629 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687099 () Bool)

(declare-fun res!452068 () Bool)

(assert (=> b!687099 (=> (not res!452068) (not e!391288))))

(assert (=> b!687099 (= res!452068 (noDuplicate!876 acc!681))))

(declare-fun b!687100 () Bool)

(declare-fun res!452071 () Bool)

(assert (=> b!687100 (=> (not res!452071) (not e!391288))))

(assert (=> b!687100 (= res!452071 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687101 () Bool)

(assert (=> b!687101 (= e!391291 (not (contains!3629 acc!681 k!2843)))))

(assert (= (and start!61370 res!452073) b!687099))

(assert (= (and b!687099 res!452068) b!687098))

(assert (= (and b!687098 res!452072) b!687097))

(assert (= (and b!687097 res!452079) b!687081))

(assert (= (and b!687081 res!452070) b!687095))

(assert (= (and b!687081 (not res!452074)) b!687090))

(assert (= (and b!687090 res!452077) b!687101))

(assert (= (and b!687081 res!452080) b!687086))

(assert (= (and b!687086 res!452067) b!687094))

(assert (= (and b!687094 res!452069) b!687096))

(assert (= (and b!687096 res!452066) b!687089))

(assert (= (and b!687089 res!452076) b!687100))

(assert (= (and b!687100 res!452071) b!687084))

(assert (= (and b!687084 res!452065) b!687083))

(assert (= (and b!687083 c!77875) b!687087))

(assert (= (and b!687083 (not c!77875)) b!687092))

(assert (= (and b!687083 c!77876) b!687088))

(assert (= (and b!687083 (not c!77876)) b!687091))

(assert (= (and b!687083 (not res!452075)) b!687085))

(assert (= (and b!687085 (not res!452081)) b!687093))

(assert (= (and b!687093 res!452078) b!687082))

(declare-fun m!651131 () Bool)

(assert (=> b!687099 m!651131))

(declare-fun m!651133 () Bool)

(assert (=> b!687100 m!651133))

(declare-fun m!651135 () Bool)

(assert (=> b!687097 m!651135))

(declare-fun m!651137 () Bool)

(assert (=> b!687095 m!651137))

(declare-fun m!651139 () Bool)

(assert (=> b!687088 m!651139))

(declare-fun m!651141 () Bool)

(assert (=> b!687088 m!651141))

(declare-fun m!651143 () Bool)

(assert (=> b!687088 m!651143))

(declare-fun m!651145 () Bool)

(assert (=> b!687088 m!651145))

(assert (=> b!687088 m!651141))

(assert (=> b!687088 m!651143))

(declare-fun m!651147 () Bool)

(assert (=> b!687088 m!651147))

(declare-fun m!651149 () Bool)

(assert (=> b!687088 m!651149))

(assert (=> b!687101 m!651137))

(declare-fun m!651151 () Bool)

(assert (=> b!687082 m!651151))

(declare-fun m!651153 () Bool)

(assert (=> b!687086 m!651153))

(declare-fun m!651155 () Bool)

(assert (=> b!687089 m!651155))

(declare-fun m!651157 () Bool)

(assert (=> start!61370 m!651157))

(declare-fun m!651159 () Bool)

(assert (=> b!687083 m!651159))

(assert (=> b!687083 m!651139))

(assert (=> b!687083 m!651141))

(declare-fun m!651161 () Bool)

(assert (=> b!687083 m!651161))

(declare-fun m!651163 () Bool)

(assert (=> b!687083 m!651163))

(declare-fun m!651165 () Bool)

(assert (=> b!687083 m!651165))

(assert (=> b!687083 m!651147))

(declare-fun m!651167 () Bool)

(assert (=> b!687083 m!651167))

(assert (=> b!687083 m!651141))

(declare-fun m!651169 () Bool)

(assert (=> b!687083 m!651169))

(declare-fun m!651171 () Bool)

(assert (=> b!687083 m!651171))

(declare-fun m!651173 () Bool)

(assert (=> b!687083 m!651173))

(declare-fun m!651175 () Bool)

(assert (=> b!687083 m!651175))

(assert (=> b!687083 m!651149))

(declare-fun m!651177 () Bool)

(assert (=> b!687094 m!651177))

(declare-fun m!651179 () Bool)

(assert (=> b!687093 m!651179))

(declare-fun m!651181 () Bool)

(assert (=> b!687085 m!651181))

(declare-fun m!651183 () Bool)

(assert (=> b!687087 m!651183))

(declare-fun m!651185 () Bool)

(assert (=> b!687098 m!651185))

(push 1)

(assert (not start!61370))

(assert (not b!687095))

(assert (not b!687098))

(assert (not b!687089))

(assert (not b!687088))

(assert (not b!687086))

(assert (not b!687082))

(assert (not b!687087))

(assert (not b!687094))

(assert (not b!687097))

(assert (not b!687101))

(assert (not b!687099))

(assert (not b!687093))

(assert (not b!687085))

(assert (not b!687083))

(assert (not b!687100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94921 () Bool)

(declare-fun lt!315362 () Bool)

(declare-fun content!298 (List!13052) (Set (_ BitVec 64)))

(assert (=> d!94921 (= lt!315362 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!298 lt!315296)))))

(declare-fun e!391368 () Bool)

(assert (=> d!94921 (= lt!315362 e!391368)))

(declare-fun res!452204 () Bool)

(assert (=> d!94921 (=> (not res!452204) (not e!391368))))

(assert (=> d!94921 (= res!452204 (is-Cons!13048 lt!315296))))

(assert (=> d!94921 (= (contains!3629 lt!315296 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315362)))

(declare-fun b!687248 () Bool)

(declare-fun e!391369 () Bool)

(assert (=> b!687248 (= e!391368 e!391369)))

(declare-fun res!452205 () Bool)

(assert (=> b!687248 (=> res!452205 e!391369)))

(assert (=> b!687248 (= res!452205 (= (h!14093 lt!315296) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687249 () Bool)

(assert (=> b!687249 (= e!391369 (contains!3629 (t!19310 lt!315296) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94921 res!452204) b!687248))

(assert (= (and b!687248 (not res!452205)) b!687249))

(declare-fun m!651309 () Bool)

(assert (=> d!94921 m!651309))

(declare-fun m!651311 () Bool)

(assert (=> d!94921 m!651311))

(declare-fun m!651313 () Bool)

(assert (=> b!687249 m!651313))

(assert (=> b!687093 d!94921))

(declare-fun d!94927 () Bool)

(declare-fun lt!315363 () Bool)

(assert (=> d!94927 (= lt!315363 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!298 lt!315296)))))

(declare-fun e!391370 () Bool)

(assert (=> d!94927 (= lt!315363 e!391370)))

(declare-fun res!452206 () Bool)

(assert (=> d!94927 (=> (not res!452206) (not e!391370))))

(assert (=> d!94927 (= res!452206 (is-Cons!13048 lt!315296))))

(assert (=> d!94927 (= (contains!3629 lt!315296 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315363)))

(declare-fun b!687250 () Bool)

(declare-fun e!391371 () Bool)

(assert (=> b!687250 (= e!391370 e!391371)))

(declare-fun res!452207 () Bool)

(assert (=> b!687250 (=> res!452207 e!391371)))

(assert (=> b!687250 (= res!452207 (= (h!14093 lt!315296) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687251 () Bool)

(assert (=> b!687251 (= e!391371 (contains!3629 (t!19310 lt!315296) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94927 res!452206) b!687250))

(assert (= (and b!687250 (not res!452207)) b!687251))

(assert (=> d!94927 m!651309))

(declare-fun m!651315 () Bool)

(assert (=> d!94927 m!651315))

(declare-fun m!651317 () Bool)

(assert (=> b!687251 m!651317))

(assert (=> b!687082 d!94927))

(declare-fun d!94929 () Bool)

(declare-fun res!452216 () Bool)

(declare-fun e!391380 () Bool)

(assert (=> d!94929 (=> res!452216 e!391380)))

(assert (=> d!94929 (= res!452216 (is-Nil!13049 lt!315296))))

(assert (=> d!94929 (= (noDuplicate!876 lt!315296) e!391380)))

(declare-fun b!687260 () Bool)

(declare-fun e!391381 () Bool)

(assert (=> b!687260 (= e!391380 e!391381)))

(declare-fun res!452217 () Bool)

(assert (=> b!687260 (=> (not res!452217) (not e!391381))))

(assert (=> b!687260 (= res!452217 (not (contains!3629 (t!19310 lt!315296) (h!14093 lt!315296))))))

(declare-fun b!687261 () Bool)

(assert (=> b!687261 (= e!391381 (noDuplicate!876 (t!19310 lt!315296)))))

(assert (= (and d!94929 (not res!452216)) b!687260))

(assert (= (and b!687260 res!452217) b!687261))

(declare-fun m!651325 () Bool)

(assert (=> b!687260 m!651325))

(declare-fun m!651327 () Bool)

(assert (=> b!687261 m!651327))

(assert (=> b!687085 d!94929))

(declare-fun d!94935 () Bool)

(declare-fun lt!315369 () Bool)

(assert (=> d!94935 (= lt!315369 (set.member k!2843 (content!298 acc!681)))))

(declare-fun e!391382 () Bool)

(assert (=> d!94935 (= lt!315369 e!391382)))

(declare-fun res!452218 () Bool)

(assert (=> d!94935 (=> (not res!452218) (not e!391382))))

(assert (=> d!94935 (= res!452218 (is-Cons!13048 acc!681))))

(assert (=> d!94935 (= (contains!3629 acc!681 k!2843) lt!315369)))

(declare-fun b!687262 () Bool)

(declare-fun e!391383 () Bool)

(assert (=> b!687262 (= e!391382 e!391383)))

(declare-fun res!452219 () Bool)

(assert (=> b!687262 (=> res!452219 e!391383)))

(assert (=> b!687262 (= res!452219 (= (h!14093 acc!681) k!2843))))

(declare-fun b!687263 () Bool)

(assert (=> b!687263 (= e!391383 (contains!3629 (t!19310 acc!681) k!2843))))

(assert (= (and d!94935 res!452218) b!687262))

(assert (= (and b!687262 (not res!452219)) b!687263))

(declare-fun m!651329 () Bool)

(assert (=> d!94935 m!651329))

(declare-fun m!651331 () Bool)

(assert (=> d!94935 m!651331))

(declare-fun m!651333 () Bool)

(assert (=> b!687263 m!651333))

(assert (=> b!687095 d!94935))

(declare-fun b!687295 () Bool)

(declare-fun e!391408 () Bool)

(declare-fun e!391411 () Bool)

(assert (=> b!687295 (= e!391408 e!391411)))

(declare-fun c!77895 () Bool)

(assert (=> b!687295 (= c!77895 (validKeyInArray!0 (select (arr!19011 a!3626) from!3004)))))

(declare-fun b!687296 () Bool)

(declare-fun e!391409 () Bool)

(assert (=> b!687296 (= e!391409 (contains!3629 acc!681 (select (arr!19011 a!3626) from!3004)))))

(declare-fun b!687297 () Bool)

(declare-fun call!34134 () Bool)

(assert (=> b!687297 (= e!391411 call!34134)))

(declare-fun d!94937 () Bool)

(declare-fun res!452238 () Bool)

(declare-fun e!391410 () Bool)

(assert (=> d!94937 (=> res!452238 e!391410)))

(assert (=> d!94937 (= res!452238 (bvsge from!3004 (size!19388 a!3626)))))

(assert (=> d!94937 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391410)))

(declare-fun b!687294 () Bool)

(assert (=> b!687294 (= e!391410 e!391408)))

(declare-fun res!452240 () Bool)

(assert (=> b!687294 (=> (not res!452240) (not e!391408))))

(assert (=> b!687294 (= res!452240 (not e!391409))))

(declare-fun res!452239 () Bool)

(assert (=> b!687294 (=> (not res!452239) (not e!391409))))

(assert (=> b!687294 (= res!452239 (validKeyInArray!0 (select (arr!19011 a!3626) from!3004)))))

(declare-fun bm!34131 () Bool)

(assert (=> bm!34131 (= call!34134 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77895 (Cons!13048 (select (arr!19011 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687298 () Bool)

(assert (=> b!687298 (= e!391411 call!34134)))

(assert (= (and d!94937 (not res!452238)) b!687294))

(assert (= (and b!687294 res!452239) b!687296))

(assert (= (and b!687294 res!452240) b!687295))

(assert (= (and b!687295 c!77895) b!687298))

(assert (= (and b!687295 (not c!77895)) b!687297))

(assert (= (or b!687298 b!687297) bm!34131))

(assert (=> b!687295 m!651141))

(assert (=> b!687295 m!651141))

(assert (=> b!687295 m!651169))

(assert (=> b!687296 m!651141))

(assert (=> b!687296 m!651141))

(declare-fun m!651339 () Bool)

(assert (=> b!687296 m!651339))

(assert (=> b!687294 m!651141))

(assert (=> b!687294 m!651141))

(assert (=> b!687294 m!651169))

(assert (=> bm!34131 m!651141))

(declare-fun m!651341 () Bool)

(assert (=> bm!34131 m!651341))

(assert (=> b!687094 d!94937))

(declare-fun b!687335 () Bool)

(declare-fun e!391442 () Bool)

(assert (=> b!687335 (= e!391442 (subseq!215 acc!681 (t!19310 acc!681)))))

(declare-fun b!687332 () Bool)

(declare-fun e!391445 () Bool)

(declare-fun e!391443 () Bool)

(assert (=> b!687332 (= e!391445 e!391443)))

(declare-fun res!452270 () Bool)

(assert (=> b!687332 (=> (not res!452270) (not e!391443))))

(assert (=> b!687332 (= res!452270 (is-Cons!13048 acc!681))))

(declare-fun b!687334 () Bool)

(declare-fun e!391444 () Bool)

(assert (=> b!687334 (= e!391444 (subseq!215 (t!19310 acc!681) (t!19310 acc!681)))))

(declare-fun b!687333 () Bool)

(assert (=> b!687333 (= e!391443 e!391442)))

(declare-fun res!452269 () Bool)

(assert (=> b!687333 (=> res!452269 e!391442)))

(assert (=> b!687333 (= res!452269 e!391444)))

(declare-fun res!452271 () Bool)

(assert (=> b!687333 (=> (not res!452271) (not e!391444))))

(assert (=> b!687333 (= res!452271 (= (h!14093 acc!681) (h!14093 acc!681)))))

(declare-fun d!94943 () Bool)

(declare-fun res!452268 () Bool)

(assert (=> d!94943 (=> res!452268 e!391445)))

(assert (=> d!94943 (= res!452268 (is-Nil!13049 acc!681))))

(assert (=> d!94943 (= (subseq!215 acc!681 acc!681) e!391445)))

(assert (= (and d!94943 (not res!452268)) b!687332))

(assert (= (and b!687332 res!452270) b!687333))

(assert (= (and b!687333 res!452271) b!687334))

(assert (= (and b!687333 (not res!452269)) b!687335))

(declare-fun m!651367 () Bool)

(assert (=> b!687335 m!651367))

(declare-fun m!651369 () Bool)

(assert (=> b!687334 m!651369))

(assert (=> b!687083 d!94943))

(declare-fun d!94953 () Bool)

(declare-fun res!452288 () Bool)

(declare-fun e!391462 () Bool)

(assert (=> d!94953 (=> res!452288 e!391462)))

(assert (=> d!94953 (= res!452288 (= (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94953 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391462)))

(declare-fun b!687352 () Bool)

(declare-fun e!391463 () Bool)

(assert (=> b!687352 (= e!391462 e!391463)))

(declare-fun res!452289 () Bool)

(assert (=> b!687352 (=> (not res!452289) (not e!391463))))

(assert (=> b!687352 (= res!452289 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19388 a!3626)))))

(declare-fun b!687353 () Bool)

(assert (=> b!687353 (= e!391463 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94953 (not res!452288)) b!687352))

(assert (= (and b!687352 res!452289) b!687353))

(declare-fun m!651389 () Bool)

(assert (=> d!94953 m!651389))

(declare-fun m!651391 () Bool)

(assert (=> b!687353 m!651391))

(assert (=> b!687083 d!94953))

(declare-fun d!94967 () Bool)

(assert (=> d!94967 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315296)))

(declare-fun lt!315384 () Unit!24222)

(declare-fun choose!66 (array!39673 (_ BitVec 64) (_ BitVec 32) List!13052 List!13052) Unit!24222)

(assert (=> d!94967 (= lt!315384 (choose!66 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315296))))

(assert (=> d!94967 (bvslt (size!19388 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94967 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315296) lt!315384)))

(declare-fun bs!20152 () Bool)

(assert (= bs!20152 d!94967))

(assert (=> bs!20152 m!651171))

(declare-fun m!651405 () Bool)

(assert (=> bs!20152 m!651405))

(assert (=> b!687083 d!94967))

(declare-fun d!94973 () Bool)

(assert (=> d!94973 (subseq!215 acc!681 acc!681)))

(declare-fun lt!315387 () Unit!24222)

(declare-fun choose!36 (List!13052) Unit!24222)

(assert (=> d!94973 (= lt!315387 (choose!36 acc!681))))

(assert (=> d!94973 (= (lemmaListSubSeqRefl!0 acc!681) lt!315387)))

(declare-fun bs!20153 () Bool)

(assert (= bs!20153 d!94973))

(assert (=> bs!20153 m!651149))

(declare-fun m!651411 () Bool)

(assert (=> bs!20153 m!651411))

(assert (=> b!687083 d!94973))

(declare-fun d!94979 () Bool)

(assert (=> d!94979 (= (validKeyInArray!0 (select (arr!19011 a!3626) from!3004)) (and (not (= (select (arr!19011 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19011 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687083 d!94979))

(declare-fun d!94981 () Bool)

(assert (=> d!94981 (= (-!180 ($colon$colon!380 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!315391 () Unit!24222)

(declare-fun choose!16 ((_ BitVec 64) List!13052) Unit!24222)

(assert (=> d!94981 (= lt!315391 (choose!16 k!2843 acc!681))))

(assert (=> d!94981 (not (contains!3629 acc!681 k!2843))))

(assert (=> d!94981 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!315391)))

(declare-fun bs!20154 () Bool)

(assert (= bs!20154 d!94981))

(assert (=> bs!20154 m!651167))

(assert (=> bs!20154 m!651167))

(declare-fun m!651423 () Bool)

(assert (=> bs!20154 m!651423))

(declare-fun m!651425 () Bool)

(assert (=> bs!20154 m!651425))

(assert (=> bs!20154 m!651137))

(assert (=> b!687083 d!94981))

(declare-fun b!687396 () Bool)

(declare-fun e!391500 () Bool)

(declare-fun e!391503 () Bool)

(assert (=> b!687396 (= e!391500 e!391503)))

(declare-fun c!77905 () Bool)

(assert (=> b!687396 (= c!77905 (validKeyInArray!0 (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun e!391501 () Bool)

(declare-fun b!687397 () Bool)

(assert (=> b!687397 (= e!391501 (contains!3629 lt!315296 (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687398 () Bool)

(declare-fun call!34141 () Bool)

(assert (=> b!687398 (= e!391503 call!34141)))

(declare-fun d!94985 () Bool)

(declare-fun res!452319 () Bool)

(declare-fun e!391502 () Bool)

(assert (=> d!94985 (=> res!452319 e!391502)))

(assert (=> d!94985 (= res!452319 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19388 a!3626)))))

(assert (=> d!94985 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315296) e!391502)))

(declare-fun b!687395 () Bool)

(assert (=> b!687395 (= e!391502 e!391500)))

(declare-fun res!452321 () Bool)

(assert (=> b!687395 (=> (not res!452321) (not e!391500))))

(assert (=> b!687395 (= res!452321 (not e!391501))))

(declare-fun res!452320 () Bool)

(assert (=> b!687395 (=> (not res!452320) (not e!391501))))

(assert (=> b!687395 (= res!452320 (validKeyInArray!0 (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34138 () Bool)

(assert (=> bm!34138 (= call!34141 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77905 (Cons!13048 (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315296) lt!315296)))))

(declare-fun b!687399 () Bool)

(assert (=> b!687399 (= e!391503 call!34141)))

(assert (= (and d!94985 (not res!452319)) b!687395))

(assert (= (and b!687395 res!452320) b!687397))

(assert (= (and b!687395 res!452321) b!687396))

(assert (= (and b!687396 c!77905) b!687399))

(assert (= (and b!687396 (not c!77905)) b!687398))

(assert (= (or b!687399 b!687398) bm!34138))

(assert (=> b!687396 m!651389))

(assert (=> b!687396 m!651389))

(declare-fun m!651431 () Bool)

(assert (=> b!687396 m!651431))

(assert (=> b!687397 m!651389))

(assert (=> b!687397 m!651389))

(declare-fun m!651433 () Bool)

(assert (=> b!687397 m!651433))

(assert (=> b!687395 m!651389))

(assert (=> b!687395 m!651389))

(assert (=> b!687395 m!651431))

(assert (=> bm!34138 m!651389))

(declare-fun m!651437 () Bool)

(assert (=> bm!34138 m!651437))

(assert (=> b!687083 d!94985))

(declare-fun d!94991 () Bool)

(assert (=> d!94991 (= ($colon$colon!380 acc!681 k!2843) (Cons!13048 k!2843 acc!681))))

(assert (=> b!687083 d!94991))

(declare-fun b!687408 () Bool)

(declare-fun e!391510 () Bool)

(declare-fun e!391513 () Bool)

(assert (=> b!687408 (= e!391510 e!391513)))

(declare-fun c!77907 () Bool)

(assert (=> b!687408 (= c!77907 (validKeyInArray!0 (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687409 () Bool)

(declare-fun e!391511 () Bool)

(assert (=> b!687409 (= e!391511 (contains!3629 acc!681 (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687410 () Bool)

(declare-fun call!34143 () Bool)

(assert (=> b!687410 (= e!391513 call!34143)))

(declare-fun d!94993 () Bool)

(declare-fun res!452327 () Bool)

(declare-fun e!391512 () Bool)

(assert (=> d!94993 (=> res!452327 e!391512)))

(assert (=> d!94993 (= res!452327 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19388 a!3626)))))

(assert (=> d!94993 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391512)))

(declare-fun b!687407 () Bool)

(assert (=> b!687407 (= e!391512 e!391510)))

(declare-fun res!452329 () Bool)

(assert (=> b!687407 (=> (not res!452329) (not e!391510))))

(assert (=> b!687407 (= res!452329 (not e!391511))))

(declare-fun res!452328 () Bool)

(assert (=> b!687407 (=> (not res!452328) (not e!391511))))

(assert (=> b!687407 (= res!452328 (validKeyInArray!0 (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34140 () Bool)

(assert (=> bm!34140 (= call!34143 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77907 (Cons!13048 (select (arr!19011 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687411 () Bool)

(assert (=> b!687411 (= e!391513 call!34143)))

(assert (= (and d!94993 (not res!452327)) b!687407))

(assert (= (and b!687407 res!452328) b!687409))

(assert (= (and b!687407 res!452329) b!687408))

(assert (= (and b!687408 c!77907) b!687411))

(assert (= (and b!687408 (not c!77907)) b!687410))

(assert (= (or b!687411 b!687410) bm!34140))

(assert (=> b!687408 m!651389))

(assert (=> b!687408 m!651389))

(assert (=> b!687408 m!651431))

(assert (=> b!687409 m!651389))

(assert (=> b!687409 m!651389))

(declare-fun m!651443 () Bool)

(assert (=> b!687409 m!651443))

(assert (=> b!687407 m!651389))

(assert (=> b!687407 m!651389))

(assert (=> b!687407 m!651431))

(assert (=> bm!34140 m!651389))

(declare-fun m!651445 () Bool)

(assert (=> bm!34140 m!651445))

(assert (=> b!687083 d!94993))

(declare-fun d!94997 () Bool)

(declare-fun res!452330 () Bool)

(declare-fun e!391514 () Bool)

(assert (=> d!94997 (=> res!452330 e!391514)))

(assert (=> d!94997 (= res!452330 (= (select (arr!19011 (array!39674 (store (arr!19011 a!3626) i!1382 k!2843) (size!19388 a!3626))) from!3004) k!2843))))

(assert (=> d!94997 (= (arrayContainsKey!0 (array!39674 (store (arr!19011 a!3626) i!1382 k!2843) (size!19388 a!3626)) k!2843 from!3004) e!391514)))

(declare-fun b!687412 () Bool)

(declare-fun e!391515 () Bool)

(assert (=> b!687412 (= e!391514 e!391515)))

(declare-fun res!452331 () Bool)

(assert (=> b!687412 (=> (not res!452331) (not e!391515))))

(assert (=> b!687412 (= res!452331 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19388 (array!39674 (store (arr!19011 a!3626) i!1382 k!2843) (size!19388 a!3626)))))))

(declare-fun b!687413 () Bool)

(assert (=> b!687413 (= e!391515 (arrayContainsKey!0 (array!39674 (store (arr!19011 a!3626) i!1382 k!2843) (size!19388 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94997 (not res!452330)) b!687412))

(assert (= (and b!687412 res!452331) b!687413))

(declare-fun m!651449 () Bool)

(assert (=> d!94997 m!651449))

(declare-fun m!651451 () Bool)

(assert (=> b!687413 m!651451))

(assert (=> b!687083 d!94997))

(declare-fun e!391546 () Bool)

(declare-fun b!687448 () Bool)

(declare-fun lt!315410 () List!13052)

(assert (=> b!687448 (= e!391546 (= (content!298 lt!315410) (set.minus (content!298 lt!315296) (set.insert k!2843 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun bm!34145 () Bool)

(declare-fun call!34148 () List!13052)

(assert (=> bm!34145 (= call!34148 (-!180 (t!19310 lt!315296) k!2843))))

(declare-fun b!687449 () Bool)

(declare-fun e!391547 () List!13052)

(assert (=> b!687449 (= e!391547 call!34148)))

(declare-fun d!95001 () Bool)

(assert (=> d!95001 e!391546))

(declare-fun res!452354 () Bool)

(assert (=> d!95001 (=> (not res!452354) (not e!391546))))

(declare-fun size!19392 (List!13052) Int)

(assert (=> d!95001 (= res!452354 (<= (size!19392 lt!315410) (size!19392 lt!315296)))))

(declare-fun e!391545 () List!13052)

(assert (=> d!95001 (= lt!315410 e!391545)))

(declare-fun c!77914 () Bool)

(assert (=> d!95001 (= c!77914 (is-Cons!13048 lt!315296))))

(assert (=> d!95001 (= (-!180 lt!315296 k!2843) lt!315410)))

(declare-fun b!687450 () Bool)

(assert (=> b!687450 (= e!391547 (Cons!13048 (h!14093 lt!315296) call!34148))))

(declare-fun b!687451 () Bool)

(assert (=> b!687451 (= e!391545 e!391547)))

(declare-fun c!77915 () Bool)

(assert (=> b!687451 (= c!77915 (= k!2843 (h!14093 lt!315296)))))

(declare-fun b!687452 () Bool)

(assert (=> b!687452 (= e!391545 Nil!13049)))

(assert (= (and d!95001 c!77914) b!687451))

(assert (= (and d!95001 (not c!77914)) b!687452))

(assert (= (and b!687451 c!77915) b!687449))

(assert (= (and b!687451 (not c!77915)) b!687450))

(assert (= (or b!687449 b!687450) bm!34145))

(assert (= (and d!95001 res!452354) b!687448))

(declare-fun m!651501 () Bool)

(assert (=> b!687448 m!651501))

(assert (=> b!687448 m!651309))

(declare-fun m!651503 () Bool)

(assert (=> b!687448 m!651503))

(declare-fun m!651505 () Bool)

(assert (=> bm!34145 m!651505))

(declare-fun m!651507 () Bool)

(assert (=> d!95001 m!651507))

(declare-fun m!651509 () Bool)

(assert (=> d!95001 m!651509))

(assert (=> b!687083 d!95001))

(declare-fun d!95033 () Bool)

(declare-fun lt!315411 () Bool)

(assert (=> d!95033 (= lt!315411 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!298 acc!681)))))

(declare-fun e!391548 () Bool)

(assert (=> d!95033 (= lt!315411 e!391548)))

(declare-fun res!452355 () Bool)

(assert (=> d!95033 (=> (not res!452355) (not e!391548))))

(assert (=> d!95033 (= res!452355 (is-Cons!13048 acc!681))))

(assert (=> d!95033 (= (contains!3629 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315411)))

(declare-fun b!687453 () Bool)

(declare-fun e!391549 () Bool)

(assert (=> b!687453 (= e!391548 e!391549)))

(declare-fun res!452356 () Bool)

(assert (=> b!687453 (=> res!452356 e!391549)))

(assert (=> b!687453 (= res!452356 (= (h!14093 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687454 () Bool)

(assert (=> b!687454 (= e!391549 (contains!3629 (t!19310 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95033 res!452355) b!687453))

(assert (= (and b!687453 (not res!452356)) b!687454))

(assert (=> d!95033 m!651329))

(declare-fun m!651511 () Bool)

(assert (=> d!95033 m!651511))

(declare-fun m!651513 () Bool)

(assert (=> b!687454 m!651513))

(assert (=> b!687098 d!95033))

(declare-fun d!95035 () Bool)

(assert (=> d!95035 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315420 () Unit!24222)

(declare-fun choose!13 (array!39673 (_ BitVec 64) (_ BitVec 32)) Unit!24222)

(assert (=> d!95035 (= lt!315420 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!95035 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95035 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!315420)))

(declare-fun bs!20161 () Bool)

(assert (= bs!20161 d!95035))

(assert (=> bs!20161 m!651133))

(declare-fun m!651523 () Bool)

(assert (=> bs!20161 m!651523))

(assert (=> b!687087 d!95035))

(declare-fun d!95041 () Bool)

(declare-fun lt!315421 () Bool)

(assert (=> d!95041 (= lt!315421 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!298 acc!681)))))

(declare-fun e!391554 () Bool)

(assert (=> d!95041 (= lt!315421 e!391554)))

(declare-fun res!452360 () Bool)

(assert (=> d!95041 (=> (not res!452360) (not e!391554))))

(assert (=> d!95041 (= res!452360 (is-Cons!13048 acc!681))))

(assert (=> d!95041 (= (contains!3629 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315421)))

(declare-fun b!687460 () Bool)

(declare-fun e!391555 () Bool)

(assert (=> b!687460 (= e!391554 e!391555)))

(declare-fun res!452361 () Bool)

(assert (=> b!687460 (=> res!452361 e!391555)))

(assert (=> b!687460 (= res!452361 (= (h!14093 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687461 () Bool)

(assert (=> b!687461 (= e!391555 (contains!3629 (t!19310 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95041 res!452360) b!687460))

(assert (= (and b!687460 (not res!452361)) b!687461))

(assert (=> d!95041 m!651329))

(declare-fun m!651525 () Bool)

(assert (=> d!95041 m!651525))

(declare-fun m!651527 () Bool)

(assert (=> b!687461 m!651527))

(assert (=> b!687097 d!95041))

(declare-fun b!687463 () Bool)

(declare-fun e!391556 () Bool)

(declare-fun e!391559 () Bool)

(assert (=> b!687463 (= e!391556 e!391559)))

(declare-fun c!77917 () Bool)

(assert (=> b!687463 (= c!77917 (validKeyInArray!0 (select (arr!19011 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687464 () Bool)

(declare-fun e!391557 () Bool)

(assert (=> b!687464 (= e!391557 (contains!3629 Nil!13049 (select (arr!19011 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687465 () Bool)

(declare-fun call!34150 () Bool)

(assert (=> b!687465 (= e!391559 call!34150)))

(declare-fun d!95043 () Bool)

(declare-fun res!452362 () Bool)

(declare-fun e!391558 () Bool)

(assert (=> d!95043 (=> res!452362 e!391558)))

(assert (=> d!95043 (= res!452362 (bvsge #b00000000000000000000000000000000 (size!19388 a!3626)))))

(assert (=> d!95043 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13049) e!391558)))

(declare-fun b!687462 () Bool)

(assert (=> b!687462 (= e!391558 e!391556)))

(declare-fun res!452364 () Bool)

(assert (=> b!687462 (=> (not res!452364) (not e!391556))))

(assert (=> b!687462 (= res!452364 (not e!391557))))

(declare-fun res!452363 () Bool)

(assert (=> b!687462 (=> (not res!452363) (not e!391557))))

(assert (=> b!687462 (= res!452363 (validKeyInArray!0 (select (arr!19011 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34147 () Bool)

(assert (=> bm!34147 (= call!34150 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77917 (Cons!13048 (select (arr!19011 a!3626) #b00000000000000000000000000000000) Nil!13049) Nil!13049)))))

(declare-fun b!687466 () Bool)

(assert (=> b!687466 (= e!391559 call!34150)))

(assert (= (and d!95043 (not res!452362)) b!687462))

(assert (= (and b!687462 res!452363) b!687464))

(assert (= (and b!687462 res!452364) b!687463))

(assert (= (and b!687463 c!77917) b!687466))

(assert (= (and b!687463 (not c!77917)) b!687465))

(assert (= (or b!687466 b!687465) bm!34147))

(declare-fun m!651529 () Bool)

(assert (=> b!687463 m!651529))

(assert (=> b!687463 m!651529))

(declare-fun m!651531 () Bool)

(assert (=> b!687463 m!651531))

(assert (=> b!687464 m!651529))

(assert (=> b!687464 m!651529))

(declare-fun m!651533 () Bool)

(assert (=> b!687464 m!651533))

(assert (=> b!687462 m!651529))

(assert (=> b!687462 m!651529))

(assert (=> b!687462 m!651531))

(assert (=> bm!34147 m!651529))

(declare-fun m!651535 () Bool)

(assert (=> bm!34147 m!651535))

(assert (=> b!687086 d!95043))

(assert (=> b!687101 d!94935))

(declare-fun d!95045 () Bool)

(declare-fun res!452365 () Bool)

(declare-fun e!391563 () Bool)

(assert (=> d!95045 (=> res!452365 e!391563)))

(assert (=> d!95045 (= res!452365 (= (select (arr!19011 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95045 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!391563)))

(declare-fun b!687471 () Bool)

(declare-fun e!391564 () Bool)

(assert (=> b!687471 (= e!391563 e!391564)))

(declare-fun res!452366 () Bool)

(assert (=> b!687471 (=> (not res!452366) (not e!391564))))

(assert (=> b!687471 (= res!452366 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19388 a!3626)))))

(declare-fun b!687472 () Bool)

(assert (=> b!687472 (= e!391564 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95045 (not res!452365)) b!687471))

(assert (= (and b!687471 res!452366) b!687472))

(assert (=> d!95045 m!651529))

(declare-fun m!651537 () Bool)

(assert (=> b!687472 m!651537))

(assert (=> b!687100 d!95045))

(declare-fun d!95047 () Bool)

(assert (=> d!95047 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687089 d!95047))

(declare-fun d!95049 () Bool)

(assert (=> d!95049 (= (array_inv!14807 a!3626) (bvsge (size!19388 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61370 d!95049))

(declare-fun d!95051 () Bool)

(declare-fun res!452369 () Bool)

(declare-fun e!391569 () Bool)

(assert (=> d!95051 (=> res!452369 e!391569)))

(assert (=> d!95051 (= res!452369 (is-Nil!13049 acc!681))))

(assert (=> d!95051 (= (noDuplicate!876 acc!681) e!391569)))

(declare-fun b!687479 () Bool)

(declare-fun e!391570 () Bool)

(assert (=> b!687479 (= e!391569 e!391570)))

(declare-fun res!452370 () Bool)

(assert (=> b!687479 (=> (not res!452370) (not e!391570))))

(assert (=> b!687479 (= res!452370 (not (contains!3629 (t!19310 acc!681) (h!14093 acc!681))))))

(declare-fun b!687480 () Bool)

(assert (=> b!687480 (= e!391570 (noDuplicate!876 (t!19310 acc!681)))))

(assert (= (and d!95051 (not res!452369)) b!687479))

(assert (= (and b!687479 res!452370) b!687480))

(declare-fun m!651539 () Bool)

(assert (=> b!687479 m!651539))

(declare-fun m!651541 () Bool)

(assert (=> b!687480 m!651541))

(assert (=> b!687099 d!95051))

(declare-fun d!95053 () Bool)

(assert (=> d!95053 (= ($colon$colon!380 acc!681 (select (arr!19011 a!3626) from!3004)) (Cons!13048 (select (arr!19011 a!3626) from!3004) acc!681))))

(assert (=> b!687088 d!95053))

(assert (=> b!687088 d!94943))

(declare-fun d!95055 () Bool)

(assert (=> d!95055 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315427 () Unit!24222)

(declare-fun choose!80 (array!39673 List!13052 List!13052 (_ BitVec 32)) Unit!24222)

(assert (=> d!95055 (= lt!315427 (choose!80 a!3626 ($colon$colon!380 acc!681 (select (arr!19011 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95055 (bvslt (size!19388 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95055 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!380 acc!681 (select (arr!19011 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315427)))

(declare-fun bs!20162 () Bool)

(assert (= bs!20162 d!95055))

(assert (=> bs!20162 m!651139))

(assert (=> bs!20162 m!651143))

(declare-fun m!651557 () Bool)

(assert (=> bs!20162 m!651557))

(assert (=> b!687088 d!95055))

(assert (=> b!687088 d!94973))

(assert (=> b!687088 d!94993))

(push 1)

