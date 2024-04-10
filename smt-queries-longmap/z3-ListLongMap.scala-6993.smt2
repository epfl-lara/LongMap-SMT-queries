; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88656 () Bool)

(assert start!88656)

(declare-fun res!683029 () Bool)

(declare-fun e!573195 () Bool)

(assert (=> start!88656 (=> (not res!683029) (not e!573195))))

(declare-datatypes ((B!1666 0))(
  ( (B!1667 (val!11917 Int)) )
))
(declare-datatypes ((tuple2!15380 0))(
  ( (tuple2!15381 (_1!7701 (_ BitVec 64)) (_2!7701 B!1666)) )
))
(declare-datatypes ((List!21605 0))(
  ( (Nil!21602) (Cons!21601 (h!22799 tuple2!15380) (t!30609 List!21605)) )
))
(declare-fun l!996 () List!21605)

(declare-fun isStrictlySorted!670 (List!21605) Bool)

(assert (=> start!88656 (= res!683029 (isStrictlySorted!670 l!996))))

(assert (=> start!88656 e!573195))

(declare-fun e!573194 () Bool)

(assert (=> start!88656 e!573194))

(assert (=> start!88656 true))

(declare-fun b!1018659 () Bool)

(declare-fun res!683030 () Bool)

(assert (=> b!1018659 (=> (not res!683030) (not e!573195))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!530 (List!21605 (_ BitVec 64)) Bool)

(assert (=> b!1018659 (= res!683030 (containsKey!530 l!996 key!261))))

(declare-fun b!1018660 () Bool)

(declare-fun ListPrimitiveSize!134 (List!21605) Int)

(assert (=> b!1018660 (= e!573195 (< (ListPrimitiveSize!134 l!996) 0))))

(declare-fun b!1018661 () Bool)

(declare-fun tp_is_empty!23733 () Bool)

(declare-fun tp!71080 () Bool)

(assert (=> b!1018661 (= e!573194 (and tp_is_empty!23733 tp!71080))))

(assert (= (and start!88656 res!683029) b!1018659))

(assert (= (and b!1018659 res!683030) b!1018660))

(get-info :version)

(assert (= (and start!88656 ((_ is Cons!21601) l!996)) b!1018661))

(declare-fun m!939439 () Bool)

(assert (=> start!88656 m!939439))

(declare-fun m!939441 () Bool)

(assert (=> b!1018659 m!939441))

(declare-fun m!939443 () Bool)

(assert (=> b!1018660 m!939443))

(check-sat (not b!1018659) (not b!1018660) (not start!88656) tp_is_empty!23733 (not b!1018661))
(check-sat)
(get-model)

(declare-fun d!121919 () Bool)

(declare-fun res!683045 () Bool)

(declare-fun e!573213 () Bool)

(assert (=> d!121919 (=> res!683045 e!573213)))

(assert (=> d!121919 (= res!683045 (and ((_ is Cons!21601) l!996) (= (_1!7701 (h!22799 l!996)) key!261)))))

(assert (=> d!121919 (= (containsKey!530 l!996 key!261) e!573213)))

(declare-fun b!1018685 () Bool)

(declare-fun e!573214 () Bool)

(assert (=> b!1018685 (= e!573213 e!573214)))

(declare-fun res!683046 () Bool)

(assert (=> b!1018685 (=> (not res!683046) (not e!573214))))

(assert (=> b!1018685 (= res!683046 (and (or (not ((_ is Cons!21601) l!996)) (bvsle (_1!7701 (h!22799 l!996)) key!261)) ((_ is Cons!21601) l!996) (bvslt (_1!7701 (h!22799 l!996)) key!261)))))

(declare-fun b!1018686 () Bool)

(assert (=> b!1018686 (= e!573214 (containsKey!530 (t!30609 l!996) key!261))))

(assert (= (and d!121919 (not res!683045)) b!1018685))

(assert (= (and b!1018685 res!683046) b!1018686))

(declare-fun m!939453 () Bool)

(assert (=> b!1018686 m!939453))

(assert (=> b!1018659 d!121919))

(declare-fun d!121927 () Bool)

(declare-fun lt!449586 () Int)

(assert (=> d!121927 (>= lt!449586 0)))

(declare-fun e!573227 () Int)

(assert (=> d!121927 (= lt!449586 e!573227)))

(declare-fun c!103195 () Bool)

(assert (=> d!121927 (= c!103195 ((_ is Nil!21602) l!996))))

(assert (=> d!121927 (= (ListPrimitiveSize!134 l!996) lt!449586)))

(declare-fun b!1018701 () Bool)

(assert (=> b!1018701 (= e!573227 0)))

(declare-fun b!1018702 () Bool)

(assert (=> b!1018702 (= e!573227 (+ 1 (ListPrimitiveSize!134 (t!30609 l!996))))))

(assert (= (and d!121927 c!103195) b!1018701))

(assert (= (and d!121927 (not c!103195)) b!1018702))

(declare-fun m!939457 () Bool)

(assert (=> b!1018702 m!939457))

(assert (=> b!1018660 d!121927))

(declare-fun d!121931 () Bool)

(declare-fun res!683069 () Bool)

(declare-fun e!573242 () Bool)

(assert (=> d!121931 (=> res!683069 e!573242)))

(assert (=> d!121931 (= res!683069 (or ((_ is Nil!21602) l!996) ((_ is Nil!21602) (t!30609 l!996))))))

(assert (=> d!121931 (= (isStrictlySorted!670 l!996) e!573242)))

(declare-fun b!1018719 () Bool)

(declare-fun e!573243 () Bool)

(assert (=> b!1018719 (= e!573242 e!573243)))

(declare-fun res!683070 () Bool)

(assert (=> b!1018719 (=> (not res!683070) (not e!573243))))

(assert (=> b!1018719 (= res!683070 (bvslt (_1!7701 (h!22799 l!996)) (_1!7701 (h!22799 (t!30609 l!996)))))))

(declare-fun b!1018720 () Bool)

(assert (=> b!1018720 (= e!573243 (isStrictlySorted!670 (t!30609 l!996)))))

(assert (= (and d!121931 (not res!683069)) b!1018719))

(assert (= (and b!1018719 res!683070) b!1018720))

(declare-fun m!939463 () Bool)

(assert (=> b!1018720 m!939463))

(assert (=> start!88656 d!121931))

(declare-fun b!1018733 () Bool)

(declare-fun e!573251 () Bool)

(declare-fun tp!71088 () Bool)

(assert (=> b!1018733 (= e!573251 (and tp_is_empty!23733 tp!71088))))

(assert (=> b!1018661 (= tp!71080 e!573251)))

(assert (= (and b!1018661 ((_ is Cons!21601) (t!30609 l!996))) b!1018733))

(check-sat (not b!1018720) tp_is_empty!23733 (not b!1018686) (not b!1018702) (not b!1018733))
(check-sat)
