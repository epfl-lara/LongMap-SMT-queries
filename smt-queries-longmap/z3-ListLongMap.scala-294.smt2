; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5120 () Bool)

(assert start!5120)

(declare-datatypes ((List!976 0))(
  ( (Nil!973) (Cons!972 (h!1540 (_ BitVec 64)) (t!3808 List!976)) )
))
(declare-fun keys!14 () List!976)

(declare-fun ListPrimitiveSize!34 (List!976) Int)

(assert (=> start!5120 (< (ListPrimitiveSize!34 keys!14) 0)))

(assert (=> start!5120 true))

(declare-fun bs!1482 () Bool)

(assert (= bs!1482 start!5120))

(declare-fun m!30419 () Bool)

(assert (=> bs!1482 m!30419))

(check-sat (not start!5120))
(check-sat)
(get-model)

(declare-fun d!6051 () Bool)

(declare-fun lt!13881 () Int)

(assert (=> d!6051 (>= lt!13881 0)))

(declare-fun e!23880 () Int)

(assert (=> d!6051 (= lt!13881 e!23880)))

(declare-fun c!4353 () Bool)

(get-info :version)

(assert (=> d!6051 (= c!4353 ((_ is Nil!973) keys!14))))

(assert (=> d!6051 (= (ListPrimitiveSize!34 keys!14) lt!13881)))

(declare-fun b!37692 () Bool)

(assert (=> b!37692 (= e!23880 0)))

(declare-fun b!37693 () Bool)

(assert (=> b!37693 (= e!23880 (+ 1 (ListPrimitiveSize!34 (t!3808 keys!14))))))

(assert (= (and d!6051 c!4353) b!37692))

(assert (= (and d!6051 (not c!4353)) b!37693))

(declare-fun m!30429 () Bool)

(assert (=> b!37693 m!30429))

(assert (=> start!5120 d!6051))

(check-sat (not b!37693))
(check-sat)
