; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85008 () Bool)

(assert start!85008)

(declare-datatypes ((List!20921 0))(
  ( (Nil!20918) (Cons!20917 (h!22079 (_ BitVec 64)) (t!29901 List!20921)) )
))
(declare-fun tail!21 () List!20921)

(declare-fun lt!439934 () List!20921)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun b!992147 () Bool)

(declare-fun e!559680 () Bool)

(declare-fun -!443 (List!20921 (_ BitVec 64)) List!20921)

(assert (=> b!992147 (= e!559680 (not (= (-!443 lt!439934 head!726) tail!21)))))

(declare-datatypes ((tuple2!15036 0))(
  ( (tuple2!15037 (_1!7529 (_ BitVec 64)) (_2!7529 List!20921)) )
))
(declare-fun lt!439935 () tuple2!15036)

(assert (=> b!992147 (= (-!443 (_2!7529 lt!439935) head!726) (_2!7529 lt!439935))))

(declare-datatypes ((Unit!32781 0))(
  ( (Unit!32782) )
))
(declare-fun lt!439937 () Unit!32781)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20921) Unit!32781)

(assert (=> b!992147 (= lt!439937 (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7529 lt!439935)))))

(declare-fun b!992146 () Bool)

(declare-fun e!559682 () Bool)

(assert (=> b!992146 (= e!559682 e!559680)))

(declare-fun res!663191 () Bool)

(assert (=> b!992146 (=> (not res!663191) (not e!559680))))

(declare-fun contains!5720 (List!20921 (_ BitVec 64)) Bool)

(assert (=> b!992146 (= res!663191 (not (contains!5720 (_2!7529 lt!439935) head!726)))))

(declare-datatypes ((Option!536 0))(
  ( (Some!535 (v!14335 tuple2!15036)) (None!534) )
))
(declare-fun lt!439936 () Option!536)

(declare-fun get!15690 (Option!536) tuple2!15036)

(assert (=> b!992146 (= lt!439935 (get!15690 lt!439936))))

(declare-fun b!992145 () Bool)

(declare-fun e!559681 () Bool)

(assert (=> b!992145 (= e!559681 e!559682)))

(declare-fun res!663192 () Bool)

(assert (=> b!992145 (=> (not res!663192) (not e!559682))))

(declare-fun isEmpty!745 (Option!536) Bool)

(assert (=> b!992145 (= res!663192 (not (isEmpty!745 lt!439936)))))

(declare-fun unapply!12 (List!20921) Option!536)

(assert (=> b!992145 (= lt!439936 (unapply!12 lt!439934))))

(declare-fun $colon$colon!570 (List!20921 (_ BitVec 64)) List!20921)

(assert (=> b!992145 (= lt!439934 ($colon$colon!570 tail!21 head!726))))

(declare-fun res!663190 () Bool)

(assert (=> start!85008 (=> (not res!663190) (not e!559681))))

(assert (=> start!85008 (= res!663190 (not (contains!5720 tail!21 head!726)))))

(assert (=> start!85008 e!559681))

(assert (=> start!85008 true))

(declare-fun b!992144 () Bool)

(declare-fun res!663193 () Bool)

(assert (=> b!992144 (=> (not res!663193) (not e!559681))))

(declare-fun content!439 (List!20921) (Set (_ BitVec 64)))

(assert (=> b!992144 (= res!663193 (not (set.member head!726 (content!439 tail!21))))))

(assert (= (and start!85008 res!663190) b!992144))

(assert (= (and b!992144 res!663193) b!992145))

(assert (= (and b!992145 res!663192) b!992146))

(assert (= (and b!992146 res!663191) b!992147))

(declare-fun m!919351 () Bool)

(assert (=> start!85008 m!919351))

(declare-fun m!919353 () Bool)

(assert (=> b!992145 m!919353))

(declare-fun m!919355 () Bool)

(assert (=> b!992145 m!919355))

(declare-fun m!919357 () Bool)

(assert (=> b!992145 m!919357))

(declare-fun m!919359 () Bool)

(assert (=> b!992147 m!919359))

(declare-fun m!919361 () Bool)

