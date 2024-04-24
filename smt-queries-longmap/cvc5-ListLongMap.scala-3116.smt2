; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43780 () Bool)

(assert start!43780)

(declare-fun res!288366 () Bool)

(declare-fun e!284838 () Bool)

(assert (=> start!43780 (=> (not res!288366) (not e!284838))))

(declare-datatypes ((B!1122 0))(
  ( (B!1123 (val!7013 Int)) )
))
(declare-datatypes ((tuple2!9142 0))(
  ( (tuple2!9143 (_1!4582 (_ BitVec 64)) (_2!4582 B!1122)) )
))
(declare-datatypes ((List!9179 0))(
  ( (Nil!9176) (Cons!9175 (h!10031 tuple2!9142) (t!15393 List!9179)) )
))
(declare-fun l!956 () List!9179)

(declare-fun isStrictlySorted!404 (List!9179) Bool)

(assert (=> start!43780 (= res!288366 (isStrictlySorted!404 l!956))))

(assert (=> start!43780 e!284838))

(declare-fun e!284837 () Bool)

(assert (=> start!43780 e!284837))

(assert (=> start!43780 true))

(declare-fun b!483929 () Bool)

(declare-fun res!288367 () Bool)

(assert (=> b!483929 (=> (not res!288367) (not e!284838))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!379 (List!9179 (_ BitVec 64)) Bool)

(assert (=> b!483929 (= res!288367 (not (containsKey!379 l!956 key!251)))))

(declare-fun b!483930 () Bool)

(declare-fun ListPrimitiveSize!63 (List!9179) Int)

(assert (=> b!483930 (= e!284838 (< (ListPrimitiveSize!63 l!956) 0))))

(declare-fun b!483931 () Bool)

(declare-fun tp_is_empty!13931 () Bool)

(declare-fun tp!43486 () Bool)

(assert (=> b!483931 (= e!284837 (and tp_is_empty!13931 tp!43486))))

(assert (= (and start!43780 res!288366) b!483929))

(assert (= (and b!483929 res!288367) b!483930))

(assert (= (and start!43780 (is-Cons!9175 l!956)) b!483931))

(declare-fun m!465037 () Bool)

(assert (=> start!43780 m!465037))

(declare-fun m!465039 () Bool)

(assert (=> b!483929 m!465039))

(declare-fun m!465041 () Bool)

(assert (=> b!483930 m!465041))

(push 1)

(assert (not b!483929))

(assert tp_is_empty!13931)

(assert (not b!483930))

(assert (not b!483931))

(assert (not start!43780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77059 () Bool)

(declare-fun res!288378 () Bool)

(declare-fun e!284852 () Bool)

(assert (=> d!77059 (=> res!288378 e!284852)))

(assert (=> d!77059 (= res!288378 (and (is-Cons!9175 l!956) (= (_1!4582 (h!10031 l!956)) key!251)))))

(assert (=> d!77059 (= (containsKey!379 l!956 key!251) e!284852)))

(declare-fun b!483948 () Bool)

(declare-fun e!284853 () Bool)

(assert (=> b!483948 (= e!284852 e!284853)))

(declare-fun res!288379 () Bool)

(assert (=> b!483948 (=> (not res!288379) (not e!284853))))

(assert (=> b!483948 (= res!288379 (and (or (not (is-Cons!9175 l!956)) (bvsle (_1!4582 (h!10031 l!956)) key!251)) (is-Cons!9175 l!956) (bvslt (_1!4582 (h!10031 l!956)) key!251)))))

(declare-fun b!483949 () Bool)

(assert (=> b!483949 (= e!284853 (containsKey!379 (t!15393 l!956) key!251))))

(assert (= (and d!77059 (not res!288378)) b!483948))

(assert (= (and b!483948 res!288379) b!483949))

(declare-fun m!465047 () Bool)

(assert (=> b!483949 m!465047))

(assert (=> b!483929 d!77059))

(declare-fun d!77065 () Bool)

(declare-fun res!288390 () Bool)

(declare-fun e!284867 () Bool)

(assert (=> d!77065 (=> res!288390 e!284867)))

(assert (=> d!77065 (= res!288390 (or (is-Nil!9176 l!956) (is-Nil!9176 (t!15393 l!956))))))

(assert (=> d!77065 (= (isStrictlySorted!404 l!956) e!284867)))

(declare-fun b!483966 () Bool)

(declare-fun e!284868 () Bool)

(assert (=> b!483966 (= e!284867 e!284868)))

(declare-fun res!288391 () Bool)

(assert (=> b!483966 (=> (not res!288391) (not e!284868))))

(assert (=> b!483966 (= res!288391 (bvslt (_1!4582 (h!10031 l!956)) (_1!4582 (h!10031 (t!15393 l!956)))))))

(declare-fun b!483967 () Bool)

(assert (=> b!483967 (= e!284868 (isStrictlySorted!404 (t!15393 l!956)))))

(assert (= (and d!77065 (not res!288390)) b!483966))

(assert (= (and b!483966 res!288391) b!483967))

(declare-fun m!465053 () Bool)

(assert (=> b!483967 m!465053))

(assert (=> start!43780 d!77065))

(declare-fun d!77071 () Bool)

(declare-fun lt!219352 () Int)

(assert (=> d!77071 (>= lt!219352 0)))

(declare-fun e!284881 () Int)

(assert (=> d!77071 (= lt!219352 e!284881)))

(declare-fun c!58145 () Bool)

(assert (=> d!77071 (= c!58145 (is-Nil!9176 l!956))))

(assert (=> d!77071 (= (ListPrimitiveSize!63 l!956) lt!219352)))

(declare-fun b!483982 () Bool)

(assert (=> b!483982 (= e!284881 0)))

(declare-fun b!483983 () Bool)

(assert (=> b!483983 (= e!284881 (+ 1 (ListPrimitiveSize!63 (t!15393 l!956))))))

(assert (= (and d!77071 c!58145) b!483982))

(assert (= (and d!77071 (not c!58145)) b!483983))

(declare-fun m!465057 () Bool)

(assert (=> b!483983 m!465057))

(assert (=> b!483930 d!77071))

(declare-fun b!483995 () Bool)

(declare-fun e!284889 () Bool)

(declare-fun tp!43492 () Bool)

(assert (=> b!483995 (= e!284889 (and tp_is_empty!13931 tp!43492))))

(assert (=> b!483931 (= tp!43486 e!284889)))

(assert (= (and b!483931 (is-Cons!9175 (t!15393 l!956))) b!483995))

(push 1)

(assert (not b!483995))

(assert tp_is_empty!13931)

(assert (not b!483967))

(assert (not b!483983))

(assert (not b!483949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

