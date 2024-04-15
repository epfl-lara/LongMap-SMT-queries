; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88652 () Bool)

(assert start!88652)

(declare-fun res!682956 () Bool)

(declare-fun e!573100 () Bool)

(assert (=> start!88652 (=> (not res!682956) (not e!573100))))

(declare-datatypes ((B!1664 0))(
  ( (B!1665 (val!11916 Int)) )
))
(declare-datatypes ((tuple2!15458 0))(
  ( (tuple2!15459 (_1!7740 (_ BitVec 64)) (_2!7740 B!1664)) )
))
(declare-datatypes ((List!21639 0))(
  ( (Nil!21636) (Cons!21635 (h!22833 tuple2!15458) (t!30634 List!21639)) )
))
(declare-fun l!996 () List!21639)

(declare-fun isStrictlySorted!665 (List!21639) Bool)

(assert (=> start!88652 (= res!682956 (isStrictlySorted!665 l!996))))

(assert (=> start!88652 e!573100))

(declare-fun e!573101 () Bool)

(assert (=> start!88652 e!573101))

(assert (=> start!88652 true))

(declare-fun b!1018505 () Bool)

(declare-fun res!682957 () Bool)

(assert (=> b!1018505 (=> (not res!682957) (not e!573100))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!529 (List!21639 (_ BitVec 64)) Bool)

(assert (=> b!1018505 (= res!682957 (containsKey!529 l!996 key!261))))

(declare-fun b!1018506 () Bool)

(declare-fun ListPrimitiveSize!133 (List!21639) Int)

(assert (=> b!1018506 (= e!573100 (< (ListPrimitiveSize!133 l!996) 0))))

(declare-fun b!1018507 () Bool)

(declare-fun tp_is_empty!23731 () Bool)

(declare-fun tp!71077 () Bool)

(assert (=> b!1018507 (= e!573101 (and tp_is_empty!23731 tp!71077))))

(assert (= (and start!88652 res!682956) b!1018505))

(assert (= (and b!1018505 res!682957) b!1018506))

(get-info :version)

(assert (= (and start!88652 ((_ is Cons!21635) l!996)) b!1018507))

(declare-fun m!938815 () Bool)

(assert (=> start!88652 m!938815))

(declare-fun m!938817 () Bool)

(assert (=> b!1018505 m!938817))

(declare-fun m!938819 () Bool)

(assert (=> b!1018506 m!938819))

(check-sat (not b!1018505) tp_is_empty!23731 (not b!1018507) (not start!88652) (not b!1018506))
(check-sat)
(get-model)

(declare-fun d!121769 () Bool)

(declare-fun res!682974 () Bool)

(declare-fun e!573118 () Bool)

(assert (=> d!121769 (=> res!682974 e!573118)))

(assert (=> d!121769 (= res!682974 (or ((_ is Nil!21636) l!996) ((_ is Nil!21636) (t!30634 l!996))))))

(assert (=> d!121769 (= (isStrictlySorted!665 l!996) e!573118)))

(declare-fun b!1018530 () Bool)

(declare-fun e!573119 () Bool)

(assert (=> b!1018530 (= e!573118 e!573119)))

(declare-fun res!682975 () Bool)

(assert (=> b!1018530 (=> (not res!682975) (not e!573119))))

(assert (=> b!1018530 (= res!682975 (bvslt (_1!7740 (h!22833 l!996)) (_1!7740 (h!22833 (t!30634 l!996)))))))

(declare-fun b!1018531 () Bool)

(assert (=> b!1018531 (= e!573119 (isStrictlySorted!665 (t!30634 l!996)))))

(assert (= (and d!121769 (not res!682974)) b!1018530))

(assert (= (and b!1018530 res!682975) b!1018531))

(declare-fun m!938833 () Bool)

(assert (=> b!1018531 m!938833))

(assert (=> start!88652 d!121769))

(declare-fun d!121775 () Bool)

(declare-fun lt!449386 () Int)

(assert (=> d!121775 (>= lt!449386 0)))

(declare-fun e!573131 () Int)

(assert (=> d!121775 (= lt!449386 e!573131)))

(declare-fun c!103159 () Bool)

(assert (=> d!121775 (= c!103159 ((_ is Nil!21636) l!996))))

(assert (=> d!121775 (= (ListPrimitiveSize!133 l!996) lt!449386)))

(declare-fun b!1018548 () Bool)

(assert (=> b!1018548 (= e!573131 0)))

(declare-fun b!1018549 () Bool)

(assert (=> b!1018549 (= e!573131 (+ 1 (ListPrimitiveSize!133 (t!30634 l!996))))))

(assert (= (and d!121775 c!103159) b!1018548))

(assert (= (and d!121775 (not c!103159)) b!1018549))

(declare-fun m!938839 () Bool)

(assert (=> b!1018549 m!938839))

(assert (=> b!1018506 d!121775))

(declare-fun d!121781 () Bool)

(declare-fun res!682992 () Bool)

(declare-fun e!573145 () Bool)

(assert (=> d!121781 (=> res!682992 e!573145)))

(assert (=> d!121781 (= res!682992 (and ((_ is Cons!21635) l!996) (= (_1!7740 (h!22833 l!996)) key!261)))))

(assert (=> d!121781 (= (containsKey!529 l!996 key!261) e!573145)))

(declare-fun b!1018566 () Bool)

(declare-fun e!573146 () Bool)

(assert (=> b!1018566 (= e!573145 e!573146)))

(declare-fun res!682993 () Bool)

(assert (=> b!1018566 (=> (not res!682993) (not e!573146))))

(assert (=> b!1018566 (= res!682993 (and (or (not ((_ is Cons!21635) l!996)) (bvsle (_1!7740 (h!22833 l!996)) key!261)) ((_ is Cons!21635) l!996) (bvslt (_1!7740 (h!22833 l!996)) key!261)))))

(declare-fun b!1018567 () Bool)

(assert (=> b!1018567 (= e!573146 (containsKey!529 (t!30634 l!996) key!261))))

(assert (= (and d!121781 (not res!682992)) b!1018566))

(assert (= (and b!1018566 res!682993) b!1018567))

(declare-fun m!938845 () Bool)

(assert (=> b!1018567 m!938845))

(assert (=> b!1018505 d!121781))

(declare-fun b!1018580 () Bool)

(declare-fun e!573157 () Bool)

(declare-fun tp!71086 () Bool)

(assert (=> b!1018580 (= e!573157 (and tp_is_empty!23731 tp!71086))))

(assert (=> b!1018507 (= tp!71077 e!573157)))

(assert (= (and b!1018507 ((_ is Cons!21635) (t!30634 l!996))) b!1018580))

(check-sat (not b!1018549) (not b!1018531) tp_is_empty!23731 (not b!1018567) (not b!1018580))
(check-sat)