(assert (=> b!992147 m!919361))

(declare-fun m!919363 () Bool)

(assert (=> b!992147 m!919363))

(declare-fun m!919365 () Bool)

(assert (=> b!992146 m!919365))

(declare-fun m!919367 () Bool)

(assert (=> b!992146 m!919367))

(declare-fun m!919369 () Bool)

(assert (=> b!992144 m!919369))

(declare-fun m!919371 () Bool)

(assert (=> b!992144 m!919371))

(push 1)

(assert (not b!992147))

(assert (not start!85008))

(assert (not b!992144))

(assert (not b!992146))

(assert (not b!992145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!117919 () Bool)

(declare-fun c!100616 () Bool)

(assert (=> d!117919 (= c!100616 (is-Nil!20918 tail!21))))

(declare-fun e!559685 () (Set (_ BitVec 64)))

(assert (=> d!117919 (= (content!439 tail!21) e!559685)))

(declare-fun b!992152 () Bool)

(assert (=> b!992152 (= e!559685 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!992153 () Bool)

(assert (=> b!992153 (= e!559685 (set.union (set.insert (h!22079 tail!21) (as set.empty (Set (_ BitVec 64)))) (content!439 (t!29901 tail!21))))))

(assert (= (and d!117919 c!100616) b!992152))

(assert (= (and d!117919 (not c!100616)) b!992153))

(declare-fun m!919373 () Bool)

(assert (=> b!992153 m!919373))

(declare-fun m!919375 () Bool)

(assert (=> b!992153 m!919375))

(assert (=> b!992144 d!117919))

(declare-fun b!992182 () Bool)

(declare-fun e!559709 () List!20921)

(declare-fun call!42068 () List!20921)

(assert (=> b!992182 (= e!559709 call!42068)))

(declare-fun d!117925 () Bool)

(declare-fun e!559708 () Bool)

(assert (=> d!117925 e!559708))

(declare-fun res!663208 () Bool)

(assert (=> d!117925 (=> (not res!663208) (not e!559708))))

(declare-fun lt!439946 () List!20921)

(declare-fun size!30655 (List!20921) Int)

(assert (=> d!117925 (= res!663208 (<= (size!30655 lt!439946) (size!30655 lt!439934)))))

(declare-fun e!559710 () List!20921)

(assert (=> d!117925 (= lt!439946 e!559710)))

(declare-fun c!100624 () Bool)

(assert (=> d!117925 (= c!100624 (is-Cons!20917 lt!439934))))

(assert (=> d!117925 (= (-!443 lt!439934 head!726) lt!439946)))

(declare-fun b!992183 () Bool)

(assert (=> b!992183 (= e!559708 (= (content!439 lt!439946) (set.minus (content!439 lt!439934) (set.insert head!726 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun bm!42065 () Bool)

(assert (=> bm!42065 (= call!42068 (-!443 (t!29901 lt!439934) head!726))))

(declare-fun b!992184 () Bool)

(assert (=> b!992184 (= e!559709 (Cons!20917 (h!22079 lt!439934) call!42068))))

(declare-fun b!992185 () Bool)

(assert (=> b!992185 (= e!559710 e!559709)))

(declare-fun c!100625 () Bool)

(assert (=> b!992185 (= c!100625 (= head!726 (h!22079 lt!439934)))))

(declare-fun b!992186 () Bool)

(assert (=> b!992186 (= e!559710 Nil!20918)))

(assert (= (and d!117925 c!100624) b!992185))

(assert (= (and d!117925 (not c!100624)) b!992186))

(assert (= (and b!992185 c!100625) b!992182))

(assert (= (and b!992185 (not c!100625)) b!992184))

(assert (= (or b!992182 b!992184) bm!42065))

(assert (= (and d!117925 res!663208) b!992183))

(declare-fun m!919385 () Bool)

(assert (=> d!117925 m!919385))

(declare-fun m!919387 () Bool)

(assert (=> d!117925 m!919387))

(declare-fun m!919389 () Bool)

(assert (=> b!992183 m!919389))

(declare-fun m!919391 () Bool)

(assert (=> b!992183 m!919391))

(declare-fun m!919393 () Bool)

(assert (=> b!992183 m!919393))

(declare-fun m!919395 () Bool)

(assert (=> bm!42065 m!919395))

(assert (=> b!992147 d!117925))

(declare-fun b!992187 () Bool)

(declare-fun e!559712 () List!20921)

(declare-fun call!42069 () List!20921)

(assert (=> b!992187 (= e!559712 call!42069)))

(declare-fun d!117939 () Bool)

(declare-fun e!559711 () Bool)

(assert (=> d!117939 e!559711))

(declare-fun res!663209 () Bool)

(assert (=> d!117939 (=> (not res!663209) (not e!559711))))

(declare-fun lt!439947 () List!20921)

(assert (=> d!117939 (= res!663209 (<= (size!30655 lt!439947) (size!30655 (_2!7529 lt!439935))))))

(declare-fun e!559713 () List!20921)

(assert (=> d!117939 (= lt!439947 e!559713)))

(declare-fun c!100626 () Bool)

(assert (=> d!117939 (= c!100626 (is-Cons!20917 (_2!7529 lt!439935)))))

(assert (=> d!117939 (= (-!443 (_2!7529 lt!439935) head!726) lt!439947)))

(declare-fun b!992188 () Bool)

(assert (=> b!992188 (= e!559711 (= (content!439 lt!439947) (set.minus (content!439 (_2!7529 lt!439935)) (set.insert head!726 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun bm!42066 () Bool)

(assert (=> bm!42066 (= call!42069 (-!443 (t!29901 (_2!7529 lt!439935)) head!726))))

(declare-fun b!992189 () Bool)

(assert (=> b!992189 (= e!559712 (Cons!20917 (h!22079 (_2!7529 lt!439935)) call!42069))))

(declare-fun b!992190 () Bool)

(assert (=> b!992190 (= e!559713 e!559712)))

(declare-fun c!100627 () Bool)

(assert (=> b!992190 (= c!100627 (= head!726 (h!22079 (_2!7529 lt!439935))))))

(declare-fun b!992191 () Bool)

(assert (=> b!992191 (= e!559713 Nil!20918)))

(assert (= (and d!117939 c!100626) b!992190))

(assert (= (and d!117939 (not c!100626)) b!992191))

(assert (= (and b!992190 c!100627) b!992187))

(assert (= (and b!992190 (not c!100627)) b!992189))

(assert (= (or b!992187 b!992189) bm!42066))

(assert (= (and d!117939 res!663209) b!992188))

(declare-fun m!919397 () Bool)

(assert (=> d!117939 m!919397))

(declare-fun m!919399 () Bool)

(assert (=> d!117939 m!919399))

(declare-fun m!919401 () Bool)

(assert (=> b!992188 m!919401))

(declare-fun m!919403 () Bool)

(assert (=> b!992188 m!919403))

(assert (=> b!992188 m!919393))

(declare-fun m!919405 () Bool)

(assert (=> bm!42066 m!919405))

(assert (=> b!992147 d!117939))

(declare-fun d!117941 () Bool)

(assert (=> d!117941 (= (-!443 (_2!7529 lt!439935) head!726) (_2!7529 lt!439935))))

(declare-fun lt!439950 () Unit!32781)

(declare-fun choose!48 ((_ BitVec 64) List!20921) Unit!32781)

(assert (=> d!117941 (= lt!439950 (choose!48 head!726 (_2!7529 lt!439935)))))

(assert (=> d!117941 (not (contains!5720 (_2!7529 lt!439935) head!726))))

(assert (=> d!117941 (= (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7529 lt!439935)) lt!439950)))

(declare-fun bs!28189 () Bool)

(assert (= bs!28189 d!117941))

(assert (=> bs!28189 m!919361))

(declare-fun m!919411 () Bool)

(assert (=> bs!28189 m!919411))

(assert (=> bs!28189 m!919365))

(assert (=> b!992147 d!117941))

(declare-fun d!117945 () Bool)

(declare-fun lt!439955 () Bool)

(assert (=> d!117945 (= lt!439955 (set.member head!726 (content!439 (_2!7529 lt!439935))))))

(declare-fun e!559727 () Bool)

(assert (=> d!117945 (= lt!439955 e!559727)))

(declare-fun res!663214 () Bool)

(assert (=> d!117945 (=> (not res!663214) (not e!559727))))

(assert (=> d!117945 (= res!663214 (is-Cons!20917 (_2!7529 lt!439935)))))

(assert (=> d!117945 (= (contains!5720 (_2!7529 lt!439935) head!726) lt!439955)))

(declare-fun b!992210 () Bool)

(declare-fun e!559728 () Bool)

(assert (=> b!992210 (= e!559727 e!559728)))

(declare-fun res!663215 () Bool)

(assert (=> b!992210 (=> res!663215 e!559728)))

(assert (=> b!992210 (= res!663215 (= (h!22079 (_2!7529 lt!439935)) head!726))))

(declare-fun b!992211 () Bool)

(assert (=> b!992211 (= e!559728 (contains!5720 (t!29901 (_2!7529 lt!439935)) head!726))))

(assert (= (and d!117945 res!663214) b!992210))

(assert (= (and b!992210 (not res!663215)) b!992211))

(assert (=> d!117945 m!919403))

(declare-fun m!919413 () Bool)

(assert (=> d!117945 m!919413))

(declare-fun m!919415 () Bool)

(assert (=> b!992211 m!919415))

(assert (=> b!992146 d!117945))

(declare-fun d!117947 () Bool)

(assert (=> d!117947 (= (get!15690 lt!439936) (v!14335 lt!439936))))

(assert (=> b!992146 d!117947))

(declare-fun d!117949 () Bool)

(declare-fun lt!439956 () Bool)

(assert (=> d!117949 (= lt!439956 (set.member head!726 (content!439 tail!21)))))

(declare-fun e!559731 () Bool)

(assert (=> d!117949 (= lt!439956 e!559731)))

(declare-fun res!663218 () Bool)

(assert (=> d!117949 (=> (not res!663218) (not e!559731))))

(assert (=> d!117949 (= res!663218 (is-Cons!20917 tail!21))))

(assert (=> d!117949 (= (contains!5720 tail!21 head!726) lt!439956)))

(declare-fun b!992214 () Bool)

(declare-fun e!559732 () Bool)

(assert (=> b!992214 (= e!559731 e!559732)))

(declare-fun res!663219 () Bool)

(assert (=> b!992214 (=> res!663219 e!559732)))

(assert (=> b!992214 (= res!663219 (= (h!22079 tail!21) head!726))))

(declare-fun b!992215 () Bool)

(assert (=> b!992215 (= e!559732 (contains!5720 (t!29901 tail!21) head!726))))

(assert (= (and d!117949 res!663218) b!992214))

(assert (= (and b!992214 (not res!663219)) b!992215))

(assert (=> d!117949 m!919369))

(assert (=> d!117949 m!919371))

(declare-fun m!919417 () Bool)

(assert (=> b!992215 m!919417))

(assert (=> start!85008 d!117949))

(declare-fun d!117951 () Bool)

(assert (=> d!117951 (= (isEmpty!745 lt!439936) (not (is-Some!535 lt!439936)))))

(assert (=> b!992145 d!117951))

(declare-fun d!117953 () Bool)

(assert (=> d!117953 (= (unapply!12 lt!439934) (ite (is-Nil!20918 lt!439934) None!534 (Some!535 (tuple2!15037 (h!22079 lt!439934) (t!29901 lt!439934)))))))

(assert (=> b!992145 d!117953))

(declare-fun d!117955 () Bool)

(assert (=> d!117955 (= ($colon$colon!570 tail!21 head!726) (Cons!20917 head!726 tail!21))))

(assert (=> b!992145 d!117955))

(push 1)

(assert (not d!117941))

(assert (not bm!42065))

(assert (not b!992211))

(assert (not d!117945))

(assert (not b!992183))

(assert (not d!117939))

(assert (not d!117925))

(assert (not b!992215))

(assert (not bm!42066))

(assert (not b!992153))

(assert (not b!992188))

(assert (not d!117949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

