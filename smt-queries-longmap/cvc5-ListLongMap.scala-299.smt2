; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5194 () Bool)

(assert start!5194)

(declare-fun res!22869 () Bool)

(declare-fun e!24052 () Bool)

(assert (=> start!5194 (=> (not res!22869) (not e!24052))))

(declare-datatypes ((B!782 0))(
  ( (B!783 (val!891 Int)) )
))
(declare-fun b!99 () B!782)

(declare-fun a!526 () (_ BitVec 64))

(declare-datatypes ((tuple2!1442 0))(
  ( (tuple2!1443 (_1!732 (_ BitVec 64)) (_2!732 B!782)) )
))
(declare-datatypes ((List!1001 0))(
  ( (Nil!998) (Cons!997 (h!1565 tuple2!1442) (t!3834 List!1001)) )
))
(declare-datatypes ((ListLongMap!1019 0))(
  ( (ListLongMap!1020 (toList!525 List!1001)) )
))
(declare-fun lm!264 () ListLongMap!1019)

(declare-fun contains!476 (List!1001 tuple2!1442) Bool)

(assert (=> start!5194 (= res!22869 (contains!476 (toList!525 lm!264) (tuple2!1443 a!526 b!99)))))

(assert (=> start!5194 e!24052))

(declare-fun e!24051 () Bool)

(declare-fun inv!1691 (ListLongMap!1019) Bool)

(assert (=> start!5194 (and (inv!1691 lm!264) e!24051)))

(assert (=> start!5194 true))

(declare-fun tp_is_empty!1705 () Bool)

(assert (=> start!5194 tp_is_empty!1705))

(declare-fun b!37899 () Bool)

(declare-fun isStrictlySorted!197 (List!1001) Bool)

(assert (=> b!37899 (= e!24052 (not (isStrictlySorted!197 (toList!525 lm!264))))))

(declare-fun containsKey!60 (List!1001 (_ BitVec 64)) Bool)

(assert (=> b!37899 (containsKey!60 (toList!525 lm!264) a!526)))

(declare-datatypes ((Unit!875 0))(
  ( (Unit!876) )
))
(declare-fun lt!13937 () Unit!875)

(declare-fun lemmaContainsTupleThenContainsKey!4 (List!1001 (_ BitVec 64) B!782) Unit!875)

(assert (=> b!37899 (= lt!13937 (lemmaContainsTupleThenContainsKey!4 (toList!525 lm!264) a!526 b!99))))

(declare-fun b!37900 () Bool)

(declare-fun tp!5624 () Bool)

(assert (=> b!37900 (= e!24051 tp!5624)))

(assert (= (and start!5194 res!22869) b!37899))

(assert (= start!5194 b!37900))

(declare-fun m!30601 () Bool)

(assert (=> start!5194 m!30601))

(declare-fun m!30603 () Bool)

(assert (=> start!5194 m!30603))

(declare-fun m!30605 () Bool)

(assert (=> b!37899 m!30605))

(declare-fun m!30607 () Bool)

(assert (=> b!37899 m!30607))

(declare-fun m!30609 () Bool)

(assert (=> b!37899 m!30609))

(push 1)

(assert (not start!5194))

(assert (not b!37899))

(assert (not b!37900))

(assert tp_is_empty!1705)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6121 () Bool)

(declare-fun lt!13948 () Bool)

(declare-fun content!22 (List!1001) (Set tuple2!1442))

(assert (=> d!6121 (= lt!13948 (set.member (tuple2!1443 a!526 b!99) (content!22 (toList!525 lm!264))))))

(declare-fun e!24078 () Bool)

(assert (=> d!6121 (= lt!13948 e!24078)))

(declare-fun res!22889 () Bool)

(assert (=> d!6121 (=> (not res!22889) (not e!24078))))

(assert (=> d!6121 (= res!22889 (is-Cons!997 (toList!525 lm!264)))))

(assert (=> d!6121 (= (contains!476 (toList!525 lm!264) (tuple2!1443 a!526 b!99)) lt!13948)))

(declare-fun b!37925 () Bool)

(declare-fun e!24077 () Bool)

(assert (=> b!37925 (= e!24078 e!24077)))

(declare-fun res!22888 () Bool)

(assert (=> b!37925 (=> res!22888 e!24077)))

(assert (=> b!37925 (= res!22888 (= (h!1565 (toList!525 lm!264)) (tuple2!1443 a!526 b!99)))))

(declare-fun b!37926 () Bool)

(assert (=> b!37926 (= e!24077 (contains!476 (t!3834 (toList!525 lm!264)) (tuple2!1443 a!526 b!99)))))

(assert (= (and d!6121 res!22889) b!37925))

(assert (= (and b!37925 (not res!22888)) b!37926))

(declare-fun m!30631 () Bool)

(assert (=> d!6121 m!30631))

(declare-fun m!30633 () Bool)

(assert (=> d!6121 m!30633))

(declare-fun m!30635 () Bool)

(assert (=> b!37926 m!30635))

(assert (=> start!5194 d!6121))

(declare-fun d!6127 () Bool)

(assert (=> d!6127 (= (inv!1691 lm!264) (isStrictlySorted!197 (toList!525 lm!264)))))

