; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84918 () Bool)

(assert start!84918)

(declare-fun res!663142 () Bool)

(declare-fun e!559670 () Bool)

(assert (=> start!84918 (=> (not res!663142) (not e!559670))))

(declare-datatypes ((List!20874 0))(
  ( (Nil!20871) (Cons!20870 (h!22032 (_ BitVec 64)) (t!29857 List!20874)) )
))
(declare-fun tail!21 () List!20874)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5735 (List!20874 (_ BitVec 64)) Bool)

(assert (=> start!84918 (= res!663142 (not (contains!5735 tail!21 head!726)))))

(assert (=> start!84918 e!559670))

(assert (=> start!84918 true))

(declare-fun b!992171 () Bool)

(declare-fun res!663143 () Bool)

(assert (=> b!992171 (=> (not res!663143) (not e!559670))))

(declare-fun content!429 (List!20874) (Set (_ BitVec 64)))

(assert (=> b!992171 (= res!663143 (not (member head!726 (content!429 tail!21))))))

(declare-fun b!992172 () Bool)

(declare-fun e!559671 () Bool)

(assert (=> b!992172 (= e!559670 e!559671)))

(declare-fun res!663144 () Bool)

(assert (=> b!992172 (=> (not res!663144) (not e!559671))))

(declare-datatypes ((tuple2!14938 0))(
  ( (tuple2!14939 (_1!7480 (_ BitVec 64)) (_2!7480 List!20874)) )
))
(declare-datatypes ((Option!524 0))(
  ( (Some!523 (v!14318 tuple2!14938)) (None!522) )
))
(declare-fun lt!440080 () Option!524)

(declare-fun isEmpty!731 (Option!524) Bool)

(assert (=> b!992172 (= res!663144 (not (isEmpty!731 lt!440080)))))

(declare-fun unapply!3 (List!20874) Option!524)

(declare-fun $colon$colon!560 (List!20874 (_ BitVec 64)) List!20874)

(assert (=> b!992172 (= lt!440080 (unapply!3 ($colon$colon!560 tail!21 head!726)))))

(declare-fun b!992173 () Bool)

(declare-fun isDefined!388 (Option!524) Bool)

(assert (=> b!992173 (= e!559671 (not (isDefined!388 lt!440080)))))

(assert (= (and start!84918 res!663142) b!992171))

(assert (= (and b!992171 res!663143) b!992172))

(assert (= (and b!992172 res!663144) b!992173))

(declare-fun m!919865 () Bool)

(assert (=> start!84918 m!919865))

(declare-fun m!919867 () Bool)

(assert (=> b!992171 m!919867))

(declare-fun m!919869 () Bool)

(assert (=> b!992171 m!919869))

(declare-fun m!919871 () Bool)

(assert (=> b!992172 m!919871))

(declare-fun m!919873 () Bool)

(assert (=> b!992172 m!919873))

(assert (=> b!992172 m!919873))

(declare-fun m!919875 () Bool)

(assert (=> b!992172 m!919875))

(declare-fun m!919877 () Bool)

(assert (=> b!992173 m!919877))

(push 1)

(assert (not start!84918))

(assert (not b!992173))

(assert (not b!992172))

(assert (not b!992171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118021 () Bool)

(declare-fun lt!440085 () Bool)

(assert (=> d!118021 (= lt!440085 (member head!726 (content!429 tail!21)))))

(declare-fun e!559684 () Bool)

(assert (=> d!118021 (= lt!440085 e!559684)))

(declare-fun res!663154 () Bool)

(assert (=> d!118021 (=> (not res!663154) (not e!559684))))

(assert (=> d!118021 (= res!663154 (is-Cons!20870 tail!21))))

(assert (=> d!118021 (= (contains!5735 tail!21 head!726) lt!440085)))

(declare-fun b!992188 () Bool)

(declare-fun e!559683 () Bool)

(assert (=> b!992188 (= e!559684 e!559683)))

(declare-fun res!663153 () Bool)

(assert (=> b!992188 (=> res!663153 e!559683)))

(assert (=> b!992188 (= res!663153 (= (h!22032 tail!21) head!726))))

(declare-fun b!992189 () Bool)

(assert (=> b!992189 (= e!559683 (contains!5735 (t!29857 tail!21) head!726))))

(assert (= (and d!118021 res!663154) b!992188))

(assert (= (and b!992188 (not res!663153)) b!992189))

(assert (=> d!118021 m!919867))

(assert (=> d!118021 m!919869))

(declare-fun m!919883 () Bool)

(assert (=> b!992189 m!919883))

(assert (=> start!84918 d!118021))

(declare-fun d!118027 () Bool)

(assert (=> d!118027 (= (isDefined!388 lt!440080) (not (isEmpty!731 lt!440080)))))

(declare-fun bs!28207 () Bool)

(assert (= bs!28207 d!118027))

(assert (=> bs!28207 m!919871))

(assert (=> b!992173 d!118027))

(declare-fun d!118031 () Bool)

(assert (=> d!118031 (= (isEmpty!731 lt!440080) (not (is-Some!523 lt!440080)))))

(assert (=> b!992172 d!118031))

(declare-fun d!118035 () Bool)

(assert (=> d!118035 (= (unapply!3 ($colon$colon!560 tail!21 head!726)) (ite (is-Nil!20871 ($colon$colon!560 tail!21 head!726)) None!522 (Some!523 (tuple2!14939 (h!22032 ($colon$colon!560 tail!21 head!726)) (t!29857 ($colon$colon!560 tail!21 head!726))))))))

(assert (=> b!992172 d!118035))

(declare-fun d!118041 () Bool)

(assert (=> d!118041 (= ($colon$colon!560 tail!21 head!726) (Cons!20870 head!726 tail!21))))

(assert (=> b!992172 d!118041))

(declare-fun d!118047 () Bool)

(declare-fun c!100659 () Bool)

(assert (=> d!118047 (= c!100659 (is-Nil!20871 tail!21))))

