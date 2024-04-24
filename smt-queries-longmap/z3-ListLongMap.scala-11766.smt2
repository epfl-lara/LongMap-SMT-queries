; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138516 () Bool)

(assert start!138516)

(declare-fun b!1586992 () Bool)

(declare-fun res!1083181 () Bool)

(declare-fun e!886081 () Bool)

(assert (=> b!1586992 (=> (not res!1083181) (not e!886081))))

(declare-datatypes ((B!2924 0))(
  ( (B!2925 (val!19824 Int)) )
))
(declare-datatypes ((tuple2!25876 0))(
  ( (tuple2!25877 (_1!12949 (_ BitVec 64)) (_2!12949 B!2924)) )
))
(declare-datatypes ((List!36976 0))(
  ( (Nil!36973) (Cons!36972 (h!38533 tuple2!25876) (t!51882 List!36976)) )
))
(declare-fun l!1251 () List!36976)

(declare-fun isStrictlySorted!1157 (List!36976) Bool)

(assert (=> b!1586992 (= res!1083181 (isStrictlySorted!1157 (t!51882 l!1251)))))

(declare-fun b!1586993 () Bool)

(declare-fun e!886080 () Bool)

(declare-fun tp_is_empty!39457 () Bool)

(declare-fun tp!115121 () Bool)

(assert (=> b!1586993 (= e!886080 (and tp_is_empty!39457 tp!115121))))

(declare-fun b!1586995 () Bool)

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun newValue!123 () B!2924)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!1004 (List!36976 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!627 (List!36976 (_ BitVec 64) B!2924) List!36976)

(assert (=> b!1586995 (= e!886081 (not (not (containsKey!1004 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) otherKey!56))))))

(assert (=> b!1586995 (not (containsKey!1004 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52204 0))(
  ( (Unit!52205) )
))
(declare-fun lt!678168 () Unit!52204)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (List!36976 (_ BitVec 64) B!2924 (_ BitVec 64)) Unit!52204)

(assert (=> b!1586995 (= lt!678168 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (t!51882 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1586996 () Bool)

(declare-fun res!1083182 () Bool)

(assert (=> b!1586996 (=> (not res!1083182) (not e!886081))))

(assert (=> b!1586996 (= res!1083182 (not (containsKey!1004 l!1251 otherKey!56)))))

(declare-fun b!1586997 () Bool)

(declare-fun res!1083183 () Bool)

(assert (=> b!1586997 (=> (not res!1083183) (not e!886081))))

(get-info :version)

(assert (=> b!1586997 (= res!1083183 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36972) l!1251)))))

(declare-fun res!1083184 () Bool)

(assert (=> start!138516 (=> (not res!1083184) (not e!886081))))

(assert (=> start!138516 (= res!1083184 (isStrictlySorted!1157 l!1251))))

(assert (=> start!138516 e!886081))

(assert (=> start!138516 e!886080))

(assert (=> start!138516 true))

(assert (=> start!138516 tp_is_empty!39457))

(declare-fun b!1586994 () Bool)

(declare-fun res!1083180 () Bool)

(assert (=> b!1586994 (=> (not res!1083180) (not e!886081))))

(assert (=> b!1586994 (= res!1083180 (not (containsKey!1004 (t!51882 l!1251) otherKey!56)))))

(assert (= (and start!138516 res!1083184) b!1586996))

(assert (= (and b!1586996 res!1083182) b!1586997))

(assert (= (and b!1586997 res!1083183) b!1586992))

(assert (= (and b!1586992 res!1083181) b!1586994))

(assert (= (and b!1586994 res!1083180) b!1586995))

(assert (= (and start!138516 ((_ is Cons!36972) l!1251)) b!1586993))

(declare-fun m!1456065 () Bool)

(assert (=> b!1586994 m!1456065))

(declare-fun m!1456067 () Bool)

(assert (=> b!1586992 m!1456067))

(declare-fun m!1456069 () Bool)

(assert (=> start!138516 m!1456069))

(declare-fun m!1456071 () Bool)

(assert (=> b!1586996 m!1456071))

(declare-fun m!1456073 () Bool)

(assert (=> b!1586995 m!1456073))

(declare-fun m!1456075 () Bool)

(assert (=> b!1586995 m!1456075))

(declare-fun m!1456077 () Bool)

(assert (=> b!1586995 m!1456077))

(declare-fun m!1456079 () Bool)

(assert (=> b!1586995 m!1456079))

(assert (=> b!1586995 m!1456075))

(declare-fun m!1456081 () Bool)

(assert (=> b!1586995 m!1456081))

(assert (=> b!1586995 m!1456077))

(check-sat (not start!138516) (not b!1586992) tp_is_empty!39457 (not b!1586993) (not b!1586996) (not b!1586995) (not b!1586994))
(check-sat)
(get-model)

(declare-fun d!168169 () Bool)

(declare-fun res!1083227 () Bool)

(declare-fun e!886106 () Bool)

(assert (=> d!168169 (=> res!1083227 e!886106)))

(assert (=> d!168169 (= res!1083227 (and ((_ is Cons!36972) l!1251) (= (_1!12949 (h!38533 l!1251)) otherKey!56)))))

(assert (=> d!168169 (= (containsKey!1004 l!1251 otherKey!56) e!886106)))

(declare-fun b!1587046 () Bool)

(declare-fun e!886107 () Bool)

(assert (=> b!1587046 (= e!886106 e!886107)))

(declare-fun res!1083228 () Bool)

(assert (=> b!1587046 (=> (not res!1083228) (not e!886107))))

(assert (=> b!1587046 (= res!1083228 (and (or (not ((_ is Cons!36972) l!1251)) (bvsle (_1!12949 (h!38533 l!1251)) otherKey!56)) ((_ is Cons!36972) l!1251) (bvslt (_1!12949 (h!38533 l!1251)) otherKey!56)))))

(declare-fun b!1587047 () Bool)

(assert (=> b!1587047 (= e!886107 (containsKey!1004 (t!51882 l!1251) otherKey!56))))

(assert (= (and d!168169 (not res!1083227)) b!1587046))

(assert (= (and b!1587046 res!1083228) b!1587047))

(assert (=> b!1587047 m!1456065))

