; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89054 () Bool)

(assert start!89054)

(declare-fun b!1021072 () Bool)

(declare-fun e!574761 () Bool)

(declare-fun e!574759 () Bool)

(assert (=> b!1021072 (= e!574761 e!574759)))

(declare-fun res!684090 () Bool)

(assert (=> b!1021072 (=> (not res!684090) (not e!574759))))

(declare-fun key!261 () (_ BitVec 64))

(declare-datatypes ((B!1698 0))(
  ( (B!1699 (val!11933 Int)) )
))
(declare-fun value!172 () B!1698)

(declare-datatypes ((tuple2!15416 0))(
  ( (tuple2!15417 (_1!7719 (_ BitVec 64)) (_2!7719 B!1698)) )
))
(declare-datatypes ((List!21610 0))(
  ( (Nil!21607) (Cons!21606 (h!22813 tuple2!15416) (t!30609 List!21610)) )
))
(declare-fun l!996 () List!21610)

(declare-fun lt!450251 () List!21610)

(assert (=> b!1021072 (= res!684090 (and (bvsge (_1!7719 (h!22813 l!996)) key!261) (is-Cons!21606 l!996) (= (_1!7719 (h!22813 l!996)) key!261) (= lt!450251 (Cons!21606 (tuple2!15417 key!261 value!172) (t!30609 l!996)))))))

(declare-fun insertStrictlySorted!365 (List!21610 (_ BitVec 64) B!1698) List!21610)

(assert (=> b!1021072 (= lt!450251 (insertStrictlySorted!365 l!996 key!261 value!172))))

(declare-fun b!1021073 () Bool)

(declare-fun length!49 (List!21610) Int)

(assert (=> b!1021073 (= e!574759 (not (= (length!49 lt!450251) (length!49 l!996))))))

(declare-fun b!1021074 () Bool)

(declare-fun e!574760 () Bool)

(declare-fun tp_is_empty!23765 () Bool)

(declare-fun tp!71176 () Bool)

(assert (=> b!1021074 (= e!574760 (and tp_is_empty!23765 tp!71176))))

(declare-fun res!684091 () Bool)

(assert (=> start!89054 (=> (not res!684091) (not e!574761))))

(declare-fun isStrictlySorted!674 (List!21610) Bool)

(assert (=> start!89054 (= res!684091 (isStrictlySorted!674 l!996))))

(assert (=> start!89054 e!574761))

(assert (=> start!89054 e!574760))

(assert (=> start!89054 true))

(assert (=> start!89054 tp_is_empty!23765))

(declare-fun b!1021071 () Bool)

(declare-fun res!684092 () Bool)

(assert (=> b!1021071 (=> (not res!684092) (not e!574761))))

(declare-fun containsKey!548 (List!21610 (_ BitVec 64)) Bool)

(assert (=> b!1021071 (= res!684092 (containsKey!548 l!996 key!261))))

(assert (= (and start!89054 res!684091) b!1021071))

(assert (= (and b!1021071 res!684092) b!1021072))

(assert (= (and b!1021072 res!684090) b!1021073))

(assert (= (and start!89054 (is-Cons!21606 l!996)) b!1021074))

(declare-fun m!941663 () Bool)

(assert (=> b!1021072 m!941663))

(declare-fun m!941665 () Bool)

(assert (=> b!1021073 m!941665))

(declare-fun m!941667 () Bool)

(assert (=> b!1021073 m!941667))

(declare-fun m!941669 () Bool)

(assert (=> start!89054 m!941669))

(declare-fun m!941671 () Bool)

(assert (=> b!1021071 m!941671))

(push 1)

(assert (not b!1021074))

(assert (not start!89054))

(assert tp_is_empty!23765)

(assert (not b!1021071))

(assert (not b!1021073))

