; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72016 () Bool)

(assert start!72016)

(declare-fun res!569033 () Bool)

(declare-fun e!466632 () Bool)

(assert (=> start!72016 (=> (not res!569033) (not e!466632))))

(declare-datatypes ((B!1190 0))(
  ( (B!1191 (val!7677 Int)) )
))
(declare-datatypes ((tuple2!10214 0))(
  ( (tuple2!10215 (_1!5118 (_ BitVec 64)) (_2!5118 B!1190)) )
))
(declare-datatypes ((List!15982 0))(
  ( (Nil!15979) (Cons!15978 (h!17109 tuple2!10214) (t!22353 List!15982)) )
))
(declare-fun l!390 () List!15982)

(declare-fun isStrictlySorted!452 (List!15982) Bool)

(assert (=> start!72016 (= res!569033 (isStrictlySorted!452 l!390))))

(assert (=> start!72016 e!466632))

(declare-fun e!466631 () Bool)

(assert (=> start!72016 e!466631))

(declare-fun b!836397 () Bool)

(declare-fun res!569032 () Bool)

(assert (=> b!836397 (=> (not res!569032) (not e!466632))))

(assert (=> b!836397 (= res!569032 (is-Cons!15978 l!390))))

(declare-fun b!836398 () Bool)

(declare-fun ListPrimitiveSize!70 (List!15982) Int)

(assert (=> b!836398 (= e!466632 (>= (ListPrimitiveSize!70 (t!22353 l!390)) (ListPrimitiveSize!70 l!390)))))

(declare-fun b!836399 () Bool)

(declare-fun tp_is_empty!15259 () Bool)

(declare-fun tp!47441 () Bool)

(assert (=> b!836399 (= e!466631 (and tp_is_empty!15259 tp!47441))))

(assert (= (and start!72016 res!569033) b!836397))

(assert (= (and b!836397 res!569032) b!836398))

(assert (= (and start!72016 (is-Cons!15978 l!390)) b!836399))

(declare-fun m!781681 () Bool)

(assert (=> start!72016 m!781681))

(declare-fun m!781683 () Bool)

(assert (=> b!836398 m!781683))

(declare-fun m!781685 () Bool)

(assert (=> b!836398 m!781685))

(push 1)

(assert (not start!72016))

(assert (not b!836398))

(assert (not b!836399))

(assert tp_is_empty!15259)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107580 () Bool)

(declare-fun res!569054 () Bool)

(declare-fun e!466653 () Bool)

(assert (=> d!107580 (=> res!569054 e!466653)))

(assert (=> d!107580 (= res!569054 (or (is-Nil!15979 l!390) (is-Nil!15979 (t!22353 l!390))))))

(assert (=> d!107580 (= (isStrictlySorted!452 l!390) e!466653)))

(declare-fun b!836426 () Bool)

(declare-fun e!466654 () Bool)

(assert (=> b!836426 (= e!466653 e!466654)))

(declare-fun res!569055 () Bool)

(assert (=> b!836426 (=> (not res!569055) (not e!466654))))

(assert (=> b!836426 (= res!569055 (bvslt (_1!5118 (h!17109 l!390)) (_1!5118 (h!17109 (t!22353 l!390)))))))

(declare-fun b!836427 () Bool)

(assert (=> b!836427 (= e!466654 (isStrictlySorted!452 (t!22353 l!390)))))

(assert (= (and d!107580 (not res!569054)) b!836426))

(assert (= (and b!836426 res!569055) b!836427))

(declare-fun m!781699 () Bool)

(assert (=> b!836427 m!781699))

(assert (=> start!72016 d!107580))

(declare-fun d!107583 () Bool)

(declare-fun lt!380403 () Int)

(assert (=> d!107583 (>= lt!380403 0)))

(declare-fun e!466661 () Int)

(assert (=> d!107583 (= lt!380403 e!466661)))

(declare-fun c!91045 () Bool)

(assert (=> d!107583 (= c!91045 (is-Nil!15979 (t!22353 l!390)))))

(assert (=> d!107583 (= (ListPrimitiveSize!70 (t!22353 l!390)) lt!380403)))

(declare-fun b!836438 () Bool)

(assert (=> b!836438 (= e!466661 0)))

(declare-fun b!836440 () Bool)

(assert (=> b!836440 (= e!466661 (+ 1 (ListPrimitiveSize!70 (t!22353 (t!22353 l!390)))))))

(assert (= (and d!107583 c!91045) b!836438))

(assert (= (and d!107583 (not c!91045)) b!836440))

(declare-fun m!781705 () Bool)

(assert (=> b!836440 m!781705))

(assert (=> b!836398 d!107583))

(declare-fun d!107591 () Bool)

(declare-fun lt!380405 () Int)

(assert (=> d!107591 (>= lt!380405 0)))

(declare-fun e!466663 () Int)

(assert (=> d!107591 (= lt!380405 e!466663)))

(declare-fun c!91047 () Bool)

(assert (=> d!107591 (= c!91047 (is-Nil!15979 l!390))))

(assert (=> d!107591 (= (ListPrimitiveSize!70 l!390) lt!380405)))

(declare-fun b!836442 () Bool)

(assert (=> b!836442 (= e!466663 0)))

(declare-fun b!836444 () Bool)

(assert (=> b!836444 (= e!466663 (+ 1 (ListPrimitiveSize!70 (t!22353 l!390))))))

(assert (= (and d!107591 c!91047) b!836442))

(assert (= (and d!107591 (not c!91047)) b!836444))

(assert (=> b!836444 m!781683))

(assert (=> b!836398 d!107591))

(declare-fun b!836454 () Bool)

(declare-fun e!466669 () Bool)

(declare-fun tp!47452 () Bool)

(assert (=> b!836454 (= e!466669 (and tp_is_empty!15259 tp!47452))))

(assert (=> b!836399 (= tp!47441 e!466669)))

(assert (= (and b!836399 (is-Cons!15978 (t!22353 l!390))) b!836454))

(push 1)

(assert (not b!836427))

(assert (not b!836440))

(assert tp_is_empty!15259)

(assert (not b!836454))

(assert (not b!836444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

