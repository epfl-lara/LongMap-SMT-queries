; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137762 () Bool)

(assert start!137762)

(declare-fun b!1583584 () Bool)

(declare-fun e!883715 () Bool)

(declare-fun e!883711 () Bool)

(assert (=> b!1583584 (= e!883715 e!883711)))

(declare-fun res!1081050 () Bool)

(assert (=> b!1583584 (=> res!1081050 e!883711)))

(declare-datatypes ((B!2684 0))(
  ( (B!2685 (val!19704 Int)) )
))
(declare-datatypes ((tuple2!25612 0))(
  ( (tuple2!25613 (_1!12817 (_ BitVec 64)) (_2!12817 B!2684)) )
))
(declare-datatypes ((List!36856 0))(
  ( (Nil!36853) (Cons!36852 (h!38413 tuple2!25612) (t!51762 List!36856)) )
))
(declare-fun l!1390 () List!36856)

(declare-fun isStrictlySorted!1070 (List!36856) Bool)

(assert (=> b!1583584 (= res!1081050 (not (isStrictlySorted!1070 (t!51762 l!1390))))))

(declare-fun b!1583585 () Bool)

(declare-fun res!1081052 () Bool)

(assert (=> b!1583585 (=> (not res!1081052) (not e!883715))))

(declare-fun key!405 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583585 (= res!1081052 (and (or (not ((_ is Cons!36852) l!1390)) (not (= (_1!12817 (h!38413 l!1390)) key!405))) ((_ is Cons!36852) l!1390)))))

(declare-fun b!1583586 () Bool)

(declare-fun e!883710 () Bool)

(declare-fun e!883713 () Bool)

(assert (=> b!1583586 (= e!883710 e!883713)))

(declare-fun res!1081054 () Bool)

(assert (=> b!1583586 (=> (not res!1081054) (not e!883713))))

(declare-fun lt!677784 () tuple2!25612)

(declare-fun contains!10541 (List!36856 tuple2!25612) Bool)

(assert (=> b!1583586 (= res!1081054 (contains!10541 l!1390 lt!677784))))

(declare-fun value!194 () B!2684)

(assert (=> b!1583586 (= lt!677784 (tuple2!25613 key!405 value!194))))

(declare-fun b!1583587 () Bool)

(declare-fun e!883714 () Bool)

(declare-fun tp_is_empty!39229 () Bool)

(declare-fun tp!114543 () Bool)

(assert (=> b!1583587 (= e!883714 (and tp_is_empty!39229 tp!114543))))

(declare-fun b!1583588 () Bool)

(declare-fun res!1081048 () Bool)

(assert (=> b!1583588 (=> res!1081048 e!883711)))

(declare-fun containsKey!929 (List!36856 (_ BitVec 64)) Bool)

(assert (=> b!1583588 (= res!1081048 (not (containsKey!929 (t!51762 l!1390) key!405)))))

(declare-fun b!1583589 () Bool)

(declare-fun res!1081055 () Bool)

(assert (=> b!1583589 (=> (not res!1081055) (not e!883710))))

(assert (=> b!1583589 (= res!1081055 (containsKey!929 l!1390 key!405))))

(declare-fun b!1583590 () Bool)

(assert (=> b!1583590 (= e!883711 (not (contains!10541 (t!51762 l!1390) lt!677784)))))

(declare-fun res!1081049 () Bool)

(assert (=> start!137762 (=> (not res!1081049) (not e!883710))))

(assert (=> start!137762 (= res!1081049 (isStrictlySorted!1070 l!1390))))

(assert (=> start!137762 e!883710))

(assert (=> start!137762 e!883714))

(assert (=> start!137762 true))

(assert (=> start!137762 tp_is_empty!39229))

(declare-fun b!1583591 () Bool)

(assert (=> b!1583591 (= e!883713 e!883715)))

(declare-fun res!1081051 () Bool)

(assert (=> b!1583591 (=> (not res!1081051) (not e!883715))))

(declare-fun e!883712 () Bool)

(assert (=> b!1583591 (= res!1081051 e!883712)))

(declare-fun res!1081053 () Bool)

(assert (=> b!1583591 (=> res!1081053 e!883712)))

