; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7088 () Bool)

(assert start!7088)

(declare-fun res!26682 () Bool)

(declare-fun e!28960 () Bool)

(assert (=> start!7088 (=> (not res!26682) (not e!28960))))

(declare-datatypes ((V!2367 0))(
  ( (V!2368 (val!995 Int)) )
))
(declare-datatypes ((ValueCell!709 0))(
  ( (ValueCellFull!709 (v!2097 V!2367)) (EmptyCell!709) )
))
(declare-fun c!12 () ValueCell!709)

(declare-fun isFull!3 (ValueCell!709) Bool)

(assert (=> start!7088 (= res!26682 (isFull!3 c!12))))

(assert (=> start!7088 e!28960))

(declare-fun e!28961 () Bool)

(assert (=> start!7088 e!28961))

(declare-fun b!45491 () Bool)

(assert (=> b!45491 (= e!28960 (not (is-ValueCellFull!709 c!12)))))

(declare-fun b!45492 () Bool)

(declare-fun tp_is_empty!1913 () Bool)

(assert (=> b!45492 (= e!28961 tp_is_empty!1913)))

(assert (= (and start!7088 res!26682) b!45491))

(assert (= (and start!7088 (is-ValueCellFull!709 c!12)) b!45492))

(declare-fun m!40045 () Bool)

(assert (=> start!7088 m!40045))

(push 1)

(assert (not start!7088))

(assert tp_is_empty!1913)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8865 () Bool)

(assert (=> d!8865 (= (isFull!3 c!12) (is-ValueCellFull!709 c!12))))

(assert (=> start!7088 d!8865))

(push 1)

(assert tp_is_empty!1913)

(check-sat)

(pop 1)

