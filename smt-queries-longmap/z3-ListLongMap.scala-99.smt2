; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1616 () Bool)

(assert start!1616)

(declare-fun b_free!459 () Bool)

(declare-fun b_next!459 () Bool)

(assert (=> start!1616 (= b_free!459 (not b_next!459))))

(declare-fun tp!1946 () Bool)

(declare-fun b_and!839 () Bool)

(assert (=> start!1616 (= tp!1946 b_and!839)))

(declare-fun b!11698 () Bool)

(declare-fun e!6942 () Bool)

(declare-fun tp_is_empty!573 () Bool)

(declare-fun tp!1945 () Bool)

(assert (=> b!11698 (= e!6942 (and tp_is_empty!573 tp!1945))))

(declare-fun b!11699 () Bool)

(declare-datatypes ((B!400 0))(
  ( (B!401 (val!295 Int)) )
))
(declare-datatypes ((tuple2!390 0))(
  ( (tuple2!391 (_1!195 (_ BitVec 64)) (_2!195 B!400)) )
))
(declare-datatypes ((List!347 0))(
  ( (Nil!344) (Cons!343 (h!909 tuple2!390) (t!2716 List!347)) )
))
(declare-datatypes ((ListLongMap!371 0))(
  ( (ListLongMap!372 (toList!201 List!347)) )
))
(declare-fun lm!227 () ListLongMap!371)

(declare-fun p!216 () Int)

(declare-fun kvs!4 () List!347)

(declare-fun e!6944 () Bool)

(declare-fun forall!66 (List!347 Int) Bool)

(declare-fun ++!8 (ListLongMap!371 List!347) ListLongMap!371)

(assert (=> b!11699 (= e!6944 (not (forall!66 (toList!201 (++!8 lm!227 kvs!4)) p!216)))))

(declare-fun b!11700 () Bool)

(declare-fun res!9695 () Bool)

(assert (=> b!11700 (=> (not res!9695) (not e!6944))))

(declare-fun isEmpty!73 (List!347) Bool)

(assert (=> b!11700 (= res!9695 (isEmpty!73 kvs!4))))

(declare-fun b!11701 () Bool)

(declare-fun e!6943 () Bool)

(declare-fun tp!1944 () Bool)

(assert (=> b!11701 (= e!6943 tp!1944)))

(declare-fun res!9696 () Bool)

(assert (=> start!1616 (=> (not res!9696) (not e!6944))))

(assert (=> start!1616 (= res!9696 (forall!66 (toList!201 lm!227) p!216))))

(assert (=> start!1616 e!6944))

(declare-fun inv!575 (ListLongMap!371) Bool)

(assert (=> start!1616 (and (inv!575 lm!227) e!6943)))

(assert (=> start!1616 tp!1946))

(assert (=> start!1616 e!6942))

(declare-fun b!11702 () Bool)

(declare-fun res!9697 () Bool)

(assert (=> b!11702 (=> (not res!9697) (not e!6944))))

(assert (=> b!11702 (= res!9697 (forall!66 kvs!4 p!216))))

(assert (= (and start!1616 res!9696) b!11702))

(assert (= (and b!11702 res!9697) b!11700))

(assert (= (and b!11700 res!9695) b!11699))

(assert (= start!1616 b!11701))

(get-info :version)

(assert (= (and start!1616 ((_ is Cons!343) kvs!4)) b!11698))

(declare-fun m!8147 () Bool)

(assert (=> b!11699 m!8147))

(declare-fun m!8149 () Bool)

(assert (=> b!11699 m!8149))

(declare-fun m!8151 () Bool)

(assert (=> b!11700 m!8151))

(declare-fun m!8153 () Bool)

(assert (=> start!1616 m!8153))

(declare-fun m!8155 () Bool)

(assert (=> start!1616 m!8155))

(declare-fun m!8157 () Bool)

(assert (=> b!11702 m!8157))

(check-sat (not b!11702) b_and!839 (not b_next!459) (not start!1616) (not b!11698) (not b!11701) tp_is_empty!573 (not b!11700) (not b!11699))
(check-sat b_and!839 (not b_next!459))
(get-model)

(declare-fun d!1601 () Bool)

(assert (=> d!1601 (= (isEmpty!73 kvs!4) ((_ is Nil!344) kvs!4))))

(assert (=> b!11700 d!1601))

(declare-fun d!1603 () Bool)

