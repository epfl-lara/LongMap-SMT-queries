; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5192 () Bool)

(assert start!5192)

(declare-fun res!22852 () Bool)

(declare-fun e!24024 () Bool)

(assert (=> start!5192 (=> (not res!22852) (not e!24024))))

(declare-datatypes ((B!782 0))(
  ( (B!783 (val!891 Int)) )
))
(declare-fun b!99 () B!782)

(declare-datatypes ((tuple2!1446 0))(
  ( (tuple2!1447 (_1!734 (_ BitVec 64)) (_2!734 B!782)) )
))
(declare-datatypes ((List!994 0))(
  ( (Nil!991) (Cons!990 (h!1558 tuple2!1446) (t!3826 List!994)) )
))
(declare-datatypes ((ListLongMap!1011 0))(
  ( (ListLongMap!1012 (toList!521 List!994)) )
))
(declare-fun lm!264 () ListLongMap!1011)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!473 (List!994 tuple2!1446) Bool)

(assert (=> start!5192 (= res!22852 (contains!473 (toList!521 lm!264) (tuple2!1447 a!526 b!99)))))

(assert (=> start!5192 e!24024))

(declare-fun e!24023 () Bool)

(declare-fun inv!1691 (ListLongMap!1011) Bool)

(assert (=> start!5192 (and (inv!1691 lm!264) e!24023)))

(assert (=> start!5192 true))

(declare-fun tp_is_empty!1705 () Bool)

(assert (=> start!5192 tp_is_empty!1705))

(declare-fun b!37860 () Bool)

(declare-fun isStrictlySorted!191 (List!994) Bool)

(assert (=> b!37860 (= e!24024 (not (isStrictlySorted!191 (toList!521 lm!264))))))

(declare-fun containsKey!59 (List!994 (_ BitVec 64)) Bool)

(assert (=> b!37860 (containsKey!59 (toList!521 lm!264) a!526)))

(declare-datatypes ((Unit!878 0))(
  ( (Unit!879) )
))
(declare-fun lt!13934 () Unit!878)

(declare-fun lemmaContainsTupleThenContainsKey!4 (List!994 (_ BitVec 64) B!782) Unit!878)

(assert (=> b!37860 (= lt!13934 (lemmaContainsTupleThenContainsKey!4 (toList!521 lm!264) a!526 b!99))))

(declare-fun b!37861 () Bool)

(declare-fun tp!5624 () Bool)

(assert (=> b!37861 (= e!24023 tp!5624)))

(assert (= (and start!5192 res!22852) b!37860))

(assert (= start!5192 b!37861))

(declare-fun m!30557 () Bool)

(assert (=> start!5192 m!30557))

(declare-fun m!30559 () Bool)

(assert (=> start!5192 m!30559))

(declare-fun m!30561 () Bool)

(assert (=> b!37860 m!30561))

(declare-fun m!30563 () Bool)

(assert (=> b!37860 m!30563))

(declare-fun m!30565 () Bool)

(assert (=> b!37860 m!30565))

(check-sat (not start!5192) (not b!37860) (not b!37861) tp_is_empty!1705)
(check-sat)
(get-model)

(declare-fun d!6107 () Bool)

(declare-fun lt!13943 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!22 (List!994) (InoxSet tuple2!1446))

(assert (=> d!6107 (= lt!13943 (select (content!22 (toList!521 lm!264)) (tuple2!1447 a!526 b!99)))))

(declare-fun e!24054 () Bool)

(assert (=> d!6107 (= lt!13943 e!24054)))

(declare-fun res!22875 () Bool)

(assert (=> d!6107 (=> (not res!22875) (not e!24054))))

(get-info :version)

(assert (=> d!6107 (= res!22875 ((_ is Cons!990) (toList!521 lm!264)))))

(assert (=> d!6107 (= (contains!473 (toList!521 lm!264) (tuple2!1447 a!526 b!99)) lt!13943)))

(declare-fun b!37890 () Bool)

(declare-fun e!24053 () Bool)

(assert (=> b!37890 (= e!24054 e!24053)))

(declare-fun res!22876 () Bool)

(assert (=> b!37890 (=> res!22876 e!24053)))

(assert (=> b!37890 (= res!22876 (= (h!1558 (toList!521 lm!264)) (tuple2!1447 a!526 b!99)))))

(declare-fun b!37891 () Bool)

(assert (=> b!37891 (= e!24053 (contains!473 (t!3826 (toList!521 lm!264)) (tuple2!1447 a!526 b!99)))))

(assert (= (and d!6107 res!22875) b!37890))

(assert (= (and b!37890 (not res!22876)) b!37891))

(declare-fun m!30591 () Bool)

(assert (=> d!6107 m!30591))

(declare-fun m!30593 () Bool)

(assert (=> d!6107 m!30593))

(declare-fun m!30595 () Bool)

(assert (=> b!37891 m!30595))

(assert (=> start!5192 d!6107))

(declare-fun d!6115 () Bool)

(assert (=> d!6115 (= (inv!1691 lm!264) (isStrictlySorted!191 (toList!521 lm!264)))))

