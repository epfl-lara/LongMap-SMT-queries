; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35230 () Bool)

(assert start!35230)

(declare-fun b_free!7805 () Bool)

(declare-fun b_next!7805 () Bool)

(assert (=> start!35230 (= b_free!7805 (not b_next!7805))))

(declare-fun tp!27008 () Bool)

(declare-fun b_and!15045 () Bool)

(assert (=> start!35230 (= tp!27008 b_and!15045)))

(declare-fun b!353204 () Bool)

(declare-fun res!195869 () Bool)

(declare-fun e!216270 () Bool)

(assert (=> b!353204 (=> (not res!195869) (not e!216270))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11319 0))(
  ( (V!11320 (val!3923 Int)) )
))
(declare-fun zeroValue!1467 () V!11319)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3535 0))(
  ( (ValueCellFull!3535 (v!6115 V!11319)) (EmptyCell!3535) )
))
(declare-datatypes ((array!19105 0))(
  ( (array!19106 (arr!9053 (Array (_ BitVec 32) ValueCell!3535)) (size!9405 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19105)

(declare-datatypes ((array!19107 0))(
  ( (array!19108 (arr!9054 (Array (_ BitVec 32) (_ BitVec 64))) (size!9406 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19107)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11319)

(declare-datatypes ((tuple2!5654 0))(
  ( (tuple2!5655 (_1!2838 (_ BitVec 64)) (_2!2838 V!11319)) )
))
(declare-datatypes ((List!5273 0))(
  ( (Nil!5270) (Cons!5269 (h!6125 tuple2!5654) (t!10421 List!5273)) )
))
(declare-datatypes ((ListLongMap!4567 0))(
  ( (ListLongMap!4568 (toList!2299 List!5273)) )
))
(declare-fun contains!2373 (ListLongMap!4567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1820 (array!19107 array!19105 (_ BitVec 32) (_ BitVec 32) V!11319 V!11319 (_ BitVec 32) Int) ListLongMap!4567)

(assert (=> b!353204 (= res!195869 (not (contains!2373 (getCurrentListMap!1820 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!353206 () Bool)

(declare-fun e!216271 () Bool)

(declare-fun tp_is_empty!7757 () Bool)

(assert (=> b!353206 (= e!216271 tp_is_empty!7757)))

(declare-fun mapIsEmpty!13122 () Bool)

(declare-fun mapRes!13122 () Bool)

(assert (=> mapIsEmpty!13122 mapRes!13122))

(declare-fun b!353207 () Bool)

(declare-fun res!195868 () Bool)

(assert (=> b!353207 (=> (not res!195868) (not e!216270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19107 (_ BitVec 32)) Bool)

(assert (=> b!353207 (= res!195868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!13122 () Bool)

(declare-fun tp!27009 () Bool)

(assert (=> mapNonEmpty!13122 (= mapRes!13122 (and tp!27009 e!216271))))

(declare-fun mapRest!13122 () (Array (_ BitVec 32) ValueCell!3535))

(declare-fun mapValue!13122 () ValueCell!3535)

(declare-fun mapKey!13122 () (_ BitVec 32))

(assert (=> mapNonEmpty!13122 (= (arr!9053 _values!1525) (store mapRest!13122 mapKey!13122 mapValue!13122))))

(declare-fun b!353208 () Bool)

(declare-fun e!216269 () Bool)

(declare-fun e!216273 () Bool)

(assert (=> b!353208 (= e!216269 (and e!216273 mapRes!13122))))

(declare-fun condMapEmpty!13122 () Bool)

(declare-fun mapDefault!13122 () ValueCell!3535)

