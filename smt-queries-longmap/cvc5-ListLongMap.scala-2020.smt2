; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35196 () Bool)

(assert start!35196)

(declare-fun b_free!7789 () Bool)

(declare-fun b_next!7789 () Bool)

(assert (=> start!35196 (= b_free!7789 (not b_next!7789))))

(declare-fun tp!26957 () Bool)

(declare-fun b_and!15027 () Bool)

(assert (=> start!35196 (= tp!26957 b_and!15027)))

(declare-fun b!352861 () Bool)

(declare-fun res!195680 () Bool)

(declare-fun e!216071 () Bool)

(assert (=> b!352861 (=> (not res!195680) (not e!216071))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352861 (= res!195680 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!13095 () Bool)

(declare-fun mapRes!13095 () Bool)

(assert (=> mapIsEmpty!13095 mapRes!13095))

(declare-fun b!352862 () Bool)

(declare-fun res!195679 () Bool)

(assert (=> b!352862 (=> (not res!195679) (not e!216071))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11299 0))(
  ( (V!11300 (val!3915 Int)) )
))
(declare-fun zeroValue!1467 () V!11299)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3527 0))(
  ( (ValueCellFull!3527 (v!6106 V!11299)) (EmptyCell!3527) )
))
(declare-datatypes ((array!19071 0))(
  ( (array!19072 (arr!9037 (Array (_ BitVec 32) ValueCell!3527)) (size!9389 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19071)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11299)

(declare-datatypes ((array!19073 0))(
  ( (array!19074 (arr!9038 (Array (_ BitVec 32) (_ BitVec 64))) (size!9390 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19073)

(declare-datatypes ((tuple2!5642 0))(
  ( (tuple2!5643 (_1!2832 (_ BitVec 64)) (_2!2832 V!11299)) )
))
(declare-datatypes ((List!5260 0))(
  ( (Nil!5257) (Cons!5256 (h!6112 tuple2!5642) (t!10406 List!5260)) )
))
(declare-datatypes ((ListLongMap!4555 0))(
  ( (ListLongMap!4556 (toList!2293 List!5260)) )
))
(declare-fun contains!2366 (ListLongMap!4555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1814 (array!19073 array!19071 (_ BitVec 32) (_ BitVec 32) V!11299 V!11299 (_ BitVec 32) Int) ListLongMap!4555)

(assert (=> b!352862 (= res!195679 (not (contains!2366 (getCurrentListMap!1814 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!352863 () Bool)

(declare-fun res!195678 () Bool)

(assert (=> b!352863 (=> (not res!195678) (not e!216071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19073 (_ BitVec 32)) Bool)

(assert (=> b!352863 (= res!195678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352864 () Bool)

(declare-fun e!216070 () Bool)

(declare-fun tp_is_empty!7741 () Bool)

(assert (=> b!352864 (= e!216070 tp_is_empty!7741)))

(declare-fun b!352865 () Bool)

(declare-fun e!216072 () Bool)

(assert (=> b!352865 (= e!216072 (and e!216070 mapRes!13095))))

(declare-fun condMapEmpty!13095 () Bool)

(declare-fun mapDefault!13095 () ValueCell!3527)

