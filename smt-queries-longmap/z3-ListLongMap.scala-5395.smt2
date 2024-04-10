; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71970 () Bool)

(assert start!71970)

(declare-datatypes ((B!1174 0))(
  ( (B!1175 (val!7669 Int)) )
))
(declare-datatypes ((tuple2!10198 0))(
  ( (tuple2!10199 (_1!5110 (_ BitVec 64)) (_2!5110 B!1174)) )
))
(declare-datatypes ((List!15974 0))(
  ( (Nil!15971) (Cons!15970 (h!17101 tuple2!10198) (t!22345 List!15974)) )
))
(declare-datatypes ((ListLongMap!9009 0))(
  ( (ListLongMap!9010 (toList!4520 List!15974)) )
))
(declare-fun thiss!193 () ListLongMap!9009)

(declare-fun isStrictlySorted!444 (List!15974) Bool)

(assert (=> start!71970 (not (isStrictlySorted!444 (toList!4520 thiss!193)))))

(declare-fun e!466491 () Bool)

(declare-fun inv!27241 (ListLongMap!9009) Bool)

(assert (=> start!71970 (and (inv!27241 thiss!193) e!466491)))

(declare-fun b!836219 () Bool)

(declare-fun tp!47390 () Bool)

(assert (=> b!836219 (= e!466491 tp!47390)))

(assert (= start!71970 b!836219))

(declare-fun m!781625 () Bool)

(assert (=> start!71970 m!781625))

(declare-fun m!781627 () Bool)

(assert (=> start!71970 m!781627))

(check-sat (not start!71970) (not b!836219))
(check-sat)
(get-model)

(declare-fun d!107537 () Bool)

(declare-fun res!568955 () Bool)

(declare-fun e!466509 () Bool)

(assert (=> d!107537 (=> res!568955 e!466509)))

(get-info :version)

(assert (=> d!107537 (= res!568955 (or ((_ is Nil!15971) (toList!4520 thiss!193)) ((_ is Nil!15971) (t!22345 (toList!4520 thiss!193)))))))

(assert (=> d!107537 (= (isStrictlySorted!444 (toList!4520 thiss!193)) e!466509)))

(declare-fun b!836237 () Bool)

(declare-fun e!466510 () Bool)

(assert (=> b!836237 (= e!466509 e!466510)))

(declare-fun res!568956 () Bool)

(assert (=> b!836237 (=> (not res!568956) (not e!466510))))

(assert (=> b!836237 (= res!568956 (bvslt (_1!5110 (h!17101 (toList!4520 thiss!193))) (_1!5110 (h!17101 (t!22345 (toList!4520 thiss!193))))))))

(declare-fun b!836238 () Bool)

(assert (=> b!836238 (= e!466510 (isStrictlySorted!444 (t!22345 (toList!4520 thiss!193))))))

(assert (= (and d!107537 (not res!568955)) b!836237))

(assert (= (and b!836237 res!568956) b!836238))

(declare-fun m!781635 () Bool)

(assert (=> b!836238 m!781635))

(assert (=> start!71970 d!107537))

(declare-fun d!107545 () Bool)

(assert (=> d!107545 (= (inv!27241 thiss!193) (isStrictlySorted!444 (toList!4520 thiss!193)))))

(declare-fun bs!23472 () Bool)

(assert (= bs!23472 d!107545))

(assert (=> bs!23472 m!781625))

(assert (=> start!71970 d!107545))

(declare-fun b!836254 () Bool)

(declare-fun e!466520 () Bool)

(declare-fun tp_is_empty!15243 () Bool)

(declare-fun tp!47401 () Bool)

(assert (=> b!836254 (= e!466520 (and tp_is_empty!15243 tp!47401))))

(assert (=> b!836219 (= tp!47390 e!466520)))

(assert (= (and b!836219 ((_ is Cons!15970) (toList!4520 thiss!193))) b!836254))

(check-sat (not b!836238) (not d!107545) (not b!836254) tp_is_empty!15243)
(check-sat)
