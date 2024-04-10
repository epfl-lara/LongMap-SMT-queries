; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7596 () Bool)

(assert start!7596)

(declare-fun b!48478 () Bool)

(declare-fun e!31113 () Bool)

(declare-fun tp_is_empty!2103 () Bool)

(declare-fun tp!6404 () Bool)

(assert (=> b!48478 (= e!31113 (and tp_is_empty!2103 tp!6404))))

(declare-fun b!48479 () Bool)

(declare-fun res!28132 () Bool)

(declare-fun e!31114 () Bool)

(assert (=> b!48479 (=> (not res!28132) (not e!31114))))

(declare-datatypes ((B!952 0))(
  ( (B!953 (val!1096 Int)) )
))
(declare-datatypes ((tuple2!1774 0))(
  ( (tuple2!1775 (_1!898 (_ BitVec 64)) (_2!898 B!952)) )
))
(declare-datatypes ((List!1293 0))(
  ( (Nil!1290) (Cons!1289 (h!1869 tuple2!1774) (t!4321 List!1293)) )
))
(declare-fun l!1333 () List!1293)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!109 (List!1293 (_ BitVec 64)) Bool)

(assert (=> b!48479 (= res!28132 (not (containsKey!109 l!1333 newKey!147)))))

(declare-fun res!28133 () Bool)

(assert (=> start!7596 (=> (not res!28133) (not e!31114))))

(declare-fun isStrictlySorted!260 (List!1293) Bool)

(assert (=> start!7596 (= res!28133 (isStrictlySorted!260 l!1333))))

(assert (=> start!7596 e!31114))

(assert (=> start!7596 e!31113))

(assert (=> start!7596 true))

(declare-fun b!48480 () Bool)

(assert (=> b!48480 (= e!31114 (containsKey!109 (t!4321 l!1333) newKey!147))))

(declare-fun b!48481 () Bool)

(declare-fun res!28131 () Bool)

(assert (=> b!48481 (=> (not res!28131) (not e!31114))))

(get-info :version)

(assert (=> b!48481 (= res!28131 (not ((_ is Nil!1290) l!1333)))))

(declare-fun b!48482 () Bool)

(declare-fun res!28130 () Bool)

(assert (=> b!48482 (=> (not res!28130) (not e!31114))))

(assert (=> b!48482 (= res!28130 (isStrictlySorted!260 (t!4321 l!1333)))))

(assert (= (and start!7596 res!28133) b!48479))

(assert (= (and b!48479 res!28132) b!48481))

(assert (= (and b!48481 res!28131) b!48482))

(assert (= (and b!48482 res!28130) b!48480))

(assert (= (and start!7596 ((_ is Cons!1289) l!1333)) b!48478))

(declare-fun m!42287 () Bool)

(assert (=> b!48479 m!42287))

(declare-fun m!42289 () Bool)

(assert (=> start!7596 m!42289))

(declare-fun m!42291 () Bool)

(assert (=> b!48480 m!42291))

(declare-fun m!42293 () Bool)

(assert (=> b!48482 m!42293))

(check-sat (not start!7596) (not b!48479) (not b!48482) tp_is_empty!2103 (not b!48478) (not b!48480))
(check-sat)
(get-model)

(declare-fun d!9625 () Bool)

(declare-fun res!28154 () Bool)

(declare-fun e!31129 () Bool)

(assert (=> d!9625 (=> res!28154 e!31129)))

(assert (=> d!9625 (= res!28154 (and ((_ is Cons!1289) l!1333) (= (_1!898 (h!1869 l!1333)) newKey!147)))))

(assert (=> d!9625 (= (containsKey!109 l!1333 newKey!147) e!31129)))

(declare-fun b!48506 () Bool)

(declare-fun e!31130 () Bool)

(assert (=> b!48506 (= e!31129 e!31130)))

(declare-fun res!28155 () Bool)

(assert (=> b!48506 (=> (not res!28155) (not e!31130))))

(assert (=> b!48506 (= res!28155 (and (or (not ((_ is Cons!1289) l!1333)) (bvsle (_1!898 (h!1869 l!1333)) newKey!147)) ((_ is Cons!1289) l!1333) (bvslt (_1!898 (h!1869 l!1333)) newKey!147)))))

(declare-fun b!48507 () Bool)

(assert (=> b!48507 (= e!31130 (containsKey!109 (t!4321 l!1333) newKey!147))))

(assert (= (and d!9625 (not res!28154)) b!48506))

(assert (= (and b!48506 res!28155) b!48507))

(assert (=> b!48507 m!42291))

(assert (=> b!48479 d!9625))

(declare-fun d!9631 () Bool)

(declare-fun res!28168 () Bool)

