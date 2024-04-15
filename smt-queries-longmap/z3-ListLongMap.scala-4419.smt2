; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60992 () Bool)

(assert start!60992)

(declare-fun b!684258 () Bool)

(declare-datatypes ((Unit!24080 0))(
  ( (Unit!24081) )
))
(declare-fun e!389630 () Unit!24080)

(declare-fun Unit!24082 () Unit!24080)

(assert (=> b!684258 (= e!389630 Unit!24082)))

(declare-fun b!684259 () Bool)

(declare-fun e!389629 () Bool)

(declare-fun e!389625 () Bool)

(assert (=> b!684259 (= e!389629 e!389625)))

(declare-fun res!449971 () Bool)

(assert (=> b!684259 (=> (not res!449971) (not e!389625))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684259 (= res!449971 (bvsle from!3004 i!1382))))

(declare-fun b!684260 () Bool)

(declare-fun res!449975 () Bool)

(declare-fun e!389623 () Bool)

(assert (=> b!684260 (=> (not res!449975) (not e!389623))))

(declare-datatypes ((List!13066 0))(
  ( (Nil!13063) (Cons!13062 (h!14107 (_ BitVec 64)) (t!19303 List!13066)) )
))
(declare-fun acc!681 () List!13066)

(declare-fun contains!3588 (List!13066 (_ BitVec 64)) Bool)

