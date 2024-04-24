; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85484 () Bool)

(assert start!85484)

(declare-fun res!664037 () Bool)

(declare-fun e!560885 () Bool)

(assert (=> start!85484 (=> (not res!664037) (not e!560885))))

(declare-datatypes ((List!20900 0))(
  ( (Nil!20897) (Cons!20896 (h!22064 (_ BitVec 64)) (t!29893 List!20900)) )
))
(declare-fun l!3519 () List!20900)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5794 (List!20900 (_ BitVec 64)) Bool)

(assert (=> start!85484 (= res!664037 (not (contains!5794 l!3519 e!29)))))

(assert (=> start!85484 e!560885))

(assert (=> start!85484 true))

(declare-fun b!993911 () Bool)

(declare-fun e!560886 () Bool)

(assert (=> b!993911 (= e!560885 e!560886)))

(declare-fun res!664036 () Bool)

(assert (=> b!993911 (=> (not res!664036) (not e!560886))))

(declare-datatypes ((tuple2!15004 0))(
  ( (tuple2!15005 (_1!7513 (_ BitVec 64)) (_2!7513 List!20900)) )
))
(declare-datatypes ((Option!553 0))(
  ( (Some!552 (v!14379 tuple2!15004)) (None!551) )
))
(declare-fun lt!440764 () Option!553)

(declare-fun isEmpty!768 (Option!553) Bool)

(assert (=> b!993911 (= res!664036 (not (isEmpty!768 lt!440764)))))

(declare-fun unapply!34 (List!20900) Option!553)

(assert (=> b!993911 (= lt!440764 (unapply!34 l!3519))))

(declare-fun b!993912 () Bool)

(declare-fun e!560884 () Bool)

(assert (=> b!993912 (= e!560886 e!560884)))

(declare-fun res!664035 () Bool)

(assert (=> b!993912 (=> (not res!664035) (not e!560884))))

(declare-fun lt!440763 () tuple2!15004)

(assert (=> b!993912 (= res!664035 (not (contains!5794 (_2!7513 lt!440763) e!29)))))

(declare-fun get!15752 (Option!553) tuple2!15004)

(assert (=> b!993912 (= lt!440763 (get!15752 lt!440764))))

(declare-fun b!993913 () Bool)

(declare-fun -!449 (List!20900 (_ BitVec 64)) List!20900)

(assert (=> b!993913 (= e!560884 (not (= (-!449 l!3519 e!29) l!3519)))))

(assert (=> b!993913 (= (-!449 (_2!7513 lt!440763) e!29) (_2!7513 lt!440763))))

(declare-datatypes ((Unit!32899 0))(
  ( (Unit!32900) )
))
(declare-fun lt!440765 () Unit!32899)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20900) Unit!32899)

(assert (=> b!993913 (= lt!440765 (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7513 lt!440763)))))

(assert (= (and start!85484 res!664037) b!993911))

(assert (= (and b!993911 res!664036) b!993912))

(assert (= (and b!993912 res!664035) b!993913))

(declare-fun m!922037 () Bool)

(assert (=> start!85484 m!922037))

(declare-fun m!922039 () Bool)

(assert (=> b!993911 m!922039))

(declare-fun m!922041 () Bool)

(assert (=> b!993911 m!922041))

(declare-fun m!922043 () Bool)

(assert (=> b!993912 m!922043))

(declare-fun m!922045 () Bool)

(assert (=> b!993912 m!922045))

(declare-fun m!922047 () Bool)

(assert (=> b!993913 m!922047))

(declare-fun m!922049 () Bool)

(assert (=> b!993913 m!922049))

(declare-fun m!922051 () Bool)

(assert (=> b!993913 m!922051))

(check-sat (not start!85484) (not b!993911) (not b!993913) (not b!993912))
(check-sat)
(get-model)

(declare-fun d!118727 () Bool)

(declare-fun lt!440788 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!463 (List!20900) (InoxSet (_ BitVec 64)))

(assert (=> d!118727 (= lt!440788 (select (content!463 l!3519) e!29))))

(declare-fun e!560913 () Bool)

(assert (=> d!118727 (= lt!440788 e!560913)))

(declare-fun res!664065 () Bool)

(assert (=> d!118727 (=> (not res!664065) (not e!560913))))

(get-info :version)

(assert (=> d!118727 (= res!664065 ((_ is Cons!20896) l!3519))))

(assert (=> d!118727 (= (contains!5794 l!3519 e!29) lt!440788)))

(declare-fun b!993940 () Bool)

(declare-fun e!560914 () Bool)

(assert (=> b!993940 (= e!560913 e!560914)))

(declare-fun res!664064 () Bool)

(assert (=> b!993940 (=> res!664064 e!560914)))

