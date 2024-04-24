; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75422 () Bool)

(assert start!75422)

(declare-fun res!602222 () Bool)

(declare-fun e!494132 () Bool)

(assert (=> start!75422 (=> (not res!602222) (not e!494132))))

(declare-datatypes ((B!1308 0))(
  ( (B!1309 (val!8960 Int)) )
))
(declare-datatypes ((tuple2!11844 0))(
  ( (tuple2!11845 (_1!5933 (_ BitVec 64)) (_2!5933 B!1308)) )
))
(declare-datatypes ((List!17631 0))(
  ( (Nil!17628) (Cons!17627 (h!18764 tuple2!11844) (t!24903 List!17631)) )
))
(declare-fun l!906 () List!17631)

(declare-fun isStrictlySorted!482 (List!17631) Bool)

(assert (=> start!75422 (= res!602222 (isStrictlySorted!482 l!906))))

(assert (=> start!75422 e!494132))

(declare-fun e!494133 () Bool)

(assert (=> start!75422 e!494133))

(assert (=> start!75422 true))

(declare-fun tp_is_empty!17819 () Bool)

(assert (=> start!75422 tp_is_empty!17819))

(declare-fun b!887513 () Bool)

(declare-fun res!602223 () Bool)

(assert (=> b!887513 (=> (not res!602223) (not e!494132))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!887513 (= res!602223 (or (not (is-Cons!17627 l!906)) (bvsge (_1!5933 (h!18764 l!906)) key1!49)))))

(declare-fun v2!16 () B!1308)

(declare-fun b!887514 () Bool)

(declare-fun v1!38 () B!1308)

(declare-fun insertStrictlySorted!303 (List!17631 (_ BitVec 64) B!1308) List!17631)

(assert (=> b!887514 (= e!494132 (not (= (insertStrictlySorted!303 (insertStrictlySorted!303 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!303 l!906 key1!49 v2!16))))))

(declare-fun b!887515 () Bool)

(declare-fun tp!54393 () Bool)

(assert (=> b!887515 (= e!494133 (and tp_is_empty!17819 tp!54393))))

(assert (= (and start!75422 res!602222) b!887513))

(assert (= (and b!887513 res!602223) b!887514))

(assert (= (and start!75422 (is-Cons!17627 l!906)) b!887515))

(declare-fun m!827793 () Bool)

(assert (=> start!75422 m!827793))

(declare-fun m!827795 () Bool)

(assert (=> b!887514 m!827795))

(assert (=> b!887514 m!827795))

(declare-fun m!827797 () Bool)

(assert (=> b!887514 m!827797))

(declare-fun m!827799 () Bool)

(assert (=> b!887514 m!827799))

(push 1)

(assert (not start!75422))

(assert (not b!887514))

(assert (not b!887515))

(assert tp_is_empty!17819)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!110069 () Bool)

(declare-fun res!602228 () Bool)

(declare-fun e!494138 () Bool)

(assert (=> d!110069 (=> res!602228 e!494138)))

(assert (=> d!110069 (= res!602228 (or (is-Nil!17628 l!906) (is-Nil!17628 (t!24903 l!906))))))

(assert (=> d!110069 (= (isStrictlySorted!482 l!906) e!494138)))

(declare-fun b!887520 () Bool)

(declare-fun e!494139 () Bool)

(assert (=> b!887520 (= e!494138 e!494139)))

(declare-fun res!602229 () Bool)

(assert (=> b!887520 (=> (not res!602229) (not e!494139))))

(assert (=> b!887520 (= res!602229 (bvslt (_1!5933 (h!18764 l!906)) (_1!5933 (h!18764 (t!24903 l!906)))))))

(declare-fun b!887521 () Bool)

(assert (=> b!887521 (= e!494139 (isStrictlySorted!482 (t!24903 l!906)))))

(assert (= (and d!110069 (not res!602228)) b!887520))

(assert (= (and b!887520 res!602229) b!887521))

(declare-fun m!827801 () Bool)

(assert (=> b!887521 m!827801))

(assert (=> start!75422 d!110069))

(declare-fun e!494198 () Bool)

(declare-fun lt!401516 () List!17631)

(declare-fun b!887632 () Bool)

(declare-fun contains!4279 (List!17631 tuple2!11844) Bool)

(assert (=> b!887632 (= e!494198 (contains!4279 lt!401516 (tuple2!11845 key1!49 v2!16)))))

(declare-fun c!93848 () Bool)

(declare-fun e!494196 () List!17631)

(declare-fun c!93845 () Bool)

(declare-fun b!887633 () Bool)

(assert (=> b!887633 (= e!494196 (ite c!93848 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (ite c!93845 (Cons!17627 (h!18764 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))) Nil!17628)))))

(declare-fun bm!39332 () Bool)

(declare-fun call!39335 () List!17631)

(declare-fun call!39336 () List!17631)

(assert (=> bm!39332 (= call!39335 call!39336)))

(declare-fun d!110073 () Bool)

(assert (=> d!110073 e!494198))

(declare-fun res!602252 () Bool)

(assert (=> d!110073 (=> (not res!602252) (not e!494198))))

(assert (=> d!110073 (= res!602252 (isStrictlySorted!482 lt!401516))))

(declare-fun e!494197 () List!17631)

(assert (=> d!110073 (= lt!401516 e!494197)))

(declare-fun c!93847 () Bool)

