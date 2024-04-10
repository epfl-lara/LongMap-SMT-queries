; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37100 () Bool)

(assert start!37100)

(declare-fun b_free!8227 () Bool)

(declare-fun b_next!8227 () Bool)

(assert (=> start!37100 (= b_free!8227 (not b_next!8227))))

(declare-fun tp!29396 () Bool)

(declare-fun b_and!15469 () Bool)

(assert (=> start!37100 (= tp!29396 b_and!15469)))

(declare-fun b!373542 () Bool)

(declare-fun res!210427 () Bool)

(declare-fun e!227726 () Bool)

(assert (=> b!373542 (=> (not res!210427) (not e!227726))))

(declare-datatypes ((array!21691 0))(
  ( (array!21692 (arr!10314 (Array (_ BitVec 32) (_ BitVec 64))) (size!10666 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21691)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21691 (_ BitVec 32)) Bool)

(assert (=> b!373542 (= res!210427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14877 () Bool)

(declare-fun mapRes!14877 () Bool)

(declare-fun tp!29397 () Bool)

(declare-fun e!227719 () Bool)

(assert (=> mapNonEmpty!14877 (= mapRes!14877 (and tp!29397 e!227719))))

(declare-datatypes ((V!12939 0))(
  ( (V!12940 (val!4482 Int)) )
))
(declare-datatypes ((ValueCell!4094 0))(
  ( (ValueCellFull!4094 (v!6679 V!12939)) (EmptyCell!4094) )
))
(declare-datatypes ((array!21693 0))(
  ( (array!21694 (arr!10315 (Array (_ BitVec 32) ValueCell!4094)) (size!10667 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21693)

(declare-fun mapKey!14877 () (_ BitVec 32))

(declare-fun mapValue!14877 () ValueCell!4094)

(declare-fun mapRest!14877 () (Array (_ BitVec 32) ValueCell!4094))

(assert (=> mapNonEmpty!14877 (= (arr!10315 _values!506) (store mapRest!14877 mapKey!14877 mapValue!14877))))

(declare-fun b!373543 () Bool)

(declare-fun res!210434 () Bool)

(assert (=> b!373543 (=> (not res!210434) (not e!227726))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373543 (= res!210434 (and (= (size!10667 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10666 _keys!658) (size!10667 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373544 () Bool)

(declare-fun res!210436 () Bool)

(declare-fun e!227724 () Bool)

(assert (=> b!373544 (=> (not res!210436) (not e!227724))))

(declare-fun lt!171593 () array!21691)

(declare-datatypes ((List!5797 0))(
  ( (Nil!5794) (Cons!5793 (h!6649 (_ BitVec 64)) (t!10947 List!5797)) )
))
(declare-fun arrayNoDuplicates!0 (array!21691 (_ BitVec 32) List!5797) Bool)

(assert (=> b!373544 (= res!210436 (arrayNoDuplicates!0 lt!171593 #b00000000000000000000000000000000 Nil!5794))))

(declare-fun res!210426 () Bool)

(assert (=> start!37100 (=> (not res!210426) (not e!227726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37100 (= res!210426 (validMask!0 mask!970))))

(assert (=> start!37100 e!227726))

(declare-fun e!227721 () Bool)

(declare-fun array_inv!7602 (array!21693) Bool)

(assert (=> start!37100 (and (array_inv!7602 _values!506) e!227721)))

(assert (=> start!37100 tp!29396))

(assert (=> start!37100 true))

(declare-fun tp_is_empty!8875 () Bool)

(assert (=> start!37100 tp_is_empty!8875))

(declare-fun array_inv!7603 (array!21691) Bool)

(assert (=> start!37100 (array_inv!7603 _keys!658)))

(declare-fun b!373545 () Bool)

(assert (=> b!373545 (= e!227726 e!227724)))

(declare-fun res!210429 () Bool)

(assert (=> b!373545 (=> (not res!210429) (not e!227724))))

(assert (=> b!373545 (= res!210429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171593 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373545 (= lt!171593 (array!21692 (store (arr!10314 _keys!658) i!548 k!778) (size!10666 _keys!658)))))

(declare-fun b!373546 () Bool)

(declare-fun e!227723 () Bool)

(assert (=> b!373546 (= e!227724 (not e!227723))))

(declare-fun res!210435 () Bool)

(assert (=> b!373546 (=> res!210435 e!227723)))

(assert (=> b!373546 (= res!210435 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12939)

(declare-datatypes ((tuple2!5952 0))(
  ( (tuple2!5953 (_1!2987 (_ BitVec 64)) (_2!2987 V!12939)) )
))
(declare-datatypes ((List!5798 0))(
  ( (Nil!5795) (Cons!5794 (h!6650 tuple2!5952) (t!10948 List!5798)) )
))
(declare-datatypes ((ListLongMap!4865 0))(
  ( (ListLongMap!4866 (toList!2448 List!5798)) )
))
(declare-fun lt!171599 () ListLongMap!4865)

(declare-fun minValue!472 () V!12939)

(declare-fun getCurrentListMap!1889 (array!21691 array!21693 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) Int) ListLongMap!4865)

(assert (=> b!373546 (= lt!171599 (getCurrentListMap!1889 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171601 () array!21693)

(declare-fun lt!171600 () ListLongMap!4865)

(assert (=> b!373546 (= lt!171600 (getCurrentListMap!1889 lt!171593 lt!171601 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171602 () ListLongMap!4865)

(declare-fun lt!171609 () ListLongMap!4865)

(assert (=> b!373546 (and (= lt!171602 lt!171609) (= lt!171609 lt!171602))))

(declare-fun lt!171607 () ListLongMap!4865)

(declare-fun lt!171594 () tuple2!5952)

(declare-fun +!794 (ListLongMap!4865 tuple2!5952) ListLongMap!4865)

(assert (=> b!373546 (= lt!171609 (+!794 lt!171607 lt!171594))))

(declare-fun v!373 () V!12939)

(assert (=> b!373546 (= lt!171594 (tuple2!5953 k!778 v!373))))

(declare-datatypes ((Unit!11494 0))(
  ( (Unit!11495) )
))
(declare-fun lt!171595 () Unit!11494)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!47 (array!21691 array!21693 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) (_ BitVec 64) V!12939 (_ BitVec 32) Int) Unit!11494)

(assert (=> b!373546 (= lt!171595 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!47 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!723 (array!21691 array!21693 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) Int) ListLongMap!4865)

(assert (=> b!373546 (= lt!171602 (getCurrentListMapNoExtraKeys!723 lt!171593 lt!171601 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373546 (= lt!171601 (array!21694 (store (arr!10315 _values!506) i!548 (ValueCellFull!4094 v!373)) (size!10667 _values!506)))))

(assert (=> b!373546 (= lt!171607 (getCurrentListMapNoExtraKeys!723 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373547 () Bool)

(declare-fun res!210431 () Bool)

(assert (=> b!373547 (=> (not res!210431) (not e!227726))))

(assert (=> b!373547 (= res!210431 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10666 _keys!658))))))

(declare-fun b!373548 () Bool)

(declare-fun res!210433 () Bool)

(assert (=> b!373548 (=> (not res!210433) (not e!227726))))

(declare-fun arrayContainsKey!0 (array!21691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373548 (= res!210433 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!373549 () Bool)

(declare-fun e!227725 () Bool)

(assert (=> b!373549 (= e!227721 (and e!227725 mapRes!14877))))

(declare-fun condMapEmpty!14877 () Bool)

(declare-fun mapDefault!14877 () ValueCell!4094)