(assert (=> b!993940 (= res!664064 (= (h!22064 l!3519) e!29))))

(declare-fun b!993941 () Bool)

(assert (=> b!993941 (= e!560914 (contains!5794 (t!29893 l!3519) e!29))))

(assert (= (and d!118727 res!664065) b!993940))

(assert (= (and b!993940 (not res!664064)) b!993941))

(declare-fun m!922085 () Bool)

(assert (=> d!118727 m!922085))

(declare-fun m!922087 () Bool)

(assert (=> d!118727 m!922087))

(declare-fun m!922089 () Bool)

(assert (=> b!993941 m!922089))

(assert (=> start!85484 d!118727))

(declare-fun d!118737 () Bool)

(assert (=> d!118737 (= (isEmpty!768 lt!440764) (not ((_ is Some!552) lt!440764)))))

(assert (=> b!993911 d!118737))

(declare-fun d!118739 () Bool)

(assert (=> d!118739 (= (unapply!34 l!3519) (ite ((_ is Nil!20897) l!3519) None!551 (Some!552 (tuple2!15005 (h!22064 l!3519) (t!29893 l!3519)))))))

(assert (=> b!993911 d!118739))

(declare-fun d!118743 () Bool)

(declare-fun e!560946 () Bool)

(assert (=> d!118743 e!560946))

(declare-fun res!664076 () Bool)

(assert (=> d!118743 (=> (not res!664076) (not e!560946))))

(declare-fun lt!440799 () List!20900)

(declare-fun size!30711 (List!20900) Int)

(assert (=> d!118743 (= res!664076 (<= (size!30711 lt!440799) (size!30711 l!3519)))))

(declare-fun e!560945 () List!20900)

(assert (=> d!118743 (= lt!440799 e!560945)))

(declare-fun c!101094 () Bool)

(assert (=> d!118743 (= c!101094 ((_ is Cons!20896) l!3519))))

(assert (=> d!118743 (= (-!449 l!3519 e!29) lt!440799)))

(declare-fun b!993984 () Bool)

(declare-fun e!560944 () List!20900)

(assert (=> b!993984 (= e!560945 e!560944)))

(declare-fun c!101095 () Bool)

(assert (=> b!993984 (= c!101095 (= e!29 (h!22064 l!3519)))))

(declare-fun b!993985 () Bool)

(assert (=> b!993985 (= e!560945 Nil!20897)))

(declare-fun bm!42172 () Bool)

(declare-fun call!42175 () List!20900)

(assert (=> bm!42172 (= call!42175 (-!449 (t!29893 l!3519) e!29))))

(declare-fun b!993986 () Bool)

(assert (=> b!993986 (= e!560944 (Cons!20896 (h!22064 l!3519) call!42175))))

(declare-fun b!993987 () Bool)

