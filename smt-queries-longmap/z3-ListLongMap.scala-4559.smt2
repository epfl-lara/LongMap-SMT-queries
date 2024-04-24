; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63586 () Bool)

(assert start!63586)

(declare-fun b!716110 () Bool)

(declare-fun res!478972 () Bool)

(declare-fun e!402080 () Bool)

(assert (=> b!716110 (=> (not res!478972) (not e!402080))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716110 (= res!478972 (validKeyInArray!0 k0!2824))))

(declare-datatypes ((List!13350 0))(
  ( (Nil!13347) (Cons!13346 (h!14394 (_ BitVec 64)) (t!19657 List!13350)) )
))
(declare-fun newAcc!49 () List!13350)

(declare-datatypes ((array!40536 0))(
  ( (array!40537 (arr!19402 (Array (_ BitVec 32) (_ BitVec 64))) (size!19817 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40536)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun b!716111 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40536 (_ BitVec 32) List!13350) Bool)

(assert (=> b!716111 (= e!402080 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (=> b!716111 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24615 0))(
  ( (Unit!24616) )
))
(declare-fun lt!318969 () Unit!24615)

(declare-fun acc!652 () List!13350)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40536 (_ BitVec 64) (_ BitVec 32) List!13350 List!13350) Unit!24615)

(assert (=> b!716111 (= lt!318969 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!716112 () Bool)

(declare-fun res!478964 () Bool)

(assert (=> b!716112 (=> (not res!478964) (not e!402080))))

(assert (=> b!716112 (= res!478964 (not (validKeyInArray!0 (select (arr!19402 a!3591) from!2969))))))

(declare-fun b!716113 () Bool)

(declare-fun res!478958 () Bool)

(assert (=> b!716113 (=> (not res!478958) (not e!402080))))

(declare-fun contains!4002 (List!13350 (_ BitVec 64)) Bool)

(assert (=> b!716113 (= res!478958 (contains!4002 newAcc!49 k0!2824))))

(declare-fun res!478957 () Bool)

(assert (=> start!63586 (=> (not res!478957) (not e!402080))))

(assert (=> start!63586 (= res!478957 (and (bvslt (size!19817 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19817 a!3591))))))

(assert (=> start!63586 e!402080))

(assert (=> start!63586 true))

(declare-fun array_inv!15261 (array!40536) Bool)

(assert (=> start!63586 (array_inv!15261 a!3591)))

(declare-fun b!716114 () Bool)

(declare-fun res!478969 () Bool)

(assert (=> b!716114 (=> (not res!478969) (not e!402080))))

(assert (=> b!716114 (= res!478969 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19817 a!3591)))))

(declare-fun b!716115 () Bool)

(declare-fun res!478974 () Bool)

(assert (=> b!716115 (=> (not res!478974) (not e!402080))))

(assert (=> b!716115 (= res!478974 (not (contains!4002 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716116 () Bool)

(declare-fun res!478960 () Bool)

(assert (=> b!716116 (=> (not res!478960) (not e!402080))))

(assert (=> b!716116 (= res!478960 (not (contains!4002 acc!652 k0!2824)))))

(declare-fun b!716117 () Bool)

(declare-fun res!478975 () Bool)

(assert (=> b!716117 (=> (not res!478975) (not e!402080))))

(declare-fun arrayContainsKey!0 (array!40536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716117 (= res!478975 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716118 () Bool)

(declare-fun res!478962 () Bool)

(assert (=> b!716118 (=> (not res!478962) (not e!402080))))

(assert (=> b!716118 (= res!478962 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!716119 () Bool)

(declare-fun res!478968 () Bool)

(assert (=> b!716119 (=> (not res!478968) (not e!402080))))

(assert (=> b!716119 (= res!478968 (not (contains!4002 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716120 () Bool)

(declare-fun res!478961 () Bool)

(assert (=> b!716120 (=> (not res!478961) (not e!402080))))

(declare-fun noDuplicate!1276 (List!13350) Bool)

(assert (=> b!716120 (= res!478961 (noDuplicate!1276 acc!652))))

(declare-fun b!716121 () Bool)

(declare-fun res!478959 () Bool)

(assert (=> b!716121 (=> (not res!478959) (not e!402080))))

(assert (=> b!716121 (= res!478959 (not (contains!4002 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716122 () Bool)

(declare-fun res!478967 () Bool)

(assert (=> b!716122 (=> (not res!478967) (not e!402080))))

(assert (=> b!716122 (= res!478967 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!716123 () Bool)

(declare-fun res!478965 () Bool)

(assert (=> b!716123 (=> (not res!478965) (not e!402080))))

(declare-fun -!434 (List!13350 (_ BitVec 64)) List!13350)

(assert (=> b!716123 (= res!478965 (= (-!434 newAcc!49 k0!2824) acc!652))))

(declare-fun b!716124 () Bool)

(declare-fun res!478973 () Bool)

(assert (=> b!716124 (=> (not res!478973) (not e!402080))))

(declare-fun subseq!470 (List!13350 List!13350) Bool)

(assert (=> b!716124 (= res!478973 (subseq!470 acc!652 newAcc!49))))

(declare-fun b!716125 () Bool)

(declare-fun res!478971 () Bool)

(assert (=> b!716125 (=> (not res!478971) (not e!402080))))

(assert (=> b!716125 (= res!478971 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!716126 () Bool)

(declare-fun res!478966 () Bool)

(assert (=> b!716126 (=> (not res!478966) (not e!402080))))

(assert (=> b!716126 (= res!478966 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!716127 () Bool)

(declare-fun res!478970 () Bool)

(assert (=> b!716127 (=> (not res!478970) (not e!402080))))

(assert (=> b!716127 (= res!478970 (not (contains!4002 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!716128 () Bool)

(declare-fun res!478963 () Bool)

(assert (=> b!716128 (=> (not res!478963) (not e!402080))))

(assert (=> b!716128 (= res!478963 (noDuplicate!1276 newAcc!49))))

(assert (= (and start!63586 res!478957) b!716120))

(assert (= (and b!716120 res!478961) b!716128))

(assert (= (and b!716128 res!478963) b!716115))

(assert (= (and b!716115 res!478974) b!716119))

(assert (= (and b!716119 res!478968) b!716126))

(assert (= (and b!716126 res!478966) b!716116))

(assert (= (and b!716116 res!478960) b!716110))

(assert (= (and b!716110 res!478972) b!716125))

(assert (= (and b!716125 res!478971) b!716124))

(assert (= (and b!716124 res!478973) b!716113))

(assert (= (and b!716113 res!478958) b!716123))

(assert (= (and b!716123 res!478965) b!716127))

(assert (= (and b!716127 res!478970) b!716121))

(assert (= (and b!716121 res!478959) b!716114))

(assert (= (and b!716114 res!478969) b!716112))

(assert (= (and b!716112 res!478964) b!716118))

(assert (= (and b!716118 res!478962) b!716117))

(assert (= (and b!716117 res!478975) b!716122))

(assert (= (and b!716122 res!478967) b!716111))

(declare-fun m!672705 () Bool)

(assert (=> b!716124 m!672705))

(declare-fun m!672707 () Bool)

(assert (=> b!716119 m!672707))

(declare-fun m!672709 () Bool)

(assert (=> b!716128 m!672709))

(declare-fun m!672711 () Bool)

(assert (=> b!716111 m!672711))

(declare-fun m!672713 () Bool)

(assert (=> b!716111 m!672713))

(declare-fun m!672715 () Bool)

(assert (=> b!716111 m!672715))

(declare-fun m!672717 () Bool)

(assert (=> b!716121 m!672717))

(declare-fun m!672719 () Bool)

(assert (=> b!716122 m!672719))

(declare-fun m!672721 () Bool)

(assert (=> b!716110 m!672721))

(declare-fun m!672723 () Bool)

(assert (=> b!716115 m!672723))

(declare-fun m!672725 () Bool)

(assert (=> b!716116 m!672725))

(declare-fun m!672727 () Bool)

(assert (=> b!716117 m!672727))

(declare-fun m!672729 () Bool)

(assert (=> b!716120 m!672729))

(declare-fun m!672731 () Bool)

(assert (=> b!716113 m!672731))

(declare-fun m!672733 () Bool)

(assert (=> b!716123 m!672733))

(declare-fun m!672735 () Bool)

(assert (=> start!63586 m!672735))

(declare-fun m!672737 () Bool)

(assert (=> b!716127 m!672737))

(declare-fun m!672739 () Bool)

(assert (=> b!716125 m!672739))

(declare-fun m!672741 () Bool)

(assert (=> b!716126 m!672741))

(declare-fun m!672743 () Bool)

(assert (=> b!716112 m!672743))

(assert (=> b!716112 m!672743))

(declare-fun m!672745 () Bool)

(assert (=> b!716112 m!672745))

(check-sat (not b!716111) (not b!716127) (not b!716122) (not b!716125) (not b!716117) (not b!716115) (not b!716123) (not b!716116) (not b!716128) (not b!716121) (not b!716119) (not b!716120) (not b!716113) (not b!716124) (not b!716126) (not b!716112) (not b!716110) (not start!63586))
(check-sat)
(get-model)

(declare-fun d!98591 () Bool)

(declare-fun res!479094 () Bool)

(declare-fun e!402098 () Bool)

(assert (=> d!98591 (=> res!479094 e!402098)))

(get-info :version)

(assert (=> d!98591 (= res!479094 ((_ is Nil!13347) acc!652))))

(assert (=> d!98591 (= (noDuplicate!1276 acc!652) e!402098)))

(declare-fun b!716247 () Bool)

(declare-fun e!402099 () Bool)

(assert (=> b!716247 (= e!402098 e!402099)))

(declare-fun res!479095 () Bool)

(assert (=> b!716247 (=> (not res!479095) (not e!402099))))

(assert (=> b!716247 (= res!479095 (not (contains!4002 (t!19657 acc!652) (h!14394 acc!652))))))

(declare-fun b!716248 () Bool)

(assert (=> b!716248 (= e!402099 (noDuplicate!1276 (t!19657 acc!652)))))

(assert (= (and d!98591 (not res!479094)) b!716247))

(assert (= (and b!716247 res!479095) b!716248))

(declare-fun m!672831 () Bool)

(assert (=> b!716247 m!672831))

(declare-fun m!672833 () Bool)

(assert (=> b!716248 m!672833))

(assert (=> b!716120 d!98591))

(declare-fun d!98593 () Bool)

(assert (=> d!98593 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!716110 d!98593))

(declare-fun d!98595 () Bool)

(declare-fun lt!318978 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!372 (List!13350) (InoxSet (_ BitVec 64)))

(assert (=> d!98595 (= lt!318978 (select (content!372 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402104 () Bool)

(assert (=> d!98595 (= lt!318978 e!402104)))

(declare-fun res!479101 () Bool)

(assert (=> d!98595 (=> (not res!479101) (not e!402104))))

(assert (=> d!98595 (= res!479101 ((_ is Cons!13346) newAcc!49))))

(assert (=> d!98595 (= (contains!4002 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318978)))

(declare-fun b!716253 () Bool)

(declare-fun e!402105 () Bool)

(assert (=> b!716253 (= e!402104 e!402105)))

(declare-fun res!479100 () Bool)

(assert (=> b!716253 (=> res!479100 e!402105)))

(assert (=> b!716253 (= res!479100 (= (h!14394 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716254 () Bool)

(assert (=> b!716254 (= e!402105 (contains!4002 (t!19657 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98595 res!479101) b!716253))

(assert (= (and b!716253 (not res!479100)) b!716254))

(declare-fun m!672835 () Bool)

(assert (=> d!98595 m!672835))

(declare-fun m!672837 () Bool)

(assert (=> d!98595 m!672837))

(declare-fun m!672839 () Bool)

(assert (=> b!716254 m!672839))

(assert (=> b!716121 d!98595))

(declare-fun d!98599 () Bool)

(declare-fun lt!318979 () Bool)

(assert (=> d!98599 (= lt!318979 (select (content!372 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402106 () Bool)

(assert (=> d!98599 (= lt!318979 e!402106)))

(declare-fun res!479103 () Bool)

(assert (=> d!98599 (=> (not res!479103) (not e!402106))))

(assert (=> d!98599 (= res!479103 ((_ is Cons!13346) acc!652))))

(assert (=> d!98599 (= (contains!4002 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318979)))

(declare-fun b!716255 () Bool)

(declare-fun e!402107 () Bool)

(assert (=> b!716255 (= e!402106 e!402107)))

(declare-fun res!479102 () Bool)

(assert (=> b!716255 (=> res!479102 e!402107)))

(assert (=> b!716255 (= res!479102 (= (h!14394 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716256 () Bool)

(assert (=> b!716256 (= e!402107 (contains!4002 (t!19657 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98599 res!479103) b!716255))

(assert (= (and b!716255 (not res!479102)) b!716256))

(declare-fun m!672841 () Bool)

(assert (=> d!98599 m!672841))

(declare-fun m!672843 () Bool)

(assert (=> d!98599 m!672843))

(declare-fun m!672845 () Bool)

(assert (=> b!716256 m!672845))

(assert (=> b!716119 d!98599))

(declare-fun d!98601 () Bool)

(assert (=> d!98601 (= (validKeyInArray!0 (select (arr!19402 a!3591) from!2969)) (and (not (= (select (arr!19402 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19402 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!716112 d!98601))

(declare-fun d!98603 () Bool)

(declare-fun e!402140 () Bool)

(assert (=> d!98603 e!402140))

(declare-fun res!479130 () Bool)

(assert (=> d!98603 (=> (not res!479130) (not e!402140))))

(declare-fun lt!318985 () List!13350)

(declare-fun size!19820 (List!13350) Int)

(assert (=> d!98603 (= res!479130 (<= (size!19820 lt!318985) (size!19820 newAcc!49)))))

(declare-fun e!402139 () List!13350)

(assert (=> d!98603 (= lt!318985 e!402139)))

(declare-fun c!78950 () Bool)

(assert (=> d!98603 (= c!78950 ((_ is Cons!13346) newAcc!49))))

(assert (=> d!98603 (= (-!434 newAcc!49 k0!2824) lt!318985)))

(declare-fun b!716291 () Bool)

(declare-fun e!402141 () List!13350)

(declare-fun call!34641 () List!13350)

(assert (=> b!716291 (= e!402141 call!34641)))

(declare-fun b!716292 () Bool)

(assert (=> b!716292 (= e!402139 Nil!13347)))

(declare-fun b!716293 () Bool)

(assert (=> b!716293 (= e!402140 (= (content!372 lt!318985) ((_ map and) (content!372 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun bm!34638 () Bool)

(assert (=> bm!34638 (= call!34641 (-!434 (t!19657 newAcc!49) k0!2824))))

(declare-fun b!716294 () Bool)

(assert (=> b!716294 (= e!402141 (Cons!13346 (h!14394 newAcc!49) call!34641))))

(declare-fun b!716295 () Bool)

(assert (=> b!716295 (= e!402139 e!402141)))

(declare-fun c!78949 () Bool)

(assert (=> b!716295 (= c!78949 (= k0!2824 (h!14394 newAcc!49)))))

(assert (= (and d!98603 c!78950) b!716295))

(assert (= (and d!98603 (not c!78950)) b!716292))

(assert (= (and b!716295 c!78949) b!716291))

(assert (= (and b!716295 (not c!78949)) b!716294))

(assert (= (or b!716291 b!716294) bm!34638))

(assert (= (and d!98603 res!479130) b!716293))

(declare-fun m!672861 () Bool)

(assert (=> d!98603 m!672861))

(declare-fun m!672863 () Bool)

(assert (=> d!98603 m!672863))

(declare-fun m!672865 () Bool)

(assert (=> b!716293 m!672865))

(assert (=> b!716293 m!672835))

(declare-fun m!672867 () Bool)

(assert (=> b!716293 m!672867))

(declare-fun m!672869 () Bool)

(assert (=> bm!34638 m!672869))

(assert (=> b!716123 d!98603))

(declare-fun d!98613 () Bool)

(declare-fun lt!318986 () Bool)

(assert (=> d!98613 (= lt!318986 (select (content!372 newAcc!49) k0!2824))))

(declare-fun e!402142 () Bool)

(assert (=> d!98613 (= lt!318986 e!402142)))

(declare-fun res!479132 () Bool)

(assert (=> d!98613 (=> (not res!479132) (not e!402142))))

(assert (=> d!98613 (= res!479132 ((_ is Cons!13346) newAcc!49))))

(assert (=> d!98613 (= (contains!4002 newAcc!49 k0!2824) lt!318986)))

(declare-fun b!716296 () Bool)

(declare-fun e!402143 () Bool)

(assert (=> b!716296 (= e!402142 e!402143)))

(declare-fun res!479131 () Bool)

(assert (=> b!716296 (=> res!479131 e!402143)))

(assert (=> b!716296 (= res!479131 (= (h!14394 newAcc!49) k0!2824))))

(declare-fun b!716297 () Bool)

(assert (=> b!716297 (= e!402143 (contains!4002 (t!19657 newAcc!49) k0!2824))))

(assert (= (and d!98613 res!479132) b!716296))

(assert (= (and b!716296 (not res!479131)) b!716297))

(assert (=> d!98613 m!672835))

(declare-fun m!672871 () Bool)

(assert (=> d!98613 m!672871))

(declare-fun m!672873 () Bool)

(assert (=> b!716297 m!672873))

(assert (=> b!716113 d!98613))

(declare-fun call!34647 () Bool)

(declare-fun bm!34644 () Bool)

(declare-fun c!78956 () Bool)

(assert (=> bm!34644 (= call!34647 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78956 (Cons!13346 (select (arr!19402 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun e!402182 () Bool)

(declare-fun b!716341 () Bool)

(assert (=> b!716341 (= e!402182 (contains!4002 newAcc!49 (select (arr!19402 a!3591) from!2969)))))

(declare-fun b!716342 () Bool)

(declare-fun e!402183 () Bool)

(declare-fun e!402184 () Bool)

(assert (=> b!716342 (= e!402183 e!402184)))

(declare-fun res!479168 () Bool)

(assert (=> b!716342 (=> (not res!479168) (not e!402184))))

(assert (=> b!716342 (= res!479168 (not e!402182))))

(declare-fun res!479166 () Bool)

(assert (=> b!716342 (=> (not res!479166) (not e!402182))))

(assert (=> b!716342 (= res!479166 (validKeyInArray!0 (select (arr!19402 a!3591) from!2969)))))

(declare-fun b!716343 () Bool)

(declare-fun e!402185 () Bool)

(assert (=> b!716343 (= e!402185 call!34647)))

(declare-fun b!716345 () Bool)

(assert (=> b!716345 (= e!402185 call!34647)))

(declare-fun b!716344 () Bool)

(assert (=> b!716344 (= e!402184 e!402185)))

(assert (=> b!716344 (= c!78956 (validKeyInArray!0 (select (arr!19402 a!3591) from!2969)))))

(declare-fun d!98615 () Bool)

(declare-fun res!479167 () Bool)

(assert (=> d!98615 (=> res!479167 e!402183)))

(assert (=> d!98615 (= res!479167 (bvsge from!2969 (size!19817 a!3591)))))

(assert (=> d!98615 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!402183)))

(assert (= (and d!98615 (not res!479167)) b!716342))

(assert (= (and b!716342 res!479166) b!716341))

(assert (= (and b!716342 res!479168) b!716344))

(assert (= (and b!716344 c!78956) b!716343))

(assert (= (and b!716344 (not c!78956)) b!716345))

(assert (= (or b!716343 b!716345) bm!34644))

(assert (=> bm!34644 m!672743))

(declare-fun m!672895 () Bool)

(assert (=> bm!34644 m!672895))

(assert (=> b!716341 m!672743))

(assert (=> b!716341 m!672743))

(declare-fun m!672897 () Bool)

(assert (=> b!716341 m!672897))

(assert (=> b!716342 m!672743))

(assert (=> b!716342 m!672743))

(assert (=> b!716342 m!672745))

(assert (=> b!716344 m!672743))

(assert (=> b!716344 m!672743))

(assert (=> b!716344 m!672745))

(assert (=> b!716111 d!98615))

(declare-fun c!78958 () Bool)

(declare-fun call!34649 () Bool)

(declare-fun bm!34646 () Bool)

(assert (=> bm!34646 (= call!34649 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78958 (Cons!13346 (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) newAcc!49) newAcc!49)))))

(declare-fun b!716353 () Bool)

(declare-fun e!402192 () Bool)

(assert (=> b!716353 (= e!402192 (contains!4002 newAcc!49 (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716354 () Bool)

(declare-fun e!402193 () Bool)

(declare-fun e!402194 () Bool)

(assert (=> b!716354 (= e!402193 e!402194)))

(declare-fun res!479176 () Bool)

(assert (=> b!716354 (=> (not res!479176) (not e!402194))))

(assert (=> b!716354 (= res!479176 (not e!402192))))

(declare-fun res!479174 () Bool)

(assert (=> b!716354 (=> (not res!479174) (not e!402192))))

(assert (=> b!716354 (= res!479174 (validKeyInArray!0 (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716355 () Bool)

(declare-fun e!402195 () Bool)

(assert (=> b!716355 (= e!402195 call!34649)))

(declare-fun b!716357 () Bool)

(assert (=> b!716357 (= e!402195 call!34649)))

(declare-fun b!716356 () Bool)

(assert (=> b!716356 (= e!402194 e!402195)))

(assert (=> b!716356 (= c!78958 (validKeyInArray!0 (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98629 () Bool)

(declare-fun res!479175 () Bool)

(assert (=> d!98629 (=> res!479175 e!402193)))

(assert (=> d!98629 (= res!479175 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19817 a!3591)))))

(assert (=> d!98629 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49) e!402193)))

(assert (= (and d!98629 (not res!479175)) b!716354))

(assert (= (and b!716354 res!479174) b!716353))

(assert (= (and b!716354 res!479176) b!716356))

(assert (= (and b!716356 c!78958) b!716355))

(assert (= (and b!716356 (not c!78958)) b!716357))

(assert (= (or b!716355 b!716357) bm!34646))

(declare-fun m!672903 () Bool)

(assert (=> bm!34646 m!672903))

(declare-fun m!672905 () Bool)

(assert (=> bm!34646 m!672905))

(assert (=> b!716353 m!672903))

(assert (=> b!716353 m!672903))

(declare-fun m!672909 () Bool)

(assert (=> b!716353 m!672909))

(assert (=> b!716354 m!672903))

(assert (=> b!716354 m!672903))

(declare-fun m!672911 () Bool)

(assert (=> b!716354 m!672911))

(assert (=> b!716356 m!672903))

(assert (=> b!716356 m!672903))

(assert (=> b!716356 m!672911))

(assert (=> b!716111 d!98629))

(declare-fun d!98635 () Bool)

(assert (=> d!98635 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun lt!318993 () Unit!24615)

(declare-fun choose!66 (array!40536 (_ BitVec 64) (_ BitVec 32) List!13350 List!13350) Unit!24615)

(assert (=> d!98635 (= lt!318993 (choose!66 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(assert (=> d!98635 (bvslt (size!19817 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!98635 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49) lt!318993)))

(declare-fun bs!20627 () Bool)

(assert (= bs!20627 d!98635))

(assert (=> bs!20627 m!672713))

(declare-fun m!672921 () Bool)

(assert (=> bs!20627 m!672921))

(assert (=> b!716111 d!98635))

(declare-fun call!34651 () Bool)

(declare-fun bm!34648 () Bool)

(declare-fun c!78962 () Bool)

(assert (=> bm!34648 (= call!34651 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78962 (Cons!13346 (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) acc!652) acc!652)))))

(declare-fun b!716373 () Bool)

(declare-fun e!402208 () Bool)

(assert (=> b!716373 (= e!402208 (contains!4002 acc!652 (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716374 () Bool)

(declare-fun e!402209 () Bool)

(declare-fun e!402210 () Bool)

(assert (=> b!716374 (= e!402209 e!402210)))

(declare-fun res!479188 () Bool)

(assert (=> b!716374 (=> (not res!479188) (not e!402210))))

(assert (=> b!716374 (= res!479188 (not e!402208))))

(declare-fun res!479186 () Bool)

(assert (=> b!716374 (=> (not res!479186) (not e!402208))))

(assert (=> b!716374 (= res!479186 (validKeyInArray!0 (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716375 () Bool)

(declare-fun e!402211 () Bool)

(assert (=> b!716375 (= e!402211 call!34651)))

(declare-fun b!716377 () Bool)

(assert (=> b!716377 (= e!402211 call!34651)))

(declare-fun b!716376 () Bool)

(assert (=> b!716376 (= e!402210 e!402211)))

(assert (=> b!716376 (= c!78962 (validKeyInArray!0 (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98639 () Bool)

(declare-fun res!479187 () Bool)

(assert (=> d!98639 (=> res!479187 e!402209)))

(assert (=> d!98639 (= res!479187 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19817 a!3591)))))

(assert (=> d!98639 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652) e!402209)))

(assert (= (and d!98639 (not res!479187)) b!716374))

(assert (= (and b!716374 res!479186) b!716373))

(assert (= (and b!716374 res!479188) b!716376))

(assert (= (and b!716376 c!78962) b!716375))

(assert (= (and b!716376 (not c!78962)) b!716377))

(assert (= (or b!716375 b!716377) bm!34648))

(assert (=> bm!34648 m!672903))

(declare-fun m!672923 () Bool)

(assert (=> bm!34648 m!672923))

(assert (=> b!716373 m!672903))

(assert (=> b!716373 m!672903))

(declare-fun m!672927 () Bool)

(assert (=> b!716373 m!672927))

(assert (=> b!716374 m!672903))

(assert (=> b!716374 m!672903))

(assert (=> b!716374 m!672911))

(assert (=> b!716376 m!672903))

(assert (=> b!716376 m!672903))

(assert (=> b!716376 m!672911))

(assert (=> b!716122 d!98639))

(declare-fun d!98643 () Bool)

(assert (=> d!98643 (= (array_inv!15261 a!3591) (bvsge (size!19817 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63586 d!98643))

(declare-fun d!98645 () Bool)

(declare-fun lt!318997 () Bool)

(assert (=> d!98645 (= lt!318997 (select (content!372 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402212 () Bool)

(assert (=> d!98645 (= lt!318997 e!402212)))

(declare-fun res!479190 () Bool)

(assert (=> d!98645 (=> (not res!479190) (not e!402212))))

(assert (=> d!98645 (= res!479190 ((_ is Cons!13346) acc!652))))

(assert (=> d!98645 (= (contains!4002 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318997)))

(declare-fun b!716378 () Bool)

(declare-fun e!402213 () Bool)

(assert (=> b!716378 (= e!402212 e!402213)))

(declare-fun res!479189 () Bool)

(assert (=> b!716378 (=> res!479189 e!402213)))

(assert (=> b!716378 (= res!479189 (= (h!14394 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716379 () Bool)

(assert (=> b!716379 (= e!402213 (contains!4002 (t!19657 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98645 res!479190) b!716378))

(assert (= (and b!716378 (not res!479189)) b!716379))

(assert (=> d!98645 m!672841))

(declare-fun m!672929 () Bool)

(assert (=> d!98645 m!672929))

(declare-fun m!672931 () Bool)

(assert (=> b!716379 m!672931))

(assert (=> b!716115 d!98645))

(declare-fun d!98647 () Bool)

(declare-fun res!479214 () Bool)

(declare-fun e!402240 () Bool)

(assert (=> d!98647 (=> res!479214 e!402240)))

(assert (=> d!98647 (= res!479214 (= (select (arr!19402 a!3591) from!2969) k0!2824))))

(assert (=> d!98647 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!402240)))

(declare-fun b!716409 () Bool)

(declare-fun e!402241 () Bool)

(assert (=> b!716409 (= e!402240 e!402241)))

(declare-fun res!479215 () Bool)

(assert (=> b!716409 (=> (not res!479215) (not e!402241))))

(assert (=> b!716409 (= res!479215 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19817 a!3591)))))

(declare-fun b!716410 () Bool)

(assert (=> b!716410 (= e!402241 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98647 (not res!479214)) b!716409))

(assert (= (and b!716409 res!479215) b!716410))

(assert (=> d!98647 m!672743))

(declare-fun m!672957 () Bool)

(assert (=> b!716410 m!672957))

(assert (=> b!716126 d!98647))

(declare-fun b!716431 () Bool)

(declare-fun e!402258 () Bool)

(assert (=> b!716431 (= e!402258 (subseq!470 acc!652 (t!19657 newAcc!49)))))

(declare-fun b!716428 () Bool)

(declare-fun e!402260 () Bool)

(declare-fun e!402261 () Bool)

(assert (=> b!716428 (= e!402260 e!402261)))

(declare-fun res!479231 () Bool)

(assert (=> b!716428 (=> (not res!479231) (not e!402261))))

(assert (=> b!716428 (= res!479231 ((_ is Cons!13346) newAcc!49))))

(declare-fun b!716430 () Bool)

(declare-fun e!402259 () Bool)

(assert (=> b!716430 (= e!402259 (subseq!470 (t!19657 acc!652) (t!19657 newAcc!49)))))

(declare-fun d!98659 () Bool)

(declare-fun res!479234 () Bool)

(assert (=> d!98659 (=> res!479234 e!402260)))

(assert (=> d!98659 (= res!479234 ((_ is Nil!13347) acc!652))))

(assert (=> d!98659 (= (subseq!470 acc!652 newAcc!49) e!402260)))

(declare-fun b!716429 () Bool)

(assert (=> b!716429 (= e!402261 e!402258)))

(declare-fun res!479232 () Bool)

(assert (=> b!716429 (=> res!479232 e!402258)))

(assert (=> b!716429 (= res!479232 e!402259)))

(declare-fun res!479233 () Bool)

(assert (=> b!716429 (=> (not res!479233) (not e!402259))))

(assert (=> b!716429 (= res!479233 (= (h!14394 acc!652) (h!14394 newAcc!49)))))

(assert (= (and d!98659 (not res!479234)) b!716428))

(assert (= (and b!716428 res!479231) b!716429))

(assert (= (and b!716429 res!479233) b!716430))

(assert (= (and b!716429 (not res!479232)) b!716431))

(declare-fun m!672977 () Bool)

(assert (=> b!716431 m!672977))

(declare-fun m!672979 () Bool)

(assert (=> b!716430 m!672979))

(assert (=> b!716124 d!98659))

(declare-fun call!34658 () Bool)

(declare-fun c!78971 () Bool)

(declare-fun bm!34655 () Bool)

(assert (=> bm!34655 (= call!34658 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78971 (Cons!13346 (select (arr!19402 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun e!402267 () Bool)

(declare-fun b!716442 () Bool)

(assert (=> b!716442 (= e!402267 (contains!4002 acc!652 (select (arr!19402 a!3591) from!2969)))))

(declare-fun b!716443 () Bool)

(declare-fun e!402269 () Bool)

(declare-fun e!402271 () Bool)

(assert (=> b!716443 (= e!402269 e!402271)))

(declare-fun res!479239 () Bool)

(assert (=> b!716443 (=> (not res!479239) (not e!402271))))

(assert (=> b!716443 (= res!479239 (not e!402267))))

(declare-fun res!479237 () Bool)

(assert (=> b!716443 (=> (not res!479237) (not e!402267))))

(assert (=> b!716443 (= res!479237 (validKeyInArray!0 (select (arr!19402 a!3591) from!2969)))))

(declare-fun b!716444 () Bool)

(declare-fun e!402272 () Bool)

(assert (=> b!716444 (= e!402272 call!34658)))

(declare-fun b!716446 () Bool)

(assert (=> b!716446 (= e!402272 call!34658)))

(declare-fun b!716445 () Bool)

(assert (=> b!716445 (= e!402271 e!402272)))

(assert (=> b!716445 (= c!78971 (validKeyInArray!0 (select (arr!19402 a!3591) from!2969)))))

(declare-fun d!98673 () Bool)

(declare-fun res!479238 () Bool)

(assert (=> d!98673 (=> res!479238 e!402269)))

(assert (=> d!98673 (= res!479238 (bvsge from!2969 (size!19817 a!3591)))))

(assert (=> d!98673 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!402269)))

(assert (= (and d!98673 (not res!479238)) b!716443))

(assert (= (and b!716443 res!479237) b!716442))

(assert (= (and b!716443 res!479239) b!716445))

(assert (= (and b!716445 c!78971) b!716444))

(assert (= (and b!716445 (not c!78971)) b!716446))

(assert (= (or b!716444 b!716446) bm!34655))

(assert (=> bm!34655 m!672743))

(declare-fun m!672985 () Bool)

(assert (=> bm!34655 m!672985))

(assert (=> b!716442 m!672743))

(assert (=> b!716442 m!672743))

(declare-fun m!672987 () Bool)

(assert (=> b!716442 m!672987))

(assert (=> b!716443 m!672743))

(assert (=> b!716443 m!672743))

(assert (=> b!716443 m!672745))

(assert (=> b!716445 m!672743))

(assert (=> b!716445 m!672743))

(assert (=> b!716445 m!672745))

(assert (=> b!716125 d!98673))

(declare-fun d!98679 () Bool)

(declare-fun res!479242 () Bool)

(declare-fun e!402275 () Bool)

(assert (=> d!98679 (=> res!479242 e!402275)))

(assert (=> d!98679 (= res!479242 ((_ is Nil!13347) newAcc!49))))

(assert (=> d!98679 (= (noDuplicate!1276 newAcc!49) e!402275)))

(declare-fun b!716449 () Bool)

(declare-fun e!402276 () Bool)

(assert (=> b!716449 (= e!402275 e!402276)))

(declare-fun res!479243 () Bool)

(assert (=> b!716449 (=> (not res!479243) (not e!402276))))

(assert (=> b!716449 (= res!479243 (not (contains!4002 (t!19657 newAcc!49) (h!14394 newAcc!49))))))

(declare-fun b!716450 () Bool)

(assert (=> b!716450 (= e!402276 (noDuplicate!1276 (t!19657 newAcc!49)))))

(assert (= (and d!98679 (not res!479242)) b!716449))

(assert (= (and b!716449 res!479243) b!716450))

(declare-fun m!672993 () Bool)

(assert (=> b!716449 m!672993))

(declare-fun m!672995 () Bool)

(assert (=> b!716450 m!672995))

(assert (=> b!716128 d!98679))

(declare-fun d!98683 () Bool)

(declare-fun lt!319009 () Bool)

(assert (=> d!98683 (= lt!319009 (select (content!372 acc!652) k0!2824))))

(declare-fun e!402281 () Bool)

(assert (=> d!98683 (= lt!319009 e!402281)))

(declare-fun res!479249 () Bool)

(assert (=> d!98683 (=> (not res!479249) (not e!402281))))

(assert (=> d!98683 (= res!479249 ((_ is Cons!13346) acc!652))))

(assert (=> d!98683 (= (contains!4002 acc!652 k0!2824) lt!319009)))

(declare-fun b!716455 () Bool)

(declare-fun e!402282 () Bool)

(assert (=> b!716455 (= e!402281 e!402282)))

(declare-fun res!479248 () Bool)

(assert (=> b!716455 (=> res!479248 e!402282)))

(assert (=> b!716455 (= res!479248 (= (h!14394 acc!652) k0!2824))))

(declare-fun b!716456 () Bool)

(assert (=> b!716456 (= e!402282 (contains!4002 (t!19657 acc!652) k0!2824))))

(assert (= (and d!98683 res!479249) b!716455))

(assert (= (and b!716455 (not res!479248)) b!716456))

(assert (=> d!98683 m!672841))

(declare-fun m!672999 () Bool)

(assert (=> d!98683 m!672999))

(declare-fun m!673003 () Bool)

(assert (=> b!716456 m!673003))

(assert (=> b!716116 d!98683))

(declare-fun d!98687 () Bool)

(declare-fun lt!319010 () Bool)

(assert (=> d!98687 (= lt!319010 (select (content!372 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402283 () Bool)

(assert (=> d!98687 (= lt!319010 e!402283)))

(declare-fun res!479251 () Bool)

(assert (=> d!98687 (=> (not res!479251) (not e!402283))))

(assert (=> d!98687 (= res!479251 ((_ is Cons!13346) newAcc!49))))

(assert (=> d!98687 (= (contains!4002 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!319010)))

(declare-fun b!716457 () Bool)

(declare-fun e!402284 () Bool)

(assert (=> b!716457 (= e!402283 e!402284)))

(declare-fun res!479250 () Bool)

(assert (=> b!716457 (=> res!479250 e!402284)))

(assert (=> b!716457 (= res!479250 (= (h!14394 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716458 () Bool)

(assert (=> b!716458 (= e!402284 (contains!4002 (t!19657 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98687 res!479251) b!716457))

(assert (= (and b!716457 (not res!479250)) b!716458))

(assert (=> d!98687 m!672835))

(declare-fun m!673005 () Bool)

(assert (=> d!98687 m!673005))

(declare-fun m!673007 () Bool)

(assert (=> b!716458 m!673007))

(assert (=> b!716127 d!98687))

(declare-fun d!98689 () Bool)

(declare-fun res!479252 () Bool)

(declare-fun e!402285 () Bool)

(assert (=> d!98689 (=> res!479252 e!402285)))

(assert (=> d!98689 (= res!479252 (= (select (arr!19402 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98689 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!402285)))

(declare-fun b!716459 () Bool)

(declare-fun e!402286 () Bool)

(assert (=> b!716459 (= e!402285 e!402286)))

(declare-fun res!479253 () Bool)

(assert (=> b!716459 (=> (not res!479253) (not e!402286))))

(assert (=> b!716459 (= res!479253 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19817 a!3591)))))

(declare-fun b!716460 () Bool)

(assert (=> b!716460 (= e!402286 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98689 (not res!479252)) b!716459))

(assert (= (and b!716459 res!479253) b!716460))

(assert (=> d!98689 m!672903))

(declare-fun m!673009 () Bool)

(assert (=> b!716460 m!673009))

(assert (=> b!716117 d!98689))

(check-sat (not b!716248) (not b!716356) (not b!716341) (not d!98645) (not b!716344) (not bm!34644) (not d!98603) (not d!98595) (not bm!34638) (not d!98635) (not d!98613) (not b!716458) (not b!716256) (not d!98599) (not b!716431) (not b!716450) (not b!716442) (not b!716376) (not b!716449) (not b!716353) (not b!716445) (not d!98683) (not b!716247) (not b!716342) (not b!716456) (not b!716443) (not b!716297) (not b!716379) (not b!716460) (not b!716254) (not bm!34648) (not b!716410) (not d!98687) (not b!716374) (not b!716293) (not b!716430) (not bm!34646) (not bm!34655) (not b!716354) (not b!716373))
(check-sat)