(assert (=> d!110073 (= c!93847 (and (is-Cons!17627 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (bvslt (_1!5933 (h!18764 (insertStrictlySorted!303 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!110073 (isStrictlySorted!482 (insertStrictlySorted!303 l!906 key1!49 v1!38))))

(assert (=> d!110073 (= (insertStrictlySorted!303 (insertStrictlySorted!303 l!906 key1!49 v1!38) key1!49 v2!16) lt!401516)))

(declare-fun b!887634 () Bool)

(declare-fun e!494195 () List!17631)

(assert (=> b!887634 (= e!494195 call!39335)))

(declare-fun bm!39333 () Bool)

(declare-fun $colon$colon!549 (List!17631 tuple2!11844) List!17631)

(assert (=> bm!39333 (= call!39336 ($colon$colon!549 e!494196 (ite c!93847 (h!18764 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (tuple2!11845 key1!49 v2!16))))))

(declare-fun c!93846 () Bool)

(assert (=> bm!39333 (= c!93846 c!93847)))

(declare-fun b!887635 () Bool)

(declare-fun e!494199 () List!17631)

(declare-fun call!39337 () List!17631)

(assert (=> b!887635 (= e!494199 call!39337)))

(declare-fun b!887636 () Bool)

(assert (=> b!887636 (= e!494196 (insertStrictlySorted!303 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!887637 () Bool)

(assert (=> b!887637 (= e!494199 call!39337)))

(declare-fun b!887638 () Bool)

(declare-fun res!602253 () Bool)

(assert (=> b!887638 (=> (not res!602253) (not e!494198))))

(declare-fun containsKey!417 (List!17631 (_ BitVec 64)) Bool)

(assert (=> b!887638 (= res!602253 (containsKey!417 lt!401516 key1!49))))

(declare-fun b!887639 () Bool)

(assert (=> b!887639 (= e!494197 e!494195)))

(assert (=> b!887639 (= c!93848 (and (is-Cons!17627 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (= (_1!5933 (h!18764 (insertStrictlySorted!303 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun bm!39334 () Bool)

(assert (=> bm!39334 (= call!39337 call!39335)))

(declare-fun b!887640 () Bool)

(assert (=> b!887640 (= e!494197 call!39336)))

(declare-fun b!887641 () Bool)

(assert (=> b!887641 (= c!93845 (and (is-Cons!17627 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (bvsgt (_1!5933 (h!18764 (insertStrictlySorted!303 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> b!887641 (= e!494195 e!494199)))

(assert (= (and d!110073 c!93847) b!887640))

(assert (= (and d!110073 (not c!93847)) b!887639))

(assert (= (and b!887639 c!93848) b!887634))

(assert (= (and b!887639 (not c!93848)) b!887641))

(assert (= (and b!887641 c!93845) b!887635))

(assert (= (and b!887641 (not c!93845)) b!887637))

(assert (= (or b!887635 b!887637) bm!39334))

(assert (= (or b!887634 bm!39334) bm!39332))

(assert (= (or b!887640 bm!39332) bm!39333))

(assert (= (and bm!39333 c!93846) b!887636))

(assert (= (and bm!39333 (not c!93846)) b!887633))

(assert (= (and d!110073 res!602252) b!887638))

(assert (= (and b!887638 res!602253) b!887632))

(declare-fun m!827857 () Bool)

(assert (=> b!887632 m!827857))

(declare-fun m!827861 () Bool)

(assert (=> bm!39333 m!827861))

(declare-fun m!827865 () Bool)

(assert (=> b!887638 m!827865))

(declare-fun m!827869 () Bool)

(assert (=> b!887636 m!827869))

(declare-fun m!827873 () Bool)

(assert (=> d!110073 m!827873))

(assert (=> d!110073 m!827795))

(declare-fun m!827875 () Bool)

(assert (=> d!110073 m!827875))

(assert (=> b!887514 d!110073))

(declare-fun e!494208 () Bool)

(declare-fun lt!401518 () List!17631)

(declare-fun b!887652 () Bool)

(assert (=> b!887652 (= e!494208 (contains!4279 lt!401518 (tuple2!11845 key1!49 v1!38)))))

(declare-fun c!93856 () Bool)

(declare-fun c!93853 () Bool)

(declare-fun b!887653 () Bool)

(declare-fun e!494206 () List!17631)

(assert (=> b!887653 (= e!494206 (ite c!93856 (t!24903 l!906) (ite c!93853 (Cons!17627 (h!18764 l!906) (t!24903 l!906)) Nil!17628)))))

(declare-fun bm!39338 () Bool)

(declare-fun call!39341 () List!17631)

(declare-fun call!39342 () List!17631)

(assert (=> bm!39338 (= call!39341 call!39342)))

(declare-fun d!110085 () Bool)

(assert (=> d!110085 e!494208))

(declare-fun res!602256 () Bool)

(assert (=> d!110085 (=> (not res!602256) (not e!494208))))

(assert (=> d!110085 (= res!602256 (isStrictlySorted!482 lt!401518))))

(declare-fun e!494207 () List!17631)

(assert (=> d!110085 (= lt!401518 e!494207)))

(declare-fun c!93855 () Bool)

(assert (=> d!110085 (= c!93855 (and (is-Cons!17627 l!906) (bvslt (_1!5933 (h!18764 l!906)) key1!49)))))

(assert (=> d!110085 (isStrictlySorted!482 l!906)))

(assert (=> d!110085 (= (insertStrictlySorted!303 l!906 key1!49 v1!38) lt!401518)))

(declare-fun b!887654 () Bool)

(declare-fun e!494205 () List!17631)

(assert (=> b!887654 (= e!494205 call!39341)))

(declare-fun bm!39339 () Bool)

(assert (=> bm!39339 (= call!39342 ($colon$colon!549 e!494206 (ite c!93855 (h!18764 l!906) (tuple2!11845 key1!49 v1!38))))))

(declare-fun c!93854 () Bool)

(assert (=> bm!39339 (= c!93854 c!93855)))

(declare-fun b!887655 () Bool)

(declare-fun e!494209 () List!17631)

(declare-fun call!39343 () List!17631)

(assert (=> b!887655 (= e!494209 call!39343)))

(declare-fun b!887656 () Bool)

(assert (=> b!887656 (= e!494206 (insertStrictlySorted!303 (t!24903 l!906) key1!49 v1!38))))

(declare-fun b!887657 () Bool)

(assert (=> b!887657 (= e!494209 call!39343)))

(declare-fun b!887658 () Bool)

(declare-fun res!602257 () Bool)

(assert (=> b!887658 (=> (not res!602257) (not e!494208))))

(assert (=> b!887658 (= res!602257 (containsKey!417 lt!401518 key1!49))))

(declare-fun b!887659 () Bool)

(assert (=> b!887659 (= e!494207 e!494205)))

(assert (=> b!887659 (= c!93856 (and (is-Cons!17627 l!906) (= (_1!5933 (h!18764 l!906)) key1!49)))))

(declare-fun bm!39340 () Bool)

(assert (=> bm!39340 (= call!39343 call!39341)))

(declare-fun b!887660 () Bool)

(assert (=> b!887660 (= e!494207 call!39342)))

(declare-fun b!887661 () Bool)

(assert (=> b!887661 (= c!93853 (and (is-Cons!17627 l!906) (bvsgt (_1!5933 (h!18764 l!906)) key1!49)))))

(assert (=> b!887661 (= e!494205 e!494209)))

(assert (= (and d!110085 c!93855) b!887660))

(assert (= (and d!110085 (not c!93855)) b!887659))

(assert (= (and b!887659 c!93856) b!887654))

(assert (= (and b!887659 (not c!93856)) b!887661))

(assert (= (and b!887661 c!93853) b!887655))

(assert (= (and b!887661 (not c!93853)) b!887657))

(assert (= (or b!887655 b!887657) bm!39340))

(assert (= (or b!887654 bm!39340) bm!39338))

(assert (= (or b!887660 bm!39338) bm!39339))

(assert (= (and bm!39339 c!93854) b!887656))

(assert (= (and bm!39339 (not c!93854)) b!887653))

(assert (= (and d!110085 res!602256) b!887658))

(assert (= (and b!887658 res!602257) b!887652))

(declare-fun m!827879 () Bool)

(assert (=> b!887652 m!827879))

(declare-fun m!827881 () Bool)

(assert (=> bm!39339 m!827881))

(declare-fun m!827883 () Bool)

(assert (=> b!887658 m!827883))

(declare-fun m!827885 () Bool)

(assert (=> b!887656 m!827885))

(declare-fun m!827887 () Bool)

(assert (=> d!110085 m!827887))

(assert (=> d!110085 m!827793))

(assert (=> b!887514 d!110085))

(declare-fun b!887666 () Bool)

(declare-fun lt!401519 () List!17631)

(declare-fun e!494217 () Bool)

(assert (=> b!887666 (= e!494217 (contains!4279 lt!401519 (tuple2!11845 key1!49 v2!16)))))

(declare-fun e!494215 () List!17631)

(declare-fun c!93860 () Bool)

(declare-fun c!93857 () Bool)

(declare-fun b!887667 () Bool)

(assert (=> b!887667 (= e!494215 (ite c!93860 (t!24903 l!906) (ite c!93857 (Cons!17627 (h!18764 l!906) (t!24903 l!906)) Nil!17628)))))

(declare-fun bm!39341 () Bool)

(declare-fun call!39344 () List!17631)

(declare-fun call!39345 () List!17631)

(assert (=> bm!39341 (= call!39344 call!39345)))

(declare-fun d!110089 () Bool)

(assert (=> d!110089 e!494217))

(declare-fun res!602262 () Bool)

(assert (=> d!110089 (=> (not res!602262) (not e!494217))))

(assert (=> d!110089 (= res!602262 (isStrictlySorted!482 lt!401519))))

(declare-fun e!494216 () List!17631)

(assert (=> d!110089 (= lt!401519 e!494216)))

(declare-fun c!93859 () Bool)

(assert (=> d!110089 (= c!93859 (and (is-Cons!17627 l!906) (bvslt (_1!5933 (h!18764 l!906)) key1!49)))))

(assert (=> d!110089 (isStrictlySorted!482 l!906)))

(assert (=> d!110089 (= (insertStrictlySorted!303 l!906 key1!49 v2!16) lt!401519)))

(declare-fun b!887668 () Bool)

(declare-fun e!494214 () List!17631)

(assert (=> b!887668 (= e!494214 call!39344)))

(declare-fun bm!39342 () Bool)

(assert (=> bm!39342 (= call!39345 ($colon$colon!549 e!494215 (ite c!93859 (h!18764 l!906) (tuple2!11845 key1!49 v2!16))))))

(declare-fun c!93858 () Bool)

(assert (=> bm!39342 (= c!93858 c!93859)))

(declare-fun b!887669 () Bool)

(declare-fun e!494218 () List!17631)

(declare-fun call!39346 () List!17631)

(assert (=> b!887669 (= e!494218 call!39346)))

(declare-fun b!887670 () Bool)

(assert (=> b!887670 (= e!494215 (insertStrictlySorted!303 (t!24903 l!906) key1!49 v2!16))))

(declare-fun b!887671 () Bool)

(assert (=> b!887671 (= e!494218 call!39346)))

(declare-fun b!887672 () Bool)

(declare-fun res!602263 () Bool)

(assert (=> b!887672 (=> (not res!602263) (not e!494217))))

(assert (=> b!887672 (= res!602263 (containsKey!417 lt!401519 key1!49))))

(declare-fun b!887673 () Bool)

(assert (=> b!887673 (= e!494216 e!494214)))

(assert (=> b!887673 (= c!93860 (and (is-Cons!17627 l!906) (= (_1!5933 (h!18764 l!906)) key1!49)))))

(declare-fun bm!39343 () Bool)

(assert (=> bm!39343 (= call!39346 call!39344)))

(declare-fun b!887674 () Bool)

(assert (=> b!887674 (= e!494216 call!39345)))

(declare-fun b!887675 () Bool)

(assert (=> b!887675 (= c!93857 (and (is-Cons!17627 l!906) (bvsgt (_1!5933 (h!18764 l!906)) key1!49)))))

(assert (=> b!887675 (= e!494214 e!494218)))

(assert (= (and d!110089 c!93859) b!887674))

(assert (= (and d!110089 (not c!93859)) b!887673))

(assert (= (and b!887673 c!93860) b!887668))

(assert (= (and b!887673 (not c!93860)) b!887675))

(assert (= (and b!887675 c!93857) b!887669))

(assert (= (and b!887675 (not c!93857)) b!887671))

(assert (= (or b!887669 b!887671) bm!39343))

(assert (= (or b!887668 bm!39343) bm!39341))

(assert (= (or b!887674 bm!39341) bm!39342))

(assert (= (and bm!39342 c!93858) b!887670))

(assert (= (and bm!39342 (not c!93858)) b!887667))

(assert (= (and d!110089 res!602262) b!887672))

(assert (= (and b!887672 res!602263) b!887666))

(declare-fun m!827891 () Bool)

(assert (=> b!887666 m!827891))

(declare-fun m!827893 () Bool)

(assert (=> bm!39342 m!827893))

(declare-fun m!827895 () Bool)

(assert (=> b!887672 m!827895))

(declare-fun m!827897 () Bool)

(assert (=> b!887670 m!827897))

(declare-fun m!827899 () Bool)

(assert (=> d!110089 m!827899))

(assert (=> d!110089 m!827793))

(assert (=> b!887514 d!110089))

(declare-fun b!887693 () Bool)

(declare-fun e!494232 () Bool)

(declare-fun tp!54399 () Bool)

(assert (=> b!887693 (= e!494232 (and tp_is_empty!17819 tp!54399))))

(assert (=> b!887515 (= tp!54393 e!494232)))

(assert (= (and b!887515 (is-Cons!17627 (t!24903 l!906))) b!887693))

(push 1)

(assert (not d!110085))

(assert tp_is_empty!17819)

(assert (not b!887521))

(assert (not b!887638))

(assert (not b!887656))

(assert (not b!887632))

(assert (not b!887658))

(assert (not d!110089))

(assert (not d!110073))

(assert (not b!887672))

(assert (not b!887666))

(assert (not bm!39339))

(assert (not bm!39333))

(assert (not b!887693))

(assert (not b!887636))

(assert (not b!887670))

(assert (not bm!39342))

(assert (not b!887652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!110125 () Bool)

(declare-fun lt!401530 () Bool)

(declare-fun content!397 (List!17631) (Set tuple2!11844))

(assert (=> d!110125 (= lt!401530 (set.member (tuple2!11845 key1!49 v1!38) (content!397 lt!401518)))))

(declare-fun e!494286 () Bool)

(assert (=> d!110125 (= lt!401530 e!494286)))

(declare-fun res!602313 () Bool)

(assert (=> d!110125 (=> (not res!602313) (not e!494286))))

(assert (=> d!110125 (= res!602313 (is-Cons!17627 lt!401518))))

(assert (=> d!110125 (= (contains!4279 lt!401518 (tuple2!11845 key1!49 v1!38)) lt!401530)))

(declare-fun b!887764 () Bool)

(declare-fun e!494287 () Bool)

(assert (=> b!887764 (= e!494286 e!494287)))

(declare-fun res!602312 () Bool)

(assert (=> b!887764 (=> res!602312 e!494287)))

(assert (=> b!887764 (= res!602312 (= (h!18764 lt!401518) (tuple2!11845 key1!49 v1!38)))))

(declare-fun b!887765 () Bool)

(assert (=> b!887765 (= e!494287 (contains!4279 (t!24903 lt!401518) (tuple2!11845 key1!49 v1!38)))))

(assert (= (and d!110125 res!602313) b!887764))

(assert (= (and b!887764 (not res!602312)) b!887765))

(declare-fun m!827967 () Bool)

(assert (=> d!110125 m!827967))

(declare-fun m!827969 () Bool)

(assert (=> d!110125 m!827969))

(declare-fun m!827971 () Bool)

(assert (=> b!887765 m!827971))

(assert (=> b!887652 d!110125))

(declare-fun d!110127 () Bool)

(assert (=> d!110127 (= ($colon$colon!549 e!494196 (ite c!93847 (h!18764 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (tuple2!11845 key1!49 v2!16))) (Cons!17627 (ite c!93847 (h!18764 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (tuple2!11845 key1!49 v2!16)) e!494196))))

(assert (=> bm!39333 d!110127))

(declare-fun lt!401531 () Bool)

(declare-fun d!110129 () Bool)

(assert (=> d!110129 (= lt!401531 (set.member (tuple2!11845 key1!49 v2!16) (content!397 lt!401519)))))

(declare-fun e!494288 () Bool)

(assert (=> d!110129 (= lt!401531 e!494288)))

(declare-fun res!602315 () Bool)

(assert (=> d!110129 (=> (not res!602315) (not e!494288))))

(assert (=> d!110129 (= res!602315 (is-Cons!17627 lt!401519))))

(assert (=> d!110129 (= (contains!4279 lt!401519 (tuple2!11845 key1!49 v2!16)) lt!401531)))

(declare-fun b!887766 () Bool)

(declare-fun e!494289 () Bool)

(assert (=> b!887766 (= e!494288 e!494289)))

(declare-fun res!602314 () Bool)

(assert (=> b!887766 (=> res!602314 e!494289)))

(assert (=> b!887766 (= res!602314 (= (h!18764 lt!401519) (tuple2!11845 key1!49 v2!16)))))

(declare-fun b!887767 () Bool)

(assert (=> b!887767 (= e!494289 (contains!4279 (t!24903 lt!401519) (tuple2!11845 key1!49 v2!16)))))

(assert (= (and d!110129 res!602315) b!887766))

(assert (= (and b!887766 (not res!602314)) b!887767))

(declare-fun m!827973 () Bool)

(assert (=> d!110129 m!827973))

(declare-fun m!827975 () Bool)

(assert (=> d!110129 m!827975))

(declare-fun m!827977 () Bool)

(assert (=> b!887767 m!827977))

(assert (=> b!887666 d!110129))

(declare-fun d!110131 () Bool)

(declare-fun res!602316 () Bool)

(declare-fun e!494290 () Bool)

(assert (=> d!110131 (=> res!602316 e!494290)))

(assert (=> d!110131 (= res!602316 (or (is-Nil!17628 (t!24903 l!906)) (is-Nil!17628 (t!24903 (t!24903 l!906)))))))

(assert (=> d!110131 (= (isStrictlySorted!482 (t!24903 l!906)) e!494290)))

(declare-fun b!887768 () Bool)

(declare-fun e!494291 () Bool)

(assert (=> b!887768 (= e!494290 e!494291)))

(declare-fun res!602317 () Bool)

(assert (=> b!887768 (=> (not res!602317) (not e!494291))))

(assert (=> b!887768 (= res!602317 (bvslt (_1!5933 (h!18764 (t!24903 l!906))) (_1!5933 (h!18764 (t!24903 (t!24903 l!906))))))))

(declare-fun b!887769 () Bool)

(assert (=> b!887769 (= e!494291 (isStrictlySorted!482 (t!24903 (t!24903 l!906))))))

(assert (= (and d!110131 (not res!602316)) b!887768))

(assert (= (and b!887768 res!602317) b!887769))

(declare-fun m!827979 () Bool)

(assert (=> b!887769 m!827979))

(assert (=> b!887521 d!110131))

(declare-fun lt!401532 () Bool)

(declare-fun d!110133 () Bool)

(assert (=> d!110133 (= lt!401532 (set.member (tuple2!11845 key1!49 v2!16) (content!397 lt!401516)))))

(declare-fun e!494292 () Bool)

(assert (=> d!110133 (= lt!401532 e!494292)))

(declare-fun res!602319 () Bool)

(assert (=> d!110133 (=> (not res!602319) (not e!494292))))

(assert (=> d!110133 (= res!602319 (is-Cons!17627 lt!401516))))

(assert (=> d!110133 (= (contains!4279 lt!401516 (tuple2!11845 key1!49 v2!16)) lt!401532)))

(declare-fun b!887770 () Bool)

(declare-fun e!494293 () Bool)

(assert (=> b!887770 (= e!494292 e!494293)))

(declare-fun res!602318 () Bool)

(assert (=> b!887770 (=> res!602318 e!494293)))

(assert (=> b!887770 (= res!602318 (= (h!18764 lt!401516) (tuple2!11845 key1!49 v2!16)))))

(declare-fun b!887771 () Bool)

(assert (=> b!887771 (= e!494293 (contains!4279 (t!24903 lt!401516) (tuple2!11845 key1!49 v2!16)))))

(assert (= (and d!110133 res!602319) b!887770))

(assert (= (and b!887770 (not res!602318)) b!887771))

(declare-fun m!827981 () Bool)

(assert (=> d!110133 m!827981))

(declare-fun m!827983 () Bool)

(assert (=> d!110133 m!827983))

(declare-fun m!827985 () Bool)

(assert (=> b!887771 m!827985))

(assert (=> b!887632 d!110133))

(declare-fun d!110135 () Bool)

(declare-fun res!602324 () Bool)

(declare-fun e!494298 () Bool)

(assert (=> d!110135 (=> res!602324 e!494298)))

(assert (=> d!110135 (= res!602324 (and (is-Cons!17627 lt!401518) (= (_1!5933 (h!18764 lt!401518)) key1!49)))))

(assert (=> d!110135 (= (containsKey!417 lt!401518 key1!49) e!494298)))

(declare-fun b!887776 () Bool)

(declare-fun e!494299 () Bool)

(assert (=> b!887776 (= e!494298 e!494299)))

(declare-fun res!602325 () Bool)

(assert (=> b!887776 (=> (not res!602325) (not e!494299))))

(assert (=> b!887776 (= res!602325 (and (or (not (is-Cons!17627 lt!401518)) (bvsle (_1!5933 (h!18764 lt!401518)) key1!49)) (is-Cons!17627 lt!401518) (bvslt (_1!5933 (h!18764 lt!401518)) key1!49)))))

(declare-fun b!887777 () Bool)

(assert (=> b!887777 (= e!494299 (containsKey!417 (t!24903 lt!401518) key1!49))))

(assert (= (and d!110135 (not res!602324)) b!887776))

(assert (= (and b!887776 res!602325) b!887777))

(declare-fun m!827987 () Bool)

(assert (=> b!887777 m!827987))

(assert (=> b!887658 d!110135))

(declare-fun d!110137 () Bool)

(declare-fun res!602326 () Bool)

(declare-fun e!494300 () Bool)

(assert (=> d!110137 (=> res!602326 e!494300)))

(assert (=> d!110137 (= res!602326 (and (is-Cons!17627 lt!401516) (= (_1!5933 (h!18764 lt!401516)) key1!49)))))

(assert (=> d!110137 (= (containsKey!417 lt!401516 key1!49) e!494300)))

(declare-fun b!887778 () Bool)

(declare-fun e!494301 () Bool)

(assert (=> b!887778 (= e!494300 e!494301)))

(declare-fun res!602327 () Bool)

(assert (=> b!887778 (=> (not res!602327) (not e!494301))))

(assert (=> b!887778 (= res!602327 (and (or (not (is-Cons!17627 lt!401516)) (bvsle (_1!5933 (h!18764 lt!401516)) key1!49)) (is-Cons!17627 lt!401516) (bvslt (_1!5933 (h!18764 lt!401516)) key1!49)))))

(declare-fun b!887779 () Bool)

(assert (=> b!887779 (= e!494301 (containsKey!417 (t!24903 lt!401516) key1!49))))

(assert (= (and d!110137 (not res!602326)) b!887778))

(assert (= (and b!887778 res!602327) b!887779))

(declare-fun m!827989 () Bool)

(assert (=> b!887779 m!827989))

(assert (=> b!887638 d!110137))

(declare-fun d!110139 () Bool)

(declare-fun res!602328 () Bool)

(declare-fun e!494302 () Bool)

(assert (=> d!110139 (=> res!602328 e!494302)))

(assert (=> d!110139 (= res!602328 (and (is-Cons!17627 lt!401519) (= (_1!5933 (h!18764 lt!401519)) key1!49)))))

(assert (=> d!110139 (= (containsKey!417 lt!401519 key1!49) e!494302)))

(declare-fun b!887780 () Bool)

(declare-fun e!494303 () Bool)

(assert (=> b!887780 (= e!494302 e!494303)))

(declare-fun res!602329 () Bool)

(assert (=> b!887780 (=> (not res!602329) (not e!494303))))

(assert (=> b!887780 (= res!602329 (and (or (not (is-Cons!17627 lt!401519)) (bvsle (_1!5933 (h!18764 lt!401519)) key1!49)) (is-Cons!17627 lt!401519) (bvslt (_1!5933 (h!18764 lt!401519)) key1!49)))))

(declare-fun b!887781 () Bool)

(assert (=> b!887781 (= e!494303 (containsKey!417 (t!24903 lt!401519) key1!49))))

(assert (= (and d!110139 (not res!602328)) b!887780))

(assert (= (and b!887780 res!602329) b!887781))

(declare-fun m!827991 () Bool)

(assert (=> b!887781 m!827991))

(assert (=> b!887672 d!110139))

(declare-fun b!887782 () Bool)

(declare-fun lt!401533 () List!17631)

(declare-fun e!494307 () Bool)

(assert (=> b!887782 (= e!494307 (contains!4279 lt!401533 (tuple2!11845 key1!49 v1!38)))))

(declare-fun c!93876 () Bool)

(declare-fun c!93873 () Bool)

(declare-fun b!887783 () Bool)

(declare-fun e!494305 () List!17631)

(assert (=> b!887783 (= e!494305 (ite c!93876 (t!24903 (t!24903 l!906)) (ite c!93873 (Cons!17627 (h!18764 (t!24903 l!906)) (t!24903 (t!24903 l!906))) Nil!17628)))))

(declare-fun bm!39353 () Bool)

(declare-fun call!39356 () List!17631)

(declare-fun call!39357 () List!17631)

(assert (=> bm!39353 (= call!39356 call!39357)))

(declare-fun d!110141 () Bool)

(assert (=> d!110141 e!494307))

(declare-fun res!602330 () Bool)

(assert (=> d!110141 (=> (not res!602330) (not e!494307))))

(assert (=> d!110141 (= res!602330 (isStrictlySorted!482 lt!401533))))

(declare-fun e!494306 () List!17631)

(assert (=> d!110141 (= lt!401533 e!494306)))

(declare-fun c!93875 () Bool)

(assert (=> d!110141 (= c!93875 (and (is-Cons!17627 (t!24903 l!906)) (bvslt (_1!5933 (h!18764 (t!24903 l!906))) key1!49)))))

(assert (=> d!110141 (isStrictlySorted!482 (t!24903 l!906))))

(assert (=> d!110141 (= (insertStrictlySorted!303 (t!24903 l!906) key1!49 v1!38) lt!401533)))

(declare-fun b!887784 () Bool)

(declare-fun e!494304 () List!17631)

(assert (=> b!887784 (= e!494304 call!39356)))

(declare-fun bm!39354 () Bool)

(assert (=> bm!39354 (= call!39357 ($colon$colon!549 e!494305 (ite c!93875 (h!18764 (t!24903 l!906)) (tuple2!11845 key1!49 v1!38))))))

(declare-fun c!93874 () Bool)

(assert (=> bm!39354 (= c!93874 c!93875)))

(declare-fun b!887785 () Bool)

(declare-fun e!494308 () List!17631)

(declare-fun call!39358 () List!17631)

(assert (=> b!887785 (= e!494308 call!39358)))

(declare-fun b!887786 () Bool)

(assert (=> b!887786 (= e!494305 (insertStrictlySorted!303 (t!24903 (t!24903 l!906)) key1!49 v1!38))))

(declare-fun b!887787 () Bool)

(assert (=> b!887787 (= e!494308 call!39358)))

(declare-fun b!887788 () Bool)

(declare-fun res!602331 () Bool)

(assert (=> b!887788 (=> (not res!602331) (not e!494307))))

(assert (=> b!887788 (= res!602331 (containsKey!417 lt!401533 key1!49))))

(declare-fun b!887789 () Bool)

(assert (=> b!887789 (= e!494306 e!494304)))

(assert (=> b!887789 (= c!93876 (and (is-Cons!17627 (t!24903 l!906)) (= (_1!5933 (h!18764 (t!24903 l!906))) key1!49)))))

(declare-fun bm!39355 () Bool)

(assert (=> bm!39355 (= call!39358 call!39356)))

(declare-fun b!887790 () Bool)

(assert (=> b!887790 (= e!494306 call!39357)))

(declare-fun b!887791 () Bool)

(assert (=> b!887791 (= c!93873 (and (is-Cons!17627 (t!24903 l!906)) (bvsgt (_1!5933 (h!18764 (t!24903 l!906))) key1!49)))))

(assert (=> b!887791 (= e!494304 e!494308)))

(assert (= (and d!110141 c!93875) b!887790))

(assert (= (and d!110141 (not c!93875)) b!887789))

(assert (= (and b!887789 c!93876) b!887784))

(assert (= (and b!887789 (not c!93876)) b!887791))

(assert (= (and b!887791 c!93873) b!887785))

(assert (= (and b!887791 (not c!93873)) b!887787))

(assert (= (or b!887785 b!887787) bm!39355))

(assert (= (or b!887784 bm!39355) bm!39353))

(assert (= (or b!887790 bm!39353) bm!39354))

(assert (= (and bm!39354 c!93874) b!887786))

(assert (= (and bm!39354 (not c!93874)) b!887783))

(assert (= (and d!110141 res!602330) b!887788))

(assert (= (and b!887788 res!602331) b!887782))

(declare-fun m!827993 () Bool)

(assert (=> b!887782 m!827993))

(declare-fun m!827995 () Bool)

(assert (=> bm!39354 m!827995))

(declare-fun m!827997 () Bool)

(assert (=> b!887788 m!827997))

(declare-fun m!827999 () Bool)

(assert (=> b!887786 m!827999))

(declare-fun m!828001 () Bool)

(assert (=> d!110141 m!828001))

(assert (=> d!110141 m!827801))

(assert (=> b!887656 d!110141))

(declare-fun d!110143 () Bool)

(assert (=> d!110143 (= ($colon$colon!549 e!494215 (ite c!93859 (h!18764 l!906) (tuple2!11845 key1!49 v2!16))) (Cons!17627 (ite c!93859 (h!18764 l!906) (tuple2!11845 key1!49 v2!16)) e!494215))))

(assert (=> bm!39342 d!110143))

(declare-fun d!110145 () Bool)

(declare-fun res!602332 () Bool)

(declare-fun e!494309 () Bool)

(assert (=> d!110145 (=> res!602332 e!494309)))

(assert (=> d!110145 (= res!602332 (or (is-Nil!17628 lt!401516) (is-Nil!17628 (t!24903 lt!401516))))))

(assert (=> d!110145 (= (isStrictlySorted!482 lt!401516) e!494309)))

(declare-fun b!887792 () Bool)

(declare-fun e!494310 () Bool)

(assert (=> b!887792 (= e!494309 e!494310)))

(declare-fun res!602333 () Bool)

(assert (=> b!887792 (=> (not res!602333) (not e!494310))))

(assert (=> b!887792 (= res!602333 (bvslt (_1!5933 (h!18764 lt!401516)) (_1!5933 (h!18764 (t!24903 lt!401516)))))))

(declare-fun b!887793 () Bool)

(assert (=> b!887793 (= e!494310 (isStrictlySorted!482 (t!24903 lt!401516)))))

(assert (= (and d!110145 (not res!602332)) b!887792))

(assert (= (and b!887792 res!602333) b!887793))

(declare-fun m!828003 () Bool)

(assert (=> b!887793 m!828003))

(assert (=> d!110073 d!110145))

(declare-fun d!110147 () Bool)

(declare-fun res!602334 () Bool)

(declare-fun e!494311 () Bool)

(assert (=> d!110147 (=> res!602334 e!494311)))

(assert (=> d!110147 (= res!602334 (or (is-Nil!17628 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (is-Nil!17628 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)))))))

(assert (=> d!110147 (= (isStrictlySorted!482 (insertStrictlySorted!303 l!906 key1!49 v1!38)) e!494311)))

(declare-fun b!887794 () Bool)

(declare-fun e!494312 () Bool)

(assert (=> b!887794 (= e!494311 e!494312)))

(declare-fun res!602335 () Bool)

(assert (=> b!887794 (=> (not res!602335) (not e!494312))))

(assert (=> b!887794 (= res!602335 (bvslt (_1!5933 (h!18764 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (_1!5933 (h!18764 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))))))))

(declare-fun b!887795 () Bool)

(assert (=> b!887795 (= e!494312 (isStrictlySorted!482 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))))))

(assert (= (and d!110147 (not res!602334)) b!887794))

(assert (= (and b!887794 res!602335) b!887795))

(declare-fun m!828005 () Bool)

(assert (=> b!887795 m!828005))

(assert (=> d!110073 d!110147))

(declare-fun e!494316 () Bool)

(declare-fun lt!401534 () List!17631)

(declare-fun b!887796 () Bool)

(assert (=> b!887796 (= e!494316 (contains!4279 lt!401534 (tuple2!11845 key1!49 v2!16)))))

(declare-fun c!93877 () Bool)

(declare-fun e!494314 () List!17631)

(declare-fun b!887797 () Bool)

(declare-fun c!93880 () Bool)

(assert (=> b!887797 (= e!494314 (ite c!93880 (t!24903 (t!24903 l!906)) (ite c!93877 (Cons!17627 (h!18764 (t!24903 l!906)) (t!24903 (t!24903 l!906))) Nil!17628)))))

(declare-fun bm!39356 () Bool)

(declare-fun call!39359 () List!17631)

(declare-fun call!39360 () List!17631)

(assert (=> bm!39356 (= call!39359 call!39360)))

(declare-fun d!110149 () Bool)

(assert (=> d!110149 e!494316))

(declare-fun res!602336 () Bool)

(assert (=> d!110149 (=> (not res!602336) (not e!494316))))

(assert (=> d!110149 (= res!602336 (isStrictlySorted!482 lt!401534))))

(declare-fun e!494315 () List!17631)

(assert (=> d!110149 (= lt!401534 e!494315)))

(declare-fun c!93879 () Bool)

(assert (=> d!110149 (= c!93879 (and (is-Cons!17627 (t!24903 l!906)) (bvslt (_1!5933 (h!18764 (t!24903 l!906))) key1!49)))))

(assert (=> d!110149 (isStrictlySorted!482 (t!24903 l!906))))

(assert (=> d!110149 (= (insertStrictlySorted!303 (t!24903 l!906) key1!49 v2!16) lt!401534)))

(declare-fun b!887798 () Bool)

(declare-fun e!494313 () List!17631)

(assert (=> b!887798 (= e!494313 call!39359)))

(declare-fun bm!39357 () Bool)

(assert (=> bm!39357 (= call!39360 ($colon$colon!549 e!494314 (ite c!93879 (h!18764 (t!24903 l!906)) (tuple2!11845 key1!49 v2!16))))))

(declare-fun c!93878 () Bool)

(assert (=> bm!39357 (= c!93878 c!93879)))

(declare-fun b!887799 () Bool)

(declare-fun e!494317 () List!17631)

(declare-fun call!39361 () List!17631)

(assert (=> b!887799 (= e!494317 call!39361)))

(declare-fun b!887800 () Bool)

(assert (=> b!887800 (= e!494314 (insertStrictlySorted!303 (t!24903 (t!24903 l!906)) key1!49 v2!16))))

(declare-fun b!887801 () Bool)

(assert (=> b!887801 (= e!494317 call!39361)))

(declare-fun b!887802 () Bool)

(declare-fun res!602337 () Bool)

(assert (=> b!887802 (=> (not res!602337) (not e!494316))))

(assert (=> b!887802 (= res!602337 (containsKey!417 lt!401534 key1!49))))

(declare-fun b!887803 () Bool)

(assert (=> b!887803 (= e!494315 e!494313)))

(assert (=> b!887803 (= c!93880 (and (is-Cons!17627 (t!24903 l!906)) (= (_1!5933 (h!18764 (t!24903 l!906))) key1!49)))))

(declare-fun bm!39358 () Bool)

(assert (=> bm!39358 (= call!39361 call!39359)))

(declare-fun b!887804 () Bool)

(assert (=> b!887804 (= e!494315 call!39360)))

(declare-fun b!887805 () Bool)

(assert (=> b!887805 (= c!93877 (and (is-Cons!17627 (t!24903 l!906)) (bvsgt (_1!5933 (h!18764 (t!24903 l!906))) key1!49)))))

(assert (=> b!887805 (= e!494313 e!494317)))

(assert (= (and d!110149 c!93879) b!887804))

(assert (= (and d!110149 (not c!93879)) b!887803))

(assert (= (and b!887803 c!93880) b!887798))

(assert (= (and b!887803 (not c!93880)) b!887805))

(assert (= (and b!887805 c!93877) b!887799))

(assert (= (and b!887805 (not c!93877)) b!887801))

(assert (= (or b!887799 b!887801) bm!39358))

(assert (= (or b!887798 bm!39358) bm!39356))

(assert (= (or b!887804 bm!39356) bm!39357))

(assert (= (and bm!39357 c!93878) b!887800))

(assert (= (and bm!39357 (not c!93878)) b!887797))

(assert (= (and d!110149 res!602336) b!887802))

(assert (= (and b!887802 res!602337) b!887796))

(declare-fun m!828007 () Bool)

(assert (=> b!887796 m!828007))

(declare-fun m!828009 () Bool)

(assert (=> bm!39357 m!828009))

(declare-fun m!828011 () Bool)

(assert (=> b!887802 m!828011))

(declare-fun m!828013 () Bool)

(assert (=> b!887800 m!828013))

(declare-fun m!828015 () Bool)

(assert (=> d!110149 m!828015))

(assert (=> d!110149 m!827801))

(assert (=> b!887670 d!110149))

(declare-fun d!110151 () Bool)

(declare-fun res!602338 () Bool)

(declare-fun e!494318 () Bool)

(assert (=> d!110151 (=> res!602338 e!494318)))

(assert (=> d!110151 (= res!602338 (or (is-Nil!17628 lt!401519) (is-Nil!17628 (t!24903 lt!401519))))))

(assert (=> d!110151 (= (isStrictlySorted!482 lt!401519) e!494318)))

(declare-fun b!887806 () Bool)

(declare-fun e!494319 () Bool)

(assert (=> b!887806 (= e!494318 e!494319)))

(declare-fun res!602339 () Bool)

(assert (=> b!887806 (=> (not res!602339) (not e!494319))))

(assert (=> b!887806 (= res!602339 (bvslt (_1!5933 (h!18764 lt!401519)) (_1!5933 (h!18764 (t!24903 lt!401519)))))))

(declare-fun b!887807 () Bool)

(assert (=> b!887807 (= e!494319 (isStrictlySorted!482 (t!24903 lt!401519)))))

(assert (= (and d!110151 (not res!602338)) b!887806))

(assert (= (and b!887806 res!602339) b!887807))

(declare-fun m!828017 () Bool)

(assert (=> b!887807 m!828017))

(assert (=> d!110089 d!110151))

(assert (=> d!110089 d!110069))

(declare-fun d!110153 () Bool)

(declare-fun res!602340 () Bool)

(declare-fun e!494320 () Bool)

(assert (=> d!110153 (=> res!602340 e!494320)))

(assert (=> d!110153 (= res!602340 (or (is-Nil!17628 lt!401518) (is-Nil!17628 (t!24903 lt!401518))))))

(assert (=> d!110153 (= (isStrictlySorted!482 lt!401518) e!494320)))

(declare-fun b!887808 () Bool)

(declare-fun e!494321 () Bool)

(assert (=> b!887808 (= e!494320 e!494321)))

(declare-fun res!602341 () Bool)

(assert (=> b!887808 (=> (not res!602341) (not e!494321))))

(assert (=> b!887808 (= res!602341 (bvslt (_1!5933 (h!18764 lt!401518)) (_1!5933 (h!18764 (t!24903 lt!401518)))))))

(declare-fun b!887809 () Bool)

(assert (=> b!887809 (= e!494321 (isStrictlySorted!482 (t!24903 lt!401518)))))

(assert (= (and d!110153 (not res!602340)) b!887808))

(assert (= (and b!887808 res!602341) b!887809))

(declare-fun m!828019 () Bool)

(assert (=> b!887809 m!828019))

(assert (=> d!110085 d!110153))

(assert (=> d!110085 d!110069))

(declare-fun d!110155 () Bool)

(assert (=> d!110155 (= ($colon$colon!549 e!494206 (ite c!93855 (h!18764 l!906) (tuple2!11845 key1!49 v1!38))) (Cons!17627 (ite c!93855 (h!18764 l!906) (tuple2!11845 key1!49 v1!38)) e!494206))))

(assert (=> bm!39339 d!110155))

(declare-fun e!494325 () Bool)

(declare-fun lt!401535 () List!17631)

(declare-fun b!887810 () Bool)

(assert (=> b!887810 (= e!494325 (contains!4279 lt!401535 (tuple2!11845 key1!49 v2!16)))))

(declare-fun b!887811 () Bool)

(declare-fun e!494323 () List!17631)

(declare-fun c!93884 () Bool)

(declare-fun c!93881 () Bool)

(assert (=> b!887811 (= e!494323 (ite c!93884 (t!24903 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (ite c!93881 (Cons!17627 (h!18764 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (t!24903 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)))) Nil!17628)))))

(declare-fun bm!39359 () Bool)

(declare-fun call!39362 () List!17631)

(declare-fun call!39363 () List!17631)

(assert (=> bm!39359 (= call!39362 call!39363)))

(declare-fun d!110157 () Bool)

(assert (=> d!110157 e!494325))

(declare-fun res!602342 () Bool)

(assert (=> d!110157 (=> (not res!602342) (not e!494325))))

(assert (=> d!110157 (= res!602342 (isStrictlySorted!482 lt!401535))))

(declare-fun e!494324 () List!17631)

(assert (=> d!110157 (= lt!401535 e!494324)))

(declare-fun c!93883 () Bool)

(assert (=> d!110157 (= c!93883 (and (is-Cons!17627 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (bvslt (_1!5933 (h!18764 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!110157 (isStrictlySorted!482 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)))))

(assert (=> d!110157 (= (insertStrictlySorted!303 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)) key1!49 v2!16) lt!401535)))

(declare-fun b!887812 () Bool)

(declare-fun e!494322 () List!17631)

(assert (=> b!887812 (= e!494322 call!39362)))

(declare-fun bm!39360 () Bool)

(assert (=> bm!39360 (= call!39363 ($colon$colon!549 e!494323 (ite c!93883 (h!18764 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (tuple2!11845 key1!49 v2!16))))))

(declare-fun c!93882 () Bool)

(assert (=> bm!39360 (= c!93882 c!93883)))

(declare-fun b!887813 () Bool)

(declare-fun e!494326 () List!17631)

(declare-fun call!39364 () List!17631)

(assert (=> b!887813 (= e!494326 call!39364)))

(declare-fun b!887814 () Bool)

(assert (=> b!887814 (= e!494323 (insertStrictlySorted!303 (t!24903 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun b!887815 () Bool)

(assert (=> b!887815 (= e!494326 call!39364)))

(declare-fun b!887816 () Bool)

(declare-fun res!602343 () Bool)

(assert (=> b!887816 (=> (not res!602343) (not e!494325))))

(assert (=> b!887816 (= res!602343 (containsKey!417 lt!401535 key1!49))))

(declare-fun b!887817 () Bool)

(assert (=> b!887817 (= e!494324 e!494322)))

(assert (=> b!887817 (= c!93884 (and (is-Cons!17627 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (= (_1!5933 (h!18764 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun bm!39361 () Bool)

(assert (=> bm!39361 (= call!39364 call!39362)))

(declare-fun b!887818 () Bool)

(assert (=> b!887818 (= e!494324 call!39363)))

(declare-fun b!887819 () Bool)

(assert (=> b!887819 (= c!93881 (and (is-Cons!17627 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (bvsgt (_1!5933 (h!18764 (t!24903 (insertStrictlySorted!303 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> b!887819 (= e!494322 e!494326)))

(assert (= (and d!110157 c!93883) b!887818))

(assert (= (and d!110157 (not c!93883)) b!887817))

(assert (= (and b!887817 c!93884) b!887812))

(assert (= (and b!887817 (not c!93884)) b!887819))

(assert (= (and b!887819 c!93881) b!887813))

(assert (= (and b!887819 (not c!93881)) b!887815))

(assert (= (or b!887813 b!887815) bm!39361))

(assert (= (or b!887812 bm!39361) bm!39359))

(assert (= (or b!887818 bm!39359) bm!39360))

(assert (= (and bm!39360 c!93882) b!887814))

(assert (= (and bm!39360 (not c!93882)) b!887811))

(assert (= (and d!110157 res!602342) b!887816))

(assert (= (and b!887816 res!602343) b!887810))

(declare-fun m!828021 () Bool)

(assert (=> b!887810 m!828021))

(declare-fun m!828023 () Bool)

(assert (=> bm!39360 m!828023))

(declare-fun m!828025 () Bool)

(assert (=> b!887816 m!828025))

(declare-fun m!828027 () Bool)

(assert (=> b!887814 m!828027))

(declare-fun m!828029 () Bool)

(assert (=> d!110157 m!828029))

(assert (=> d!110157 m!828005))

(assert (=> b!887636 d!110157))

(declare-fun b!887820 () Bool)

(declare-fun e!494327 () Bool)

(declare-fun tp!54404 () Bool)

(assert (=> b!887820 (= e!494327 (and tp_is_empty!17819 tp!54404))))

(assert (=> b!887693 (= tp!54399 e!494327)))

(assert (= (and b!887693 (is-Cons!17627 (t!24903 (t!24903 l!906)))) b!887820))

(push 1)

(assert (not b!887810))

(assert (not b!887769))

(assert (not b!887802))

(assert (not bm!39354))

(assert (not b!887777))

(assert (not d!110125))

(assert (not b!887816))

(assert (not b!887796))

(assert (not b!887795))

(assert (not b!887771))

(assert (not b!887782))

(assert (not b!887800))

(assert (not b!887765))

(assert (not b!887809))

(assert (not b!887807))

(assert (not b!887767))

(assert (not bm!39357))

(assert (not b!887786))

(assert tp_is_empty!17819)

(assert (not d!110157))

(assert (not b!887781))

(assert (not d!110149))

(assert (not b!887788))

(assert (not b!887779))

(assert (not bm!39360))

(assert (not b!887814))

(assert (not b!887820))

(assert (not d!110133))

(assert (not b!887793))

(assert (not d!110141))

(assert (not d!110129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

