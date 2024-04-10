; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7692 () Bool)

(assert start!7692)

(declare-fun res!28419 () Bool)

(declare-fun e!31473 () Bool)

(assert (=> start!7692 (=> (not res!28419) (not e!31473))))

(declare-datatypes ((B!982 0))(
  ( (B!983 (val!1111 Int)) )
))
(declare-datatypes ((tuple2!1804 0))(
  ( (tuple2!1805 (_1!913 (_ BitVec 64)) (_2!913 B!982)) )
))
(declare-datatypes ((List!1308 0))(
  ( (Nil!1305) (Cons!1304 (h!1884 tuple2!1804) (t!4339 List!1308)) )
))
(declare-fun l!1333 () List!1308)

(declare-fun isStrictlySorted!272 (List!1308) Bool)

(assert (=> start!7692 (= res!28419 (isStrictlySorted!272 l!1333))))

(assert (=> start!7692 e!31473))

(declare-fun e!31474 () Bool)

(assert (=> start!7692 e!31474))

(assert (=> start!7692 true))

(declare-fun b!49010 () Bool)

(declare-fun res!28420 () Bool)

(assert (=> b!49010 (=> (not res!28420) (not e!31473))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!121 (List!1308 (_ BitVec 64)) Bool)

(assert (=> b!49010 (= res!28420 (not (containsKey!121 l!1333 newKey!147)))))

(declare-fun b!49012 () Bool)

(declare-fun ListPrimitiveSize!53 (List!1308) Int)

(assert (=> b!49012 (= e!31473 (>= (ListPrimitiveSize!53 (t!4339 l!1333)) (ListPrimitiveSize!53 l!1333)))))

(declare-fun b!49013 () Bool)

(declare-fun tp_is_empty!2133 () Bool)

(declare-fun tp!6479 () Bool)

(assert (=> b!49013 (= e!31474 (and tp_is_empty!2133 tp!6479))))

(declare-fun b!49011 () Bool)

(declare-fun res!28421 () Bool)

(assert (=> b!49011 (=> (not res!28421) (not e!31473))))

(get-info :version)

(assert (=> b!49011 (= res!28421 (not ((_ is Nil!1305) l!1333)))))

(assert (= (and start!7692 res!28419) b!49010))

(assert (= (and b!49010 res!28420) b!49011))

(assert (= (and b!49011 res!28421) b!49012))

(assert (= (and start!7692 ((_ is Cons!1304) l!1333)) b!49013))

(declare-fun m!42575 () Bool)

(assert (=> start!7692 m!42575))

(declare-fun m!42577 () Bool)

(assert (=> b!49010 m!42577))

(declare-fun m!42579 () Bool)

(assert (=> b!49012 m!42579))

(declare-fun m!42581 () Bool)

(assert (=> b!49012 m!42581))

(check-sat (not b!49010) (not b!49013) (not start!7692) (not b!49012) tp_is_empty!2133)
(check-sat)
(get-model)

(declare-fun d!9761 () Bool)

(declare-fun res!28441 () Bool)

(declare-fun e!31493 () Bool)

(assert (=> d!9761 (=> res!28441 e!31493)))

(assert (=> d!9761 (= res!28441 (and ((_ is Cons!1304) l!1333) (= (_1!913 (h!1884 l!1333)) newKey!147)))))

(assert (=> d!9761 (= (containsKey!121 l!1333 newKey!147) e!31493)))

(declare-fun b!49040 () Bool)

(declare-fun e!31494 () Bool)

(assert (=> b!49040 (= e!31493 e!31494)))

(declare-fun res!28442 () Bool)

(assert (=> b!49040 (=> (not res!28442) (not e!31494))))

(assert (=> b!49040 (= res!28442 (and (or (not ((_ is Cons!1304) l!1333)) (bvsle (_1!913 (h!1884 l!1333)) newKey!147)) ((_ is Cons!1304) l!1333) (bvslt (_1!913 (h!1884 l!1333)) newKey!147)))))

(declare-fun b!49041 () Bool)

(assert (=> b!49041 (= e!31494 (containsKey!121 (t!4339 l!1333) newKey!147))))

(assert (= (and d!9761 (not res!28441)) b!49040))

(assert (= (and b!49040 res!28442) b!49041))

(declare-fun m!42593 () Bool)

(assert (=> b!49041 m!42593))

(assert (=> b!49010 d!9761))

(declare-fun d!9769 () Bool)

(declare-fun lt!20709 () Int)

(assert (=> d!9769 (>= lt!20709 0)))

(declare-fun e!31507 () Int)

(assert (=> d!9769 (= lt!20709 e!31507)))

(declare-fun c!6601 () Bool)

(assert (=> d!9769 (= c!6601 ((_ is Nil!1305) (t!4339 l!1333)))))

(assert (=> d!9769 (= (ListPrimitiveSize!53 (t!4339 l!1333)) lt!20709)))

(declare-fun b!49058 () Bool)

(assert (=> b!49058 (= e!31507 0)))

(declare-fun b!49059 () Bool)

(assert (=> b!49059 (= e!31507 (+ 1 (ListPrimitiveSize!53 (t!4339 (t!4339 l!1333)))))))

(assert (= (and d!9769 c!6601) b!49058))

(assert (= (and d!9769 (not c!6601)) b!49059))

(declare-fun m!42597 () Bool)

(assert (=> b!49059 m!42597))

(assert (=> b!49012 d!9769))

(declare-fun d!9775 () Bool)

(declare-fun lt!20710 () Int)

(assert (=> d!9775 (>= lt!20710 0)))

(declare-fun e!31508 () Int)

(assert (=> d!9775 (= lt!20710 e!31508)))

(declare-fun c!6602 () Bool)

(assert (=> d!9775 (= c!6602 ((_ is Nil!1305) l!1333))))

(assert (=> d!9775 (= (ListPrimitiveSize!53 l!1333) lt!20710)))

(declare-fun b!49060 () Bool)

(assert (=> b!49060 (= e!31508 0)))

(declare-fun b!49061 () Bool)

(assert (=> b!49061 (= e!31508 (+ 1 (ListPrimitiveSize!53 (t!4339 l!1333))))))

(assert (= (and d!9775 c!6602) b!49060))

(assert (= (and d!9775 (not c!6602)) b!49061))

(assert (=> b!49061 m!42579))

(assert (=> b!49012 d!9775))

(declare-fun d!9777 () Bool)

(declare-fun res!28463 () Bool)

(declare-fun e!31523 () Bool)

(assert (=> d!9777 (=> res!28463 e!31523)))

(assert (=> d!9777 (= res!28463 (or ((_ is Nil!1305) l!1333) ((_ is Nil!1305) (t!4339 l!1333))))))

(assert (=> d!9777 (= (isStrictlySorted!272 l!1333) e!31523)))

(declare-fun b!49076 () Bool)

(declare-fun e!31524 () Bool)

(assert (=> b!49076 (= e!31523 e!31524)))

(declare-fun res!28464 () Bool)

(assert (=> b!49076 (=> (not res!28464) (not e!31524))))

(assert (=> b!49076 (= res!28464 (bvslt (_1!913 (h!1884 l!1333)) (_1!913 (h!1884 (t!4339 l!1333)))))))

(declare-fun b!49077 () Bool)

(assert (=> b!49077 (= e!31524 (isStrictlySorted!272 (t!4339 l!1333)))))

(assert (= (and d!9777 (not res!28463)) b!49076))

(assert (= (and b!49076 res!28464) b!49077))

(declare-fun m!42603 () Bool)

(assert (=> b!49077 m!42603))

(assert (=> start!7692 d!9777))

(declare-fun b!49092 () Bool)

(declare-fun e!31531 () Bool)

(declare-fun tp!6485 () Bool)

(assert (=> b!49092 (= e!31531 (and tp_is_empty!2133 tp!6485))))

(assert (=> b!49013 (= tp!6479 e!31531)))

(assert (= (and b!49013 ((_ is Cons!1304) (t!4339 l!1333))) b!49092))

(check-sat (not b!49041) (not b!49059) (not b!49077) tp_is_empty!2133 (not b!49092) (not b!49061))
(check-sat)
