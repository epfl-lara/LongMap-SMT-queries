; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7626 () Bool)

(assert start!7626)

(declare-fun res!28231 () Bool)

(declare-fun e!31216 () Bool)

(assert (=> start!7626 (=> (not res!28231) (not e!31216))))

(declare-datatypes ((B!970 0))(
  ( (B!971 (val!1105 Int)) )
))
(declare-datatypes ((tuple2!1792 0))(
  ( (tuple2!1793 (_1!907 (_ BitVec 64)) (_2!907 B!970)) )
))
(declare-datatypes ((List!1302 0))(
  ( (Nil!1299) (Cons!1298 (h!1878 tuple2!1792) (t!4330 List!1302)) )
))
(declare-fun l!1333 () List!1302)

(declare-fun isStrictlySorted!266 (List!1302) Bool)

(assert (=> start!7626 (= res!28231 (isStrictlySorted!266 l!1333))))

(assert (=> start!7626 e!31216))

(declare-fun e!31215 () Bool)

(assert (=> start!7626 e!31215))

(assert (=> start!7626 true))

(declare-fun b!48621 () Bool)

(declare-fun res!28232 () Bool)

(assert (=> b!48621 (=> (not res!28232) (not e!31216))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!115 (List!1302 (_ BitVec 64)) Bool)

(assert (=> b!48621 (= res!28232 (not (containsKey!115 l!1333 newKey!147)))))

(declare-fun b!48622 () Bool)

(declare-fun ListPrimitiveSize!50 (List!1302) Int)

(assert (=> b!48622 (= e!31216 (< (ListPrimitiveSize!50 l!1333) 0))))

(declare-fun b!48623 () Bool)

(declare-fun tp_is_empty!2121 () Bool)

(declare-fun tp!6440 () Bool)

(assert (=> b!48623 (= e!31215 (and tp_is_empty!2121 tp!6440))))

(assert (= (and start!7626 res!28231) b!48621))

(assert (= (and b!48621 res!28232) b!48622))

(get-info :version)

(assert (= (and start!7626 ((_ is Cons!1298) l!1333)) b!48623))

(declare-fun m!42339 () Bool)

(assert (=> start!7626 m!42339))

(declare-fun m!42341 () Bool)

(assert (=> b!48621 m!42341))

(declare-fun m!42343 () Bool)

(assert (=> b!48622 m!42343))

(check-sat tp_is_empty!2121 (not b!48621) (not b!48622) (not start!7626) (not b!48623))
(check-sat)
(get-model)

(declare-fun d!9655 () Bool)

(declare-fun res!28255 () Bool)

(declare-fun e!31239 () Bool)

(assert (=> d!9655 (=> res!28255 e!31239)))

(assert (=> d!9655 (= res!28255 (or ((_ is Nil!1299) l!1333) ((_ is Nil!1299) (t!4330 l!1333))))))

(assert (=> d!9655 (= (isStrictlySorted!266 l!1333) e!31239)))

(declare-fun b!48649 () Bool)

(declare-fun e!31240 () Bool)

(assert (=> b!48649 (= e!31239 e!31240)))

(declare-fun res!28256 () Bool)

(assert (=> b!48649 (=> (not res!28256) (not e!31240))))

(assert (=> b!48649 (= res!28256 (bvslt (_1!907 (h!1878 l!1333)) (_1!907 (h!1878 (t!4330 l!1333)))))))

(declare-fun b!48650 () Bool)

(assert (=> b!48650 (= e!31240 (isStrictlySorted!266 (t!4330 l!1333)))))

(assert (= (and d!9655 (not res!28255)) b!48649))

(assert (= (and b!48649 res!28256) b!48650))

(declare-fun m!42355 () Bool)

(assert (=> b!48650 m!42355))

(assert (=> start!7626 d!9655))

(declare-fun d!9663 () Bool)

(declare-fun res!28261 () Bool)

(declare-fun e!31251 () Bool)

(assert (=> d!9663 (=> res!28261 e!31251)))

(assert (=> d!9663 (= res!28261 (and ((_ is Cons!1298) l!1333) (= (_1!907 (h!1878 l!1333)) newKey!147)))))

(assert (=> d!9663 (= (containsKey!115 l!1333 newKey!147) e!31251)))

(declare-fun b!48667 () Bool)

(declare-fun e!31252 () Bool)

(assert (=> b!48667 (= e!31251 e!31252)))

(declare-fun res!28262 () Bool)

(assert (=> b!48667 (=> (not res!28262) (not e!31252))))

(assert (=> b!48667 (= res!28262 (and (or (not ((_ is Cons!1298) l!1333)) (bvsle (_1!907 (h!1878 l!1333)) newKey!147)) ((_ is Cons!1298) l!1333) (bvslt (_1!907 (h!1878 l!1333)) newKey!147)))))

(declare-fun b!48668 () Bool)

(assert (=> b!48668 (= e!31252 (containsKey!115 (t!4330 l!1333) newKey!147))))

(assert (= (and d!9663 (not res!28261)) b!48667))

(assert (= (and b!48667 res!28262) b!48668))

(declare-fun m!42361 () Bool)

(assert (=> b!48668 m!42361))

(assert (=> b!48621 d!9663))

(declare-fun d!9671 () Bool)

(declare-fun lt!20681 () Int)

(assert (=> d!9671 (>= lt!20681 0)))

(declare-fun e!31263 () Int)

(assert (=> d!9671 (= lt!20681 e!31263)))

(declare-fun c!6528 () Bool)

(assert (=> d!9671 (= c!6528 ((_ is Nil!1299) l!1333))))

(assert (=> d!9671 (= (ListPrimitiveSize!50 l!1333) lt!20681)))

(declare-fun b!48681 () Bool)

(assert (=> b!48681 (= e!31263 0)))

(declare-fun b!48682 () Bool)

(assert (=> b!48682 (= e!31263 (+ 1 (ListPrimitiveSize!50 (t!4330 l!1333))))))

(assert (= (and d!9671 c!6528) b!48681))

(assert (= (and d!9671 (not c!6528)) b!48682))

(declare-fun m!42363 () Bool)

(assert (=> b!48682 m!42363))

(assert (=> b!48622 d!9671))

(declare-fun b!48699 () Bool)

(declare-fun e!31274 () Bool)

(declare-fun tp!6450 () Bool)

(assert (=> b!48699 (= e!31274 (and tp_is_empty!2121 tp!6450))))

(assert (=> b!48623 (= tp!6440 e!31274)))

(assert (= (and b!48623 ((_ is Cons!1298) (t!4330 l!1333))) b!48699))

(check-sat tp_is_empty!2121 (not b!48650) (not b!48682) (not b!48668) (not b!48699))
(check-sat)
