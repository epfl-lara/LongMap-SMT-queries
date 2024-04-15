; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75010 () Bool)

(assert start!75010)

(declare-datatypes ((B!1226 0))(
  ( (B!1227 (val!8919 Int)) )
))
(declare-datatypes ((tuple2!11852 0))(
  ( (tuple2!11853 (_1!5937 (_ BitVec 64)) (_2!5937 B!1226)) )
))
(declare-datatypes ((List!17643 0))(
  ( (Nil!17640) (Cons!17639 (h!18770 tuple2!11852) (t!24911 List!17643)) )
))
(declare-datatypes ((ListLongMap!10611 0))(
  ( (ListLongMap!10612 (toList!5321 List!17643)) )
))
(declare-fun lm!210 () ListLongMap!10611)

(declare-fun isStrictlySorted!458 (List!17643) Bool)

(assert (=> start!75010 (not (isStrictlySorted!458 (toList!5321 lm!210)))))

(declare-fun e!492359 () Bool)

(declare-fun inv!29361 (ListLongMap!10611) Bool)

(assert (=> start!75010 (and (inv!29361 lm!210) e!492359)))

(declare-fun b!884738 () Bool)

(declare-fun tp!54195 () Bool)

(assert (=> b!884738 (= e!492359 tp!54195)))

(assert (= start!75010 b!884738))

(declare-fun m!824477 () Bool)

(assert (=> start!75010 m!824477))

(declare-fun m!824479 () Bool)

(assert (=> start!75010 m!824479))

(check-sat (not start!75010) (not b!884738))
(check-sat)
(get-model)

(declare-fun d!109095 () Bool)

(declare-fun res!601059 () Bool)

(declare-fun e!492378 () Bool)

(assert (=> d!109095 (=> res!601059 e!492378)))

(get-info :version)

(assert (=> d!109095 (= res!601059 (or ((_ is Nil!17640) (toList!5321 lm!210)) ((_ is Nil!17640) (t!24911 (toList!5321 lm!210)))))))

(assert (=> d!109095 (= (isStrictlySorted!458 (toList!5321 lm!210)) e!492378)))

(declare-fun b!884757 () Bool)

(declare-fun e!492379 () Bool)

(assert (=> b!884757 (= e!492378 e!492379)))

(declare-fun res!601060 () Bool)

(assert (=> b!884757 (=> (not res!601060) (not e!492379))))

(assert (=> b!884757 (= res!601060 (bvslt (_1!5937 (h!18770 (toList!5321 lm!210))) (_1!5937 (h!18770 (t!24911 (toList!5321 lm!210))))))))

(declare-fun b!884758 () Bool)

(assert (=> b!884758 (= e!492379 (isStrictlySorted!458 (t!24911 (toList!5321 lm!210))))))

(assert (= (and d!109095 (not res!601059)) b!884757))

(assert (= (and b!884757 res!601060) b!884758))

(declare-fun m!824489 () Bool)

(assert (=> b!884758 m!824489))

(assert (=> start!75010 d!109095))

(declare-fun d!109101 () Bool)

(assert (=> d!109101 (= (inv!29361 lm!210) (isStrictlySorted!458 (toList!5321 lm!210)))))

(declare-fun bs!24768 () Bool)

(assert (= bs!24768 d!109101))

(assert (=> bs!24768 m!824477))

(assert (=> start!75010 d!109101))

(declare-fun b!884771 () Bool)

(declare-fun e!492388 () Bool)

(declare-fun tp_is_empty!17737 () Bool)

(declare-fun tp!54206 () Bool)

(assert (=> b!884771 (= e!492388 (and tp_is_empty!17737 tp!54206))))

(assert (=> b!884738 (= tp!54195 e!492388)))

(assert (= (and b!884738 ((_ is Cons!17639) (toList!5321 lm!210))) b!884771))

(check-sat (not d!109101) (not b!884758) (not b!884771) tp_is_empty!17737)
(check-sat)
