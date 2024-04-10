; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2312 () Bool)

(assert start!2312)

(declare-fun res!11530 () Bool)

(declare-fun e!9166 () Bool)

(assert (=> start!2312 (=> (not res!11530) (not e!9166))))

(declare-datatypes ((B!586 0))(
  ( (B!587 (val!391 Int)) )
))
(declare-datatypes ((tuple2!582 0))(
  ( (tuple2!583 (_1!291 (_ BitVec 64)) (_2!291 B!586)) )
))
(declare-datatypes ((List!449 0))(
  ( (Nil!446) (Cons!445 (h!1011 tuple2!582) (t!2851 List!449)) )
))
(declare-datatypes ((ListLongMap!413 0))(
  ( (ListLongMap!414 (toList!222 List!449)) )
))
(declare-fun thiss!169 () ListLongMap!413)

(declare-fun isEmpty!112 (ListLongMap!413) Bool)

(assert (=> start!2312 (= res!11530 (not (isEmpty!112 thiss!169)))))

(assert (=> start!2312 e!9166))

(declare-fun e!9167 () Bool)

(declare-fun inv!753 (ListLongMap!413) Bool)

(assert (=> start!2312 (and (inv!753 thiss!169) e!9167)))

(declare-fun b!15166 () Bool)

(assert (=> b!15166 (= e!9166 (= (toList!222 thiss!169) Nil!446))))

(declare-fun b!15167 () Bool)

(declare-fun tp!2450 () Bool)

(assert (=> b!15167 (= e!9167 tp!2450)))

(assert (= (and start!2312 res!11530) b!15166))

(assert (= start!2312 b!15167))

(declare-fun m!10101 () Bool)

(assert (=> start!2312 m!10101))

(declare-fun m!10103 () Bool)

(assert (=> start!2312 m!10103))

(check-sat (not start!2312) (not b!15167))
(check-sat)
(get-model)

(declare-fun d!2525 () Bool)

(declare-fun isEmpty!115 (List!449) Bool)

(assert (=> d!2525 (= (isEmpty!112 thiss!169) (isEmpty!115 (toList!222 thiss!169)))))

(declare-fun bs!633 () Bool)

(assert (= bs!633 d!2525))

(declare-fun m!10111 () Bool)

(assert (=> bs!633 m!10111))

(assert (=> start!2312 d!2525))

(declare-fun d!2532 () Bool)

(declare-fun isStrictlySorted!133 (List!449) Bool)

(assert (=> d!2532 (= (inv!753 thiss!169) (isStrictlySorted!133 (toList!222 thiss!169)))))

(declare-fun bs!637 () Bool)

(assert (= bs!637 d!2532))

(declare-fun m!10117 () Bool)

(assert (=> bs!637 m!10117))

(assert (=> start!2312 d!2532))

(declare-fun b!15186 () Bool)

(declare-fun e!9180 () Bool)

(declare-fun tp_is_empty!765 () Bool)

(declare-fun tp!2460 () Bool)

(assert (=> b!15186 (= e!9180 (and tp_is_empty!765 tp!2460))))

(assert (=> b!15167 (= tp!2450 e!9180)))

(get-info :version)

(assert (= (and b!15167 ((_ is Cons!445) (toList!222 thiss!169))) b!15186))

(check-sat (not d!2525) (not d!2532) (not b!15186) tp_is_empty!765)
(check-sat)
(get-model)

(declare-fun d!2539 () Bool)

(assert (=> d!2539 (= (isEmpty!115 (toList!222 thiss!169)) ((_ is Nil!446) (toList!222 thiss!169)))))

(assert (=> d!2525 d!2539))

(declare-fun d!2541 () Bool)

(declare-fun res!11544 () Bool)

(declare-fun e!9194 () Bool)

(assert (=> d!2541 (=> res!11544 e!9194)))

(assert (=> d!2541 (= res!11544 (or ((_ is Nil!446) (toList!222 thiss!169)) ((_ is Nil!446) (t!2851 (toList!222 thiss!169)))))))

(assert (=> d!2541 (= (isStrictlySorted!133 (toList!222 thiss!169)) e!9194)))

(declare-fun b!15200 () Bool)

(declare-fun e!9195 () Bool)

(assert (=> b!15200 (= e!9194 e!9195)))

(declare-fun res!11545 () Bool)

(assert (=> b!15200 (=> (not res!11545) (not e!9195))))

(assert (=> b!15200 (= res!11545 (bvslt (_1!291 (h!1011 (toList!222 thiss!169))) (_1!291 (h!1011 (t!2851 (toList!222 thiss!169))))))))

(declare-fun b!15201 () Bool)

(assert (=> b!15201 (= e!9195 (isStrictlySorted!133 (t!2851 (toList!222 thiss!169))))))

(assert (= (and d!2541 (not res!11544)) b!15200))

(assert (= (and b!15200 res!11545) b!15201))

(declare-fun m!10123 () Bool)

(assert (=> b!15201 m!10123))

(assert (=> d!2532 d!2541))

(declare-fun b!15202 () Bool)

(declare-fun e!9196 () Bool)

(declare-fun tp!2464 () Bool)

(assert (=> b!15202 (= e!9196 (and tp_is_empty!765 tp!2464))))

(assert (=> b!15186 (= tp!2460 e!9196)))

(assert (= (and b!15186 ((_ is Cons!445) (t!2851 (toList!222 thiss!169)))) b!15202))

(check-sat (not b!15201) (not b!15202) tp_is_empty!765)
