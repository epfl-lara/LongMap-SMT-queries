; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19970 () Bool)

(assert start!19970)

(declare-fun mapNonEmpty!7841 () Bool)

(declare-fun mapRes!7841 () Bool)

(declare-fun tp!17129 () Bool)

(declare-fun e!128892 () Bool)

(assert (=> mapNonEmpty!7841 (= mapRes!7841 (and tp!17129 e!128892))))

(declare-datatypes ((V!5677 0))(
  ( (V!5678 (val!2306 Int)) )
))
(declare-datatypes ((ValueCell!1918 0))(
  ( (ValueCellFull!1918 (v!4275 V!5677)) (EmptyCell!1918) )
))
(declare-datatypes ((array!8303 0))(
  ( (array!8304 (arr!3906 (Array (_ BitVec 32) ValueCell!1918)) (size!4231 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8303)

(declare-fun mapValue!7841 () ValueCell!1918)

(declare-fun mapRest!7841 () (Array (_ BitVec 32) ValueCell!1918))

(declare-fun mapKey!7841 () (_ BitVec 32))

(assert (=> mapNonEmpty!7841 (= (arr!3906 _values!649) (store mapRest!7841 mapKey!7841 mapValue!7841))))

(declare-fun b!195827 () Bool)

(declare-fun tp_is_empty!4523 () Bool)

(assert (=> b!195827 (= e!128892 tp_is_empty!4523)))

(declare-fun b!195828 () Bool)

(declare-fun e!128893 () Bool)

(declare-fun e!128894 () Bool)

(assert (=> b!195828 (= e!128893 (and e!128894 mapRes!7841))))

(declare-fun condMapEmpty!7841 () Bool)

(declare-fun mapDefault!7841 () ValueCell!1918)

