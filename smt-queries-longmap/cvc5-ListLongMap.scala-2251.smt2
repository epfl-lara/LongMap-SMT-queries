; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36968 () Bool)

(assert start!36968)

(declare-fun b_free!8095 () Bool)

(declare-fun b_next!8095 () Bool)

(assert (=> start!36968 (= b_free!8095 (not b_next!8095))))

(declare-fun tp!29000 () Bool)

(declare-fun b_and!15337 () Bool)

(assert (=> start!36968 (= tp!29000 b_and!15337)))

(declare-fun b!370892 () Bool)

(declare-fun res!208375 () Bool)

(declare-fun e!226465 () Bool)

(assert (=> b!370892 (=> (not res!208375) (not e!226465))))

(declare-datatypes ((array!21429 0))(
  ( (array!21430 (arr!10183 (Array (_ BitVec 32) (_ BitVec 64))) (size!10535 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21429)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370892 (= res!208375 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!370894 () Bool)

(declare-fun e!226464 () Bool)

(declare-fun tp_is_empty!8743 () Bool)

(assert (=> b!370894 (= e!226464 tp_is_empty!8743)))

(declare-fun mapNonEmpty!14679 () Bool)

(declare-fun mapRes!14679 () Bool)

(declare-fun tp!29001 () Bool)

(assert (=> mapNonEmpty!14679 (= mapRes!14679 (and tp!29001 e!226464))))

(declare-datatypes ((V!12763 0))(
  ( (V!12764 (val!4416 Int)) )
))
(declare-datatypes ((ValueCell!4028 0))(
  ( (ValueCellFull!4028 (v!6613 V!12763)) (EmptyCell!4028) )
))
(declare-fun mapRest!14679 () (Array (_ BitVec 32) ValueCell!4028))

(declare-fun mapKey!14679 () (_ BitVec 32))

(declare-fun mapValue!14679 () ValueCell!4028)

(declare-datatypes ((array!21431 0))(
  ( (array!21432 (arr!10184 (Array (_ BitVec 32) ValueCell!4028)) (size!10536 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21431)

(assert (=> mapNonEmpty!14679 (= (arr!10184 _values!506) (store mapRest!14679 mapKey!14679 mapValue!14679))))

(declare-fun b!370895 () Bool)

(declare-fun e!226466 () Bool)

(assert (=> b!370895 (= e!226466 (not true))))

(declare-datatypes ((tuple2!5856 0))(
  ( (tuple2!5857 (_1!2939 (_ BitVec 64)) (_2!2939 V!12763)) )
))
(declare-datatypes ((List!5696 0))(
  ( (Nil!5693) (Cons!5692 (h!6548 tuple2!5856) (t!10846 List!5696)) )
))
(declare-datatypes ((ListLongMap!4769 0))(
  ( (ListLongMap!4770 (toList!2400 List!5696)) )
))
(declare-fun lt!170075 () ListLongMap!4769)

(declare-fun lt!170079 () ListLongMap!4769)

(assert (=> b!370895 (and (= lt!170075 lt!170079) (= lt!170079 lt!170075))))

(declare-fun v!373 () V!12763)

(declare-fun lt!170077 () ListLongMap!4769)

(declare-fun +!746 (ListLongMap!4769 tuple2!5856) ListLongMap!4769)

(assert (=> b!370895 (= lt!170079 (+!746 lt!170077 (tuple2!5857 k!778 v!373)))))

(declare-datatypes ((Unit!11398 0))(
  ( (Unit!11399) )
))
(declare-fun lt!170078 () Unit!11398)

(declare-fun zeroValue!472 () V!12763)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12763)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!1 (array!21429 array!21431 (_ BitVec 32) (_ BitVec 32) V!12763 V!12763 (_ BitVec 32) (_ BitVec 64) V!12763 (_ BitVec 32) Int) Unit!11398)

(assert (=> b!370895 (= lt!170078 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!1 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170076 () array!21429)

(declare-fun getCurrentListMapNoExtraKeys!677 (array!21429 array!21431 (_ BitVec 32) (_ BitVec 32) V!12763 V!12763 (_ BitVec 32) Int) ListLongMap!4769)

(assert (=> b!370895 (= lt!170075 (getCurrentListMapNoExtraKeys!677 lt!170076 (array!21432 (store (arr!10184 _values!506) i!548 (ValueCellFull!4028 v!373)) (size!10536 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!370895 (= lt!170077 (getCurrentListMapNoExtraKeys!677 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14679 () Bool)

(assert (=> mapIsEmpty!14679 mapRes!14679))

(declare-fun b!370896 () Bool)

(declare-fun res!208376 () Bool)

(assert (=> b!370896 (=> (not res!208376) (not e!226465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370896 (= res!208376 (validKeyInArray!0 k!778))))

(declare-fun b!370897 () Bool)

(declare-fun res!208378 () Bool)

(assert (=> b!370897 (=> (not res!208378) (not e!226465))))

(assert (=> b!370897 (= res!208378 (and (= (size!10536 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10535 _keys!658) (size!10536 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370898 () Bool)

(declare-fun res!208372 () Bool)

(assert (=> b!370898 (=> (not res!208372) (not e!226465))))

(assert (=> b!370898 (= res!208372 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10535 _keys!658))))))

(declare-fun b!370893 () Bool)

(declare-fun res!208373 () Bool)

(assert (=> b!370893 (=> (not res!208373) (not e!226465))))

(assert (=> b!370893 (= res!208373 (or (= (select (arr!10183 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10183 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!208374 () Bool)

(assert (=> start!36968 (=> (not res!208374) (not e!226465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36968 (= res!208374 (validMask!0 mask!970))))

(assert (=> start!36968 e!226465))

(declare-fun e!226468 () Bool)

(declare-fun array_inv!7520 (array!21431) Bool)

(assert (=> start!36968 (and (array_inv!7520 _values!506) e!226468)))

(assert (=> start!36968 tp!29000))

(assert (=> start!36968 true))

(assert (=> start!36968 tp_is_empty!8743))

(declare-fun array_inv!7521 (array!21429) Bool)

(assert (=> start!36968 (array_inv!7521 _keys!658)))

(declare-fun b!370899 () Bool)

(declare-fun e!226467 () Bool)

(assert (=> b!370899 (= e!226467 tp_is_empty!8743)))

(declare-fun b!370900 () Bool)

(declare-fun res!208377 () Bool)

(assert (=> b!370900 (=> (not res!208377) (not e!226466))))

(declare-datatypes ((List!5697 0))(
  ( (Nil!5694) (Cons!5693 (h!6549 (_ BitVec 64)) (t!10847 List!5697)) )
))
(declare-fun arrayNoDuplicates!0 (array!21429 (_ BitVec 32) List!5697) Bool)

(assert (=> b!370900 (= res!208377 (arrayNoDuplicates!0 lt!170076 #b00000000000000000000000000000000 Nil!5694))))

(declare-fun b!370901 () Bool)

(declare-fun res!208371 () Bool)

(assert (=> b!370901 (=> (not res!208371) (not e!226465))))

(assert (=> b!370901 (= res!208371 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5694))))

(declare-fun b!370902 () Bool)

(assert (=> b!370902 (= e!226465 e!226466)))

(declare-fun res!208379 () Bool)

(assert (=> b!370902 (=> (not res!208379) (not e!226466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21429 (_ BitVec 32)) Bool)

(assert (=> b!370902 (= res!208379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170076 mask!970))))

(assert (=> b!370902 (= lt!170076 (array!21430 (store (arr!10183 _keys!658) i!548 k!778) (size!10535 _keys!658)))))

(declare-fun b!370903 () Bool)

(declare-fun res!208370 () Bool)

(assert (=> b!370903 (=> (not res!208370) (not e!226465))))

(assert (=> b!370903 (= res!208370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370904 () Bool)

(assert (=> b!370904 (= e!226468 (and e!226467 mapRes!14679))))

(declare-fun condMapEmpty!14679 () Bool)

(declare-fun mapDefault!14679 () ValueCell!4028)

