; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5124 () Bool)

(assert start!5124)

(declare-datatypes ((List!984 0))(
  ( (Nil!981) (Cons!980 (h!1548 (_ BitVec 64)) (t!3817 List!984)) )
))
(declare-fun keys!14 () List!984)

(declare-fun ListPrimitiveSize!35 (List!984) Int)

(assert (=> start!5124 (< (ListPrimitiveSize!35 keys!14) 0)))

(assert (=> start!5124 true))

(declare-fun bs!1484 () Bool)

(assert (= bs!1484 start!5124))

(declare-fun m!30465 () Bool)

(assert (=> bs!1484 m!30465))

(check-sat (not start!5124))
(check-sat)
(get-model)

(declare-fun d!6067 () Bool)

(declare-fun lt!13886 () Int)

(assert (=> d!6067 (>= lt!13886 0)))

(declare-fun e!23908 () Int)

(assert (=> d!6067 (= lt!13886 e!23908)))

(declare-fun c!4364 () Bool)

(get-info :version)

(assert (=> d!6067 (= c!4364 ((_ is Nil!981) keys!14))))

(assert (=> d!6067 (= (ListPrimitiveSize!35 keys!14) lt!13886)))

(declare-fun b!37731 () Bool)

(assert (=> b!37731 (= e!23908 0)))

(declare-fun b!37732 () Bool)

(assert (=> b!37732 (= e!23908 (+ 1 (ListPrimitiveSize!35 (t!3817 keys!14))))))

(assert (= (and d!6067 c!4364) b!37731))

(assert (= (and d!6067 (not c!4364)) b!37732))

(declare-fun m!30473 () Bool)

(assert (=> b!37732 m!30473))

(assert (=> start!5124 d!6067))

(check-sat (not b!37732))
(check-sat)