(declare-fun bs!1509 () Bool)

(assert (= bs!1509 d!6115))

(assert (=> bs!1509 m!30561))

(assert (=> start!5192 d!6115))

(declare-fun d!6117 () Bool)

(declare-fun res!22893 () Bool)

(declare-fun e!24071 () Bool)

(assert (=> d!6117 (=> res!22893 e!24071)))

(assert (=> d!6117 (= res!22893 (or ((_ is Nil!991) (toList!521 lm!264)) ((_ is Nil!991) (t!3826 (toList!521 lm!264)))))))

(assert (=> d!6117 (= (isStrictlySorted!191 (toList!521 lm!264)) e!24071)))

(declare-fun b!37908 () Bool)

(declare-fun e!24072 () Bool)

(assert (=> b!37908 (= e!24071 e!24072)))

(declare-fun res!22894 () Bool)

(assert (=> b!37908 (=> (not res!22894) (not e!24072))))

(assert (=> b!37908 (= res!22894 (bvslt (_1!734 (h!1558 (toList!521 lm!264))) (_1!734 (h!1558 (t!3826 (toList!521 lm!264))))))))

(declare-fun b!37909 () Bool)

(assert (=> b!37909 (= e!24072 (isStrictlySorted!191 (t!3826 (toList!521 lm!264))))))

(assert (= (and d!6117 (not res!22893)) b!37908))

(assert (= (and b!37908 res!22894) b!37909))

(declare-fun m!30601 () Bool)

(assert (=> b!37909 m!30601))

(assert (=> b!37860 d!6117))

(declare-fun d!6123 () Bool)

(declare-fun res!22905 () Bool)

(declare-fun e!24083 () Bool)

(assert (=> d!6123 (=> res!22905 e!24083)))

(assert (=> d!6123 (= res!22905 (and ((_ is Cons!990) (toList!521 lm!264)) (= (_1!734 (h!1558 (toList!521 lm!264))) a!526)))))

(assert (=> d!6123 (= (containsKey!59 (toList!521 lm!264) a!526) e!24083)))

(declare-fun b!37920 () Bool)

(declare-fun e!24084 () Bool)

(assert (=> b!37920 (= e!24083 e!24084)))

(declare-fun res!22906 () Bool)

(assert (=> b!37920 (=> (not res!22906) (not e!24084))))

(assert (=> b!37920 (= res!22906 (and (or (not ((_ is Cons!990) (toList!521 lm!264))) (bvsle (_1!734 (h!1558 (toList!521 lm!264))) a!526)) ((_ is Cons!990) (toList!521 lm!264)) (bvslt (_1!734 (h!1558 (toList!521 lm!264))) a!526)))))

(declare-fun b!37921 () Bool)

(assert (=> b!37921 (= e!24084 (containsKey!59 (t!3826 (toList!521 lm!264)) a!526))))

(assert (= (and d!6123 (not res!22905)) b!37920))

(assert (= (and b!37920 res!22906) b!37921))

(declare-fun m!30607 () Bool)

(assert (=> b!37921 m!30607))

(assert (=> b!37860 d!6123))

(declare-fun d!6129 () Bool)

(assert (=> d!6129 (containsKey!59 (toList!521 lm!264) a!526)))

(declare-fun lt!13958 () Unit!878)

(declare-fun choose!242 (List!994 (_ BitVec 64) B!782) Unit!878)

(assert (=> d!6129 (= lt!13958 (choose!242 (toList!521 lm!264) a!526 b!99))))

(declare-fun e!24099 () Bool)

(assert (=> d!6129 e!24099))

(declare-fun res!22921 () Bool)

(assert (=> d!6129 (=> (not res!22921) (not e!24099))))

(assert (=> d!6129 (= res!22921 (isStrictlySorted!191 (toList!521 lm!264)))))

(assert (=> d!6129 (= (lemmaContainsTupleThenContainsKey!4 (toList!521 lm!264) a!526 b!99) lt!13958)))

(declare-fun b!37936 () Bool)

(assert (=> b!37936 (= e!24099 (contains!473 (toList!521 lm!264) (tuple2!1447 a!526 b!99)))))

(assert (= (and d!6129 res!22921) b!37936))

(assert (=> d!6129 m!30563))

(declare-fun m!30621 () Bool)

(assert (=> d!6129 m!30621))

(assert (=> d!6129 m!30561))

(assert (=> b!37936 m!30557))

(assert (=> b!37860 d!6129))

(declare-fun b!37949 () Bool)

(declare-fun e!24106 () Bool)

(declare-fun tp!5637 () Bool)

(assert (=> b!37949 (= e!24106 (and tp_is_empty!1705 tp!5637))))

(assert (=> b!37861 (= tp!5624 e!24106)))

(assert (= (and b!37861 ((_ is Cons!990) (toList!521 lm!264))) b!37949))

(check-sat (not d!6107) (not b!37949) (not b!37921) tp_is_empty!1705 (not d!6115) (not d!6129) (not b!37909) (not b!37891) (not b!37936))
(check-sat)
