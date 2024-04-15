; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134340 () Bool)

(assert start!134340)

(declare-fun b!1568981 () Bool)

(declare-fun e!874618 () Bool)

(declare-fun tp_is_empty!39055 () Bool)

(declare-fun tp!114103 () Bool)

(assert (=> b!1568981 (= e!874618 (and tp_is_empty!39055 tp!114103))))

(declare-fun res!1072417 () Bool)

(declare-fun e!874619 () Bool)

(assert (=> start!134340 (=> (not res!1072417) (not e!874619))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134340 (= res!1072417 (not (= key1!37 key2!21)))))

(assert (=> start!134340 e!874619))

(assert (=> start!134340 true))

(assert (=> start!134340 e!874618))

(assert (=> start!134340 tp_is_empty!39055))

(declare-fun b!1568978 () Bool)

(declare-fun res!1072418 () Bool)

(assert (=> b!1568978 (=> (not res!1072418) (not e!874619))))

(declare-datatypes ((B!2504 0))(
  ( (B!2505 (val!19614 Int)) )
))
(declare-datatypes ((tuple2!25398 0))(
  ( (tuple2!25399 (_1!12710 (_ BitVec 64)) (_2!12710 B!2504)) )
))
(declare-datatypes ((List!36775 0))(
  ( (Nil!36772) (Cons!36771 (h!38219 tuple2!25398) (t!51675 List!36775)) )
))
(declare-fun l!750 () List!36775)

(declare-fun isStrictlySorted!1002 (List!36775) Bool)

(assert (=> b!1568978 (= res!1072418 (isStrictlySorted!1002 l!750))))

(declare-fun v1!32 () B!2504)

(declare-fun b!1568980 () Bool)

(declare-fun insertStrictlySorted!591 (List!36775 (_ BitVec 64) B!2504) List!36775)

