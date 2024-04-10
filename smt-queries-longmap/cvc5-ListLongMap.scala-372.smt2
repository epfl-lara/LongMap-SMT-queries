; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7084 () Bool)

(assert start!7084)

(declare-fun res!26676 () Bool)

(declare-fun e!28948 () Bool)

(assert (=> start!7084 (=> (not res!26676) (not e!28948))))

(declare-datatypes ((V!2363 0))(
  ( (V!2364 (val!993 Int)) )
))
(declare-datatypes ((ValueCell!707 0))(
  ( (ValueCellFull!707 (v!2095 V!2363)) (EmptyCell!707) )
))
(declare-fun c!12 () ValueCell!707)

(declare-fun isFull!1 (ValueCell!707) Bool)

(assert (=> start!7084 (= res!26676 (isFull!1 c!12))))

(assert (=> start!7084 e!28948))

(declare-fun e!28949 () Bool)

(assert (=> start!7084 e!28949))

(declare-fun b!45479 () Bool)

(assert (=> b!45479 (= e!28948 (not (is-ValueCellFull!707 c!12)))))

(declare-fun b!45480 () Bool)

(declare-fun tp_is_empty!1909 () Bool)

(assert (=> b!45480 (= e!28949 tp_is_empty!1909)))

(assert (= (and start!7084 res!26676) b!45479))

(assert (= (and start!7084 (is-ValueCellFull!707 c!12)) b!45480))

(declare-fun m!40041 () Bool)

(assert (=> start!7084 m!40041))

(push 1)

(assert (not start!7084))

(assert tp_is_empty!1909)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8867 () Bool)

(assert (=> d!8867 (= (isFull!1 c!12) (is-ValueCellFull!707 c!12))))

(assert (=> start!7084 d!8867))

(push 1)

(assert tp_is_empty!1909)

(check-sat)

(pop 1)

