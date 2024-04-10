; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132880 () Bool)

(assert start!132880)

(declare-fun b!1556171 () Bool)

(declare-fun res!1064665 () Bool)

(declare-fun e!866702 () Bool)

(assert (=> b!1556171 (=> (not res!1064665) (not e!866702))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2344 0))(
  ( (B!2345 (val!19258 Int)) )
))
(declare-datatypes ((tuple2!24892 0))(
  ( (tuple2!24893 (_1!12457 (_ BitVec 64)) (_2!12457 B!2344)) )
))
(declare-datatypes ((List!36292 0))(
  ( (Nil!36289) (Cons!36288 (h!37734 tuple2!24892) (t!51013 List!36292)) )
))
(declare-fun l!1177 () List!36292)

(get-info :version)

(assert (=> b!1556171 (= res!1064665 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36288) l!1177) (not (= (_1!12457 (h!37734 l!1177)) otherKey!50))))))

(declare-fun b!1556174 () Bool)

(declare-fun e!866701 () Bool)

(declare-fun tp_is_empty!38355 () Bool)

(declare-fun tp!112410 () Bool)

(assert (=> b!1556174 (= e!866701 (and tp_is_empty!38355 tp!112410))))

(declare-fun b!1556173 () Bool)

(declare-fun ListPrimitiveSize!179 (List!36292) Int)

(assert (=> b!1556173 (= e!866702 (>= (ListPrimitiveSize!179 (t!51013 l!1177)) (ListPrimitiveSize!179 l!1177)))))

(declare-fun res!1064663 () Bool)

(assert (=> start!132880 (=> (not res!1064663) (not e!866702))))

(declare-fun isStrictlySorted!945 (List!36292) Bool)

(assert (=> start!132880 (= res!1064663 (isStrictlySorted!945 l!1177))))

(assert (=> start!132880 e!866702))

(assert (=> start!132880 e!866701))

(assert (=> start!132880 true))

(declare-fun b!1556172 () Bool)

(declare-fun res!1064664 () Bool)

(assert (=> b!1556172 (=> (not res!1064664) (not e!866702))))

(assert (=> b!1556172 (= res!1064664 (isStrictlySorted!945 (t!51013 l!1177)))))

(assert (= (and start!132880 res!1064663) b!1556171))

(assert (= (and b!1556171 res!1064665) b!1556172))

(assert (= (and b!1556172 res!1064664) b!1556173))

(assert (= (and start!132880 ((_ is Cons!36288) l!1177)) b!1556174))

(declare-fun m!1433801 () Bool)

(assert (=> b!1556173 m!1433801))

(declare-fun m!1433803 () Bool)

(assert (=> b!1556173 m!1433803))

(declare-fun m!1433805 () Bool)

(assert (=> start!132880 m!1433805))

(declare-fun m!1433807 () Bool)

(assert (=> b!1556172 m!1433807))

(check-sat (not b!1556172) (not b!1556174) tp_is_empty!38355 (not start!132880) (not b!1556173))
(check-sat)
(get-model)

(declare-fun d!162077 () Bool)

(declare-fun res!1064679 () Bool)

(declare-fun e!866713 () Bool)

(assert (=> d!162077 (=> res!1064679 e!866713)))

(assert (=> d!162077 (= res!1064679 (or ((_ is Nil!36289) (t!51013 l!1177)) ((_ is Nil!36289) (t!51013 (t!51013 l!1177)))))))

(assert (=> d!162077 (= (isStrictlySorted!945 (t!51013 l!1177)) e!866713)))

(declare-fun b!1556191 () Bool)

(declare-fun e!866714 () Bool)

(assert (=> b!1556191 (= e!866713 e!866714)))

(declare-fun res!1064680 () Bool)

(assert (=> b!1556191 (=> (not res!1064680) (not e!866714))))

(assert (=> b!1556191 (= res!1064680 (bvslt (_1!12457 (h!37734 (t!51013 l!1177))) (_1!12457 (h!37734 (t!51013 (t!51013 l!1177))))))))

(declare-fun b!1556192 () Bool)

(assert (=> b!1556192 (= e!866714 (isStrictlySorted!945 (t!51013 (t!51013 l!1177))))))

