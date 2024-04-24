; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75196 () Bool)

(assert start!75196)

(declare-datatypes ((B!1226 0))(
  ( (B!1227 (val!8919 Int)) )
))
(declare-datatypes ((tuple2!11762 0))(
  ( (tuple2!11763 (_1!5892 (_ BitVec 64)) (_2!5892 B!1226)) )
))
(declare-datatypes ((List!17590 0))(
  ( (Nil!17587) (Cons!17586 (h!18723 tuple2!11762) (t!24859 List!17590)) )
))
(declare-datatypes ((ListLongMap!10533 0))(
  ( (ListLongMap!10534 (toList!5282 List!17590)) )
))
(declare-fun lm!210 () ListLongMap!10533)

(declare-fun isStrictlySorted!450 (List!17590) Bool)

(assert (=> start!75196 (not (isStrictlySorted!450 (toList!5282 lm!210)))))

(declare-fun e!493089 () Bool)

(declare-fun inv!29361 (ListLongMap!10533) Bool)

(assert (=> start!75196 (and (inv!29361 lm!210) e!493089)))

(declare-fun b!885880 () Bool)

(declare-fun tp!54195 () Bool)

(assert (=> b!885880 (= e!493089 tp!54195)))

(assert (= start!75196 b!885880))

(declare-fun m!826529 () Bool)

(assert (=> start!75196 m!826529))

(declare-fun m!826531 () Bool)

(assert (=> start!75196 m!826531))

(check-sat (not start!75196) (not b!885880))
(check-sat)
(get-model)

(declare-fun d!109615 () Bool)

(declare-fun res!601513 () Bool)

(declare-fun e!493108 () Bool)

(assert (=> d!109615 (=> res!601513 e!493108)))

(get-info :version)

(assert (=> d!109615 (= res!601513 (or ((_ is Nil!17587) (toList!5282 lm!210)) ((_ is Nil!17587) (t!24859 (toList!5282 lm!210)))))))

(assert (=> d!109615 (= (isStrictlySorted!450 (toList!5282 lm!210)) e!493108)))

(declare-fun b!885899 () Bool)

(declare-fun e!493109 () Bool)

(assert (=> b!885899 (= e!493108 e!493109)))

(declare-fun res!601514 () Bool)

(assert (=> b!885899 (=> (not res!601514) (not e!493109))))

(assert (=> b!885899 (= res!601514 (bvslt (_1!5892 (h!18723 (toList!5282 lm!210))) (_1!5892 (h!18723 (t!24859 (toList!5282 lm!210))))))))

(declare-fun b!885900 () Bool)

(assert (=> b!885900 (= e!493109 (isStrictlySorted!450 (t!24859 (toList!5282 lm!210))))))

(assert (= (and d!109615 (not res!601513)) b!885899))

(assert (= (and b!885899 res!601514) b!885900))

(declare-fun m!826541 () Bool)

(assert (=> b!885900 m!826541))

(assert (=> start!75196 d!109615))

(declare-fun d!109621 () Bool)

(assert (=> d!109621 (= (inv!29361 lm!210) (isStrictlySorted!450 (toList!5282 lm!210)))))

(declare-fun bs!24814 () Bool)

(assert (= bs!24814 d!109621))

(assert (=> bs!24814 m!826529))

(assert (=> start!75196 d!109621))

(declare-fun b!885917 () Bool)

(declare-fun e!493120 () Bool)

(declare-fun tp_is_empty!17737 () Bool)

(declare-fun tp!54208 () Bool)

(assert (=> b!885917 (= e!493120 (and tp_is_empty!17737 tp!54208))))

(assert (=> b!885880 (= tp!54195 e!493120)))

(assert (= (and b!885880 ((_ is Cons!17586) (toList!5282 lm!210))) b!885917))

(check-sat (not d!109621) (not b!885900) (not b!885917) tp_is_empty!17737)
(check-sat)