(declare-fun e!31143 () Bool)

(assert (=> d!9631 (=> res!28168 e!31143)))

(assert (=> d!9631 (= res!28168 (or ((_ is Nil!1290) (t!4321 l!1333)) ((_ is Nil!1290) (t!4321 (t!4321 l!1333)))))))

(assert (=> d!9631 (= (isStrictlySorted!260 (t!4321 l!1333)) e!31143)))

(declare-fun b!48520 () Bool)

(declare-fun e!31144 () Bool)

(assert (=> b!48520 (= e!31143 e!31144)))

(declare-fun res!28169 () Bool)

(assert (=> b!48520 (=> (not res!28169) (not e!31144))))

(assert (=> b!48520 (= res!28169 (bvslt (_1!898 (h!1869 (t!4321 l!1333))) (_1!898 (h!1869 (t!4321 (t!4321 l!1333))))))))

(declare-fun b!48521 () Bool)

(assert (=> b!48521 (= e!31144 (isStrictlySorted!260 (t!4321 (t!4321 l!1333))))))

(assert (= (and d!9631 (not res!28168)) b!48520))

(assert (= (and b!48520 res!28169) b!48521))

(declare-fun m!42303 () Bool)

(assert (=> b!48521 m!42303))

(assert (=> b!48482 d!9631))

(declare-fun d!9637 () Bool)

(declare-fun res!28172 () Bool)

(declare-fun e!31147 () Bool)

(assert (=> d!9637 (=> res!28172 e!31147)))

(assert (=> d!9637 (= res!28172 (or ((_ is Nil!1290) l!1333) ((_ is Nil!1290) (t!4321 l!1333))))))

(assert (=> d!9637 (= (isStrictlySorted!260 l!1333) e!31147)))

(declare-fun b!48524 () Bool)

(declare-fun e!31148 () Bool)

(assert (=> b!48524 (= e!31147 e!31148)))

(declare-fun res!28173 () Bool)

(assert (=> b!48524 (=> (not res!28173) (not e!31148))))

(assert (=> b!48524 (= res!28173 (bvslt (_1!898 (h!1869 l!1333)) (_1!898 (h!1869 (t!4321 l!1333)))))))

(declare-fun b!48525 () Bool)

(assert (=> b!48525 (= e!31148 (isStrictlySorted!260 (t!4321 l!1333)))))

(assert (= (and d!9637 (not res!28172)) b!48524))

(assert (= (and b!48524 res!28173) b!48525))

(assert (=> b!48525 m!42293))

(assert (=> start!7596 d!9637))

(declare-fun d!9639 () Bool)

(declare-fun res!28176 () Bool)

(declare-fun e!31151 () Bool)

(assert (=> d!9639 (=> res!28176 e!31151)))

(assert (=> d!9639 (= res!28176 (and ((_ is Cons!1289) (t!4321 l!1333)) (= (_1!898 (h!1869 (t!4321 l!1333))) newKey!147)))))

(assert (=> d!9639 (= (containsKey!109 (t!4321 l!1333) newKey!147) e!31151)))

(declare-fun b!48528 () Bool)

(declare-fun e!31152 () Bool)

(assert (=> b!48528 (= e!31151 e!31152)))

(declare-fun res!28177 () Bool)

(assert (=> b!48528 (=> (not res!28177) (not e!31152))))

(assert (=> b!48528 (= res!28177 (and (or (not ((_ is Cons!1289) (t!4321 l!1333))) (bvsle (_1!898 (h!1869 (t!4321 l!1333))) newKey!147)) ((_ is Cons!1289) (t!4321 l!1333)) (bvslt (_1!898 (h!1869 (t!4321 l!1333))) newKey!147)))))

(declare-fun b!48529 () Bool)

(assert (=> b!48529 (= e!31152 (containsKey!109 (t!4321 (t!4321 l!1333)) newKey!147))))

(assert (= (and d!9639 (not res!28176)) b!48528))

(assert (= (and b!48528 res!28177) b!48529))

(declare-fun m!42305 () Bool)

(assert (=> b!48529 m!42305))

(assert (=> b!48480 d!9639))

(declare-fun b!48538 () Bool)

(declare-fun e!31159 () Bool)

(declare-fun tp!6410 () Bool)

(assert (=> b!48538 (= e!31159 (and tp_is_empty!2103 tp!6410))))

(assert (=> b!48478 (= tp!6404 e!31159)))

(assert (= (and b!48478 ((_ is Cons!1289) (t!4321 l!1333))) b!48538))

(check-sat (not b!48507) (not b!48529) (not b!48538) (not b!48525) tp_is_empty!2103 (not b!48521))
(check-sat)
