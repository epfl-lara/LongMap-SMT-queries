; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33538 () Bool)

(assert start!33538)

(declare-fun b_free!6827 () Bool)

(declare-fun b_next!6827 () Bool)

(assert (=> start!33538 (= b_free!6827 (not b_next!6827))))

(declare-fun tp!23976 () Bool)

(declare-fun b_and!14001 () Bool)

(assert (=> start!33538 (= tp!23976 b_and!14001)))

(declare-fun b!332879 () Bool)

(declare-fun res!183416 () Bool)

(declare-fun e!204407 () Bool)

(assert (=> b!332879 (=> (not res!183416) (not e!204407))))

(declare-datatypes ((array!17151 0))(
  ( (array!17152 (arr!8109 (Array (_ BitVec 32) (_ BitVec 64))) (size!8461 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17151)

(declare-datatypes ((List!4614 0))(
  ( (Nil!4611) (Cons!4610 (h!5466 (_ BitVec 64)) (t!9696 List!4614)) )
))
(declare-fun arrayNoDuplicates!0 (array!17151 (_ BitVec 32) List!4614) Bool)

(assert (=> b!332879 (= res!183416 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4611))))

(declare-fun b!332880 () Bool)

(declare-fun res!183415 () Bool)

(assert (=> b!332880 (=> (not res!183415) (not e!204407))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10015 0))(
  ( (V!10016 (val!3434 Int)) )
))
(declare-fun zeroValue!1467 () V!10015)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10015)

(declare-datatypes ((ValueCell!3046 0))(
  ( (ValueCellFull!3046 (v!5593 V!10015)) (EmptyCell!3046) )
))
(declare-datatypes ((array!17153 0))(
  ( (array!17154 (arr!8110 (Array (_ BitVec 32) ValueCell!3046)) (size!8462 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17153)

(declare-datatypes ((tuple2!5000 0))(
  ( (tuple2!5001 (_1!2511 (_ BitVec 64)) (_2!2511 V!10015)) )
))
(declare-datatypes ((List!4615 0))(
  ( (Nil!4612) (Cons!4611 (h!5467 tuple2!5000) (t!9697 List!4615)) )
))
(declare-datatypes ((ListLongMap!3913 0))(
  ( (ListLongMap!3914 (toList!1972 List!4615)) )
))
(declare-fun contains!2013 (ListLongMap!3913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1500 (array!17151 array!17153 (_ BitVec 32) (_ BitVec 32) V!10015 V!10015 (_ BitVec 32) Int) ListLongMap!3913)

(assert (=> b!332880 (= res!183415 (not (contains!2013 (getCurrentListMap!1500 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!332881 () Bool)

(declare-fun e!204408 () Bool)

(declare-fun tp_is_empty!6779 () Bool)

(assert (=> b!332881 (= e!204408 tp_is_empty!6779)))

(declare-fun mapNonEmpty!11556 () Bool)

(declare-fun mapRes!11556 () Bool)

(declare-fun tp!23975 () Bool)

(declare-fun e!204405 () Bool)

(assert (=> mapNonEmpty!11556 (= mapRes!11556 (and tp!23975 e!204405))))

(declare-fun mapValue!11556 () ValueCell!3046)

(declare-fun mapKey!11556 () (_ BitVec 32))

(declare-fun mapRest!11556 () (Array (_ BitVec 32) ValueCell!3046))

(assert (=> mapNonEmpty!11556 (= (arr!8110 _values!1525) (store mapRest!11556 mapKey!11556 mapValue!11556))))

(declare-fun b!332882 () Bool)

(declare-fun e!204406 () Bool)

(assert (=> b!332882 (= e!204406 (and e!204408 mapRes!11556))))

(declare-fun condMapEmpty!11556 () Bool)

(declare-fun mapDefault!11556 () ValueCell!3046)