(assert (=> b!1586996 d!168169))

(declare-fun call!72711 () List!36976)

(declare-fun e!886151 () List!36976)

(declare-fun c!147683 () Bool)

(declare-fun bm!72706 () Bool)

(declare-fun $colon$colon!1016 (List!36976 tuple2!25876) List!36976)

(assert (=> bm!72706 (= call!72711 ($colon$colon!1016 e!886151 (ite c!147683 (h!38533 l!1251) (tuple2!25877 newKey!123 newValue!123))))))

(declare-fun c!147686 () Bool)

(assert (=> bm!72706 (= c!147686 c!147683)))

(declare-fun b!1587114 () Bool)

(declare-fun e!886149 () List!36976)

(declare-fun call!72709 () List!36976)

(assert (=> b!1587114 (= e!886149 call!72709)))

(declare-fun lt!678181 () List!36976)

(declare-fun e!886148 () Bool)

(declare-fun b!1587115 () Bool)

(declare-fun contains!10571 (List!36976 tuple2!25876) Bool)

(assert (=> b!1587115 (= e!886148 (contains!10571 lt!678181 (tuple2!25877 newKey!123 newValue!123)))))

(declare-fun bm!72707 () Bool)

(declare-fun call!72710 () List!36976)

(assert (=> bm!72707 (= call!72710 call!72711)))

(declare-fun b!1587116 () Bool)

(declare-fun e!886150 () List!36976)

(assert (=> b!1587116 (= e!886150 call!72710)))

(declare-fun b!1587117 () Bool)

(declare-fun res!1083252 () Bool)

(assert (=> b!1587117 (=> (not res!1083252) (not e!886148))))

(assert (=> b!1587117 (= res!1083252 (containsKey!1004 lt!678181 newKey!123))))

(declare-fun b!1587118 () Bool)

(declare-fun c!147684 () Bool)

(assert (=> b!1587118 (= c!147684 (and ((_ is Cons!36972) l!1251) (bvsgt (_1!12949 (h!38533 l!1251)) newKey!123)))))

(assert (=> b!1587118 (= e!886150 e!886149)))

(declare-fun b!1587119 () Bool)

(declare-fun e!886152 () List!36976)

(assert (=> b!1587119 (= e!886152 call!72711)))

(declare-fun d!168175 () Bool)

(assert (=> d!168175 e!886148))

(declare-fun res!1083251 () Bool)

(assert (=> d!168175 (=> (not res!1083251) (not e!886148))))

(assert (=> d!168175 (= res!1083251 (isStrictlySorted!1157 lt!678181))))

(assert (=> d!168175 (= lt!678181 e!886152)))

(assert (=> d!168175 (= c!147683 (and ((_ is Cons!36972) l!1251) (bvslt (_1!12949 (h!38533 l!1251)) newKey!123)))))

(assert (=> d!168175 (isStrictlySorted!1157 l!1251)))

(assert (=> d!168175 (= (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) lt!678181)))

(declare-fun bm!72708 () Bool)

(assert (=> bm!72708 (= call!72709 call!72710)))

(declare-fun b!1587120 () Bool)

(assert (=> b!1587120 (= e!886152 e!886150)))

(declare-fun c!147685 () Bool)

(assert (=> b!1587120 (= c!147685 (and ((_ is Cons!36972) l!1251) (= (_1!12949 (h!38533 l!1251)) newKey!123)))))

(declare-fun b!1587121 () Bool)

(assert (=> b!1587121 (= e!886149 call!72709)))

(declare-fun b!1587122 () Bool)

(assert (=> b!1587122 (= e!886151 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123))))

(declare-fun b!1587123 () Bool)

(assert (=> b!1587123 (= e!886151 (ite c!147685 (t!51882 l!1251) (ite c!147684 (Cons!36972 (h!38533 l!1251) (t!51882 l!1251)) Nil!36973)))))

(assert (= (and d!168175 c!147683) b!1587119))

(assert (= (and d!168175 (not c!147683)) b!1587120))

(assert (= (and b!1587120 c!147685) b!1587116))

(assert (= (and b!1587120 (not c!147685)) b!1587118))

(assert (= (and b!1587118 c!147684) b!1587121))

(assert (= (and b!1587118 (not c!147684)) b!1587114))

(assert (= (or b!1587121 b!1587114) bm!72708))

(assert (= (or b!1587116 bm!72708) bm!72707))

(assert (= (or b!1587119 bm!72707) bm!72706))

(assert (= (and bm!72706 c!147686) b!1587122))

(assert (= (and bm!72706 (not c!147686)) b!1587123))

(assert (= (and d!168175 res!1083251) b!1587117))

(assert (= (and b!1587117 res!1083252) b!1587115))

(declare-fun m!1456125 () Bool)

(assert (=> b!1587115 m!1456125))

(declare-fun m!1456127 () Bool)

(assert (=> d!168175 m!1456127))

(assert (=> d!168175 m!1456069))

(assert (=> b!1587122 m!1456075))

(declare-fun m!1456129 () Bool)

(assert (=> b!1587117 m!1456129))

(declare-fun m!1456131 () Bool)

(assert (=> bm!72706 m!1456131))

(assert (=> b!1586995 d!168175))

(declare-fun c!147693 () Bool)

(declare-fun e!886165 () List!36976)

(declare-fun call!72719 () List!36976)

(declare-fun bm!72714 () Bool)

(assert (=> bm!72714 (= call!72719 ($colon$colon!1016 e!886165 (ite c!147693 (h!38533 (t!51882 l!1251)) (tuple2!25877 newKey!123 newValue!123))))))

(declare-fun c!147696 () Bool)

(assert (=> bm!72714 (= c!147696 c!147693)))

(declare-fun b!1587142 () Bool)

(declare-fun e!886163 () List!36976)

(declare-fun call!72717 () List!36976)

(assert (=> b!1587142 (= e!886163 call!72717)))

(declare-fun lt!678183 () List!36976)

(declare-fun e!886162 () Bool)

(declare-fun b!1587143 () Bool)

(assert (=> b!1587143 (= e!886162 (contains!10571 lt!678183 (tuple2!25877 newKey!123 newValue!123)))))

(declare-fun bm!72715 () Bool)

