; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71968 () Bool)

(assert start!71968)

(declare-datatypes ((B!1172 0))(
  ( (B!1173 (val!7668 Int)) )
))
(declare-datatypes ((tuple2!10196 0))(
  ( (tuple2!10197 (_1!5109 (_ BitVec 64)) (_2!5109 B!1172)) )
))
(declare-datatypes ((List!15973 0))(
  ( (Nil!15970) (Cons!15969 (h!17100 tuple2!10196) (t!22344 List!15973)) )
))
(declare-datatypes ((ListLongMap!9007 0))(
  ( (ListLongMap!9008 (toList!4519 List!15973)) )
))
(declare-fun thiss!193 () ListLongMap!9007)

(declare-fun isStrictlySorted!443 (List!15973) Bool)

(assert (=> start!71968 (not (isStrictlySorted!443 (toList!4519 thiss!193)))))

(declare-fun e!466488 () Bool)

(declare-fun inv!27240 (ListLongMap!9007) Bool)

(assert (=> start!71968 (and (inv!27240 thiss!193) e!466488)))

(declare-fun b!836216 () Bool)

(declare-fun tp!47387 () Bool)

(assert (=> b!836216 (= e!466488 tp!47387)))

(assert (= start!71968 b!836216))

(declare-fun m!781621 () Bool)

(assert (=> start!71968 m!781621))

(declare-fun m!781623 () Bool)

(assert (=> start!71968 m!781623))

(push 1)

(assert (not start!71968))

(assert (not b!836216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107539 () Bool)

(declare-fun res!568953 () Bool)

(declare-fun e!466507 () Bool)

(assert (=> d!107539 (=> res!568953 e!466507)))

(assert (=> d!107539 (= res!568953 (or (is-Nil!15970 (toList!4519 thiss!193)) (is-Nil!15970 (t!22344 (toList!4519 thiss!193)))))))

(assert (=> d!107539 (= (isStrictlySorted!443 (toList!4519 thiss!193)) e!466507)))

(declare-fun b!836235 () Bool)

(declare-fun e!466508 () Bool)

(assert (=> b!836235 (= e!466507 e!466508)))

(declare-fun res!568954 () Bool)

(assert (=> b!836235 (=> (not res!568954) (not e!466508))))

(assert (=> b!836235 (= res!568954 (bvslt (_1!5109 (h!17100 (toList!4519 thiss!193))) (_1!5109 (h!17100 (t!22344 (toList!4519 thiss!193))))))))

(declare-fun b!836236 () Bool)

(assert (=> b!836236 (= e!466508 (isStrictlySorted!443 (t!22344 (toList!4519 thiss!193))))))

(assert (= (and d!107539 (not res!568953)) b!836235))

(assert (= (and b!836235 res!568954) b!836236))

(declare-fun m!781633 () Bool)

(assert (=> b!836236 m!781633))

(assert (=> start!71968 d!107539))

(declare-fun d!107543 () Bool)

(assert (=> d!107543 (= (inv!27240 thiss!193) (isStrictlySorted!443 (toList!4519 thiss!193)))))

(declare-fun bs!23471 () Bool)

(assert (= bs!23471 d!107543))

(assert (=> bs!23471 m!781621))

(assert (=> start!71968 d!107543))

(declare-fun b!836253 () Bool)

(declare-fun e!466519 () Bool)

(declare-fun tp_is_empty!15242 () Bool)

(declare-fun tp!47400 () Bool)

(assert (=> b!836253 (= e!466519 (and tp_is_empty!15242 tp!47400))))

(assert (=> b!836216 (= tp!47387 e!466519)))

(assert (= (and b!836216 (is-Cons!15969 (toList!4519 thiss!193))) b!836253))

(push 1)

