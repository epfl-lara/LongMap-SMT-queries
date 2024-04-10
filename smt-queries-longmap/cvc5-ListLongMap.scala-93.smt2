; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1392 () Bool)

(assert start!1392)

(declare-fun b_free!421 () Bool)

(declare-fun b_next!421 () Bool)

(assert (=> start!1392 (= b_free!421 (not b_next!421))))

(declare-fun tp!1713 () Bool)

(declare-fun b_and!651 () Bool)

(assert (=> start!1392 (= tp!1713 b_and!651)))

(declare-fun b!10911 () Bool)

(declare-fun res!9190 () Bool)

(declare-fun e!6387 () Bool)

(assert (=> b!10911 (=> (not res!9190) (not e!6387))))

(declare-datatypes ((B!362 0))(
  ( (B!363 (val!276 Int)) )
))
(declare-datatypes ((tuple2!352 0))(
  ( (tuple2!353 (_1!176 (_ BitVec 64)) (_2!176 B!362)) )
))
(declare-datatypes ((List!328 0))(
  ( (Nil!325) (Cons!324 (h!890 tuple2!352) (t!2547 List!328)) )
))
(declare-fun kvs!4 () List!328)

(declare-fun isEmpty!57 (List!328) Bool)

(assert (=> b!10911 (= res!9190 (not (isEmpty!57 kvs!4)))))

(declare-fun b!10912 () Bool)

(declare-fun res!9187 () Bool)

(assert (=> b!10912 (=> (not res!9187) (not e!6387))))

(declare-fun p!216 () Int)

(declare-fun forall!47 (List!328 Int) Bool)

(assert (=> b!10912 (= res!9187 (forall!47 kvs!4 p!216))))

(declare-fun b!10914 () Bool)

(declare-fun e!6389 () Bool)

(declare-fun tp!1714 () Bool)

(assert (=> b!10914 (= e!6389 tp!1714)))

(declare-fun b!10915 () Bool)

(declare-fun e!6386 () Bool)

(declare-fun tp_is_empty!535 () Bool)

(declare-fun tp!1715 () Bool)

(assert (=> b!10915 (= e!6386 (and tp_is_empty!535 tp!1715))))

(declare-fun b!10916 () Bool)

(declare-fun e!6388 () Bool)

(assert (=> b!10916 (= e!6387 (not e!6388))))

(declare-fun res!9189 () Bool)

(assert (=> b!10916 (=> res!9189 e!6388)))

(declare-datatypes ((ListLongMap!333 0))(
  ( (ListLongMap!334 (toList!182 List!328)) )
))
(declare-fun lm!227 () ListLongMap!333)

(declare-fun lt!2739 () tuple2!352)

(declare-fun +!20 (ListLongMap!333 tuple2!352) ListLongMap!333)

(assert (=> b!10916 (= res!9189 (not (forall!47 (toList!182 (+!20 lm!227 lt!2739)) p!216)))))

(assert (=> b!10916 (forall!47 (toList!182 (+!20 lm!227 (tuple2!353 (_1!176 lt!2739) (_2!176 lt!2739)))) p!216)))

(declare-datatypes ((Unit!225 0))(
  ( (Unit!226) )
))
(declare-fun lt!2738 () Unit!225)

(declare-fun addValidProp!8 (ListLongMap!333 Int (_ BitVec 64) B!362) Unit!225)

(assert (=> b!10916 (= lt!2738 (addValidProp!8 lm!227 p!216 (_1!176 lt!2739) (_2!176 lt!2739)))))

(declare-fun head!764 (List!328) tuple2!352)

(assert (=> b!10916 (= lt!2739 (head!764 kvs!4))))

(declare-fun res!9188 () Bool)

(assert (=> start!1392 (=> (not res!9188) (not e!6387))))

(assert (=> start!1392 (= res!9188 (forall!47 (toList!182 lm!227) p!216))))

(assert (=> start!1392 e!6387))

(declare-fun inv!526 (ListLongMap!333) Bool)

(assert (=> start!1392 (and (inv!526 lm!227) e!6389)))

(assert (=> start!1392 tp!1713))

(assert (=> start!1392 e!6386))

(declare-fun b!10913 () Bool)

(assert (=> b!10913 (= e!6388 true)))

(assert (= (and start!1392 res!9188) b!10912))

(assert (= (and b!10912 res!9187) b!10911))

(assert (= (and b!10911 res!9190) b!10916))

(assert (= (and b!10916 (not res!9189)) b!10913))

(assert (= start!1392 b!10914))

(assert (= (and start!1392 (is-Cons!324 kvs!4)) b!10915))

(declare-fun m!7175 () Bool)

(assert (=> b!10911 m!7175))

(declare-fun m!7177 () Bool)

(assert (=> b!10912 m!7177))

(declare-fun m!7179 () Bool)

(assert (=> b!10916 m!7179))

(declare-fun m!7181 () Bool)

(assert (=> b!10916 m!7181))

(declare-fun m!7183 () Bool)

(assert (=> b!10916 m!7183))

(declare-fun m!7185 () Bool)

(assert (=> b!10916 m!7185))

(declare-fun m!7187 () Bool)

(assert (=> b!10916 m!7187))

(declare-fun m!7189 () Bool)

(assert (=> b!10916 m!7189))

(declare-fun m!7191 () Bool)

(assert (=> start!1392 m!7191))

(declare-fun m!7193 () Bool)

(assert (=> start!1392 m!7193))

(push 1)

(assert (not b!10911))

(assert tp_is_empty!535)

(assert (not b!10915))

(assert (not start!1392))

(assert (not b_next!421))

(assert (not b!10914))

(assert b_and!651)

(assert (not b!10912))

(assert (not b!10916))

(check-sat)

