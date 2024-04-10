; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37002 () Bool)

(assert start!37002)

(declare-fun b_free!8129 () Bool)

(declare-fun b_next!8129 () Bool)

(assert (=> start!37002 (= b_free!8129 (not b_next!8129))))

(declare-fun tp!29102 () Bool)

(declare-fun b_and!15371 () Bool)

(assert (=> start!37002 (= tp!29102 b_and!15371)))

(declare-fun b!371555 () Bool)

(declare-fun res!208886 () Bool)

(declare-fun e!226771 () Bool)

(assert (=> b!371555 (=> (not res!208886) (not e!226771))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371555 (= res!208886 (validKeyInArray!0 k!778))))

(declare-fun b!371556 () Bool)

(declare-fun e!226773 () Bool)

(declare-fun tp_is_empty!8777 () Bool)

(assert (=> b!371556 (= e!226773 tp_is_empty!8777)))

(declare-fun mapNonEmpty!14730 () Bool)

(declare-fun mapRes!14730 () Bool)

(declare-fun tp!29103 () Bool)

(declare-fun e!226774 () Bool)

(assert (=> mapNonEmpty!14730 (= mapRes!14730 (and tp!29103 e!226774))))

(declare-datatypes ((V!12807 0))(
  ( (V!12808 (val!4433 Int)) )
))
(declare-datatypes ((ValueCell!4045 0))(
  ( (ValueCellFull!4045 (v!6630 V!12807)) (EmptyCell!4045) )
))
(declare-datatypes ((array!21495 0))(
  ( (array!21496 (arr!10216 (Array (_ BitVec 32) ValueCell!4045)) (size!10568 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21495)

(declare-fun mapValue!14730 () ValueCell!4045)

(declare-fun mapKey!14730 () (_ BitVec 32))

(declare-fun mapRest!14730 () (Array (_ BitVec 32) ValueCell!4045))

(assert (=> mapNonEmpty!14730 (= (arr!10216 _values!506) (store mapRest!14730 mapKey!14730 mapValue!14730))))

(declare-fun b!371557 () Bool)

(declare-fun res!208881 () Bool)

(assert (=> b!371557 (=> (not res!208881) (not e!226771))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!21497 0))(
  ( (array!21498 (arr!10217 (Array (_ BitVec 32) (_ BitVec 64))) (size!10569 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21497)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!371557 (= res!208881 (and (= (size!10568 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10569 _keys!658) (size!10568 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371558 () Bool)

(declare-fun res!208885 () Bool)

(assert (=> b!371558 (=> (not res!208885) (not e!226771))))

(declare-datatypes ((List!5722 0))(
  ( (Nil!5719) (Cons!5718 (h!6574 (_ BitVec 64)) (t!10872 List!5722)) )
))
(declare-fun arrayNoDuplicates!0 (array!21497 (_ BitVec 32) List!5722) Bool)

(assert (=> b!371558 (= res!208885 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5719))))

(declare-fun b!371559 () Bool)

(declare-fun e!226775 () Bool)

(assert (=> b!371559 (= e!226775 (not true))))

(declare-datatypes ((tuple2!5882 0))(
  ( (tuple2!5883 (_1!2952 (_ BitVec 64)) (_2!2952 V!12807)) )
))
(declare-datatypes ((List!5723 0))(
  ( (Nil!5720) (Cons!5719 (h!6575 tuple2!5882) (t!10873 List!5723)) )
))
(declare-datatypes ((ListLongMap!4795 0))(
  ( (ListLongMap!4796 (toList!2413 List!5723)) )
))
(declare-fun lt!170333 () ListLongMap!4795)

(declare-fun lt!170330 () ListLongMap!4795)

(assert (=> b!371559 (and (= lt!170333 lt!170330) (= lt!170330 lt!170333))))

(declare-fun v!373 () V!12807)

(declare-fun lt!170331 () ListLongMap!4795)

(declare-fun +!759 (ListLongMap!4795 tuple2!5882) ListLongMap!4795)

(assert (=> b!371559 (= lt!170330 (+!759 lt!170331 (tuple2!5883 k!778 v!373)))))

(declare-datatypes ((Unit!11424 0))(
  ( (Unit!11425) )
))
(declare-fun lt!170334 () Unit!11424)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12807)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12807)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!14 (array!21497 array!21495 (_ BitVec 32) (_ BitVec 32) V!12807 V!12807 (_ BitVec 32) (_ BitVec 64) V!12807 (_ BitVec 32) Int) Unit!11424)

(assert (=> b!371559 (= lt!170334 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!14 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170332 () array!21497)

(declare-fun getCurrentListMapNoExtraKeys!690 (array!21497 array!21495 (_ BitVec 32) (_ BitVec 32) V!12807 V!12807 (_ BitVec 32) Int) ListLongMap!4795)

(assert (=> b!371559 (= lt!170333 (getCurrentListMapNoExtraKeys!690 lt!170332 (array!21496 (store (arr!10216 _values!506) i!548 (ValueCellFull!4045 v!373)) (size!10568 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371559 (= lt!170331 (getCurrentListMapNoExtraKeys!690 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371560 () Bool)

(declare-fun e!226772 () Bool)

(assert (=> b!371560 (= e!226772 (and e!226773 mapRes!14730))))

(declare-fun condMapEmpty!14730 () Bool)

(declare-fun mapDefault!14730 () ValueCell!4045)