(declare-datatypes ((tuple2!25614 0))(
  ( (tuple2!25615 (_1!12818 tuple2!25612) (_2!12818 List!36856)) )
))
(declare-datatypes ((Option!912 0))(
  ( (Some!911 (v!22418 tuple2!25614)) (None!910) )
))
(declare-fun lt!677783 () Option!912)

(declare-fun isEmpty!1178 (Option!912) Bool)

(assert (=> b!1583591 (= res!1081053 (isEmpty!1178 lt!677783))))

(declare-fun unapply!91 (List!36856) Option!912)

(assert (=> b!1583591 (= lt!677783 (unapply!91 l!1390))))

(declare-fun b!1583592 () Bool)

(declare-fun get!26852 (Option!912) tuple2!25614)

(assert (=> b!1583592 (= e!883712 (not ((_ is Nil!36853) (_2!12818 (get!26852 lt!677783)))))))

(assert (= (and start!137762 res!1081049) b!1583589))

(assert (= (and b!1583589 res!1081055) b!1583586))

(assert (= (and b!1583586 res!1081054) b!1583591))

(assert (= (and b!1583591 (not res!1081053)) b!1583592))

(assert (= (and b!1583591 res!1081051) b!1583585))

(assert (= (and b!1583585 res!1081052) b!1583584))

(assert (= (and b!1583584 (not res!1081050)) b!1583588))

(assert (= (and b!1583588 (not res!1081048)) b!1583590))

(assert (= (and start!137762 ((_ is Cons!36852) l!1390)) b!1583587))

(declare-fun m!1454529 () Bool)

(assert (=> b!1583590 m!1454529))

(declare-fun m!1454531 () Bool)

(assert (=> b!1583586 m!1454531))

(declare-fun m!1454533 () Bool)

(assert (=> b!1583589 m!1454533))

(declare-fun m!1454535 () Bool)

(assert (=> start!137762 m!1454535))

(declare-fun m!1454537 () Bool)

(assert (=> b!1583588 m!1454537))

(declare-fun m!1454539 () Bool)

(assert (=> b!1583592 m!1454539))

(declare-fun m!1454541 () Bool)

(assert (=> b!1583591 m!1454541))

(declare-fun m!1454543 () Bool)

(assert (=> b!1583591 m!1454543))

(declare-fun m!1454545 () Bool)

(assert (=> b!1583584 m!1454545))

(check-sat (not b!1583586) (not start!137762) (not b!1583588) (not b!1583589) (not b!1583590) (not b!1583587) tp_is_empty!39229 (not b!1583591) (not b!1583592) (not b!1583584))
(check-sat)
(get-model)

(declare-fun d!167347 () Bool)

(declare-fun res!1081108 () Bool)

(declare-fun e!883756 () Bool)

(assert (=> d!167347 (=> res!1081108 e!883756)))

(assert (=> d!167347 (= res!1081108 (or ((_ is Nil!36853) l!1390) ((_ is Nil!36853) (t!51762 l!1390))))))

(assert (=> d!167347 (= (isStrictlySorted!1070 l!1390) e!883756)))

(declare-fun b!1583651 () Bool)

(declare-fun e!883757 () Bool)

(assert (=> b!1583651 (= e!883756 e!883757)))

(declare-fun res!1081109 () Bool)

(assert (=> b!1583651 (=> (not res!1081109) (not e!883757))))

(assert (=> b!1583651 (= res!1081109 (bvslt (_1!12817 (h!38413 l!1390)) (_1!12817 (h!38413 (t!51762 l!1390)))))))

(declare-fun b!1583652 () Bool)

(assert (=> b!1583652 (= e!883757 (isStrictlySorted!1070 (t!51762 l!1390)))))

(assert (= (and d!167347 (not res!1081108)) b!1583651))

(assert (= (and b!1583651 res!1081109) b!1583652))

(assert (=> b!1583652 m!1454545))

(assert (=> start!137762 d!167347))

(declare-fun d!167351 () Bool)

(assert (=> d!167351 (= (get!26852 lt!677783) (v!22418 lt!677783))))

(assert (=> b!1583592 d!167351))

(declare-fun d!167357 () Bool)

(declare-fun res!1081120 () Bool)

(declare-fun e!883768 () Bool)

(assert (=> d!167357 (=> res!1081120 e!883768)))

(assert (=> d!167357 (= res!1081120 (and ((_ is Cons!36852) (t!51762 l!1390)) (= (_1!12817 (h!38413 (t!51762 l!1390))) key!405)))))