(assert (not b!1021072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122673 () Bool)

(declare-fun res!684105 () Bool)

(declare-fun e!574774 () Bool)

(assert (=> d!122673 (=> res!684105 e!574774)))

(assert (=> d!122673 (= res!684105 (and (is-Cons!21606 l!996) (= (_1!7719 (h!22813 l!996)) key!261)))))

(assert (=> d!122673 (= (containsKey!548 l!996 key!261) e!574774)))

(declare-fun b!1021087 () Bool)

(declare-fun e!574775 () Bool)

(assert (=> b!1021087 (= e!574774 e!574775)))

(declare-fun res!684106 () Bool)

(assert (=> b!1021087 (=> (not res!684106) (not e!574775))))

(assert (=> b!1021087 (= res!684106 (and (or (not (is-Cons!21606 l!996)) (bvsle (_1!7719 (h!22813 l!996)) key!261)) (is-Cons!21606 l!996) (bvslt (_1!7719 (h!22813 l!996)) key!261)))))

(declare-fun b!1021088 () Bool)

(assert (=> b!1021088 (= e!574775 (containsKey!548 (t!30609 l!996) key!261))))

(assert (= (and d!122673 (not res!684105)) b!1021087))

(assert (= (and b!1021087 res!684106) b!1021088))

(declare-fun m!941679 () Bool)

(assert (=> b!1021088 m!941679))

(assert (=> b!1021071 d!122673))

(declare-fun bm!43196 () Bool)

(declare-fun call!43201 () List!21610)

(declare-fun call!43199 () List!21610)

(assert (=> bm!43196 (= call!43201 call!43199)))

(declare-fun lt!450258 () List!21610)

(declare-fun b!1021145 () Bool)

(declare-fun e!574810 () Bool)

(declare-fun contains!5934 (List!21610 tuple2!15416) Bool)

(assert (=> b!1021145 (= e!574810 (contains!5934 lt!450258 (tuple2!15417 key!261 value!172)))))

(declare-fun b!1021146 () Bool)

(declare-fun e!574808 () List!21610)

(declare-fun call!43200 () List!21610)

(assert (=> b!1021146 (= e!574808 call!43200)))

(declare-fun bm!43197 () Bool)

(assert (=> bm!43197 (= call!43200 call!43201)))

(declare-fun b!1021147 () Bool)

(declare-fun e!574806 () List!21610)

(declare-fun e!574807 () List!21610)

(assert (=> b!1021147 (= e!574806 e!574807)))

(declare-fun c!103832 () Bool)

(assert (=> b!1021147 (= c!103832 (and (is-Cons!21606 l!996) (= (_1!7719 (h!22813 l!996)) key!261)))))

(declare-fun e!574809 () List!21610)

(declare-fun b!1021148 () Bool)

(assert (=> b!1021148 (= e!574809 (insertStrictlySorted!365 (t!30609 l!996) key!261 value!172))))

(declare-fun b!1021149 () Bool)

(assert (=> b!1021149 (= e!574806 call!43199)))

(declare-fun b!1021150 () Bool)

(assert (=> b!1021150 (= e!574808 call!43200)))

(declare-fun d!122677 () Bool)

(assert (=> d!122677 e!574810))

(declare-fun res!684120 () Bool)

(assert (=> d!122677 (=> (not res!684120) (not e!574810))))

(assert (=> d!122677 (= res!684120 (isStrictlySorted!674 lt!450258))))

(assert (=> d!122677 (= lt!450258 e!574806)))

(declare-fun c!103834 () Bool)

(assert (=> d!122677 (= c!103834 (and (is-Cons!21606 l!996) (bvslt (_1!7719 (h!22813 l!996)) key!261)))))

(assert (=> d!122677 (isStrictlySorted!674 l!996)))

(assert (=> d!122677 (= (insertStrictlySorted!365 l!996 key!261 value!172) lt!450258)))

(declare-fun b!1021151 () Bool)

(declare-fun res!684119 () Bool)

(assert (=> b!1021151 (=> (not res!684119) (not e!574810))))

(assert (=> b!1021151 (= res!684119 (containsKey!548 lt!450258 key!261))))

(declare-fun b!1021152 () Bool)

(declare-fun c!103835 () Bool)

(assert (=> b!1021152 (= e!574809 (ite c!103832 (t!30609 l!996) (ite c!103835 (Cons!21606 (h!22813 l!996) (t!30609 l!996)) Nil!21607)))))

(declare-fun b!1021153 () Bool)

(assert (=> b!1021153 (= c!103835 (and (is-Cons!21606 l!996) (bvsgt (_1!7719 (h!22813 l!996)) key!261)))))

(assert (=> b!1021153 (= e!574807 e!574808)))

(declare-fun bm!43198 () Bool)

(declare-fun $colon$colon!594 (List!21610 tuple2!15416) List!21610)

(assert (=> bm!43198 (= call!43199 ($colon$colon!594 e!574809 (ite c!103834 (h!22813 l!996) (tuple2!15417 key!261 value!172))))))

(declare-fun c!103833 () Bool)

(assert (=> bm!43198 (= c!103833 c!103834)))

(declare-fun b!1021154 () Bool)

(assert (=> b!1021154 (= e!574807 call!43201)))

(assert (= (and d!122677 c!103834) b!1021149))

(assert (= (and d!122677 (not c!103834)) b!1021147))

(assert (= (and b!1021147 c!103832) b!1021154))

(assert (= (and b!1021147 (not c!103832)) b!1021153))

(assert (= (and b!1021153 c!103835) b!1021150))

(assert (= (and b!1021153 (not c!103835)) b!1021146))

(assert (= (or b!1021150 b!1021146) bm!43197))

(assert (= (or b!1021154 bm!43197) bm!43196))

(assert (= (or b!1021149 bm!43196) bm!43198))

(assert (= (and bm!43198 c!103833) b!1021148))

(assert (= (and bm!43198 (not c!103833)) b!1021152))

(assert (= (and d!122677 res!684120) b!1021151))

(assert (= (and b!1021151 res!684119) b!1021145))

(declare-fun m!941683 () Bool)

(assert (=> b!1021148 m!941683))

(declare-fun m!941685 () Bool)

(assert (=> bm!43198 m!941685))

(declare-fun m!941687 () Bool)

(assert (=> d!122677 m!941687))

(assert (=> d!122677 m!941669))

(declare-fun m!941689 () Bool)

(assert (=> b!1021151 m!941689))

(declare-fun m!941691 () Bool)

(assert (=> b!1021145 m!941691))

(assert (=> b!1021072 d!122677))

(declare-fun d!122683 () Bool)

(declare-fun size!31180 (List!21610) Int)

(assert (=> d!122683 (= (length!49 lt!450251) (size!31180 lt!450251))))

(declare-fun bs!29729 () Bool)

(assert (= bs!29729 d!122683))

(declare-fun m!941697 () Bool)

(assert (=> bs!29729 m!941697))

(assert (=> b!1021073 d!122683))

(declare-fun d!122685 () Bool)

(assert (=> d!122685 (= (length!49 l!996) (size!31180 l!996))))

(declare-fun bs!29730 () Bool)

(assert (= bs!29730 d!122685))

(declare-fun m!941705 () Bool)

(assert (=> bs!29730 m!941705))

(assert (=> b!1021073 d!122685))

(declare-fun d!122687 () Bool)

(declare-fun res!684131 () Bool)

(declare-fun e!574827 () Bool)

(assert (=> d!122687 (=> res!684131 e!574827)))

(assert (=> d!122687 (= res!684131 (or (is-Nil!21607 l!996) (is-Nil!21607 (t!30609 l!996))))))

(assert (=> d!122687 (= (isStrictlySorted!674 l!996) e!574827)))

(declare-fun b!1021182 () Bool)

(declare-fun e!574828 () Bool)

(assert (=> b!1021182 (= e!574827 e!574828)))

(declare-fun res!684132 () Bool)

(assert (=> b!1021182 (=> (not res!684132) (not e!574828))))

(assert (=> b!1021182 (= res!684132 (bvslt (_1!7719 (h!22813 l!996)) (_1!7719 (h!22813 (t!30609 l!996)))))))

(declare-fun b!1021183 () Bool)

(assert (=> b!1021183 (= e!574828 (isStrictlySorted!674 (t!30609 l!996)))))

(assert (= (and d!122687 (not res!684131)) b!1021182))

(assert (= (and b!1021182 res!684132) b!1021183))

(declare-fun m!941707 () Bool)

(assert (=> b!1021183 m!941707))

(assert (=> start!89054 d!122687))

(declare-fun b!1021188 () Bool)

(declare-fun e!574831 () Bool)

(declare-fun tp!71182 () Bool)

(assert (=> b!1021188 (= e!574831 (and tp_is_empty!23765 tp!71182))))

(assert (=> b!1021074 (= tp!71176 e!574831)))

(assert (= (and b!1021074 (is-Cons!21606 (t!30609 l!996))) b!1021188))

(push 1)

(assert (not b!1021151))

(assert (not bm!43198))

(assert tp_is_empty!23765)

(assert (not b!1021183))

(assert (not d!122685))

(assert (not b!1021088))

(assert (not d!122683))

(assert (not d!122677))

(assert (not b!1021188))

(assert (not b!1021145))

(assert (not b!1021148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122697 () Bool)

(declare-fun res!684147 () Bool)

(declare-fun e!574852 () Bool)

(assert (=> d!122697 (=> res!684147 e!574852)))

(assert (=> d!122697 (= res!684147 (or (is-Nil!21607 (t!30609 l!996)) (is-Nil!21607 (t!30609 (t!30609 l!996)))))))

(assert (=> d!122697 (= (isStrictlySorted!674 (t!30609 l!996)) e!574852)))

(declare-fun b!1021216 () Bool)

(declare-fun e!574853 () Bool)

(assert (=> b!1021216 (= e!574852 e!574853)))

(declare-fun res!684148 () Bool)

(assert (=> b!1021216 (=> (not res!684148) (not e!574853))))

(assert (=> b!1021216 (= res!684148 (bvslt (_1!7719 (h!22813 (t!30609 l!996))) (_1!7719 (h!22813 (t!30609 (t!30609 l!996))))))))

(declare-fun b!1021217 () Bool)

(assert (=> b!1021217 (= e!574853 (isStrictlySorted!674 (t!30609 (t!30609 l!996))))))

(assert (= (and d!122697 (not res!684147)) b!1021216))

(assert (= (and b!1021216 res!684148) b!1021217))

(declare-fun m!941727 () Bool)

(assert (=> b!1021217 m!941727))

(assert (=> b!1021183 d!122697))

(declare-fun d!122699 () Bool)

(declare-fun res!684149 () Bool)

(declare-fun e!574854 () Bool)

(assert (=> d!122699 (=> res!684149 e!574854)))

(assert (=> d!122699 (= res!684149 (and (is-Cons!21606 lt!450258) (= (_1!7719 (h!22813 lt!450258)) key!261)))))

(assert (=> d!122699 (= (containsKey!548 lt!450258 key!261) e!574854)))

(declare-fun b!1021218 () Bool)

(declare-fun e!574855 () Bool)

(assert (=> b!1021218 (= e!574854 e!574855)))

(declare-fun res!684150 () Bool)

(assert (=> b!1021218 (=> (not res!684150) (not e!574855))))

(assert (=> b!1021218 (= res!684150 (and (or (not (is-Cons!21606 lt!450258)) (bvsle (_1!7719 (h!22813 lt!450258)) key!261)) (is-Cons!21606 lt!450258) (bvslt (_1!7719 (h!22813 lt!450258)) key!261)))))

(declare-fun b!1021219 () Bool)

(assert (=> b!1021219 (= e!574855 (containsKey!548 (t!30609 lt!450258) key!261))))

(assert (= (and d!122699 (not res!684149)) b!1021218))

(assert (= (and b!1021218 res!684150) b!1021219))

(declare-fun m!941729 () Bool)

(assert (=> b!1021219 m!941729))

(assert (=> b!1021151 d!122699))

(declare-fun bm!43211 () Bool)

(declare-fun call!43216 () List!21610)

(declare-fun call!43214 () List!21610)

(assert (=> bm!43211 (= call!43216 call!43214)))

(declare-fun e!574860 () Bool)

(declare-fun lt!450261 () List!21610)

(declare-fun b!1021220 () Bool)

(assert (=> b!1021220 (= e!574860 (contains!5934 lt!450261 (tuple2!15417 key!261 value!172)))))

(declare-fun b!1021221 () Bool)

(declare-fun e!574858 () List!21610)

(declare-fun call!43215 () List!21610)

(assert (=> b!1021221 (= e!574858 call!43215)))

(declare-fun bm!43212 () Bool)

(assert (=> bm!43212 (= call!43215 call!43216)))

(declare-fun b!1021222 () Bool)

(declare-fun e!574856 () List!21610)

(declare-fun e!574857 () List!21610)

(assert (=> b!1021222 (= e!574856 e!574857)))

(declare-fun c!103846 () Bool)

(assert (=> b!1021222 (= c!103846 (and (is-Cons!21606 (t!30609 l!996)) (= (_1!7719 (h!22813 (t!30609 l!996))) key!261)))))

(declare-fun e!574859 () List!21610)

(declare-fun b!1021223 () Bool)

(assert (=> b!1021223 (= e!574859 (insertStrictlySorted!365 (t!30609 (t!30609 l!996)) key!261 value!172))))

(declare-fun b!1021224 () Bool)

(assert (=> b!1021224 (= e!574856 call!43214)))

(declare-fun b!1021225 () Bool)

(assert (=> b!1021225 (= e!574858 call!43215)))

(declare-fun d!122701 () Bool)

(assert (=> d!122701 e!574860))

(declare-fun res!684152 () Bool)

(assert (=> d!122701 (=> (not res!684152) (not e!574860))))

(assert (=> d!122701 (= res!684152 (isStrictlySorted!674 lt!450261))))

(assert (=> d!122701 (= lt!450261 e!574856)))

(declare-fun c!103848 () Bool)

(assert (=> d!122701 (= c!103848 (and (is-Cons!21606 (t!30609 l!996)) (bvslt (_1!7719 (h!22813 (t!30609 l!996))) key!261)))))

(assert (=> d!122701 (isStrictlySorted!674 (t!30609 l!996))))

(assert (=> d!122701 (= (insertStrictlySorted!365 (t!30609 l!996) key!261 value!172) lt!450261)))

(declare-fun b!1021226 () Bool)

(declare-fun res!684151 () Bool)

(assert (=> b!1021226 (=> (not res!684151) (not e!574860))))

(assert (=> b!1021226 (= res!684151 (containsKey!548 lt!450261 key!261))))

(declare-fun b!1021227 () Bool)

(declare-fun c!103849 () Bool)

(assert (=> b!1021227 (= e!574859 (ite c!103846 (t!30609 (t!30609 l!996)) (ite c!103849 (Cons!21606 (h!22813 (t!30609 l!996)) (t!30609 (t!30609 l!996))) Nil!21607)))))

(declare-fun b!1021228 () Bool)

(assert (=> b!1021228 (= c!103849 (and (is-Cons!21606 (t!30609 l!996)) (bvsgt (_1!7719 (h!22813 (t!30609 l!996))) key!261)))))

(assert (=> b!1021228 (= e!574857 e!574858)))

(declare-fun bm!43213 () Bool)

(assert (=> bm!43213 (= call!43214 ($colon$colon!594 e!574859 (ite c!103848 (h!22813 (t!30609 l!996)) (tuple2!15417 key!261 value!172))))))

(declare-fun c!103847 () Bool)

(assert (=> bm!43213 (= c!103847 c!103848)))

(declare-fun b!1021229 () Bool)

(assert (=> b!1021229 (= e!574857 call!43216)))

(assert (= (and d!122701 c!103848) b!1021224))

(assert (= (and d!122701 (not c!103848)) b!1021222))

(assert (= (and b!1021222 c!103846) b!1021229))

(assert (= (and b!1021222 (not c!103846)) b!1021228))

(assert (= (and b!1021228 c!103849) b!1021225))

(assert (= (and b!1021228 (not c!103849)) b!1021221))

(assert (= (or b!1021225 b!1021221) bm!43212))

(assert (= (or b!1021229 bm!43212) bm!43211))

(assert (= (or b!1021224 bm!43211) bm!43213))

(assert (= (and bm!43213 c!103847) b!1021223))

(assert (= (and bm!43213 (not c!103847)) b!1021227))

(assert (= (and d!122701 res!684152) b!1021226))

(assert (= (and b!1021226 res!684151) b!1021220))

(declare-fun m!941731 () Bool)

(assert (=> b!1021223 m!941731))

(declare-fun m!941733 () Bool)

(assert (=> bm!43213 m!941733))

(declare-fun m!941735 () Bool)

(assert (=> d!122701 m!941735))

(assert (=> d!122701 m!941707))

(declare-fun m!941737 () Bool)

(assert (=> b!1021226 m!941737))

(declare-fun m!941739 () Bool)

(assert (=> b!1021220 m!941739))

(assert (=> b!1021148 d!122701))

(declare-fun d!122703 () Bool)

(declare-fun lt!450264 () Int)

(assert (=> d!122703 (>= lt!450264 0)))

(declare-fun e!574863 () Int)

(assert (=> d!122703 (= lt!450264 e!574863)))

(declare-fun c!103852 () Bool)

(assert (=> d!122703 (= c!103852 (is-Nil!21607 l!996))))

(assert (=> d!122703 (= (size!31180 l!996) lt!450264)))

(declare-fun b!1021234 () Bool)

(assert (=> b!1021234 (= e!574863 0)))

(declare-fun b!1021235 () Bool)

(assert (=> b!1021235 (= e!574863 (+ 1 (size!31180 (t!30609 l!996))))))

(assert (= (and d!122703 c!103852) b!1021234))

(assert (= (and d!122703 (not c!103852)) b!1021235))

(declare-fun m!941741 () Bool)

(assert (=> b!1021235 m!941741))

(assert (=> d!122685 d!122703))

(declare-fun lt!450267 () Bool)

(declare-fun d!122705 () Bool)

(declare-fun content!494 (List!21610) (Set tuple2!15416))

(assert (=> d!122705 (= lt!450267 (set.member (tuple2!15417 key!261 value!172) (content!494 lt!450258)))))

(declare-fun e!574868 () Bool)

(assert (=> d!122705 (= lt!450267 e!574868)))

(declare-fun res!684157 () Bool)

(assert (=> d!122705 (=> (not res!684157) (not e!574868))))

(assert (=> d!122705 (= res!684157 (is-Cons!21606 lt!450258))))

(assert (=> d!122705 (= (contains!5934 lt!450258 (tuple2!15417 key!261 value!172)) lt!450267)))

(declare-fun b!1021240 () Bool)

(declare-fun e!574869 () Bool)

(assert (=> b!1021240 (= e!574868 e!574869)))

(declare-fun res!684158 () Bool)

(assert (=> b!1021240 (=> res!684158 e!574869)))

(assert (=> b!1021240 (= res!684158 (= (h!22813 lt!450258) (tuple2!15417 key!261 value!172)))))

(declare-fun b!1021241 () Bool)

(assert (=> b!1021241 (= e!574869 (contains!5934 (t!30609 lt!450258) (tuple2!15417 key!261 value!172)))))

(assert (= (and d!122705 res!684157) b!1021240))

(assert (= (and b!1021240 (not res!684158)) b!1021241))

(declare-fun m!941743 () Bool)

(assert (=> d!122705 m!941743))

(declare-fun m!941745 () Bool)

(assert (=> d!122705 m!941745))

(declare-fun m!941747 () Bool)

(assert (=> b!1021241 m!941747))

(assert (=> b!1021145 d!122705))

(declare-fun d!122707 () Bool)

(declare-fun res!684159 () Bool)

(declare-fun e!574870 () Bool)

(assert (=> d!122707 (=> res!684159 e!574870)))

(assert (=> d!122707 (= res!684159 (and (is-Cons!21606 (t!30609 l!996)) (= (_1!7719 (h!22813 (t!30609 l!996))) key!261)))))

(assert (=> d!122707 (= (containsKey!548 (t!30609 l!996) key!261) e!574870)))

(declare-fun b!1021242 () Bool)

(declare-fun e!574871 () Bool)

(assert (=> b!1021242 (= e!574870 e!574871)))

(declare-fun res!684160 () Bool)

(assert (=> b!1021242 (=> (not res!684160) (not e!574871))))

(assert (=> b!1021242 (= res!684160 (and (or (not (is-Cons!21606 (t!30609 l!996))) (bvsle (_1!7719 (h!22813 (t!30609 l!996))) key!261)) (is-Cons!21606 (t!30609 l!996)) (bvslt (_1!7719 (h!22813 (t!30609 l!996))) key!261)))))

(declare-fun b!1021243 () Bool)

(assert (=> b!1021243 (= e!574871 (containsKey!548 (t!30609 (t!30609 l!996)) key!261))))

(assert (= (and d!122707 (not res!684159)) b!1021242))

(assert (= (and b!1021242 res!684160) b!1021243))

(declare-fun m!941749 () Bool)

(assert (=> b!1021243 m!941749))

(assert (=> b!1021088 d!122707))

(declare-fun d!122709 () Bool)

(assert (=> d!122709 (= ($colon$colon!594 e!574809 (ite c!103834 (h!22813 l!996) (tuple2!15417 key!261 value!172))) (Cons!21606 (ite c!103834 (h!22813 l!996) (tuple2!15417 key!261 value!172)) e!574809))))

(assert (=> bm!43198 d!122709))

(declare-fun d!122711 () Bool)

(declare-fun res!684161 () Bool)

(declare-fun e!574872 () Bool)

(assert (=> d!122711 (=> res!684161 e!574872)))

(assert (=> d!122711 (= res!684161 (or (is-Nil!21607 lt!450258) (is-Nil!21607 (t!30609 lt!450258))))))

(assert (=> d!122711 (= (isStrictlySorted!674 lt!450258) e!574872)))

(declare-fun b!1021244 () Bool)

(declare-fun e!574873 () Bool)

(assert (=> b!1021244 (= e!574872 e!574873)))

(declare-fun res!684162 () Bool)

(assert (=> b!1021244 (=> (not res!684162) (not e!574873))))

(assert (=> b!1021244 (= res!684162 (bvslt (_1!7719 (h!22813 lt!450258)) (_1!7719 (h!22813 (t!30609 lt!450258)))))))

(declare-fun b!1021245 () Bool)

(assert (=> b!1021245 (= e!574873 (isStrictlySorted!674 (t!30609 lt!450258)))))

(assert (= (and d!122711 (not res!684161)) b!1021244))

(assert (= (and b!1021244 res!684162) b!1021245))

(declare-fun m!941751 () Bool)

(assert (=> b!1021245 m!941751))

(assert (=> d!122677 d!122711))

(assert (=> d!122677 d!122687))

(declare-fun d!122713 () Bool)

(declare-fun lt!450268 () Int)

(assert (=> d!122713 (>= lt!450268 0)))

(declare-fun e!574874 () Int)

(assert (=> d!122713 (= lt!450268 e!574874)))

(declare-fun c!103853 () Bool)

(assert (=> d!122713 (= c!103853 (is-Nil!21607 lt!450251))))

(assert (=> d!122713 (= (size!31180 lt!450251) lt!450268)))

(declare-fun b!1021246 () Bool)

(assert (=> b!1021246 (= e!574874 0)))

(declare-fun b!1021247 () Bool)

(assert (=> b!1021247 (= e!574874 (+ 1 (size!31180 (t!30609 lt!450251))))))

(assert (= (and d!122713 c!103853) b!1021246))

(assert (= (and d!122713 (not c!103853)) b!1021247))

(declare-fun m!941753 () Bool)

(assert (=> b!1021247 m!941753))

(assert (=> d!122683 d!122713))

(declare-fun b!1021248 () Bool)

(declare-fun e!574875 () Bool)

(declare-fun tp!71186 () Bool)

(assert (=> b!1021248 (= e!574875 (and tp_is_empty!23765 tp!71186))))

(assert (=> b!1021188 (= tp!71182 e!574875)))

(assert (= (and b!1021188 (is-Cons!21606 (t!30609 (t!30609 l!996)))) b!1021248))

(push 1)

(assert (not b!1021247))

(assert (not d!122701))

(assert (not b!1021220))

(assert (not b!1021243))

(assert (not b!1021219))

(assert tp_is_empty!23765)

(assert (not bm!43213))

(assert (not b!1021223))

(assert (not b!1021245))

(assert (not b!1021248))

(assert (not d!122705))

(assert (not b!1021241))

(assert (not b!1021217))

(assert (not b!1021226))

(assert (not b!1021235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

