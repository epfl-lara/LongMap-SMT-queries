; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19948 () Bool)

(assert start!19948)

(declare-fun mapIsEmpty!7814 () Bool)

(declare-fun mapRes!7814 () Bool)

(assert (=> mapIsEmpty!7814 mapRes!7814))

(declare-fun mapNonEmpty!7814 () Bool)

(declare-fun tp!17102 () Bool)

(declare-fun e!128765 () Bool)

(assert (=> mapNonEmpty!7814 (= mapRes!7814 (and tp!17102 e!128765))))

(declare-datatypes ((V!5657 0))(
  ( (V!5658 (val!2298 Int)) )
))
(declare-datatypes ((ValueCell!1910 0))(
  ( (ValueCellFull!1910 (v!4267 V!5657)) (EmptyCell!1910) )
))
(declare-fun mapRest!7814 () (Array (_ BitVec 32) ValueCell!1910))

(declare-fun mapKey!7814 () (_ BitVec 32))

(declare-datatypes ((array!8271 0))(
  ( (array!8272 (arr!3891 (Array (_ BitVec 32) ValueCell!1910)) (size!4216 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8271)

(declare-fun mapValue!7814 () ValueCell!1910)

(assert (=> mapNonEmpty!7814 (= (arr!3891 _values!649) (store mapRest!7814 mapKey!7814 mapValue!7814))))

(declare-fun e!128767 () Bool)

(declare-datatypes ((array!8273 0))(
  ( (array!8274 (arr!3892 (Array (_ BitVec 32) (_ BitVec 64))) (size!4217 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8273)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!195707 () Bool)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!195707 (= e!128767 (and (= (size!4216 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4217 _keys!825) (size!4216 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011) (not (= (size!4217 _keys!825) (bvadd #b00000000000000000000000000000001 mask!1149)))))))

(declare-fun b!195708 () Bool)

(declare-fun tp_is_empty!4507 () Bool)

(assert (=> b!195708 (= e!128765 tp_is_empty!4507)))

(declare-fun res!92357 () Bool)

(assert (=> start!19948 (=> (not res!92357) (not e!128767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19948 (= res!92357 (validMask!0 mask!1149))))

(assert (=> start!19948 e!128767))

(assert (=> start!19948 true))

(declare-fun e!128768 () Bool)

(declare-fun array_inv!2525 (array!8271) Bool)

(assert (=> start!19948 (and (array_inv!2525 _values!649) e!128768)))

(declare-fun array_inv!2526 (array!8273) Bool)

(assert (=> start!19948 (array_inv!2526 _keys!825)))

(declare-fun b!195709 () Bool)

(declare-fun e!128769 () Bool)

(assert (=> b!195709 (= e!128769 tp_is_empty!4507)))

(declare-fun b!195710 () Bool)

(assert (=> b!195710 (= e!128768 (and e!128769 mapRes!7814))))

(declare-fun condMapEmpty!7814 () Bool)

(declare-fun mapDefault!7814 () ValueCell!1910)