(declare-fun call!72718 () List!36976)

(assert (=> bm!72715 (= call!72718 call!72719)))

(declare-fun b!1587144 () Bool)

(declare-fun e!886164 () List!36976)

(assert (=> b!1587144 (= e!886164 call!72718)))

(declare-fun b!1587145 () Bool)

(declare-fun res!1083260 () Bool)

(assert (=> b!1587145 (=> (not res!1083260) (not e!886162))))

(assert (=> b!1587145 (= res!1083260 (containsKey!1004 lt!678183 newKey!123))))

(declare-fun b!1587146 () Bool)

(declare-fun c!147694 () Bool)

(assert (=> b!1587146 (= c!147694 (and ((_ is Cons!36972) (t!51882 l!1251)) (bvsgt (_1!12949 (h!38533 (t!51882 l!1251))) newKey!123)))))

(assert (=> b!1587146 (= e!886164 e!886163)))

(declare-fun b!1587147 () Bool)

(declare-fun e!886166 () List!36976)

(assert (=> b!1587147 (= e!886166 call!72719)))

(declare-fun d!168187 () Bool)

(assert (=> d!168187 e!886162))

(declare-fun res!1083259 () Bool)

(assert (=> d!168187 (=> (not res!1083259) (not e!886162))))

(assert (=> d!168187 (= res!1083259 (isStrictlySorted!1157 lt!678183))))

(assert (=> d!168187 (= lt!678183 e!886166)))

(assert (=> d!168187 (= c!147693 (and ((_ is Cons!36972) (t!51882 l!1251)) (bvslt (_1!12949 (h!38533 (t!51882 l!1251))) newKey!123)))))

(assert (=> d!168187 (isStrictlySorted!1157 (t!51882 l!1251))))

(assert (=> d!168187 (= (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123) lt!678183)))

(declare-fun bm!72716 () Bool)

(assert (=> bm!72716 (= call!72717 call!72718)))

(declare-fun b!1587148 () Bool)

(assert (=> b!1587148 (= e!886166 e!886164)))

(declare-fun c!147695 () Bool)

(assert (=> b!1587148 (= c!147695 (and ((_ is Cons!36972) (t!51882 l!1251)) (= (_1!12949 (h!38533 (t!51882 l!1251))) newKey!123)))))

(declare-fun b!1587149 () Bool)

(assert (=> b!1587149 (= e!886163 call!72717)))

(declare-fun b!1587150 () Bool)

