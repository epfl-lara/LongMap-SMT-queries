; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5122 () Bool)

(assert start!5122)

(declare-datatypes ((List!983 0))(
  ( (Nil!980) (Cons!979 (h!1547 (_ BitVec 64)) (t!3816 List!983)) )
))
(declare-fun keys!14 () List!983)

(declare-fun ListPrimitiveSize!34 (List!983) Int)

(assert (=> start!5122 (< (ListPrimitiveSize!34 keys!14) 0)))

(assert (=> start!5122 true))

(declare-fun bs!1483 () Bool)

(assert (= bs!1483 start!5122))

(declare-fun m!30463 () Bool)

(assert (=> bs!1483 m!30463))

(push 1)

(assert (not start!5122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6065 () Bool)

(declare-fun lt!13885 () Int)

(assert (=> d!6065 (>= lt!13885 0)))

(declare-fun e!23907 () Int)

(assert (=> d!6065 (= lt!13885 e!23907)))

(declare-fun c!4363 () Bool)

(assert (=> d!6065 (= c!4363 (is-Nil!980 keys!14))))

(assert (=> d!6065 (= (ListPrimitiveSize!34 keys!14) lt!13885)))

(declare-fun b!37729 () Bool)

(assert (=> b!37729 (= e!23907 0)))

(declare-fun b!37730 () Bool)

(assert (=> b!37730 (= e!23907 (+ 1 (ListPrimitiveSize!34 (t!3816 keys!14))))))

(assert (= (and d!6065 c!4363) b!37729))

(assert (= (and d!6065 (not c!4363)) b!37730))

(declare-fun m!30471 () Bool)

(assert (=> b!37730 m!30471))

(assert (=> start!5122 d!6065))

(push 1)

