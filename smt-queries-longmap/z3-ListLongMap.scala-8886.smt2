; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107914 () Bool)

(assert start!107914)

(declare-fun b!1275212 () Bool)

(declare-fun res!847658 () Bool)

(declare-fun e!727897 () Bool)

(assert (=> b!1275212 (=> (not res!847658) (not e!727897))))

(declare-datatypes ((B!2188 0))(
  ( (B!2189 (val!16690 Int)) )
))
(declare-datatypes ((tuple2!21462 0))(
  ( (tuple2!21463 (_1!10742 (_ BitVec 64)) (_2!10742 B!2188)) )
))
(declare-datatypes ((List!28616 0))(
  ( (Nil!28613) (Cons!28612 (h!29821 tuple2!21462) (t!42152 List!28616)) )
))
(declare-fun l!595 () List!28616)

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1275212 (= res!847658 (and (or (not ((_ is Cons!28612) l!595)) (not (= (_1!10742 (h!29821 l!595)) key!173))) (or (not ((_ is Cons!28612) l!595)) (= (_1!10742 (h!29821 l!595)) key!173)) (not ((_ is Nil!28613) l!595))))))

(declare-fun res!847660 () Bool)

(assert (=> start!107914 (=> (not res!847660) (not e!727897))))

(declare-fun isStrictlySorted!868 (List!28616) Bool)

(assert (=> start!107914 (= res!847660 (isStrictlySorted!868 l!595))))

(assert (=> start!107914 e!727897))

(declare-fun e!727896 () Bool)

(assert (=> start!107914 e!727896))

(assert (=> start!107914 true))

(declare-fun b!1275213 () Bool)

(declare-fun tp_is_empty!33231 () Bool)

(declare-fun tp!98114 () Bool)

(assert (=> b!1275213 (= e!727896 (and tp_is_empty!33231 tp!98114))))

(declare-fun b!1275214 () Bool)

(declare-fun e!727894 () Bool)

(assert (=> b!1275214 (= e!727897 e!727894)))

(declare-fun res!847659 () Bool)

(assert (=> b!1275214 (=> res!847659 e!727894)))

(declare-fun lt!575328 () List!28616)

(assert (=> b!1275214 (= res!847659 (not (isStrictlySorted!868 lt!575328)))))

(declare-fun err!130 () List!28616)

(assert (=> b!1275214 (= lt!575328 err!130)))

(assert (=> b!1275214 true))

(declare-fun e!727895 () Bool)

(assert (=> b!1275214 e!727895))

(declare-fun b!1275215 () Bool)

(declare-fun tp!98113 () Bool)

(assert (=> b!1275215 (= e!727895 (and tp_is_empty!33231 tp!98113))))

(declare-fun b!1275216 () Bool)

(declare-fun containsKey!710 (List!28616 (_ BitVec 64)) Bool)

(assert (=> b!1275216 (= e!727894 (containsKey!710 lt!575328 key!173))))

(assert (= (and start!107914 res!847660) b!1275212))

(assert (= (and b!1275212 res!847658) b!1275214))

(assert (= (and b!1275214 ((_ is Cons!28612) err!130)) b!1275215))

(assert (= (and b!1275214 (not res!847659)) b!1275216))

(assert (= (and start!107914 ((_ is Cons!28612) l!595)) b!1275213))

(declare-fun m!1171555 () Bool)

(assert (=> start!107914 m!1171555))

(declare-fun m!1171557 () Bool)

(assert (=> b!1275214 m!1171557))

(declare-fun m!1171559 () Bool)

(assert (=> b!1275216 m!1171559))

(check-sat (not b!1275214) (not start!107914) (not b!1275216) (not b!1275213) (not b!1275215) tp_is_empty!33231)
(check-sat)