(assert (=> b!1587150 (= e!886165 (insertStrictlySorted!627 (t!51882 (t!51882 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1587151 () Bool)

(assert (=> b!1587151 (= e!886165 (ite c!147695 (t!51882 (t!51882 l!1251)) (ite c!147694 (Cons!36972 (h!38533 (t!51882 l!1251)) (t!51882 (t!51882 l!1251))) Nil!36973)))))

(assert (= (and d!168187 c!147693) b!1587147))

(assert (= (and d!168187 (not c!147693)) b!1587148))

(assert (= (and b!1587148 c!147695) b!1587144))

(assert (= (and b!1587148 (not c!147695)) b!1587146))

(assert (= (and b!1587146 c!147694) b!1587149))

(assert (= (and b!1587146 (not c!147694)) b!1587142))

(assert (= (or b!1587149 b!1587142) bm!72716))

(assert (= (or b!1587144 bm!72716) bm!72715))

(assert (= (or b!1587147 bm!72715) bm!72714))

(assert (= (and bm!72714 c!147696) b!1587150))

(assert (= (and bm!72714 (not c!147696)) b!1587151))

(assert (= (and d!168187 res!1083259) b!1587145))

(assert (= (and b!1587145 res!1083260) b!1587143))

(declare-fun m!1456141 () Bool)

(assert (=> b!1587143 m!1456141))

(declare-fun m!1456143 () Bool)

(assert (=> d!168187 m!1456143))

(assert (=> d!168187 m!1456067))

(declare-fun m!1456145 () Bool)

(assert (=> b!1587150 m!1456145))

(declare-fun m!1456147 () Bool)

(assert (=> b!1587145 m!1456147))

(declare-fun m!1456149 () Bool)

(assert (=> bm!72714 m!1456149))

(assert (=> b!1586995 d!168187))

(declare-fun d!168191 () Bool)

(assert (=> d!168191 (not (containsKey!1004 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!678191 () Unit!52204)

(declare-fun choose!2103 (List!36976 (_ BitVec 64) B!2924 (_ BitVec 64)) Unit!52204)

(assert (=> d!168191 (= lt!678191 (choose!2103 (t!51882 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!886186 () Bool)

(assert (=> d!168191 e!886186))

(declare-fun res!1083275 () Bool)

(assert (=> d!168191 (=> (not res!1083275) (not e!886186))))

(assert (=> d!168191 (= res!1083275 (isStrictlySorted!1157 (t!51882 l!1251)))))

(assert (=> d!168191 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (t!51882 l!1251) newKey!123 newValue!123 otherKey!56) lt!678191)))

(declare-fun b!1587190 () Bool)

(declare-fun res!1083276 () Bool)

(assert (=> b!1587190 (=> (not res!1083276) (not e!886186))))

(assert (=> b!1587190 (= res!1083276 (not (containsKey!1004 (t!51882 l!1251) otherKey!56)))))

(declare-fun b!1587191 () Bool)

(assert (=> b!1587191 (= e!886186 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!168191 res!1083275) b!1587190))

(assert (= (and b!1587190 res!1083276) b!1587191))

(assert (=> d!168191 m!1456075))

(assert (=> d!168191 m!1456075))

(assert (=> d!168191 m!1456081))

(declare-fun m!1456179 () Bool)

(assert (=> d!168191 m!1456179))

(assert (=> d!168191 m!1456067))

(assert (=> b!1587190 m!1456065))

(assert (=> b!1586995 d!168191))

(declare-fun d!168199 () Bool)

(declare-fun res!1083279 () Bool)

(declare-fun e!886188 () Bool)

(assert (=> d!168199 (=> res!1083279 e!886188)))

(assert (=> d!168199 (= res!1083279 (and ((_ is Cons!36972) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) (= (_1!12949 (h!38533 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!168199 (= (containsKey!1004 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) otherKey!56) e!886188)))

(declare-fun b!1587194 () Bool)

(declare-fun e!886189 () Bool)

(assert (=> b!1587194 (= e!886188 e!886189)))

(declare-fun res!1083280 () Bool)

(assert (=> b!1587194 (=> (not res!1083280) (not e!886189))))

(assert (=> b!1587194 (= res!1083280 (and (or (not ((_ is Cons!36972) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (bvsle (_1!12949 (h!38533 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36972) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) (bvslt (_1!12949 (h!38533 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1587195 () Bool)

(assert (=> b!1587195 (= e!886189 (containsKey!1004 (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!168199 (not res!1083279)) b!1587194))

(assert (= (and b!1587194 res!1083280) b!1587195))

(declare-fun m!1456183 () Bool)

(assert (=> b!1587195 m!1456183))

(assert (=> b!1586995 d!168199))

(declare-fun d!168203 () Bool)

(declare-fun res!1083283 () Bool)

(declare-fun e!886192 () Bool)

(assert (=> d!168203 (=> res!1083283 e!886192)))

(assert (=> d!168203 (= res!1083283 (and ((_ is Cons!36972) (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123)) (= (_1!12949 (h!38533 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!168203 (= (containsKey!1004 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123) otherKey!56) e!886192)))

(declare-fun b!1587198 () Bool)

(declare-fun e!886193 () Bool)

(assert (=> b!1587198 (= e!886192 e!886193)))

(declare-fun res!1083284 () Bool)

(assert (=> b!1587198 (=> (not res!1083284) (not e!886193))))

(assert (=> b!1587198 (= res!1083284 (and (or (not ((_ is Cons!36972) (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123))) (bvsle (_1!12949 (h!38533 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36972) (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123)) (bvslt (_1!12949 (h!38533 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1587199 () Bool)

(assert (=> b!1587199 (= e!886193 (containsKey!1004 (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!168203 (not res!1083283)) b!1587198))

(assert (= (and b!1587198 res!1083284) b!1587199))

(declare-fun m!1456187 () Bool)

(assert (=> b!1587199 m!1456187))

(assert (=> b!1586995 d!168203))

(declare-fun d!168207 () Bool)

(declare-fun res!1083287 () Bool)

(declare-fun e!886196 () Bool)

(assert (=> d!168207 (=> res!1083287 e!886196)))

(assert (=> d!168207 (= res!1083287 (and ((_ is Cons!36972) (t!51882 l!1251)) (= (_1!12949 (h!38533 (t!51882 l!1251))) otherKey!56)))))

(assert (=> d!168207 (= (containsKey!1004 (t!51882 l!1251) otherKey!56) e!886196)))

(declare-fun b!1587202 () Bool)

(declare-fun e!886197 () Bool)

(assert (=> b!1587202 (= e!886196 e!886197)))

(declare-fun res!1083288 () Bool)

(assert (=> b!1587202 (=> (not res!1083288) (not e!886197))))

(assert (=> b!1587202 (= res!1083288 (and (or (not ((_ is Cons!36972) (t!51882 l!1251))) (bvsle (_1!12949 (h!38533 (t!51882 l!1251))) otherKey!56)) ((_ is Cons!36972) (t!51882 l!1251)) (bvslt (_1!12949 (h!38533 (t!51882 l!1251))) otherKey!56)))))

(declare-fun b!1587203 () Bool)

(assert (=> b!1587203 (= e!886197 (containsKey!1004 (t!51882 (t!51882 l!1251)) otherKey!56))))

(assert (= (and d!168207 (not res!1083287)) b!1587202))

(assert (= (and b!1587202 res!1083288) b!1587203))

(declare-fun m!1456191 () Bool)

(assert (=> b!1587203 m!1456191))

(assert (=> b!1586994 d!168207))

(declare-fun d!168211 () Bool)

(declare-fun res!1083305 () Bool)

(declare-fun e!886211 () Bool)

(assert (=> d!168211 (=> res!1083305 e!886211)))

(assert (=> d!168211 (= res!1083305 (or ((_ is Nil!36973) (t!51882 l!1251)) ((_ is Nil!36973) (t!51882 (t!51882 l!1251)))))))

(assert (=> d!168211 (= (isStrictlySorted!1157 (t!51882 l!1251)) e!886211)))

(declare-fun b!1587220 () Bool)

(declare-fun e!886212 () Bool)

(assert (=> b!1587220 (= e!886211 e!886212)))

(declare-fun res!1083306 () Bool)

(assert (=> b!1587220 (=> (not res!1083306) (not e!886212))))

(assert (=> b!1587220 (= res!1083306 (bvslt (_1!12949 (h!38533 (t!51882 l!1251))) (_1!12949 (h!38533 (t!51882 (t!51882 l!1251))))))))

(declare-fun b!1587221 () Bool)

(assert (=> b!1587221 (= e!886212 (isStrictlySorted!1157 (t!51882 (t!51882 l!1251))))))

(assert (= (and d!168211 (not res!1083305)) b!1587220))

(assert (= (and b!1587220 res!1083306) b!1587221))

(declare-fun m!1456197 () Bool)

(assert (=> b!1587221 m!1456197))

(assert (=> b!1586992 d!168211))

(declare-fun d!168217 () Bool)

(declare-fun res!1083309 () Bool)

(declare-fun e!886215 () Bool)

(assert (=> d!168217 (=> res!1083309 e!886215)))

(assert (=> d!168217 (= res!1083309 (or ((_ is Nil!36973) l!1251) ((_ is Nil!36973) (t!51882 l!1251))))))

(assert (=> d!168217 (= (isStrictlySorted!1157 l!1251) e!886215)))

(declare-fun b!1587224 () Bool)

(declare-fun e!886216 () Bool)

(assert (=> b!1587224 (= e!886215 e!886216)))

(declare-fun res!1083310 () Bool)

(assert (=> b!1587224 (=> (not res!1083310) (not e!886216))))

(assert (=> b!1587224 (= res!1083310 (bvslt (_1!12949 (h!38533 l!1251)) (_1!12949 (h!38533 (t!51882 l!1251)))))))

(declare-fun b!1587225 () Bool)

(assert (=> b!1587225 (= e!886216 (isStrictlySorted!1157 (t!51882 l!1251)))))

(assert (= (and d!168217 (not res!1083309)) b!1587224))

(assert (= (and b!1587224 res!1083310) b!1587225))

(assert (=> b!1587225 m!1456067))

(assert (=> start!138516 d!168217))

(declare-fun b!1587239 () Bool)

(declare-fun e!886226 () Bool)

(declare-fun tp!115133 () Bool)

(assert (=> b!1587239 (= e!886226 (and tp_is_empty!39457 tp!115133))))

(assert (=> b!1586993 (= tp!115121 e!886226)))

(assert (= (and b!1586993 ((_ is Cons!36972) (t!51882 l!1251))) b!1587239))

(check-sat (not b!1587145) (not b!1587203) (not d!168175) (not b!1587225) (not b!1587239) (not b!1587190) tp_is_empty!39457 (not b!1587047) (not b!1587199) (not d!168187) (not d!168191) (not bm!72714) (not b!1587115) (not b!1587150) (not b!1587117) (not bm!72706) (not b!1587195) (not b!1587221) (not b!1587122) (not b!1587143))
(check-sat)
(get-model)

(declare-fun d!168223 () Bool)

(declare-fun res!1083317 () Bool)

(declare-fun e!886232 () Bool)

(assert (=> d!168223 (=> res!1083317 e!886232)))

(assert (=> d!168223 (= res!1083317 (and ((_ is Cons!36972) lt!678181) (= (_1!12949 (h!38533 lt!678181)) newKey!123)))))

(assert (=> d!168223 (= (containsKey!1004 lt!678181 newKey!123) e!886232)))

(declare-fun b!1587247 () Bool)

(declare-fun e!886233 () Bool)

(assert (=> b!1587247 (= e!886232 e!886233)))

(declare-fun res!1083318 () Bool)

(assert (=> b!1587247 (=> (not res!1083318) (not e!886233))))

(assert (=> b!1587247 (= res!1083318 (and (or (not ((_ is Cons!36972) lt!678181)) (bvsle (_1!12949 (h!38533 lt!678181)) newKey!123)) ((_ is Cons!36972) lt!678181) (bvslt (_1!12949 (h!38533 lt!678181)) newKey!123)))))

(declare-fun b!1587248 () Bool)

(assert (=> b!1587248 (= e!886233 (containsKey!1004 (t!51882 lt!678181) newKey!123))))

(assert (= (and d!168223 (not res!1083317)) b!1587247))

(assert (= (and b!1587247 res!1083318) b!1587248))

(declare-fun m!1456203 () Bool)

(assert (=> b!1587248 m!1456203))

(assert (=> b!1587117 d!168223))

(declare-fun d!168225 () Bool)

(declare-fun lt!678198 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!847 (List!36976) (InoxSet tuple2!25876))

(assert (=> d!168225 (= lt!678198 (select (content!847 lt!678183) (tuple2!25877 newKey!123 newValue!123)))))

(declare-fun e!886239 () Bool)

(assert (=> d!168225 (= lt!678198 e!886239)))

(declare-fun res!1083323 () Bool)

(assert (=> d!168225 (=> (not res!1083323) (not e!886239))))

(assert (=> d!168225 (= res!1083323 ((_ is Cons!36972) lt!678183))))

(assert (=> d!168225 (= (contains!10571 lt!678183 (tuple2!25877 newKey!123 newValue!123)) lt!678198)))

(declare-fun b!1587253 () Bool)

(declare-fun e!886238 () Bool)

(assert (=> b!1587253 (= e!886239 e!886238)))

(declare-fun res!1083324 () Bool)

(assert (=> b!1587253 (=> res!1083324 e!886238)))

(assert (=> b!1587253 (= res!1083324 (= (h!38533 lt!678183) (tuple2!25877 newKey!123 newValue!123)))))

(declare-fun b!1587254 () Bool)

(assert (=> b!1587254 (= e!886238 (contains!10571 (t!51882 lt!678183) (tuple2!25877 newKey!123 newValue!123)))))

(assert (= (and d!168225 res!1083323) b!1587253))

(assert (= (and b!1587253 (not res!1083324)) b!1587254))

(declare-fun m!1456205 () Bool)

(assert (=> d!168225 m!1456205))

(declare-fun m!1456207 () Bool)

(assert (=> d!168225 m!1456207))

(declare-fun m!1456209 () Bool)

(assert (=> b!1587254 m!1456209))

(assert (=> b!1587143 d!168225))

(assert (=> b!1587190 d!168207))

(assert (=> b!1587047 d!168207))

(declare-fun d!168227 () Bool)

(declare-fun res!1083325 () Bool)

(declare-fun e!886240 () Bool)

(assert (=> d!168227 (=> res!1083325 e!886240)))

(assert (=> d!168227 (= res!1083325 (and ((_ is Cons!36972) lt!678183) (= (_1!12949 (h!38533 lt!678183)) newKey!123)))))

(assert (=> d!168227 (= (containsKey!1004 lt!678183 newKey!123) e!886240)))

(declare-fun b!1587255 () Bool)

(declare-fun e!886241 () Bool)

(assert (=> b!1587255 (= e!886240 e!886241)))

(declare-fun res!1083326 () Bool)

(assert (=> b!1587255 (=> (not res!1083326) (not e!886241))))

(assert (=> b!1587255 (= res!1083326 (and (or (not ((_ is Cons!36972) lt!678183)) (bvsle (_1!12949 (h!38533 lt!678183)) newKey!123)) ((_ is Cons!36972) lt!678183) (bvslt (_1!12949 (h!38533 lt!678183)) newKey!123)))))

(declare-fun b!1587256 () Bool)

(assert (=> b!1587256 (= e!886241 (containsKey!1004 (t!51882 lt!678183) newKey!123))))

(assert (= (and d!168227 (not res!1083325)) b!1587255))

(assert (= (and b!1587255 res!1083326) b!1587256))

(declare-fun m!1456211 () Bool)

(assert (=> b!1587256 m!1456211))

(assert (=> b!1587145 d!168227))

(declare-fun d!168229 () Bool)

(declare-fun res!1083327 () Bool)

(declare-fun e!886242 () Bool)

(assert (=> d!168229 (=> res!1083327 e!886242)))

(assert (=> d!168229 (= res!1083327 (and ((_ is Cons!36972) (t!51882 (t!51882 l!1251))) (= (_1!12949 (h!38533 (t!51882 (t!51882 l!1251)))) otherKey!56)))))

(assert (=> d!168229 (= (containsKey!1004 (t!51882 (t!51882 l!1251)) otherKey!56) e!886242)))

(declare-fun b!1587257 () Bool)

(declare-fun e!886243 () Bool)

(assert (=> b!1587257 (= e!886242 e!886243)))

(declare-fun res!1083328 () Bool)

(assert (=> b!1587257 (=> (not res!1083328) (not e!886243))))

(assert (=> b!1587257 (= res!1083328 (and (or (not ((_ is Cons!36972) (t!51882 (t!51882 l!1251)))) (bvsle (_1!12949 (h!38533 (t!51882 (t!51882 l!1251)))) otherKey!56)) ((_ is Cons!36972) (t!51882 (t!51882 l!1251))) (bvslt (_1!12949 (h!38533 (t!51882 (t!51882 l!1251)))) otherKey!56)))))

(declare-fun b!1587258 () Bool)

(assert (=> b!1587258 (= e!886243 (containsKey!1004 (t!51882 (t!51882 (t!51882 l!1251))) otherKey!56))))

(assert (= (and d!168229 (not res!1083327)) b!1587257))

(assert (= (and b!1587257 res!1083328) b!1587258))

(declare-fun m!1456213 () Bool)

(assert (=> b!1587258 m!1456213))

(assert (=> b!1587203 d!168229))

(declare-fun d!168231 () Bool)

(declare-fun res!1083329 () Bool)

(declare-fun e!886244 () Bool)

(assert (=> d!168231 (=> res!1083329 e!886244)))

(assert (=> d!168231 (= res!1083329 (or ((_ is Nil!36973) lt!678181) ((_ is Nil!36973) (t!51882 lt!678181))))))

(assert (=> d!168231 (= (isStrictlySorted!1157 lt!678181) e!886244)))

(declare-fun b!1587259 () Bool)

(declare-fun e!886245 () Bool)

(assert (=> b!1587259 (= e!886244 e!886245)))

(declare-fun res!1083330 () Bool)

(assert (=> b!1587259 (=> (not res!1083330) (not e!886245))))

(assert (=> b!1587259 (= res!1083330 (bvslt (_1!12949 (h!38533 lt!678181)) (_1!12949 (h!38533 (t!51882 lt!678181)))))))

(declare-fun b!1587260 () Bool)

(assert (=> b!1587260 (= e!886245 (isStrictlySorted!1157 (t!51882 lt!678181)))))

(assert (= (and d!168231 (not res!1083329)) b!1587259))

(assert (= (and b!1587259 res!1083330) b!1587260))

(declare-fun m!1456215 () Bool)

(assert (=> b!1587260 m!1456215))

(assert (=> d!168175 d!168231))

(assert (=> d!168175 d!168217))

(declare-fun d!168233 () Bool)

(declare-fun res!1083331 () Bool)

(declare-fun e!886246 () Bool)

(assert (=> d!168233 (=> res!1083331 e!886246)))

(assert (=> d!168233 (= res!1083331 (or ((_ is Nil!36973) lt!678183) ((_ is Nil!36973) (t!51882 lt!678183))))))

(assert (=> d!168233 (= (isStrictlySorted!1157 lt!678183) e!886246)))

(declare-fun b!1587261 () Bool)

(declare-fun e!886247 () Bool)

(assert (=> b!1587261 (= e!886246 e!886247)))

(declare-fun res!1083332 () Bool)

(assert (=> b!1587261 (=> (not res!1083332) (not e!886247))))

(assert (=> b!1587261 (= res!1083332 (bvslt (_1!12949 (h!38533 lt!678183)) (_1!12949 (h!38533 (t!51882 lt!678183)))))))

(declare-fun b!1587262 () Bool)

(assert (=> b!1587262 (= e!886247 (isStrictlySorted!1157 (t!51882 lt!678183)))))

(assert (= (and d!168233 (not res!1083331)) b!1587261))

(assert (= (and b!1587261 res!1083332) b!1587262))

(declare-fun m!1456217 () Bool)

(assert (=> b!1587262 m!1456217))

(assert (=> d!168187 d!168233))

(assert (=> d!168187 d!168211))

(declare-fun d!168235 () Bool)

(declare-fun res!1083333 () Bool)

(declare-fun e!886248 () Bool)

(assert (=> d!168235 (=> res!1083333 e!886248)))

(assert (=> d!168235 (= res!1083333 (or ((_ is Nil!36973) (t!51882 (t!51882 l!1251))) ((_ is Nil!36973) (t!51882 (t!51882 (t!51882 l!1251))))))))

(assert (=> d!168235 (= (isStrictlySorted!1157 (t!51882 (t!51882 l!1251))) e!886248)))

(declare-fun b!1587263 () Bool)

(declare-fun e!886249 () Bool)

(assert (=> b!1587263 (= e!886248 e!886249)))

(declare-fun res!1083334 () Bool)

(assert (=> b!1587263 (=> (not res!1083334) (not e!886249))))

(assert (=> b!1587263 (= res!1083334 (bvslt (_1!12949 (h!38533 (t!51882 (t!51882 l!1251)))) (_1!12949 (h!38533 (t!51882 (t!51882 (t!51882 l!1251)))))))))

(declare-fun b!1587264 () Bool)

(assert (=> b!1587264 (= e!886249 (isStrictlySorted!1157 (t!51882 (t!51882 (t!51882 l!1251)))))))

(assert (= (and d!168235 (not res!1083333)) b!1587263))

(assert (= (and b!1587263 res!1083334) b!1587264))

(declare-fun m!1456219 () Bool)

(assert (=> b!1587264 m!1456219))

(assert (=> b!1587221 d!168235))

(declare-fun d!168237 () Bool)

(declare-fun res!1083335 () Bool)

(declare-fun e!886250 () Bool)

(assert (=> d!168237 (=> res!1083335 e!886250)))

(assert (=> d!168237 (= res!1083335 (and ((_ is Cons!36972) (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (= (_1!12949 (h!38533 (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!168237 (= (containsKey!1004 (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) otherKey!56) e!886250)))

(declare-fun b!1587265 () Bool)

(declare-fun e!886251 () Bool)

(assert (=> b!1587265 (= e!886250 e!886251)))

(declare-fun res!1083336 () Bool)

(assert (=> b!1587265 (=> (not res!1083336) (not e!886251))))

(assert (=> b!1587265 (= res!1083336 (and (or (not ((_ is Cons!36972) (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) (bvsle (_1!12949 (h!38533 (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)) ((_ is Cons!36972) (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (bvslt (_1!12949 (h!38533 (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1587266 () Bool)

(assert (=> b!1587266 (= e!886251 (containsKey!1004 (t!51882 (t!51882 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!168237 (not res!1083335)) b!1587265))

(assert (= (and b!1587265 res!1083336) b!1587266))

(declare-fun m!1456221 () Bool)

(assert (=> b!1587266 m!1456221))

(assert (=> b!1587195 d!168237))

(declare-fun d!168239 () Bool)

(assert (=> d!168239 (= ($colon$colon!1016 e!886151 (ite c!147683 (h!38533 l!1251) (tuple2!25877 newKey!123 newValue!123))) (Cons!36972 (ite c!147683 (h!38533 l!1251) (tuple2!25877 newKey!123 newValue!123)) e!886151))))

(assert (=> bm!72706 d!168239))

(declare-fun d!168241 () Bool)

(declare-fun res!1083337 () Bool)

(declare-fun e!886252 () Bool)

(assert (=> d!168241 (=> res!1083337 e!886252)))

(assert (=> d!168241 (= res!1083337 (and ((_ is Cons!36972) (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123))) (= (_1!12949 (h!38533 (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!168241 (= (containsKey!1004 (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123)) otherKey!56) e!886252)))

(declare-fun b!1587267 () Bool)

(declare-fun e!886253 () Bool)

(assert (=> b!1587267 (= e!886252 e!886253)))

(declare-fun res!1083338 () Bool)

(assert (=> b!1587267 (=> (not res!1083338) (not e!886253))))

(assert (=> b!1587267 (= res!1083338 (and (or (not ((_ is Cons!36972) (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123)))) (bvsle (_1!12949 (h!38533 (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123)))) otherKey!56)) ((_ is Cons!36972) (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123))) (bvslt (_1!12949 (h!38533 (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1587268 () Bool)

(assert (=> b!1587268 (= e!886253 (containsKey!1004 (t!51882 (t!51882 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!168241 (not res!1083337)) b!1587267))

(assert (= (and b!1587267 res!1083338) b!1587268))

(declare-fun m!1456223 () Bool)

(assert (=> b!1587268 m!1456223))

(assert (=> b!1587199 d!168241))

(assert (=> b!1587225 d!168211))

(assert (=> b!1587122 d!168187))

(declare-fun lt!678199 () Bool)

(declare-fun d!168243 () Bool)

(assert (=> d!168243 (= lt!678199 (select (content!847 lt!678181) (tuple2!25877 newKey!123 newValue!123)))))

(declare-fun e!886255 () Bool)

(assert (=> d!168243 (= lt!678199 e!886255)))

(declare-fun res!1083339 () Bool)

(assert (=> d!168243 (=> (not res!1083339) (not e!886255))))

(assert (=> d!168243 (= res!1083339 ((_ is Cons!36972) lt!678181))))

(assert (=> d!168243 (= (contains!10571 lt!678181 (tuple2!25877 newKey!123 newValue!123)) lt!678199)))

(declare-fun b!1587269 () Bool)

(declare-fun e!886254 () Bool)

(assert (=> b!1587269 (= e!886255 e!886254)))

(declare-fun res!1083340 () Bool)

(assert (=> b!1587269 (=> res!1083340 e!886254)))

(assert (=> b!1587269 (= res!1083340 (= (h!38533 lt!678181) (tuple2!25877 newKey!123 newValue!123)))))

(declare-fun b!1587270 () Bool)

(assert (=> b!1587270 (= e!886254 (contains!10571 (t!51882 lt!678181) (tuple2!25877 newKey!123 newValue!123)))))

(assert (= (and d!168243 res!1083339) b!1587269))

(assert (= (and b!1587269 (not res!1083340)) b!1587270))

(declare-fun m!1456225 () Bool)

(assert (=> d!168243 m!1456225))

(declare-fun m!1456227 () Bool)

(assert (=> d!168243 m!1456227))

(declare-fun m!1456229 () Bool)

(assert (=> b!1587270 m!1456229))

(assert (=> b!1587115 d!168243))

(declare-fun bm!72726 () Bool)

(declare-fun c!147709 () Bool)

(declare-fun e!886259 () List!36976)

(declare-fun call!72731 () List!36976)

(assert (=> bm!72726 (= call!72731 ($colon$colon!1016 e!886259 (ite c!147709 (h!38533 (t!51882 (t!51882 l!1251))) (tuple2!25877 newKey!123 newValue!123))))))

(declare-fun c!147712 () Bool)

(assert (=> bm!72726 (= c!147712 c!147709)))

(declare-fun b!1587271 () Bool)

(declare-fun e!886257 () List!36976)

(declare-fun call!72729 () List!36976)

(assert (=> b!1587271 (= e!886257 call!72729)))

(declare-fun lt!678200 () List!36976)

(declare-fun e!886256 () Bool)

(declare-fun b!1587272 () Bool)

(assert (=> b!1587272 (= e!886256 (contains!10571 lt!678200 (tuple2!25877 newKey!123 newValue!123)))))

(declare-fun bm!72727 () Bool)

(declare-fun call!72730 () List!36976)

(assert (=> bm!72727 (= call!72730 call!72731)))

(declare-fun b!1587273 () Bool)

(declare-fun e!886258 () List!36976)

(assert (=> b!1587273 (= e!886258 call!72730)))

(declare-fun b!1587274 () Bool)

(declare-fun res!1083342 () Bool)

(assert (=> b!1587274 (=> (not res!1083342) (not e!886256))))

(assert (=> b!1587274 (= res!1083342 (containsKey!1004 lt!678200 newKey!123))))

(declare-fun b!1587275 () Bool)

(declare-fun c!147710 () Bool)

(assert (=> b!1587275 (= c!147710 (and ((_ is Cons!36972) (t!51882 (t!51882 l!1251))) (bvsgt (_1!12949 (h!38533 (t!51882 (t!51882 l!1251)))) newKey!123)))))

(assert (=> b!1587275 (= e!886258 e!886257)))

(declare-fun b!1587276 () Bool)

(declare-fun e!886260 () List!36976)

(assert (=> b!1587276 (= e!886260 call!72731)))

(declare-fun d!168245 () Bool)

(assert (=> d!168245 e!886256))

(declare-fun res!1083341 () Bool)

(assert (=> d!168245 (=> (not res!1083341) (not e!886256))))

(assert (=> d!168245 (= res!1083341 (isStrictlySorted!1157 lt!678200))))

(assert (=> d!168245 (= lt!678200 e!886260)))

(assert (=> d!168245 (= c!147709 (and ((_ is Cons!36972) (t!51882 (t!51882 l!1251))) (bvslt (_1!12949 (h!38533 (t!51882 (t!51882 l!1251)))) newKey!123)))))

(assert (=> d!168245 (isStrictlySorted!1157 (t!51882 (t!51882 l!1251)))))

(assert (=> d!168245 (= (insertStrictlySorted!627 (t!51882 (t!51882 l!1251)) newKey!123 newValue!123) lt!678200)))

(declare-fun bm!72728 () Bool)

(assert (=> bm!72728 (= call!72729 call!72730)))

(declare-fun b!1587277 () Bool)

(assert (=> b!1587277 (= e!886260 e!886258)))

(declare-fun c!147711 () Bool)

(assert (=> b!1587277 (= c!147711 (and ((_ is Cons!36972) (t!51882 (t!51882 l!1251))) (= (_1!12949 (h!38533 (t!51882 (t!51882 l!1251)))) newKey!123)))))

(declare-fun b!1587278 () Bool)

(assert (=> b!1587278 (= e!886257 call!72729)))

(declare-fun b!1587279 () Bool)

(assert (=> b!1587279 (= e!886259 (insertStrictlySorted!627 (t!51882 (t!51882 (t!51882 l!1251))) newKey!123 newValue!123))))

(declare-fun b!1587280 () Bool)

(assert (=> b!1587280 (= e!886259 (ite c!147711 (t!51882 (t!51882 (t!51882 l!1251))) (ite c!147710 (Cons!36972 (h!38533 (t!51882 (t!51882 l!1251))) (t!51882 (t!51882 (t!51882 l!1251)))) Nil!36973)))))

(assert (= (and d!168245 c!147709) b!1587276))

(assert (= (and d!168245 (not c!147709)) b!1587277))

(assert (= (and b!1587277 c!147711) b!1587273))

(assert (= (and b!1587277 (not c!147711)) b!1587275))

(assert (= (and b!1587275 c!147710) b!1587278))

(assert (= (and b!1587275 (not c!147710)) b!1587271))

(assert (= (or b!1587278 b!1587271) bm!72728))

(assert (= (or b!1587273 bm!72728) bm!72727))

(assert (= (or b!1587276 bm!72727) bm!72726))

(assert (= (and bm!72726 c!147712) b!1587279))

(assert (= (and bm!72726 (not c!147712)) b!1587280))

(assert (= (and d!168245 res!1083341) b!1587274))

(assert (= (and b!1587274 res!1083342) b!1587272))

(declare-fun m!1456231 () Bool)

(assert (=> b!1587272 m!1456231))

(declare-fun m!1456233 () Bool)

(assert (=> d!168245 m!1456233))

(assert (=> d!168245 m!1456197))

(declare-fun m!1456235 () Bool)

(assert (=> b!1587279 m!1456235))

(declare-fun m!1456237 () Bool)

(assert (=> b!1587274 m!1456237))

(declare-fun m!1456239 () Bool)

(assert (=> bm!72726 m!1456239))

(assert (=> b!1587150 d!168245))

(declare-fun d!168247 () Bool)

(assert (=> d!168247 (= ($colon$colon!1016 e!886165 (ite c!147693 (h!38533 (t!51882 l!1251)) (tuple2!25877 newKey!123 newValue!123))) (Cons!36972 (ite c!147693 (h!38533 (t!51882 l!1251)) (tuple2!25877 newKey!123 newValue!123)) e!886165))))

(assert (=> bm!72714 d!168247))

(assert (=> d!168191 d!168203))

(assert (=> d!168191 d!168187))

(declare-fun d!168249 () Bool)

(assert (=> d!168249 (not (containsKey!1004 (insertStrictlySorted!627 (t!51882 l!1251) newKey!123 newValue!123) otherKey!56))))

(assert (=> d!168249 true))

(declare-fun _$17!98 () Unit!52204)

(assert (=> d!168249 (= (choose!2103 (t!51882 l!1251) newKey!123 newValue!123 otherKey!56) _$17!98)))

(declare-fun bs!45963 () Bool)

(assert (= bs!45963 d!168249))

(assert (=> bs!45963 m!1456075))

(assert (=> bs!45963 m!1456075))

(assert (=> bs!45963 m!1456081))

(assert (=> d!168191 d!168249))

(assert (=> d!168191 d!168211))

(declare-fun b!1587281 () Bool)

(declare-fun e!886261 () Bool)

(declare-fun tp!115137 () Bool)

(assert (=> b!1587281 (= e!886261 (and tp_is_empty!39457 tp!115137))))

(assert (=> b!1587239 (= tp!115133 e!886261)))

(assert (= (and b!1587239 ((_ is Cons!36972) (t!51882 (t!51882 l!1251)))) b!1587281))

(check-sat (not d!168225) (not b!1587274) (not b!1587266) (not b!1587256) (not b!1587248) (not b!1587279) (not d!168245) (not b!1587264) (not b!1587258) (not d!168243) (not b!1587254) (not b!1587270) (not b!1587281) (not b!1587272) (not b!1587262) tp_is_empty!39457 (not b!1587268) (not b!1587260) (not d!168249) (not bm!72726))
(check-sat)