(assert (=> b!993987 (= e!560946 (= (content!463 lt!440799) ((_ map and) (content!463 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!993988 () Bool)

(assert (=> b!993988 (= e!560944 call!42175)))

(assert (= (and d!118743 c!101094) b!993984))

(assert (= (and d!118743 (not c!101094)) b!993985))

(assert (= (and b!993984 c!101095) b!993988))

(assert (= (and b!993984 (not c!101095)) b!993986))

(assert (= (or b!993988 b!993986) bm!42172))

(assert (= (and d!118743 res!664076) b!993987))

(declare-fun m!922125 () Bool)

(assert (=> d!118743 m!922125))

(declare-fun m!922127 () Bool)

(assert (=> d!118743 m!922127))

(declare-fun m!922129 () Bool)

(assert (=> bm!42172 m!922129))

(declare-fun m!922131 () Bool)

(assert (=> b!993987 m!922131))

(assert (=> b!993987 m!922085))

(declare-fun m!922133 () Bool)

(assert (=> b!993987 m!922133))

(assert (=> b!993913 d!118743))

(declare-fun d!118757 () Bool)

(declare-fun e!560951 () Bool)

(assert (=> d!118757 e!560951))

(declare-fun res!664079 () Bool)

(assert (=> d!118757 (=> (not res!664079) (not e!560951))))

(declare-fun lt!440800 () List!20900)

(assert (=> d!118757 (= res!664079 (<= (size!30711 lt!440800) (size!30711 (_2!7513 lt!440763))))))

(declare-fun e!560950 () List!20900)

(assert (=> d!118757 (= lt!440800 e!560950)))

(declare-fun c!101096 () Bool)

(assert (=> d!118757 (= c!101096 ((_ is Cons!20896) (_2!7513 lt!440763)))))

(assert (=> d!118757 (= (-!449 (_2!7513 lt!440763) e!29) lt!440800)))

(declare-fun b!993991 () Bool)

(declare-fun e!560949 () List!20900)

(assert (=> b!993991 (= e!560950 e!560949)))

(declare-fun c!101097 () Bool)

(assert (=> b!993991 (= c!101097 (= e!29 (h!22064 (_2!7513 lt!440763))))))

(declare-fun b!993992 () Bool)

(assert (=> b!993992 (= e!560950 Nil!20897)))

(declare-fun bm!42173 () Bool)

(declare-fun call!42176 () List!20900)

(assert (=> bm!42173 (= call!42176 (-!449 (t!29893 (_2!7513 lt!440763)) e!29))))

(declare-fun b!993993 () Bool)

(assert (=> b!993993 (= e!560949 (Cons!20896 (h!22064 (_2!7513 lt!440763)) call!42176))))

(declare-fun b!993994 () Bool)

(assert (=> b!993994 (= e!560951 (= (content!463 lt!440800) ((_ map and) (content!463 (_2!7513 lt!440763)) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!993995 () Bool)

(assert (=> b!993995 (= e!560949 call!42176)))

(assert (= (and d!118757 c!101096) b!993991))

(assert (= (and d!118757 (not c!101096)) b!993992))

(assert (= (and b!993991 c!101097) b!993995))

(assert (= (and b!993991 (not c!101097)) b!993993))

(assert (= (or b!993995 b!993993) bm!42173))

(assert (= (and d!118757 res!664079) b!993994))

(declare-fun m!922135 () Bool)

(assert (=> d!118757 m!922135))

(declare-fun m!922137 () Bool)

(assert (=> d!118757 m!922137))

(declare-fun m!922139 () Bool)

(assert (=> bm!42173 m!922139))

(declare-fun m!922141 () Bool)

(assert (=> b!993994 m!922141))

(declare-fun m!922143 () Bool)

(assert (=> b!993994 m!922143))

(assert (=> b!993994 m!922133))

(assert (=> b!993913 d!118757))

(declare-fun d!118759 () Bool)

(assert (=> d!118759 (= (-!449 (_2!7513 lt!440763) e!29) (_2!7513 lt!440763))))

(declare-fun lt!440808 () Unit!32899)

(declare-fun choose!48 ((_ BitVec 64) List!20900) Unit!32899)

(assert (=> d!118759 (= lt!440808 (choose!48 e!29 (_2!7513 lt!440763)))))

(assert (=> d!118759 (not (contains!5794 (_2!7513 lt!440763) e!29))))

(assert (=> d!118759 (= (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7513 lt!440763)) lt!440808)))

(declare-fun bs!28269 () Bool)

(assert (= bs!28269 d!118759))

(assert (=> bs!28269 m!922049))

(declare-fun m!922165 () Bool)

(assert (=> bs!28269 m!922165))

(assert (=> bs!28269 m!922043))

(assert (=> b!993913 d!118759))

(declare-fun d!118767 () Bool)

(declare-fun lt!440809 () Bool)

(assert (=> d!118767 (= lt!440809 (select (content!463 (_2!7513 lt!440763)) e!29))))

(declare-fun e!560960 () Bool)

(assert (=> d!118767 (= lt!440809 e!560960)))

(declare-fun res!664083 () Bool)

(assert (=> d!118767 (=> (not res!664083) (not e!560960))))

(assert (=> d!118767 (= res!664083 ((_ is Cons!20896) (_2!7513 lt!440763)))))

(assert (=> d!118767 (= (contains!5794 (_2!7513 lt!440763) e!29) lt!440809)))

(declare-fun b!994006 () Bool)

(declare-fun e!560961 () Bool)

(assert (=> b!994006 (= e!560960 e!560961)))

(declare-fun res!664082 () Bool)

(assert (=> b!994006 (=> res!664082 e!560961)))

(assert (=> b!994006 (= res!664082 (= (h!22064 (_2!7513 lt!440763)) e!29))))

(declare-fun b!994007 () Bool)

(assert (=> b!994007 (= e!560961 (contains!5794 (t!29893 (_2!7513 lt!440763)) e!29))))

(assert (= (and d!118767 res!664083) b!994006))

(assert (= (and b!994006 (not res!664082)) b!994007))

(assert (=> d!118767 m!922143))

(declare-fun m!922167 () Bool)

(assert (=> d!118767 m!922167))

(declare-fun m!922169 () Bool)

(assert (=> b!994007 m!922169))

(assert (=> b!993912 d!118767))

(declare-fun d!118769 () Bool)

(assert (=> d!118769 (= (get!15752 lt!440764) (v!14379 lt!440764))))

(assert (=> b!993912 d!118769))

(check-sat (not bm!42173) (not b!994007) (not b!993941) (not d!118757) (not d!118743) (not b!993994) (not d!118759) (not b!993987) (not bm!42172) (not d!118767) (not d!118727))
(check-sat)