(declare-fun res!9725 () Bool)

(declare-fun e!6972 () Bool)

(assert (=> d!1603 (=> res!9725 e!6972)))

(assert (=> d!1603 (= res!9725 ((_ is Nil!344) (toList!201 lm!227)))))

(assert (=> d!1603 (= (forall!66 (toList!201 lm!227) p!216) e!6972)))

(declare-fun b!11736 () Bool)

(declare-fun e!6973 () Bool)

(assert (=> b!11736 (= e!6972 e!6973)))

(declare-fun res!9726 () Bool)

(assert (=> b!11736 (=> (not res!9726) (not e!6973))))

(declare-fun dynLambda!78 (Int tuple2!390) Bool)

(assert (=> b!11736 (= res!9726 (dynLambda!78 p!216 (h!909 (toList!201 lm!227))))))

(declare-fun b!11737 () Bool)

(assert (=> b!11737 (= e!6973 (forall!66 (t!2716 (toList!201 lm!227)) p!216))))

(assert (= (and d!1603 (not res!9725)) b!11736))

(assert (= (and b!11736 res!9726) b!11737))

(declare-fun b_lambda!809 () Bool)

(assert (=> (not b_lambda!809) (not b!11736)))

(declare-fun t!2725 () Bool)

(declare-fun tb!375 () Bool)

(assert (=> (and start!1616 (= p!216 p!216) t!2725) tb!375))

(declare-fun result!555 () Bool)

(assert (=> tb!375 (= result!555 true)))

(assert (=> b!11736 t!2725))

(declare-fun b_and!849 () Bool)

(assert (= b_and!839 (and (=> t!2725 result!555) b_and!849)))

(declare-fun m!8183 () Bool)

(assert (=> b!11736 m!8183))

(declare-fun m!8185 () Bool)

(assert (=> b!11737 m!8185))

(assert (=> start!1616 d!1603))

(declare-fun d!1611 () Bool)

(declare-fun isStrictlySorted!48 (List!347) Bool)

(assert (=> d!1611 (= (inv!575 lm!227) (isStrictlySorted!48 (toList!201 lm!227)))))

(declare-fun bs!446 () Bool)

(assert (= bs!446 d!1611))

(declare-fun m!8191 () Bool)

(assert (=> bs!446 m!8191))

(assert (=> start!1616 d!1611))

(declare-fun d!1619 () Bool)

(declare-fun res!9729 () Bool)

(declare-fun e!6976 () Bool)

(assert (=> d!1619 (=> res!9729 e!6976)))

(assert (=> d!1619 (= res!9729 ((_ is Nil!344) (toList!201 (++!8 lm!227 kvs!4))))))

(assert (=> d!1619 (= (forall!66 (toList!201 (++!8 lm!227 kvs!4)) p!216) e!6976)))

(declare-fun b!11740 () Bool)

(declare-fun e!6977 () Bool)

(assert (=> b!11740 (= e!6976 e!6977)))

(declare-fun res!9730 () Bool)

(assert (=> b!11740 (=> (not res!9730) (not e!6977))))

(assert (=> b!11740 (= res!9730 (dynLambda!78 p!216 (h!909 (toList!201 (++!8 lm!227 kvs!4)))))))

(declare-fun b!11741 () Bool)

(assert (=> b!11741 (= e!6977 (forall!66 (t!2716 (toList!201 (++!8 lm!227 kvs!4))) p!216))))

(assert (= (and d!1619 (not res!9729)) b!11740))

(assert (= (and b!11740 res!9730) b!11741))

(declare-fun b_lambda!813 () Bool)

(assert (=> (not b_lambda!813) (not b!11740)))

(declare-fun t!2729 () Bool)

(declare-fun tb!379 () Bool)

(assert (=> (and start!1616 (= p!216 p!216) t!2729) tb!379))

(declare-fun result!559 () Bool)

(assert (=> tb!379 (= result!559 true)))

(assert (=> b!11740 t!2729))

(declare-fun b_and!853 () Bool)

(assert (= b_and!849 (and (=> t!2729 result!559) b_and!853)))

(declare-fun m!8197 () Bool)

(assert (=> b!11740 m!8197))

(declare-fun m!8199 () Bool)

(assert (=> b!11741 m!8199))

(assert (=> b!11699 d!1619))

(declare-fun d!1625 () Bool)

(declare-fun c!984 () Bool)