(assert (=> b!1568980 (= e!874619 (not (isStrictlySorted!1002 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))

(declare-fun b!1568979 () Bool)

(declare-fun res!1072419 () Bool)

(assert (=> b!1568979 (=> (not res!1072419) (not e!874619))))

(get-info :version)

(assert (=> b!1568979 (= res!1072419 (or (not ((_ is Cons!36771) l!750)) (bvsge (_1!12710 (h!38219 l!750)) key1!37) (bvsge (_1!12710 (h!38219 l!750)) key2!21)))))

(assert (= (and start!134340 res!1072417) b!1568978))

(assert (= (and b!1568978 res!1072418) b!1568979))

(assert (= (and b!1568979 res!1072419) b!1568980))

(assert (= (and start!134340 ((_ is Cons!36771) l!750)) b!1568981))

(declare-fun m!1442847 () Bool)

(assert (=> b!1568978 m!1442847))

(declare-fun m!1442849 () Bool)

(assert (=> b!1568980 m!1442849))

(assert (=> b!1568980 m!1442849))

(declare-fun m!1442851 () Bool)

(assert (=> b!1568980 m!1442851))

(check-sat (not b!1568978) (not b!1568980) (not b!1568981) tp_is_empty!39055)
(check-sat)
(get-model)

(declare-fun d!163627 () Bool)

(declare-fun res!1072450 () Bool)

(declare-fun e!874644 () Bool)

(assert (=> d!163627 (=> res!1072450 e!874644)))

(assert (=> d!163627 (= res!1072450 (or ((_ is Nil!36772) l!750) ((_ is Nil!36772) (t!51675 l!750))))))

(assert (=> d!163627 (= (isStrictlySorted!1002 l!750) e!874644)))

(declare-fun b!1569018 () Bool)

(declare-fun e!874645 () Bool)

(assert (=> b!1569018 (= e!874644 e!874645)))

(declare-fun res!1072451 () Bool)

(assert (=> b!1569018 (=> (not res!1072451) (not e!874645))))

(assert (=> b!1569018 (= res!1072451 (bvslt (_1!12710 (h!38219 l!750)) (_1!12710 (h!38219 (t!51675 l!750)))))))

(declare-fun b!1569019 () Bool)

(assert (=> b!1569019 (= e!874645 (isStrictlySorted!1002 (t!51675 l!750)))))

(assert (= (and d!163627 (not res!1072450)) b!1569018))

(assert (= (and b!1569018 res!1072451) b!1569019))

(declare-fun m!1442869 () Bool)

(assert (=> b!1569019 m!1442869))

(assert (=> b!1568978 d!163627))

(declare-fun d!163631 () Bool)

(declare-fun res!1072452 () Bool)

(declare-fun e!874646 () Bool)

(assert (=> d!163631 (=> res!1072452 e!874646)))

(assert (=> d!163631 (= res!1072452 (or ((_ is Nil!36772) (insertStrictlySorted!591 l!750 key1!37 v1!32)) ((_ is Nil!36772) (t!51675 (insertStrictlySorted!591 l!750 key1!37 v1!32)))))))

(assert (=> d!163631 (= (isStrictlySorted!1002 (insertStrictlySorted!591 l!750 key1!37 v1!32)) e!874646)))

(declare-fun b!1569020 () Bool)

(declare-fun e!874647 () Bool)

(assert (=> b!1569020 (= e!874646 e!874647)))

(declare-fun res!1072453 () Bool)

(assert (=> b!1569020 (=> (not res!1072453) (not e!874647))))

(assert (=> b!1569020 (= res!1072453 (bvslt (_1!12710 (h!38219 (insertStrictlySorted!591 l!750 key1!37 v1!32))) (_1!12710 (h!38219 (t!51675 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))))

(declare-fun b!1569021 () Bool)

(assert (=> b!1569021 (= e!874647 (isStrictlySorted!1002 (t!51675 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))

(assert (= (and d!163631 (not res!1072452)) b!1569020))

(assert (= (and b!1569020 res!1072453) b!1569021))

(declare-fun m!1442871 () Bool)

(assert (=> b!1569021 m!1442871))

(assert (=> b!1568980 d!163631))

(declare-fun b!1569105 () Bool)

(declare-fun e!874695 () List!36775)

(declare-fun call!72052 () List!36775)

(assert (=> b!1569105 (= e!874695 call!72052)))

(declare-fun bm!72049 () Bool)

(declare-fun call!72053 () List!36775)

(declare-fun call!72054 () List!36775)

(assert (=> bm!72049 (= call!72053 call!72054)))

(declare-fun b!1569107 () Bool)

(declare-fun e!874696 () List!36775)

(assert (=> b!1569107 (= e!874696 call!72054)))

(declare-fun b!1569108 () Bool)

(declare-fun c!144645 () Bool)

(assert (=> b!1569108 (= c!144645 (and ((_ is Cons!36771) l!750) (bvsgt (_1!12710 (h!38219 l!750)) key1!37)))))

(declare-fun e!874697 () List!36775)

(assert (=> b!1569108 (= e!874696 e!874697)))

(declare-fun b!1569109 () Bool)

(declare-fun e!874698 () List!36775)

(assert (=> b!1569109 (= e!874698 (insertStrictlySorted!591 (t!51675 l!750) key1!37 v1!32))))

(declare-fun b!1569110 () Bool)

(assert (=> b!1569110 (= e!874697 call!72053)))

(declare-fun b!1569111 () Bool)

(assert (=> b!1569111 (= e!874695 e!874696)))

(declare-fun c!144643 () Bool)

(assert (=> b!1569111 (= c!144643 (and ((_ is Cons!36771) l!750) (= (_1!12710 (h!38219 l!750)) key1!37)))))

(declare-fun b!1569112 () Bool)

(declare-fun res!1072476 () Bool)

(declare-fun e!874694 () Bool)

(assert (=> b!1569112 (=> (not res!1072476) (not e!874694))))

(declare-fun lt!673019 () List!36775)

(declare-fun containsKey!861 (List!36775 (_ BitVec 64)) Bool)

(assert (=> b!1569112 (= res!1072476 (containsKey!861 lt!673019 key1!37))))

(declare-fun c!144644 () Bool)

(declare-fun bm!72050 () Bool)

(declare-fun $colon$colon!996 (List!36775 tuple2!25398) List!36775)

(assert (=> bm!72050 (= call!72052 ($colon$colon!996 e!874698 (ite c!144644 (h!38219 l!750) (tuple2!25399 key1!37 v1!32))))))

(declare-fun c!144642 () Bool)

(assert (=> bm!72050 (= c!144642 c!144644)))

(declare-fun b!1569113 () Bool)

(assert (=> b!1569113 (= e!874698 (ite c!144643 (t!51675 l!750) (ite c!144645 (Cons!36771 (h!38219 l!750) (t!51675 l!750)) Nil!36772)))))

(declare-fun b!1569106 () Bool)

(declare-fun contains!10376 (List!36775 tuple2!25398) Bool)

(assert (=> b!1569106 (= e!874694 (contains!10376 lt!673019 (tuple2!25399 key1!37 v1!32)))))

(declare-fun d!163633 () Bool)

(assert (=> d!163633 e!874694))

(declare-fun res!1072477 () Bool)

(assert (=> d!163633 (=> (not res!1072477) (not e!874694))))

(assert (=> d!163633 (= res!1072477 (isStrictlySorted!1002 lt!673019))))

(assert (=> d!163633 (= lt!673019 e!874695)))

(assert (=> d!163633 (= c!144644 (and ((_ is Cons!36771) l!750) (bvslt (_1!12710 (h!38219 l!750)) key1!37)))))

(assert (=> d!163633 (isStrictlySorted!1002 l!750)))

(assert (=> d!163633 (= (insertStrictlySorted!591 l!750 key1!37 v1!32) lt!673019)))

(declare-fun b!1569114 () Bool)

(assert (=> b!1569114 (= e!874697 call!72053)))

(declare-fun bm!72051 () Bool)

(assert (=> bm!72051 (= call!72054 call!72052)))

(assert (= (and d!163633 c!144644) b!1569105))

(assert (= (and d!163633 (not c!144644)) b!1569111))

(assert (= (and b!1569111 c!144643) b!1569107))

(assert (= (and b!1569111 (not c!144643)) b!1569108))

(assert (= (and b!1569108 c!144645) b!1569110))

(assert (= (and b!1569108 (not c!144645)) b!1569114))

(assert (= (or b!1569110 b!1569114) bm!72049))

(assert (= (or b!1569107 bm!72049) bm!72051))

(assert (= (or b!1569105 bm!72051) bm!72050))

(assert (= (and bm!72050 c!144642) b!1569109))

(assert (= (and bm!72050 (not c!144642)) b!1569113))

(assert (= (and d!163633 res!1072477) b!1569112))

(assert (= (and b!1569112 res!1072476) b!1569106))

(declare-fun m!1442887 () Bool)

(assert (=> b!1569106 m!1442887))

(declare-fun m!1442889 () Bool)

(assert (=> b!1569109 m!1442889))

(declare-fun m!1442891 () Bool)

(assert (=> b!1569112 m!1442891))

(declare-fun m!1442893 () Bool)

(assert (=> d!163633 m!1442893))

(assert (=> d!163633 m!1442847))

(declare-fun m!1442895 () Bool)

(assert (=> bm!72050 m!1442895))

(assert (=> b!1568980 d!163633))

(declare-fun b!1569119 () Bool)

(declare-fun e!874701 () Bool)

(declare-fun tp!114115 () Bool)

(assert (=> b!1569119 (= e!874701 (and tp_is_empty!39055 tp!114115))))

(assert (=> b!1568981 (= tp!114103 e!874701)))

(assert (= (and b!1568981 ((_ is Cons!36771) (t!51675 l!750))) b!1569119))

(check-sat (not b!1569106) (not b!1569109) (not d!163633) (not bm!72050) (not b!1569019) (not b!1569112) (not b!1569119) (not b!1569021) tp_is_empty!39055)
(check-sat)
