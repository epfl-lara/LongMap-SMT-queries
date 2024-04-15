; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132848 () Bool)

(assert start!132848)

(declare-fun b!1555967 () Bool)

(declare-fun res!1064598 () Bool)

(declare-fun e!866579 () Bool)

(assert (=> b!1555967 (=> (not res!1064598) (not e!866579))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2350 0))(
  ( (B!2351 (val!19261 Int)) )
))
(declare-datatypes ((tuple2!24970 0))(
  ( (tuple2!24971 (_1!12496 (_ BitVec 64)) (_2!12496 B!2350)) )
))
(declare-datatypes ((List!36340 0))(
  ( (Nil!36337) (Cons!36336 (h!37783 tuple2!24970) (t!51053 List!36340)) )
))
(declare-fun l!1177 () List!36340)

(assert (=> b!1555967 (= res!1064598 (and (not (= newKey!105 otherKey!50)) (is-Cons!36336 l!1177) (not (= (_1!12496 (h!37783 l!1177)) otherKey!50))))))

(declare-fun b!1555968 () Bool)

(declare-fun e!866577 () Bool)

(assert (=> b!1555968 (= e!866579 (not e!866577))))

(declare-fun res!1064599 () Bool)

(assert (=> b!1555968 (=> (not res!1064599) (not e!866577))))

(declare-fun lt!670122 () List!36340)

(declare-fun containsKey!808 (List!36340 (_ BitVec 64)) Bool)

(assert (=> b!1555968 (= res!1064599 (= (containsKey!808 lt!670122 otherKey!50) (containsKey!808 l!1177 otherKey!50)))))

(declare-fun newValue!105 () B!2350)

(declare-fun insertStrictlySorted!551 (List!36340 (_ BitVec 64) B!2350) List!36340)

(assert (=> b!1555968 (= lt!670122 (insertStrictlySorted!551 l!1177 newKey!105 newValue!105))))

(declare-fun e!866578 () Bool)

(assert (=> b!1555968 e!866578))

(declare-fun res!1064597 () Bool)

(assert (=> b!1555968 (=> (not res!1064597) (not e!866578))))

(declare-fun lt!670121 () List!36340)

(assert (=> b!1555968 (= res!1064597 (= (containsKey!808 lt!670121 otherKey!50) (containsKey!808 (t!51053 l!1177) otherKey!50)))))

(assert (=> b!1555968 (= lt!670121 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51656 0))(
  ( (Unit!51657) )
))
(declare-fun lt!670123 () Unit!51656)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (List!36340 (_ BitVec 64) B!2350 (_ BitVec 64)) Unit!51656)

