; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5240 () Bool)

(assert start!5240)

(declare-datatypes ((B!794 0))(
  ( (B!795 (val!897 Int)) )
))
(declare-datatypes ((tuple2!1436 0))(
  ( (tuple2!1437 (_1!729 (_ BitVec 64)) (_2!729 B!794)) )
))
(declare-datatypes ((List!993 0))(
  ( (Nil!990) (Cons!989 (h!1557 tuple2!1436) (t!3826 List!993)) )
))
(declare-datatypes ((ListLongMap!1007 0))(
  ( (ListLongMap!1008 (toList!519 List!993)) )
))
(declare-fun lm!266 () ListLongMap!1007)

(declare-fun isStrictlySorted!190 (List!993) Bool)

(assert (=> start!5240 (not (isStrictlySorted!190 (toList!519 lm!266)))))

(declare-fun e!24129 () Bool)

(declare-fun inv!1707 (ListLongMap!1007) Bool)

(assert (=> start!5240 (and (inv!1707 lm!266) e!24129)))

(declare-fun b!37963 () Bool)

(declare-fun tp!5651 () Bool)

(assert (=> b!37963 (= e!24129 tp!5651)))

(assert (= start!5240 b!37963))

(declare-fun m!30583 () Bool)

(assert (=> start!5240 m!30583))

(declare-fun m!30585 () Bool)

(assert (=> start!5240 m!30585))

(check-sat (not start!5240) (not b!37963))
(check-sat)
(get-model)

(declare-fun d!6141 () Bool)

(declare-fun res!22945 () Bool)

(declare-fun e!24149 () Bool)

(assert (=> d!6141 (=> res!22945 e!24149)))

(get-info :version)

(assert (=> d!6141 (= res!22945 (or ((_ is Nil!990) (toList!519 lm!266)) ((_ is Nil!990) (t!3826 (toList!519 lm!266)))))))

(assert (=> d!6141 (= (isStrictlySorted!190 (toList!519 lm!266)) e!24149)))

(declare-fun b!37983 () Bool)

(declare-fun e!24151 () Bool)

(assert (=> b!37983 (= e!24149 e!24151)))

(declare-fun res!22947 () Bool)

(assert (=> b!37983 (=> (not res!22947) (not e!24151))))

(assert (=> b!37983 (= res!22947 (bvslt (_1!729 (h!1557 (toList!519 lm!266))) (_1!729 (h!1557 (t!3826 (toList!519 lm!266))))))))

(declare-fun b!37985 () Bool)

(assert (=> b!37985 (= e!24151 (isStrictlySorted!190 (t!3826 (toList!519 lm!266))))))

(assert (= (and d!6141 (not res!22945)) b!37983))

(assert (= (and b!37983 res!22947) b!37985))

(declare-fun m!30597 () Bool)

(assert (=> b!37985 m!30597))

(assert (=> start!5240 d!6141))

(declare-fun d!6148 () Bool)

(assert (=> d!6148 (= (inv!1707 lm!266) (isStrictlySorted!190 (toList!519 lm!266)))))

(declare-fun bs!1518 () Bool)

(assert (= bs!1518 d!6148))

(assert (=> bs!1518 m!30583))

(assert (=> start!5240 d!6148))

(declare-fun b!38002 () Bool)

(declare-fun e!24162 () Bool)

(declare-fun tp_is_empty!1718 () Bool)

(declare-fun tp!5666 () Bool)

(assert (=> b!38002 (= e!24162 (and tp_is_empty!1718 tp!5666))))

(assert (=> b!37963 (= tp!5651 e!24162)))

(assert (= (and b!37963 ((_ is Cons!989) (toList!519 lm!266))) b!38002))

(check-sat (not d!6148) (not b!37985) (not b!38002) tp_is_empty!1718)
(check-sat)
