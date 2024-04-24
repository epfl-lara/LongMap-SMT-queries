; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5126 () Bool)

(assert start!5126)

(declare-datatypes ((List!969 0))(
  ( (Nil!966) (Cons!965 (h!1533 (_ BitVec 64)) (t!3802 List!969)) )
))
(declare-fun keys!14 () List!969)

(declare-fun ListPrimitiveSize!34 (List!969) Int)

(assert (=> start!5126 (< (ListPrimitiveSize!34 keys!14) 0)))

(assert (=> start!5126 true))

(declare-fun bs!1482 () Bool)

(assert (= bs!1482 start!5126))

(declare-fun m!30337 () Bool)

(assert (=> bs!1482 m!30337))

(check-sat (not start!5126))
(check-sat)
(get-model)

(declare-fun d!6053 () Bool)

(declare-fun lt!13842 () Int)

(assert (=> d!6053 (>= lt!13842 0)))

(declare-fun e!23870 () Int)

(assert (=> d!6053 (= lt!13842 e!23870)))

(declare-fun c!4347 () Bool)

(get-info :version)

(assert (=> d!6053 (= c!4347 ((_ is Nil!966) keys!14))))

(assert (=> d!6053 (= (ListPrimitiveSize!34 keys!14) lt!13842)))

(declare-fun b!37672 () Bool)

(assert (=> b!37672 (= e!23870 0)))

(declare-fun b!37673 () Bool)

(assert (=> b!37673 (= e!23870 (+ 1 (ListPrimitiveSize!34 (t!3802 keys!14))))))

(assert (= (and d!6053 c!4347) b!37672))

(assert (= (and d!6053 (not c!4347)) b!37673))

(declare-fun m!30344 () Bool)

(assert (=> b!37673 m!30344))

(assert (=> start!5126 d!6053))

(check-sat (not b!37673))
(check-sat)