(assert (=> b!684260 (= res!449975 (not (contains!3588 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684261 () Bool)

(declare-fun res!449970 () Bool)

(assert (=> b!684261 (=> (not res!449970) (not e!389623))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684261 (= res!449970 (validKeyInArray!0 k0!2843))))

(declare-fun b!684262 () Bool)

(declare-fun res!449965 () Bool)

(declare-fun e!389627 () Bool)

(assert (=> b!684262 (=> res!449965 e!389627)))

(declare-fun lt!314121 () Bool)

(assert (=> b!684262 (= res!449965 lt!314121)))

(declare-fun b!684263 () Bool)

(declare-fun e!389628 () Unit!24080)

(declare-fun Unit!24083 () Unit!24080)

(assert (=> b!684263 (= e!389628 Unit!24083)))

(declare-fun b!684264 () Bool)

(declare-fun res!449963 () Bool)

(assert (=> b!684264 (=> res!449963 e!389627)))

(declare-fun lt!314124 () List!13066)

(declare-fun noDuplicate!857 (List!13066) Bool)

(assert (=> b!684264 (= res!449963 (not (noDuplicate!857 lt!314124)))))

(declare-fun b!684265 () Bool)

(declare-fun res!449973 () Bool)

(assert (=> b!684265 (=> (not res!449973) (not e!389623))))

(assert (=> b!684265 (= res!449973 (not (contains!3588 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684266 () Bool)

(declare-fun res!449964 () Bool)

(assert (=> b!684266 (=> (not res!449964) (not e!389623))))

(assert (=> b!684266 (= res!449964 e!389629)))

(declare-fun res!449968 () Bool)

(assert (=> b!684266 (=> res!449968 e!389629)))

(declare-fun e!389626 () Bool)

(assert (=> b!684266 (= res!449968 e!389626)))

(declare-fun res!449966 () Bool)

(assert (=> b!684266 (=> (not res!449966) (not e!389626))))

(assert (=> b!684266 (= res!449966 (bvsgt from!3004 i!1382))))

(declare-fun b!684267 () Bool)

(assert (=> b!684267 (= e!389623 (not e!389627))))

(declare-fun res!449974 () Bool)

(assert (=> b!684267 (=> res!449974 e!389627)))

(assert (=> b!684267 (= res!449974 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!156 (List!13066 (_ BitVec 64)) List!13066)

(assert (=> b!684267 (= (-!156 lt!314124 k0!2843) acc!681)))

(declare-fun $colon$colon!355 (List!13066 (_ BitVec 64)) List!13066)

(assert (=> b!684267 (= lt!314124 ($colon$colon!355 acc!681 k0!2843))))

(declare-fun lt!314127 () Unit!24080)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13066) Unit!24080)

(assert (=> b!684267 (= lt!314127 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!191 (List!13066 List!13066) Bool)

(assert (=> b!684267 (subseq!191 acc!681 acc!681)))

(declare-fun lt!314122 () Unit!24080)

(declare-fun lemmaListSubSeqRefl!0 (List!13066) Unit!24080)

(assert (=> b!684267 (= lt!314122 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39612 0))(
  ( (array!39613 (arr!18986 (Array (_ BitVec 32) (_ BitVec 64))) (size!19353 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39612)

(declare-fun arrayNoDuplicates!0 (array!39612 (_ BitVec 32) List!13066) Bool)

(assert (=> b!684267 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314119 () Unit!24080)

(assert (=> b!684267 (= lt!314119 e!389630)))

(declare-fun c!77516 () Bool)

(assert (=> b!684267 (= c!77516 (validKeyInArray!0 (select (arr!18986 a!3626) from!3004)))))

(declare-fun lt!314126 () Unit!24080)

(assert (=> b!684267 (= lt!314126 e!389628)))

(declare-fun c!77517 () Bool)

(assert (=> b!684267 (= c!77517 lt!314121)))

(declare-fun arrayContainsKey!0 (array!39612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684267 (= lt!314121 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684267 (arrayContainsKey!0 (array!39613 (store (arr!18986 a!3626) i!1382 k0!2843) (size!19353 a!3626)) k0!2843 from!3004)))

(declare-fun res!449960 () Bool)

(assert (=> start!60992 (=> (not res!449960) (not e!389623))))

(assert (=> start!60992 (= res!449960 (and (bvslt (size!19353 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19353 a!3626))))))

(assert (=> start!60992 e!389623))

(assert (=> start!60992 true))

(declare-fun array_inv!14869 (array!39612) Bool)

(assert (=> start!60992 (array_inv!14869 a!3626)))

(declare-fun b!684268 () Bool)

(declare-fun res!449962 () Bool)

(assert (=> b!684268 (=> (not res!449962) (not e!389623))))

(assert (=> b!684268 (= res!449962 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19353 a!3626))))))

(declare-fun b!684269 () Bool)

(declare-fun Unit!24084 () Unit!24080)

(assert (=> b!684269 (= e!389628 Unit!24084)))

(declare-fun lt!314123 () Unit!24080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39612 (_ BitVec 64) (_ BitVec 32)) Unit!24080)

(assert (=> b!684269 (= lt!314123 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684269 false))

(declare-fun b!684270 () Bool)

(declare-fun res!449969 () Bool)

(assert (=> b!684270 (=> res!449969 e!389627)))

(assert (=> b!684270 (= res!449969 (contains!3588 acc!681 k0!2843))))

(declare-fun b!684271 () Bool)

(declare-fun res!449976 () Bool)

(assert (=> b!684271 (=> (not res!449976) (not e!389623))))

(assert (=> b!684271 (= res!449976 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19353 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684272 () Bool)

(assert (=> b!684272 (= e!389627 (subseq!191 acc!681 lt!314124))))

(declare-fun b!684273 () Bool)

(declare-fun res!449967 () Bool)

(assert (=> b!684273 (=> (not res!449967) (not e!389623))))

(assert (=> b!684273 (= res!449967 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13063))))

(declare-fun b!684274 () Bool)

(assert (=> b!684274 (= e!389626 (contains!3588 acc!681 k0!2843))))

(declare-fun b!684275 () Bool)

(declare-fun lt!314125 () Unit!24080)

(assert (=> b!684275 (= e!389630 lt!314125)))

(declare-fun lt!314120 () Unit!24080)

(assert (=> b!684275 (= lt!314120 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684275 (subseq!191 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39612 List!13066 List!13066 (_ BitVec 32)) Unit!24080)

(assert (=> b!684275 (= lt!314125 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!355 acc!681 (select (arr!18986 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684275 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684276 () Bool)

(assert (=> b!684276 (= e!389625 (not (contains!3588 acc!681 k0!2843)))))

(declare-fun b!684277 () Bool)

(declare-fun res!449977 () Bool)

(assert (=> b!684277 (=> (not res!449977) (not e!389623))))

(assert (=> b!684277 (= res!449977 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684278 () Bool)

(declare-fun res!449972 () Bool)

(assert (=> b!684278 (=> (not res!449972) (not e!389623))))

(assert (=> b!684278 (= res!449972 (noDuplicate!857 acc!681))))

(declare-fun b!684279 () Bool)

(declare-fun res!449961 () Bool)

(assert (=> b!684279 (=> (not res!449961) (not e!389623))))

(assert (=> b!684279 (= res!449961 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60992 res!449960) b!684278))

(assert (= (and b!684278 res!449972) b!684265))

(assert (= (and b!684265 res!449973) b!684260))

(assert (= (and b!684260 res!449975) b!684266))

(assert (= (and b!684266 res!449966) b!684274))

(assert (= (and b!684266 (not res!449968)) b!684259))

(assert (= (and b!684259 res!449971) b!684276))

(assert (= (and b!684266 res!449964) b!684273))

(assert (= (and b!684273 res!449967) b!684277))

(assert (= (and b!684277 res!449977) b!684268))

(assert (= (and b!684268 res!449962) b!684261))

(assert (= (and b!684261 res!449970) b!684279))

(assert (= (and b!684279 res!449961) b!684271))

(assert (= (and b!684271 res!449976) b!684267))

(assert (= (and b!684267 c!77517) b!684269))

(assert (= (and b!684267 (not c!77517)) b!684263))

(assert (= (and b!684267 c!77516) b!684275))

(assert (= (and b!684267 (not c!77516)) b!684258))

(assert (= (and b!684267 (not res!449974)) b!684264))

(assert (= (and b!684264 (not res!449963)) b!684262))

(assert (= (and b!684262 (not res!449965)) b!684270))

(assert (= (and b!684270 (not res!449969)) b!684272))

(declare-fun m!648099 () Bool)

(assert (=> b!684273 m!648099))

(declare-fun m!648101 () Bool)

(assert (=> b!684272 m!648101))

(declare-fun m!648103 () Bool)

(assert (=> b!684261 m!648103))

(declare-fun m!648105 () Bool)

(assert (=> b!684279 m!648105))

(declare-fun m!648107 () Bool)

(assert (=> start!60992 m!648107))

(declare-fun m!648109 () Bool)

(assert (=> b!684278 m!648109))

(declare-fun m!648111 () Bool)

(assert (=> b!684274 m!648111))

(assert (=> b!684270 m!648111))

(declare-fun m!648113 () Bool)

(assert (=> b!684277 m!648113))

(assert (=> b!684276 m!648111))

(declare-fun m!648115 () Bool)

(assert (=> b!684260 m!648115))

(declare-fun m!648117 () Bool)

(assert (=> b!684264 m!648117))

(declare-fun m!648119 () Bool)

(assert (=> b!684269 m!648119))

(declare-fun m!648121 () Bool)

(assert (=> b!684275 m!648121))

(declare-fun m!648123 () Bool)

(assert (=> b!684275 m!648123))

(declare-fun m!648125 () Bool)

(assert (=> b!684275 m!648125))

(declare-fun m!648127 () Bool)

(assert (=> b!684275 m!648127))

(assert (=> b!684275 m!648123))

(assert (=> b!684275 m!648125))

(declare-fun m!648129 () Bool)

(assert (=> b!684275 m!648129))

(declare-fun m!648131 () Bool)

(assert (=> b!684275 m!648131))

(assert (=> b!684267 m!648121))

(assert (=> b!684267 m!648123))

(declare-fun m!648133 () Bool)

(assert (=> b!684267 m!648133))

(declare-fun m!648135 () Bool)

(assert (=> b!684267 m!648135))

(declare-fun m!648137 () Bool)

(assert (=> b!684267 m!648137))

(assert (=> b!684267 m!648129))

(declare-fun m!648139 () Bool)

(assert (=> b!684267 m!648139))

(declare-fun m!648141 () Bool)

(assert (=> b!684267 m!648141))

(assert (=> b!684267 m!648123))

(declare-fun m!648143 () Bool)

(assert (=> b!684267 m!648143))

(declare-fun m!648145 () Bool)

(assert (=> b!684267 m!648145))

(assert (=> b!684267 m!648131))

(declare-fun m!648147 () Bool)

(assert (=> b!684265 m!648147))

(check-sat (not b!684260) (not b!684279) (not start!60992) (not b!684278) (not b!684270) (not b!684265) (not b!684275) (not b!684261) (not b!684277) (not b!684269) (not b!684267) (not b!684276) (not b!684264) (not b!684273) (not b!684274) (not b!684272))
(check-sat)
(get-model)

(declare-fun d!94099 () Bool)

(declare-fun res!450090 () Bool)

(declare-fun e!389683 () Bool)

(assert (=> d!94099 (=> res!450090 e!389683)))

(assert (=> d!94099 (= res!450090 (= (select (arr!18986 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94099 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!389683)))

(declare-fun b!684416 () Bool)

(declare-fun e!389684 () Bool)

(assert (=> b!684416 (= e!389683 e!389684)))

(declare-fun res!450091 () Bool)

(assert (=> b!684416 (=> (not res!450091) (not e!389684))))

(assert (=> b!684416 (= res!450091 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19353 a!3626)))))

(declare-fun b!684417 () Bool)

(assert (=> b!684417 (= e!389684 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94099 (not res!450090)) b!684416))

(assert (= (and b!684416 res!450091) b!684417))

(declare-fun m!648249 () Bool)

(assert (=> d!94099 m!648249))

(declare-fun m!648251 () Bool)

(assert (=> b!684417 m!648251))

(assert (=> b!684267 d!94099))

(declare-fun d!94101 () Bool)

(assert (=> d!94101 (= (-!156 ($colon$colon!355 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314184 () Unit!24080)

(declare-fun choose!16 ((_ BitVec 64) List!13066) Unit!24080)

(assert (=> d!94101 (= lt!314184 (choose!16 k0!2843 acc!681))))

(assert (=> d!94101 (not (contains!3588 acc!681 k0!2843))))

(assert (=> d!94101 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314184)))

(declare-fun bs!20043 () Bool)

(assert (= bs!20043 d!94101))

(assert (=> bs!20043 m!648141))

(assert (=> bs!20043 m!648141))

(declare-fun m!648253 () Bool)

(assert (=> bs!20043 m!648253))

(declare-fun m!648255 () Bool)

(assert (=> bs!20043 m!648255))

(assert (=> bs!20043 m!648111))

(assert (=> b!684267 d!94101))

(declare-fun d!94103 () Bool)

(declare-fun res!450092 () Bool)

(declare-fun e!389685 () Bool)

(assert (=> d!94103 (=> res!450092 e!389685)))

(assert (=> d!94103 (= res!450092 (= (select (arr!18986 (array!39613 (store (arr!18986 a!3626) i!1382 k0!2843) (size!19353 a!3626))) from!3004) k0!2843))))

(assert (=> d!94103 (= (arrayContainsKey!0 (array!39613 (store (arr!18986 a!3626) i!1382 k0!2843) (size!19353 a!3626)) k0!2843 from!3004) e!389685)))

(declare-fun b!684418 () Bool)

(declare-fun e!389686 () Bool)

(assert (=> b!684418 (= e!389685 e!389686)))

(declare-fun res!450093 () Bool)

(assert (=> b!684418 (=> (not res!450093) (not e!389686))))

(assert (=> b!684418 (= res!450093 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19353 (array!39613 (store (arr!18986 a!3626) i!1382 k0!2843) (size!19353 a!3626)))))))

(declare-fun b!684419 () Bool)

(assert (=> b!684419 (= e!389686 (arrayContainsKey!0 (array!39613 (store (arr!18986 a!3626) i!1382 k0!2843) (size!19353 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94103 (not res!450092)) b!684418))

(assert (= (and b!684418 res!450093) b!684419))

(declare-fun m!648257 () Bool)

(assert (=> d!94103 m!648257))

(declare-fun m!648259 () Bool)

(assert (=> b!684419 m!648259))

(assert (=> b!684267 d!94103))

(declare-fun b!684430 () Bool)

(declare-fun e!389695 () List!13066)

(assert (=> b!684430 (= e!389695 Nil!13063)))

(declare-fun b!684431 () Bool)

(declare-fun e!389696 () List!13066)

(declare-fun call!34003 () List!13066)

(assert (=> b!684431 (= e!389696 (Cons!13062 (h!14107 lt!314124) call!34003))))

(declare-fun b!684432 () Bool)

(assert (=> b!684432 (= e!389695 e!389696)))

(declare-fun c!77535 () Bool)

(assert (=> b!684432 (= c!77535 (= k0!2843 (h!14107 lt!314124)))))

(declare-fun b!684433 () Bool)

(declare-fun lt!314187 () List!13066)

(declare-fun e!389694 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!284 (List!13066) (InoxSet (_ BitVec 64)))

(assert (=> b!684433 (= e!389694 (= (content!284 lt!314187) ((_ map and) (content!284 lt!314124) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun d!94105 () Bool)

(assert (=> d!94105 e!389694))

(declare-fun res!450096 () Bool)

(assert (=> d!94105 (=> (not res!450096) (not e!389694))))

(declare-fun size!19356 (List!13066) Int)

(assert (=> d!94105 (= res!450096 (<= (size!19356 lt!314187) (size!19356 lt!314124)))))

(assert (=> d!94105 (= lt!314187 e!389695)))

(declare-fun c!77534 () Bool)

(get-info :version)

(assert (=> d!94105 (= c!77534 ((_ is Cons!13062) lt!314124))))

(assert (=> d!94105 (= (-!156 lt!314124 k0!2843) lt!314187)))

(declare-fun b!684434 () Bool)

(assert (=> b!684434 (= e!389696 call!34003)))

(declare-fun bm!34000 () Bool)

(assert (=> bm!34000 (= call!34003 (-!156 (t!19303 lt!314124) k0!2843))))

(assert (= (and d!94105 c!77534) b!684432))

(assert (= (and d!94105 (not c!77534)) b!684430))

(assert (= (and b!684432 c!77535) b!684434))

(assert (= (and b!684432 (not c!77535)) b!684431))

(assert (= (or b!684434 b!684431) bm!34000))

(assert (= (and d!94105 res!450096) b!684433))

(declare-fun m!648261 () Bool)

(assert (=> b!684433 m!648261))

(declare-fun m!648263 () Bool)

(assert (=> b!684433 m!648263))

(declare-fun m!648265 () Bool)

(assert (=> b!684433 m!648265))

(declare-fun m!648267 () Bool)

(assert (=> d!94105 m!648267))

(declare-fun m!648269 () Bool)

(assert (=> d!94105 m!648269))

(declare-fun m!648271 () Bool)

(assert (=> bm!34000 m!648271))

(assert (=> b!684267 d!94105))

(declare-fun d!94107 () Bool)

(declare-fun res!450107 () Bool)

(declare-fun e!389707 () Bool)

(assert (=> d!94107 (=> res!450107 e!389707)))

(assert (=> d!94107 (= res!450107 ((_ is Nil!13063) acc!681))))

(assert (=> d!94107 (= (subseq!191 acc!681 acc!681) e!389707)))

(declare-fun b!684444 () Bool)

(declare-fun e!389708 () Bool)

(declare-fun e!389705 () Bool)

(assert (=> b!684444 (= e!389708 e!389705)))

(declare-fun res!450106 () Bool)

(assert (=> b!684444 (=> res!450106 e!389705)))

(declare-fun e!389706 () Bool)

(assert (=> b!684444 (= res!450106 e!389706)))

(declare-fun res!450105 () Bool)

(assert (=> b!684444 (=> (not res!450105) (not e!389706))))

(assert (=> b!684444 (= res!450105 (= (h!14107 acc!681) (h!14107 acc!681)))))

(declare-fun b!684446 () Bool)

(assert (=> b!684446 (= e!389705 (subseq!191 acc!681 (t!19303 acc!681)))))

(declare-fun b!684443 () Bool)

(assert (=> b!684443 (= e!389707 e!389708)))

(declare-fun res!450108 () Bool)

(assert (=> b!684443 (=> (not res!450108) (not e!389708))))

(assert (=> b!684443 (= res!450108 ((_ is Cons!13062) acc!681))))

(declare-fun b!684445 () Bool)

(assert (=> b!684445 (= e!389706 (subseq!191 (t!19303 acc!681) (t!19303 acc!681)))))

(assert (= (and d!94107 (not res!450107)) b!684443))

(assert (= (and b!684443 res!450108) b!684444))

(assert (= (and b!684444 res!450105) b!684445))

(assert (= (and b!684444 (not res!450106)) b!684446))

(declare-fun m!648273 () Bool)

(assert (=> b!684446 m!648273))

(declare-fun m!648275 () Bool)

(assert (=> b!684445 m!648275))

(assert (=> b!684267 d!94107))

(declare-fun d!94109 () Bool)

(assert (=> d!94109 (subseq!191 acc!681 acc!681)))

(declare-fun lt!314190 () Unit!24080)

(declare-fun choose!36 (List!13066) Unit!24080)

(assert (=> d!94109 (= lt!314190 (choose!36 acc!681))))

(assert (=> d!94109 (= (lemmaListSubSeqRefl!0 acc!681) lt!314190)))

(declare-fun bs!20044 () Bool)

(assert (= bs!20044 d!94109))

(assert (=> bs!20044 m!648131))

(declare-fun m!648277 () Bool)

(assert (=> bs!20044 m!648277))

(assert (=> b!684267 d!94109))

(declare-fun d!94111 () Bool)

(assert (=> d!94111 (= (validKeyInArray!0 (select (arr!18986 a!3626) from!3004)) (and (not (= (select (arr!18986 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18986 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684267 d!94111))

(declare-fun d!94115 () Bool)

(assert (=> d!94115 (= ($colon$colon!355 acc!681 k0!2843) (Cons!13062 k0!2843 acc!681))))

(assert (=> b!684267 d!94115))

(declare-fun e!389731 () Bool)

(declare-fun b!684469 () Bool)

(assert (=> b!684469 (= e!389731 (contains!3588 acc!681 (select (arr!18986 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!684470 () Bool)

(declare-fun e!389730 () Bool)

(declare-fun call!34006 () Bool)

(assert (=> b!684470 (= e!389730 call!34006)))

(declare-fun bm!34003 () Bool)

(declare-fun c!77538 () Bool)

(assert (=> bm!34003 (= call!34006 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77538 (Cons!13062 (select (arr!18986 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!684471 () Bool)

(declare-fun e!389729 () Bool)

(declare-fun e!389732 () Bool)

(assert (=> b!684471 (= e!389729 e!389732)))

(declare-fun res!450127 () Bool)

(assert (=> b!684471 (=> (not res!450127) (not e!389732))))

(assert (=> b!684471 (= res!450127 (not e!389731))))

(declare-fun res!450128 () Bool)

(assert (=> b!684471 (=> (not res!450128) (not e!389731))))

(assert (=> b!684471 (= res!450128 (validKeyInArray!0 (select (arr!18986 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94117 () Bool)

(declare-fun res!450129 () Bool)

(assert (=> d!94117 (=> res!450129 e!389729)))

(assert (=> d!94117 (= res!450129 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19353 a!3626)))))

(assert (=> d!94117 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!389729)))

(declare-fun b!684472 () Bool)

(assert (=> b!684472 (= e!389730 call!34006)))

(declare-fun b!684473 () Bool)

(assert (=> b!684473 (= e!389732 e!389730)))

(assert (=> b!684473 (= c!77538 (validKeyInArray!0 (select (arr!18986 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94117 (not res!450129)) b!684471))

(assert (= (and b!684471 res!450128) b!684469))

(assert (= (and b!684471 res!450127) b!684473))

(assert (= (and b!684473 c!77538) b!684470))

(assert (= (and b!684473 (not c!77538)) b!684472))

(assert (= (or b!684470 b!684472) bm!34003))

(assert (=> b!684469 m!648249))

(assert (=> b!684469 m!648249))

(declare-fun m!648289 () Bool)

(assert (=> b!684469 m!648289))

(assert (=> bm!34003 m!648249))

(declare-fun m!648291 () Bool)

(assert (=> bm!34003 m!648291))

(assert (=> b!684471 m!648249))

(assert (=> b!684471 m!648249))

(declare-fun m!648293 () Bool)

(assert (=> b!684471 m!648293))

(assert (=> b!684473 m!648249))

(assert (=> b!684473 m!648249))

(assert (=> b!684473 m!648293))

(assert (=> b!684267 d!94117))

(declare-fun d!94125 () Bool)

(declare-fun res!450142 () Bool)

(declare-fun e!389745 () Bool)

(assert (=> d!94125 (=> res!450142 e!389745)))

(assert (=> d!94125 (= res!450142 ((_ is Nil!13063) acc!681))))

(assert (=> d!94125 (= (noDuplicate!857 acc!681) e!389745)))

(declare-fun b!684486 () Bool)

(declare-fun e!389746 () Bool)

(assert (=> b!684486 (= e!389745 e!389746)))

(declare-fun res!450143 () Bool)

(assert (=> b!684486 (=> (not res!450143) (not e!389746))))

(assert (=> b!684486 (= res!450143 (not (contains!3588 (t!19303 acc!681) (h!14107 acc!681))))))

(declare-fun b!684487 () Bool)

(assert (=> b!684487 (= e!389746 (noDuplicate!857 (t!19303 acc!681)))))

(assert (= (and d!94125 (not res!450142)) b!684486))

(assert (= (and b!684486 res!450143) b!684487))

(declare-fun m!648295 () Bool)

(assert (=> b!684486 m!648295))

(declare-fun m!648297 () Bool)

(assert (=> b!684487 m!648297))

(assert (=> b!684278 d!94125))

(declare-fun d!94129 () Bool)

(declare-fun lt!314197 () Bool)

(assert (=> d!94129 (= lt!314197 (select (content!284 acc!681) k0!2843))))

(declare-fun e!389758 () Bool)

(assert (=> d!94129 (= lt!314197 e!389758)))

(declare-fun res!450155 () Bool)

(assert (=> d!94129 (=> (not res!450155) (not e!389758))))

(assert (=> d!94129 (= res!450155 ((_ is Cons!13062) acc!681))))

(assert (=> d!94129 (= (contains!3588 acc!681 k0!2843) lt!314197)))

(declare-fun b!684498 () Bool)

(declare-fun e!389757 () Bool)

(assert (=> b!684498 (= e!389758 e!389757)))

(declare-fun res!450154 () Bool)

(assert (=> b!684498 (=> res!450154 e!389757)))

(assert (=> b!684498 (= res!450154 (= (h!14107 acc!681) k0!2843))))

(declare-fun b!684499 () Bool)

(assert (=> b!684499 (= e!389757 (contains!3588 (t!19303 acc!681) k0!2843))))

(assert (= (and d!94129 res!450155) b!684498))

(assert (= (and b!684498 (not res!450154)) b!684499))

(declare-fun m!648307 () Bool)

(assert (=> d!94129 m!648307))

(declare-fun m!648309 () Bool)

(assert (=> d!94129 m!648309))

(declare-fun m!648311 () Bool)

(assert (=> b!684499 m!648311))

(assert (=> b!684276 d!94129))

(declare-fun e!389765 () Bool)

(declare-fun b!684504 () Bool)

(assert (=> b!684504 (= e!389765 (contains!3588 acc!681 (select (arr!18986 a!3626) from!3004)))))

(declare-fun b!684505 () Bool)

(declare-fun e!389764 () Bool)

(declare-fun call!34007 () Bool)

(assert (=> b!684505 (= e!389764 call!34007)))

(declare-fun bm!34004 () Bool)

(declare-fun c!77539 () Bool)

(assert (=> bm!34004 (= call!34007 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77539 (Cons!13062 (select (arr!18986 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!684506 () Bool)

(declare-fun e!389763 () Bool)

(declare-fun e!389766 () Bool)

(assert (=> b!684506 (= e!389763 e!389766)))

(declare-fun res!450160 () Bool)

(assert (=> b!684506 (=> (not res!450160) (not e!389766))))

(assert (=> b!684506 (= res!450160 (not e!389765))))

(declare-fun res!450161 () Bool)

(assert (=> b!684506 (=> (not res!450161) (not e!389765))))

(assert (=> b!684506 (= res!450161 (validKeyInArray!0 (select (arr!18986 a!3626) from!3004)))))

(declare-fun d!94135 () Bool)

(declare-fun res!450162 () Bool)

(assert (=> d!94135 (=> res!450162 e!389763)))

(assert (=> d!94135 (= res!450162 (bvsge from!3004 (size!19353 a!3626)))))

(assert (=> d!94135 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!389763)))

(declare-fun b!684507 () Bool)

(assert (=> b!684507 (= e!389764 call!34007)))

(declare-fun b!684508 () Bool)

(assert (=> b!684508 (= e!389766 e!389764)))

(assert (=> b!684508 (= c!77539 (validKeyInArray!0 (select (arr!18986 a!3626) from!3004)))))

(assert (= (and d!94135 (not res!450162)) b!684506))

(assert (= (and b!684506 res!450161) b!684504))

(assert (= (and b!684506 res!450160) b!684508))

(assert (= (and b!684508 c!77539) b!684505))

(assert (= (and b!684508 (not c!77539)) b!684507))

(assert (= (or b!684505 b!684507) bm!34004))

(assert (=> b!684504 m!648123))

(assert (=> b!684504 m!648123))

(declare-fun m!648313 () Bool)

(assert (=> b!684504 m!648313))

(assert (=> bm!34004 m!648123))

(declare-fun m!648315 () Bool)

(assert (=> bm!34004 m!648315))

(assert (=> b!684506 m!648123))

(assert (=> b!684506 m!648123))

(assert (=> b!684506 m!648143))

(assert (=> b!684508 m!648123))

(assert (=> b!684508 m!648123))

(assert (=> b!684508 m!648143))

(assert (=> b!684277 d!94135))

(assert (=> b!684270 d!94129))

(declare-fun d!94137 () Bool)

(declare-fun res!450165 () Bool)

(declare-fun e!389769 () Bool)

(assert (=> d!94137 (=> res!450165 e!389769)))

(assert (=> d!94137 (= res!450165 (= (select (arr!18986 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94137 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!389769)))

(declare-fun b!684511 () Bool)

(declare-fun e!389770 () Bool)

(assert (=> b!684511 (= e!389769 e!389770)))

(declare-fun res!450166 () Bool)

(assert (=> b!684511 (=> (not res!450166) (not e!389770))))

(assert (=> b!684511 (= res!450166 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19353 a!3626)))))

(declare-fun b!684512 () Bool)

(assert (=> b!684512 (= e!389770 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94137 (not res!450165)) b!684511))

(assert (= (and b!684511 res!450166) b!684512))

(declare-fun m!648321 () Bool)

(assert (=> d!94137 m!648321))

(declare-fun m!648323 () Bool)

(assert (=> b!684512 m!648323))

(assert (=> b!684279 d!94137))

(declare-fun d!94141 () Bool)

(assert (=> d!94141 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314200 () Unit!24080)

(declare-fun choose!13 (array!39612 (_ BitVec 64) (_ BitVec 32)) Unit!24080)

(assert (=> d!94141 (= lt!314200 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94141 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94141 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314200)))

(declare-fun bs!20045 () Bool)

(assert (= bs!20045 d!94141))

(assert (=> bs!20045 m!648105))

(declare-fun m!648333 () Bool)

(assert (=> bs!20045 m!648333))

(assert (=> b!684269 d!94141))

(declare-fun d!94149 () Bool)

(declare-fun res!450175 () Bool)

(declare-fun e!389779 () Bool)

(assert (=> d!94149 (=> res!450175 e!389779)))

(assert (=> d!94149 (= res!450175 ((_ is Nil!13063) acc!681))))

(assert (=> d!94149 (= (subseq!191 acc!681 lt!314124) e!389779)))

(declare-fun b!684520 () Bool)

(declare-fun e!389780 () Bool)

(declare-fun e!389777 () Bool)

(assert (=> b!684520 (= e!389780 e!389777)))

(declare-fun res!450174 () Bool)

(assert (=> b!684520 (=> res!450174 e!389777)))

(declare-fun e!389778 () Bool)

(assert (=> b!684520 (= res!450174 e!389778)))

(declare-fun res!450173 () Bool)

(assert (=> b!684520 (=> (not res!450173) (not e!389778))))

(assert (=> b!684520 (= res!450173 (= (h!14107 acc!681) (h!14107 lt!314124)))))

(declare-fun b!684522 () Bool)

(assert (=> b!684522 (= e!389777 (subseq!191 acc!681 (t!19303 lt!314124)))))

(declare-fun b!684519 () Bool)

(assert (=> b!684519 (= e!389779 e!389780)))

(declare-fun res!450176 () Bool)

(assert (=> b!684519 (=> (not res!450176) (not e!389780))))

(assert (=> b!684519 (= res!450176 ((_ is Cons!13062) lt!314124))))

(declare-fun b!684521 () Bool)

(assert (=> b!684521 (= e!389778 (subseq!191 (t!19303 acc!681) (t!19303 lt!314124)))))

(assert (= (and d!94149 (not res!450175)) b!684519))

(assert (= (and b!684519 res!450176) b!684520))

(assert (= (and b!684520 res!450173) b!684521))

(assert (= (and b!684520 (not res!450174)) b!684522))

(declare-fun m!648335 () Bool)

(assert (=> b!684522 m!648335))

(declare-fun m!648337 () Bool)

(assert (=> b!684521 m!648337))

(assert (=> b!684272 d!94149))

(declare-fun b!684523 () Bool)

(declare-fun e!389783 () Bool)

(assert (=> b!684523 (= e!389783 (contains!3588 Nil!13063 (select (arr!18986 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!684524 () Bool)

(declare-fun e!389782 () Bool)

(declare-fun call!34008 () Bool)

(assert (=> b!684524 (= e!389782 call!34008)))

(declare-fun bm!34005 () Bool)

(declare-fun c!77540 () Bool)

(assert (=> bm!34005 (= call!34008 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77540 (Cons!13062 (select (arr!18986 a!3626) #b00000000000000000000000000000000) Nil!13063) Nil!13063)))))

(declare-fun b!684525 () Bool)

(declare-fun e!389781 () Bool)

(declare-fun e!389784 () Bool)

(assert (=> b!684525 (= e!389781 e!389784)))

(declare-fun res!450177 () Bool)

(assert (=> b!684525 (=> (not res!450177) (not e!389784))))

(assert (=> b!684525 (= res!450177 (not e!389783))))

(declare-fun res!450178 () Bool)

(assert (=> b!684525 (=> (not res!450178) (not e!389783))))

(assert (=> b!684525 (= res!450178 (validKeyInArray!0 (select (arr!18986 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94151 () Bool)

(declare-fun res!450179 () Bool)

(assert (=> d!94151 (=> res!450179 e!389781)))

(assert (=> d!94151 (= res!450179 (bvsge #b00000000000000000000000000000000 (size!19353 a!3626)))))

(assert (=> d!94151 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13063) e!389781)))

(declare-fun b!684526 () Bool)

(assert (=> b!684526 (= e!389782 call!34008)))

(declare-fun b!684527 () Bool)

(assert (=> b!684527 (= e!389784 e!389782)))

(assert (=> b!684527 (= c!77540 (validKeyInArray!0 (select (arr!18986 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94151 (not res!450179)) b!684525))

(assert (= (and b!684525 res!450178) b!684523))

(assert (= (and b!684525 res!450177) b!684527))

(assert (= (and b!684527 c!77540) b!684524))

(assert (= (and b!684527 (not c!77540)) b!684526))

(assert (= (or b!684524 b!684526) bm!34005))

(assert (=> b!684523 m!648321))

(assert (=> b!684523 m!648321))

(declare-fun m!648339 () Bool)

(assert (=> b!684523 m!648339))

(assert (=> bm!34005 m!648321))

(declare-fun m!648341 () Bool)

(assert (=> bm!34005 m!648341))

(assert (=> b!684525 m!648321))

(assert (=> b!684525 m!648321))

(declare-fun m!648343 () Bool)

(assert (=> b!684525 m!648343))

(assert (=> b!684527 m!648321))

(assert (=> b!684527 m!648321))

(assert (=> b!684527 m!648343))

(assert (=> b!684273 d!94151))

(declare-fun d!94153 () Bool)

(assert (=> d!94153 (= (array_inv!14869 a!3626) (bvsge (size!19353 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60992 d!94153))

(declare-fun d!94155 () Bool)

(declare-fun lt!314206 () Bool)

(assert (=> d!94155 (= lt!314206 (select (content!284 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389791 () Bool)

(assert (=> d!94155 (= lt!314206 e!389791)))

(declare-fun res!450181 () Bool)

(assert (=> d!94155 (=> (not res!450181) (not e!389791))))

(assert (=> d!94155 (= res!450181 ((_ is Cons!13062) acc!681))))

(assert (=> d!94155 (= (contains!3588 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314206)))

(declare-fun b!684536 () Bool)

(declare-fun e!389790 () Bool)

(assert (=> b!684536 (= e!389791 e!389790)))

(declare-fun res!450180 () Bool)

(assert (=> b!684536 (=> res!450180 e!389790)))

(assert (=> b!684536 (= res!450180 (= (h!14107 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!684537 () Bool)

(assert (=> b!684537 (= e!389790 (contains!3588 (t!19303 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94155 res!450181) b!684536))

(assert (= (and b!684536 (not res!450180)) b!684537))

(assert (=> d!94155 m!648307))

(declare-fun m!648349 () Bool)

(assert (=> d!94155 m!648349))

(declare-fun m!648351 () Bool)

(assert (=> b!684537 m!648351))

(assert (=> b!684260 d!94155))

(declare-fun d!94159 () Bool)

(assert (=> d!94159 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684261 d!94159))

(declare-fun d!94161 () Bool)

(assert (=> d!94161 (= ($colon$colon!355 acc!681 (select (arr!18986 a!3626) from!3004)) (Cons!13062 (select (arr!18986 a!3626) from!3004) acc!681))))

(assert (=> b!684275 d!94161))

(assert (=> b!684275 d!94107))

(declare-fun d!94163 () Bool)

(assert (=> d!94163 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314209 () Unit!24080)

(declare-fun choose!80 (array!39612 List!13066 List!13066 (_ BitVec 32)) Unit!24080)

(assert (=> d!94163 (= lt!314209 (choose!80 a!3626 ($colon$colon!355 acc!681 (select (arr!18986 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94163 (bvslt (size!19353 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94163 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!355 acc!681 (select (arr!18986 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314209)))

(declare-fun bs!20047 () Bool)

(assert (= bs!20047 d!94163))

(assert (=> bs!20047 m!648121))

(assert (=> bs!20047 m!648125))

(declare-fun m!648353 () Bool)

(assert (=> bs!20047 m!648353))

(assert (=> b!684275 d!94163))

(assert (=> b!684275 d!94109))

(assert (=> b!684275 d!94117))

(declare-fun d!94165 () Bool)

(declare-fun res!450184 () Bool)

(declare-fun e!389799 () Bool)

(assert (=> d!94165 (=> res!450184 e!389799)))

(assert (=> d!94165 (= res!450184 ((_ is Nil!13063) lt!314124))))

(assert (=> d!94165 (= (noDuplicate!857 lt!314124) e!389799)))

(declare-fun b!684548 () Bool)

(declare-fun e!389800 () Bool)

(assert (=> b!684548 (= e!389799 e!389800)))

(declare-fun res!450185 () Bool)

(assert (=> b!684548 (=> (not res!450185) (not e!389800))))

(assert (=> b!684548 (= res!450185 (not (contains!3588 (t!19303 lt!314124) (h!14107 lt!314124))))))

(declare-fun b!684549 () Bool)

(assert (=> b!684549 (= e!389800 (noDuplicate!857 (t!19303 lt!314124)))))

(assert (= (and d!94165 (not res!450184)) b!684548))

(assert (= (and b!684548 res!450185) b!684549))

(declare-fun m!648355 () Bool)

(assert (=> b!684548 m!648355))

(declare-fun m!648357 () Bool)

(assert (=> b!684549 m!648357))

(assert (=> b!684264 d!94165))

(declare-fun d!94167 () Bool)

(declare-fun lt!314212 () Bool)

(assert (=> d!94167 (= lt!314212 (select (content!284 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389802 () Bool)

(assert (=> d!94167 (= lt!314212 e!389802)))

(declare-fun res!450187 () Bool)

(assert (=> d!94167 (=> (not res!450187) (not e!389802))))

(assert (=> d!94167 (= res!450187 ((_ is Cons!13062) acc!681))))

(assert (=> d!94167 (= (contains!3588 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314212)))

(declare-fun b!684550 () Bool)

(declare-fun e!389801 () Bool)

(assert (=> b!684550 (= e!389802 e!389801)))

(declare-fun res!450186 () Bool)

(assert (=> b!684550 (=> res!450186 e!389801)))

(assert (=> b!684550 (= res!450186 (= (h!14107 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!684551 () Bool)

(assert (=> b!684551 (= e!389801 (contains!3588 (t!19303 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94167 res!450187) b!684550))

(assert (= (and b!684550 (not res!450186)) b!684551))

(assert (=> d!94167 m!648307))

(declare-fun m!648359 () Bool)

(assert (=> d!94167 m!648359))

(declare-fun m!648361 () Bool)

(assert (=> b!684551 m!648361))

(assert (=> b!684265 d!94167))

(assert (=> b!684274 d!94129))

(check-sat (not b!684551) (not b!684419) (not d!94109) (not b!684486) (not b!684521) (not b!684504) (not bm!34005) (not b!684512) (not b!684473) (not b!684471) (not b!684548) (not d!94163) (not b!684446) (not b!684525) (not b!684523) (not b!684499) (not d!94141) (not b!684522) (not b!684469) (not d!94129) (not d!94105) (not b!684508) (not b!684487) (not b!684417) (not d!94101) (not bm!34004) (not b!684549) (not bm!34000) (not d!94155) (not b!684506) (not b!684527) (not b!684433) (not b!684445) (not b!684537) (not bm!34003) (not d!94167))
(check-sat)