(assert (=> b!1555968 (= lt!670123 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (t!51053 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555969 () Bool)

(declare-fun e!866576 () Bool)

(declare-fun tp_is_empty!38361 () Bool)

(declare-fun tp!112429 () Bool)

(assert (=> b!1555969 (= e!866576 (and tp_is_empty!38361 tp!112429))))

(declare-fun b!1555970 () Bool)

(declare-fun res!1064595 () Bool)

(assert (=> b!1555970 (=> (not res!1064595) (not e!866579))))

(declare-fun isStrictlySorted!946 (List!36340) Bool)

(assert (=> b!1555970 (= res!1064595 (isStrictlySorted!946 (t!51053 l!1177)))))

(declare-fun res!1064596 () Bool)

(assert (=> start!132848 (=> (not res!1064596) (not e!866579))))

(assert (=> start!132848 (= res!1064596 (isStrictlySorted!946 l!1177))))

(assert (=> start!132848 e!866579))

(assert (=> start!132848 e!866576))

(assert (=> start!132848 true))

(assert (=> start!132848 tp_is_empty!38361))

(declare-fun b!1555971 () Bool)

(declare-datatypes ((Option!854 0))(
  ( (Some!853 (v!22032 B!2350)) (None!852) )
))
(declare-fun getValueByKey!779 (List!36340 (_ BitVec 64)) Option!854)

(assert (=> b!1555971 (= e!866577 (= (getValueByKey!779 lt!670122 otherKey!50) (getValueByKey!779 l!1177 otherKey!50)))))

(declare-fun b!1555972 () Bool)

(assert (=> b!1555972 (= e!866578 (= (getValueByKey!779 lt!670121 otherKey!50) (getValueByKey!779 (t!51053 l!1177) otherKey!50)))))

(assert (= (and start!132848 res!1064596) b!1555967))

(assert (= (and b!1555967 res!1064598) b!1555970))

(assert (= (and b!1555970 res!1064595) b!1555968))

(assert (= (and b!1555968 res!1064597) b!1555972))

(assert (= (and b!1555968 res!1064599) b!1555971))

(assert (= (and start!132848 (is-Cons!36336 l!1177)) b!1555969))

(declare-fun m!1432963 () Bool)

(assert (=> b!1555971 m!1432963))

(declare-fun m!1432965 () Bool)

(assert (=> b!1555971 m!1432965))

(declare-fun m!1432967 () Bool)

(assert (=> b!1555972 m!1432967))

(declare-fun m!1432969 () Bool)

(assert (=> b!1555972 m!1432969))

(declare-fun m!1432971 () Bool)

(assert (=> start!132848 m!1432971))

(declare-fun m!1432973 () Bool)

(assert (=> b!1555968 m!1432973))

(declare-fun m!1432975 () Bool)

(assert (=> b!1555968 m!1432975))

(declare-fun m!1432977 () Bool)

(assert (=> b!1555968 m!1432977))

(declare-fun m!1432979 () Bool)

(assert (=> b!1555968 m!1432979))

(declare-fun m!1432981 () Bool)

(assert (=> b!1555968 m!1432981))

(declare-fun m!1432983 () Bool)

(assert (=> b!1555968 m!1432983))

(declare-fun m!1432985 () Bool)

(assert (=> b!1555968 m!1432985))

(declare-fun m!1432987 () Bool)

(assert (=> b!1555970 m!1432987))

(push 1)

(assert (not b!1555972))

(assert (not b!1555970))

(assert (not b!1555971))

(assert (not b!1555969))

(assert tp_is_empty!38361)

(assert (not b!1555968))

(assert (not start!132848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1556017 () Bool)

(declare-fun e!866605 () Option!854)

(assert (=> b!1556017 (= e!866605 (getValueByKey!779 (t!51053 lt!670121) otherKey!50))))

(declare-fun d!161851 () Bool)

(declare-fun c!143650 () Bool)

(assert (=> d!161851 (= c!143650 (and (is-Cons!36336 lt!670121) (= (_1!12496 (h!37783 lt!670121)) otherKey!50)))))

(declare-fun e!866604 () Option!854)

(assert (=> d!161851 (= (getValueByKey!779 lt!670121 otherKey!50) e!866604)))

(declare-fun b!1556018 () Bool)

(assert (=> b!1556018 (= e!866605 None!852)))

(declare-fun b!1556015 () Bool)

(assert (=> b!1556015 (= e!866604 (Some!853 (_2!12496 (h!37783 lt!670121))))))

(declare-fun b!1556016 () Bool)

(assert (=> b!1556016 (= e!866604 e!866605)))

(declare-fun c!143651 () Bool)

(assert (=> b!1556016 (= c!143651 (and (is-Cons!36336 lt!670121) (not (= (_1!12496 (h!37783 lt!670121)) otherKey!50))))))

(assert (= (and d!161851 c!143650) b!1556015))

(assert (= (and d!161851 (not c!143650)) b!1556016))

(assert (= (and b!1556016 c!143651) b!1556017))

(assert (= (and b!1556016 (not c!143651)) b!1556018))

(declare-fun m!1433019 () Bool)

(assert (=> b!1556017 m!1433019))

(assert (=> b!1555972 d!161851))

(declare-fun b!1556023 () Bool)

(declare-fun e!866609 () Option!854)

(assert (=> b!1556023 (= e!866609 (getValueByKey!779 (t!51053 (t!51053 l!1177)) otherKey!50))))

(declare-fun d!161859 () Bool)

(declare-fun c!143652 () Bool)

(assert (=> d!161859 (= c!143652 (and (is-Cons!36336 (t!51053 l!1177)) (= (_1!12496 (h!37783 (t!51053 l!1177))) otherKey!50)))))

(declare-fun e!866608 () Option!854)

(assert (=> d!161859 (= (getValueByKey!779 (t!51053 l!1177) otherKey!50) e!866608)))

(declare-fun b!1556024 () Bool)

(assert (=> b!1556024 (= e!866609 None!852)))

(declare-fun b!1556021 () Bool)

(assert (=> b!1556021 (= e!866608 (Some!853 (_2!12496 (h!37783 (t!51053 l!1177)))))))

(declare-fun b!1556022 () Bool)

(assert (=> b!1556022 (= e!866608 e!866609)))

(declare-fun c!143653 () Bool)

(assert (=> b!1556022 (= c!143653 (and (is-Cons!36336 (t!51053 l!1177)) (not (= (_1!12496 (h!37783 (t!51053 l!1177))) otherKey!50))))))

(assert (= (and d!161859 c!143652) b!1556021))

(assert (= (and d!161859 (not c!143652)) b!1556022))

(assert (= (and b!1556022 c!143653) b!1556023))

(assert (= (and b!1556022 (not c!143653)) b!1556024))

(declare-fun m!1433021 () Bool)

(assert (=> b!1556023 m!1433021))

(assert (=> b!1555972 d!161859))

(declare-fun b!1556029 () Bool)

(declare-fun e!866613 () Option!854)

(assert (=> b!1556029 (= e!866613 (getValueByKey!779 (t!51053 lt!670122) otherKey!50))))

(declare-fun d!161861 () Bool)

(declare-fun c!143654 () Bool)

(assert (=> d!161861 (= c!143654 (and (is-Cons!36336 lt!670122) (= (_1!12496 (h!37783 lt!670122)) otherKey!50)))))

(declare-fun e!866612 () Option!854)

(assert (=> d!161861 (= (getValueByKey!779 lt!670122 otherKey!50) e!866612)))

(declare-fun b!1556030 () Bool)

(assert (=> b!1556030 (= e!866613 None!852)))

(declare-fun b!1556027 () Bool)

(assert (=> b!1556027 (= e!866612 (Some!853 (_2!12496 (h!37783 lt!670122))))))

(declare-fun b!1556028 () Bool)

(assert (=> b!1556028 (= e!866612 e!866613)))

(declare-fun c!143655 () Bool)

(assert (=> b!1556028 (= c!143655 (and (is-Cons!36336 lt!670122) (not (= (_1!12496 (h!37783 lt!670122)) otherKey!50))))))

(assert (= (and d!161861 c!143654) b!1556027))

(assert (= (and d!161861 (not c!143654)) b!1556028))

(assert (= (and b!1556028 c!143655) b!1556029))

(assert (= (and b!1556028 (not c!143655)) b!1556030))

(declare-fun m!1433023 () Bool)

(assert (=> b!1556029 m!1433023))

(assert (=> b!1555971 d!161861))

(declare-fun b!1556033 () Bool)

(declare-fun e!866615 () Option!854)

(assert (=> b!1556033 (= e!866615 (getValueByKey!779 (t!51053 l!1177) otherKey!50))))

(declare-fun d!161863 () Bool)

(declare-fun c!143656 () Bool)

(assert (=> d!161863 (= c!143656 (and (is-Cons!36336 l!1177) (= (_1!12496 (h!37783 l!1177)) otherKey!50)))))

(declare-fun e!866614 () Option!854)

(assert (=> d!161863 (= (getValueByKey!779 l!1177 otherKey!50) e!866614)))

(declare-fun b!1556034 () Bool)

(assert (=> b!1556034 (= e!866615 None!852)))

(declare-fun b!1556031 () Bool)

(assert (=> b!1556031 (= e!866614 (Some!853 (_2!12496 (h!37783 l!1177))))))

(declare-fun b!1556032 () Bool)

(assert (=> b!1556032 (= e!866614 e!866615)))

(declare-fun c!143657 () Bool)

(assert (=> b!1556032 (= c!143657 (and (is-Cons!36336 l!1177) (not (= (_1!12496 (h!37783 l!1177)) otherKey!50))))))

(assert (= (and d!161863 c!143656) b!1556031))

(assert (= (and d!161863 (not c!143656)) b!1556032))

(assert (= (and b!1556032 c!143657) b!1556033))

(assert (= (and b!1556032 (not c!143657)) b!1556034))

(assert (=> b!1556033 m!1432969))

(assert (=> b!1555971 d!161863))

(declare-fun d!161865 () Bool)

(declare-fun res!1064627 () Bool)

(declare-fun e!866628 () Bool)

(assert (=> d!161865 (=> res!1064627 e!866628)))

(assert (=> d!161865 (= res!1064627 (or (is-Nil!36337 l!1177) (is-Nil!36337 (t!51053 l!1177))))))

(assert (=> d!161865 (= (isStrictlySorted!946 l!1177) e!866628)))

(declare-fun b!1556051 () Bool)

(declare-fun e!866629 () Bool)

(assert (=> b!1556051 (= e!866628 e!866629)))

(declare-fun res!1064628 () Bool)

(assert (=> b!1556051 (=> (not res!1064628) (not e!866629))))

(assert (=> b!1556051 (= res!1064628 (bvslt (_1!12496 (h!37783 l!1177)) (_1!12496 (h!37783 (t!51053 l!1177)))))))

(declare-fun b!1556052 () Bool)

(assert (=> b!1556052 (= e!866629 (isStrictlySorted!946 (t!51053 l!1177)))))

(assert (= (and d!161865 (not res!1064627)) b!1556051))

(assert (= (and b!1556051 res!1064628) b!1556052))

(assert (=> b!1556052 m!1432987))

(assert (=> start!132848 d!161865))

(declare-fun d!161875 () Bool)

(declare-fun res!1064629 () Bool)

(declare-fun e!866630 () Bool)

(assert (=> d!161875 (=> res!1064629 e!866630)))

(assert (=> d!161875 (= res!1064629 (or (is-Nil!36337 (t!51053 l!1177)) (is-Nil!36337 (t!51053 (t!51053 l!1177)))))))

(assert (=> d!161875 (= (isStrictlySorted!946 (t!51053 l!1177)) e!866630)))

(declare-fun b!1556053 () Bool)

(declare-fun e!866631 () Bool)

(assert (=> b!1556053 (= e!866630 e!866631)))

(declare-fun res!1064630 () Bool)

(assert (=> b!1556053 (=> (not res!1064630) (not e!866631))))

(assert (=> b!1556053 (= res!1064630 (bvslt (_1!12496 (h!37783 (t!51053 l!1177))) (_1!12496 (h!37783 (t!51053 (t!51053 l!1177))))))))

(declare-fun b!1556054 () Bool)

(assert (=> b!1556054 (= e!866631 (isStrictlySorted!946 (t!51053 (t!51053 l!1177))))))

(assert (= (and d!161875 (not res!1064629)) b!1556053))

(assert (= (and b!1556053 res!1064630) b!1556054))

(declare-fun m!1433029 () Bool)

(assert (=> b!1556054 m!1433029))

(assert (=> b!1555970 d!161875))

(declare-fun b!1556121 () Bool)

(declare-fun e!866676 () List!36340)

(declare-fun call!71561 () List!36340)

(assert (=> b!1556121 (= e!866676 call!71561)))

(declare-fun b!1556122 () Bool)

(declare-fun res!1064658 () Bool)

(declare-fun e!866675 () Bool)

(assert (=> b!1556122 (=> (not res!1064658) (not e!866675))))

(declare-fun lt!670143 () List!36340)

(assert (=> b!1556122 (= res!1064658 (containsKey!808 lt!670143 newKey!105))))

(declare-fun b!1556124 () Bool)

(declare-fun contains!10141 (List!36340 tuple2!24970) Bool)

(assert (=> b!1556124 (= e!866675 (contains!10141 lt!670143 (tuple2!24971 newKey!105 newValue!105)))))

(declare-fun b!1556125 () Bool)

(declare-fun c!143684 () Bool)

(assert (=> b!1556125 (= c!143684 (and (is-Cons!36336 l!1177) (bvsgt (_1!12496 (h!37783 l!1177)) newKey!105)))))

(declare-fun e!866673 () List!36340)

(declare-fun e!866677 () List!36340)

(assert (=> b!1556125 (= e!866673 e!866677)))

(declare-fun e!866674 () List!36340)

(declare-fun b!1556126 () Bool)

(declare-fun c!143685 () Bool)

(assert (=> b!1556126 (= e!866674 (ite c!143685 (t!51053 l!1177) (ite c!143684 (Cons!36336 (h!37783 l!1177) (t!51053 l!1177)) Nil!36337)))))

(declare-fun b!1556127 () Bool)

(declare-fun call!71563 () List!36340)

(assert (=> b!1556127 (= e!866677 call!71563)))

(declare-fun bm!71558 () Bool)

(declare-fun call!71562 () List!36340)

(assert (=> bm!71558 (= call!71562 call!71561)))

(declare-fun b!1556128 () Bool)

(assert (=> b!1556128 (= e!866674 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105))))

(declare-fun b!1556123 () Bool)

(assert (=> b!1556123 (= e!866677 call!71563)))

(declare-fun d!161877 () Bool)

(assert (=> d!161877 e!866675))

(declare-fun res!1064657 () Bool)

(assert (=> d!161877 (=> (not res!1064657) (not e!866675))))

(assert (=> d!161877 (= res!1064657 (isStrictlySorted!946 lt!670143))))

(assert (=> d!161877 (= lt!670143 e!866676)))

(declare-fun c!143682 () Bool)

(assert (=> d!161877 (= c!143682 (and (is-Cons!36336 l!1177) (bvslt (_1!12496 (h!37783 l!1177)) newKey!105)))))

(assert (=> d!161877 (isStrictlySorted!946 l!1177)))

(assert (=> d!161877 (= (insertStrictlySorted!551 l!1177 newKey!105 newValue!105) lt!670143)))

(declare-fun bm!71559 () Bool)

(assert (=> bm!71559 (= call!71563 call!71562)))

(declare-fun b!1556129 () Bool)

(assert (=> b!1556129 (= e!866673 call!71562)))

(declare-fun b!1556130 () Bool)

(assert (=> b!1556130 (= e!866676 e!866673)))

(assert (=> b!1556130 (= c!143685 (and (is-Cons!36336 l!1177) (= (_1!12496 (h!37783 l!1177)) newKey!105)))))

(declare-fun bm!71560 () Bool)

(declare-fun $colon$colon!970 (List!36340 tuple2!24970) List!36340)

(assert (=> bm!71560 (= call!71561 ($colon$colon!970 e!866674 (ite c!143682 (h!37783 l!1177) (tuple2!24971 newKey!105 newValue!105))))))

(declare-fun c!143683 () Bool)

(assert (=> bm!71560 (= c!143683 c!143682)))

(assert (= (and d!161877 c!143682) b!1556121))

(assert (= (and d!161877 (not c!143682)) b!1556130))

(assert (= (and b!1556130 c!143685) b!1556129))

(assert (= (and b!1556130 (not c!143685)) b!1556125))

(assert (= (and b!1556125 c!143684) b!1556127))

(assert (= (and b!1556125 (not c!143684)) b!1556123))

(assert (= (or b!1556127 b!1556123) bm!71559))

(assert (= (or b!1556129 bm!71559) bm!71558))

(assert (= (or b!1556121 bm!71558) bm!71560))

(assert (= (and bm!71560 c!143683) b!1556128))

(assert (= (and bm!71560 (not c!143683)) b!1556126))

(assert (= (and d!161877 res!1064657) b!1556122))

(assert (= (and b!1556122 res!1064658) b!1556124))

(declare-fun m!1433045 () Bool)

(assert (=> b!1556124 m!1433045))

(declare-fun m!1433047 () Bool)

(assert (=> d!161877 m!1433047))

(assert (=> d!161877 m!1432971))

(assert (=> b!1556128 m!1432979))

(declare-fun m!1433049 () Bool)

(assert (=> bm!71560 m!1433049))

(declare-fun m!1433051 () Bool)

(assert (=> b!1556122 m!1433051))

(assert (=> b!1555968 d!161877))

(declare-fun d!161885 () Bool)

(declare-fun res!1064669 () Bool)

(declare-fun e!866696 () Bool)

(assert (=> d!161885 (=> res!1064669 e!866696)))

(assert (=> d!161885 (= res!1064669 (and (is-Cons!36336 lt!670121) (= (_1!12496 (h!37783 lt!670121)) otherKey!50)))))

(assert (=> d!161885 (= (containsKey!808 lt!670121 otherKey!50) e!866696)))

(declare-fun b!1556157 () Bool)

(declare-fun e!866697 () Bool)

(assert (=> b!1556157 (= e!866696 e!866697)))

(declare-fun res!1064670 () Bool)

(assert (=> b!1556157 (=> (not res!1064670) (not e!866697))))

(assert (=> b!1556157 (= res!1064670 (and (or (not (is-Cons!36336 lt!670121)) (bvsle (_1!12496 (h!37783 lt!670121)) otherKey!50)) (is-Cons!36336 lt!670121) (bvslt (_1!12496 (h!37783 lt!670121)) otherKey!50)))))

(declare-fun b!1556158 () Bool)

(assert (=> b!1556158 (= e!866697 (containsKey!808 (t!51053 lt!670121) otherKey!50))))

(assert (= (and d!161885 (not res!1064669)) b!1556157))

(assert (= (and b!1556157 res!1064670) b!1556158))

(declare-fun m!1433059 () Bool)

(assert (=> b!1556158 m!1433059))

(assert (=> b!1555968 d!161885))

(declare-fun d!161889 () Bool)

(declare-fun e!866735 () Bool)

(assert (=> d!161889 e!866735))

(declare-fun res!1064697 () Bool)

(assert (=> d!161889 (=> (not res!1064697) (not e!866735))))

(assert (=> d!161889 (= res!1064697 (= (containsKey!808 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!808 (t!51053 l!1177) otherKey!50)))))

(declare-fun lt!670152 () Unit!51656)

(declare-fun choose!2072 (List!36340 (_ BitVec 64) B!2350 (_ BitVec 64)) Unit!51656)

(assert (=> d!161889 (= lt!670152 (choose!2072 (t!51053 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!866736 () Bool)

(assert (=> d!161889 e!866736))

(declare-fun res!1064698 () Bool)

(assert (=> d!161889 (=> (not res!1064698) (not e!866736))))

(assert (=> d!161889 (= res!1064698 (isStrictlySorted!946 (t!51053 l!1177)))))

(assert (=> d!161889 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (t!51053 l!1177) newKey!105 newValue!105 otherKey!50) lt!670152)))

(declare-fun b!1556217 () Bool)

(assert (=> b!1556217 (= e!866736 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1556218 () Bool)

(assert (=> b!1556218 (= e!866735 (= (getValueByKey!779 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!779 (t!51053 l!1177) otherKey!50)))))

(assert (= (and d!161889 res!1064698) b!1556217))

(assert (= (and d!161889 res!1064697) b!1556218))

(assert (=> d!161889 m!1432979))

(declare-fun m!1433091 () Bool)

(assert (=> d!161889 m!1433091))

(assert (=> d!161889 m!1432979))

(declare-fun m!1433093 () Bool)

(assert (=> d!161889 m!1433093))

(assert (=> d!161889 m!1432981))

(assert (=> d!161889 m!1432987))

(assert (=> b!1556218 m!1432979))

(assert (=> b!1556218 m!1432979))

(declare-fun m!1433097 () Bool)

(assert (=> b!1556218 m!1433097))

(assert (=> b!1556218 m!1432969))

(assert (=> b!1555968 d!161889))

(declare-fun d!161907 () Bool)

(declare-fun res!1064699 () Bool)

(declare-fun e!866739 () Bool)

(assert (=> d!161907 (=> res!1064699 e!866739)))

(assert (=> d!161907 (= res!1064699 (and (is-Cons!36336 l!1177) (= (_1!12496 (h!37783 l!1177)) otherKey!50)))))

(assert (=> d!161907 (= (containsKey!808 l!1177 otherKey!50) e!866739)))

(declare-fun b!1556223 () Bool)

(declare-fun e!866740 () Bool)

(assert (=> b!1556223 (= e!866739 e!866740)))

(declare-fun res!1064700 () Bool)

(assert (=> b!1556223 (=> (not res!1064700) (not e!866740))))

(assert (=> b!1556223 (= res!1064700 (and (or (not (is-Cons!36336 l!1177)) (bvsle (_1!12496 (h!37783 l!1177)) otherKey!50)) (is-Cons!36336 l!1177) (bvslt (_1!12496 (h!37783 l!1177)) otherKey!50)))))

(declare-fun b!1556224 () Bool)

(assert (=> b!1556224 (= e!866740 (containsKey!808 (t!51053 l!1177) otherKey!50))))

(assert (= (and d!161907 (not res!1064699)) b!1556223))

(assert (= (and b!1556223 res!1064700) b!1556224))

(assert (=> b!1556224 m!1432981))

(assert (=> b!1555968 d!161907))

(declare-fun d!161913 () Bool)

(declare-fun res!1064703 () Bool)

(declare-fun e!866745 () Bool)

(assert (=> d!161913 (=> res!1064703 e!866745)))

(assert (=> d!161913 (= res!1064703 (and (is-Cons!36336 lt!670122) (= (_1!12496 (h!37783 lt!670122)) otherKey!50)))))

(assert (=> d!161913 (= (containsKey!808 lt!670122 otherKey!50) e!866745)))

(declare-fun b!1556231 () Bool)

(declare-fun e!866746 () Bool)

(assert (=> b!1556231 (= e!866745 e!866746)))

(declare-fun res!1064704 () Bool)

(assert (=> b!1556231 (=> (not res!1064704) (not e!866746))))

(assert (=> b!1556231 (= res!1064704 (and (or (not (is-Cons!36336 lt!670122)) (bvsle (_1!12496 (h!37783 lt!670122)) otherKey!50)) (is-Cons!36336 lt!670122) (bvslt (_1!12496 (h!37783 lt!670122)) otherKey!50)))))

(declare-fun b!1556232 () Bool)

(assert (=> b!1556232 (= e!866746 (containsKey!808 (t!51053 lt!670122) otherKey!50))))

(assert (= (and d!161913 (not res!1064703)) b!1556231))

(assert (= (and b!1556231 res!1064704) b!1556232))

(declare-fun m!1433111 () Bool)

(assert (=> b!1556232 m!1433111))

(assert (=> b!1555968 d!161913))

(declare-fun b!1556237 () Bool)

(declare-fun e!866752 () List!36340)

(declare-fun call!71579 () List!36340)

(assert (=> b!1556237 (= e!866752 call!71579)))

(declare-fun b!1556238 () Bool)

(declare-fun res!1064706 () Bool)

(declare-fun e!866751 () Bool)

(assert (=> b!1556238 (=> (not res!1064706) (not e!866751))))

(declare-fun lt!670153 () List!36340)

(assert (=> b!1556238 (= res!1064706 (containsKey!808 lt!670153 newKey!105))))

(declare-fun b!1556240 () Bool)

(assert (=> b!1556240 (= e!866751 (contains!10141 lt!670153 (tuple2!24971 newKey!105 newValue!105)))))

(declare-fun b!1556241 () Bool)

(declare-fun c!143716 () Bool)

(assert (=> b!1556241 (= c!143716 (and (is-Cons!36336 (t!51053 l!1177)) (bvsgt (_1!12496 (h!37783 (t!51053 l!1177))) newKey!105)))))

(declare-fun e!866749 () List!36340)

(declare-fun e!866753 () List!36340)

(assert (=> b!1556241 (= e!866749 e!866753)))

(declare-fun b!1556242 () Bool)

(declare-fun e!866750 () List!36340)

(declare-fun c!143717 () Bool)

(assert (=> b!1556242 (= e!866750 (ite c!143717 (t!51053 (t!51053 l!1177)) (ite c!143716 (Cons!36336 (h!37783 (t!51053 l!1177)) (t!51053 (t!51053 l!1177))) Nil!36337)))))

(declare-fun b!1556243 () Bool)

(declare-fun call!71581 () List!36340)

(assert (=> b!1556243 (= e!866753 call!71581)))

(declare-fun bm!71576 () Bool)

(declare-fun call!71580 () List!36340)

(assert (=> bm!71576 (= call!71580 call!71579)))

(declare-fun b!1556244 () Bool)

(assert (=> b!1556244 (= e!866750 (insertStrictlySorted!551 (t!51053 (t!51053 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1556239 () Bool)

(assert (=> b!1556239 (= e!866753 call!71581)))

(declare-fun d!161917 () Bool)

(assert (=> d!161917 e!866751))

(declare-fun res!1064705 () Bool)

(assert (=> d!161917 (=> (not res!1064705) (not e!866751))))

(assert (=> d!161917 (= res!1064705 (isStrictlySorted!946 lt!670153))))

(assert (=> d!161917 (= lt!670153 e!866752)))

(declare-fun c!143714 () Bool)

(assert (=> d!161917 (= c!143714 (and (is-Cons!36336 (t!51053 l!1177)) (bvslt (_1!12496 (h!37783 (t!51053 l!1177))) newKey!105)))))

(assert (=> d!161917 (isStrictlySorted!946 (t!51053 l!1177))))

(assert (=> d!161917 (= (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105) lt!670153)))

(declare-fun bm!71577 () Bool)

(assert (=> bm!71577 (= call!71581 call!71580)))

(declare-fun b!1556245 () Bool)

(assert (=> b!1556245 (= e!866749 call!71580)))

(declare-fun b!1556246 () Bool)

(assert (=> b!1556246 (= e!866752 e!866749)))

(assert (=> b!1556246 (= c!143717 (and (is-Cons!36336 (t!51053 l!1177)) (= (_1!12496 (h!37783 (t!51053 l!1177))) newKey!105)))))

(declare-fun bm!71578 () Bool)

(assert (=> bm!71578 (= call!71579 ($colon$colon!970 e!866750 (ite c!143714 (h!37783 (t!51053 l!1177)) (tuple2!24971 newKey!105 newValue!105))))))

(declare-fun c!143715 () Bool)

(assert (=> bm!71578 (= c!143715 c!143714)))

(assert (= (and d!161917 c!143714) b!1556237))

(assert (= (and d!161917 (not c!143714)) b!1556246))

(assert (= (and b!1556246 c!143717) b!1556245))

(assert (= (and b!1556246 (not c!143717)) b!1556241))

(assert (= (and b!1556241 c!143716) b!1556243))

(assert (= (and b!1556241 (not c!143716)) b!1556239))

(assert (= (or b!1556243 b!1556239) bm!71577))

(assert (= (or b!1556245 bm!71577) bm!71576))

(assert (= (or b!1556237 bm!71576) bm!71578))

(assert (= (and bm!71578 c!143715) b!1556244))

(assert (= (and bm!71578 (not c!143715)) b!1556242))

(assert (= (and d!161917 res!1064705) b!1556238))

(assert (= (and b!1556238 res!1064706) b!1556240))

(declare-fun m!1433113 () Bool)

(assert (=> b!1556240 m!1433113))

(declare-fun m!1433115 () Bool)

(assert (=> d!161917 m!1433115))

(assert (=> d!161917 m!1432987))

(declare-fun m!1433117 () Bool)

(assert (=> b!1556244 m!1433117))

(declare-fun m!1433119 () Bool)

(assert (=> bm!71578 m!1433119))

(declare-fun m!1433121 () Bool)

(assert (=> b!1556238 m!1433121))

(assert (=> b!1555968 d!161917))

(declare-fun d!161919 () Bool)

(declare-fun res!1064707 () Bool)

(declare-fun e!866755 () Bool)

(assert (=> d!161919 (=> res!1064707 e!866755)))

(assert (=> d!161919 (= res!1064707 (and (is-Cons!36336 (t!51053 l!1177)) (= (_1!12496 (h!37783 (t!51053 l!1177))) otherKey!50)))))

(assert (=> d!161919 (= (containsKey!808 (t!51053 l!1177) otherKey!50) e!866755)))

(declare-fun b!1556248 () Bool)

(declare-fun e!866756 () Bool)

(assert (=> b!1556248 (= e!866755 e!866756)))

(declare-fun res!1064708 () Bool)

(assert (=> b!1556248 (=> (not res!1064708) (not e!866756))))

(assert (=> b!1556248 (= res!1064708 (and (or (not (is-Cons!36336 (t!51053 l!1177))) (bvsle (_1!12496 (h!37783 (t!51053 l!1177))) otherKey!50)) (is-Cons!36336 (t!51053 l!1177)) (bvslt (_1!12496 (h!37783 (t!51053 l!1177))) otherKey!50)))))

(declare-fun b!1556249 () Bool)

(assert (=> b!1556249 (= e!866756 (containsKey!808 (t!51053 (t!51053 l!1177)) otherKey!50))))

(assert (= (and d!161919 (not res!1064707)) b!1556248))

(assert (= (and b!1556248 res!1064708) b!1556249))

(declare-fun m!1433123 () Bool)

(assert (=> b!1556249 m!1433123))

(assert (=> b!1555968 d!161919))

(declare-fun b!1556258 () Bool)

(declare-fun e!866763 () Bool)

(declare-fun tp!112438 () Bool)

(assert (=> b!1556258 (= e!866763 (and tp_is_empty!38361 tp!112438))))

(assert (=> b!1555969 (= tp!112429 e!866763)))

(assert (= (and b!1555969 (is-Cons!36336 (t!51053 l!1177))) b!1556258))

(push 1)

(assert (not b!1556224))

(assert (not d!161889))

(assert (not b!1556124))

(assert (not b!1556054))

(assert (not b!1556244))

(assert (not b!1556023))

(assert (not b!1556240))

(assert tp_is_empty!38361)

(assert (not d!161877))

(assert (not b!1556033))

(assert (not d!161917))

(assert (not bm!71578))

(assert (not b!1556128))

(assert (not b!1556218))

(assert (not b!1556238))

(assert (not b!1556017))

(assert (not b!1556029))

(assert (not b!1556249))

(assert (not bm!71560))

(assert (not b!1556158))

(assert (not b!1556258))

(assert (not b!1556052))

(assert (not b!1556232))

(assert (not b!1556122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162003 () Bool)

(declare-fun res!1064779 () Bool)

(declare-fun e!866861 () Bool)

(assert (=> d!162003 (=> res!1064779 e!866861)))

(assert (=> d!162003 (= res!1064779 (and (is-Cons!36336 (t!51053 lt!670122)) (= (_1!12496 (h!37783 (t!51053 lt!670122))) otherKey!50)))))

(assert (=> d!162003 (= (containsKey!808 (t!51053 lt!670122) otherKey!50) e!866861)))

(declare-fun b!1556388 () Bool)

(declare-fun e!866862 () Bool)

(assert (=> b!1556388 (= e!866861 e!866862)))

(declare-fun res!1064780 () Bool)

(assert (=> b!1556388 (=> (not res!1064780) (not e!866862))))

(assert (=> b!1556388 (= res!1064780 (and (or (not (is-Cons!36336 (t!51053 lt!670122))) (bvsle (_1!12496 (h!37783 (t!51053 lt!670122))) otherKey!50)) (is-Cons!36336 (t!51053 lt!670122)) (bvslt (_1!12496 (h!37783 (t!51053 lt!670122))) otherKey!50)))))

(declare-fun b!1556389 () Bool)

(assert (=> b!1556389 (= e!866862 (containsKey!808 (t!51053 (t!51053 lt!670122)) otherKey!50))))

(assert (= (and d!162003 (not res!1064779)) b!1556388))

(assert (= (and b!1556388 res!1064780) b!1556389))

(declare-fun m!1433225 () Bool)

(assert (=> b!1556389 m!1433225))

(assert (=> b!1556232 d!162003))

(declare-fun d!162005 () Bool)

(declare-fun res!1064781 () Bool)

(declare-fun e!866863 () Bool)

(assert (=> d!162005 (=> res!1064781 e!866863)))

(assert (=> d!162005 (= res!1064781 (or (is-Nil!36337 lt!670153) (is-Nil!36337 (t!51053 lt!670153))))))

(assert (=> d!162005 (= (isStrictlySorted!946 lt!670153) e!866863)))

(declare-fun b!1556390 () Bool)

(declare-fun e!866864 () Bool)

(assert (=> b!1556390 (= e!866863 e!866864)))

(declare-fun res!1064782 () Bool)

(assert (=> b!1556390 (=> (not res!1064782) (not e!866864))))

(assert (=> b!1556390 (= res!1064782 (bvslt (_1!12496 (h!37783 lt!670153)) (_1!12496 (h!37783 (t!51053 lt!670153)))))))

(declare-fun b!1556391 () Bool)

(assert (=> b!1556391 (= e!866864 (isStrictlySorted!946 (t!51053 lt!670153)))))

(assert (= (and d!162005 (not res!1064781)) b!1556390))

(assert (= (and b!1556390 res!1064782) b!1556391))

(declare-fun m!1433227 () Bool)

(assert (=> b!1556391 m!1433227))

(assert (=> d!161917 d!162005))

(assert (=> d!161917 d!161875))

(declare-fun b!1556394 () Bool)

(declare-fun e!866866 () Option!854)

(assert (=> b!1556394 (= e!866866 (getValueByKey!779 (t!51053 (t!51053 lt!670122)) otherKey!50))))

(declare-fun d!162007 () Bool)

(declare-fun c!143746 () Bool)

(assert (=> d!162007 (= c!143746 (and (is-Cons!36336 (t!51053 lt!670122)) (= (_1!12496 (h!37783 (t!51053 lt!670122))) otherKey!50)))))

(declare-fun e!866865 () Option!854)

(assert (=> d!162007 (= (getValueByKey!779 (t!51053 lt!670122) otherKey!50) e!866865)))

(declare-fun b!1556395 () Bool)

(assert (=> b!1556395 (= e!866866 None!852)))

(declare-fun b!1556392 () Bool)

(assert (=> b!1556392 (= e!866865 (Some!853 (_2!12496 (h!37783 (t!51053 lt!670122)))))))

(declare-fun b!1556393 () Bool)

(assert (=> b!1556393 (= e!866865 e!866866)))

(declare-fun c!143747 () Bool)

(assert (=> b!1556393 (= c!143747 (and (is-Cons!36336 (t!51053 lt!670122)) (not (= (_1!12496 (h!37783 (t!51053 lt!670122))) otherKey!50))))))

(assert (= (and d!162007 c!143746) b!1556392))

(assert (= (and d!162007 (not c!143746)) b!1556393))

(assert (= (and b!1556393 c!143747) b!1556394))

(assert (= (and b!1556393 (not c!143747)) b!1556395))

(declare-fun m!1433229 () Bool)

(assert (=> b!1556394 m!1433229))

(assert (=> b!1556029 d!162007))

(assert (=> b!1556128 d!161917))

(assert (=> b!1556224 d!161919))

(declare-fun d!162009 () Bool)

(declare-fun res!1064783 () Bool)

(declare-fun e!866867 () Bool)

(assert (=> d!162009 (=> res!1064783 e!866867)))

(assert (=> d!162009 (= res!1064783 (or (is-Nil!36337 (t!51053 (t!51053 l!1177))) (is-Nil!36337 (t!51053 (t!51053 (t!51053 l!1177))))))))

(assert (=> d!162009 (= (isStrictlySorted!946 (t!51053 (t!51053 l!1177))) e!866867)))

(declare-fun b!1556396 () Bool)

(declare-fun e!866868 () Bool)

(assert (=> b!1556396 (= e!866867 e!866868)))

(declare-fun res!1064784 () Bool)

(assert (=> b!1556396 (=> (not res!1064784) (not e!866868))))

(assert (=> b!1556396 (= res!1064784 (bvslt (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) (_1!12496 (h!37783 (t!51053 (t!51053 (t!51053 l!1177)))))))))

(declare-fun b!1556397 () Bool)

(assert (=> b!1556397 (= e!866868 (isStrictlySorted!946 (t!51053 (t!51053 (t!51053 l!1177)))))))

(assert (= (and d!162009 (not res!1064783)) b!1556396))

(assert (= (and b!1556396 res!1064784) b!1556397))

(declare-fun m!1433231 () Bool)

(assert (=> b!1556397 m!1433231))

(assert (=> b!1556054 d!162009))

(declare-fun b!1556398 () Bool)

(declare-fun e!866872 () List!36340)

(declare-fun call!71588 () List!36340)

(assert (=> b!1556398 (= e!866872 call!71588)))

(declare-fun b!1556399 () Bool)

(declare-fun res!1064786 () Bool)

(declare-fun e!866871 () Bool)

(assert (=> b!1556399 (=> (not res!1064786) (not e!866871))))

(declare-fun lt!670164 () List!36340)

(assert (=> b!1556399 (= res!1064786 (containsKey!808 lt!670164 newKey!105))))

(declare-fun b!1556401 () Bool)

(assert (=> b!1556401 (= e!866871 (contains!10141 lt!670164 (tuple2!24971 newKey!105 newValue!105)))))

(declare-fun b!1556402 () Bool)

(declare-fun c!143750 () Bool)

(assert (=> b!1556402 (= c!143750 (and (is-Cons!36336 (t!51053 (t!51053 l!1177))) (bvsgt (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) newKey!105)))))

(declare-fun e!866869 () List!36340)

(declare-fun e!866873 () List!36340)

(assert (=> b!1556402 (= e!866869 e!866873)))

(declare-fun b!1556403 () Bool)

(declare-fun e!866870 () List!36340)

(declare-fun c!143751 () Bool)

(assert (=> b!1556403 (= e!866870 (ite c!143751 (t!51053 (t!51053 (t!51053 l!1177))) (ite c!143750 (Cons!36336 (h!37783 (t!51053 (t!51053 l!1177))) (t!51053 (t!51053 (t!51053 l!1177)))) Nil!36337)))))

(declare-fun b!1556404 () Bool)

(declare-fun call!71590 () List!36340)

(assert (=> b!1556404 (= e!866873 call!71590)))

(declare-fun bm!71585 () Bool)

(declare-fun call!71589 () List!36340)

(assert (=> bm!71585 (= call!71589 call!71588)))

(declare-fun b!1556405 () Bool)

(assert (=> b!1556405 (= e!866870 (insertStrictlySorted!551 (t!51053 (t!51053 (t!51053 l!1177))) newKey!105 newValue!105))))

(declare-fun b!1556400 () Bool)

(assert (=> b!1556400 (= e!866873 call!71590)))

(declare-fun d!162011 () Bool)

(assert (=> d!162011 e!866871))

(declare-fun res!1064785 () Bool)

(assert (=> d!162011 (=> (not res!1064785) (not e!866871))))

(assert (=> d!162011 (= res!1064785 (isStrictlySorted!946 lt!670164))))

(assert (=> d!162011 (= lt!670164 e!866872)))

(declare-fun c!143748 () Bool)

(assert (=> d!162011 (= c!143748 (and (is-Cons!36336 (t!51053 (t!51053 l!1177))) (bvslt (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) newKey!105)))))

(assert (=> d!162011 (isStrictlySorted!946 (t!51053 (t!51053 l!1177)))))

(assert (=> d!162011 (= (insertStrictlySorted!551 (t!51053 (t!51053 l!1177)) newKey!105 newValue!105) lt!670164)))

(declare-fun bm!71586 () Bool)

(assert (=> bm!71586 (= call!71590 call!71589)))

(declare-fun b!1556406 () Bool)

(assert (=> b!1556406 (= e!866869 call!71589)))

(declare-fun b!1556407 () Bool)

(assert (=> b!1556407 (= e!866872 e!866869)))

(assert (=> b!1556407 (= c!143751 (and (is-Cons!36336 (t!51053 (t!51053 l!1177))) (= (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) newKey!105)))))

(declare-fun bm!71587 () Bool)

(assert (=> bm!71587 (= call!71588 ($colon$colon!970 e!866870 (ite c!143748 (h!37783 (t!51053 (t!51053 l!1177))) (tuple2!24971 newKey!105 newValue!105))))))

(declare-fun c!143749 () Bool)

(assert (=> bm!71587 (= c!143749 c!143748)))

(assert (= (and d!162011 c!143748) b!1556398))

(assert (= (and d!162011 (not c!143748)) b!1556407))

(assert (= (and b!1556407 c!143751) b!1556406))

(assert (= (and b!1556407 (not c!143751)) b!1556402))

(assert (= (and b!1556402 c!143750) b!1556404))

(assert (= (and b!1556402 (not c!143750)) b!1556400))

(assert (= (or b!1556404 b!1556400) bm!71586))

(assert (= (or b!1556406 bm!71586) bm!71585))

(assert (= (or b!1556398 bm!71585) bm!71587))

(assert (= (and bm!71587 c!143749) b!1556405))

(assert (= (and bm!71587 (not c!143749)) b!1556403))

(assert (= (and d!162011 res!1064785) b!1556399))

(assert (= (and b!1556399 res!1064786) b!1556401))

(declare-fun m!1433233 () Bool)

(assert (=> b!1556401 m!1433233))

(declare-fun m!1433235 () Bool)

(assert (=> d!162011 m!1433235))

(assert (=> d!162011 m!1433029))

(declare-fun m!1433237 () Bool)

(assert (=> b!1556405 m!1433237))

(declare-fun m!1433239 () Bool)

(assert (=> bm!71587 m!1433239))

(declare-fun m!1433241 () Bool)

(assert (=> b!1556399 m!1433241))

(assert (=> b!1556244 d!162011))

(declare-fun d!162013 () Bool)

(declare-fun res!1064787 () Bool)

(declare-fun e!866874 () Bool)

(assert (=> d!162013 (=> res!1064787 e!866874)))

(assert (=> d!162013 (= res!1064787 (and (is-Cons!36336 (t!51053 lt!670121)) (= (_1!12496 (h!37783 (t!51053 lt!670121))) otherKey!50)))))

(assert (=> d!162013 (= (containsKey!808 (t!51053 lt!670121) otherKey!50) e!866874)))

(declare-fun b!1556408 () Bool)

(declare-fun e!866875 () Bool)

(assert (=> b!1556408 (= e!866874 e!866875)))

(declare-fun res!1064788 () Bool)

(assert (=> b!1556408 (=> (not res!1064788) (not e!866875))))

(assert (=> b!1556408 (= res!1064788 (and (or (not (is-Cons!36336 (t!51053 lt!670121))) (bvsle (_1!12496 (h!37783 (t!51053 lt!670121))) otherKey!50)) (is-Cons!36336 (t!51053 lt!670121)) (bvslt (_1!12496 (h!37783 (t!51053 lt!670121))) otherKey!50)))))

(declare-fun b!1556409 () Bool)

(assert (=> b!1556409 (= e!866875 (containsKey!808 (t!51053 (t!51053 lt!670121)) otherKey!50))))

(assert (= (and d!162013 (not res!1064787)) b!1556408))

(assert (= (and b!1556408 res!1064788) b!1556409))

(declare-fun m!1433243 () Bool)

(assert (=> b!1556409 m!1433243))

(assert (=> b!1556158 d!162013))

(declare-fun d!162015 () Bool)

(declare-fun res!1064789 () Bool)

(declare-fun e!866876 () Bool)

(assert (=> d!162015 (=> res!1064789 e!866876)))

(assert (=> d!162015 (= res!1064789 (or (is-Nil!36337 lt!670143) (is-Nil!36337 (t!51053 lt!670143))))))

(assert (=> d!162015 (= (isStrictlySorted!946 lt!670143) e!866876)))

(declare-fun b!1556410 () Bool)

(declare-fun e!866877 () Bool)

(assert (=> b!1556410 (= e!866876 e!866877)))

(declare-fun res!1064790 () Bool)

(assert (=> b!1556410 (=> (not res!1064790) (not e!866877))))

(assert (=> b!1556410 (= res!1064790 (bvslt (_1!12496 (h!37783 lt!670143)) (_1!12496 (h!37783 (t!51053 lt!670143)))))))

(declare-fun b!1556411 () Bool)

(assert (=> b!1556411 (= e!866877 (isStrictlySorted!946 (t!51053 lt!670143)))))

(assert (= (and d!162015 (not res!1064789)) b!1556410))

(assert (= (and b!1556410 res!1064790) b!1556411))

(declare-fun m!1433245 () Bool)

(assert (=> b!1556411 m!1433245))

(assert (=> d!161877 d!162015))

(assert (=> d!161877 d!161865))

(declare-fun b!1556414 () Bool)

(declare-fun e!866879 () Option!854)

(assert (=> b!1556414 (= e!866879 (getValueByKey!779 (t!51053 (t!51053 (t!51053 l!1177))) otherKey!50))))

(declare-fun d!162017 () Bool)

(declare-fun c!143752 () Bool)

(assert (=> d!162017 (= c!143752 (and (is-Cons!36336 (t!51053 (t!51053 l!1177))) (= (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) otherKey!50)))))

(declare-fun e!866878 () Option!854)

(assert (=> d!162017 (= (getValueByKey!779 (t!51053 (t!51053 l!1177)) otherKey!50) e!866878)))

(declare-fun b!1556415 () Bool)

(assert (=> b!1556415 (= e!866879 None!852)))

(declare-fun b!1556412 () Bool)

(assert (=> b!1556412 (= e!866878 (Some!853 (_2!12496 (h!37783 (t!51053 (t!51053 l!1177))))))))

(declare-fun b!1556413 () Bool)

(assert (=> b!1556413 (= e!866878 e!866879)))

(declare-fun c!143753 () Bool)

(assert (=> b!1556413 (= c!143753 (and (is-Cons!36336 (t!51053 (t!51053 l!1177))) (not (= (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) otherKey!50))))))

(assert (= (and d!162017 c!143752) b!1556412))

(assert (= (and d!162017 (not c!143752)) b!1556413))

(assert (= (and b!1556413 c!143753) b!1556414))

(assert (= (and b!1556413 (not c!143753)) b!1556415))

(declare-fun m!1433247 () Bool)

(assert (=> b!1556414 m!1433247))

(assert (=> b!1556023 d!162017))

(assert (=> b!1556033 d!161859))

(assert (=> b!1556052 d!161875))

(declare-fun d!162019 () Bool)

(assert (=> d!162019 (= ($colon$colon!970 e!866674 (ite c!143682 (h!37783 l!1177) (tuple2!24971 newKey!105 newValue!105))) (Cons!36336 (ite c!143682 (h!37783 l!1177) (tuple2!24971 newKey!105 newValue!105)) e!866674))))

(assert (=> bm!71560 d!162019))

(declare-fun d!162021 () Bool)

(declare-fun res!1064791 () Bool)

(declare-fun e!866880 () Bool)

(assert (=> d!162021 (=> res!1064791 e!866880)))

(assert (=> d!162021 (= res!1064791 (and (is-Cons!36336 lt!670143) (= (_1!12496 (h!37783 lt!670143)) newKey!105)))))

(assert (=> d!162021 (= (containsKey!808 lt!670143 newKey!105) e!866880)))

(declare-fun b!1556416 () Bool)

(declare-fun e!866881 () Bool)

(assert (=> b!1556416 (= e!866880 e!866881)))

(declare-fun res!1064792 () Bool)

(assert (=> b!1556416 (=> (not res!1064792) (not e!866881))))

(assert (=> b!1556416 (= res!1064792 (and (or (not (is-Cons!36336 lt!670143)) (bvsle (_1!12496 (h!37783 lt!670143)) newKey!105)) (is-Cons!36336 lt!670143) (bvslt (_1!12496 (h!37783 lt!670143)) newKey!105)))))

(declare-fun b!1556417 () Bool)

(assert (=> b!1556417 (= e!866881 (containsKey!808 (t!51053 lt!670143) newKey!105))))

(assert (= (and d!162021 (not res!1064791)) b!1556416))

(assert (= (and b!1556416 res!1064792) b!1556417))

(declare-fun m!1433249 () Bool)

(assert (=> b!1556417 m!1433249))

(assert (=> b!1556122 d!162021))

(declare-fun b!1556420 () Bool)

(declare-fun e!866883 () Option!854)

(assert (=> b!1556420 (= e!866883 (getValueByKey!779 (t!51053 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105)) otherKey!50))))

(declare-fun d!162023 () Bool)

(declare-fun c!143754 () Bool)

(assert (=> d!162023 (= c!143754 (and (is-Cons!36336 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105)) (= (_1!12496 (h!37783 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(declare-fun e!866882 () Option!854)

(assert (=> d!162023 (= (getValueByKey!779 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105) otherKey!50) e!866882)))

(declare-fun b!1556421 () Bool)

(assert (=> b!1556421 (= e!866883 None!852)))

(declare-fun b!1556418 () Bool)

(assert (=> b!1556418 (= e!866882 (Some!853 (_2!12496 (h!37783 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105)))))))

(declare-fun b!1556419 () Bool)

(assert (=> b!1556419 (= e!866882 e!866883)))

(declare-fun c!143755 () Bool)

(assert (=> b!1556419 (= c!143755 (and (is-Cons!36336 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105)) (not (= (_1!12496 (h!37783 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105))) otherKey!50))))))

(assert (= (and d!162023 c!143754) b!1556418))

(assert (= (and d!162023 (not c!143754)) b!1556419))

(assert (= (and b!1556419 c!143755) b!1556420))

(assert (= (and b!1556419 (not c!143755)) b!1556421))

(declare-fun m!1433251 () Bool)

(assert (=> b!1556420 m!1433251))

(assert (=> b!1556218 d!162023))

(assert (=> b!1556218 d!161917))

(assert (=> b!1556218 d!161859))

(declare-fun lt!670167 () Bool)

(declare-fun d!162025 () Bool)

(declare-fun content!787 (List!36340) (Set tuple2!24970))

(assert (=> d!162025 (= lt!670167 (member (tuple2!24971 newKey!105 newValue!105) (content!787 lt!670143)))))

(declare-fun e!866889 () Bool)

(assert (=> d!162025 (= lt!670167 e!866889)))

(declare-fun res!1064797 () Bool)

(assert (=> d!162025 (=> (not res!1064797) (not e!866889))))

(assert (=> d!162025 (= res!1064797 (is-Cons!36336 lt!670143))))

(assert (=> d!162025 (= (contains!10141 lt!670143 (tuple2!24971 newKey!105 newValue!105)) lt!670167)))

(declare-fun b!1556426 () Bool)

(declare-fun e!866888 () Bool)

(assert (=> b!1556426 (= e!866889 e!866888)))

(declare-fun res!1064798 () Bool)

(assert (=> b!1556426 (=> res!1064798 e!866888)))

(assert (=> b!1556426 (= res!1064798 (= (h!37783 lt!670143) (tuple2!24971 newKey!105 newValue!105)))))

(declare-fun b!1556427 () Bool)

(assert (=> b!1556427 (= e!866888 (contains!10141 (t!51053 lt!670143) (tuple2!24971 newKey!105 newValue!105)))))

(assert (= (and d!162025 res!1064797) b!1556426))

(assert (= (and b!1556426 (not res!1064798)) b!1556427))

(declare-fun m!1433253 () Bool)

(assert (=> d!162025 m!1433253))

(declare-fun m!1433255 () Bool)

(assert (=> d!162025 m!1433255))

(declare-fun m!1433257 () Bool)

(assert (=> b!1556427 m!1433257))

(assert (=> b!1556124 d!162025))

(declare-fun d!162027 () Bool)

(assert (=> d!162027 (= ($colon$colon!970 e!866750 (ite c!143714 (h!37783 (t!51053 l!1177)) (tuple2!24971 newKey!105 newValue!105))) (Cons!36336 (ite c!143714 (h!37783 (t!51053 l!1177)) (tuple2!24971 newKey!105 newValue!105)) e!866750))))

(assert (=> bm!71578 d!162027))

(assert (=> d!161889 d!161875))

(assert (=> d!161889 d!161917))

(assert (=> d!161889 d!161919))

(declare-fun d!162029 () Bool)

(declare-fun res!1064799 () Bool)

(declare-fun e!866890 () Bool)

(assert (=> d!162029 (=> res!1064799 e!866890)))

(assert (=> d!162029 (= res!1064799 (and (is-Cons!36336 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105)) (= (_1!12496 (h!37783 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(assert (=> d!162029 (= (containsKey!808 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105) otherKey!50) e!866890)))

(declare-fun b!1556428 () Bool)

(declare-fun e!866891 () Bool)

(assert (=> b!1556428 (= e!866890 e!866891)))

(declare-fun res!1064800 () Bool)

(assert (=> b!1556428 (=> (not res!1064800) (not e!866891))))

(assert (=> b!1556428 (= res!1064800 (and (or (not (is-Cons!36336 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105))) (bvsle (_1!12496 (h!37783 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105))) otherKey!50)) (is-Cons!36336 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105)) (bvslt (_1!12496 (h!37783 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(declare-fun b!1556429 () Bool)

(assert (=> b!1556429 (= e!866891 (containsKey!808 (t!51053 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105)) otherKey!50))))

(assert (= (and d!162029 (not res!1064799)) b!1556428))

(assert (= (and b!1556428 res!1064800) b!1556429))

(declare-fun m!1433259 () Bool)

(assert (=> b!1556429 m!1433259))

(assert (=> d!161889 d!162029))

(declare-fun d!162031 () Bool)

(declare-fun e!866894 () Bool)

(assert (=> d!162031 e!866894))

(declare-fun res!1064803 () Bool)

(assert (=> d!162031 (=> (not res!1064803) (not e!866894))))

(assert (=> d!162031 (= res!1064803 (= (containsKey!808 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!808 (t!51053 l!1177) otherKey!50)))))

(assert (=> d!162031 true))

(declare-fun _$16!196 () Unit!51656)

(assert (=> d!162031 (= (choose!2072 (t!51053 l!1177) newKey!105 newValue!105 otherKey!50) _$16!196)))

(declare-fun b!1556432 () Bool)

(assert (=> b!1556432 (= e!866894 (= (getValueByKey!779 (insertStrictlySorted!551 (t!51053 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!779 (t!51053 l!1177) otherKey!50)))))

(assert (= (and d!162031 res!1064803) b!1556432))

(assert (=> d!162031 m!1432979))

(assert (=> d!162031 m!1432979))

(assert (=> d!162031 m!1433091))

(assert (=> d!162031 m!1432981))

(assert (=> b!1556432 m!1432979))

(assert (=> b!1556432 m!1432979))

(assert (=> b!1556432 m!1433097))

(assert (=> b!1556432 m!1432969))

(assert (=> d!161889 d!162031))

(declare-fun d!162033 () Bool)

(declare-fun res!1064804 () Bool)

(declare-fun e!866895 () Bool)

(assert (=> d!162033 (=> res!1064804 e!866895)))

(assert (=> d!162033 (= res!1064804 (and (is-Cons!36336 lt!670153) (= (_1!12496 (h!37783 lt!670153)) newKey!105)))))

(assert (=> d!162033 (= (containsKey!808 lt!670153 newKey!105) e!866895)))

(declare-fun b!1556433 () Bool)

(declare-fun e!866896 () Bool)

(assert (=> b!1556433 (= e!866895 e!866896)))

(declare-fun res!1064805 () Bool)

(assert (=> b!1556433 (=> (not res!1064805) (not e!866896))))

(assert (=> b!1556433 (= res!1064805 (and (or (not (is-Cons!36336 lt!670153)) (bvsle (_1!12496 (h!37783 lt!670153)) newKey!105)) (is-Cons!36336 lt!670153) (bvslt (_1!12496 (h!37783 lt!670153)) newKey!105)))))

(declare-fun b!1556434 () Bool)

(assert (=> b!1556434 (= e!866896 (containsKey!808 (t!51053 lt!670153) newKey!105))))

(assert (= (and d!162033 (not res!1064804)) b!1556433))

(assert (= (and b!1556433 res!1064805) b!1556434))

(declare-fun m!1433261 () Bool)

(assert (=> b!1556434 m!1433261))

(assert (=> b!1556238 d!162033))

(declare-fun d!162035 () Bool)

(declare-fun res!1064806 () Bool)

(declare-fun e!866897 () Bool)

(assert (=> d!162035 (=> res!1064806 e!866897)))

(assert (=> d!162035 (= res!1064806 (and (is-Cons!36336 (t!51053 (t!51053 l!1177))) (= (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) otherKey!50)))))

(assert (=> d!162035 (= (containsKey!808 (t!51053 (t!51053 l!1177)) otherKey!50) e!866897)))

(declare-fun b!1556435 () Bool)

(declare-fun e!866898 () Bool)

(assert (=> b!1556435 (= e!866897 e!866898)))

(declare-fun res!1064807 () Bool)

(assert (=> b!1556435 (=> (not res!1064807) (not e!866898))))

(assert (=> b!1556435 (= res!1064807 (and (or (not (is-Cons!36336 (t!51053 (t!51053 l!1177)))) (bvsle (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) otherKey!50)) (is-Cons!36336 (t!51053 (t!51053 l!1177))) (bvslt (_1!12496 (h!37783 (t!51053 (t!51053 l!1177)))) otherKey!50)))))

(declare-fun b!1556436 () Bool)

(assert (=> b!1556436 (= e!866898 (containsKey!808 (t!51053 (t!51053 (t!51053 l!1177))) otherKey!50))))

(assert (= (and d!162035 (not res!1064806)) b!1556435))

(assert (= (and b!1556435 res!1064807) b!1556436))

(declare-fun m!1433263 () Bool)

(assert (=> b!1556436 m!1433263))

(assert (=> b!1556249 d!162035))

(declare-fun b!1556439 () Bool)

(declare-fun e!866900 () Option!854)

(assert (=> b!1556439 (= e!866900 (getValueByKey!779 (t!51053 (t!51053 lt!670121)) otherKey!50))))

(declare-fun d!162037 () Bool)

(declare-fun c!143756 () Bool)

(assert (=> d!162037 (= c!143756 (and (is-Cons!36336 (t!51053 lt!670121)) (= (_1!12496 (h!37783 (t!51053 lt!670121))) otherKey!50)))))

(declare-fun e!866899 () Option!854)

(assert (=> d!162037 (= (getValueByKey!779 (t!51053 lt!670121) otherKey!50) e!866899)))

(declare-fun b!1556440 () Bool)

(assert (=> b!1556440 (= e!866900 None!852)))

(declare-fun b!1556437 () Bool)

(assert (=> b!1556437 (= e!866899 (Some!853 (_2!12496 (h!37783 (t!51053 lt!670121)))))))

(declare-fun b!1556438 () Bool)

(assert (=> b!1556438 (= e!866899 e!866900)))

(declare-fun c!143757 () Bool)

(assert (=> b!1556438 (= c!143757 (and (is-Cons!36336 (t!51053 lt!670121)) (not (= (_1!12496 (h!37783 (t!51053 lt!670121))) otherKey!50))))))

(assert (= (and d!162037 c!143756) b!1556437))

(assert (= (and d!162037 (not c!143756)) b!1556438))

(assert (= (and b!1556438 c!143757) b!1556439))

(assert (= (and b!1556438 (not c!143757)) b!1556440))

(declare-fun m!1433265 () Bool)

(assert (=> b!1556439 m!1433265))

(assert (=> b!1556017 d!162037))

(declare-fun lt!670168 () Bool)

(declare-fun d!162039 () Bool)

(assert (=> d!162039 (= lt!670168 (member (tuple2!24971 newKey!105 newValue!105) (content!787 lt!670153)))))

(declare-fun e!866902 () Bool)

(assert (=> d!162039 (= lt!670168 e!866902)))

(declare-fun res!1064808 () Bool)

(assert (=> d!162039 (=> (not res!1064808) (not e!866902))))

(assert (=> d!162039 (= res!1064808 (is-Cons!36336 lt!670153))))

(assert (=> d!162039 (= (contains!10141 lt!670153 (tuple2!24971 newKey!105 newValue!105)) lt!670168)))

(declare-fun b!1556441 () Bool)

(declare-fun e!866901 () Bool)

(assert (=> b!1556441 (= e!866902 e!866901)))

(declare-fun res!1064809 () Bool)

(assert (=> b!1556441 (=> res!1064809 e!866901)))

(assert (=> b!1556441 (= res!1064809 (= (h!37783 lt!670153) (tuple2!24971 newKey!105 newValue!105)))))

(declare-fun b!1556442 () Bool)

(assert (=> b!1556442 (= e!866901 (contains!10141 (t!51053 lt!670153) (tuple2!24971 newKey!105 newValue!105)))))

(assert (= (and d!162039 res!1064808) b!1556441))

(assert (= (and b!1556441 (not res!1064809)) b!1556442))

(declare-fun m!1433267 () Bool)

(assert (=> d!162039 m!1433267))

(declare-fun m!1433269 () Bool)

(assert (=> d!162039 m!1433269))

(declare-fun m!1433271 () Bool)

(assert (=> b!1556442 m!1433271))

(assert (=> b!1556240 d!162039))

(declare-fun b!1556443 () Bool)

(declare-fun e!866903 () Bool)

(declare-fun tp!112444 () Bool)

(assert (=> b!1556443 (= e!866903 (and tp_is_empty!38361 tp!112444))))

(assert (=> b!1556258 (= tp!112438 e!866903)))

(assert (= (and b!1556258 (is-Cons!36336 (t!51053 (t!51053 l!1177)))) b!1556443))

(push 1)

(assert (not d!162039))

(assert (not b!1556417))

(assert (not b!1556427))

(assert (not b!1556420))

(assert (not b!1556443))

(assert (not b!1556401))

(assert (not d!162025))

(assert (not b!1556429))

(assert (not bm!71587))

(assert tp_is_empty!38361)

(assert (not b!1556394))

(assert (not b!1556397))

(assert (not b!1556399))

(assert (not b!1556432))

(assert (not b!1556391))

(assert (not d!162031))

(assert (not b!1556389))

(assert (not b!1556409))

(assert (not b!1556411))

(assert (not b!1556436))

(assert (not b!1556442))

(assert (not b!1556434))

(assert (not b!1556439))

(assert (not b!1556405))

(assert (not b!1556414))

(assert (not d!162011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