(declare-fun bs!1510 () Bool)

(assert (= bs!1510 d!6127))

(assert (=> bs!1510 m!30605))

(assert (=> start!5194 d!6127))

(declare-fun d!6131 () Bool)

(declare-fun res!22898 () Bool)

(declare-fun e!24087 () Bool)

(assert (=> d!6131 (=> res!22898 e!24087)))

(assert (=> d!6131 (= res!22898 (or (is-Nil!998 (toList!525 lm!264)) (is-Nil!998 (t!3834 (toList!525 lm!264)))))))

(assert (=> d!6131 (= (isStrictlySorted!197 (toList!525 lm!264)) e!24087)))

(declare-fun b!37935 () Bool)

(declare-fun e!24088 () Bool)

(assert (=> b!37935 (= e!24087 e!24088)))

(declare-fun res!22899 () Bool)

(assert (=> b!37935 (=> (not res!22899) (not e!24088))))

(assert (=> b!37935 (= res!22899 (bvslt (_1!732 (h!1565 (toList!525 lm!264))) (_1!732 (h!1565 (t!3834 (toList!525 lm!264))))))))

(declare-fun b!37936 () Bool)

(assert (=> b!37936 (= e!24088 (isStrictlySorted!197 (t!3834 (toList!525 lm!264))))))

(assert (= (and d!6131 (not res!22898)) b!37935))

(assert (= (and b!37935 res!22899) b!37936))

(declare-fun m!30645 () Bool)

(assert (=> b!37936 m!30645))

(assert (=> b!37899 d!6131))

(declare-fun d!6137 () Bool)

(declare-fun res!22914 () Bool)

(declare-fun e!24103 () Bool)

(assert (=> d!6137 (=> res!22914 e!24103)))

(assert (=> d!6137 (= res!22914 (and (is-Cons!997 (toList!525 lm!264)) (= (_1!732 (h!1565 (toList!525 lm!264))) a!526)))))

(assert (=> d!6137 (= (containsKey!60 (toList!525 lm!264) a!526) e!24103)))

(declare-fun b!37951 () Bool)

(declare-fun e!24104 () Bool)

(assert (=> b!37951 (= e!24103 e!24104)))

(declare-fun res!22915 () Bool)

(assert (=> b!37951 (=> (not res!22915) (not e!24104))))

(assert (=> b!37951 (= res!22915 (and (or (not (is-Cons!997 (toList!525 lm!264))) (bvsle (_1!732 (h!1565 (toList!525 lm!264))) a!526)) (is-Cons!997 (toList!525 lm!264)) (bvslt (_1!732 (h!1565 (toList!525 lm!264))) a!526)))))

(declare-fun b!37952 () Bool)

(assert (=> b!37952 (= e!24104 (containsKey!60 (t!3834 (toList!525 lm!264)) a!526))))

(assert (= (and d!6137 (not res!22914)) b!37951))

(assert (= (and b!37951 res!22915) b!37952))

(declare-fun m!30649 () Bool)

(assert (=> b!37952 m!30649))

(assert (=> b!37899 d!6137))

(declare-fun d!6141 () Bool)

(assert (=> d!6141 (containsKey!60 (toList!525 lm!264) a!526)))

(declare-fun lt!13954 () Unit!875)

(declare-fun choose!239 (List!1001 (_ BitVec 64) B!782) Unit!875)

(assert (=> d!6141 (= lt!13954 (choose!239 (toList!525 lm!264) a!526 b!99))))

(declare-fun e!24111 () Bool)

(assert (=> d!6141 e!24111))

(declare-fun res!22922 () Bool)

(assert (=> d!6141 (=> (not res!22922) (not e!24111))))

(assert (=> d!6141 (= res!22922 (isStrictlySorted!197 (toList!525 lm!264)))))

(assert (=> d!6141 (= (lemmaContainsTupleThenContainsKey!4 (toList!525 lm!264) a!526 b!99) lt!13954)))

(declare-fun b!37959 () Bool)

(assert (=> b!37959 (= e!24111 (contains!476 (toList!525 lm!264) (tuple2!1443 a!526 b!99)))))

(assert (= (and d!6141 res!22922) b!37959))

(assert (=> d!6141 m!30607))

(declare-fun m!30653 () Bool)

(assert (=> d!6141 m!30653))

(assert (=> d!6141 m!30605))

(assert (=> b!37959 m!30601))

(assert (=> b!37899 d!6141))

(declare-fun b!37969 () Bool)

(declare-fun e!24119 () Bool)

(declare-fun tp!5633 () Bool)

(assert (=> b!37969 (= e!24119 (and tp_is_empty!1705 tp!5633))))

(assert (=> b!37900 (= tp!5624 e!24119)))

(assert (= (and b!37900 (is-Cons!997 (toList!525 lm!264))) b!37969))

(push 1)

(assert (not b!37959))

(assert (not d!6121))

(assert tp_is_empty!1705)

(assert (not d!6141))

(assert (not b!37952))

(assert (not b!37936))

(assert (not d!6127))

(assert (not b!37969))

(assert (not b!37926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

