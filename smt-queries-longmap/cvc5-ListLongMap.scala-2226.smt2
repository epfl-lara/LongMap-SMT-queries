; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36818 () Bool)

(assert start!36818)

(declare-fun b_free!7945 () Bool)

(declare-fun b_next!7945 () Bool)

(assert (=> start!36818 (= b_free!7945 (not b_next!7945))))

(declare-fun tp!28551 () Bool)

(declare-fun b_and!15187 () Bool)

(assert (=> start!36818 (= tp!28551 b_and!15187)))

(declare-fun mapIsEmpty!14454 () Bool)

(declare-fun mapRes!14454 () Bool)

(assert (=> mapIsEmpty!14454 mapRes!14454))

(declare-fun b!367967 () Bool)

(declare-fun res!206124 () Bool)

(declare-fun e!225116 () Bool)

(assert (=> b!367967 (=> (not res!206124) (not e!225116))))

(declare-datatypes ((array!21143 0))(
  ( (array!21144 (arr!10040 (Array (_ BitVec 32) (_ BitVec 64))) (size!10392 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21143)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367967 (= res!206124 (or (= (select (arr!10040 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10040 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367968 () Bool)

(declare-fun res!206128 () Bool)

(assert (=> b!367968 (=> (not res!206128) (not e!225116))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12563 0))(
  ( (V!12564 (val!4341 Int)) )
))
(declare-datatypes ((ValueCell!3953 0))(
  ( (ValueCellFull!3953 (v!6538 V!12563)) (EmptyCell!3953) )
))
(declare-datatypes ((array!21145 0))(
  ( (array!21146 (arr!10041 (Array (_ BitVec 32) ValueCell!3953)) (size!10393 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21145)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367968 (= res!206128 (and (= (size!10393 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10392 _keys!658) (size!10393 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367969 () Bool)

(declare-fun res!206120 () Bool)

(assert (=> b!367969 (=> (not res!206120) (not e!225116))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367969 (= res!206120 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14454 () Bool)

(declare-fun tp!28550 () Bool)

(declare-fun e!225118 () Bool)

(assert (=> mapNonEmpty!14454 (= mapRes!14454 (and tp!28550 e!225118))))

(declare-fun mapValue!14454 () ValueCell!3953)

(declare-fun mapRest!14454 () (Array (_ BitVec 32) ValueCell!3953))

(declare-fun mapKey!14454 () (_ BitVec 32))

(assert (=> mapNonEmpty!14454 (= (arr!10041 _values!506) (store mapRest!14454 mapKey!14454 mapValue!14454))))

(declare-fun b!367970 () Bool)

(declare-fun res!206126 () Bool)

(assert (=> b!367970 (=> (not res!206126) (not e!225116))))

(assert (=> b!367970 (= res!206126 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10392 _keys!658))))))

(declare-fun b!367971 () Bool)

(declare-fun tp_is_empty!8593 () Bool)

(assert (=> b!367971 (= e!225118 tp_is_empty!8593)))

(declare-fun b!367972 () Bool)

(declare-fun res!206129 () Bool)

(declare-fun e!225114 () Bool)

(assert (=> b!367972 (=> (not res!206129) (not e!225114))))

(declare-fun lt!169458 () array!21143)

(declare-datatypes ((List!5580 0))(
  ( (Nil!5577) (Cons!5576 (h!6432 (_ BitVec 64)) (t!10730 List!5580)) )
))
(declare-fun arrayNoDuplicates!0 (array!21143 (_ BitVec 32) List!5580) Bool)

(assert (=> b!367972 (= res!206129 (arrayNoDuplicates!0 lt!169458 #b00000000000000000000000000000000 Nil!5577))))

(declare-fun b!367974 () Bool)

(assert (=> b!367974 (= e!225114 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12563)

(declare-datatypes ((tuple2!5748 0))(
  ( (tuple2!5749 (_1!2885 (_ BitVec 64)) (_2!2885 V!12563)) )
))
(declare-datatypes ((List!5581 0))(
  ( (Nil!5578) (Cons!5577 (h!6433 tuple2!5748) (t!10731 List!5581)) )
))
(declare-datatypes ((ListLongMap!4661 0))(
  ( (ListLongMap!4662 (toList!2346 List!5581)) )
))
(declare-fun lt!169457 () ListLongMap!4661)

(declare-fun minValue!472 () V!12563)

(declare-fun getCurrentListMapNoExtraKeys!623 (array!21143 array!21145 (_ BitVec 32) (_ BitVec 32) V!12563 V!12563 (_ BitVec 32) Int) ListLongMap!4661)

(assert (=> b!367974 (= lt!169457 (getCurrentListMapNoExtraKeys!623 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!367975 () Bool)

(assert (=> b!367975 (= e!225116 e!225114)))

(declare-fun res!206125 () Bool)

(assert (=> b!367975 (=> (not res!206125) (not e!225114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21143 (_ BitVec 32)) Bool)

(assert (=> b!367975 (= res!206125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169458 mask!970))))

(assert (=> b!367975 (= lt!169458 (array!21144 (store (arr!10040 _keys!658) i!548 k!778) (size!10392 _keys!658)))))

(declare-fun b!367976 () Bool)

(declare-fun e!225117 () Bool)

(declare-fun e!225115 () Bool)

(assert (=> b!367976 (= e!225117 (and e!225115 mapRes!14454))))

(declare-fun condMapEmpty!14454 () Bool)

(declare-fun mapDefault!14454 () ValueCell!3953)