(assert (=> d!167357 (= (containsKey!929 (t!51762 l!1390) key!405) e!883768)))

(declare-fun b!1583663 () Bool)

(declare-fun e!883769 () Bool)

(assert (=> b!1583663 (= e!883768 e!883769)))

(declare-fun res!1081121 () Bool)

(assert (=> b!1583663 (=> (not res!1081121) (not e!883769))))

(assert (=> b!1583663 (= res!1081121 (and (or (not ((_ is Cons!36852) (t!51762 l!1390))) (bvsle (_1!12817 (h!38413 (t!51762 l!1390))) key!405)) ((_ is Cons!36852) (t!51762 l!1390)) (bvslt (_1!12817 (h!38413 (t!51762 l!1390))) key!405)))))

(declare-fun b!1583664 () Bool)

(assert (=> b!1583664 (= e!883769 (containsKey!929 (t!51762 (t!51762 l!1390)) key!405))))

(assert (= (and d!167357 (not res!1081120)) b!1583663))

(assert (= (and b!1583663 res!1081121) b!1583664))

(declare-fun m!1454585 () Bool)

(assert (=> b!1583664 m!1454585))

(assert (=> b!1583588 d!167357))

(declare-fun d!167363 () Bool)

(declare-fun res!1081126 () Bool)

(declare-fun e!883774 () Bool)

(assert (=> d!167363 (=> res!1081126 e!883774)))

(assert (=> d!167363 (= res!1081126 (and ((_ is Cons!36852) l!1390) (= (_1!12817 (h!38413 l!1390)) key!405)))))

(assert (=> d!167363 (= (containsKey!929 l!1390 key!405) e!883774)))

(declare-fun b!1583669 () Bool)

(declare-fun e!883775 () Bool)

(assert (=> b!1583669 (= e!883774 e!883775)))

(declare-fun res!1081127 () Bool)

(assert (=> b!1583669 (=> (not res!1081127) (not e!883775))))

(assert (=> b!1583669 (= res!1081127 (and (or (not ((_ is Cons!36852) l!1390)) (bvsle (_1!12817 (h!38413 l!1390)) key!405)) ((_ is Cons!36852) l!1390) (bvslt (_1!12817 (h!38413 l!1390)) key!405)))))

(declare-fun b!1583670 () Bool)

(assert (=> b!1583670 (= e!883775 (containsKey!929 (t!51762 l!1390) key!405))))

(assert (= (and d!167363 (not res!1081126)) b!1583669))

(assert (= (and b!1583669 res!1081127) b!1583670))

(assert (=> b!1583670 m!1454537))

(assert (=> b!1583589 d!167363))

(declare-fun d!167367 () Bool)

(declare-fun res!1081128 () Bool)

(declare-fun e!883776 () Bool)

(assert (=> d!167367 (=> res!1081128 e!883776)))

(assert (=> d!167367 (= res!1081128 (or ((_ is Nil!36853) (t!51762 l!1390)) ((_ is Nil!36853) (t!51762 (t!51762 l!1390)))))))

(assert (=> d!167367 (= (isStrictlySorted!1070 (t!51762 l!1390)) e!883776)))

(declare-fun b!1583671 () Bool)

(declare-fun e!883777 () Bool)

(assert (=> b!1583671 (= e!883776 e!883777)))

(declare-fun res!1081129 () Bool)

(assert (=> b!1583671 (=> (not res!1081129) (not e!883777))))

(assert (=> b!1583671 (= res!1081129 (bvslt (_1!12817 (h!38413 (t!51762 l!1390))) (_1!12817 (h!38413 (t!51762 (t!51762 l!1390))))))))

(declare-fun b!1583672 () Bool)

(assert (=> b!1583672 (= e!883777 (isStrictlySorted!1070 (t!51762 (t!51762 l!1390))))))

(assert (= (and d!167367 (not res!1081128)) b!1583671))

(assert (= (and b!1583671 res!1081129) b!1583672))

(declare-fun m!1454587 () Bool)

(assert (=> b!1583672 m!1454587))

(assert (=> b!1583584 d!167367))

(declare-fun d!167369 () Bool)

(declare-fun lt!677802 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!830 (List!36856) (InoxSet tuple2!25612))

