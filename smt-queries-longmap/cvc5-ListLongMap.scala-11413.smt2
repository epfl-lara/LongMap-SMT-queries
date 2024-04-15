; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132904 () Bool)

(assert start!132904)

(declare-fun b!1556477 () Bool)

(declare-fun e!866930 () Bool)

(declare-fun e!866929 () Bool)

(assert (=> b!1556477 (= e!866930 e!866929)))

(declare-fun res!1064834 () Bool)

(assert (=> b!1556477 (=> res!1064834 e!866929)))

(declare-datatypes ((B!2358 0))(
  ( (B!2359 (val!19265 Int)) )
))
(declare-datatypes ((tuple2!24978 0))(
  ( (tuple2!24979 (_1!12500 (_ BitVec 64)) (_2!12500 B!2358)) )
))
(declare-datatypes ((List!36344 0))(
  ( (Nil!36341) (Cons!36340 (h!37787 tuple2!24978) (t!51060 List!36344)) )
))
(declare-fun lt!670177 () List!36344)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun l!1177 () List!36344)

(declare-fun containsKey!812 (List!36344 (_ BitVec 64)) Bool)

(assert (=> b!1556477 (= res!1064834 (not (= (containsKey!812 lt!670177 otherKey!50) (containsKey!812 l!1177 otherKey!50))))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2358)

(declare-fun insertStrictlySorted!555 (List!36344 (_ BitVec 64) B!2358) List!36344)

(assert (=> b!1556477 (= lt!670177 (insertStrictlySorted!555 l!1177 newKey!105 newValue!105))))

(declare-fun b!1556478 () Bool)

(declare-datatypes ((Option!858 0))(
  ( (Some!857 (v!22039 B!2358)) (None!856) )
))
(declare-fun getValueByKey!783 (List!36344 (_ BitVec 64)) Option!858)

(assert (=> b!1556478 (= e!866929 (not (= (getValueByKey!783 lt!670177 otherKey!50) (getValueByKey!783 l!1177 otherKey!50))))))

(declare-fun res!1064836 () Bool)

(assert (=> start!132904 (=> (not res!1064836) (not e!866930))))

(declare-fun isStrictlySorted!950 (List!36344) Bool)

(assert (=> start!132904 (= res!1064836 (isStrictlySorted!950 l!1177))))

(assert (=> start!132904 e!866930))

(declare-fun e!866928 () Bool)

(assert (=> start!132904 e!866928))

(assert (=> start!132904 true))

(declare-fun tp_is_empty!38369 () Bool)

(assert (=> start!132904 tp_is_empty!38369))

(declare-fun b!1556479 () Bool)

(declare-fun tp!112453 () Bool)

(assert (=> b!1556479 (= e!866928 (and tp_is_empty!38369 tp!112453))))

(declare-fun b!1556476 () Bool)

(declare-fun res!1064835 () Bool)

(assert (=> b!1556476 (=> (not res!1064835) (not e!866930))))

(assert (=> b!1556476 (= res!1064835 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36340 l!1177)) (= (_1!12500 (h!37787 l!1177)) otherKey!50))))))

(assert (= (and start!132904 res!1064836) b!1556476))

(assert (= (and b!1556476 res!1064835) b!1556477))

(assert (= (and b!1556477 (not res!1064834)) b!1556478))

(assert (= (and start!132904 (is-Cons!36340 l!1177)) b!1556479))

(declare-fun m!1433297 () Bool)

(assert (=> b!1556477 m!1433297))

(declare-fun m!1433299 () Bool)

(assert (=> b!1556477 m!1433299))

(declare-fun m!1433301 () Bool)

(assert (=> b!1556477 m!1433301))

(declare-fun m!1433303 () Bool)

(assert (=> b!1556478 m!1433303))

(declare-fun m!1433305 () Bool)

(assert (=> b!1556478 m!1433305))

(declare-fun m!1433307 () Bool)

(assert (=> start!132904 m!1433307))

(push 1)

(assert (not b!1556477))

(assert tp_is_empty!38369)

(assert (not b!1556479))

(assert (not start!132904))