(assert (=> d!1625 (= c!984 ((_ is Nil!344) kvs!4))))

(declare-fun e!6988 () ListLongMap!371)

(assert (=> d!1625 (= (++!8 lm!227 kvs!4) e!6988)))

(declare-fun b!11758 () Bool)

(assert (=> b!11758 (= e!6988 lm!227)))

(declare-fun b!11759 () Bool)

(declare-fun +!32 (ListLongMap!371 tuple2!390) ListLongMap!371)

(assert (=> b!11759 (= e!6988 (++!8 (+!32 lm!227 (h!909 kvs!4)) (t!2716 kvs!4)))))

(assert (= (and d!1625 c!984) b!11758))

(assert (= (and d!1625 (not c!984)) b!11759))

(declare-fun m!8209 () Bool)

(assert (=> b!11759 m!8209))

(assert (=> b!11759 m!8209))

(declare-fun m!8211 () Bool)

(assert (=> b!11759 m!8211))

(assert (=> b!11699 d!1625))

(declare-fun d!1631 () Bool)

(declare-fun res!9735 () Bool)

(declare-fun e!6991 () Bool)

(assert (=> d!1631 (=> res!9735 e!6991)))

(assert (=> d!1631 (= res!9735 ((_ is Nil!344) kvs!4))))

(assert (=> d!1631 (= (forall!66 kvs!4 p!216) e!6991)))

(declare-fun b!11764 () Bool)

(declare-fun e!6992 () Bool)

(assert (=> b!11764 (= e!6991 e!6992)))

(declare-fun res!9736 () Bool)

(assert (=> b!11764 (=> (not res!9736) (not e!6992))))

(assert (=> b!11764 (= res!9736 (dynLambda!78 p!216 (h!909 kvs!4)))))

(declare-fun b!11765 () Bool)

(assert (=> b!11765 (= e!6992 (forall!66 (t!2716 kvs!4) p!216))))

(assert (= (and d!1631 (not res!9735)) b!11764))

(assert (= (and b!11764 res!9736) b!11765))

(declare-fun b_lambda!819 () Bool)

(assert (=> (not b_lambda!819) (not b!11764)))

(declare-fun t!2735 () Bool)

(declare-fun tb!385 () Bool)

(assert (=> (and start!1616 (= p!216 p!216) t!2735) tb!385))

(declare-fun result!569 () Bool)

(assert (=> tb!385 (= result!569 true)))

(assert (=> b!11764 t!2735))

(declare-fun b_and!859 () Bool)

(assert (= b_and!853 (and (=> t!2735 result!569) b_and!859)))

(declare-fun m!8221 () Bool)

(assert (=> b!11764 m!8221))

(declare-fun m!8223 () Bool)

(assert (=> b!11765 m!8223))

(assert (=> b!11702 d!1631))

(declare-fun b!11782 () Bool)

(declare-fun e!7003 () Bool)

(declare-fun tp!1966 () Bool)

(assert (=> b!11782 (= e!7003 (and tp_is_empty!573 tp!1966))))

(assert (=> b!11698 (= tp!1945 e!7003)))

(assert (= (and b!11698 ((_ is Cons!343) (t!2716 kvs!4))) b!11782))

(declare-fun b!11783 () Bool)

(declare-fun e!7004 () Bool)

(declare-fun tp!1967 () Bool)

(assert (=> b!11783 (= e!7004 (and tp_is_empty!573 tp!1967))))

(assert (=> b!11701 (= tp!1944 e!7004)))

(assert (= (and b!11701 ((_ is Cons!343) (toList!201 lm!227))) b!11783))

(declare-fun b_lambda!833 () Bool)

(assert (= b_lambda!813 (or (and start!1616 b_free!459) b_lambda!833)))

(declare-fun b_lambda!835 () Bool)

(assert (= b_lambda!819 (or (and start!1616 b_free!459) b_lambda!835)))

(declare-fun b_lambda!837 () Bool)

(assert (= b_lambda!809 (or (and start!1616 b_free!459) b_lambda!837)))

(check-sat (not b!11782) (not b!11759) (not b!11783) (not b_next!459) (not b_lambda!833) (not b!11737) tp_is_empty!573 (not d!1611) (not b!11741) b_and!859 (not b_lambda!835) (not b!11765) (not b_lambda!837))
(check-sat b_and!859 (not b_next!459))
