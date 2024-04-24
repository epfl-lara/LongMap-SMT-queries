; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1392 () Bool)

(assert start!1392)

(declare-fun b_free!421 () Bool)

(declare-fun b_next!421 () Bool)

(assert (=> start!1392 (= b_free!421 (not b_next!421))))

(declare-fun tp!1715 () Bool)

(declare-fun b_and!651 () Bool)

(assert (=> start!1392 (= tp!1715 b_and!651)))

(declare-fun b!10911 () Bool)

(declare-fun e!6389 () Bool)

(declare-fun tp!1713 () Bool)

(assert (=> b!10911 (= e!6389 tp!1713)))

(declare-fun res!9187 () Bool)

(declare-fun e!6386 () Bool)

(assert (=> start!1392 (=> (not res!9187) (not e!6386))))

(declare-datatypes ((B!362 0))(
  ( (B!363 (val!276 Int)) )
))
(declare-datatypes ((tuple2!348 0))(
  ( (tuple2!349 (_1!174 (_ BitVec 64)) (_2!174 B!362)) )
))
(declare-datatypes ((List!324 0))(
  ( (Nil!321) (Cons!320 (h!886 tuple2!348) (t!2543 List!324)) )
))
(declare-datatypes ((ListLongMap!329 0))(
  ( (ListLongMap!330 (toList!180 List!324)) )
))
(declare-fun lm!227 () ListLongMap!329)

(declare-fun p!216 () Int)

(declare-fun forall!47 (List!324 Int) Bool)

(assert (=> start!1392 (= res!9187 (forall!47 (toList!180 lm!227) p!216))))

(assert (=> start!1392 e!6386))

(declare-fun inv!526 (ListLongMap!329) Bool)

(assert (=> start!1392 (and (inv!526 lm!227) e!6389)))

(assert (=> start!1392 tp!1715))

(declare-fun e!6387 () Bool)

(assert (=> start!1392 e!6387))

(declare-fun b!10912 () Bool)

(declare-fun e!6388 () Bool)

(assert (=> b!10912 (= e!6386 (not e!6388))))

(declare-fun res!9188 () Bool)

(assert (=> b!10912 (=> res!9188 e!6388)))

(declare-fun lt!2739 () tuple2!348)

(declare-fun +!20 (ListLongMap!329 tuple2!348) ListLongMap!329)

(assert (=> b!10912 (= res!9188 (not (forall!47 (toList!180 (+!20 lm!227 lt!2739)) p!216)))))

(assert (=> b!10912 (forall!47 (toList!180 (+!20 lm!227 (tuple2!349 (_1!174 lt!2739) (_2!174 lt!2739)))) p!216)))

(declare-datatypes ((Unit!235 0))(
  ( (Unit!236) )
))
(declare-fun lt!2738 () Unit!235)

(declare-fun addValidProp!8 (ListLongMap!329 Int (_ BitVec 64) B!362) Unit!235)

(assert (=> b!10912 (= lt!2738 (addValidProp!8 lm!227 p!216 (_1!174 lt!2739) (_2!174 lt!2739)))))

(declare-fun kvs!4 () List!324)

(declare-fun head!764 (List!324) tuple2!348)

(assert (=> b!10912 (= lt!2739 (head!764 kvs!4))))

(declare-fun b!10913 () Bool)

(assert (=> b!10913 (= e!6388 true)))

(declare-fun b!10914 () Bool)

(declare-fun res!9190 () Bool)

(assert (=> b!10914 (=> (not res!9190) (not e!6386))))

(declare-fun isEmpty!57 (List!324) Bool)

(assert (=> b!10914 (= res!9190 (not (isEmpty!57 kvs!4)))))

(declare-fun b!10915 () Bool)

(declare-fun tp_is_empty!535 () Bool)

(declare-fun tp!1714 () Bool)

(assert (=> b!10915 (= e!6387 (and tp_is_empty!535 tp!1714))))

(declare-fun b!10916 () Bool)

(declare-fun res!9189 () Bool)

(assert (=> b!10916 (=> (not res!9189) (not e!6386))))

(assert (=> b!10916 (= res!9189 (forall!47 kvs!4 p!216))))

(assert (= (and start!1392 res!9187) b!10916))

(assert (= (and b!10916 res!9189) b!10914))

(assert (= (and b!10914 res!9190) b!10912))

(assert (= (and b!10912 (not res!9188)) b!10913))

(assert (= start!1392 b!10911))

(get-info :version)

(assert (= (and start!1392 ((_ is Cons!320) kvs!4)) b!10915))

(declare-fun m!7171 () Bool)

(assert (=> start!1392 m!7171))

(declare-fun m!7173 () Bool)

(assert (=> start!1392 m!7173))

(declare-fun m!7175 () Bool)

(assert (=> b!10912 m!7175))

(declare-fun m!7177 () Bool)

(assert (=> b!10912 m!7177))

(declare-fun m!7179 () Bool)

(assert (=> b!10912 m!7179))

(declare-fun m!7181 () Bool)

(assert (=> b!10912 m!7181))

(declare-fun m!7183 () Bool)

(assert (=> b!10912 m!7183))

(declare-fun m!7185 () Bool)

(assert (=> b!10912 m!7185))

(declare-fun m!7187 () Bool)

(assert (=> b!10914 m!7187))

(declare-fun m!7189 () Bool)

(assert (=> b!10916 m!7189))

(check-sat (not b!10916) b_and!651 (not b_next!421) (not b!10912) (not b!10915) (not b!10911) (not b!10914) tp_is_empty!535 (not start!1392))
(check-sat b_and!651 (not b_next!421))
