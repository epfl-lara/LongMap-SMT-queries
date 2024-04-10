; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36914 () Bool)

(assert start!36914)

(declare-fun b_free!8041 () Bool)

(declare-fun b_next!8041 () Bool)

(assert (=> start!36914 (= b_free!8041 (not b_next!8041))))

(declare-fun tp!28839 () Bool)

(declare-fun b_and!15283 () Bool)

(assert (=> start!36914 (= tp!28839 b_and!15283)))

(declare-fun res!207563 () Bool)

(declare-fun e!225979 () Bool)

(assert (=> start!36914 (=> (not res!207563) (not e!225979))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36914 (= res!207563 (validMask!0 mask!970))))

(assert (=> start!36914 e!225979))

(declare-datatypes ((V!12691 0))(
  ( (V!12692 (val!4389 Int)) )
))
(declare-datatypes ((ValueCell!4001 0))(
  ( (ValueCellFull!4001 (v!6586 V!12691)) (EmptyCell!4001) )
))
(declare-datatypes ((array!21321 0))(
  ( (array!21322 (arr!10129 (Array (_ BitVec 32) ValueCell!4001)) (size!10481 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21321)

(declare-fun e!225983 () Bool)

(declare-fun array_inv!7484 (array!21321) Bool)

(assert (=> start!36914 (and (array_inv!7484 _values!506) e!225983)))

(assert (=> start!36914 tp!28839))

(assert (=> start!36914 true))

(declare-fun tp_is_empty!8689 () Bool)

(assert (=> start!36914 tp_is_empty!8689))

(declare-datatypes ((array!21323 0))(
  ( (array!21324 (arr!10130 (Array (_ BitVec 32) (_ BitVec 64))) (size!10482 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21323)

(declare-fun array_inv!7485 (array!21323) Bool)

(assert (=> start!36914 (array_inv!7485 _keys!658)))

(declare-fun b!369839 () Bool)

(declare-fun res!207565 () Bool)

(assert (=> b!369839 (=> (not res!207565) (not e!225979))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369839 (= res!207565 (and (= (size!10481 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10482 _keys!658) (size!10481 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369840 () Bool)

(declare-fun res!207566 () Bool)

(assert (=> b!369840 (=> (not res!207566) (not e!225979))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369840 (= res!207566 (or (= (select (arr!10130 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10130 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369841 () Bool)

(declare-fun res!207569 () Bool)

(assert (=> b!369841 (=> (not res!207569) (not e!225979))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369841 (= res!207569 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14598 () Bool)

(declare-fun mapRes!14598 () Bool)

(assert (=> mapIsEmpty!14598 mapRes!14598))

(declare-fun b!369842 () Bool)

(declare-fun e!225981 () Bool)

(assert (=> b!369842 (= e!225981 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169829 () array!21323)

(declare-fun zeroValue!472 () V!12691)

(declare-datatypes ((tuple2!5820 0))(
  ( (tuple2!5821 (_1!2921 (_ BitVec 64)) (_2!2921 V!12691)) )
))
(declare-datatypes ((List!5655 0))(
  ( (Nil!5652) (Cons!5651 (h!6507 tuple2!5820) (t!10805 List!5655)) )
))
(declare-datatypes ((ListLongMap!4733 0))(
  ( (ListLongMap!4734 (toList!2382 List!5655)) )
))
(declare-fun lt!169830 () ListLongMap!4733)

(declare-fun v!373 () V!12691)

(declare-fun minValue!472 () V!12691)

(declare-fun getCurrentListMapNoExtraKeys!659 (array!21323 array!21321 (_ BitVec 32) (_ BitVec 32) V!12691 V!12691 (_ BitVec 32) Int) ListLongMap!4733)

(assert (=> b!369842 (= lt!169830 (getCurrentListMapNoExtraKeys!659 lt!169829 (array!21322 (store (arr!10129 _values!506) i!548 (ValueCellFull!4001 v!373)) (size!10481 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169828 () ListLongMap!4733)

(assert (=> b!369842 (= lt!169828 (getCurrentListMapNoExtraKeys!659 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369843 () Bool)

(declare-fun res!207567 () Bool)

(assert (=> b!369843 (=> (not res!207567) (not e!225979))))

(assert (=> b!369843 (= res!207567 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10482 _keys!658))))))

(declare-fun b!369844 () Bool)

(assert (=> b!369844 (= e!225979 e!225981)))

(declare-fun res!207561 () Bool)

(assert (=> b!369844 (=> (not res!207561) (not e!225981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21323 (_ BitVec 32)) Bool)

(assert (=> b!369844 (= res!207561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169829 mask!970))))

(assert (=> b!369844 (= lt!169829 (array!21324 (store (arr!10130 _keys!658) i!548 k!778) (size!10482 _keys!658)))))

(declare-fun b!369845 () Bool)

(declare-fun e!225978 () Bool)

(assert (=> b!369845 (= e!225978 tp_is_empty!8689)))

(declare-fun b!369846 () Bool)

(declare-fun e!225980 () Bool)

(assert (=> b!369846 (= e!225980 tp_is_empty!8689)))

(declare-fun b!369847 () Bool)

(declare-fun res!207562 () Bool)

(assert (=> b!369847 (=> (not res!207562) (not e!225979))))

(declare-datatypes ((List!5656 0))(
  ( (Nil!5653) (Cons!5652 (h!6508 (_ BitVec 64)) (t!10806 List!5656)) )
))
(declare-fun arrayNoDuplicates!0 (array!21323 (_ BitVec 32) List!5656) Bool)

(assert (=> b!369847 (= res!207562 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5653))))

(declare-fun b!369848 () Bool)

(declare-fun res!207568 () Bool)

(assert (=> b!369848 (=> (not res!207568) (not e!225981))))

(assert (=> b!369848 (= res!207568 (arrayNoDuplicates!0 lt!169829 #b00000000000000000000000000000000 Nil!5653))))

(declare-fun mapNonEmpty!14598 () Bool)

(declare-fun tp!28838 () Bool)

(assert (=> mapNonEmpty!14598 (= mapRes!14598 (and tp!28838 e!225978))))

(declare-fun mapKey!14598 () (_ BitVec 32))

(declare-fun mapValue!14598 () ValueCell!4001)

(declare-fun mapRest!14598 () (Array (_ BitVec 32) ValueCell!4001))

(assert (=> mapNonEmpty!14598 (= (arr!10129 _values!506) (store mapRest!14598 mapKey!14598 mapValue!14598))))

(declare-fun b!369849 () Bool)

(assert (=> b!369849 (= e!225983 (and e!225980 mapRes!14598))))

(declare-fun condMapEmpty!14598 () Bool)

(declare-fun mapDefault!14598 () ValueCell!4001)

