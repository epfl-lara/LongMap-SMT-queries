; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5126 () Bool)

(assert start!5126)

(declare-datatypes ((List!985 0))(
  ( (Nil!982) (Cons!981 (h!1549 (_ BitVec 64)) (t!3818 List!985)) )
))
(declare-fun keys!14 () List!985)

(declare-fun ListPrimitiveSize!36 (List!985) Int)

(assert (=> start!5126 (< (ListPrimitiveSize!36 keys!14) 0)))

(assert (=> start!5126 true))

(declare-fun bs!1485 () Bool)

(assert (= bs!1485 start!5126))

(declare-fun m!30467 () Bool)

(assert (=> bs!1485 m!30467))

(push 1)

(assert (not start!5126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6063 () Bool)

(declare-fun lt!13884 () Int)

(assert (=> d!6063 (>= lt!13884 0)))

(declare-fun e!23906 () Int)

(assert (=> d!6063 (= lt!13884 e!23906)))

(declare-fun c!4362 () Bool)

(assert (=> d!6063 (= c!4362 (is-Nil!982 keys!14))))

(assert (=> d!6063 (= (ListPrimitiveSize!36 keys!14) lt!13884)))

(declare-fun b!37727 () Bool)

(assert (=> b!37727 (= e!23906 0)))

(declare-fun b!37728 () Bool)

(assert (=> b!37728 (= e!23906 (+ 1 (ListPrimitiveSize!36 (t!3818 keys!14))))))

(assert (= (and d!6063 c!4362) b!37727))

(assert (= (and d!6063 (not c!4362)) b!37728))

(declare-fun m!30469 () Bool)

(assert (=> b!37728 m!30469))

(assert (=> start!5126 d!6063))

(push 1)

