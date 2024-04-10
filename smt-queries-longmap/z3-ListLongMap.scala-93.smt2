; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1394 () Bool)

(assert start!1394)

(declare-fun b_free!423 () Bool)

(declare-fun b_next!423 () Bool)

(assert (=> start!1394 (= b_free!423 (not b_next!423))))

(declare-fun tp!1723 () Bool)

(declare-fun b_and!653 () Bool)

(assert (=> start!1394 (= tp!1723 b_and!653)))

(declare-fun b!10929 () Bool)

(declare-fun e!6400 () Bool)

(declare-fun tp!1724 () Bool)

(assert (=> b!10929 (= e!6400 tp!1724)))

(declare-fun b!10930 () Bool)

(declare-fun e!6399 () Bool)

(assert (=> b!10930 (= e!6399 true)))

(declare-fun b!10931 () Bool)

(declare-fun e!6401 () Bool)

(assert (=> b!10931 (= e!6401 (not e!6399))))

(declare-fun res!9201 () Bool)

(assert (=> b!10931 (=> res!9201 e!6399)))

(declare-datatypes ((B!364 0))(
  ( (B!365 (val!277 Int)) )
))
(declare-datatypes ((tuple2!354 0))(
  ( (tuple2!355 (_1!177 (_ BitVec 64)) (_2!177 B!364)) )
))
(declare-datatypes ((List!329 0))(
  ( (Nil!326) (Cons!325 (h!891 tuple2!354) (t!2548 List!329)) )
))
(declare-datatypes ((ListLongMap!335 0))(
  ( (ListLongMap!336 (toList!183 List!329)) )
))
(declare-fun lm!227 () ListLongMap!335)

(declare-fun p!216 () Int)

(declare-fun lt!2745 () tuple2!354)

(declare-fun forall!48 (List!329 Int) Bool)

(declare-fun +!21 (ListLongMap!335 tuple2!354) ListLongMap!335)

(assert (=> b!10931 (= res!9201 (not (forall!48 (toList!183 (+!21 lm!227 lt!2745)) p!216)))))

(assert (=> b!10931 (forall!48 (toList!183 (+!21 lm!227 (tuple2!355 (_1!177 lt!2745) (_2!177 lt!2745)))) p!216)))

(declare-datatypes ((Unit!227 0))(
  ( (Unit!228) )
))
(declare-fun lt!2744 () Unit!227)

(declare-fun addValidProp!9 (ListLongMap!335 Int (_ BitVec 64) B!364) Unit!227)

(assert (=> b!10931 (= lt!2744 (addValidProp!9 lm!227 p!216 (_1!177 lt!2745) (_2!177 lt!2745)))))

(declare-fun kvs!4 () List!329)

(declare-fun head!765 (List!329) tuple2!354)

(assert (=> b!10931 (= lt!2745 (head!765 kvs!4))))

(declare-fun b!10932 () Bool)

(declare-fun res!9202 () Bool)

(assert (=> b!10932 (=> (not res!9202) (not e!6401))))

(assert (=> b!10932 (= res!9202 (forall!48 kvs!4 p!216))))

(declare-fun res!9200 () Bool)

(assert (=> start!1394 (=> (not res!9200) (not e!6401))))

(assert (=> start!1394 (= res!9200 (forall!48 (toList!183 lm!227) p!216))))

(assert (=> start!1394 e!6401))

(declare-fun inv!527 (ListLongMap!335) Bool)

(assert (=> start!1394 (and (inv!527 lm!227) e!6400)))

(assert (=> start!1394 tp!1723))

(declare-fun e!6398 () Bool)

(assert (=> start!1394 e!6398))

(declare-fun b!10933 () Bool)

(declare-fun res!9199 () Bool)

(assert (=> b!10933 (=> (not res!9199) (not e!6401))))

(declare-fun isEmpty!58 (List!329) Bool)

(assert (=> b!10933 (= res!9199 (not (isEmpty!58 kvs!4)))))

(declare-fun b!10934 () Bool)

(declare-fun tp_is_empty!537 () Bool)

(declare-fun tp!1722 () Bool)

(assert (=> b!10934 (= e!6398 (and tp_is_empty!537 tp!1722))))

(assert (= (and start!1394 res!9200) b!10932))

(assert (= (and b!10932 res!9202) b!10933))

(assert (= (and b!10933 res!9199) b!10931))

(assert (= (and b!10931 (not res!9201)) b!10930))

(assert (= start!1394 b!10929))

(get-info :version)

(assert (= (and start!1394 ((_ is Cons!325) kvs!4)) b!10934))

(declare-fun m!7195 () Bool)

(assert (=> b!10931 m!7195))

(declare-fun m!7197 () Bool)

(assert (=> b!10931 m!7197))

(declare-fun m!7199 () Bool)

(assert (=> b!10931 m!7199))

(declare-fun m!7201 () Bool)

(assert (=> b!10931 m!7201))

(declare-fun m!7203 () Bool)

(assert (=> b!10931 m!7203))

(declare-fun m!7205 () Bool)

(assert (=> b!10931 m!7205))

(declare-fun m!7207 () Bool)

(assert (=> b!10932 m!7207))

(declare-fun m!7209 () Bool)

(assert (=> start!1394 m!7209))

(declare-fun m!7211 () Bool)

(assert (=> start!1394 m!7211))

(declare-fun m!7213 () Bool)

(assert (=> b!10933 m!7213))

(check-sat (not b!10931) (not start!1394) (not b!10929) (not b!10933) (not b!10932) b_and!653 (not b!10934) (not b_next!423) tp_is_empty!537)
(check-sat b_and!653 (not b_next!423))
