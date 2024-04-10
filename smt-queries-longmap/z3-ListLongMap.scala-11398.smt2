; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132694 () Bool)

(assert start!132694)

(declare-fun e!865838 () Bool)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2266 0))(
  ( (B!2267 (val!19219 Int)) )
))
(declare-datatypes ((tuple2!24814 0))(
  ( (tuple2!24815 (_1!12418 (_ BitVec 64)) (_2!12418 B!2266)) )
))
(declare-datatypes ((List!36253 0))(
  ( (Nil!36250) (Cons!36249 (h!37695 tuple2!24814) (t!50974 List!36253)) )
))
(declare-fun l!1177 () List!36253)

(declare-fun b!1554859 () Bool)

(declare-fun lt!670177 () List!36253)

(declare-datatypes ((Option!837 0))(
  ( (Some!836 (v!22021 B!2266)) (None!835) )
))
(declare-fun getValueByKey!761 (List!36253 (_ BitVec 64)) Option!837)

(assert (=> b!1554859 (= e!865838 (= (getValueByKey!761 lt!670177 otherKey!50) (getValueByKey!761 (t!50974 l!1177) otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun e!865837 () Bool)

(declare-fun newValue!105 () B!2266)

(declare-fun b!1554860 () Bool)

(declare-fun isStrictlySorted!912 (List!36253) Bool)

(declare-fun insertStrictlySorted!523 (List!36253 (_ BitVec 64) B!2266) List!36253)

(assert (=> b!1554860 (= e!865837 (not (isStrictlySorted!912 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))

(assert (=> b!1554860 e!865838))

(declare-fun res!1064010 () Bool)

(assert (=> b!1554860 (=> (not res!1064010) (not e!865838))))

(declare-fun containsKey!783 (List!36253 (_ BitVec 64)) Bool)

(assert (=> b!1554860 (= res!1064010 (= (containsKey!783 lt!670177 otherKey!50) (containsKey!783 (t!50974 l!1177) otherKey!50)))))

(assert (=> b!1554860 (= lt!670177 (insertStrictlySorted!523 (t!50974 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51810 0))(
  ( (Unit!51811) )
))
(declare-fun lt!670178 () Unit!51810)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!20 (List!36253 (_ BitVec 64) B!2266 (_ BitVec 64)) Unit!51810)

(assert (=> b!1554860 (= lt!670178 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!20 (t!50974 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun res!1064009 () Bool)

(assert (=> start!132694 (=> (not res!1064009) (not e!865837))))

(assert (=> start!132694 (= res!1064009 (isStrictlySorted!912 l!1177))))

(assert (=> start!132694 e!865837))

(declare-fun e!865836 () Bool)

(assert (=> start!132694 e!865836))

(assert (=> start!132694 true))

(declare-fun tp_is_empty!38277 () Bool)

(assert (=> start!132694 tp_is_empty!38277))

(declare-fun b!1554861 () Bool)

(declare-fun tp!112239 () Bool)

(assert (=> b!1554861 (= e!865836 (and tp_is_empty!38277 tp!112239))))

(declare-fun b!1554862 () Bool)

(declare-fun res!1064008 () Bool)

(assert (=> b!1554862 (=> (not res!1064008) (not e!865837))))

(assert (=> b!1554862 (= res!1064008 (isStrictlySorted!912 (t!50974 l!1177)))))

(declare-fun b!1554863 () Bool)

(declare-fun res!1064011 () Bool)

(assert (=> b!1554863 (=> (not res!1064011) (not e!865837))))

(get-info :version)

(assert (=> b!1554863 (= res!1064011 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36249) l!1177) (not (= (_1!12418 (h!37695 l!1177)) otherKey!50))))))

(assert (= (and start!132694 res!1064009) b!1554863))

(assert (= (and b!1554863 res!1064011) b!1554862))

(assert (= (and b!1554862 res!1064008) b!1554860))

(assert (= (and b!1554860 res!1064010) b!1554859))

(assert (= (and start!132694 ((_ is Cons!36249) l!1177)) b!1554861))

(declare-fun m!1433069 () Bool)

(assert (=> b!1554859 m!1433069))

(declare-fun m!1433071 () Bool)

(assert (=> b!1554859 m!1433071))

(declare-fun m!1433073 () Bool)

(assert (=> b!1554860 m!1433073))

(declare-fun m!1433075 () Bool)

(assert (=> b!1554860 m!1433075))

(declare-fun m!1433077 () Bool)

(assert (=> b!1554860 m!1433077))

(assert (=> b!1554860 m!1433073))

(declare-fun m!1433079 () Bool)

(assert (=> b!1554860 m!1433079))

(declare-fun m!1433081 () Bool)

(assert (=> b!1554860 m!1433081))

(declare-fun m!1433083 () Bool)

(assert (=> b!1554860 m!1433083))

(declare-fun m!1433085 () Bool)

(assert (=> start!132694 m!1433085))

(declare-fun m!1433087 () Bool)

(assert (=> b!1554862 m!1433087))

(check-sat (not b!1554861) (not b!1554859) (not b!1554860) tp_is_empty!38277 (not start!132694) (not b!1554862))
(check-sat)
(get-model)

(declare-fun d!161847 () Bool)

(declare-fun res!1064028 () Bool)

(declare-fun e!865852 () Bool)

(assert (=> d!161847 (=> res!1064028 e!865852)))

(assert (=> d!161847 (= res!1064028 (or ((_ is Nil!36250) l!1177) ((_ is Nil!36250) (t!50974 l!1177))))))

(assert (=> d!161847 (= (isStrictlySorted!912 l!1177) e!865852)))

(declare-fun b!1554883 () Bool)

(declare-fun e!865853 () Bool)

(assert (=> b!1554883 (= e!865852 e!865853)))

(declare-fun res!1064029 () Bool)

(assert (=> b!1554883 (=> (not res!1064029) (not e!865853))))

(assert (=> b!1554883 (= res!1064029 (bvslt (_1!12418 (h!37695 l!1177)) (_1!12418 (h!37695 (t!50974 l!1177)))))))

(declare-fun b!1554884 () Bool)

(assert (=> b!1554884 (= e!865853 (isStrictlySorted!912 (t!50974 l!1177)))))

(assert (= (and d!161847 (not res!1064028)) b!1554883))

(assert (= (and b!1554883 res!1064029) b!1554884))

(assert (=> b!1554884 m!1433087))

(assert (=> start!132694 d!161847))

(declare-fun d!161851 () Bool)

(declare-fun c!143502 () Bool)

(assert (=> d!161851 (= c!143502 (and ((_ is Cons!36249) lt!670177) (= (_1!12418 (h!37695 lt!670177)) otherKey!50)))))

(declare-fun e!865866 () Option!837)

(assert (=> d!161851 (= (getValueByKey!761 lt!670177 otherKey!50) e!865866)))

(declare-fun b!1554914 () Bool)

(declare-fun e!865867 () Option!837)

(assert (=> b!1554914 (= e!865867 None!835)))

(declare-fun b!1554911 () Bool)

(assert (=> b!1554911 (= e!865866 (Some!836 (_2!12418 (h!37695 lt!670177))))))

(declare-fun b!1554913 () Bool)

(assert (=> b!1554913 (= e!865867 (getValueByKey!761 (t!50974 lt!670177) otherKey!50))))

(declare-fun b!1554912 () Bool)

(assert (=> b!1554912 (= e!865866 e!865867)))

(declare-fun c!143503 () Bool)

(assert (=> b!1554912 (= c!143503 (and ((_ is Cons!36249) lt!670177) (not (= (_1!12418 (h!37695 lt!670177)) otherKey!50))))))

(assert (= (and d!161851 c!143502) b!1554911))

(assert (= (and d!161851 (not c!143502)) b!1554912))

(assert (= (and b!1554912 c!143503) b!1554913))

(assert (= (and b!1554912 (not c!143503)) b!1554914))

(declare-fun m!1433113 () Bool)

(assert (=> b!1554913 m!1433113))

(assert (=> b!1554859 d!161851))

(declare-fun d!161859 () Bool)

(declare-fun c!143508 () Bool)

(assert (=> d!161859 (= c!143508 (and ((_ is Cons!36249) (t!50974 l!1177)) (= (_1!12418 (h!37695 (t!50974 l!1177))) otherKey!50)))))

(declare-fun e!865872 () Option!837)

(assert (=> d!161859 (= (getValueByKey!761 (t!50974 l!1177) otherKey!50) e!865872)))

(declare-fun b!1554924 () Bool)

(declare-fun e!865873 () Option!837)

(assert (=> b!1554924 (= e!865873 None!835)))

(declare-fun b!1554921 () Bool)

(assert (=> b!1554921 (= e!865872 (Some!836 (_2!12418 (h!37695 (t!50974 l!1177)))))))

(declare-fun b!1554923 () Bool)

(assert (=> b!1554923 (= e!865873 (getValueByKey!761 (t!50974 (t!50974 l!1177)) otherKey!50))))

(declare-fun b!1554922 () Bool)

(assert (=> b!1554922 (= e!865872 e!865873)))

(declare-fun c!143509 () Bool)

(assert (=> b!1554922 (= c!143509 (and ((_ is Cons!36249) (t!50974 l!1177)) (not (= (_1!12418 (h!37695 (t!50974 l!1177))) otherKey!50))))))

(assert (= (and d!161859 c!143508) b!1554921))

(assert (= (and d!161859 (not c!143508)) b!1554922))

(assert (= (and b!1554922 c!143509) b!1554923))

(assert (= (and b!1554922 (not c!143509)) b!1554924))

(declare-fun m!1433115 () Bool)

(assert (=> b!1554923 m!1433115))

(assert (=> b!1554859 d!161859))

(declare-fun b!1555001 () Bool)

(declare-fun e!865921 () List!36253)

(declare-fun call!71470 () List!36253)

(assert (=> b!1555001 (= e!865921 call!71470)))

(declare-fun b!1555003 () Bool)

(declare-fun e!865924 () List!36253)

(declare-fun e!865922 () List!36253)

(assert (=> b!1555003 (= e!865924 e!865922)))

(declare-fun c!143538 () Bool)

(assert (=> b!1555003 (= c!143538 (and ((_ is Cons!36249) l!1177) (= (_1!12418 (h!37695 l!1177)) newKey!105)))))

(declare-fun b!1555004 () Bool)

(declare-fun call!71471 () List!36253)

(assert (=> b!1555004 (= e!865924 call!71471)))

(declare-fun b!1555005 () Bool)

(declare-fun e!865920 () List!36253)

(assert (=> b!1555005 (= e!865920 (insertStrictlySorted!523 (t!50974 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555006 () Bool)

(declare-fun res!1064054 () Bool)

(declare-fun e!865923 () Bool)

(assert (=> b!1555006 (=> (not res!1064054) (not e!865923))))

(declare-fun lt!670191 () List!36253)

(assert (=> b!1555006 (= res!1064054 (containsKey!783 lt!670191 newKey!105))))

(declare-fun c!143539 () Bool)

(declare-fun b!1555007 () Bool)

(assert (=> b!1555007 (= e!865920 (ite c!143538 (t!50974 l!1177) (ite c!143539 (Cons!36249 (h!37695 l!1177) (t!50974 l!1177)) Nil!36250)))))

(declare-fun bm!71466 () Bool)

(declare-fun c!143537 () Bool)

(declare-fun $colon$colon!954 (List!36253 tuple2!24814) List!36253)

(assert (=> bm!71466 (= call!71471 ($colon$colon!954 e!865920 (ite c!143537 (h!37695 l!1177) (tuple2!24815 newKey!105 newValue!105))))))

(declare-fun c!143536 () Bool)

(assert (=> bm!71466 (= c!143536 c!143537)))

(declare-fun b!1555008 () Bool)

(assert (=> b!1555008 (= c!143539 (and ((_ is Cons!36249) l!1177) (bvsgt (_1!12418 (h!37695 l!1177)) newKey!105)))))

(assert (=> b!1555008 (= e!865922 e!865921)))

(declare-fun d!161861 () Bool)

(assert (=> d!161861 e!865923))

(declare-fun res!1064055 () Bool)

(assert (=> d!161861 (=> (not res!1064055) (not e!865923))))

(assert (=> d!161861 (= res!1064055 (isStrictlySorted!912 lt!670191))))

(assert (=> d!161861 (= lt!670191 e!865924)))

(assert (=> d!161861 (= c!143537 (and ((_ is Cons!36249) l!1177) (bvslt (_1!12418 (h!37695 l!1177)) newKey!105)))))

(assert (=> d!161861 (isStrictlySorted!912 l!1177)))

(assert (=> d!161861 (= (insertStrictlySorted!523 l!1177 newKey!105 newValue!105) lt!670191)))

(declare-fun b!1555002 () Bool)

(declare-fun call!71469 () List!36253)

(assert (=> b!1555002 (= e!865922 call!71469)))

(declare-fun b!1555009 () Bool)

(assert (=> b!1555009 (= e!865921 call!71470)))

(declare-fun bm!71467 () Bool)

(assert (=> bm!71467 (= call!71469 call!71471)))

(declare-fun bm!71468 () Bool)

(assert (=> bm!71468 (= call!71470 call!71469)))

(declare-fun b!1555010 () Bool)

(declare-fun contains!10171 (List!36253 tuple2!24814) Bool)

(assert (=> b!1555010 (= e!865923 (contains!10171 lt!670191 (tuple2!24815 newKey!105 newValue!105)))))

(assert (= (and d!161861 c!143537) b!1555004))

(assert (= (and d!161861 (not c!143537)) b!1555003))

(assert (= (and b!1555003 c!143538) b!1555002))

(assert (= (and b!1555003 (not c!143538)) b!1555008))

(assert (= (and b!1555008 c!143539) b!1555001))

(assert (= (and b!1555008 (not c!143539)) b!1555009))

(assert (= (or b!1555001 b!1555009) bm!71468))

(assert (= (or b!1555002 bm!71468) bm!71467))

(assert (= (or b!1555004 bm!71467) bm!71466))

(assert (= (and bm!71466 c!143536) b!1555005))

(assert (= (and bm!71466 (not c!143536)) b!1555007))

(assert (= (and d!161861 res!1064055) b!1555006))

(assert (= (and b!1555006 res!1064054) b!1555010))

(assert (=> b!1555005 m!1433083))

(declare-fun m!1433125 () Bool)

(assert (=> d!161861 m!1433125))

(assert (=> d!161861 m!1433085))

(declare-fun m!1433127 () Bool)

(assert (=> bm!71466 m!1433127))

(declare-fun m!1433129 () Bool)

(assert (=> b!1555006 m!1433129))

(declare-fun m!1433131 () Bool)

(assert (=> b!1555010 m!1433131))

(assert (=> b!1554860 d!161861))

(declare-fun d!161875 () Bool)

(declare-fun e!865949 () Bool)

(assert (=> d!161875 e!865949))

(declare-fun res!1064074 () Bool)

(assert (=> d!161875 (=> (not res!1064074) (not e!865949))))

(assert (=> d!161875 (= res!1064074 (= (containsKey!783 (insertStrictlySorted!523 (t!50974 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!783 (t!50974 l!1177) otherKey!50)))))

(declare-fun lt!670196 () Unit!51810)

(declare-fun choose!2055 (List!36253 (_ BitVec 64) B!2266 (_ BitVec 64)) Unit!51810)

(assert (=> d!161875 (= lt!670196 (choose!2055 (t!50974 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!865950 () Bool)

(assert (=> d!161875 e!865950))

(declare-fun res!1064075 () Bool)

(assert (=> d!161875 (=> (not res!1064075) (not e!865950))))

(assert (=> d!161875 (= res!1064075 (isStrictlySorted!912 (t!50974 l!1177)))))

(assert (=> d!161875 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!20 (t!50974 l!1177) newKey!105 newValue!105 otherKey!50) lt!670196)))

(declare-fun b!1555049 () Bool)

(assert (=> b!1555049 (= e!865950 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1555050 () Bool)

(assert (=> b!1555050 (= e!865949 (= (getValueByKey!761 (insertStrictlySorted!523 (t!50974 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!761 (t!50974 l!1177) otherKey!50)))))

(assert (= (and d!161875 res!1064075) b!1555049))

(assert (= (and d!161875 res!1064074) b!1555050))

(assert (=> d!161875 m!1433083))

(assert (=> d!161875 m!1433083))

(declare-fun m!1433151 () Bool)

(assert (=> d!161875 m!1433151))

(declare-fun m!1433153 () Bool)

(assert (=> d!161875 m!1433153))

(assert (=> d!161875 m!1433079))

(assert (=> d!161875 m!1433087))

(assert (=> b!1555050 m!1433083))

(assert (=> b!1555050 m!1433083))

(declare-fun m!1433155 () Bool)

(assert (=> b!1555050 m!1433155))

(assert (=> b!1555050 m!1433071))

(assert (=> b!1554860 d!161875))

(declare-fun d!161883 () Bool)

(declare-fun res!1064084 () Bool)

(declare-fun e!865959 () Bool)

(assert (=> d!161883 (=> res!1064084 e!865959)))

(assert (=> d!161883 (= res!1064084 (and ((_ is Cons!36249) lt!670177) (= (_1!12418 (h!37695 lt!670177)) otherKey!50)))))

(assert (=> d!161883 (= (containsKey!783 lt!670177 otherKey!50) e!865959)))

(declare-fun b!1555059 () Bool)

(declare-fun e!865960 () Bool)

(assert (=> b!1555059 (= e!865959 e!865960)))

(declare-fun res!1064085 () Bool)

(assert (=> b!1555059 (=> (not res!1064085) (not e!865960))))

(assert (=> b!1555059 (= res!1064085 (and (or (not ((_ is Cons!36249) lt!670177)) (bvsle (_1!12418 (h!37695 lt!670177)) otherKey!50)) ((_ is Cons!36249) lt!670177) (bvslt (_1!12418 (h!37695 lt!670177)) otherKey!50)))))

(declare-fun b!1555060 () Bool)

(assert (=> b!1555060 (= e!865960 (containsKey!783 (t!50974 lt!670177) otherKey!50))))

(assert (= (and d!161883 (not res!1064084)) b!1555059))

(assert (= (and b!1555059 res!1064085) b!1555060))

(declare-fun m!1433157 () Bool)

(assert (=> b!1555060 m!1433157))

(assert (=> b!1554860 d!161883))

(declare-fun b!1555065 () Bool)

(declare-fun e!865966 () List!36253)

(declare-fun call!71483 () List!36253)

(assert (=> b!1555065 (= e!865966 call!71483)))

(declare-fun b!1555067 () Bool)

(declare-fun e!865969 () List!36253)

(declare-fun e!865967 () List!36253)

(assert (=> b!1555067 (= e!865969 e!865967)))

(declare-fun c!143552 () Bool)

(assert (=> b!1555067 (= c!143552 (and ((_ is Cons!36249) (t!50974 l!1177)) (= (_1!12418 (h!37695 (t!50974 l!1177))) newKey!105)))))

(declare-fun b!1555068 () Bool)

(declare-fun call!71484 () List!36253)

(assert (=> b!1555068 (= e!865969 call!71484)))

(declare-fun e!865965 () List!36253)

(declare-fun b!1555069 () Bool)

(assert (=> b!1555069 (= e!865965 (insertStrictlySorted!523 (t!50974 (t!50974 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1555070 () Bool)

(declare-fun res!1064090 () Bool)

(declare-fun e!865968 () Bool)

(assert (=> b!1555070 (=> (not res!1064090) (not e!865968))))

(declare-fun lt!670201 () List!36253)

(assert (=> b!1555070 (= res!1064090 (containsKey!783 lt!670201 newKey!105))))

(declare-fun b!1555071 () Bool)

(declare-fun c!143553 () Bool)

(assert (=> b!1555071 (= e!865965 (ite c!143552 (t!50974 (t!50974 l!1177)) (ite c!143553 (Cons!36249 (h!37695 (t!50974 l!1177)) (t!50974 (t!50974 l!1177))) Nil!36250)))))

(declare-fun bm!71479 () Bool)

(declare-fun c!143551 () Bool)

(assert (=> bm!71479 (= call!71484 ($colon$colon!954 e!865965 (ite c!143551 (h!37695 (t!50974 l!1177)) (tuple2!24815 newKey!105 newValue!105))))))

(declare-fun c!143550 () Bool)

(assert (=> bm!71479 (= c!143550 c!143551)))

(declare-fun b!1555072 () Bool)

(assert (=> b!1555072 (= c!143553 (and ((_ is Cons!36249) (t!50974 l!1177)) (bvsgt (_1!12418 (h!37695 (t!50974 l!1177))) newKey!105)))))

(assert (=> b!1555072 (= e!865967 e!865966)))

(declare-fun d!161885 () Bool)

(assert (=> d!161885 e!865968))

(declare-fun res!1064091 () Bool)

(assert (=> d!161885 (=> (not res!1064091) (not e!865968))))

(assert (=> d!161885 (= res!1064091 (isStrictlySorted!912 lt!670201))))

(assert (=> d!161885 (= lt!670201 e!865969)))

(assert (=> d!161885 (= c!143551 (and ((_ is Cons!36249) (t!50974 l!1177)) (bvslt (_1!12418 (h!37695 (t!50974 l!1177))) newKey!105)))))

(assert (=> d!161885 (isStrictlySorted!912 (t!50974 l!1177))))

(assert (=> d!161885 (= (insertStrictlySorted!523 (t!50974 l!1177) newKey!105 newValue!105) lt!670201)))

(declare-fun b!1555066 () Bool)

(declare-fun call!71482 () List!36253)

(assert (=> b!1555066 (= e!865967 call!71482)))

(declare-fun b!1555073 () Bool)

(assert (=> b!1555073 (= e!865966 call!71483)))

(declare-fun bm!71480 () Bool)

(assert (=> bm!71480 (= call!71482 call!71484)))

(declare-fun bm!71481 () Bool)

(assert (=> bm!71481 (= call!71483 call!71482)))

(declare-fun b!1555074 () Bool)

(assert (=> b!1555074 (= e!865968 (contains!10171 lt!670201 (tuple2!24815 newKey!105 newValue!105)))))

(assert (= (and d!161885 c!143551) b!1555068))

(assert (= (and d!161885 (not c!143551)) b!1555067))

(assert (= (and b!1555067 c!143552) b!1555066))

(assert (= (and b!1555067 (not c!143552)) b!1555072))

(assert (= (and b!1555072 c!143553) b!1555065))

(assert (= (and b!1555072 (not c!143553)) b!1555073))

(assert (= (or b!1555065 b!1555073) bm!71481))

(assert (= (or b!1555066 bm!71481) bm!71480))

(assert (= (or b!1555068 bm!71480) bm!71479))

(assert (= (and bm!71479 c!143550) b!1555069))

(assert (= (and bm!71479 (not c!143550)) b!1555071))

(assert (= (and d!161885 res!1064091) b!1555070))

(assert (= (and b!1555070 res!1064090) b!1555074))

(declare-fun m!1433159 () Bool)

(assert (=> b!1555069 m!1433159))

(declare-fun m!1433161 () Bool)

(assert (=> d!161885 m!1433161))

(assert (=> d!161885 m!1433087))

(declare-fun m!1433163 () Bool)

(assert (=> bm!71479 m!1433163))

(declare-fun m!1433165 () Bool)

(assert (=> b!1555070 m!1433165))

(declare-fun m!1433167 () Bool)

(assert (=> b!1555074 m!1433167))

(assert (=> b!1554860 d!161885))

(declare-fun d!161887 () Bool)

(declare-fun res!1064094 () Bool)

(declare-fun e!865972 () Bool)

(assert (=> d!161887 (=> res!1064094 e!865972)))

(assert (=> d!161887 (= res!1064094 (and ((_ is Cons!36249) (t!50974 l!1177)) (= (_1!12418 (h!37695 (t!50974 l!1177))) otherKey!50)))))

(assert (=> d!161887 (= (containsKey!783 (t!50974 l!1177) otherKey!50) e!865972)))

(declare-fun b!1555077 () Bool)

(declare-fun e!865973 () Bool)

(assert (=> b!1555077 (= e!865972 e!865973)))

(declare-fun res!1064095 () Bool)

(assert (=> b!1555077 (=> (not res!1064095) (not e!865973))))

(assert (=> b!1555077 (= res!1064095 (and (or (not ((_ is Cons!36249) (t!50974 l!1177))) (bvsle (_1!12418 (h!37695 (t!50974 l!1177))) otherKey!50)) ((_ is Cons!36249) (t!50974 l!1177)) (bvslt (_1!12418 (h!37695 (t!50974 l!1177))) otherKey!50)))))

(declare-fun b!1555078 () Bool)

(assert (=> b!1555078 (= e!865973 (containsKey!783 (t!50974 (t!50974 l!1177)) otherKey!50))))

(assert (= (and d!161887 (not res!1064094)) b!1555077))

(assert (= (and b!1555077 res!1064095) b!1555078))

(declare-fun m!1433171 () Bool)

(assert (=> b!1555078 m!1433171))

(assert (=> b!1554860 d!161887))

(declare-fun d!161889 () Bool)

(declare-fun res!1064098 () Bool)

(declare-fun e!865976 () Bool)

(assert (=> d!161889 (=> res!1064098 e!865976)))

(assert (=> d!161889 (= res!1064098 (or ((_ is Nil!36250) (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)) ((_ is Nil!36250) (t!50974 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!161889 (= (isStrictlySorted!912 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)) e!865976)))

(declare-fun b!1555081 () Bool)

(declare-fun e!865977 () Bool)

(assert (=> b!1555081 (= e!865976 e!865977)))

(declare-fun res!1064099 () Bool)

(assert (=> b!1555081 (=> (not res!1064099) (not e!865977))))

(assert (=> b!1555081 (= res!1064099 (bvslt (_1!12418 (h!37695 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))) (_1!12418 (h!37695 (t!50974 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1555082 () Bool)

(assert (=> b!1555082 (= e!865977 (isStrictlySorted!912 (t!50974 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!161889 (not res!1064098)) b!1555081))

(assert (= (and b!1555081 res!1064099) b!1555082))

(declare-fun m!1433177 () Bool)

(assert (=> b!1555082 m!1433177))

(assert (=> b!1554860 d!161889))

(declare-fun d!161893 () Bool)

(declare-fun res!1064102 () Bool)

(declare-fun e!865983 () Bool)

(assert (=> d!161893 (=> res!1064102 e!865983)))

(assert (=> d!161893 (= res!1064102 (or ((_ is Nil!36250) (t!50974 l!1177)) ((_ is Nil!36250) (t!50974 (t!50974 l!1177)))))))

(assert (=> d!161893 (= (isStrictlySorted!912 (t!50974 l!1177)) e!865983)))

(declare-fun b!1555093 () Bool)

(declare-fun e!865984 () Bool)

(assert (=> b!1555093 (= e!865983 e!865984)))

(declare-fun res!1064103 () Bool)

(assert (=> b!1555093 (=> (not res!1064103) (not e!865984))))

(assert (=> b!1555093 (= res!1064103 (bvslt (_1!12418 (h!37695 (t!50974 l!1177))) (_1!12418 (h!37695 (t!50974 (t!50974 l!1177))))))))

(declare-fun b!1555094 () Bool)

(assert (=> b!1555094 (= e!865984 (isStrictlySorted!912 (t!50974 (t!50974 l!1177))))))

(assert (= (and d!161893 (not res!1064102)) b!1555093))

(assert (= (and b!1555093 res!1064103) b!1555094))

(declare-fun m!1433185 () Bool)

(assert (=> b!1555094 m!1433185))

(assert (=> b!1554862 d!161893))

(declare-fun b!1555109 () Bool)

(declare-fun e!865992 () Bool)

(declare-fun tp!112245 () Bool)

(assert (=> b!1555109 (= e!865992 (and tp_is_empty!38277 tp!112245))))

(assert (=> b!1554861 (= tp!112239 e!865992)))

(assert (= (and b!1554861 ((_ is Cons!36249) (t!50974 l!1177))) b!1555109))

(check-sat (not bm!71466) (not b!1555069) (not b!1554884) (not b!1555060) (not b!1555109) (not b!1554923) (not b!1555074) tp_is_empty!38277 (not b!1555082) (not b!1555070) (not b!1555050) (not b!1555005) (not b!1555078) (not b!1555006) (not b!1555010) (not d!161875) (not bm!71479) (not d!161885) (not b!1554913) (not b!1555094) (not d!161861))
(check-sat)