(assert (= (and d!162077 (not res!1064679)) b!1556191))

(assert (= (and b!1556191 res!1064680) b!1556192))

(declare-fun m!1433817 () Bool)

(assert (=> b!1556192 m!1433817))

(assert (=> b!1556172 d!162077))

(declare-fun d!162081 () Bool)

(declare-fun lt!670382 () Int)

(assert (=> d!162081 (>= lt!670382 0)))

(declare-fun e!866725 () Int)

(assert (=> d!162081 (= lt!670382 e!866725)))

(declare-fun c!143717 () Bool)

(assert (=> d!162081 (= c!143717 ((_ is Nil!36289) (t!51013 l!1177)))))

(assert (=> d!162081 (= (ListPrimitiveSize!179 (t!51013 l!1177)) lt!670382)))

(declare-fun b!1556205 () Bool)

(assert (=> b!1556205 (= e!866725 0)))

(declare-fun b!1556206 () Bool)

(assert (=> b!1556206 (= e!866725 (+ 1 (ListPrimitiveSize!179 (t!51013 (t!51013 l!1177)))))))

(assert (= (and d!162081 c!143717) b!1556205))

(assert (= (and d!162081 (not c!143717)) b!1556206))

(declare-fun m!1433819 () Bool)

(assert (=> b!1556206 m!1433819))

(assert (=> b!1556173 d!162081))

(declare-fun d!162085 () Bool)

(declare-fun lt!670383 () Int)

(assert (=> d!162085 (>= lt!670383 0)))

(declare-fun e!866728 () Int)

(assert (=> d!162085 (= lt!670383 e!866728)))

(declare-fun c!143718 () Bool)

(assert (=> d!162085 (= c!143718 ((_ is Nil!36289) l!1177))))

(assert (=> d!162085 (= (ListPrimitiveSize!179 l!1177) lt!670383)))

(declare-fun b!1556209 () Bool)

(assert (=> b!1556209 (= e!866728 0)))

(declare-fun b!1556210 () Bool)

(assert (=> b!1556210 (= e!866728 (+ 1 (ListPrimitiveSize!179 (t!51013 l!1177))))))

(assert (= (and d!162085 c!143718) b!1556209))

(assert (= (and d!162085 (not c!143718)) b!1556210))

(assert (=> b!1556210 m!1433801))

(assert (=> b!1556173 d!162085))

(declare-fun d!162089 () Bool)

(declare-fun res!1064695 () Bool)

(declare-fun e!866733 () Bool)

(assert (=> d!162089 (=> res!1064695 e!866733)))

(assert (=> d!162089 (= res!1064695 (or ((_ is Nil!36289) l!1177) ((_ is Nil!36289) (t!51013 l!1177))))))

(assert (=> d!162089 (= (isStrictlySorted!945 l!1177) e!866733)))

(declare-fun b!1556215 () Bool)

(declare-fun e!866734 () Bool)

(assert (=> b!1556215 (= e!866733 e!866734)))

(declare-fun res!1064696 () Bool)

(assert (=> b!1556215 (=> (not res!1064696) (not e!866734))))

(assert (=> b!1556215 (= res!1064696 (bvslt (_1!12457 (h!37734 l!1177)) (_1!12457 (h!37734 (t!51013 l!1177)))))))

(declare-fun b!1556216 () Bool)

(assert (=> b!1556216 (= e!866734 (isStrictlySorted!945 (t!51013 l!1177)))))

(assert (= (and d!162089 (not res!1064695)) b!1556215))

(assert (= (and b!1556215 res!1064696) b!1556216))

(assert (=> b!1556216 m!1433807))

(assert (=> start!132880 d!162089))

(declare-fun b!1556223 () Bool)

(declare-fun e!866739 () Bool)

(declare-fun tp!112416 () Bool)

(assert (=> b!1556223 (= e!866739 (and tp_is_empty!38355 tp!112416))))

(assert (=> b!1556174 (= tp!112410 e!866739)))

(assert (= (and b!1556174 ((_ is Cons!36288) (t!51013 l!1177))) b!1556223))

(check-sat (not b!1556206) (not b!1556223) (not b!1556210) (not b!1556216) (not b!1556192) tp_is_empty!38355)
(check-sat)
