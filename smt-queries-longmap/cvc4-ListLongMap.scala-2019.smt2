; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35194 () Bool)

(assert start!35194)

(declare-fun b_free!7787 () Bool)

(declare-fun b_next!7787 () Bool)

(assert (=> start!35194 (= b_free!7787 (not b_next!7787))))

(declare-fun tp!26952 () Bool)

(declare-fun b_and!15025 () Bool)

(assert (=> start!35194 (= tp!26952 b_and!15025)))

(declare-fun b!352834 () Bool)

(declare-fun res!195662 () Bool)

(declare-fun e!216053 () Bool)

(assert (=> b!352834 (=> (not res!195662) (not e!216053))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11295 0))(
  ( (V!11296 (val!3914 Int)) )
))
(declare-fun zeroValue!1467 () V!11295)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3526 0))(
  ( (ValueCellFull!3526 (v!6105 V!11295)) (EmptyCell!3526) )
))
(declare-datatypes ((array!19067 0))(
  ( (array!19068 (arr!9035 (Array (_ BitVec 32) ValueCell!3526)) (size!9387 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19067)

(declare-fun minValue!1467 () V!11295)

(declare-datatypes ((array!19069 0))(
  ( (array!19070 (arr!9036 (Array (_ BitVec 32) (_ BitVec 64))) (size!9388 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19069)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5640 0))(
  ( (tuple2!5641 (_1!2831 (_ BitVec 64)) (_2!2831 V!11295)) )
))
(declare-datatypes ((List!5259 0))(
  ( (Nil!5256) (Cons!5255 (h!6111 tuple2!5640) (t!10405 List!5259)) )
))
(declare-datatypes ((ListLongMap!4553 0))(
  ( (ListLongMap!4554 (toList!2292 List!5259)) )
))
(declare-fun contains!2365 (ListLongMap!4553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1813 (array!19069 array!19067 (_ BitVec 32) (_ BitVec 32) V!11295 V!11295 (_ BitVec 32) Int) ListLongMap!4553)

(assert (=> b!352834 (= res!195662 (not (contains!2365 (getCurrentListMap!1813 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!13092 () Bool)

(declare-fun mapRes!13092 () Bool)

(declare-fun tp!26951 () Bool)

(declare-fun e!216054 () Bool)

(assert (=> mapNonEmpty!13092 (= mapRes!13092 (and tp!26951 e!216054))))

(declare-fun mapKey!13092 () (_ BitVec 32))

(declare-fun mapValue!13092 () ValueCell!3526)

(declare-fun mapRest!13092 () (Array (_ BitVec 32) ValueCell!3526))

(assert (=> mapNonEmpty!13092 (= (arr!9035 _values!1525) (store mapRest!13092 mapKey!13092 mapValue!13092))))

(declare-fun res!195660 () Bool)

(assert (=> start!35194 (=> (not res!195660) (not e!216053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35194 (= res!195660 (validMask!0 mask!2385))))

(assert (=> start!35194 e!216053))

(assert (=> start!35194 true))

(declare-fun tp_is_empty!7739 () Bool)

(assert (=> start!35194 tp_is_empty!7739))

(assert (=> start!35194 tp!26952))

(declare-fun e!216055 () Bool)

(declare-fun array_inv!6660 (array!19067) Bool)

(assert (=> start!35194 (and (array_inv!6660 _values!1525) e!216055)))

(declare-fun array_inv!6661 (array!19069) Bool)

(assert (=> start!35194 (array_inv!6661 _keys!1895)))

(declare-fun b!352835 () Bool)

(declare-fun e!216056 () Bool)

(assert (=> b!352835 (= e!216056 tp_is_empty!7739)))

(declare-fun b!352836 () Bool)

(assert (=> b!352836 (= e!216054 tp_is_empty!7739)))

(declare-fun mapIsEmpty!13092 () Bool)

(assert (=> mapIsEmpty!13092 mapRes!13092))

(declare-fun b!352837 () Bool)

(declare-fun res!195665 () Bool)

(assert (=> b!352837 (=> (not res!195665) (not e!216053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19069 (_ BitVec 32)) Bool)

(assert (=> b!352837 (= res!195665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352838 () Bool)

(assert (=> b!352838 (= e!216055 (and e!216056 mapRes!13092))))

(declare-fun condMapEmpty!13092 () Bool)

(declare-fun mapDefault!13092 () ValueCell!3526)

