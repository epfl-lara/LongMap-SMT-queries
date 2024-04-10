; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!162 () Bool)

(assert start!162)

(declare-fun b_free!27 () Bool)

(declare-fun b_next!27 () Bool)

(assert (=> start!162 (= b_free!27 (not b_next!27))))

(declare-fun tp!86 () Bool)

(declare-fun b_and!51 () Bool)

(assert (=> start!162 (= tp!86 b_and!51)))

(declare-fun res!4397 () Bool)

(declare-fun e!344 () Bool)

(assert (=> start!162 (=> (not res!4397) (not e!344))))

(declare-datatypes ((B!262 0))(
  ( (B!263 (val!13 Int)) )
))
(declare-datatypes ((tuple2!26 0))(
  ( (tuple2!27 (_1!13 (_ BitVec 64)) (_2!13 B!262)) )
))
(declare-datatypes ((List!22 0))(
  ( (Nil!19) (Cons!18 (h!584 tuple2!26) (t!2041 List!22)) )
))
(declare-datatypes ((ListLongMap!31 0))(
  ( (ListLongMap!32 (toList!31 List!22)) )
))
(declare-fun lm!258 () ListLongMap!31)

(declare-fun p!318 () Int)

(declare-fun forall!15 (List!22 Int) Bool)

(assert (=> start!162 (= res!4397 (forall!15 (toList!31 lm!258) p!318))))

(assert (=> start!162 e!344))

(declare-fun e!345 () Bool)

(declare-fun inv!48 (ListLongMap!31) Bool)

(assert (=> start!162 (and (inv!48 lm!258) e!345)))

(assert (=> start!162 tp!86))

(declare-fun b!1817 () Bool)

(declare-fun size!64 (List!22) Int)

(assert (=> b!1817 (= e!344 (< (size!64 (toList!31 lm!258)) 0))))

(declare-fun b!1818 () Bool)

(declare-fun tp!85 () Bool)

(assert (=> b!1818 (= e!345 tp!85)))

(assert (= (and start!162 res!4397) b!1817))

(assert (= start!162 b!1818))

(declare-fun m!495 () Bool)

(assert (=> start!162 m!495))

(declare-fun m!497 () Bool)

(assert (=> start!162 m!497))

(declare-fun m!499 () Bool)

(assert (=> b!1817 m!499))

(check-sat b_and!51 (not b_next!27) (not start!162) (not b!1817) (not b!1818))
(check-sat b_and!51 (not b_next!27))
(get-model)

(declare-fun d!165 () Bool)

(declare-fun res!4414 () Bool)

(declare-fun e!365 () Bool)

(assert (=> d!165 (=> res!4414 e!365)))

(get-info :version)

(assert (=> d!165 (= res!4414 ((_ is Nil!19) (toList!31 lm!258)))))

(assert (=> d!165 (= (forall!15 (toList!31 lm!258) p!318) e!365)))

(declare-fun b!1837 () Bool)

(declare-fun e!366 () Bool)

(assert (=> b!1837 (= e!365 e!366)))

(declare-fun res!4415 () Bool)

(assert (=> b!1837 (=> (not res!4415) (not e!366))))

(declare-fun dynLambda!7 (Int tuple2!26) Bool)

(assert (=> b!1837 (= res!4415 (dynLambda!7 p!318 (h!584 (toList!31 lm!258))))))

(declare-fun b!1838 () Bool)

(assert (=> b!1838 (= e!366 (forall!15 (t!2041 (toList!31 lm!258)) p!318))))

(assert (= (and d!165 (not res!4414)) b!1837))

(assert (= (and b!1837 res!4415) b!1838))

(declare-fun b_lambda!51 () Bool)

(assert (=> (not b_lambda!51) (not b!1837)))

(declare-fun t!2044 () Bool)

(declare-fun tb!19 () Bool)

(assert (=> (and start!162 (= p!318 p!318) t!2044) tb!19))

(declare-fun result!31 () Bool)

(assert (=> tb!19 (= result!31 true)))

(assert (=> b!1837 t!2044))

(declare-fun b_and!55 () Bool)

(assert (= b_and!51 (and (=> t!2044 result!31) b_and!55)))

(declare-fun m!507 () Bool)

(assert (=> b!1837 m!507))

(declare-fun m!513 () Bool)

(assert (=> b!1838 m!513))

(assert (=> start!162 d!165))

(declare-fun d!171 () Bool)

(declare-fun isStrictlySorted!5 (List!22) Bool)

(assert (=> d!171 (= (inv!48 lm!258) (isStrictlySorted!5 (toList!31 lm!258)))))

(declare-fun bs!46 () Bool)

(assert (= bs!46 d!171))

(declare-fun m!519 () Bool)

(assert (=> bs!46 m!519))

(assert (=> start!162 d!171))

(declare-fun d!177 () Bool)

(declare-fun lt!313 () Int)

(assert (=> d!177 (>= lt!313 0)))

(declare-fun e!377 () Int)

(assert (=> d!177 (= lt!313 e!377)))

(declare-fun c!94 () Bool)

(assert (=> d!177 (= c!94 ((_ is Nil!19) (toList!31 lm!258)))))

(assert (=> d!177 (= (size!64 (toList!31 lm!258)) lt!313)))

(declare-fun b!1857 () Bool)

(assert (=> b!1857 (= e!377 0)))

(declare-fun b!1858 () Bool)

(assert (=> b!1858 (= e!377 (+ 1 (size!64 (t!2041 (toList!31 lm!258)))))))

(assert (= (and d!177 c!94) b!1857))

(assert (= (and d!177 (not c!94)) b!1858))

(declare-fun m!527 () Bool)

(assert (=> b!1858 m!527))

(assert (=> b!1817 d!177))

(declare-fun b!1874 () Bool)

(declare-fun e!386 () Bool)

(declare-fun tp_is_empty!15 () Bool)

(declare-fun tp!100 () Bool)

(assert (=> b!1874 (= e!386 (and tp_is_empty!15 tp!100))))

(assert (=> b!1818 (= tp!85 e!386)))

(assert (= (and b!1818 ((_ is Cons!18) (toList!31 lm!258))) b!1874))

(declare-fun b_lambda!57 () Bool)

(assert (= b_lambda!51 (or (and start!162 b_free!27) b_lambda!57)))

(check-sat (not b!1874) tp_is_empty!15 (not b!1838) (not b!1858) b_and!55 (not d!171) (not b_lambda!57) (not b_next!27))
(check-sat b_and!55 (not b_next!27))