(assert (=> d!167369 (= lt!677802 (select (content!830 (t!51762 l!1390)) lt!677784))))

(declare-fun e!883792 () Bool)

(assert (=> d!167369 (= lt!677802 e!883792)))

(declare-fun res!1081144 () Bool)

(assert (=> d!167369 (=> (not res!1081144) (not e!883792))))

(assert (=> d!167369 (= res!1081144 ((_ is Cons!36852) (t!51762 l!1390)))))

(assert (=> d!167369 (= (contains!10541 (t!51762 l!1390) lt!677784) lt!677802)))

(declare-fun b!1583687 () Bool)

(declare-fun e!883793 () Bool)

(assert (=> b!1583687 (= e!883792 e!883793)))

(declare-fun res!1081145 () Bool)

(assert (=> b!1583687 (=> res!1081145 e!883793)))

(assert (=> b!1583687 (= res!1081145 (= (h!38413 (t!51762 l!1390)) lt!677784))))

(declare-fun b!1583688 () Bool)

(assert (=> b!1583688 (= e!883793 (contains!10541 (t!51762 (t!51762 l!1390)) lt!677784))))

(assert (= (and d!167369 res!1081144) b!1583687))

(assert (= (and b!1583687 (not res!1081145)) b!1583688))

(declare-fun m!1454595 () Bool)

(assert (=> d!167369 m!1454595))

(declare-fun m!1454597 () Bool)

(assert (=> d!167369 m!1454597))

(declare-fun m!1454599 () Bool)

(assert (=> b!1583688 m!1454599))

(assert (=> b!1583590 d!167369))

(declare-fun d!167377 () Bool)

(assert (=> d!167377 (= (isEmpty!1178 lt!677783) (not ((_ is Some!911) lt!677783)))))

(assert (=> b!1583591 d!167377))

(declare-fun d!167383 () Bool)

(assert (=> d!167383 (= (unapply!91 l!1390) (ite ((_ is Nil!36853) l!1390) None!910 (Some!911 (tuple2!25615 (h!38413 l!1390) (t!51762 l!1390)))))))

(assert (=> b!1583591 d!167383))

(declare-fun d!167389 () Bool)

(declare-fun lt!677803 () Bool)

(assert (=> d!167389 (= lt!677803 (select (content!830 l!1390) lt!677784))))

(declare-fun e!883802 () Bool)

(assert (=> d!167389 (= lt!677803 e!883802)))

(declare-fun res!1081154 () Bool)

(assert (=> d!167389 (=> (not res!1081154) (not e!883802))))

(assert (=> d!167389 (= res!1081154 ((_ is Cons!36852) l!1390))))

(assert (=> d!167389 (= (contains!10541 l!1390 lt!677784) lt!677803)))

(declare-fun b!1583697 () Bool)

(declare-fun e!883803 () Bool)

(assert (=> b!1583697 (= e!883802 e!883803)))

(declare-fun res!1081155 () Bool)

(assert (=> b!1583697 (=> res!1081155 e!883803)))

(assert (=> b!1583697 (= res!1081155 (= (h!38413 l!1390) lt!677784))))

(declare-fun b!1583698 () Bool)

(assert (=> b!1583698 (= e!883803 (contains!10541 (t!51762 l!1390) lt!677784))))

(assert (= (and d!167389 res!1081154) b!1583697))

(assert (= (and b!1583697 (not res!1081155)) b!1583698))

(declare-fun m!1454603 () Bool)

(assert (=> d!167389 m!1454603))

(declare-fun m!1454605 () Bool)

(assert (=> d!167389 m!1454605))

(assert (=> b!1583698 m!1454529))

(assert (=> b!1583586 d!167389))

(declare-fun b!1583707 () Bool)

(declare-fun e!883812 () Bool)

(declare-fun tp!114552 () Bool)

(assert (=> b!1583707 (= e!883812 (and tp_is_empty!39229 tp!114552))))

(assert (=> b!1583587 (= tp!114543 e!883812)))

(assert (= (and b!1583587 ((_ is Cons!36852) (t!51762 l!1390))) b!1583707))

(check-sat (not b!1583672) (not b!1583664) (not b!1583652) (not b!1583698) (not d!167369) (not b!1583688) (not b!1583707) tp_is_empty!39229 (not d!167389) (not b!1583670))
(check-sat)