(assert (not b!1556478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162047 () Bool)

(declare-fun res!1064849 () Bool)

(declare-fun e!866951 () Bool)

(assert (=> d!162047 (=> res!1064849 e!866951)))

(assert (=> d!162047 (= res!1064849 (and (is-Cons!36340 lt!670177) (= (_1!12500 (h!37787 lt!670177)) otherKey!50)))))

(assert (=> d!162047 (= (containsKey!812 lt!670177 otherKey!50) e!866951)))

(declare-fun b!1556508 () Bool)

(declare-fun e!866952 () Bool)

(assert (=> b!1556508 (= e!866951 e!866952)))

(declare-fun res!1064850 () Bool)

(assert (=> b!1556508 (=> (not res!1064850) (not e!866952))))

(assert (=> b!1556508 (= res!1064850 (and (or (not (is-Cons!36340 lt!670177)) (bvsle (_1!12500 (h!37787 lt!670177)) otherKey!50)) (is-Cons!36340 lt!670177) (bvslt (_1!12500 (h!37787 lt!670177)) otherKey!50)))))

(declare-fun b!1556509 () Bool)

(assert (=> b!1556509 (= e!866952 (containsKey!812 (t!51060 lt!670177) otherKey!50))))

(assert (= (and d!162047 (not res!1064849)) b!1556508))

(assert (= (and b!1556508 res!1064850) b!1556509))

(declare-fun m!1433317 () Bool)

(assert (=> b!1556509 m!1433317))

(assert (=> b!1556477 d!162047))

(declare-fun d!162057 () Bool)

(declare-fun res!1064851 () Bool)

(declare-fun e!866953 () Bool)

(assert (=> d!162057 (=> res!1064851 e!866953)))

(assert (=> d!162057 (= res!1064851 (and (is-Cons!36340 l!1177) (= (_1!12500 (h!37787 l!1177)) otherKey!50)))))

(assert (=> d!162057 (= (containsKey!812 l!1177 otherKey!50) e!866953)))

(declare-fun b!1556510 () Bool)

(declare-fun e!866954 () Bool)

(assert (=> b!1556510 (= e!866953 e!866954)))

(declare-fun res!1064852 () Bool)

(assert (=> b!1556510 (=> (not res!1064852) (not e!866954))))

(assert (=> b!1556510 (= res!1064852 (and (or (not (is-Cons!36340 l!1177)) (bvsle (_1!12500 (h!37787 l!1177)) otherKey!50)) (is-Cons!36340 l!1177) (bvslt (_1!12500 (h!37787 l!1177)) otherKey!50)))))

(declare-fun b!1556511 () Bool)

(assert (=> b!1556511 (= e!866954 (containsKey!812 (t!51060 l!1177) otherKey!50))))

(assert (= (and d!162057 (not res!1064851)) b!1556510))

(assert (= (and b!1556510 res!1064852) b!1556511))

(declare-fun m!1433319 () Bool)

(assert (=> b!1556511 m!1433319))

(assert (=> b!1556477 d!162057))

(declare-fun bm!71603 () Bool)

(declare-fun e!867004 () List!36344)

(declare-fun c!143798 () Bool)

(declare-fun call!71608 () List!36344)

(declare-fun $colon$colon!972 (List!36344 tuple2!24978) List!36344)

(assert (=> bm!71603 (= call!71608 ($colon$colon!972 e!867004 (ite c!143798 (h!37787 l!1177) (tuple2!24979 newKey!105 newValue!105))))))

(declare-fun c!143796 () Bool)

(assert (=> bm!71603 (= c!143796 c!143798)))

(declare-fun d!162059 () Bool)

(declare-fun e!867007 () Bool)

(assert (=> d!162059 e!867007))

(declare-fun res!1064878 () Bool)

(assert (=> d!162059 (=> (not res!1064878) (not e!867007))))

(declare-fun lt!670185 () List!36344)

(assert (=> d!162059 (= res!1064878 (isStrictlySorted!950 lt!670185))))

(declare-fun e!867008 () List!36344)

(assert (=> d!162059 (= lt!670185 e!867008)))

(assert (=> d!162059 (= c!143798 (and (is-Cons!36340 l!1177) (bvslt (_1!12500 (h!37787 l!1177)) newKey!105)))))

(assert (=> d!162059 (isStrictlySorted!950 l!1177)))

(assert (=> d!162059 (= (insertStrictlySorted!555 l!1177 newKey!105 newValue!105) lt!670185)))

(declare-fun b!1556596 () Bool)

(assert (=> b!1556596 (= e!867004 (insertStrictlySorted!555 (t!51060 l!1177) newKey!105 newValue!105))))

(declare-fun b!1556597 () Bool)

(assert (=> b!1556597 (= e!867008 call!71608)))

(declare-fun b!1556598 () Bool)

(declare-fun e!867006 () List!36344)

(declare-fun call!71607 () List!36344)

(assert (=> b!1556598 (= e!867006 call!71607)))

(declare-fun b!1556599 () Bool)

(declare-fun contains!10144 (List!36344 tuple2!24978) Bool)

(assert (=> b!1556599 (= e!867007 (contains!10144 lt!670185 (tuple2!24979 newKey!105 newValue!105)))))

(declare-fun b!1556600 () Bool)

(declare-fun res!1064877 () Bool)

(assert (=> b!1556600 (=> (not res!1064877) (not e!867007))))

(assert (=> b!1556600 (= res!1064877 (containsKey!812 lt!670185 newKey!105))))

(declare-fun c!143797 () Bool)

(declare-fun b!1556601 () Bool)

(declare-fun c!143799 () Bool)

(assert (=> b!1556601 (= e!867004 (ite c!143797 (t!51060 l!1177) (ite c!143799 (Cons!36340 (h!37787 l!1177) (t!51060 l!1177)) Nil!36341)))))

(declare-fun b!1556602 () Bool)

(assert (=> b!1556602 (= c!143799 (and (is-Cons!36340 l!1177) (bvsgt (_1!12500 (h!37787 l!1177)) newKey!105)))))

(declare-fun e!867005 () List!36344)

(assert (=> b!1556602 (= e!867005 e!867006)))

(declare-fun bm!71604 () Bool)

(declare-fun call!71606 () List!36344)

(assert (=> bm!71604 (= call!71606 call!71608)))

(declare-fun b!1556603 () Bool)

(assert (=> b!1556603 (= e!867006 call!71607)))

(declare-fun b!1556604 () Bool)

(assert (=> b!1556604 (= e!867005 call!71606)))

(declare-fun b!1556605 () Bool)

(assert (=> b!1556605 (= e!867008 e!867005)))

(assert (=> b!1556605 (= c!143797 (and (is-Cons!36340 l!1177) (= (_1!12500 (h!37787 l!1177)) newKey!105)))))

(declare-fun bm!71605 () Bool)

(assert (=> bm!71605 (= call!71607 call!71606)))

(assert (= (and d!162059 c!143798) b!1556597))

(assert (= (and d!162059 (not c!143798)) b!1556605))

(assert (= (and b!1556605 c!143797) b!1556604))

(assert (= (and b!1556605 (not c!143797)) b!1556602))

(assert (= (and b!1556602 c!143799) b!1556598))

(assert (= (and b!1556602 (not c!143799)) b!1556603))

(assert (= (or b!1556598 b!1556603) bm!71605))

(assert (= (or b!1556604 bm!71605) bm!71604))

(assert (= (or b!1556597 bm!71604) bm!71603))

(assert (= (and bm!71603 c!143796) b!1556596))

(assert (= (and bm!71603 (not c!143796)) b!1556601))

(assert (= (and d!162059 res!1064878) b!1556600))

(assert (= (and b!1556600 res!1064877) b!1556599))

(declare-fun m!1433337 () Bool)

(assert (=> b!1556599 m!1433337))

(declare-fun m!1433339 () Bool)

(assert (=> b!1556600 m!1433339))

(declare-fun m!1433341 () Bool)

(assert (=> bm!71603 m!1433341))

(declare-fun m!1433343 () Bool)

(assert (=> d!162059 m!1433343))

(assert (=> d!162059 m!1433307))

(declare-fun m!1433345 () Bool)

(assert (=> b!1556596 m!1433345))

(assert (=> b!1556477 d!162059))

(declare-fun b!1556635 () Bool)

(declare-fun e!867025 () Option!858)

(declare-fun e!867026 () Option!858)

(assert (=> b!1556635 (= e!867025 e!867026)))

(declare-fun c!143811 () Bool)

(assert (=> b!1556635 (= c!143811 (and (is-Cons!36340 lt!670177) (not (= (_1!12500 (h!37787 lt!670177)) otherKey!50))))))

(declare-fun b!1556636 () Bool)

(assert (=> b!1556636 (= e!867026 (getValueByKey!783 (t!51060 lt!670177) otherKey!50))))

(declare-fun b!1556637 () Bool)

(assert (=> b!1556637 (= e!867026 None!856)))

(declare-fun d!162069 () Bool)

(declare-fun c!143810 () Bool)

(assert (=> d!162069 (= c!143810 (and (is-Cons!36340 lt!670177) (= (_1!12500 (h!37787 lt!670177)) otherKey!50)))))

(assert (=> d!162069 (= (getValueByKey!783 lt!670177 otherKey!50) e!867025)))

(declare-fun b!1556634 () Bool)

(assert (=> b!1556634 (= e!867025 (Some!857 (_2!12500 (h!37787 lt!670177))))))

(assert (= (and d!162069 c!143810) b!1556634))

(assert (= (and d!162069 (not c!143810)) b!1556635))

(assert (= (and b!1556635 c!143811) b!1556636))

(assert (= (and b!1556635 (not c!143811)) b!1556637))

(declare-fun m!1433351 () Bool)

(assert (=> b!1556636 m!1433351))

(assert (=> b!1556478 d!162069))

(declare-fun b!1556641 () Bool)

(declare-fun e!867029 () Option!858)

(declare-fun e!867030 () Option!858)

(assert (=> b!1556641 (= e!867029 e!867030)))

(declare-fun c!143813 () Bool)

(assert (=> b!1556641 (= c!143813 (and (is-Cons!36340 l!1177) (not (= (_1!12500 (h!37787 l!1177)) otherKey!50))))))

(declare-fun b!1556642 () Bool)

(assert (=> b!1556642 (= e!867030 (getValueByKey!783 (t!51060 l!1177) otherKey!50))))

(declare-fun b!1556643 () Bool)

(assert (=> b!1556643 (= e!867030 None!856)))

(declare-fun d!162075 () Bool)

(declare-fun c!143812 () Bool)

(assert (=> d!162075 (= c!143812 (and (is-Cons!36340 l!1177) (= (_1!12500 (h!37787 l!1177)) otherKey!50)))))

(assert (=> d!162075 (= (getValueByKey!783 l!1177 otherKey!50) e!867029)))

(declare-fun b!1556640 () Bool)

(assert (=> b!1556640 (= e!867029 (Some!857 (_2!12500 (h!37787 l!1177))))))

(assert (= (and d!162075 c!143812) b!1556640))

(assert (= (and d!162075 (not c!143812)) b!1556641))

(assert (= (and b!1556641 c!143813) b!1556642))

(assert (= (and b!1556641 (not c!143813)) b!1556643))

(declare-fun m!1433355 () Bool)

(assert (=> b!1556642 m!1433355))

(assert (=> b!1556478 d!162075))

(declare-fun d!162077 () Bool)

(declare-fun res!1064895 () Bool)

(declare-fun e!867046 () Bool)

(assert (=> d!162077 (=> res!1064895 e!867046)))

(assert (=> d!162077 (= res!1064895 (or (is-Nil!36341 l!1177) (is-Nil!36341 (t!51060 l!1177))))))

(assert (=> d!162077 (= (isStrictlySorted!950 l!1177) e!867046)))

(declare-fun b!1556668 () Bool)

(declare-fun e!867047 () Bool)

(assert (=> b!1556668 (= e!867046 e!867047)))

(declare-fun res!1064896 () Bool)

(assert (=> b!1556668 (=> (not res!1064896) (not e!867047))))

(assert (=> b!1556668 (= res!1064896 (bvslt (_1!12500 (h!37787 l!1177)) (_1!12500 (h!37787 (t!51060 l!1177)))))))

(declare-fun b!1556669 () Bool)

(assert (=> b!1556669 (= e!867047 (isStrictlySorted!950 (t!51060 l!1177)))))

(assert (= (and d!162077 (not res!1064895)) b!1556668))

(assert (= (and b!1556668 res!1064896) b!1556669))

(declare-fun m!1433367 () Bool)

(assert (=> b!1556669 m!1433367))

(assert (=> start!132904 d!162077))

(declare-fun b!1556674 () Bool)

(declare-fun e!867050 () Bool)

(declare-fun tp!112462 () Bool)

(assert (=> b!1556674 (= e!867050 (and tp_is_empty!38369 tp!112462))))

(assert (=> b!1556479 (= tp!112453 e!867050)))

(assert (= (and b!1556479 (is-Cons!36340 (t!51060 l!1177))) b!1556674))

(push 1)

(assert (not b!1556600))

(assert tp_is_empty!38369)

(assert (not b!1556669))

(assert (not b!1556642))

(assert (not b!1556599))

(assert (not b!1556596))

(assert (not d!162059))

(assert (not bm!71603))

(assert (not b!1556509))

(assert (not b!1556511))

(assert (not b!1556674))

(assert (not b!1556636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162079 () Bool)

(assert (=> d!162079 (= ($colon$colon!972 e!867004 (ite c!143798 (h!37787 l!1177) (tuple2!24979 newKey!105 newValue!105))) (Cons!36340 (ite c!143798 (h!37787 l!1177) (tuple2!24979 newKey!105 newValue!105)) e!867004))))

(assert (=> bm!71603 d!162079))

(declare-fun d!162081 () Bool)

(declare-fun res!1064897 () Bool)

(declare-fun e!867051 () Bool)

(assert (=> d!162081 (=> res!1064897 e!867051)))

(assert (=> d!162081 (= res!1064897 (and (is-Cons!36340 lt!670185) (= (_1!12500 (h!37787 lt!670185)) newKey!105)))))

(assert (=> d!162081 (= (containsKey!812 lt!670185 newKey!105) e!867051)))

(declare-fun b!1556675 () Bool)

(declare-fun e!867052 () Bool)

(assert (=> b!1556675 (= e!867051 e!867052)))

(declare-fun res!1064898 () Bool)

(assert (=> b!1556675 (=> (not res!1064898) (not e!867052))))

(assert (=> b!1556675 (= res!1064898 (and (or (not (is-Cons!36340 lt!670185)) (bvsle (_1!12500 (h!37787 lt!670185)) newKey!105)) (is-Cons!36340 lt!670185) (bvslt (_1!12500 (h!37787 lt!670185)) newKey!105)))))

(declare-fun b!1556676 () Bool)

(assert (=> b!1556676 (= e!867052 (containsKey!812 (t!51060 lt!670185) newKey!105))))

(assert (= (and d!162081 (not res!1064897)) b!1556675))

(assert (= (and b!1556675 res!1064898) b!1556676))

(declare-fun m!1433369 () Bool)

(assert (=> b!1556676 m!1433369))

(assert (=> b!1556600 d!162081))

(declare-fun d!162083 () Bool)

(declare-fun res!1064899 () Bool)

(declare-fun e!867053 () Bool)

(assert (=> d!162083 (=> res!1064899 e!867053)))

(assert (=> d!162083 (= res!1064899 (and (is-Cons!36340 (t!51060 lt!670177)) (= (_1!12500 (h!37787 (t!51060 lt!670177))) otherKey!50)))))

(assert (=> d!162083 (= (containsKey!812 (t!51060 lt!670177) otherKey!50) e!867053)))

(declare-fun b!1556677 () Bool)

(declare-fun e!867054 () Bool)

(assert (=> b!1556677 (= e!867053 e!867054)))

(declare-fun res!1064900 () Bool)

(assert (=> b!1556677 (=> (not res!1064900) (not e!867054))))

(assert (=> b!1556677 (= res!1064900 (and (or (not (is-Cons!36340 (t!51060 lt!670177))) (bvsle (_1!12500 (h!37787 (t!51060 lt!670177))) otherKey!50)) (is-Cons!36340 (t!51060 lt!670177)) (bvslt (_1!12500 (h!37787 (t!51060 lt!670177))) otherKey!50)))))

(declare-fun b!1556678 () Bool)

(assert (=> b!1556678 (= e!867054 (containsKey!812 (t!51060 (t!51060 lt!670177)) otherKey!50))))

(assert (= (and d!162083 (not res!1064899)) b!1556677))

(assert (= (and b!1556677 res!1064900) b!1556678))

(declare-fun m!1433371 () Bool)

(assert (=> b!1556678 m!1433371))

(assert (=> b!1556509 d!162083))

(declare-fun b!1556680 () Bool)

(declare-fun e!867055 () Option!858)

(declare-fun e!867056 () Option!858)

(assert (=> b!1556680 (= e!867055 e!867056)))

(declare-fun c!143819 () Bool)

(assert (=> b!1556680 (= c!143819 (and (is-Cons!36340 (t!51060 l!1177)) (not (= (_1!12500 (h!37787 (t!51060 l!1177))) otherKey!50))))))

(declare-fun b!1556681 () Bool)

(assert (=> b!1556681 (= e!867056 (getValueByKey!783 (t!51060 (t!51060 l!1177)) otherKey!50))))

(declare-fun b!1556682 () Bool)

(assert (=> b!1556682 (= e!867056 None!856)))

(declare-fun d!162085 () Bool)

(declare-fun c!143818 () Bool)

(assert (=> d!162085 (= c!143818 (and (is-Cons!36340 (t!51060 l!1177)) (= (_1!12500 (h!37787 (t!51060 l!1177))) otherKey!50)))))

(assert (=> d!162085 (= (getValueByKey!783 (t!51060 l!1177) otherKey!50) e!867055)))

(declare-fun b!1556679 () Bool)

(assert (=> b!1556679 (= e!867055 (Some!857 (_2!12500 (h!37787 (t!51060 l!1177)))))))

(assert (= (and d!162085 c!143818) b!1556679))

(assert (= (and d!162085 (not c!143818)) b!1556680))

(assert (= (and b!1556680 c!143819) b!1556681))

(assert (= (and b!1556680 (not c!143819)) b!1556682))

(declare-fun m!1433373 () Bool)

(assert (=> b!1556681 m!1433373))

(assert (=> b!1556642 d!162085))

(declare-fun call!71620 () List!36344)

(declare-fun c!143822 () Bool)

(declare-fun e!867057 () List!36344)

(declare-fun bm!71615 () Bool)

(assert (=> bm!71615 (= call!71620 ($colon$colon!972 e!867057 (ite c!143822 (h!37787 (t!51060 l!1177)) (tuple2!24979 newKey!105 newValue!105))))))

(declare-fun c!143820 () Bool)

(assert (=> bm!71615 (= c!143820 c!143822)))

(declare-fun d!162087 () Bool)

(declare-fun e!867060 () Bool)

(assert (=> d!162087 e!867060))

(declare-fun res!1064902 () Bool)

(assert (=> d!162087 (=> (not res!1064902) (not e!867060))))

(declare-fun lt!670187 () List!36344)

(assert (=> d!162087 (= res!1064902 (isStrictlySorted!950 lt!670187))))

(declare-fun e!867061 () List!36344)

(assert (=> d!162087 (= lt!670187 e!867061)))

(assert (=> d!162087 (= c!143822 (and (is-Cons!36340 (t!51060 l!1177)) (bvslt (_1!12500 (h!37787 (t!51060 l!1177))) newKey!105)))))

(assert (=> d!162087 (isStrictlySorted!950 (t!51060 l!1177))))

(assert (=> d!162087 (= (insertStrictlySorted!555 (t!51060 l!1177) newKey!105 newValue!105) lt!670187)))

(declare-fun b!1556683 () Bool)

(assert (=> b!1556683 (= e!867057 (insertStrictlySorted!555 (t!51060 (t!51060 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1556684 () Bool)

(assert (=> b!1556684 (= e!867061 call!71620)))

(declare-fun b!1556685 () Bool)

(declare-fun e!867059 () List!36344)

(declare-fun call!71619 () List!36344)

(assert (=> b!1556685 (= e!867059 call!71619)))

(declare-fun b!1556686 () Bool)

(assert (=> b!1556686 (= e!867060 (contains!10144 lt!670187 (tuple2!24979 newKey!105 newValue!105)))))

(declare-fun b!1556687 () Bool)

(declare-fun res!1064901 () Bool)

(assert (=> b!1556687 (=> (not res!1064901) (not e!867060))))

(assert (=> b!1556687 (= res!1064901 (containsKey!812 lt!670187 newKey!105))))

(declare-fun c!143821 () Bool)

(declare-fun c!143823 () Bool)

(declare-fun b!1556688 () Bool)

(assert (=> b!1556688 (= e!867057 (ite c!143821 (t!51060 (t!51060 l!1177)) (ite c!143823 (Cons!36340 (h!37787 (t!51060 l!1177)) (t!51060 (t!51060 l!1177))) Nil!36341)))))

(declare-fun b!1556689 () Bool)

(assert (=> b!1556689 (= c!143823 (and (is-Cons!36340 (t!51060 l!1177)) (bvsgt (_1!12500 (h!37787 (t!51060 l!1177))) newKey!105)))))

(declare-fun e!867058 () List!36344)

(assert (=> b!1556689 (= e!867058 e!867059)))

(declare-fun bm!71616 () Bool)

(declare-fun call!71618 () List!36344)

(assert (=> bm!71616 (= call!71618 call!71620)))

(declare-fun b!1556690 () Bool)

(assert (=> b!1556690 (= e!867059 call!71619)))

(declare-fun b!1556691 () Bool)

(assert (=> b!1556691 (= e!867058 call!71618)))

(declare-fun b!1556692 () Bool)

(assert (=> b!1556692 (= e!867061 e!867058)))

(assert (=> b!1556692 (= c!143821 (and (is-Cons!36340 (t!51060 l!1177)) (= (_1!12500 (h!37787 (t!51060 l!1177))) newKey!105)))))

(declare-fun bm!71617 () Bool)

(assert (=> bm!71617 (= call!71619 call!71618)))

(assert (= (and d!162087 c!143822) b!1556684))

(assert (= (and d!162087 (not c!143822)) b!1556692))

(assert (= (and b!1556692 c!143821) b!1556691))

(assert (= (and b!1556692 (not c!143821)) b!1556689))

(assert (= (and b!1556689 c!143823) b!1556685))

(assert (= (and b!1556689 (not c!143823)) b!1556690))

(assert (= (or b!1556685 b!1556690) bm!71617))

(assert (= (or b!1556691 bm!71617) bm!71616))

(assert (= (or b!1556684 bm!71616) bm!71615))

(assert (= (and bm!71615 c!143820) b!1556683))

(assert (= (and bm!71615 (not c!143820)) b!1556688))

(assert (= (and d!162087 res!1064902) b!1556687))

(assert (= (and b!1556687 res!1064901) b!1556686))

(declare-fun m!1433375 () Bool)

(assert (=> b!1556686 m!1433375))

(declare-fun m!1433377 () Bool)

(assert (=> b!1556687 m!1433377))

(declare-fun m!1433379 () Bool)

(assert (=> bm!71615 m!1433379))

(declare-fun m!1433381 () Bool)

(assert (=> d!162087 m!1433381))

(assert (=> d!162087 m!1433367))

(declare-fun m!1433383 () Bool)

(assert (=> b!1556683 m!1433383))

(assert (=> b!1556596 d!162087))

(declare-fun b!1556694 () Bool)

(declare-fun e!867062 () Option!858)

(declare-fun e!867063 () Option!858)

(assert (=> b!1556694 (= e!867062 e!867063)))

(declare-fun c!143825 () Bool)

(assert (=> b!1556694 (= c!143825 (and (is-Cons!36340 (t!51060 lt!670177)) (not (= (_1!12500 (h!37787 (t!51060 lt!670177))) otherKey!50))))))

(declare-fun b!1556695 () Bool)

(assert (=> b!1556695 (= e!867063 (getValueByKey!783 (t!51060 (t!51060 lt!670177)) otherKey!50))))

(declare-fun b!1556696 () Bool)

(assert (=> b!1556696 (= e!867063 None!856)))

(declare-fun d!162089 () Bool)

(declare-fun c!143824 () Bool)

(assert (=> d!162089 (= c!143824 (and (is-Cons!36340 (t!51060 lt!670177)) (= (_1!12500 (h!37787 (t!51060 lt!670177))) otherKey!50)))))

(assert (=> d!162089 (= (getValueByKey!783 (t!51060 lt!670177) otherKey!50) e!867062)))

(declare-fun b!1556693 () Bool)

(assert (=> b!1556693 (= e!867062 (Some!857 (_2!12500 (h!37787 (t!51060 lt!670177)))))))

(assert (= (and d!162089 c!143824) b!1556693))

(assert (= (and d!162089 (not c!143824)) b!1556694))

(assert (= (and b!1556694 c!143825) b!1556695))

(assert (= (and b!1556694 (not c!143825)) b!1556696))

(declare-fun m!1433385 () Bool)

(assert (=> b!1556695 m!1433385))

(assert (=> b!1556636 d!162089))

(declare-fun d!162091 () Bool)

(declare-fun res!1064903 () Bool)

(declare-fun e!867064 () Bool)

(assert (=> d!162091 (=> res!1064903 e!867064)))

(assert (=> d!162091 (= res!1064903 (or (is-Nil!36341 lt!670185) (is-Nil!36341 (t!51060 lt!670185))))))

(assert (=> d!162091 (= (isStrictlySorted!950 lt!670185) e!867064)))

(declare-fun b!1556697 () Bool)

(declare-fun e!867065 () Bool)

(assert (=> b!1556697 (= e!867064 e!867065)))

(declare-fun res!1064904 () Bool)

(assert (=> b!1556697 (=> (not res!1064904) (not e!867065))))

(assert (=> b!1556697 (= res!1064904 (bvslt (_1!12500 (h!37787 lt!670185)) (_1!12500 (h!37787 (t!51060 lt!670185)))))))

(declare-fun b!1556698 () Bool)

(assert (=> b!1556698 (= e!867065 (isStrictlySorted!950 (t!51060 lt!670185)))))

(assert (= (and d!162091 (not res!1064903)) b!1556697))

(assert (= (and b!1556697 res!1064904) b!1556698))

(declare-fun m!1433387 () Bool)

(assert (=> b!1556698 m!1433387))

(assert (=> d!162059 d!162091))

(assert (=> d!162059 d!162077))

(declare-fun d!162093 () Bool)

(declare-fun lt!670190 () Bool)

(declare-fun content!789 (List!36344) (Set tuple2!24978))

(assert (=> d!162093 (= lt!670190 (set.member (tuple2!24979 newKey!105 newValue!105) (content!789 lt!670185)))))

(declare-fun e!867071 () Bool)

(assert (=> d!162093 (= lt!670190 e!867071)))

(declare-fun res!1064910 () Bool)

(assert (=> d!162093 (=> (not res!1064910) (not e!867071))))

(assert (=> d!162093 (= res!1064910 (is-Cons!36340 lt!670185))))

(assert (=> d!162093 (= (contains!10144 lt!670185 (tuple2!24979 newKey!105 newValue!105)) lt!670190)))

(declare-fun b!1556703 () Bool)

(declare-fun e!867070 () Bool)

(assert (=> b!1556703 (= e!867071 e!867070)))

(declare-fun res!1064909 () Bool)

(assert (=> b!1556703 (=> res!1064909 e!867070)))

(assert (=> b!1556703 (= res!1064909 (= (h!37787 lt!670185) (tuple2!24979 newKey!105 newValue!105)))))

(declare-fun b!1556704 () Bool)

(assert (=> b!1556704 (= e!867070 (contains!10144 (t!51060 lt!670185) (tuple2!24979 newKey!105 newValue!105)))))

(assert (= (and d!162093 res!1064910) b!1556703))

(assert (= (and b!1556703 (not res!1064909)) b!1556704))

(declare-fun m!1433389 () Bool)

(assert (=> d!162093 m!1433389))

(declare-fun m!1433391 () Bool)

(assert (=> d!162093 m!1433391))

(declare-fun m!1433393 () Bool)

(assert (=> b!1556704 m!1433393))

(assert (=> b!1556599 d!162093))

(declare-fun d!162095 () Bool)

(declare-fun res!1064911 () Bool)

(declare-fun e!867072 () Bool)

(assert (=> d!162095 (=> res!1064911 e!867072)))

(assert (=> d!162095 (= res!1064911 (and (is-Cons!36340 (t!51060 l!1177)) (= (_1!12500 (h!37787 (t!51060 l!1177))) otherKey!50)))))

(assert (=> d!162095 (= (containsKey!812 (t!51060 l!1177) otherKey!50) e!867072)))

(declare-fun b!1556705 () Bool)

(declare-fun e!867073 () Bool)

(assert (=> b!1556705 (= e!867072 e!867073)))

(declare-fun res!1064912 () Bool)

(assert (=> b!1556705 (=> (not res!1064912) (not e!867073))))

(assert (=> b!1556705 (= res!1064912 (and (or (not (is-Cons!36340 (t!51060 l!1177))) (bvsle (_1!12500 (h!37787 (t!51060 l!1177))) otherKey!50)) (is-Cons!36340 (t!51060 l!1177)) (bvslt (_1!12500 (h!37787 (t!51060 l!1177))) otherKey!50)))))

(declare-fun b!1556706 () Bool)

(assert (=> b!1556706 (= e!867073 (containsKey!812 (t!51060 (t!51060 l!1177)) otherKey!50))))

(assert (= (and d!162095 (not res!1064911)) b!1556705))

(assert (= (and b!1556705 res!1064912) b!1556706))

(declare-fun m!1433395 () Bool)

(assert (=> b!1556706 m!1433395))

(assert (=> b!1556511 d!162095))

(declare-fun d!162097 () Bool)

(declare-fun res!1064913 () Bool)

(declare-fun e!867074 () Bool)

(assert (=> d!162097 (=> res!1064913 e!867074)))

(assert (=> d!162097 (= res!1064913 (or (is-Nil!36341 (t!51060 l!1177)) (is-Nil!36341 (t!51060 (t!51060 l!1177)))))))

(assert (=> d!162097 (= (isStrictlySorted!950 (t!51060 l!1177)) e!867074)))

(declare-fun b!1556707 () Bool)

(declare-fun e!867075 () Bool)

(assert (=> b!1556707 (= e!867074 e!867075)))

(declare-fun res!1064914 () Bool)

(assert (=> b!1556707 (=> (not res!1064914) (not e!867075))))

(assert (=> b!1556707 (= res!1064914 (bvslt (_1!12500 (h!37787 (t!51060 l!1177))) (_1!12500 (h!37787 (t!51060 (t!51060 l!1177))))))))

(declare-fun b!1556708 () Bool)

(assert (=> b!1556708 (= e!867075 (isStrictlySorted!950 (t!51060 (t!51060 l!1177))))))

(assert (= (and d!162097 (not res!1064913)) b!1556707))

(assert (= (and b!1556707 res!1064914) b!1556708))

(declare-fun m!1433397 () Bool)

(assert (=> b!1556708 m!1433397))

(assert (=> b!1556669 d!162097))

(declare-fun b!1556709 () Bool)

(declare-fun e!867076 () Bool)

(declare-fun tp!112463 () Bool)

(assert (=> b!1556709 (= e!867076 (and tp_is_empty!38369 tp!112463))))

(assert (=> b!1556674 (= tp!112462 e!867076)))

(assert (= (and b!1556674 (is-Cons!36340 (t!51060 (t!51060 l!1177)))) b!1556709))

(push 1)

(assert (not b!1556704))

(assert (not d!162087))

(assert (not b!1556698))

(assert tp_is_empty!38369)

(assert (not d!162093))

(assert (not b!1556695))

(assert (not b!1556708))

(assert (not b!1556706))

(assert (not b!1556686))

(assert (not b!1556676))

(assert (not bm!71615))

(assert (not b!1556678))

(assert (not b!1556687))

(assert (not b!1556683))

(assert (not b!1556681))

(assert (not b!1556709))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

